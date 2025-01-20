@interface RCSSavedRecordingService
+ (NSPersistentHistoryToken)changeToken;
+ (id)sharedService;
+ (void)setChangeToken:(id)a3;
- (BOOL)closeAudioFile:(id)a3 error:(id *)a4;
- (BOOL)disableOrphanedFragmentCleanupForCompositionAVURL:(id)a3 error:(id *)a4;
- (BOOL)endAccessSessionWithToken:(id)a3 error:(id *)a4;
- (BOOL)firstImportIsComplete;
- (NSSet)compositionAVURLsBeingExported;
- (NSSet)compositionAVURLsBeingModified;
- (OS_dispatch_queue)completionQueue;
- (RCSSavedRecordingService)init;
- (id)_onQueueAddPendingServiceMessageReplyBlockInvalidationHandler:(id)a3;
- (id)encryptedAccountStatus;
- (id)encryptedFieldsStatus;
- (id)observeFinalizingRecordings:(id)a3;
- (id)openAudioFile:(id)a3 settings:(id)a4 metadata:(id)a5 error:(id *)a6;
- (id)prepareToCaptureToCompositionAVURL:(id)a3 error:(id *)a4;
- (id)prepareToExportCompositionAVURL:(id)a3 error:(id *)a4;
- (id)prepareToPreviewCompositionAVURL:(id)a3 error:(id *)a4;
- (id)prepareToTrimCompositionAVURL:(id)a3 error:(id *)a4;
- (id)serviceProxy;
- (id)synchronousServiceProxy;
- (id)valueForServiceKey:(id)a3;
- (void)__fetchAllAccessTokens:(id)a3;
- (void)_fetchAllAccessTokens:(id)a3;
- (void)_handleCompositionAVURLsBeingExportedDidChange;
- (void)_handleCompositionAVURLsBeingModifiedDidChange;
- (void)_invalidatePendingSynchronousCompletionHandlersWithError:(id)a3;
- (void)_onQueueCloseServiceConnection;
- (void)_onQueueInvalidatePendingCompletionHandlerWithToken:(id)a3 withError:(id)a4;
- (void)_onQueueInvalidatePendingCompletionHandlersWithError:(id)a3;
- (void)_onQueueRemovePendingServiceMessageReplyBlockInvalidationHandlerForToken:(id)a3;
- (void)_sendServiceMessage:(SEL)a3 accessRequestReplyBlock:(id)a4 messagingBlock:(id)a5;
- (void)_sendServiceMessage:(SEL)a3 connectionFailureReplyInfo:(id)a4 infoAndErrorReplyHandler:(id)a5 messagingBlock:(id)a6;
- (void)_sendServiceMessage:(SEL)a3 connectionFailureReplyInfo:(id)a4 infoAndErrorReplyHandler:(id)a5 withServiceProxy:(id)a6 messagingBlock:(id)a7;
- (void)_sendServiceMessage:(SEL)a3 importRequestReplyBlock:(id)a4 messagingBlock:(id)a5;
- (void)_sendServiceMessage:(SEL)a3 withBasicReplyBlock:(id)a4 messagingBlock:(id)a5;
- (void)_sendServiceMessage:(SEL)a3 withBasicReplyBlock:(id)a4 withServiceProxy:(id)a5 messagingBlock:(id)a6;
- (void)_sendSynchronousServiceMessage:(SEL)a3 accessRequestReplyBlock:(id)a4 messagingBlock:(id)a5;
- (void)_sendSynchronousServiceMessage:(SEL)a3 connectionFailureReplyInfo:(id)a4 infoAndErrorReplyHandler:(id)a5 messagingBlock:(id)a6;
- (void)_sendSynchronousServiceMessage:(SEL)a3 withBasicReplyBlock:(id)a4 messagingBlock:(id)a5;
- (void)_valueForServiceKey:(id)a3 synchronous:(BOOL)a4 completion:(id)a5;
- (void)addInterruptionObserver:(id)a3;
- (void)checkRecordingAvailability:(id)a3;
- (void)clearAndReloadSearchMetadataWithCompletionBlock:(id)a3;
- (void)closeAudioFile:(id)a3 completionBlock:(id)a4;
- (void)closeServiceConnection;
- (void)dealloc;
- (void)disableOrphanedFragmentCleanupForCompositionAVURL:(id)a3 completionBlock:(id)a4;
- (void)enableCloudRecordingsWithCompletionBlock:(id)a3;
- (void)enableOrphanHandlingWithCompletionBlock:(id)a3;
- (void)enableOrphanedFragmentCleanupForCompositionAVURL:(id)a3;
- (void)endAccessSessionWithToken:(id)a3 completionBlock:(id)a4;
- (void)exportRecordingsToCloud:(id)a3;
- (void)expungeRecordingsFromCloud:(id)a3;
- (void)fetchCompositionAVURLsBeingExported:(id)a3;
- (void)fetchCompositionAVURLsBeingModified:(id)a3;
- (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 userInfo:(id)a6 importCompletionBlock:(id)a7;
- (void)importRecordingsFromCloud:(id)a3;
- (void)openAudioFile:(id)a3 settings:(id)a4 metadata:(id)a5 accessRequestHandler:(id)a6;
- (void)openServiceConnection;
- (void)prepareToCaptureToCompositionAVURL:(id)a3 accessRequestHandler:(id)a4;
- (void)prepareToExportCompositionAVURL:(id)a3 accessRequestHandler:(id)a4;
- (void)prepareToPreviewCompositionAVURL:(id)a3 accessRequestHandler:(id)a4;
- (void)prepareToTrimCompositionAVURL:(id)a3 accessRequestHandler:(id)a4;
- (void)reloadExistingSearchMetadataWithCompletionBlock:(id)a3;
- (void)removeAllUserDataWithCompletion:(id)a3;
- (void)removeInterruptionObserver:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setCompositionAVURLsBeingExported:(id)a3;
- (void)setCompositionAVURLsBeingModified:(id)a3;
- (void)updateSearchMetadataWithRecordingURIsToInsert:(id)a3 recordingURIsToUpdate:(id)a4 recordingURIsToDelete:(id)a5 completionBlock:(id)a6;
- (void)valueForServiceKey:(id)a3 completion:(id)a4;
- (void)writeAudioFile:(id)a3 buffer:(id)a4 completionBlock:(id)a5;
@end

@implementation RCSSavedRecordingService

- (void)_onQueueRemovePendingServiceMessageReplyBlockInvalidationHandlerForToken:(id)a3
{
}

uint64_t __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_2_193(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_192(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueRemovePendingServiceMessageReplyBlockInvalidationHandlerForToken:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  [*(id *)(a1 + 32) setCompositionAVURLsBeingModified:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

- (void)setCompositionAVURLsBeingModified:(id)a3
{
  id v6 = a3;
  if ((-[NSSet isEqual:](self->_compositionAVURLsBeingModified, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_compositionAVURLsBeingModified, a3);
    +[RCComposition _markCompositionAVURLsBeingModified:self->_compositionAVURLsBeingModified];
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"RCSavedRecordingServiceCompositionAVURLsBeingModifiedDidChangeNotification" object:self];
  }
}

void __40__RCSSavedRecordingService_serviceProxy__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 40));
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    [*(id *)(a1 + 32) openServiceConnection];
    objc_initWeak(&location, *(id *)(a1 + 32));
    v2 = *(void **)(*(void *)(a1 + 32) + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__RCSSavedRecordingService_serviceProxy__block_invoke_2;
    v6[3] = &unk_1E6497598;
    objc_copyWeak(&v8, &location);
    id v7 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (RCSSavedRecordingService)init
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)RCSSavedRecordingService;
  v2 = [(RCSSavedRecordingService *)&v23 init];
  if (v2)
  {
    uint64_t v3 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[RCSSavedRecordingService init]";
      _os_log_impl(&dword_1C3964000, v3, OS_LOG_TYPE_DEFAULT, "%s -- Opening RCSSavedRecordingService connection", buf, 0xCu);
    }

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.VoiceMemos.RCSSavedRecordingServiceSerialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    objc_storeStrong((id *)&v2->_completionQueue, MEMORY[0x1E4F14428]);
    uint64_t v6 = objc_opt_new();
    pendingServiceCompletionHandlers = v2->_pendingServiceCompletionHandlers;
    v2->_pendingServiceCompletionHandlers = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    pendingSynchronousServiceCompletionHandlers = v2->_pendingSynchronousServiceCompletionHandlers;
    v2->_pendingSynchronousServiceCompletionHandlers = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    interruptionObservers = v2->_interruptionObservers;
    v2->_interruptionObservers = (NSHashTable *)v10;

    [(RCSSavedRecordingService *)v2 openServiceConnection];
    objc_initWeak((id *)buf, v2);
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __32__RCSSavedRecordingService_init__block_invoke;
    v21[3] = &unk_1E6496CA8;
    objc_copyWeak(&v22, (id *)buf);
    id v13 = (id)[v12 addObserverForName:@"UIApplicationWillTerminateNotification" object:0 queue:0 usingBlock:v21];

    [(NSXPCConnection *)v2->_xpcConnection resume];
    v14 = (const char *)[@"RCSavedRecordingServiceDidChangeCompositionAVURLsBeingExportedDistributedNotification" UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __32__RCSSavedRecordingService_init__block_invoke_2;
    handler[3] = &unk_1E6497158;
    objc_copyWeak(&v20, (id *)buf);
    notify_register_dispatch(v14, &v2->_compositionAVURLsBeingExportedDistributedNotificationToken, MEMORY[0x1E4F14428], handler);

    v15 = (const char *)[@"RCSavedRecordingServiceDidChangeCompositionAVURLsBeingModifiedDistributedNotification" UTF8String];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __32__RCSSavedRecordingService_init__block_invoke_3;
    v17[3] = &unk_1E6497158;
    objc_copyWeak(&v18, (id *)buf);
    notify_register_dispatch(v15, &v2->_compositionAVURLsBeingModifiedDistributedNotificationToken, MEMORY[0x1E4F14428], v17);

    [(RCSSavedRecordingService *)v2 _handleCompositionAVURLsBeingExportedDidChange];
    [(RCSSavedRecordingService *)v2 _handleCompositionAVURLsBeingModifiedDidChange];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (void)openServiceConnection
{
  if (!self->_xpcConnection)
  {
    uint64_t v3 = +[RCSSavedRecordingServiceConnection newConnection];
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v3;

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    uint64_t v5 = +[RCSSavedRecordingServiceConnection clientInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v5];

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__RCSSavedRecordingService_openServiceConnection__block_invoke;
    v8[3] = &unk_1E6497238;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__RCSSavedRecordingService_openServiceConnection__block_invoke_2;
    v6[3] = &unk_1E6497238;
    objc_copyWeak(&v7, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)fetchCompositionAVURLsBeingModified:(id)a3
{
  id v5 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__9;
  v20[4] = __Block_byref_object_dispose__9;
  id v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke;
  v17[3] = &unk_1E6497430;
  v19 = v20;
  void v17[4] = self;
  id v6 = v5;
  id v18 = v6;
  id v7 = (void *)MEMORY[0x1C8778060](v17);
  uint64_t v8 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService fetchCompositionAVURLsBeingModified:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke_158;
  v16[3] = &unk_1E6497480;
  v16[4] = v20;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:v7 messagingBlock:v16];

  _Block_object_dispose(v20, 8);
}

- (void)fetchCompositionAVURLsBeingExported:(id)a3
{
  id v5 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__9;
  v20[4] = __Block_byref_object_dispose__9;
  id v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke;
  v17[3] = &unk_1E6497430;
  v19 = v20;
  void v17[4] = self;
  id v6 = v5;
  id v18 = v6;
  id v7 = (void *)MEMORY[0x1C8778060](v17);
  uint64_t v8 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService fetchCompositionAVURLsBeingExported:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke_156;
  v16[3] = &unk_1E6497480;
  v16[4] = v20;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:v7 messagingBlock:v16];

  _Block_object_dispose(v20, 8);
}

- (void)_handleCompositionAVURLsBeingModifiedDidChange
{
}

- (void)_handleCompositionAVURLsBeingExportedDidChange
{
}

- (id)observeFinalizingRecordings:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke;
  v22[3] = &unk_1E64974F8;
  id v6 = v4;
  id v24 = v6;
  id v7 = v5;
  id v23 = v7;
  uint64_t v8 = (void *)MEMORY[0x1C8778060](v22);
  uint64_t v9 = [NSString stringWithUTF8String:"compositionAVURLsBeingExported"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_174;
  v18[3] = &unk_1E6497520;
  id v19 = v7;
  id v20 = v6;
  id v10 = v8;
  id v21 = v10;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = RCObserveChangesToKeyPath(self, v9, v18);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2_176;
  block[3] = &unk_1E6496F68;
  block[4] = self;
  id v17 = v10;
  id v14 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);

  return v13;
}

- (void)_sendServiceMessage:(SEL)a3 withBasicReplyBlock:(id)a4 messagingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(RCSSavedRecordingService *)self serviceProxy];
  [(RCSSavedRecordingService *)self _sendServiceMessage:a3 withBasicReplyBlock:v9 withServiceProxy:v10 messagingBlock:v8];
}

- (id)serviceProxy
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__9;
  id v14 = __Block_byref_object_dispose__9;
  id v15 = 0;
  uint64_t v3 = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__RCSSavedRecordingService_serviceProxy__block_invoke;
  block[3] = &unk_1E64963C8;
  id v8 = v3;
  id v9 = &v10;
  block[4] = self;
  id v4 = v3;
  dispatch_sync(v4, block);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)_sendServiceMessage:(SEL)a3 withBasicReplyBlock:(id)a4 withServiceProxy:(id)a5 messagingBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, id, void *))a6;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke;
  v29[3] = &unk_1E6497700;
  id v13 = v10;
  id v30 = v13;
  id v14 = (void (**)(void, void))MEMORY[0x1C8778060](v29);
  if (v11)
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__9;
    v27[4] = __Block_byref_object_dispose__9;
    id v28 = 0;
    objc_initWeak(&location, self);
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_2;
    block[3] = &unk_1E6497750;
    id v24 = v27;
    block[4] = self;
    objc_copyWeak(&v25, &location);
    v16 = v14;
    id v23 = v16;
    dispatch_sync(serialQueue, block);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5;
    v18[3] = &unk_1E6497778;
    objc_copyWeak(v21, &location);
    v21[1] = (id)a3;
    id v20 = v27;
    id v19 = v16;
    v12[2](v12, v11, v18);

    objc_destroyWeak(v21);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    _Block_object_dispose(v27, 8);
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCSSavedRecordingServiceErrorDomain" code:201 userInfo:0];
    ((void (**)(void, void *))v14)[2](v14, v17);
  }
}

void __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v5 = RCTestSlowMessageServiceSleepAmount();
    if (v5 > 0.0)
    {
      double v6 = v5;
      id v7 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5_cold_2(a1);
      }

      [MEMORY[0x1E4F29060] sleepForTimeInterval:v6];
      id v8 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5_cold_1(a1);
      }
    }
    id v9 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_192;
    block[3] = &unk_1E6496378;
    id v10 = WeakRetained;
    uint64_t v11 = *(void *)(a1 + 40);
    id v17 = v10;
    uint64_t v18 = v11;
    dispatch_sync(v9, block);
    uint64_t v12 = v10[2];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_2_193;
    v13[3] = &unk_1E6496C58;
    id v15 = *(id *)(a1 + 32);
    id v14 = v3;
    dispatch_async(v12, v13);
  }
}

uint64_t __68__RCSSavedRecordingService_enableOrphanHandlingWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enableOrphanHandlingWithCompletionBlock:");
}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke_2;
  v8[3] = &unk_1E6497458;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  [a2 fetchCompositionAVURLsBeingModified:v8];
}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke_156(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke_2;
  v8[3] = &unk_1E6497458;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  [a2 fetchCompositionAVURLsBeingExported:v8];
}

uint64_t __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_3;
  v6[3] = &unk_1E6497728;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 _onQueueAddPendingServiceMessageReplyBlockInvalidationHandler:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  objc_destroyWeak(&v8);
}

- (id)_onQueueAddPendingServiceMessageReplyBlockInvalidationHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:arc4random()];
  if (v4)
  {
    pendingServiceCompletionHandlers = self->_pendingServiceCompletionHandlers;
    id v7 = (void *)MEMORY[0x1C8778060](v4);
    [(NSMutableDictionary *)pendingServiceCompletionHandlers setObject:v7 forKey:v5];
  }
  return v5;
}

void __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2_176(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) compositionAVURLsBeingExported];
  if ([v2 count]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (NSSet)compositionAVURLsBeingExported
{
  return self->_compositionAVURLsBeingExported;
}

+ (id)sharedService
{
  if (sharedService___once != -1) {
    dispatch_once(&sharedService___once, &__block_literal_global_14);
  }
  id v2 = (void *)sharedService___sharedService;
  return v2;
}

uint64_t __41__RCSSavedRecordingService_sharedService__block_invoke()
{
  sharedService___sharedService = objc_alloc_init(RCSSavedRecordingService);
  return MEMORY[0x1F41817F8]();
}

void __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_174(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = getChange(v5, *MEMORY[0x1E4F284E0]);
  id v7 = getChange(v5, *MEMORY[0x1E4F284C8]);
  if ([v6 count])
  {
    id v22 = v6;
    id v23 = v5;
    id v8 = (void *)[v6 mutableCopy];
    id v21 = v7;
    [v8 minusSet:v7];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
          v16 = v15;
          if (v15)
          {
            id v17 = [v15 objectForKeyedSubscript:@"recordingID"];
            (*(void (**)(float))(*(void *)(a1 + 40) + 16))(1.0);
            uint64_t v18 = [v16 objectForKeyedSubscript:@"token"];
            int v19 = [v18 intValue];

            notify_cancel(v19);
            [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    uint64_t v6 = v22;
    id v5 = v23;
    id v7 = v21;
  }
  if ([v7 count])
  {
    id v20 = (void *)[v7 mutableCopy];
    [v20 minusSet:v6];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  [*(id *)(a1 + 32) setCompositionAVURLsBeingExported:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

- (void)setCompositionAVURLsBeingExported:(id)a3
{
  id v6 = a3;
  if ((-[NSSet isEqual:](self->_compositionAVURLsBeingExported, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_compositionAVURLsBeingExported, a3);
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"RCSavedRecordingServiceCompositionAVURLsBeingExportedDidChangeNotification" object:self];
  }
}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableOrphanHandlingWithCompletionBlock:(id)a3
{
  id v5 = a3;
  id v6 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService enableOrphanHandlingWithCompletionBlock:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:v5 messagingBlock:&__block_literal_global_155];
}

- (void)addInterruptionObserver:(id)a3
{
}

- (void)removeInterruptionObserver:(id)a3
{
}

void __32__RCSSavedRecordingService_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained closeServiceConnection];
}

void __32__RCSSavedRecordingService_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleCompositionAVURLsBeingExportedDidChange];
}

void __32__RCSSavedRecordingService_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleCompositionAVURLsBeingModifiedDidChange];
}

- (void)dealloc
{
}

+ (NSPersistentHistoryToken)changeToken
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 dataForKey:@"RCSavedRecordingsChangeToken"];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
  }
  else
  {
    id v4 = 0;
  }

  return (NSPersistentHistoryToken *)v4;
}

+ (void)setChangeToken:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
    if (!v3) {
      goto LABEL_6;
    }
    id v5 = v3;
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setObject:v5 forKey:@"RCSavedRecordingsChangeToken"];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v5 removeObjectForKey:@"RCSavedRecordingsChangeToken"];
  }
  uint64_t v3 = v5;
LABEL_6:
}

void __49__RCSSavedRecordingService_openServiceConnection__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[RCSSavedRecordingService openServiceConnection]_block_invoke";
    _os_log_impl(&dword_1C3964000, v2, OS_LOG_TYPE_DEFAULT, "%s -- service connection closed.", buf, 0xCu);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained[7] allObjects];
  id v5 = [WeakRetained completionQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__RCSSavedRecordingService_openServiceConnection__block_invoke_107;
  v7[3] = &unk_1E6496350;
  id v8 = v4;
  uint64_t v9 = WeakRetained;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__RCSSavedRecordingService_openServiceConnection__block_invoke_107(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "serviceWasInterrupted:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __49__RCSSavedRecordingService_openServiceConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[RCSSavedRecordingService openServiceConnection]_block_invoke_2";
    _os_log_impl(&dword_1C3964000, v2, OS_LOG_TYPE_DEFAULT, "%s -- service connection invalidated.", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained closeServiceConnection];
}

- (void)closeServiceConnection
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RCSSavedRecordingService_closeServiceConnection__block_invoke;
  block[3] = &unk_1E64963A0;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __50__RCSSavedRecordingService_closeServiceConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueCloseServiceConnection];
}

- (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 userInfo:(id)a6 importCompletionBlock:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v23 = [v13 url];
    *(_DWORD *)buf = 136315906;
    id v30 = "-[RCSSavedRecordingService importRecordingWithSourceAudioURL:name:date:userInfo:importCompletionBlock:]";
    __int16 v31 = 2112;
    v32 = v23;
    __int16 v33 = 2112;
    id v34 = v14;
    __int16 v35 = 2112;
    id v36 = v15;
    _os_log_debug_impl(&dword_1C3964000, v18, OS_LOG_TYPE_DEBUG, "%s -- Sending service request to importRecordingWithSourceAudioURL:%@ name:%@ date:%@", buf, 0x2Au);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke;
  v24[3] = &unk_1E6497288;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 importRequestReplyBlock:v17 messagingBlock:v24];
}

void __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v8 = a1[7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2;
  v11[3] = &unk_1E6497260;
  id v12 = v6;
  id v13 = v5;
  id v10 = v5;
  [a2 importRecordingWithSourceAudioURL:v12 name:v7 date:v9 userInfo:v8 importCompletionBlock:v11];
}

void __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)enableCloudRecordingsWithCompletionBlock:(id)a3
{
  id v5 = a3;
  id v6 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService enableCloudRecordingsWithCompletionBlock:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:v5 messagingBlock:&__block_literal_global_113];
}

uint64_t __69__RCSSavedRecordingService_enableCloudRecordingsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enableCloudRecordingsWithCompletionBlock:");
}

- (void)importRecordingsFromCloud:(id)a3
{
  id v5 = a3;
  id v6 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService importRecordingsFromCloud:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 connectionFailureReplyInfo:0 infoAndErrorReplyHandler:v5 messagingBlock:&__block_literal_global_116];
}

void __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2;
  v6[3] = &unk_1E64972F0;
  id v7 = v4;
  id v5 = v4;
  [a2 importRecordingsFromCloud:v6];
}

void __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)exportRecordingsToCloud:(id)a3
{
  id v5 = a3;
  id v6 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService exportRecordingsToCloud:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 connectionFailureReplyInfo:0 infoAndErrorReplyHandler:v5 messagingBlock:&__block_literal_global_120];
}

void __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2;
  v6[3] = &unk_1E64972F0;
  id v7 = v4;
  id v5 = v4;
  [a2 exportRecordingsToCloud:v6];
}

void __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)expungeRecordingsFromCloud:(id)a3
{
  id v5 = a3;
  id v6 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService expungeRecordingsFromCloud:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 connectionFailureReplyInfo:0 infoAndErrorReplyHandler:v5 messagingBlock:&__block_literal_global_123];
}

void __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2;
  v6[3] = &unk_1E64972F0;
  id v7 = v4;
  id v5 = v4;
  [a2 expungeRecordingsFromCloud:v6];
}

void __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (id)prepareToCaptureToCompositionAVURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__9;
  id v30 = __Block_byref_object_dispose__9;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__9;
  long long v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke;
  v16[3] = &unk_1E6497318;
  id v8 = v7;
  id v17 = v8;
  uint64_t v18 = &v26;
  id v19 = &v20;
  uint64_t v9 = (void *)MEMORY[0x1C8778060](v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_129;
  v14[3] = &unk_1E6497340;
  id v10 = v8;
  id v15 = v10;
  [(RCSSavedRecordingService *)self _sendSynchronousServiceMessage:a2 accessRequestReplyBlock:v9 messagingBlock:v14];
  uint64_t v11 = (void *)v27[5];
  if (a4 && !v11)
  {
    *a4 = (id) v21[5];
    uint64_t v11 = (void *)v27[5];
  }
  id v12 = v11;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_cold_2();
    }
  }
  else if (v8)
  {
    __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_cold_1();
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
}

uint64_t __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_129(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepareToCaptureToCompositionAVURL:*(void *)(a1 + 32) accessRequestHandler:a3];
}

- (void)prepareToCaptureToCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService prepareToCaptureToCompositionAVURL:accessRequestHandler:](v7);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke;
  v11[3] = &unk_1E6497340;
  id v12 = v7;
  id v10 = v7;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 accessRequestReplyBlock:v8 messagingBlock:v11];
}

void __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2;
  v8[3] = &unk_1E6497368;
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  [a2 prepareToCaptureToCompositionAVURL:v9 accessRequestHandler:v8];
}

void __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (id)openAudioFile:(id)a3 settings:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__9;
  v42 = __Block_byref_object_dispose__9;
  id v43 = 0;
  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x3032000000;
  __int16 v35 = __Block_byref_object_copy__9;
  id v36 = __Block_byref_object_dispose__9;
  id v37 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke;
  v28[3] = &unk_1E6497318;
  id v14 = v11;
  id v29 = v14;
  id v30 = &v38;
  id v31 = &v32;
  id v15 = (void *)MEMORY[0x1C8778060](v28);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_135;
  long long v24 = &unk_1E6497390;
  id v16 = v14;
  id v25 = v16;
  id v17 = v12;
  id v26 = v17;
  id v18 = v13;
  id v27 = v18;
  [(RCSSavedRecordingService *)self _sendSynchronousServiceMessage:a2 accessRequestReplyBlock:v15 messagingBlock:&v21];
  if (v39[5])
  {
    id v19 = objc_opt_new();
    objc_msgSend(v19, "setFileToken:", v39[5], v21, v22, v23, v24, v25, v26);
  }
  else
  {
    id v19 = 0;
    if (a6) {
      *a6 = (id) v33[5];
    }
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v19;
}

void __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_cold_2();
    }
  }
  else if (v8)
  {
    __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_cold_1();
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
}

uint64_t __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_135(void *a1, void *a2, uint64_t a3)
{
  return [a2 openAudioFile:a1[4] settings:a1[5] metadata:a1[6] accessRequestHandler:a3];
}

- (void)openAudioFile:(id)a3 settings:(id)a4 metadata:(id)a5 accessRequestHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService openAudioFile:settings:metadata:accessRequestHandler:](v11);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke;
  v19[3] = &unk_1E6497390;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 accessRequestReplyBlock:v14 messagingBlock:v19];
}

void __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2;
  v10[3] = &unk_1E6497368;
  id v11 = v6;
  id v12 = v5;
  id v9 = v5;
  [a2 openAudioFile:v11 settings:v7 metadata:v8 accessRequestHandler:v10];
}

void __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (BOOL)closeAudioFile:(id)a3 error:(id *)a4
{
  id v7 = a3;
  BOOL v8 = [v7 fileToken];
  if (v8)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__9;
    id v20 = __Block_byref_object_dispose__9;
    id v21 = 0;
    uint64_t v9 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[RCSSavedRecordingService closeAudioFile:error:]();
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__RCSSavedRecordingService_closeAudioFile_error___block_invoke;
    v15[3] = &unk_1E64973B8;
    v15[4] = &v16;
    id v10 = (void *)MEMORY[0x1C8778060](v15);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__RCSSavedRecordingService_closeAudioFile_error___block_invoke_2;
    v13[3] = &unk_1E64973E0;
    id v14 = v8;
    [(RCSSavedRecordingService *)self _sendSynchronousServiceMessage:a2 withBasicReplyBlock:v10 messagingBlock:v13];
    if (a4) {
      *a4 = (id) v17[5];
    }
    BOOL v11 = v17[5] == 0;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __49__RCSSavedRecordingService_closeAudioFile_error___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __49__RCSSavedRecordingService_closeAudioFile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 closeAudioFile:*(void *)(a1 + 32) completionBlock:a3];
}

- (void)closeAudioFile:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  BOOL v8 = (void (**)(id, void))a4;
  uint64_t v9 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService closeAudioFile:completionBlock:]();
  }

  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__RCSSavedRecordingService_closeAudioFile_completionBlock___block_invoke;
    v10[3] = &unk_1E64973E0;
    id v11 = v7;
    [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:v8 messagingBlock:v10];
  }
  else
  {
    v8[2](v8, 0);
  }
}

uint64_t __59__RCSSavedRecordingService_closeAudioFile_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 closeAudioFile:*(void *)(a1 + 32) completionBlock:a3];
}

- (void)writeAudioFile:(id)a3 buffer:(id)a4 completionBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__RCSSavedRecordingService_writeAudioFile_buffer_completionBlock___block_invoke;
  v13[3] = &unk_1E6497408;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:a5 messagingBlock:v13];
}

uint64_t __66__RCSSavedRecordingService_writeAudioFile_buffer_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 writeAudioFile:*(void *)(a1 + 32) buffer:*(void *)(a1 + 40) completionBlock:a3];
}

- (id)prepareToPreviewCompositionAVURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__9;
  id v30 = __Block_byref_object_dispose__9;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__9;
  long long v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke;
  v16[3] = &unk_1E6497318;
  id v8 = v7;
  id v17 = v8;
  uint64_t v18 = &v26;
  id v19 = &v20;
  id v9 = (void *)MEMORY[0x1C8778060](v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_142;
  v14[3] = &unk_1E6497340;
  id v10 = v8;
  id v15 = v10;
  [(RCSSavedRecordingService *)self _sendSynchronousServiceMessage:a2 accessRequestReplyBlock:v9 messagingBlock:v14];
  id v11 = (void *)v27[5];
  if (a4 && !v11)
  {
    *a4 = (id) v21[5];
    id v11 = (void *)v27[5];
  }
  id v12 = v11;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_cold_2();
    }
  }
  else if (v8)
  {
    __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_cold_1();
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
}

uint64_t __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_142(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepareToPreviewCompositionAVURL:*(void *)(a1 + 32) accessRequestHandler:a3];
}

- (void)prepareToPreviewCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService prepareToPreviewCompositionAVURL:accessRequestHandler:](v7);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke;
  v11[3] = &unk_1E6497340;
  id v12 = v7;
  id v10 = v7;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 accessRequestReplyBlock:v8 messagingBlock:v11];
}

void __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2;
  v8[3] = &unk_1E6497368;
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  [a2 prepareToPreviewCompositionAVURL:v9 accessRequestHandler:v8];
}

void __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (id)prepareToExportCompositionAVURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__9;
  id v30 = __Block_byref_object_dispose__9;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__9;
  long long v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke;
  v16[3] = &unk_1E6497318;
  id v8 = v7;
  id v17 = v8;
  uint64_t v18 = &v26;
  id v19 = &v20;
  uint64_t v9 = (void *)MEMORY[0x1C8778060](v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_147;
  v14[3] = &unk_1E6497340;
  id v10 = v8;
  id v15 = v10;
  [(RCSSavedRecordingService *)self _sendSynchronousServiceMessage:a2 accessRequestReplyBlock:v9 messagingBlock:v14];
  id v11 = (void *)v27[5];
  if (a4 && !v11)
  {
    *a4 = (id) v21[5];
    id v11 = (void *)v27[5];
  }
  id v12 = v11;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_cold_2();
    }
  }
  else if (v8)
  {
    __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_cold_1();
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
}

uint64_t __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_147(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepareToExportCompositionAVURL:*(void *)(a1 + 32) accessRequestHandler:a3];
}

- (void)prepareToExportCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService prepareToExportCompositionAVURL:accessRequestHandler:](v7);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke;
  v11[3] = &unk_1E6497340;
  id v12 = v7;
  id v10 = v7;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 accessRequestReplyBlock:v8 messagingBlock:v11];
}

void __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2;
  v8[3] = &unk_1E6497368;
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  [a2 prepareToExportCompositionAVURL:v9 accessRequestHandler:v8];
}

void __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (id)prepareToTrimCompositionAVURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__9;
  id v30 = __Block_byref_object_dispose__9;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__9;
  long long v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke;
  v16[3] = &unk_1E6497318;
  id v8 = v7;
  id v17 = v8;
  uint64_t v18 = &v26;
  id v19 = &v20;
  uint64_t v9 = (void *)MEMORY[0x1C8778060](v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_152;
  v14[3] = &unk_1E6497340;
  id v10 = v8;
  id v15 = v10;
  [(RCSSavedRecordingService *)self _sendSynchronousServiceMessage:a2 accessRequestReplyBlock:v9 messagingBlock:v14];
  id v11 = (void *)v27[5];
  if (a4 && !v11)
  {
    *a4 = (id) v21[5];
    id v11 = (void *)v27[5];
  }
  id v12 = v11;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_cold_2();
    }
  }
  else if (v8)
  {
    __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_cold_1();
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
}

uint64_t __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_152(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 prepareToTrimCompositionAVURL:*(void *)(a1 + 32) accessRequestHandler:a3];
}

- (void)prepareToTrimCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService prepareToTrimCompositionAVURL:accessRequestHandler:](v7);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke;
  v11[3] = &unk_1E6497340;
  id v12 = v7;
  id v10 = v7;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 accessRequestReplyBlock:v8 messagingBlock:v11];
}

void __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2;
  v8[3] = &unk_1E6497368;
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  [a2 prepareToTrimCompositionAVURL:v9 accessRequestHandler:v8];
}

void __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogForCategory(@"Service");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (BOOL)endAccessSessionWithToken:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__9;
  id v19 = __Block_byref_object_dispose__9;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__RCSSavedRecordingService_endAccessSessionWithToken_error___block_invoke;
  v14[3] = &unk_1E64973B8;
  void v14[4] = &v15;
  BOOL v8 = (void *)MEMORY[0x1C8778060](v14);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__RCSSavedRecordingService_endAccessSessionWithToken_error___block_invoke_2;
  v12[3] = &unk_1E64973E0;
  id v9 = v7;
  id v13 = v9;
  [(RCSSavedRecordingService *)self _sendSynchronousServiceMessage:a2 withBasicReplyBlock:v8 messagingBlock:v12];
  id v10 = (void *)v16[5];
  if (a4 && v10) {
    *a4 = v10;
  }

  _Block_object_dispose(&v15, 8);
  return v10 == 0;
}

void __60__RCSSavedRecordingService_endAccessSessionWithToken_error___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __60__RCSSavedRecordingService_endAccessSessionWithToken_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 endAccessSessionWithToken:*(void *)(a1 + 32) completionBlock:a3];
}

- (void)endAccessSessionWithToken:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    id v8 = a4;
    id v9 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[RCSSavedRecordingService endAccessSessionWithToken:completionBlock:]();
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__RCSSavedRecordingService_endAccessSessionWithToken_completionBlock___block_invoke;
    v10[3] = &unk_1E64973E0;
    id v11 = v7;
    [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:v8 messagingBlock:v10];
  }
}

uint64_t __70__RCSSavedRecordingService_endAccessSessionWithToken_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 endAccessSessionWithToken:*(void *)(a1 + 32) completionBlock:a3];
}

- (BOOL)disableOrphanedFragmentCleanupForCompositionAVURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__9;
  id v19 = __Block_byref_object_dispose__9;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_error___block_invoke;
  v14[3] = &unk_1E64973B8;
  void v14[4] = &v15;
  id v8 = (void *)MEMORY[0x1C8778060](v14);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_error___block_invoke_2;
  v12[3] = &unk_1E64973E0;
  id v9 = v7;
  id v13 = v9;
  [(RCSSavedRecordingService *)self _sendSynchronousServiceMessage:a2 withBasicReplyBlock:v8 messagingBlock:v12];
  id v10 = (void *)v16[5];
  if (a4 && v10) {
    *a4 = v10;
  }

  _Block_object_dispose(&v15, 8);
  return v10 == 0;
}

void __84__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_error___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __84__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 disableOrphanedFragmentCleanupForCompositionAVURL:*(void *)(a1 + 32) completionBlock:a3];
}

- (void)disableOrphanedFragmentCleanupForCompositionAVURL:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService disableOrphanedFragmentCleanupForCompositionAVURL:completionBlock:](v7);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_completionBlock___block_invoke;
  v11[3] = &unk_1E64973E0;
  id v12 = v7;
  id v10 = v7;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:v8 messagingBlock:v11];
}

uint64_t __94__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 disableOrphanedFragmentCleanupForCompositionAVURL:*(void *)(a1 + 32) completionBlock:a3];
}

- (void)enableOrphanedFragmentCleanupForCompositionAVURL:(id)a3
{
  id v5 = a3;
  id v6 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService enableOrphanedFragmentCleanupForCompositionAVURL:](v5);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__RCSSavedRecordingService_enableOrphanedFragmentCleanupForCompositionAVURL___block_invoke;
  v8[3] = &unk_1E6497340;
  id v9 = v5;
  id v7 = v5;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 accessRequestReplyBlock:0 messagingBlock:v8];
}

uint64_t __77__RCSSavedRecordingService_enableOrphanedFragmentCleanupForCompositionAVURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enableOrphanedFragmentCleanupForCompositionAVURL:*(void *)(a1 + 32)];
}

- (void)_fetchAllAccessTokens:(id)a3
{
  id v4 = a3;
  id v5 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService _fetchAllAccessTokens:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (v4)
  {
    completionQueue = self->_completionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__RCSSavedRecordingService__fetchAllAccessTokens___block_invoke;
    block[3] = &unk_1E6496698;
    id v15 = v4;
    dispatch_async(completionQueue, block);
  }
}

void __50__RCSSavedRecordingService__fetchAllAccessTokens___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CAD0] set];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)__fetchAllAccessTokens:(id)a3
{
  id v5 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__9;
  v20[4] = __Block_byref_object_dispose__9;
  id v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke;
  v17[3] = &unk_1E64974A8;
  id v19 = v20;
  id v6 = v5;
  id v18 = v6;
  uint64_t v7 = (void *)MEMORY[0x1C8778060](v17);
  uint64_t v8 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService __fetchAllAccessTokens:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke_160;
  v16[3] = &unk_1E6497480;
  void v16[4] = v20;
  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:v7 messagingBlock:v16];

  _Block_object_dispose(v20, 8);
}

void __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke_2;
  v8[3] = &unk_1E6497458;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  [a2 _fetchAllAccessTokens:v8];
}

void __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v8 = +[RCComposition compositionLoadedForComposedAVURL:v7 createIfNeeded:0];
        id v9 = [v8 savedRecordingUUID];
        if (v9)
        {
          uint64_t v10 = [NSString stringWithFormat:@"%@.%@", @"RCFinalizationProgressNotificationName", v9];
          int out_token = 0;
          id v11 = v10;
          uint64_t v12 = (const char *)[v11 UTF8String];
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2;
          handler[3] = &unk_1E64974D0;
          id v13 = v9;
          id v18 = v13;
          id v19 = *(id *)(a1 + 40);
          if (!notify_register_dispatch(v12, &out_token, MEMORY[0x1E4F14428], handler))
          {
            v25[0] = @"recordingID";
            v25[1] = @"token";
            v26[0] = v13;
            uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
            v26[1] = v14;
            uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
            [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:v7];
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v4);
  }
}

uint64_t __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  uint64_t v3 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2_cold_1();
  }

  return (*(uint64_t (**)(float))(*(void *)(a1 + 40) + 16))(*(float *)&state64);
}

- (void)checkRecordingAvailability:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__RCSSavedRecordingService_checkRecordingAvailability___block_invoke;
  v6[3] = &unk_1E6497548;
  id v7 = v4;
  id v5 = v4;
  [(RCSSavedRecordingService *)self __fetchAllAccessTokens:v6];
}

void __55__RCSSavedRecordingService_checkRecordingAvailability___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "accessName", (void)v10);
      char v9 = [v8 isEqualToString:@"capture"];

      if (v9) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadExistingSearchMetadataWithCompletionBlock:(id)a3
{
  id v5 = a3;
  uint64_t v6 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService reloadExistingSearchMetadataWithCompletionBlock:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:v5 messagingBlock:&__block_literal_global_178];
}

uint64_t __76__RCSSavedRecordingService_reloadExistingSearchMetadataWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadExistingSearchMetadataWithCompletionBlock:");
}

- (void)clearAndReloadSearchMetadataWithCompletionBlock:(id)a3
{
  id v5 = a3;
  uint64_t v6 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RCSSavedRecordingService clearAndReloadSearchMetadataWithCompletionBlock:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:v5 messagingBlock:&__block_literal_global_180];
}

uint64_t __76__RCSSavedRecordingService_clearAndReloadSearchMetadataWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearAndReloadSearchMetadataWithCompletionBlock:");
}

- (void)updateSearchMetadataWithRecordingURIsToInsert:(id)a3 recordingURIsToUpdate:(id)a4 recordingURIsToDelete:(id)a5 completionBlock:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void))a6;
  uint64_t v15 = [v11 count];
  uint64_t v16 = [v12 count] + v15;
  if (v16 + [v13 count])
  {
    uint64_t v17 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = (void *)MEMORY[0x1C8778060](v14);
      *(_DWORD *)buf = 136316162;
      long long v24 = "-[RCSSavedRecordingService updateSearchMetadataWithRecordingURIsToInsert:recordingURIsToUpdate:recordingURIs"
            "ToDelete:completionBlock:]";
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2112;
      id v28 = v12;
      __int16 v29 = 2112;
      id v30 = v13;
      __int16 v31 = 2112;
      uint64_t v32 = v18;
      _os_log_debug_impl(&dword_1C3964000, v17, OS_LOG_TYPE_DEBUG, "%s -- Sending service request to updateSearchMetadataWithRecordingURIsToInsert:%@ recordingURIsToUpdate:%@ recordingURIsToDelete:%@ completionBlock:%@", buf, 0x34u);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __134__RCSSavedRecordingService_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock___block_invoke;
    v19[3] = &unk_1E6497570;
    id v20 = v11;
    id v21 = v12;
    id v22 = v13;
    [(RCSSavedRecordingService *)self _sendServiceMessage:a2 withBasicReplyBlock:v14 messagingBlock:v19];
  }
  else if (v14)
  {
    v14[2](v14, 0);
  }
}

uint64_t __134__RCSSavedRecordingService_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock___block_invoke(void *a1, void *a2, uint64_t a3)
{
  return [a2 updateSearchMetadataWithRecordingURIsToInsert:a1[4] recordingURIsToUpdate:a1[5] recordingURIsToDelete:a1[6] completionBlock:a3];
}

- (void)removeAllUserDataWithCompletion:(id)a3
{
}

uint64_t __60__RCSSavedRecordingService_removeAllUserDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllUserDataWithCompletion:");
}

void __40__RCSSavedRecordingService_serviceProxy__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __40__RCSSavedRecordingService_serviceProxy__block_invoke_2_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = *(NSObject **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__RCSSavedRecordingService_serviceProxy__block_invoke_183;
  v9[3] = &unk_1E6496350;
  id v10 = WeakRetained;
  id v11 = v3;
  id v7 = v3;
  id v8 = WeakRetained;
  dispatch_async(v6, v9);
}

uint64_t __40__RCSSavedRecordingService_serviceProxy__block_invoke_183(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueInvalidatePendingCompletionHandlersWithError:*(void *)(a1 + 40)];
}

- (id)synchronousServiceProxy
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__9;
  id v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke;
  v6[3] = &unk_1E64963F0;
  void v6[4] = self;
  v6[5] = &v7;
  id v3 = serialQueue;
  dispatch_sync(v3, v6);
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 48));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    [*(id *)(a1 + 32) openServiceConnection];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v2 = *(void **)(*(void *)(a1 + 32) + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke_2;
    v6[3] = &unk_1E64975C0;
    objc_copyWeak(&v7, &location);
    uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = OSLogForCategory(@"Service");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke_2_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidatePendingSynchronousCompletionHandlersWithError:v3];
}

- (void)_onQueueCloseServiceConnection
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  [(RCSSavedRecordingService *)self _onQueueInvalidatePendingCompletionHandlersWithError:0];
}

- (void)_sendServiceMessage:(SEL)a3 connectionFailureReplyInfo:(id)a4 infoAndErrorReplyHandler:(id)a5 withServiceProxy:(id)a6 messagingBlock:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, id, void *))a7;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke;
  v33[3] = &unk_1E64975E8;
  id v16 = v13;
  id v34 = v16;
  uint64_t v17 = (void (**)(void, void, void))MEMORY[0x1C8778060](v33);
  if (v14)
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__9;
    v31[4] = __Block_byref_object_dispose__9;
    id v32 = 0;
    objc_initWeak(&location, self);
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_2;
    block[3] = &unk_1E6497660;
    id v28 = v31;
    void block[4] = self;
    objc_copyWeak(&v29, &location);
    id v19 = v17;
    id v27 = v19;
    id v26 = v12;
    dispatch_sync(serialQueue, block);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    id v21[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5;
    v21[3] = &unk_1E6497688;
    objc_copyWeak(v24, &location);
    v24[1] = (id)a3;
    long long v23 = v31;
    id v22 = v19;
    v15[2](v15, v14, v21);

    objc_destroyWeak(v24);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    _Block_object_dispose(v31, 8);
  }
  else
  {
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCSSavedRecordingServiceErrorDomain" code:201 userInfo:0];
    ((void (**)(void, void, void *))v17)[2](v17, 0, v20);
  }
}

uint64_t __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_3;
  v6[3] = &unk_1E6497638;
  objc_copyWeak(&v9, (id *)(a1 + 64));
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 _onQueueAddPendingServiceMessageReplyBlockInvalidationHandler:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  objc_destroyWeak(&v9);
}

void __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (!v3)
    {
      id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCSSavedRecordingServiceErrorDomain" code:202 userInfo:0];
    }
    id v5 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_4;
    block[3] = &unk_1E6497610;
    id v9 = a1[5];
    id v7 = a1[4];
    id v3 = v3;
    id v8 = v3;
    dispatch_async(v5, block);
  }
}

uint64_t __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v8 = RCTestSlowMessageServiceSleepAmount();
    if (v8 > 0.0)
    {
      double v9 = v8;
      id v10 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5_cold_2(a1);
      }

      [MEMORY[0x1E4F29060] sleepForTimeInterval:v9];
      id v11 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5_cold_1(a1);
      }
    }
    id v12 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_188;
    block[3] = &unk_1E6496378;
    id v13 = WeakRetained;
    uint64_t v14 = *(void *)(a1 + 40);
    id v21 = v13;
    uint64_t v22 = v14;
    dispatch_sync(v12, block);
    uint64_t v15 = v13[2];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_2_189;
    v16[3] = &unk_1E6497610;
    id v19 = *(id *)(a1 + 32);
    id v17 = v5;
    id v18 = v6;
    dispatch_async(v15, v16);
  }
}

uint64_t __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_188(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueRemovePendingServiceMessageReplyBlockInvalidationHandlerForToken:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

uint64_t __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_2_189(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_sendServiceMessage:(SEL)a3 connectionFailureReplyInfo:(id)a4 infoAndErrorReplyHandler:(id)a5 messagingBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [(RCSSavedRecordingService *)self serviceProxy];
  [(RCSSavedRecordingService *)self _sendServiceMessage:a3 connectionFailureReplyInfo:v12 infoAndErrorReplyHandler:v11 withServiceProxy:v13 messagingBlock:v10];
}

- (void)_sendSynchronousServiceMessage:(SEL)a3 connectionFailureReplyInfo:(id)a4 infoAndErrorReplyHandler:(id)a5 messagingBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void *))a6;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke;
  v28[3] = &unk_1E64975E8;
  id v13 = v11;
  id v29 = v13;
  uint64_t v14 = (void (**)(void, void, void))MEMORY[0x1C8778060](v28);
  uint64_t v15 = [(RCSSavedRecordingService *)self synchronousServiceProxy];
  if (v15)
  {
    id v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:arc4random()];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_2;
    v25[3] = &unk_1E64976B0;
    id v17 = v14;
    id v27 = v17;
    id v26 = v10;
    id v18 = (void *)MEMORY[0x1C8778060](v25);
    [(NSMutableDictionary *)self->_pendingSynchronousServiceCompletionHandlers setObject:v18 forKeyedSubscript:v16];

    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3;
    v20[3] = &unk_1E64976D8;
    objc_copyWeak(v23, &location);
    v23[1] = (id)a3;
    v20[4] = self;
    id v19 = v16;
    id v21 = v19;
    uint64_t v22 = v17;
    v12[2](v12, v15, v20);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCSSavedRecordingServiceErrorDomain" code:201 userInfo:0];
    ((void (**)(void, void, id))v14)[2](v14, 0, v19);
  }
}

uint64_t __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCSSavedRecordingServiceErrorDomain" code:202 userInfo:0];
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    double v8 = RCTestSlowMessageServiceSleepAmount();
    if (v8 > 0.0)
    {
      double v9 = v8;
      id v10 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3_cold_2(a1);
      }

      [MEMORY[0x1E4F29060] sleepForTimeInterval:v9];
      id v11 = OSLogForCategory(@"Service");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3_cold_1(a1);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 72) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_sendServiceMessage:(SEL)a3 accessRequestReplyBlock:(id)a4 messagingBlock:(id)a5
{
}

- (void)_sendSynchronousServiceMessage:(SEL)a3 accessRequestReplyBlock:(id)a4 messagingBlock:(id)a5
{
}

- (void)_sendServiceMessage:(SEL)a3 importRequestReplyBlock:(id)a4 messagingBlock:(id)a5
{
}

void __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v3)
    {
      id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCSSavedRecordingServiceErrorDomain" code:202 userInfo:0];
    }
    id v5 = WeakRetained[2];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_4;
    v6[3] = &unk_1E6496C58;
    id v8 = *(id *)(a1 + 32);
    id v3 = v3;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_sendSynchronousServiceMessage:(SEL)a3 withBasicReplyBlock:(id)a4 messagingBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke;
  v19[3] = &unk_1E64975E8;
  id v20 = v8;
  id v10 = v8;
  id v11 = (void *)MEMORY[0x1C8778060](v19);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke_2;
  id v17 = &unk_1E64977A0;
  id v18 = v9;
  id v12 = v9;
  id v13 = (void *)MEMORY[0x1C8778060](&v14);
  -[RCSSavedRecordingService _sendSynchronousServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:](self, "_sendSynchronousServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:", a3, 0, v11, v13, v14, v15, v16, v17);
}

uint64_t __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

void __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke_3;
  v9[3] = &unk_1E6497700;
  id v10 = v5;
  id v7 = *(void (**)(uint64_t, uint64_t, void *))(v6 + 16);
  id v8 = v5;
  v7(v6, a2, v9);
}

uint64_t __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_onQueueInvalidatePendingCompletionHandlersWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_pendingServiceCompletionHandlers allValues];
  uint64_t v6 = (void *)[v5 copy];

  [(NSMutableDictionary *)self->_pendingServiceCompletionHandlers removeAllObjects];
  if ([v6 count])
  {
    id v7 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[RCSSavedRecordingService _onQueueInvalidatePendingCompletionHandlersWithError:](v6);
    }

    completionQueue = self->_completionQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__RCSSavedRecordingService__onQueueInvalidatePendingCompletionHandlersWithError___block_invoke;
    v9[3] = &unk_1E6496350;
    id v10 = v6;
    id v11 = v4;
    dispatch_async(completionQueue, v9);
  }
}

void __81__RCSSavedRecordingService__onQueueInvalidatePendingCompletionHandlersWithError___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_onQueueInvalidatePendingCompletionHandlerWithToken:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(NSMutableDictionary *)self->_pendingServiceCompletionHandlers objectForKey:v6];
  if (v8)
  {
    [(NSMutableDictionary *)self->_pendingServiceCompletionHandlers removeObjectForKey:v6];
    completionQueue = self->_completionQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90__RCSSavedRecordingService__onQueueInvalidatePendingCompletionHandlerWithToken_withError___block_invoke;
    v10[3] = &unk_1E6496C58;
    id v12 = v8;
    id v11 = v7;
    dispatch_async(completionQueue, v10);
  }
}

uint64_t __90__RCSSavedRecordingService__onQueueInvalidatePendingCompletionHandlerWithToken_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_invalidatePendingSynchronousCompletionHandlersWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_pendingSynchronousServiceCompletionHandlers allValues];
  id v6 = (void *)[v5 copy];

  [(NSMutableDictionary *)self->_pendingSynchronousServiceCompletionHandlers removeAllObjects];
  if ([v6 count])
  {
    id v7 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[RCSSavedRecordingService _invalidatePendingSynchronousCompletionHandlersWithError:](v6);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)valueForServiceKey:(id)a3 completion:(id)a4
{
}

- (void)_valueForServiceKey:(id)a3 synchronous:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__RCSSavedRecordingService__valueForServiceKey_synchronous_completion___block_invoke;
  v11[3] = &unk_1E64977C8;
  void v11[4] = v8;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1C8778060](v11);
  if (v6) {
    [(RCSSavedRecordingService *)self _sendSynchronousServiceMessage:sel_valueForServiceKey_completion_ connectionFailureReplyInfo:0 infoAndErrorReplyHandler:v9 messagingBlock:v10];
  }
  else {
    [(RCSSavedRecordingService *)self _sendServiceMessage:sel_valueForServiceKey_completion_ connectionFailureReplyInfo:0 infoAndErrorReplyHandler:v9 messagingBlock:v10];
  }
}

void __71__RCSSavedRecordingService__valueForServiceKey_synchronous_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__RCSSavedRecordingService__valueForServiceKey_synchronous_completion___block_invoke_2;
  v8[3] = &unk_1E64975E8;
  id v9 = v5;
  id v7 = v5;
  [a2 valueForServiceKey:v6 completion:v8];
}

uint64_t __71__RCSSavedRecordingService__valueForServiceKey_synchronous_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)valueForServiceKey:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__9;
  uint64_t v12 = __Block_byref_object_dispose__9;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__RCSSavedRecordingService_valueForServiceKey___block_invoke;
  v7[3] = &unk_1E64977F0;
  void v7[4] = v4;
  v7[5] = &v8;
  [(RCSSavedRecordingService *)self _valueForServiceKey:v4 synchronous:1 completion:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __47__RCSSavedRecordingService_valueForServiceKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 && v6)
  {
    uint64_t v8 = OSLogForCategory(@"Service");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __47__RCSSavedRecordingService_valueForServiceKey___block_invoke_cold_1();
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (id)encryptedAccountStatus
{
  return [(RCSSavedRecordingService *)self valueForServiceKey:@"accountStatus"];
}

- (id)encryptedFieldsStatus
{
  return [(RCSSavedRecordingService *)self valueForServiceKey:@"encryptedFieldsStatus"];
}

- (BOOL)firstImportIsComplete
{
  uint64_t v2 = [(RCSSavedRecordingService *)self valueForServiceKey:@"firstImportIsComplete"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSSet)compositionAVURLsBeingModified
{
  return self->_compositionAVURLsBeingModified;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionAVURLsBeingModified, 0);
  objc_storeStrong((id *)&self->_compositionAVURLsBeingExported, 0);
  objc_storeStrong((id *)&self->_pendingSynchronousServiceCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_pendingServiceCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_interruptionObservers, 0);
  objc_storeStrong((id *)&self->_synchronousServiceProxy, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(&dword_1C3964000, v0, v1, "%s -- Failed to import %@, error = %@", v2);
}

void __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  v2[0] = 136315394;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_0(&dword_1C3964000, v0, v1, "%s -- Imported %@ successfully", (uint8_t *)v2);
}

- (void)enableCloudRecordingsWithCompletionBlock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)importRecordingsFromCloud:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1C3964000, v0, v1, "%s -- Imported from iCloud successfully, changesMade = %@", (uint8_t *)v2);
}

void __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1C3964000, v0, v1, "%s -- Failed to import from iCloud, error = %@", (uint8_t *)v2);
}

- (void)exportRecordingsToCloud:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1C3964000, v0, v1, "%s -- Exported from iCloud successfully, changesMade = %@", (uint8_t *)v2);
}

void __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1C3964000, v0, v1, "%s -- Failed to export to iCloud, error = %@", (uint8_t *)v2);
}

- (void)expungeRecordingsFromCloud:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1C3964000, v0, v1, "%s -- Exported from iCloud successfully, changesMade = %@", (uint8_t *)v2);
}

void __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1C3964000, v0, v1, "%s -- Failed to expunge to iCloud, error = %@", (uint8_t *)v2);
}

void __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);
}

void __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);
}

- (void)prepareToCaptureToCompositionAVURL:(void *)a1 accessRequestHandler:.cold.1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v2, v3, "%s -- Sending service request to begin capture session for %@", v4, v5, v6, v7, 2u);
}

void __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);
}

void __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);
}

void __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);
}

void __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);
}

- (void)openAudioFile:(void *)a1 settings:metadata:accessRequestHandler:.cold.1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v2, v3, "%s -- Sending service request to open audio file %@", v4, v5, v6, v7, 2u);
}

void __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);
}

void __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);
}

- (void)closeAudioFile:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1C3964000, v0, v1, "%s -- Sending service request to close audio file: %@", (uint8_t *)v2);
}

- (void)closeAudioFile:completionBlock:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1C3964000, v0, v1, "%s -- Sending service request to close audio file: %@", (uint8_t *)v2);
}

void __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);
}

void __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);
}

- (void)prepareToPreviewCompositionAVURL:(void *)a1 accessRequestHandler:.cold.1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v2, v3, "%s -- Sending service request to begin preview session for %@", v4, v5, v6, v7, 2u);
}

void __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);
}

void __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);
}

void __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);
}

void __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);
}

- (void)prepareToExportCompositionAVURL:(void *)a1 accessRequestHandler:.cold.1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v2, v3, "%s -- Sending service request to begin export session for %@", v4, v5, v6, v7, 2u);
}

void __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);
}

void __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);
}

void __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);
}

void __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);
}

- (void)prepareToTrimCompositionAVURL:(void *)a1 accessRequestHandler:.cold.1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v2, v3, "%s -- Sending service request to begin trimming session for %@", v4, v5, v6, v7, 2u);
}

void __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);
}

void __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x1E4F143B8]), "lastPathComponent");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_1C3964000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);
}

- (void)endAccessSessionWithToken:completionBlock:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1C3964000, v0, v1, "%s -- Sending service request to end session: %@", (uint8_t *)v2);
}

- (void)disableOrphanedFragmentCleanupForCompositionAVURL:(void *)a1 completionBlock:.cold.1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v2, v3, "%s -- Sending service request to disableOrphanedFragmentCleanupForCompositionAVURL: %@", v4, v5, v6, v7, 2u);
}

- (void)enableOrphanedFragmentCleanupForCompositionAVURL:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v2, v3, "%s -- Sending service request to enableOrphanedFragmentCleanupForCompositionAVURL: %@", v4, v5, v6, v7, 2u);
}

- (void)enableOrphanHandlingWithCompletionBlock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchCompositionAVURLsBeingExported:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchCompositionAVURLsBeingModified:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_fetchAllAccessTokens:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)__fetchAllAccessTokens:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_1C3964000, v0, v1, "%s -- recordingID = %@, progress = %f", v2);
}

- (void)reloadExistingSearchMetadataWithCompletionBlock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)clearAndReloadSearchMetadataWithCompletionBlock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __40__RCSSavedRecordingService_serviceProxy__block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1C3964000, v0, OS_LOG_TYPE_ERROR, "%s -- An error occurred while waiting for a reply from the service. Error = %@", (uint8_t *)v1, 0x16u);
}

void __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1C3964000, v0, OS_LOG_TYPE_ERROR, "%s -- An error occurred while waiting for a reply from the service. Error = %@", (uint8_t *)v1, 0x16u);
}

void __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5_cold_1(uint64_t a1)
{
  os_log_t v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v2, v3, "%s -- WARNING: finished delay of %@", v4, v5, v6, v7, 2u);
}

void __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5_cold_2(uint64_t a1)
{
  os_log_t v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1C3964000, v2, v3, "%s -- WARNING: begin delay of %@ %.2fs to simulate slow processing…", v4, v5, v6, v7, 2u);
}

void __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3_cold_1(uint64_t a1)
{
  os_log_t v1 = NSStringFromSelector(*(SEL *)(a1 + 64));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v2, v3, "%s -- WARNING: finished delay of %@", v4, v5, v6, v7, 2u);
}

void __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3_cold_2(uint64_t a1)
{
  os_log_t v1 = NSStringFromSelector(*(SEL *)(a1 + 64));
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1C3964000, v2, v3, "%s -- WARNING: begin delay of %@ %.2fs to simulate slow processing…", v4, v5, v6, v7, 2u);
}

void __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5_cold_1(uint64_t a1)
{
  os_log_t v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v2, v3, "%s -- WARNING: finished delay of %@", v4, v5, v6, v7, 2u);
}

void __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5_cold_2(uint64_t a1)
{
  os_log_t v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1C3964000, v2, v3, "%s -- WARNING: begin delay of %@ %.2fs to simulate slow processing…", v4, v5, v6, v7, 2u);
}

- (void)_onQueueInvalidatePendingCompletionHandlersWithError:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v1, v2, "%s -- invalidating %ld reply blocks ...", v3, v4, v5, v6, 2u);
}

- (void)_invalidatePendingSynchronousCompletionHandlersWithError:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(&dword_1C3964000, v1, v2, "%s -- invalidating %ld synchronous reply blocks ...", v3, v4, v5, v6, 2u);
}

void __47__RCSSavedRecordingService_valueForServiceKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  v1[0] = 136315650;
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1C3964000, v0, OS_LOG_TYPE_ERROR, "%s -- failed to get value for %@, error = %@", (uint8_t *)v1, 0x20u);
}

@end