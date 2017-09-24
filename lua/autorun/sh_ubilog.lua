ubilog = ubilog or {}

local tblLogLevels = {
    DEBUG = 1,
    INFO = 2,
    NOTICE = 3,
    WARNING = 4,
    ERROR = 5,
    CRITICAL = 6,
    ALERT = 7,
    EMERGENCY = 8,
}

local iCurrentLogLevel = tblLogLevels[1]

local function doLog(strLogLevel, str)
    print(string.format("[%s] %s: %s", os.date("%Y/%m/%d %H:%M:%S"), strLogLevel, str))
end

local function register(strName)
    tblLogLevels[string.upper(strName)] = table.Count(tblLogLevels) + 1

    ubilog[string.lower(strName)] = function(str, ...)
        local strBuiltString = string.format(str, unpack({...}))

        doLog(string.upper(strName), strBuiltString)
    end
end

ubilog.getLevel = function()
    return iCurrentLogLevel
end

ubilog.setLevel = function(iLogLevel)
    iCurrentLogLevel = iLogLevel
    ubilog.debug("Setting logging level to %s", iLogLevel)

    return ubilog
end

for k,v in pairs({"debug", "info", "notice", "warning", "error", "critical", "alert", "emergency"}) do
    register(v)
end
