@interface TSPObjectContext
+ (void)waitForPendingEndSaveGroup:(id)a3;
- (BOOL)areExternalReferencesSupported;
- (BOOL)areExternalReferencesToDataAllowedAtURL:(id)a3;
- (BOOL)areNewExternalReferencesToDataAllowed;
- (BOOL)documentHasCurrentFileFormatVersion;
- (BOOL)ignoreDocumentResourcesWhileReading;
- (BOOL)ignoreDocumentSupport;
- (BOOL)ignoreUnknownContentWhileReading;
- (BOOL)ignoreVersionCheckingWhileReading;
- (BOOL)isDocumentModified;
- (BOOL)isDocumentSupportTemporary;
- (BOOL)isEstimatedDownloadSizePrecise;
- (BOOL)isPasswordProtected;
- (BOOL)isSupportModified;
- (BOOL)needsDownload;
- (NSData)passwordVerifier;
- (NSString)documentPasswordHint;
- (NSURL)documentURL;
- (NSUUID)documentUUID;
- (NSUUID)versionUUID;
- (SFUCryptoKey)decryptionKey;
- (TSPDataManager)dataManager;
- (TSPObject)documentObject;
- (TSPObject)supportObject;
- (TSPObjectContainer)documentObjectContainer;
- (TSPObjectContainer)supportObjectContainer;
- (TSPObjectContext)init;
- (TSPObjectContext)initWithDelegate:(id)a3;
- (TSPObjectContextDelegate)delegate;
- (id).cxx_construct;
- (id)addLoadedObjectsAndEnqueueNotifications:(id)a3;
- (id)dataOrNilForIdentifier:(int64_t)a3;
- (id)documentRoot;
- (id)objectForIdentifier:(int64_t)a3;
- (id)supportDirectoryURL;
- (id)temporaryDirectory;
- (int64_t)estimatedDownloadSize;
- (int64_t)incrementLastObjectIdentifier:(int64_t)a3;
- (int64_t)lastObjectIdentifier;
- (int64_t)modifyObjectTokenForNewObject;
- (int64_t)newObjectIdentifier;
- (int64_t)updateModifyObjectToken;
- (void)addLoadObserver:(id)a3 action:(SEL)a4 forLazyReference:(id)a5;
- (void)addLoadObserver:(id)a3 action:(SEL)a4 forObjectIdentifier:(int64_t)a5 objectOrNil:(id)a6;
- (void)beginAssertOnModify;
- (void)beginWriteOperation;
- (void)checkforDataWarningsWithPackageURL:(id)a3;
- (void)close;
- (void)dealloc;
- (void)didMoveSupportToURL:(id)a3;
- (void)didMoveToURL:(id)a3;
- (void)didReadDocumentObject:(id)a3;
- (void)endAssertOnModify;
- (void)endWriteOperation;
- (void)performReadOperation:(id)a3;
- (void)performReadOperationOnKnownObjects:(id)a3;
- (void)runObjectNotificationsInQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentObject:(id)a3;
- (void)setDocumentObjectContainer:(id)a3;
- (void)setDocumentPasswordHint:(id)a3;
- (void)setIsDocumentModified:(BOOL)a3;
- (void)setIsPasswordProtected:(BOOL)a3;
- (void)setIsSupportModified:(BOOL)a3;
- (void)setLastObjectIdentifier:(int64_t)a3;
- (void)setPasswordVerifier:(id)a3;
- (void)setSupportObject:(id)a3;
- (void)setSupportObjectContainer:(id)a3;
- (void)waitForSaveToFinishIfNeeded;
@end

@implementation TSPObjectContext

- (int64_t)modifyObjectTokenForNewObject
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  documentStateQueue = self->_documentStateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__TSPObjectContext_modifyObjectTokenForNewObject__block_invoke;
  v5[3] = &unk_2646AFA78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(documentStateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__TSPObjectContext_modifyObjectTokenForNewObject__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_DWORD *)self + 48) = 1065353216;
  return self;
}

- (void)dealloc
{
  [(TSPObjectContext *)self close];
  documentObjectContainer = self->_documentObjectContainer;
  self->_documentObjectContainer = 0;

  supportObjectContainer = self->_supportObjectContainer;
  self->_supportObjectContainer = 0;

  documentObject = self->_documentObject;
  self->_documentObject = 0;

  dataManager = self->_dataManager;
  self->_dataManager = 0;

  v7.receiver = self;
  v7.super_class = (Class)TSPObjectContext;
  [(TSPObjectContext *)&v7 dealloc];
}

- (void)close
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportObject, 0);
  objc_storeStrong((id *)&self->_versionUUID, 0);
  objc_storeStrong((id *)&self->_documentUUID, 0);
  objc_storeStrong((id *)&self->_passwordVerifier, 0);
  objc_storeStrong((id *)&self->_supportObjectContainer, 0);
  objc_storeStrong((id *)&self->_documentObjectContainer, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_documentObject, 0);
  objc_storeStrong((id *)&self->_documentPasswordHint, 0);
  std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::~__hash_table((uint64_t)&self->_loadObservers);
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryQueue, 0);
  objc_storeStrong((id *)&self->_outstandingReadsGroup, 0);
  objc_storeStrong((id *)&self->_pendingEndSaveGroup, 0);
  objc_storeStrong((id *)&self->_documentResourceDataProviderQueue, 0);
  objc_storeStrong((id *)&self->_runLoadObserversQueue, 0);
  objc_storeStrong((id *)&self->_loadObserversQueue, 0);
  objc_storeStrong((id *)&self->_documentStateQueue, 0);
  objc_storeStrong((id *)&self->_readLock, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_objectsQueue, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_supportURL, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);

  objc_storeStrong((id *)&self->_decryptionKey, 0);
}

- (TSPObjectContext)initWithDelegate:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSPObjectContext initWithDelegate:]"];
    objc_super v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 171, @"Invalid parameter not satisfying: %s", "delegate");
  }
  v37.receiver = self;
  v37.super_class = (Class)TSPObjectContext;
  uint64_t v8 = [(TSPObjectContext *)&v37 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(TSPObjectContext *)v8 setDelegate:v4];
    v10 = [[TSPDataManager alloc] initWithContext:v9];
    dataManager = v9->_dataManager;
    v9->_dataManager = v10;

    uint64_t v12 = [MEMORY[0x263F08968] newTspWeakObjectsMapTable];
    objects = v9->_objects;
    v9->_objects = (NSMapTable *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("TSPObjectContext.Objects", MEMORY[0x263EF83A8]);
    objectsQueue = v9->_objectsQueue;
    v9->_objectsQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("TSPObjectContext.Write", 0);
    writeQueue = v9->_writeQueue;
    v9->_writeQueue = (OS_dispatch_queue *)v16;

    v18 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
    readLock = v9->_readLock;
    v9->_readLock = v18;

    v20 = MEMORY[0x263EF83A8];
    dispatch_queue_t v21 = dispatch_queue_create("TSPObjectContext.DocumentState", MEMORY[0x263EF83A8]);
    documentStateQueue = v9->_documentStateQueue;
    v9->_documentStateQueue = (OS_dispatch_queue *)v21;

    dispatch_queue_t v23 = dispatch_queue_create("TSPObjectContext.DocumentResourceDataProvider", 0);
    documentResourceDataProviderQueue = v9->_documentResourceDataProviderQueue;
    v9->_documentResourceDataProviderQueue = (OS_dispatch_queue *)v23;

    *(_OWORD *)&v9->_lastObjectIdentifier = xmmword_223837ED0;
    dispatch_group_t v25 = dispatch_group_create();
    pendingEndSaveGroup = v9->_pendingEndSaveGroup;
    v9->_pendingEndSaveGroup = (OS_dispatch_group *)v25;

    dispatch_group_t v27 = dispatch_group_create();
    outstandingReadsGroup = v9->_outstandingReadsGroup;
    v9->_outstandingReadsGroup = (OS_dispatch_group *)v27;

    dispatch_queue_t v29 = dispatch_queue_create("TSPObjectContext.LoadObservers", v20);
    loadObserversQueue = v9->_loadObserversQueue;
    v9->_loadObserversQueue = (OS_dispatch_queue *)v29;

    dispatch_queue_t v31 = dispatch_queue_create("TSPObjectContext.RunLoadObservers", 0);
    runLoadObserversQueue = v9->_runLoadObserversQueue;
    v9->_runLoadObserversQueue = (OS_dispatch_queue *)v31;

    dispatch_queue_t v33 = dispatch_queue_create("TSPObjectContext.TemporaryDirectory", 0);
    temporaryDirectoryQueue = v9->_temporaryDirectoryQueue;
    v9->_temporaryDirectoryQueue = (OS_dispatch_queue *)v33;

    v35 = v9;
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
}

- (TSPObjectContext)init
{
  v2 = [MEMORY[0x263F7C7F0] currentHandler];
  int64_t v3 = [NSString stringWithUTF8String:"-[TSPObjectContext init]"];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:166 description:@"Do not call method"];

  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[TSPObjectContext init]"];
  id v7 = [v5 exceptionWithName:*MEMORY[0x263EFF498] reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)beginWriteOperation
{
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__TSPObjectContext_beginWriteOperation__block_invoke;
  block[3] = &unk_2646AFA00;
  block[4] = self;
  dispatch_sync(writeQueue, block);
}

void __39__TSPObjectContext_beginWriteOperation__block_invoke(uint64_t a1)
{
}

- (void)endWriteOperation
{
}

- (void)performReadOperation:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    v5 = v4;
    dispatch_suspend((dispatch_object_t)self->_writeQueue);
    [(NSRecursiveLock *)self->_readLock lock];
    v5[2]();
    [(NSRecursiveLock *)self->_readLock unlock];
    dispatch_resume((dispatch_object_t)self->_writeQueue);
    id v4 = v5;
  }
}

- (void)beginAssertOnModify
{
}

- (void)endAssertOnModify
{
}

- (id)objectForIdentifier:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      documentObject = (TSPObjectContainer *)self->_documentObject;
LABEL_9:
      v5 = documentObject;
      break;
    case 3:
    case 2:
      goto LABEL_11;
    case 61:
      documentObject = self->_documentObjectContainer;
      goto LABEL_9;
    case 62:
LABEL_11:
      v5 = 0;
      break;
    default:
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x3032000000;
      uint64_t v12 = __Block_byref_object_copy__1;
      v13 = __Block_byref_object_dispose__1;
      id v14 = 0;
      objectsQueue = self->_objectsQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __40__TSPObjectContext_objectForIdentifier___block_invoke;
      block[3] = &unk_2646AFA28;
      block[4] = self;
      void block[5] = &v9;
      block[6] = a3;
      dispatch_sync(objectsQueue, block);
      v5 = (TSPObjectContainer *)(id)v10[5];
      _Block_object_dispose(&v9, 8);

      break;
  }

  return v5;
}

uint64_t __40__TSPObjectContext_objectForIdentifier___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = objc_msgSend(*(id *)(a1[4] + 56), "tsp_objectForIdentifier:", a1[6]);

  return MEMORY[0x270F9A758]();
}

- (void)performReadOperationOnKnownObjects:(id)a3
{
  id v4 = a3;
  objectsQueue = self->_objectsQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__TSPObjectContext_performReadOperationOnKnownObjects___block_invoke;
  v7[3] = &unk_2646AFA50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(objectsQueue, v7);
}

uint64_t __55__TSPObjectContext_performReadOperationOnKnownObjects___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 56));
}

- (id)temporaryDirectory
{
  temporaryDirectoryQueue = self->_temporaryDirectoryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__TSPObjectContext_temporaryDirectory__block_invoke;
  block[3] = &unk_2646AFA00;
  block[4] = self;
  dispatch_sync(temporaryDirectoryQueue, block);
  id v4 = [(TSUTemporaryDirectory *)self->_temporaryDirectory path];

  return v4;
}

uint64_t __38__TSPObjectContext_temporaryDirectory__block_invoke(uint64_t result)
{
  if (!*(void *)(*(void *)(result + 32) + 152))
  {
    *(void *)(*(void *)(result + 32) + 152) = objc_alloc_init(MEMORY[0x263F7C8D8]);
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)checkforDataWarningsWithPackageURL:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v5 = [(TSPDataManager *)self->_dataManager checkForPersistenceWarningsWithPackageURL:v6];
    [WeakRetained addPersistenceWarnings:v5];
  }
}

- (NSURL)documentURL
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  documentStateQueue = self->_documentStateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__TSPObjectContext_documentURL__block_invoke;
  v5[3] = &unk_2646AFA78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(documentStateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

uint64_t __31__TSPObjectContext_documentURL__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (void)didMoveToURL:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    documentStateQueue = self->_documentStateQueue;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __33__TSPObjectContext_didMoveToURL___block_invoke;
    id v14 = &unk_2646AFAA0;
    v15 = self;
    id v7 = v4;
    id v16 = v7;
    dispatch_barrier_async(documentStateQueue, &v11);
    if ([(TSPObjectContext *)self areExternalReferencesSupported]&& ![(TSPObjectContext *)self areExternalReferencesToDataAllowedAtURL:v7])
    {
      [(TSPDataManager *)self->_dataManager removeExternalReferences];
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSPObjectContext didMoveToURL:]"];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:1367 description:@"Invalid nil document URL."];
  }
}

uint64_t __33__TSPObjectContext_didMoveToURL___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (void)didMoveSupportToURL:(id)a3
{
  id v4 = a3;
  documentStateQueue = self->_documentStateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__TSPObjectContext_didMoveSupportToURL___block_invoke;
  v7[3] = &unk_2646AFAA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(documentStateQueue, v7);
}

uint64_t __40__TSPObjectContext_didMoveSupportToURL___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (BOOL)isDocumentModified
{
  self->_isDocumentModified = 0;
  return 0;
}

- (BOOL)isSupportModified
{
  self->_isSupportModified = 0;
  return 0;
}

- (BOOL)areExternalReferencesSupported
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)areNewExternalReferencesToDataAllowed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained areNewExternalReferencesToDataAllowed];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)areExternalReferencesToDataAllowedAtURL:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v6 = [WeakRetained areExternalReferencesToDataAllowedAtURL:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)needsDownload
{
  return 0;
}

- (int64_t)estimatedDownloadSize
{
  return 0;
}

- (BOOL)isEstimatedDownloadSizePrecise
{
  return 1;
}

- (BOOL)isPasswordProtected
{
  self->_isPasswordProtected = 0;
  return 0;
}

- (SFUCryptoKey)decryptionKey
{
  return self->_decryptionKey;
}

+ (void)waitForPendingEndSaveGroup:(id)a3
{
  group = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v3 = *MEMORY[0x263EFF478];
    while (dispatch_group_wait(group, 0))
    {
      id v4 = [MEMORY[0x263EFF9F0] currentRunLoop];
      v5 = [MEMORY[0x263EFF910] distantFuture];
      char v6 = [v4 runMode:v3 beforeDate:v5];

      if ((v6 & 1) == 0)
      {
        id v7 = [MEMORY[0x263F7C7F0] currentHandler];
        id v8 = [NSString stringWithUTF8String:"+[TSPObjectContext waitForPendingEndSaveGroup:]"];
        uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm"];
        [v7 handleFailureInFunction:v8 file:v9 lineNumber:2134 description:@"Run loop could not be started."];

        break;
      }
    }
  }
  else
  {
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)waitForSaveToFinishIfNeeded
{
  uint64_t v3 = objc_opt_class();
  pendingEndSaveGroup = self->_pendingEndSaveGroup;

  [v3 waitForPendingEndSaveGroup:pendingEndSaveGroup];
}

- (id)supportDirectoryURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [WeakRetained supportDirectoryURL];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)dataOrNilForIdentifier:(int64_t)a3
{
  id v4 = [(TSPObjectContext *)self dataManager];
  v5 = [v4 dataOrNilForIdentifier:a3];

  return v5;
}

- (BOOL)ignoreDocumentSupport
{
  if (self->_mode) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained ignoreDocumentSupport];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)isDocumentSupportTemporary
{
  if ((self->_mode & 2) != 0) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained isDocumentSupportTemporary];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)ignoreUnknownContentWhileReading
{
  return (LOBYTE(self->_mode) >> 2) & 1;
}

- (BOOL)ignoreVersionCheckingWhileReading
{
  return (LOBYTE(self->_mode) >> 3) & 1;
}

- (BOOL)ignoreDocumentResourcesWhileReading
{
  return (LOBYTE(self->_mode) >> 4) & 1;
}

- (void)setDocumentObject:(id)a3
{
  id v18 = a3;
  v5 = [v18 context];

  if (v5 != self)
  {
    char v6 = [MEMORY[0x263F7C7F0] currentHandler];
    id v7 = [NSString stringWithUTF8String:"-[TSPObjectContext setDocumentObject:]"];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm"];
    [v6 handleFailureInFunction:v7, v8, 2403, @"Document object should belong to object context %@.", self file lineNumber description];
  }
  uint64_t v9 = [v18 packageLocator];

  if (v9)
  {
    v10 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSPObjectContext setDocumentObject:]"];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm"];
    [v10 handleFailureInFunction:v11 file:v12 lineNumber:2404 description:@"Document object shouldn't have a package locator."];
  }
  documentObject = self->_documentObject;
  p_documentObject = &self->_documentObject;
  if (documentObject)
  {
    v15 = [MEMORY[0x263F7C7F0] currentHandler];
    id v16 = [NSString stringWithUTF8String:"-[TSPObjectContext setDocumentObject:]"];
    v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm"];
    [v15 handleFailureInFunction:v16 file:v17 lineNumber:2421 description:@"Already have a document object"];
  }
  else
  {
    objc_storeStrong((id *)p_documentObject, a3);
    [(TSPObject *)*p_documentObject setTsp_identifier:1];
  }
}

- (void)didReadDocumentObject:(id)a3
{
  id v4 = (TSPObject *)a3;
  if (self->_documentObject)
  {
    v5 = [MEMORY[0x263F7C7F0] currentHandler];
    char v6 = [NSString stringWithUTF8String:"-[TSPObjectContext didReadDocumentObject:]"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 2427, @"expected nil value for '%s'", "_documentObject");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    TSULogErrorInFunction();

    id v4 = 0;
  }
  documentObject = self->_documentObject;
  self->_documentObject = v4;
}

- (int64_t)newObjectIdentifier
{
  return atomic_fetch_add(&self->_lastObjectIdentifier, 1uLL) + 1;
}

- (int64_t)lastObjectIdentifier
{
  return self->_lastObjectIdentifier;
}

- (void)setLastObjectIdentifier:(int64_t)a3
{
  do
  {
    int64_t lastObjectIdentifier = self->_lastObjectIdentifier;
    if (lastObjectIdentifier >= a3) {
      break;
    }
    int64_t v4 = self->_lastObjectIdentifier;
    atomic_compare_exchange_strong(&self->_lastObjectIdentifier, (unint64_t *)&v4, a3);
  }
  while (v4 != lastObjectIdentifier);
}

- (int64_t)incrementLastObjectIdentifier:(int64_t)a3
{
  if (a3 > 0) {
    return atomic_fetch_add(&self->_lastObjectIdentifier, a3) + a3;
  }
  v5 = [MEMORY[0x263F7C7F0] currentHandler];
  char v6 = [NSString stringWithUTF8String:"-[TSPObjectContext incrementLastObjectIdentifier:]"];
  id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm"];
  [v5 handleFailureInFunction:v6 file:v7 lineNumber:2547 description:@"don't increment by a negative value"];

  return self->_lastObjectIdentifier;
}

- (int64_t)updateModifyObjectToken
{
  return atomic_fetch_add(&self->_modifyObjectToken, 1uLL) + 1;
}

- (id)addLoadedObjectsAndEnqueueNotifications:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    id v16 = __Block_byref_object_dispose__1;
    id v17 = 0;
    objectsQueue = self->_objectsQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke;
    block[3] = &unk_2646AFAF0;
    block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_barrier_sync(objectsQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_2;
  block[3] = &unk_2646AFAF0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 48);
  dispatch_sync(v2, block);
}

uint64_t __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_3;
  v3[3] = &unk_2646AFAC8;
  long long v4 = *(_OWORD *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "tsp_identifier");
  uint64_t v15 = v4;
  if (!+[TSPObject tsp_isTransientObjectIdentifier:v4])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "tsp_setObject:forIdentifier:", v3, v4);
    v5 = std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::find<long long>((void *)(*(void *)(a1 + 32) + 160), (unint64_t *)&v15);
    if (v5)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v5[3]];
      uint64_t v7 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v7)
      {
        dispatch_queue_t v8 = dispatch_queue_create("TSPObjectContext.RunLoadObserversForRead", 0);
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        id v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        dispatch_set_target_queue(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 104));
        dispatch_suspend(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
        uint64_t v7 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_4;
      block[3] = &unk_2646AFAA0;
      id v13 = v6;
      id v14 = v3;
      id v11 = v6;
      dispatch_async(v7, block);
    }
  }
}

void __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "target", (void)v8);
        objc_msgSend(v7, "performSelector:withObject:", objc_msgSend(v6, "action"), *(void *)(a1 + 40));
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (void)runObjectNotificationsInQueue:(id)a3
{
  if (a3) {
    dispatch_resume((dispatch_object_t)a3);
  }
  runLoadObserversQueue = self->_runLoadObserversQueue;

  dispatch_sync(runLoadObserversQueue, &__block_literal_global_5);
}

- (void)addLoadObserver:(id)a3 action:(SEL)a4 forObjectIdentifier:(int64_t)a5 objectOrNil:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  loadObserversQueue = self->_loadObserversQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke;
  block[3] = &unk_2646AFB40;
  id v16 = v10;
  id v17 = self;
  SEL v19 = a4;
  int64_t v20 = a5;
  id v18 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_barrier_async(loadObserversQueue, block);
}

void __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke(uint64_t a1)
{
  id v2 = [[TSPObjectContextObserver alloc] initWithTarget:*(void *)(a1 + 32) action:*(void *)(a1 + 56)];
  uint64_t v3 = std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::find<long long>((void *)(*(void *)(a1 + 40) + 160), (unint64_t *)(a1 + 64));
  if (v3)
  {
    id v4 = (id)v3[3];
    for (unint64_t i = [v4 count] - 1; i < objc_msgSend(v4, "count"); --i)
    {
      id v6 = [v4 objectAtIndex:i];
      uint64_t v7 = [v6 target];

      if (!v7) {
        [v4 removeObjectAtIndex:i];
      }
    }
    [v4 addObject:v2];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    long long v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v2, 0);
    uint64_t v21 = *(void *)(a1 + 64);
    id v22 = v9;
    std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::__emplace_unique_key_args<long long,std::pair<long long const,NSMutableArray * {__strong}>>(v8 + 160, (unint64_t *)&v21, &v21);
  }
  id v10 = *(void **)(a1 + 48);
  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(NSObject **)(v11 + 64);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke_2;
    block[3] = &unk_2646AFB40;
    uint64_t v13 = *(void *)(a1 + 64);
    void block[4] = v11;
    uint64_t v19 = v13;
    id v17 = v10;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 56);
    id v18 = v14;
    uint64_t v20 = v15;
    dispatch_async(v12, block);
  }
}

void __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke_2(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "tsp_objectForIdentifier:", *(void *)(a1 + 56));
  uint64_t v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 104);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke_3;
    block[3] = &unk_2646AFB18;
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 64);
    id v8 = v5;
    uint64_t v10 = v6;
    id v9 = *(id *)(a1 + 40);
    dispatch_async(v4, block);
  }
}

uint64_t __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

- (void)addLoadObserver:(id)a3 action:(SEL)a4 forLazyReference:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [v8 weakObject];
  uint64_t v10 = v9;
  if (v9) {
    uint64_t v11 = objc_msgSend(v9, "tsp_identifier");
  }
  else {
    uint64_t v11 = [v8 identifier];
  }
  [(TSPObjectContext *)self addLoadObserver:v12 action:a4 forObjectIdentifier:v11 objectOrNil:v10];
}

- (void)setIsDocumentModified:(BOOL)a3
{
  self->_isDocumentModified = a3;
}

- (void)setIsSupportModified:(BOOL)a3
{
  self->_isSupportModified = a3;
}

- (void)setIsPasswordProtected:(BOOL)a3
{
  self->_isPasswordProtected = a3;
}

- (NSString)documentPasswordHint
{
  return self->_documentPasswordHint;
}

- (void)setDocumentPasswordHint:(id)a3
{
}

- (TSPObject)documentObject
{
  return self->_documentObject;
}

- (TSPObjectContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TSPObjectContextDelegate *)WeakRetained;
}

- (TSPDataManager)dataManager
{
  return self->_dataManager;
}

- (TSPObjectContainer)documentObjectContainer
{
  return self->_documentObjectContainer;
}

- (void)setDocumentObjectContainer:(id)a3
{
}

- (TSPObjectContainer)supportObjectContainer
{
  return self->_supportObjectContainer;
}

- (void)setSupportObjectContainer:(id)a3
{
}

- (BOOL)documentHasCurrentFileFormatVersion
{
  return self->_documentHasCurrentFileFormatVersion;
}

- (NSData)passwordVerifier
{
  return self->_passwordVerifier;
}

- (void)setPasswordVerifier:(id)a3
{
}

- (NSUUID)documentUUID
{
  return self->_documentUUID;
}

- (NSUUID)versionUUID
{
  return self->_versionUUID;
}

- (TSPObject)supportObject
{
  return self->_supportObject;
}

- (void)setSupportObject:(id)a3
{
}

- (id)documentRoot
{
  objc_opt_class();
  [(TSPObjectContext *)self documentObject];

  return (id)TSUDynamicCast();
}

@end