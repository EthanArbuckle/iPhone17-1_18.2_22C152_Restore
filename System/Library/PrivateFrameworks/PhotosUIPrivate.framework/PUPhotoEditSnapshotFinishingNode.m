@interface PUPhotoEditSnapshotFinishingNode
- (PUEditableMediaProviderAdjustmentDataNode)adjustmentNode;
- (PUEditableMediaProviderImageDataNode)currentImageNode;
- (PUEditableMediaProviderVideoAssetNode)currentVideoNode;
- (PUPhotoEditBaseMediaNode)baseMediaNode;
- (PUPhotoEditSnapshotFinishingNode)initWithAdjustmentNode:(id)a3 baseMediaNode:(id)a4 currentImageNode:(id)a5 currentVideoNode:(id)a6 completionHandler:(id)a7;
- (id)completionHandler;
- (void)run;
@end

@implementation PUPhotoEditSnapshotFinishingNode

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_currentVideoNode, 0);
  objc_storeStrong((id *)&self->_currentImageNode, 0);
  objc_storeStrong((id *)&self->_baseMediaNode, 0);
  objc_storeStrong((id *)&self->_adjustmentNode, 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (PUEditableMediaProviderVideoAssetNode)currentVideoNode
{
  return self->_currentVideoNode;
}

- (PUEditableMediaProviderImageDataNode)currentImageNode
{
  return self->_currentImageNode;
}

- (PUPhotoEditBaseMediaNode)baseMediaNode
{
  return self->_baseMediaNode;
}

- (PUEditableMediaProviderAdjustmentDataNode)adjustmentNode
{
  return self->_adjustmentNode;
}

- (void)run
{
  v4 = objc_alloc_init(PUPhotoEditSnapshot);
  v5 = [(PUPhotoEditSnapshotFinishingNode *)self baseMediaNode];
  v6 = [v5 imageData];

  v7 = [(PUPhotoEditSnapshotFinishingNode *)self currentImageNode];
  v8 = [v7 imageData];

  v9 = [(PUPhotoEditSnapshotFinishingNode *)self currentImageNode];
  v10 = [v9 imageDataUTI];

  v11 = [(PUPhotoEditSnapshotFinishingNode *)self adjustmentNode];
  v12 = [v11 adjustmentData];

  uint64_t v13 = [v12 baseVersion];
  v14 = [(PUPhotoEditSnapshotFinishingNode *)self currentVideoNode];

  if (v14)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__PUPhotoEditSnapshotFinishingNode_run__block_invoke;
    aBlock[3] = &unk_1E5F28CA8;
    aBlock[4] = self;
    aBlock[5] = a2;
    v15 = (void (**)(void *, void *))_Block_copy(aBlock);
    v16 = [(PUPhotoEditSnapshotFinishingNode *)self currentVideoNode];
    [v16 videoAsset];
    v17 = v10;
    v19 = v18 = v6;
    v27 = v8;
    v15[2](v15, v19);
    v20 = uint64_t v26 = v13;

    v21 = [(PUPhotoEditSnapshotFinishingNode *)self baseMediaNode];
    v22 = [v21 videoAsset];
    v23 = v15[2](v15, v22);

    v6 = v18;
    v10 = v17;

    [(PUPhotoEditSnapshot *)v4 _setVideoComplement:v20];
    [(PUPhotoEditSnapshot *)v4 _setBaseVideoComplement:v23];

    v8 = v27;
    uint64_t v13 = v26;
  }
  if (v13) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = 1;
  }
  -[PUPhotoEditSnapshot _setImageData:](v4, "_setImageData:", v8, v26);
  [(PUPhotoEditSnapshot *)v4 _setImageUTI:v10];
  [(PUPhotoEditSnapshot *)v4 _setBaseImageData:v6];
  [(PUPhotoEditSnapshot *)v4 _setAdjustmentData:v12];
  [(PUPhotoEditSnapshot *)v4 _setWorkImageVersion:v24];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PUPhotoEditSnapshotFinishingNode_run__block_invoke_2;
  block[3] = &unk_1E5F2ECC8;
  block[4] = self;
  v29 = v4;
  v25 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

id __39__PUPhotoEditSnapshotFinishingNode_run__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"PUPhotoEditSnapshot.m", 265, @"No video URL for video asset: %@", v3 object file lineNumber description];
    }
    id v4 = v3;
  }

  return v3;
}

uint64_t __39__PUPhotoEditSnapshotFinishingNode_run__block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  id v4 = *(void **)(a1 + 32);
  return [v4 complete];
}

- (PUPhotoEditSnapshotFinishingNode)initWithAdjustmentNode:(id)a3 baseMediaNode:(id)a4 currentImageNode:(id)a5 currentVideoNode:(id)a6 completionHandler:(id)a7
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v22 = a6;
  id v16 = a7;
  v24[0] = v13;
  v24[1] = v14;
  v24[2] = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  v23.receiver = self;
  v23.super_class = (Class)PUPhotoEditSnapshotFinishingNode;
  v18 = [(PXRunNode *)&v23 initWithDependencies:v17];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_adjustmentNode, a3);
    objc_storeStrong((id *)&v18->_baseMediaNode, a4);
    objc_storeStrong((id *)&v18->_currentImageNode, a5);
    objc_storeStrong((id *)&v18->_currentVideoNode, a6);
    uint64_t v19 = [v16 copy];
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = (id)v19;
  }
  return v18;
}

@end