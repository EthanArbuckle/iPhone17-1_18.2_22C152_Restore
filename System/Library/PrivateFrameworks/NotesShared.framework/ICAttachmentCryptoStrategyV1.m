@interface ICAttachmentCryptoStrategyV1
- (BOOL)rewrapWithMainKey:(id)a3;
- (BOOL)writeEncryptedFallbackAssetData:(id)a3 fallbackAssetType:(int64_t)a4;
- (BOOL)writeEncryptedFallbackImageData:(id)a3;
- (BOOL)writeEncryptedFallbackPDFData:(id)a3;
- (id)decryptedFallbackAssetDataForFallbackAssetType:(int64_t)a3;
- (id)decryptedFallbackImageData;
- (id)decryptedFallbackPDFData;
@end

@implementation ICAttachmentCryptoStrategyV1

- (BOOL)rewrapWithMainKey:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentCryptoStrategyV1 rewrapWithMainKey:](self, v5);
  }

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E64A97C8;
  id v6 = v4;
  id v14 = v6;
  v15 = self;
  v16 = &v17;
  [(ICCryptoStrategyBase *)self performBlockIfAttachmentExists:v13];
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
    v26 = "-[ICAttachmentCryptoStrategyV1 rewrapWithMainKey:]";
    __int16 v27 = 1024;
    int v28 = 54;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped attachment with main key {attachment: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 removeTemporaryPaperBundle];
  uint64_t v4 = *(void *)(a1 + 32);
  v29.receiver = *(id *)(a1 + 40);
  v29.super_class = (Class)ICAttachmentCryptoStrategyV1;
  if ((objc_msgSendSuper2(&v29, sel_rewrapWithMainKey_, v4) & 1) == 0)
  {
    v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_2(v3);
    }
    goto LABEL_20;
  }
  uint64_t v5 = [v3 media];
  if (v5)
  {
    id v6 = (void *)v5;
    v7 = [v3 media];
    BOOL v8 = [v7 cryptoStrategy];
    char v9 = [v8 rewrapWithMainKey:*(void *)(a1 + 32)];

    if ((v9 & 1) == 0)
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1(v3);
      }
LABEL_20:

      goto LABEL_21;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v10 = [v3 previewImages];
  v11 = [v10 copy];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    v24 = v3;
    uint64_t v15 = *(void *)v26;
    *(void *)&long long v13 = 138412546;
    long long v23 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "cryptoStrategy", v23);
        char v19 = [v18 rewrapWithMainKey:*(void *)(a1 + 32)];

        if ((v19 & 1) == 0)
        {
          char v20 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = [v24 shortLoggingDescription];
            v22 = [v17 shortLoggingDescription];
            *(_DWORD *)buf = v23;
            v31 = v21;
            __int16 v32 = 2112;
            v33 = v22;
            _os_log_error_impl(&dword_1C3A61000, v20, OS_LOG_TYPE_ERROR, "Cannot rewrap preview image {attachment: %@, previewImage: %@}", buf, 0x16u);
          }
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v14);
    id v3 = v24;
  }
LABEL_21:
}

- (BOOL)writeEncryptedFallbackAssetData:(id)a3 fallbackAssetType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke;
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

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPasswordProtected])
  {
    if ([*(id *)(a1 + 32) isAuthenticated])
    {
      uint64_t v4 = NSStringFromFallbackAssetType(*(void *)(a1 + 56));
      uint64_t v5 = *(void *)(a1 + 56);
      if (v5 == 1)
      {
        uint64_t v6 = [v3 fallbackPDFEncryptedURL];
      }
      else
      {
        if (v5) {
          goto LABEL_16;
        }
        uint64_t v6 = [v3 fallbackImageEncryptedURL];
      }
      BOOL v8 = (void *)v6;
      if (v6)
      {
        char v9 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_4();
        }

        id v10 = objc_opt_class();
        uint64_t v11 = *(void *)(a1 + 40);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_4;
        v22[3] = &unk_1E64A4218;
        long long v23 = v4;
        id v24 = v3;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6;
        v16[3] = &unk_1E64A97F0;
        id v17 = v8;
        v18 = v23;
        id v12 = v24;
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 56);
        id v19 = v12;
        uint64_t v20 = v13;
        uint64_t v21 = v14;
        id v7 = v8;
        [v10 encryptWithMainKeyOfObject:v12 dataToEncrypt:v11 failureHandler:v22 successHandler:v16];

        os_log_t v15 = v23;
LABEL_19:

        goto LABEL_20;
      }
LABEL_16:
      os_log_t v15 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_2();
      }
      id v7 = v15;
      goto LABEL_19;
    }
    id v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_3(v3);
    }
  }
  else
  {
    id v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_4(v3);
    }
  }
  uint64_t v4 = v7;
LABEL_20:
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_4(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_4_cold_1(a1);
  }
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = 0;
  char v10 = [a2 writeToURL:v9 options:1 error:&v15];
  id v11 = v15;
  id v12 = os_log_create("com.apple.notes", "Crypto");
  uint64_t v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6_cold_1(a1);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v14 = *(void *)(a1 + 64);
    if (v14 == 1)
    {
      [*(id *)(a1 + 48) setFallbackPDFCryptoTag:v7];
      [*(id *)(a1 + 48) setFallbackPDFCryptoInitializationVector:v8];
    }
    else if (!v14)
    {
      [*(id *)(a1 + 48) setFallbackImageCryptoTag:v7];
      [*(id *)(a1 + 48) setFallbackImageCryptoInitializationVector:v8];
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6_cold_2(a1, (uint64_t)v11, v13);
    }
  }
}

- (id)decryptedFallbackAssetDataForFallbackAssetType:(int64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__58;
  char v10 = __Block_byref_object_dispose__58;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke;
  v5[3] = &unk_1E64A4468;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(ICCryptoStrategyBase *)self performBlockIfAttachmentExists:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPasswordProtected])
  {
    if ([*(id *)(a1 + 32) isAuthenticated])
    {
      uint64_t v4 = NSStringFromFallbackAssetType(*(void *)(a1 + 48));
      uint64_t v5 = *(void *)(a1 + 48);
      if (v5 == 1)
      {
        uint64_t v6 = [v3 fallbackPDFEncryptedURL];
        id v7 = [v3 fallbackPDFCryptoTag];
        uint64_t v8 = [v3 fallbackPDFCryptoInitializationVector];
      }
      else
      {
        if (v5)
        {
          id v7 = 0;
          uint64_t v9 = 0;
          goto LABEL_19;
        }
        uint64_t v6 = [v3 fallbackImageEncryptedURL];
        id v7 = [v3 fallbackImageCryptoTag];
        uint64_t v8 = [v3 fallbackImageCryptoInitializationVector];
      }
      uint64_t v9 = (void *)v8;
      if (v6)
      {
        char v10 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_4(v3);
        }

        id v11 = [ICEncryptedData alloc];
        id v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6];
        os_log_t v13 = [(ICEncryptedData *)v11 initWithData:v12 tag:v7 initializationVector:v9];

        uint64_t v14 = [(id)objc_opt_class() decryptWithMainKeyOfObject:v3 encryptedData:v13 fallbackAttemptSuccessCleanupHandler:0];
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
        char v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        v18 = os_log_create("com.apple.notes", "Crypto");
        id v19 = v18;
        if (v17)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_3();
          }
        }
        else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_2();
        }

LABEL_25:
        goto LABEL_26;
      }
LABEL_19:
      os_log_t v13 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_1();
      }
      uint64_t v6 = v13;
      goto LABEL_25;
    }
    id v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_5(v3);
    }
  }
  else
  {
    id v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_6(v3);
    }
  }
  uint64_t v4 = v7;
LABEL_26:
}

- (BOOL)writeEncryptedFallbackImageData:(id)a3
{
  return [(ICAttachmentCryptoStrategyV1 *)self writeEncryptedFallbackAssetData:a3 fallbackAssetType:0];
}

- (BOOL)writeEncryptedFallbackPDFData:(id)a3
{
  return [(ICAttachmentCryptoStrategyV1 *)self writeEncryptedFallbackAssetData:a3 fallbackAssetType:1];
}

- (id)decryptedFallbackImageData
{
  return [(ICAttachmentCryptoStrategyV1 *)self decryptedFallbackAssetDataForFallbackAssetType:0];
}

- (id)decryptedFallbackPDFData
{
  return [(ICAttachmentCryptoStrategyV1 *)self decryptedFallbackAssetDataForFallbackAssetType:1];
}

- (void)rewrapWithMainKey:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 object];
  uint64_t v4 = [v3 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  __int16 v6 = 2080;
  id v7 = "-[ICAttachmentCryptoStrategyV1 rewrapWithMainKey:]";
  __int16 v8 = 1024;
  int v9 = 25;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Rewrapping attachment with main key… {attachment: %@}%s:%d", v5, 0x1Cu);
}

void __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping preview images because media couldn't be rewrapped {attachment: %@}", v4, v5, v6, v7, v8);
}

void __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Not rewrapping media and preview images because attachment couldn't be rewrapped {attachment: %@}", v4, v5, v6, v7, v8);
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not writing fallback asset because not authenticated for %@", v4, v5, v6, v7, v8);
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_4(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "attachment is not password-protected, but writeEncryptedFallbackAssetData is called. %@", v4, v5, v6, v7, v8);
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_4_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) shortLoggingDescription];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Encryption Failed on fallback %@ for %@", v4, v5, v6, v7, 2u);
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 48) shortLoggingDescription];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Wrote encrypted fallback %@ for %@", v4, v5, v6, v7, 2u);
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 48) shortLoggingDescription];
  int v8 = 138412802;
  uint64_t v9 = v5;
  OUTLINED_FUNCTION_6();
  __int16 v10 = v7;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_ERROR, "Error writing encrypted fallback %@ for %@: %@", (uint8_t *)&v8, 0x20u);
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "ic_loggingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Failed to decrypt fallback %@ for %@", v5, v6, v7, v8, v9);
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "shortLoggingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Decrypted fallback %@ for %@", v5, v6, v7, v8, v9);
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_4(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Decrypting fallback image for %@", v4, v5, v6, v7, v8);
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_5(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not trying to decrypt fallback asset while not authenticated for %@", v4, v5, v6, v7, v8);
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_6(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "attachment is not password-protected, but decryptedFallbackAssetDataForPDF is called. %@", v4, v5, v6, v7, v8);
}

@end