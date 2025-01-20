@interface PXDisplayAssetFetchResultEnumerator
- (PXDisplayAssetFetchResultEnumerator)init;
- (PXDisplayAssetFetchResultEnumerator)initWithDisplayAssetFetchResult:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstObject;
- (id)nextObject;
- (unint64_t)count;
- (void)reset;
@end

@implementation PXDisplayAssetFetchResultEnumerator

- (void).cxx_destruct
{
}

- (id)firstObject
{
  return (id)[(PXDisplayAssetFetchResult *)self->_fetchResult firstObject];
}

- (id)nextObject
{
  unint64_t currentIndex = self->_currentIndex;
  if (currentIndex >= [(PXDisplayAssetFetchResultEnumerator *)self count])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(PXDisplayAssetFetchResult *)self->_fetchResult objectAtIndex:self->_currentIndex];
    ++self->_currentIndex;
  }

  return v4;
}

- (unint64_t)count
{
  return [(PXDisplayAssetFetchResult *)self->_fetchResult count];
}

- (void)reset
{
  self->_unint64_t currentIndex = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PXDisplayAssetFetchResultEnumerator alloc];
  fetchResult = self->_fetchResult;

  return [(PXDisplayAssetFetchResultEnumerator *)v4 initWithDisplayAssetFetchResult:fetchResult];
}

- (PXDisplayAssetFetchResultEnumerator)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDisplayAssetFetchResultEnumerator.m", 28, @"%s is not available as initializer", "-[PXDisplayAssetFetchResultEnumerator init]");

  abort();
}

- (PXDisplayAssetFetchResultEnumerator)initWithDisplayAssetFetchResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDisplayAssetFetchResultEnumerator;
  v6 = [(PXDisplayAssetFetchResultEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fetchResult, a3);
  }

  return v7;
}

@end