@interface ICAttachmentPreviewImageCryptoStrategyV1Neo
- (BOOL)writeEncryptedImageData:(id)a3;
- (BOOL)writeEncryptedMetadata:(id)a3;
- (id)decryptedImageData;
- (id)decryptedMetadata;
- (void)decryptedImageData;
- (void)decryptedMetadata;
- (void)serializeEncryptedMetadata:(id)a3;
@end

@implementation ICAttachmentPreviewImageCryptoStrategyV1Neo

- (BOOL)writeEncryptedMetadata:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentPreviewImageCryptoStrategyV1Neo writeEncryptedMetadata:](self);
  }

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedMetadata___block_invoke;
  v13[3] = &unk_1E64A6DE8;
  id v6 = v4;
  id v14 = v6;
  v15 = self;
  v16 = &v17;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v13];
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
    v26 = "-[ICAttachmentPreviewImageCryptoStrategyV1Neo writeEncryptedMetadata:]";
    __int16 v27 = 1024;
    int v28 = 43;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Encrypted preview image metadata {previewImage: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __70__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (!*(void *)(a1 + 32))
  {
    objc_msgSend(v4, "serializeEncryptedMetadata:");
    goto LABEL_5;
  }
  uint64_t v5 = objc_msgSend(v4, "encryptData:");
  if (v5)
  {
    id v6 = (void *)v5;
    [*(id *)(a1 + 40) serializeEncryptedMetadata:v5];

LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_9;
  }
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __70__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedMetadata___block_invoke_cold_1(v3);
  }

LABEL_9:
}

- (BOOL)writeEncryptedImageData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentPreviewImageCryptoStrategyV1Neo writeEncryptedImageData:](self);
  }

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke;
  v13[3] = &unk_1E64A6DE8;
  void v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  v15 = &v16;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v13];
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
    __int16 v23 = v12;
    __int16 v25 = "-[ICAttachmentPreviewImageCryptoStrategyV1Neo writeEncryptedImageData:]";
    __int16 v26 = 1024;
    int v27 = 77;
    _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Encrypted preview image data {previewImage: %@, success: %@}%s:%d", buf, 0x26u);
  }
  BOOL v8 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 encryptedPreviewImageURL];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) encryptData:*(void *)(a1 + 40)];
    if (v5)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) serialize:v5 toURL:v4];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        id v6 = [v3 managedObjectContext];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_3;
        v8[3] = &unk_1E64A4240;
        v9 = v3;
        [v6 performBlockAndWait:v8];

        v7 = v9;
        goto LABEL_13;
      }
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_3(v3);
      }
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_2(v3);
      }
    }

    goto LABEL_13;
  }
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_1(v3);
  }
  uint64_t v5 = v7;
LABEL_13:
}

void __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) resetToIntrinsicNotesVersionAndPropagateToChildObjects];
  id v3 = [*(id *)(a1 + 32) attachment];
  id v2 = (id)objc_msgSend(v3, "ic_postNotificationOnMainThreadAfterSaveWithName:", @"ICAttachmentPreviewImagesDidUpdateNotification");
}

- (void)serializeEncryptedMetadata:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__ICAttachmentPreviewImageCryptoStrategyV1Neo_serializeEncryptedMetadata___block_invoke;
  v6[3] = &unk_1E64A6E10;
  id v7 = v4;
  id v5 = v4;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v6];
}

void __74__ICAttachmentPreviewImageCryptoStrategyV1Neo_serializeEncryptedMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = NSStringFromSelector(sel_metadata);
  [v3 willChangeValueForKey:v4];

  uint64_t v5 = [*(id *)(a1 + 32) serialized];
  id v6 = (void *)v5;
  if (*(void *)(a1 + 32) && !v5)
  {
    id v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__ICAttachmentPreviewImageCryptoStrategyV1Neo_serializeEncryptedMetadata___block_invoke_cold_1(v3);
    }

    [v3 setEncryptedMetadata:0];
LABEL_9:
    BOOL v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [v3 shortLoggingDescription];
      int v13 = 138412290;
      id v14 = v9;
      v10 = "Set nil preview image metadata {object: %@}";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  [v3 setEncryptedMetadata:v5];
  if (!v6) {
    goto LABEL_9;
  }
  BOOL v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v3 shortLoggingDescription];
    int v13 = 138412290;
    id v14 = v9;
    v10 = "Set non-nil preview image metadata {object: %@}";
LABEL_11:
    _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 0xCu);
  }
LABEL_12:

  v11 = NSStringFromSelector(sel_metadata);
  [v3 setPrimitiveValue:0 forKey:v11];

  v12 = NSStringFromSelector(sel_metadata);
  [v3 didChangeValueForKey:v12];
}

- (id)decryptedMetadata
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentPreviewImageCryptoStrategyV1Neo decryptedMetadata](self);
  }

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__30;
  uint64_t v15 = __Block_byref_object_dispose__30;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedMetadata__block_invoke;
  v10[3] = &unk_1E64A6E38;
  v10[4] = self;
  v10[5] = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v10];
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [(ICCryptoStrategyBase *)self object];
    BOOL v8 = [v7 shortLoggingDescription];
    v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v12[5] != 0];
    *(_DWORD *)buf = 138413058;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v21 = 2080;
    char v20 = v9;
    __int16 v22 = "-[ICAttachmentPreviewImageCryptoStrategyV1Neo decryptedMetadata]";
    __int16 v23 = 1024;
    int v24 = 125;
    _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "Decrypted preview image metadata {previewImage: %@, success: %@}%s:%d", buf, 0x26u);
  }
  id v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __64__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 encryptedMetadata];
  if (!v4)
  {
    BOOL v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [v3 shortLoggingDescription];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_INFO, "Cannot decrypt preview image metadata because it is nil {previewImage: %@}", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_7;
  }
  uint64_t v5 = [*(id *)(a1 + 32) decryptData:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    BOOL v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __64__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedMetadata__block_invoke_cold_1(v3);
    }
LABEL_7:
  }
}

- (id)decryptedImageData
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICAttachmentPreviewImageCryptoStrategyV1Neo decryptedImageData](self);
  }

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__30;
  uint64_t v15 = __Block_byref_object_dispose__30;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke;
  v10[3] = &unk_1E64A6E60;
  v10[4] = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v10];
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [(ICCryptoStrategyBase *)self object];
    BOOL v8 = [v7 shortLoggingDescription];
    v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v12[5] != 0];
    *(_DWORD *)buf = 138413058;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v21 = 2080;
    char v20 = v9;
    __int16 v22 = "-[ICAttachmentPreviewImageCryptoStrategyV1Neo decryptedImageData]";
    __int16 v23 = 1024;
    int v24 = 161;
    _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "Decrypted preview image data {previewImage: %@, success: %@}%s:%d", buf, 0x26u);
  }
  id v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[ICNoteContext sharedContext];
  id v5 = [v4 workerManagedObjectContext];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 managedObjectContext];
  }
  BOOL v8 = v7;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2;
  v11[3] = &unk_1E64A5958;
  id v12 = v3;
  id v13 = v8;
  uint64_t v14 = *(void *)(a1 + 32);
  id v9 = v8;
  id v10 = v3;
  [v9 performBlockAndWait:v11];
}

void __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2(uint64_t a1)
{
  id v2 = objc_opt_class();
  id v3 = [*(id *)(a1 + 32) objectID];
  id v4 = objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, *(void *)(a1 + 40));

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) encryptedPreviewImageURL];
    if (!v5)
    {
      uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_2(v4);
      }
      os_log_t v7 = v11;
      goto LABEL_14;
    }
    objc_opt_class();
    uint64_t v6 = [v4 cryptoStrategy];
    ICCheckedDynamicCast();
    os_log_t v7 = (os_log_t)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = [v7 decryptedDataFromFileURL:v5];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
      && objc_msgSend(v5, "ic_isReachable"))
    {
      uint64_t v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_3(v4);
      }

LABEL_14:
    }
  }
  else
  {
    os_log_t v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_1();
    }
    id v5 = v7;
  }
}

- (void)writeEncryptedMetadata:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 object];
  id v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Encrypting preview image metadata… {previewImage: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __70__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedMetadata___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt preview image metadata {previewImage: %@}", v4, v5, v6, v7, v8);
}

- (void)writeEncryptedImageData:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Encrypting preview image data… {previewImage: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt preview image data because URL is nil {previewImage: %@}", v4, v5, v6, v7, v8);
}

void __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot encrypt preview image data {previewImage: %@}", v4, v5, v6, v7, v8);
}

void __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot serialize preview image data {previewImage: %@}", v4, v5, v6, v7, v8);
}

void __74__ICAttachmentPreviewImageCryptoStrategyV1Neo_serializeEncryptedMetadata___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot serialize preview image metadata encryption object {previewImage: %@}", v4, v5, v6, v7, v8);
}

- (void)decryptedMetadata
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Decrypting preview image metadata… {previewImage: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __64__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedMetadata__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt preview image metadata {previewImage: %@}", v4, v5, v6, v7, v8);
}

- (void)decryptedImageData
{
  v1 = [a1 object];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1C3A61000, v3, v4, "Decrypting preview image data… {previewImage: %@}%s:%d", v5, v6, v7, v8, v9);
}

void __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_1()
{
  v0 = [0 objectID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v1, v2, "Cannot encrypt preview image data because object vanished {previewImageID: %@}", v3, v4, v5, v6, v7);
}

void __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_2(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt preview image data because URL is nil {previewImage: %@}", v4, v5, v6, v7, v8);
}

void __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_3(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt preview image for %@", v4, v5, v6, v7, v8);
}

@end