@interface PUEditableMediaProviderVideoAssetNode
- (AVAsset)videoAsset;
- (PUEditableAsset)asset;
- (PUEditableMediaProvider)mediaProvider;
- (PUEditableMediaProviderVideoAssetNode)initWithAsset:(id)a3 mediaProvider:(id)a4 version:(int64_t)a5;
- (int64_t)version;
- (void)_handleDidLoadVideo:(id)a3 info:(id)a4;
- (void)run;
@end

@implementation PUEditableMediaProviderVideoAssetNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
}

- (PUEditableMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (int64_t)version
{
  return self->_version;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (void)_handleDidLoadVideo:(id)a3 info:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v6 = (AVAsset *)a3;
  v7 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
  if (!v6)
  {
    v8 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Error fetching video: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  videoAsset = self->_videoAsset;
  self->_videoAsset = v6;

  [(PXRunNode *)self completeWithError:v7];
}

- (void)run
{
  videoAsset = self->_videoAsset;
  self->_videoAsset = 0;

  id v4 = objc_alloc_init(MEMORY[0x1E4F39348]);
  [v4 setDeliveryMode:1];
  [v4 setVideoComplementAllowed:1];
  objc_msgSend(v4, "setVersion:", -[PUEditableMediaProviderVideoAssetNode version](self, "version"));
  v5 = [(PUEditableMediaProviderVideoAssetNode *)self asset];
  v6 = [(PUEditableMediaProviderVideoAssetNode *)self mediaProvider];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PUEditableMediaProviderVideoAssetNode_run__block_invoke;
  v7[3] = &unk_1E5F251F8;
  objc_copyWeak(&v8, &location);
  self->_requestID = [v6 requestAVAssetForVideo:v5 options:v4 resultHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __44__PUEditableMediaProviderVideoAssetNode_run__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleDidLoadVideo:v7 info:v6];
}

- (PUEditableMediaProviderVideoAssetNode)initWithAsset:(id)a3 mediaProvider:(id)a4 version:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUEditableMediaProviderVideoAssetNode;
  v11 = [(PXRunNode *)&v14 initWithDependencies:0];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    objc_storeStrong((id *)&v12->_mediaProvider, a4);
    v12->_version = a5;
  }

  return v12;
}

@end