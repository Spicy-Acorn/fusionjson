-- ============================================================================
-- modules
-- ============================================================================
local json = self and require("dkjson") or nil

-- module table
jsonutils = {}

-- private
function jsonutils._read_file(path)
    --[[
        Reads the content of a file.

        :param path: Path of a file to read.
        :type path: string

        :rtype: string
    ]]
    local fp = io.open(path, "r")
    if fp == nil then
        error(string.format("file does not exist: %s", path))
    end

    local content = fp:read("*all")
    fp:close()
    return content
end

function jsonutils._decode(json_string)
    --[[
        Decodes a json string into a json table.

        :param json_string: JSON string to decode.
        :type json_string: string

        :rtype: table
    ]]
    local json_table = json.decode(json_string)
    return json_string
end

-- public
function jsonutils.is_json_string_valid(json_string)
    --[[
        Returns whether a json string is valid or not.

        :param json_string: JSON string to verify.
        :type json_string: string

        :rtype: bool
    ]]
    local json_table = jsonutils._decode(json_string)
    local is_valid = not not json_table
    return is_valid
end

function jsonutils.validate_json_string(json_string)
    --[[
        Raises an error if a json string is invalid.

        :param json_string: JSON string to validate.
        :type json_string: string
    ]]
    local is_valid = jsonutils.is_json_string_valid(json_string)
    if not is_valid then
        error(string.format("invalid json string: %s", json_string))
    end
end

function jsonutils.read_json_string(path)
    --[[
        Reads a json string from a file.

        :param path: Path of the json file to read.
        :type path: string

        :rtype: string
    ]]
    local json_string = jsonutils._read_file(path)
    jsonutils.validate_json_string(json_string)
    return json_string
end

-- return module table
return jsonutils
