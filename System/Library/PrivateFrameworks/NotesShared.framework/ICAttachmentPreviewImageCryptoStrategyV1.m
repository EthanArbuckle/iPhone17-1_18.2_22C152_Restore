@interface ICAttachmentPreviewImageCryptoStrategyV1
- (BOOL)writeEncryptedImageData:(id)a3;
- (BOOL)writeEncryptedMetadata:(id)a3;
- (id)_decryptedImageData;
- (id)decryptedImageData;
- (id)decryptedMetadata;
@end

@implementation ICAttachmentPreviewImageCryptoStrategyV1

- (BOOL)writeEncryptedMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke;
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

void __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPasswordProtected])
  {
    [v3 willChangeValueForKey:@"metadata"];
    if (*(void *)(a1 + 32))
    {
      id v4 = objc_opt_class();
      uint64_t v5 = *(void *)(a1 + 32);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_3;
      v12[3] = &unk_1E64A4240;
      id v13 = v3;
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      v9 = __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_6;
      v10 = &unk_1E64A7BF8;
      id v11 = v13;
      [v4 encryptWithMainKeyOfObject:v11 dataToEncrypt:v5 failureHandler:v12 successHandler:&v7];
    }
    else
    {
      [v3 setEncryptedMetadata:0];
      [v3 setCryptoMetadataInitializationVector:0];
      [v3 setCryptoMetadataTag:0];
    }
    objc_msgSend(v3, "setPrimitiveValue:forKey:", 0, @"metadata", v7, v8, v9, v10);
    [v3 didChangeValueForKey:@"metadata"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_3(v3);
    }
  }
}

void __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_3(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_3_cold_1(a1);
  }
}

void __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  [v7 setEncryptedMetadata:a2];
  [*(id *)(a1 + 32) setCryptoMetadataInitializationVector:v8];

  [*(id *)(a1 + 32) setCryptoMetadataTag:v9];
}

- (BOOL)writeEncryptedImageData:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke;
  v7[3] = &unk_1E64A6DE8;
  void v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isUnsupported])
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_1(v3);
    }
LABEL_11:
    id v5 = v4;
    goto LABEL_12;
  }
  if (([v3 isPasswordProtected] & 1) == 0)
  {
    id v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_5(v3);
    }
    goto LABEL_11;
  }
  id v5 = [v3 encryptedPreviewImageURL];
  v6 = os_log_create("com.apple.notes", "Crypto");
  id v4 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_cold_3(v3, (uint64_t)v5, v4);
    }

    uint64_t v7 = objc_opt_class();
    uint64_t v8 = *(void *)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_9;
    v15[3] = &unk_1E64A4240;
    v16 = v3;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_10;
    v11[3] = &unk_1E64A7C20;
    id v5 = v5;
    id v12 = v5;
    id v9 = v16;
    uint64_t v10 = *(void *)(a1 + 48);
    char v13 = v9;
    uint64_t v14 = v10;
    [v7 encryptWithMainKeyOfObject:v9 dataToEncrypt:v8 failureHandler:v15 successHandler:v11];

    id v4 = v16;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_2(v3);
    }
  }
LABEL_12:
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_9(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_9_cold_1(a1);
  }
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v21 = 0;
  char v10 = [a2 writeToURL:v9 options:1 error:&v21];
  id v11 = v21;
  if (v10)
  {
    id v12 = [*(id *)(a1 + 40) managedObjectContext];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_11;
    v16[3] = &unk_1E64A5820;
    v17 = *(id *)(a1 + 40);
    id v18 = v7;
    id v13 = v8;
    uint64_t v14 = *(void *)(a1 + 48);
    id v19 = v13;
    uint64_t v20 = v14;
    [v12 performBlockAndWait:v16];

    v15 = v17;
  }
  else
  {
    v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_10_cold_1(a1);
    }
  }
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) setCryptoTag:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCryptoInitializationVector:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 32) attachment];
  id v3 = (id)objc_msgSend(v2, "ic_postNotificationOnMainThreadAfterSaveWithName:", @"ICAttachmentPreviewImagesDidUpdateNotification");

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

- (id)decryptedMetadata
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__41;
  uint64_t v9 = __Block_byref_object_dispose__41;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke;
  v4[3] = &unk_1E64A7BD0;
  v4[4] = self;
  v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isPasswordProtected] & 1) == 0)
  {
    id v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke_cold_2(v3, v10);
    }
    uint64_t v9 = (ICEncryptedData *)v10;
    goto LABEL_8;
  }
  id v4 = [v3 encryptedMetadata];

  if (v4)
  {
    uint64_t v5 = [ICEncryptedData alloc];
    v6 = [v3 encryptedMetadata];
    uint64_t v7 = [v3 cryptoMetadataTag];
    id v8 = [v3 cryptoMetadataInitializationVector];
    uint64_t v9 = [(ICEncryptedData *)v5 initWithData:v6 tag:v7 initializationVector:v8];

    id v10 = [(id)objc_opt_class() decryptWithMainKeyOfObject:v3 encryptedData:v9 fallbackAttemptSuccessCleanupHandler:0];
    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v10);
    }
    else
    {
      id v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke_cold_1(v3);
      }
    }
LABEL_8:
  }
}

- (id)decryptedImageData
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__41;
  uint64_t v9 = __Block_byref_object_dispose__41;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__ICAttachmentPreviewImageCryptoStrategyV1_decryptedImageData__block_invoke;
  v4[3] = &unk_1E64A6E60;
  v4[4] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __62__ICAttachmentPreviewImageCryptoStrategyV1_decryptedImageData__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v9 = v8;

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__ICAttachmentPreviewImageCryptoStrategyV1_decryptedImageData__block_invoke_2;
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

void __62__ICAttachmentPreviewImageCryptoStrategyV1_decryptedImageData__block_invoke_2(void *a1)
{
  objc_msgSend((id)objc_opt_class(), "ic_existingObjectWithID:context:", a1[5], a1[6]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    id v2 = [v7 cryptoStrategy];
    id v3 = ICDynamicCast();
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
  id v8 = __Block_byref_object_copy__41;
  uint64_t v9 = __Block_byref_object_dispose__41;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke;
  v4[3] = &unk_1E64A6E38;
  v4[4] = self;
  void v4[5] = &v5;
  [(ICCryptoStrategyBase *)self performBlockIfPreviewImageExists:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__41;
  v29 = __Block_byref_object_dispose__41;
  id v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__41;
  v19[4] = __Block_byref_object_dispose__41;
  id v20 = 0;
  uint64_t v4 = [v3 managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_2;
  v14[3] = &unk_1E64A7C48;
  id v16 = v19;
  id v5 = v3;
  id v15 = v5;
  id v17 = &v21;
  uint64_t v18 = &v25;
  [v4 performBlockAndWait:v14];

  if (*((unsigned char *)v22 + 24))
  {
    uint64_t v6 = v26[5];
    if (v6)
    {
      id v13 = 0;
      uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:0 error:&v13];
      id v8 = v13;
      uint64_t v9 = os_log_create("com.apple.notes", "Crypto");
      id v10 = v9;
      if (!v7 || v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_3();
        }
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_4();
        }

        uint64_t v11 = [*(id *)(a1 + 32) decryptData:v7];
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        id v10 = *(NSObject **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
      }
    }
    else
    {
      id v8 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_1();
    }
  }

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) isPasswordProtected];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v5 = [*(id *)(a1 + 32) encryptedPreviewImageURL];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = v2;
  uint64_t v5 = [v3 identifier];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v6, v7, "Could not encrypt metadata for %@ (%@)", v8, v9, v10, v11, v12);
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Encrypting V1 preview image %@ to: %@", v5, 0x16u);
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_9_cold_1(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Error encrypting preview image: %@", v4, v5, v6, v7, v8);
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_10_cold_1(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingIdentifier");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error writing encrypted preview image (%@): %@", v4, v5, v6, v7, v8);
}

void __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke_cold_1(void *a1)
{
  id v2 = (id)objc_opt_class();
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "Error decrypting metadata for %@ (%@)", v6, v7, v8, v9, v10);
}

void __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "attachment preview image is not password-protected, but decryptedMetadata is called. %@", v4, 0xCu);
}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Trying to decrypt non-password-protected preview image %@", v2, v3, v4, v5, v6);
}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "No encrypted preview image URL when decrypting %@", v2, v3, v4, v5, v6);
}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1C3A61000, v1, OS_LOG_TYPE_ERROR, "Error loading encrypted preview image for %@: %@", v2, 0x16u);
}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Decrypting preview image %@", v2, v3, v4, v5, v6);
}

@end