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

        doLog = function(self, strLogLevel, str, ...)
            print(string.format("[%s] %s.%s: %s", os.date("%Y/%m/%d %H:%M:%S"), self:getRealm(), strLogLevel, string.format(str, unpack({...}))))
        end;
    };

    public {
        __construct = function(self, strRealm)
            self.m_strRealm = strRealm
        end;

        getRealm = function(self)
            return self.m_strRealm
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
            self:doLog("WARNING", str, ...)
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
