@interface ACMKeychainTGTStoragePolicy
- (ACFKeychainManagerProtocol)keychainManager;
- (BOOL)performRemoveTokenWithPrincipal:(id)a3 service:(id)a4;
- (BOOL)performStoreToken:(id)a3 withService:(id)a4;
- (BOOL)removeTokenWithPrincipal:(id)a3;
- (BOOL)storeToken:(id)a3;
- (BOOL)updateToken:(id)a3;
- (BOOL)useSharedStorage;
- (NSString)service;
- (id)allTokensWithPrincipal:(id)a3;
- (id)allTokensWithPrincipal:(id)a3 service:(id)a4;
- (id)dictionaryWithSSOToken:(id)a3;
- (id)searchItemWithInfo:(id)a3;
- (id)searchTokenWithPrincipal:(id)a3;
- (id)ssoTokenWithKeychainInfo:(id)a3 realm:(id)a4;
- (id)tokenDataWithDictionary:(id)a3;
- (id)tokenDictionaryWithData:(id)a3;
- (int)storeItemWithInfo:(id)a3;
- (void)setService:(id)a3;
- (void)setUseSharedStorage:(BOOL)a3;
@end

@implementation ACMKeychainTGTStoragePolicy

- (ACFKeychainManagerProtocol)keychainManager
{
  id v2 = +[ACFComponents components];

  return (ACFKeychainManagerProtocol *)[v2 keychainManager];
}

- (BOOL)storeToken:(id)a3
{
  v5 = [(ACMKeychainTGTStoragePolicy *)self service];

  return [(ACMKeychainTGTStoragePolicy *)self performStoreToken:a3 withService:v5];
}

- (BOOL)updateToken:(id)a3
{
  v5 = [(ACMKeychainTGTStoragePolicy *)self service];

  return [(ACMKeychainTGTStoragePolicy *)self performStoreToken:a3 withService:v5];
}

- (id)searchTokenWithPrincipal:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(ACMKeychainTGTStoragePolicy *)self allTokensWithPrincipal:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  v6 = 0;
  uint64_t v7 = *(void *)v12;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
      if (!v6 || objc_msgSend((id)objc_msgSend(v6, "creationDate"), "compare:", objc_msgSend(v9, "creationDate")) == -1) {
        v6 = v9;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v5);
  return v6;
}

- (id)allTokensWithPrincipal:(id)a3
{
  uint64_t v5 = [(ACMKeychainTGTStoragePolicy *)self service];

  return [(ACMKeychainTGTStoragePolicy *)self allTokensWithPrincipal:a3 service:v5];
}

- (id)ssoTokenWithKeychainInfo:(id)a3 realm:(id)a4
{
  [a3 account];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([a3 generic], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([a3 creationDate], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!ACFLog) {
      return 0;
    }
LABEL_18:
    if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 68, 0, "Keychain item has unexpected data type");
    }
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      {
        [a3 account];
        uint64_t v18 = objc_opt_class();
        ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 69, 0, "Account of class %@: %@", v18, [a3 account]);
      }
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        {
          [a3 creationDate];
          uint64_t v19 = objc_opt_class();
          ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 70, 0, "Creation Date of class %@: %@", v19, [a3 creationDate]);
        }
        if (ACFLog)
        {
          if ((ACFLogSettingsGetLevelMask() & 8) != 0)
          {
            [a3 service];
            uint64_t v20 = objc_opt_class();
            ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 71, 0, "Service of class %@: %@", v20, [a3 service]);
          }
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
          {
            [a3 generic];
            uint64_t v21 = objc_opt_class();
            ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 72, 0, "Generic of class %@", v21);
          }
        }
      }
    }
    return 0;
  }
  [a3 service];
  objc_opt_class();
  int v7 = objc_opt_isKindOfClass() & 1;
  if (v7) {
    id v8 = a3;
  }
  else {
    id v8 = 0;
  }
  if (!v7 && ACFLog) {
    goto LABEL_18;
  }
  if (!v8
    || a4
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "principal"), "realm"), "isEqualToString:", a4))
  {
    return 0;
  }
  id v9 = -[ACMKeychainTGTStoragePolicy tokenDictionaryWithData:](self, "tokenDictionaryWithData:", [v8 generic]);
  if (!v9) {
    return 0;
  }
  v10 = v9;
  uint64_t v11 = [v8 creationDate];
  long long v12 = (void *)[v10 objectForKey:@"d"];
  if (v12)
  {
    long long v13 = (void *)MEMORY[0x263EFF910];
    [v12 doubleValue];
    uint64_t v11 = [v13 dateWithTimeIntervalSince1970:v14 / 1000.0];
  }
  v15 = +[ACMToken tokenWithPrincipal:creationDate:tokenData:](ACMSSOToken, "tokenWithPrincipal:creationDate:tokenData:", [v8 principal], v11, 0);
  uint64_t v16 = (void *)MEMORY[0x263EFF910];
  [v10 objectForKey:@"e"] doubleValue];
  -[ACMToken setExpirationDate:](v15, "setExpirationDate:", [v16 dateWithTimeIntervalSince1970:v17 / 1000.0]);
  -[ACMToken setNonce:](v15, "setNonce:", [v10 objectForKey:@"o"]);
  -[ACMSSOToken setSessionToken:](v15, "setSessionToken:", [v10 objectForKey:@"q"]);
  -[ACMSSOToken setRecentAuthenticationDate:](v15, "setRecentAuthenticationDate:", [v10 objectForKey:@"ACMSSOKeyRecentAuthenticationDate"]);
  -[ACMSSOToken setRecentUnlockDate:](v15, "setRecentUnlockDate:", [v10 objectForKey:@"ACMSSOKeyRecentUnlockDate"]);
  -[ACMSSOToken setPersonID:](v15, "setPersonID:", [v10 objectForKey:@"pid"]);
  if (![(ACMSSOToken *)v15 recentUnlockDate]) {
    [(ACMSSOToken *)v15 setRecentUnlockDate:[(ACMSSOToken *)v15 recentAuthenticationDate]];
  }
  return v15;
}

- (id)searchItemWithInfo:(id)a3
{
  uint64_t v4 = [(ACMKeychainTGTStoragePolicy *)self keychainManager];

  return (id)[(ACFKeychainManagerProtocol *)v4 searchItemWithInfo:a3];
}

- (id)allTokensWithPrincipal:(id)a3 service:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v6 = +[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:a3 indicator:a4];
  [(ACFKeychainItemInfo *)v6 setReturnLimit:-1];
  id v7 = [(ACMKeychainTGTStoragePolicy *)self searchItemWithInfo:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_5:
    id v9 = v8;
    goto LABEL_6;
  }
  if (v7)
  {
    id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObject:v7];
    goto LABEL_5;
  }
  id v9 = 0;
LABEL_6:
  v10 = (void *)[MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = -[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:](self, "ssoTokenWithKeychainInfo:realm:", *(void *)(*((void *)&v18 + 1) + 8 * v14), [a3 realm]);
        if (v15)
        {
          id v16 = v15;
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
            ACFLog(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy allTokensWithPrincipal:service:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 134, 0, "Created SSO Token - %@", v16);
          }
          [v10 addObject:v16];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  if (![v10 count]) {
    return (id)[MEMORY[0x263EFF8C0] array];
  }
  return v10;
}

- (BOOL)removeTokenWithPrincipal:(id)a3
{
  uint64_t v5 = [(ACMKeychainTGTStoragePolicy *)self service];

  return [(ACMKeychainTGTStoragePolicy *)self performRemoveTokenWithPrincipal:a3 service:v5];
}

- (BOOL)performRemoveTokenWithPrincipal:(id)a3 service:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v6 = +[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:a3 indicator:a4];
  [(ACFKeychainItemInfo *)v6 setReturnLimit:-1];
  long long v18 = self;
  uint64_t v7 = [(ACFKeychainManagerProtocol *)[(ACMKeychainTGTStoragePolicy *)self keychainManager] searchItemWithInfo:v6];
  if (v7)
  {
    id v8 = (void *)v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v8 = (void *)[MEMORY[0x263EFF8C0] arrayWithObject:v8];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v9)
    {
      char v11 = 0;
      goto LABEL_36;
    }
    uint64_t v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v20;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        id v15 = +[ACFKeychainItemInfo keychainItemInfo];
        if (objc_msgSend((id)objc_msgSend(a3, "principalString"), "isEqualToString:", objc_msgSend(v14, "account")))
        {
          [v15 setAccount:[v14 account]];
LABEL_11:
          if (v15)
          {
            [v15 setService:[v14 service]];
            [v15 setClassCode:+[ACMKeychainTokenInfo classCode](ACMKeychainTokenInfo, "classCode")];
            char v11 = v11 & 1 | [(ACFKeychainManagerProtocol *)[(ACMKeychainTGTStoragePolicy *)v18 keychainManager] removeItemWithInfo:v15];
          }
          goto LABEL_13;
        }
        if (objc_msgSend((id)objc_msgSend(a3, "realm"), "length")
          && objc_msgSend((id)objc_msgSend(v14, "account"), "hasSuffix:", objc_msgSend(a3, "realm")))
        {
          [v15 setAccount:[v14 account]];
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
            ACFLog(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 171, 0, "Found item by realm");
          }
          goto LABEL_11;
        }
        if (objc_msgSend((id)objc_msgSend(a3, "userName"), "length")
          && objc_msgSend((id)objc_msgSend(v14, "account"), "hasPrefix:", objc_msgSend(a3, "userName")))
        {
          [v15 setAccount:[v14 account]];
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
            ACFLog(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 176, 0, "Found item by userName");
          }
          goto LABEL_11;
        }
        if (!objc_msgSend((id)objc_msgSend(a3, "userName"), "length")
          && !objc_msgSend((id)objc_msgSend(a3, "realm"), "length"))
        {
          [v15 setAccount:[v14 account]];
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
            ACFLog(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 181, 0, "Found item");
          }
          goto LABEL_11;
        }
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
          ACFLog(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 185, 0, "Did not found item");
        }
LABEL_13:
        ++v13;
      }
      while (v10 != v13);
      uint64_t v16 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v10 = v16;
      if (!v16)
      {
LABEL_36:
        LOBYTE(v7) = v11 & 1;
        return v7;
      }
    }
  }
  return v7;
}

- (id)dictionaryWithSSOToken:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v5 = NSNumber;
  [objc_msgSend(objc_msgSend(a3, "expirationDate"), "timeIntervalSince1970")];
  uint64_t v7 = [v5 numberWithLongLong:(uint64_t)(v6 * 1000.0)];
  id v8 = NSNumber;
  [((id)objc_msgSend(a3, "creationDate")) timeIntervalSince1970];
  return (id)[v4 dictionaryWithObjectsAndKeys:v7, @"e", [objc_msgSend(v8, "numberWithLongLong:", (uint64_t)(v9 * 1000.0))], @"d", objc_msgSend(a3, "nonce"), @"o", objc_msgSend(a3, "sessionToken"), @"q", objc_msgSend(a3, "recentAuthenticationDate"), @"ACMSSOKeyRecentAuthenticationDate", objc_msgSend(a3, "recentUnlockDate"), @"ACMSSOKeyRecentUnlockDate", objc_msgSend(a3, "personID"), @"pid", 0];
}

- (int)storeItemWithInfo:(id)a3
{
  uint64_t v5 = [(ACMKeychainTGTStoragePolicy *)self keychainManager];
  BOOL v6 = [(ACMKeychainTGTStoragePolicy *)self useSharedStorage];

  return [(ACFKeychainManagerProtocol *)v5 storeItemWithInfo:a3 share:v6 result:0];
}

- (id)tokenDataWithDictionary:(id)a3
{
  if (a3) {
    return (id)[MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:0];
  }
  else {
    return 0;
  }
}

- (id)tokenDictionaryWithData:(id)a3
{
  id result = (id)[a3 length];
  if (result)
  {
    uint64_t v5 = (void *)MEMORY[0x263F08AC0];
    return (id)[v5 propertyListWithData:a3 options:0 format:0 error:0];
  }
  return result;
}

- (BOOL)performStoreToken:(id)a3 withService:(id)a4
{
  uint64_t v7 = +[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:indicator:](ACMKeychainTokenInfo, "keychainTokenInfoWithPrincipal:indicator:", [a3 principal], a4);
  -[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:](self, "performRemoveTokenWithPrincipal:service:", +[ACFPrincipal principalWithUserName:realm:](ACFPrincipal, "principalWithUserName:realm:", 0, [objc_msgSend((id)objc_msgSend(a3, "principal"), "realm")]), a4);
  [(ACMKeychainTokenInfo *)v7 setTokenData:[(ACMKeychainTGTStoragePolicy *)self tokenDataWithDictionary:[(ACMKeychainTGTStoragePolicy *)self dictionaryWithSSOToken:a3]]];
  if ([(NSData *)[(ACMKeychainTokenInfo *)v7 tokenData] length])
  {
    -[ACFKeychainItemInfo setCreationDate:](v7, "setCreationDate:", [a3 creationDate]);
    [(ACFKeychainItemInfo *)v7 setSynchronizable:0];
    if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLogNS(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy performStoreToken:withService:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 243, 0, @"Token keychain item attributes:", v8, v9, v13);
    }
    [(ACFKeychainItemInfo *)v7 dump];
    int v10 = [(ACMKeychainTGTStoragePolicy *)self storeItemWithInfo:v7];
    if (v10) {
      char v11 = 0;
    }
    else {
      char v11 = (void (*)(int, uint64_t, char *, uint64_t, const char *, char *, ...))v7;
    }
    if (v10 && ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x10) != 0) {
        ACFLog(4, (uint64_t)"-[ACMKeychainTGTStoragePolicy performStoreToken:withService:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 252, 0, "Error %d has occurred while trying to store SSO token");
      }
LABEL_15:
      char v11 = 0;
    }
  }
  else
  {
    char v11 = ACFLog;
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy performStoreToken:withService:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 259, 0, "Failed to store token");
      }
      goto LABEL_15;
    }
  }
  return v11 != 0;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (BOOL)useSharedStorage
{
  return self->_useSharedStorage;
}

- (void)setUseSharedStorage:(BOOL)a3
{
  self->_useSharedStorage = a3;
}

@end