@interface _PXStoryPrecomposedDisplayAssetsFetchResult
- (BOOL)containsObject:(id)a3;
- (PXDisplayAsset)firstObject;
- (PXDisplayAsset)lastObject;
- (PXStoryResourcesDataSource)resourcesDataSource;
- (const)resourceIndexes;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (id)storyDisplayAssetAtIndex:(int64_t)a3;
- (id)thumbnailAssetAtIndex:(unint64_t)a3;
- (int64_t)count;
- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3;
- (void)configureWithRange:(_NSRange)a3 resourcesDataSource:(id)a4;
- (void)dealloc;
- (void)setCount:(int64_t)a3;
@end

@implementation _PXStoryPrecomposedDisplayAssetsFetchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (int64_t)count
{
  return self->_count;
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPrecomposedTimelineProducer.m", 336, @"%s not implemented yet", "-[_PXStoryPrecomposedDisplayAssetsFetchResult thumbnailAssetAtIndex:]");

  abort();
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPrecomposedTimelineProducer.m", 332, @"%s not implemented yet", "-[_PXStoryPrecomposedDisplayAssetsFetchResult cachedCountOfAssetsWithMediaType:]");

  abort();
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPrecomposedTimelineProducer.m", 328, @"%s not implemented yet", "-[_PXStoryPrecomposedDisplayAssetsFetchResult countOfAssetsWithMediaType:]");

  abort();
}

- (BOOL)containsObject:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPrecomposedTimelineProducer.m", 324, @"%s not implemented yet", "-[_PXStoryPrecomposedDisplayAssetsFetchResult containsObject:]");

  abort();
}

- (PXDisplayAsset)lastObject
{
  uint64_t v3 = [(_PXStoryPrecomposedDisplayAssetsFetchResult *)self count];
  if (v3 < 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(_PXStoryPrecomposedDisplayAssetsFetchResult *)self objectAtIndexedSubscript:v3 - 1];
  }
  return (PXDisplayAsset *)v4;
}

- (PXDisplayAsset)firstObject
{
  if ([(_PXStoryPrecomposedDisplayAssetsFetchResult *)self count] < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(_PXStoryPrecomposedDisplayAssetsFetchResult *)self objectAtIndexedSubscript:0];
  }
  return (PXDisplayAsset *)v3;
}

- (id)objectsAtIndexes:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPrecomposedTimelineProducer.m", 311, @"%s not implemented yet", "-[_PXStoryPrecomposedDisplayAssetsFetchResult objectsAtIndexes:]");

  abort();
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(PXStoryResourcesDataSource *)self->_resourcesDataSource displayAssetResourceAtIndex:self->_resourceIndexes[a3]];
  v4 = objc_msgSend(v3, "px_storyResourceDisplayAsset");

  return v4;
}

- (const)resourceIndexes
{
  return self->_resourceIndexes;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
  _PXGArrayCapacityResizeToCount();
}

- (id)storyDisplayAssetAtIndex:(int64_t)a3
{
  asset = self->_asset;
  if (!asset)
  {
    v6 = objc_alloc_init(PXStoryReusableDisplayAsset);
    v7 = self->_asset;
    self->_asset = v6;

    asset = self->_asset;
  }
  [(PXStoryReusableDisplayAsset *)asset configureWithDisplayResourceIndex:self->_resourceIndexes[a3] resourcesDataSource:self->_resourcesDataSource];
  v8 = self->_asset;
  return v8;
}

- (void)configureWithRange:(_NSRange)a3 resourcesDataSource:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v7 = (PXStoryResourcesDataSource *)a4;
  [(_PXStoryPrecomposedDisplayAssetsFetchResult *)self setCount:length];
  if (length)
  {
    resourceIndexes = self->_resourceIndexes;
    do
    {
      *resourceIndexes++ = location++;
      --length;
    }
    while (length);
  }
  resourcesDataSource = self->_resourcesDataSource;
  self->_resourcesDataSource = v7;
}

- (void)dealloc
{
  free(self->_resourceIndexes);
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryPrecomposedDisplayAssetsFetchResult;
  [(_PXStoryPrecomposedDisplayAssetsFetchResult *)&v3 dealloc];
}

@end