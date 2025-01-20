@interface PUReviewAssetsMediaDestination
- (BOOL)supportsProgressForRequestWithIdentifier:(int)a3;
- (NSMutableDictionary)_pendingRequestsByRequestIdentifier;
- (NSURL)_desiredOutputDirectory;
- (PUEditableMediaProvider)_mediaProvider;
- (PUReviewAssetsMediaDestination)initWithOutputDirectory:(id)a3 mediaProvider:(id)a4;
- (double)progressForRequestWithIdentifier:(int)a3;
- (id)_saveEditsWithRequest:(id)a3 completionHandler:(id)a4;
- (int)revertEditsForAsset:(id)a3 completionHandler:(id)a4;
- (int)saveEditsForAsset:(id)a3 usingContentEditingOutput:(id)a4 livePhotoState:(unsigned __int16)a5 completionHandler:(id)a6;
- (int)saveInternalEditsForAsset:(id)a3 usingCompositionController:(id)a4 contentEditingOutput:(id)a5 version:(int64_t)a6 livePhotoState:(unsigned __int16)a7 completionHandler:(id)a8;
- (int64_t)_workImageVersionForContentEditingOutput:(id)a3;
- (void)_requestDidFinish:(id)a3;
- (void)cancelRequestWithIdentifier:(int)a3;
@end

@implementation PUReviewAssetsMediaDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestsByRequestIdentifier, 0);
  objc_storeStrong((id *)&self->__mediaProvider, 0);
  objc_storeStrong((id *)&self->__desiredOutputDirectory, 0);
}

- (NSMutableDictionary)_pendingRequestsByRequestIdentifier
{
  return self->_pendingRequestsByRequestIdentifier;
}

- (PUEditableMediaProvider)_mediaProvider
{
  return self->__mediaProvider;
}

- (NSURL)_desiredOutputDirectory
{
  return self->__desiredOutputDirectory;
}

- (PUReviewAssetsMediaDestination)initWithOutputDirectory:(id)a3 mediaProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUReviewAssetsMediaDestination;
  v8 = [(PUReviewAssetsMediaDestination *)&v15 init];
  if (v8 && [v6 hasDirectoryPath])
  {
    uint64_t v9 = [v6 copy];
    desiredOutputDirectory = v8->__desiredOutputDirectory;
    v8->__desiredOutputDirectory = (NSURL *)v9;

    objc_storeStrong((id *)&v8->__mediaProvider, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingRequestsByRequestIdentifier = v8->_pendingRequestsByRequestIdentifier;
    v8->_pendingRequestsByRequestIdentifier = v11;

    v13 = v8;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int64_t)_workImageVersionForContentEditingOutput:(id)a3
{
  unint64_t v3 = [a3 baseVersion];
  if (v3 < 3) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (void)_requestDidFinish:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 identifier];
  id v10 = [NSNumber numberWithInt:v6];
  id v7 = [(PUReviewAssetsMediaDestination *)self _pendingRequestsByRequestIdentifier];
  id v8 = [v7 objectForKey:v10];

  if (v8 != v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PUReviewAssetsMediaDestination.m" lineNumber:146 description:@"The pending request doesn't match the expected request"];
  }
  [v7 removeObjectForKey:v10];
}

- (id)_saveEditsWithRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUReviewAssetsMediaDestination.m", 110, @"Invalid parameter not satisfying: %@", @"saveRequest" object file lineNumber description];
  }
  uint64_t v9 = [v7 identifier];
  id v10 = [NSNumber numberWithInt:v9];
  v11 = [(PUReviewAssetsMediaDestination *)self _pendingRequestsByRequestIdentifier];
  v12 = [v11 objectForKey:v10];
  if (v12)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PUReviewAssetsMediaDestination.m" lineNumber:119 description:@"Cannot begin a new request if there is a pending one for this photo"];

    id v14 = 0;
  }
  else
  {
    [v11 setObject:v7 forKey:v10];
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__PUReviewAssetsMediaDestination__saveEditsWithRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E5F2B380;
    objc_copyWeak(&v21, &location);
    id v13 = v7;
    id v19 = v13;
    id v20 = v8;
    [v13 beginSaveOperationWithCompletionHandler:v18];
    id v14 = v13;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __74__PUReviewAssetsMediaDestination__saveEditsWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _requestDidFinish:*(void *)(a1 + 32)];

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (double)progressForRequestWithIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(PUReviewAssetsMediaDestination *)self _pendingRequestsByRequestIdentifier];
  id v5 = [NSNumber numberWithInt:v3];
  uint64_t v6 = [v4 objectForKey:v5];

  double v7 = 0.0;
  if ([v6 supportsProgress])
  {
    [v6 progress];
    double v7 = v8;
  }

  return v7;
}

- (BOOL)supportsProgressForRequestWithIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(PUReviewAssetsMediaDestination *)self _pendingRequestsByRequestIdentifier];
  id v5 = [NSNumber numberWithInt:v3];
  uint64_t v6 = [v4 objectForKey:v5];

  LOBYTE(v5) = [v6 supportsProgress];
  return (char)v5;
}

- (void)cancelRequestWithIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = [(PUReviewAssetsMediaDestination *)self _pendingRequestsByRequestIdentifier];
  v4 = [NSNumber numberWithInt:v3];
  id v5 = [v6 objectForKey:v4];

  [v5 cancelSaveOperation];
}

- (int)revertEditsForAsset:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUReviewAssetsMediaDestination.m", 70, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  uint64_t v9 = [(PUReviewAssetsMediaDestination *)self _mediaProvider];
  id v10 = [(PUReviewAssetsMediaDestination *)self _desiredOutputDirectory];
  v11 = [[PUSaveReviewAssetRequest alloc] initWithAssetForRevertToOriginal:v7 mediaProvider:v9 directory:v10];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__PUReviewAssetsMediaDestination_revertEditsForAsset_completionHandler___block_invoke;
  v16[3] = &unk_1E5F2B358;
  id v17 = v8;
  id v12 = v8;
  id v13 = [(PUReviewAssetsMediaDestination *)self _saveEditsWithRequest:v11 completionHandler:v16];

  LODWORD(v11) = [v13 identifier];
  return (int)v11;
}

uint64_t __72__PUReviewAssetsMediaDestination_revertEditsForAsset_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int)saveInternalEditsForAsset:(id)a3 usingCompositionController:(id)a4 contentEditingOutput:(id)a5 version:(int64_t)a6 livePhotoState:(unsigned __int16)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (!v15)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PUReviewAssetsMediaDestination.m", 53, @"Invalid parameter not satisfying: %@", @"compositionController" object file lineNumber description];
  }
  v18 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEFAULT, "PUReviewAssetsMediaDestination save edits for asset...", buf, 2u);
  }

  id v19 = [(PUReviewAssetsMediaDestination *)self _mediaProvider];
  id v20 = [(PUReviewAssetsMediaDestination *)self _desiredOutputDirectory];
  id v21 = [[PUSaveReviewAssetRequest alloc] initWithAsset:v14 mediaProvider:v19 directory:v20 compositionController:v15 workImageVersion:a6];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __149__PUReviewAssetsMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke;
  v26[3] = &unk_1E5F2B358;
  id v27 = v17;
  id v22 = v17;
  v23 = [(PUReviewAssetsMediaDestination *)self _saveEditsWithRequest:v21 completionHandler:v26];

  LODWORD(v21) = [v23 identifier];
  return (int)v21;
}

uint64_t __149__PUReviewAssetsMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int)saveEditsForAsset:(id)a3 usingContentEditingOutput:(id)a4 livePhotoState:(unsigned __int16)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v11)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUReviewAssetsMediaDestination.m", 36, @"Invalid parameter not satisfying: %@", @"contentEditingOutput" object file lineNumber description];
  }
  id v13 = [(PUReviewAssetsMediaDestination *)self _mediaProvider];
  id v14 = [(PUReviewAssetsMediaDestination *)self _desiredOutputDirectory];
  id v15 = [[PUSaveReviewAssetRequest alloc] initWithAsset:v10 mediaProvider:v13 directory:v14 contentEditingOutput:v11 workImageVersion:[(PUReviewAssetsMediaDestination *)self _workImageVersionForContentEditingOutput:v11]];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __111__PUReviewAssetsMediaDestination_saveEditsForAsset_usingContentEditingOutput_livePhotoState_completionHandler___block_invoke;
  v20[3] = &unk_1E5F2B358;
  id v21 = v12;
  id v16 = v12;
  id v17 = [(PUReviewAssetsMediaDestination *)self _saveEditsWithRequest:v15 completionHandler:v20];

  LODWORD(v15) = [v17 identifier];
  return (int)v15;
}

uint64_t __111__PUReviewAssetsMediaDestination_saveEditsForAsset_usingContentEditingOutput_livePhotoState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end