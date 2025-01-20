@interface PLAssetResourceDownloadRequest
- (NSError)error;
- (NSManagedObjectID)objectID;
- (NSString)cplTaskIdentifier;
- (PLAssetResourceDownloadRequest)initWithRequestID:(int)a3 library:(id)a4 queue:(id)a5 cloudResourceType:(unint64_t)a6 managedObjectID:(id)a7 progressHandler:(id)a8;
- (int)requestID;
- (unint64_t)cloudResourceType;
- (void)_onQueueAsync:(id)a3;
- (void)cancel;
- (void)main;
@end

@implementation PLAssetResourceDownloadRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cplTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSError)error
{
  return self->_error;
}

- (NSString)cplTaskIdentifier
{
  return self->_cplTaskIdentifier;
}

- (unint64_t)cloudResourceType
{
  return self->_cloudResourceType;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (int)requestID
{
  return self->_requestID;
}

- (void)cancel
{
  v7.receiver = self;
  v7.super_class = (Class)PLAssetResourceDownloadRequest;
  [(PLAssetResourceDownloadRequest *)&v7 cancel];
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PLAssetResourceDownloadRequest_cancel__block_invoke;
  v5[3] = &unk_1E5875E18;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  [(PLAssetResourceDownloadRequest *)self _onQueueAsync:v5];
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

void __40__PLAssetResourceDownloadRequest_cancel__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 256) libraryServicesManager];
  v3 = [v2 cloudPhotoLibraryManager];

  if (v3 && ([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 272);
      objc_super v7 = [MEMORY[0x1E4F59940] descriptionForResourceType:*(void *)(v5 + 296)];
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling download for asset uuid: %@ cloudResourceType: %@", buf, 0x16u);
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 304);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__PLAssetResourceDownloadRequest_cancel__block_invoke_49;
    v9[3] = &unk_1E58626C8;
    id v10 = *(id *)(a1 + 40);
    [v3 cancelResourceTransferTaskWithIdentifier:v8 completion:v9];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __40__PLAssetResourceDownloadRequest_cancel__block_invoke_49(uint64_t a1)
{
}

- (void)main
{
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke;
  v20[3] = &unk_1E5862538;
  v20[4] = self;
  v4 = v3;
  v21 = v4;
  uint64_t v5 = (void *)MEMORY[0x19F38D650](v20);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_3;
  v19[3] = &unk_1E58626A0;
  v19[4] = self;
  uint64_t v6 = (void *)MEMORY[0x19F38D650](v19);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_5;
  v17[3] = &unk_1E5862560;
  v17[4] = self;
  v18 = v4;
  objc_super v7 = v4;
  uint64_t v8 = (void *)MEMORY[0x19F38D650](v17);
  library = self->_library;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_7;
  v13[3] = &unk_1E5862588;
  v13[4] = self;
  id v14 = v5;
  id v15 = v6;
  id v16 = v8;
  id v10 = v8;
  id v11 = v6;
  id v12 = v5;
  [(PLPhotoLibrary *)library performBlock:v13];
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __38__PLAssetResourceDownloadRequest_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_2;
  v8[3] = &unk_1E5873A50;
  v8[4] = v6;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [v6 _onQueueAsync:v8];
}

uint64_t __38__PLAssetResourceDownloadRequest_main__block_invoke_3(uint64_t a1, float a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_4;
  v4[3] = &unk_1E5863058;
  v4[4] = v2;
  float v5 = a2;
  return [v2 _onQueueAsync:v4];
}

void __38__PLAssetResourceDownloadRequest_main__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__PLAssetResourceDownloadRequest_main__block_invoke_6;
  v9[3] = &unk_1E5873A50;
  void v9[4] = v7;
  id v10 = v6;
  id v11 = *(id *)(a1 + 40);
  id v8 = v6;
  [v7 _onQueueAsync:v9];
}

void __38__PLAssetResourceDownloadRequest_main__block_invoke_7(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedAsset assetWithObjectID:*(void *)(a1[4] + 288) inLibrary:*(void *)(a1[4] + 256)];
  uint64_t v3 = [v2 uuid];
  uint64_t v4 = a1[4];
  float v5 = *(void **)(v4 + 272);
  *(void *)(v4 + 272) = v3;

  id v6 = PLBackendGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = *(void *)(v7 + 272);
    id v9 = [MEMORY[0x1E4F59940] descriptionForResourceType:*(void *)(v7 + 296)];
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Initiating download for asset uuid: %@ cloudResourceType: %@", buf, 0x16u);
  }
  id v10 = [*(id *)(a1[4] + 256) libraryServicesManager];
  id v11 = [v10 cloudPhotoLibraryManager];

  [v11 downloadAsset:v2 resourceType:*(void *)(a1[4] + 296) masterResourceOnly:0 highPriority:0 clientBundleID:0 proposedTaskIdentifier:*(void *)(a1[4] + 304) taskDidBeginHandler:a1[5] progressBlock:a1[6] completionHandler:a1[7]];
}

void __38__PLAssetResourceDownloadRequest_main__block_invoke_6(void *a1)
{
  (*(void (**)(double))(*(void *)(a1[4] + 264) + 16))(1.0);
  v2 = (void *)a1[5];
  if (v2) {
    objc_storeStrong((id *)(a1[4] + 312), v2);
  }
  uint64_t v3 = a1[6];
  dispatch_group_leave(v3);
}

uint64_t __38__PLAssetResourceDownloadRequest_main__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double))(*(void *)(*(void *)(a1 + 32) + 264) + 16))(*(void *)(*(void *)(a1 + 32) + 264), *(unsigned int *)(*(void *)(a1 + 32) + 280), *(float *)(a1 + 40));
}

void __38__PLAssetResourceDownloadRequest_main__block_invoke_2(void *a1)
{
  (*(void (**)(double))(*(void *)(a1[4] + 264) + 16))(0.0);
  v2 = (void *)a1[5];
  if (v2)
  {
    objc_storeStrong((id *)(a1[4] + 312), v2);
    uint64_t v3 = a1[6];
    dispatch_group_leave(v3);
  }
}

- (PLAssetResourceDownloadRequest)initWithRequestID:(int)a3 library:(id)a4 queue:(id)a5 cloudResourceType:(unint64_t)a6 managedObjectID:(id)a7 progressHandler:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (v17)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_8:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLAssetResourceDownloadRequest.m", 40, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PLAssetResourceDownloadRequest.m", 39, @"Invalid parameter not satisfying: %@", @"objectID" object file lineNumber description];

  if (!v16) {
    goto LABEL_8;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_9:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"PLAssetResourceDownloadRequest.m", 41, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];

LABEL_4:
  v31.receiver = self;
  v31.super_class = (Class)PLAssetResourceDownloadRequest;
  v19 = [(PLAssetResourceDownloadRequest *)&v31 init];
  v20 = v19;
  if (v19)
  {
    v19->_requestID = a3;
    objc_storeStrong((id *)&v19->_queue, a5);
    objc_storeStrong((id *)&v20->_objectID, a7);
    v20->_cloudResourceType = a6;
    uint64_t v21 = MEMORY[0x19F38D650](v18);
    id progressHandler = v20->_progressHandler;
    v20->_id progressHandler = (id)v21;

    objc_storeStrong((id *)&v20->_library, a4);
    v23 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v24 = [v23 UUIDString];
    cplTaskIdentifier = v20->_cplTaskIdentifier;
    v20->_cplTaskIdentifier = (NSString *)v24;
  }
  return v20;
}

- (void)_onQueueAsync:(id)a3
{
}

@end