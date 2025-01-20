@interface ICAttachmentPreviewImageCryptoStrategyV2
- (BOOL)serializeToEncryptedMetadata:(id)a3;
- (BOOL)writeEncryptedImageData:(id)a3;
- (BOOL)writeEncryptedMetadata:(id)a3;
- (id)_decryptedImageData;
- (id)decryptedImageData;
- (id)decryptedMetadata;
@end

@implementation ICAttachmentPreviewImageCryptoStrategyV2

- (BOOL)writeEncryptedMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke;
  v7[3] = &unk_1E64A6DE8;
  id v5 = v4;
  id v8 = v5;
  v9 = self;
  v10 = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v7];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isUnsupported])
  {
    id v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_1(v3);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (([v3 isPasswordProtected] & 1) == 0)
  {
    id v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_3(v3);
    }
    goto LABEL_10;
  }
  id v5 = *(void **)(a1 + 40);
  if (!*(void *)(a1 + 32))
  {
    objc_msgSend(v5, "serializeToEncryptedMetadata:");
    goto LABEL_12;
  }
  id v4 = objc_msgSend(v5, "encryptData:");
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) serializeToEncryptedMetadata:v4];
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_2(v3);
    }
  }
LABEL_11:

LABEL_12:
}

- (BOOL)writeEncryptedImageData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke;
  v7[3] = &unk_1E64A6DE8;
  id v5 = v4;
  id v8 = v5;
  v9 = self;
  v10 = &v11;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v7];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![v3 isUnsupported])
  {
    if (([v3 isPasswordProtected] & 1) == 0)
    {
      id v4 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_5(v3);
      }
      goto LABEL_13;
    }
    id v5 = [v3 encryptedPreviewImageURL];
    v6 = os_log_create("com.apple.notes", "Crypto");
    v7 = v6;
    if (!v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_2(v3);
      }
      id v4 = v7;
      goto LABEL_22;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(v3, "ic_loggingIdentifier");
      uint64_t v10 = [*(id *)(a1 + 32) length];
      *(_DWORD *)buf = 138412802;
      char v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Encrypting V2 preview image (%@) with size (%lu) to: %@", buf, 0x20u);
    }
    id v4 = [*(id *)(a1 + 40) encryptData:*(void *)(a1 + 32)];
    if (v4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) serialize:v4 toURL:v5];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        id v8 = [v3 managedObjectContext];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_4;
        v11[3] = &unk_1E64A4240;
        v12 = v3;
        [v8 performBlockAndWait:v11];

        v7 = v12;
LABEL_22:

        goto LABEL_23;
      }
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_4(v3);
      }
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_3(v3);
      }
    }

    goto LABEL_22;
  }
  id v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_1(v3);
  }
LABEL_13:
  id v5 = v4;
LABEL_23:
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) resetToIntrinsicNotesVersionAndPropagateToChildObjects];
  id v3 = [*(id *)(a1 + 32) attachment];
  id v2 = (id)objc_msgSend(v3, "ic_postNotificationOnMainThreadAfterSaveWithName:", @"ICAttachmentPreviewImagesDidUpdateNotification");
}

- (id)decryptedMetadata
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__40;
  v9 = __Block_byref_object_dispose__40;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke;
  v4[3] = &unk_1E64A6E38;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isPasswordProtected] & 1) == 0)
  {
    id v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke_cold_2(v3);
    }
    goto LABEL_8;
  }
  id v4 = [v3 encryptedMetadata];

  if (!v4)
  {
    id v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v3 shortLoggingDescription];
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1C3A61000, v10, OS_LOG_TYPE_INFO, "No encrypted metadata for %@", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_8;
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v6 = [v3 encryptedMetadata];
  uint64_t v7 = [v5 decryptData:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke_cold_1(v3);
    }
LABEL_8:
  }
}

- (id)decryptedImageData
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__40;
  v9 = __Block_byref_object_dispose__40;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__ICAttachmentPreviewImageCryptoStrategyV2_decryptedImageData__block_invoke;
  v4[3] = &unk_1E64A6E60;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __62__ICAttachmentPreviewImageCryptoStrategyV2_decryptedImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectID];
  uint64_t v5 = +[ICNoteContext sharedContext];
  v6 = [v5 workerManagedObjectContext];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v3 managedObjectContext];
  }
  v9 = v8;

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__ICAttachmentPreviewImageCryptoStrategyV2_decryptedImageData__block_invoke_2;
  v14[3] = &unk_1E64A5820;
  id v15 = v3;
  id v16 = v4;
  uint64_t v10 = *(void *)(a1 + 32);
  id v17 = v9;
  uint64_t v18 = v10;
  id v11 = v9;
  id v12 = v4;
  id v13 = v3;
  [v11 performBlockAndWait:v14];
}

void __62__ICAttachmentPreviewImageCryptoStrategyV2_decryptedImageData__block_invoke_2(void *a1)
{
  objc_msgSend((id)objc_opt_class(), "ic_existingObjectWithID:context:", a1[5], a1[6]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    id v2 = [v7 cryptoStrategy];
    id v3 = ICCheckedDynamicCast();

    uint64_t v4 = [v3 _decryptedImageData];
    uint64_t v5 = *(void *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)_decryptedImageData
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__40;
  v9 = __Block_byref_object_dispose__40;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke;
  v4[3] = &unk_1E64A6E38;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isPasswordProtected] & 1) == 0)
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_3(v3);
    }
    uint64_t v4 = v8;
    goto LABEL_13;
  }
  uint64_t v4 = [v3 encryptedPreviewImageURL];
  if (!v4)
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_1(v3);
    }
    goto LABEL_12;
  }
  uint64_t v5 = [*(id *)(a1 + 32) decryptedDataFromFileURL:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) && objc_msgSend(v4, "ic_isReachable"))
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_2(v3);
    }
LABEL_12:

LABEL_13:
  }
}

- (BOOL)serializeToEncryptedMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__ICAttachmentPreviewImageCryptoStrategyV2_serializeToEncryptedMetadata___block_invoke;
  v7[3] = &unk_1E64A7BD0;
  id v5 = v4;
  id v8 = v5;
  v9 = &v10;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __73__ICAttachmentPreviewImageCryptoStrategyV2_serializeToEncryptedMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 willChangeValueForKey:@"metadata"];
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = [v4 serialized];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      [v3 setEncryptedMetadata:v5];
      uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [v3 shortLoggingDescription];
        int v11 = 138412290;
        uint64_t v12 = v8;
        _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, "Successfully encrypted data for %@", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_12;
    }
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __73__ICAttachmentPreviewImageCryptoStrategyV2_serializeToEncryptedMetadata___block_invoke_cold_1(v3);
    }
  }
  [v3 setEncryptedMetadata:0];
  uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v3 shortLoggingDescription];
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, "Setting nil to encrypted data for %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v6 = v7;
LABEL_12:

  [v3 setPrimitiveValue:0 forKey:@"metadata"];
  [v3 didChangeValueForKey:@"metadata"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "attachment preview image is not supported, but writeEncryptedMetadata is called. %@", v4, v5, v6, v7, v8);
}

void __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed to encrypt preview image: %@", v4, v5, v6, v7, v8);
}

void __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "attachment preview image is not password-protected, but writeEncryptedMetadata is called. %@", v4, v5, v6, v7, v8);
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Attachment preview image is not supported, but writeEncryptedImageData is called. %@", v4, v5, v6, v7, v8);
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_2(void *a1)
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "No encrypted preview image URL when encrypting %@", v4, v5, v6, v7, v8);
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_3(void *a1)
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed to encrypt data for %@", v4, v5, v6, v7, v8);
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_4(void *a1)
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error writing encrypted preview image for %@", v4, v5, v6, v7, v8);
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_5(void *a1)
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Attachment preview image is not password-protected, but writeEncryptedImageData is called. %@", v4, v5, v6, v7, v8);
}

void __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error decrypting metadata for %@", v4, v5, v6, v7, v8);
}

void __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "attachment preview image is not password-protected, but decryptedMetadata is called. %@", v4, v5, v6, v7, v8);
}

void __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "No encrypted preview image URL when decrypting %@", v4, v5, v6, v7, v8);
}

void __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot decrypt preview image for %@", v4, v5, v6, v7, v8);
}

void __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Trying to decrypt non-password-protected preview image %@", v4, v5, v6, v7, v8);
}

void __73__ICAttachmentPreviewImageCryptoStrategyV2_serializeToEncryptedMetadata___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed to encode encrypted object for %@", v4, v5, v6, v7, v8);
}

@end