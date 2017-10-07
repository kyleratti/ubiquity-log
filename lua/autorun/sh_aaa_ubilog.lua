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

        doLog = function(self, strLogLevel, str, ...)
            print(string.format("[%s] %s.%s: %s%s", os.date("%Y/%m/%d %H:%M:%S"), self:getRealm(), strLogLevel, #self:getPrefix() > 0 and self:getPrefix()..": " or "", string.format(str, unpack({...}))))
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
            self:doLog("DEBUG", str, ...)
        end;

        info = function(self, str, ...)
            self:doLog("INFO", str, ...)
        end;

        notice = function(self, str, ...)
            self:doLog("NOTICE", str, ...)
        end;

        warning = function(self, str, ...)
            self:warn(str, ...)
        end;

        warn = function(self, str, ...)
            self:doLog("WARN", str, ...)
        end;

        error = function(self, str, ...)
            self:doLog("ERROR", str, ...)
        end;

        critical = function(self, str, ...)
            self:doLog("CRITICAL", str, ...)
        end;

        alert = function(self, str, ...)
            self:doLog("ALERT", str, ...)
        end;

        emergency = function(self, str, ...)
            self:doLog("EMERGENCY", str, ...)
        end;
    };
}
