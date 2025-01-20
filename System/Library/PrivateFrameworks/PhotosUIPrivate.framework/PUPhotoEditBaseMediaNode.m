@interface PUPhotoEditBaseMediaNode
- (AVAsset)videoAsset;
- (NSData)imageData;
- (PUEditableMediaProviderAdjustmentDataNode)adjustmentNode;
- (PUPhotoEditBaseMediaNode)initWithAdjustmentNode:(id)a3;
- (void)run;
- (void)runNode:(id)a3 didCompleteWithError:(id)a4;
@end

@implementation PUPhotoEditBaseMediaNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentNode, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_gatheringNode, 0);
  objc_storeStrong((id *)&self->_videoAssetNode, 0);
  objc_storeStrong((id *)&self->_imageDataNode, 0);
}

- (PUEditableMediaProviderAdjustmentDataNode)adjustmentNode
{
  return self->_adjustmentNode;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)runNode:(id)a3 didCompleteWithError:(id)a4
{
  v11 = (PUEditableMediaProviderVideoAssetNode *)a3;
  id v6 = a4;
  p_super = &v11->super;
  if ((PUEditableMediaProviderVideoAssetNode *)self->_imageDataNode == v11)
  {
    v8 = [(PUEditableMediaProviderVideoAssetNode *)v11 imageData];
    uint64_t v9 = 72;
  }
  else
  {
    if (self->_videoAssetNode != v11) {
      goto LABEL_6;
    }
    v8 = [(PUEditableMediaProviderVideoAssetNode *)v11 videoAsset];
    uint64_t v9 = 80;
  }
  v10 = *(Class *)((char *)&self->super.super.isa + v9);
  *(Class *)((char *)&self->super.super.isa + v9) = v8;

  p_super = &v11->super;
LABEL_6:
  if (self->_gatheringNode == p_super) {
    [(PXRunNode *)self completeWithError:v6];
  }
}

- (void)run
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PUPhotoEditBaseMediaNode *)self adjustmentNode];
  v4 = [v3 adjustmentData];
  v5 = [v3 asset];
  id v6 = [v3 mediaProvider];
  if ([v4 baseVersion])
  {
    v7 = [[PUEditableMediaProviderImageDataNode alloc] initWithAsset:v5 mediaProvider:v6 version:8];
    imageDataNode = self->_imageDataNode;
    self->_imageDataNode = v7;

    if ([v5 isLivePhoto])
    {
      uint64_t v9 = [[PUEditableMediaProviderVideoAssetNode alloc] initWithAsset:v5 mediaProvider:v6 version:8];
      videoAssetNode = self->_videoAssetNode;
      self->_videoAssetNode = v9;

      id v11 = objc_alloc(MEMORY[0x1E4F90628]);
      v12 = self->_videoAssetNode;
      v16[0] = self->_imageDataNode;
      v16[1] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      v14 = (PXRunNode *)[v11 initWithDependencies:v13];
      gatheringNode = self->_gatheringNode;
      self->_gatheringNode = v14;
    }
    else
    {
      objc_storeStrong((id *)&self->_gatheringNode, self->_imageDataNode);
    }
    [(PXRunNode *)self->_imageDataNode setDelegate:self];
    [(PXRunNode *)self->_videoAssetNode setDelegate:self];
    [(PXRunNode *)self->_gatheringNode setDelegate:self];
    [MEMORY[0x1E4F90628] processGraphForRunNode:self->_gatheringNode];
  }
  else
  {
    [(PXRunNode *)self complete];
  }
}

- (PUPhotoEditBaseMediaNode)initWithAdjustmentNode:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditBaseMediaNode;
  v7 = [(PXRunNode *)&v9 initWithDependencies:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_adjustmentNode, a3);
  }

  return v7;
}

@end