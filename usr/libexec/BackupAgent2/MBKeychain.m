@interface MBKeychain
+ (BOOL)addAllPasswordItems:(id)a3 error:(id *)a4;
+ (BOOL)addPasswordItem:(id)a3 error:(id *)a4;
+ (id)allPasswordItemsForService:(id)a3 error:(id *)a4;
+ (id)allPasswordItemsForServices:(id)a3 error:(id *)a4;
+ (id)passwordItemsForService:(id)a3 account:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
@end

@implementation MBKeychain

+ (id)passwordItemsForService:(id)a3 account:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10 = +[NSMutableDictionary dictionary];
  [v10 setObject:kSecClassGenericPassword forKeyedSubscript:kSecClass];
  if (a3) {
    [v10 setObject:a3 forKeyedSubscript:kSecAttrService];
  }
  if (a4) {
    [v10 setObject:a4 forKeyedSubscript:kSecAttrAccount];
  }
  if (a5 == 1)
  {
    v11 = &kSecMatchLimitOne;
    goto LABEL_9;
  }
  if (!a5)
  {
    v11 = &kSecMatchLimitAll;
LABEL_9:
    v12 = (NSNumber *)*v11;
    goto LABEL_11;
  }
  v12 = +[NSNumber numberWithUnsignedInteger:a5];
LABEL_11:
  [v10 setObject:v12 forKeyedSubscript:kSecMatchLimit];
  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
  CFTypeRef result = 0;
  uint64_t v13 = SecItemCopyMatching((CFDictionaryRef)v10, &result);
  if (v13 == -25300) {
    return &__NSArray0__struct;
  }
  if (v13)
  {
    v14 = 0;
    if (a6) {
      *a6 = +[MBError errorWithCode:1, @"SecItemCopyMatching error: %d", v13 format];
    }
  }
  else
  {
    v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [(id)result count]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v15 = (void *)result;
    id v16 = [(id)result countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          [(NSMutableArray *)v14 addObject:+[MBKeychainItem keychainItemWithAttributes:*(void *)(*((void *)&v21 + 1) + 8 * i)]];
        }
        id v17 = [v15 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v17);
    }
  }
  return v14;
}

+ (id)allPasswordItemsForService:(id)a3 error:(id *)a4
{
  return +[MBKeychain passwordItemsForService:a3 account:0 limit:0 error:a4];
}

+ (id)allPasswordItemsForServices:(id)a3 error:(id *)a4
{
  id v6 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(a3);
        }
        id v11 = +[MBKeychain allPasswordItemsForService:*(void *)(*((void *)&v13 + 1) + 8 * i) error:a4];
        if (!v11) {
          return 0;
        }
        [v6 addObjectsFromArray:v11];
      }
      id v8 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  return v6;
}

+ (BOOL)addPasswordItem:(id)a3 error:(id *)a4
{
  v17[0] = kSecClassGenericPassword;
  v16[0] = kSecClass;
  v16[1] = kSecAttrService;
  v17[1] = [a3 serviceName];
  v16[2] = kSecAttrAccount;
  v17[2] = [a3 accountName];
  v16[3] = kSecAttrAccessGroup;
  v17[3] = [a3 accessGroupName];
  v16[4] = kSecAttrAccessible;
  v17[4] = [a3 accessibilityType];
  v16[5] = kSecValueData;
  v16[6] = kSecReturnData;
  v17[5] = [a3 valueData];
  v17[6] = &__kCFBooleanFalse;
  uint64_t v6 = SecItemAdd((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:7], 0);
  if (!v6) {
    return 1;
  }
  if (v6 == -25299)
  {
    v15[0] = kSecClassGenericPassword;
    v14[0] = kSecClass;
    v14[1] = kSecAttrService;
    v15[1] = [a3 serviceName];
    v14[2] = kSecAttrAccount;
    v15[2] = [a3 accountName];
    id v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
    v12[0] = kSecAttrAccessible;
    v12[1] = kSecValueData;
    v13[0] = [a3 accessibilityType];
    v13[1] = [a3 valueData];
    uint64_t v8 = SecItemUpdate((CFDictionaryRef)v7, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2]);
    BOOL result = v8 == 0;
    if (a4 && v8)
    {
      id v10 = +[MBError errorWithCode:1, @"SecItemUpdate error: %d", v8 format];
LABEL_9:
      id v11 = v10;
      BOOL result = 0;
      *a4 = v11;
    }
  }
  else
  {
    if (a4)
    {
      id v10 = +[MBError errorWithCode:1, @"SecItemAdd error: %d", v6 format];
      goto LABEL_9;
    }
    return 0;
  }
  return result;
}

+ (BOOL)addAllPasswordItems:(id)a3 error:(id *)a4
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(a3);
      }
      BOOL v10 = +[MBKeychain addPasswordItem:*(void *)(*((void *)&v12 + 1) + 8 * v9) error:a4];
      if (!v10) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v10) = 1;
  }
  return v10;
}

@end