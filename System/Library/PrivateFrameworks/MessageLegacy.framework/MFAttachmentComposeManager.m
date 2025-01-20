@interface MFAttachmentComposeManager
- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4;
- (id)_composeAttachmentDataProviderForContext:(id)a3;
- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 syncLock:(id *)a5;
- (id)_queueForAttachment:(id)a3;
- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7;
- (id)attachmentsForContext:(id)a3;
- (void)_callProgressBlockForAttachmentURL:(id)a3 withBytes:(unint64_t)a4 expectedSize:(unint64_t)a5;
- (void)_fetchInvocationCallUsingBlock:(id)a3;
- (void)dealloc;
- (void)loadAttachmentURL:(id)a3 forContextID:(id)a4;
- (void)recordPasteboardAttachmentsForURLs:(id)a3 forContextID:(id)a4;
- (void)recordUndoAttachmentsForURLs:(id)a3 forContextID:(id)a4;
- (void)removeAttachmentForURL:(id)a3;
@end

@implementation MFAttachmentComposeManager

- (id)attachmentsForContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_composeAttachmentURLs, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  composeAttachmentURLs = self->_composeAttachmentURLs;
  uint64_t v7 = [(NSMutableArray *)composeAttachmentURLs countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(composeAttachmentURLs);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 rangeOfString:a3] != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v12 = -[MFAttachmentManager attachmentForURL:error:](self, "attachmentForURL:error:", [MEMORY[0x1E4F1CB10] URLWithString:v11], 0);
          if (v12) {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [(NSMutableArray *)composeAttachmentURLs countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentComposeManager;
  [(MFAttachmentManager *)&v3 dealloc];
}

- (id)_queueForAttachment:(id)a3
{
  if (([a3 isDataAvailableLocally] & 1) != 0
    || (v5 = objc_msgSend(-[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", objc_msgSend(a3, "url"), 0), "messageForAttachment:", a3), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)|| (id result = (id)objc_msgSend((id)objc_msgSend(v5, "mailbox"), "attachmentDownloadQueue")) == 0)
  {
    id result = self->_defaultDownloadQueue;
    if (!result)
    {
      id result = objc_alloc_init(MFInvocationQueue);
      self->_defaultDownloadQueue = (MFInvocationQueue *)result;
    }
  }
  return result;
}

- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 syncLock:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = [a3 url];
  uint64_t v11 = [(NSMutableDictionary *)self->super._attachments objectForKeyedSubscript:v10];
  if (v11)
  {
    id v12 = (void *)v11;
    uint64_t v13 = [a3 customConsumer];
    if (v13) {
      objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", @"MFAttachmentCollectionFilterKey"), "addDataConsumer:", v13);
    }
    long long v14 = (void *)[v12 objectForKeyedSubscript:@"MFAttachmentAttachmentKey"];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice"), "isInternal")
      && [v14 indexOfObjectIdenticalTo:a3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFAttachmentComposeManager.m", 98, @"attachments already contains %@", a3);
    }
    [v14 addObject:a3];
    id v15 = (id)[v12 objectForKeyedSubscript:@"MFAttachmentPrimaryConsumerKey"];
    id v16 = (id)[v12 objectForKeyedSubscript:@"MFAttachmentSyncLockKey"];
    if (a5) {
LABEL_8:
    }
      *a5 = v16;
  }
  else
  {
    v22 = a5;
    id v15 = objc_alloc_init(MEMORY[0x1E4F734A8]);
    id v16 = (id)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    id v18 = (id)[objc_alloc(MEMORY[0x1E4F73548]) initWithMainConsumer:v15];
    if ([a3 customConsumer]) {
      objc_msgSend(v18, "addDataConsumer:", objc_msgSend(a3, "customConsumer"));
    }
    uint64_t v19 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", a3), @"MFAttachmentAttachmentKey");
    [v19 setObject:v15 forKeyedSubscript:@"MFAttachmentPrimaryConsumerKey"];
    [v19 setObject:v18 forKeyedSubscript:@"MFAttachmentCollectionFilterKey"];
    [v19 setObject:v16 forKeyedSubscript:@"MFAttachmentSyncLockKey"];
    v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v25 = a3;
      __int16 v26 = 2112;
      uint64_t v27 = v10;
      _os_log_impl(&dword_1CFCFE000, v20, OS_LOG_TYPE_DEFAULT, "#Attachments requesting download of attachment %p with URL %@", buf, 0x16u);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke;
    v23[3] = &unk_1E6866F70;
    v23[4] = a3;
    v23[5] = self;
    v23[6] = v10;
    v23[7] = a4;
    v23[8] = v18;
    v23[9] = v16;
    v21 = +[MFMonitoredInvocation invocationWithSelector:target:object:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", sel__fetchInvocationCallUsingBlock_, self, (id)[v23 copy], @"FetchDataForURL", 4, 1);
    [(MFMonitoredInvocation *)v21 setPowerAssertionId:@"com.apple.message.MFAttachmentComposeManager"];
    [(MFMonitoredInvocation *)v21 retainArguments];
    objc_msgSend(v19, "setObject:forKeyedSubscript:", -[MFMonitoredInvocation monitor](v21, "monitor"), @"MFAttachmentMonitorKey");
    [(NSMutableDictionary *)self->super._attachments setObject:v19 forKeyedSubscript:v10];
    objc_msgSend(-[MFAttachmentComposeManager _queueForAttachment:](self, "_queueForAttachment:", a3), "addInvocation:", v21);
    a5 = v22;
    if (v22) {
      goto LABEL_8;
    }
  }
  return v15;
}

void __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  uint64_t v11 = 0;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(*(id *)(a1 + 32), "encodedFileSize"));
  v2 = (void *)v7[5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke_18;
  v3[3] = &unk_1E6866EF8;
  long long v4 = *(_OWORD *)(a1 + 40);
  v5 = &v6;
  objc_msgSend(v2, "ef_observeKeyPath:options:usingBlock:", @"fractionCompleted", 1, v3);
  objc_msgSend(*(id *)(a1 + 56), "fetchDataForAttachment:consumer:progress:completion:");
  _Block_object_dispose(&v6, 8);
}

uint64_t __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke_18(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) completedUnitCount];
  uint64_t v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) totalUnitCount];
  return [v2 _callProgressBlockForAttachmentURL:v3 withBytes:v4 expectedSize:v5];
}

uint64_t __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke_2(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[*(id *)(a1 + 32) data];
  uint64_t v9 = v8;
  if (a2 && a4 && (uint64_t v10 = [v8 length], !a3) && v10)
  {
    long long v11 = *(_OWORD *)(a1 + 40);
    id v12 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke_3;
    v17[3] = &unk_1E6866F20;
    long long v18 = v11;
    uint64_t v19 = *(void *)(a1 + 56);
    v20 = v9;
    dispatch_sync(v12, v17);
  }
  else
  {
    uint64_t v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134219266;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 1024;
      int v26 = a4;
      __int16 v27 = 1024;
      int v28 = a2;
      __int16 v29 = 2048;
      uint64_t v30 = [v9 length];
      __int16 v31 = 2112;
      uint64_t v32 = a3;
      _os_log_impl(&dword_1CFCFE000, v13, OS_LOG_TYPE_DEFAULT, "#Attachments not writing attachment %p %@ to disk (shouldWriteToDisk=%d, success=%d, data.length=%lu, error=%@)", buf, 0x36u);
    }
  }
  [*(id *)(a1 + 64) lock];
  [*(id *)(a1 + 64) unlockWithCondition:1];
  [*(id *)(a1 + 40) _fetchCompletedForAttachment:*(void *)(a1 + 56) error:a3];
  return [*(id *)(a1 + 72) cancel];
}

void __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke_3(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]])
  {
    v2 = (void *)a1[6];
    uint64_t v3 = a1[7];
    [v2 writeToDiskWithData:v3];
  }
  else
  {
    uint64_t v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[5];
      uint64_t v5 = a1[6];
      int v7 = 134218242;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1CFCFE000, v4, OS_LOG_TYPE_DEFAULT, "#Attachments not writing attachment %p %@ to disk (no-existing-attachment-dictionary)", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_callProgressBlockForAttachmentURL:(id)a3 withBytes:(unint64_t)a4 expectedSize:(unint64_t)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3052000000;
  v37 = __Block_byref_object_copy_;
  arrayAccessQueue = self->super._arrayAccessQueue;
  v38 = __Block_byref_object_dispose_;
  uint64_t v39 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke;
  block[3] = &unk_1E6866F98;
  block[5] = a3;
  block[6] = &v34;
  block[4] = self;
  dispatch_sync(arrayAccessQueue, block);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v11 = (void *)v35[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v46 count:16];
  if (v12)
  {
    uint64_t v14 = *(void *)v30;
    *(void *)&long long v13 = 138412802;
    long long v22 = v13;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "lastProgressBytes", v22);
        [v16 lastProgressTime];
        if (v9 - v18 >= 0.0333333333 || (double)a5 * 0.02 <= (double)(uint64_t)(a4 - v17))
        {
          v20 = MFLogGeneral();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v21 = [v16 fileName];
            *(_DWORD *)buf = v22;
            uint64_t v41 = v21;
            __int16 v42 = 2048;
            unint64_t v43 = a4;
            __int16 v44 = 2048;
            unint64_t v45 = a5;
            _os_log_debug_impl(&dword_1CFCFE000, v20, OS_LOG_TYPE_DEBUG, "Calling progress block for %@.  %lu/%lu", buf, 0x20u);
          }
          [v16 setLastProgressBytes:a4];
          [v16 setLastProgressTime:v9];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          __int16 v25 = __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke_32;
          int v26 = &unk_1E6866FC0;
          __int16 v27 = v16;
          unint64_t v28 = a4;
          if ([v16 wantsCompletionBlockOffMainThread]) {
            v25((uint64_t)v24);
          }
          else {
            dispatch_async(MEMORY[0x1E4F14428], v24);
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v46 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(&v34, 8);
}

uint64_t __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke(void *a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]), "objectForKeyedSubscript:", @"MFAttachmentAttachmentKey"), "copy");
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

uint64_t __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke_32(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProgressWithCurrentBytes:*(void *)(a1 + 40)];
}

- (void)_fetchInvocationCallUsingBlock:(id)a3
{
}

- (id)_composeAttachmentDataProviderForContext:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:objc_msgSend(NSString, "stringWithFormat:", @"x-attach-compose://%@", a3)];
  providers = self->super._providers;
  uint64_t v6 = [v4 absoluteString];
  return (id)[(NSMutableDictionary *)providers valueForKey:v6];
}

- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  if ((unint64_t)[a3 length] < 0x834
    && +[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:a3])
  {
    id v13 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:a3];
    a6 = (id)[v13 contentID];
    if (!a7) {
      goto LABEL_4;
    }
  }
  else
  {
    id v13 = 0;
    if (!a7)
    {
LABEL_4:
      uint64_t v14 = MFLogGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:]();
      }
      return 0;
    }
  }
  if (![a3 length])
  {
    double v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:]();
    }
    return 0;
  }
  if (!a6) {
    a6 = (id)objc_msgSend(NSString, "mf_messageIDStringWithDomainHint:", 0);
  }
  if ([a6 hasPrefix:@"<"]) {
    a6 = (id)objc_msgSend(a6, "substringWithRange:", 1, objc_msgSend(a6, "length") - 2);
  }
  if ([a5 length]) {
    id v15 = a5;
  }
  else {
    id v15 = a6;
  }
  id v16 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:objc_msgSend(NSString, "stringWithFormat:", @"x-attach-compose://%@", a7)];
  uint64_t v17 = (void *)-[NSMutableDictionary valueForKey:](self->super._providers, "valueForKey:", [v16 absoluteString]);
  if (v17) {
    [v17 addData:a3 forContentID:a6];
  }
  else {
    [(MFAttachmentManager *)self addProvider:[[MFComposeAttachmentDataProvider alloc] initWithData:a3 forContentID:a6] forBaseURL:v16];
  }
  uint64_t v19 = -[MFAttachment initWithURL:attachmentManager:]([MFAttachment alloc], "initWithURL:attachmentManager:", [v16 URLByAppendingPathComponent:a6], self);
  [(MFAttachment *)v19 setFileName:v15];
  [(MFAttachment *)v19 setContentID:a6];
  if (a4)
  {
    uint64_t v21 = v19;
    id v22 = a4;
  }
  else
  {
    uint64_t v23 = objc_msgSend((id)objc_msgSend(v15, "pathExtension"), "lowercaseString");
    id v22 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F290B0], "sharedMappings"), "MIMETypeForExtension:", v23);
    uint64_t v21 = v19;
  }
  [(MFAttachment *)v21 setMimeType:v22];
  if (v13)
  {
    [(MFAttachment *)v19 setPlaceholder:v13];
    [(MFAttachment *)v19 setIsPlaceholder:1];
  }
  [(MFAttachmentManager *)self setContentID:a6 forAttachment:v19];
  -[MFAttachment setDecodedFileSize:](v19, "setDecodedFileSize:", [a3 length]);
  if (v19)
  {
    if (!self->_composeAttachmentURLs) {
      self->_composeAttachmentURLs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    uint64_t v24 = [(NSURL *)[(MFAttachment *)v19 url] absoluteString];
    if (([(NSMutableArray *)self->_composeAttachmentURLs containsObject:v24] & 1) == 0) {
      [(NSMutableArray *)self->_composeAttachmentURLs addObject:v24];
    }
  }
  return v19;
}

- (void)loadAttachmentURL:(id)a3 forContextID:(id)a4
{
  id v6 = [(MFAttachmentManager *)self attachmentForCID:a3];
  uint64_t v7 = [v6 fetchLocalData];
  uint64_t v8 = [v6 mimeType];
  uint64_t v9 = [v6 fileName];
  uint64_t v10 = [v6 contentID];
  [(MFAttachmentComposeManager *)self attachmentForData:v7 mimeType:v8 fileName:v9 contentID:v10 context:a4];
}

- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4
{
  id v6 = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", [a3 url], 0);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    objc_msgSend(v6, "removeDataForAttachment:", objc_msgSend(a3, "url"));
    objc_msgSend(v6, "addData:forContentID:", a4, objc_msgSend(a3, "contentID"));
  }
  return isKindOfClass & 1;
}

- (void)removeAttachmentForURL:(id)a3
{
  uint64_t v5 = -[NSMutableArray indexOfObject:](self->_composeAttachmentURLs, "indexOfObject:", [a3 absoluteString]);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_composeAttachmentURLs removeObjectAtIndex:v5];
    id v6 = [(MFAttachmentManager *)self _dataProviderForAttachmentURL:a3 error:0];
    [v6 removeDataForAttachment:a3];
  }
}

- (void)recordPasteboardAttachmentsForURLs:(id)a3 forContextID:(id)a4
{
  id v5 = [(MFAttachmentComposeManager *)self _composeAttachmentDataProviderForContext:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 recordPasteboardDataForAttachments:a3];
  }
}

- (void)recordUndoAttachmentsForURLs:(id)a3 forContextID:(id)a4
{
  id v5 = [(MFAttachmentComposeManager *)self _composeAttachmentDataProviderForContext:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 recordUndoDataForAttachments:a3];
  }
}

- (void)attachmentForData:mimeType:fileName:contentID:context:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1CFCFE000, v0, v1, "#Attachments ContextID was nil for filename:%@ contentID:%@");
}

- (void)attachmentForData:mimeType:fileName:contentID:context:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1CFCFE000, v0, v1, "#Attachments Data was nil for filename:%@ contentID:%@");
}

@end