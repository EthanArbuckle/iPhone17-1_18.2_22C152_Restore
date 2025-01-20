@interface KeychainUtil
+ (int)keychainItemForService:(id)a3 withUsername:(id)a4 returningItem:(id *)a5;
+ (void)removeKeychainItemForService:(id)a3 withUsername:(id)a4;
+ (void)setKeychainItemForService:(id)a3 withUsername:(id)a4 value:(id)a5 accessibility:(int64_t)a6;
@end

@implementation KeychainUtil

+ (int)keychainItemForService:(id)a3 withUsername:(id)a4 returningItem:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [a1 hideKeychainUI];
  if (a5) {
    *a5 = 0;
  }
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
    CFDictionaryAddValue(Mutable, kSecAttrAccount, v9);
    CFDictionaryAddValue(Mutable, kSecAttrService, v8);
    CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, @"fmfd_keychain_group");
    CFDictionaryAddValue(Mutable, kSecReturnData, kCFBooleanTrue);
    CFTypeRef result = 0;
    OSStatus v11 = SecItemCopyMatching(Mutable, &result);
    CFTypeRef v12 = result;
    if (v11) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = result == 0;
    }
    if (v13)
    {
      if (v11)
      {
        if (v11 == -25300)
        {
          v14 = sub_100005560();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_10006BE14(v14);
          }
        }
        else
        {
          v14 = sub_100005560();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v31 = v8;
            __int16 v32 = 2112;
            id v33 = v9;
            __int16 v34 = 2048;
            CFTypeRef v35 = (CFTypeRef)v11;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed for service %@ & user %@ with result: %ld", buf, 0x20u);
          }
        }
      }
    }
    else
    {
      if (a5)
      {
        id v15 = objc_alloc((Class)NSKeyedUnarchiver);
        id v27 = 0;
        id v16 = [v15 initForReadingFromData:result error:&v27];
        id v17 = v27;
        if (v17)
        {
          v18 = sub_100005560();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_10006BD9C((uint64_t)v17, v18);
          }
        }
        [v16 setRequiresSecureCoding:1];
        v19 = sub_100005560();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = *a5;
          *(_DWORD *)buf = 138413058;
          id v31 = v8;
          __int16 v32 = 2112;
          id v33 = v9;
          __int16 v34 = 2112;
          CFTypeRef v35 = result;
          __int16 v36 = 2112;
          id v37 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Unarchiver before decoding service:%@, username:%@, returnData:%@(decoded:%@)", buf, 0x2Au);
        }

        v29[0] = objc_opt_class();
        v29[1] = objc_opt_class();
        v29[2] = objc_opt_class();
        v21 = +[NSArray arrayWithObjects:v29 count:3];
        v22 = +[NSSet setWithArray:v21];
        *a5 = [v16 decodeObjectOfClasses:v22 forKey:@"fmfd_keychain_data_key"];

        v23 = sub_100005560();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = *a5;
          *(_DWORD *)buf = 138413058;
          id v31 = v8;
          __int16 v32 = 2112;
          id v33 = v9;
          __int16 v34 = 2112;
          CFTypeRef v35 = result;
          __int16 v36 = 2112;
          id v37 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Unarchiver after decoding service:%@, username:%@, returnData:%@(decoded:%@)", buf, 0x2Au);
        }

        if (!*a5)
        {
          v25 = sub_100005560();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = v8;
            __int16 v32 = 2112;
            id v33 = v9;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Unarchiver was not able to decode existing data, cleaning up any existing data from keychain for service: %@, username: %@", buf, 0x16u);
          }

          +[KeychainUtil removeKeychainItemForService:v8 withUsername:v9];
        }

        CFTypeRef v12 = result;
      }
      CFRelease(v12);
    }
    CFRelease(Mutable);
  }
  else
  {
    OSStatus v11 = 0;
  }
  [a1 restoreKeychainUI];

  return v11;
}

+ (void)setKeychainItemForService:(id)a3 withUsername:(id)a4 value:(id)a5 accessibility:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [a1 hideKeychainUI];
  id v13 = [v10 length];
  if (!v12 || !v13 || ![v11 length]) {
    goto LABEL_30;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccount, v11);
  CFDictionaryAddValue(Mutable, kSecAttrService, v10);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, @"fmfd_keychain_group");
  id v15 = +[NSMutableData data];
  id v16 = [objc_alloc((Class)NSKeyedArchiver) initForWritingWithMutableData:v15];
  id v17 = sub_100005560();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    __int16 v36 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Archiver before encoding service:%@, username:%@, value:%@(encoded value:%@)", buf, 0x2Au);
  }

  [v16 setRequiresSecureCoding:1];
  [v16 encodeObject:v12 forKey:@"fmfd_keychain_data_key"];
  [v16 finishEncoding];
  v18 = sub_100005560();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    __int16 v36 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Archiver after encoding service:%@, username:%@, value:%@(encoded value:%@)", buf, 0x2Au);
  }

  CFDictionaryAddValue(Mutable, kSecValueData, v15);
  switch(a6)
  {
    case 4:
      v19 = sub_100005560();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v10;
        __int16 v31 = 2112;
        id v32 = v11;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setting AOSAccessibleAlways keychain item for service: %@ and account: %@", buf, 0x16u);
      }
      id v20 = (const void **)&kSecAttrAccessibleAlwaysPrivate;
      goto LABEL_20;
    case 3:
      v19 = sub_100005560();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v10;
        __int16 v31 = 2112;
        id v32 = v11;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setting AOSAccessibleAfterFirstUnlock keychain item for service: %@ and account: %@", buf, 0x16u);
      }
      id v20 = (const void **)&kSecAttrAccessibleAfterFirstUnlock;
      goto LABEL_20;
    case 2:
      v19 = sub_100005560();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v10;
        __int16 v31 = 2112;
        id v32 = v11;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setting AOSAccessibleWhenUnlocked keychain item for service: %@ and account: %@", buf, 0x16u);
      }
      id v20 = (const void **)&kSecAttrAccessibleWhenUnlocked;
LABEL_20:

      CFDictionaryAddValue(Mutable, kSecAttrAccessible, *v20);
      break;
  }
  id v28 = 0;
  +[KeychainUtil keychainItemForService:v10 withUsername:v11 returningItem:&v28];
  id v21 = v28;
  if (v21)
  {
    OSStatus v22 = SecItemDelete(Mutable);
    v23 = sub_100005560();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v10;
      __int16 v31 = 2048;
      id v32 = (id)v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Removed existing keychain item for service %@ with result: %ld", buf, 0x16u);
    }
  }
  CFTypeRef v27 = 0;
  OSStatus v24 = SecItemAdd(Mutable, &v27);
  if (v24)
  {
    OSStatus v25 = v24;
    v26 = sub_100005560();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2048;
      id v34 = (id)v25;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "SecItemAdd failed for service %@ & user %@ with result: %ld", buf, 0x20u);
    }
  }
  CFRelease(Mutable);

LABEL_30:
  [a1 restoreKeychainUI];
}

+ (void)removeKeychainItemForService:(id)a3 withUsername:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [a1 hideKeychainUI];
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
    CFDictionaryAddValue(Mutable, kSecAttrAccount, v7);
    CFDictionaryAddValue(Mutable, kSecAttrService, v6);
    CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, @"fmfd_keychain_group");
    OSStatus v9 = SecItemDelete(Mutable);
    if (v9 != -25300 && v9 != 0)
    {
      OSStatus v11 = v9;
      id v12 = sub_100005560();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412802;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v7;
        __int16 v17 = 2048;
        uint64_t v18 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "SecItemDelete failed for service %@ & user %@ with result: %ld", (uint8_t *)&v13, 0x20u);
      }
    }
    CFRelease(Mutable);
  }
  [a1 restoreKeychainUI];
}

@end