@interface ICCloudSyncingObjectCryptoStrategyV2
+ (NSMutableDictionary)accountKeyByIdentifier;
- (BOOL)authenticateWithPassphrase:(id)a3;
- (BOOL)canAuthenticate;
- (BOOL)canAuthenticateRecord:(id)a3;
- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4;
- (BOOL)hasPassphraseSet;
- (BOOL)hasSameKeyAsObject:(id)a3;
- (BOOL)isAuthenticated;
- (BOOL)isInICloudAccount;
- (BOOL)isPassphraseCorrect:(id)a3;
- (BOOL)isRecordAuthenticated:(id)a3;
- (BOOL)loadDecryptedValuesIfNecessary;
- (BOOL)mainKeyDecryptsPrimaryData:(id)a3;
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)recordHasChangedPassphrase:(id)a3;
- (BOOL)rewrapDataAtURL:(id)a3 withMainKey:(id)a4;
- (BOOL)rewrapWithMainKey:(id)a3;
- (BOOL)saveEncryptedJSON;
- (BOOL)serialize:(id)a3 toURL:(id)a4;
- (BOOL)shouldSpoofAccountKey;
- (ICEncryptionKey)primaryWrappedKey;
- (ICEncryptionMetadata)primaryMetadata;
- (ICEncryptionObject)primaryEncryptionObject;
- (NSString)accountDsid;
- (NSString)accountKeyIdentifier;
- (NSString)currentAccountKeyIdentifier;
- (NSString)passphraseHint;
- (id)accountIdentifier;
- (id)accountKeyWithIdentifier:(id)a3 createIfNotExist:(BOOL)a4;
- (id)decryptData:(id)a3;
- (id)decryptObject:(id)a3;
- (id)decryptSidecarData:(id)a3;
- (id)decryptedDataFromFileURL:(id)a3;
- (id)encryptData:(id)a3;
- (id)encryptSidecarData:(id)a3;
- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4;
- (id)encryptedDataFromRecord:(id)a3;
- (id)mainKeyForPassphrase:(id)a3;
- (int64_t)intrinsicNotesVersion;
- (void)currentAccountKeyIdentifier;
- (void)decryptAndMergeEncryptedJSON:(id)a3;
- (void)fetchKeychainItemsForAccountKeyIdentifier:(id)a3 accountDsid:(id)a4;
- (void)saveEncryptedJSON;
- (void)serializeToEncryptedValuesJSON:(id)a3;
@end

@implementation ICCloudSyncingObjectCryptoStrategyV2

- (ICEncryptionMetadata)primaryMetadata
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__ICCloudSyncingObjectCryptoStrategyV2_primaryMetadata__block_invoke;
  v4[3] = &unk_1E64A50F8;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionMetadata *)v2;
}

void __55__ICCloudSyncingObjectCryptoStrategyV2_primaryMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 identifier];
  uint64_t v5 = [*(id *)(a1 + 32) currentAccountKeyIdentifier];
  uint64_t v6 = +[ICEncryptionMetadata makeForV2CipherWithObjectIdentifier:v4 accountKeyIdentifier:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __55__ICCloudSyncingObjectCryptoStrategyV2_primaryMetadata__block_invoke_cold_1(v3);
    }
  }
}

- (ICEncryptionKey)primaryWrappedKey
{
  return 0;
}

- (ICEncryptionObject)primaryEncryptionObject
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__ICCloudSyncingObjectCryptoStrategyV2_primaryEncryptionObject__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionObject *)v2;
}

void __63__ICCloudSyncingObjectCryptoStrategyV2_primaryEncryptionObject__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 unappliedEncryptedRecord];
  uint64_t v5 = [v3 primaryEncryptedDataFromRecord:v4];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
  }
  else
  {
    uint64_t v6 = [v3 primaryEncryptedData];

    if (!v6) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = [[ICEncryptionObject alloc] initWithSerializedData:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __63__ICCloudSyncingObjectCryptoStrategyV2_primaryEncryptionObject__block_invoke_cold_1(v3);
    }
  }
LABEL_8:
}

- (BOOL)hasSameKeyAsObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ICCloudSyncingObjectCryptoStrategyV2_hasSameKeyAsObject___block_invoke;
  v7[3] = &unk_1E64A5148;
  id v5 = v4;
  id v8 = v5;
  v9 = self;
  id v10 = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v7];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __59__ICCloudSyncingObjectCryptoStrategyV2_hasSameKeyAsObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) cryptoStrategy];
  id v3 = ICDynamicCast();
  id v4 = [v3 v2Strategy];
  id v5 = v4;
  if (v4)
  {
    id v24 = v4;
  }
  else
  {
    objc_opt_class();
    uint64_t v6 = [*(id *)(a1 + 32) cryptoStrategy];
    ICDynamicCast();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = [*(id *)(a1 + 40) primaryMetadata];
  id v8 = [v7 accountKeyIdentifier];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [*(id *)(a1 + 40) currentAccountKeyIdentifier];
  }
  uint64_t v11 = v10;

  v12 = [v24 primaryMetadata];
  uint64_t v13 = [v12 accountKeyIdentifier];
  char v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [v24 currentAccountKeyIdentifier];
  }
  v16 = v15;

  v17 = (void *)*MEMORY[0x1E4F1D260];
  if ((void *)*MEMORY[0x1E4F1D260] == v11) {
    v18 = 0;
  }
  else {
    v18 = v11;
  }
  unint64_t v19 = v18;
  if (v17 == v16) {
    v20 = 0;
  }
  else {
    v20 = v16;
  }
  unint64_t v21 = v20;
  v22 = (void *)v21;
  if (v19 | v21)
  {
    char v23 = 0;
    if (v19 && v21) {
      char v23 = [(id)v19 isEqual:v21];
    }
  }
  else
  {
    char v23 = 1;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v23;
}

- (BOOL)saveEncryptedJSON
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(ICCloudSyncingObjectCryptoStrategyV2 *)self saveEncryptedJSON];
  }

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ICCloudSyncingObjectCryptoStrategyV2_saveEncryptedJSON__block_invoke;
  v10[3] = &unk_1E64A5170;
  v10[4] = self;
  v10[5] = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v10];
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [(ICCryptoStrategyBase *)self object];
    id v8 = [v7 shortLoggingDescription];
    v9 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v12 + 24)];
    *(_DWORD *)buf = 138413058;
    v16 = v8;
    __int16 v17 = 2112;
    __int16 v19 = 2080;
    v18 = v9;
    v20 = "-[ICCloudSyncingObjectCryptoStrategyV2 saveEncryptedJSON]";
    __int16 v21 = 1024;
    int v22 = 129;
    _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "Saved encrypted values JSON {object: %@, success: %@}%s:%d", buf, 0x26u);
  }
  char v5 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

void __57__ICCloudSyncingObjectCryptoStrategyV2_saveEncryptedJSON__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 supportsEncryptedValuesDictionary])
  {
    if ([*(id *)(a1 + 32) isAuthenticated])
    {
      id v4 = [v3 serializedValuesToEncrypt];
      if (v4)
      {
        char v5 = [*(id *)(a1 + 32) encryptData:v4];
        [*(id *)(a1 + 32) serializeToEncryptedValuesJSON:v5];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        uint64_t v6 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          uint64_t v7 = [v3 shortLoggingDescription];
          int v8 = 138412290;
          v9 = v7;
          _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "No encrypted values JSON to save — skipping {object: %@}", (uint8_t *)&v8, 0xCu);
        }
      }
    }
    else
    {
      id v4 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __57__ICCloudSyncingObjectCryptoStrategyV2_saveEncryptedJSON__block_invoke_cold_1(v3);
      }
    }
  }
}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke;
  v11[3] = &unk_1E64A5198;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  char v14 = self;
  id v15 = &v16;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v11];
  LOBYTE(self) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)self;
}

void __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(a1 + 32))
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_1(v3);
    }
    goto LABEL_10;
  }
  if (!*(void *)(a1 + 40))
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_2(v3);
    }
LABEL_10:
    char v5 = v4;
    goto LABEL_15;
  }
  id v7 = 0;
  id v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfURL:options:error:");
  char v5 = v7;
  if (v5 || !v4)
  {
    id v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_3();
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 48) encryptData:v4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 48) serialize:v6 toURL:*(void *)(a1 + 40)];
  }

LABEL_15:
}

- (int64_t)intrinsicNotesVersion
{
  return 9;
}

- (BOOL)loadDecryptedValuesIfNecessary
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__ICCloudSyncingObjectCryptoStrategyV2_loadDecryptedValuesIfNecessary__block_invoke;
  v4[3] = &unk_1E64A5170;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __70__ICCloudSyncingObjectCryptoStrategyV2_loadDecryptedValuesIfNecessary__block_invoke(uint64_t a1, void *a2)
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
        id v6 = [v3 encryptedValuesJSON];
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
        uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = [v3 shortLoggingDescription];
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
    id v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v3 shortLoggingDescription];
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
  uint64_t v15 = __Block_byref_object_copy__8;
  uint64_t v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ICCloudSyncingObjectCryptoStrategyV2_decryptData___block_invoke;
  v8[3] = &unk_1E64A5148;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = self;
  uint64_t v11 = &v12;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_decryptData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(void *)(a1 + 32))
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v3 shortLoggingDescription];
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1C3A61000, &v4->super, OS_LOG_TYPE_INFO, "input is nil when calling decryptData: for %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 40) isAuthenticated])
  {
    id v4 = [[ICEncryptionObject alloc] initWithSerializedData:*(void *)(a1 + 32)];
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 40) decryptObject:v4];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    else
    {
      id v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __52__ICCloudSyncingObjectCryptoStrategyV2_decryptData___block_invoke_cold_1(v3);
      }
    }
LABEL_11:
  }
}

- (id)decryptedDataFromFileURL:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__8;
  uint64_t v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__ICCloudSyncingObjectCryptoStrategyV2_decryptedDataFromFileURL___block_invoke;
  v8[3] = &unk_1E64A51C0;
  id v5 = v4;
  int v10 = self;
  uint64_t v11 = &v12;
  id v9 = v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __65__ICCloudSyncingObjectCryptoStrategyV2_decryptedDataFromFileURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v12 = 0;
    id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:&v12];
    id v6 = v12;
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v5 == 0;
    }
    if (v7)
    {
      uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __65__ICCloudSyncingObjectCryptoStrategyV2_decryptedDataFromFileURL___block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 40) decryptData:v5];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(NSObject **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
  else
  {
    id v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v3 shortLoggingDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "fileURL is nil when trying to decrypt for %@", buf, 0xCu);
    }
    id v6 = v5;
  }
}

- (id)encryptSidecarData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__8;
  uint64_t v15 = __Block_byref_object_dispose__8;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke;
  v8[3] = &unk_1E64A5148;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isAuthenticated] & 1) == 0)
  {
    uint64_t v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke_cold_2();
    }
    id v4 = v8;
    goto LABEL_9;
  }
  id v4 = [*(id *)(a1 + 32) encryptData:*(void *)(a1 + 40)];
  uint64_t v5 = [v4 serialized];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke_cold_1();
    }

LABEL_9:
  }
}

- (id)decryptSidecarData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__8;
  uint64_t v15 = __Block_byref_object_dispose__8;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke;
  v8[3] = &unk_1E64A51C0;
  void v8[4] = self;
  uint64_t v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isAuthenticated] & 1) == 0)
  {
    BOOL v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke_cold_2();
    }
    goto LABEL_7;
  }
  uint64_t v4 = [*(id *)(a1 + 32) decryptData:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    BOOL v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke_cold_1();
    }
LABEL_7:
  }
}

- (id)encryptedDataFromRecord:(id)a3
{
  return (id)objc_msgSend(a3, "ic_inlineableDataAssetForKeyPrefix:", @"EncryptedValues");
}

- (BOOL)isRecordAuthenticated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ICAuthenticationState sharedState];
  if ([v5 isAuthenticatedWithDevicePassword]) {
    BOOL v6 = [(ICCloudSyncingObjectCryptoStrategyV2 *)self canAuthenticateRecord:v4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)canAuthenticateRecord:(id)a3
{
  id v4 = [(ICCloudSyncingObjectCryptoStrategyV2 *)self encryptedDataFromRecord:a3];
  if (v4)
  {
    uint64_t v5 = [[ICEncryptionObject alloc] initWithSerializedData:v4];
    os_log_t p_super = &v5->super;
    if (v5)
    {
      BOOL v7 = [(ICEncryptionObject *)v5 metadata];
      uint64_t v8 = [v7 accountKeyIdentifier];

      if (v8)
      {

        id v9 = [(ICCloudSyncingObjectCryptoStrategyV2 *)self accountKeyWithIdentifier:v8 createIfNotExist:0];
        BOOL v10 = v9 != 0;

        os_log_t p_super = (os_log_t)v8;
        goto LABEL_12;
      }
      uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ICCloudSyncingObjectCryptoStrategyV2 canAuthenticateRecord:]();
      }
    }
    else
    {
      uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ICCloudSyncingObjectCryptoStrategyV2 canAuthenticateRecord:]();
      }
    }

    BOOL v10 = 0;
    goto LABEL_12;
  }
  os_log_t p_super = os_log_create("com.apple.notes", "Crypto");
  BOOL v10 = 1;
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_1C3A61000, p_super, OS_LOG_TYPE_INFO, "No encrypted data when in isRecordAuthenticated:", v13, 2u);
  }
LABEL_12:

  return v10;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__ICCloudSyncingObjectCryptoStrategyV2_mergeEncryptedDataFromRecord___block_invoke;
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

void __69__ICCloudSyncingObjectCryptoStrategyV2_mergeEncryptedDataFromRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isRecordAuthenticated:*(void *)(a1 + 40)])
  {
    id v4 = objc_msgSend(*(id *)(a1 + 40), "ic_inlineableDataAssetForKeyPrefix:", @"EncryptedValues");
    [*(id *)(a1 + 32) loadDecryptedValuesIfNecessary];
    if (!v4) {
      goto LABEL_6;
    }
    id v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = [v3 shortLoggingDescription];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Merging encrypted values from cloud for %@", (uint8_t *)&v7, 0xCu);
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
  v6[2] = __69__ICCloudSyncingObjectCryptoStrategyV2_decryptAndMergeEncryptedJSON___block_invoke;
  v6[3] = &unk_1E64A51E8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v6];
}

void __69__ICCloudSyncingObjectCryptoStrategyV2_decryptAndMergeEncryptedJSON___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = os_log_create("com.apple.notes", "Crypto");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      id v7 = [v3 className];
      id v8 = [v3 shortLoggingDescription];
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Merging encrypted JSON for %@ (%@)", (uint8_t *)&v11, 0x16u);
    }
    id v5 = [*(id *)(a1 + 40) decryptData:*(void *)(a1 + 32)];
    if (v5)
    {
      [v3 deserializeAndMergeValues:v5];
    }
    else
    {
      uint64_t v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __69__ICCloudSyncingObjectCryptoStrategyV2_decryptAndMergeEncryptedJSON___block_invoke_cold_1(v3);
      }
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = [v3 shortLoggingDescription];
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "encryptedJSON is nil when trying to decrypt for %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)recordHasChangedPassphrase:(id)a3
{
  return 0;
}

- (BOOL)mainKeyDecryptsPrimaryData:(id)a3
{
  return 0;
}

- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4
{
  return 0;
}

- (BOOL)rewrapDataAtURL:(id)a3 withMainKey:(id)a4
{
  return 0;
}

- (BOOL)rewrapWithMainKey:(id)a3
{
  return 0;
}

- (BOOL)canAuthenticate
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__ICCloudSyncingObjectCryptoStrategyV2_canAuthenticate__block_invoke;
  v4[3] = &unk_1E64A5170;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __55__ICCloudSyncingObjectCryptoStrategyV2_canAuthenticate__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 primaryEncryptedData];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3) {
    [v4 accountKeyIdentifier];
  }
  else {
  uint64_t v5 = [v4 currentAccountKeyIdentifier];
  }

  if (v5)
  {
    BOOL v6 = [*(id *)(a1 + 32) accountKeyWithIdentifier:v5 createIfNotExist:0];
    if (v6)
    {
      uint64_t v7 = [v8 unappliedEncryptedRecord];
      if (v7) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) canAuthenticateRecord:v7];
      }
      else {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
}

- (BOOL)isAuthenticated
{
  id v3 = +[ICAuthenticationState sharedState];
  if ([v3 isAuthenticatedWithDevicePassword]) {
    BOOL v4 = [(ICCloudSyncingObjectCryptoStrategyV2 *)self canAuthenticate];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)authenticateWithPassphrase:(id)a3
{
  return 0;
}

- (id)accountIdentifier
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__8;
  uint64_t v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__ICCloudSyncingObjectCryptoStrategyV2_accountIdentifier__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __57__ICCloudSyncingObjectCryptoStrategyV2_accountIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 cloudAccount];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__ICCloudSyncingObjectCryptoStrategyV2_accountIdentifier__block_invoke_cold_1();
    }
  }
}

- (NSString)accountDsid
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__8;
  uint64_t v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__ICCloudSyncingObjectCryptoStrategyV2_accountDsid__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __51__ICCloudSyncingObjectCryptoStrategyV2_accountDsid__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 cloudAccount];
  if ([v4 accountType] == 1)
  {
    uint64_t v5 = [v4 dsid];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = @"local";
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __51__ICCloudSyncingObjectCryptoStrategyV2_accountDsid__block_invoke_cold_1();
    }
  }
}

- (BOOL)isInICloudAccount
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__ICCloudSyncingObjectCryptoStrategyV2_isInICloudAccount__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __57__ICCloudSyncingObjectCryptoStrategyV2_isInICloudAccount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 cloudAccount];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 accountType] == 1;
}

- (BOOL)shouldSpoofAccountKey
{
  return [MEMORY[0x1E4F83738] isRunningUnitTests];
}

- (NSString)accountKeyIdentifier
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__8;
  uint64_t v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__ICCloudSyncingObjectCryptoStrategyV2_accountKeyIdentifier__block_invoke;
  v4[3] = &unk_1E64A5120;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __60__ICCloudSyncingObjectCryptoStrategyV2_accountKeyIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 primaryEncryptedData];
  if (v4)
  {
    uint64_t v5 = [[ICEncryptionObject alloc] initWithSerializedData:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [(ICEncryptionObject *)v5 metadata];
      uint64_t v8 = [v7 accountKeyIdentifier];
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    else
    {
      int v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __60__ICCloudSyncingObjectCryptoStrategyV2_accountKeyIdentifier__block_invoke_cold_1(v3);
      }
    }
  }
}

- (NSString)currentAccountKeyIdentifier
{
  if ([(ICCloudSyncingObjectCryptoStrategyV2 *)self shouldSpoofAccountKey])
  {
    id v3 = @"e76073b6-5080-49e8-bee4-876f4c63a95f";
  }
  else
  {
    BOOL v4 = [(ICCloudSyncingObjectCryptoStrategyV2 *)self accountIdentifier];
    uint64_t v5 = [(ICCloudSyncingObjectCryptoStrategyV2 *)self accountDsid];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x3032000000;
      id v17 = __Block_byref_object_copy__8;
      uint64_t v18 = __Block_byref_object_dispose__8;
      id v19 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke;
      v9[3] = &unk_1E64A5210;
      id v10 = v5;
      __int16 v13 = &v14;
      id v11 = v4;
      uint64_t v12 = self;
      [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v9];
      id v3 = (__CFString *)(id)v15[5];

      _Block_object_dispose(&v14, 8);
    }
    else
    {
      uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ICCloudSyncingObjectCryptoStrategyV2 currentAccountKeyIdentifier]();
      }

      id v3 = 0;
    }
  }
  return (NSString *)v3;
}

void __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"%@-%@", @"currentAccountKeyIdentifierCipherV2", *(void *)(a1 + 32)];
  uint64_t v3 = +[ICKeychain stringForIdentifier:v2 account:*(void *)(a1 + 32) isSynced:1];
  uint64_t v4 = a1 + 56;
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v8;
      _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, "currentAccountKeyIdentifier for account identifier %@ doesn't exist, generating a new one.", buf, 0xCu);
    }

    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v9 UUIDString];
    uint64_t v11 = *(void *)(*(void *)v4 + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    __int16 v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_4();
    }

    uint64_t v14 = [*(id *)(a1 + 48) accountKeyWithIdentifier:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) createIfNotExist:1];
    uint64_t v15 = os_log_create("com.apple.notes", "Crypto");
    uint64_t v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_3();
      }

      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v18 = *(void *)(a1 + 32);
      id v25 = 0;
      BOOL v19 = +[ICKeychain setString:v17 forIdentifier:v2 account:v18 shouldSync:1 error:&v25];
      id v20 = v25;
      if (v20 || !v19)
      {
        __int16 v21 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_2();
        }

        uint64_t v22 = *(void *)(*(void *)v4 + 8);
        uint64_t v23 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_1();
      }

      uint64_t v24 = *(void *)(*(void *)v4 + 8);
      id v20 = *(id *)(v24 + 40);
      *(void *)(v24 + 40) = 0;
    }
  }
}

+ (NSMutableDictionary)accountKeyByIdentifier
{
  if (accountKeyByIdentifier)
  {
    id v2 = (id)accountKeyByIdentifier;
  }
  else
  {
    id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v3 = (void *)accountKeyByIdentifier;
  accountKeyByIdentifier = (uint64_t)v2;

  uint64_t v4 = (void *)accountKeyByIdentifier;
  return (NSMutableDictionary *)v4;
}

- (id)accountKeyWithIdentifier:(id)a3 createIfNotExist:(BOOL)a4
{
  id v6 = a3;
  if ([(ICCloudSyncingObjectCryptoStrategyV2 *)self shouldSpoofAccountKey])
  {
    objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataFromHexString:", @"5bc7dbbe cf8be96a aa12f008 4324368a bc99a2b2 35753242 b096322d 743799dc");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v6)
  {
    uint64_t v8 = [(id)objc_opt_class() accountKeyByIdentifier];
    objc_sync_enter(v8);
    uint64_t v9 = [(id)objc_opt_class() accountKeyByIdentifier];
    uint64_t v10 = [v9 objectForKeyedSubscript:v6];

    if (v10)
    {
      uint64_t v11 = [(id)objc_opt_class() accountKeyByIdentifier];
      id v7 = [v11 objectForKeyedSubscript:v6];

      objc_sync_exit(v8);
    }
    else
    {
      objc_sync_exit(v8);

      uint64_t v8 = [(ICCloudSyncingObjectCryptoStrategyV2 *)self accountIdentifier];
      __int16 v13 = [(ICCloudSyncingObjectCryptoStrategyV2 *)self accountDsid];
      if (v13)
      {
        uint64_t v30 = 0;
        v31 = &v30;
        uint64_t v32 = 0x3032000000;
        v33 = __Block_byref_object_copy__8;
        v34 = __Block_byref_object_dispose__8;
        id v35 = 0;
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        uint64_t v22 = __82__ICCloudSyncingObjectCryptoStrategyV2_accountKeyWithIdentifier_createIfNotExist___block_invoke;
        uint64_t v23 = &unk_1E64A5238;
        uint64_t v28 = &v30;
        id v14 = v6;
        id v24 = v14;
        id v25 = v13;
        BOOL v29 = a4;
        id v26 = v8;
        uint64_t v27 = self;
        [(ICCryptoStrategyBase *)self performBlockIfObjectExists:&v20];
        uint64_t v15 = objc_msgSend((id)objc_opt_class(), "accountKeyByIdentifier", v20, v21, v22, v23);
        objc_sync_enter(v15);
        uint64_t v16 = v31[5];
        uint64_t v17 = [(id)objc_opt_class() accountKeyByIdentifier];
        [v17 setObject:v16 forKeyedSubscript:v14];

        objc_sync_exit(v15);
        id v7 = (id)v31[5];

        _Block_object_dispose(&v30, 8);
      }
      else
      {
        uint64_t v18 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[ICCloudSyncingObjectCryptoStrategyV2 currentAccountKeyIdentifier]();
        }

        id v7 = 0;
      }
    }
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICCloudSyncingObjectCryptoStrategyV2 accountKeyWithIdentifier:createIfNotExist:]();
    }

    id v7 = 0;
  }

  return v7;
}

void __82__ICCloudSyncingObjectCryptoStrategyV2_accountKeyWithIdentifier_createIfNotExist___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[ICKeychain dataForIdentifier:*(void *)(a1 + 32) account:*(void *)(a1 + 40) isSynced:1 authenticationContext:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) length])
  {
    [v3 setHasMissingKeychainItem:0];
    goto LABEL_21;
  }
  id v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v39 = v8;
    __int16 v40 = 2112;
    uint64_t v41 = v9;
    _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, "accountKey for identifier %@ under account identifier %@ doesn't exist", buf, 0x16u);
  }

  uint64_t v10 = [v3 cloudAccount];
  BOOL v11 = +[ICKeychain isSyncAvailableForAccount:v10];

  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v12 = [v3 cloudAccount];
    int v13 = [v12 accountType] == 3 || v11;
    if (v13 != 1)
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
      id v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = 0;

      uint64_t v18 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __82__ICCloudSyncingObjectCryptoStrategyV2_accountKeyWithIdentifier_createIfNotExist___block_invoke_cold_1((uint64_t *)(a1 + 32), a1, v18);
      }
      goto LABEL_19;
    }
    id v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v39 = v15;
      __int16 v40 = 2112;
      uint64_t v41 = v16;
      _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "creating accountKey for identifier %@ under account identifier %@", buf, 0x16u);
    }

    id v37 = 0;
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random256BitData:", &v37);
    uint64_t v18 = v37;
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v17;

    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    if (v18 || !v22)
    {
      *(void *)(v21 + 40) = 0;

      os_log_t v23 = os_log_create("com.apple.notes", "Crypto");
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

LABEL_19:
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v34 = *(void *)(a1 + 32);
      uint64_t v35 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v39 = v34;
      __int16 v40 = 2112;
      uint64_t v41 = v35;
      __int16 v42 = 2112;
      v43 = v18;
      v33 = "Error generating account key for identifier %@ under account identifier %@, error = %@";
    }
    else
    {
      uint64_t v26 = *(void *)(a1 + 32);
      uint64_t v27 = *(void *)(a1 + 40);
      id v36 = 0;
      BOOL v28 = +[ICKeychain setData:v22 forIdentifier:v26 account:v27 shouldSync:1 error:&v36];
      uint64_t v18 = v36;
      if (!v18 && v28) {
        goto LABEL_20;
      }
      uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = 0;

      os_log_t v23 = os_log_create("com.apple.notes", "Crypto");
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      uint64_t v31 = *(void *)(a1 + 32);
      uint64_t v32 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v39 = v31;
      __int16 v40 = 2112;
      uint64_t v41 = v32;
      __int16 v42 = 2112;
      v43 = v18;
      v33 = "Error saving account key for identifier %@ under account identifier %@, error = %@";
    }
    _os_log_error_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_ERROR, v33, buf, 0x20u);
    goto LABEL_14;
  }
  if (v11)
  {
    [MEMORY[0x1E4F837E8] postBasicEvent:21];
    [*(id *)(a1 + 56) fetchKeychainItemsForAccountKeyIdentifier:*(void *)(a1 + 32) accountDsid:*(void *)(a1 + 40)];
  }
LABEL_21:
}

- (void)fetchKeychainItemsForAccountKeyIdentifier:(id)a3 accountDsid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke;
  v10[3] = &unk_1E64A52B0;
  id v11 = v6;
  id v12 = v7;
  int v13 = self;
  id v8 = v7;
  id v9 = v6;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v10];
}

void __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke_2;
  v7[3] = &unk_1E64A5288;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v6 = v3;
  +[ICKeychain fetchItemsWithCompletionHandler:v7];
}

void __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v13 = v2;
    uint64_t v14 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) managedObjectContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke_3;
    v8[3] = &unk_1E64A5260;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 56);
    id v11 = v6;
    uint64_t v12 = v7;
    [v5 performBlock:v8];
  }
}

void __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[ICKeychain dataForIdentifier:*(void *)(a1 + 32) account:*(void *)(a1 + 40) isSynced:1 authenticationContext:0];
  BOOL v3 = [v2 length] == 0;
  id v4 = os_log_create("com.apple.notes", "Crypto");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      id v10 = [*(id *)(a1 + 48) shortLoggingDescription];
      uint64_t v11 = *(void *)(a1 + 32);
      int v15 = 138412546;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "Account key doesn't exist after fetching Keychain items {object: %@, accountKeyIdentifier: %@}", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v12 = [*(id *)(a1 + 48) creationDate];
    uint64_t v13 = +[ICCloudConfiguration sharedConfiguration];
    [v13 keychainMaximumSyncInterval];
    id v8 = objc_msgSend(v12, "dateByAddingTimeInterval:");

    uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
    LODWORD(v13) = objc_msgSend(v8, "ic_isEarlierThanDate:", v14);

    if (v13)
    {
      [MEMORY[0x1E4F837E8] postBasicEvent:23];
      [*(id *)(a1 + 48) setHasMissingKeychainItem:1];
    }
  }
  else
  {
    if (v5)
    {
      id v6 = [*(id *)(a1 + 48) shortLoggingDescription];
      uint64_t v7 = *(void *)(a1 + 32);
      int v15 = 138412546;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "Account key exists after fetching Keychain items {object: %@, accountKeyIdentifier: %@}", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(a1 + 48) setHasMissingKeychainItem:0];
    id v8 = [(id)objc_opt_class() accountKeyByIdentifier];
    objc_sync_enter(v8);
    id v9 = [(id)objc_opt_class() accountKeyByIdentifier];
    [v9 setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];

    objc_sync_exit(v8);
  }
}

- (BOOL)hasPassphraseSet
{
  return 0;
}

- (NSString)passphraseHint
{
  return 0;
}

- (BOOL)isPassphraseCorrect:(id)a3
{
  return 0;
}

- (id)mainKeyForPassphrase:(id)a3
{
  return 0;
}

- (id)encryptData:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__8;
  uint64_t v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke;
  v8[3] = &unk_1E64A5148;
  id v5 = v4;
  id v9 = v5;
  id v10 = self;
  uint64_t v11 = &v12;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(void *)(a1 + 32))
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_1();
    }
    goto LABEL_34;
  }
  if ([*(id *)(a1 + 40) isAuthenticated])
  {
    id v4 = [*(id *)(a1 + 40) currentAccountKeyIdentifier];
    id v5 = [*(id *)(a1 + 40) accountKeyWithIdentifier:v4 createIfNotExist:0];
    if (!v5)
    {
      id v6 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_2();
      }
      goto LABEL_33;
    }
    id v21 = 0;
    id v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random256BitData:", &v21);
    id v7 = v21;
    if (v7 || !v6)
    {
      id v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_6();
      }
      id v8 = v10;
      goto LABEL_32;
    }
    id v20 = 0;
    id v8 = +[ICCipherV2 wrapKey:v6 withWrapper:v5 error:&v20];
    id v7 = v20;
    if (v7 || !v8)
    {
      id v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = [v3 shortLoggingDescription];
        *(_DWORD *)buf = 138412802;
        os_log_t v23 = v18;
        __int16 v24 = 2112;
        id v25 = v4;
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_error_impl(&dword_1C3A61000, v10, OS_LOG_TYPE_ERROR, "Cannot wrap encryption key for %@, accountKeyIdentifier = %@, error = %@", buf, 0x20u);
      }
      goto LABEL_32;
    }
    id v9 = [v3 identifier];
    id v10 = +[ICEncryptionMetadata makeForV2CipherWithObjectIdentifier:v9 accountKeyIdentifier:v4];

    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [v10 authenticatedData];
      id v19 = 0;
      uint64_t v13 = +[ICCipherV2 encryptData:v11 withKey:v6 additionalAuthenticatedData:v12 error:&v19];
      id v7 = v19;

      if (v7 || !v13)
      {
        id v17 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_5();
        }
      }
      else
      {
        uint64_t v14 = [[ICEncryptionObject alloc] initWithMetadata:v10 wrappedEncryptionKey:v8 encryptedData:v13];
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {
LABEL_31:

LABEL_32:
LABEL_33:

LABEL_34:
          goto LABEL_35;
        }
        id v17 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_4(v3);
        }
      }
    }
    else
    {
      id v17 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_3(v3);
      }
      id v7 = 0;
      uint64_t v13 = v17;
    }

    goto LABEL_31;
  }
LABEL_35:
}

- (id)decryptObject:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__8;
  uint64_t v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke;
  v8[3] = &unk_1E64A5148;
  id v5 = v4;
  id v9 = v5;
  id v10 = self;
  uint64_t v11 = &v12;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v5 = (id *)(a1 + 32);
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v4 metadata];
    id v7 = [v6 accountKeyIdentifier];

    id v8 = [*(id *)(a1 + 40) accountKeyWithIdentifier:v7 createIfNotExist:0];
    if (!v8)
    {
      uint64_t v18 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_2();
      }
      goto LABEL_23;
    }
    id v9 = [*v5 metadata];
    uint64_t v10 = [v9 objectIdentifier];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = [*v5 metadata];
      uint64_t v13 = [v12 objectIdentifier];
      [v3 identifier];
      uint64_t v14 = v8;
      uint64_t v15 = v7;
      id v17 = v16 = v3;
      char v29 = [v13 isEqual:v17];

      id v3 = v16;
      id v7 = v15;
      id v8 = v14;

      if ((v29 & 1) == 0)
      {
        uint64_t v18 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_4();
        }

        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v18 = [*v5 wrappedEncryptionKey];
    id v32 = 0;
    id v20 = +[ICCipherV2 unwrapKey:v18 withWrapper:v8 error:&v32];
    id v21 = v32;
    if (v21 || !v20)
    {
      uint64_t v28 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_3();
      }
    }
    else
    {
      uint64_t v22 = [*(id *)(a1 + 32) encryptedData];
      os_log_t v23 = [*(id *)(a1 + 32) metadata];
      [v23 authenticatedData];
      id v30 = v3;
      __int16 v24 = v31 = 0;
      uint64_t v25 = +[ICCipherV2 decryptData:v22 withKey:v20 additionalAuthenticatedData:v24 error:&v31];
      id v21 = v31;
      uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
      id v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      id v3 = v30;
      if (!v21 && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
        goto LABEL_22;
      }
      uint64_t v28 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_2();
      }
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  id v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v19 = [v3 shortLoggingDescription];
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = v19;
    _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_INFO, "encryptionObject is nil when calling decryptObject: for %@", buf, 0xCu);
  }
  id v7 = v8;
LABEL_24:
}

- (void)serializeToEncryptedValuesJSON:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__ICCloudSyncingObjectCryptoStrategyV2_serializeToEncryptedValuesJSON___block_invoke;
  v6[3] = &unk_1E64A52D8;
  id v7 = v4;
  id v5 = v4;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v6];
}

void __71__ICCloudSyncingObjectCryptoStrategyV2_serializeToEncryptedValuesJSON___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) serialized];
  if (v4)
  {
    id v5 = [v3 encryptedValuesJSON];

    [v3 setEncryptedValuesJSON:v4];
    [v3 applyRandomCryptoGooIfNeeded];
    id v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v3 shortLoggingDescription];
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Successfully encrypted data for %@", (uint8_t *)&v9, 0xCu);
    }
    if (!v5) {
      [v3 resetToIntrinsicNotesVersionAndPropagateToChildObjects];
    }
  }
  else
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __71__ICCloudSyncingObjectCryptoStrategyV2_serializeToEncryptedValuesJSON___block_invoke_cold_1(v3);
    }
  }
}

- (BOOL)serialize:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke;
  v11[3] = &unk_1E64A5148;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  uint64_t v14 = &v15;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    if (*(void *)(a1 + 40))
    {
      id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v5 = [*(id *)(a1 + 40) path];
      char v6 = [v4 fileExistsAtPath:v5];

      id v7 = [*(id *)(a1 + 32) serialized];
      id v8 = v7;
      if (v7)
      {
        uint64_t v9 = *(void *)(a1 + 40);
        id v14 = 0;
        char v10 = [v7 writeToURL:v9 options:1 error:&v14];
        uint64_t v11 = v14;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
        if (v11 || (uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8), !*(unsigned char *)(v13 + 24)))
        {
          id v12 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_4();
          }
        }
        else
        {
          if ((v6 & 1) == 0)
          {
            [v3 resetToIntrinsicNotesVersionAndPropagateToChildObjects];
            uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
          }
          *(unsigned char *)(v13 + 24) = 1;
        }
      }
      else
      {
        uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_3(v3);
        }
      }
    }
    else
    {
      id v8 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_1();
    }
  }
}

void __55__ICCloudSyncingObjectCryptoStrategyV2_primaryMetadata__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create primary metadata {object: %@}", v4, v5, v6, v7, v8);
}

void __63__ICCloudSyncingObjectCryptoStrategyV2_primaryEncryptionObject__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot deserialize encryption object {object: %@}", v4, v5, v6, v7, v8);
}

- (void)saveEncryptedJSON
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 object];
  OUTLINED_FUNCTION_3();
  __int16 v5 = 2080;
  uint64_t v6 = "-[ICCloudSyncingObjectCryptoStrategyV2 saveEncryptedJSON]";
  __int16 v7 = 1024;
  int v8 = 103;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Saving encrypted values JSON… {object: %@}%s:%d", v4, 0x1Cu);
}

void __57__ICCloudSyncingObjectCryptoStrategyV2_saveEncryptedJSON__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot save encrypted values JSON because object is not authenticated {object: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "sourceURL is nil when trying to encrypt file for %@", v4, v5, v6, v7, v8);
}

void __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "destinationURL is nil when trying to encrypt file for %@", v4, v5, v6, v7, v8);
}

void __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot load data from sourceURL for %@, error = %@", v4, v5, v6, v7, v8);
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_decryptData___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "failed to decode encryptedData for %@", v4, v5, v6, v7, v8);
}

void __65__ICCloudSyncingObjectCryptoStrategyV2_decryptedDataFromFileURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot load file from url for decryption of %@, error = %@", v4, v5, v6, v7, v8);
}

void __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  [v1 className];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4_2() shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Failed to encode encryption object for V2 sidecar data for %@ (%@)", v5, v6, v7, v8, v9);
}

void __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  [v1 className];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4_2() shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Not authenticated to encrypt V2 sidecar data for %@ (%@)", v5, v6, v7, v8, v9);
}

void __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  [v1 className];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Failed to decrypt V2 sidecar data for %@ (%@)", v5, v6, v7, v8, v9);
}

void __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  [v1 className];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4_2() shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Not authenticated to decrypt V2 sidecar data for %@ (%@)", v5, v6, v7, v8, v9);
}

- (void)canAuthenticateRecord:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "failed to decode encryptedData for in isRecordAuthenticated", v2, v3, v4, v5, v6);
}

- (void)canAuthenticateRecord:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "failed to read accountKeyIdentifier for in isRecordAuthenticated", v2, v3, v4, v5, v6);
}

void __69__ICCloudSyncingObjectCryptoStrategyV2_decryptAndMergeEncryptedJSON___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "failed to decrypt JSON for %@", v4, v5, v6, v7, v8);
}

void __57__ICCloudSyncingObjectCryptoStrategyV2_accountIdentifier__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4_2() cloudAccount];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "No account identifier is found for object %@, in account %@", v6, v7, v8, v9, v10);
}

void __51__ICCloudSyncingObjectCryptoStrategyV2_accountDsid__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4_2() shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "No account DSID/name is found for object %@, in account %@", v5, v6, v7, v8, v9);
}

void __60__ICCloudSyncingObjectCryptoStrategyV2_accountKeyIdentifier__block_invoke_cold_1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot deserialize primary encryption object {object: %@}", v4, v5, v6, v7, v8);
}

- (void)currentAccountKeyIdentifier
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Cannot read account username.", v2, v3, v4, v5, v6);
}

void __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Failed to generate new account key for new currentAccountKeyIdentifier, forgetting this new currentAccountKeyIdentifier", v2, v3, v4, v5, v6);
}

void __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Failed to save new currentAccountKeyIdentifier, forgetting it. Error = %@", v2, v3, v4, v5, v6);
}

void __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x1E4F143B8]);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1C3A61000, v1, OS_LOG_TYPE_DEBUG, "New account key is generated for currentAccountKeyIdentifier: %@", (uint8_t *)&v2, 0xCu);
}

void __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x1E4F143B8]);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1C3A61000, v1, OS_LOG_TYPE_DEBUG, "Generated new currentAccountKeyIdentifier: %@", (uint8_t *)&v2, 0xCu);
}

- (void)accountKeyWithIdentifier:createIfNotExist:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "received nil identifier input for accountKeyWithIdentifier:", v2, v3, v4, v5, v6);
}

void __82__ICCloudSyncingObjectCryptoStrategyV2_accountKeyWithIdentifier_createIfNotExist___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 48);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Cannot generate account key for identifier (%@) under account (%@) because iCloud keychain is not enabled", (uint8_t *)&v5, 0x16u);
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Did not encrypt data because the data input is nil.", v2, v3, v4, v5, v6);
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Cannot find the accountKey for identifier %@", v2, v3, v4, v5, v6);
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_3(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot create metadata when encrypting for %@", v4, v5, v6, v7, v8);
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_4(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed to create new encryption object when encrypting data for %@", v4, v5, v6, v7, v8);
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Failed to encrypt data for %@, error = %@", v4, v5, v6, v7, v8);
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot generate encryption key for %@, error = %@", v4, v5, v6, v7, v8);
}

void __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Failed to decrypt for %@, error = %@", v4, v5, v6, v7, v8);
}

void __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Failed to unwrap encryptionKey for %@, error = %@", v4, v5, v6, v7, v8);
}

void __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = [v1 shortLoggingDescription];
  uint64_t v3 = [*v0 metadata];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "Cannot decrypt data because object identifier doesn't match {object: %@, metadata: %@}", v6, v7, v8, v9, v10);
}

void __71__ICCloudSyncingObjectCryptoStrategyV2_serializeToEncryptedValuesJSON___block_invoke_cold_1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed to encode encrypted object for %@", v4, v5, v6, v7, v8);
}

void __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "encryptionObject is nil when trying to save to disk", v2, v3, v4, v5, v6);
}

void __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "destinationURL is nil when trying to save to disk", v2, v3, v4, v5, v6);
}

void __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_3(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot write to disk due to failed to encode encrypted object for %@", v4, v5, v6, v7, v8);
}

void __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error writing encrypted data to file for %@, error = %@", v4, v5, v6, v7, v8);
}

@end