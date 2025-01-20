@interface ICCloudSyncingObjectCryptoStrategyV1Neo
- (BOOL)authenticateWithPassphrase:(id)a3;
- (BOOL)hasPassphraseSet;
- (BOOL)hasSameKeyAsObject:(id)a3;
- (BOOL)isAuthenticated;
- (BOOL)isPassphraseCorrect:(id)a3;
- (BOOL)isRecordAuthenticated:(id)a3;
- (BOOL)loadDecryptedValuesIfNecessary;
- (BOOL)mainKeyDecryptsPrimaryData:(id)a3;
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)recordHasChangedPassphrase:(id)a3;
- (BOOL)rewrapWithMainKey:(id)a3;
- (BOOL)saveEncryptedJSON;
- (ICEncryptionKey)fallbackSidecarMainKey;
- (ICEncryptionKey)primaryWrappedKey;
- (ICEncryptionKey)sidecarMainKey;
- (ICEncryptionMetadata)primaryMetadata;
- (ICEncryptionObject)primaryEncryptionObject;
- (NSString)passphraseHint;
- (id)decryptData:(id)a3;
- (id)decryptObject:(id)a3 encryptionKey:(id)a4 mainKey:(id)a5;
- (id)decryptSidecarData:(id)a3;
- (id)encryptData:(id)a3;
- (id)encryptData:(id)a3 encryptionKey:(id)a4 mainKey:(id)a5;
- (id)encryptSidecarData:(id)a3;
- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4;
- (id)mainKeyForPassphrase:(id)a3;
- (id)sidecarMainKeyCreateIfNeeded;
- (int64_t)intrinsicNotesVersion;
- (void)initializeCryptoPropertiesFromObject:(id)a3;
- (void)saveEncryptedJSON;
@end

@implementation ICCloudSyncingObjectCryptoStrategyV1Neo

- (int64_t)intrinsicNotesVersion
{
  return 13;
}

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
  v14[2] = __80__ICCloudSyncingObjectCryptoStrategyV1Neo_initializeCryptoPropertiesFromObject___block_invoke;
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

void __80__ICCloudSyncingObjectCryptoStrategyV1Neo_initializeCryptoPropertiesFromObject___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  if ([*(id *)(a1 + 32) isPasswordProtected]
    && +[ICCryptoStrategyFactory cipherVersionForObject:*(void *)(a1 + 32)] == 2)
  {
    v3 = +[ICAuthenticationState sharedState];
    id v4 = [*(id *)(a1 + 32) identifier];
    v5 = [v3 cachedMainKeyForIdentifier:v4];

    if (v5)
    {
LABEL_7:
      v14 = +[ICAuthenticationState sharedState];
      [v14 setCachedMainKey:v5 forObject:v15];
    }
  }
  else
  {
    v6 = [v15 cloudAccount];
    v7 = [v6 accountData];
    v8 = [v7 identifier];

    id v9 = v15;
    if (!v8) {
      goto LABEL_9;
    }
    v10 = +[ICAuthenticationState sharedState];
    v11 = [v15 cloudAccount];
    v12 = [v11 accountData];
    v13 = [v12 identifier];
    v5 = [v10 cachedMainKeyForIdentifier:v13];

    if (v5) {
      goto LABEL_7;
    }
  }

  id v9 = v15;
LABEL_9:
}

- (ICEncryptionMetadata)primaryMetadata
{
  v2 = [(ICCloudSyncingObjectCryptoStrategyV1Neo *)self primaryEncryptionObject];
  v3 = [v2 metadata];

  return (ICEncryptionMetadata *)v3;
}

- (ICEncryptionKey)primaryWrappedKey
{
  v2 = [(ICCloudSyncingObjectCryptoStrategyV1Neo *)self primaryEncryptionObject];
  if (v2)
  {
    v3 = [ICEncryptionKey alloc];
    id v4 = [v2 wrappedEncryptionKey];
    v5 = [v2 metadata];
    v6 = [(ICEncryptionKey *)v3 initWithKeyData:v4 metadata:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ICEncryptionObject)primaryEncryptionObject
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__13;
  id v9 = __Block_byref_object_dispose__13;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__ICCloudSyncingObjectCryptoStrategyV1Neo_primaryEncryptionObject__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionObject *)v2;
}

void __66__ICCloudSyncingObjectCryptoStrategyV1Neo_primaryEncryptionObject__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 unappliedEncryptedRecord];
  uint64_t v5 = [v3 primaryEncryptedDataFromRecord:v4];
  if (v5)
  {
    v6 = (void *)v5;
  }
  else
  {
    v6 = [v3 primaryEncryptedData];

    if (!v6) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = [[ICEncryptionObject alloc] initWithSerializedData:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __60__ICCloudSyncingObjectCryptoStrategyV2_accountKeyIdentifier__block_invoke_cold_1(v3);
    }
  }
LABEL_8:
}

- (BOOL)isAuthenticated
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__ICCloudSyncingObjectCryptoStrategyV1Neo_isAuthenticated__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __58__ICCloudSyncingObjectCryptoStrategyV1Neo_isAuthenticated__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = +[ICAuthenticationState sharedState];
  id v4 = [v5 cachedMainKeyForObject:v3];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4 != 0;
}

- (BOOL)hasPassphraseSet
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__ICCloudSyncingObjectCryptoStrategyV1Neo_hasPassphraseSet__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __59__ICCloudSyncingObjectCryptoStrategyV1Neo_hasPassphraseSet__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 unappliedEncryptedRecord];
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    id v4 = [v5 primaryEncryptedData];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4 != 0;
  }
}

- (NSString)passphraseHint
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__13;
  id v9 = __Block_byref_object_dispose__13;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__ICCloudSyncingObjectCryptoStrategyV1Neo_passphraseHint__block_invoke;
  v4[3] = &unk_1E64A50F8;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __57__ICCloudSyncingObjectCryptoStrategyV1Neo_passphraseHint__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) primaryMetadata];
  uint64_t v2 = [v5 passphraseHint];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)mainKeyForPassphrase:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__13;
  id v15 = __Block_byref_object_dispose__13;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke;
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

void __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) primaryMetadata];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [v4 passphraseSalt];
    id v14 = 0;
    char v8 = +[ICCipherV1Neo keyForPassphrase:salt:iterationCount:error:](ICCipherV1Neo, "keyForPassphrase:salt:iterationCount:error:", v6, v7, [v5 passphraseIterationCount], &v14);
    id v9 = v14;

    if (!v8)
    {
      uint64_t v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_2();
      }
      goto LABEL_11;
    }
    id v10 = [[ICEncryptionKey alloc] initWithKeyData:v8 metadata:v5];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_3(v3);
      }
LABEL_11:
    }
  }
  else
  {
    char v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_1(v3);
    }
    id v9 = v8;
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
  v7[2] = __63__ICCloudSyncingObjectCryptoStrategyV1Neo_isPassphraseCorrect___block_invoke;
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

void __63__ICCloudSyncingObjectCryptoStrategyV1Neo_isPassphraseCorrect___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mainKeyForPassphrase:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = v2;
    char v3 = [*(id *)(a1 + 32) mainKeyDecryptsPrimaryData:v2];
    uint64_t v2 = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  }
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
  v7[2] = __70__ICCloudSyncingObjectCryptoStrategyV1Neo_authenticateWithPassphrase___block_invoke;
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

void __70__ICCloudSyncingObjectCryptoStrategyV1Neo_authenticateWithPassphrase___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  char v3 = [*(id *)(a1 + 32) mainKeyForPassphrase:*(void *)(a1 + 40)];
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

- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13;
  uint64_t v20 = __Block_byref_object_dispose__13;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke;
  v12[3] = &unk_1E64A5148;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v15 = &v16;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[ICAuthenticationState sharedState];
  char v5 = [v4 cachedMainKeyForObject:v3];

  if (v5)
  {
    id v6 = [[ICEncryptionObject alloc] initWithSerializedData:*(void *)(a1 + 32)];
    id v7 = v6;
    if (v6)
    {
      id v8 = [(ICEncryptionObject *)v6 wrappedEncryptionKey];
      id v9 = [v5 keyData];
      id v28 = 0;
      id v10 = +[ICCipherV1Neo unwrapKey:v8 withWrapper:v9 error:&v28];
      uint64_t v11 = v28;

      if (v10)
      {
        uint64_t v12 = [*(id *)(a1 + 40) keyData];
        v27 = v11;
        id v13 = +[ICCipherV1Neo wrapKey:v10 withWrapper:v12 error:&v27];
        id v14 = v27;

        if (v13)
        {
          id v15 = [*(id *)(a1 + 40) metadata];
          uint64_t v16 = [v3 identifier];
          v17 = +[ICEncryptionMetadata makeFromMetadata:v15 forObjectIdentifier:v16];

          if (v17)
          {
            uint64_t v18 = [ICEncryptionObject alloc];
            v19 = [(ICEncryptionObject *)v7 encryptedData];
            os_log_t v20 = [(ICEncryptionObject *)v18 initWithMetadata:v17 wrappedEncryptionKey:v13 encryptedData:v19];

            if (v20)
            {
              uint64_t v21 = [v20 serialized];
              uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
              v23 = *(NSObject **)(v22 + 40);
              *(void *)(v22 + 40) = v21;
            }
            else
            {
              v23 = os_log_create("com.apple.notes", "Crypto");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_3(v3);
              }
            }
          }
          else
          {
            v23 = os_log_create("com.apple.notes", "Crypto");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_2(v3);
            }
            os_log_t v20 = v23;
          }
        }
        else
        {
          os_log_t v20 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_1();
          }
          v17 = v20;
        }
      }
      else
      {
        v17 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v26 = [v3 shortLoggingDescription];
          *(_DWORD *)buf = 138412546;
          v30 = v26;
          __int16 v31 = 2112;
          v32 = v11;
          _os_log_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_INFO, "Not rewrapping data because current encryption key cannot be unwrapped {object: %@, error: %@}", buf, 0x16u);
        }
        id v13 = v17;
        id v14 = v11;
      }
    }
    else
    {
      id v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v25 = [v3 shortLoggingDescription];
        *(_DWORD *)buf = 138412290;
        v30 = v25;
        _os_log_impl(&dword_1C3A61000, v10, OS_LOG_TYPE_INFO, "Not rewrapping data because encryption object cannot be deserialized {object: %@}", buf, 0xCu);
      }
      id v14 = v10;
    }
  }
  else
  {
    id v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v24 = [v3 shortLoggingDescription];
      *(_DWORD *)buf = 138412290;
      v30 = v24;
      _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Not rewrapping data because main key is missing {object: %@}", buf, 0xCu);
    }
    id v7 = (ICEncryptionObject *)v14;
  }
}

- (BOOL)rewrapWithMainKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudSyncingObjectCryptoStrategyV1Neo *)self sidecarMainKeyCreateIfNeeded];
  v7.receiver = self;
  v7.super_class = (Class)ICCloudSyncingObjectCryptoStrategyV1Neo;
  LOBYTE(self) = [(ICCryptoStrategyBase *)&v7 rewrapWithMainKey:v4];

  return (char)self;
}

- (ICEncryptionKey)sidecarMainKey
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__13;
  id v9 = __Block_byref_object_dispose__13;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke;
  v4[3] = &unk_1E64A5170;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionKey *)v2;
}

void __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isAuthenticated])
  {
    if (([v3 supportsEncryptedValuesDictionary] & 1) == 0)
    {
      uint64_t v10 = [*(id *)(a1 + 32) fallbackSidecarMainKey];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      goto LABEL_13;
    }
    id v4 = NSStringFromSelector(sel_sidecarMainKey);
    os_log_t v5 = [v3 primitiveValueForEncryptableKey:v4];

    if ([v5 length])
    {
      id v6 = [[ICEncryptionKey alloc] initWithSerializedData:v5];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        id v9 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke_cold_1(v3);
        }
      }
    }
  }
  else
  {
    os_log_t v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke_cold_2(v3);
    }
  }
LABEL_13:
}

- (id)sidecarMainKeyCreateIfNeeded
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__13;
  id v9 = __Block_byref_object_dispose__13;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKeyCreateIfNeeded__block_invoke;
  v4[3] = &unk_1E64A5170;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __71__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKeyCreateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) isAuthenticated] & 1) == 0)
  {
    id v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke_cold_2(v3);
    }
    uint64_t v12 = v13;
    goto LABEL_10;
  }
  if ([v3 supportsEncryptedValuesDictionary])
  {
    uint64_t v4 = [*(id *)(a1 + 32) sidecarMainKey];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [v3 shortLoggingDescription];
        int v14 = 138412290;
        id v15 = v8;
        _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, "Creating sidecar main key from fallback sidecar main key… {object: %@}", (uint8_t *)&v14, 0xCu);
      }
      uint64_t v9 = [*(id *)(a1 + 32) fallbackSidecarMainKey];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) serializedData];
      id v13 = NSStringFromSelector(sel_sidecarMainKey);
      [v3 setValue:v12 forEncryptableKey:v13];
LABEL_10:
    }
  }
}

- (ICEncryptionKey)fallbackSidecarMainKey
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__13;
  uint64_t v9 = __Block_byref_object_dispose__13;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionKey *)v2;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[ICAuthenticationState sharedState];
  uint64_t v5 = [v4 cachedMainKeyForObject:v3];

  if (!v5)
  {
    id v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_1(v3);
    }
    uint64_t v7 = v13;
    goto LABEL_12;
  }
  id v6 = [v3 identifier];
  uint64_t v7 = +[ICEncryptionMetadata makeForV1NeoSidecarCipherWithObjectIdentifier:v6];

  if (!v7)
  {
    id v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_2(v3);
    }
    goto LABEL_11;
  }
  id v8 = [ICEncryptionKey alloc];
  uint64_t v9 = [v5 keyData];
  uint64_t v10 = [(ICEncryptionKey *)v8 initWithKeyData:v9 metadata:v7];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_3(v3);
    }
LABEL_11:

LABEL_12:
  }
}

- (BOOL)hasSameKeyAsObject:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ICCloudSyncingObjectCryptoStrategyV1Neo_hasSameKeyAsObject___block_invoke;
  v7[3] = &unk_1E64A5148;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_hasSameKeyAsObject___block_invoke(uint64_t a1)
{
  id v21 = [*(id *)(a1 + 32) primaryMetadata];
  objc_opt_class();
  id v2 = [*(id *)(a1 + 40) cryptoStrategy];
  id v3 = ICDynamicCast();
  id v4 = [v3 v1NeoStrategy];
  id v5 = [v4 primaryMetadata];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_opt_class();
    id v8 = [*(id *)(a1 + 40) cryptoStrategy];
    uint64_t v9 = ICDynamicCast();
    id v7 = [v9 primaryMetadata];
  }
  if (!v21 || !v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_21;
  }
  uint64_t v10 = [v21 passphraseSalt];
  uint64_t v11 = [v7 passphraseSalt];
  uint64_t v12 = (void *)*MEMORY[0x1E4F1D260];
  if ((void *)*MEMORY[0x1E4F1D260] == v10) {
    char v13 = 0;
  }
  else {
    char v13 = v10;
  }
  unint64_t v14 = v13;
  if (v12 == v11) {
    id v15 = 0;
  }
  else {
    id v15 = v11;
  }
  unint64_t v16 = v15;
  if (!(v14 | v16)) {
    goto LABEL_16;
  }
  v17 = (void *)v16;
  if (!v14 || !v16)
  {

    goto LABEL_19;
  }
  int v18 = [(id)v14 isEqual:v16];

  if (!v18)
  {
LABEL_19:
    BOOL v20 = 0;
    goto LABEL_20;
  }
LABEL_16:
  uint64_t v19 = [v21 passphraseIterationCount];
  BOOL v20 = v19 == [v7 passphraseIterationCount];
LABEL_20:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v20;

LABEL_21:
}

- (id)encryptData:(id)a3 encryptionKey:(id)a4 mainKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__13;
  v25 = __Block_byref_object_dispose__13;
  id v26 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke;
  v16[3] = &unk_1E64A5198;
  id v11 = v9;
  id v17 = v11;
  id v12 = v10;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  BOOL v20 = &v21;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) keyData];
  id v21 = 0;
  id v6 = +[ICCipherV1Neo wrapKey:v4 withWrapper:v5 error:&v21];
  id v7 = v21;

  if (v6)
  {
    id v8 = [*(id *)(a1 + 40) metadata];
    id v9 = [v3 identifier];
    id v10 = +[ICEncryptionMetadata makeFromMetadata:v8 forObjectIdentifier:v9];

    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = [v10 authenticatedData];
      id v20 = v7;
      id v14 = +[ICCipherV1Neo encryptData:v11 withKey:v12 additionalAuthenticatedData:v13 error:&v20];
      id v15 = v20;

      if (v14)
      {
        unint64_t v16 = [[ICEncryptionObject alloc] initWithMetadata:v10 wrappedEncryptionKey:v6 encryptedData:v14];
        uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
        id v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
LABEL_17:
          id v7 = v15;
          goto LABEL_18;
        }
        id v19 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_4(v3);
        }
      }
      else
      {
        id v19 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_3();
        }
      }
    }
    else
    {
      id v19 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_2(v3);
      }
      id v14 = v19;
      id v15 = v7;
    }

    goto LABEL_17;
  }
  id v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_1();
  }
  id v10 = v14;
LABEL_18:
}

- (id)encryptData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__13;
  id v15 = __Block_byref_object_dispose__13;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData___block_invoke;
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

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[ICAuthenticationState sharedState];
  id v5 = [v4 cachedMainKeyForObject:v3];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) primaryEncryptionObject];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 wrappedEncryptionKey];
      id v9 = [v5 keyData];
      id v20 = 0;
      id v10 = +[ICCipherV1Neo unwrapKey:v8 withWrapper:v9 error:&v20];
      uint64_t v11 = v20;

      if (!v10)
      {
        uint64_t v12 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = [v3 shortLoggingDescription];
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = v13;
          __int16 v23 = 2112;
          v24 = v11;
          _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_INFO, "Cannot unwrap primary encryption key {object: %@, error: %@}", buf, 0x16u);
        }
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      id v19 = 0;
      id v10 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random256BitData:", &v19);
      uint64_t v11 = v19;
      id v15 = os_log_create("com.apple.notes", "Crypto");
      uint64_t v12 = v15;
      if (!v10)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __55__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData___block_invoke_cold_1();
        }
        goto LABEL_16;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = [v3 shortLoggingDescription];
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v16;
        _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_INFO, "Generated new encryption key {object: %@}", buf, 0xCu);
      }
    }
    uint64_t v17 = [*(id *)(a1 + 32) encryptData:*(void *)(a1 + 40) encryptionKey:v10 mainKey:v5];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(NSObject **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
LABEL_17:

    goto LABEL_18;
  }
  id v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v14 = [v3 shortLoggingDescription];
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v14;
    _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, "Cannot encrypt data because object is not authenticated {object: %@}", buf, 0xCu);
  }
  uint64_t v11 = v7;
LABEL_18:
}

- (id)encryptSidecarData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__13;
  id v15 = __Block_byref_object_dispose__13;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptSidecarData___block_invoke;
  v8[3] = &unk_1E64A51C0;
  v8[4] = self;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = [(id)v12[5] serialized];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) sidecarMainKeyCreateIfNeeded];
  if (v4
    || ([*(id *)(a1 + 32) fallbackSidecarMainKey],
        (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = 0;
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random256BitData:", &v10);
    id v6 = v10;
    if (v5)
    {
      uint64_t v7 = [*(id *)(a1 + 32) encryptData:*(void *)(a1 + 40) encryptionKey:v5 mainKey:v4];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(NSObject **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      id v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __55__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData___block_invoke_cold_1();
      }
    }
  }
  else
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptSidecarData___block_invoke_cold_1(v3);
    }
    id v6 = v4;
  }
}

- (BOOL)saveEncryptedJSON
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudSyncingObjectCryptoStrategyV1Neo saveEncryptedJSON](self);
  }

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke;
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
    uint64_t v18 = v9;
    id v20 = "-[ICCloudSyncingObjectCryptoStrategyV1Neo saveEncryptedJSON]";
    __int16 v21 = 1024;
    int v22 = 570;
    _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "Saved encrypted values JSON {object: %@, success: %@}%s:%d", buf, 0x26u);
  }
  char v5 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

void __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 encryptedValuesJSON];

  if ([v3 supportsEncryptedValuesDictionary])
  {
    if ([*(id *)(a1 + 32) isAuthenticated])
    {
      char v5 = [v3 serializedValuesToEncrypt];
      if (v5)
      {
        os_log_t v6 = [*(id *)(a1 + 32) encryptData:v5];
        uint64_t v7 = [v6 serialized];
        if (v7)
        {
          [v3 setEncryptedValuesJSON:v7];
          [v3 applyRandomCryptoGooIfNeeded];
          if (!v4) {
            [v3 resetToIntrinsicNotesVersionAndPropagateToChildObjects];
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
        else
        {
          id v9 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke_cold_1(v3);
          }
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = [v3 shortLoggingDescription];
          int v10 = 138412290;
          uint64_t v11 = v8;
          _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, "No encrypted values JSON to save — skipping {object: %@}", (uint8_t *)&v10, 0xCu);
        }
        os_log_t v6 = v7;
      }
    }
    else
    {
      os_log_t v6 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke_cold_2(v3);
      }
      char v5 = v6;
    }
  }
}

- (BOOL)mainKeyDecryptsPrimaryData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyDecryptsPrimaryData___block_invoke;
  v7[3] = &unk_1E64A5148;
  id v5 = v4;
  id v8 = v5;
  id v9 = self;
  int v10 = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v7];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __70__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyDecryptsPrimaryData___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) metadata];
  uint64_t v3 = [v2 cipherVersion];

  if (v3 == 2)
  {
    id v4 = [*(id *)(a1 + 40) primaryWrappedKey];
    id v5 = v4;
    if (v4)
    {
      os_log_t v6 = [v4 keyData];
      uint64_t v7 = [*(id *)(a1 + 32) keyData];
      id v10 = 0;
      id v8 = +[ICCipherV1Neo unwrapKey:v6 withWrapper:v7 error:&v10];
      id v9 = v10;

      if (v8) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

- (id)decryptObject:(id)a3 encryptionKey:(id)a4 mainKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = __Block_byref_object_copy__13;
  uint64_t v23 = __Block_byref_object_dispose__13;
  id v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke;
  v15[3] = &unk_1E64A51C0;
  id v11 = v8;
  id v16 = v11;
  uint64_t v18 = &v19;
  id v12 = v9;
  id v17 = v12;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v15];
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) metadata];
  id v5 = [v4 objectIdentifier];
  os_log_t v6 = [v3 identifier];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    id v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke_cold_2();
    }
    id v13 = 0;
    goto LABEL_8;
  }
  id v8 = [*(id *)(a1 + 32) encryptedData];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) metadata];
  id v11 = [v10 authenticatedData];
  id v17 = 0;
  uint64_t v12 = +[ICCipherV1Neo decryptData:v8 withKey:v9 additionalAuthenticatedData:v11 error:&v17];
  id v13 = v17;
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke_cold_1();
    }
LABEL_8:
  }
}

- (id)decryptData:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__13;
  id v16 = __Block_byref_object_dispose__13;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke;
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

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[ICAuthenticationState sharedState];
  id v5 = [v4 cachedMainKeyForObject:v3];

  if (v5)
  {
    id v6 = [[ICEncryptionObject alloc] initWithSerializedData:*(void *)(a1 + 32)];
    if (!v6)
    {
      p_super = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_2(v3);
      }
      id v8 = p_super;
      goto LABEL_25;
    }
    char v7 = [v3 unappliedEncryptedRecord];
    id v8 = [v3 primaryEncryptedDataFromRecord:v7];

    if (v8)
    {
      id v9 = [[ICEncryptionObject alloc] initWithSerializedData:v8];
      if (!v9)
      {
        id v9 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
          __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_4(v3);
        }
        p_super = &v9->super;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v11 = [(ICEncryptionObject *)v9 wrappedEncryptionKey];
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [(ICEncryptionObject *)v6 wrappedEncryptionKey];
    }
    uint64_t v14 = v13;

    id v15 = [v5 keyData];
    id v20 = 0;
    id v16 = +[ICCipherV1Neo unwrapKey:v14 withWrapper:v15 error:&v20];
    p_super = v20;

    if (v16)
    {
      uint64_t v17 = [*(id *)(a1 + 40) decryptObject:v6 encryptionKey:v16 mainKey:v5];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v19 = *(NSObject **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    else
    {
      uint64_t v19 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_3();
      }
    }
    goto LABEL_24;
  }
  id v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_1(v3);
  }
  id v6 = (ICEncryptionObject *)v8;
LABEL_26:
}

- (id)decryptSidecarData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__13;
  id v15 = __Block_byref_object_dispose__13;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke;
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

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) sidecarMainKey];
  uint64_t v5 = [*(id *)(a1 + 32) fallbackSidecarMainKey];
  if (v4 | v5)
  {
    id v6 = [[ICEncryptionObject alloc] initWithSerializedData:*(void *)(a1 + 40)];
    char v7 = v6;
    if (v6)
    {
      if (v4)
      {
        id v8 = [(ICEncryptionObject *)v6 wrappedEncryptionKey];
        id v9 = [(id)v4 keyData];
        id v25 = 0;
        id v10 = +[ICCipherV1Neo unwrapKey:v8 withWrapper:v9 error:&v25];
        id v11 = v25;

        if (v10)
        {
          uint64_t v12 = [*(id *)(a1 + 32) decryptObject:v7 encryptionKey:v10 mainKey:v4];
          uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v14 = *(NSObject **)(v13 + 40);
          *(void *)(v13 + 40) = v12;
        }
        else
        {
          uint64_t v14 = os_log_create("com.apple.notes", "Crypto");
          BOOL v18 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
          if (v5)
          {
            if (v18) {
              __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_3();
            }
          }
          else if (v18)
          {
            __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_4();
          }
        }
      }
      else
      {
        id v11 = 0;
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
        BOOL v19 = 1;
      }
      else {
        BOOL v19 = v5 == 0;
      }
      if (v19) {
        goto LABEL_27;
      }
      id v20 = [(ICEncryptionObject *)v7 wrappedEncryptionKey];
      uint64_t v21 = [(id)v5 keyData];
      id v24 = v11;
      uint64_t v17 = +[ICCipherV1Neo unwrapKey:v20 withWrapper:v21 error:&v24];
      id v16 = v24;

      if (v17)
      {
        uint64_t v22 = [*(id *)(a1 + 32) decryptObject:v7 encryptionKey:v17 mainKey:v4];
        uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
        id v15 = *(NSObject **)(v23 + 40);
        *(void *)(v23 + 40) = v22;
      }
      else
      {
        id v15 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_2();
        }
      }
    }
    else
    {
      id v15 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_1(v3);
      }
      id v16 = 0;
      uint64_t v17 = v15;
    }

    id v11 = v16;
LABEL_27:
  }
}

- (BOOL)loadDecryptedValuesIfNecessary
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__ICCloudSyncingObjectCryptoStrategyV1Neo_loadDecryptedValuesIfNecessary__block_invoke;
  v4[3] = &unk_1E64A5170;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __73__ICCloudSyncingObjectCryptoStrategyV1Neo_loadDecryptedValuesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) isAuthenticated] & 1) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      char v8 = [v3 shortLoggingDescription];
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "Cannot load decrypted values because object is not authenticated — failing {object: %@}", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_19;
  }
  if ([v3 needsToLoadDecryptedValues])
  {
    uint64_t v4 = [v3 encryptedValuesJSON];
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) decryptData:v4];
      if (v5)
      {
        [v3 deserializeAndMergeValues:v5];
        [v3 setNeedsToLoadDecryptedValues:0];
        id v6 = [v3 managedObjectContext];
        uint64_t v7 = [v6 concurrencyType];

        if (v7 == 2) {
          [v3 mergeUnappliedEncryptedRecord];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
      else
      {
        id v11 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __73__ICCloudSyncingObjectCryptoStrategyV1Neo_loadDecryptedValuesIfNecessary__block_invoke_cold_1(v3);
        }
      }
    }
    else
    {
      id v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v3 shortLoggingDescription];
        int v12 = 138412290;
        uint64_t v13 = v10;
        _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Cannot load decrypted values because encrypted values JSON is nil — succeeding {object: %@}", (uint8_t *)&v12, 0xCu);
      }
      [v3 setNeedsToLoadDecryptedValues:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
LABEL_19:

    goto LABEL_20;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_20:
}

- (BOOL)isRecordAuthenticated:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ICCloudSyncingObjectCryptoStrategyV1Neo_isRecordAuthenticated___block_invoke;
  v7[3] = &unk_1E64A51C0;
  id v5 = v4;
  id v9 = self;
  id v10 = &v11;
  id v8 = v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v7];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_isRecordAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 primaryEncryptedDataFromRecord:*(void *)(a1 + 32)];
  if (v3)
  {
    id v4 = [[ICEncryptionObject alloc] initWithSerializedData:v3];
    if (v4)
    {
      id v5 = +[ICAuthenticationState sharedState];
      id v6 = [*(id *)(a1 + 40) object];
      uint64_t v7 = [v5 cachedMainKeyForObject:v6];

      if (!v7)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v8 = [(ICEncryptionObject *)v4 wrappedEncryptionKey];
      id v9 = [v7 keyData];
      id v15 = 0;
      id v10 = +[ICCipherV1Neo unwrapKey:v8 withWrapper:v9 error:&v15];
      uint64_t v11 = v15;

      if (v10)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        int v12 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = [*(id *)(a1 + 40) object];
          char v14 = [v13 shortLoggingDescription];
          *(_DWORD *)buf = 138412546;
          uint64_t v17 = v14;
          __int16 v18 = 2112;
          BOOL v19 = v11;
          _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_INFO, "Cannot unwrap encryption key {object: %@, error: %@}", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __65__ICCloudSyncingObjectCryptoStrategyV1Neo_isRecordAuthenticated___block_invoke_cold_1(a1);
      }
      uint64_t v7 = v11;
    }

    goto LABEL_15;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_16:
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudSyncingObjectCryptoStrategyV1Neo mergeEncryptedDataFromRecord:](self);
  }

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__ICCloudSyncingObjectCryptoStrategyV1Neo_mergeEncryptedDataFromRecord___block_invoke;
  v13[3] = &unk_1E64A5148;
  v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  id v15 = &v16;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v13];
  uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [(ICCryptoStrategyBase *)self object];
    uint64_t v11 = [v10 shortLoggingDescription];
    int v12 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v17 + 24)];
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    __int16 v24 = 2080;
    uint64_t v23 = v12;
    id v25 = "-[ICCloudSyncingObjectCryptoStrategyV1Neo mergeEncryptedDataFromRecord:]";
    __int16 v26 = 1024;
    int v27 = 860;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Merged encrypted data from record {object: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __72__ICCloudSyncingObjectCryptoStrategyV1Neo_mergeEncryptedDataFromRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isAuthenticated]
    && ([*(id *)(a1 + 32) isRecordAuthenticated:*(void *)(a1 + 40)] & 1) != 0)
  {
    [*(id *)(a1 + 32) loadDecryptedValuesIfNecessary];
    id v4 = objc_msgSend(*(id *)(a1 + 40), "ic_inlineableDataAssetForKeyPrefix:", @"EncryptedValues");
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) decryptData:v4];
      if (v5)
      {
        [v3 deserializeAndMergeValues:v5];
        if ([*(id *)(a1 + 32) saveEncryptedJSON]) {
          [v3 setUnappliedEncryptedRecord:0];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        BOOL v8 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __73__ICCloudSyncingObjectCryptoStrategyV1Neo_loadDecryptedValuesIfNecessary__block_invoke_cold_1(v3);
        }
      }
    }
    else
    {
      id v6 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [v3 shortLoggingDescription];
        int v9 = 138412290;
        id v10 = v7;
        _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Not merging empty encrypted values JSON {object: %@}", (uint8_t *)&v9, 0xCu);
      }
      [v3 setUnappliedEncryptedRecord:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    [v3 setUnappliedEncryptedRecord:*(void *)(a1 + 40)];
  }
}

- (BOOL)recordHasChangedPassphrase:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__ICCloudSyncingObjectCryptoStrategyV1Neo_recordHasChangedPassphrase___block_invoke;
  v7[3] = &unk_1E64A5170;
  id v5 = v4;
  id v8 = v5;
  int v9 = &v10;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __70__ICCloudSyncingObjectCryptoStrategyV1Neo_recordHasChangedPassphrase___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v3 = [v17 primaryEncryptedData];
  if (v3) {
    id v4 = [[ICEncryptionObject alloc] initWithSerializedData:v3];
  }
  else {
    id v4 = 0;
  }
  id v5 = [v17 primaryEncryptedDataFromRecord:*(void *)(a1 + 32)];
  if (v5) {
    id v6 = [[ICEncryptionObject alloc] initWithSerializedData:v5];
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = [(ICEncryptionObject *)v4 wrappedEncryptionKey];
  id v8 = [(ICEncryptionObject *)v6 wrappedEncryptionKey];
  int v9 = (void *)*MEMORY[0x1E4F1D260];
  if ((void *)*MEMORY[0x1E4F1D260] == v7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v7;
  }
  unint64_t v11 = v10;
  if (v9 == v8) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v8;
  }
  unint64_t v13 = v12;
  id v14 = (void *)v13;
  if (v11 | v13)
  {
    if (v11) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      char v16 = 1;
    }
    else {
      char v16 = [(id)v11 isEqual:v13] ^ 1;
    }
  }
  else
  {
    char v16 = 0;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v16;
}

void __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot retrieve primary encryption metadata {object: %@}", v4, v5, v6, v7, v8);
}

void __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot generate main key data for passphrase {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create encryption main key {object: %@}", v4, v5, v6, v7, v8);
}

void __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Not rewrapping data because encryption key cannot be wrapped {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create metadata {object: %@}", v4, v5, v6, v7, v8);
}

void __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping data because encryption object cannot be serialized {object: %@}", v4, v5, v6, v7, v8);
}

void __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot deserialize sidecar main key {object: %@}", v4, v5, v6, v7, v8);
}

void __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Cannot retrieve sidecar main key because object is not authenticated {object: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Cannot create fallback sidecar main key because object is not authenticated {object: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create fallback sidecar metadata {object: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create fallback sidecar main key {object: %@}", v4, v5, v6, v7, v8);
}

void __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot wrap new encryption key {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot encrypt data {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_4(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot serialize encryption object {object: %@}", v4, v5, v6, v7, v8);
}

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot generate new encryption key {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptSidecarData___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot retrieve sidecar main key {object: %@}", v4, v5, v6, v7, v8);
}

- (void)saveEncryptedJSON
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Saving encrypted values JSON… {object: %@}%s:%d", v5, v6, v7, v8, 2u);
}

void __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot serialize encrypted values JSON — failing {object: %@}", v4, v5, v6, v7, v8);
}

void __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot save encrypted values JSON because object is not authenticated {object: %@}", v4, v5, v6, v7, v8);
}

void __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot decrypt data {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = [v1 shortLoggingDescription];
  int v9 = [*v0 metadata];
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Cannot decrypt data because object identifier doesn't match {object: %@, metadata: %@}", v5, v6, v7, v8, 2u);
}

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt data because object is not authenticated {object: %@}", v4, v5, v6, v7, v8);
}

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_2(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot deserialize encryption object {object: %@}", v4, v5, v6, v7, v8);
}

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot unwrap encryption key and there is no unapplied record {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_4(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot deserialize record encryption object {object: %@}", v4, v5, v6, v7, v8);
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot deserialize sidecar encryption object {object: %@}", v4, v5, v6, v7, v8);
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Cannot unwrap sidecar encryption key using fallback key {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Cannot unwrap sidecar encryption key — trying fallback key {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Cannot unwrap sidecar encryption key {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __73__ICCloudSyncingObjectCryptoStrategyV1Neo_loadDecryptedValuesIfNecessary__block_invoke_cold_1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt encrypted values JSON — failing {object: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_isRecordAuthenticated___block_invoke_cold_1(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 40) object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v3, v4, "Cannot deserialize record primary encrypted data — treating as unauthenticated {object: %@}", v5, v6, v7, v8, v9);
}

- (void)mergeEncryptedDataFromRecord:(void *)a1 .cold.1(void *a1)
{
  id v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Merging encrypted data from record… {object: %@}%s:%d", v5, v6, v7, v8, 2u);
}

@end