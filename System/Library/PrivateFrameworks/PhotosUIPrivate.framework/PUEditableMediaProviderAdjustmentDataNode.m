@interface PUEditableMediaProviderAdjustmentDataNode
- (PHAdjustmentData)adjustmentData;
- (PUEditableAsset)asset;
- (PUEditableMediaProvider)mediaProvider;
- (PUEditableMediaProviderAdjustmentDataNode)initWithAsset:(id)a3 mediaProvider:(id)a4;
- (void)_handleDidLoadAdjustmentData:(id)a3 error:(id)a4;
- (void)didCancel;
- (void)run;
@end

@implementation PUEditableMediaProviderAdjustmentDataNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (PUEditableMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PHAdjustmentData)adjustmentData
{
  return self->_adjustmentData;
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (void)_handleDidLoadAdjustmentData:(id)a3 error:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v6 = (PHAdjustmentData *)a3;
  id v7 = a4;
  if (!v6)
  {
    v8 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Error fetching adjustment data: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  adjustmentData = self->_adjustmentData;
  self->_adjustmentData = v6;

  [(PXRunNode *)self completeWithError:v7];
}

- (void)run
{
  adjustmentData = self->_adjustmentData;
  self->_adjustmentData = 0;

  id v4 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v4 setVersion:16];
  v5 = [(PUEditableMediaProviderAdjustmentDataNode *)self asset];
  v6 = [(PUEditableMediaProviderAdjustmentDataNode *)self mediaProvider];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PUEditableMediaProviderAdjustmentDataNode_run__block_invoke;
  v7[3] = &unk_1E5F25248;
  objc_copyWeak(&v8, &location);
  self->_requestID = objc_msgSend(v6, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v5, 0, v4, v7, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__PUEditableMediaProviderAdjustmentDataNode_run__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4F39360];
  id v5 = a3;
  id v8 = [v5 objectForKeyedSubscript:v4];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidLoadAdjustmentData:v8 error:v6];
}

- (void)didCancel
{
  id v3 = [(PUEditableMediaProviderAdjustmentDataNode *)self mediaProvider];
  [v3 cancelImageRequest:self->_requestID];
}

- (PUEditableMediaProviderAdjustmentDataNode)initWithAsset:(id)a3 mediaProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUEditableMediaProviderAdjustmentDataNode;
  v9 = [(PXRunNode *)&v12 initWithDependencies:0];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
  }

  return v10;
}

@end