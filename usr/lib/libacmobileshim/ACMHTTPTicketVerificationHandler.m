@interface ACMHTTPTicketVerificationHandler
+ (id)handlerName;
- (ACMHTTPTicketVerificationHandler)initWithContext:(id)a3;
- (id)requestBody;
@end

@implementation ACMHTTPTicketVerificationHandler

+ (id)handlerName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (ACMHTTPTicketVerificationHandler)initWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ACMHTTPTicketVerificationHandler;
  v3 = [(ACCHTTPHandler *)&v6 initWithContext:a3];
  v4 = v3;
  if (v3) {
    [-[ACCHTTPHandler transport](v3, "transport") setRequestURLTemplate:[-[ACMHTTPHandler environmentPreferences](v3, "environmentPreferences") verifyTicketURLString]];
  }
  return v4;
}

- (id)requestBody
{
  id v3 = (id)objc_opt_new();
  if (v3)
  {
    if ([(ACCAuthContextProtocol *)[(ACCHTTPHandler *)self context] appID])
    {
      [v3 setObject:-[ACCAuthContextProtocol appID](-[ACCHTTPHandler context](self, "context"), "appID") forKeyedSubscript:@"m"];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 52, 0, "App ID is not set");
    }
    if ([(ACCAuthContextProtocol *)[(ACCHTTPHandler *)self context] appIDKey])
    {
      [v3 setObject:-[ACCAuthContextProtocol appIDKey](-[ACCHTTPHandler context](self, "context"), "appIDKey") forKeyedSubscript:@"n"];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 61, 0, "App ID Key is not set");
    }
    if (objc_msgSend((id)-[ACCAuthContextProtocol request](-[ACCHTTPHandler context](self, "context"), "request"), "token"))
    {
      [v3 setObject:[-[ACCAuthContextProtocol request](-[ACCHTTPHandler context](self, "context"), "request"), "token"] forKeyedSubscript:@"st"];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 70, 0, "Token is not set");
    }
    uint64_t v4 = [[(id)objc_msgSend(MEMORY[0x263EFF960], "currentLocale") localeIdentifier];
    if (v4)
    {
      [v3 setObject:v4 forKeyedSubscript:@"u"];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 81, 0, "localeIdentifier is not set");
    }
    if (objc_msgSend((id)-[ACCAuthContextProtocol request](-[ACCHTTPHandler context](self, "context"), "request"), "userName"))
    {
      [v3 setObject:[-[ACCAuthContextProtocol request](-[ACCHTTPHandler context](self, "context"), "request") userName] forKeyedSubscript:@"b"];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 90, 0, "userName is not set");
    }
    id v3 = (id)[v3 copy];
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMHTTPTicketVerificationHandler requestBody]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTicketVerificationHandler.m", 96, 0, "Service ticket size: %d", [objc_msgSend((id)objc_msgSend((id)-[ACCAuthContextProtocol request](-[ACCHTTPHandler context](self, "context"), "request"), "token"), "length"]);
  }
  return v3;
}

@end