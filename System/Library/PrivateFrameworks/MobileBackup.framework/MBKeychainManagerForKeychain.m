@interface MBKeychainManagerForKeychain
+ (BOOL)addKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5;
+ (BOOL)addLocalBackupPassword:(id)a3 error:(id *)a4;
+ (BOOL)addValue:(id)a3 forServiceName:(id)a4 accountName:(id)a5 withAccessibility:(id)a6 error:(id *)a7;
+ (BOOL)removeKeybagSecretForUUID:(id)a3 error:(id *)a4;
+ (BOOL)removeKeybagSecretsWithError:(id *)a3;
+ (BOOL)removeLocalBackupPassword:(id *)a3;
+ (BOOL)removeValueWithServiceName:(id)a3 accountName:(id)a4 error:(id *)a5;
+ (BOOL)removeValueWithServiceName:(id)a3 error:(id *)a4;
+ (BOOL)updateKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5;
+ (BOOL)updateLocalBackupPassword:(id)a3 error:(id *)a4;
+ (BOOL)updateValue:(id)a3 forServiceName:(id)a4 accountName:(id)a5 withAccessibility:(id)a6 error:(id *)a7;
+ (id)fetchKeybagSecretForUUID:(id)a3 error:(id *)a4;
+ (id)fetchLocalBackupPassword:(id *)a3;
+ (id)fetchValueForServiceName:(id)a3 accountName:(id)a4 error:(id *)a5;
@end

@implementation MBKeychainManagerForKeychain

+ (id)fetchValueForServiceName:(id)a3 accountName:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  CFTypeRef result = 0;
  v19[0] = kSecClass;
  v19[1] = kSecAttrService;
  v20[0] = kSecClassGenericPassword;
  v20[1] = v7;
  v19[2] = kSecAttrAccount;
  v19[3] = kSecReturnData;
  v20[2] = v8;
  v20[3] = &__kCFBooleanTrue;
  CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFDictionaryRef v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling SecItemCopyMatching with query: %{public}@", buf, 0xCu);
    _MBLog();
  }

  uint64_t v11 = SecItemCopyMatching(v9, &result);
  if (!v11 && result)
  {
    id v12 = objc_alloc((Class)NSString);
    id v13 = [v12 initWithData:result encoding:4];
    CFRelease(result);
    goto LABEL_16;
  }
  if (v11 == -25308)
  {
    if (a5)
    {
      +[MBError errorWithCode:208, @"Cannot fetch %@:%@ from keychain while device is locked", v7, v8, v15 format];
      goto LABEL_14;
    }
  }
  else if (v11 == -25300)
  {
    if (a5)
    {
      +[MBError errorWithCode:4, @"%@:%@ not found in keychain", v7, v8, v15 format];
LABEL_14:
      id v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else if (a5)
  {
    +[MBError errorWithCode:1, @"Error copying %@:%@ from keychain (%d)", v7, v8, v11 format];
    goto LABEL_14;
  }
  id v13 = 0;
LABEL_16:

  return v13;
}

+ (id)fetchLocalBackupPassword:(id *)a3
{
  return [a1 fetchValueForServiceName:@"BackupAgent" accountName:@"BackupPassword" error:a3];
}

+ (id)fetchKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  v4 = [a1 fetchValueForServiceName:@"BackupKeybagSecret" accountName:a3 error:a4];
  if (v4) {
    id v5 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v4 options:0];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)addValue:(id)a3 forServiceName:(id)a4 accountName:(id)a5 withAccessibility:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23[0] = kSecClass;
  v23[1] = kSecAttrService;
  v24[0] = kSecClassGenericPassword;
  v24[1] = v11;
  v23[2] = kSecAttrAccount;
  v23[3] = kSecAttrAccessible;
  v24[2] = v12;
  v24[3] = v13;
  v24[4] = &__kCFBooleanFalse;
  v23[4] = kSecReturnData;
  v23[5] = kSecValueData;
  v14 = [a3 dataUsingEncoding:4];
  v24[5] = v14;
  CFDictionaryRef v15 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:6];

  v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFDictionaryRef v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Calling SecItemAdd with query: %{public}@", buf, 0xCu);
    _MBLog();
  }

  uint64_t v17 = SecItemAdd(v15, 0);
  int v18 = v17;
  if (v17)
  {
    if (v17 == -25308)
    {
      if (a7)
      {
        +[MBError errorWithCode:208, @"Cannot add %@:%@ while device is locked", v11, v12, v20 format];
LABEL_9:
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a7)
    {
      +[MBError errorWithCode:1, @"Error adding %@:%@ to keychain (%d)", v11, v12, v17 format];
      goto LABEL_9;
    }
  }

  return v18 == 0;
}

+ (BOOL)addLocalBackupPassword:(id)a3 error:(id *)a4
{
  return [a1 addValue:a3 forServiceName:@"BackupAgent" accountName:@"BackupPassword" withAccessibility:kSecAttrAccessibleWhenUnlockedThisDeviceOnly error:a4];
}

+ (BOOL)addKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  CFDictionaryRef v9 = [a3 base64EncodedStringWithOptions:0];
  LOBYTE(a5) = [a1 addValue:v9 forServiceName:@"BackupKeybagSecret" accountName:v8 withAccessibility:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly error:a5];

  return (char)a5;
}

+ (BOOL)updateValue:(id)a3 forServiceName:(id)a4 accountName:(id)a5 withAccessibility:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v29[0] = kSecClass;
  v29[1] = kSecAttrService;
  v30[0] = kSecClassGenericPassword;
  v30[1] = v11;
  v29[2] = kSecAttrAccount;
  v29[3] = kSecReturnData;
  v30[2] = v12;
  v30[3] = &__kCFBooleanFalse;
  id v14 = a3;
  CFDictionaryRef v15 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];
  v27[0] = kSecValueData;
  v16 = [v14 dataUsingEncoding:4];

  v27[1] = kSecAttrAccessible;
  v28[0] = v16;
  v28[1] = v13;
  CFDictionaryRef v17 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  int v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    CFDictionaryRef v24 = v15;
    __int16 v25 = 2114;
    CFDictionaryRef v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling SecItemUpdate with query:%{public}@ attributes:%{public}@", buf, 0x16u);
    _MBLog();
  }

  uint64_t v19 = SecItemUpdate(v15, v17);
  int v20 = v19;
  if (v19)
  {
    if (v19 == -25308)
    {
      if (a7)
      {
        +[MBError errorWithCode:208, @"Cannot update %@:%@ while device is locked", v11, v12, v22 format];
LABEL_9:
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a7)
    {
      +[MBError errorWithCode:1, @"Error updating %@:%@ in keychain (%d)", v11, v12, v19 format];
      goto LABEL_9;
    }
  }

  return v20 == 0;
}

+ (BOOL)updateLocalBackupPassword:(id)a3 error:(id *)a4
{
  return [a1 updateValue:a3 forServiceName:@"BackupAgent" accountName:@"BackupPassword" withAccessibility:kSecAttrAccessibleWhenUnlockedThisDeviceOnly error:a4];
}

+ (BOOL)updateKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  CFDictionaryRef v9 = [a3 base64EncodedStringWithOptions:0];
  LOBYTE(a5) = [a1 updateValue:v9 forServiceName:@"BackupKeybagSecret" accountName:v8 withAccessibility:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly error:a5];

  return (char)a5;
}

+ (BOOL)removeValueWithServiceName:(id)a3 accountName:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v17[0] = kSecClass;
  v17[1] = kSecAttrService;
  v18[0] = kSecClassGenericPassword;
  v18[1] = v7;
  v17[2] = kSecAttrAccount;
  v17[3] = kSecReturnData;
  v18[2] = v8;
  v18[3] = &__kCFBooleanFalse;
  CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFDictionaryRef v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling SecItemDelete with query:%{public}@", buf, 0xCu);
    _MBLog();
  }

  uint64_t v11 = SecItemDelete(v9);
  int v12 = v11;
  if (v11)
  {
    if (v11 == -25308)
    {
      if (a5)
      {
        +[MBError errorWithCode:208, @"Cannot remove %@:%@ while device is locked", v7, v8, v14 format];
LABEL_9:
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a5)
    {
      +[MBError errorWithCode:1, @"Error removing %@:%@ from keychain (%d)", v7, v8, v11 format];
      goto LABEL_9;
    }
  }

  return v12 == 0;
}

+ (BOOL)removeValueWithServiceName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v14[0] = kSecClass;
  v14[1] = kSecAttrService;
  v15[0] = kSecClassGenericPassword;
  v15[1] = v5;
  v14[2] = kSecReturnData;
  v15[2] = &__kCFBooleanFalse;
  CFDictionaryRef v6 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFDictionaryRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Calling SecItemDelete without accountName for query:%{public}@", buf, 0xCu);
    _MBLog();
  }

  uint64_t v8 = SecItemDelete(v6);
  int v9 = v8;
  if (v8)
  {
    if (v8 == -25308)
    {
      if (a4)
      {
        +[MBError errorWithCode:208, @"Cannot remove %@ while device is locked", v5, v11 format];
LABEL_9:
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a4)
    {
      +[MBError errorWithCode:1, @"Error removing %@ from keychain (%d)", v5, v8 format];
      goto LABEL_9;
    }
  }

  return v9 == 0;
}

+ (BOOL)removeLocalBackupPassword:(id *)a3
{
  return _[a1 removeValueWithServiceName:@"BackupAgent" accountName:@"BackupPassword" error:a3];
}

+ (BOOL)removeKeybagSecretsWithError:(id *)a3
{
  return _[a1 removeValueWithServiceName:@"BackupKeybagSecret" error:a3];
}

+ (BOOL)removeKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  return _[a1 removeValueWithServiceName:@"BackupKeybagSecret" accountName:a3 error:a4];
}

@end