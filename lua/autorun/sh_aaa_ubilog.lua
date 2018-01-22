class "ubilog" {
    const {
        DEBUG = 1;
        INFO = 2;
        NOTICE = 3;
        WARNING = 4;
        ERROR = 5;
        CRITICAL = 6;
        ALERT = 7;
        EMERGENCY = 8;
    };

    private {
        m_strRealm = "";
        m_strPrefix = "";

        doLog = function(self, strLogLevel, objColor, str, ...)
            MsgC(objColor, string.format("[%s] %s.%s: %s%s\n", os.date("%Y/%m/%d %H:%M:%S"), self:getRealm(), strLogLevel, #self:getPrefix() > 0 and self:getPrefix()..": " or "", string.format(str, unpack({...}))))
        end;
    };

    public {
        __construct = function(self, strRealm)
            self.m_strRealm = strRealm
        end;

        getRealm = function(self)
            return self.m_strRealm
        end;

        setPrefix = function(self, str)
            self.m_strPrefix = str
            return self
        end;

        getPrefix = function(self)
            return self.m_strPrefix
        end;

        debug = function(self, str, ...)
            self:doLog("DEBUG", Color(0, 255, 255), str, ...)
        end;

        info = function(self, str, ...)
            self:doLog("INFO", Color(125, 125, 255), str, ...)
        end;

        notice = function(self, str, ...)
            self:doLog("NOTICE", Color(255, 255, 0), str, ...)
        end;

        warning = function(self, str, ...)
            self:warn(str, ...)
        end;

        warn = function(self, str, ...)
            self:doLog("WARN", Color(255, 125, 0), str, ...)
        end;

        error = function(self, str, ...)
            self:doLog("ERROR", Color(75, 0, 0), str, ...)
        end;

        critical = function(self, str, ...)
            self:doLog("CRITICAL", Color(125, 0, 0), str, ...)
        end;

        alert = function(self, str, ...)
            self:doLog("ALERT", Color(175, 0, 0), str, ...)
        end;

        emergency = function(self, str, ...)
            self:doLog("EMERGENCY", Color(255, 0, 0), str, ...)
        end;
    };
}
