@interface SMBClientdKeychainUtilities
+ (BOOL)addItem:(id)a3 forIdentifier:(id)a4 error:(id *)a5;
+ (BOOL)removeItemForIdentifier:(id)a3 error:(id *)a4;
+ (id)defaultItemAttributesWithIdentifier:(id)a3;
+ (id)getItemForIdentifier:(id)a3 error:(id *)a4;
@end

@implementation SMBClientdKeychainUtilities

+ (id)defaultItemAttributesWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v4) {
    sub_100059278(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  v15[0] = kSecClass;
  v15[1] = kSecUseDataProtectionKeychain;
  v16[0] = kSecClassGenericPassword;
  v16[1] = &__kCFBooleanTrue;
  v15[2] = kSecAttrIsInvisible;
  v15[3] = kSecAttrService;
  v16[2] = &__kCFBooleanTrue;
  v16[3] = @"com.apple.filesystems.smbclientd";
  v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  id v13 = [v12 mutableCopy];

  if (v3) {
    [v13 setObject:v3 forKeyedSubscript:kSecAttrAccount];
  }

  return v13;
}

+ (BOOL)addItem:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  CFDictionaryRef v8 = +[SMBClientdKeychainUtilities defaultItemAttributesWithIdentifier:a4];
  uint64_t v9 = objc_opt_new();
  [v9 setObject:v7 forKeyedSubscript:kSecValueData];

  [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecAttrSynchronizable];
  OSStatus v10 = SecItemUpdate(v8, (CFDictionaryRef)v9);
  if (v10 == -25300)
  {
    [(__CFDictionary *)v8 addEntriesFromDictionary:v9];
    OSStatus v10 = SecItemAdd(v8, 0);
  }
  if (a5)
  {
    *a5 = 0;
    if (v10)
    {
      +[NSError errorWithDomain:NSOSStatusErrorDomain code:v10 userInfo:0];
      BOOL v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = v10 == 0;
  }

  return v11;
}

+ (id)getItemForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5 = +[SMBClientdKeychainUtilities defaultItemAttributesWithIdentifier:a3];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
  [v5 setObject:kSecMatchLimitOne forKeyedSubscript:kSecMatchLimit];
  CFTypeRef result = 0;
  if (a4)
  {
    *a4 = 0;
    OSStatus v6 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
    if (v6)
    {
      +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else if (SecItemCopyMatching((CFDictionaryRef)v5, &result))
  {
    id v7 = 0;
    goto LABEL_7;
  }
  id v7 = (void *)result;
LABEL_7:

  return v7;
}

+ (BOOL)removeItemForIdentifier:(id)a3 error:(id *)a4
{
  CFDictionaryRef v5 = +[SMBClientdKeychainUtilities defaultItemAttributesWithIdentifier:a3];
  OSStatus v6 = SecItemDelete(v5);
  if (a4)
  {
    *a4 = 0;
    if (v6)
    {
      +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = v6 == 0;
  }

  return v7;
}

@end