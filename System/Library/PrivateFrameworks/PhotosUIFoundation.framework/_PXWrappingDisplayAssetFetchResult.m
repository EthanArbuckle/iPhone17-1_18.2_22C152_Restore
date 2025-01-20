@interface _PXWrappingDisplayAssetFetchResult
- (BOOL)containsObject:(id)a3;
- (NSString)description;
- (PXDisplayAsset)firstObject;
- (PXDisplayAsset)lastObject;
- (_PXWrappingDisplayAssetFetchResult)initWithFetchResult:(id)a3 range:(_NSRange)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (id)thumbnailAssetAtIndex:(unint64_t)a3;
- (int64_t)count;
- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)indexOfObject:(id)a3;
@end

@implementation _PXWrappingDisplayAssetFetchResult

- (int64_t)count
{
  return self->_range.length;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[(PXDisplayAssetFetchResult *)self->_displayFetchResult objectAtIndex:self->_range.location + a3];
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  return (id)[(PXDisplayAssetFetchResult *)self->_displayFetchResult thumbnailAssetAtIndex:self->_range.location + a3];
}

- (void).cxx_destruct
{
}

- (_PXWrappingDisplayAssetFetchResult)initWithFetchResult:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_PXWrappingDisplayAssetFetchResult;
  v10 = [(_PXWrappingDisplayAssetFetchResult *)&v14 init];
  if (v10)
  {
    if (location >= [v9 count])
    {
      v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, v10, @"PXDisplayAssetFetchResult.m", 29, @"Invalid parameter not satisfying: %@", @"range.location < fetchResult.count" object file lineNumber description];
    }
    if (location + length > [v9 count])
    {
      v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2, v10, @"PXDisplayAssetFetchResult.m", 30, @"Invalid parameter not satisfying: %@", @"NSMaxRange(range) <= fetchResult.count" object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_displayFetchResult, a3);
    v10->_range.NSUInteger location = location;
    v10->_range.NSUInteger length = length;
  }

  return v10;
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  return [(PXDisplayAssetFetchResult *)self->_displayFetchResult cachedCountOfAssetsWithMediaType:a3];
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  return [(PXDisplayAssetFetchResult *)self->_displayFetchResult countOfAssetsWithMediaType:a3];
}

- (BOOL)containsObject:(id)a3
{
  return [(PXDisplayAssetFetchResult *)self->_displayFetchResult containsObject:a3];
}

- (unint64_t)indexOfObject:(id)a3
{
  unint64_t v4 = [(PXDisplayAssetFetchResult *)self->_displayFetchResult indexOfObject:a3];
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger location = self->_range.location;
    if (v4 >= location && v4 < self->_range.length + location) {
      return v4 - location;
    }
  }
  return result;
}

- (PXDisplayAsset)lastObject
{
  NSUInteger length = self->_range.length;
  if (length)
  {
    v3 = [(PXDisplayAssetFetchResult *)self->_displayFetchResult objectAtIndex:length + self->_range.location - 1];
  }
  else
  {
    v3 = 0;
  }

  return (PXDisplayAsset *)v3;
}

- (PXDisplayAsset)firstObject
{
  if (self->_range.length)
  {
    v2 = [(PXDisplayAssetFetchResult *)self->_displayFetchResult objectAtIndex:self->_range.location];
  }
  else
  {
    v2 = 0;
  }

  return (PXDisplayAsset *)v2;
}

- (id)objectsAtIndexes:(id)a3
{
  unint64_t v4 = (void *)[a3 mutableCopy];
  [v4 shiftIndexesStartingAtIndex:0 by:self->_range.location];
  v5 = [(PXDisplayAssetFetchResult *)self->_displayFetchResult objectsAtIndexes:v4];

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromRange(self->_range);
  v7 = [(PXDisplayAssetFetchResult *)self->_displayFetchResult description];
  v8 = [v3 stringWithFormat:@"<%@: %p: range = %@ fetchResult = %@>", v5, self, v6, v7];;

  return (NSString *)v8;
}

@end