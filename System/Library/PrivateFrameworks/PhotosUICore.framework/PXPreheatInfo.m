@interface PXPreheatInfo
- (BOOL)finished;
- (NSMutableIndexSet)preheatedIndexes;
- (PXDisplayAssetFetchResult)fetchResult;
- (PXPreheatInfo)initWithFetchResult:(id)a3 origin:(int64_t)a4;
- (int64_t)cachedBytes;
- (int64_t)preheatOrigin;
- (void)markAsFinished;
- (void)setCachedBytes:(int64_t)a3;
@end

@implementation PXPreheatInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_preheatedIndexes, 0);
}

- (void)setCachedBytes:(int64_t)a3
{
  self->_cachedBytes = a3;
}

- (int64_t)cachedBytes
{
  return self->_cachedBytes;
}

- (int64_t)preheatOrigin
{
  return self->_preheatOrigin;
}

- (PXDisplayAssetFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (NSMutableIndexSet)preheatedIndexes
{
  return self->_preheatedIndexes;
}

- (BOOL)finished
{
  unint64_t v3 = [(NSMutableIndexSet *)self->_preheatedIndexes count];
  return v3 >= [(PXDisplayAssetFetchResult *)self->_fetchResult count];
}

- (void)markAsFinished
{
  preheatedIndexes = self->_preheatedIndexes;
  self->_preheatedIndexes = 0;

  fetchResult = self->_fetchResult;
  self->_fetchResult = 0;
}

- (PXPreheatInfo)initWithFetchResult:(id)a3 origin:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPreheatInfo;
  v8 = [(PXPreheatInfo *)&v12 init];
  if (v8)
  {
    v9 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    preheatedIndexes = v8->_preheatedIndexes;
    v8->_preheatedIndexes = v9;

    objc_storeStrong((id *)&v8->_fetchResult, a3);
    v8->_preheatOrigin = a4;
  }

  return v8;
}

@end