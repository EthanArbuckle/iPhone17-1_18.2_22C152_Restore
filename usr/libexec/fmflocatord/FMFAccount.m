@interface FMFAccount
- (NSDate)lastMessageDisplayedTimestamp;
- (NSDictionary)additionalInfo;
- (NSString)appAuthToken;
- (NSString)appServerHost;
- (NSString)dsid;
- (NSString)internalAuthToken;
- (id)authTokenType;
- (id)description;
- (int64_t)appAuthTokenStatus;
- (int64_t)internalAuthTokenStatus;
- (void)applyPropertiesFromACAccount:(id)a3 includingTokens:(BOOL)a4;
- (void)copyInfoFromAccount:(id)a3;
- (void)setAdditionalInfo:(id)a3;
- (void)setAppAuthToken:(id)a3;
- (void)setAppAuthTokenStatus:(int64_t)a3;
- (void)setAppServerHost:(id)a3;
- (void)setDsid:(id)a3;
- (void)setInternalAuthToken:(id)a3;
- (void)setInternalAuthTokenStatus:(int64_t)a3;
- (void)setLastMessageDisplayedTimestamp:(id)a3;
@end

@implementation FMFAccount

- (id)authTokenType
{
  return @"fmf-internal";
}

- (void)copyInfoFromAccount:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMFAccount;
  [(FindBaseAccount *)&v13 copyInfoFromAccount:v4];
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [v5 dsid];
    [(FMFAccount *)self setDsid:v6];

    v7 = [v5 appServerHost];
    [(FMFAccount *)self setAppServerHost:v7];

    v8 = [v5 appAuthToken];
    [(FMFAccount *)self setAppAuthToken:v8];

    v9 = [v5 internalAuthToken];

    if (v9)
    {
      v10 = [v5 internalAuthToken];
      [(FMFAccount *)self setInternalAuthToken:v10];
    }
    v11 = [v5 additionalInfo];
    [(FMFAccount *)self setAdditionalInfo:v11];

    -[FMFAccount setAppAuthTokenStatus:](self, "setAppAuthTokenStatus:", [v5 appAuthTokenStatus]);
    -[FMFAccount setInternalAuthTokenStatus:](self, "setInternalAuthTokenStatus:", [v5 internalAuthTokenStatus]);
    v12 = [v5 lastMessageDisplayedTimestamp];
    [(FMFAccount *)self setLastMessageDisplayedTimestamp:v12];
  }
}

- (id)description
{
  v17 = [(FMFAccount *)self dsid];
  v16 = [(FindBaseAccount *)self username];
  v18 = [(FMFAccount *)self appAuthToken];
  if (v18) {
    CFStringRef v3 = @"(not-nil)";
  }
  else {
    CFStringRef v3 = @"(nil)";
  }
  CFStringRef v15 = v3;
  int64_t v4 = [(FMFAccount *)self appAuthTokenStatus];
  id v5 = [(FMFAccount *)self internalAuthToken];
  if (v5) {
    CFStringRef v6 = @"(not-nil)";
  }
  else {
    CFStringRef v6 = @"(nil)";
  }
  int64_t v7 = [(FMFAccount *)self internalAuthTokenStatus];
  v8 = [(FindBaseAccount *)self serverHost];
  v9 = [(FMFAccount *)self appServerHost];
  v10 = [(FindBaseAccount *)self serverProtocolScheme];
  v11 = [(FindBaseAccount *)self apsEnvironment];
  v12 = [(FMFAccount *)self additionalInfo];
  objc_super v13 = +[NSString stringWithFormat:@"FMFAccount(0x%lx) %@,%@,%@,%ld,%@,%ld,%@,%@,%@,%@,%@", self, v17, v16, v15, v4, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDsid:(id)a3
{
}

- (NSString)appServerHost
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAppServerHost:(id)a3
{
}

- (NSString)appAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAppAuthToken:(id)a3
{
}

- (NSString)internalAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInternalAuthToken:(id)a3
{
}

- (NSDictionary)additionalInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAdditionalInfo:(id)a3
{
}

- (NSDate)lastMessageDisplayedTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastMessageDisplayedTimestamp:(id)a3
{
}

- (int64_t)appAuthTokenStatus
{
  return self->_appAuthTokenStatus;
}

- (void)setAppAuthTokenStatus:(int64_t)a3
{
  self->_appAuthTokenStatus = a3;
}

- (int64_t)internalAuthTokenStatus
{
  return self->_internalAuthTokenStatus;
}

- (void)setInternalAuthTokenStatus:(int64_t)a3
{
  self->_internalAuthTokenStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMessageDisplayedTimestamp, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_internalAuthToken, 0);
  objc_storeStrong((id *)&self->_appAuthToken, 0);
  objc_storeStrong((id *)&self->_appServerHost, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

- (void)applyPropertiesFromACAccount:(id)a3 includingTokens:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = [a3 fmfAccountInfoWithTokens:a4];
  CFStringRef v6 = [v14 objectForKeyedSubscript:@"username"];
  [(FindBaseAccount *)self setUsername:v6];

  int64_t v7 = [v14 objectForKeyedSubscript:@"dsid"];
  [(FMFAccount *)self setDsid:v7];

  if (v4)
  {
    v8 = [v14 objectForKeyedSubscript:@"appToken"];
    [(FMFAccount *)self setAppAuthToken:v8];

    v9 = [v14 objectForKeyedSubscript:@"internalToken"];
    [(FMFAccount *)self setInternalAuthToken:v9];
  }
  v10 = [v14 objectForKeyedSubscript:@"appHostname"];
  [(FMFAccount *)self setAppServerHost:v10];

  v11 = [v14 objectForKeyedSubscript:@"hostname"];
  [(FindBaseAccount *)self setServerHost:v11];

  v12 = [v14 objectForKeyedSubscript:@"scheme"];
  [(FindBaseAccount *)self setServerProtocolScheme:v12];

  objc_super v13 = [v14 objectForKeyedSubscript:@"apsEnv"];
  [(FindBaseAccount *)self setApsEnvironment:v13];
}

@end