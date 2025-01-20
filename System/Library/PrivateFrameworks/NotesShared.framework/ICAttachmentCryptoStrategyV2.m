@interface ICAttachmentCryptoStrategyV2
- (BOOL)writeEncryptedFallbackAssetData:(id)a3 fallbackAssetType:(int64_t)a4;
- (BOOL)writeEncryptedFallbackImageData:(id)a3;
- (BOOL)writeEncryptedFallbackPDFData:(id)a3;
- (id)decryptedFallbackAssetDataForFallbackAssetType:(int64_t)a3;
- (id)decryptedFallbackImageData;
- (id)decryptedFallbackPDFData;
@end

@implementation ICAttachmentCryptoStrategyV2

- (BOOL)writeEncryptedFallbackAssetData:(id)a3 fallbackAssetType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke;
  v9[3] = &unk_1E64A4440;
  v9[4] = self;
  int64_t v12 = a4;
  id v7 = v6;
  id v10 = v7;
  v11 = &v13;
  [(ICCryptoStrategyBase *)self performBlockIfAttachmentExists:v9];
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 isUnsupported])
  {
    if (([v3 isPasswordProtected] & 1) == 0)
    {
      v4 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_6(v3);
      }
      goto LABEL_13;
    }
    if (([*(id *)(a1 + 32) isAuthenticated] & 1) == 0)
    {
      v4 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_5(v3);
      }
      goto LABEL_13;
    }
    v5 = NSStringFromFallbackAssetType(*(void *)(a1 + 56));
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6 == 1)
    {
      uint64_t v7 = [v3 fallbackPDFEncryptedURL];
    }
    else
    {
      if (v6) {
        goto LABEL_21;
      }
      uint64_t v7 = [v3 fallbackImageEncryptedURL];
    }
    v4 = v7;
    if (v7)
    {
      v8 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_4();
      }

      os_log_t v9 = [*(id *)(a1 + 32) encryptData:*(void *)(a1 + 40)];
      if (v9)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) serialize:v9 toURL:v4];
      }
      else
      {
        id v10 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_3();
        }
      }
LABEL_27:

      goto LABEL_14;
    }
LABEL_21:
    os_log_t v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_2();
    }
    v4 = v9;
    goto LABEL_27;
  }
  v4 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_1(v3);
  }
LABEL_13:
  v5 = v4;
LABEL_14:
}

- (BOOL)writeEncryptedFallbackImageData:(id)a3
{
  return [(ICAttachmentCryptoStrategyV2 *)self writeEncryptedFallbackAssetData:a3 fallbackAssetType:0];
}

- (BOOL)writeEncryptedFallbackPDFData:(id)a3
{
  return [(ICAttachmentCryptoStrategyV2 *)self writeEncryptedFallbackAssetData:a3 fallbackAssetType:1];
}

- (id)decryptedFallbackAssetDataForFallbackAssetType:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  os_log_t v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke;
  v5[3] = &unk_1E64A4468;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(ICCryptoStrategyBase *)self performBlockIfAttachmentExists:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isPasswordProtected] & 1) == 0)
  {
    uint64_t v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_5(v3);
    }
    goto LABEL_10;
  }
  if (([*(id *)(a1 + 32) isAuthenticated] & 1) == 0)
  {
    uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_4(v3);
    }
LABEL_10:
    v4 = v7;
    goto LABEL_11;
  }
  v4 = NSStringFromFallbackAssetType(*(void *)(a1 + 48));
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5 == 1)
  {
    uint64_t v6 = [v3 fallbackPDFEncryptedURL];
  }
  else
  {
    if (v5)
    {
LABEL_19:
      int64_t v12 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_1();
      }
      uint64_t v7 = 0;
      goto LABEL_22;
    }
    uint64_t v6 = [v3 fallbackImageEncryptedURL];
  }
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_19;
  }
  uint64_t v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_3();
  }

  uint64_t v9 = [*(id *)(a1 + 32) decryptedDataFromFileURL:v7];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    int64_t v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_2();
    }
LABEL_22:
  }
LABEL_11:
}

- (id)decryptedFallbackImageData
{
  return [(ICAttachmentCryptoStrategyV2 *)self decryptedFallbackAssetDataForFallbackAssetType:0];
}

- (id)decryptedFallbackPDFData
{
  return [(ICAttachmentCryptoStrategyV2 *)self decryptedFallbackAssetDataForFallbackAssetType:1];
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "attachment is not supported, but writeEncryptedFallbackAssetData is called. %@", v4, v5, v6, v7, v8);
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "shortLoggingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "No URL when trying to write encrypted fallback %@ data for %@", v5, v6, v7, v8, v9);
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "shortLoggingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Encryption Failed on fallback %@ for %@", v5, v6, v7, v8, v9);
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "shortLoggingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Encrypting fallback %@ for %@", v5, v6, v7, v8, v9);
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_5(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not writing fallback asset because not authenticated for %@", v4, v5, v6, v7, v8);
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_6(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "attachment is not password-protected, but writeEncryptedFallbackAssetData is called. %@", v4, v5, v6, v7, v8);
}

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "shortLoggingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "No URL when loading unsupported attachment fallback %@ data for %@", v5, v6, v7, v8, v9);
}

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "shortLoggingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Cannot decrypt fallback %@ for %@", v5, v6, v7, v8, v9);
}

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "shortLoggingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Decrypting fallback %@ for %@", v5, v6, v7, v8, v9);
}

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_4(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not trying to decrypt fallback asset while not authenticated for %@", v4, v5, v6, v7, v8);
}

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_5(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "attachment is not password-protected, but decryptedFallbackAssetData is called. %@", v4, v5, v6, v7, v8);
}

@end