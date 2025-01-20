@interface NPTOSyncCollectionGroup
- (NPTOSyncContentProvider)contentProvider;
- (NSMapTable)collections;
- (PHFetchResult)assetCollections;
- (id)description;
- (void)setAssetCollections:(id)a3;
- (void)setCollections:(id)a3;
- (void)setContentProvider:(id)a3;
@end

@implementation NPTOSyncCollectionGroup

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPTOSyncCollectionGroup;
  v3 = [(NPTOSyncCollectionGroup *)&v7 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentProvider);
  v5 = [v3 stringByAppendingFormat:@" contentProvider: %@ assetCollections: %@", WeakRetained, self->_assetCollections];

  return v5;
}

- (NPTOSyncContentProvider)contentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentProvider);

  return (NPTOSyncContentProvider *)WeakRetained;
}

- (void)setContentProvider:(id)a3
{
}

- (PHFetchResult)assetCollections
{
  return self->_assetCollections;
}

- (void)setAssetCollections:(id)a3
{
}

- (NSMapTable)collections
{
  return self->_collections;
}

- (void)setCollections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);

  objc_destroyWeak((id *)&self->_contentProvider);
}

@end