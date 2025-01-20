@interface ICCloudSyncingObjectCryptoStrategyV1
+ (id)decryptWithMainKeyOfObject:(id)a3 encryptedData:(id)a4 fallbackAttemptSuccessCleanupHandler:(id)a5;
+ (id)decryptWithMainKeyOfObject:(id)a3 encryptedDataPreparationBlock:(id)a4 fallbackAttemptSuccessCleanupHandler:(id)a5;
+ (void)encryptWithMainKeyOfObject:(id)a3 dataPreparationBlock:(id)a4 failureHandler:(id)a5 successHandler:(id)a6;
+ (void)encryptWithMainKeyOfObject:(id)a3 dataToEncrypt:(id)a4 failureHandler:(id)a5 successHandler:(id)a6;
- (BOOL)authenticateWithPassphrase:(id)a3;
- (BOOL)canMainKey:(id)a3 decryptObject:(id)a4;
- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4;
- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4 setTagAndIVHandler:(id)a5;
- (BOOL)encryptSidecarFileFromURL:(id)a3 toURL:(id)a4;
- (BOOL)hasPassphraseSet;
- (BOOL)hasSameKeyAsObject:(id)a3;
- (BOOL)isAuthenticated;
- (BOOL)isPassphraseCorrect:(id)a3;
- (BOOL)loadDecryptedValuesIfNecessary;
- (BOOL)mainKeyDecryptsPrimaryData:(id)a3;
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)recordHasChangedPassphrase:(id)a3;
- (BOOL)rewrapWithMainKey:(id)a3;
- (BOOL)saveEncryptedJSON;
- (ICEncryptionKey)primaryWrappedKey;
- (ICEncryptionMetadata)primaryMetadata;
- (ICEncryptionObject)primaryEncryptionObject;
- (NSData)fileURLEncryptionCryptoInitialzationVector;
- (NSData)fileURLEncryptionCryptoTag;
- (NSString)passphraseHint;
- (id)decryptData:(id)a3;
- (id)decryptSidecarData:(id)a3;
- (id)decryptedDataFromFileURL:(id)a3;
- (id)encryptData:(id)a3;
- (id)encryptSidecarData:(id)a3;
- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4;
- (id)encryptionObjectWithData:(id)a3;
- (id)mainKeyForPassphrase:(id)a3;
- (id)unwrappedKey;
- (void)decryptAndMergeEncryptedJSON:(id)a3;
- (void)initializeCryptoPropertiesFromObject:(id)a3;
- (void)rewrapAndDivergeKeyUsingPassphrase:(id)a3;
- (void)rewrapKeyWithNewMainKey:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 hint:(id)a6;
- (void)saveEncryptedJSON;
@end

@implementation ICCloudSyncingObjectCryptoStrategyV1

- (void)initializeCryptoPropertiesFromObject:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(ICCryptoStrategyBase *)self object];
    v7 = [v6 shortLoggingDescription];
    v8 = [v4 shortLoggingDescription];
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Initializing crypto properties from original object… {object: %@, originalObject: %@}", buf, 0x16u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke;
  v14[3] = &unk_1E64A52D8;
  id v9 = v4;
  id v15 = v9;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v14];
  v10 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = [(ICCryptoStrategyBase *)self object];
    v12 = [v11 shortLoggingDescription];
    v13 = [v9 shortLoggingDescription];
    *(_DWORD *)buf = 138412546;
    v17 = v12;
    __int16 v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_1C3A61000, v10, OS_LOG_TYPE_INFO, "Initialized crypto properties from original object {object: %@, originalObject: %@}", buf, 0x16u);
  }
}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[ICAuthenticationState sharedState];
  v6 = *(void **)(a1 + 32);
  v5 = (id *)(a1 + 32);
  v7 = [v6 identifier];
  uint64_t v8 = [v4 cachedMainKeyForIdentifier:v7];

  id v9 = +[ICAuthenticationState sharedState];
  v10 = [v3 cloudAccount];
  v11 = [v10 identifier];
  uint64_t v12 = [v9 cachedMainKeyForIdentifier:v11];

  if (v8 | v12)
  {
    if (v8)
    {
      os_log_t v13 = (os_log_t)(id)v8;
      v14 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_2();
      }
    }
    else
    {
      if (!v12)
      {
        os_log_t v13 = 0;
        goto LABEL_14;
      }
      os_log_t v13 = (os_log_t)(id)v12;
      v14 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_3();
      }
    }

LABEL_14:
    v16 = [v13 keyData];
    v17 = [v13 keyData];
    id v28 = 0;
    __int16 v18 = +[ICCipherV1 wrapKey:v16 withWrapper:v17 error:&v28];
    id v15 = (ICCloudSyncingObjectCryptoStrategyV1 *)v28;

    if (v18)
    {
      v19 = [v13 metadata];
      objc_msgSend(v3, "setCryptoIterationCount:", objc_msgSend(v19, "passphraseIterationCount"));

      uint64_t v20 = [v13 metadata];
      v21 = [v20 passphraseSalt];
      [v3 setCryptoSalt:v21];

      [v3 setCryptoWrappedKey:v18];
      v22 = [v13 metadata];
      v23 = [v22 passphraseHint];
      [v3 setPasswordHint:v23];

      os_log_t v24 = +[ICAuthenticationState sharedState];
      [v24 setCachedMainKey:v13 forObject:v3];
    }
    else
    {
      os_log_t v24 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_1();
      }
    }
    goto LABEL_20;
  }
  if ([*v5 isPasswordProtected]
    && !+[ICCryptoStrategyFactory cipherVersionForObject:*v5])
  {
    v25 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_4();
    }

    objc_msgSend(v3, "setCryptoIterationCount:", objc_msgSend(*v5, "cryptoIterationCount"));
    v26 = [*v5 cryptoSalt];
    [v3 setCryptoSalt:v26];

    v27 = [*v5 cryptoWrappedKey];
    [v3 setCryptoWrappedKey:v27];

    id v15 = [(ICCryptoStrategyBase *)[ICCloudSyncingObjectCryptoStrategyV1 alloc] initWithCloudSyncingObject:*v5];
    os_log_t v13 = [(ICCloudSyncingObjectCryptoStrategyV1 *)v15 passphraseHint];
    [v3 setPasswordHint:v13];
  }
  else
  {
    os_log_t v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_5(v3);
    }
    id v15 = (ICCloudSyncingObjectCryptoStrategyV1 *)v13;
  }
LABEL_20:
}

- (ICEncryptionMetadata)primaryMetadata
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__64;
  id v9 = __Block_byref_object_dispose__64;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__ICCloudSyncingObjectCryptoStrategyV1_primaryMetadata__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionMetadata *)v2;
}

void __55__ICCloudSyncingObjectCryptoStrategyV1_primaryMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  uint64_t v5 = [v3 cryptoSalt];
  uint64_t v6 = [v3 cryptoIterationCount];
  uint64_t v7 = [v3 passwordHint];
  uint64_t v8 = +[ICEncryptionMetadata makeForV1CipherWithObjectIdentifier:v4 salt:v5 iterationCount:v6 hint:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __55__ICCloudSyncingObjectCryptoStrategyV1_primaryMetadata__block_invoke_cold_1(v3);
    }
  }
}

- (ICEncryptionKey)primaryWrappedKey
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__64;
  uint64_t v9 = __Block_byref_object_dispose__64;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke;
  v4[3] = &unk_1E64A50F8;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionKey *)v2;
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 cryptoWrappedKey];
  if (!v4)
  {
    id v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke_cold_1(v3);
    }
    goto LABEL_7;
  }
  uint64_t v5 = [ICEncryptionKey alloc];
  uint64_t v6 = [*(id *)(a1 + 32) primaryMetadata];
  uint64_t v7 = [(ICEncryptionKey *)v5 initWithKeyData:v4 metadata:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke_cold_2(v3);
    }
LABEL_7:
  }
}

- (ICEncryptionObject)primaryEncryptionObject
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__64;
  uint64_t v9 = __Block_byref_object_dispose__64;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__ICCloudSyncingObjectCryptoStrategyV1_primaryEncryptionObject__block_invoke;
  v4[3] = &unk_1E64A50F8;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionObject *)v2;
}

void __63__ICCloudSyncingObjectCryptoStrategyV1_primaryEncryptionObject__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 unappliedEncryptedRecord];
  uint64_t v4 = [v9 primaryEncryptedDataFromRecord:v3];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
  }
  else
  {
    uint64_t v5 = [v9 primaryEncryptedData];

    if (!v5) {
      goto LABEL_5;
    }
  }
  uint64_t v6 = [*(id *)(a1 + 32) encryptionObjectWithData:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

LABEL_5:
}

- (id)encryptionObjectWithData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__64;
  id v15 = __Block_byref_object_dispose__64;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke;
  v8[3] = &unk_1E64A51C0;
  v8[4] = self;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) primaryMetadata];
  if (!v4)
  {
    id v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_1(v3);
    }
    id v5 = v9;
    goto LABEL_12;
  }
  id v5 = [v3 cryptoWrappedKey];
  if (!v5)
  {
    id v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_2(v3);
    }
    goto LABEL_11;
  }
  id v6 = [[ICEncryptionObject alloc] initWithMetadata:v4 wrappedEncryptionKey:v5 encryptedData:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_3(v3);
    }
LABEL_11:

LABEL_12:
  }
}

- (BOOL)saveEncryptedJSON
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(ICCloudSyncingObjectCryptoStrategyV1 *)self saveEncryptedJSON];
  }

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke;
  v10[3] = &unk_1E64A5170;
  v10[4] = self;
  v10[5] = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v10];
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [(ICCryptoStrategyBase *)self object];
    uint64_t v8 = [v7 shortLoggingDescription];
    id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v12 + 24)];
    *(_DWORD *)buf = 138413058;
    id v16 = v8;
    __int16 v17 = 2112;
    __int16 v19 = 2080;
    __int16 v18 = v9;
    uint64_t v20 = "-[ICCloudSyncingObjectCryptoStrategyV1 saveEncryptedJSON]";
    __int16 v21 = 1024;
    int v22 = 201;
    _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "Saved encrypted values {object: %@, success: %@}%s:%d", buf, 0x26u);
  }
  char v5 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 supportsEncryptedValuesDictionary])
  {
    if ([*(id *)(a1 + 32) isAuthenticated])
    {
      id v4 = [v3 serializedValuesToEncrypt];
      if (v4)
      {
        char v5 = objc_opt_class();
        id v6 = [v3 serializedValuesToEncrypt];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_9;
        v14[3] = &unk_1E64A4240;
        id v15 = v3;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_2;
        v11[3] = &unk_1E64A4268;
        uint64_t v7 = v15;
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v12 = v7;
        uint64_t v13 = v8;
        [v5 encryptWithMainKeyOfObject:v7 dataToEncrypt:v6 failureHandler:v14 successHandler:v11];

        id v9 = v15;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        id v9 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = [v3 shortLoggingDescription];
          *(_DWORD *)buf = 138412290;
          __int16 v17 = v10;
          _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "No encrypted values to save — skipping {object: %@}", buf, 0xCu);
        }
      }
    }
    else
    {
      id v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_cold_1(v3);
      }
      id v4 = v9;
    }
  }
}

uint64_t __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_9(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_9_cold_1(a1);
  }

  return [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObjectCryptoStrategyV1 saveEncryptedJSON]_block_invoke" simulateCrash:1 showAlert:1 format:@"Error encrypting JSON"];
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  [v7 setEncryptedValuesJSON:a2];
  [*(id *)(a1 + 32) setCryptoInitializationVector:v8];

  [*(id *)(a1 + 32) setCryptoTag:v9];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (id)encryptData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy__64;
  id v15 = __Block_byref_object_dispose__64;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke;
  v8[3] = &unk_1E64A5148;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_class();
  uint64_t v5 = a1[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_2;
  v11[3] = &unk_1E64A4240;
  id v12 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_16;
  v8[3] = &unk_1E64A9B30;
  uint64_t v6 = a1[6];
  id v9 = v12;
  uint64_t v10 = v6;
  v8[4] = a1[4];
  id v7 = v12;
  [v4 encryptWithMainKeyOfObject:v7 dataToEncrypt:v5 failureHandler:v11 successHandler:v8];
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_2(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_2_cold_1(a1);
  }
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_16(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v12 = a3;
  uint64_t v9 = [v7 encryptionObjectWithData:a2];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  [*(id *)(a1 + 40) setCryptoInitializationVector:v8];
  [*(id *)(a1 + 40) setCryptoTag:v12];
}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke;
  v11[3] = &unk_1E64A9B58;
  char v14 = &v15;
  void v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke_2;
  v8[3] = &unk_1E64A9108;
  id v9 = v3;
  id v7 = v3;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v4 encryptFileFromURL:v5 toURL:v6 setTagAndIVHandler:v8];
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setCryptoTag:a2];
  [*(id *)(a1 + 32) setCryptoInitializationVector:v6];
}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4 setTagAndIVHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke;
  v15[3] = &unk_1E64A9BA8;
  id v11 = v8;
  id v16 = v11;
  uint64_t v17 = self;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  uint64_t v20 = &v21;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v15];
  LOBYTE(self) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)self;
}

void __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__64;
  v36 = __Block_byref_object_dispose__64;
  id v37 = 0;
  id v4 = [v3 managedObjectContext];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_2;
  v29[3] = &unk_1E64A4528;
  v31 = &v32;
  id v5 = v3;
  id v30 = v5;
  [v4 performBlockAndWait:v29];

  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__64;
  v27 = __Block_byref_object_dispose__64;
  id v28 = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  id obj = 0;
  id v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:0 error:&obj];
  objc_storeStrong(&v28, obj);
  if (v7 && !v24[5])
  {
    id v9 = objc_opt_class();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_19;
    v15[3] = &unk_1E64A9B80;
    id v19 = &v23;
    id v16 = *(id *)(a1 + 48);
    id v17 = v5;
    uint64_t v20 = &v32;
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    id v18 = v10;
    uint64_t v21 = v11;
    [v9 encryptWithMainKeyOfObject:v17 dataToEncrypt:v7 failureHandler:0 successHandler:v15];

    id v8 = v16;
  }
  else
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v5 className];
      uint64_t v13 = v33[5];
      uint64_t v14 = v24[5];
      *(_DWORD *)buf = 138412802;
      v39 = v12;
      __int16 v40 = 2112;
      uint64_t v41 = v13;
      __int16 v42 = 2112;
      uint64_t v43 = v14;
      _os_log_error_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_ERROR, "Error loading decrypted file for %@ %@: %@", buf, 0x20u);
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v32, 8);
}

void __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_19(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
  id v11 = a2;

  uint64_t v12 = a1[4];
  uint64_t v13 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v13 + 40);
  char v14 = [v11 writeToURL:v12 options:1 error:&obj];

  objc_storeStrong((id *)(v13 + 40), obj);
  if (v14)
  {
    uint64_t v15 = a1[6];
    if (v15) {
      (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v7, v8);
    }
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
  }
  else
  {
    id v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_19_cold_1();
    }
  }
}

- (BOOL)loadDecryptedValuesIfNecessary
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__ICCloudSyncingObjectCryptoStrategyV1_loadDecryptedValuesIfNecessary__block_invoke;
  v4[3] = &unk_1E64A5170;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __70__ICCloudSyncingObjectCryptoStrategyV1_loadDecryptedValuesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isAuthenticated])
  {
    if ([v3 needsToLoadDecryptedValues])
    {
      id v4 = [v3 encryptedValuesJSON];
      if (v4)
      {
        uint64_t v5 = *(void **)(a1 + 32);
        uint64_t v6 = [v3 encryptedValuesJSON];
        [v5 decryptAndMergeEncryptedJSON:v6];

        [v3 setNeedsToLoadDecryptedValues:0];
        uint64_t v7 = [v3 managedObjectContext];
        uint64_t v8 = [v7 concurrencyType];

        if (v8 == 2) {
          [v3 mergeUnappliedEncryptedRecord];
        }
      }
      else
      {
        id v11 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [v3 shortLoggingDescription];
          int v13 = 138412290;
          char v14 = v12;
          _os_log_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_INFO, "Cannot load decrypted values because encrypted values JSON is nil — succeeding {object: %@}", (uint8_t *)&v13, 0xCu);
        }
        [v3 setNeedsToLoadDecryptedValues:0];
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v3 shortLoggingDescription];
      int v13 = 138412290;
      char v14 = v10;
      _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Cannot load decrypted values because object is not authenticated — failing {object: %@}", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (id)decryptData:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__64;
  id v16 = __Block_byref_object_dispose__64;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_decryptData___block_invoke;
  v8[3] = &unk_1E64A51C0;
  id v5 = v4;
  id v10 = self;
  id v11 = &v12;
  id v9 = v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_decryptData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__64;
  id v17 = __Block_byref_object_dispose__64;
  id v18 = 0;
  id v4 = [v3 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_decryptData___block_invoke_2;
  v9[3] = &unk_1E64A4ED8;
  uint64_t v12 = &v13;
  id v10 = *(id *)(a1 + 32);
  id v5 = v3;
  id v11 = v5;
  [v4 performBlockAndWait:v9];

  uint64_t v6 = [(id)objc_opt_class() decryptWithMainKeyOfObject:v5 encryptedData:v14[5] fallbackAttemptSuccessCleanupHandler:0];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  _Block_object_dispose(&v13, 8);
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_decryptData___block_invoke_2(uint64_t a1)
{
  char v2 = [ICEncryptedData alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) cryptoTag];
  id v4 = [*(id *)(a1 + 40) cryptoInitializationVector];
  uint64_t v5 = [(ICEncryptedData *)v2 initWithData:v3 tag:v8 initializationVector:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)decryptedDataFromFileURL:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__64;
  uint64_t v15 = __Block_byref_object_dispose__64;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke;
  v8[3] = &unk_1E64A7D60;
  id v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke_2;
  v11[3] = &unk_1E64A4330;
  uint64_t v5 = a1[4];
  id v6 = (void *)a1[5];
  id v12 = v3;
  uint64_t v13 = v5;
  id v14 = v6;
  id v7 = v3;
  uint64_t v8 = [v4 decryptWithMainKeyOfObject:v7 encryptedDataPreparationBlock:v11 fallbackAttemptSuccessCleanupHandler:0];
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

ICEncryptedData *__65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke_2(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__64;
  v38 = __Block_byref_object_dispose__64;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__64;
  uint64_t v32 = __Block_byref_object_dispose__64;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__64;
  v26 = __Block_byref_object_dispose__64;
  id v27 = 0;
  char v2 = [*(id *)(a1 + 32) managedObjectContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke_3;
  v16[3] = &unk_1E64A9BD0;
  id v19 = &v34;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v17 = v3;
  uint64_t v18 = v4;
  uint64_t v20 = &v28;
  uint64_t v21 = &v22;
  [v2 performBlockAndWait:v16];

  uint64_t v5 = *(void *)(a1 + 48);
  id v15 = 0;
  id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:0 error:&v15];
  id v7 = v15;
  uint64_t v8 = v7;
  if (!v6 || v7)
  {

    uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [*(id *)(a1 + 32) className];
      uint64_t v14 = v35[5];
      *(_DWORD *)buf = 138412802;
      uint64_t v41 = v13;
      __int16 v42 = 2112;
      uint64_t v43 = v14;
      __int16 v44 = 2112;
      v45 = v8;
      _os_log_error_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_ERROR, "Error loading encrypted file for %@ %@: %@", buf, 0x20u);
    }
    id v6 = 0;
    id v10 = 0;
  }
  else
  {
    uint64_t v9 = [ICEncryptedData alloc];
    id v10 = [(ICEncryptedData *)v9 initWithData:v6 tag:v23[5] initializationVector:v29[5]];
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v10;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 40) fileURLEncryptionCryptoInitialzationVector];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 40) fileURLEncryptionCryptoTag];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (id)decryptWithMainKeyOfObject:(id)a3 encryptedData:(id)a4 fallbackAttemptSuccessCleanupHandler:(id)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __118__ICCloudSyncingObjectCryptoStrategyV1_decryptWithMainKeyOfObject_encryptedData_fallbackAttemptSuccessCleanupHandler___block_invoke;
  v12[3] = &unk_1E64A9BF8;
  id v13 = v8;
  id v9 = v8;
  id v10 = [a1 decryptWithMainKeyOfObject:a3 encryptedDataPreparationBlock:v12 fallbackAttemptSuccessCleanupHandler:a5];

  return v10;
}

id __118__ICCloudSyncingObjectCryptoStrategyV1_decryptWithMainKeyOfObject_encryptedData_fallbackAttemptSuccessCleanupHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)decryptWithMainKeyOfObject:(id)a3 encryptedDataPreparationBlock:(id)a4 fallbackAttemptSuccessCleanupHandler:(id)a5
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  id v9 = (void (**)(void))a5;
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__64;
  v108 = __Block_byref_object_dispose__64;
  id v109 = 0;
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x3032000000;
  v101 = __Block_byref_object_copy__64;
  v102 = __Block_byref_object_dispose__64;
  id v103 = 0;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x2020000000;
  char v97 = 0;
  id v10 = [v7 managedObjectContext];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __134__ICCloudSyncingObjectCryptoStrategyV1_decryptWithMainKeyOfObject_encryptedDataPreparationBlock_fallbackAttemptSuccessCleanupHandler___block_invoke;
  v89[3] = &unk_1E64A7C48;
  v91 = &v98;
  id v11 = v7;
  id v90 = v11;
  v92 = &v104;
  v93 = &v94;
  [v10 performBlockAndWait:v89];

  if (*((unsigned char *)v95 + 24))
  {
    id v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v11 className];
      objc_claimAutoreleasedReturnValue();
      +[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:].cold.5();
    }

    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"+[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:]" simulateCrash:1 showAlert:1 format:@"Attempt to decrypt a V1 unsupported object"];
    id v13 = 0;
    goto LABEL_5;
  }
  if (!v99[5])
  {
    id v27 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:]();
    }
LABEL_37:
    id v13 = 0;
    goto LABEL_38;
  }
  id v13 = v8[2](v8);
  if (![v13 isValid])
  {
    if (v13)
    {
      if ([v13 isValid])
      {
LABEL_5:
        uint64_t v14 = 0;
        goto LABEL_40;
      }
      id v27 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        +[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:].cold.4();
      }
      goto LABEL_38;
    }
    id v27 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:]();
    }
    goto LABEL_37;
  }
  id v15 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v81 = v9;
    uint64_t v16 = v105[5];
    id v17 = [v13 tag];
    uint64_t v18 = [v17 hash];
    id v19 = [v13 initializationVector];
    uint64_t v20 = [v19 hash];
    uint64_t v21 = [v13 data];
    uint64_t v22 = [v21 hash];
    *(_DWORD *)buf = 138413058;
    uint64_t v111 = v16;
    __int16 v112 = 2048;
    uint64_t v113 = v18;
    __int16 v114 = 2048;
    uint64_t v115 = v20;
    __int16 v116 = 2048;
    uint64_t v117 = v22;
    _os_log_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_INFO, "Decrypting %@ tag.hash=%lu initializationVector.hash=%lu encryptedData.hash=%lu", buf, 0x2Au);

    id v9 = v81;
  }

  uint64_t v23 = [v13 data];
  uint64_t v24 = v99[5];
  uint64_t v25 = [v13 tag];
  v26 = [v13 initializationVector];
  id v88 = 0;
  uint64_t v14 = +[ICCipherV1 decryptData:v23 withKey:v24 tag:v25 initializationVector:v26 error:&v88];
  id v27 = v88;

  if (v14 && !v27)
  {
    id v27 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = v9;
      uint64_t v74 = v105[5];
      v82 = [v13 tag];
      uint64_t v72 = [v82 hash];
      v76 = [v13 initializationVector];
      uint64_t v29 = [v76 hash];
      uint64_t v30 = [v13 data];
      uint64_t v31 = [v30 length];
      uint64_t v32 = [v14 length];
      uint64_t v33 = [v14 hash];
      *(_DWORD *)buf = 138413570;
      uint64_t v111 = v74;
      __int16 v112 = 2048;
      uint64_t v113 = v72;
      __int16 v114 = 2048;
      uint64_t v115 = v29;
      __int16 v116 = 2048;
      uint64_t v117 = v31;
      __int16 v118 = 2048;
      uint64_t v119 = v32;
      __int16 v120 = 2048;
      uint64_t v121 = v33;
      _os_log_impl(&dword_1C3A61000, v27, OS_LOG_TYPE_INFO, "Decrypted %@ tag.hash=%lu initializationVector.hash=%lu. encryptedData.length=%lu decryptedData.length=%lu decryptedData.hash=%lu", buf, 0x3Eu);

      id v9 = v28;
    }

    goto LABEL_39;
  }

  uint64_t v34 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v85 = v9;
    uint64_t v60 = v105[5];
    v79 = [v13 tag];
    uint64_t v61 = [v79 hash];
    v62 = [v13 initializationVector];
    uint64_t v63 = [v62 hash];
    v64 = [v13 data];
    uint64_t v65 = [v64 length];
    *(_DWORD *)buf = 138413314;
    uint64_t v111 = v60;
    __int16 v112 = 2048;
    uint64_t v113 = v61;
    __int16 v114 = 2048;
    uint64_t v115 = v63;
    __int16 v116 = 2048;
    uint64_t v117 = v65;
    __int16 v118 = 2112;
    uint64_t v119 = (uint64_t)v27;
    _os_log_error_impl(&dword_1C3A61000, v34, OS_LOG_TYPE_ERROR, "Failed to decrypt %@ with tag.hash=%lu initializationVector.hash=%lu. encryptedData.length=%lu error=%@", buf, 0x34u);

    id v9 = v85;
  }

  uint64_t v14 = [v13 fallbackTag];
  if (!v14) {
    goto LABEL_39;
  }
  v35 = [v13 fallbackInitializationVector];
  BOOL v36 = v35 == 0;

  if (v36)
  {
LABEL_38:
    uint64_t v14 = 0;
LABEL_39:

    goto LABEL_40;
  }
  id v37 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    +[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:](v37);
  }

  v38 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v83 = v9;
    uint64_t v39 = v105[5];
    v77 = [v13 fallbackTag];
    uint64_t v40 = [v77 hash];
    uint64_t v41 = [v13 fallbackInitializationVector];
    uint64_t v42 = [v41 hash];
    uint64_t v43 = [v13 data];
    uint64_t v44 = [v43 hash];
    *(_DWORD *)buf = 138413058;
    uint64_t v111 = v39;
    __int16 v112 = 2048;
    uint64_t v113 = v40;
    __int16 v114 = 2048;
    uint64_t v115 = v42;
    __int16 v116 = 2048;
    uint64_t v117 = v44;
    _os_log_impl(&dword_1C3A61000, v38, OS_LOG_TYPE_INFO, "Decrypting %@ fallbackTag.hash=%lu fallbackInitializationVector.hash=%lu encryptedData.hash=%lu", buf, 0x2Au);

    id v9 = v83;
  }

  v45 = [v13 data];
  uint64_t v46 = v99[5];
  v47 = [v13 fallbackTag];
  v48 = [v13 fallbackInitializationVector];
  id v87 = 0;
  uint64_t v14 = +[ICCipherV1 decryptData:v45 withKey:v46 tag:v47 initializationVector:v48 error:&v87];
  id v27 = v87;

  if (!v14 || v27)
  {

    v59 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v86 = v9;
      uint64_t v66 = v105[5];
      v80 = [v13 tag];
      uint64_t v67 = [v80 hash];
      v68 = [v13 initializationVector];
      uint64_t v69 = [v68 hash];
      v70 = [v13 data];
      uint64_t v71 = [v70 length];
      *(_DWORD *)buf = 138413314;
      uint64_t v111 = v66;
      __int16 v112 = 2048;
      uint64_t v113 = v67;
      __int16 v114 = 2048;
      uint64_t v115 = v69;
      __int16 v116 = 2048;
      uint64_t v117 = v71;
      __int16 v118 = 2112;
      uint64_t v119 = (uint64_t)v27;
      _os_log_error_impl(&dword_1C3A61000, v59, OS_LOG_TYPE_ERROR, "Failed to decrypt %@ with fallbackTag.hash=%lu fallbackInitializationVector.hash=%lu. encryptedData.length=%lu error=%@", buf, 0x34u);

      id v9 = v86;
    }

    goto LABEL_38;
  }
  v49 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    v50 = v9;
    uint64_t v75 = v105[5];
    v84 = [v13 fallbackTag];
    uint64_t v73 = [v84 hash];
    v78 = [v13 fallbackInitializationVector];
    uint64_t v51 = [v78 hash];
    v52 = [v13 data];
    uint64_t v53 = [v52 length];
    uint64_t v54 = [v14 length];
    uint64_t v55 = [v14 hash];
    *(_DWORD *)buf = 138413570;
    uint64_t v111 = v75;
    __int16 v112 = 2048;
    uint64_t v113 = v73;
    __int16 v114 = 2048;
    uint64_t v115 = v51;
    __int16 v116 = 2048;
    uint64_t v117 = v53;
    __int16 v118 = 2048;
    uint64_t v119 = v54;
    __int16 v120 = 2048;
    uint64_t v121 = v55;
    _os_log_impl(&dword_1C3A61000, v49, OS_LOG_TYPE_INFO, "Decrypted %@ fallbackTag.hash=%lu fallbackInitializationVector.hash=%lu. encryptedData.length=%lu decryptedData.length=%lu decryptedData.hash=%lu", buf, 0x3Eu);

    id v9 = v50;
  }

  if (v9) {
    v9[2](v9);
  }
LABEL_40:
  v56 = v90;
  id v57 = v14;

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);

  _Block_object_dispose(&v104, 8);
  return v57;
}

uint64_t __134__ICCloudSyncingObjectCryptoStrategyV1_decryptWithMainKeyOfObject_encryptedDataPreparationBlock_fallbackAttemptSuccessCleanupHandler___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = [*(id *)(a1 + 32) cryptoStrategy];
  uint64_t v3 = ICCheckedDynamicCast();
  uint64_t v4 = [v3 unwrappedKey];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [*(id *)(a1 + 32) shortLoggingDescription];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t result = [*(id *)(a1 + 32) isUnsupported];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)encryptSidecarData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__64;
  id v15 = __Block_byref_object_dispose__64;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke;
  v8[3] = &unk_1E64A5148;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isAuthenticated])
  {
    id v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_25;
    v8[3] = &unk_1E64A4240;
    id v9 = v3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_2;
    v7[3] = &unk_1E64A9C20;
    v7[4] = *(void *)(a1 + 48);
    [v4 encryptWithMainKeyOfObject:v9 dataToEncrypt:v5 failureHandler:v8 successHandler:v7];
    id v6 = v9;
  }
  else
  {
    id v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_cold_1();
    }
  }
}

uint64_t __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_25()
{
  v0 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_25_cold_1();
  }

  return [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObjectCryptoStrategyV1 encryptSidecarData:]_block_invoke" simulateCrash:1 showAlert:1 format:@"Error encrypting V1 sidecar data"];
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v14 = objc_alloc_init(v7);
  [v14 appendData:v9];

  [v14 appendData:v8];
  [v14 appendData:v10];

  uint64_t v11 = [v14 copy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (id)decryptSidecarData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__64;
  id v15 = __Block_byref_object_dispose__64;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke;
  v8[3] = &unk_1E64A5148;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isAuthenticated])
  {
    if ((unint64_t)[*(id *)(a1 + 40) length] >= 0x20)
    {
      id v5 = objc_opt_class();
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_30;
      v9[3] = &unk_1E64A9C48;
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = 32;
      uint64_t v6 = [v5 decryptWithMainKeyOfObject:v3 encryptedDataPreparationBlock:v9 fallbackAttemptSuccessCleanupHandler:0];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v4 = v10;
      goto LABEL_9;
    }
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_cold_1();
    }
  }
  else
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_cold_2();
    }
  }

LABEL_9:
}

ICEncryptedData *__59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_30(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 0, 16);
  id v3 = objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 16, 16);
  id v4 = objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 32, objc_msgSend(*(id *)(a1 + 32), "length") - *(void *)(a1 + 40));
  id v5 = [[ICEncryptedData alloc] initWithData:v4 tag:v2 initializationVector:v3];

  return v5;
}

- (BOOL)encryptSidecarFileFromURL:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke;
  v13[3] = &unk_1E64A9C98;
  id v9 = v8;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  id v16 = self;
  id v11 = v7;
  id v17 = v11;
  uint64_t v18 = &v19;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v13];
  LOBYTE(self) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2;
  v12[3] = &unk_1E64A9C70;
  id v6 = (void *)a1[7];
  void v12[4] = a1[6];
  id v7 = v6;
  uint64_t v8 = a1[8];
  id v13 = v7;
  uint64_t v15 = v8;
  id v9 = v3;
  id v14 = v9;
  [v4 coordinateReadingItemAtURL:v5 options:1 error:&v16 byAccessor:v12];
  id v10 = v16;
  if (v10)
  {
    id v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_cold_1();
    }
  }
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v12 = 0;
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a2 options:0 error:&v12];
  id v4 = v12;
  if (![v3 length])
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_1();
    }

    goto LABEL_11;
  }
  uint64_t v5 = [*(id *)(a1 + 32) encryptSidecarData:v3];
  if (![v5 length])
  {
    id v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_2();
    }

LABEL_11:
    id v8 = v4;
    goto LABEL_15;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = v4;
  int v7 = [v5 writeToURL:v6 options:1 error:&v11];
  id v8 = v11;

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    id v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_3();
    }
  }
LABEL_15:
}

- (NSData)fileURLEncryptionCryptoTag
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__64;
  id v9 = __Block_byref_object_dispose__64;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__ICCloudSyncingObjectCryptoStrategyV1_fileURLEncryptionCryptoTag__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSData *)v2;
}

void __66__ICCloudSyncingObjectCryptoStrategyV1_fileURLEncryptionCryptoTag__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 cryptoTag];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSData)fileURLEncryptionCryptoInitialzationVector
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__64;
  id v9 = __Block_byref_object_dispose__64;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__ICCloudSyncingObjectCryptoStrategyV1_fileURLEncryptionCryptoInitialzationVector__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSData *)v2;
}

void __82__ICCloudSyncingObjectCryptoStrategyV1_fileURLEncryptionCryptoInitialzationVector__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 cryptoInitializationVector];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)encryptWithMainKeyOfObject:(id)a3 dataToEncrypt:(id)a4 failureHandler:(id)a5 successHandler:(id)a6
{
  id v10 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __111__ICCloudSyncingObjectCryptoStrategyV1_encryptWithMainKeyOfObject_dataToEncrypt_failureHandler_successHandler___block_invoke;
  v12[3] = &unk_1E64A9CC0;
  id v13 = v10;
  id v11 = v10;
  [a1 encryptWithMainKeyOfObject:a3 dataPreparationBlock:v12 failureHandler:a5 successHandler:a6];
}

id __111__ICCloudSyncingObjectCryptoStrategyV1_encryptWithMainKeyOfObject_dataToEncrypt_failureHandler_successHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)encryptWithMainKeyOfObject:(id)a3 dataPreparationBlock:(id)a4 failureHandler:(id)a5 successHandler:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void (**)(void))a4;
  id v11 = (void (**)(void))a5;
  id v12 = (void (**)(id, void *, id, NSObject *))a6;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__64;
  v49 = __Block_byref_object_dispose__64;
  id v50 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__64;
  uint64_t v43 = __Block_byref_object_dispose__64;
  id v44 = 0;
  uint64_t v35 = 0;
  BOOL v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  id v13 = [v9 managedObjectContext];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __118__ICCloudSyncingObjectCryptoStrategyV1_encryptWithMainKeyOfObject_dataPreparationBlock_failureHandler_successHandler___block_invoke;
  v30[3] = &unk_1E64A7C48;
  uint64_t v32 = &v39;
  id v14 = v9;
  id v31 = v14;
  uint64_t v33 = &v45;
  uint64_t v34 = &v35;
  [v13 performBlockAndWait:v30];

  if (*((unsigned char *)v36 + 24))
  {
    uint64_t v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [v14 className];
      objc_claimAutoreleasedReturnValue();
      +[ICCloudSyncingObjectCryptoStrategyV1 encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:]();
    }

    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"+[ICCloudSyncingObjectCryptoStrategyV1 encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:]" simulateCrash:1 showAlert:1 format:@"Attempt to encrypt a V1 unsupported object"];
    goto LABEL_22;
  }
  if (!v40[5])
  {
    char v22 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      [v14 className];
      objc_claimAutoreleasedReturnValue();
      +[ICCloudSyncingObjectCryptoStrategyV1 encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:]();
    }
    id v16 = v22;
    goto LABEL_21;
  }
  id v16 = v10[2](v10);
  if (!v16)
  {
    uint64_t v20 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      [v14 className];
      objc_claimAutoreleasedReturnValue();
      +[ICCloudSyncingObjectCryptoStrategyV1 encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:]();
    }
    char v22 = v20;
    goto LABEL_20;
  }
  uint64_t v17 = v40[5];
  id v28 = 0;
  id v29 = 0;
  id v27 = 0;
  uint64_t v18 = +[ICCipherV1 encryptData:v16 withKey:v17 tag:&v29 initializationVector:&v28 error:&v27];
  id v19 = v29;
  uint64_t v20 = v28;
  uint64_t v21 = v27;
  char v22 = v21;
  if (!v18 || v21)
  {
    uint64_t v23 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = [v14 className];
      uint64_t v25 = v46[5];
      *(_DWORD *)buf = 138412802;
      uint64_t v52 = v24;
      __int16 v53 = 2112;
      uint64_t v54 = v25;
      __int16 v55 = 2112;
      v56 = v22;
      v26 = (void *)v24;
      _os_log_error_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_ERROR, "Error encrypting data for %@ %@: %@", buf, 0x20u);
    }
LABEL_20:

LABEL_21:
LABEL_22:
    if (v11) {
      v11[2](v11);
    }
    uint64_t v18 = 0;
    id v19 = 0;
    uint64_t v20 = 0;
    goto LABEL_25;
  }

  if (v12) {
    v12[2](v12, v18, v19, v20);
  }
LABEL_25:

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

uint64_t __118__ICCloudSyncingObjectCryptoStrategyV1_encryptWithMainKeyOfObject_dataPreparationBlock_failureHandler_successHandler___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) cryptoStrategy];
  uint64_t v3 = ICCheckedDynamicCast();
  uint64_t v4 = [v3 unwrappedKey];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [*(id *)(a1 + 32) identifier];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t result = [*(id *)(a1 + 32) isUnsupported];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__ICCloudSyncingObjectCryptoStrategyV1_mergeEncryptedDataFromRecord___block_invoke;
  v7[3] = &unk_1E64A5148;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __69__ICCloudSyncingObjectCryptoStrategyV1_mergeEncryptedDataFromRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isAuthenticated])
  {
    id v4 = objc_msgSend(*(id *)(a1 + 40), "ic_inlineableDataAssetForKeyPrefix:", @"EncryptedValues");
    [*(id *)(a1 + 32) loadDecryptedValuesIfNecessary];
    [v3 mergeCryptoTagAndInitializationVectorFromRecord:*(void *)(a1 + 40)];
    if (!v4) {
      goto LABEL_6;
    }
    id v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v3 className];
      uint64_t v7 = [v3 identifier];
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Merging encrypted values from cloud for %@ (%@)", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(a1 + 32) decryptAndMergeEncryptedJSON:v4];
    if ([*(id *)(a1 + 32) saveEncryptedJSON])
    {
LABEL_6:
      [v3 setUnappliedEncryptedRecord:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    [v3 setUnappliedEncryptedRecord:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)decryptAndMergeEncryptedJSON:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__ICCloudSyncingObjectCryptoStrategyV1_decryptAndMergeEncryptedJSON___block_invoke;
  v6[3] = &unk_1E64A51E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v6];
}

void __69__ICCloudSyncingObjectCryptoStrategyV1_decryptAndMergeEncryptedJSON___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 className];
    uint64_t v6 = [v3 identifier];
    int v9 = 138412546;
    __int16 v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "Merging encrypted JSON for %@ (%@)", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) decryptData:*(void *)(a1 + 40)];
  if (v7)
  {
    [v3 deserializeAndMergeValues:v7];
  }
  else
  {
    int v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __69__ICCloudSyncingObjectCryptoStrategyV1_decryptAndMergeEncryptedJSON___block_invoke_cold_1(v3, v8);
    }

    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudSyncingObjectCryptoStrategyV1 decryptAndMergeEncryptedJSON:]_block_invoke" simulateCrash:1 showAlert:1 format:@"Error decrypting JSON"];
  }
}

- (BOOL)recordHasChangedPassphrase:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ICCloudSyncingObjectCryptoStrategyV1_recordHasChangedPassphrase___block_invoke;
  v7[3] = &unk_1E64A5170;
  id v5 = v4;
  id v8 = v5;
  int v9 = &v10;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __67__ICCloudSyncingObjectCryptoStrategyV1_recordHasChangedPassphrase___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CryptoWrappedKey"];
  ICCheckedDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v3 cryptoWrappedKey];

  id v6 = (id)*MEMORY[0x1E4F1D260];
  if ((void *)*MEMORY[0x1E4F1D260] == v5) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }
  unint64_t v8 = v7;
  if (v6 == v14) {
    int v9 = 0;
  }
  else {
    int v9 = v14;
  }
  unint64_t v10 = v9;
  __int16 v11 = (void *)v10;
  if (v8 | v10)
  {
    if (v8) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      char v13 = 1;
    }
    else {
      char v13 = [(id)v8 isEqual:v10] ^ 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13;
}

- (id)unwrappedKey
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unint64_t v8 = __Block_byref_object_copy__64;
  int v9 = __Block_byref_object_dispose__64;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_unwrappedKey__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_unwrappedKey__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[ICAuthenticationState sharedState];
  uint64_t v5 = [v4 cachedMainKeyForObject:v3];

  if (!v5)
  {
    BOOL v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      char v13 = [v3 className];
      id v14 = [v3 identifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v14;
      _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_INFO, "Could not get main key to decrypt %@ (%@)", buf, 0x16u);
    }
    int v9 = v12;
    goto LABEL_9;
  }
  id v6 = [v3 cryptoWrappedKey];
  uint64_t v7 = [v5 keyData];
  id v15 = 0;
  uint64_t v8 = +[ICCipherV1 unwrapKey:v6 withWrapper:v7 error:&v15];
  int v9 = v15;
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    BOOL v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __52__ICCloudSyncingObjectCryptoStrategyV1_unwrappedKey__block_invoke_cold_1();
    }

LABEL_9:
  }
}

- (BOOL)mainKeyDecryptsPrimaryData:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ICCloudSyncingObjectCryptoStrategyV1_mainKeyDecryptsPrimaryData___block_invoke;
  v7[3] = &unk_1E64A7D60;
  int v9 = &v10;
  void v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __67__ICCloudSyncingObjectCryptoStrategyV1_mainKeyDecryptsPrimaryData___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) canMainKey:*(void *)(a1 + 40) decryptObject:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)canMainKey:(id)a3 decryptObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 metadata];
  uint64_t v8 = [v7 cipherVersion];

  if (v8)
  {
    BOOL v9 = 0;
  }
  else
  {
    objc_opt_class();
    uint64_t v10 = ICDynamicCast();
    uint64_t v11 = [v10 cryptoVerifier];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
    }
    else
    {
      uint64_t v12 = [v6 cryptoWrappedKey];

      if (!v12)
      {
        BOOL v9 = 1;
        goto LABEL_18;
      }
    }
    char v13 = [v5 keyData];
    id v19 = 0;
    id v14 = +[ICCipherV1 unwrapKey:v12 withWrapper:v13 error:&v19];
    id v15 = v19;

    if (v15) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v14 == 0;
    }
    BOOL v9 = !v16;
    if (v16)
    {
      uint64_t v17 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudSyncingObjectCryptoStrategyV1 canMainKey:decryptObject:]();
      }
    }
  }
LABEL_18:

  return v9;
}

- (void)rewrapKeyWithNewMainKey:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 hint:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__ICCloudSyncingObjectCryptoStrategyV1_rewrapKeyWithNewMainKey_salt_iterationCount_hint___block_invoke;
  v16[3] = &unk_1E64A9CE8;
  void v16[4] = self;
  id v17 = v10;
  id v19 = v12;
  unint64_t v20 = a5;
  id v18 = v11;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v16];
}

void __89__ICCloudSyncingObjectCryptoStrategyV1_rewrapKeyWithNewMainKey_salt_iterationCount_hint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) unwrappedKey];
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v21 = 0;
    id v6 = +[ICCipherV1 wrapKey:v4 withWrapper:v5 error:&v21];
    uint64_t v7 = v21;
    if (v6)
    {
      [v3 setCryptoIterationCount:*(void *)(a1 + 64)];
      [v3 setCryptoSalt:*(void *)(a1 + 48)];
      [v3 setCryptoWrappedKey:v6];
      [v3 setPasswordHint:*(void *)(a1 + 56)];
      [v3 updateChangeCountWithReason:@"Rewrapped object"];
      uint64_t v8 = [v3 identifier];
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 64);
      id v11 = [v3 passwordHint];
      id v12 = +[ICEncryptionMetadata makeForV1CipherWithObjectIdentifier:v8 salt:v9 iterationCount:v10 hint:v11];

      if (v12) {
        id v13 = [[ICEncryptionKey alloc] initWithKeyData:*(void *)(a1 + 40) metadata:v12];
      }
      else {
        id v13 = 0;
      }
      unint64_t v20 = +[ICAuthenticationState sharedState];
      [v20 setCachedMainKey:v13 forObject:v3];
    }
    else
    {
      id v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_INFO))
      {
        id v17 = objc_opt_class();
        id v18 = v17;
        id v19 = [v3 identifier];
        *(_DWORD *)buf = 138412802;
        uint64_t v23 = v17;
        __int16 v24 = 2112;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_impl(&dword_1C3A61000, &v13->super, OS_LOG_TYPE_INFO, "Could not re-wrap key for %@ (%@, %@)", buf, 0x20u);
      }
      id v12 = v13;
    }
  }
  else
  {
    id v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v14 = objc_opt_class();
      id v15 = v14;
      BOOL v16 = [v3 identifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Could not unwrap key for %@ (%@)", buf, 0x16u);
    }
    uint64_t v7 = v6;
  }
}

- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4
{
  id v5 = a3;
  if ([(ICCloudSyncingObjectCryptoStrategyV1 *)self isAuthenticated]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)rewrapWithMainKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudSyncingObjectCryptoStrategyV1 rewrapWithMainKey:](self, v5);
  }

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E64A5148;
  void v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  id v15 = &v16;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v13];
  id v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [(ICCryptoStrategyBase *)self object];
    id v11 = [v10 shortLoggingDescription];
    id v12 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v17 + 24)];
    *(_DWORD *)buf = 138413058;
    id v21 = v11;
    __int16 v22 = 2112;
    __int16 v24 = 2080;
    uint64_t v23 = v12;
    uint64_t v25 = "-[ICCloudSyncingObjectCryptoStrategyV1 rewrapWithMainKey:]";
    __int16 v26 = 1024;
    int v27 = 939;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped object with main key {object: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isUnsupported])
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [v3 shortLoggingDescription];
      *(_DWORD *)buf = 138412290;
      char v19 = v5;
      id v6 = "Not rewrapping object because it is unsupported {object: %@}";
LABEL_7:
      _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, v6, buf, 0xCu);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if ([v3 needsInitialFetchFromCloud])
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [v3 shortLoggingDescription];
      *(_DWORD *)buf = 138412290;
      char v19 = v5;
      id v6 = "Not rewrapping object because it needs initial fetch {object: %@}";
      goto LABEL_7;
    }
LABEL_14:
    id v7 = v4;
    goto LABEL_15;
  }
  if (([v3 mergeUnappliedEncryptedRecord] & 1) == 0)
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_2(v3);
    }
    goto LABEL_14;
  }
  id v7 = [*(id *)(a1 + 32) unwrappedKey];
  if (v7)
  {
    BOOL v8 = [*(id *)(a1 + 40) keyData];
    id v17 = 0;
    uint64_t v9 = +[ICCipherV1 wrapKey:v7 withWrapper:v8 error:&v17];
    id v4 = v17;

    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 40) metadata];
      objc_msgSend(v3, "setCryptoIterationCount:", objc_msgSend(v10, "passphraseIterationCount"));

      id v11 = [*(id *)(a1 + 40) metadata];
      id v12 = [v11 passphraseSalt];
      [v3 setCryptoSalt:v12];

      id v13 = [*(id *)(a1 + 40) metadata];
      id v14 = [v13 passphraseHint];
      [v3 setPasswordHint:v14];

      [v3 setCryptoWrappedKey:v9];
      [v3 updateChangeCountWithReason:@"Rewrapped object"];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v16 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1();
      }
    }
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v15 = [v3 shortLoggingDescription];
      *(_DWORD *)buf = 138412290;
      char v19 = v15;
      _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Not rewrapping data because unwrapped key is missing {object: %@}", buf, 0xCu);
    }
    id v4 = v9;
  }

LABEL_15:
}

- (BOOL)hasSameKeyAsObject:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_hasSameKeyAsObject___block_invoke;
  v7[3] = &unk_1E64A50F8;
  uint64_t v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_hasSameKeyAsObject___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 cryptoSalt];
  id v4 = [*(id *)(a1 + 32) cryptoSalt];
  if ([v3 isEqualToData:v4])
  {
    uint64_t v5 = [v7 cryptoIterationCount];
    BOOL v6 = v5 == [*(id *)(a1 + 32) cryptoIterationCount];
  }
  else
  {
    BOOL v6 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
}

- (void)rewrapAndDivergeKeyUsingPassphrase:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke;
  v6[3] = &unk_1E64A51E8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v6];
}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 shortLoggingDescription];
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v5;
    _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "Diverging key for object: %@", buf, 0xCu);
  }
  id v23 = 0;
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random128BitData:", &v23);
  id v7 = v23;
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v22 = v7;
    uint64_t v9 = +[ICCipherV1 keyForPassphrase:v8 salt:v6 iterationCount:20000 error:&v22];
    id v10 = v22;

    if (v9)
    {
      id v21 = v10;
      id v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random128BitData:", &v21);
      id v12 = v21;

      if (v11)
      {
        id v20 = v12;
        char v13 = +[ICCipherV1 wrapKey:v11 withWrapper:v9 error:&v20];
        id v10 = v20;

        if (v13)
        {
          id v14 = *(void **)(a1 + 40);
          uint64_t v15 = [v3 passwordHint];
          [v14 rewrapKeyWithNewMainKey:v9 salt:v6 iterationCount:20000 hint:v15];

          [v3 updateChangeCountWithReason:@"Diverged object"];
          uint64_t v16 = [v3 managedObjectContext];
          id v19 = 0;
          LOBYTE(v15) = [v16 save:&v19];
          id v17 = v19;

          if ((v15 & 1) == 0)
          {
            uint64_t v18 = os_log_create("com.apple.notes", "Crypto");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_5();
            }
          }
        }
        else
        {
          id v17 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_4();
          }
        }
      }
      else
      {
        char v13 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_3();
        }
        id v10 = v12;
      }
    }
    else
    {
      id v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_2();
      }
    }

    id v7 = v10;
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_1();
    }
  }
}

- (BOOL)hasPassphraseSet
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__ICCloudSyncingObjectCryptoStrategyV1_hasPassphraseSet__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __56__ICCloudSyncingObjectCryptoStrategyV1_hasPassphraseSet__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 cryptoSalt];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [v5 cryptoIterationCount] != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

- (NSString)passphraseHint
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__64;
  uint64_t v9 = __Block_byref_object_dispose__64;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__ICCloudSyncingObjectCryptoStrategyV1_passphraseHint__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __54__ICCloudSyncingObjectCryptoStrategyV1_passphraseHint__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSStringFromSelector(sel_passwordHint);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 primitiveValueForKey:v7];

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)isAuthenticated
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__ICCloudSyncingObjectCryptoStrategyV1_isAuthenticated__block_invoke;
  v4[3] = &unk_1E64A50F8;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __55__ICCloudSyncingObjectCryptoStrategyV1_isAuthenticated__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) hasPassphraseSet])
  {
    id v3 = +[ICAuthenticationState sharedState];
    uint64_t v4 = [v3 cachedMainKeyForObject:v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 != 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (id)mainKeyForPassphrase:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__64;
  uint64_t v15 = __Block_byref_object_dispose__64;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke;
  v8[3] = &unk_1E64A5170;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 cryptoSalt];

  if (v4)
  {
    id v5 = [v3 identifier];
    id v6 = [v3 cryptoSalt];
    uint64_t v7 = [v3 cryptoIterationCount];
    char v8 = [v3 passwordHint];
    id v9 = +[ICEncryptionMetadata makeForV1CipherWithObjectIdentifier:v5 salt:v6 iterationCount:v7 hint:v8];

    if (!v9)
    {
      id v12 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke_cold_1(v3);
      }
      uint64_t v13 = v12;
      goto LABEL_16;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [v3 cryptoSalt];
    id v19 = 0;
    id v12 = +[ICCipherV1 keyForPassphrase:salt:iterationCount:error:](ICCipherV1, "keyForPassphrase:salt:iterationCount:error:", v10, v11, [v3 cryptoIterationCount], &v19);
    uint64_t v13 = v19;

    if (v12)
    {
      id v14 = [[ICEncryptionKey alloc] initWithKeyData:v12 metadata:v9];
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
LABEL_16:

        goto LABEL_17;
      }
      id v17 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke_cold_3(v3);
      }
    }
    else
    {
      id v17 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_2();
      }
    }

    goto LABEL_16;
  }
  uint64_t v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [v3 shortLoggingDescription];
    *(_DWORD *)buf = 138412290;
    id v21 = v18;
    _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_INFO, "Cannot create main key for passphrase because object doesn't have crypto salt {object: %@}", buf, 0xCu);
  }
  id v9 = v13;
LABEL_17:
}

- (BOOL)authenticateWithPassphrase:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ICCloudSyncingObjectCryptoStrategyV1_authenticateWithPassphrase___block_invoke;
  v7[3] = &unk_1E64A5148;
  void v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __67__ICCloudSyncingObjectCryptoStrategyV1_authenticateWithPassphrase___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) mainKeyForPassphrase:*(void *)(a1 + 40)];
  if (v3)
  {
    if ([*(id *)(a1 + 32) mainKeyDecryptsPrimaryData:v3])
    {
      id v4 = +[ICAuthenticationState sharedState];
      char v5 = [v4 setCachedMainKey:v3 forObject:v9];
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v6 = a1 + 48;
      *(unsigned char *)(*(void *)(v7 + 8) + 24) = v5;
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v6 = a1 + 48;
      *(unsigned char *)(*(void *)(v8 + 8) + 24) = 0;
    }
    if (*(unsigned char *)(*(void *)(*(void *)v6 + 8) + 24)) {
      [v9 mergeUnappliedEncryptedRecord];
    }
  }
}

- (BOOL)isPassphraseCorrect:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__ICCloudSyncingObjectCryptoStrategyV1_isPassphraseCorrect___block_invoke;
  v7[3] = &unk_1E64A5148;
  void v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __60__ICCloudSyncingObjectCryptoStrategyV1_isPassphraseCorrect___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) mainKeyForPassphrase:*(void *)(a1 + 40)];
  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) canMainKey:v3 decryptObject:v4];
  }
}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot wrap encryption key {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = [v1 shortLoggingDescription];
  uint64_t v3 = [*v0 shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v4, v5, "Initializing object from original object's main key {object: %@, originalObject: %@}", v6, v7, v8, v9, v10);
}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = [v1 shortLoggingDescription];
  uint64_t v3 = [v0 cloudAccount];
  uint64_t v4 = [v3 shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v5, v6, "Initializing object from original account's main key {object: %@, account: %@}", v7, v8, v9, v10, v11);
}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = [v1 shortLoggingDescription];
  uint64_t v3 = [*v0 shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v4, v5, "Initializing object from original object's crypto goo {object: %@, originalObject: %@}", v6, v7, v8, v9, v10);
}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_5(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot initialize crypto properties {object: %@}", v4, v5, v6, v7, v8);
}

void __55__ICCloudSyncingObjectCryptoStrategyV1_primaryMetadata__block_invoke_cold_1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create primary metadata {object: %@}", v4, v5, v6, v7, v8);
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke_cold_1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create primary wrapped key because object doesn't have key data {object: %@}", v4, v5, v6, v7, v8);
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke_cold_2(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create primary wrapped key {object: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create primary encryption object because object doesn't have primary metadata {object: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_2(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create primary encryption object because object doesn't have key data {object: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_3(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot serialize encryption object {object: %@}", v4, v5, v6, v7, v8);
}

- (void)saveEncryptedJSON
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 object];
  int v4 = 138412802;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_2_0();
  int v6 = 170;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Saving encrypted values… {object: %@}%s:%d", (uint8_t *)&v4, 0x1Cu);
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_cold_1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot save encrypted values because object is not authenticated {object: %@}", v4, v5, v6, v7, v8);
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_9_cold_1(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt values JSON {object: %@}", v4, v5, v6, v7, v8);
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_2_cold_1(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt data {object: %@}", v4, v5, v6, v7, v8);
}

void __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  id v1 = [*(id *)(v0 + 40) className];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v2, v3, "Error writing decrypted file for %@ %@: %@", v4, v5, v6, v7, v8);
}

+ (void)decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_6(*MEMORY[0x1E4F143B8]);
  int v3 = 138412290;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v1, v2, "Trying to access decrypted data with no unwrapped key for %@", (uint8_t *)&v3);
}

+ (void)decryptWithMainKeyOfObject:(os_log_t)log encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:.cold.2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Unable to decrypt object - Falling back to decrypting with fallback tag and initializationVector", v1, 2u);
}

+ (void)decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_6(*MEMORY[0x1E4F143B8]);
  int v3 = 138412290;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v1, v2, "Failed to create encryptedData for %@", (uint8_t *)&v3);
}

+ (void)decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:.cold.4()
{
  OUTLINED_FUNCTION_1_6(*MEMORY[0x1E4F143B8]);
  int v3 = 138412290;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v1, v2, "Invalid encryptedData for %@", (uint8_t *)&v3);
}

+ (void)decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:.cold.5()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_2(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_9(&dword_1C3A61000, v6, v4, "Attempting to decrypt a V1 unsupported object %@ %@", v5);
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = [v1 className];
  uint64_t v3 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v4, v5, "Not authenticated to encrypt V1 sidecar data for %@ (%@)", v6, v7, v8, v9, v10);
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = [*(id *)(v1 + 32) className];
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 32), "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "Error encrypting V1 sidecar data for %@ (%@)", v6, v7, v8, v9, v10);
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  uint64_t v3 = [v2 className];
  uint8_t v10 = objc_msgSend(v1, "ic_loggingIdentifier");
  [*v0 length];
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Error decrypting V1 sidecar data for %@ (%@): data length is unexpectedly short: %lu", v6, v7, v8, v9, 2u);
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  id v2 = [v1 className];
  uint64_t v3 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v4, v5, "Not authenticated to decrypt V1 sidecar data for %@ (%@)", v6, v7, v8, v9, v10);
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  id v2 = [v1 className];
  uint64_t v3 = objc_msgSend(v0, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Error coordinating access to sidecar file for encryption for %@ %@: %@", v6, v7, v8, v9, v10);
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  id v2 = [*(id *)(v1 + 48) className];
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 48), "ic_loggingIdentifier");
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Error loading sidecar file for encryption for %@ %@: %@", v6, v7, v8, v9, v10);
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4();
  id v2 = [*(id *)(v1 + 48) className];
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 48), "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "Error encrypting sidecar file data for %@ %@", v6, v7, v8, v9, v10);
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_2_3();
  id v2 = [*(id *)(v1 + 48) className];
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 48), "ic_loggingIdentifier");
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Error writing encrypted sidecar file for %@ %@: %@", v6, v7, v8, v9, v10);
}

+ (void)encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:.cold.1()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_2(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_9(&dword_1C3A61000, v6, v4, "No key when encrypting data for %@ %@", v5);
}

+ (void)encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:.cold.2()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_2(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_9(&dword_1C3A61000, v6, v4, "Error executing dataPreparationBlock for %@ (%@)", v5);
}

+ (void)encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:.cold.3()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_2(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_9(&dword_1C3A61000, v6, v4, "Attempting to encrypt a V1 unsupported object %@ %@", v5);
}

void __69__ICCloudSyncingObjectCryptoStrategyV1_decryptAndMergeEncryptedJSON___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 className];
  uint64_t v5 = [a1 identifier];
  uint64_t v6 = [a1 cryptoTag];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [a1 cryptoInitializationVector];
  int v9 = 138413058;
  uint8_t v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v5;
  __int16 v13 = 2048;
  uint64_t v14 = v7;
  __int16 v15 = 2048;
  uint64_t v16 = [v8 hash];
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Error decrypting JSON for %@ (%@) tag.hash=%lu initializationVector.hash=%lu", (uint8_t *)&v9, 0x2Au);
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_unwrappedKey__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  uint64_t v2 = [v1 className];
  uint64_t v3 = [v0 identifier];
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Failed to unwrap text key for %@ (%@): %@", v6, v7, v8, v9, v10);
}

- (void)canMainKey:decryptObject:.cold.1()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Cannot unwrap crypto passphrase verifier {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

- (void)rewrapWithMainKey:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 object];
  uint64_t v4 = [v3 shortLoggingDescription];
  int v5 = 138412802;
  uint64_t v6 = v4;
  OUTLINED_FUNCTION_2_0();
  int v7 = 891;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Rewrapping object with main key… {object: %@}%s:%d", (uint8_t *)&v5, 0x1Cu);
}

void __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Not rewrapping data because encryption key cannot be wrapped {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_2(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping data because merging unapplied record failed {object: %@}", v4, v5, v6, v7, v8);
}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error generating salt for new password: %@", v2);
}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error generating new account key: %@", v2);
}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error generating new unwrapped verifier: %@", v2);
}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error wrapping account key verifier: %@", v2);
}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_5()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, v0, v1, "Error saving context after setting password: %@", v2);
}

void __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create encryption metadata {object: %@}", v4, v5, v6, v7, v8);
}

void __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke_cold_3(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create encryption main key {object: %@}", v4, v5, v6, v7, v8);
}

@end