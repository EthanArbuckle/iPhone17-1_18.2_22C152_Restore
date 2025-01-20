@interface MSDKeychainManager
+ (id)sharedInstance;
- (BOOL)deleteItemForKey:(id)a3;
- (BOOL)saveItem:(id)a3 forKey:(id)a4;
- (BOOL)saveItem:(id)a3 forKey:(id)a4 withAttributes:(id)a5;
- (MSDKeychainManager)init;
- (NSMutableDictionary)cache;
- (id)createSearchDictionaryForKey:(id)a3;
- (id)getAllItemsForKey:(id)a3 withAttributes:(BOOL)a4;
- (id)getItemForKey:(id)a3;
- (int)updateItemForAttributes:(id)a3 withData:(id)a4;
- (void)setCache:(id)a3;
@end

@implementation MSDKeychainManager

+ (id)sharedInstance
{
  if (qword_100189AF0 != -1) {
    dispatch_once(&qword_100189AF0, &stru_1001531D0);
  }
  v2 = (void *)qword_100189AE8;

  return v2;
}

- (MSDKeychainManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDKeychainManager;
  v2 = [(MSDKeychainManager *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    [(MSDKeychainManager *)v2 setCache:v3];

    v4 = v2;
  }

  return v2;
}

- (BOOL)saveItem:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [(MSDKeychainManager *)v8 createSearchDictionaryForKey:v7];
  if (![v9 count])
  {
    v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000D20A8((uint64_t)v7, v14, v15, v16, v17, v18, v19, v20);
    }

    goto LABEL_13;
  }
  [v9 setObject:v6 forKey:kSecValueData];
  OSStatus v10 = SecItemAdd((CFDictionaryRef)v9, 0);
  if (v10 == -25299)
  {
    [v9 removeObjectForKey:kSecValueData];
    OSStatus v10 = [(MSDKeychainManager *)v8 updateItemForAttributes:v9 withData:v6];
  }
  if (v10)
  {
    v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000D2114();
    }

LABEL_13:
    BOOL v12 = 0;
    goto LABEL_6;
  }
  v11 = [(MSDKeychainManager *)v8 cache];
  [v11 setValue:v6 forKey:v7];

  BOOL v12 = 1;
LABEL_6:

  objc_sync_exit(v8);
  return v12;
}

- (id)getItemForKey:(id)a3
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  CFTypeRef result = 0;
  id v7 = [(MSDKeychainManager *)v6 cache];
  v8 = [v7 objectForKey:v5];

  if (v8)
  {
    v9 = [(MSDKeychainManager *)v6 cache];
    uint64_t v3 = [v9 objectForKey:v5];

    int v10 = 1;
    goto LABEL_7;
  }
  v11 = [(MSDKeychainManager *)v6 createSearchDictionaryForKey:v5];
  if (![v11 count])
  {
    BOOL v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000D217C(v12, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_17;
  }
  [v11 setObject:kCFBooleanTrue forKey:kSecReturnData];
  uint64_t v3 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
  if (v3)
  {
    BOOL v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000D21B4();
    }
LABEL_17:
    int v10 = 4;
    goto LABEL_6;
  }
  uint64_t v3 = (uint64_t)result;
  BOOL v12 = [(MSDKeychainManager *)v6 cache];
  [v12 setValue:v3 forKey:v5];
  int v10 = 1;
LABEL_6:

LABEL_7:
  objc_sync_exit(v6);

  if (v10 == 4) {
    v13 = 0;
  }
  else {
    v13 = (void *)v3;
  }

  return v13;
}

- (BOOL)deleteItemForKey:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MSDKeychainManager *)v5 createSearchDictionaryForKey:v4];
  if (![v6 count])
  {
    int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D217C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_9;
  }
  id v7 = [(MSDKeychainManager *)v5 cache];
  [v7 removeObjectForKey:v4];

  if (SecItemDelete((CFDictionaryRef)v6))
  {
    int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D221C();
    }
LABEL_9:

    BOOL v8 = 0;
    goto LABEL_4;
  }
  BOOL v8 = 1;
LABEL_4:

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)saveItem:(id)a3 forKey:(id)a4 withAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  v29 = v9;
  uint64_t v12 = [(MSDKeychainManager *)v11 createSearchDictionaryForKey:v9];
  if (![v12 count])
  {
    v22 = sub_100068600();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000D20A8((uint64_t)v9, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_18;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v31;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v18 = [v13 objectForKey:v17];
        [v12 setObject:v18 forKey:v17];
      }
      id v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }

  [v12 setObject:v8 forKey:kSecValueData];
  OSStatus v19 = SecItemAdd((CFDictionaryRef)v12, 0);
  if (v19 == -25299)
  {
    [v12 removeObjectForKey:kSecValueData];
    OSStatus v19 = [(MSDKeychainManager *)v11 updateItemForAttributes:v12 withData:v8];
  }
  if (v19)
  {
    v22 = sub_100068600();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000D2114();
    }
LABEL_18:

    BOOL v20 = 0;
    goto LABEL_13;
  }
  BOOL v20 = 1;
LABEL_13:

  objc_sync_exit(v11);
  return v20;
}

- (id)getAllItemsForKey:(id)a3 withAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  CFTypeRef result = 0;
  id v8 = [(MSDKeychainManager *)v7 createSearchDictionaryForKey:v6];
  if ([v8 count])
  {
    if (v4) {
      [v8 setObject:kCFBooleanTrue forKey:kSecReturnAttributes];
    }
    [v8 setObject:kSecMatchLimitAll forKey:kSecMatchLimit];
    [v8 setObject:kCFBooleanTrue forKey:kSecReturnData];
    if (!SecItemCopyMatching((CFDictionaryRef)v8, &result))
    {
      id v9 = (void *)result;
      goto LABEL_6;
    }
    OSStatus v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000D2284();
    }
  }
  else
  {
    uint64_t v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000D217C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  id v9 = 0;
LABEL_6:

  objc_sync_exit(v7);

  return v9;
}

- (int)updateItemForAttributes:(id)a3 withData:(id)a4
{
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  CFDictionaryRef v6 = +[NSDictionary dictionaryWithObject:a4 forKey:kSecValueData];
  OSStatus v7 = SecItemUpdate(v5, v6);

  return v7;
}

- (id)createSearchDictionaryForKey:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if ([(__CFString *)v3 isEqualToString:@"com.apple.mobilestoredemo.wifi.key"])
  {
    [v4 setObject:kSecClassKey forKey:kSecClass];
    [v4 setObject:kSecAttrKeyClassSymmetric forKey:kSecAttrKeyClass];
    CFDictionaryRef v5 = &kSecAttrApplicationLabel;
LABEL_9:
    CFStringRef v6 = *v5;
    id v8 = v4;
    CFStringRef v7 = v3;
    goto LABEL_10;
  }
  if ([(__CFString *)v3 isEqualToString:@"com.apple.mobilestoredemo.keychainItemID"])
  {
    [v4 setObject:kSecClassGenericPassword forKey:kSecClass];
    [v4 setObject:v3 forKey:kSecAttrService];
    CFStringRef v6 = kSecAttrAccount;
    CFStringRef v7 = @"UDID";
LABEL_5:
    id v8 = v4;
LABEL_10:
    [v8 setObject:v7 forKey:v6];
    goto LABEL_11;
  }
  if (([(__CFString *)v3 isEqualToString:@"com.apple.mobilestoredemo.keychainUserCredID"] & 1) != 0|| [(__CFString *)v3 isEqualToString:@"com.apple.mobilestoredemo.keychainAdminCredID"])
  {
    [v4 setObject:kSecClassGenericPassword forKey:kSecClass];
    CFDictionaryRef v5 = &kSecAttrService;
    goto LABEL_9;
  }
  if ([(__CFString *)v3 isEqualToString:@"com.appl.mobilestoredemo.bluetooth."])
  {
    [v4 setObject:@"com.apple.bluetooth" forKey:kSecAttrAccessGroup];
    CFStringRef v7 = kSecClassGenericPassword;
    id v10 = &kSecClass;
LABEL_18:
    CFStringRef v6 = *v10;
    goto LABEL_5;
  }
  if ([(__CFString *)v3 isEqualToString:@"com.apple.NetworkServiceProxy.PrivateAccessTokens.LongLivedTokens"])
  {
    [v4 setObject:kSecClassGenericPassword forKey:kSecClass];
    [v4 setObject:@"com.apple.NetworkServiceProxy.PrivateAccessTokens.LongLivedTokens" forKey:kSecAttrService];
    CFStringRef v7 = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
    id v10 = &kSecAttrAccessible;
    goto LABEL_18;
  }
  uint64_t v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1000D22EC((uint64_t)v3, v11, v12, v13, v14, v15, v16, v17);
  }

LABEL_11:

  return v4;
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end