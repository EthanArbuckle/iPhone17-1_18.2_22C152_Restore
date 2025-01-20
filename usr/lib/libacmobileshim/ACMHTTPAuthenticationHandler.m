@interface ACMHTTPAuthenticationHandler
- (ACMHTTPAuthenticationHandler)initWithContext:(id)a3;
- (BOOL)shouldReturnResponse:(id)a3 orReportError:(id *)a4;
- (BOOL)shouldValidateTGTs;
- (NSString)policyVersion;
- (NSString)realm;
- (id)requestBody;
@end

@implementation ACMHTTPAuthenticationHandler

- (ACMHTTPAuthenticationHandler)initWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ACMHTTPAuthenticationHandler;
  v3 = [(ACCHTTPHandler *)&v6 initWithContext:a3];
  v4 = v3;
  if (v3) {
    [-[ACCHTTPHandler transport](v3, "transport") setRequestURLTemplate:[-[ACMHTTPHandler environmentPreferences](v3, "environmentPreferences") authenticateURLString]];
  }
  return v4;
}

- (NSString)policyVersion
{
  return (NSString *)@"1.0";
}

- (id)requestBody
{
  id result = (id)objc_opt_new();
  if (result)
  {
    id v4 = result;
    if ([(ACCAuthContextProtocol *)[(ACCHTTPHandler *)self context] appID])
    {
      [v4 setObject:[[-[ACCAuthContextProtocol appID](-[ACCHTTPHandler context](self, "context")) stringByAppendingString:@"m"] forKey:@"m"];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPAuthenticationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 52, 0, "App ID is not set");
    }
    uint64_t v5 = [[(id)objc_msgSend(MEMORY[0x263EFF960], "currentLocale") localeIdentifier];
    if (v5)
    {
      [v4 setObject:v5 forKey:@"u"];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACMHTTPAuthenticationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 63, 0, "Unable to set localeIdentifier");
    }
    uint64_t v6 = [[+[ACCComponents components](ACCComponents, "components") ticketManager] envelopeWithContext:-[ACCHTTPHandler context](self, "context")];
    if (v6)
    {
      [v4 setObject:v6 forKey:@"za"];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPAuthenticationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 74, 0, "Token envelope is not set");
    }
    if ([(ACMHTTPAuthenticationHandler *)self policyVersion])
    {
      [v4 setObject:[-[ACMHTTPAuthenticationHandler policyVersion](self, "policyVersion")] forKey:@"pv"];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPAuthenticationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 83, 0, "Policy version is not set");
    }
    if ([(ACCAuthContextProtocol *)[(ACCHTTPHandler *)self context] dsKeyVersion])
    {
      [v4 setObject:-[ACCAuthContextProtocol dsKeyVersion](-[ACCHTTPHandler context](self, "context"), "dsKeyVersion") forKey:@"t"];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPAuthenticationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 92, 0, "DS Key version is not set");
    }
    v7 = (void *)[v4 copy];
    return v7;
  }
  return result;
}

- (BOOL)shouldValidateTGTs
{
  return 1;
}

- (BOOL)shouldReturnResponse:(id)a3 orReportError:(id *)a4
{
  if (!a4) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACMHTTPAuthenticationHandler.m" lineNumber:108 description:@"the error should not be nil!"];
  }
  v13.receiver = self;
  v13.super_class = (Class)ACMHTTPAuthenticationHandler;
  unsigned int v7 = [(ACCHTTPHandler *)&v13 shouldReturnResponse:a3 orReportError:a4];
  BOOL v8 = v7;
  if (a3)
  {
    if (v7)
    {
      if (!*a4)
      {
        if ([(ACMHTTPAuthenticationHandler *)self shouldValidateTGTs])
        {
          if (![a3 objectForKey:@"pt"])
          {
            v9 = (void *)MEMORY[0x263F087E8];
            v10 = NSDictionary;
            id v11 = +[ACMBaseLocale localizedString:@"Response from server is malformed"];
            *a4 = (id)[v9 errorWithDomain:@"HTTPServerErrorDomain" code:-100360 userInfo:[v10 dictionaryWithObjectsAndKeys:v11, *MEMORY[0x263F08338], 0]];
            if (ACFLog)
            {
              if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
                ACFLog(3, (uint64_t)"-[ACMHTTPAuthenticationHandler shouldReturnResponse:orReportError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPAuthenticationHandler.m", 116, 0, "Response from server does not have TGT: %@", a3);
              }
            }
          }
        }
      }
    }
  }
  return v8;
}

- (NSString)realm
{
  return self->_realm;
}

@end