@interface PEPhotoKitMediaDestination
- (BOOL)applyVideoOrientationAsMetadata;
- (BOOL)supportsProgressForRequestWithIdentifier:(int)a3;
- (NSMutableDictionary)_pendingRequestsByRequestIdentifier;
- (PEPhotoKitMediaDestination)init;
- (PEPhotoKitMediaDestinationDelegate)delegate;
- (double)progressForRequestWithIdentifier:(int)a3;
- (id)_fetchUpdatedAssetWithLocalIdentifier:(id)a3 photoLibrary:(id)a4;
- (id)_saveEditsForPhoto:(id)a3 saveRequest:(id)a4 completionHandler:(id)a5;
- (int)revertEditsForAsset:(id)a3 completionHandler:(id)a4;
- (int)saveEditsForAsset:(id)a3 usingContentEditingOutput:(id)a4 livePhotoState:(unsigned __int16)a5 completionHandler:(id)a6;
- (int)saveInternalEditsForAsset:(id)a3 usingCompositionController:(id)a4 contentEditingOutput:(id)a5 version:(int64_t)a6 livePhotoState:(unsigned __int16)a7 completionHandler:(id)a8;
- (void)_requestDidFinish:(id)a3;
- (void)cancelRequestWithIdentifier:(int)a3;
- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PEPhotoKitMediaDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestsByRequestIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSMutableDictionary)_pendingRequestsByRequestIdentifier
{
  return self->_pendingRequestsByRequestIdentifier;
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (void)setDelegate:(id)a3
{
}

- (PEPhotoKitMediaDestinationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PEPhotoKitMediaDestinationDelegate *)WeakRetained;
}

- (id)_fetchUpdatedAssetWithLocalIdentifier:(id)a3 photoLibrary:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F14E18] fetchOptionsWithInclusiveDefaultsForPhotoLibrary:a4];
  v7 = (void *)MEMORY[0x263F14D18];
  v15[0] = v5;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v9 = [v7 fetchAssetsWithLocalIdentifiers:v8 options:v6];

  v10 = [v9 firstObject];
  if (!v10)
  {
    v11 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_217B65000, v11, OS_LOG_TYPE_ERROR, "Error fetching photo with local identifier: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  return v10;
}

- (void)_requestDidFinish:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 identifier];
  id v10 = [NSNumber numberWithInt:v6];
  v7 = [(PEPhotoKitMediaDestination *)self _pendingRequestsByRequestIdentifier];
  id v8 = [v7 objectForKey:v10];

  if (v8 != v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PEPhotoKitMediaDestination.m" lineNumber:182 description:@"The pending request doesn't match the expected request"];
  }
  [v7 removeObjectForKey:v10];
}

- (id)_saveEditsForPhoto:(id)a3 saveRequest:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PEPhotoKitMediaDestination.m", 139, @"Invalid parameter not satisfying: %@", @"photo" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PEPhotoKitMediaDestination.m", 140, @"Invalid parameter not satisfying: %@", @"saveRequest" object file lineNumber description];

LABEL_3:
  uint64_t v12 = [v10 identifier];
  int v13 = [NSNumber numberWithInt:v12];
  id v14 = [(PEPhotoKitMediaDestination *)self _pendingRequestsByRequestIdentifier];
  v15 = [v14 objectForKey:v13];
  if (v15)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"PEPhotoKitMediaDestination.m" lineNumber:149 description:@"Cannot begin a new request if there is a pending one for this photo"];

    id v18 = 0;
  }
  else
  {
    [v14 setObject:v10 forKey:v13];
    v16 = [(PEPhotoKitMediaDestination *)self delegate];
    [v16 mediaDestination:self willBeginSaveRequest:v10];

    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __79__PEPhotoKitMediaDestination__saveEditsForPhoto_saveRequest_completionHandler___block_invoke;
    v23[3] = &unk_2642BE3B0;
    objc_copyWeak(&v27, &location);
    id v17 = v10;
    id v24 = v17;
    v25 = self;
    id v26 = v11;
    [v17 beginSaveOperationWithCompletionHandler:v23];
    id v18 = v17;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __79__PEPhotoKitMediaDestination__saveEditsForPhoto_saveRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"NO";
    if (a2) {
      v7 = @"YES";
    }
    int v11 = 138543362;
    uint64_t v12 = v7;
    _os_log_impl(&dword_217B65000, v6, OS_LOG_TYPE_DEFAULT, "PEPhotoKitMediaDestination saved edits successfully: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _requestDidFinish:*(void *)(a1 + 32)];

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
  id v10 = [*(id *)(a1 + 40) delegate];
  [v10 mediaDestination:*(void *)(a1 + 40) didCompleteSaveRequest:*(void *)(a1 + 32)];
}

- (double)progressForRequestWithIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(PEPhotoKitMediaDestination *)self _pendingRequestsByRequestIdentifier];
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
  v4 = [(PEPhotoKitMediaDestination *)self _pendingRequestsByRequestIdentifier];
  id v5 = [NSNumber numberWithInt:v3];
  uint64_t v6 = [v4 objectForKey:v5];

  LOBYTE(v5) = [v6 supportsProgress];
  return (char)v5;
}

- (void)cancelRequestWithIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = [(PEPhotoKitMediaDestination *)self _pendingRequestsByRequestIdentifier];
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
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PEPhotoKitMediaDestination.m", 97, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PEPhotoKitMediaDestination.m" lineNumber:98 description:@"PEPhotoKitMediaDestination can only support PHAsset!"];
  }
  uint64_t v9 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v9, OS_LOG_TYPE_DEFAULT, "PEPhotoKitMediaDestination revert edits...", buf, 2u);
  }

  id v10 = v7;
  int v11 = [[PESaveRequest alloc] initWithPhotoToRevertToOriginal:v10 applyVideoOrientationAsMetadata:[(PEPhotoKitMediaDestination *)self applyVideoOrientationAsMetadata]];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__PEPhotoKitMediaDestination_revertEditsForAsset_completionHandler___block_invoke;
  v18[3] = &unk_2642BE388;
  id v19 = v10;
  id v20 = v8;
  v18[4] = self;
  id v12 = v10;
  id v13 = v8;
  id v14 = [(PEPhotoKitMediaDestination *)self _saveEditsForPhoto:v12 saveRequest:v11 completionHandler:v18];

  LODWORD(v11) = [v14 identifier];
  return (int)v11;
}

uint64_t __68__PEPhotoKitMediaDestination_revertEditsForAsset_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    id v12 = v5;
    if (a2)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = [*(id *)(a1 + 40) localIdentifier];
      uint64_t v9 = [*(id *)(a1 + 40) photoLibrary];
      id v10 = [v7 _fetchUpdatedAssetWithLocalIdentifier:v8 photoLibrary:v9];

      uint64_t v6 = *(void *)(a1 + 48);
    }
    else
    {
      id v10 = 0;
    }
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v10, v12);
  }
  return MEMORY[0x270F9A758]();
}

- (int)saveInternalEditsForAsset:(id)a3 usingCompositionController:(id)a4 contentEditingOutput:(id)a5 version:(int64_t)a6 livePhotoState:(unsigned __int16)a7 completionHandler:(id)a8
{
  uint64_t v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (!v15)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PEPhotoKitMediaDestination.m", 67, @"Invalid parameter not satisfying: %@", @"compositionController" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"PEPhotoKitMediaDestination.m" lineNumber:68 description:@"PEPhotoKitMediaDestination can only support PHAsset!"];
  }
  id v18 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v18, OS_LOG_TYPE_DEFAULT, "PEPhotoKitMediaDestination save edits for asset...", buf, 2u);
  }

  id v19 = v14;
  id v20 = [[PESaveRequest alloc] initWithPhoto:v19 compositionController:v15 contentEditingOutput:v16 livePhotoState:v9 applyVideoOrientationAsMetadata:[(PEPhotoKitMediaDestination *)self applyVideoOrientationAsMetadata]];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __145__PEPhotoKitMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke;
  v27[3] = &unk_2642BE388;
  v29 = self;
  id v30 = v17;
  id v28 = v19;
  id v21 = v19;
  id v22 = v17;
  v23 = [(PEPhotoKitMediaDestination *)self _saveEditsForPhoto:v21 saveRequest:v20 completionHandler:v27];

  LODWORD(v19) = [v23 identifier];
  return (int)v19;
}

void __145__PEPhotoKitMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  if (*(void *)(a1 + 48))
  {
    uint64_t v6 = [*(id *)(a1 + 32) localIdentifier];
    if (a2)
    {
      id v7 = *(void **)(a1 + 40);
      id v8 = [*(id *)(a1 + 32) photoLibrary];
      uint64_t v9 = [v7 _fetchUpdatedAssetWithLocalIdentifier:v6 photoLibrary:v8];

      if (v5 | v9)
      {
LABEL_6:
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __145__PEPhotoKitMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke_2;
        block[3] = &unk_2642BF6B0;
        id v18 = *(id *)(a1 + 48);
        id v16 = (id)v9;
        uint64_t v5 = (uint64_t)(id)v5;
        id v17 = (id)v5;
        id v14 = (id)v9;
        dispatch_async(MEMORY[0x263EF83A0], block);

        goto LABEL_7;
      }
      id v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F15108];
      uint64_t v19 = *MEMORY[0x263F08320];
      id v12 = [NSString stringWithFormat:@"PEPhotoKitMediaDestination saveInternalEditsForAsset: Missing asset with local identifier: %@", v6];
      v20[0] = v12;
      id v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      uint64_t v5 = objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", v11, 3303, v13);
    }
    uint64_t v9 = 0;
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __145__PEPhotoKitMediaDestination_saveInternalEditsForAsset_usingCompositionController_contentEditingOutput_version_livePhotoState_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)saveEditsForAsset:(id)a3 usingContentEditingOutput:(id)a4 livePhotoState:(unsigned __int16)a5 completionHandler:(id)a6
{
  uint64_t v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v12)
  {
    id v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PEPhotoKitMediaDestination.m", 40, @"Invalid parameter not satisfying: %@", @"contentEditingOutput" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"PEPhotoKitMediaDestination.m" lineNumber:41 description:@"PEPhotoKitMediaDestination can only support PHAsset!"];
  }
  id v14 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217B65000, v14, OS_LOG_TYPE_DEFAULT, "PEPhotoKitMediaDestination save edits by using content editing output...", buf, 2u);
  }

  id v15 = v11;
  id v16 = [[PESaveRequest alloc] initWithPhoto:v15 contentEditingOutput:v12 livePhotoState:v7 applyVideoOrientationAsMetadata:[(PEPhotoKitMediaDestination *)self applyVideoOrientationAsMetadata]];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __107__PEPhotoKitMediaDestination_saveEditsForAsset_usingContentEditingOutput_livePhotoState_completionHandler___block_invoke;
  v23[3] = &unk_2642BE388;
  v25 = self;
  id v26 = v13;
  id v24 = v15;
  id v17 = v15;
  id v18 = v13;
  uint64_t v19 = [(PEPhotoKitMediaDestination *)self _saveEditsForPhoto:v17 saveRequest:v16 completionHandler:v23];

  LODWORD(v16) = [v19 identifier];
  return (int)v16;
}

void __107__PEPhotoKitMediaDestination_saveEditsForAsset_usingContentEditingOutput_livePhotoState_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  if (*(void *)(a1 + 48))
  {
    uint64_t v6 = [*(id *)(a1 + 32) localIdentifier];
    if (a2)
    {
      uint64_t v7 = *(void **)(a1 + 40);
      id v8 = [*(id *)(a1 + 32) photoLibrary];
      uint64_t v9 = [v7 _fetchUpdatedAssetWithLocalIdentifier:v6 photoLibrary:v8];

      if (v5 | v9)
      {
LABEL_6:
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        goto LABEL_7;
      }
      id v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F15108];
      id v12 = [NSString stringWithFormat:@"PEPhotoKitMediaDestination saveEditsForAsset: Missing asset with local identifier: %@", v6, *MEMORY[0x263F08320]];
      v15[0] = v12;
      id v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      uint64_t v5 = objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", v11, 3303, v13);
    }
    uint64_t v9 = 0;
    goto LABEL_6;
  }
LABEL_7:
}

- (PEPhotoKitMediaDestination)init
{
  v6.receiver = self;
  v6.super_class = (Class)PEPhotoKitMediaDestination;
  v2 = [(PEPhotoKitMediaDestination *)&v6 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingRequestsByRequestIdentifier = v2->_pendingRequestsByRequestIdentifier;
    v2->_pendingRequestsByRequestIdentifier = v3;
  }
  return v2;
}

@end