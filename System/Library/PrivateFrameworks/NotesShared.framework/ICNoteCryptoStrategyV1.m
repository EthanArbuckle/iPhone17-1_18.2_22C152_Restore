@interface ICNoteCryptoStrategyV1
- (BOOL)decrypt;
- (BOOL)mainKeyDecryptsPrimaryData:(id)a3;
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)rewrapWithMainKey:(id)a3;
- (BOOL)writeEncryptedNoteData:(id)a3;
- (id)decryptNotePrimitiveData;
- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3;
- (id)unwrappedKey;
- (void)correctCryptoTagAndIVIfNecessary;
- (void)mergeEncryptedData:(id)a3 mergeConflict:(id)a4;
- (void)recoverMissingCryptoWrappedKeyIfNeededWithMainKey:(id)a3;
@end

@implementation ICNoteCryptoStrategyV1

- (BOOL)writeEncryptedNoteData:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke;
  v7[3] = &unk_1E64A4290;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  v9 = &v10;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPasswordProtected])
  {
    id v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_2;
    v12[3] = &unk_1E64A4240;
    char v13 = v3;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_5;
    v9[3] = &unk_1E64A4268;
    v6 = v13;
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v10 = v6;
    uint64_t v11 = v7;
    [v4 encryptWithMainKeyOfObject:v6 dataToEncrypt:v5 failureHandler:v12 successHandler:v9];

    id v8 = v13;
  }
  else
  {
    id v8 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_cold_1(v3);
    }
  }
}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_2(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_2_cold_1(a1);
  }
}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = os_log_create("com.apple.notes", "CoreData");
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_5_cold_1(a1, v7, v11);
    }

    uint64_t v12 = [*(id *)(a1 + 32) noteData];
    [v12 setData:v7];

    char v13 = [*(id *)(a1 + 32) noteData];
    [v13 setCryptoTag:v8];

    v14 = [*(id *)(a1 + 32) noteData];
    [v14 setCryptoInitializationVector:v9];

    [*(id *)(a1 + 32) setCryptoTag:v8];
    [*(id *)(a1 + 32) setCryptoInitializationVector:v9];
    [*(id *)(a1 + 32) updateArchivedAndLastViewedTimeStampsAfterSavingNoteData];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = [*(id *)(a1 + 32) identifier];
      int v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_INFO, "Trying to save note data for %@, but we don't have any data", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (BOOL)decrypt
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__ICNoteCryptoStrategyV1_decrypt__block_invoke;
  v4[3] = &unk_1E64A42E0;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__ICNoteCryptoStrategyV1_decrypt__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  id v16 = 0;
  id v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_8;
  v8[3] = &unk_1E64A42B8;
  uint64_t v11 = v17;
  id v5 = v3;
  uint64_t v12 = v19;
  char v13 = v15;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v5;
  uint64_t v10 = v6;
  uint64_t v14 = v7;
  [v4 performBlockAndWait:v8];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_8(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  char v2 = (id *)(a1 + 32);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) isPasswordProtected];
  id v3 = [*v2 noteData];
  uint64_t v4 = [v3 data];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [*v2 identifier];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v24 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = [*v2 shortLoggingDescription];
      *(_DWORD *)buf = 138412290;
      v34 = v25;
      v26 = "note is not password-protected, but decrypt is called. %@";
LABEL_10:
      _os_log_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_INFO, v26, buf, 0xCu);
    }
LABEL_11:
    v22 = v24;
    goto LABEL_12;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    v24 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = [*v2 shortLoggingDescription];
      *(_DWORD *)buf = 138412290;
      v34 = v25;
      v26 = "note doesn't have textDataFromDatabase, but decrypt is called. %@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v10 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_8_cold_1(v2, a1 + 56, v10);
  }

  uint64_t v11 = [ICEncryptedData alloc];
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  char v13 = [*(id *)(a1 + 32) cryptoTag];
  uint64_t v14 = [*(id *)(a1 + 32) cryptoInitializationVector];
  v15 = [*(id *)(a1 + 32) noteData];
  id v16 = [v15 cryptoTag];
  v17 = [*(id *)(a1 + 32) noteData];
  char v18 = [v17 cryptoInitializationVector];
  v19 = [(ICEncryptedData *)v11 initWithData:v12 tag:v13 initializationVector:v14 fallbackTag:v16 fallbackInitializationVector:v18];

  id v20 = objc_opt_class();
  v21 = *(void **)(a1 + 32);
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_9;
  v30 = &unk_1E64A4218;
  v31 = v21;
  v32 = v19;
  v22 = v19;
  v23 = [v20 decryptWithMainKeyOfObject:v31 encryptedData:v22 fallbackAttemptSuccessCleanupHandler:&v27];
  objc_msgSend(*(id *)(a1 + 32), "setDecryptedData:", v23, v27, v28, v29, v30);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;

  v24 = v31;
LABEL_12:
}

void __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_9(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 40) fallbackTag];
  [*(id *)(a1 + 32) setCryptoTag:v2];

  id v3 = [*(id *)(a1 + 40) fallbackInitializationVector];
  [*(id *)(a1 + 32) setCryptoInitializationVector:v3];

  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v4 = [*(id *)(a1 + 32) shortLoggingDescription];
  objc_msgSend(v5, "ic_saveWithLogDescription:", @"Set fallback crypto goo {note: %@}", v4);
}

- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__ICNoteCryptoStrategyV1_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke;
  v8[3] = &unk_1E64A4290;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = self;
  uint64_t v11 = &v12;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __83__ICNoteCryptoStrategyV1_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isPasswordProtected])
  {
    objc_msgSend(*(id *)(a1 + 32), "ic_encryptedInlineableDataAssetForKeyPrefix:", @"TextData");
    os_log_t v4 = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if ([*(id *)(a1 + 40) isAuthenticated])
      {
        id v5 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          id v6 = objc_opt_class();
          id v7 = v6;
          uint64_t v8 = [v3 identifier];
          int v19 = 138412802;
          id v20 = v6;
          __int16 v21 = 2112;
          v22 = v8;
          __int16 v23 = 2048;
          uint64_t v24 = [v4 hash];
          _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "About to decrypt text data from cloud for merging %@ (%@): %lu", (uint8_t *)&v19, 0x20u);
        }
        id v9 = [ICEncryptedData alloc];
        uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CryptoTag"];
        uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CryptoInitializationVector"];
        uint64_t v12 = [(ICEncryptedData *)v9 initWithData:v4 tag:v10 initializationVector:v11];

        uint64_t v13 = [(id)objc_opt_class() decryptWithMainKeyOfObject:v3 encryptedData:v12 fallbackAttemptSuccessCleanupHandler:0];
        uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
        v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;
      }
      else
      {
        [v3 setUnappliedEncryptedRecord:*(void *)(a1 + 32)];
      }
    }
    else
    {
      id v17 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        char v18 = [v3 shortLoggingDescription];
        int v19 = 138412290;
        id v20 = v18;
        _os_log_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_INFO, "topoTextDataFromRecord is nil, but decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated: is called. %@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else
  {
    os_log_t v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v16 = [v3 shortLoggingDescription];
      int v19 = 138412290;
      id v20 = v16;
      _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "note is not password-protected, but decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated: is called. %@", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)decryptNotePrimitiveData
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__ICNoteCryptoStrategyV1_decryptNotePrimitiveData__block_invoke;
  v4[3] = &unk_1E64A4308;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__ICNoteCryptoStrategyV1_decryptNotePrimitiveData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isPasswordProtected])
  {
    os_log_t v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __50__ICNoteCryptoStrategyV1_decryptNotePrimitiveData__block_invoke_cold_1(v3);
    }

    uint64_t v5 = [ICEncryptedData alloc];
    id v6 = [v3 noteData];
    uint64_t v7 = [v6 primitiveData];
    uint64_t v8 = [v3 noteData];
    id v9 = [v8 cryptoTag];
    id v10 = [v3 noteData];
    uint64_t v11 = [v10 cryptoInitializationVector];
    uint64_t v12 = [(ICEncryptedData *)v5 initWithData:v7 tag:v9 initializationVector:v11];

    uint64_t v13 = [(id)objc_opt_class() decryptWithMainKeyOfObject:v3 encryptedData:v12 fallbackAttemptSuccessCleanupHandler:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      [*(id *)(a1 + 32) correctCryptoTagAndIVIfNecessary];
    }
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v16 = [v3 shortLoggingDescription];
      int v17 = 138412290;
      char v18 = v16;
      _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_INFO, "note is not password-protected, but decryptNotePrimitiveData is called. %@", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  return 1;
}

- (void)mergeEncryptedData:(id)a3 mergeConflict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__ICNoteCryptoStrategyV1_mergeEncryptedData_mergeConflict___block_invoke;
  v10[3] = &unk_1E64A4358;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v10];
}

void __59__ICNoteCryptoStrategyV1_mergeEncryptedData_mergeConflict___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_log_t v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [v3 shortLoggingDescription];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "Decrypting %@ for merging encrypted data", buf, 0xCu);
  }
  id v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__ICNoteCryptoStrategyV1_mergeEncryptedData_mergeConflict___block_invoke_11;
  v9[3] = &unk_1E64A4330;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v7 = v3;
  id v12 = v7;
  id v8 = [v6 decryptWithMainKeyOfObject:v7 encryptedDataPreparationBlock:v9 fallbackAttemptSuccessCleanupHandler:0];
  if (v8) {
    [v7 mergeWithNoteData:v8];
  }
}

ICEncryptedData *__59__ICNoteCryptoStrategyV1_mergeEncryptedData_mergeConflict___block_invoke_11(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) persistedSnapshot];
  id v3 = [v2 objectForKeyedSubscript:@"cryptoTag"];
  os_log_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) cachedSnapshot];
    id v5 = [v6 objectForKeyedSubscript:@"cryptoTag"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v5 = 0;
  }
  id v7 = [*(id *)(a1 + 32) persistedSnapshot];
  id v8 = [v7 objectForKeyedSubscript:@"cryptoInitializationVector"];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) cachedSnapshot];
    id v10 = [v11 objectForKeyedSubscript:@"cryptoInitializationVector"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v5 && v10)
    {
      id v12 = [[ICEncryptedData alloc] initWithData:*(void *)(a1 + 40) tag:v5 initializationVector:v10];
      goto LABEL_17;
    }
  }
  else
  {

    id v10 = 0;
  }
  uint64_t v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = [*(id *)(a1 + 48) shortLoggingDescription];
    int v16 = 138412290;
    int v17 = v14;
    _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_INFO, "No tag or initialization vector for encrypted text data save conflict %@", (uint8_t *)&v16, 0xCu);
  }
  id v12 = 0;
LABEL_17:

  return v12;
}

- (id)unwrappedKey
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__ICNoteCryptoStrategyV1_unwrappedKey__block_invoke;
  v4[3] = &unk_1E64A42E0;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __38__ICNoteCryptoStrategyV1_unwrappedKey__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = +[ICAuthenticationState sharedState];
  uint64_t v5 = [v4 cachedMainKeyForObject:v3];

  if (v5) {
    [*(id *)(a1 + 32) recoverMissingCryptoWrappedKeyIfNeededWithMainKey:v5];
  }
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)ICNoteCryptoStrategyV1;
  uint64_t v6 = objc_msgSendSuper2(&v9, sel_unwrappedKey);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (BOOL)mainKeyDecryptsPrimaryData:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ICNoteCryptoStrategyV1_mainKeyDecryptsPrimaryData___block_invoke;
  v7[3] = &unk_1E64A4290;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  objc_super v9 = &v10;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

id __53__ICNoteCryptoStrategyV1_mainKeyDecryptsPrimaryData___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) recoverMissingCryptoWrappedKeyIfNeededWithMainKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ICNoteCryptoStrategyV1;
  id result = objc_msgSendSuper2(&v4, sel_mainKeyDecryptsPrimaryData_, v2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

- (BOOL)rewrapWithMainKey:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteCryptoStrategyV1 rewrapWithMainKey:](self, v5);
  }

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__ICNoteCryptoStrategyV1_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E64A4290;
  id v6 = v4;
  id v14 = v6;
  uint64_t v15 = self;
  int v16 = &v17;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v13];
  uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [(ICCryptoStrategyBase *)self object];
    id v11 = [v10 shortLoggingDescription];
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v18 + 24)];
    *(_DWORD *)buf = 138413058;
    v22 = v11;
    __int16 v23 = 2112;
    __int16 v25 = 2080;
    uint64_t v24 = v12;
    v26 = "-[ICNoteCryptoStrategyV1 rewrapWithMainKey:]";
    __int16 v27 = 1024;
    int v28 = 288;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped note with main key {note: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __44__ICNoteCryptoStrategyV1_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v50.receiver = *(id *)(a1 + 40);
  v50.super_class = (Class)ICNoteCryptoStrategyV1;
  if (objc_msgSendSuper2(&v50, sel_rewrapWithMainKey_, v4))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v41 = v3;
    id v5 = [v3 attachments];
    id v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v47;
      *(void *)&long long v8 = 138412546;
      long long v39 = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v47 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          char v13 = objc_msgSend(v12, "cryptoStrategy", v39);
          char v14 = [v13 rewrapWithMainKey:*(void *)(a1 + 32)];

          if ((v14 & 1) == 0)
          {
            int v15 = [v12 isUsed];
            int v16 = os_log_create("com.apple.notes", "Crypto");
            uint64_t v17 = v16;
            if (v15)
            {
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                char v20 = [v41 shortLoggingDescription];
                __int16 v21 = [v12 shortLoggingDescription];
                *(_DWORD *)buf = v39;
                v53 = v20;
                __int16 v54 = 2112;
                v55 = v21;
                _os_log_error_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_ERROR, "Cannot rewrap attachment {note: %@, attachment: %@}", buf, 0x16u);
              }
              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
            }
            else
            {
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                uint64_t v18 = [v41 shortLoggingDescription];
                uint64_t v19 = [v12 shortLoggingDescription];
                *(_DWORD *)buf = v39;
                v53 = v18;
                __int16 v54 = 2112;
                v55 = v19;
                _os_log_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_INFO, "Cannot rewrap unused attachment {note: %@, attachment: %@}", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v9);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v3 = v41;
    v22 = [v41 inlineAttachments];
    os_log_t v23 = (os_log_t)[v22 copy];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v24)
    {
      uint64_t v26 = v24;
      uint64_t v27 = *(void *)v43;
      *(void *)&long long v25 = 138412546;
      long long v40 = v25;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v43 != v27) {
            objc_enumerationMutation(v23);
          }
          uint64_t v29 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          v30 = objc_msgSend(v29, "cryptoStrategy", v40);
          char v31 = [v30 rewrapWithMainKey:*(void *)(a1 + 32)];

          if ((v31 & 1) == 0)
          {
            int v32 = [v29 isUsed];
            v33 = os_log_create("com.apple.notes", "Crypto");
            v34 = v33;
            if (v32)
            {
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v37 = [v41 shortLoggingDescription];
                v38 = [v29 shortLoggingDescription];
                *(_DWORD *)buf = v40;
                v53 = v37;
                __int16 v54 = 2112;
                v55 = v38;
                _os_log_error_impl(&dword_1C3A61000, v34, OS_LOG_TYPE_ERROR, "Cannot rewrap inline attachment {note: %@, inlineAttachment: %@}", buf, 0x16u);
              }
              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
            }
            else
            {
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                uint64_t v35 = [v41 shortLoggingDescription];
                v36 = [v29 shortLoggingDescription];
                *(_DWORD *)buf = v40;
                v53 = v35;
                __int16 v54 = 2112;
                v55 = v36;
                _os_log_impl(&dword_1C3A61000, v34, OS_LOG_TYPE_INFO, "Cannot rewrap unused inline attachment {note: %@, inlineAttachment: %@}", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v26 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v26);
      id v3 = v41;
    }
  }
  else
  {
    os_log_t v23 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __44__ICNoteCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1(v3);
    }
  }
}

- (void)recoverMissingCryptoWrappedKeyIfNeededWithMainKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke;
  v6[3] = &unk_1E64A43D0;
  id v7 = v4;
  id v5 = v4;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v6];
}

void __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isRecoveringCryptoWrappedKey] & 1) == 0
    && [v3 isPasswordProtected])
  {
    id v4 = [v3 cryptoWrappedKey];
    if (v4)
    {

      goto LABEL_20;
    }
    if ([v3 needsInitialFetchFromCloud]) {
      goto LABEL_20;
    }
    id v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_cold_1(v3);
    }

    [v3 setIsRecoveringCryptoWrappedKey:1];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = [v3 attachments];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_27;
    v26[3] = &unk_1E64A4380;
    id v8 = v6;
    id v27 = v8;
    [v7 enumerateObjectsUsingBlock:v26];

    uint64_t v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v8 count];
      id v11 = [v3 attachments];
      uint64_t v12 = [v11 count];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Found %lu possible wrapped keys from %lu attachments", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    char v31 = __Block_byref_object_copy_;
    int v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    __int16 v21 = __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_29;
    v22 = &unk_1E64A43A8;
    id v23 = *(id *)(a1 + 32);
    id v13 = v3;
    id v24 = v13;
    long long v25 = buf;
    [v8 enumerateObjectsUsingBlock:&v19];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      char v14 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = objc_msgSend(v13, "shortLoggingDescription", v19, v20, v21, v22, v23);
        *(_DWORD *)int v28 = 138412290;
        uint64_t v29 = v15;
        _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Successfully recovered crypto wrapped key for %@", v28, 0xCu);
      }
      [v13 setCryptoWrappedKey:*(void *)(*(void *)&buf[8] + 40)];
      int v16 = [v13 managedObjectContext];
      objc_msgSend(v16, "ic_save");
    }
    else
    {
      if (!objc_msgSend(v13, "isInCloud", v19, v20, v21, v22, v23))
      {
LABEL_19:
        objc_msgSend(v13, "setIsRecoveringCryptoWrappedKey:", 0, v19, v20, v21, v22);

        _Block_object_dispose(buf, 8);
        goto LABEL_20;
      }
      uint64_t v17 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v13 shortLoggingDescription];
        *(_DWORD *)int v28 = 138412290;
        uint64_t v29 = v18;
        _os_log_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_INFO, "Unable to recover crypto wrapped key from attachments, trying to fetch the record %@", v28, 0xCu);
      }
      [v13 setNeedsToBeFetchedFromCloud:1];
      int v16 = [v13 managedObjectContext];
      objc_msgSend(v16, "ic_save");
    }

    goto LABEL_19;
  }
LABEL_20:
}

void __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = [a2 cryptoWrappedKey];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

void __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_29(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) keyData];
  id v17 = 0;
  id v8 = +[ICCipherV1 unwrapKey:v6 withWrapper:v7 error:&v17];
  id v9 = v17;

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v11 = [*(id *)(a1 + 40) noteData];
    uint64_t v12 = [v11 data];

    id v13 = [*(id *)(a1 + 40) cryptoTag];
    char v14 = [*(id *)(a1 + 40) cryptoInitializationVector];
    id v16 = 0;
    int v15 = +[ICCipherV1 decryptData:v12 withKey:v8 tag:v13 initializationVector:v14 error:&v16];
    id v9 = v16;

    if (v15 && !v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a3 = 1;
    }
  }
}

- (void)correctCryptoTagAndIVIfNecessary
{
}

void __58__ICNoteCryptoStrategyV1_correctCryptoTagAndIVIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (![v2 isPasswordProtected]) {
    goto LABEL_14;
  }
  if ([v2 needsInitialFetchFromCloud]) {
    goto LABEL_14;
  }
  id v3 = [v2 cryptoTag];
  id v4 = [v2 noteData];
  id v5 = [v4 cryptoTag];
  int v6 = [v3 isEqualToData:v5];

  id v7 = [v2 cryptoInitializationVector];
  id v8 = [v2 noteData];
  id v9 = [v8 cryptoInitializationVector];
  char v10 = [v7 isEqualToData:v9];

  if (v6)
  {
    if (v10) {
      goto LABEL_14;
    }
  }
  id v11 = [v2 noteData];
  uint64_t v12 = [v11 cryptoTag];
  if (v12)
  {
    id v13 = (void *)v12;
    char v14 = [v2 noteData];
    int v15 = [v14 cryptoInitializationVector];

    if (v15)
    {
      id v16 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __58__ICNoteCryptoStrategyV1_correctCryptoTagAndIVIfNecessary__block_invoke_cold_2(v2, v16);
      }

      id v17 = [v2 noteData];
      uint64_t v18 = [v17 cryptoTag];
      [v2 setCryptoTag:v18];

      uint64_t v19 = [v2 noteData];
      uint64_t v20 = [v19 cryptoInitializationVector];
      [v2 setCryptoInitializationVector:v20];

      __int16 v21 = [v2 managedObjectContext];
      objc_msgSend(v21, "ic_save");

      goto LABEL_14;
    }
  }
  else
  {
  }
  v22 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    __58__ICNoteCryptoStrategyV1_correctCryptoTagAndIVIfNecessary__block_invoke_cold_1(v2, v22);
  }

  [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICNoteCryptoStrategyV1 correctCryptoTagAndIVIfNecessary]_block_invoke" simulateCrash:1 showAlert:1 format:@"Error correcting note crypto tag/IV using note data"];
LABEL_14:
}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "note is not password-protected, but writeEncryptedNoteData is called. %@", v4, v5, v6, v7, v8);
}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_2_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error encrypting data for note %@", v4, v5, v6, v7, v8);
}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_5_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) shortLoggingDescription];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 hash];
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Saving note data for %@: %lu", (uint8_t *)&v6, 0x16u);
}

void __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_8_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [*a1 identifier];
  uint64_t v8 = [*(id *)(*(void *)(*(void *)a2 + 8) + 40) hash];
  int v9 = 138412802;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "About to decrypt text data for %@ (%@): %lu", (uint8_t *)&v9, 0x20u);
}

void __50__ICNoteCryptoStrategyV1_decryptNotePrimitiveData__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Decrypting note primitive data of %@", v4, v5, v6, v7, v8);
}

- (void)rewrapWithMainKey:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 object];
  uint64_t v4 = [v3 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  __int16 v6 = 2080;
  uint64_t v7 = "-[ICNoteCryptoStrategyV1 rewrapWithMainKey:]";
  __int16 v8 = 1024;
  int v9 = 251;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Rewrapping note with main key… {note: %@}%s:%d", v5, 0x1Cu);
}

void __44__ICNoteCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping attachments because note text couldn't be rewrapped {note: %@}", v4, v5, v6, v7, v8);
}

void __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Recovering missing crypto wrapped key for %@", v4, v5, v6, v7, v8);
}

void __58__ICNoteCryptoStrategyV1_correctCryptoTagAndIVIfNecessary__block_invoke_cold_1(void *a1, os_log_t log)
{
  uint64_t v3 = [a1 shortLoggingDescription];
  id v17 = [a1 cryptoTag];
  [v17 hash];
  uint64_t v4 = [a1 noteData];
  uint64_t v5 = [v4 cryptoTag];
  [v5 hash];
  uint64_t v6 = [a1 noteData];
  uint64_t v7 = [v6 cryptoTag];
  [v7 hash];
  uint8_t v8 = [a1 noteData];
  int v9 = [v8 cryptoInitializationVector];
  [v9 hash];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1C3A61000, v10, v11, "Error correcting note crypto tag/IV using note data {note: %@, note.cryptoTag: %lu, noteData.cryptoTag: %lu, note.cryptoInitializationVector: %lu, noteData.cryptoInitializationVector: %lu}", v12, v13, v14, v15, log, (uint64_t)v17, v19);
}

void __58__ICNoteCryptoStrategyV1_correctCryptoTagAndIVIfNecessary__block_invoke_cold_2(void *a1, os_log_t log)
{
  uint64_t v3 = [a1 shortLoggingDescription];
  id v17 = [a1 cryptoTag];
  [v17 hash];
  uint64_t v4 = [a1 noteData];
  uint64_t v5 = [v4 cryptoTag];
  [v5 hash];
  uint64_t v6 = [a1 noteData];
  uint64_t v7 = [v6 cryptoTag];
  [v7 hash];
  uint8_t v8 = [a1 noteData];
  int v9 = [v8 cryptoInitializationVector];
  [v9 hash];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1C3A61000, v10, v11, "Correcting note crypto tag/IV using note data {note: %@, note.cryptoTag: %lu, noteData.cryptoTag: %lu, note.cryptoInitializationVector: %lu, noteData.cryptoInitializationVector: %lu}", v12, v13, v14, v15, log, (uint64_t)v17, v19);
}

@end