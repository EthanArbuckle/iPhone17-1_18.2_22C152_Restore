@interface ICMediaCryptoStrategyV1
- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4;
- (id)decryptedData;
- (id)fileURLEncryptionCryptoInitialzationVector;
- (id)fileURLEncryptionCryptoTag;
@end

@implementation ICMediaCryptoStrategyV1

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__ICMediaCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke;
  v11[3] = &unk_1E64A9130;
  v14 = &v15;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  [(ICCryptoStrategyBase *)self performBlockIfMediaExists:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __52__ICMediaCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ICMediaCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke_2;
  v8[3] = &unk_1E64A9108;
  id v9 = v3;
  id v7 = v3;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v4 encryptFileFromURL:v5 toURL:v6 setTagAndIVHandler:v8];
}

void __52__ICMediaCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setAssetCryptoTag:a2];
  [*(id *)(a1 + 32) setAssetCryptoInitializationVector:v6];
}

- (id)decryptedData
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__52;
  id v9 = __Block_byref_object_dispose__52;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke;
  v4[3] = &unk_1E64A5CF8;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfMediaExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__52;
  v46 = __Block_byref_object_dispose__52;
  id v47 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__52;
  v36 = __Block_byref_object_dispose__52;
  id v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v4 = [v3 managedObjectContext];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_2;
  v21 = &unk_1E64A9158;
  v24 = &v42;
  id v5 = v3;
  v25 = &v38;
  v26 = &v32;
  v27 = &v28;
  uint64_t v6 = *(void *)(a1 + 32);
  id v22 = v5;
  uint64_t v23 = v6;
  [v4 performBlockAndWait:&v18];

  if (*((unsigned char *)v39 + 24))
  {
    BOOL v7 = *((unsigned char *)v29 + 24) == 0;
    id v8 = os_log_create("com.apple.notes", "Crypto");
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9)
      {
        objc_opt_class();
        __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_1();
      }
    }
    else
    {
      if (v9)
      {
        objc_opt_class();
        __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_3();
      }

      uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "decryptedDataFromFileURL:", v33[5], v18, v19, v20, v21);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      BOOL v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == 0;
      v14 = os_log_create("com.apple.notes", "Crypto");
      id v8 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_opt_class();
          __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_2();
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = v43[5];
        *(_DWORD *)buf = 138412546;
        v49 = v15;
        __int16 v50 = 2112;
        uint64_t v51 = v16;
        id v17 = v15;
        _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_INFO, "Decrypted %@ %@", buf, 0x16u);
      }
    }
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
}

void __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) isPasswordProtected];
  uint64_t v5 = [*(id *)(a1 + 32) encryptedMediaURL];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 40) isAuthenticated];
  }
}

- (id)fileURLEncryptionCryptoTag
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__52;
  BOOL v9 = __Block_byref_object_dispose__52;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__ICMediaCryptoStrategyV1_fileURLEncryptionCryptoTag__block_invoke;
  v4[3] = &unk_1E64A9180;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfMediaExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __53__ICMediaCryptoStrategyV1_fileURLEncryptionCryptoTag__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 assetCryptoTag];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)fileURLEncryptionCryptoInitialzationVector
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__52;
  BOOL v9 = __Block_byref_object_dispose__52;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__ICMediaCryptoStrategyV1_fileURLEncryptionCryptoInitialzationVector__block_invoke;
  v4[3] = &unk_1E64A9180;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfMediaExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __69__ICMediaCryptoStrategyV1_fileURLEncryptionCryptoInitialzationVector__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 assetCryptoInitializationVector];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_8();
  id v3 = OUTLINED_FUNCTION_0_12(v0, v1, v2, 5.778e-34);
  OUTLINED_FUNCTION_2_7(&dword_1C3A61000, v4, v5, "Trying to access decrypted data while not authenticated for %@ (%@)");
}

void __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_8();
  id v5 = OUTLINED_FUNCTION_0_12(v2, v3, v4, 5.778e-34);
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Failed to decrypt %@ %@", v1, 0x16u);
}

void __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_8();
  id v3 = OUTLINED_FUNCTION_0_12(v0, v1, v2, 5.778e-34);
  OUTLINED_FUNCTION_2_7(&dword_1C3A61000, v4, v5, "Decrypting %@ %@");
}

@end