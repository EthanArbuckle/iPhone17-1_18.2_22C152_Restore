@interface ACM2SVHTTPSendSecurityCodeHandler
- (ACM2SVHTTPSendSecurityCodeHandler)initWithContext:(id)a3;
- (id)convertErrorToACMError:(id)a3;
@end

@implementation ACM2SVHTTPSendSecurityCodeHandler

- (ACM2SVHTTPSendSecurityCodeHandler)initWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ACM2SVHTTPSendSecurityCodeHandler;
  v4 = -[ACMHTTPAuthenticationHandler initWithContext:](&v6, sel_initWithContext_);
  if (v4) {
    -[[ACCHTTPHandler transport](v4, "transport") setRequestURLTemplate:[objc_msgSend((id)objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "preferences"), "environmentPreferencesWithRealm:", objc_msgSend((id)objc_msgSend(a3, "principal"), "realm")), "generateAndSendSecCodeURLString")];
  }
  return v4;
}

- (id)convertErrorToACMError:(id)a3
{
  if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACM2SVHTTPSendSecurityCodeHandler convertErrorToACMError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVHTTPSendSecurityCodeHandler.m", 32, 0, "Convert error %@ to user-friedly error.", a3);
    }
  }
  v5 = (void *)[a3 domain];
  if ([v5 isEqualToString:@"ACCAppleConnectErrorDomain"]) {
    return a3;
  }
  uint64_t v7 = -200240;
  uint64_t v8 = [a3 localizedFailureReason];
  id v9 = (id)[a3 localizedDescription];
  if ([v5 isEqualToString:@"HTTPServerErrorDomain"])
  {
    if ([a3 code] == -21666)
    {
      id v9 = +[ACMBaseLocale localizedString:@"You have sent too many codes to verify your phone number. Please try again later."];
      goto LABEL_13;
    }
    v12.receiver = self;
    v10 = &v12;
  }
  else
  {
    v11 = self;
    v10 = (objc_super *)&v11;
  }
  v10->super_class = (Class)ACM2SVHTTPSendSecurityCodeHandler;
  id result = [(objc_super *)v10 convertErrorToACMError:a3];
  if (result) {
    return result;
  }
  uint64_t v7 = -200200;
LABEL_13:
  id result = [(id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"ACCAppleConnectErrorDomain", v7, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x263F08608], v9, *MEMORY[0x263F08320], v8, *MEMORY[0x263F08338], 0, v11));
  if (!result) {
    return a3;
  }
  return result;
}

@end