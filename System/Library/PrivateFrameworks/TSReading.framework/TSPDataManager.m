@interface TSPDataManager
+ (id)stringForDigest:(const void *)a3;
+ (void)readWithChannel:(id)a3 handler:(id)a4;
- (BOOL)linkTemporaryPath:(id)a3 fromURL:(id)a4;
- (TSPDataManager)initWithContext:(id)a3;
- (TSPObjectContext)context;
- (id).cxx_construct;
- (id)addNewDataForStorage:(id)a3 digest:(const void *)a4 filename:(id)a5;
- (id)checkForPersistenceWarningsWithPackageURL:(id)a3;
- (id)copyData:(id)a3;
- (id)createTemporaryDirectoryForPackageURL:(id)a3;
- (id)dataForDigest:(const void *)a3;
- (id)dataForDigestImpl:(const void *)a3 accessorBlock:(id)a4;
- (id)dataForDigestImpl:(const void *)a3 skipDocumentResourcesLookup:(BOOL)a4 accessorBlock:(id)a5;
- (id)dataForExistingData:(id)a3 digest:(const void *)a4 filename:(id)a5 temporaryPath:(id)a6;
- (id)dataForIdentifier:(int64_t)a3;
- (id)dataForIdentifierImpl:(int64_t)a3;
- (id)dataFromExternalReferenceURL:(id)a3 useFileCoordination:(BOOL)a4;
- (id)dataFromFileURL:(id)a3 useFileCoordination:(BOOL)a4;
- (id)dataFromNSData:(id)a3 filename:(id)a4;
- (id)dataFromReadChannel:(id)a3 filename:(id)a4;
- (id)dataFromReadChannel:(id)a3 filename:(id)a4 linkURLOrNil:(id)a5;
- (id)dataFromReadChannel:(id)a3 filename:(id)a4 temporaryPath:(id)a5;
- (id)dataFromURL:(id)a3 useFileCoordination:(BOOL)a4;
- (id)dataOrNilForIdentifier:(int64_t)a3;
- (id)dataWithStorage:(id)a3 digest:(const void *)a4 filename:(id)a5 skipDocumentResourcesLookup:(BOOL)a6 accessorBlock:(id)a7;
- (id)dataWithTemporaryPath:(id)a3 digest:(const void *)a4 filename:(id)a5;
- (id)documentResourceDataWithStorage:(id)a3 digestString:(id)a4 filename:(id)a5;
- (id)temporaryPathForFilename:(id)a3;
- (int)openTemporaryPath:(id)a3;
- (void)addData:(id)a3;
- (void)coordinateReadingNewFileURL:(id)a3 byAccessor:(id)a4;
- (void)dataForDigest:(const void *)a3 queue:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)didCloseDocument;
- (void)enumerateDatasUsingBlock:(id)a3;
- (void)findExistingDataForReadChannel:(id)a3 dataURL:(id)a4 readHandler:(id)a5 completion:(id)a6;
- (void)findExistingDataForReadChannel:(id)a3 dataURL:(id)a4 temporaryPath:(id)a5 shouldWriteIfFound:(BOOL)a6 completion:(id)a7;
- (void)removeExternalReferenceForData:(id)a3 storage:(id)a4;
- (void)removeExternalReferences;
- (void)removeFileAtPath:(id)a3;
- (void)removeTemporaryDirectory;
- (void)setDocumentURL:(id)a3;
- (void)waitForRemoveExternalReferencesToComplete;
@end

@implementation TSPDataManager

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  return self;
}

- (void)enumerateDatasUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    datasQueue = self->_datasQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__TSPDataManager_enumerateDatasUsingBlock___block_invoke;
    v7[3] = &unk_2646AFEA8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(datasQueue, v7);
  }
}

- (void)didCloseDocument
{
}

- (void)dealloc
{
  [(TSPDataManager *)self removeTemporaryDirectory];
  v3.receiver = self;
  v3.super_class = (Class)TSPDataManager;
  [(TSPDataManager *)&v3 dealloc];
}

- (void)removeTemporaryDirectory
{
  if (self->_temporaryUniqueDirectoryURL)
  {
    objc_super v3 = [MEMORY[0x263F08850] defaultManager];
    temporaryUniqueDirectoryURL = self->_temporaryUniqueDirectoryURL;
    id v13 = 0;
    char v5 = [v3 removeItemAtURL:temporaryUniqueDirectoryURL error:&v13];
    id v6 = v13;

    if ((v5 & 1) == 0) {
      TSULogErrorInFunction();
    }
  }
  temporaryDirectoryURL = self->_temporaryDirectoryURL;
  if (temporaryDirectoryURL)
  {
    if (temporaryDirectoryURL != self->_temporaryUniqueDirectoryURL)
    {
      id v8 = [(NSURL *)temporaryDirectoryURL path];
      int v9 = rmdir((const char *)[v8 fileSystemRepresentation]);

      if (v9)
      {
        if (v9 != 66)
        {
          strerror(v9);
          TSULogErrorInFunction();
        }
      }
    }
  }
  v10 = self->_temporaryDirectoryURL;
  self->_temporaryDirectoryURL = 0;

  v11 = self->_temporaryUniqueDirectoryURL;
  self->_temporaryUniqueDirectoryURL = 0;

  temporaryPathSet = self->_temporaryPathSet;
  self->_temporaryPathSet = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalReferenceRemovalGroup, 0);
  objc_storeStrong((id *)&self->_temporaryPathSet, 0);
  objc_storeStrong((id *)&self->_temporaryUniqueDirectoryURL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_lastDocumentURL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryQueue, 0);
  std::__hash_table<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,std::__unordered_map_hasher<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestHash,TSP::DataDigestEqualTo,true>,std::__unordered_map_equal<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestEqualTo,TSP::DataDigestHash,true>,std::allocator<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>>>::~__hash_table((uint64_t)&self->_digestToDataMap);
  std::__hash_table<std::__hash_value_type<long long const,TSPData * {__weak}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,TSPData * {__weak}>,TSP::ObjectIdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,TSPData * {__weak}>,std::equal_to<long long const>,TSP::ObjectIdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,TSPData * {__weak}>>>::~__hash_table((uint64_t)&self->_identifierToDataMap);
  objc_storeStrong((id *)&self->_datasQueue, 0);

  objc_destroyWeak((id *)&self->_context);
}

- (TSPDataManager)initWithContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TSPDataManager;
  char v5 = [(TSPDataManager *)&v15 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    dispatch_queue_t v7 = dispatch_queue_create("TSPDataManager.Datas", 0);
    datasQueue = v6->_datasQueue;
    v6->_datasQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("TSPDataManager.TemporaryDirectory", 0);
    temporaryDirectoryQueue = v6->_temporaryDirectoryQueue;
    v6->_temporaryDirectoryQueue = (OS_dispatch_queue *)v9;

    v6->_nextNewIdentifier = 1;
    dispatch_group_t v11 = dispatch_group_create();
    externalReferenceRemovalGroup = v6->_externalReferenceRemovalGroup;
    v6->_externalReferenceRemovalGroup = (OS_dispatch_group *)v11;

    id v13 = v6;
  }

  return v6;
}

void __43__TSPDataManager_enumerateDatasUsingBlock___block_invoke(uint64_t a1)
{
  for (i = *(id **)(*(void *)(a1 + 32) + 48); i; i = (id *)*i)
  {
    id WeakRetained = objc_loadWeakRetained(i + 3);
    if (WeakRetained) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __34__TSPDataManager_didCloseDocument__block_invoke(uint64_t a1, void *a2)
{
  return [a2 willCull];
}

- (id)dataFromURL:(id)a3 useFileCoordination:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isFileURL])
  {
    dispatch_queue_t v7 = [(TSPDataManager *)self dataFromFileURL:v6 useFileCoordination:v4];
  }
  else
  {
    id v8 = [MEMORY[0x263F7C7F0] currentHandler];
    dispatch_queue_t v9 = [NSString stringWithUTF8String:"-[TSPDataManager dataFromURL:useFileCoordination:]"];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:180 description:@"Unsupported URL scheme"];

    dispatch_queue_t v7 = 0;
  }

  return v7;
}

- (id)dataFromFileURL:(id)a3 useFileCoordination:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__TSPDataManager_dataFromFileURL_useFileCoordination___block_invoke;
  aBlock[3] = &unk_2646AFB88;
  v14 = &v15;
  aBlock[4] = self;
  id v7 = v6;
  id v13 = v7;
  id v8 = _Block_copy(aBlock);
  dispatch_queue_t v9 = v8;
  if (v4) {
    [(TSPDataManager *)self coordinateReadingNewFileURL:v7 byAccessor:v8];
  }
  else {
    (*((void (**)(void *, id))v8 + 2))(v8, v7);
  }
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

void __54__TSPDataManager_dataFromFileURL_useFileCoordination___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F7C830]) initForReadingURL:v9];
  BOOL v4 = *(void **)(a1 + 32);
  char v5 = [*(id *)(a1 + 40) lastPathComponent];
  uint64_t v6 = [v4 dataFromReadChannel:v3 filename:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  [v3 close];
}

- (void)coordinateReadingNewFileURL:(id)a3 byAccessor:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  id v9 = 0;
  char v7 = objc_msgSend(MEMORY[0x263F08830], "tsp_coordinateReadingItemAtURL:options:filePresenter:error:byAccessor:", v5, 0, 0, &v9, v6);
  id v8 = v9;
  if (v8) {
    TSULogErrorInFunction();
  }
  if ((v7 & 1) == 0) {
    v6[2](v6, 0);
  }
}

- (id)dataFromReadChannel:(id)a3 filename:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TSPDataManager *)self temporaryPathForFilename:v7];
  id v9 = [(TSPDataManager *)self dataFromReadChannel:v6 filename:v7 temporaryPath:v8];

  return v9;
}

- (id)dataFromReadChannel:(id)a3 filename:(id)a4 linkURLOrNil:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_group_t v11 = [(TSPDataManager *)self temporaryPathForFilename:v9];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  if (v10 && [(TSPDataManager *)self linkTemporaryPath:v11 fromURL:v10])
  {
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __60__TSPDataManager_dataFromReadChannel_filename_linkURLOrNil___block_invoke;
    v17[3] = &unk_2646AFBB0;
    v17[4] = self;
    id v18 = v11;
    v21 = &v22;
    id v19 = v9;
    dispatch_semaphore_t v20 = v12;
    id v13 = v12;
    [(TSPDataManager *)self findExistingDataForReadChannel:v8 dataURL:v10 readHandler:0 completion:v17];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    uint64_t v14 = [(TSPDataManager *)self dataFromReadChannel:v8 filename:v9 temporaryPath:v11];
    id v13 = v23[5];
    v23[5] = v14;
  }

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __60__TSPDataManager_dataFromReadChannel_filename_linkURLOrNil___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v10 = a3;
  if (v10 || (a2 & 1) == 0) {
    [*(id *)(a1 + 32) removeFileAtPath:*(void *)(a1 + 40)];
  }
  if (a2)
  {
    uint64_t v7 = [*(id *)(a1 + 32) dataForExistingData:v10 digest:a4 filename:*(void *)(a1 + 48) temporaryPath:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (id)dataFromReadChannel:(id)a3 filename:(id)a4 temporaryPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__TSPDataManager_dataFromReadChannel_filename_temporaryPath___block_invoke;
  v17[3] = &unk_2646AFBD8;
  dispatch_semaphore_t v20 = v11;
  v21 = &v22;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  dispatch_semaphore_t v12 = v11;
  id v13 = v9;
  id v14 = v8;
  [(TSPDataManager *)self findExistingDataForReadChannel:v10 dataURL:0 temporaryPath:v13 shouldWriteIfFound:0 completion:v17];

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

void __61__TSPDataManager_dataFromReadChannel_filename_temporaryPath___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v11 = v7;
  if (a2)
  {
    uint64_t v8 = [*(id *)(a1 + 32) dataForExistingData:v7 digest:a4 filename:*(void *)(a1 + 40) temporaryPath:*(void *)(a1 + 48)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (id)dataForExistingData:(id)a3 digest:(const void *)a4 filename:(id)a5 temporaryPath:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    id v13 = v10;
  }
  else
  {
    id v14 = [TSPTemporaryDataStorage alloc];
    id v15 = [NSURL fileURLWithPath:v12 isDirectory:0];
    v16 = [(TSPTemporaryDataStorage *)v14 initWithURL:v15];

    id v13 = [(TSPDataManager *)self addNewDataForStorage:v16 digest:a4 filename:v11];
  }

  return v13;
}

- (void)findExistingDataForReadChannel:(id)a3 dataURL:(id)a4 temporaryPath:(id)a5 shouldWriteIfFound:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  BOOL v43 = v12 != 0;
  if (!v12
    || (dispatch_fd_t v16 = [(TSPDataManager *)self openTemporaryPath:v14],
        *((unsigned char *)v41 + 24) = v16 >= 0,
        v16 < 0))
  {
    datasQueue = self->_datasQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke;
    block[3] = &unk_2646AFC00;
    v39 = v15;
    dispatch_async(datasQueue, block);
    dispatch_semaphore_t v20 = v39;
  }
  else
  {
    uint64_t v17 = dispatch_queue_create("TSPDataManager.TemporaryWrite", 0);
    cleanup_handler[0] = MEMORY[0x263EF8330];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_2;
    cleanup_handler[3] = &unk_2646AFC28;
    cleanup_handler[4] = &v40;
    dispatch_fd_t v37 = v16;
    dispatch_io_t v18 = dispatch_io_create(0, v16, v17, cleanup_handler);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_3;
    aBlock[3] = &unk_2646AFC78;
    v34 = &v40;
    BOOL v35 = a6;
    id v19 = v18;
    v32 = v19;
    v33 = v17;
    dispatch_semaphore_t v20 = v17;
    v21 = _Block_copy(aBlock);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_5;
    v24[3] = &unk_2646AFD18;
    BOOL v30 = a6;
    v29 = &v40;
    v25 = v19;
    v26 = self;
    id v27 = v14;
    id v28 = v15;
    uint64_t v22 = v19;
    [(TSPDataManager *)self findExistingDataForReadChannel:v12 dataURL:v13 readHandler:v21 completion:v24];
  }
  _Block_object_dispose(&v40, 8);
}

uint64_t __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (a2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(unsigned char *)(v2 + 24) == 0;
  }
  char v4 = !v3;
  *(unsigned char *)(v2 + 24) = v4;
  return close(*(_DWORD *)(a1 + 40));
}

void __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_3(uint64_t a1, void *a2, int a3, char a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 48);
  if (*(unsigned char *)(*(void *)(v8 + 8) + 24) && (!a3 || *(unsigned char *)(a1 + 56) || (a4 & 1) == 0))
  {
    uint64_t v9 = *(NSObject **)(a1 + 32);
    id v10 = *(NSObject **)(a1 + 40);
    io_handler[0] = MEMORY[0x263EF8330];
    io_handler[1] = 3221225472;
    io_handler[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_4;
    io_handler[3] = &unk_2646AFC50;
    io_handler[4] = v8;
    dispatch_io_write(v9, 0, v7, v10, io_handler);
  }
}

uint64_t __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  if (a4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = *(unsigned char *)(v4 + 24) == 0;
  }
  char v6 = !v5;
  *(unsigned char *)(v4 + 24) = v6;
  return result;
}

void __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  char v6 = v5;
  if (a2 && (!v5 || *(unsigned char *)(a1 + 72))) {
    operator new();
  }
  dispatch_io_close(*(dispatch_io_t *)(a1 + 32), 0);
  [*(id *)(a1 + 40) removeFileAtPath:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_6(uint64_t a1)
{
  dispatch_io_close(*(dispatch_io_t *)(a1 + 32), 0);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v2 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_7;
    block[3] = &unk_2646AFCC8;
    BOOL v3 = (id *)v11;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 40);
    v11[0] = v4;
    v11[1] = v5;
    uint64_t v14 = *(void *)(a1 + 80);
    id v12 = *(id *)(a1 + 56);
    char v15 = *(unsigned char *)(a1 + 88);
    id v13 = *(id *)(a1 + 64);
    dispatch_async(v2, block);
  }
  else
  {
    TSULogErrorInFunction();
    uint64_t v6 = *(void *)(a1 + 80);
    if (v6) {
      MEMORY[0x223CB8F20](v6, 0x1000C40A86A77D5);
    }
    [*(id *)(a1 + 40) removeFileAtPath:*(void *)(a1 + 56)];
    id v7 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_9;
    v8[3] = &unk_2646AFC00;
    BOOL v3 = &v9;
    id v9 = *(id *)(a1 + 64);
    dispatch_async(v7, v8);
  }
}

void __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_7(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2) {
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(a1 + 64);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_8;
  v6[3] = &unk_2646AFCA0;
  id v4 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v2 = [v4 dataForDigestImpl:v3 accessorBlock:v6];

  if (v2)
  {
LABEL_10:
    if (!*(unsigned char *)(a1 + 72)) {
      [*(id *)(a1 + 40) removeFileAtPath:*(void *)(a1 + 48)];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v5 = *(void *)(a1 + 64);
  if (v5) {
    MEMORY[0x223CB8F20](v5, 0x1000C40A86A77D5);
  }
}

void __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [NSURL fileURLWithPath:*(void *)(a1 + 32) isDirectory:0];
  v4[2](v4, v3);
}

uint64_t __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)findExistingDataForReadChannel:(id)a3 dataURL:(id)a4 readHandler:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (v10)
  {
    if (!v13) {
      goto LABEL_5;
    }
  }
  else
  {
    char v15 = [MEMORY[0x263F7C7F0] currentHandler];
    dispatch_fd_t v16 = [NSString stringWithUTF8String:"-[TSPDataManager findExistingDataForReadChannel:dataURL:readHandler:completion:]"];
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 409, @"Invalid parameter not satisfying: %s", "readChannel");

    if (!v14)
    {
LABEL_5:
      dispatch_io_t v18 = [MEMORY[0x263F7C7F0] currentHandler];
      id v19 = [NSString stringWithUTF8String:"-[TSPDataManager findExistingDataForReadChannel:dataURL:readHandler:completion:]"];
      dispatch_semaphore_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm"];
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, 410, @"Invalid parameter not satisfying: %s", "completion");
    }
  }
  v21 = objc_opt_class();
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke;
  v25[3] = &unk_2646AFD68;
  v25[4] = self;
  id v22 = v11;
  id v26 = v22;
  id v23 = v12;
  id v27 = v23;
  id v24 = v14;
  id v28 = v24;
  [v21 readWithChannel:v10 handler:v25];
}

void __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a2)
  {
    if (!v7) {
      operator new();
    }
    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke_4;
    block[3] = &unk_2646AFC00;
    id v13 = *(id *)(a1 + 56);
    dispatch_async(v10, block);
  }
  else if (v8)
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(uint64_t, void *, void, void))(v11 + 16))(v11, v9, 0, 0);
    }
  }
}

void __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke_3;
  v7[3] = &unk_2646AFCA0;
  uint64_t v3 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = [v3 dataForDigestImpl:v2 accessorBlock:v7];
  if (*(void *)(a1 + 48))
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  uint64_t v6 = *(void *)(a1 + 72);
  if (v6) {
    MEMORY[0x223CB8F20](v6, 0x1000C40A86A77D5);
  }
}

uint64_t __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

uint64_t __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)readWithChannel:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v17 = 0;
    dispatch_io_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    dispatch_semaphore_t v20 = 0;
    dispatch_semaphore_t v20 = malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
    CC_SHA1_Init((CC_SHA1_CTX *)v18[3]);
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__2;
    v15[4] = __Block_byref_object_dispose__2;
    id v16 = 0;
    dispatch_queue_t v7 = dispatch_queue_create("TSPDataManager.Read", 0);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __42__TSPDataManager_readWithChannel_handler___block_invoke;
    v11[3] = &unk_2646AFDB8;
    id v13 = v15;
    uint64_t v14 = &v17;
    id v12 = v6;
    [v5 readWithQueue:v7 handler:v11];

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v8 = [MEMORY[0x263F7C7F0] currentHandler];
    id v9 = [NSString stringWithUTF8String:"+[TSPDataManager readWithChannel:handler:]"];
    id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 450, @"Invalid parameter not satisfying: %s", "handler");
  }
}

void __42__TSPDataManager_readWithChannel_handler___block_invoke(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_queue_t v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v12 = *(void *)(v9 + 40);
  id v10 = (id *)(v9 + 40);
  uint64_t v11 = v12;
  if (!v8 || v11)
  {
    if (!v11)
    {
      if (v7)
      {
        if (dispatch_data_get_size(v7))
        {
          applier[0] = MEMORY[0x263EF8330];
          applier[1] = 3221225472;
          applier[2] = __42__TSPDataManager_readWithChannel_handler___block_invoke_2;
          applier[3] = &unk_2646AFD90;
          applier[4] = a1[6];
          dispatch_data_apply(v7, applier);
          if ((a2 & 1) == 0)
          {
            (*(void (**)(void))(a1[4] + 16))();
            goto LABEL_13;
          }
        }
        else if ((a2 & 1) == 0)
        {
          goto LABEL_13;
        }
      }
      else if (!a2)
      {
        goto LABEL_13;
      }
      CC_SHA1_Final(md, *(CC_SHA1_CTX **)(*(void *)(a1[6] + 8) + 24));
      free(*(void **)(*(void *)(a1[6] + 8) + 24));
      (*(void (**)(void))(a1[4] + 16))();
    }
  }
  else
  {
    objc_storeStrong(v10, a4);
    TSULogErrorInFunction();
    free(*(void **)(*(void *)(a1[6] + 8) + 24));
    (*(void (**)(void))(a1[4] + 16))(a1[4]);
  }
LABEL_13:
}

uint64_t __42__TSPDataManager_readWithChannel_handler___block_invoke_2(uint64_t a1, int a2, int a3, void *data, CC_LONG len)
{
  return 1;
}

- (id)dataFromNSData:(id)a3 filename:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSPDataManager dataFromNSData:filename:]"];
    id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:510 description:@"Filename was not provided for data."];
  }
  uint64_t v11 = [v7 lastPathComponent];

  CC_LONG v12 = [v6 length];
  id v13 = v6;
  CC_SHA1((const void *)[v13 bytes], v12, (unsigned __int8 *)&md);
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__2;
  v48 = __Block_byref_object_dispose__2;
  id v49 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  uint64_t v36 = 0;
  dispatch_fd_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  uint64_t v40 = __Block_byref_object_dispose__2;
  id v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__2;
  v30[4] = __Block_byref_object_dispose__2;
  id v31 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__TSPDataManager_dataFromNSData_filename___block_invoke;
  aBlock[3] = &unk_2646AFDE0;
  id v26 = v42;
  id v27 = &v36;
  void aBlock[4] = self;
  id v14 = v11;
  id v24 = v14;
  id v28 = &v32;
  id v15 = v13;
  id v25 = v15;
  v29 = v30;
  id v16 = _Block_copy(aBlock);
  datasQueue = self->_datasQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__TSPDataManager_dataFromNSData_filename___block_invoke_2;
  block[3] = &unk_2646AFE30;
  v52 = &v44;
  void block[4] = self;
  long long v55 = md;
  int v56 = v58;
  dispatch_io_t v18 = v16;
  id v51 = v18;
  v53 = &v32;
  v54 = &v36;
  dispatch_sync(datasQueue, block);
  if (!v45[5])
  {
    v18[2](v18);
    if (*((unsigned char *)v33 + 24))
    {
      uint64_t v19 = [(TSPDataManager *)self dataWithTemporaryPath:v37[5] digest:&md filename:v14];
      dispatch_semaphore_t v20 = (void *)v45[5];
      v45[5] = v19;
    }
    else
    {
      TSULogErrorInFunction();
    }
  }
  id v21 = (id)v45[5];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(&v44, 8);

  return v21;
}

void __42__TSPDataManager_dataFromNSData_filename___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v2 = [*(id *)(a1 + 32) temporaryPathForFilename:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    id v5 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v7 + 40);
    char v8 = [v5 writeToFile:v6 options:0 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __42__TSPDataManager_dataFromNSData_filename___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 72;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__TSPDataManager_dataFromNSData_filename___block_invoke_3;
  v7[3] = &unk_2646AFE08;
  uint64_t v3 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 56);
  uint64_t v4 = [v3 dataForDigestImpl:v2 accessorBlock:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __42__TSPDataManager_dataFromNSData_filename___block_invoke_3(void *a1, void *a2)
{
  uint64_t v6 = a2;
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v3 = *(void *)(a1[5] + 8);
  int v4 = *(unsigned __int8 *)(v3 + 24);
  if (*(unsigned char *)(v3 + 24))
  {
    uint64_t v5 = [NSURL fileURLWithPath:*(void *)(*(void *)(a1[6] + 8) + 40) isDirectory:0];
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6[2](v6, v5);
  if (v4) {
}
  }

- (id)documentResourceDataWithStorage:(id)a3 digestString:(id)a4 filename:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v9 = (TSP *)a4;
  id v10 = a5;
  TSP::DataDigestForString(v9, (uint64_t)v13);
  uint64_t v11 = [(TSPDataManager *)self dataWithStorage:v8 digest:v13 filename:v10 skipDocumentResourcesLookup:1 accessorBlock:0];

  return v11;
}

- (id)copyData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v6 = [v4 context];
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = [v5 context];
  id v8 = [(TSPDataManager *)self context];

  if (v7 != v8)
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__2;
    id v27 = __Block_byref_object_dispose__2;
    id v28 = 0;
    datasQueue = self->_datasQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__TSPDataManager_copyData___block_invoke;
    block[3] = &unk_2646AFE58;
    id v22 = &v23;
    void block[4] = self;
    id v10 = v5;
    id v21 = v10;
    dispatch_sync(datasQueue, block);
    uint64_t v11 = (void *)v24[5];
    if (!v11)
    {
      CC_LONG v12 = [(TSPDataManager *)self context];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __27__TSPDataManager_copyData___block_invoke_2;
      v16[3] = &unk_2646AFE80;
      uint64_t v19 = &v23;
      id v17 = v10;
      id v18 = v12;
      id v13 = v12;
      [v17 performIOChannelReadWithAccessor:v16];

      uint64_t v11 = (void *)v24[5];
    }
    id v14 = v11;

    _Block_object_dispose(&v23, 8);
  }
  else
  {
LABEL_7:
    id v14 = v5;
  }

  return v14;
}

void __27__TSPDataManager_copyData___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "dataForDigestImpl:accessorBlock:", objc_msgSend(*(id *)(a1 + 40), "digest"), 0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v12 = [*(id *)(a1 + 40) storage];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = [v12 storageForDataCopyFromOtherContext];
      uint64_t v7 = [*(id *)(a1 + 40) digest];
      id v8 = [*(id *)(a1 + 40) filename];
      uint64_t v9 = [v5 addNewDataForStorage:v6 digest:v7 filename:v8];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
}

void __27__TSPDataManager_copyData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v9 = v3;
    id v4 = (void *)[objc_alloc(MEMORY[0x263F7C8B8]) initWithReadChannel:v3];
    uint64_t v5 = [*(id *)(a1 + 32) filename];
    uint64_t v6 = +[TSPData dataFromReadChannel:v4 filename:v5 context:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v3 = v9;
  }
}

- (id)dataOrNilForIdentifier:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  datasQueue = self->_datasQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__TSPDataManager_dataOrNilForIdentifier___block_invoke;
  block[3] = &unk_2646AFA28;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(datasQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __41__TSPDataManager_dataOrNilForIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) dataForIdentifierImpl:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

- (id)dataForIdentifier:(int64_t)a3
{
  id v4 = -[TSPDataManager dataOrNilForIdentifier:](self, "dataOrNilForIdentifier:");
  uint64_t v5 = v4;
  if (!a3 || v4)
  {
    if (v4)
    {
      id v9 = v4;
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSPDataManager dataForIdentifier:]"];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 857, @"No data loaded for identifier: %qu", a3);
  }
  id v9 = +[TSPData null];
LABEL_7:
  uint64_t v10 = v9;

  return v10;
}

- (id)dataForIdentifierImpl:(int64_t)a3
{
  int64_t v7 = a3;
  p_identifierToDataMap = &self->_identifierToDataMap;
  id WeakRetained = (id *)std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::find<long long>(&self->_identifierToDataMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v7);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
    if (!WeakRetained)
    {
      std::__hash_table<std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::__unordered_map_hasher<EQKit::StemStretch::Key,std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::hash<EQKit::StemStretch::Key>,std::equal_to<EQKit::StemStretch::Key>,true>,std::__unordered_map_equal<EQKit::StemStretch::Key,std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::equal_to<EQKit::StemStretch::Key>,std::hash<EQKit::StemStretch::Key>,true>,std::allocator<std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>>>::remove(p_identifierToDataMap, v5, (uint64_t)v8);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<long long const,TSPData * {__weak}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<long long const,TSPData * {__weak}>,void *>>>>::reset[abi:nn180100]((uint64_t)v8, 0);
      id WeakRetained = 0;
    }
  }

  return WeakRetained;
}

- (int)openTemporaryPath:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    int v4 = TSUOpen();
    if (v4 < 0) {
      TSULogErrorInFunction();
    }
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (BOOL)linkTemporaryPath:(id)a3 fromURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = v6;
  if (v5)
  {
    if (([v6 isFileURL] & 1) == 0)
    {
      id v8 = [MEMORY[0x263F7C7F0] currentHandler];
      id v9 = [NSString stringWithUTF8String:"-[TSPDataManager linkTemporaryPath:fromURL:]"];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm"];
      [v8 handleFailureInFunction:v9 file:v10 lineNumber:913 description:@"Can't link to non-file URL"];
    }
    uint64_t v11 = [v7 path];
    BOOL v12 = +[TSPFileManager linkFileAtPath:v11 toPath:v5];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)temporaryPathForFilename:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  temporaryDirectoryQueue = self->_temporaryDirectoryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__TSPDataManager_temporaryPathForFilename___block_invoke;
  block[3] = &unk_2646AFAF0;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(temporaryDirectoryQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __43__TSPDataManager_temporaryPathForFilename___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 128))
  {
    uint64_t v3 = [(id)v2 createTemporaryDirectoryForPackageURL:*(void *)(v2 + 120)];
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = v3;

    id v6 = objc_alloc_init(MEMORY[0x263F7C8A0]);
    uint64_t v7 = a1[4];
    id v8 = *(void **)(v7 + 144);
    *(void *)(v7 + 144) = v6;

    id v9 = [MEMORY[0x263F08C38] UUID];
    if (!v9)
    {
      id v10 = [MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSPDataManager temporaryPathForFilename:]_block_invoke"];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 931, @"invalid nil value for '%s'", "uuid");
    }
    id v13 = *(void **)(a1[4] + 128);
    uint64_t v14 = [v9 UUIDString];
    uint64_t v15 = [v13 URLByAppendingPathComponent:v14];
    uint64_t v16 = a1[4];
    id v17 = *(void **)(v16 + 136);
    *(void *)(v16 + 136) = v15;

    id v18 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v19 = *(void *)(a1[4] + 136);
    id v28 = 0;
    char v20 = [v18 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v28];
    id v21 = v28;

    if ((v20 & 1) == 0)
    {
      objc_storeStrong((id *)(a1[4] + 136), *(id *)(a1[4] + 128));
      id v27 = v21;
      TSULogErrorInFunction();
    }

    uint64_t v2 = a1[4];
  }
  id v22 = objc_msgSend(*(id *)(v2 + 144), "addPath:", a1[5], v27);
  uint64_t v23 = [*(id *)(a1[4] + 136) path];
  uint64_t v24 = [v23 stringByAppendingPathComponent:v22];
  uint64_t v25 = *(void *)(a1[6] + 8);
  id v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v24;
}

- (id)dataWithTemporaryPath:(id)a3 digest:(const void *)a4 filename:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [NSURL fileURLWithPath:v8 isDirectory:0];
  uint64_t v11 = [[TSPTemporaryDataStorage alloc] initWithURL:v10];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__TSPDataManager_dataWithTemporaryPath_digest_filename___block_invoke;
  v15[3] = &unk_2646AFCA0;
  id v12 = v10;
  id v16 = v12;
  id v13 = [(TSPDataManager *)self dataWithStorage:v11 digest:a4 filename:v9 skipDocumentResourcesLookup:0 accessorBlock:v15];

  return v13;
}

uint64_t __56__TSPDataManager_dataWithTemporaryPath_digest_filename___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (void)setDocumentURL:(id)a3
{
  id v4 = a3;
  temporaryDirectoryQueue = self->_temporaryDirectoryQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__TSPDataManager_setDocumentURL___block_invoke;
  v7[3] = &unk_2646AFAA0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(temporaryDirectoryQueue, v7);
}

uint64_t __33__TSPDataManager_setDocumentURL___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 120) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (id)dataFromExternalReferenceURL:(id)a3 useFileCoordination:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 isFileURL] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F7C7F0] currentHandler];
    id v8 = [NSString stringWithUTF8String:"-[TSPDataManager dataFromExternalReferenceURL:useFileCoordination:]"];
    id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm"];
    [v7 handleFailureInFunction:v8 file:v9 lineNumber:1022 description:@"External references must be added from a file URL"];
  }
  id v10 = self;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__2;
  id v27 = __Block_byref_object_dispose__2;
  id v28 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__TSPDataManager_dataFromExternalReferenceURL_useFileCoordination___block_invoke;
  aBlock[3] = &unk_2646AFEF8;
  void aBlock[4] = v10;
  id v22 = &v23;
  uint64_t v11 = v10;
  id v21 = v11;
  id v12 = _Block_copy(aBlock);
  id v13 = v12;
  if (v4)
  {
    id v19 = 0;
    objc_msgSend(MEMORY[0x263F08830], "tsp_coordinateReadingItemAtURL:options:filePresenter:error:byAccessor:", v6, 0, 0, &v19, v12);
    id v14 = v19;
    if (v14)
    {
      id v15 = v14;
      TSULogErrorInFunction();
      id v16 = v15;
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    (*((void (**)(void *, id))v12 + 2))(v12, v6);
    id v16 = 0;
  }
  id v17 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v17;
}

void __67__TSPDataManager_dataFromExternalReferenceURL_useFileCoordination___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F7C830]) initForReadingURL:v3];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = *(void **)(a1 + 32);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __67__TSPDataManager_dataFromExternalReferenceURL_useFileCoordination___block_invoke_2;
  id v12 = &unk_2646AFED0;
  uint64_t v16 = *(void *)(a1 + 48);
  id v7 = v3;
  id v13 = v7;
  id v14 = *(id *)(a1 + 40);
  id v8 = v5;
  id v15 = v8;
  [v6 findExistingDataForReadChannel:v4 dataURL:v7 readHandler:0 completion:&v9];
  objc_msgSend(v4, "close", v9, v10, v11, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

void __67__TSPDataManager_dataFromExternalReferenceURL_useFileCoordination___block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v16 = v7;
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      id v9 = v7;
      uint64_t v10 = *(TSPExternalReferenceDataStorage **)(v8 + 40);
      *(void *)(v8 + 40) = v9;
    }
    else
    {
      uint64_t v10 = [[TSPExternalReferenceDataStorage alloc] initWithURL:*(void *)(a1 + 32)];
      uint64_t v11 = *(void **)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) lastPathComponent];
      uint64_t v13 = [v11 addNewDataForStorage:v10 digest:a4 filename:v12];
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)removeExternalReferences
{
  [(TSPDataManager *)self waitForRemoveExternalReferencesToComplete];
  externalReferenceRemovalGroup = self->_externalReferenceRemovalGroup;
  datasQueue = self->_datasQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__TSPDataManager_removeExternalReferences__block_invoke;
  block[3] = &unk_2646AFA00;
  void block[4] = self;
  dispatch_group_async(externalReferenceRemovalGroup, datasQueue, block);
}

void __42__TSPDataManager_removeExternalReferences__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 152))
  {
    uint64_t v2 = *(id **)(v1 + 48);
    if (v2)
    {
      do
      {
        id WeakRetained = objc_loadWeakRetained(v2 + 3);
        objc_opt_class();
        dispatch_semaphore_t v5 = [WeakRetained storage];
        id v6 = TSUDynamicCast();

        if (v6) {
          [*(id *)(a1 + 32) removeExternalReferenceForData:WeakRetained storage:v6];
        }

        uint64_t v2 = (id *)*v2;
      }
      while (v2);
      uint64_t v1 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v1 + 152) = 0;
  }
}

- (void)waitForRemoveExternalReferencesToComplete
{
}

- (void)removeExternalReferenceForData:(id)a3 storage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = dispatch_get_global_queue(0, 0);
  dispatch_group_enter((dispatch_group_t)self->_externalReferenceRemovalGroup);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke;
  block[3] = &unk_2646AFF70;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke(void *a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke_2;
  v3[3] = &unk_2646AFF48;
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = (void *)a1[6];
  v3[4] = a1[5];
  id v4 = v2;
  [v1 performIOChannelReadWithAccessor:v3];
}

void __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) filename];
    dispatch_semaphore_t v5 = [*(id *)(a1 + 32) temporaryPathForFilename:v4];
    id v6 = (void *)[objc_alloc(MEMORY[0x263F7C8B8]) initWithReadChannel:v3];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke_3;
    id v14 = &unk_2646AFF20;
    id v7 = *(void **)(a1 + 32);
    id v15 = *(id *)(a1 + 40);
    id v8 = v5;
    id v16 = v8;
    id v9 = v4;
    uint64_t v10 = *(void *)(a1 + 32);
    id v17 = v9;
    uint64_t v18 = v10;
    [v7 findExistingDataForReadChannel:v6 dataURL:0 temporaryPath:v8 shouldWriteIfFound:1 completion:&v11];
    objc_msgSend(v3, "close", v11, v12, v13, v14);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 160));
  }
}

void __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2)
  {
    if (*(id *)(a1 + 32) != v5) {
      TSULogErrorInFunction();
    }
    id v6 = [TSPTemporaryDataStorage alloc];
    id v7 = [NSURL fileURLWithPath:*(void *)(a1 + 40) isDirectory:0];
    id v8 = [(TSPTemporaryDataStorage *)v6 initWithURL:v7];

    [*(id *)(a1 + 32) setFilename:*(void *)(a1 + 48) storage:v8];
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 56) + 160));
}

- (id)dataForDigestImpl:(const void *)a3 accessorBlock:(id)a4
{
  id v4 = [(TSPDataManager *)self dataForDigestImpl:a3 skipDocumentResourcesLookup:0 accessorBlock:a4];

  return v4;
}

- (id)dataForDigestImpl:(const void *)a3 skipDocumentResourcesLookup:(BOOL)a4 accessorBlock:(id)a5
{
  id v7 = a5;
  p_digestToDataMap = &self->_digestToDataMap;
  id v9 = std::__hash_table<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,std::__unordered_map_hasher<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestHash,TSP::DataDigestEqualTo,true>,std::__unordered_map_equal<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestEqualTo,TSP::DataDigestHash,true>,std::allocator<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>>>::find<std::array<unsigned char,20ul>>(p_digestToDataMap, (unint64_t *)a3);
  uint64_t v10 = v9;
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)v9 + 5);
    if (!WeakRetained)
    {
      std::__hash_table<std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::__unordered_map_hasher<EQKit::StemStretch::Key,std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::hash<EQKit::StemStretch::Key>,std::equal_to<EQKit::StemStretch::Key>,true>,std::__unordered_map_equal<EQKit::StemStretch::Key,std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::equal_to<EQKit::StemStretch::Key>,std::hash<EQKit::StemStretch::Key>,true>,std::allocator<std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>>>::remove(p_digestToDataMap, v10, (uint64_t)v13);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,void *>>>>::reset[abi:nn180100]((uint64_t)v13, 0);
    }
  }
  else
  {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (id)dataForDigest:(const void *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  datasQueue = self->_datasQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__TSPDataManager_dataForDigest___block_invoke;
  block[3] = &unk_2646AFA28;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(datasQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __32__TSPDataManager_dataForDigest___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) dataForDigestImpl:*(void *)(a1 + 48) accessorBlock:0];

  return MEMORY[0x270F9A758]();
}

- (void)dataForDigest:(const void *)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  datasQueue = self->_datasQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__TSPDataManager_dataForDigest_queue_completion___block_invoke;
  v13[3] = &unk_2646AFF98;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(datasQueue, v13);
}

void __49__TSPDataManager_dataForDigest_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataForDigestImpl:*(void *)(a1 + 56) accessorBlock:0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__TSPDataManager_dataForDigest_queue_completion___block_invoke_2;
  v6[3] = &unk_2646AFA50;
  id v3 = *(NSObject **)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __49__TSPDataManager_dataForDigest_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)dataWithStorage:(id)a3 digest:(const void *)a4 filename:(id)a5 skipDocumentResourcesLookup:(BOOL)a6 accessorBlock:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (v12)
  {
    if (v13) {
      goto LABEL_6;
    }
  }
  else
  {
    id v15 = [MEMORY[0x263F7C7F0] currentHandler];
    id v16 = [NSString stringWithUTF8String:"-[TSPDataManager dataWithStorage:digest:filename:skipDocumentResourcesLookup:accessorBlock:]"];
    id v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 1265, @"Invalid parameter not satisfying: %s", "storage");

    if (v13) {
      goto LABEL_6;
    }
  }
  uint64_t v18 = [MEMORY[0x263F7C7F0] currentHandler];
  id v19 = [NSString stringWithUTF8String:"-[TSPDataManager dataWithStorage:digest:filename:skipDocumentResourcesLookup:accessorBlock:]"];
  char v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm"];
  objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, 1266, @"Invalid parameter not satisfying: %s", "filename");

LABEL_6:
  uint64_t v34 = 0;
  char v35 = &v34;
  uint64_t v36 = 0x3032000000;
  dispatch_fd_t v37 = __Block_byref_object_copy__2;
  uint64_t v38 = __Block_byref_object_dispose__2;
  id v39 = 0;
  datasQueue = self->_datasQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__TSPDataManager_dataWithStorage_digest_filename_skipDocumentResourcesLookup_accessorBlock___block_invoke;
  block[3] = &unk_2646AFFC0;
  id v31 = &v34;
  uint64_t v32 = a4;
  BOOL v33 = a6;
  void block[4] = self;
  id v28 = v12;
  id v29 = v13;
  id v30 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  dispatch_sync(datasQueue, block);
  id v25 = (id)v35[5];

  _Block_object_dispose(&v34, 8);

  return v25;
}

void __92__TSPDataManager_dataWithStorage_digest_filename_skipDocumentResourcesLookup_accessorBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataForDigestImpl:*(void *)(a1 + 72) skipDocumentResourcesLookup:*(unsigned __int8 *)(a1 + 80) accessorBlock:*(void *)(a1 + 56)];
  id v4 = v2;
  if (!v2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) addNewDataForStorage:*(void *)(a1 + 40) digest:*(void *)(a1 + 72) filename:*(void *)(a1 + 48)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v2);
  id v3 = v4;
  if (!v4)
  {

    id v3 = 0;
  }
}

- (id)addNewDataForStorage:(id)a3 digest:(const void *)a4 filename:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [[TSPData alloc] initWithIdentifier:self->_nextNewIdentifier digest:a4 filename:v9 storage:v8 manager:self];
  [(TSPDataManager *)self addData:v10];
  ++self->_nextNewIdentifier;

  return v10;
}

- (void)addData:(id)a3
{
  id v4 = a3;
  unint64_t v8 = [v4 identifier];
  id v9 = (long long *)&v8;
  id v5 = (id *)std::__hash_table<std::__hash_value_type<long long const,TSPData * {__weak}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,TSPData * {__weak}>,TSP::ObjectIdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,TSPData * {__weak}>,std::equal_to<long long const>,TSP::ObjectIdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,TSPData * {__weak}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)&self->_identifierToDataMap, &v8, (uint64_t)&std::piecewise_construct, (void **)&v9);
  objc_storeWeak(v5 + 3, v4);
  id v9 = (long long *)[v4 digest];
  id v6 = std::__hash_table<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,std::__unordered_map_hasher<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestHash,TSP::DataDigestEqualTo,true>,std::__unordered_map_equal<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestEqualTo,TSP::DataDigestHash,true>,std::allocator<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>>>::__emplace_unique_key_args<std::array<unsigned char,20ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,20ul> const&>,std::tuple<>>((uint64_t)&self->_digestToDataMap, (uint64_t)v9, (uint64_t)&std::piecewise_construct, &v9);
  objc_storeWeak((id *)v6 + 5, v4);
  if (self->_hasExternalReferences)
  {
    self->_hasExternalReferences = 1;
  }
  else
  {
    id v7 = [v4 storage];
    objc_opt_class();
    self->_hasExternalReferences = objc_opt_isKindOfClass() & 1;
  }
}

- (id)checkForPersistenceWarningsWithPackageURL:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  id v5 = [WeakRetained delegate];

  if (objc_opt_respondsToSelector())
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __60__TSPDataManager_checkForPersistenceWarningsWithPackageURL___block_invoke;
    v11[3] = &unk_2646AFFE8;
    id v7 = v6;
    id v12 = v7;
    id v13 = v5;
    [(TSPDataManager *)self enumerateDatasUsingBlock:v11];
    unint64_t v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __60__TSPDataManager_checkForPersistenceWarningsWithPackageURL___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (([v8 isApplicationData] & 1) == 0)
  {
    uint64_t v3 = [v8 isReadable];
    id v4 = [v8 storage];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) persistenceWarningsForData:v8 isReadable:v3 isExternal:isKindOfClass & 1];
    [v6 unionSet:v7];
  }
}

+ (id)stringForDigest:(const void *)a3
{
  return (id)objc_msgSend(NSString, "tsp_stringForDigest:length:", a3, 20);
}

- (void)removeFileAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v7 = 0;
  char v5 = [v4 removeItemAtPath:v3 error:&v7];
  id v6 = v7;

  if ((v5 & 1) == 0) {
    TSULogErrorInFunction();
  }
}

- (TSPObjectContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (TSPObjectContext *)WeakRetained;
}

- (id)createTemporaryDirectoryForPackageURL:(id)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F7C8D8]) initWithSignature:@"DocumentData"];
  [v3 leakTemporaryDirectory];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v3 URL];
  uint64_t v6 = *MEMORY[0x263F08098];
  id v12 = 0;
  [v4 changeFileProtectionAtURL:v5 toProtection:v6 recursively:0 error:&v12];
  id v7 = v12;

  id v8 = NSURL;
  id v9 = [v3 path];
  uint64_t v10 = [v8 fileURLWithPath:v9 isDirectory:1];

  return v10;
}

@end