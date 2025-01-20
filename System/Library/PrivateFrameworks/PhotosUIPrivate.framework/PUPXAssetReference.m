@interface PUPXAssetReference
- (PUPXAssetReference)initWithAsset:(id)a3 assetCollection:(id)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6;
- (PUPXAssetReference)initWithPXAssetReference:(id)a3 dataSourceIdentifier:(id)a4;
- (PXAssetReference)underlyingAssetReference;
@end

@implementation PUPXAssetReference

- (void).cxx_destruct
{
}

- (PXAssetReference)underlyingAssetReference
{
  return self->_underlyingAssetReference;
}

- (PUPXAssetReference)initWithPXAssetReference:(id)a3 dataSourceIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7) {
    [v7 indexPath];
  }
  else {
    memset(&v14[1], 0, 32);
  }
  v9 = PXIndexPathFromSimpleIndexPath();
  v10 = [v7 asset];
  v11 = [v7 assetCollection];
  v14[0].receiver = self;
  v14[0].super_class = (Class)PUPXAssetReference;
  v12 = [(objc_super *)v14 initWithAsset:v10 assetCollection:v11 indexPath:v9 dataSourceIdentifier:v8];

  if (v12) {
    objc_storeStrong((id *)&v12->_underlyingAssetReference, a3);
  }

  return v12;
}

- (PUPXAssetReference)initWithAsset:(id)a3 assetCollection:(id)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPXAssetReference.m", 15, @"%s is not available as initializer", "-[PUPXAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:]");

  abort();
}

@end