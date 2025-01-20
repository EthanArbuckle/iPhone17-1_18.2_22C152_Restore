@interface ICNoteCryptoStrategyV1Neo
- (BOOL)decrypt;
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)rewrapWithMainKey:(id)a3;
- (BOOL)writeEncryptedNoteData:(id)a3;
- (id)decryptNotePrimitiveData;
- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3;
- (void)decrypt;
- (void)decryptNotePrimitiveData;
- (void)mergeEncryptedData:(id)a3 mergeConflict:(id)a4;
@end

@implementation ICNoteCryptoStrategyV1Neo

- (BOOL)rewrapWithMainKey:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteCryptoStrategyV1Neo rewrapWithMainKey:](self);
  }

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__ICNoteCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E64A4290;
  id v6 = v4;
  id v14 = v6;
  v15 = self;
  v16 = &v17;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v13];
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = [(ICCryptoStrategyBase *)self object];
    v11 = [v10 shortLoggingDescription];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v18 + 24)];
    *(_DWORD *)buf = 138413058;
    v22 = v11;
    __int16 v23 = 2112;
    __int16 v25 = 2080;
    v24 = v12;
    v26 = "-[ICNoteCryptoStrategyV1Neo rewrapWithMainKey:]";
    __int16 v27 = 1024;
    int v28 = 65;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped note with main key {note: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __47__ICNoteCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v50.receiver = *(id *)(a1 + 40);
  v50.super_class = (Class)ICNoteCryptoStrategyV1Neo;
  if (objc_msgSendSuper2(&v50, sel_rewrapWithMainKey_, v4))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v41 = v3;
    v5 = [v3 attachments];
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
          v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "cryptoStrategy", v39);
          char v14 = [v13 rewrapWithMainKey:*(void *)(a1 + 32)];

          if ((v14 & 1) == 0)
          {
            int v15 = [v12 isUsed];
            v16 = os_log_create("com.apple.notes", "Crypto");
            uint64_t v17 = v16;
            if (v15)
            {
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                char v20 = [v41 shortLoggingDescription];
                v21 = [v12 shortLoggingDescription];
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
                v18 = [v41 shortLoggingDescription];
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
                v35 = [v41 shortLoggingDescription];
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

- (BOOL)writeEncryptedNoteData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteCryptoStrategyV1Neo writeEncryptedNoteData:](self);
  }

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke;
  v13[3] = &unk_1E64A4290;
  void v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  int v15 = &v16;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v13];
  uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [(ICCryptoStrategyBase *)self object];
    v11 = [v10 shortLoggingDescription];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v17 + 24)];
    *(_DWORD *)buf = 138413058;
    v21 = v11;
    __int16 v22 = 2112;
    __int16 v24 = 2080;
    os_log_t v23 = v12;
    long long v25 = "-[ICNoteCryptoStrategyV1Neo writeEncryptedNoteData:]";
    __int16 v26 = 1024;
    int v27 = 103;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Wrote encrypted note data {note: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 noteData];
  v5 = [v4 data];
  uint64_t v6 = [v5 length];

  uint64_t v7 = [*(id *)(a1 + 32) encryptData:*(void *)(a1 + 40)];
  BOOL v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 serialized];
    if (v9)
    {
      uint64_t v10 = [v3 noteData];
      [v10 setData:v9];

      [v3 applyRandomCryptoGooIfNeeded];
      if (!v6) {
        [v3 resetToIntrinsicNotesVersionAndPropagateToChildObjects];
      }
      [v3 updateArchivedAndLastViewedTimeStampsAfterSavingNoteData];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke_cold_2(v3);
      }
    }
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke_cold_1(v3);
    }
  }
}

- (BOOL)decrypt
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteCryptoStrategyV1Neo decrypt](self);
  }

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke;
  v10[3] = &unk_1E64A42E0;
  v10[4] = self;
  v10[5] = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v10];
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [(ICCryptoStrategyBase *)self object];
    BOOL v8 = [v7 shortLoggingDescription];
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v12 + 24)];
    *(_DWORD *)buf = 138413058;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    __int16 v19 = 2080;
    uint64_t v18 = v9;
    char v20 = "-[ICNoteCryptoStrategyV1Neo decrypt]";
    __int16 v21 = 1024;
    int v22 = 133;
    _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "Decrypted note data {note: %@, success: %@}%s:%d", buf, 0x26u);
  }
  char v5 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

void __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 noteData];
  char v5 = [v4 data];

  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke_cold_2(a1, v3, v6);
    }

    uint64_t v7 = *(void **)(a1 + 32);
    BOOL v8 = [v3 noteData];
    uint64_t v9 = [v8 data];
    uint64_t v10 = [v7 decryptData:v9];

    if (v10)
    {
      [v3 setDecryptedData:v10];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke_cold_1(v3);
      }
    }
  }
}

- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteCryptoStrategyV1Neo decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:](self);
  }

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__5;
  __int16 v21 = __Block_byref_object_dispose__5;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke;
  v13[3] = &unk_1E64A4290;
  id v6 = v4;
  id v14 = v6;
  int v15 = self;
  uint64_t v16 = &v17;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v13];
  uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [(ICCryptoStrategyBase *)self object];
    uint64_t v11 = [v10 shortLoggingDescription];
    v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v18[5] != 0];
    *(_DWORD *)buf = 138413058;
    __int16 v24 = v11;
    __int16 v25 = 2112;
    __int16 v27 = 2080;
    __int16 v26 = v12;
    uint64_t v28 = "-[ICNoteCryptoStrategyV1Neo decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:]";
    __int16 v29 = 1024;
    int v30 = 165;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Decrypted note data or saving as unapplied record {note: %@, success: %@}%s:%d", buf, 0x26u);
  }
  id v8 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 primaryEncryptedDataFromRecord:*(void *)(a1 + 32)];
  char v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_3(v3, v4);
  }

  if (!v4)
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_1(v3);
    }
    goto LABEL_11;
  }
  if ([v3 isAuthenticated]
    && ([*(id *)(a1 + 40) isRecordAuthenticated:*(void *)(a1 + 32)] & 1) != 0)
  {
    uint64_t v6 = [*(id *)(a1 + 40) decryptData:v4];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_2(v3, v4);
    }
LABEL_11:

    goto LABEL_12;
  }
  [v3 setUnappliedEncryptedRecord:*(void *)(a1 + 32)];
LABEL_12:
}

- (id)decryptNotePrimitiveData
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteCryptoStrategyV1Neo decryptNotePrimitiveData](self);
  }

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__5;
  int v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke;
  v10[3] = &unk_1E64A4308;
  v10[4] = self;
  v10[5] = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v10];
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [(ICCryptoStrategyBase *)self object];
    id v8 = [v7 shortLoggingDescription];
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v12[5] != 0];
    *(_DWORD *)buf = 138413058;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v21 = 2080;
    char v20 = v9;
    id v22 = "-[ICNoteCryptoStrategyV1Neo decryptNotePrimitiveData]";
    __int16 v23 = 1024;
    int v24 = 191;
    _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "Decrypted note primitive data {note: %@, success: %@}%s:%d", buf, 0x26u);
  }
  id v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 noteData];
  id v5 = [v4 primitiveData];

  uint64_t v6 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke_cold_2(v3, v5, v6);
  }

  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) decryptData:v5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke_cold_1(v3);
      }
    }
  }
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  return 1;
}

- (void)mergeEncryptedData:(id)a3 mergeConflict:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteCryptoStrategyV1Neo mergeEncryptedData:mergeConflict:](self);
  }

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__ICNoteCryptoStrategyV1Neo_mergeEncryptedData_mergeConflict___block_invoke;
  v14[3] = &unk_1E64A4290;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v16 = &v17;
  [(ICCryptoStrategyBase *)self performBlockIfNoteExists:v14];
  uint64_t v10 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [(ICCryptoStrategyBase *)self object];
    v12 = [v11 shortLoggingDescription];
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v18 + 24)];
    *(_DWORD *)buf = 138413058;
    id v22 = v12;
    __int16 v23 = 2112;
    __int16 v25 = 2080;
    int v24 = v13;
    __int16 v26 = "-[ICNoteCryptoStrategyV1Neo mergeEncryptedData:mergeConflict:]";
    __int16 v27 = 1024;
    int v28 = 220;
    _os_log_debug_impl(&dword_1C3A61000, v10, OS_LOG_TYPE_DEBUG, "Merged encrypted note data {note: %@, success: %@}%s:%d", buf, 0x26u);
  }
  _Block_object_dispose(&v17, 8);
}

void __62__ICNoteCryptoStrategyV1Neo_mergeEncryptedData_mergeConflict___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) decryptData:*(void *)(a1 + 40)];
  if (v4)
  {
    [v3 mergeWithNoteData:v4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    id v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke_cold_1(v3);
    }
  }
}

- (void)rewrapWithMainKey:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 object];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Rewrapping note with main key… {note: %@}%s:%d", v5, v6, v7, v8, v9);
}

- (void)writeEncryptedNoteData:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 object];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Writing encrypted note data… {note: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt note data {note: %@}", v4, v5, v6, v7, v8);
}

void __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot serialize encrypted note data {note: %@}", v4, v5, v6, v7, v8);
}

- (void)decrypt
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Decrypting note data… {note: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt note data {note: %@}", v4, v5, v6, v7, v8);
}

void __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) object];
  uint64_t v6 = [v5 shortLoggingDescription];
  uint64_t v7 = (void *)MEMORY[0x1E4F28ED0];
  uint8_t v8 = [a2 noteData];
  uint8_t v9 = [v8 data];
  uint64_t v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "hash"));
  int v11 = 138413058;
  v12 = v6;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9_0();
  int v13 = 120;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Decrypting note data… {note: %@, note.data.hash: %@}%s:%d", (uint8_t *)&v11, 0x26u);
}

- (void)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Decrypting note data or saving as unapplied record… {note: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt note data from record {note: %@}", v4, v5, v6, v7, v8);
}

void __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_2(void *a1, void *a2)
{
  [a1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(id)OUTLINED_FUNCTION_6_1() noteData];
  uint64_t v7 = [v6 primitiveData];
  uint8_t v8 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
  uint8_t v9 = objc_msgSend(*(id *)(v4 + 3792), "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_1(&dword_1C3A61000, v10, v11, "Decrypted note data or saving as unapplied record {note: %@, note.primitiveData.hash: %@, record.data.hash: %@}%s:%d", v12, v13, v14, v15, v16);
}

void __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_3(void *a1, void *a2)
{
  [a1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(id)OUTLINED_FUNCTION_6_1() noteData];
  uint64_t v7 = [v6 primitiveData];
  uint8_t v8 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
  uint8_t v9 = objc_msgSend(*(id *)(v4 + 3792), "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_1(&dword_1C3A61000, v10, v11, "Decrypting note data or saving as unapplied record… {note: %@, note.primitiveData.hash: %@, record.data.hash: %@}%s:%d", v12, v13, v14, v15, v16);
}

- (void)decryptNotePrimitiveData
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Decrypting note primitive data… {note: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt primitive note data {note: %@}", v4, v5, v6, v7, v8);
}

void __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke_cold_2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 shortLoggingDescription];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
  int v7 = 138413058;
  uint8_t v8 = v5;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9_0();
  int v9 = 177;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Decrypting note primitive data… {note: %@, note.primitiveData.hash: %@}%s:%d", (uint8_t *)&v7, 0x26u);
}

- (void)mergeEncryptedData:(void *)a1 mergeConflict:.cold.1(void *a1)
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Merging encrypted note data… {note: %@}%s:%d", v5, v6, v7, v8, v9);
}

@end