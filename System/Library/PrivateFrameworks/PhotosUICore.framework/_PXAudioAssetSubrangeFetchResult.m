@interface _PXAudioAssetSubrangeFetchResult
- (BOOL)containsObject:(id)a3;
- (NSString)description;
- (PXAudioAsset)firstObject;
- (PXAudioAsset)lastObject;
- (_PXAudioAssetSubrangeFetchResult)init;
- (_PXAudioAssetSubrangeFetchResult)initWithFetchResult:(id)a3 subrange:(_NSRange)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (int64_t)count;
- (void)enumerateObjectsUsingBlock:(id)a3;
@end

@implementation _PXAudioAssetSubrangeFetchResult

- (void).cxx_destruct
{
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, unint64_t, unsigned char *))a3;
  unsigned __int8 v8 = 0;
  if ([(_PXAudioAssetSubrangeFetchResult *)self count])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [(_PXAudioAssetSubrangeFetchResult *)self objectAtIndex:v5];
      v4[2](v4, v6, v5, &v8);
      int v7 = v8;

      if (v7) {
        break;
      }
      ++v5;
    }
    while (v5 < [(_PXAudioAssetSubrangeFetchResult *)self count]);
  }
}

- (PXAudioAsset)lastObject
{
  return (PXAudioAsset *)[(PXAudioAssetFetchResult *)self->_fetchResult objectAtIndexedSubscript:self->_subrange.length + self->_subrange.location];
}

- (PXAudioAsset)firstObject
{
  return (PXAudioAsset *)[(PXAudioAssetFetchResult *)self->_fetchResult objectAtIndexedSubscript:self->_subrange.location];
}

- (BOOL)containsObject:(id)a3
{
  return [(PXAudioAssetFetchResult *)self->_fetchResult containsObject:a3];
}

- (id)objectsAtIndexes:(id)a3
{
  id v5 = a3;
  v6 = (void *)[v5 mutableCopy];
  [v6 shiftIndexesStartingAtIndex:0 by:self->_subrange.location];
  unint64_t v7 = [v6 lastIndex];
  NSUInteger location = self->_subrange.location;
  BOOL v10 = v7 >= location;
  NSUInteger v9 = v7 - location;
  BOOL v10 = !v10 || v9 >= self->_subrange.length;
  if (v10)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXAudioAssetFetchResult.m", 162, @"Indexes %@ out of bounds in %@", v5, self object file lineNumber description];
  }
  v11 = [(PXAudioAssetFetchResult *)self->_fetchResult objectsAtIndexes:v6];

  return v11;
}

- (id)objectAtIndex:(unint64_t)a3
{
  NSUInteger location = self->_subrange.location;
  NSUInteger v5 = location + a3;
  if (location > location + a3 || self->_subrange.length <= a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXAudioAssetFetchResult.m", 151, @"Index %lu out of bounds in %@", a3, self object file lineNumber description];
  }
  fetchResult = self->_fetchResult;
  return (id)[(PXAudioAssetFetchResult *)fetchResult objectAtIndexedSubscript:v5];
}

- (int64_t)count
{
  return self->_subrange.length;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  fetchResult = self->_fetchResult;
  v6 = NSStringFromRange(self->_subrange);
  unint64_t v7 = objc_msgSend(v3, "initWithFormat:", @"<%@; %p; fetch result: %@; subrange: %@>",
                 v4,
                 self,
                 fetchResult,
                 v6);

  return (NSString *)v7;
}

- (_PXAudioAssetSubrangeFetchResult)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAudioAssetFetchResult.m", 136, @"%s is not available as initializer", "-[_PXAudioAssetSubrangeFetchResult init]");

  abort();
}

- (_PXAudioAssetSubrangeFetchResult)initWithFetchResult:(id)a3 subrange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PXAudioAssetSubrangeFetchResult;
  BOOL v10 = [(_PXAudioAssetSubrangeFetchResult *)&v13 init];
  if (v10)
  {
    if ([v9 count] < location + length)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:v10 file:@"PXAudioAssetFetchResult.m" lineNumber:128 description:@"subrange must be within the count of the given fetch result."];
    }
    objc_storeStrong((id *)&v10->_fetchResult, a3);
    v10->_subrange.NSUInteger location = location;
    v10->_subrange.NSUInteger length = length;
  }

  return v10;
}

@end