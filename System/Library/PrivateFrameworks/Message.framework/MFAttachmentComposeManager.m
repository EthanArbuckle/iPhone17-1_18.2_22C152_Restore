@interface MFAttachmentComposeManager
- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4;
- (MFAttachmentComposeManager)init;
- (id)_composeAttachmentDataProviderForContext:(id)a3;
- (id)_contentIDWithoutBracket:(id)a3;
- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 request:(id)a5 syncLock:(id *)a6;
- (id)_providerForURL:(id)a3;
- (id)_queueForAttachment:(id)a3;
- (id)attachmentForCID:(id)a3;
- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7;
- (id)attachmentForItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7;
- (id)attachmentsForContext:(id)a3;
- (void)_callProgressBlockForAttachmentURL:(id)a3 withBytes:(int64_t)a4 expectedSize:(int64_t)a5;
- (void)_fetchInvocationCallUsingBlock:(id)a3;
- (void)loadAttachmentURL:(id)a3 forContextID:(id)a4;
- (void)removeAttachmentForURL:(id)a3;
@end

@implementation MFAttachmentComposeManager

- (MFAttachmentComposeManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFAttachmentComposeManager;
  v2 = [(MFAttachmentManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mail.attachmentComposeManagerAttachmentURLArray", 0);
    composeAttachmentsQueue = v2->_composeAttachmentsQueue;
    v2->_composeAttachmentsQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)_queueForAttachment:(id)a3
{
  id v4 = a3;
  if (([v4 isDataAvailableLocally] & 1) == 0)
  {
    v5 = [v4 url];
    objc_super v6 = [(MFAttachmentManager *)self _dataProviderForAttachmentURL:v5 error:0];

    v7 = [v6 messageForAttachment:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [v7 mailbox];
      v9 = [v8 attachmentDownloadQueue];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  defaultDownloadQueue = self->_defaultDownloadQueue;
  if (!defaultDownloadQueue)
  {
    v11 = objc_alloc_init(MFInvocationQueue);
    v12 = self->_defaultDownloadQueue;
    self->_defaultDownloadQueue = v11;

    defaultDownloadQueue = self->_defaultDownloadQueue;
  }
  v9 = defaultDownloadQueue;
LABEL_9:

  return v9;
}

- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 request:(id)a5 syncLock:(id *)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v37 = a4;
  v41 = v9;
  id v42 = a5;
  v10 = [v9 url];
  v39 = v10;
  v43 = [(NSMutableDictionary *)self->super._attachments objectForKeyedSubscript:v10];
  if (v43)
  {
    v11 = EDAttachmentsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v53 = v9;
      __int16 v54 = 2112;
      v55 = v10;
      _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "Attachment %p with url %@ already exists in the dictionary of attachment compose manager", buf, 0x16u);
    }

    v38 = [v9 customConsumer];
    if (v38)
    {
      v12 = [v43 objectForKeyedSubscript:@"MFAttachmentCollectionFilterKey"];
      [v12 addDataConsumer:v38];
    }
    id v13 = [v43 objectForKeyedSubscript:@"MFAttachmentAttachmentKey"];
    [v13 addObject:v42];
    id v14 = [v43 objectForKeyedSubscript:@"MFAttachmentPrimaryConsumerKey"];
    id v15 = [v43 objectForKeyedSubscript:@"MFAttachmentSyncLockKey"];
  }
  else
  {
    v38 = [v9 path];
    if (v38
      && ([v9 isContainedInRFC822] & 1) == 0
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = [v16 isReadableFileAtPath:v38],
          v16,
          (v17 & 1) != 0))
    {
      v18 = (Class *)0x1E4F735A8;
    }
    else
    {
      v18 = (Class *)0x1E4F734A8;
    }
    id v14 = objc_alloc_init(*v18);
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F73548]) initWithMainConsumer:v14];
    v35 = (void *)v19;
    v36 = v20;
    v21 = [v9 customConsumer];

    if (v21)
    {
      v22 = [v9 customConsumer];
      [v20 addDataConsumer:v22];
    }
    v23 = [MEMORY[0x1E4F1CA60] dictionary];
    v24 = [MEMORY[0x1E4F1CA48] arrayWithObject:v42];
    [v23 setObject:v24 forKeyedSubscript:@"MFAttachmentAttachmentKey"];

    [v23 setObject:v14 forKeyedSubscript:@"MFAttachmentPrimaryConsumerKey"];
    [v23 setObject:v20 forKeyedSubscript:@"MFAttachmentCollectionFilterKey"];
    [v23 setObject:v19 forKeyedSubscript:@"MFAttachmentSyncLockKey"];
    v25 = EDAttachmentsLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(v9, "ef_publicDescription");
      *(_DWORD *)buf = 138543874;
      id v53 = v26;
      __int16 v54 = 2112;
      v55 = v10;
      __int16 v56 = 2114;
      id v57 = v14;
      _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_DEFAULT, "requesting download of attachment %{public}@ with URL %@ (primaryConsumer: %{public}@)", buf, 0x20u);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke;
    aBlock[3] = &unk_1E5D3DCE0;
    id v45 = v42;
    v46 = self;
    id v27 = v10;
    id v47 = v27;
    id v48 = v37;
    id v28 = v9;
    id v49 = v28;
    id v13 = v36;
    id v50 = v13;
    id v15 = v35;
    id v51 = v15;
    v29 = _Block_copy(aBlock);
    v30 = _Block_copy(v29);
    v31 = +[MFMonitoredInvocation invocationWithSelector:sel__fetchInvocationCallUsingBlock_ target:self object:v30 taskName:@"FetchDataForURL" priority:4 canBeCancelled:1];

    [v31 setPowerAssertionId:@"com.apple.message.MFAttachmentComposeManager"];
    [v31 retainArguments];
    v32 = [v31 monitor];
    [v23 setObject:v32 forKeyedSubscript:@"MFAttachmentMonitorKey"];

    [(NSMutableDictionary *)self->super._attachments setObject:v23 forKeyedSubscript:v27];
    v33 = [(MFAttachmentComposeManager *)self _queueForAttachment:v28];
    [v33 addInvocation:v31];
  }
  if (a6) {
    *a6 = v15;
  }

  return v14;
}

void __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) downloadProgress];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_2;
  v21[3] = &unk_1E5D3DC90;
  dispatch_queue_t v3 = *(void **)(a1 + 48);
  v21[4] = *(void *)(a1 + 40);
  id v22 = v3;
  id v4 = v2;
  id v23 = v4;
  v5 = objc_msgSend(v4, "ef_observeKeyPath:options:usingBlock:", @"fractionCompleted", 1, v21);
  objc_super v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  v8 = *(void **)(a1 + 72);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_3;
  v13[3] = &unk_1E5D3DCB8;
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  id v14 = v9;
  uint64_t v15 = v10;
  id v16 = v11;
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 80);
  id v20 = v5;
  id v12 = v5;
  [v6 fetchDataForAttachment:v7 consumer:v9 progress:v4 completion:v13];
}

uint64_t __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) completedUnitCount];
  uint64_t v5 = [*(id *)(a1 + 48) totalUnitCount];
  return [v2 _callProgressBlockForAttachmentURL:v3 withBytes:v4 expectedSize:v5];
}

void __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_3(id *a1, int a2, void *a3, int a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [a1[4] data];
  id v9 = v8;
  if (a2
    && a4
    && (uint64_t v10 = [v8 length], !v7)
    && v10
    && +[MFMailMessageLibrary canUsePersistence])
  {
    id v11 = a1[5];
    id v12 = *((void *)v11 + 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4;
    block[3] = &unk_1E5D3CF78;
    block[4] = v11;
    id v19 = a1[6];
    id v20 = a1[7];
    id v21 = v9;
    id v22 = a1[8];
    dispatch_sync(v12, block);
  }
  else
  {
    id v13 = EDAttachmentsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v16 = a1[6];
      id v17 = a1[7];
      *(_DWORD *)buf = 134219266;
      id v24 = v17;
      __int16 v25 = 2112;
      id v26 = v16;
      __int16 v27 = 1024;
      int v28 = a4;
      __int16 v29 = 1024;
      int v30 = a2;
      __int16 v31 = 2048;
      uint64_t v32 = [v9 length];
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_error_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_ERROR, "not writing attachment %p %@ to disk (shouldWriteToDisk=%d, success=%d, data.length=%lu, error=%@)", buf, 0x36u);
    }
  }
  [a1[9] lock];
  [a1[9] unlockWithCondition:1];
  uint64_t v14 = [v9 length];
  uint64_t v15 = v7;
  if (!v7 && !v14)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_connectionInterruptedError");
  }
  [a1[5] _fetchCompletedForAttachment:a1[7] error:v15];
  [a1[10] cancel];
}

void __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = _os_activity_create(&dword_1A7EFF000, "Write attachment to database", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v2, &state);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 48) fileName];

    if (v4)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F60D68]) initRegularFileWithContents:*(void *)(a1 + 56)];
      objc_super v6 = [*(id *)(a1 + 48) fileName];
      [v5 setPreferredFilename:v6];

      id v7 = [v5 fileAttributes];
      uint64_t v32 = (void *)[v7 mutableCopy];

      v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "length"));
      [v32 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28390]];

      [v5 setFileAttributes:v32];
      id v9 = [*(id *)(a1 + 48) mimePartNumber];
      uint64_t v10 = v9;
      if (v9)
      {
        id v31 = v9;
      }
      else
      {
        id v12 = [*(id *)(a1 + 48) part];
        id v31 = [v12 partNumber];
      }
      id v13 = [*(id *)(a1 + 64) messageForAttachment:*(void *)(a1 + 48)];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_13;
      }
      id v30 = v13;
      id v14 = objc_alloc(MEMORY[0x1E4F60B10]);
      uint64_t v15 = [v30 globalMessageID];
      id v16 = [*(id *)(a1 + 48) fileName];
      id v17 = [*(id *)(a1 + 48) mailDropMetadata];
      id v18 = [v17 directUrl];
      id v19 = (void *)[v14 initWithGlobalMessageID:v15 name:v16 mimePart:v31 attachmentID:0 remoteURL:v18];

      id v20 = (void *)MEMORY[0x1E4F1CB10];
      id v21 = +[MFMailMessageLibrary defaultInstance];
      uint64_t v22 = [v30 account];
      id v23 = [v21 messageBasePathForAccount:v22];
      id v24 = [v20 fileURLWithPath:v23 isDirectory:1];

      __int16 v25 = [*(id *)(a1 + 32) persistenceManager];
      uint64_t v33 = 0;
      LOBYTE(v22) = [v25 persistAttachment:v5 attachmentMetadata:v19 basePath:v24 error:&v33];

      if (v22)
      {
        [*(id *)(a1 + 48) updatePath];
        id v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v26 postNotificationName:@"LibraryMessageAttachmentDataBecameAvailableNotification" object:v30];

        __int16 v27 = @"Success";
      }
      else
      {
LABEL_13:
        __int16 v27 = @"Failed";
      }
      int v28 = EDAttachmentsLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
        *(_DWORD *)buf = 138412546;
        v36 = v27;
        __int16 v37 = 2114;
        v38 = v29;
        _os_log_impl(&dword_1A7EFF000, v28, OS_LOG_TYPE_DEFAULT, "%@ attachment %{public}@ write to persistence", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v5 = EDAttachmentsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v11 = objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
        __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4_cold_2(v11, buf, v5);
      }
    }
  }
  else
  {
    uint64_t v5 = EDAttachmentsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4_cold_1(a1, (void *)(a1 + 40), v5);
    }
  }

  os_activity_scope_leave(&state);
}

- (void)_callProgressBlockForAttachmentURL:(id)a3 withBytes:(int64_t)a4 expectedSize:(int64_t)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", v7);
  double v9 = v8;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__7;
  __int16 v37 = __Block_byref_object_dispose__7;
  id v38 = 0;
  arrayAccessQueue = self->super._arrayAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke;
  block[3] = &unk_1E5D3DD08;
  uint64_t v32 = &v33;
  block[4] = self;
  id v23 = v7;
  id v31 = v23;
  dispatch_sync(arrayAccessQueue, block);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = (id)v34[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v16 = [v15 lastProgressBytes];
        [v15 lastProgressTime];
        if (v9 - v17 >= 0.0333333333 || (double)a5 * 0.02 <= (double)(a4 - v16))
        {
          id v19 = MFLogGeneral();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            id v21 = [v15 attachment];
            uint64_t v22 = [v21 fileName];
            *(_DWORD *)buf = 138412802;
            v40 = v22;
            __int16 v41 = 2048;
            int64_t v42 = a4;
            __int16 v43 = 2048;
            int64_t v44 = a5;
            _os_log_debug_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_DEBUG, "Calling progress block for %@.  %lu/%lu", buf, 0x20u);
          }
          [v15 setLastProgressBytes:a4];
          [v15 setLastProgressTime:v9];
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke_48;
          aBlock[3] = &unk_1E5D3C388;
          void aBlock[4] = v15;
          aBlock[5] = a4;
          id v20 = (void (**)(void))_Block_copy(aBlock);
          if ([v15 wantsCompletionBlockOffMainThread]) {
            v20[2](v20);
          }
          else {
            dispatch_async(MEMORY[0x1E4F14428], v20);
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v45 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(&v33, 8);
}

void __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke(void *a1)
{
  id v6 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  v2 = [v6 objectForKeyedSubscript:@"MFAttachmentAttachmentKey"];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke_48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) downloadProgress];
  [v2 setCompletedUnitCount:v1];
}

- (void)_fetchInvocationCallUsingBlock:(id)a3
{
}

- (id)attachmentsForContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__7;
  composeAttachmentsQueue = self->_composeAttachmentsQueue;
  uint64_t v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MFAttachmentComposeManager_attachmentsForContext___block_invoke;
  block[3] = &unk_1E5D3DD08;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(composeAttachmentsQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __52__MFAttachmentComposeManager_attachmentsForContext___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a1 + 4;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1[4] + 80), "count"));
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)(*v2 + 80);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "rangeOfString:", a1[5], (void)v14) != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v11 = (void *)a1[4];
          uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
          uint64_t v13 = [v11 attachmentForURL:v12 error:0];

          if (v13) {
            [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v13];
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)attachmentForCID:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  [v4 setQuery:0];
  uint64_t v5 = [v4 path];
  id v6 = [(MFAttachmentManager *)self attachmentForContentID:v5 preferredSchemes:&unk_1EFF50058];

  return v6;
}

- (id)_providerForURL:(id)a3
{
  id v4 = a3;
  p_providersLock = &self->super._providersLock;
  os_unfair_lock_lock(&self->super._providersLock);
  providers = self->super._providers;
  uint64_t v7 = [v4 absoluteString];
  uint64_t v8 = [(NSMutableDictionary *)providers objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_providersLock);
  return v8;
}

- (id)_composeAttachmentDataProviderForContext:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = [NSString stringWithFormat:@"x-attach-compose://%@", a3];
  id v6 = [v4 URLWithString:v5];

  uint64_t v7 = [(MFAttachmentComposeManager *)self _providerForURL:v6];

  return v7;
}

- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v54 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ((unint64_t)[v12 length] < 0x834
    && +[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:v12])
  {
    long long v16 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:v12];
    long long v17 = v16;
    if (!v14)
    {
      id v14 = [v16 contentID];
    }
    id v18 = v17;
    if (!v15) {
      goto LABEL_6;
    }
  }
  else
  {
    id v18 = 0;
    if (!v15)
    {
LABEL_6:
      uint64_t v19 = MFLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:]();
      }
LABEL_16:
      __int16 v25 = 0;
      goto LABEL_39;
    }
  }
  if (![v12 length])
  {
    uint64_t v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:]();
    }
    goto LABEL_16;
  }
  id v20 = [(MFAttachmentComposeManager *)self _contentIDWithoutBracket:v14];

  if (![v13 length])
  {
    id v21 = v20;

    id v13 = v21;
  }
  uint64_t v22 = (void *)MEMORY[0x1E4F1CB10];
  id v23 = [NSString stringWithFormat:@"x-attach-compose://%@", v15];
  uint64_t v19 = [v22 URLWithString:v23];

  id v24 = [(MFAttachmentComposeManager *)self _providerForURL:v19];
  if (v24)
  {
    id v51 = v24;
    [(MFComposeAttachmentDataProvider *)v24 addData:v12 forContentID:v20];
  }
  else
  {
    id v51 = [[MFComposeAttachmentDataProvider alloc] initWithData:v12 forContentID:v20];
    [(MFAttachmentManager *)self addProvider:v51 forBaseURL:v19];
  }
  long long v26 = [v13 pathExtension];
  long long v27 = [v26 lowercaseString];

  id v50 = v27;
  if ([v27 isEqualToString:@"zip"])
  {
    v52 = [v13 stringByDeletingPathExtension];
    long long v28 = [v52 pathExtension];
    long long v29 = v28;
    if (v28 && [v28 length])
    {
      id v49 = objc_msgSend(v29, "ef_declaredUTTypeFromExtension");
      id v30 = [v49 identifier];
      int v31 = objc_msgSend(v30, "ef_conformsToIWorkUTType");

      if (v31)
      {
        id v32 = v52;

        uint64_t v33 = EDAttachmentsLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          id v34 = [v49 identifier];
          -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:](v34, buf, v33);
        }
      }
      else
      {
        id v32 = v13;
      }
    }
    else
    {
      id v32 = v13;
    }

    id v13 = v32;
  }
  id v53 = objc_msgSend(v13, "ef_filenameWithExtensionForMimeType:", v54);

  uint64_t v35 = [MFAttachment alloc];
  v36 = [v19 URLByAppendingPathComponent:v20];
  __int16 v25 = [(MFAttachment *)v35 initWithURL:v36 attachmentManager:self];

  __int16 v37 = objc_msgSend(v53, "ef_sanitizedFileName");
  [(MFAttachment *)v25 setFileName:v37];

  [(MFAttachment *)v25 setContentID:v20];
  if (v54)
  {
    -[MFAttachment setMimeType:](v25, "setMimeType:");
  }
  else
  {
    id v38 = [v53 pathExtension];
    uint64_t v39 = [v38 lowercaseString];

    v40 = [MEMORY[0x1E4F290B0] sharedMappings];
    __int16 v41 = [v40 MIMETypeForExtension:v39];

    [(MFAttachment *)v25 setMimeType:v41];
  }
  if (v18)
  {
    [(MFAttachment *)v25 setPlaceholder:v18];
    [(MFAttachment *)v25 setIsPlaceholder:1];
  }
  [(MFAttachmentManager *)self setContentID:v20 forAttachment:v25];
  -[MFAttachment setDecodedFileSize:](v25, "setDecodedFileSize:", [v12 length]);
  if (v25)
  {
    if (!self->_composeAttachmentURLs)
    {
      int64_t v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      composeAttachmentURLs = self->_composeAttachmentURLs;
      self->_composeAttachmentURLs = v42;
    }
    int64_t v44 = [(MFAttachment *)v25 url];
    id v45 = [v44 absoluteString];

    composeAttachmentsQueue = self->_composeAttachmentsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__MFAttachmentComposeManager_attachmentForData_mimeType_fileName_contentID_context___block_invoke;
    block[3] = &unk_1E5D3B6E0;
    block[4] = self;
    id v56 = v45;
    id v47 = v45;
    dispatch_async(composeAttachmentsQueue, block);
  }
  id v13 = v53;
  id v14 = v20;
LABEL_39:

  return v25;
}

uint64_t __84__MFAttachmentComposeManager_attachmentForData_mimeType_fileName_contentID_context___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 80);
    return [v4 addObject:v3];
  }
  return result;
}

- (id)attachmentForItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  id v36 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13 && ![0 length])
  {
    uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"MFAttachmentComposeManager.m", 392, @"Invalid parameter not satisfying: %@", @"mimeType || mimeType.length > 0" object file lineNumber description];
  }
  long long v17 = [(MFAttachmentComposeManager *)self _contentIDWithoutBracket:v15];

  if (![v14 length])
  {
    id v18 = v17;

    id v14 = v18;
  }
  uint64_t v19 = objc_msgSend(v14, "ef_filenameWithExtensionForMimeType:", v13);

  id v20 = (void *)MEMORY[0x1E4F1CB10];
  id v21 = [NSString stringWithFormat:@"x-attach-compose://%@", v16];
  uint64_t v22 = [v20 URLWithString:v21];

  id v23 = [(MFAttachmentComposeManager *)self _providerForURL:v22];
  id v24 = v23;
  if (v23)
  {
    [(MFComposeAttachmentDataProvider *)v23 addDataItemProvider:v36 forContentID:v17];
  }
  else
  {
    id v24 = [[MFComposeAttachmentDataProvider alloc] initWithAttachmentDataItemProvider:v36 forContentID:v17];
    [(MFAttachmentManager *)self addProvider:v24 forBaseURL:v22];
  }
  __int16 v25 = [MFAttachment alloc];
  long long v26 = [v22 URLByAppendingPathComponent:v17];
  long long v27 = [(MFAttachment *)v25 initWithURL:v26 attachmentManager:self];

  [(MFAttachment *)v27 setFileName:v19];
  [(MFAttachment *)v27 setContentID:v17];
  [(MFAttachment *)v27 setMimeType:v13];
  [(MFAttachmentManager *)self setContentID:v17 forAttachment:v27];
  if (v27)
  {
    if (!self->_composeAttachmentURLs)
    {
      long long v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      composeAttachmentURLs = self->_composeAttachmentURLs;
      self->_composeAttachmentURLs = v28;
    }
    id v30 = [(MFAttachment *)v27 url];
    int v31 = [v30 absoluteString];

    composeAttachmentsQueue = self->_composeAttachmentsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__MFAttachmentComposeManager_attachmentForItemProvider_mimeType_fileName_contentID_context___block_invoke;
    block[3] = &unk_1E5D3B6E0;
    block[4] = self;
    id v38 = v31;
    id v33 = v31;
    dispatch_async(composeAttachmentsQueue, block);
  }
  return v27;
}

uint64_t __92__MFAttachmentComposeManager_attachmentForItemProvider_mimeType_fileName_contentID_context___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 80);
    return [v4 addObject:v3];
  }
  return result;
}

- (id)_contentIDWithoutBracket:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    objc_msgSend(NSString, "mf_messageIDStringWithDomainHint:", 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([v3 hasPrefix:@"<"])
  {
    uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 1, objc_msgSend(v3, "length") - 2);

    id v3 = (id)v4;
  }
  return v3;
}

- (void)loadAttachmentURL:(id)a3 forContextID:(id)a4
{
  id v12 = a4;
  id v6 = [(MFAttachmentComposeManager *)self attachmentForCID:a3];
  uint64_t v7 = [v6 fetchLocalData];
  uint64_t v8 = [v6 mimeType];
  double v9 = [v6 fileName];
  id v10 = [v6 contentID];
  id v11 = [(MFAttachmentComposeManager *)self attachmentForData:v7 mimeType:v8 fileName:v9 contentID:v10 context:v12];
}

- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 url];
  double v9 = [(MFAttachmentManager *)self _dataProviderForAttachmentURL:v8 error:0];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v11 = v9;
    id v12 = [v6 url];
    [v11 removeDataForAttachment:v12];

    id v13 = [v6 contentID];
    [v11 addData:v7 forContentID:v13];
  }
  return isKindOfClass & 1;
}

- (void)removeAttachmentForURL:(id)a3
{
  id v4 = a3;
  composeAttachmentsQueue = self->_composeAttachmentsQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__MFAttachmentComposeManager_removeAttachmentForURL___block_invoke;
  v7[3] = &unk_1E5D3B6E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(composeAttachmentsQueue, v7);
}

void __53__MFAttachmentComposeManager_removeAttachmentForURL___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 80);
  id v4 = [*(id *)(a1 + 40) absoluteString];
  uint64_t v3 = objc_msgSend(v2, "indexOfObject:");

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(*(void *)(a1 + 32) + 80) removeObjectAtIndex:v3];
    id v5 = [*(id *)(a1 + 32) _dataProviderForAttachmentURL:*(void *)(a1 + 40) error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 removeDataForAttachment:*(void *)(a1 + 40)];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeAttachmentsQueue, 0);
  objc_storeStrong((id *)&self->_composeAttachmentURLs, 0);
  objc_storeStrong((id *)&self->_defaultDownloadQueue, 0);
}

void __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = *(void *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_3(&dword_1A7EFF000, (uint64_t)a2, a3, "not writing attachment %p %@ to disk (no-existing-attachment-dictionary)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "not writing attachment. Missing filename: %{public}@", buf, 0xCu);
}

- (void)attachmentForData:mimeType:fileName:contentID:context:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_3(&dword_1A7EFF000, v0, v1, "#Attachments ContextID was nil for filename:%@ contentID:%@");
}

- (void)attachmentForData:mimeType:fileName:contentID:context:.cold.2()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_3(&dword_1A7EFF000, v0, v1, "#Attachments Data was nil for filename:%@ contentID:%@");
}

- (void)attachmentForData:(os_log_t)log mimeType:fileName:contentID:context:.cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "Stripping .zip extension from attachment with type: %{public}@", buf, 0xCu);
}

@end