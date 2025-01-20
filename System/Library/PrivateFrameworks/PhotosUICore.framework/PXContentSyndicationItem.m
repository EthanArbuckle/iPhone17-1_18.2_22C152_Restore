@interface PXContentSyndicationItem
- (BOOL)isEqual:(id)a3;
- (PXAssetCollectionActionManager)assetCollectionActionManager;
- (PXContentSyndicationItem)initWithAssetCollection:(id)a3;
- (PXDisplayAssetCollection)assetCollection;
@end

@implementation PXContentSyndicationItem

- (void).cxx_destruct
{
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  v2 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:self->_assetCollection displayTitleInfo:0];
  return (PXAssetCollectionActionManager *)v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXContentSyndicationItem *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PXContentSyndicationItem *)self assetCollection];
      v7 = [(PXContentSyndicationItem *)v5 assetCollection];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (PXContentSyndicationItem)initWithAssetCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXContentSyndicationItem;
  v6 = [(PXContentSyndicationItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetCollection, a3);
  }

  return v7;
}

@end