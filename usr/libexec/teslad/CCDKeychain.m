@interface CCDKeychain
+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 outError:(id *)a12;
+ (__CFDictionary)_newQueryWithService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9;
+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9;
+ (id)dataFromString:(id)a3;
@end

@implementation CCDKeychain

+ (id)dataFromString:(id)a3
{
  return [a3 dataUsingEncoding:4];
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  id v19 = 0;
  v9 = +[CCDKeychain _newQueryWithService:a3 account:a4 label:a5 description:a6 group:a7 useSystemKeychain:a8 outError:&v19];
  id v10 = v19;
  if (v10)
  {
    v11 = v10;
    if (v9) {
      CFRelease(v9);
    }
    goto LABEL_4;
  }
  CFDictionaryAddValue(v9, kSecReturnData, kCFBooleanTrue);
  *(void *)buf = 0;
  uint64_t v14 = SecItemCopyMatching(v9, (CFTypeRef *)buf);
  CFRelease(v9);
  if (v14) {
    BOOL v15 = v14 == -25300;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    v17 = +[NSString stringWithFormat:@"%d", v14];
    v18 = DEPErrorArray();
    v11 = +[NSError DEPErrorWithDomain:@"CCDKeychainErrorDomain", 6000, v18, DEPErrorTypeFatal, v17, 0 code descriptionArray errorType];

    if (!v11)
    {
LABEL_9:
      v13 = 0;
      goto LABEL_16;
    }
LABEL_4:
    if (a9) {
      *a9 = v11;
    }
    v12 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Cannot retrieve item from keychain. Error: %{public}@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  v13 = *(void **)buf;
LABEL_16:

  return v13;
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 outError:(id *)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  v39 = v19;
  if ([v17 length])
  {
    value = v17;
    id v40 = 0;
    v23 = +[CCDKeychain _newQueryWithService:v18 account:v19 label:v20 description:v21 group:v22 useSystemKeychain:a10 outError:&v40];
    id v24 = v40;
    if (v24)
    {
      v25 = v24;
      if (v23) {
        CFRelease(v23);
      }
      id v17 = value;
      goto LABEL_7;
    }
    id v37 = v18;
    v30 = +[CCDKeychain dataFromService:v18 account:v19 label:v20 description:v21 group:v22 useSystemKeychain:a10 outError:0];
    v31 = v30;
    if (v30)
    {
      if ([v30 isEqualToData:value])
      {
        CFRelease(v23);
        v25 = 0;
        id v17 = value;
        goto LABEL_21;
      }
      v43[0] = kSecValueData;
      v43[1] = kSecAttrAccessible;
      v44[0] = value;
      v44[1] = a8;
      CFDictionaryRef v33 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
      uint64_t v32 = SecItemUpdate(v23, v33);
    }
    else
    {
      CFDictionaryAddValue(v23, kSecValueData, value);
      CFDictionaryAddValue(v23, kSecAttrAccessible, a8);
      CFDictionaryAddValue(v23, kSecAttrSysBound, &__kCFBooleanTrue);
      uint64_t v32 = SecItemAdd(v23, 0);
    }
    CFRelease(v23);
    if (v32)
    {
      v36 = +[NSString stringWithFormat:@"%d", v32];
      v34 = DEPErrorArray();

      v25 = +[NSError DEPErrorWithDomain:@"CCDKeychainErrorDomain", 6000, v34, DEPErrorTypeFatal, v36, 0 code descriptionArray errorType];
    }
    else
    {
      v25 = 0;
    }
    id v17 = value;
LABEL_21:

    id v18 = v37;
    if (!v25) {
      goto LABEL_22;
    }
    goto LABEL_7;
  }
  DEPErrorArray();
  v27 = id v26 = v18;
  v25 = +[NSError DEPErrorWithDomain:@"CCDKeychainErrorDomain", 6001, v27, DEPErrorTypeFatal, 0 code descriptionArray errorType];

  id v18 = v26;
  if (!v25)
  {
LABEL_22:
    BOOL v29 = 1;
    goto LABEL_23;
  }
LABEL_7:
  if (a12) {
    *a12 = v25;
  }
  v28 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v25;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to set data in keychain. Error: %{public}@", buf, 0xCu);
  }

  BOOL v29 = 0;
LABEL_23:

  return v29;
}

+ (__CFDictionary)_newQueryWithService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if ([v14 length])
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
    CFDictionaryAddValue(Mutable, kSecAttrService, v14);
    if ([v15 length]) {
      CFDictionaryAddValue(Mutable, kSecAttrAccount, v15);
    }
    if ([v16 length]) {
      CFDictionaryAddValue(Mutable, kSecAttrLabel, v16);
    }
    if ([v17 length]) {
      CFDictionaryAddValue(Mutable, kSecAttrDescription, v17);
    }
    if ([v18 length]) {
      CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, v18);
    }
    if (v9) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, &__kCFBooleanTrue);
    }
  }
  else
  {
    if (a9)
    {
      id v20 = DEPErrorArray();
      *a9 = +[NSError DEPErrorWithDomain:@"CCDKeychainErrorDomain", 6002, v20, DEPErrorTypeFatal, 0 code descriptionArray errorType];
    }
    Mutable = 0;
  }

  return Mutable;
}

@end