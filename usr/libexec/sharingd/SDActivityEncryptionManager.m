@interface SDActivityEncryptionManager
+ (id)sharedEncryptionManager;
- (BOOL)deleteAllEncryptionAndDecryptionKeys;
- (BOOL)saveDecryptionKeyDataRepresentation:(id)a3 forDeviceIdentifier:(id)a4;
- (BOOL)saveEncryptionKeyDataRepresentation:(id)a3;
- (BOOL)saveKeyDataRepresentation:(id)a3 withBaseDict:(id)a4;
- (NSData)dataRepresentationForCurrentEncryptionKey;
- (NSString)state;
- (SDActivityEncryptionKey)encryptionKey;
- (SDActivityEncryptionManager)init;
- (id)allKeys;
- (id)baseDict;
- (id)baseDictDecryptionKeyForDeviceIdentifier:(id)a3;
- (id)baseDictEncryptionKey;
- (id)baseDictWrappingKey;
- (id)cachedDecryptionKeyForDeviceIdentifier:(id)a3;
- (id)decryptionKeyForDeviceIdentifier:(id)a3;
- (id)loadDecryptionKeyDataRepresentationForDeviceIdentifier:(id)a3;
- (id)loadEncryptionKeyDataRepresentation;
- (id)loadKeyDataRepresentationWithBaseDict:(id)a3;
- (id)loadWrappingKeyData;
- (id)newDecryptionKeyFromDataRepresentation:(id)a3;
- (id)unwrappedDataRepresentationForKey:(id)a3;
- (void)addObservers;
- (void)bumpEncryptionKeyCounterValue;
- (void)dealloc;
- (void)generateNewEncryptionKey;
- (void)getTagAndCounterWhileEncryptingBytesInPlace:(unsigned __int8)a3[10] forAdvertisementWithVersion:(unsigned __int8)a4 handler:(id)a5;
- (void)removeObservers;
- (void)setDecryptionKey:(id)a3 forDeviceIdentifier:(id)a4;
@end

@implementation SDActivityEncryptionManager

+ (id)sharedEncryptionManager
{
  if (qword_100980110 != -1) {
    dispatch_once(&qword_100980110, &stru_1008CEE38);
  }
  v2 = (void *)qword_100980108;

  return v2;
}

- (SDActivityEncryptionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDActivityEncryptionManager;
  v2 = [(SDActivityEncryptionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    deviceIdentifierToDecryptionKey = v2->_deviceIdentifierToDecryptionKey;
    v2->_deviceIdentifierToDecryptionKey = (NSMutableDictionary *)v3;

    v2->_shouldRefreshWrappingKey = 1;
    [(SDActivityEncryptionManager *)v2 addObservers];
  }
  return v2;
}

- (void)dealloc
{
  [(SDActivityEncryptionManager *)self removeObservers];
  v3.receiver = self;
  v3.super_class = (Class)SDActivityEncryptionManager;
  [(SDActivityEncryptionManager *)&v3 dealloc];
}

- (NSString)state
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v4 = 0;

  NSAppendPrintF();
  id v5 = v4;

  CFStringRef v6 = @"YES";
  if (self->_wrappingKey) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  if (!self->_shouldRefreshWrappingKey) {
    CFStringRef v6 = @"NO";
  }
  CFStringRef v18 = v7;
  CFStringRef v20 = v6;
  NSAppendPrintF();
  id v8 = v5;

  v9 = [(SDActivityEncryptionManager *)self allKeys];
  v10 = +[NSString stringWithFormat:@"@unionOfObjects.%@", kSecAttrLabel];
  v11 = [v9 valueForKeyPath:v10];
  v19 = SFCompactStringFromCollection();
  NSAppendPrintF();
  id v12 = v8;

  v13 = [(SDActivityEncryptionManager *)self encryptionKey];
  NSAppendPrintF();
  id v14 = v12;

  NSAppendPrintF();
  id v15 = v14;

  return (NSString *)v15;
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"resetStateRequested:" name:@"com.apple.sharingd.ResetState" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)generateNewEncryptionKey
{
  id v3 = +[SDActivityEncryptionKey newEncryptionKey];
  p_encryptionKey = (uint64_t *)&self->_encryptionKey;
  encryptionKey = self->_encryptionKey;
  self->_encryptionKey = v3;

  CFStringRef v6 = [(SDActivityEncryptionManager *)self unwrappedDataRepresentationForKey:self->_encryptionKey];
  [(SDActivityEncryptionManager *)self saveEncryptionKeyDataRepresentation:v6];

  CFStringRef v7 = handoff_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100178174(p_encryptionKey, v7);
  }
}

- (SDActivityEncryptionKey)encryptionKey
{
  encryptionKey = self->_encryptionKey;
  if (!encryptionKey)
  {
    id v4 = [(SDActivityEncryptionManager *)self loadEncryptionKeyDataRepresentation];
    if (v4)
    {
      id v19 = 0;
      uint64_t v20 = 0;
      id v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:1 format:&v20 error:&v19];
      id v6 = v19;
      if (v5)
      {
        CFStringRef v7 = [v5 objectForKeyedSubscript:@"lastUsedCounter"];
        unsigned __int16 v8 = (unsigned __int16)[v7 integerValue];

        int v9 = v8;
        if (v8 > 0xFF90u)
        {
          id v14 = handoff_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Did not load advertising encryption key from keychain as the bumped last used counter exceeds max value", buf, 2u);
          }
        }
        else
        {
          v10 = +[NSNumber numberWithInteger:v8 + 110];
          [v5 setObject:v10 forKeyedSubscript:@"lastUsedCounter"];

          v11 = [(SDActivityKey *)[SDActivityEncryptionKey alloc] initWithDictRepresentation:v5];
          id v12 = self->_encryptionKey;
          self->_encryptionKey = v11;

          v13 = [(SDActivityEncryptionManager *)self unwrappedDataRepresentationForKey:self->_encryptionKey];
          [(SDActivityEncryptionManager *)self saveEncryptionKeyDataRepresentation:v13];

          id v14 = handoff_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            id v15 = (objc_class *)objc_opt_class();
            v16 = NSStringFromClass(v15);
            v17 = self->_encryptionKey;
            *(_DWORD *)buf = 138413058;
            v22 = v16;
            __int16 v23 = 1024;
            int v24 = v9;
            __int16 v25 = 1024;
            int v26 = 110;
            __int16 v27 = 2112;
            v28 = v17;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@: Loaded advertising encryption key and bumped last used counter from %d by %d, then persisted key to keychain %@", buf, 0x22u);
          }
        }
      }
      else
      {
        id v14 = handoff_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1001781F0((uint64_t)v6, v14);
        }
      }
    }
    if (!self->_encryptionKey) {
      [(SDActivityEncryptionManager *)self generateNewEncryptionKey];
    }

    encryptionKey = self->_encryptionKey;
  }

  return encryptionKey;
}

- (void)bumpEncryptionKeyCounterValue
{
  uint32_t v3 = arc4random();
  id v4 = [(SDActivityEncryptionManager *)self encryptionKey];
  uint64_t v5 = v3 + [v4 lastUsedCounter] - 31 * (v3 / 0x1F) + 20;

  id v6 = handoff_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 > 0xFFFE)
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Generating new advertising encryption key as the bumped value of the old one exceeds max value", (uint8_t *)&v10, 2u);
    }

    [(SDActivityEncryptionManager *)self generateNewEncryptionKey];
  }
  else
  {
    if (v7)
    {
      unsigned __int16 v8 = [(SDActivityEncryptionManager *)self encryptionKey];
      int v10 = 134218240;
      uint64_t v11 = [v8 lastUsedCounter];
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bumped advertising encryption key counter value from %ld to %ld", (uint8_t *)&v10, 0x16u);
    }
    int v9 = [(SDActivityEncryptionManager *)self encryptionKey];
    [v9 setLastUsedCounter:(unsigned __int16)v5];
  }
}

- (void)getTagAndCounterWhileEncryptingBytesInPlace:(unsigned __int8)a3[10] forAdvertisementWithVersion:(unsigned __int8)a4 handler:(id)a5
{
  uint64_t v5 = a4;
  unsigned __int16 v8 = (void (**)(id, id, _WORD *, id))a5;
  int v9 = [(SDActivityEncryptionManager *)self encryptionKey];
  [v9 prepareForNewEncryptionRequest];

  int v10 = [(SDActivityEncryptionManager *)self encryptionKey];
  unsigned __int8 v11 = [v10 isValidKey];

  if ((v11 & 1) == 0)
  {
    __int16 v12 = handoff_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100178320(self, v12);
    }

    [(SDActivityEncryptionManager *)self generateNewEncryptionKey];
  }
  __int16 v21 = 0;
  uint64_t v13 = [(SDActivityEncryptionManager *)self encryptionKey];
  id v14 = [(id)v13 getTagWhileEncryptingBytesInPlace:a3 counterValue:&v21 forAdvertisementWithVersion:v5];

  id v15 = [(SDActivityEncryptionManager *)self encryptionKey];
  LODWORD(v13) = [v15 lastUsedCounter] + 10;

  HIDWORD(v16) = -1030792151 * v13;
  LODWORD(v16) = -1030792151 * v13;
  if ((v16 >> 2) <= 0x28F5C28)
  {
    v17 = [(SDActivityEncryptionManager *)self encryptionKey];
    CFStringRef v18 = [(SDActivityEncryptionManager *)self unwrappedDataRepresentationForKey:v17];
    [(SDActivityEncryptionManager *)self saveEncryptionKeyDataRepresentation:v18];

    id v19 = handoff_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100178268(self, v19);
    }
  }
  uint64_t v20 = [(SDActivityEncryptionManager *)self encryptionKey];
  v8[2](v8, v14, &v21, [v20 lastUsedCounter]);
}

- (void)setDecryptionKey:(id)a3 forDeviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    unsigned __int16 v8 = [(NSMutableDictionary *)self->_deviceIdentifierToDecryptionKey objectForKeyedSubscript:v7];
    if (v8)
    {
      int v9 = [v6 dateCreated];
      int v10 = [v8 dateCreated];
      [v9 timeIntervalSinceDate:v10];
      uint64_t v12 = (uint64_t)(v11 / 3600.0);
    }
    else
    {
      uint64_t v12 = 0;
    }
    sub_1000C9F88(v8 != 0, [v8 lastUsedCounter], [v6 lastUsedCounter], v12);
    [(NSMutableDictionary *)self->_deviceIdentifierToDecryptionKey setObject:v6 forKeyedSubscript:v7];
    uint64_t v13 = [(SDActivityEncryptionManager *)self unwrappedDataRepresentationForKey:v6];
    unsigned int v14 = [(SDActivityEncryptionManager *)self saveDecryptionKeyDataRepresentation:v13 forDeviceIdentifier:v7];

    id v15 = handoff_log();
    unint64_t v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1001783D8();
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      sub_100178440();
    }
  }
}

- (id)decryptionKeyForDeviceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_deviceIdentifierToDecryptionKey objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = [(SDActivityEncryptionManager *)self loadDecryptionKeyDataRepresentationForDeviceIdentifier:v4];
    id v5 = [(SDActivityEncryptionManager *)self newDecryptionKeyFromDataRepresentation:v6];

    if (v5)
    {
      id v7 = handoff_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_1001784A8();
      }

      [(NSMutableDictionary *)self->_deviceIdentifierToDecryptionKey setObject:v5 forKeyedSubscript:v4];
    }
  }

  return v5;
}

- (id)cachedDecryptionKeyForDeviceIdentifier:(id)a3
{
  return [(NSMutableDictionary *)self->_deviceIdentifierToDecryptionKey objectForKeyedSubscript:a3];
}

- (NSData)dataRepresentationForCurrentEncryptionKey
{
  uint32_t v3 = [(SDActivityEncryptionManager *)self encryptionKey];
  id v4 = [v3 dictRepresentation];
  id v5 = [v4 mutableCopy];

  id v6 = [v5 objectForKeyedSubscript:@"keyData"];
  if (v6)
  {
    id v7 = [(SDActivityEncryptionManager *)self loadWrappingKeyData];
    id v8 = [v7 length];
    int v9 = handoff_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Converting key to wrapped key", buf, 2u);
      }

      double v11 = (void *)ccaes_ecb_encrypt_mode();
      bzero((char *)&v20 - ((*v11 + 15) & 0xFFFFFFFFFFFFFFF0), (*v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      [v7 length];
      [v7 bytes];
      ccecb_init();
      [v6 length];
      uint64_t v12 = ccwrap_wrapped_size();
      uint64_t v13 = +[NSMutableData dataWithCapacity:v12];
      [v13 setLength:v12];
      *(void *)buf = v12;
      [v6 length];
      [v6 bytes];
      id v14 = v13;
      [v14 mutableBytes];
      ccwrap_auth_encrypt();
      id v15 = [v14 copy];
      [v5 setObject:v15 forKeyedSubscript:@"keyData"];

      [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isWrappedKey"];
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not wrapping key as wrapping key is unavailable", buf, 2u);
      }

      [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isWrappedKey"];
    }
    id v21 = 0;
    unint64_t v16 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:&v21];
    id v17 = v21;
    if (!v16)
    {
      CFStringRef v18 = handoff_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100178510();
      }
    }
  }
  else
  {
    unint64_t v16 = 0;
  }

  return (NSData *)v16;
}

- (id)unwrappedDataRepresentationForKey:(id)a3
{
  uint32_t v3 = [a3 dictRepresentation];
  id v4 = [v3 mutableCopy];

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isWrappedKey"];
  id v9 = 0;
  id v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    id v7 = handoff_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100178510();
    }
  }

  return v5;
}

- (id)newDecryptionKeyFromDataRepresentation:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v24 = 0;
    uint64_t v25 = 0;
    id v4 = +[NSPropertyListSerialization propertyListWithData:v3 options:1 format:&v25 error:&v24];
    id v5 = v24;
    if (v4)
    {
      id v6 = [v4 objectForKeyedSubscript:@"isWrappedKey"];
      unsigned int v7 = [v6 BOOLValue];

      if (!v7)
      {
LABEL_9:
        uint64_t v20 = [(SDActivityKey *)[SDActivityDecryptionKey alloc] initWithDictRepresentation:v4];
LABEL_20:

        goto LABEL_21;
      }
      id v8 = [v4 objectForKeyedSubscript:@"keyData"];
      if ([v8 length])
      {
        id v9 = +[SDActivityEncryptionManager sharedEncryptionManager];
        BOOL v10 = [v9 loadWrappingKeyData];

        id v11 = [v10 length];
        uint64_t v12 = handoff_log();
        uint64_t v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Converting wrapped key to key", buf, 2u);
          }

          id v14 = (void *)ccaes_ecb_decrypt_mode();
          v22[1] = v22;
          bzero((char *)v22 - ((*v14 + 15) & 0xFFFFFFFFFFFFFFF0), (*v14 + 15) & 0xFFFFFFFFFFFFFFF0);
          [v10 length];
          id v15 = v10;
          [v15 bytes];
          ccecb_init();
          [v8 length];
          uint64_t v16 = ccwrap_unwrapped_size();
          id v17 = +[NSMutableData dataWithCapacity:v16];
          [v17 setLength:v16];
          *(void *)buf = v16;
          [v8 length];
          CFStringRef v18 = v8;
          [v18 bytes];
          id v19 = v17;
          [v19 mutableBytes];
          ccwrap_auth_decrypt();
          [v4 setObject:v19 forKeyedSubscript:@"keyData"];

          goto LABEL_9;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100178634(v13);
        }
      }
      else
      {
        BOOL v10 = handoff_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1001785F0(v10);
        }
      }
    }
    else
    {
      id v8 = handoff_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100178578((uint64_t)v5, v8);
      }
    }

    uint64_t v20 = 0;
    goto LABEL_20;
  }
  uint64_t v20 = 0;
LABEL_21:

  return v20;
}

- (BOOL)deleteAllEncryptionAndDecryptionKeys
{
  self->_shouldRefreshWrappingKey = 1;
  if (self->_wrappingKey
    || self->_encryptionKey
    || [(NSMutableDictionary *)self->_deviceIdentifierToDecryptionKey count])
  {
    id v3 = handoff_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Successfully cleared in-memory key caches", v14, 2u);
    }

    wrappingKey = self->_wrappingKey;
    self->_wrappingKey = 0;

    encryptionKey = self->_encryptionKey;
    self->_encryptionKey = 0;

    [(NSMutableDictionary *)self->_deviceIdentifierToDecryptionKey removeAllObjects];
  }
  OSStatus v6 = SecItemDelete((CFDictionaryRef)[(SDActivityEncryptionManager *)self baseDictEncryptionKey]);
  OSStatus v7 = SecItemDelete((CFDictionaryRef)[(SDActivityEncryptionManager *)self baseDictDecryptionKeyForDeviceIdentifier:0]);
  if (v6) {
    BOOL v8 = v6 == -25300;
  }
  else {
    BOOL v8 = 1;
  }
  char v9 = v8;
  if (v7) {
    BOOL v10 = v7 == -25300;
  }
  else {
    BOOL v10 = 1;
  }
  uint64_t v11 = v10;
  uint64_t v12 = handoff_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100178678(v9, v11, v12);
  }

  return v9 & v11;
}

- (id)allKeys
{
  id v3 = objc_opt_new();
  id v4 = [(SDActivityEncryptionManager *)self baseDict];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
  [v4 setObject:kSecMatchLimitAll forKeyedSubscript:kSecMatchLimit];
  id v5 = [v4 mutableCopy];
  OSStatus v6 = [(SDActivityEncryptionManager *)self baseDictWrappingKey];
  [v5 addEntriesFromDictionary:v6];

  CFTypeRef result = 0;
  OSStatus v7 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
  if (v7)
  {
    OSStatus v8 = v7;
    char v9 = handoff_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching wrappingKeyQuery failed with error %d", buf, 8u);
    }
  }
  else
  {
    [v3 addObjectsFromArray:result];
    CFRelease(result);
  }
  id v10 = [v4 mutableCopy];
  uint64_t v11 = [(SDActivityEncryptionManager *)self baseDictEncryptionKey];
  [v10 addEntriesFromDictionary:v11];

  *(void *)buf = 0;
  uint64_t v12 = SecItemCopyMatching((CFDictionaryRef)v10, (CFTypeRef *)buf);
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = handoff_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10017877C(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  else
  {
    [v3 addObjectsFromArray:*(void *)buf];
    CFRelease(*(CFTypeRef *)buf);
  }
  id v21 = [v4 mutableCopy];
  v22 = [(SDActivityEncryptionManager *)self baseDictDecryptionKeyForDeviceIdentifier:0];
  [v21 addEntriesFromDictionary:v22];

  CFTypeRef cf = 0;
  uint64_t v23 = SecItemCopyMatching((CFDictionaryRef)v21, &cf);
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = handoff_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100178710(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }
  else
  {
    id v40 = v10;
    id v41 = v5;
    v42 = v4;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v32 = (id)cf;
    id v33 = [v32 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v44;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v38 = [v37 objectForKeyedSubscript:kSecAttrAccount];
          if ([v38 hasPrefix:@"handoff-decryption-key"]) {
            [v3 addObject:v37];
          }
        }
        id v34 = [v32 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v34);
    }

    CFRelease(cf);
    id v5 = v41;
    id v4 = v42;
    id v10 = v40;
  }

  return v3;
}

- (id)loadWrappingKeyData
{
  [(SDActivityEncryptionManager *)self testWrappingKeychainItem];
  if (self->_shouldRefreshWrappingKey)
  {
    self->_shouldRefreshWrappingKey = 0;
    p_wrappingKey = &self->_wrappingKey;
    wrappingKey = self->_wrappingKey;
    self->_wrappingKey = 0;

    id v5 = [(SDActivityEncryptionManager *)self baseDictWrappingKey];
    OSStatus v6 = [(SDActivityEncryptionManager *)self loadKeyDataRepresentationWithBaseDict:v5];

    if ([v6 length] == (id)32)
    {
      objc_storeStrong((id *)&self->_wrappingKey, v6);
      OSStatus v7 = handoff_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        OSStatus v8 = "Loaded wrapping key from keychain";
        char v9 = (uint8_t *)&v14;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }
    else
    {
      id v10 = *p_wrappingKey;
      *p_wrappingKey = 0;

      OSStatus v7 = handoff_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        OSStatus v8 = "No wrapping key found in keychain";
        char v9 = (uint8_t *)&v13;
        goto LABEL_7;
      }
    }
  }
  uint64_t v11 = self->_wrappingKey;

  return v11;
}

- (id)loadKeyDataRepresentationWithBaseDict:(id)a3
{
  id v3 = a3;
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
  CFTypeRef result = 0;
  uint64_t v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);

  if (v4)
  {
    id v5 = handoff_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001787E8(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = (void *)result;
  }

  return v12;
}

- (BOOL)saveKeyDataRepresentation:(id)a3 withBaseDict:(id)a4
{
  id v5 = a4;
  CFStringRef v22 = kSecValueData;
  id v23 = a3;
  id v6 = a3;
  BOOL v7 = 1;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  id v9 = [v8 mutableCopy];
  [v9 setObject:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly forKeyedSubscript:kSecAttrAccessible];
  id v10 = [v5 mutableCopy];
  [v10 addEntriesFromDictionary:v9];
  if (SecItemAdd((CFDictionaryRef)v10, 0))
  {
    OSStatus v11 = SecItemUpdate((CFDictionaryRef)v5, (CFDictionaryRef)v9);
    if (!v11) {
      goto LABEL_13;
    }
    OSStatus v12 = v11;
    __int16 v13 = handoff_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17[0] = 67109634;
      v17[1] = v12;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to update keychain item with error %d for query %@ attributesToUpdate %@", (uint8_t *)v17, 0x1Cu);
    }

    [v10 removeObjectForKey:kSecAttrAccessible];
    if (SecItemDelete((CFDictionaryRef)v10))
    {
      __int16 v14 = handoff_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1001788BC();
      }
    }
    [v10 setObject:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly forKeyedSubscript:kSecAttrAccessible];
    if (SecItemAdd((CFDictionaryRef)v10, 0))
    {
      uint64_t v15 = handoff_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100178854();
      }

      BOOL v7 = 0;
    }
    else
    {
LABEL_13:
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (id)loadEncryptionKeyDataRepresentation
{
  id v3 = [(SDActivityEncryptionManager *)self baseDictEncryptionKey];
  uint64_t v4 = [(SDActivityEncryptionManager *)self loadKeyDataRepresentationWithBaseDict:v3];

  return v4;
}

- (BOOL)saveEncryptionKeyDataRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(SDActivityEncryptionManager *)self baseDictEncryptionKey];
  LOBYTE(self) = [(SDActivityEncryptionManager *)self saveKeyDataRepresentation:v4 withBaseDict:v5];

  return (char)self;
}

- (id)loadDecryptionKeyDataRepresentationForDeviceIdentifier:(id)a3
{
  id v4 = [(SDActivityEncryptionManager *)self baseDictDecryptionKeyForDeviceIdentifier:a3];
  id v5 = [(SDActivityEncryptionManager *)self loadKeyDataRepresentationWithBaseDict:v4];

  return v5;
}

- (BOOL)saveDecryptionKeyDataRepresentation:(id)a3 forDeviceIdentifier:(id)a4
{
  id v6 = a3;
  BOOL v7 = [(SDActivityEncryptionManager *)self baseDictDecryptionKeyForDeviceIdentifier:a4];
  LOBYTE(self) = [(SDActivityEncryptionManager *)self saveKeyDataRepresentation:v6 withBaseDict:v7];

  return (char)self;
}

- (id)baseDict
{
  v2 = objc_opt_new();
  [v2 setObject:kSecClassGenericPassword forKeyedSubscript:kSecClass];
  [v2 setObject:@"com.apple.continuity.encryption" forKeyedSubscript:kSecAttrService];

  return v2;
}

- (id)baseDictWrappingKey
{
  v2 = [(SDActivityEncryptionManager *)self baseDict];
  [v2 setObject:@"com.apple.continuity.encryption" forKeyedSubscript:kSecAttrAccessGroup];
  [v2 setObject:@"handoff-wrapping-key" forKeyedSubscript:kSecAttrAccount];
  id v3 = [v2 objectForKeyedSubscript:kSecAttrAccount];
  [v2 setObject:v3 forKeyedSubscript:kSecAttrLabel];

  [v2 setObject:@"Handoff Wrapping Key" forKeyedSubscript:kSecAttrDescription];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];

  return v2;
}

- (id)baseDictEncryptionKey
{
  v2 = [(SDActivityEncryptionManager *)self baseDict];
  [v2 setObject:@"com.apple.continuity.encryption" forKeyedSubscript:kSecAttrAccessGroup];
  [v2 setObject:@"handoff-own-encryption-key" forKeyedSubscript:kSecAttrAccount];
  id v3 = [v2 objectForKeyedSubscript:kSecAttrAccount];
  [v2 setObject:v3 forKeyedSubscript:kSecAttrLabel];

  [v2 setObject:@"Handoff Encryption Key" forKeyedSubscript:kSecAttrDescription];
  [v2 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecAttrSynchronizable];

  return v2;
}

- (id)baseDictDecryptionKeyForDeviceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SDActivityEncryptionManager *)self baseDict];
  [v5 setObject:@"com.apple.continuity.encryption" forKeyedSubscript:kSecAttrAccessGroup];
  if (v4)
  {
    id v6 = +[NSString stringWithFormat:@"%@-%@", @"handoff-decryption-key", v4];
    [v5 setObject:v6 forKeyedSubscript:kSecAttrAccount];

    BOOL v7 = [v5 objectForKeyedSubscript:kSecAttrAccount];
    [v5 setObject:v7 forKeyedSubscript:kSecAttrLabel];
  }
  [v5 setObject:@"Handoff Decryption Key" forKeyedSubscript:kSecAttrDescription];
  [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecAttrSynchronizable];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappingKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);

  objc_storeStrong((id *)&self->_deviceIdentifierToDecryptionKey, 0);
}

@end