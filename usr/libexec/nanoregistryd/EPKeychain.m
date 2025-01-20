@interface EPKeychain
+ (BOOL)keyExistsInKeychain:(id)a3 keychainGroup:(id)a4 attributes:(id)a5;
+ (BOOL)newKeysWithName:(id)a3;
+ (BOOL)storeKeyWithData:(id)a3 name:(id)a4 keychainGroup:(id)a5;
+ (id)keyAttributesWithName:(id)a3 keychainGroup:(id)a4;
+ (id)removeKeyWithName:(id)a3 keychainGroup:(id)a4;
+ (id)removeKeyWithName:(id)a3 keychainGroup:(id)a4 attributes:(id)a5;
+ (id)retrieveKeyWithName:(id)a3 keychainGroup:(id)a4;
+ (id)retrieveKeyWithName:(id)a3 keychainGroup:(id)a4 attributes:(id)a5;
+ (id)storeKey:(id)a3 keychainGroup:(id)a4;
@end

@implementation EPKeychain

+ (id)keyAttributesWithName:(id)a3 keychainGroup:(id)a4
{
  id v5 = a3;
  v11[0] = kSecAttrLabel;
  id v6 = a4;
  v7 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.nanoregistry", @"migration"];
  v12[0] = v7;
  v12[1] = v6;
  v11[1] = kSecAttrAccessGroup;
  v11[2] = kSecClass;
  v12[2] = kSecClassGenericPassword;
  v12[3] = kSecAttrViewHintNanoRegistry;
  v11[3] = kSecAttrSyncViewHint;
  v11[4] = kSecAttrSynchronizable;
  v11[5] = kSecAttrAccessible;
  v12[4] = kCFBooleanTrue;
  v12[5] = kSecAttrAccessibleWhenUnlocked;
  v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  id v9 = [v8 mutableCopy];
  if (v5 && ([v5 isEqual:@"migration"] & 1) == 0) {
    [v9 setObject:v5 forKeyedSubscript:kSecAttrAccount];
  }

  return v9;
}

+ (id)removeKeyWithName:(id)a3 keychainGroup:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_class();
  v8 = [(id)objc_opt_class() keyAttributesWithName:v6 keychainGroup:v5];
  id v9 = [v8 mutableCopy];
  v10 = [v7 removeKeyWithName:v6 keychainGroup:v5 attributes:v9];

  return v10;
}

+ (id)removeKeyWithName:(id)a3 keychainGroup:(id)a4 attributes:(id)a5
{
  id v6 = a3;
  OSStatus v7 = SecItemDelete((CFDictionaryRef)a5);
  v8 = nr_framework_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    if (v9)
    {
      v10 = nr_framework_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v18 = v6;
        __int16 v19 = 2048;
        uint64_t v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPKeychain: Failed to delete keys for device %{public}@ from keychain, error code %ld", buf, 0x16u);
      }
    }
    uint64_t v11 = v7;
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"Failed to delete key from keychain";
    v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v13 = +[NSError errorWithDomain:@"com.apple.NanoRegistry" code:v11 userInfo:v12];
LABEL_11:

    goto LABEL_12;
  }
  if (v9)
  {
    v12 = nr_framework_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "EPKeychain: Deleted keys for device %{public}@ from keychain", buf, 0xCu);
    }
    v13 = 0;
    goto LABEL_11;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

+ (BOOL)newKeysWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() removeKeyWithName:v4 keychainGroup:@"com.apple.nanoregistry.migration"];
  id v6 = [(id)objc_opt_class() removeKeyWithName:@"migration" keychainGroup:@"com.apple.nanoregistry.migration"];
  id v7 = [(id)objc_opt_class() removeKeyWithName:v4 keychainGroup:@"com.apple.nanoregistry.migration2"];
  if (!SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, bytes))
  {
    v10 = +[NSData dataWithBytes:bytes length:32];
    if (v10)
    {
      uint64_t v11 = nr_daemon_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        v13 = nr_daemon_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [v10 SHA256Data];
          NSErrorUserInfoKey v15 = [v14 base64EncodedStringWithOptions:0];
          CFStringRef v16 = [v15 substringToIndex:6];
          int v25 = 138412290;
          id v26 = v16;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EPKeychain: newKeysWithName created key, digest %@", (uint8_t *)&v25, 0xCu);
        }
      }
    }
    v17 = +[EPKey keyFromData:v10];
    id v18 = [v17 data];
    unsigned int v19 = [a1 storeKeyWithData:v18 name:v4 keychainGroup:@"com.apple.nanoregistry.migration2"];

    unsigned int v9 = v19 & [a1 storeKeyWithData:v10 name:@"migration" keychainGroup:@"com.apple.nanoregistry.migration2"];
    if (v9 == 1)
    {
      uint64_t v20 = nr_framework_log();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

      if (v21)
      {
        v22 = nr_framework_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = sub_10001D530((uint64_t)v17);
          int v25 = 138543618;
          id v26 = v4;
          __int16 v27 = 2048;
          uint64_t v28 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "EPKeychain: Keys generated and stored for %{public}@ version %lx", (uint8_t *)&v25, 0x16u);
        }
      }
    }

    goto LABEL_17;
  }
  v8 = nr_daemon_log();
  unsigned int v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

  if (v9)
  {
    v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000FC388();
    }
    LOBYTE(v9) = 0;
LABEL_17:
  }
  return v9;
}

+ (BOOL)storeKeyWithData:(id)a3 name:(id)a4 keychainGroup:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 base64EncodedDataWithOptions:0];
  uint64_t v11 = [(id)objc_opt_class() keyAttributesWithName:v9 keychainGroup:v8];

  id v12 = [v11 mutableCopy];
  [v12 setObject:v10 forKeyedSubscript:kSecValueData];
  OSStatus v13 = SecItemAdd((CFDictionaryRef)v12, 0);
  v14 = nr_daemon_log();
  NSErrorUserInfoKey v15 = v14;
  if (v13)
  {
    BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      v17 = nr_daemon_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000FC3BC();
      }
LABEL_8:
    }
  }
  else
  {
    BOOL v18 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      v17 = nr_daemon_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 134217984;
        id v21 = [v7 length];
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "EPKeychain: storeKeyWithData stored key, length %ld", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_8;
    }
  }

  return v13 == 0;
}

+ (id)retrieveKeyWithName:(id)a3 keychainGroup:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_class();
  id v8 = [(id)objc_opt_class() keyAttributesWithName:v6 keychainGroup:v5];
  id v9 = [v8 mutableCopy];
  v10 = [v7 retrieveKeyWithName:v6 keychainGroup:v5 attributes:v9];

  return v10;
}

+ (id)retrieveKeyWithName:(id)a3 keychainGroup:(id)a4 attributes:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  [v7 setObject:kCFBooleanTrue forKeyedSubscript:kSecReturnData];
  [v7 setObject:kSecMatchLimitOne forKeyedSubscript:kSecMatchLimit];
  CFTypeRef result = 0;
  OSStatus v8 = SecItemCopyMatching((CFDictionaryRef)v7, &result);

  id v9 = (void *)result;
  if (!result || v8)
  {
    NSErrorUserInfoKey v15 = nr_framework_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (!v16)
    {
      v14 = 0;
      goto LABEL_20;
    }
    v10 = nr_framework_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000FC424();
    }
    v14 = 0;
  }
  else
  {
    v10 = [objc_alloc((Class)NSData) initWithBase64EncodedData:result options:0];
    if (v10)
    {
      uint64_t v11 = nr_daemon_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        OSStatus v13 = nr_daemon_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v6;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EPKeychain: retrieveKeyWithName retrieved key %@", buf, 0xCu);
        }
      }
      v10 = v10;
      v14 = v10;
    }
    else
    {
      v17 = nr_framework_log();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

      if (v18)
      {
        unsigned int v19 = nr_framework_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1000FC48C((uint64_t)v6, (uint64_t)v9, v19);
        }
      }
      v14 = 0;
    }
  }

LABEL_20:

  return v14;
}

+ (BOOL)keyExistsInKeychain:(id)a3 keychainGroup:(id)a4 attributes:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  [v7 setObject:kCFBooleanTrue forKeyedSubscript:kSecReturnData];
  [v7 setObject:kSecMatchLimitOne forKeyedSubscript:kSecMatchLimit];
  CFTypeRef result = 0;
  OSStatus v8 = SecItemCopyMatching((CFDictionaryRef)v7, &result);

  if (v8)
  {
    id v9 = nr_framework_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      uint64_t v11 = nr_framework_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000FC504();
      }
    }
  }

  return v8 == 0;
}

+ (id)storeKey:(id)a3 keychainGroup:(id)a4
{
  id v4 = a4;
  v21[0] = kSecAttrLabel;
  id v5 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.nanoregistry", @"watchgraduation"];
  v22[0] = v5;
  v22[1] = v4;
  v21[1] = kSecAttrAccessGroup;
  v21[2] = kSecClass;
  v22[2] = kSecClassGenericPassword;
  v22[3] = kCFBooleanTrue;
  v21[3] = kSecAttrSynchronizable;
  v21[4] = kSecAttrAccessible;
  v22[4] = kSecAttrAccessibleAfterFirstUnlock;
  id v6 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];
  CFDictionaryRef v7 = (const __CFDictionary *)[v6 mutableCopy];

  OSStatus v8 = SecItemAdd(v7, 0);
  id v9 = nr_daemon_log();
  BOOL v10 = v9;
  if (v8)
  {
    BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      BOOL v12 = nr_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000FC3BC();
      }
    }
    uint64_t v13 = v8;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"Failed to Store Key in keychain";
    v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    NSErrorUserInfoKey v15 = +[NSError errorWithDomain:@"com.apple.NanoRegistry" code:v13 userInfo:v14];
LABEL_11:

    goto LABEL_12;
  }
  BOOL v16 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    v14 = nr_daemon_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "EPKeychain: storeKeyWithData stored key", buf, 2u);
    }
    NSErrorUserInfoKey v15 = 0;
    goto LABEL_11;
  }
  NSErrorUserInfoKey v15 = 0;
LABEL_12:

  return v15;
}

@end