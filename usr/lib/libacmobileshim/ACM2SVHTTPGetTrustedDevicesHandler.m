@interface ACM2SVHTTPGetTrustedDevicesHandler
- (ACM2SVHTTPGetTrustedDevicesHandler)initWithContext:(id)a3;
- (id)convertErrorToACMError:(id)a3;
@end

@implementation ACM2SVHTTPGetTrustedDevicesHandler

- (ACM2SVHTTPGetTrustedDevicesHandler)initWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ACM2SVHTTPGetTrustedDevicesHandler;
  v4 = -[ACMHTTPAuthenticationHandler initWithContext:](&v6, sel_initWithContext_);
  if (v4) {
    -[[ACCHTTPHandler transport](v4, "transport") setRequestURLTemplate:[objc_msgSend((id)objc_msgSend((id)objc_msgSend(+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components"), "preferences"), "environmentPreferencesWithRealm:", objc_msgSend((id)objc_msgSend(a3, "principal"), "realm")), "getTrustedDevicesURLString")];
  }
  return v4;
}

- (id)convertErrorToACMError:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACM2SVHTTPGetTrustedDevicesHandler convertErrorToACMError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVHTTPGetTrustedDevicesHandler.m", 33, 0, "Convert error %@ to user-friedly error.", a3);
  }
  v5 = (void *)[a3 domain];
  if ([v5 isEqualToString:@"ACCAppleConnectErrorDomain"]) {
    return a3;
  }
  uint64_t v7 = [a3 localizedFailureReason];
  id v8 = (id)[a3 localizedDescription];
  if (![v5 isEqualToString:@"HTTPServerErrorDomain"])
  {
    v11 = self;
    v10 = (objc_super *)&v11;
    goto LABEL_12;
  }
  uint64_t v9 = [a3 code];
  if (v9 != -20100 && v9 != -20600)
  {
    v12.receiver = self;
    v10 = &v12;
LABEL_12:
    v10->super_class = (Class)ACM2SVHTTPGetTrustedDevicesHandler;
    id result = [(objc_super *)v10 convertErrorToACMError:a3];
    if (result) {
      return result;
    }
    goto LABEL_13;
  }
  id v8 = +[ACMBaseLocale localizedString:@"Oops, an error occurred. Thanks for your patience, please try again later."];
LABEL_13:
  id result = [(id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"ACCAppleConnectErrorDomain", -200200, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x263F08608], v8, *MEMORY[0x263F08320], v7, *MEMORY[0x263F08338], 0, v11));
  if (!result) {
    return a3;
  }
  return result;
}

@end