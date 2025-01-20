@interface RDKeychainStore
- (BOOL)addToKeychainKey:(id)a3 withName:(id)a4 sensor:(id)a5;
- (BOOL)removeFromKeychain:(id)a3;
- (id)keyDataFromKeyChainWithName:(id)a3;
- (id)keyNamesForSensor:(id)a3;
@end

@implementation RDKeychainStore

- (BOOL)addToKeychainKey:(id)a3 withName:(id)a4 sensor:(id)a5
{
  v14[0] = kSecValueData;
  v14[1] = kSecAttrAccount;
  v15[0] = a3;
  v15[1] = a4;
  v14[2] = kSecAttrService;
  v14[3] = kSecClass;
  v15[2] = a5;
  v15[3] = kSecClassGenericPassword;
  OSStatus v6 = SecItemAdd((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4], 0);
  if (!v6) {
    goto LABEL_5;
  }
  OSStatus v7 = v6;
  if (v6 == -25299)
  {
    if (qword_10006EAF8 == -1)
    {
      v8 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:
        LOBYTE(v9) = 1;
        return v9;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      v8 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_5;
      }
    }
    int v12 = 138543362;
    v13 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Key for %{public}@ already in keychain", (uint8_t *)&v12, 0xCu);
    LOBYTE(v9) = 1;
    return v9;
  }
  if (qword_10006EAF8 == -1)
  {
    v10 = qword_10006EB00;
    BOOL v9 = os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR);
    if (!v9) {
      return v9;
    }
  }
  else
  {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
    v10 = qword_10006EB00;
    BOOL v9 = os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR);
    if (!v9) {
      return v9;
    }
  }
  int v12 = 138543362;
  v13 = (void *)SecCopyErrorMessageString(v7, 0);
  _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to store key in the keychain. %{public}@", (uint8_t *)&v12, 0xCu);
  LOBYTE(v9) = 0;
  return v9;
}

- (id)keyDataFromKeyChainWithName:(id)a3
{
  v14[0] = kSecClass;
  v14[1] = kSecMatchLimit;
  v15[0] = kSecClassGenericPassword;
  v15[1] = kSecMatchLimitOne;
  v14[2] = kSecAttrAccount;
  v14[3] = kSecReturnData;
  v15[2] = a3;
  v15[3] = &__kCFBooleanTrue;
  CFTypeRef result = 0;
  OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4], &result);
  if (v4)
  {
    OSStatus v5 = v4;
    if (qword_10006EAF8 == -1)
    {
      OSStatus v6 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      OSStatus v6 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
    }
    CFStringRef v7 = SecCopyErrorMessageString(v5, 0);
    *(_DWORD *)buf = 138543618;
    id v11 = a3;
    __int16 v12 = 2114;
    CFStringRef v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to find key matching %{public}@. %{public}@", buf, 0x16u);
    return 0;
  }
  return (id)(id)result;
}

- (BOOL)removeFromKeychain:(id)a3
{
  v14[0] = kSecClass;
  v14[1] = kSecAttrAccount;
  v15[0] = kSecClassGenericPassword;
  v15[1] = a3;
  OSStatus v4 = SecItemDelete((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2]);
  if (!v4) {
    return 1;
  }
  OSStatus v5 = v4;
  if (v4 != -25300)
  {
    if (qword_10006EAF8 == -1)
    {
      v8 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      v8 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    int v10 = 138543618;
    id v11 = a3;
    __int16 v12 = 2114;
    CFStringRef v13 = SecCopyErrorMessageString(v5, 0);
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to find key matching %{public}@. %{public}@", (uint8_t *)&v10, 0x16u);
    return 0;
  }
  if (qword_10006EAF8 != -1) {
    dispatch_once(&qword_10006EAF8, &stru_10005CE88);
  }
  OSStatus v6 = qword_10006EB00;
  BOOL v7 = 1;
  if (os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    id v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Key %{public}@ not found in keychain", (uint8_t *)&v10, 0xCu);
  }
  return v7;
}

- (id)keyNamesForSensor:(id)a3
{
  v28[0] = kSecClass;
  v28[1] = kSecMatchLimit;
  v29[0] = kSecClassGenericPassword;
  v29[1] = kSecMatchLimitAll;
  v28[2] = kSecAttrService;
  v28[3] = kSecReturnAttributes;
  v29[2] = a3;
  v29[3] = &__kCFBooleanTrue;
  CFTypeRef result = 0;
  OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4], &result);
  if (v4)
  {
    OSStatus v5 = v4;
    if (v4 == -25300)
    {
      if (qword_10006EAF8 == -1)
      {
        OSStatus v6 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
          return &__NSArray0__struct;
        }
      }
      else
      {
        dispatch_once(&qword_10006EAF8, &stru_10005CE88);
        OSStatus v6 = qword_10006EB00;
        if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_INFO)) {
          return &__NSArray0__struct;
        }
      }
      *(_DWORD *)buf = 138543362;
      CFTypeID v25 = (CFTypeID)a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "No keys found for sensor %{public}@", buf, 0xCu);
      return &__NSArray0__struct;
    }
    if (qword_10006EAF8 == -1)
    {
      v14 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return &__NSArray0__struct;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      v14 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return &__NSArray0__struct;
      }
    }
    CFStringRef v15 = SecCopyErrorMessageString(v5, 0);
    *(_DWORD *)buf = 138543618;
    CFTypeID v25 = (CFTypeID)a3;
    __int16 v26 = 2114;
    id v27 = (id)v15;
    v16 = "Failed to find keys for sensor %{public}@ because %{public}@";
LABEL_27:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
    return &__NSArray0__struct;
  }
  CFTypeID v7 = CFGetTypeID(result);
  if (v7 != CFArrayGetTypeID())
  {
    CFRelease(result);
    if (qword_10006EAF8 == -1)
    {
      v14 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return &__NSArray0__struct;
      }
    }
    else
    {
      dispatch_once(&qword_10006EAF8, &stru_10005CE88);
      v14 = qword_10006EB00;
      if (!os_log_type_enabled((os_log_t)qword_10006EB00, OS_LOG_TYPE_ERROR)) {
        return &__NSArray0__struct;
      }
    }
    *(_DWORD *)buf = 134218242;
    CFTypeID v25 = v7;
    __int16 v26 = 2114;
    id v27 = a3;
    v16 = "Expecting CFArrayTypeID but got %lu when searching for keys for %{public}@";
    goto LABEL_27;
  }
  v8 = (id)result;
  BOOL v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        -[NSMutableArray addObject:](v9, "addObject:", [*(id *)(*((void *)&v18 + 1) + 8 * i) objectForKeyedSubscript:kSecAttrAccount]);
      }
      id v11 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v11);
  }
  return +[NSArray arrayWithArray:v9];
}

@end