@interface SSDownloadManager
+ (id)EBookDownloadKinds;
+ (id)EBookDownloadManager;
+ (id)IPodDownloadKinds;
+ (id)IPodDownloadManager;
+ (id)ITunesDownloadKinds;
+ (id)allStoreDownloadKinds;
+ (id)softwareDownloadKinds;
+ (id)softwareDownloadManager;
+ (void)_sendGlobalHandler:(id)a3;
+ (void)_triggerDownloads;
+ (void)reconnectToLSApplicationWorkspace;
+ (void)removePersistenceIdentifier:(id)a3;
+ (void)retryAllRestoreDownloads;
+ (void)setDownloadHandler:(id)a3;
- (BOOL)_supportsSoftwareKind;
- (BOOL)canCancelDownload:(id)a3;
- (BOOL)isUsingNetwork;
- (NSArray)activeDownloads;
- (NSArray)downloads;
- (SSDownloadManager)initWithDownloadKinds:(id)a3;
- (SSDownloadManager)initWithManagerOptions:(id)a3;
- (SSDownloadManagerOptions)managerOptions;
- (id)_XPCConnection;
- (id)_copyDownloadKindsUsingNetwork;
- (id)_copyDownloads;
- (id)_copyDownloadsForMessage:(int64_t)a3 downloadIDs:(id)a4;
- (id)_initSSDownloadManagerWithOptions:(id)a3;
- (id)_newOptionsDictionary;
- (void)_connectAfterDaemonLaunch;
- (void)_connectAsObserver;
- (void)_finishDownloads:(id)a3;
- (void)_handleDownloadKindsUsingNetworkChanged:(id)a3;
- (void)_handleDownloadStatesChanged:(id)a3;
- (void)_handleDownloadsChanged:(id)a3;
- (void)_handleDownloadsRemoved:(id)a3;
- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4;
- (void)_handleReply:(id)a3 forDownloads:(id)a4 message:(id)a5 isRetry:(BOOL)a6 block:(id)a7;
- (void)_insertDownloads:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6;
- (void)_loadDownloadKindsUsingNetwork;
- (void)_moveDownload:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6;
- (void)_pauseDownloads:(id)a3 completionBlock:(id)a4;
- (void)_pauseDownloads:(id)a3 forced:(BOOL)a4 completionBlock:(id)a5;
- (void)_reloadIsUsingNetworkWithDownloadKinds:(id)a3;
- (void)_resetAllDownloads;
- (void)_sendDownloadsChanged:(id)a3;
- (void)_sendMessage:(id)a3 withCompletionBlock:(id)a4;
- (void)_sendMessageToObservers:(SEL)a3;
- (void)_sendObserverConnection;
- (void)_willFinishDownloads:(id)a3;
- (void)addDownloads:(id)a3 completionBlock:(id)a4;
- (void)addObserver:(id)a3;
- (void)cancelAllDownloadsWithCompletionBlock:(id)a3;
- (void)cancelDownloads:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)finishDownloads:(id)a3;
- (void)getDownloadsUsingBlock:(id)a3;
- (void)insertDownloads:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5;
- (void)insertDownloads:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5;
- (void)moveDownload:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5;
- (void)moveDownload:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5;
- (void)pauseDownloads:(id)a3 completionBlock:(id)a4;
- (void)reloadFromServer;
- (void)removeObserver:(id)a3;
- (void)restartDownloads:(id)a3 completionBlock:(id)a4;
- (void)resumeDownloads:(id)a3 completionBlock:(id)a4;
- (void)setDownloads:(id)a3 completionBlock:(id)a4;
- (void)setDownloads:(id)a3 forKinds:(id)a4 completionBlock:(id)a5;
@end

@implementation SSDownloadManager

- (void)_sendObserverConnection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!SSIsInternalBuild() || !_os_feature_enabled_impl()) {
    goto LABEL_16;
  }
  v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    int v7 = v5;
  }
  else {
    int v7 = v5 & 2;
  }
  if (!v7) {
    goto LABEL_14;
  }
  int v20 = 136446210;
  v21 = "-[SSDownloadManager _sendObserverConnection]";
  LODWORD(v19) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v20, v19);
    free(v8);
    SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_14:
  }
LABEL_16:
  if (self->_observerConnection)
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v15, "0", 18);
    v16 = [(SSDownloadManagerOptions *)self->_options downloadKinds];
    SSXPCDictionarySetObject(v15, "1", v16);

    id v17 = [(SSXPCConnection *)self->_observerConnection createXPCEndpoint];
    xpc_dictionary_set_value(v15, "2", v17);
    id v18 = [(SSDownloadManager *)self _newOptionsDictionary];
    xpc_dictionary_set_value(v15, "3", v18);
    [(SSXPCConnection *)self->_connection sendMessage:v15];
  }
}

- (SSDownloadManager)initWithManagerOptions:(id)a3
{
  id v4 = a3;
  int v5 = [v4 downloadKinds];
  if (![v5 count])
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must have download kinds"];
    self = 0;
    goto LABEL_17;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    uint64_t v10 = [v4 downloadKinds];
    int v11 = SSDownloadKindsContainsBookToShimKind(v10);

    uint64_t v12 = [v4 downloadKinds];
    char v13 = [v12 containsObject:@"software"];

    if (!v11 || (v13 & 1) != 0)
    {
      if (v11)
      {
        uint64_t v14 = SSDownloadManagerBookShim;
      }
      else
      {
        xpc_object_t v15 = [v4 downloadKinds];
        int v16 = [v15 containsObject:@"software"];

        if (!v16)
        {
LABEL_16:
          self = [(SSDownloadManager *)self _initSSDownloadManagerWithOptions:v4];
          goto LABEL_17;
        }
        uint64_t v14 = SSDownloadManagerAppShim;
      }
    }
    else
    {
      uint64_t v14 = SSDownloadManagerBookShim2;
    }
    id v17 = (SSDownloadManager *)[[v14 alloc] initWithManagerOptions:v4];

    self = v17;
    goto LABEL_17;
  }
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class()) {
    goto LABEL_16;
  }
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class()) {
    goto LABEL_16;
  }
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class()) {
    goto LABEL_16;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Subclassing of SSDownloadManager is not supported"];
LABEL_17:

  return self;
}

- (void)dealloc
{
  notify_cancel(self->_launchNotificationToken);
  [(SSXPCConnection *)self->_connection setDisconnectBlock:0];
  [(SSXPCConnection *)self->_observerConnection setMessageBlock:0];
  [(NSArray *)self->_activeDownloads makeObjectsPerformSelector:sel__becomeManagedOnConnection_ withObject:0];
  [(NSArray *)self->_downloads makeObjectsPerformSelector:sel__becomeManagedOnConnection_ withObject:0];
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadManager;
  [(SSDownloadManager *)&v3 dealloc];
}

- (id)_newOptionsDictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = [(SSDownloadManagerOptions *)self->_options persistenceIdentifier];
  SSXPCDictionarySetObject(v3, "0", v4);

  xpc_dictionary_set_BOOL(v3, "1", [(SSDownloadManagerOptions *)self->_options shouldFilterExternalOriginatedDownloads]);
  int v5 = [(SSDownloadManagerOptions *)self->_options prefetchedDownloadProperties];
  SSXPCDictionarySetObject(v3, "2", v5);

  uint64_t v6 = [(SSDownloadManagerOptions *)self->_options prefetchedDownloadExternalProperties];
  SSXPCDictionarySetObject(v3, "3", v6);

  return v3;
}

- (void)_connectAsObserver
{
  xpc_object_t v3 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  connection = self->_connection;
  self->_connection = v3;

  int v5 = +[SSWeakReference weakReferenceWithObject:self];
  uint64_t v6 = objc_alloc_init(SSXPCConnection);
  observerConnection = self->_observerConnection;
  self->_observerConnection = v6;

  uint64_t v8 = self->_observerConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__SSDownloadManager__connectAsObserver__block_invoke;
  v10[3] = &unk_1E5BAB5C0;
  id v11 = v5;
  id v9 = v5;
  [(SSXPCConnection *)v8 setMessageBlock:v10];
  [(SSDownloadManager *)self _sendObserverConnection];
}

- (id)_initSSDownloadManagerWithOptions:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SSDownloadManager;
  int v5 = [(SSDownloadManager *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    options = v5->_options;
    v5->_options = (SSDownloadManagerOptions *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.storeservices.SSDownloadManager.access", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.storeservices.SSDownloadManager.background", 0);
    backgroundQueue = v5->_backgroundQueue;
    v5->_backgroundQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.storeservices.SSDownloadManager.observer", 0);
    observerQueue = v5->_observerQueue;
    v5->_observerQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[SSWeakReference weakReferenceWithObject:v5];
    xpc_object_t v15 = (const char *)[(__CFString *)@"com.apple.iTunesStore.daemon.launched" UTF8String];
    int v16 = v5->_accessQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __55__SSDownloadManager__initSSDownloadManagerWithOptions___block_invoke;
    handler[3] = &unk_1E5BA95E8;
    id v20 = v14;
    id v17 = v14;
    notify_register_dispatch(v15, &v5->_launchNotificationToken, v16, handler);
    [(SSDownloadManager *)v5 _connectAsObserver];
  }
  return v5;
}

void __39__SSDownloadManager__connectAsObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 object];
  [v7 _handleMessage:v6 fromServerConnection:v5];
}

- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SSDownloadManager__handleMessage_fromServerConnection___block_invoke;
  block[3] = &unk_1E5BA7068;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

uint64_t __33__SSDownloadManager_addObserver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 80);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

uint64_t __44__SSDownloadManager_getDownloadsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedDownloads, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observerConnection, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_activeDownloads, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __57__SSDownloadManager__handleMessage_fromServerConnection___block_invoke(uint64_t a1)
{
  int64_t int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "0");
  if (int64)
  {
    int64_t v3 = int64;
    id reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
    switch(v3)
    {
      case 1003:
        [*(id *)(a1 + 48) _handleDownloadsChanged:*(void *)(a1 + 32)];
        break;
      case 1004:
        [*(id *)(a1 + 48) _handleDownloadStatesChanged:*(void *)(a1 + 32)];
        break;
      case 1006:
        [*(id *)(a1 + 48) _handleDownloadKindsUsingNetworkChanged:*(void *)(a1 + 32)];
        break;
      case 1008:
        [*(id *)(a1 + 48) _handleDownloadsRemoved:*(void *)(a1 + 32)];
        break;
      default:
        break;
    }
  }
}

+ (id)IPodDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"book", @"coached-audio", @"document", @"feature-movie", @"song", @"music-video", @"podcast", @"ringtone", @"tv-episode", @"tone", @"videoPodcast", 0);
}

+ (id)ITunesDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"book", @"feature-movie", @"song", @"music-video", @"ringtone", @"tv-episode", @"tone", 0);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SSDownloadManager_addObserver___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

void __30__SSDownloadManager_downloads__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _copyDownloads];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __44__SSDownloadManager_getDownloadsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _copyDownloads];
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SSDownloadManager_getDownloadsUsingBlock___block_invoke_2;
  v6[3] = &unk_1E5BA7328;
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

- (id)_copyDownloads
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3)
    {
      uint64_t v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    id v6 = [v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      int v7 = v5;
    }
    else {
      int v7 = v5 & 2;
    }
    if (v7)
    {
      int v27 = 136446210;
      v28 = "-[SSDownloadManager _copyDownloads]";
      LODWORD(v26) = 12;
      v25 = &v27;
      id v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v27, v26);
      free(v8);
      SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_15;
  }
LABEL_16:
  if (self->_downloadsChanged || (v23 = self->_downloads) == 0)
  {
    id v15 = -[SSDownloadManager _copyDownloadsForMessage:downloadIDs:](self, "_copyDownloadsForMessage:downloadIDs:", 14, 0, v25);
    int v16 = v15;
    if (self->_removedDownloads)
    {
      uint64_t v17 = [v15 count];
      if (v17 >= 1)
      {
        unint64_t v18 = v17 + 1;
        do
        {
          removedDownloads = self->_removedDownloads;
          id v20 = [v16 objectAtIndex:v18 - 2];
          LODWORD(removedDownloads) = [(NSMutableSet *)removedDownloads containsObject:v20];

          if (removedDownloads) {
            [v16 removeObjectAtIndex:v18 - 2];
          }
          --v18;
        }
        while (v18 > 1);
      }
    }
    if (self->_downloadsChanged || ![(NSArray *)self->_downloads isEqualToArray:v16])
    {
      objc_super v21 = (NSArray *)[v16 copy];
      downloads = self->_downloads;
      self->_downloads = v21;
    }
    self->_downloadsChanged = 0;

    v23 = self->_downloads;
  }
  return v23;
}

- (id)_copyDownloadsForMessage:(int64_t)a3 downloadIDs:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, "0", a3);
  xpc_dictionary_set_BOOL(v8, "1", [(SSDownloadManagerOptions *)self->_options shouldFilterExternalOriginatedDownloads]);
  if (v6) {
    xpc_dictionary_set_value(v8, "2", v6);
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  connection = self->_connection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__SSDownloadManager__copyDownloadsForMessage_downloadIDs___block_invoke;
  v16[3] = &unk_1E5BAB638;
  v16[4] = self;
  id v11 = v7;
  id v17 = v11;
  dispatch_semaphore_t v18 = v9;
  uint64_t v12 = v9;
  [(SSXPCConnection *)connection sendMessage:v8 withReply:v16];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_t v13 = v18;
  id v14 = v11;

  return v14;
}

void __58__SSDownloadManager__copyDownloadsForMessage_downloadIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
  {
    uint64_t v5 = xpc_dictionary_get_value(v4, "0");
    id v6 = (void *)v5;
    if (v5 && MEMORY[0x1A62689E0](v5) == MEMORY[0x1E4F14568])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58__SSDownloadManager__copyDownloadsForMessage_downloadIDs___block_invoke_2;
      v8[3] = &unk_1E5BAB610;
      id v7 = *(void **)(a1 + 40);
      v8[4] = *(void *)(a1 + 32);
      id v9 = v7;
      xpc_array_apply(v6, v8);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)getDownloadsUsingBlock:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SSDownloadManager_getDownloadsUsingBlock___block_invoke;
  v7[3] = &unk_1E5BA7350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (NSArray)downloads
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__30;
  uint64_t v10 = __Block_byref_object_dispose__30;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__SSDownloadManager_downloads__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __55__SSDownloadManager__initSSDownloadManagerWithOptions___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) object];
  [v1 _connectAfterDaemonLaunch];
}

- (SSDownloadManager)initWithDownloadKinds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(SSDownloadManagerOptions);
  [(SSDownloadManagerOptions *)v5 setDownloadKinds:v4];

  uint64_t v6 = [(SSDownloadManager *)self initWithManagerOptions:v5];
  return v6;
}

+ (void)reconnectToLSApplicationWorkspace
{
  id v3 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v2 = SSXPCCreateMessageDictionary(120);
  [(SSXPCConnection *)v3 sendMessage:v2];
}

+ (void)removePersistenceIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4)
    {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    id v7 = [v4 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      int v8 = v6;
    }
    else {
      int v8 = v6 & 2;
    }
    if (v8)
    {
      int v19 = 136446210;
      id v20 = "+[SSDownloadManager removePersistenceIdentifier:]";
      LODWORD(v18) = 12;
      id v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v19, v18);
      free(v9);
      SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_15;
  }
LABEL_16:
  int v16 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v17, "0", 6);
  SSXPCDictionarySetObject(v17, "1", v3);

  [(SSXPCConnection *)v16 sendMessage:v17];
}

+ (void)setDownloadHandler:(id)a3
{
  id v5 = a3;
  pthread_mutex_lock(&__GlobalHandlerLock);
  if ((id)__GlobalHandler != v5)
  {
    objc_storeStrong((id *)&__GlobalHandler, a3);
    [a1 _sendGlobalHandler:__GlobalHandler];
  }
  pthread_mutex_unlock(&__GlobalHandlerLock);
}

- (NSArray)activeDownloads
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3)
    {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    int v6 = [v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      int v7 = v5;
    }
    else {
      int v7 = v5 & 2;
    }
    if (v7)
    {
      LODWORD(v20) = 136446210;
      *(void *)((char *)&v20 + 4) = "-[SSDownloadManager activeDownloads]";
      LODWORD(v18) = 12;
      int v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v20, v18);
      free(v8);
      SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_15;
  }
LABEL_16:
  *(void *)&long long v20 = 0;
  *((void *)&v20 + 1) = &v20;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__30;
  v23 = __Block_byref_object_dispose__30;
  id v24 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SSDownloadManager_activeDownloads__block_invoke;
  block[3] = &unk_1E5BA6FC8;
  void block[4] = self;
  block[5] = &v20;
  dispatch_sync(accessQueue, block);
  id v16 = *(id *)(*((void *)&v20 + 1) + 40);
  _Block_object_dispose(&v20, 8);

  return (NSArray *)v16;
}

void __36__SSDownloadManager_activeDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24) || (id v3 = *(void **)(v2 + 16)) == 0)
  {
    int v4 = (void *)[(id)v2 _copyDownloadsForMessage:8 downloadIDs:0];
    if (([*(id *)(*(void *)(a1 + 32) + 16) isEqualToArray:v4] & 1) == 0)
    {
      uint64_t v5 = [v4 copy];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(void **)(v6 + 16);
      *(void *)(v6 + 16) = v5;
    }
    [*(id *)(*(void *)(a1 + 32) + 16) makeObjectsPerformSelector:sel__resetStatus];
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;

    id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  int v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v8, v3);
}

- (void)addDownloads:(id)a3 completionBlock:(id)a4
{
}

- (BOOL)canCancelDownload:(id)a3
{
  return [a3 isCancelable];
}

- (void)cancelAllDownloadsWithCompletionBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v19 = 136446210;
      long long v20 = "-[SSDownloadManager cancelAllDownloadsWithCompletionBlock:]";
      LODWORD(v18) = 12;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v19, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v17, "0", 0);
  xpc_dictionary_set_BOOL(v17, "1", [(SSDownloadManagerOptions *)self->_options shouldFilterExternalOriginatedDownloads]);
  [(SSDownloadManager *)self _sendMessage:v17 withCompletionBlock:v4];
}

- (void)cancelDownloads:(id)a3 completionBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    int v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      int v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v34 = 136446210;
      v35 = "-[SSDownloadManager cancelDownloads:completionBlock:]";
      LODWORD(v28) = 12;
      int v27 = &v34;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v34, v28);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 1);
  xpc_object_t v21 = xpc_array_create(0, 0);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v22 = v6;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        xpc_array_set_int64(v21, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "persistentIdentifier", v27));
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v24);
  }

  xpc_dictionary_set_value(v20, "1", v21);
  [(SSDownloadManager *)self _sendMessage:v20 withCompletionBlock:v7];
}

- (void)finishDownloads:(id)a3
{
  id v4 = a3;
  [(SSDownloadManager *)self _willFinishDownloads:v4];
  [(SSDownloadManager *)self _finishDownloads:v4];
}

- (void)insertDownloads:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5
{
}

- (void)insertDownloads:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5
{
}

- (BOOL)isUsingNetwork
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SSDownloadManager_isUsingNetwork__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__SSDownloadManager_isUsingNetwork__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 57);
  return result;
}

- (SSDownloadManagerOptions)managerOptions
{
  uint64_t v2 = (void *)[(SSDownloadManagerOptions *)self->_options copy];
  return (SSDownloadManagerOptions *)v2;
}

- (void)moveDownload:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5
{
}

- (void)moveDownload:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5
{
}

- (void)pauseDownloads:(id)a3 completionBlock:(id)a4
{
}

- (void)resumeDownloads:(id)a3 completionBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      uint64_t v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v34 = 136446210;
      v35 = "-[SSDownloadManager resumeDownloads:completionBlock:]";
      LODWORD(v28) = 12;
      int v27 = &v34;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v34, v28);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 19);
  xpc_object_t v21 = xpc_array_create(0, 0);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v22 = v6;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        xpc_array_set_int64(v21, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "persistentIdentifier", v27));
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v24);
  }

  xpc_dictionary_set_value(v20, "1", v21);
  [(SSDownloadManager *)self _sendMessage:v20 withCompletionBlock:v7];
}

- (void)restartDownloads:(id)a3 completionBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      uint64_t v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v34 = 136446210;
      v35 = "-[SSDownloadManager restartDownloads:completionBlock:]";
      LODWORD(v28) = 12;
      int v27 = &v34;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v34, v28);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 20);
  xpc_object_t v21 = xpc_array_create(0, 0);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v22 = v6;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        xpc_array_set_int64(v21, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "persistentIdentifier", v27));
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v24);
  }

  xpc_dictionary_set_value(v20, "1", v21);
  [(SSDownloadManager *)self _sendMessage:v20 withCompletionBlock:v7];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SSDownloadManager_removeObserver___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __36__SSDownloadManager_removeObserver___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 80)) {
    return [*(id *)(*(void *)(result + 32) + 80) removeObject:*(void *)(result + 40)];
  }
  return result;
}

- (void)setDownloads:(id)a3 completionBlock:(id)a4
{
}

+ (id)EBookDownloadManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSDownloadManager_EBookDownloadManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (EBookDownloadManager_sOnce != -1) {
    dispatch_once(&EBookDownloadManager_sOnce, block);
  }
  uint64_t v2 = (void *)EBookDownloadManager_sEBookManager;
  return v2;
}

void __41__SSDownloadManager_EBookDownloadManager__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)objc_opt_class());
  id v5 = [*(id *)(a1 + 32) EBookDownloadKinds];
  uint64_t v3 = [v2 initWithDownloadKinds:v5];
  id v4 = (void *)EBookDownloadManager_sEBookManager;
  EBookDownloadManager_sEBookManager = v3;
}

+ (id)IPodDownloadManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SSDownloadManager_IPodDownloadManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (IPodDownloadManager_sOnce != -1) {
    dispatch_once(&IPodDownloadManager_sOnce, block);
  }
  id v2 = (void *)IPodDownloadManager_sIPodManager;
  return v2;
}

void __40__SSDownloadManager_IPodDownloadManager__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)objc_opt_class());
  id v5 = [*(id *)(a1 + 32) IPodDownloadKinds];
  uint64_t v3 = [v2 initWithDownloadKinds:v5];
  id v4 = (void *)IPodDownloadManager_sIPodManager;
  IPodDownloadManager_sIPodManager = v3;
}

+ (id)softwareDownloadManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SSDownloadManager_softwareDownloadManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (softwareDownloadManager_sOnce != -1) {
    dispatch_once(&softwareDownloadManager_sOnce, block);
  }
  id v2 = (void *)softwareDownloadManager_sSoftwareManager;
  return v2;
}

void __44__SSDownloadManager_softwareDownloadManager__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)objc_opt_class());
  id v5 = [*(id *)(a1 + 32) softwareDownloadKinds];
  uint64_t v3 = [v2 initWithDownloadKinds:v5];
  id v4 = (void *)softwareDownloadManager_sSoftwareManager;
  softwareDownloadManager_sSoftwareManager = v3;
}

+ (id)allStoreDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"book", @"coached-audio", @"document", @"ebook", @"feature-movie", @"song", @"music-video", @"podcast", @"ringtone", @"tv-episode", @"tone", @"videoPodcast", 0);
}

+ (id)EBookDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"ebook", 0);
}

+ (void)retryAllRestoreDownloads
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!SSIsDaemon())
  {
    if (!SSIsInternalBuild() || !_os_feature_enabled_impl()) {
      goto LABEL_20;
    }
    uint64_t v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3)
    {
      uint64_t v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    id v6 = [v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      int v7 = v5;
    }
    else {
      int v7 = v5 & 2;
    }
    if (v7)
    {
      int v18 = 136446210;
      uint64_t v19 = "+[SSDownloadManager retryAllRestoreDownloads]";
      LODWORD(v17) = 12;
      id v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_19:

LABEL_20:
        uint64_t v15 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
        xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_int64(v16, "0", 37);
        [(SSXPCConnection *)v15 sendMessage:v16];

        return;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v18, v17);
      free(v8);
      SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_19;
  }
  Class v2 = NSClassFromString(&cfstr_Downloadmanage.isa);
  [(objc_class *)v2 retryAllRestoreDownloads];
}

+ (id)softwareDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"software", 0);
}

- (void)_pauseDownloads:(id)a3 completionBlock:(id)a4
{
}

- (void)reloadFromServer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3)
    {
      uint64_t v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    id v6 = [v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      int v7 = v5;
    }
    else {
      int v7 = v5 & 2;
    }
    if (v7)
    {
      int v17 = 136446210;
      int v18 = "-[SSDownloadManager reloadFromServer]";
      LODWORD(v16) = 12;
      id v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v17, v16);
      free(v8);
      SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v15, "0", 5);
  [(SSXPCConnection *)self->_connection sendMessage:v15];
}

- (void)setDownloads:(id)a3 forKinds:(id)a4 completionBlock:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v11 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v11)
    {
      uint64_t v11 = +[SSLogConfig sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    uint64_t v14 = [v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      int v15 = v13;
    }
    else {
      int v15 = v13 & 2;
    }
    if (v15)
    {
      int v46 = 136446210;
      v47 = "-[SSDownloadManager setDownloads:forKinds:completionBlock:]";
      LODWORD(v36) = 12;
      v35 = &v46;
      uint64_t v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v46, v36);
      free(v16);
      SSFileLog(v11, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v23 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v23, "0", 39);
  xpc_dictionary_set_BOOL(v23, "1", 1);
  if (v9) {
    SSXPCDictionarySetObject(v23, "3", v9);
  }
  xpc_object_t v24 = xpc_array_create(0, 0);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v25 = v8;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "copyXPCEncoding", v35);
        if (v30) {
          xpc_array_append_value(v24, v30);
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v27);
  }

  xpc_dictionary_set_value(v23, "2", v24);
  [v25 makeObjectsPerformSelector:sel__becomeManagedOnConnection_ withObject:self->_connection];
  connection = self->_connection;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __59__SSDownloadManager_setDownloads_forKinds_completionBlock___block_invoke;
  v37[3] = &unk_1E5BAB598;
  v37[4] = self;
  id v38 = v25;
  id v39 = v23;
  id v40 = v10;
  id v32 = v10;
  id v33 = v23;
  id v34 = v25;
  [(SSXPCConnection *)connection sendMessage:v33 withReply:v37];
}

uint64_t __59__SSDownloadManager_setDownloads_forKinds_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleReply:a2 forDownloads:*(void *)(a1 + 40) message:*(void *)(a1 + 48) isRetry:0 block:*(void *)(a1 + 56)];
}

+ (void)_triggerDownloads
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!SSIsInternalBuild() || !_os_feature_enabled_impl()) {
    goto LABEL_16;
  }
  Class v2 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v2)
  {
    Class v2 = +[SSLogConfig sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  int v5 = [v2 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    int v6 = v4;
  }
  else {
    int v6 = v4 & 2;
  }
  if (!v6) {
    goto LABEL_14;
  }
  int v18 = 136446210;
  uint64_t v19 = "+[SSDownloadManager _triggerDownloads]";
  LODWORD(v17) = 12;
  int v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v18, v17);
    free(v7);
    SSFileLog(v2, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_14:
  }
LABEL_16:
  if (SSIsDaemon())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.itunesstored.triggerdownloads", 0, 0, 1u);
  }
  else
  {
    int v15 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v16, "0", 41);
    [(SSXPCConnection *)v15 sendMessage:v16];
  }
}

- (void)_finishDownloads:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    int v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      int v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    uint64_t v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v33 = 136446210;
      id v34 = "-[SSDownloadManager _finishDownloads:]";
      LODWORD(v26) = 12;
      id v25 = &v33;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v33, v26);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v17, "0", 7);
  xpc_object_t v18 = xpc_array_create(0, 0);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = v4;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        xpc_array_set_int64(v18, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "persistentIdentifier", v25));
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v21);
  }

  xpc_dictionary_set_value(v17, "1", v18);
  connection = self->_connection;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __38__SSDownloadManager__finishDownloads___block_invoke;
  v27[3] = &unk_1E5BA9D98;
  v27[4] = self;
  [(SSXPCConnection *)connection sendMessage:v17 withReply:v27];
}

void __38__SSDownloadManager__finishDownloads___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  Class v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SSDownloadManager__finishDownloads___block_invoke_2;
  block[3] = &unk_1E5BA7040;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void __38__SSDownloadManager__finishDownloads___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  Class v2 = *(void **)(v1 + 96);
  *(void *)(v1 + 96) = 0;
}

- (void)_willFinishDownloads:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SSDownloadManager__willFinishDownloads___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __42__SSDownloadManager__willFinishDownloads___block_invoke(uint64_t a1)
{
  Class v2 = *(void **)(*(void *)(a1 + 32) + 96);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v3;

    Class v2 = *(void **)(*(void *)(a1 + 32) + 96);
  }
  [v2 addObjectsFromArray:*(void *)(a1 + 40)];
  id v16 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 96);
      uint64_t v11 = [*(id *)(v9 + 48) objectAtIndex:i];
      LODWORD(v10) = [v10 containsObject:v11];

      if (v10) {
        [v16 addIndex:i];
      }
    }
  }
  if ([v16 count])
  {
    uint64_t v12 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) mutableCopy];
    [v12 removeObjectsAtIndexes:v16];
    uint64_t v13 = [v12 copy];
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 48);
    *(void *)(v14 + 48) = v13;
  }
}

- (id)_XPCConnection
{
  return self->_connection;
}

+ (void)_sendGlobalHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!SSIsInternalBuild() || !_os_feature_enabled_impl()) {
    goto LABEL_16;
  }
  uint64_t v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    uint64_t v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_14;
  }
  int v20 = 136446210;
  uint64_t v21 = "+[SSDownloadManager _sendGlobalHandler:]";
  LODWORD(v19) = 12;
  uint64_t v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v20, v19);
    free(v9);
    SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
LABEL_14:
  }
LABEL_16:
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v16, "0", 22);
  if (v3) {
    int64_t v17 = [v3 handlerIdentifier];
  }
  else {
    int64_t v17 = 0;
  }
  xpc_dictionary_set_int64(v16, "1", v17);
  xpc_object_t v18 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  [(SSXPCConnection *)v18 sendMessage:v16];
}

- (void)_connectAfterDaemonLaunch
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(SSDownloadManager *)self _sendObserverConnection];
  [(SSDownloadManager *)self _loadDownloadKindsUsingNetwork];
  [(SSDownloadManager *)self _resetAllDownloads];
  [(SSDownloadManager *)self _sendDownloadsChanged:0];
  pthread_mutex_lock(&__GlobalHandlerLock);
  if (__GlobalHandler)
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3)
    {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    int v6 = [v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      int v7 = v5;
    }
    else {
      int v7 = v5 & 2;
    }
    if (v7)
    {
      int v16 = 138412290;
      uint64_t v17 = __GlobalHandler;
      LODWORD(v15) = 12;
      int v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_14:

        +[SSDownloadManager _sendGlobalHandler:__GlobalHandler];
        goto LABEL_15;
      }
      int v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v16, v15);
      free(v8);
      SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_14;
  }
LABEL_15:
  pthread_mutex_unlock(&__GlobalHandlerLock);
}

- (id)_copyDownloadKindsUsingNetwork
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3)
    {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    int v6 = [v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      int v7 = v5;
    }
    else {
      int v7 = v5 & 2;
    }
    if (v7)
    {
      LODWORD(v26) = 136446210;
      *(void *)((char *)&v26 + 4) = "-[SSDownloadManager _copyDownloadKindsUsingNetwork]";
      LODWORD(v22) = 12;
      int v8 = (void *)_os_log_send_and_compose_impl();

      if (v8)
      {
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v26, v22);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
      }
    }
    else
    {
    }
  }
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = &v26;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__30;
  long long v29 = __Block_byref_object_dispose__30;
  id v30 = 0;
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v16, "0", 29);
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  connection = self->_connection;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __51__SSDownloadManager__copyDownloadKindsUsingNetwork__block_invoke;
  v23[3] = &unk_1E5BAB5E8;
  id v25 = &v26;
  uint64_t v19 = v17;
  xpc_object_t v24 = v19;
  [(SSXPCConnection *)connection sendMessage:v16 withReply:v23];
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  id v20 = *(id *)(*((void *)&v26 + 1) + 40);

  _Block_object_dispose(&v26, 8);
  return v20;
}

void __51__SSDownloadManager__copyDownloadKindsUsingNetwork__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict && MEMORY[0x1A62689E0](xdict) == MEMORY[0x1E4F14590])
  {
    uint64_t v3 = xpc_dictionary_get_value(xdict, "0");
    CFDictionaryRef v4 = (const __CFDictionary *)v3;
    if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14568])
    {
      CFArrayRef v5 = SSXPCCreateCFObjectFromXPCObject(v4);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      int v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __58__SSDownloadManager__copyDownloadsForMessage_downloadIDs___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F145C0])
  {
    id v5 = [(SSEntity *)[SSDownload alloc] _initWithPersistentIdentifier:xpc_int64_get_value(v4)];
  }
  else
  {
    if (MEMORY[0x1A62689E0](v4) != MEMORY[0x1E4F14590]) {
      goto LABEL_7;
    }
    id v5 = [[SSDownload alloc] _initWithLocalPropertyValues:v4];
  }
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 _becomeManagedOnConnection:*(void *)(*(void *)(a1 + 32) + 40)];
    [*(id *)(a1 + 40) addObject:v6];
  }
LABEL_7:

  return 1;
}

- (BOOL)_supportsSoftwareKind
{
  return 1;
}

- (void)_handleDownloadKindsUsingNetworkChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = (id)SSXPCDictionaryCopyObjectWithClass(v4, "1", v5);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SSDownloadManager *)self _reloadIsUsingNetworkWithDownloadKinds:v6];
  }
  else {
    [(SSDownloadManager *)self _loadDownloadKindsUsingNetwork];
  }
}

- (void)_handleDownloadsChanged:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v5 = xpc_dictionary_get_value(v4, "1");
  if ([(NSArray *)self->_downloads count]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6 || MEMORY[0x1A62689E0](v5) != MEMORY[0x1E4F14568] || !xpc_array_get_count(v5)) {
    goto LABEL_43;
  }
  id v52 = v4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInteger:0x7FFFFFFFFFFFFFFFLL];
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __45__SSDownloadManager__handleDownloadsChanged___block_invoke;
  applier[3] = &unk_1E5BAB610;
  id v9 = v7;
  id v62 = v9;
  id v51 = v8;
  id v63 = v51;
  xpc_array_apply(v5, applier);
  uint64_t v10 = [(NSArray *)self->_downloads count];
  v55 = v9;
  uint64_t v11 = [v9 count];
  uint64_t v12 = v11;
  v53 = v5;
  if (v10 >= 1 && v11 >= 1)
  {
    uint64_t v13 = 1;
    do
    {
      uint64_t v14 = [(NSArray *)self->_downloads objectAtIndex:v13 - 1];
      uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithLongLong:", objc_msgSend(v14, "persistentIdentifier"));
      xpc_object_t v16 = [v55 objectForKey:v15];

      if (v16)
      {
        dispatch_semaphore_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInteger:v13 - 1];
        [v55 setObject:v17 forKey:v15];
        --v12;
      }
      if (v13 >= v10) {
        break;
      }
      ++v13;
    }
    while (v12 > 0);
  }
  uint64_t v5 = v53;
  if (v12)
  {
LABEL_42:

    id v4 = v52;
LABEL_43:
    [(SSDownloadManager *)self _resetAllDownloads];
    int v46 = self;
    id v47 = 0;
    goto LABEL_44;
  }
  unint64_t v18 = 0x1E4F28000uLL;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v19 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v19)
    {
      uint64_t v19 = +[SSLogConfig sharedConfig];
    }
    int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      v20 |= 2u;
    }
    uint64_t v21 = [v19 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      int v22 = v20;
    }
    else {
      int v22 = v20 & 2;
    }
    if (v22)
    {
      int v65 = 136446210;
      v66 = "-[SSDownloadManager _handleDownloadsChanged:]";
      LODWORD(v50) = 12;
      v49 = &v65;
      xpc_object_t v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v65, v50, v51);
      free(v23);
      SSFileLog(v19, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v21);
    }

    goto LABEL_28;
  }
LABEL_29:
  id v30 = -[SSDownloadManager _copyDownloadsForMessage:downloadIDs:](self, "_copyDownloadsForMessage:downloadIDs:", 14, v53, v49);
  uint64_t v31 = [v30 count];
  id v32 = v55;
  if (v31 != [v55 count])
  {

    goto LABEL_42;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v30;
  uint64_t v33 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = 0;
    uint64_t v36 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v58 != v36) {
          objc_enumerationMutation(obj);
        }
        id v38 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        id v39 = objc_msgSend(objc_alloc(*(Class *)(v18 + 3792)), "initWithLongLong:", objc_msgSend(v38, "persistentIdentifier"));
        id v40 = [v32 objectForKey:v39];
        long long v41 = v40;
        if (v40 && [v40 integerValue] != 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v42 = -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", [v41 integerValue]);
          [v38 _localExternalValues];
          v44 = long long v43 = self;
          [v42 _setLocalExternalValues:v44];

          v45 = [v38 _localValues];
          [v42 _setLocalValues:v45];

          self = v43;
          id v32 = v55;
          [v54 addObject:v42];
          ++v35;
        }
        unint64_t v18 = 0x1E4F28000;
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v34);
  }
  else
  {
    uint64_t v35 = 0;
  }

  uint64_t v48 = [obj count];
  BOOL v6 = v35 == v48;
  id v4 = v52;
  uint64_t v5 = v53;
  if (!v6) {
    goto LABEL_43;
  }
  if (!self->_observers) {
    goto LABEL_45;
  }
  int v46 = self;
  id v47 = v54;
LABEL_44:
  [(SSDownloadManager *)v46 _sendDownloadsChanged:v47];
LABEL_45:
}

uint64_t __45__SSDownloadManager__handleDownloadsChanged___block_invoke(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  CFArrayRef v4 = SSXPCCreateCFObjectFromXPCObject(a3);
  if (v4) {
    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:v4];
  }

  return 1;
}

- (void)_handleDownloadsRemoved:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = xpc_dictionary_get_value(a3, "1");
  uint64_t v5 = (void *)v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14568] && [(NSArray *)self->_downloads count])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __45__SSDownloadManager__handleDownloadsRemoved___block_invoke;
    applier[3] = &unk_1E5BA73C8;
    id v7 = v6;
    id v25 = v7;
    xpc_array_apply(v5, applier);
    if ([v7 count])
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v19 = self;
      id v9 = self->_downloads;
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithLongLong:", objc_msgSend(v14, "persistentIdentifier"));
            if (([v7 containsObject:v15] & 1) == 0) {
              [v8 addObject:v14];
            }
          }
          uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
        }
        while (v11);
      }

      uint64_t v16 = [(NSArray *)v19->_downloads count];
      if (v16 != [v8 count])
      {
        uint64_t v17 = [v8 copy];
        downloads = v19->_downloads;
        v19->_downloads = (NSArray *)v17;

        [(SSDownloadManager *)v19 _sendDownloadsChanged:0];
      }
    }
  }
}

uint64_t __45__SSDownloadManager__handleDownloadsRemoved___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F145C0])
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithLongLong:xpc_int64_get_value(v4)];
    [*(id *)(a1 + 32) addObject:v5];
  }
  return 1;
}

- (void)_handleDownloadStatesChanged:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_observers)
  {
    xpc_object_t xdict = v4;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v56 = self;
    id v7 = self->_observers;
    uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v77 objects:v84 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v78 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v77 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v77 objects:v84 count:16];
      }
      while (v9);
    }

    uint64_t v13 = v56;
    v56->_activeDownloadsChanged = 1;
    uint64_t v5 = xdict;
    if ([v6 count])
    {
      uint64_t v14 = xpc_dictionary_get_value(xdict, "1");
      uint64_t v15 = (void *)v14;
      if (v14 && MEMORY[0x1A62689E0](v14) == MEMORY[0x1E4F14568])
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        unint64_t v18 = [(SSDownloadManagerOptions *)v56->_options prefetchedDownloadExternalProperties];
        uint64_t v19 = [(SSDownloadManagerOptions *)v56->_options prefetchedDownloadProperties];
        applier[0] = MEMORY[0x1E4F143A8];
        applier[1] = 3221225472;
        applier[2] = __50__SSDownloadManager__handleDownloadStatesChanged___block_invoke;
        applier[3] = &unk_1E5BA73C8;
        id v20 = v16;
        id v76 = v20;
        xpc_array_apply(v15, applier);
        long long v58 = v20;
        id v51 = v19;
        uint64_t v52 = [v20 count];
        v49 = v15;
        uint64_t v50 = v18;
        id v54 = v17;
        if (v52 == 1)
        {
          uint64_t v21 = [v18 count];
          BOOL v53 = v21 == 0;
          unint64_t v22 = 0x1E4F1C000uLL;
          if (v21)
          {
            CFArrayRef v23 = SSXPCDictionaryCopyCFObject(xdict, "2");
            id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v71 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            id v25 = v18;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v71 objects:v83 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v72;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v72 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v30 = *(void *)(*((void *)&v71 + 1) + 8 * j);
                  uint64_t v31 = [(__CFArray *)v23 objectForKey:v30];
                  if (v31) {
                    [v24 setObject:v31 forKey:v30];
                  }
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v71 objects:v83 count:16];
              }
              while (v27);
            }

            uint64_t v13 = v56;
            uint64_t v5 = xdict;
            uint64_t v19 = v51;
            unint64_t v22 = 0x1E4F1C000;
          }
          else
          {
            id v24 = 0;
          }
          if ([v19 count])
          {
            CFArrayRef v33 = SSXPCDictionaryCopyCFObject(v5, "3");
            id v32 = objc_alloc_init(*(Class *)(v22 + 2656));
            long long v67 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            id v34 = v19;
            uint64_t v35 = [v34 countByEnumeratingWithState:&v67 objects:v82 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v68;
              do
              {
                for (uint64_t k = 0; k != v36; ++k)
                {
                  if (*(void *)v68 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  uint64_t v39 = *(void *)(*((void *)&v67 + 1) + 8 * k);
                  id v40 = [(__CFArray *)v33 objectForKey:v39];
                  if (v40) {
                    [v32 setObject:v40 forKey:v39];
                  }
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v67 objects:v82 count:16];
              }
              while (v36);
            }

            BOOL v53 = 0;
            uint64_t v13 = v56;
          }
          else
          {
            id v32 = 0;
          }
        }
        else
        {
          id v32 = 0;
          id v24 = 0;
          BOOL v53 = 1;
        }
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id obj = [(SSDownloadManager *)v13 _copyDownloads];
        uint64_t v41 = [obj countByEnumeratingWithState:&v63 objects:v81 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v64;
          uint64_t v44 = v52;
          do
          {
            for (uint64_t m = 0; m != v42; ++m)
            {
              if (*(void *)v64 != v43) {
                objc_enumerationMutation(obj);
              }
              int v46 = *(void **)(*((void *)&v63 + 1) + 8 * m);
              id v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithLongLong:", objc_msgSend(v46, "persistentIdentifier"));
              if ([v58 containsObject:v47])
              {
                if ([v24 count])
                {
                  [v46 _addCachedExternalValues:v24];
                  if (![v32 count])
                  {
                    if (v52 < 2) {
                      goto LABEL_55;
                    }
LABEL_52:
                    [v46 _setDirtyCachedProperties:v51];
LABEL_55:
                    if (v53) {
                      [v46 _resetStatus];
                    }
                    [v54 addObject:v46];
                    --v44;
                    goto LABEL_58;
                  }
                }
                else if (v52 <= 1)
                {
                  if (![v32 count]) {
                    goto LABEL_55;
                  }
                }
                else
                {
                  [v46 _setDirtyCachedExternalProperties:v50];
                  if (![v32 count]) {
                    goto LABEL_52;
                  }
                }
                [v46 _addCachedPropertyValues:v32];
                goto LABEL_55;
              }
LABEL_58:

              if (!v44) {
                goto LABEL_61;
              }
            }
            uint64_t v42 = [obj countByEnumeratingWithState:&v63 objects:v81 count:16];
          }
          while (v42);
        }
LABEL_61:

        if ([v54 count])
        {
          observerQueue = v56->_observerQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __50__SSDownloadManager__handleDownloadStatesChanged___block_invoke_2;
          block[3] = &unk_1E5BA7068;
          id v60 = v6;
          v61 = v56;
          id v62 = v54;
          dispatch_async(observerQueue, block);
        }
        uint64_t v5 = xdict;
        uint64_t v15 = v49;
      }
    }
  }
}

uint64_t __50__SSDownloadManager__handleDownloadStatesChanged___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F145C0])
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithLongLong:xpc_int64_get_value(v4)];
    [*(id *)(a1 + 32) addObject:v5];
  }
  return 1;
}

void __50__SSDownloadManager__handleDownloadStatesChanged___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 48), "copy", (void)v10);
        [v7 downloadManager:v8 downloadStatesDidChange:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)_handleReply:(id)a3 forDownloads:(id)a4 message:(id)a5 isRetry:(BOOL)a6 block:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v12 && MEMORY[0x1A62689E0](v12) == MEMORY[0x1E4F14590])
  {
    if (xpc_dictionary_get_BOOL(v12, "0"))
    {
      id v16 = 0;
      goto LABEL_10;
    }
    int64_t int64 = xpc_dictionary_get_int64(v12, "1");
    SSError(@"SSErrorDomain", int64, 0, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SSError(@"SSErrorDomain", 111, 0, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!a6)
    {
      connection = self->_connection;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __69__SSDownloadManager__handleReply_forDownloads_message_isRetry_block___block_invoke;
      v24[3] = &unk_1E5BAB598;
      v24[4] = self;
      id v25 = v13;
      id v26 = v14;
      id v27 = v15;
      [(SSXPCConnection *)connection sendMessage:v26 withReply:v24];

      unint64_t v18 = v25;
LABEL_12:

      goto LABEL_13;
    }
  }
  if (v16) {
    [v13 makeObjectsPerformSelector:sel__becomeManagedOnConnection_ withObject:0];
  }
LABEL_10:
  if (v15)
  {
    id v20 = dispatch_get_global_queue(0, 0);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__SSDownloadManager__handleReply_forDownloads_message_isRetry_block___block_invoke_2;
    v21[3] = &unk_1E5BA7328;
    id v23 = v15;
    id v16 = v16;
    id v22 = v16;
    dispatch_async(v20, v21);

    unint64_t v18 = v23;
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __69__SSDownloadManager__handleReply_forDownloads_message_isRetry_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleReply:a2 forDownloads:*(void *)(a1 + 40) message:*(void *)(a1 + 48) isRetry:1 block:*(void *)(a1 + 56)];
}

uint64_t __69__SSDownloadManager__handleReply_forDownloads_message_isRetry_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_insertDownloads:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v14 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v14)
    {
      id v14 = +[SSLogConfig sharedConfig];
    }
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    id v17 = [v14 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      int v18 = v16;
    }
    else {
      int v18 = v16 & 2;
    }
    if (v18)
    {
      int v54 = 136446210;
      v55 = "-[SSDownloadManager _insertDownloads:before:after:completionBlock:]";
      LODWORD(v43) = 12;
      uint64_t v42 = &v54;
      uint64_t v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v54, v43);
      free(v19);
      SSFileLog(v14, @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v17);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v26 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v26, "0", 15);
  if (v11)
  {
    id v27 = "1";
    uint64_t v28 = v11;
  }
  else
  {
    if (!v12) {
      goto LABEL_21;
    }
    id v27 = "2";
    uint64_t v28 = v12;
  }
  xpc_dictionary_set_int64(v26, v27, objc_msgSend(v28, "persistentIdentifier", v42));
LABEL_21:
  uint64_t v44 = v11;
  uint64_t v29 = v12;
  xpc_object_t v30 = xpc_array_create(0, 0);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v31 = v10;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if ((objc_msgSend(v36, "_isManaged", v42) & 1) == 0)
        {
          uint64_t v37 = (void *)[v36 copyXPCEncoding];
          if (v37) {
            xpc_array_append_value(v30, v37);
          }
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v33);
  }

  xpc_dictionary_set_value(v26, "3", v30);
  [v31 makeObjectsPerformSelector:sel__becomeManagedOnConnection_ withObject:self->_connection];
  connection = self->_connection;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __67__SSDownloadManager__insertDownloads_before_after_completionBlock___block_invoke;
  v45[3] = &unk_1E5BAB598;
  v45[4] = self;
  id v46 = v31;
  id v47 = v26;
  id v48 = v13;
  id v39 = v13;
  id v40 = v26;
  id v41 = v31;
  [(SSXPCConnection *)connection sendMessage:v40 withReply:v45];
}

uint64_t __67__SSDownloadManager__insertDownloads_before_after_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleReply:a2 forDownloads:*(void *)(a1 + 40) message:*(void *)(a1 + 48) isRetry:0 block:*(void *)(a1 + 56)];
}

- (void)_loadDownloadKindsUsingNetwork
{
  backgroundQueue = self->_backgroundQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SSDownloadManager__loadDownloadKindsUsingNetwork__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(backgroundQueue, block);
}

void __51__SSDownloadManager__loadDownloadKindsUsingNetwork__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) _copyDownloadKindsUsingNetwork];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SSDownloadManager__loadDownloadKindsUsingNetwork__block_invoke_2;
  v6[3] = &unk_1E5BA7018;
  void v6[4] = v3;
  id v7 = v2;
  id v5 = v2;
  dispatch_async(v4, v6);
}

uint64_t __51__SSDownloadManager__loadDownloadKindsUsingNetwork__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadIsUsingNetworkWithDownloadKinds:*(void *)(a1 + 40)];
}

- (void)_moveDownload:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v14 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v14)
    {
      id v14 = +[SSLogConfig sharedConfig];
    }
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    id v17 = [v14 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      int v18 = v16;
    }
    else {
      int v18 = v16 & 2;
    }
    if (v18)
    {
      int v32 = 136446210;
      uint64_t v33 = "-[SSDownloadManager _moveDownload:before:after:completionBlock:]";
      LODWORD(v31) = 12;
      xpc_object_t v30 = &v32;
      uint64_t v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v32, v31);
      free(v19);
      SSFileLog(v14, @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v17);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v26 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v26, "0", 16);
  int64_t v27 = [v13 persistentIdentifier];

  xpc_dictionary_set_int64(v26, "1", v27);
  if (v10)
  {
    uint64_t v28 = "2";
    uint64_t v29 = v10;
LABEL_20:
    xpc_dictionary_set_int64(v26, v28, objc_msgSend(v29, "persistentIdentifier", v30));
    goto LABEL_21;
  }
  if (v11)
  {
    uint64_t v28 = "3";
    uint64_t v29 = v11;
    goto LABEL_20;
  }
LABEL_21:
  -[SSDownloadManager _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v26, v12, v30);
}

- (void)_pauseDownloads:(id)a3 forced:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v10 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v10)
    {
      id v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    id v13 = [v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      int v14 = v12;
    }
    else {
      int v14 = v12 & 2;
    }
    if (v14)
    {
      int v36 = 136446210;
      uint64_t v37 = "-[SSDownloadManager _pauseDownloads:forced:completionBlock:]";
      LODWORD(v30) = 12;
      uint64_t v29 = &v36;
      int v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v36, v30);
      free(v15);
      SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v22, "0", 17);
  xpc_dictionary_set_BOOL(v22, "2", a4);
  xpc_object_t v23 = xpc_array_create(0, 0);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v24 = v8;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        xpc_array_set_int64(v23, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "persistentIdentifier", v29));
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v26);
  }

  xpc_dictionary_set_value(v22, "1", v23);
  [(SSDownloadManager *)self _sendMessage:v22 withCompletionBlock:v9];
}

- (void)_reloadIsUsingNetworkWithDownloadKinds:(id)a3
{
  options = self->_options;
  id v5 = a3;
  uint64_t v6 = [(SSDownloadManagerOptions *)options downloadKinds];
  id v7 = [v5 firstObjectCommonWithArray:v6];

  BOOL v8 = v7 != 0;
  if (self->_isUsingNetwork != v8)
  {
    self->_isUsingNetworuint64_t k = v8;
    [(SSDownloadManager *)self _sendMessageToObservers:sel_downloadManagerNetworkUsageDidChange_];
  }
}

- (void)_resetAllDownloads
{
  self->_downloadsChanged = 1;
}

- (void)_sendDownloadsChanged:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_observers)
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    xpc_object_t v23 = self;
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v6 = self->_observers;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v34;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * v10);
          if (v4 && (char v12 = objc_opt_respondsToSelector(), v13 = v25, (v12 & 1) != 0)
            || (v14 = objc_opt_respondsToSelector(), id v13 = v5, (v14 & 1) != 0)
            || (v15 = objc_opt_respondsToSelector(), id v13 = v24, (v15 & 1) != 0))
          {
            [v13 addObject:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v8);
    }

    if ([v24 count])
    {
      id v16 = [v4 allObjects];
      uint64_t v17 = v23;
      if (!v16) {
        id v16 = [(SSDownloadManager *)v23 _copyDownloads];
      }
    }
    else
    {
      id v16 = 0;
      uint64_t v17 = v23;
    }
    observerQueue = v17->_observerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__SSDownloadManager__sendDownloadsChanged___block_invoke;
    block[3] = &unk_1E5BAB660;
    id v27 = v25;
    uint64_t v28 = v17;
    id v29 = v4;
    id v30 = v5;
    id v31 = v24;
    id v32 = v16;
    id v19 = v16;
    id v20 = v24;
    id v21 = v5;
    id v22 = v25;
    dispatch_async(observerQueue, block);
  }
}

void __43__SSDownloadManager__sendDownloadsChanged___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v6++) downloadManager:*(void *)(a1 + 40) downloadsDidChange:*(void *)(a1 + 48)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v4);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v11++) downloadManagerDownloadsDidChange:*(void *)(a1 + 40)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *(id *)(a1 + 64);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "downloadManager:downloadStatesDidChange:", *(void *)(a1 + 40), *(void *)(a1 + 72), (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }
    while (v14);
  }
}

- (void)_sendMessage:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SSDownloadManager__sendMessage_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E5BA92C8;
  id v10 = v6;
  id v8 = v6;
  [(SSXPCConnection *)connection sendMessage:a3 withReply:v9];
}

void __54__SSDownloadManager__sendMessage_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_4:
    id v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    goto LABEL_5;
  }
  if (!xpc_dictionary_get_BOOL(v4, "0"))
  {
    uint64_t v5 = 100;
    goto LABEL_4;
  }
  id v6 = 0;
LABEL_5:
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__SSDownloadManager__sendMessage_withCompletionBlock___block_invoke_2;
    v9[3] = &unk_1E5BA7328;
    id v11 = v7;
    id v10 = v6;
    dispatch_async(v8, v9);
  }
}

uint64_t __54__SSDownloadManager__sendMessage_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_sendMessageToObservers:(SEL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_observers)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = self->_observers;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 addObject:*(void *)(*((void *)&v16 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__SSDownloadManager__sendMessageToObservers___block_invoke;
      block[3] = &unk_1E5BA86D0;
      uint64_t v14 = self;
      SEL v15 = a3;
      id v13 = v5;
      dispatch_async(observerQueue, block);
    }
  }
}

void __45__SSDownloadManager__sendMessageToObservers___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "performSelector:withObject:", *(void *)(a1 + 48), *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

@end