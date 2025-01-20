@interface ICCryptoStrategyBase
- (BOOL)authenticateWithPassphrase:(id)a3;
- (BOOL)canAuthenticate;
- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4;
- (BOOL)encryptSidecarFileFromURL:(id)a3 toURL:(id)a4;
- (BOOL)hasPassphraseSet;
- (BOOL)hasSameKeyAsObject:(id)a3;
- (BOOL)isAuthenticated;
- (BOOL)isPassphraseCorrect:(id)a3;
- (BOOL)isRecordAuthenticated:(id)a3;
- (BOOL)loadDecryptedValuesIfNecessary;
- (BOOL)mainKeyDecryptsPrimaryData:(id)a3;
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)recordHasChangedPassphrase:(id)a3;
- (BOOL)rewrapDataAtURL:(id)a3 withMainKey:(id)a4;
- (BOOL)rewrapFile:(id)a3 withMainKey:(id)a4 generationManager:(id)a5;
- (BOOL)rewrapWithMainKey:(id)a3;
- (BOOL)saveEncryptedJSON;
- (BOOL)serialize:(id)a3 toURL:(id)a4;
- (ICCloudSyncingObject)object;
- (ICCryptoStrategyBase)initWithCloudSyncingObject:(id)a3;
- (ICEncryptionKey)primaryWrappedKey;
- (ICEncryptionMetadata)primaryMetadata;
- (ICEncryptionObject)primaryEncryptionObject;
- (NSString)passphraseHint;
- (id)decryptData:(id)a3;
- (id)decryptSidecarData:(id)a3;
- (id)decryptedDataFromFileURL:(id)a3;
- (id)decryptedSidecarDataFromFileURL:(id)a3;
- (id)encryptData:(id)a3;
- (id)encryptSidecarData:(id)a3;
- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4;
- (id)mainKeyForPassphrase:(id)a3;
- (int64_t)intrinsicNotesVersion;
- (void)invalidateStrategy;
- (void)performBlockIfAccountExists:(id)a3;
- (void)performBlockIfAttachmentExists:(id)a3;
- (void)performBlockIfMediaExists:(id)a3;
- (void)performBlockIfNoteExists:(id)a3;
- (void)performBlockIfObjectExists:(id)a3;
- (void)performBlockIfPreviewImageExists:(id)a3;
@end

@implementation ICCryptoStrategyBase

- (int64_t)intrinsicNotesVersion
{
  return 0;
}

- (ICCryptoStrategyBase)initWithCloudSyncingObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICCryptoStrategyBase;
  v5 = [(ICCryptoStrategyBase *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_object, v4);
  }

  return v6;
}

- (void)invalidateStrategy
{
}

- (void)performBlockIfObjectExists:(id)a3
{
  v9 = (void (**)(id, void *))a3;
  id v4 = [(ICCryptoStrategyBase *)self object];
  uint64_t v5 = [v4 managedObjectContext];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v4 identifier];
    uint64_t v8 = [v7 length];

    if (v9)
    {
      if (v8) {
        v9[2](v9, v4);
      }
    }
  }
}

- (void)performBlockIfAccountExists:(id)a3
{
  v10 = (void (**)(id, void *))a3;
  id v4 = [(ICCryptoStrategyBase *)self object];
  objc_opt_class();
  uint64_t v5 = ICCheckedDynamicCast();
  uint64_t v6 = [v5 managedObjectContext];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [v5 identifier];
    uint64_t v9 = [v8 length];

    if (v10)
    {
      if (v9) {
        v10[2](v10, v5);
      }
    }
  }
}

- (void)performBlockIfNoteExists:(id)a3
{
  v10 = (void (**)(id, void *))a3;
  id v4 = [(ICCryptoStrategyBase *)self object];
  objc_opt_class();
  uint64_t v5 = ICCheckedDynamicCast();
  uint64_t v6 = [v5 managedObjectContext];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [v5 identifier];
    uint64_t v9 = [v8 length];

    if (v10)
    {
      if (v9) {
        v10[2](v10, v5);
      }
    }
  }
}

- (void)performBlockIfAttachmentExists:(id)a3
{
  v10 = (void (**)(id, void *))a3;
  id v4 = [(ICCryptoStrategyBase *)self object];
  objc_opt_class();
  uint64_t v5 = ICCheckedDynamicCast();
  uint64_t v6 = [v5 managedObjectContext];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [v5 identifier];
    uint64_t v9 = [v8 length];

    if (v10)
    {
      if (v9) {
        v10[2](v10, v5);
      }
    }
  }
}

- (void)performBlockIfPreviewImageExists:(id)a3
{
  v10 = (void (**)(id, void *))a3;
  id v4 = [(ICCryptoStrategyBase *)self object];
  objc_opt_class();
  uint64_t v5 = ICCheckedDynamicCast();
  uint64_t v6 = [v5 managedObjectContext];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [v5 identifier];
    uint64_t v9 = [v8 length];

    if (v10)
    {
      if (v9) {
        v10[2](v10, v5);
      }
    }
  }
}

- (void)performBlockIfMediaExists:(id)a3
{
  v10 = (void (**)(id, void *))a3;
  id v4 = [(ICCryptoStrategyBase *)self object];
  objc_opt_class();
  uint64_t v5 = ICCheckedDynamicCast();
  uint64_t v6 = [v5 managedObjectContext];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [v5 identifier];
    uint64_t v9 = [v8 length];

    if (v10)
    {
      if (v9) {
        v10[2](v10, v5);
      }
    }
  }
}

- (BOOL)canAuthenticate
{
  return 0;
}

- (BOOL)isAuthenticated
{
  return 0;
}

- (BOOL)hasPassphraseSet
{
  return 0;
}

- (NSString)passphraseHint
{
  return 0;
}

- (id)mainKeyForPassphrase:(id)a3
{
  return 0;
}

- (BOOL)isPassphraseCorrect:(id)a3
{
  return 0;
}

- (BOOL)authenticateWithPassphrase:(id)a3
{
  return 0;
}

- (ICEncryptionMetadata)primaryMetadata
{
  return 0;
}

- (ICEncryptionKey)primaryWrappedKey
{
  return 0;
}

- (ICEncryptionObject)primaryEncryptionObject
{
  return 0;
}

- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4
{
  return 0;
}

- (BOOL)rewrapDataAtURL:(id)a3 withMainKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke;
  v11[3] = &unk_1E64A5198;
  id v8 = v6;
  id v12 = v8;
  v13 = self;
  id v9 = v7;
  id v14 = v9;
  v15 = &v16;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v11];
  LOBYTE(self) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)self;
}

void __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(a1 + 32)];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) encryptedData:v4 rewrappedWithMainKey:*(void *)(a1 + 48)];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v12 = 0;
      char v8 = [v5 writeToURL:v7 options:1 error:&v12];
      id v9 = v12;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      if (*(unsigned char *)(v10 + 24))
      {
        *(unsigned char *)(v10 + 24) = 1;
      }
      else
      {
        v11 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_3();
        }
      }
    }
    else
    {
      id v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_2(v3);
      }
    }
  }
  else
  {
    id v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_1(v3);
    }
    id v6 = v9;
  }
}

- (BOOL)rewrapFile:(id)a3 withMainKey:(id)a4 generationManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke;
  v15[3] = &unk_1E64A7D38;
  id v11 = v8;
  id v18 = v11;
  v15[4] = self;
  id v12 = v9;
  id v16 = v12;
  id v13 = v10;
  id v17 = v13;
  char v19 = &v20;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v15];
  LOBYTE(self) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)self;
}

void __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
    if (!v5)
    {
      id v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_1(v3);
      }
      os_log_t v6 = v9;
      goto LABEL_28;
    }
    os_log_t v6 = [*(id *)(a1 + 32) encryptedData:v5 rewrappedWithMainKey:*(void *)(a1 + 40)];
    if (v6)
    {
      if ([*(id *)(a1 + 48) beginGeneration])
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        os_log_t v7 = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          id v11 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_4(v3);
          }
          id v9 = 0;
          goto LABEL_26;
        }
        id v12 = 0;
        char v8 = [v6 writeToURL:v7 options:1 error:&v12];
        id v9 = v12;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v8;
        id v10 = *(void **)(a1 + 48);
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          [v10 rollbackGeneration];
          id v11 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_3();
          }
          goto LABEL_26;
        }
        if (([v10 commitGeneration] & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
          id v11 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_6(v3);
          }
LABEL_26:
        }
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
      os_log_t v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_7(v3);
      }
    }
    else
    {
      os_log_t v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_2(v3);
      }
    }
    id v9 = v7;
    goto LABEL_27;
  }
  os_log_t v6 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_1(v3);
  }
  uint64_t v5 = v6;
LABEL_29:
}

- (BOOL)rewrapWithMainKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICCryptoStrategyBase rewrapWithMainKey:](self, v5);
  }

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E64A7D60;
  v15 = &v16;
  v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v13];
  os_log_t v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [(ICCryptoStrategyBase *)self object];
    id v11 = [v10 shortLoggingDescription];
    id v12 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v17 + 24)];
    *(_DWORD *)buf = 138413058;
    v21 = v11;
    __int16 v22 = 2112;
    __int16 v24 = 2080;
    char v23 = v12;
    v25 = "-[ICCryptoStrategyBase rewrapWithMainKey:]";
    __int16 v26 = 1024;
    int v27 = 324;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped object with main key {object: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isUnsupported])
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [v3 shortLoggingDescription];
      int v9 = 138412290;
      id v10 = v5;
      id v6 = "Not rewrapping object because it is unsupported {object: %@}";
LABEL_7:
      _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v9, 0xCu);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if ([v3 needsInitialFetchFromCloud])
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [v3 shortLoggingDescription];
      int v9 = 138412290;
      id v10 = v5;
      id v6 = "Not rewrapping object because it needs initial fetch {object: %@}";
      goto LABEL_7;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (([v3 mergeUnappliedEncryptedRecord] & 1) == 0)
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke_cold_2(v3);
    }
    goto LABEL_14;
  }
  id v4 = [v3 primaryEncryptedData];
  if (v4)
  {
    os_log_t v7 = [*(id *)(a1 + 32) encryptedData:v4 rewrappedWithMainKey:*(void *)(a1 + 40)];
    if (v7)
    {
      [v3 setPrimaryEncryptedData:v7];
      [v3 updateChangeCountWithReason:@"Rewrapped object"];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      BOOL v8 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke_cold_1(v3);
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_15:
}

- (BOOL)hasSameKeyAsObject:(id)a3
{
  return 0;
}

- (id)encryptData:(id)a3
{
  return 0;
}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_log_t v7 = (char *)a4;
  BOOL v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [(ICCryptoStrategyBase *)self object];
    v15 = [v14 shortLoggingDescription];
    *(_DWORD *)buf = 138413314;
    v32 = v15;
    __int16 v33 = 2112;
    id v34 = v6;
    __int16 v35 = 2112;
    __int16 v37 = 2080;
    v36 = v7;
    v38 = "-[ICCryptoStrategyBase encryptFileFromURL:toURL:]";
    __int16 v39 = 1024;
    int v40 = 343;
    _os_log_debug_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_DEBUG, "Encrypting file… {object: %@, sourceURL: %@, destinationURL: %@}%s:%d", buf, 0x30u);
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke;
  __int16 v22 = &unk_1E64A7D88;
  id v9 = v6;
  id v23 = v9;
  __int16 v24 = self;
  __int16 v26 = &v27;
  id v10 = v7;
  v25 = v10;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:&v19];
  uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [(ICCryptoStrategyBase *)self object];
    id v17 = [v16 shortLoggingDescription];
    uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v28 + 24)];
    *(_DWORD *)buf = 138413058;
    v32 = v17;
    __int16 v33 = 2112;
    __int16 v35 = 2080;
    id v34 = v18;
    v36 = "-[ICCryptoStrategyBase encryptFileFromURL:toURL:]";
    __int16 v37 = 1024;
    LODWORD(v38) = 371;
    _os_log_debug_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_DEBUG, "Encrypted file {object: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v12 = *((unsigned char *)v28 + 24) != 0;

  _Block_object_dispose(&v27, 8);
  return v12;
}

void __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = 0;
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    BOOL v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_1();
    }
    os_log_t v7 = v8;
    goto LABEL_12;
  }
  os_log_t v7 = [*(id *)(a1 + 40) encryptData:v5];
  if (!v7)
  {
    BOOL v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_2(v3);
    }
    goto LABEL_11;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) serialize:v7 toURL:*(void *)(a1 + 48)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    BOOL v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_3(v3);
    }
LABEL_11:

LABEL_12:
  }
}

- (id)encryptSidecarData:(id)a3
{
  return 0;
}

- (BOOL)encryptSidecarFileFromURL:(id)a3 toURL:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_log_t v7 = (char *)a4;
  BOOL v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [(ICCryptoStrategyBase *)self object];
    v15 = [v14 shortLoggingDescription];
    *(_DWORD *)buf = 138413314;
    v32 = v15;
    __int16 v33 = 2112;
    id v34 = v6;
    __int16 v35 = 2112;
    __int16 v37 = 2080;
    v36 = v7;
    v38 = "-[ICCryptoStrategyBase encryptSidecarFileFromURL:toURL:]";
    __int16 v39 = 1024;
    int v40 = 383;
    _os_log_debug_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_DEBUG, "Encrypting sidecar file… {object: %@, sourceURL: %@, destinationURL: %@}%s:%d", buf, 0x30u);
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke;
  __int16 v22 = &unk_1E64A7D88;
  id v9 = v6;
  id v23 = v9;
  __int16 v24 = self;
  __int16 v26 = &v27;
  id v10 = v7;
  v25 = v10;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:&v19];
  uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [(ICCryptoStrategyBase *)self object];
    id v17 = [v16 shortLoggingDescription];
    uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v28 + 24)];
    *(_DWORD *)buf = 138413058;
    v32 = v17;
    __int16 v33 = 2112;
    __int16 v35 = 2080;
    id v34 = v18;
    v36 = "-[ICCryptoStrategyBase encryptSidecarFileFromURL:toURL:]";
    __int16 v37 = 1024;
    LODWORD(v38) = 411;
    _os_log_debug_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_DEBUG, "Encrypted sidecar file {object: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v12 = *((unsigned char *)v28 + 24) != 0;

  _Block_object_dispose(&v27, 8);
  return v12;
}

void __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = 0;
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:&v14];
  id v6 = v14;
  if (!v5)
  {
    BOOL v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_1();
    }
    BOOL v8 = v12;
    goto LABEL_13;
  }
  os_log_t v7 = [*(id *)(a1 + 40) encryptSidecarData:v5];
  BOOL v8 = v7;
  if (!v7)
  {
    BOOL v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_2(v3);
    }
    goto LABEL_12;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  id v13 = v6;
  char v10 = [v7 writeToURL:v9 options:1 error:&v13];
  id v11 = v13;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    BOOL v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_3();
    }
    id v6 = v11;
LABEL_12:

LABEL_13:
    id v11 = v6;
  }
}

- (BOOL)serialize:(id)a3 toURL:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICCryptoStrategyBase serialize:toURL:](self);
  }

  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __40__ICCryptoStrategyBase_serialize_toURL___block_invoke;
  uint64_t v20 = &unk_1E64A7D88;
  id v9 = v7;
  id v21 = v9;
  id v10 = v6;
  id v23 = self;
  __int16 v24 = &v25;
  id v22 = v10;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:&v17];
  id v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [(ICCryptoStrategyBase *)self object];
    v15 = [v14 shortLoggingDescription];
    uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v26 + 24)];
    *(_DWORD *)buf = 138413058;
    char v30 = v15;
    __int16 v31 = 2112;
    __int16 v33 = 2080;
    v32 = v16;
    id v34 = "-[ICCryptoStrategyBase serialize:toURL:]";
    __int16 v35 = 1024;
    int v36 = 445;
    _os_log_debug_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_DEBUG, "Serialized encryption object {object: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v12 = *((unsigned char *)v26 + 24) != 0;

  _Block_object_dispose(&v25, 8);
  return v12;
}

void __40__ICCryptoStrategyBase_serialize_toURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [*(id *)(a1 + 32) path];
  char v6 = [v4 fileExistsAtPath:v5];

  id v7 = [*(id *)(a1 + 40) serialized];
  BOOL v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v15 = 0;
    char v10 = [v7 writeToURL:v9 options:1 error:&v15];
    id v11 = v15;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if ((v6 & 1) == 0)
      {
        BOOL v12 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_3(a1, v12);
        }

        [v3 resetToIntrinsicNotesVersionAndPropagateToChildObjects];
      }
    }
    else
    {
      id v14 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_1(v3);
    }

    id v11 = 0;
  }
}

- (BOOL)saveEncryptedJSON
{
  return 0;
}

- (BOOL)mainKeyDecryptsPrimaryData:(id)a3
{
  return 0;
}

- (id)decryptData:(id)a3
{
  return 0;
}

- (id)decryptedDataFromFileURL:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICCryptoStrategyBase decryptedDataFromFileURL:](self);
  }

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__45;
  id v21 = __Block_byref_object_dispose__45;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke;
  v13[3] = &unk_1E64A51C0;
  id v6 = v4;
  id v15 = self;
  uint64_t v16 = &v17;
  id v14 = v6;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v13];
  id v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    char v10 = [(ICCryptoStrategyBase *)self object];
    id v11 = [v10 shortLoggingDescription];
    BOOL v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v18[5] != 0];
    *(_DWORD *)buf = 138413058;
    __int16 v24 = v11;
    __int16 v25 = 2112;
    __int16 v27 = 2080;
    __int16 v26 = v12;
    char v28 = "-[ICCryptoStrategyBase decryptedDataFromFileURL:]";
    __int16 v29 = 1024;
    int v30 = 491;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Decrypted file {object: %@, success: %@}%s:%d", buf, 0x26u);
  }
  id v8 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = 0;
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:&v11];
  id v6 = v11;
  if (!v5)
  {
    char v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke_cold_1();
    }
    goto LABEL_7;
  }
  uint64_t v7 = [*(id *)(a1 + 40) decryptData:v5];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    char v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke_cold_2();
    }
LABEL_7:
  }
}

- (id)decryptSidecarData:(id)a3
{
  return 0;
}

- (id)decryptedSidecarDataFromFileURL:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICCryptoStrategyBase decryptedSidecarDataFromFileURL:](self);
  }

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__45;
  id v21 = __Block_byref_object_dispose__45;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke;
  v13[3] = &unk_1E64A51C0;
  id v6 = v4;
  id v15 = self;
  uint64_t v16 = &v17;
  id v14 = v6;
  [(ICCryptoStrategyBase *)self performBlockIfObjectExists:v13];
  uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    char v10 = [(ICCryptoStrategyBase *)self object];
    id v11 = [v10 shortLoggingDescription];
    BOOL v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v18[5] != 0];
    *(_DWORD *)buf = 138413058;
    __int16 v24 = v11;
    __int16 v25 = 2112;
    __int16 v27 = 2080;
    __int16 v26 = v12;
    char v28 = "-[ICCryptoStrategyBase decryptedSidecarDataFromFileURL:]";
    __int16 v29 = 1024;
    int v30 = 524;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Decrypted sidecar file {object: %@, success: %@}%s:%d", buf, 0x26u);
  }
  id v8 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = 0;
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:&v11];
  id v6 = v11;
  if (!v5)
  {
    char v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke_cold_1();
    }
    goto LABEL_7;
  }
  uint64_t v7 = [*(id *)(a1 + 40) decryptSidecarData:v5];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    char v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke_cold_2();
    }
LABEL_7:
  }
}

- (BOOL)loadDecryptedValuesIfNecessary
{
  return 0;
}

- (BOOL)isRecordAuthenticated:(id)a3
{
  return 0;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  return 0;
}

- (BOOL)recordHasChangedPassphrase:(id)a3
{
  return 0;
}

- (ICCloudSyncingObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  return (ICCloudSyncingObject *)WeakRetained;
}

- (void).cxx_destruct
{
}

void __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping data at URL because encrypted data is nil {object: %@}", v4, v5, v6, v7, v8);
}

void __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot rewrap data at URL {object: %@}", v4, v5, v6, v7, v8);
}

void __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot write rewrapped data {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping data at URL because URL is nil {object: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_4(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping data at URL because next URL is nil {object: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_6(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot commit generation to rewrap data at URL {object: %@}", v4, v5, v6, v7, v8);
}

void __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_7(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot begin generation to rewrap data at URL {object: %@}", v4, v5, v6, v7, v8);
}

- (void)rewrapWithMainKey:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 object];
  uint64_t v4 = [v3 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  __int16 v6 = 2080;
  uint64_t v7 = "-[ICCryptoStrategyBase rewrapWithMainKey:]";
  __int16 v8 = 1024;
  int v9 = 280;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Rewrapping object with main key… {object: %@}%s:%d", v5, 0x1Cu);
}

void __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping object because its data cannot be rewrapped {object: %@}", v4, v5, v6, v7, v8);
}

void __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping object because merging unapplied record failed {object: %@}", v4, v5, v6, v7, v8);
}

void __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot read file to encrypt — failing {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt file — failing {object: %@}", v4, v5, v6, v7, v8);
}

void __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot serialize encryption object to file — failing {object: %@}", v4, v5, v6, v7, v8);
}

void __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot read sidecar file to encrypt — failing {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt sidecar file — failing {object: %@}", v4, v5, v6, v7, v8);
}

void __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot write serialized sidecar encryption object — failing {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

- (void)serialize:(void *)a1 toURL:.cold.1(void *a1)
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_7_2(&dword_1C3A61000, v3, v4, "Serializing encryption object… {object: %@, destinationURL: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot serialize encryption object — failing {object: %@}", v4, v5, v6, v7, v8);
}

void __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot write serialized encryption object — failing {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 48) object];
  uint64_t v4 = [v3 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Resetting intrinsic Notes version for first encryption… {object: %@}", v5, 0xCu);
}

- (void)decryptedDataFromFileURL:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_7_2(&dword_1C3A61000, v3, v4, "Decrypting file… {object: %@, fileURL: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Cannot read file to decrypt — returning nil {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot decrypt file {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

- (void)decryptedSidecarDataFromFileURL:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_7_2(&dword_1C3A61000, v3, v4, "Decrypting sidecar file… {object: %@, fileURL: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Cannot read sidecar file to decrypt — returning nil {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot decrypt sidecar file {object: %@, error: %@}", v4, v5, v6, v7, v8);
}

@end