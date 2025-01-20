@interface FullKey
+ (id)generateNewKeyWithAccess:(id)a3 error:(id *)a4;
+ (id)generateNewKeyWithAccess:(id)a3 forceNoSEP:(BOOL)a4 error:(id *)a5;
- (FullKey)initWithCTKTokenOID:(id)a3 error:(id *)a4;
- (FullKey)initWithKey:(id)a3 error:(id *)a4;
- (FullKey)initWithKeychainTag:(id)a3 error:(id *)a4;
- (FullKey)initWithProtobufferData:(id)a3 error:(id *)a4;
- (NSString)keychainTag;
- (P256PrivateKeyProtocol)key;
- (id)description;
- (id)keyIdentifier;
- (id)protobuffer;
- (int)keyStore;
- (void)setKeychainTag:(id)a3;
@end

@implementation FullKey

+ (id)generateNewKeyWithAccess:(id)a3 error:(id *)a4
{
  return (id)[a1 generateNewKeyWithAccess:a3 forceNoSEP:0 error:a4];
}

+ (id)generateNewKeyWithAccess:(id)a3 forceNoSEP:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_alloc((Class)a1);
  if (v6) {
    +[CoreCryptoP256Private generate];
  }
  else {
  v10 = +[SecKeyP256Private generateWithAccessControl:v8];
  }
  v11 = (void *)[v9 initWithKey:v10 error:a5];

  return v11;
}

- (FullKey)initWithKey:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)FullKey;
    id v8 = [(FullKey *)&v15 init];
    id v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_key, a3);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9->_keyStore = 4;
      }
      else if (objc_opt_class())
      {
        v9->_keyStore = 0;
      }
      else
      {
        v13 = MessageProtectionLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[FullKey initWithKey:error:]((uint64_t)v9, v13);
        }
      }
    }
  }
  else
  {
    v10 = NSString;
    v11 = [0 description];
    v12 = [v10 stringWithFormat:@"Failed to initialize a full key: %@", v11];
    MPLogAndAssignError(4, a4, v12);

    id v9 = 0;
  }

  return v9;
}

- (FullKey)initWithProtobufferData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [v6 keystore];
  if (v7 != 4)
  {
    if (v7 == 3)
    {
      keychainTag = [v6 keychainTag];
      id v9 = [(FullKey *)self initWithKeychainTag:keychainTag error:a4];
LABEL_7:

      goto LABEL_8;
    }
    v13 = MessageProtectionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[FullKey initWithProtobufferData:error:](v6, v13);
    }
LABEL_13:

    v12 = 0;
    goto LABEL_14;
  }
  if (([v6 hasKeyData] & 1) == 0)
  {
    v13 = MessageProtectionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[FullKey initWithProtobufferData:error:](v13);
    }
    goto LABEL_13;
  }
  v10 = [v6 keyData];
  id v9 = [(FullKey *)self initWithCTKTokenOID:v10 error:a4];

  if ([v6 hasKeychainTag])
  {
    uint64_t v11 = [v6 keychainTag];
    keychainTag = v9->_keychainTag;
    v9->_keychainTag = (NSString *)v11;
    goto LABEL_7;
  }
LABEL_8:
  self = v9;
  v12 = self;
LABEL_14:

  return v12;
}

- (FullKey)initWithCTKTokenOID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FullKey;
  int v7 = [(FullKey *)&v11 init];
  if (v7)
  {
    id v8 = [[SecKeyP256Private alloc] initWithData:v6 error:a4];
    key = v7->_key;
    v7->_key = (P256PrivateKeyProtocol *)v8;

    v7->_keyStore = 4;
  }

  return v7;
}

- (FullKey)initWithKeychainTag:(id)a3 error:(id *)a4
{
  v26[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = *MEMORY[0x263F171C8];
  uint64_t v9 = *MEMORY[0x263F17090];
  v25[0] = *MEMORY[0x263F171B8];
  v25[1] = v9;
  v26[0] = v8;
  v26[1] = @"com.apple.messageprotection";
  uint64_t v10 = *MEMORY[0x263F17520];
  v25[2] = *MEMORY[0x263F16ED8];
  v25[3] = v10;
  v26[2] = v7;
  v26[3] = MEMORY[0x263EFFA88];
  CFDictionaryRef v11 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  CFTypeRef result = 0;
  OSStatus v12 = SecItemCopyMatching(v11, &result);
  if (v12)
  {
    MPLogAndAssignError(v12, a4, @"Failed to initiate a full key from the passed serialization.");
    v13 = 0;
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x263EFF8F8]);
    objc_super v15 = (void *)[v14 initWithData:result];
    v16 = [[SecKeyP256Private alloc] initWithData:v15 error:a4];
    if (v16)
    {
      v23.receiver = self;
      v23.super_class = (Class)FullKey;
      v17 = [(FullKey *)&v23 init];
      v18 = v17;
      if (v17)
      {
        objc_storeStrong((id *)&v17->_key, v16);
        v18->_keyStore = 3;
        objc_storeStrong((id *)&v18->_keychainTag, a3);
      }
      self = v18;
      v13 = self;
    }
    else
    {
      v19 = NSString;
      v20 = [*a4 description];
      v21 = [v19 stringWithFormat:@"We failed to initialize a key with error: %@", v20];
      MPLogAndAssignError(406, a4, v21);

      v13 = 0;
    }
  }
  return v13;
}

- (id)keyIdentifier
{
  keychainTag = self->_keychainTag;
  if (keychainTag)
  {
    v3 = keychainTag;
  }
  else
  {
    v4 = [(FullKey *)self key];
    v5 = [v4 publicKey];
    id v6 = [v5 dataRepresentation];
    v3 = [v6 base64EncodedStringWithOptions:0];
  }
  return v3;
}

- (id)description
{
  v2 = NSString;
  v3 = [(FullKey *)self key];
  v4 = [v3 publicKey];
  v5 = [v4 dataRepresentation];
  id v6 = [v2 stringWithFormat:@"FullKey with public data representation: %@", v5];

  return v6;
}

- (id)protobuffer
{
  v3 = objc_alloc_init(NGMPBP256Key);
  v4 = [(FullKey *)self keychainTag];
  [(NGMPBP256Key *)v3 setKeychainTag:v4];

  v5 = [(FullKey *)self key];
  id v6 = [v5 keychainData];
  [(NGMPBP256Key *)v3 setKeyData:v6];

  [(NGMPBP256Key *)v3 setKeystore:4];
  return v3;
}

- (P256PrivateKeyProtocol)key
{
  return (P256PrivateKeyProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (int)keyStore
{
  return self->_keyStore;
}

- (NSString)keychainTag
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeychainTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainTag, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)initWithKey:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 8);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_2163F2000, a2, OS_LOG_TYPE_FAULT, "Unsupported key store: %d", (uint8_t *)v3, 8u);
}

- (void)initWithProtobufferData:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 keystore];
  _os_log_fault_impl(&dword_2163F2000, a2, OS_LOG_TYPE_FAULT, "Unsupported key store: %d", (uint8_t *)v3, 8u);
}

- (void)initWithProtobufferData:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
}

@end