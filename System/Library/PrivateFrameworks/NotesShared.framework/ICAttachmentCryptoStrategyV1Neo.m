@interface ICAttachmentCryptoStrategyV1Neo
- (BOOL)rewrapWithMainKey:(id)a3;
- (BOOL)writeEncryptedFallbackImageData:(id)a3;
- (BOOL)writeEncryptedFallbackPDFData:(id)a3;
- (id)decryptedFallbackImageData;
- (id)decryptedFallbackPDFData;
- (void)decryptedFallbackImageData;
- (void)decryptedFallbackPDFData;
@end

@implementation ICAttachmentCryptoStrategyV1Neo

- (BOOL)rewrapWithMainKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentCryptoStrategyV1Neo rewrapWithMainKey:](self);
  }

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E64A97C8;
  v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  v15 = &v16;
  [(ICCryptoStrategyBase *)self performBlockIfAttachmentExists:v13];
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
    v25 = "-[ICAttachmentCryptoStrategyV1Neo rewrapWithMainKey:]";
    __int16 v26 = 1024;
    int v27 = 77;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped attachment with main key {attachment: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  [v4 removeTemporaryPaperBundle];
  if ([v4 hasFallbackImage])
  {
    v5 = [v4 fallbackImageGenerationManager];
    if (v5)
    {
      id v6 = *(void **)(a1 + 32);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_2;
      v39[3] = &unk_1E64A58B8;
      v2 = &v40;
      id v40 = v4;
      if ([v6 rewrapFile:v39 withMainKey:*(void *)(a1 + 40) generationManager:v5]) {
        goto LABEL_7;
      }
    }
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_4(v4);
    }

    if (v5) {
LABEL_7:
    }
  }
  if ([v4 hasFallbackPDF])
  {
    BOOL v8 = [v4 fallbackPDFGenerationManager];
    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_3;
      v37[3] = &unk_1E64A58B8;
      v2 = &v38;
      id v38 = v4;
      if ([v9 rewrapFile:v37 withMainKey:*(void *)(a1 + 40) generationManager:v8]) {
        goto LABEL_15;
      }
    }
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_3(v4);
    }

    if (v8) {
LABEL_15:
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  v36.receiver = *(id *)(a1 + 32);
  v36.super_class = (Class)ICAttachmentCryptoStrategyV1Neo;
  if ((objc_msgSendSuper2(&v36, sel_rewrapWithMainKey_, v11) & 1) == 0)
  {
    uint64_t v18 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_2(v4);
    }
    goto LABEL_36;
  }
  uint64_t v12 = [v4 media];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [v4 media];
    v15 = [v14 cryptoStrategy];
    char v16 = [v15 rewrapWithMainKey:*(void *)(a1 + 40)];

    if ((v16 & 1) == 0)
    {
      uint64_t v18 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1(v4);
      }
LABEL_36:

      goto LABEL_37;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v17 = [v4 previewImages];
  uint64_t v18 = [v17 copy];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    v31 = v4;
    uint64_t v22 = *(void *)v33;
    *(void *)&long long v20 = 138412546;
    long long v30 = v20;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v18);
        }
        __int16 v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v25 = objc_msgSend(v24, "cryptoStrategy", v30);
        char v26 = [v25 rewrapWithMainKey:*(void *)(a1 + 40)];

        if ((v26 & 1) == 0)
        {
          int v27 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = [v31 shortLoggingDescription];
            v29 = [v24 shortLoggingDescription];
            *(_DWORD *)buf = v30;
            v42 = v28;
            __int16 v43 = 2112;
            v44 = v29;
            _os_log_error_impl(&dword_1C3A61000, v27, OS_LOG_TYPE_ERROR, "Cannot rewrap attachment preview image {attachment: %@, previewImage: %@}", buf, 0x16u);
          }
        }
      }
      uint64_t v21 = [v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v21);
    id v4 = v31;
  }
LABEL_37:
}

uint64_t __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fallbackImageEncryptedURL];
}

uint64_t __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) fallbackPDFEncryptedURL];
}

- (BOOL)writeEncryptedFallbackImageData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentCryptoStrategyV1Neo writeEncryptedFallbackImageData:](self);
  }

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke;
  v13[3] = &unk_1E64A97C8;
  v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  v15 = &v16;
  [(ICCryptoStrategyBase *)self performBlockIfAttachmentExists:v13];
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = [(ICCryptoStrategyBase *)self object];
    uint64_t v11 = [v10 shortLoggingDescription];
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v17 + 24)];
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    __int16 v24 = 2080;
    v23 = v12;
    v25 = "-[ICAttachmentCryptoStrategyV1Neo writeEncryptedFallbackImageData:]";
    __int16 v26 = 1024;
    int v27 = 110;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Encrypted fallback image data {attachment: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fallbackImageEncryptedURL];
  if (v4)
  {
    v5 = [v3 note];
    id v6 = [v5 account];

    if (v6)
    {
      v7 = [*(id *)(a1 + 32) encryptData:*(void *)(a1 + 40)];
      if (v7)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) serialize:v7 toURL:v4];
      }
      else
      {
        BOOL v8 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_3(v3);
        }
      }
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_2(v3);
      }
    }
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_1(v3);
    }
    id v6 = v7;
  }
}

- (BOOL)writeEncryptedFallbackPDFData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentCryptoStrategyV1Neo writeEncryptedFallbackPDFData:](self);
  }

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke;
  v13[3] = &unk_1E64A97C8;
  v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  v15 = &v16;
  [(ICCryptoStrategyBase *)self performBlockIfAttachmentExists:v13];
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = [(ICCryptoStrategyBase *)self object];
    uint64_t v11 = [v10 shortLoggingDescription];
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v17 + 24)];
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    __int16 v24 = 2080;
    v23 = v12;
    v25 = "-[ICAttachmentCryptoStrategyV1Neo writeEncryptedFallbackPDFData:]";
    __int16 v26 = 1024;
    int v27 = 141;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Encrypted fallback PDF data {attachment: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fallbackPDFEncryptedURL];
  if (v4)
  {
    v5 = [v3 note];
    id v6 = [v5 account];

    if (v6)
    {
      v7 = [*(id *)(a1 + 32) encryptData:*(void *)(a1 + 40)];
      if (v7)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) serialize:v7 toURL:v4];
      }
      else
      {
        BOOL v8 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_3(v3);
        }
      }
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_2(v3);
      }
    }
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_1(v3);
    }
    id v6 = v7;
  }
}

- (id)decryptedFallbackImageData
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentCryptoStrategyV1Neo decryptedFallbackImageData](self);
  }

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__62;
  v15 = __Block_byref_object_dispose__62;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke;
  v10[3] = &unk_1E64A9A10;
  v10[4] = self;
  v10[5] = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfAttachmentExists:v10];
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = [(ICCryptoStrategyBase *)self object];
    BOOL v8 = [v7 shortLoggingDescription];
    v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v12[5] != 0];
    *(_DWORD *)buf = 138413058;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v21 = 2080;
    long long v20 = v9;
    __int16 v22 = "-[ICAttachmentCryptoStrategyV1Neo decryptedFallbackImageData]";
    __int16 v23 = 1024;
    int v24 = 166;
    _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "Decrypted fallback image data {attachment: %@, success: %@}%s:%d", buf, 0x26u);
  }
  id v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fallbackImageEncryptedURL];
  if (!v4)
  {
    BOOL v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke_cold_1(v3);
    }
    goto LABEL_7;
  }
  uint64_t v5 = [*(id *)(a1 + 32) decryptedDataFromFileURL:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    BOOL v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke_cold_2(v3);
    }
LABEL_7:
  }
}

- (id)decryptedFallbackPDFData
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentCryptoStrategyV1Neo decryptedFallbackPDFData](self);
  }

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__62;
  v15 = __Block_byref_object_dispose__62;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke;
  v10[3] = &unk_1E64A9A10;
  v10[4] = self;
  v10[5] = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfAttachmentExists:v10];
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = [(ICCryptoStrategyBase *)self object];
    BOOL v8 = [v7 shortLoggingDescription];
    v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v12[5] != 0];
    *(_DWORD *)buf = 138413058;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v21 = 2080;
    long long v20 = v9;
    __int16 v22 = "-[ICAttachmentCryptoStrategyV1Neo decryptedFallbackPDFData]";
    __int16 v23 = 1024;
    int v24 = 189;
    _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "Decrypted fallback PDF data {attachment: %@, success: %@}%s:%d", buf, 0x26u);
  }
  id v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fallbackPDFEncryptedURL];
  if (!v4)
  {
    BOOL v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke_cold_1(v3);
    }
    goto LABEL_7;
  }
  uint64_t v5 = [*(id *)(a1 + 32) decryptedDataFromFileURL:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    BOOL v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke_cold_2(v3);
    }
LABEL_7:
  }
}

- (void)rewrapWithMainKey:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 object];
  v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Rewrapping attachment with main key… {attachment: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot rewrap attachment fallback PDF {attachment: %@}", v4, v5, v6, v7, v8);
}

void __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_4(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot rewrap attachment fallback image {attachment: %@}", v4, v5, v6, v7, v8);
}

- (void)writeEncryptedFallbackImageData:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Encrypting fallback image data… {attachment: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt fallback image data because fallback URL is nil {attachment: %@}", v4, v5, v6, v7, v8);
}

void __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt fallback image data because attachment doesn't have account {attachment: %@}", v4, v5, v6, v7, v8);
}

void __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt fallback image data {attachment: %@}", v4, v5, v6, v7, v8);
}

- (void)writeEncryptedFallbackPDFData:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Encrypting fallback PDF data… {attachment: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt fallback PDF data because fallback URL is nil {attachment: %@}", v4, v5, v6, v7, v8);
}

void __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt fallback PDF data because attachment doesn't have account {attachment: %@}", v4, v5, v6, v7, v8);
}

void __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt fallback PDF data {attachment: %@}", v4, v5, v6, v7, v8);
}

- (void)decryptedFallbackImageData
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Decrypting fallback image data… {attachment: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt fallback image data because attachment doesn't have fallback image URL {attachment: %@}", v4, v5, v6, v7, v8);
}

void __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt fallback image data {attachment: %@}", v4, v5, v6, v7, v8);
}

- (void)decryptedFallbackPDFData
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Decrypting fallback PDF data… {attachment: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt fallback PDF data because attachment doesn't have fallback PDF URL {attachment: %@}", v4, v5, v6, v7, v8);
}

void __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt fallback PDF data {attachment: %@}", v4, v5, v6, v7, v8);
}

@end