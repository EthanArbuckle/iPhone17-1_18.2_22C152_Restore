@interface MFAttachmentManager
+ (id)allManagers;
+ (id)defaultManager;
+ (id)supportedDocumentUTIs;
- (BOOL)_setupAttachment:(id)a3 withMimeBody:(id)a4 error:(id *)a5;
- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4;
- (MFAttachmentManager)init;
- (id)_contentIDForAttachment:(id)a3;
- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4;
- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 syncLock:(id *)a5;
- (id)_filePathForAttachment:(id)a3;
- (id)attachmentForCID:(id)a3;
- (id)attachmentForContentID:(id)a3;
- (id)attachmentForContentID:(id)a3 preferredSchemes:(id)a4;
- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7;
- (id)attachmentForTextAttachment:(id)a3 error:(id *)a4;
- (id)attachmentForURL:(id)a3 error:(id *)a4;
- (id)attachmentForURL:(id)a3 withMimeBody:(id)a4 error:(id *)a5;
- (id)attachmentsForContext:(id)a3;
- (id)attachmentsForURLs:(id)a3 error:(id *)a4;
- (id)imageScalingQueue;
- (id)metadataForAttachment:(id)a3 forKey:(id)a4;
- (void)_fetchCompletedForAttachment:(id)a3 error:(id)a4;
- (void)addProvider:(id)a3 forBaseURL:(id)a4;
- (void)cancelFetchForAttachment:(id)a3;
- (void)clearMetadataForAttachment:(id)a3;
- (void)dealloc;
- (void)fetchDataForAttachment:(id)a3;
- (void)fetchDataSynchronouslyForAttachment:(id)a3;
- (void)removeProvider:(id)a3;
- (void)removeProviderForBaseURL:(id)a3;
- (void)setContentID:(id)a3 forAttachment:(id)a4;
- (void)setMetadataForAttachment:(id)a3 toValue:(id)a4 forKey:(id)a5;
@end

@implementation MFAttachmentManager

- (void)removeProviderForBaseURL:(id)a3
{
  v4 = (void *)[a3 absoluteString];
  if ([v4 hasSuffix:@"/"]) {
    v4 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
  }
  if (v4)
  {
    providers = self->_providers;
    [(NSMutableDictionary *)providers removeObjectForKey:v4];
  }
}

+ (id)allManagers
{
  if (allManagers_onceToken != -1) {
    dispatch_once(&allManagers_onceToken, &__block_literal_global_10);
  }
  return (id)allManagers_sAllManagers;
}

id __34__MFAttachmentManager_allManagers__block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F735A0]);
  allManagers_sAllManagers = (uint64_t)result;
  return result;
}

+ (id)defaultManager
{
  v2 = objc_msgSend((id)objc_msgSend(a1, "allManagers"), "allObjects");
  return (id)[v2 firstObject];
}

- (MFAttachmentManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFAttachmentManager;
  v2 = [(MFAttachmentManager *)&v5 init];
  if (v2)
  {
    v2->_attachments = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_arrayAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mail.attachmentManagerAttachmentArray", 0);
    v2->_metaDataLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v2->_imageScalingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.message.attachmentManager.imagescaling", v3);
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allManagers"), "addObject:", v2);
  }
  return v2;
}

- (void)dealloc
{
  arrayAccessQueue = self->_arrayAccessQueue;
  if (arrayAccessQueue) {
    dispatch_release(arrayAccessQueue);
  }
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allManagers"), "removeObject:", self);

  v4.receiver = self;
  v4.super_class = (Class)MFAttachmentManager;
  [(MFAttachmentManager *)&v4 dealloc];
}

+ (id)supportedDocumentUTIs
{
  if (supportedDocumentUTIs_onceToken != -1) {
    dispatch_once(&supportedDocumentUTIs_onceToken, &__block_literal_global_33);
  }
  return (id)_supportedUTIs;
}

id __44__MFAttachmentManager_supportedDocumentUTIs__block_invoke()
{
  v13[25] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F22680];
  v13[0] = *MEMORY[0x1E4F22588];
  v13[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F226F0];
  v13[2] = *MEMORY[0x1E4F22558];
  v13[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F225E8];
  v13[4] = *MEMORY[0x1E4F22590];
  v13[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F226D0];
  v13[6] = *MEMORY[0x1E4F22740];
  v13[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F22620];
  v13[8] = *MEMORY[0x1E4F226C8];
  v13[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F225F8];
  v13[10] = *MEMORY[0x1E4F22698];
  v13[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F225E0];
  v13[12] = *MEMORY[0x1E4F22548];
  v13[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F22748];
  v13[14] = *MEMORY[0x1E4F22560];
  v13[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F22690];
  v13[16] = *MEMORY[0x1E4F226D8];
  v13[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F22600];
  v13[18] = *MEMORY[0x1E4F22718];
  v13[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F22508];
  v13[20] = *MEMORY[0x1E4F225D0];
  v13[21] = v10;
  uint64_t v11 = *MEMORY[0x1E4F22738];
  v13[22] = *MEMORY[0x1E4F22670];
  v13[23] = v11;
  v13[24] = *MEMORY[0x1E4F225A8];
  _supportedUTIs = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:25];
  return (id)_supportedUTIs;
}

- (void)addProvider:(id)a3 forBaseURL:(id)a4
{
  if (!self->_providers) {
    self->_providers = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  }
  uint64_t v7 = (void *)[a4 absoluteString];
  if ([v7 hasSuffix:@"/"]) {
    uint64_t v7 = objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1);
  }
  providers = self->_providers;
  [(NSMutableDictionary *)providers setObject:a3 forKey:v7];
}

- (void)removeProvider:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  providers = self->_providers;
  uint64_t v6 = [(NSMutableDictionary *)providers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(providers);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ((id)[(NSMutableDictionary *)self->_providers objectForKey:v10] == a3)
        {
          if (v10) {
            -[MFAttachmentManager removeProviderForBaseURL:](self, "removeProviderForBaseURL:", [MEMORY[0x1E4F1CB10] URLWithString:v10]);
          }
          return;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)providers countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
}

- (id)imageScalingQueue
{
  return self->_imageScalingQueue;
}

- (BOOL)_setupAttachment:(id)a3 withMimeBody:(id)a4 error:(id *)a5
{
  if (objc_msgSend((id)objc_msgSend(a3, "url"), "mf_isValidAttachmentURL"))
  {
    id v9 = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", [a3 url], a5);
    if (v9)
    {
      if (a4 || (a4 = (id)objc_msgSend((id)objc_msgSend(v9, "messageForAttachment:", a3), "messageBody")) != 0)
      {
        a4 = (id)objc_msgSend(a4, "partWithNumber:", objc_msgSend((id)objc_msgSend(a3, "url"), "mf_lastPartNumber"));
        [a3 setPart:a4];
        if (![a3 fileName]) {
          objc_msgSend(a3, "setFileName:", objc_msgSend(a4, "attachmentFilename"));
        }
        if (a4)
        {
          [a3 setMimeType:objc_msgSend(NSString, "stringWithFormat:", @"%@/%@", objc_msgSend(a4, "type"), objc_msgSend(a4, "subtype"))];
          objc_msgSend(a3, "setEncodedFileSize:", objc_msgSend(a4, "approximateRawSize"));
          objc_msgSend(a3, "setDisposition:", objc_msgSend(a4, "disposition"));
          uint64_t v10 = [a4 dispositionParameterForKey:@"remote-image"];
          if (v10) {
            [a3 setRemoteImageFileName:v10];
          }
        }
      }
      if (![(MFAttachmentManager *)self metadataForAttachment:a3 forKey:@"MFAttachmentContentIDKey"])
      {
        uint64_t v11 = [a4 contentID];
        if (!v11)
        {
          uint64_t v11 = [a4 bodyParameterForKey:*MEMORY[0x1E4F73430]];
          if (!v11) {
            uint64_t v11 = objc_msgSend(NSString, "mf_messageIDStringWithDomainHint:");
          }
        }
        [(MFAttachmentManager *)self setContentID:v11 forAttachment:a3];
      }
      LOBYTE(v9) = 1;
    }
  }
  else if (a5)
  {
    long long v12 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:@"Invalid attachment URL." title:@"Invalid Attachment URL" userInfo:0];
    LOBYTE(v9) = 0;
    *a5 = v12;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return (char)v9;
}

- (id)_filePathForAttachment:(id)a3
{
  id result = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", [a3 url], 0);
  if (result)
  {
    uint64_t v6 = (void *)[result messageForAttachment:a3];
    id result = (id)objc_msgSend(-[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", objc_msgSend(a3, "url"), 0), "storageLocationForAttachment:withMessage:", a3, v6);
    if (!result)
    {
      uint64_t v7 = (void *)[v6 messageStore];
      return (id)[v7 storagePath];
    }
  }
  return result;
}

- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4
{
  uint64_t v7 = objc_msgSend(a3, "mf_partNumbers");
  if (![v7 count])
  {
    if (a4)
    {
      long long v13 = &unk_1F2675530;
      goto LABEL_12;
    }
LABEL_13:
    long long v12 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = (void *)[a3 URLByDeletingLastPathComponent];
  uint64_t v9 = [v7 count];
  if (v9 == -1)
  {
LABEL_8:
    if (a4)
    {
      long long v13 = &unk_1F2675558;
LABEL_12:
      long long v14 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"MFMessageErrorDomain" code:1030 userInfo:v13];
      long long v12 = 0;
      *a4 = v14;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v10 = v9 + 1;
  while (1)
  {
    uint64_t v11 = (void *)[v8 absoluteString];
    if ([v11 hasSuffix:@"/"]) {
      uint64_t v11 = objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 1);
    }
    long long v12 = (void *)[(NSMutableDictionary *)self->_providers objectForKey:v11];
    if (v12) {
      break;
    }
    uint64_t v8 = (void *)[v8 URLByDeletingLastPathComponent];
    if (!--v10) {
      goto LABEL_8;
    }
  }
LABEL_14:
  id v15 = v12;
  return v15;
}

- (id)attachmentForURL:(id)a3 error:(id *)a4
{
  return [(MFAttachmentManager *)self attachmentForURL:a3 withMimeBody:0 error:a4];
}

- (id)attachmentForURL:(id)a3 withMimeBody:(id)a4 error:(id *)a5
{
  uint64_t v5 = (MFAttachment *)a3;
  if (a3)
  {
    uint64_t v5 = [[MFAttachment alloc] initWithURL:a3 attachmentManager:self];
    if (![(MFAttachmentManager *)self _setupAttachment:v5 withMimeBody:a4 error:a5])
    {

      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (id)attachmentsForURLs:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(a3);
        }
        id v12 = [(MFAttachmentManager *)self attachmentForURL:*(void *)(*((void *)&v14 + 1) + 8 * i) error:a4];
        if (!v12) {
          return 0;
        }
        [v7 addObject:v12];
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  return v7;
}

- (id)attachmentForTextAttachment:(id)a3 error:(id *)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "mimePart"), "partURL");
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "mimePart"), "mimeBody");
  return [(MFAttachmentManager *)self attachmentForURL:v7 withMimeBody:v8 error:a4];
}

- (id)attachmentForCID:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  [v4 setQuery:0];
  uint64_t v5 = [v4 path];
  return [(MFAttachmentManager *)self attachmentForContentID:v5 preferredSchemes:0];
}

- (id)attachmentForContentID:(id)a3
{
  return [(MFAttachmentManager *)self attachmentForContentID:a3 preferredSchemes:0];
}

- (id)attachmentForContentID:(id)a3 preferredSchemes:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![a3 length]) {
    return 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(NSLock *)self->_metaDataLock lock];
  metadata = self->_metadata;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__MFAttachmentManager_attachmentForContentID_preferredSchemes___block_invoke;
  v21[3] = &unk_1E6867058;
  v21[4] = a3;
  v21[5] = v7;
  v21[6] = a4;
  [(NSMutableDictionary *)metadata enumerateKeysAndObjectsUsingBlock:v21];
  [(NSLock *)self->_metaDataLock unlock];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [a4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(a4);
        }
        uint64_t v13 = objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "lowercaseString"));
        if (v13)
        {
          uint64_t v14 = v13;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [a4 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = objc_msgSend((id)objc_msgSend(v7, "allValues"), "firstObject");
  if (v14) {
LABEL_13:
  }
    id v15 = [(MFAttachmentManager *)self attachmentForURL:v14 error:0];
  else {
    id v15 = 0;
  }

  return v15;
}

uint64_t __63__MFAttachmentManager_attachmentForContentID_preferredSchemes___block_invoke(id *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(a1[4], "caseInsensitiveCompare:", objc_msgSend(a3, "objectForKeyedSubscript:", @"MFAttachmentContentIDKey"));
  if (!result)
  {
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", a2, objc_msgSend((id)objc_msgSend(a2, "scheme"), "lowercaseString"));
    uint64_t result = [a1[6] count];
    if (!result
      || (uint64_t result = objc_msgSend((id)objc_msgSend(a2, "scheme"), "caseInsensitiveCompare:", objc_msgSend(a1[6], "firstObject"))) == 0)
    {
      *a4 = 1;
    }
  }
  return result;
}

- (id)attachmentsForContext:(id)a3
{
  return 0;
}

- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 syncLock:(id *)a5
{
}

- (void)fetchDataForAttachment:(id)a3
{
  uint64_t v12 = 0;
  id v5 = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", [a3 url], &v12);
  if (v5)
  {
    arrayAccessQueue = self->_arrayAccessQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_2;
    v10[3] = &unk_1E68670A8;
    v10[4] = self;
    v10[5] = a3;
    v10[6] = v5;
    id v7 = v10;
    uint64_t v8 = arrayAccessQueue;
  }
  else
  {
    uint64_t v9 = [a3 fetchCompletionBlock];
    if (!v9) {
      return;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__MFAttachmentManager_fetchDataForAttachment___block_invoke;
    block[3] = &unk_1E6867080;
    block[4] = v12;
    block[5] = v9;
    uint64_t v8 = MEMORY[0x1E4F14428];
    id v7 = block;
  }
  dispatch_async(v8, v7);
}

uint64_t __46__MFAttachmentManager_fetchDataForAttachment___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDataForAttachment:*(void *)(a1 + 40) withProvider:*(void *)(a1 + 48) syncLock:0];
}

- (void)fetchDataSynchronouslyForAttachment:(id)a3
{
  id v5 = (void (**)(id, uint64_t, void))(id)[a3 fetchCompletionBlock];
  [a3 setFetchCompletionBlock:0];
  uint64_t v24 = 0;
  id v6 = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", [a3 url], &v24);
  if (v6)
  {
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3052000000;
    v21 = __Block_byref_object_copy__0;
    v22 = __Block_byref_object_dispose__0;
    uint64_t v23 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3052000000;
    id v15 = __Block_byref_object_copy__0;
    long long v16 = __Block_byref_object_dispose__0;
    uint64_t v17 = 0;
    arrayAccessQueue = self->_arrayAccessQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__MFAttachmentManager_fetchDataSynchronouslyForAttachment___block_invoke;
    v11[3] = &unk_1E68670D0;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = v6;
    v11[7] = &v18;
    v11[8] = &v12;
    dispatch_sync(arrayAccessQueue, v11);
    int v8 = [MEMORY[0x1E4F29060] isMainThread];
    uint64_t v9 = (void *)v13[5];
    if (v8)
    {
      if (([v9 tryLockWhenCondition:1] & 1) == 0)
      {
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice"), "isInternal"))
        {
          uint64_t v10 = MFLogGeneral();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[MFAttachmentManager fetchDataSynchronouslyForAttachment:](v10);
          }
        }
        v19[5] = 0;
        goto LABEL_12;
      }
    }
    else
    {
      [v9 lockWhenCondition:1];
    }
    [(id)v13[5] unlock];
LABEL_12:
    if (v5) {
      v5[2](v5, [(id)v19[5] data], 0);
    }
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v18, 8);
    goto LABEL_15;
  }
  if (v5) {
    v5[2](v5, 0, v24);
  }
LABEL_15:
}

uint64_t __59__MFAttachmentManager_fetchDataSynchronouslyForAttachment___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _fetchDataForAttachment:*(void *)(a1 + 40) withProvider:*(void *)(a1 + 48) syncLock:*(void *)(*(void *)(a1 + 64) + 8) + 40];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  return result;
}

- (void)_fetchCompletedForAttachment:(id)a3 error:(id)a4
{
  arrayAccessQueue = self->_arrayAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke;
  block[3] = &unk_1E68670A8;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  dispatch_sync(arrayAccessQueue, block);
}

void __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "url")), "copy");
  if ([*(id *)(a1 + 40) url])
  {
    uint64_t v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v4;
      _os_log_impl(&dword_1CFCFE000, v3, OS_LOG_TYPE_INFO, "removing attachment %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "url"));
  }
  id v5 = (void *)[v2 objectForKey:@"MFAttachmentAttachmentKey"];
  id v6 = (void *)[v2 objectForKey:@"MFAttachmentPrimaryConsumerKey"];
  if (*(void *)(a1 + 48)) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [v6 data];
  }
  int v8 = objc_msgSend(v5, "ef_partition:", &__block_literal_global_85);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  uint64_t v20 = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_2;
  v21 = &unk_1E6867118;
  uint64_t v22 = *(void *)(a1 + 48);
  uint64_t v23 = v7;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = (void *)[v8 first];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v20((uint64_t)v19, *(void **)(*((void *)&v15 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v11);
  }
  if (objc_msgSend((id)objc_msgSend(v8, "second"), "count"))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_3;
    v14[3] = &unk_1E6867140;
    v14[4] = v8;
    v14[5] = v19;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

uint64_t __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_82(uint64_t a1, void *a2)
{
  return [a2 wantsCompletionBlockOffMainThread];
}

uint64_t __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)[a2 downloadProgress];
  if (*(void *)(a1 + 32)) {
    [v4 cancel];
  }
  else {
    objc_msgSend(v4, "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));
  }
  if ([a2 fetchCompletionBlock])
  {
    uint64_t v5 = [a2 fetchCompletionBlock];
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, *(void *)(a1 + 40), *(void *)(a1 + 32));
    [a2 setFetchCompletionBlock:0];
  }
  return [a2 resetProgress];
}

uint64_t __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "second", 0);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)cancelFetchForAttachment:(id)a3
{
  arrayAccessQueue = self->_arrayAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__MFAttachmentManager_cancelFetchForAttachment___block_invoke;
  v4[3] = &unk_1E68661E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(arrayAccessQueue, v4);
}

uint64_t __48__MFAttachmentManager_cancelFetchForAttachment___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "url"));
  if (result)
  {
    uint64_t v3 = (void *)result;
    if ([*(id *)(a1 + 40) fetchCompletionBlock])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__MFAttachmentManager_cancelFetchForAttachment___block_invoke_2;
      block[3] = &unk_1E68661B8;
      block[4] = *(void *)(a1 + 40);
      dispatch_sync(MEMORY[0x1E4F14428], block);
    }
    [*(id *)(a1 + 40) resetProgress];
    uint64_t v4 = (void *)[v3 objectForKeyedSubscript:@"MFAttachmentAttachmentKey"];
    [v4 removeObjectIdenticalTo:*(void *)(a1 + 40)];
    uint64_t result = [v4 count];
    if (!result)
    {
      objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"MFAttachmentMonitorKey"), "cancel");
      uint64_t v5 = MFLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v9 = v6;
        _os_log_impl(&dword_1CFCFE000, v5, OS_LOG_TYPE_INFO, "removing attachment %@", buf, 0xCu);
      }
      return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "url"));
    }
  }
  return result;
}

uint64_t __48__MFAttachmentManager_cancelFetchForAttachment___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchCompletionBlock];
  (*(void (**)(uint64_t, void, MFError *))(v2 + 16))(v2, 0, +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1028 localizedDescription:@"Download Canceled." title:@"Download Canceled" userInfo:0]);
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setFetchCompletionBlock:0];
}

- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  return 0;
}

- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4
{
  return 0;
}

- (void)setContentID:(id)a3 forAttachment:(id)a4
{
  id v5 = a3;
  if ([a3 hasPrefix:@"<"]) {
    id v5 = (id)[v5 substringFromIndex:1];
  }
  if ([v5 hasSuffix:@">"]) {
    id v5 = (id)objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
  }
  [(MFAttachmentManager *)self setMetadataForAttachment:a4 toValue:v5 forKey:@"MFAttachmentContentIDKey"];
}

- (id)_contentIDForAttachment:(id)a3
{
  return [(MFAttachmentManager *)self metadataForAttachment:a3 forKey:@"MFAttachmentContentIDKey"];
}

- (void)setMetadataForAttachment:(id)a3 toValue:(id)a4 forKey:(id)a5
{
  if ([a3 url])
  {
    [(NSLock *)self->_metaDataLock lock];
    metadata = self->_metadata;
    if (!metadata)
    {
      metadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_metadata = metadata;
    }
    id v10 = (id)-[NSMutableDictionary objectForKeyedSubscript:](metadata, "objectForKeyedSubscript:", [a3 url]);
    if (!v10)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v10, [a3 url]);
    }
    [v10 setObject:a4 forKeyedSubscript:a5];
    metaDataLock = self->_metaDataLock;
    [(NSLock *)metaDataLock unlock];
  }
}

- (id)metadataForAttachment:(id)a3 forKey:(id)a4
{
  [(NSLock *)self->_metaDataLock lock];
  id v7 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_metadata, "objectForKey:", objc_msgSend(a3, "url")), "objectForKey:", a4);
  [(NSLock *)self->_metaDataLock unlock];
  return v7;
}

- (void)clearMetadataForAttachment:(id)a3
{
  if ([a3 url])
  {
    [(NSLock *)self->_metaDataLock lock];
    -[NSMutableDictionary removeObjectForKey:](self->_metadata, "removeObjectForKey:", [a3 url]);
    metaDataLock = self->_metaDataLock;
    [(NSLock *)metaDataLock unlock];
  }
}

- (void)fetchDataSynchronouslyForAttachment:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1CFCFE000, log, OS_LOG_TYPE_ERROR, "#Attachments FIXME: Blocking call requested on the main thread", v1, 2u);
}

@end