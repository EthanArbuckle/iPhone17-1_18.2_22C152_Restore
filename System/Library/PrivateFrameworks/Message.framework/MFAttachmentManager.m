@interface MFAttachmentManager
+ (OS_os_log)log;
+ (id)allManagers;
+ (id)defaultManager;
+ (id)supportedDocumentUTIs;
- (BOOL)_setupAttachment:(id)a3 withMimeBody:(id)a4 error:(id *)a5;
- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4;
- (EDAttachmentPersistenceManager)persistenceManager;
- (MFAttachmentManager)init;
- (id)_contentIDForAttachment:(id)a3;
- (id)_createSynapseAttributesForAttachment:(id)a3;
- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4;
- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 request:(id)a5 syncLock:(id *)a6;
- (id)_filePathForAttachment:(id)a3;
- (id)attachmentForCID:(id)a3;
- (id)attachmentForContentID:(id)a3;
- (id)attachmentForContentID:(id)a3 preferredSchemes:(id)a4;
- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7;
- (id)attachmentForItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7;
- (id)attachmentForTextAttachment:(id)a3 error:(id *)a4;
- (id)attachmentForURL:(id)a3 error:(id *)a4;
- (id)attachmentForURL:(id)a3 withMimeBody:(id)a4 error:(id *)a5;
- (id)attachmentsForContext:(id)a3;
- (id)attachmentsForURLs:(id)a3 error:(id *)a4;
- (id)fetchDataForAttachment:(id)a3;
- (id)imageScalingQueue;
- (id)metadataForAttachment:(id)a3 forKey:(id)a4;
- (id)prepareAttachmentForDisplay:(id)a3 fileURL:(id)a4;
- (void)_cancelFetchForAttachment:(id)a3;
- (void)_fetchCompletedForAttachment:(id)a3 error:(id)a4;
- (void)addProvider:(id)a3 forBaseURL:(id)a4;
- (void)clearMetadataForAttachment:(id)a3;
- (void)fetchDataSynchronouslyForAttachment:(id)a3;
- (void)insertMessageAttachmentMetadataToPersistence:(id)a3 forMessage:(id)a4;
- (void)removeProvider:(id)a3;
- (void)removeProviderForBaseURL:(id)a3;
- (void)setContentID:(id)a3 forAttachment:(id)a4;
- (void)setMetadataForAttachment:(id)a3 toValue:(id)a4 forKey:(id)a5;
- (void)setPersistenceManager:(id)a3;
@end

@implementation MFAttachmentManager

+ (id)defaultManager
{
  v2 = [a1 allManagers];
  v3 = [v2 allObjects];
  v4 = [v3 firstObject];

  return v4;
}

+ (id)allManagers
{
  if (allManagers_onceToken != -1) {
    dispatch_once(&allManagers_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)allManagers_sAllManagers;
  return v2;
}

- (void)setMetadataForAttachment:(id)a3 toValue:(id)a4 forKey:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v19 url];

  if (v10)
  {
    [(NSLock *)self->_metaDataLock lock];
    metadata = self->_metadata;
    if (!metadata)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v13 = self->_metadata;
      self->_metadata = v12;

      metadata = self->_metadata;
    }
    v14 = [v19 url];
    v15 = [(NSMutableDictionary *)metadata objectForKeyedSubscript:v14];

    if (!v15)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v17 = self->_metadata;
      v18 = [v19 url];
      [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];

      v15 = v16;
    }
    [v15 setObject:v8 forKeyedSubscript:v9];
    [(NSLock *)self->_metaDataLock unlock];
  }
}

- (id)metadataForAttachment:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSLock *)self->_metaDataLock lock];
  metadata = self->_metadata;
  id v9 = [v6 url];
  v10 = [(NSMutableDictionary *)metadata objectForKeyedSubscript:v9];
  v11 = [v10 objectForKeyedSubscript:v7];

  [(NSLock *)self->_metaDataLock unlock];
  return v11;
}

- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(v5, "mf_partNumbers");
  if ([v6 count])
  {
    uint64_t v7 = [v5 URLByDeletingLastPathComponent];
    uint64_t v8 = [v6 count];
    if (v8 == -1)
    {
LABEL_8:
      if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"MFMessageErrorDomain" code:1030 userInfo:&unk_1EFF51578];
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      v10 = (void *)v7;
    }
    else
    {
      uint64_t v9 = v8 + 1;
      v10 = (void *)v7;
      while (1)
      {
        v11 = [v10 absoluteString];
        if ([v11 hasSuffix:@"/"])
        {
          uint64_t v12 = objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 1);

          v11 = (void *)v12;
        }
        os_unfair_lock_lock(&self->_providersLock);
        v13 = [(NSMutableDictionary *)self->_providers objectForKeyedSubscript:v11];
        os_unfair_lock_unlock(&self->_providersLock);
        if (v13) {
          break;
        }
        uint64_t v7 = [v10 URLByDeletingLastPathComponent];

        v10 = (void *)v7;
        if (!--v9) {
          goto LABEL_8;
        }
      }
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"MFMessageErrorDomain" code:1030 userInfo:&unk_1EFF51550];
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_setupAttachment:(id)a3 withMimeBody:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 url];
  char v11 = objc_msgSend(v10, "mf_isValidAttachmentURL");

  if ((v11 & 1) == 0)
  {
    if (a5)
    {
      +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Invalid attachment URL." title:@"Invalid Attachment URL" userInfo:0];
      BOOL v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = 0;
    }
    goto LABEL_27;
  }
  uint64_t v12 = [v8 url];
  v13 = [(MFAttachmentManager *)self _dataProviderForAttachmentURL:v12 error:a5];

  BOOL v14 = v13 != 0;
  if (v13)
  {
    if (v9
      || ([v13 messageForAttachment:v8],
          v15 = objc_claimAutoreleasedReturnValue(),
          [v15 messageBody],
          id v9 = (id)objc_claimAutoreleasedReturnValue(),
          v15,
          v9))
    {
      id v16 = [v8 url];
      v17 = objc_msgSend(v16, "mf_lastPartNumber");
      v18 = [v9 partWithNumber:v17];

      [v8 setPart:v18];
      id v19 = [v8 fileName];

      if (v19)
      {
        if (!v18) {
          goto LABEL_20;
        }
LABEL_12:
        v22 = NSString;
        v23 = [v18 type];
        v24 = [v18 subtype];
        v25 = [v22 stringWithFormat:@"%@/%@", v23, v24];
        [v8 setMimeType:v25];

        objc_msgSend(v8, "setEncodedFileSize:", objc_msgSend(v18, "approximateRawSize"));
        v26 = [v18 disposition];
        [v8 setDisposition:v26];

        v27 = [v18 bodyParameterForKey:@"x-mac-preserve-fidelity"];
        v45 = v27;
        if (v27) {
          objc_msgSend(v8, "setShouldPreserveFidelity:", objc_msgSend(v27, "caseInsensitiveCompare:", @"yes") == 0);
        }
        v28 = [v18 dispositionParameterForKey:@"remote-image"];
        if (v28) {
          [v8 setRemoteImageFileName:v28];
        }
        v29 = [v8 url];
        v30 = [v29 scheme];
        int v31 = [v30 isEqualToString:@"x-attach-maildrop-image"];

        if (v31)
        {
          v32 = [v8 remoteImageFileName];
          [v8 setFileName:v32];

          v33 = [MEMORY[0x1E4F28CB8] defaultManager];
          v34 = [v8 path];
          v35 = [v33 attributesOfItemAtPath:v34 error:0];

          objc_msgSend(v8, "setEncodedFileSize:", objc_msgSend(v35, "fileSize"));
        }

        goto LABEL_20;
      }
      v20 = [v18 attachmentFilename];
      v21 = objc_msgSend(v20, "ef_sanitizedFileName");
      [v8 setFileName:v21];

      if (v18) {
        goto LABEL_12;
      }
    }
    else
    {
      v18 = 0;
    }
LABEL_20:
    v36 = [(MFAttachmentManager *)self metadataForAttachment:v8 forKey:@"MFAttachmentContentIDKey"];
    if (!v36)
    {
      v36 = [v18 contentID];
      if (!v36)
      {
        v36 = [v18 bodyParameterForKey:*MEMORY[0x1E4F73430]];
        if (!v36)
        {
          v36 = objc_msgSend(NSString, "mf_messageIDStringWithDomainHint:", 0);
        }
      }
      [(MFAttachmentManager *)self setContentID:v36 forAttachment:v8];
    }
  }
LABEL_27:
  v37 = [v8 mimePartNumber];
  v38 = v37;
  if (v37)
  {
    id v39 = v37;
  }
  else
  {
    v40 = [v8 part];
    id v39 = [v40 partNumber];
  }
  v41 = EDAttachmentsLog();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = objc_msgSend(v8, "ef_publicDescription");
    v43 = [v8 fileName];
    *(_DWORD *)buf = 138543874;
    v47 = v42;
    __int16 v48 = 2112;
    v49 = v43;
    __int16 v50 = 2114;
    id v51 = v39;
    _os_log_impl(&dword_1A7EFF000, v41, OS_LOG_TYPE_DEFAULT, "Setup attachment %{public}@, name = %@, part number = %{public}@", buf, 0x20u);
  }
  return v14;
}

- (id)attachmentForURL:(id)a3 withMimeBody:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = [[MFAttachment alloc] initWithURL:v8 attachmentManager:self];
    if (![(MFAttachmentManager *)self _setupAttachment:v10 withMimeBody:v9 error:a5])
    {
      char v11 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v10 = 0;
  }
  v10 = v10;
  char v11 = v10;
LABEL_6:

  return v11;
}

- (id)_contentIDForAttachment:(id)a3
{
  v3 = [(MFAttachmentManager *)self metadataForAttachment:a3 forKey:@"MFAttachmentContentIDKey"];
  return v3;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__MFAttachmentManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1) {
    dispatch_once(&log_onceToken_10, block);
  }
  v2 = (void *)log_log_10;
  return (OS_os_log *)v2;
}

void __26__MFAttachmentManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;
}

void __34__MFAttachmentManager_allManagers__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F735A0]);
  os_log_t v1 = (void *)allManagers_sAllManagers;
  allManagers_sAllManagers = (uint64_t)v0;
}

- (MFAttachmentManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)MFAttachmentManager;
  v2 = [(MFAttachmentManager *)&v14 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attachments = v2->_attachments;
    v2->_attachments = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mail.attachmentManagerAttachmentArray", 0);
    arrayAccessQueue = v2->_arrayAccessQueue;
    v2->_arrayAccessQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    metaDataLock = v2->_metaDataLock;
    v2->_metaDataLock = v7;

    id v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.message.attachmentManager.imagescaling", v9);
    imageScalingQueue = v2->_imageScalingQueue;
    v2->_imageScalingQueue = (OS_dispatch_queue *)v10;

    v2->_providersLock._os_unfair_lock_opaque = 0;
    uint64_t v12 = [(id)objc_opt_class() allManagers];
    [v12 addObject:v2];
  }
  return v2;
}

+ (id)supportedDocumentUTIs
{
  if (supportedDocumentUTIs_onceToken != -1) {
    dispatch_once(&supportedDocumentUTIs_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)sSupportedUTIs;
  return v2;
}

void __44__MFAttachmentManager_supportedDocumentUTIs__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  id v0 = [(id)*MEMORY[0x1E4F44370] identifier];
  v4[0] = v0;
  os_log_t v1 = [(id)*MEMORY[0x1E4F44408] identifier];
  v4[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  id v3 = (void *)sSupportedUTIs;
  sSupportedUTIs = v2;
}

- (void)addProvider:(id)a3 forBaseURL:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_providersLock);
  if (!self->_providers)
  {
    uint64_t v7 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    providers = self->_providers;
    self->_providers = v7;
  }
  os_unfair_lock_unlock(&self->_providersLock);
  id v9 = [v6 absoluteString];
  if ([v9 hasSuffix:@"/"])
  {
    uint64_t v10 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 1);

    id v9 = (void *)v10;
  }
  os_unfair_lock_lock(&self->_providersLock);
  [(NSMutableDictionary *)self->_providers setObject:v11 forKeyedSubscript:v9];
  os_unfair_lock_unlock(&self->_providersLock);
}

- (void)removeProviderForBaseURL:(id)a3
{
  id v5 = [a3 absoluteString];
  if ([v5 hasSuffix:@"/"])
  {
    uint64_t v4 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);

    id v5 = (id)v4;
  }
  os_unfair_lock_lock(&self->_providersLock);
  if (v5) {
    [(NSMutableDictionary *)self->_providers setObject:0 forKeyedSubscript:v5];
  }
  os_unfair_lock_unlock(&self->_providersLock);
}

- (void)removeProvider:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_providersLock);
  uint64_t v4 = [(NSMutableDictionary *)self->_providers allKeysForObject:v7];
  id v5 = [v4 firstObject];

  os_unfair_lock_unlock(&self->_providersLock);
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    [(MFAttachmentManager *)self removeProviderForBaseURL:v6];
  }
}

- (id)imageScalingQueue
{
  return self->_imageScalingQueue;
}

- (EDAttachmentPersistenceManager)persistenceManager
{
  persistenceManager = self->_persistenceManager;
  if (!persistenceManager)
  {
    uint64_t v4 = +[MFMailMessageLibrary defaultInstance];
    id v5 = [v4 persistence];
    id v6 = [v5 attachmentPersistenceManager];
    id v7 = self->_persistenceManager;
    self->_persistenceManager = v6;

    persistenceManager = self->_persistenceManager;
  }
  return persistenceManager;
}

- (id)_filePathForAttachment:(id)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 url];
  id v6 = [(MFAttachmentManager *)self _dataProviderForAttachmentURL:v5 error:0];

  if (v6)
  {
    id v7 = [v6 messageForAttachment:v4];
    id v8 = [v4 url];
    id v9 = [(MFAttachmentManager *)self _dataProviderForAttachmentURL:v8 error:0];

    uint64_t v10 = [v9 storageLocationForAttachment:v4 withMessage:v7];
  }
  else
  {
    id v11 = EDAttachmentsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v4 url];
      [(MFAttachmentManager *)v12 _filePathForAttachment:v11];
    }

    uint64_t v10 = 0;
  }

  return v10;
}

- (id)attachmentForURL:(id)a3 error:(id *)a4
{
  id v4 = [(MFAttachmentManager *)self attachmentForURL:a3 withMimeBody:0 error:a4];
  return v4;
}

- (id)attachmentsForURLs:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = -[MFAttachmentManager attachmentForURL:error:](self, "attachmentForURL:error:", *(void *)(*((void *)&v14 + 1) + 8 * i), a4, (void)v14);
        if (!v12)
        {

          id v7 = 0;
          goto LABEL_11;
        }
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)attachmentForTextAttachment:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 mimePart];
  id v8 = [v7 partURL];

  uint64_t v9 = [v6 mimePart];
  uint64_t v10 = [v9 mimeBody];

  id v11 = [(MFAttachmentManager *)self attachmentForURL:v8 withMimeBody:v10 error:a4];

  return v11;
}

- (id)attachmentForCID:(id)a3
{
  id v4 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  [v4 setQuery:0];
  id v5 = [v4 path];
  id v6 = [(MFAttachmentManager *)self attachmentForContentID:v5 preferredSchemes:0];

  return v6;
}

- (id)attachmentForContentID:(id)a3
{
  id v3 = [(MFAttachmentManager *)self attachmentForContentID:a3 preferredSchemes:0];
  return v3;
}

- (id)attachmentForContentID:(id)a3 preferredSchemes:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSLock *)self->_metaDataLock lock];
    metadata = self->_metadata;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __63__MFAttachmentManager_attachmentForContentID_preferredSchemes___block_invoke;
    v25[3] = &unk_1E5D3DDA0;
    id v26 = v6;
    id v9 = v20;
    id v27 = v9;
    id v10 = v7;
    id v28 = v10;
    [(NSMutableDictionary *)metadata enumerateKeysAndObjectsUsingBlock:v25];
    [(NSLock *)self->_metaDataLock unlock];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          long long v15 = [*(id *)(*((void *)&v21 + 1) + 8 * i) lowercaseString];
          long long v16 = [v9 objectForKeyedSubscript:v15];

          if (v16)
          {

            goto LABEL_13;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    long long v17 = [v9 allValues];
    long long v16 = [v17 firstObject];

    if (v16)
    {
LABEL_13:
      v18 = [(MFAttachmentManager *)self attachmentForURL:v16 error:0];
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __63__MFAttachmentManager_attachmentForContentID_preferredSchemes___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v7 = [a3 objectForKeyedSubscript:@"MFAttachmentContentIDKey"];
  if (![*(id *)(a1 + 32) caseInsensitiveCompare:v7])
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [v14 scheme];
    id v10 = [v9 lowercaseString];
    [v8 setObject:v14 forKeyedSubscript:v10];

    if (![*(id *)(a1 + 48) count]
      || ([v14 scheme],
          id v11 = objc_claimAutoreleasedReturnValue(),
          [*(id *)(a1 + 48) firstObject],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v11 caseInsensitiveCompare:v12],
          v12,
          v11,
          !v13))
    {
      *a4 = 1;
    }
  }
}

- (id)attachmentsForContext:(id)a3
{
  return 0;
}

- (void)insertMessageAttachmentMetadataToPersistence:(id)a3 forMessage:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v24 = (__CFString *)a3;
  id v28 = a4;
  id v5 = EDAttachmentsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v24;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Inserting message attachment metadata for attachments %{public}@ into the persistence", buf, 0xCu);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = v24;
  uint64_t v6 = [(__CFString *)obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v6)
  {
    uint64_t v27 = *(void *)v30;
    LOBYTE(v7) = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v10 = [v9 mimePartNumber];
        id v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          uint64_t v13 = [v9 part];
          id v12 = [v13 partNumber];
        }
        id v14 = objc_alloc(MEMORY[0x1E4F60B10]);
        uint64_t v15 = [v28 globalMessageID];
        long long v16 = [v9 fileName];
        long long v17 = [v9 mailDropMetadata];
        v18 = [v17 directUrl];
        uint64_t v19 = (void *)[v14 initWithGlobalMessageID:v15 name:v16 mimePart:v12 attachmentID:0 remoteURL:v18];

        if (v7)
        {
          id v20 = [(MFAttachmentManager *)self persistenceManager];
          int v7 = [v20 persistAttachmentMetadata:v19];
        }
        else
        {
          int v7 = 0;
        }
      }
      uint64_t v6 = [(__CFString *)obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v6);

    if (!v7)
    {
      long long v21 = @"Failed";
      goto LABEL_20;
    }
  }
  else
  {
  }
  long long v21 = @"Succeeded";
LABEL_20:
  long long v22 = EDAttachmentsLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v28 globalMessageID];
    *(_DWORD *)buf = 138412802;
    v34 = v21;
    __int16 v35 = 2114;
    v36 = obj;
    __int16 v37 = 2048;
    uint64_t v38 = v23;
    _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "%@ at inserting message attachment metadata for attachments %{public}@ for message %lld", buf, 0x20u);
  }
}

- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 request:(id)a5 syncLock:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [(MFAttachmentManager *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFAttachmentManager _fetchDataForAttachment:withProvider:request:syncLock:]", "MFAttachmentManager.m", 407, "0");
}

- (id)fetchDataForAttachment:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 updatePath];
  id v5 = [v4 fileURL];
  id v6 = v5;
  if (v5 && [v5 checkResourceIsReachableAndReturnError:0])
  {
    int v7 = EDAttachmentsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 url];
      *(_DWORD *)buf = 138412546;
      id v39 = v6;
      __int16 v40 = 2114;
      v41 = v8;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Passing attachment data URL off disk for file %@ '%{public}@'.", buf, 0x16u);
    }
    uint64_t v9 = [v4 fetchCompletionBlock];
    id v10 = (void *)v9;
    if (v9) {
      (*(void (**)(uint64_t, id, void, void))(v9 + 16))(v9, v6, 0, 0);
    }
    id v11 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
    [v11 setCompletedUnitCount:1];
  }
  else
  {
    id v12 = EDAttachmentsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v4 url];
      -[MFAttachmentManager fetchDataForAttachment:]((uint64_t)v6, v13, buf, v12);
    }

    id v14 = [v4 url];
    id v35 = 0;
    id v10 = [(MFAttachmentManager *)self _dataProviderForAttachmentURL:v14 error:&v35];
    id v6 = v35;

    if (v10)
    {
      uint64_t v15 = [[_MFAttachmentActiveRequest alloc] initWithAttachment:v4];
      long long v16 = EDAttachmentsLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = [v4 url];
        *(_DWORD *)v36 = 138412290;
        __int16 v37 = v17;
        _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "Fetch data for attachment url: %@", v36, 0xCu);
      }
      arrayAccessQueue = self->_arrayAccessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_108;
      block[3] = &unk_1E5D3DDF0;
      block[4] = self;
      id v19 = v4;
      id v29 = v19;
      id v30 = v10;
      id v20 = v15;
      long long v31 = v20;
      dispatch_async(arrayAccessQueue, block);
      id v11 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
      long long v21 = [(_MFAttachmentActiveRequest *)v20 downloadProgress];
      [v11 addChild:v21 withPendingUnitCount:1];

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_2;
      v26[3] = &unk_1E5D3B6E0;
      v26[4] = self;
      id v27 = v19;
      [v11 setCancellationHandler:v26];
    }
    else
    {
      long long v22 = [v4 fetchCompletionBlock];
      id v20 = v22;
      if (v22)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __46__MFAttachmentManager_fetchDataForAttachment___block_invoke;
        v32[3] = &unk_1E5D3DDC8;
        v34 = v22;
        id v33 = v6;
        dispatch_async(MEMORY[0x1E4F14428], v32);
      }
      uint64_t v23 = EDAttachmentsLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        long long v24 = [v4 url];
        [(MFAttachmentManager *)v24 fetchDataForAttachment:v23];
      }

      id v11 = 0;
    }
  }
  return v11;
}

uint64_t __46__MFAttachmentManager_fetchDataForAttachment___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

id __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_108(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _fetchDataForAttachment:*(void *)(a1 + 40) withProvider:*(void *)(a1 + 48) request:*(void *)(a1 + 56) syncLock:0];
}

uint64_t __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelFetchForAttachment:*(void *)(a1 + 40)];
}

- (void)fetchDataSynchronouslyForAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [v4 fetchCompletionBlock];
  [v4 setFetchCompletionBlock:0];
  id v6 = [v4 url];
  id v38 = 0;
  int v7 = [(MFAttachmentManager *)self _dataProviderForAttachmentURL:v6 error:&v38];
  id v8 = v38;

  if (v7)
  {
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__8;
    v36 = __Block_byref_object_dispose__8;
    id v37 = 0;
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__8;
    id v30 = __Block_byref_object_dispose__8;
    id v31 = 0;
    arrayAccessQueue = self->_arrayAccessQueue;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __59__MFAttachmentManager_fetchDataSynchronouslyForAttachment___block_invoke;
    id v20 = &unk_1E5D3DE18;
    id v10 = v4;
    long long v24 = &v32;
    id v21 = v10;
    long long v22 = self;
    id v23 = v7;
    v25 = &v26;
    dispatch_sync(arrayAccessQueue, &v17);
    if (!objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v17, v18, v19, v20)
      || (EFIsRunningUnitTests() & 1) != 0)
    {
      [(id)v27[5] lockWhenCondition:1];
    }
    else if (([(id)v27[5] tryLockWhenCondition:1] & 1) == 0)
    {
      id v11 = [MEMORY[0x1E4F60D58] currentDevice];
      int v12 = [v11 isInternal];

      if (v12)
      {
        uint64_t v13 = MFLogGeneral();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[MFAttachmentManager fetchDataSynchronouslyForAttachment:](v13);
        }
      }
      id v14 = (void *)v33[5];
      v33[5] = 0;

      goto LABEL_14;
    }
    [(id)v27[5] unlock];
LABEL_14:
    if (v5)
    {
      uint64_t v15 = [v10 fileURL];
      long long v16 = [(id)v33[5] data];
      ((void (**)(void, void *, void *, void))v5)[2](v5, v15, v16, 0);
    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
    goto LABEL_17;
  }
  if (v5) {
    ((void (**)(void, void, void, id))v5)[2](v5, 0, 0, v8);
  }
LABEL_17:
}

void __59__MFAttachmentManager_fetchDataSynchronouslyForAttachment___block_invoke(void *a1)
{
  uint64_t v2 = [[_MFAttachmentActiveRequest alloc] initWithAttachment:a1[4]];
  uint64_t v4 = a1[4];
  id v3 = (void *)a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v3 _fetchDataForAttachment:v4 withProvider:v5 request:v2 syncLock:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)_fetchCompletedForAttachment:(id)a3 error:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__8;
  v47 = __Block_byref_object_dispose__8;
  id v48 = 0;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  __int16 v40 = __Block_byref_object_copy__8;
  v41 = __Block_byref_object_dispose__8;
  id v42 = 0;
  objc_msgSend(v6, "updatePathIfNeeded", v6, v7);
  arrayAccessQueue = self->_arrayAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke;
  block[3] = &unk_1E5D3DE40;
  id v35 = &v43;
  block[4] = self;
  id v9 = v6;
  id v34 = v9;
  v36 = &v37;
  dispatch_sync(arrayAccessQueue, block);
  id v10 = [(id)v44[5] objectForKey:@"MFAttachmentPrimaryConsumerKey"];
  long long v22 = v10;
  if (v7)
  {
    id v11 = 0;
  }
  else
  {
    id v11 = [v10 data];
  }
  int v12 = objc_msgSend((id)v38[5], "ef_partition:", &__block_literal_global_114);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_2;
  aBlock[3] = &unk_1E5D3DE88;
  id v13 = v7;
  id v31 = v13;
  id v14 = v11;
  id v32 = v14;
  uint64_t v15 = (void (**)(void *, void))_Block_copy(aBlock);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v16 = [v12 first];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v16);
        }
        v15[2](v15, *(void *)(*((void *)&v26 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v49 count:16];
    }
    while (v17);
  }

  id v20 = [v12 second];
  BOOL v21 = [v20 count] == 0;

  if (!v21)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_3;
    v23[3] = &unk_1E5D3DEB0;
    id v24 = v12;
    v25 = v15;
    dispatch_async(MEMORY[0x1E4F14428], v23);
  }
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

void __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [*(id *)(a1 + 40) url];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = [v4 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 40) url];

  if (v8)
  {
    id v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v16 = 138412290;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_INFO, "#Attachments removing attachment %@", (uint8_t *)&v16, 0xCu);
    }

    id v11 = *(void **)(*(void *)(a1 + 32) + 32);
    int v12 = [*(id *)(a1 + 40) url];
    [v11 removeObjectForKey:v12];
  }
  uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKey:@"MFAttachmentAttachmentKey"];
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

uint64_t __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_111(uint64_t a1, void *a2)
{
  return [a2 wantsCompletionBlockOffMainThread];
}

void __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 downloadProgress];
  uint64_t v4 = v3;
  if (*(void *)(a1 + 32)) {
    [v3 cancel];
  }
  else {
    objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v3, "totalUnitCount"));
  }
  [v5 completeWithData:*(void *)(a1 + 40) error:*(void *)(a1 + 32)];
}

void __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "second", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_cancelFetchForAttachment:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[MFAttachmentManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Canceling download for attachment %@", buf, 0xCu);
  }

  arrayAccessQueue = self->_arrayAccessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke;
  v8[3] = &unk_1E5D3B6E0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(arrayAccessQueue, v8);
}

void __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [*(id *)(a1 + 40) url];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"MFAttachmentAttachmentKey"];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke_2;
    v20[3] = &unk_1E5D3DED8;
    id v21 = *(id *)(a1 + 40);
    long long v6 = [v5 indexesOfObjectsPassingTest:v20];
    id v7 = [v5 objectsAtIndexes:v6];
    [v5 removeObjectsAtIndexes:v6];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke_3;
    uint64_t v18 = &unk_1E5D3B5C0;
    id v8 = v7;
    id v19 = v8;
    dispatch_sync(MEMORY[0x1E4F14428], &v15);
    if (!objc_msgSend(v5, "count", v15, v16, v17, v18))
    {
      id v9 = [v4 objectForKeyedSubscript:@"MFAttachmentMonitorKey"];
      [v9 cancel];

      uint64_t v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v11;
        _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_INFO, "removing attachment %@", buf, 0xCu);
      }

      uint64_t v12 = *(void **)(a1 + 40);
      uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 32);
      uint64_t v14 = [v12 url];
      [v13 removeObjectForKey:v14];
    }
  }
}

BOOL __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 attachment];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v7 + 1) + 8 * v4);
        long long v6 = +[MFError errorWithDomain:@"MFMessageErrorDomain", 1028, @"Download Canceled.", @"Download Canceled", 0, (void)v7 code localizedDescription title userInfo];
        [v5 completeWithData:0 error:v6];

        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v2);
  }
}

- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  return 0;
}

- (id)attachmentForItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  [(MFAttachmentManager *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFAttachmentManager attachmentForItemProvider:mimeType:fileName:contentID:context:]", "MFAttachmentManager.m", 599, "0");
}

- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4
{
  return 0;
}

- (void)setContentID:(id)a3 forAttachment:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([v12 hasPrefix:@"<"])
  {
    uint64_t v7 = [v12 substringFromIndex:1];

    long long v8 = (void *)v7;
  }
  else
  {
    long long v8 = v12;
  }
  id v13 = v8;
  int v9 = [v8 hasSuffix:@">"];
  id v10 = v13;
  if (v9)
  {
    uint64_t v11 = objc_msgSend(v13, "substringToIndex:", objc_msgSend(v13, "length") - 1);

    id v10 = (id)v11;
  }
  id v14 = v10;
  [(MFAttachmentManager *)self setMetadataForAttachment:v6 toValue:v10 forKey:@"MFAttachmentContentIDKey"];
}

- (void)clearMetadataForAttachment:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 url];

  if (v4)
  {
    [(NSLock *)self->_metaDataLock lock];
    metadata = self->_metadata;
    id v6 = [v7 url];
    [(NSMutableDictionary *)metadata removeObjectForKey:v6];

    [(NSLock *)self->_metaDataLock unlock];
  }
}

- (id)prepareAttachmentForDisplay:(id)a3 fileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v6 fileURL];
  }
  id v10 = v9;
  uint64_t v11 = [v6 fileUTType];
  if (v11)
  {
    id v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v11];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = [(MFAttachmentManager *)self persistenceManager];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__MFAttachmentManager_prepareAttachmentForDisplay_fileURL___block_invoke;
  v17[3] = &unk_1E5D3DF00;
  v17[4] = self;
  id v14 = v6;
  id v18 = v14;
  id v15 = [v13 addSynapseAttributesToAttachmentWithURL:v10 contentType:v12 usingGenerator:v17];

  return v15;
}

uint64_t __59__MFAttachmentManager_prepareAttachmentForDisplay_fileURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createSynapseAttributesForAttachment:*(void *)(a1 + 40)];
}

- (id)_createSynapseAttributesForAttachment:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 url];
  id v18 = 0;
  id v6 = [(MFAttachmentManager *)self _dataProviderForAttachmentURL:v5 error:&v18];
  id v7 = v18;

  if (v6)
  {
    long long v8 = [v6 messageForAttachment:v4];
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F60C80]);
      id v10 = [v8 senderAddressComment];
      uint64_t v11 = [v8 firstSender];
      id v12 = [v8 persistentID];
      id v13 = [v8 dateReceived];
      id v14 = (void *)[v9 initWithSenderAddressComment:v10 senderAddress:v11 messagePersistentID:v12 receivedDate:v13];
    }
    else
    {
      id v10 = EDAttachmentsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v16 = [v4 url];
        [(MFAttachmentManager *)v16 _createSynapseAttributesForAttachment:v10];
      }
      id v14 = 0;
    }
  }
  else
  {
    long long v8 = EDAttachmentsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v4 url];
      -[MFAttachmentManager _createSynapseAttributesForAttachment:](v15, (uint64_t)v7, buf, v8);
    }
    id v14 = 0;
  }

  return v14;
}

- (void)setPersistenceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_imageScalingQueue, 0);
  objc_storeStrong((id *)&self->_metaDataLock, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_arrayAccessQueue, 0);
}

- (void)_filePathForAttachment:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, a2, a3, "Failed to create a data provider that generates attachment file path for attachment url: %@", (uint8_t *)a2);
}

- (void)fetchDataForAttachment:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, a2, a3, "Failed to create MFAttachmentDataProvider for attachment url: %@", (uint8_t *)a2);
}

- (void)fetchDataForAttachment:(uint8_t *)buf .cold.2(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "No file %@ found at attachment data URL '%{public}@'", buf, 0x16u);
}

- (void)fetchDataSynchronouslyForAttachment:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#Attachments FIXME: Blocking call requested on the main thread", v1, 2u);
}

- (void)_createSynapseAttributesForAttachment:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Not adding Synapse attributes - unable to find provider for attachment %{public}@ error %@", buf, 0x16u);
}

- (void)_createSynapseAttributesForAttachment:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_4(&dword_1A7EFF000, a2, a3, "Not adding Synapse attributes - unable to find message for attachment %{public}@", (uint8_t *)a2);
}

@end