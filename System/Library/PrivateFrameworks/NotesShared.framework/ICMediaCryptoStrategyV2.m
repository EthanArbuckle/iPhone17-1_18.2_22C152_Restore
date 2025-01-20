@interface ICMediaCryptoStrategyV2
- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4;
- (id)decryptedData;
@end

@implementation ICMediaCryptoStrategyV2

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICMediaCryptoStrategyV2;
  BOOL v5 = [(ICCloudSyncingObjectCryptoStrategyV2 *)&v7 encryptFileFromURL:a3 toURL:a4];
  [(ICCryptoStrategyBase *)self performBlockIfMediaExists:&__block_literal_global_20];
  return v5;
}

uint64_t __52__ICMediaCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applyRandomCryptoGooIfNeeded];
}

- (id)decryptedData
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__15;
  v9 = __Block_byref_object_dispose__15;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke;
  v4[3] = &unk_1E64A5CF8;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfMediaExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPasswordProtected])
  {
    if (([*(id *)(a1 + 32) isAuthenticated] & 1) == 0)
    {
      uint64_t v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_4(v3);
      }
      goto LABEL_13;
    }
    v4 = [v3 encryptedMediaURL];

    uint64_t v5 = os_log_create("com.apple.notes", "Crypto");
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (!v4)
    {
      if (v6) {
        __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_1(v3);
      }
      goto LABEL_13;
    }
    if (v6) {
      __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_3(v3);
    }

    uint64_t v7 = *(void **)(a1 + 32);
    v8 = [v3 encryptedMediaURL];
    uint64_t v9 = [v7 decryptedDataFromFileURL:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_2(v3, v5);
      }
LABEL_13:
    }
  }
}

void __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Trying to decrypt a media that doesn have encrypted media url: %@", v4, v5, v6, v7, v8);
}

void __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Failed to decrypt %@", v4, 0xCu);
}

void __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Decrypting %@", v4, v5, v6, v7, v8);
}

void __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_4(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Trying to access decrypted data while not authenticated for %@", v4, v5, v6, v7, v8);
}

@end