@interface ICNoteCryptoStrategyV2
- (BOOL)decrypt;
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)writeEncryptedNoteData:(id)a3;
- (id)decryptNotePrimitiveData;
- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3;
- (id)encryptedDataFromRecord:(id)a3;
- (void)mergeEncryptedData:(id)a3 mergeConflict:(id)a4;
- (void)serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps:(id)a3;
@end

@implementation ICNoteCryptoStrategyV2

- (BOOL)writeEncryptedNoteData:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke;
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

void __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isUnsupported])
  {
    id v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke_cold_1(v3);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (([v3 isPasswordProtected] & 1) == 0)
  {
    id v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_cold_1(v3);
    }
    goto LABEL_9;
  }
  id v4 = [*(id *)(a1 + 32) encryptData:*(void *)(a1 + 40)];
  if (v4)
  {
    [*(id *)(a1 + 32) serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps:v4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    id v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke_cold_2(v3);
    }
  }
LABEL_10:
}

- (BOOL)decrypt
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__ICNoteCryptoStrategyV2_decrypt__block_invoke;
  v4[3] = &unk_1E64A42E0;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__ICNoteCryptoStrategyV2_decrypt__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2;
  v6[3] = &unk_1E64A5958;
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = v3;
  [v4 performBlockAndWait:v6];
}

void __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v2 = (id *)(a1 + 32);
  if (([*(id *)(a1 + 32) isPasswordProtected] & 1) == 0)
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [*v2 shortLoggingDescription];
      int v13 = 138412290;
      v14 = v10;
      v11 = "note is not password-protected, but decrypt is called. %@";
LABEL_11:
      _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v13, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  id v3 = [*v2 noteData];
  id v4 = [v3 data];

  if (!v4)
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [*v2 shortLoggingDescription];
      int v13 = 138412290;
      v14 = v10;
      v11 = "note doesn't have textDataFromDatabase, but decrypt is called. %@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2_cold_2(v2, v5);
  }

  v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) noteData];
  long long v8 = [v7 data];
  v9 = [v6 decryptData:v8];

  if (v9)
  {
    [*(id *)(a1 + 32) setDecryptedData:v9];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2_cold_1(v2);
    }
  }
LABEL_13:
}

- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__44;
  v16 = __Block_byref_object_dispose__44;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__ICNoteCryptoStrategyV2_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke;
  v8[3] = &unk_1E64A4290;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = self;
  v11 = &v12;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __83__ICNoteCryptoStrategyV2_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isPasswordProtected])
  {
    objc_msgSend(*(id *)(a1 + 32), "ic_encryptedInlineableDataAssetForKeyPrefix:", @"TextData");
    os_log_t v4 = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if ([*(id *)(a1 + 40) isRecordAuthenticated:*(void *)(a1 + 32)])
      {
        id v5 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          id v6 = objc_opt_class();
          id v7 = v6;
          long long v8 = [v3 identifier];
          id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[NSObject hash](v4, "hash"));
          int v16 = 138412802;
          id v17 = v6;
          __int16 v18 = 2112;
          v19 = v8;
          __int16 v20 = 2112;
          v21 = v9;
          _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "About to decrypt text data from cloud for merging %@ (%@): %@", (uint8_t *)&v16, 0x20u);
        }
        uint64_t v10 = [*(id *)(a1 + 40) decryptData:v4];
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
      }
      else
      {
        [v3 setUnappliedEncryptedRecord:*(void *)(a1 + 32)];
      }
    }
    else
    {
      uint64_t v14 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = [v3 shortLoggingDescription];
        int v16 = 138412290;
        id v17 = v15;
        _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "topoTextDataFromRecord is nil, but decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated: is called. %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  else
  {
    os_log_t v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v13 = [v3 shortLoggingDescription];
      int v16 = 138412290;
      id v17 = v13;
      _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "note is not password-protected, but decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated: is called. %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (id)decryptNotePrimitiveData
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  long long v8 = __Block_byref_object_copy__44;
  id v9 = __Block_byref_object_dispose__44;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke;
  v4[3] = &unk_1E64A4308;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isPasswordProtected] & 1) == 0)
  {
    uint64_t v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v3 shortLoggingDescription];
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_INFO, "note is not password-protected, but decryptNotePrimitiveData is called. %@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_9;
  }
  os_log_t v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke_cold_2(v3, v4);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v3 noteData];
  uint64_t v7 = [v6 primitiveData];
  uint64_t v8 = [v5 decryptData:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke_cold_1(v3);
    }
LABEL_9:
  }
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  return 1;
}

- (id)encryptedDataFromRecord:(id)a3
{
  return (id)objc_msgSend(a3, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"TextData");
}

- (void)mergeEncryptedData:(id)a3 mergeConflict:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ICNoteCryptoStrategyV2_mergeEncryptedData_mergeConflict___block_invoke;
  v7[3] = &unk_1E64A7D10;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v7];
}

void __59__ICNoteCryptoStrategyV2_mergeEncryptedData_mergeConflict___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = [*(id *)(a1 + 32) decryptData:*(void *)(a1 + 40)];
  if (v4)
  {
    [v3 mergeWithNoteData:v4];
  }
  else
  {
    id v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __59__ICNoteCryptoStrategyV2_mergeEncryptedData_mergeConflict___block_invoke_cold_1(v3);
    }
  }
}

- (void)serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__ICNoteCryptoStrategyV2_serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps___block_invoke;
  v6[3] = &unk_1E64A43D0;
  id v7 = v4;
  id v5 = v4;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v6];
}

void __86__ICNoteCryptoStrategyV2_serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) serialized];
  if (v4)
  {
    id v5 = [v3 noteData];
    id v6 = [v5 data];
    uint64_t v7 = [v6 length];

    id v8 = [v3 noteData];
    [v8 setData:v4];

    [v3 applyRandomCryptoGooIfNeeded];
    uint64_t v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v3 shortLoggingDescription];
      int v12 = 138412290;
      int v13 = v10;
      _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Successfully encrypted data for %@", (uint8_t *)&v12, 0xCu);
    }
    if (!v7) {
      [v3 resetToIntrinsicNotesVersionAndPropagateToChildObjects];
    }
    [v3 updateArchivedAndLastViewedTimeStampsAfterSavingNoteData];
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __86__ICNoteCryptoStrategyV2_serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps___block_invoke_cold_1(v3);
    }
  }
}

void __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "note is not suported, but writeEncryptedNoteData is called. %@", v4, v5, v6, v7, v8);
}

void __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed to encrypt data for note %@", v4, v5, v6, v7, v8);
}

void __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2_cold_1(id *a1)
{
  v1 = [*a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed to decrypt note data for %@", v4, v5, v6, v7, v8);
}

void __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2_cold_2(id *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*a1 shortLoggingDescription];
  uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v6 = [*a1 noteData];
  uint64_t v7 = [v6 data];
  uint8_t v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
  int v9 = 138412546;
  id v10 = v4;
  __int16 v11 = 2112;
  int v12 = v8;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "About to decrypt text data for %@, hash = %@", (uint8_t *)&v9, 0x16u);
}

void __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed to decrypt note primitive data for %@", v4, v5, v6, v7, v8);
}

void __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Decrypting note primitive data of %@", v4, 0xCu);
}

void __59__ICNoteCryptoStrategyV2_mergeEncryptedData_mergeConflict___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "cannot decrypt data when processing NSMergeConflict: %@", v4, v5, v6, v7, v8);
}

void __86__ICNoteCryptoStrategyV2_serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed to serialize encrypted object for %@", v4, v5, v6, v7, v8);
}

@end