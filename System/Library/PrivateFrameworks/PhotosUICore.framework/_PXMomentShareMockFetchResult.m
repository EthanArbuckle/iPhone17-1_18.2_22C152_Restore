@interface _PXMomentShareMockFetchResult
+ (id)momentShareMockFetchResultWithPhotosCount:(unint64_t)a3 videosCount:(unint64_t)a4;
- (BOOL)containsObject:(id)a3;
- (PXDisplayAsset)firstObject;
- (PXDisplayAsset)lastObject;
- (_PXMomentShareMockFetchResult)initWithAssets:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (int64_t)count;
- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3;
@end

@implementation _PXMomentShareMockFetchResult

- (void).cxx_destruct
{
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  return 0;
}

- (int64_t)count
{
  return [(NSArray *)self->_assets count];
}

- (PXDisplayAsset)lastObject
{
  if ([(_PXMomentShareMockFetchResult *)self count] < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(_PXMomentShareMockFetchResult *)self objectAtIndex:[(_PXMomentShareMockFetchResult *)self count] - 1];
  }
  return (PXDisplayAsset *)v3;
}

- (PXDisplayAsset)firstObject
{
  if ([(_PXMomentShareMockFetchResult *)self count] < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(_PXMomentShareMockFetchResult *)self objectAtIndex:0];
  }
  return (PXDisplayAsset *)v3;
}

- (id)objectsAtIndexes:(id)a3
{
  return [(NSArray *)self->_assets objectsAtIndexes:a3];
}

- (BOOL)containsObject:(id)a3
{
  return [(NSArray *)self->_assets containsObject:a3];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_assets objectAtIndex:a3];
}

- (_PXMomentShareMockFetchResult)initWithAssets:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXMomentShareMockFetchResult;
  v6 = [(_PXMomentShareMockFetchResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assets, a3);
  }

  return v7;
}

+ (id)momentShareMockFetchResultWithPhotosCount:(unint64_t)a3 videosCount:(unint64_t)a4
{
  for (id i = objc_alloc_init(MEMORY[0x1E4F1CA48]); a3; --a3)
  {
    v7 = objc_alloc_init(_PXMomentShareMockDisplayAsset);
    [(_PXMomentShareMockDisplayAsset *)v7 setMediaType:1];
    [i addObject:v7];
  }
  for (; a4; --a4)
  {
    v8 = objc_alloc_init(_PXMomentShareMockDisplayAsset);
    [(_PXMomentShareMockDisplayAsset *)v8 setMediaType:2];
    [i addObject:v8];
  }
  objc_super v9 = [[_PXMomentShareMockFetchResult alloc] initWithAssets:i];

  return v9;
}

@end