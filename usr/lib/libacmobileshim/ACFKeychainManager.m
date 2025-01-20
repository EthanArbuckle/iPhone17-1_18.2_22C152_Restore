@interface ACFKeychainManager
- (BOOL)removeItemWithInfo:(id)a3;
- (NSString)obtainAccessGroup;
- (NSString)sharedAccessGroup;
- (NSString)usedAccessGroup;
- (id)searchItemWithInfo:(id)a3;
- (id)universalAccessGroup;
- (int)secAddItemWithAttributes:(id)a3 result:(id *)a4;
- (int)secItemCopyMatchingWithAttributes:(id)a3 result:(id *)a4;
- (int)storeItemWithInfo:(id)a3 share:(BOOL)a4 result:(id *)a5;
- (void)dumpResults:(id)a3;
- (void)dumpResults:(id)a3 printAttributes:(BOOL)a4;
- (void)setUsedAccessGroup:(id)a3;
@end

@implementation ACFKeychainManager

- (NSString)obtainAccessGroup
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACFKeychainManager obtainAccessGroup]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 27, 0, "Obtaining application access group");
  }
  uint64_t v3 = [[(id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle") pathForResource:@"Entitlements" ofType:@"plist"];
  if (!v3)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACFKeychainManager obtainAccessGroup]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 71, 0, "Failed to resolve path to Entitlements.plist");
    }
    return [(ACFKeychainManager *)self sharedAccessGroup];
  }
  uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v5 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:0 format:&v10 error:&v9];
  if (v9 && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
    ACFLog(3, (uint64_t)"-[ACFKeychainManager obtainAccessGroup]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 50, 0, "Failed to parse Entitlements.plist file with the following error: %@", v9);
  }
  if (!v5) {
    return [(ACFKeychainManager *)self sharedAccessGroup];
  }
  v6 = [[(id)objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", v5) objectForKey:@"keychain-access-groups"];
  if (!v6)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACFKeychainManager obtainAccessGroup]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 65, 0, "Entitlements.plist does not contain %@ entry", @"keychain-access-groups");
    }
    return [(ACFKeychainManager *)self sharedAccessGroup];
  }
  v7 = (NSString *)[v6 objectAtIndex:0];
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACFKeychainManager obtainAccessGroup]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 61, 0, "Access group is %@", v7);
  }
  if (!v7) {
    return [(ACFKeychainManager *)self sharedAccessGroup];
  }
  return v7;
}

- (NSString)sharedAccessGroup
{
  return 0;
}

- (id)universalAccessGroup
{
  return 0;
}

- (int)secAddItemWithAttributes:(id)a3 result:(id *)a4
{
  return SecItemAdd((CFDictionaryRef)a3, (CFTypeRef *)a4);
}

- (int)secItemCopyMatchingWithAttributes:(id)a3 result:(id *)a4
{
  CFDictionaryRef v5 = (const __CFDictionary *)(id)[a3 mutableCopy];

  return SecItemCopyMatching(v5, (CFTypeRef *)a4);
}

- (int)storeItemWithInfo:(id)a3 share:(BOOL)a4 result:(id *)a5
{
  BOOL v6 = a4;
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    uint64_t v9 = @"NO";
    if (v6) {
      uint64_t v9 = @"YES";
    }
    ACFLog(7, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 110, 0, "Storing info to keychain for sharing: %@...", v9);
  }
  if (v6) {
    [a3 setAccessGroup:-[ACFKeychainManager universalAccessGroup](self, "universalAccessGroup")];
  }
  if (![a3 accessibleType]) {
    [a3 setAccessibleType:*MEMORY[0x263F16EA0]];
  }
  if ([a3 accessGroup] && ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    uint64_t v10 = [a3 accessGroup];
    ACFLogNS(7, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 129, 0, @"Trying to store item to access group = %@", v11, v12, v10);
  }
  int v13 = -[ACFKeychainManager secAddItemWithAttributes:result:](self, "secAddItemWithAttributes:result:", [a3 attributes], a5);
  int v14 = v13;
  switch(v13)
  {
    case -34018:
      goto LABEL_17;
    case 0:
      if (!ACFLog || (ACFLogSettingsGetLevelMask() & 0x40) == 0) {
        goto LABEL_62;
      }
      uint64_t v28 = 175;
      goto LABEL_48;
    case -25243:
LABEL_17:
      if (v6)
      {
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
          ACFLog(6, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 135, 0, "Failed to add info to %@ access group", [a3 accessGroup]);
        }
        v15 = [(ACFKeychainManager *)self obtainAccessGroup];
        if (!v15 && ACFLog && (ACFLogSettingsGetLevelMask() & 0x10) != 0) {
          ACFLog(4, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 139, 0, "Failed to resolve access application group. SSO between applications not available.");
        }
        [a3 setAccessGroup:v15];
        if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
        {
          uint64_t v16 = [a3 accessGroup];
          ACFLogNS(7, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 143, 0, @"Trying to store item to access group = %@", v17, v18, v16);
        }
        int v19 = -[ACFKeychainManager secAddItemWithAttributes:result:](self, "secAddItemWithAttributes:result:", [a3 attributes], a5);
        int v14 = v19;
        BOOL v21 = v19 == -25243 || v19 == -34018;
        if (v15 && v21)
        {
          if (ACFLogNS)
          {
            if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
            {
              uint64_t v22 = [a3 accessGroup];
              ACFLogNS(7, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 150, 0, @"Failed to add info to %@ access group", v23, v24, v22);
            }
            [a3 setAccessGroup:0];
            if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
            {
              uint64_t v25 = [a3 accessGroup];
              ACFLogNS(7, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 152, 0, @"Trying to store item to access group = %@ (without access group)", v26, v27, v25);
            }
          }
          else
          {
            [a3 setAccessGroup:0];
          }
          int v29 = -[ACFKeychainManager secAddItemWithAttributes:result:](self, "secAddItemWithAttributes:result:", [a3 attributes], a5);
          int v14 = v29;
          if (v29 && ACFLog)
          {
            if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
              ACFLog(3, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 157, 0, "Failed to add info to keychain on 3rd attempt with %d error");
            }
            return v14;
          }
          if (v29) {
            return v14;
          }
LABEL_62:
          -[ACFKeychainManager setUsedAccessGroup:](self, "setUsedAccessGroup:", [a3 accessGroup]);
          return 0;
        }
        if (v19)
        {
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
            ACFLog(3, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 162, 0, "Failed to add info to keychain on 2nd attempt with %d error");
          }
          return v14;
        }
        if (!ACFLog || (ACFLogSettingsGetLevelMask() & 0x40) == 0) {
          goto LABEL_62;
        }
        uint64_t v28 = 166;
LABEL_48:
        ACFLog(6, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", v28, 0, "Successfully stored info to access group %@", [a3 accessGroup]);
        goto LABEL_62;
      }
      break;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
    ACFLog(3, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 171, 0, "Failed to add info to keychain with %d error with universal access group");
  }
  return v14;
}

- (void)dumpResults:(id)a3 printAttributes:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v4 = a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
        ACFLog(7, (uint64_t)"-[ACFKeychainManager dumpResults:printAttributes:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 201, 0, "FOUND %d ITEMS:", [a3 count]);
      }
      if (v4)
      {
        long long v12 = 0u;
        long long v13 = 0u;
        long long v10 = 0u;
        long long v11 = 0u;
        uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v11;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v11 != v8) {
                objc_enumerationMutation(a3);
              }
              [*(id *)(*((void *)&v10 + 1) + 8 * i) dump];
            }
            uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
          }
          while (v7);
        }
      }
    }
    else
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
        ACFLog(7, (uint64_t)"-[ACFKeychainManager dumpResults:printAttributes:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 196, 0, "FOUND ITEM:");
      }
      [a3 dump];
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    ACFLog(7, (uint64_t)"-[ACFKeychainManager dumpResults:printAttributes:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 190, 0, "NO ITEMS FOUND");
  }
}

- (void)dumpResults:(id)a3
{
}

- (BOOL)removeItemWithInfo:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACFKeychainManager removeItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 220, 0, "Deleting items with attributes: %@", [a3 attributes]);
  }
  if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    id v5 = (id)[a3 copy];
    id v6 = (id)[a3 copy];
    [v6 setReturnLimit:-1];
    [(ACFKeychainManager *)self dumpResults:[(ACFKeychainManager *)self searchItemWithInfo:v6]];
  }
  else
  {
    id v5 = 0;
  }
  OSStatus v7 = SecItemDelete((CFDictionaryRef)[a3 attributes]);
  OSStatus v8 = v7;
  if (v7 != -25300 && v7)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACFKeychainManager removeItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 236, 0, "Error %d did occur while deliting token", v8);
    }
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACFKeychainManager removeItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 240, 0, "Successfully deleted. Checking presence of item in keychain.");
    }
    if ((ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      [(ACFKeychainManager *)self dumpResults:[(ACFKeychainManager *)self searchItemWithInfo:v5]];
    }
  }
  return !v8 || v8 == -25300;
}

- (id)searchItemWithInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (ACFProfileStart && (ACFLogSettingsGetLevelMask() & 0x100) != 0) {
    ACFProfileStart((uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 252, 0, (uint64_t)"OVERALL");
  }
  [a3 setReturnAttributes:1];
  id v18 = 0;
  if (ACFProfileStart && (ACFLogSettingsGetLevelMask() & 0x100) != 0) {
    ACFProfileStart((uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 258, 0, (uint64_t)"SEARCH");
  }
  int v5 = -[ACFKeychainManager secItemCopyMatchingWithAttributes:result:](self, "secItemCopyMatchingWithAttributes:result:", [a3 attributes], &v18);
  if (ACFProfileEnd && (ACFLogSettingsGetLevelMask() & 0x100) != 0) {
    ACFProfileEnd((uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 261, 0, (uint64_t)"SEARCH");
  }
  id v6 = v18;
  if (v5 == -25300)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 273, 0, "Item not found in the keychain");
    }
    goto LABEL_39;
  }
  if (v5)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 269, 0, "Search in keychain failed with error: %@", [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v5 userInfo:0]);
    }
    goto LABEL_39;
  }
  if (!v18)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 282, 0, "Item is not found but API returned errSecSuccess");
      }
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 283, 0, "Search in keychain failed with error: %@", [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-25300 userInfo:0]);
      }
    }
    goto LABEL_39;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    OSStatus v7 = (void *)[(id)objc_opt_class() keychainItemInfoWithAttributes:v18];
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 302, 0, "Error while trying to fetch Keychain information");
    }
LABEL_39:
    OSStatus v7 = 0;
    goto LABEL_40;
  }
  OSStatus v7 = [MEMORY[0x263EFF980] arrayWithCapacity:[v18 count]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v18;
  uint64_t v9 = [v18 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 addObject:[objc_opt_class() keychainItemInfoWithAttributes:*(void *)(*((void *)&v14 + 1) + 8 * i)]];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
LABEL_40:
  if (ACFProfileEnd && (ACFLogSettingsGetLevelMask() & 0x100) != 0) {
    ACFProfileEnd((uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 307, 0, (uint64_t)"OVERALL");
  }
  return v7;
}

- (NSString)usedAccessGroup
{
  return self->_usedAccessGroup;
}

- (void)setUsedAccessGroup:(id)a3
{
}

@end