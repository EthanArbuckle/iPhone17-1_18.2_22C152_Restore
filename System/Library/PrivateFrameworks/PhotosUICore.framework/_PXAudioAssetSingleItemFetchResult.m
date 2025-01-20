@interface _PXAudioAssetSingleItemFetchResult
- (BOOL)containsObject:(id)a3;
- (PXAudioAsset)firstObject;
- (PXAudioAsset)lastObject;
- (_PXAudioAssetSingleItemFetchResult)init;
- (_PXAudioAssetSingleItemFetchResult)initWithAsset:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (int64_t)count;
- (void)enumerateObjectsUsingBlock:(id)a3;
@end

@implementation _PXAudioAssetSingleItemFetchResult

- (void).cxx_destruct
{
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  asset = self->_asset;
  if (asset)
  {
    char v4 = 0;
    (*((void (**)(id, PXAudioAsset *, void, char *))a3 + 2))(a3, asset, 0, &v4);
  }
}

- (BOOL)containsObject:(id)a3
{
  asset = self->_asset;
  if (asset == a3) {
    return 1;
  }
  else {
    return [a3 isEqual:asset];
  }
}

- (id)objectsAtIndexes:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count] != 1
    || ![v5 containsIndex:0]
    || (asset = self->_asset) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXAudioAssetFetchResult.m", 229, @"Invalid parameter not satisfying: %@", @"indexes.count == 1 && [indexes containsIndex:0] && _asset != nil" object file lineNumber description];

    asset = self->_asset;
  }
  v10[0] = asset;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v7;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (a3 || (asset = self->_asset) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXAudioAssetFetchResult.m", 220, @"Invalid parameter not satisfying: %@", @"index == 0 && _asset != nil" object file lineNumber description];

    asset = self->_asset;
  }
  return asset;
}

- (PXAudioAsset)lastObject
{
  return self->_asset;
}

- (PXAudioAsset)firstObject
{
  return self->_asset;
}

- (int64_t)count
{
  return self->_asset != 0;
}

- (_PXAudioAssetSingleItemFetchResult)init
{
  return [(_PXAudioAssetSingleItemFetchResult *)self initWithAsset:0];
}

- (_PXAudioAssetSingleItemFetchResult)initWithAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXAudioAssetSingleItemFetchResult;
  v6 = [(_PXAudioAssetSingleItemFetchResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_asset, a3);
  }

  return v7;
}

@end