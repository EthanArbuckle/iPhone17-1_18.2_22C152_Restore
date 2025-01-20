@interface PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation
- (NSMutableDictionary)replacementAssetsByUUID;
- (PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation)initWithReplacementAssetsByUUID:(id)a3;
- (void)removeReplacementAssetInDataSourceForUUID:(id)a3;
- (void)replaceAssetInDataSourceWithAsset:(id)a3;
@end

@implementation PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation

- (void).cxx_destruct
{
}

- (NSMutableDictionary)replacementAssetsByUUID
{
  return self->_replacementAssetsByUUID;
}

- (void)removeReplacementAssetInDataSourceForUUID:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_replacementAssetsByUUID, "removeObjectForKey:");
  }
}

- (void)replaceAssetInDataSourceWithAsset:(id)a3
{
  id v5 = a3;
  v4 = [v5 uuid];
  if (v4) {
    [(NSMutableDictionary *)self->_replacementAssetsByUUID setObject:v5 forKeyedSubscript:v4];
  }
}

- (PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation)initWithReplacementAssetsByUUID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation;
  id v5 = [(PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
    replacementAssetsByUUID = v5->_replacementAssetsByUUID;
    v5->_replacementAssetsByUUID = (NSMutableDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

@end