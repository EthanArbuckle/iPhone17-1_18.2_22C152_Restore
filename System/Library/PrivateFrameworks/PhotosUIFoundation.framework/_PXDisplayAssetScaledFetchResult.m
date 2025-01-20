@interface _PXDisplayAssetScaledFetchResult
- (BOOL)containsObject:(id)a3;
- (NSString)description;
- (PXDisplayAsset)firstObject;
- (PXDisplayAsset)lastObject;
- (_PXDisplayAssetScaledFetchResult)initWithFetchResult:(id)a3 multiplier:(int64_t)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (id)thumbnailAssetAtIndex:(unint64_t)a3;
- (int64_t)count;
- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)indexOfObject:(id)a3;
@end

@implementation _PXDisplayAssetScaledFetchResult

- (void).cxx_destruct
{
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  return (id)[(PXDisplayAssetFetchResult *)self->_fetchResult thumbnailAssetAtIndex:a3 / self->_multipler];
}

- (int64_t)count
{
  return self->_multipler * [(PXDisplayAssetFetchResult *)self->_fetchResult count];
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  return self->_multipler
       * [(PXDisplayAssetFetchResult *)self->_fetchResult cachedCountOfAssetsWithMediaType:a3];
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  return self->_multipler
       * [(PXDisplayAssetFetchResult *)self->_fetchResult countOfAssetsWithMediaType:a3];
}

- (BOOL)containsObject:(id)a3
{
  return [(PXDisplayAssetFetchResult *)self->_fetchResult containsObject:a3];
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t v4 = [(PXDisplayAssetFetchResult *)self->_fetchResult indexOfObject:a3];
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    return self->_multipler * v4;
  }
  return result;
}

- (PXDisplayAsset)lastObject
{
  return (PXDisplayAsset *)[(PXDisplayAssetFetchResult *)self->_fetchResult lastObject];
}

- (PXDisplayAsset)firstObject
{
  return (PXDisplayAsset *)[(PXDisplayAssetFetchResult *)self->_fetchResult firstObject];
}

- (id)objectsAtIndexes:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  v6 = objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __53___PXDisplayAssetScaledFetchResult_objectsAtIndexes___block_invoke;
  v13 = &unk_26545BA70;
  id v14 = v6;
  v15 = self;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v10];

  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[(PXDisplayAssetFetchResult *)self->_fetchResult objectAtIndex:a3 / self->_multipler];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p: multiple%ld fetchResult = %@>", v5, self, self->_multipler, self->_fetchResult];

  return (NSString *)v6;
}

- (_PXDisplayAssetScaledFetchResult)initWithFetchResult:(id)a3 multiplier:(int64_t)a4
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_PXDisplayAssetScaledFetchResult;
  v9 = [(_PXDisplayAssetScaledFetchResult *)&v12 init];
  if (v9)
  {
    if (a4 <= 0)
    {
      uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"PXDisplayAssetFetchResult.m", 276, @"Invalid parameter not satisfying: %@", @"multiplier >= 1" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_fetchResult, a3);
    v9->_multipler = a4;
  }

  return v9;
}

@end