@interface _PXArrayDisplayAssetFetchResult
- (BOOL)containsObject:(id)a3;
- (PXDisplayAsset)firstObject;
- (PXDisplayAsset)lastObject;
- (_PXArrayDisplayAssetFetchResult)init;
- (_PXArrayDisplayAssetFetchResult)initWithAssets:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (id)thumbnailAssetAtIndex:(unint64_t)a3;
- (int64_t)count;
- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)indexOfObject:(id)a3;
@end

@implementation _PXArrayDisplayAssetFetchResult

- (void).cxx_destruct
{
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_assets objectAtIndexedSubscript:a3];
}

- (int64_t)count
{
  return [(NSArray *)self->_assets count];
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  assets = self->_assets;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62___PXArrayDisplayAssetFetchResult_countOfAssetsWithMediaType___block_invoke;
  v7[3] = &__block_descriptor_40_e33_B32__0___PXDisplayAsset__8Q16_B24l;
  v7[4] = a3;
  v4 = [(NSArray *)assets indexesOfObjectsPassingTest:v7];
  unint64_t v5 = [v4 count];

  return v5;
}

- (BOOL)containsObject:(id)a3
{
  return [(NSArray *)self->_assets containsObject:a3];
}

- (PXDisplayAsset)lastObject
{
  return (PXDisplayAsset *)[(NSArray *)self->_assets lastObject];
}

- (PXDisplayAsset)firstObject
{
  return (PXDisplayAsset *)[(NSArray *)self->_assets firstObject];
}

- (unint64_t)indexOfObject:(id)a3
{
  return [(NSArray *)self->_assets indexOfObject:a3];
}

- (id)objectsAtIndexes:(id)a3
{
  return [(NSArray *)self->_assets objectsAtIndexes:a3];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_assets objectAtIndex:a3];
}

- (_PXArrayDisplayAssetFetchResult)initWithAssets:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXArrayDisplayAssetFetchResult;
  unint64_t v5 = [(_PXArrayDisplayAssetFetchResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assets = v5->_assets;
    v5->_assets = (NSArray *)v6;
  }
  return v5;
}

- (_PXArrayDisplayAssetFetchResult)init
{
  return [(_PXArrayDisplayAssetFetchResult *)self initWithAssets:MEMORY[0x263EFFA68]];
}

@end