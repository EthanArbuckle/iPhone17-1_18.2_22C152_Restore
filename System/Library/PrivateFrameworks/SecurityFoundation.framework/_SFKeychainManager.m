@interface _SFKeychainManager
+ (id)defaultManager;
+ (id)defaultOverCommitManager;
- (BOOL)setIdentity:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 error:(id *)a6;
- (OS_dispatch_queue)keychainManagerQueue;
- (OS_dispatch_queue)keychainReplyQueue;
- (__CFDictionary)_certificateAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4;
- (__CFDictionary)_commonKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5;
- (__CFDictionary)_privateKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5;
- (__CFDictionary)_publicKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5;
- (__SecKey)findPrivateKeyWithIdentifier:(id)a3 certificate:(id *)a4 result:(int *)a5;
- (id)_symmetricKeyAttributesForIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5;
- (id)foundPrivateKey:(__SecKey *)a3 certificate:(id)a4;
- (id)identityForIdentifier:(id)a3;
- (id)initManager;
- (id)initOverCommitManager;
- (id)publicKeyLookupWithIdentifier:(id)a3 certificate:(id)a4 result:(int)a5;
- (int)generateAttributesForIdentityAndAddToKeychain:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5;
- (void)identityForIdentifier:(id)a3 resultHandler:(id)a4;
- (void)keyForIdentifier:(id)a3 specifier:(id)a4 resultHandler:(id)a5;
- (void)removeItemWithIdentifier:(id)a3 resultHandler:(id)a4;
- (void)setIdentity:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 resultHandler:(id)a6;
- (void)setKey:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 resultHandler:(id)a6;
- (void)setKeychainManagerQueue:(id)a3;
- (void)setKeychainReplyQueue:(id)a3;
@end

@implementation _SFKeychainManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultManager_defaultManager;
  return v2;
}

+ (id)defaultOverCommitManager
{
  if (defaultOverCommitManager_onceToken != -1) {
    dispatch_once(&defaultOverCommitManager_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)defaultOverCommitManager_defaultOverCommitManager;
  return v2;
}

- (id)initManager
{
  v7.receiver = self;
  v7.super_class = (Class)_SFKeychainManager;
  v2 = [(_SFKeychainManager *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("SFKeychainManager Queue", 0);
    keychainManagerQueue = v2->_keychainManagerQueue;
    v2->_keychainManagerQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_get_global_queue(0, 0);
    [(_SFKeychainManager *)v2 setKeychainReplyQueue:v5];
  }
  return v2;
}

- (id)initOverCommitManager
{
  v9.receiver = self;
  v9.super_class = (Class)_SFKeychainManager;
  v2 = [(_SFKeychainManager *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_attr_make_with_overcommit();
    dispatch_queue_t v4 = dispatch_queue_create("SFKeychainManager over commit Queue", v3);
    keychainManagerQueue = v2->_keychainManagerQueue;
    v2->_keychainManagerQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = dispatch_get_global_queue(0, 2uLL);
    keychainReplyQueue = v2->_keychainReplyQueue;
    v2->_keychainReplyQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (id)_symmetricKeyAttributesForIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x1E4F3B788];
  v16[0] = *MEMORY[0x1E4F3B978];
  v16[1] = v9;
  v17[0] = *MEMORY[0x1E4F3B9A0];
  v17[1] = a3;
  v16[2] = *MEMORY[0x1E4F3B798];
  v17[2] = *MEMORY[0x1E4F1CFD0];
  v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = a3;
  v12 = [v10 dictionaryWithObjects:v17 forKeys:v16 count:3];

  v13 = (void *)[v12 mutableCopy];
  if (v8)
  {
    v14 = [v8 keyData];
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F3BD38]];
  }
  if (v7) {
    objc_msgSend(v13, "addEntriesFromDictionary:", objc_msgSend(v7, "secAccessibilityAttributes"));
  }

  return v13;
}

- (void)setKey:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 resultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(_SFKeychainManager *)self keychainReplyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke;
  block[3] = &unk_1E6379688;
  block[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v14, block);
}

- (__CFDictionary)_commonKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B9A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B788], v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5D0], v9);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B798], (const void *)*MEMORY[0x1E4F1CFD0]);
  if (v7)
  {
    id v11 = [v7 accessGroup];

    if (v11)
    {
      id v12 = (const void *)*MEMORY[0x1E4F3B550];
      id v13 = [v7 accessGroup];
      CFDictionaryAddValue(Mutable, v12, v13);
    }
    -[__CFDictionary addEntriesFromDictionary:](Mutable, "addEntriesFromDictionary:", [v7 secAccessibilityAttributes]);
  }
  if (v8) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD48], (const void *)[v8 _secKey]);
  }
  CFAutorelease(Mutable);

  return Mutable;
}

- (__CFDictionary)_privateKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  v5 = [(_SFKeychainManager *)self _commonKeyAttributesForIdentityIdentifier:a3 accessPolicy:a4 key:a5];
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x1E4F3B6D8], (const void *)*MEMORY[0x1E4F3B6E8]);
  return v5;
}

- (__CFDictionary)_publicKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  v5 = [(_SFKeychainManager *)self _commonKeyAttributesForIdentityIdentifier:a3 accessPolicy:a4 key:a5];
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x1E4F3B6D8], (const void *)*MEMORY[0x1E4F3B6F0]);
  return v5;
}

- (__CFDictionary)_certificateAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B980]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B788], v6);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B798], (const void *)*MEMORY[0x1E4F1CFD0]);
  if (v5) {
    -[__CFDictionary addEntriesFromDictionary:](Mutable, "addEntriesFromDictionary:", [v5 secAccessibilityAttributes]);
  }
  CFAutorelease(Mutable);

  return Mutable;
}

- (int)generateAttributesForIdentityAndAddToKeychain:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 keyPair];
  if (v11)
  {
    id v12 = [v10 keyPair];

    id v13 = [(_SFKeychainManager *)self _privateKeyAttributesForIdentityIdentifier:v9 accessPolicy:v8 key:v12];
  }
  else
  {
    id v12 = [v10 publicKey];

    id v13 = [(_SFKeychainManager *)self _publicKeyAttributesForIdentityIdentifier:v9 accessPolicy:v8 key:v12];
  }
  CFDictionaryRef v14 = v13;

  return SecItemAdd(v14, 0);
}

- (BOOL)setIdentity:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  id v13 = [(_SFKeychainManager *)self keychainReplyQueue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_error___block_invoke;
  v20[3] = &unk_1E63796B0;
  v20[4] = self;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  v24 = &v32;
  v25 = &v26;
  dispatch_sync(v13, v20);

  if (a6)
  {
    id v17 = (void *)v27[5];
    if (v17) {
      *a6 = v17;
    }
  }
  char v18 = *((unsigned char *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

- (void)setIdentity:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 resultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(_SFKeychainManager *)self keychainReplyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke;
  block[3] = &unk_1E6379688;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)keyForIdentifier:(id)a3 specifier:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_SFKeychainManager *)self keychainReplyQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke;
  v15[3] = &unk_1E6379700;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (id)foundPrivateKey:(__SecKey *)a3 certificate:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  CFDictionaryRef v6 = SecKeyCopyAttributes(a3);
  id v7 = CFDictionaryGetValue(v6, (const void *)*MEMORY[0x1E4F3B718]);
  if ([v7 isEqualToString:*MEMORY[0x1E4F3B730]])
  {
    id v8 = off_1E63793E8;
LABEL_5:
    id v9 = (void *)[objc_alloc(*v8) initWithSecKey:a3];
    CFRelease(a3);
    CFRelease(v6);
    id v10 = [[_SFIdentity alloc] initWithKeyPair:v9 certificate:v5];
    id v11 = +[_SFKeychainFetchResult fetchResultWithValue:v10];

    goto LABEL_7;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F3B760]])
  {
    id v8 = off_1E6379310;
    goto LABEL_5;
  }
  CFRelease(a3);
  CFRelease(v6);
  id v12 = (void *)MEMORY[0x1E4F28C58];
  id v15 = @"SFKeychainErrorKeyType";
  v16[0] = v7;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  id v9 = [v12 errorWithDomain:@"SFKeychainErrorDomain" code:1 userInfo:v13];

  id v11 = +[_SFKeychainFetchResult fetchResultWithError:v9];
LABEL_7:

  return v11;
}

- (__SecKey)findPrivateKeyWithIdentifier:(id)a3 certificate:(id *)a4 result:(int *)a5
{
  id v8 = a3;
  id v9 = [(_SFKeychainManager *)self _certificateAttributesForIdentityIdentifier:v8 accessPolicy:0];
  id v10 = (const void *)*MEMORY[0x1E4F3BC80];
  id v11 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionaryAddValue(v9, (const void *)*MEMORY[0x1E4F3BC80], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFTypeRef result = 0;
  *a5 = SecItemCopyMatching(v9, &result);
  if (result)
  {
    id v12 = [_SFCertificate alloc];
    *a4 = [(_SFCertificate *)v12 initWithSecCertificate:result];
    CFRelease(result);
  }
  id v13 = -[_SFKeychainManager _privateKeyAttributesForIdentityIdentifier:accessPolicy:key:](self, "_privateKeyAttributesForIdentityIdentifier:accessPolicy:key:", v8, 0, 0, 0);
  CFDictionaryAddValue(v13, v10, v11);
  *a5 = SecItemCopyMatching(v13, (CFTypeRef *)&v16);
  id v14 = v16;

  return v14;
}

- (id)publicKeyLookupWithIdentifier:(id)a3 certificate:(id)a4 result:(int)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  SecKeyRef key = 0;
  id v10 = [(_SFKeychainManager *)self _publicKeyAttributesForIdentityIdentifier:v8 accessPolicy:0 key:0];
  id v11 = (const void *)*MEMORY[0x1E4F3BC80];
  id v12 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionaryAddValue(v10, (const void *)*MEMORY[0x1E4F3BC80], (const void *)*MEMORY[0x1E4F1CFD0]);
  OSStatus v13 = SecItemCopyMatching(v10, (CFTypeRef *)&key);
  if (v13 != -25300) {
    a5 = v13;
  }
  if (!key) {
    goto LABEL_9;
  }
  id v14 = [(_SFKeychainManager *)self _publicKeyAttributesForIdentityIdentifier:v8 accessPolicy:0 key:0];
  CFDictionaryAddValue(v14, v11, v12);
  OSStatus v15 = SecItemCopyMatching(v14, (CFTypeRef *)&key);
  if (v15 != -25300) {
    a5 = v15;
  }
  if (!key)
  {
LABEL_9:
    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:a5 userInfo:0];
    v19 = +[_SFKeychainFetchResult fetchResultWithError:v17];
    goto LABEL_15;
  }
  CFDictionaryRef v16 = SecKeyCopyAttributes(key);
  id v17 = CFDictionaryGetValue(v16, (const void *)*MEMORY[0x1E4F3B718]);
  if ([v17 isEqualToString:*MEMORY[0x1E4F3B730]])
  {
    id v18 = _SFECPublicKey;
  }
  else
  {
    if (![v17 isEqualToString:*MEMORY[0x1E4F3B760]])
    {
      CFRelease(key);
      CFRelease(v16);
      id v23 = (void *)MEMORY[0x1E4F28C58];
      v27 = @"SFKeychainErrorKeyType";
      v28[0] = v17;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      id v21 = [v23 errorWithDomain:@"SFKeychainErrorDomain" code:1 userInfo:v24];

      v19 = +[_SFKeychainFetchResult fetchResultWithError:v21];
      goto LABEL_14;
    }
    id v18 = SFRSAPublicKey;
  }
  id v20 = [v18 alloc];
  id v21 = (void *)[v20 initWithSecKey:key];
  CFRelease(key);
  CFRelease(v16);
  id v22 = [[_SFIdentity alloc] initWithPublicKey:v21 certificate:v9];
  v19 = +[_SFKeychainFetchResult fetchResultWithValue:v22];

LABEL_14:
LABEL_15:

  return v19;
}

- (id)identityForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  OSStatus v13 = &v12;
  uint64_t v14 = 0x3032000000;
  OSStatus v15 = __Block_byref_object_copy_;
  CFDictionaryRef v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = [(_SFKeychainManager *)self keychainManagerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___SFKeychainManager_identityForIdentifier___block_invoke;
  block[3] = &unk_1E6379728;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)identityForIdentifier:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_SFKeychainManager *)self keychainManagerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke;
  block[3] = &unk_1E6379778;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeItemWithIdentifier:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_SFKeychainManager *)self keychainReplyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke;
  block[3] = &unk_1E63797C8;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (OS_dispatch_queue)keychainManagerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKeychainManagerQueue:(id)a3
{
}

- (OS_dispatch_queue)keychainReplyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeychainReplyQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainReplyQueue, 0);
  objc_storeStrong((id *)&self->_keychainManagerQueue, 0);
}

@end