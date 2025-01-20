@interface PXAssetEditOperationPerformer
- (NSProgress)progress;
- (NSString)editOperationType;
- (PXAssetEditOperationPerformer)init;
- (PXAssetEditOperationPerformer)initWithEditOperationType:(id)a3 asset:(id)a4;
- (PXDisplayAsset)asset;
@end

@implementation PXAssetEditOperationPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_editOperationType, 0);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (NSString)editOperationType
{
  return self->_editOperationType;
}

- (PXAssetEditOperationPerformer)initWithEditOperationType:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXAssetEditOperationPerformer;
  v8 = [(PXAssetEditOperationPerformer *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    editOperationType = v8->_editOperationType;
    v8->_editOperationType = (NSString *)v9;

    objc_storeStrong((id *)&v8->_asset, a4);
    uint64_t v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v11;
  }
  return v8;
}

- (PXAssetEditOperationPerformer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetEditOperationManager.m", 362, @"%s is not available as initializer", "-[PXAssetEditOperationPerformer init]");

  abort();
}

@end