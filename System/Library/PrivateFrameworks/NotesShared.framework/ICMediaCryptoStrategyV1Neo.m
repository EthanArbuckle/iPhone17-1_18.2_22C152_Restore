@interface ICMediaCryptoStrategyV1Neo
- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4;
- (BOOL)rewrapWithMainKey:(id)a3;
- (id)decryptedData;
- (void)decryptedData;
@end

@implementation ICMediaCryptoStrategyV1Neo

- (BOOL)rewrapWithMainKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICMediaCryptoStrategyV1Neo rewrapWithMainKey:](self);
  }

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E64A58E0;
  v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  v15 = &v16;
  [(ICCryptoStrategyBase *)self performBlockIfMediaExists:v13];
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = [(ICCryptoStrategyBase *)self object];
    v11 = [v10 shortLoggingDescription];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v17 + 24)];
    *(_DWORD *)buf = 138413058;
    v21 = v11;
    __int16 v22 = 2112;
    __int16 v24 = 2080;
    v23 = v12;
    v25 = "-[ICMediaCryptoStrategyV1Neo rewrapWithMainKey:]";
    __int16 v26 = 1024;
    int v27 = 52;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped media with main key {note: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v5 = [v4 encryptedMediaURL];
  if (v5)
  {
    id v6 = [v4 generationManager];
    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_2;
      v13[3] = &unk_1E64A58B8;
      id v8 = v4;
      id v14 = v8;
      if ([v7 rewrapFile:v13 withMainKey:*(void *)(a1 + 40) generationManager:v6])
      {

        uint64_t v9 = *(void *)(a1 + 40);
        v12.receiver = *(id *)(a1 + 32);
        v12.super_class = (Class)ICMediaCryptoStrategyV1Neo;
        if (objc_msgSendSuper2(&v12, sel_rewrapWithMainKey_, v9))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        }
        else
        {
          v11 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_3(v8);
          }
        }
        goto LABEL_18;
      }
      v2 = &v14;
    }
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_2(v4);
    }

    if (v6) {
  }
    }
  else
  {
    id v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_1(v4);
    }
  }
LABEL_18:
}

uint64_t __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) encryptedMediaURL];
}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICMediaCryptoStrategyV1Neo;
  BOOL v5 = [(ICCryptoStrategyBase *)&v7 encryptFileFromURL:a3 toURL:a4];
  [(ICCryptoStrategyBase *)self performBlockIfMediaExists:&__block_literal_global_17];
  return v5;
}

uint64_t __55__ICMediaCryptoStrategyV1Neo_encryptFileFromURL_toURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applyRandomCryptoGooIfNeeded];
}

- (id)decryptedData
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICMediaCryptoStrategyV1Neo decryptedData](self);
  }

  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__ICMediaCryptoStrategyV1Neo_decryptedData__block_invoke;
  v10[3] = &unk_1E64A5928;
  v10[4] = self;
  v10[5] = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfMediaExists:v10];
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_super v7 = [(ICCryptoStrategyBase *)self object];
    id v8 = [v7 shortLoggingDescription];
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v12[5] != 0];
    *(_DWORD *)buf = 138413058;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v21 = 2080;
    v20 = v9;
    __int16 v22 = "-[ICMediaCryptoStrategyV1Neo decryptedData]";
    __int16 v23 = 1024;
    int v24 = 88;
    _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "Decrypted data {media: %@, success: %@}%s:%d", buf, 0x26u);
  }
  id v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __43__ICMediaCryptoStrategyV1Neo_decryptedData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 encryptedMediaURL];
  if (!v4)
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v3 shortLoggingDescription];
      int v11 = 138412290;
      objc_super v12 = v9;
      v10 = "Cannot decrypt media because encrypted media URL is nil {media: %@}";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v5 = [*(id *)(a1 + 32) decryptedDataFromFileURL:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v3 shortLoggingDescription];
      int v11 = 138412290;
      objc_super v12 = v9;
      v10 = "Cannot decrypt media {media: %@}";
LABEL_7:
      _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)rewrapWithMainKey:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 object];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Rewrapping media with main key… {note: %@}%s:%d", v5, v6, v7, v8, 2u);
}

void __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping media because encrypted media URL is nil {media: %@}", v4, v5, v6, v7, 2u);
}

void __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping media's encrypted values because couldn't rewrap media data {media: %@}", v4, v5, v6, v7, 2u);
}

void __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot rewrap media's encrypted values {media: %@}", v4, v5, v6, v7, 2u);
}

- (void)decryptedData
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Decrypting data… {media: %@}%s:%d", v5, v6, v7, v8, 2u);
}

@end