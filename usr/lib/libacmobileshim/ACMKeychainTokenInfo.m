@interface ACMKeychainTokenInfo
+ (id)classCode;
+ (id)keychainTokenInfoWithPrincipal:(id)a3;
+ (id)keychainTokenInfoWithPrincipal:(id)a3 indicator:(id)a4;
- (ACFPrincipal)principal;
- (ACMKeychainTokenInfo)init;
- (void)setPrincipal:(id)a3;
@end

@implementation ACMKeychainTokenInfo

- (ACMKeychainTokenInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)ACMKeychainTokenInfo;
  v2 = [(ACFKeychainItemInfo *)&v4 init];
  if (v2) {
    [(ACFKeychainItemInfo *)v2 setClassCode:+[ACMKeychainTokenInfo classCode]];
  }
  return v2;
}

+ (id)classCode
{
  return (id)*MEMORY[0x263F171C8];
}

+ (id)keychainTokenInfoWithPrincipal:(id)a3
{
  objc_super v4 = (void *)[a1 keychainItemInfo];
  if (objc_msgSend((id)objc_msgSend(a3, "realm"), "length"))
  {
    [v4 setService:[a3 realm]];
    if (objc_msgSend((id)objc_msgSend(a3, "userName"), "length"))
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
        ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 48, 0, "Creating info with principal %@", a3);
      }
      [v4 setAccount:[a3 principalString]];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    {
      ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 53, 0, "Creating info with %@ realm and any user", [a3 realm]);
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 58, 0, "Creating info for any user and realm");
  }
  return v4;
}

+ (id)keychainTokenInfoWithPrincipal:(id)a3 indicator:(id)a4
{
  v6 = (void *)[a1 keychainItemInfo];
  v7 = v6;
  if (a4) {
    [v6 setService:a4];
  }
  if (objc_msgSend((id)objc_msgSend(a3, "realm"), "length"))
  {
    if (objc_msgSend((id)objc_msgSend(a3, "userName"), "length"))
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
        ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:indicator:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 77, 0, "Creating info with principal %@", a3);
      }
      [v7 setAccount:[a3 principalString]];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    {
      ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:indicator:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 82, 0, "Creating info with %@ realm and any user", [a3 realm]);
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    ACFLog(7, (uint64_t)"+[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:indicator:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTokenInfo.m", 87, 0, "Creating info for any user and realm");
  }
  return v7;
}

- (void)setPrincipal:(id)a3
{
  -[ACFKeychainItemInfo setService:](self, "setService:", [a3 realm]);
  uint64_t v5 = [a3 principalString];

  [(ACFKeychainItemInfo *)self setAccount:v5];
}

- (ACFPrincipal)principal
{
  v2 = [(ACFKeychainItemInfo *)self account];

  return +[ACFPrincipal principalWithPrincipalString:v2];
}

@end