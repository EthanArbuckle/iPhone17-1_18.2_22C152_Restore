@interface KeychainWrapper
- (KeychainWrapper)init;
- (NSMutableDictionary)genericPasswordQuery;
- (NSMutableDictionary)keychainData;
- (NSString)personId;
- (id)dictionaryToSecItemFormat:(id)a3;
- (id)myObjectForKey:(id)a3;
- (id)secItemFormatToDictionary:(id)a3;
- (void)mySetObject:(id)a3 forKey:(id)a4;
- (void)resetKeychainItem;
- (void)setGenericPasswordQuery:(id)a3;
- (void)setKeychainData:(id)a3;
- (void)setPersonId:(id)a3;
- (void)writeToKeychain;
@end

@implementation KeychainWrapper

- (KeychainWrapper)init
{
  v11.receiver = self;
  v11.super_class = (Class)KeychainWrapper;
  v2 = [(KeychainWrapper *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    genericPasswordQuery = v2->genericPasswordQuery;
    v2->genericPasswordQuery = v3;

    [(NSMutableDictionary *)v2->genericPasswordQuery setObject:kSecClassGenericPassword forKey:kSecClass];
    v5 = +[NSData dataWithBytes:"com.apple.podcasts.accountId" length:28];
    [(NSMutableDictionary *)v2->genericPasswordQuery setObject:v5 forKey:kSecAttrGeneric];
    [(NSMutableDictionary *)v2->genericPasswordQuery setObject:kSecMatchLimitOne forKey:kSecMatchLimit];
    [(NSMutableDictionary *)v2->genericPasswordQuery setObject:kCFBooleanTrue forKey:kSecAttrSynchronizable];
    [(NSMutableDictionary *)v2->genericPasswordQuery setObject:kCFBooleanTrue forKey:kSecReturnAttributes];
    CFTypeRef result = 0;
    OSStatus v6 = SecItemCopyMatching((CFDictionaryRef)v2->genericPasswordQuery, &result);
    if (v6 == -25300)
    {
      [(KeychainWrapper *)v2 resetKeychainItem];
    }
    else if (!v6)
    {
      v7 = (void *)result;
      v8 = [(KeychainWrapper *)v2 secItemFormatToDictionary:result];
      [(KeychainWrapper *)v2 setKeychainData:v8];

LABEL_8:
      return v2;
    }
    if (result) {
      CFRelease(result);
    }
    goto LABEL_8;
  }
  return v2;
}

- (void)mySetObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    v7 = [(NSMutableDictionary *)self->keychainData objectForKey:v6];
    if (([v7 isEqual:v8] & 1) == 0)
    {
      [(NSMutableDictionary *)self->keychainData setObject:v8 forKey:v6];
      [(KeychainWrapper *)self writeToKeychain];
    }
  }
}

- (id)myObjectForKey:(id)a3
{
  return [(NSMutableDictionary *)self->keychainData objectForKey:a3];
}

- (void)setPersonId:(id)a3
{
  if (a3)
  {
    -[KeychainWrapper mySetObject:forKey:](self, "mySetObject:forKey:");
  }
  else
  {
    [(KeychainWrapper *)self resetKeychainItem];
    [(KeychainWrapper *)self writeToKeychain];
  }
}

- (NSString)personId
{
  return (NSString *)[(KeychainWrapper *)self myObjectForKey:kSecValueData];
}

- (void)resetKeychainItem
{
  if (self->keychainData)
  {
    -[KeychainWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:");
    CFDictionaryRef v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    OSStatus v4 = SecItemDelete(v3);
    v5 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "problem deleting current keychain item (%li).", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    CFDictionaryRef v3 = (const __CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(KeychainWrapper *)self setKeychainData:v3];
  }

  [(NSMutableDictionary *)self->keychainData setObject:@"Podcasts Account Identity" forKey:kSecAttrLabel];
  [(NSMutableDictionary *)self->keychainData setObject:@"Podcasts Account Identity" forKey:kSecAttrDescription];
  [(NSMutableDictionary *)self->keychainData setObject:@"accountId" forKey:kSecAttrAccount];
  [(NSMutableDictionary *)self->keychainData setObject:@"com.apple.podcasts" forKey:kSecAttrService];
  [(NSMutableDictionary *)self->keychainData setObject:&stru_10056A8A0 forKey:kSecValueData];
  [(NSMutableDictionary *)self->keychainData setObject:kCFBooleanTrue forKey:kSecAttrSynchronizable];
  [(NSMutableDictionary *)self->keychainData setObject:kCFBooleanTrue forKey:kSecAttrIsInvisible];
}

- (id)dictionaryToSecItemFormat:(id)a3
{
  id v3 = a3;
  OSStatus v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];
  v5 = +[NSData dataWithBytes:"com.apple.podcasts.accountId" length:28];
  [v4 setObject:v5 forKey:kSecAttrGeneric];
  [v4 setObject:kSecClassGenericPassword forKey:kSecClass];
  int v6 = [v3 objectForKey:kSecValueData];

  uint64_t v7 = &stru_10056A8A0;
  if (v6) {
    uint64_t v7 = v6;
  }
  id v8 = v7;

  v9 = [(__CFString *)v8 dataUsingEncoding:4];

  [v4 setObject:v9 forKey:kSecValueData];

  return v4;
}

- (id)secItemFormatToDictionary:(id)a3
{
  id v3 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  [v3 setObject:kCFBooleanTrue forKey:kSecReturnData];
  [v3 setObject:kSecClassGenericPassword forKey:kSecClass];
  CFTypeRef result = 0;
  if (SecItemCopyMatching((CFDictionaryRef)v3, &result))
  {
    if (result) {
      CFRelease(result);
    }
  }
  else
  {
    [v3 removeObjectForKey:kSecReturnData];
    id v4 = objc_alloc((Class)NSString);
    v5 = (id) result;
    id v6 = [v5 bytes];
    id v7 = [v4 initWithBytes:v6 length:[result length] encoding:4];

    [v3 setObject:v7 forKey:kSecValueData];
  }

  return v3;
}

- (void)writeToKeychain
{
  CFTypeRef result = 0;
  NSLog(@"genericPasswordQuery: %@", a2, self->genericPasswordQuery);
  id v3 = [(KeychainWrapper *)self dictionaryToSecItemFormat:self->keychainData];
  NSLog(@"secItemFormat: %@", v3);

  if (SecItemCopyMatching((CFDictionaryRef)self->genericPasswordQuery, &result))
  {
    if (SecItemAdd((CFDictionaryRef)[(KeychainWrapper *)self dictionaryToSecItemFormat:self->keychainData], 0))
    {
      id v4 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Couldn't add the Keychain Item.", buf, 2u);
      }
    }
    if (result) {
      CFRelease(result);
    }
  }
  else
  {
    v5 = (void *)result;
    id v6 = +[NSMutableDictionary dictionaryWithDictionary:result];

    id v7 = [(NSMutableDictionary *)self->genericPasswordQuery objectForKey:kSecClass];
    [v6 setObject:v7 forKey:kSecClass];

    id v8 = [(KeychainWrapper *)self dictionaryToSecItemFormat:self->keychainData];
    [v8 removeObjectForKey:kSecClass];
    if (SecItemUpdate((CFDictionaryRef)v6, (CFDictionaryRef)v8))
    {
      v9 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)objc_super v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Couldn't update the Keychain Item.", v11, 2u);
      }
    }
  }
}

- (NSMutableDictionary)keychainData
{
  return self->keychainData;
}

- (void)setKeychainData:(id)a3
{
}

- (NSMutableDictionary)genericPasswordQuery
{
  return self->genericPasswordQuery;
}

- (void)setGenericPasswordQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->genericPasswordQuery, 0);

  objc_storeStrong((id *)&self->keychainData, 0);
}

@end