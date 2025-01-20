@interface SecMessageLegacyFullIdentity
+ (id)identity;
+ (id)identityFromV2Bytes:(const char *)a3 size:(unint64_t *)a4 error:(id *)a5;
+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4;
+ (id)populateIdentity:(id)a3 withEncryptionKeyFromPersistentRef:(const char *)a4 size:(unint64_t *)a5;
+ (id)populateIdentity:(id)a3 withSigningKeyFromPersistentRef:(const char *)a4 size:(unint64_t *)a5;
+ (void)identity;
- (BOOL)isMigratedV2Key;
- (LegacySigningKeyPrivate)signingKey;
- (NSData)encryptionKeyPersistentRef;
- (NSData)signingKeyPersistentRef;
- (SecKeyRSAPrivate)encryptionKey;
- (SecMessageLegacyFullIdentity)initWithEncryptionKey:(id)a3 signingKey:(id)a4;
- (SecMessageLegacyFullIdentity)initWithEncryptionKeyData:(id)a3 signingKeyData:(id)a4;
- (SecMessageLegacyFullIdentity)initWithEncryptionSecKey:(__SecKey *)a3 signingSecKey:(__SecKey *)a4;
- (SecMessageLegacyFullIdentity)initWithProtobufData:(id)a3;
- (_SecMPFullIdentity)asRef;
- (__SecKey)privateSigningKeyForTerminusMigration;
- (id)dataRepresentationWithError:(id *)a3;
- (id)decryptMessage:(id)a3 error:(id *)a4;
- (id)publicIdentity;
- (id)signData:(id)a3 error:(id *)a4;
- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5;
- (unint64_t)encryptionSize;
- (void)deleteItemWithPersistentRef:(id)a3;
- (void)deleteMigratedKeys;
- (void)setEncryptionKey:(id)a3;
- (void)setEncryptionKeyPersistentRef:(id)a3;
- (void)setIsMigratedV2Key:(BOOL)a3;
- (void)setSigningKey:(id)a3;
- (void)setSigningKeyPersistentRef:(id)a3;
@end

@implementation SecMessageLegacyFullIdentity

+ (id)populateIdentity:(id)a3 withSigningKeyFromPersistentRef:(const char *)a4 size:(unint64_t *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    id v11 = 0;
    goto LABEL_13;
  }
  CFErrorRef error = 0;
  SecKeyRef key = 0;
  id v17 = 0;
  int v8 = SecMPFICreatePrivateAndPublicKeyReadPersistentRef(&v17, (uint64_t *)a4, (uint64_t *)a5, &key, &error);
  id v9 = v17;
  if (v8)
  {
    v10 = MessageProtectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = v8;
      _os_log_impl(&dword_2163F2000, v10, OS_LOG_TYPE_INFO, "Failed to lookup legacy persistent reference for signing key: %i", buf, 8u);
    }
  }
  else
  {
    [v7 setSigningKeyPersistentRef:v9];
    v10 = SecKeyCopyExternalRepresentation(key, &error);
    if (v10)
    {
      uint64_t v16 = 0;
      v12 = [[LegacySigningKeyPrivate alloc] initWithData:v10 error:&v16];
      [v7 setSigningKey:v12];

      v10 = v10;
      memset_s((void *)[v10 mutableBytes], [v10 length], 0, [v10 length]);
      v13 = [v7 signingKey];
      if (v13) {
        v14 = v7;
      }
      else {
        v14 = 0;
      }
      id v11 = v14;

      goto LABEL_12;
    }
  }
  id v11 = 0;
LABEL_12:

LABEL_13:
  return v11;
}

+ (id)populateIdentity:(id)a3 withEncryptionKeyFromPersistentRef:(const char *)a4 size:(unint64_t *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    id v11 = 0;
    goto LABEL_13;
  }
  CFErrorRef error = 0;
  SecKeyRef key = 0;
  id v17 = 0;
  int v8 = SecMPFICreatePrivateAndPublicKeyReadPersistentRef(&v17, (uint64_t *)a4, (uint64_t *)a5, &key, &error);
  id v9 = v17;
  if (v8)
  {
    v10 = MessageProtectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = v8;
      _os_log_impl(&dword_2163F2000, v10, OS_LOG_TYPE_INFO, "Failed to lookup legacy persistent reference for encryption key: %i", buf, 8u);
    }
  }
  else
  {
    [v7 setEncryptionKeyPersistentRef:v9];
    v10 = SecKeyCopyExternalRepresentation(key, &error);
    if (v10)
    {
      uint64_t v16 = 0;
      v12 = [[SecKeyRSAPrivate alloc] initWithData:v10 error:&v16];
      [v7 setEncryptionKey:v12];

      v10 = v10;
      memset_s((void *)[v10 mutableBytes], [v10 length], 0, [v10 length]);
      v13 = [v7 encryptionKey];
      if (v13) {
        v14 = v7;
      }
      else {
        v14 = 0;
      }
      id v11 = v14;

      goto LABEL_12;
    }
  }
  id v11 = 0;
LABEL_12:

LABEL_13:
  return v11;
}

+ (id)identityFromV2Bytes:(const char *)a3 size:(unint64_t *)a4 error:(id *)a5
{
  id v9 = [[SecMessageLegacyFullIdentity alloc] initWithEncryptionKey:0 signingKey:0];
  [(SecMessageLegacyFullIdentity *)v9 setIsMigratedV2Key:1];
  v10 = [a1 populateIdentity:v9 withSigningKeyFromPersistentRef:a3 size:a4];

  id v11 = [a1 populateIdentity:v10 withEncryptionKeyFromPersistentRef:a3 size:a4];

  if (!v11) {
    MPLogAndAssignError(-101, a5, @"Looking up the persistent reference failed.");
  }
  return v11;
}

- (void)deleteItemWithPersistentRef:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F175B0];
  v10[0] = *MEMORY[0x263F171B8];
  v10[1] = v3;
  v11[0] = *MEMORY[0x263F171E0];
  v11[1] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  CFDictionaryRef v6 = [v4 dictionaryWithObjects:v11 forKeys:v10 count:2];

  OSStatus v7 = SecItemDelete(v6);
  if (v7)
  {
    int v8 = v7;
    id v9 = MessageProtectionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SecMessageLegacyFullIdentity(Migration) deleteItemWithPersistentRef:](v8, v9);
    }
  }
}

- (void)deleteMigratedKeys
{
  uint64_t v3 = [(SecMessageLegacyFullIdentity *)self encryptionKeyPersistentRef];
  [(SecMessageLegacyFullIdentity *)self deleteItemWithPersistentRef:v3];

  v4 = [(SecMessageLegacyFullIdentity *)self signingKeyPersistentRef];
  [(SecMessageLegacyFullIdentity *)self deleteItemWithPersistentRef:v4];

  [(SecMessageLegacyFullIdentity *)self setEncryptionKeyPersistentRef:0];
  [(SecMessageLegacyFullIdentity *)self setSigningKeyPersistentRef:0];
  [(SecMessageLegacyFullIdentity *)self setIsMigratedV2Key:0];
  id v5 = MessageProtectionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CFDictionaryRef v6 = 0;
    _os_log_impl(&dword_2163F2000, v5, OS_LOG_TYPE_INFO, "Migration of a legacy key has completed and previous keys have been deleted.", v6, 2u);
  }
}

- (SecMessageLegacyFullIdentity)initWithEncryptionSecKey:(__SecKey *)a3 signingSecKey:(__SecKey *)a4
{
  CFDataRef v6 = SecKeyCopyExternalRepresentation(a3, 0);
  OSStatus v7 = [[SecKeyRSAPrivate alloc] initWithData:v6 error:0];
  CFDataRef v8 = SecKeyCopyExternalRepresentation(a4, 0);
  id v9 = [[LegacySigningKeyPrivate alloc] initWithData:v8 error:0];
  v10 = [(SecMessageLegacyFullIdentity *)self initWithEncryptionKey:v7 signingKey:v9];

  return v10;
}

- (SecMessageLegacyFullIdentity)initWithProtobufData:(id)a3
{
  id v4 = a3;
  id v5 = [[NGMPBLegacyKey alloc] initWithData:v4];

  if (v5)
  {
    CFDataRef v6 = [(NGMPBLegacyKey *)v5 encryptionKey];
    OSStatus v7 = [(NGMPBLegacyKey *)v5 signingKey];
    self = [(SecMessageLegacyFullIdentity *)self initWithEncryptionKeyData:v6 signingKeyData:v7];

    CFDataRef v8 = self;
  }
  else
  {
    id v9 = MessageProtectionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SecMessageLegacyFullIdentity initWithProtobufData:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    CFDataRef v8 = 0;
  }

  return v8;
}

- (SecMessageLegacyFullIdentity)initWithEncryptionKey:(id)a3 signingKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SecMessageLegacyFullIdentity;
  id v9 = [(SecMessageLegacyFullIdentity *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptionKey, a3);
    objc_storeStrong((id *)&v10->_signingKey, a4);
    v10->_isMigratedV2Key = 0;
  }

  return v10;
}

- (SecMessageLegacyFullIdentity)initWithEncryptionKeyData:(id)a3 signingKeyData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[LegacySigningKeyPrivate alloc] initWithData:v7 error:0];

  if (v8)
  {
    id v14 = 0;
    id v9 = [[SecKeyRSAPrivate alloc] initWithData:v6 error:&v14];
    uint64_t v10 = v14;
    if (v9)
    {
      self = [(SecMessageLegacyFullIdentity *)self initWithEncryptionKey:v9 signingKey:v8];
      uint64_t v11 = self;
    }
    else
    {
      objc_super v12 = MessageProtectionLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SecMessageLegacyFullIdentity initWithEncryptionKeyData:signingKeyData:](v10);
      }

      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v10 = MessageProtectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SecMessageLegacyFullIdentity initWithEncryptionKeyData:signingKeyData:]();
    }
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)identity
{
  v2 = objc_alloc_init(SecMessageLegacyFullIdentity);
  uint64_t v3 = objc_alloc_init(LegacySigningKeyPrivate);
  [(SecMessageLegacyFullIdentity *)v2 setSigningKey:v3];

  id v4 = [(SecMessageLegacyFullIdentity *)v2 signingKey];

  if (v4)
  {
    id v5 = objc_alloc_init(SecKeyRSAPrivate);
    [(SecMessageLegacyFullIdentity *)v2 setEncryptionKey:v5];

    id v6 = [(SecMessageLegacyFullIdentity *)v2 encryptionKey];

    if (v6)
    {
      id v7 = v2;
      goto LABEL_9;
    }
    id v8 = MessageProtectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SecMessageLegacyFullIdentity identity];
    }
  }
  else
  {
    id v8 = MessageProtectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SecMessageLegacyFullIdentity identity];
    }
  }

  id v7 = 0;
LABEL_9:

  return v7;
}

+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (![v5 length])
  {
    MPLogAndAssignError(-100, a4, @"The passed legacy key representation is of incorrect size.");
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  id v6 = v5;
  id v7 = (unsigned __int8 *)[v6 bytes];
  id v8 = objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
  uint64_t v18 = [v8 length];
  id v9 = v8;
  uint64_t v17 = [v9 bytes];
  int v10 = *v7;
  if (v10 == 2)
  {
    uint64_t v14 = MessageProtectionLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_2163F2000, v14, OS_LOG_TYPE_INFO, "Parsing a legacy key of version 2.", v16, 2u);
    }

    uint64_t v12 = +[SecMessageLegacyFullIdentity identityFromV2Bytes:&v17 size:&v18 error:a4];
  }
  else
  {
    if (v10 != 3)
    {
      MPLogAndAssignError(-100, a4, @"Failed to parse legacy key format.");
      uint64_t v13 = 0;
      goto LABEL_13;
    }
    uint64_t v11 = MessageProtectionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_2163F2000, v11, OS_LOG_TYPE_INFO, "Parsing a legacy key of version 3.", v16, 2u);
    }

    uint64_t v12 = [[SecMessageLegacyFullIdentity alloc] initWithProtobufData:v9];
  }
  uint64_t v13 = v12;
LABEL_13:

LABEL_14:
  return v13;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SecMessageLegacyFullIdentity *)self signingKey];
  id v8 = [v7 signData:v6 error:a4];

  return v8;
}

- (id)decryptMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SecMessageLegacyFullIdentity *)self encryptionKey];
  id v8 = [v7 decryptData:v6 error:a4];

  return v8;
}

- (id)dataRepresentationWithError:(id *)a3
{
  id v4 = objc_alloc_init(NGMPBLegacyKey);
  id v5 = [(SecMessageLegacyFullIdentity *)self encryptionKey];
  id v6 = [v5 dataRepresentation];
  [(NGMPBLegacyKey *)v4 setEncryptionKey:v6];

  id v7 = [(SecMessageLegacyFullIdentity *)self signingKey];
  id v8 = [v7 dataRepresentation];
  [(NGMPBLegacyKey *)v4 setSigningKey:v8];

  char v12 = 3;
  id v9 = [MEMORY[0x263EFF990] dataWithBytes:&v12 length:1];
  int v10 = [(NGMPBLegacyKey *)v4 data];
  [v9 appendData:v10];

  if ([(SecMessageLegacyFullIdentity *)self isMigratedV2Key]) {
    [(SecMessageLegacyFullIdentity *)self deleteMigratedKeys];
  }

  return v9;
}

- (id)publicIdentity
{
  uint64_t v3 = [SecMessageLegacyPublicIdentity alloc];
  id v4 = [(SecMessageLegacyFullIdentity *)self encryptionKey];
  id v5 = [v4 publicKey];
  id v6 = [(SecMessageLegacyFullIdentity *)self signingKey];
  id v7 = [v6 publicKey];
  id v8 = [(SecMessageLegacyPublicIdentity *)v3 initWithEncryptionKey:v5 signingKey:v7];

  return v8;
}

- (unint64_t)encryptionSize
{
  v2 = [(SecMessageLegacyFullIdentity *)self publicIdentity];
  unint64_t v3 = [v2 encryptionSize];

  return v3;
}

- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5
{
  id v17 = 0;
  id v8 = (void *)MEMORY[0x263EFF990];
  id v9 = a4;
  CFDataRef v10 = (const __CFData *)a3;
  CFDataRef v11 = [v8 data];
  char v12 = (const void *)[v9 asRef];

  uint64_t v13 = [(SecMessageLegacyFullIdentity *)self asRef];
  int v14 = SecMPVerifyAndExposeMessage(v10, (uint64_t)v12, (uint64_t)v13, v11, (CFErrorRef *)&v17);

  if (v12) {
    CFRelease(v12);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v14)
  {
    CFDataRef v15 = v11;
  }
  else
  {
    CFDataRef v15 = 0;
    if (a5) {
      *a5 = v17;
    }
  }

  return v15;
}

- (__SecKey)privateSigningKeyForTerminusMigration
{
  v2 = [(SecMessageLegacyFullIdentity *)self signingKey];
  unint64_t v3 = [v2 secKeyRef];

  return v3;
}

- (_SecMPFullIdentity)asRef
{
  SecMPFullIdentityGetTypeID();
  Instance = (_SecMPFullIdentity *)_CFRuntimeCreateInstance();
  Instance->var5 = (id)CFRetain(self);
  id v4 = [(SecMessageLegacyFullIdentity *)self signingKey];
  id v5 = [v4 secKeyRef];
  Instance->var2 = v5;

  id v6 = [(SecMessageLegacyFullIdentity *)self encryptionKey];
  id v7 = [v6 secKeyRef];
  Instance->var4 = v7;

  Instance->var1 = 0;
  Instance->var3 = 0;
  return Instance;
}

- (LegacySigningKeyPrivate)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
}

- (SecKeyRSAPrivate)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)encryptionKeyPersistentRef
{
  return self->_encryptionKeyPersistentRef;
}

- (void)setEncryptionKeyPersistentRef:(id)a3
{
}

- (NSData)signingKeyPersistentRef
{
  return self->_signingKeyPersistentRef;
}

- (void)setSigningKeyPersistentRef:(id)a3
{
}

- (BOOL)isMigratedV2Key
{
  return self->_isMigratedV2Key;
}

- (void)setIsMigratedV2Key:(BOOL)a3
{
  self->_isMigratedV2Key = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingKeyPersistentRef, 0);
  objc_storeStrong((id *)&self->_encryptionKeyPersistentRef, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
}

- (void)initWithProtobufData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithEncryptionKeyData:signingKeyData:.cold.1()
{
  v0 = [0 description];
  OUTLINED_FUNCTION_0(&dword_2163F2000, v1, v2, "Failed to initialize signing key: %@", v3, v4, v5, v6, 2u);
}

- (void)initWithEncryptionKeyData:(void *)a1 signingKeyData:.cold.2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Failed to initialize encryption key: %@", v4, v5, v6, v7, 2u);
}

+ (void)identity
{
}

@end