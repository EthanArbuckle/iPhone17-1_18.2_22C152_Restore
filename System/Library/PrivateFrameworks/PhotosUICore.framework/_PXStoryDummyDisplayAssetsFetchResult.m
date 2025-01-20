@interface _PXStoryDummyDisplayAssetsFetchResult
- (BOOL)containsObject:(id)a3;
- (PXDisplayAsset)firstObject;
- (PXDisplayAsset)lastObject;
- (PXStoryResourcesDataSource)resourcesDataSource;
- (_PXStoryDummyDisplayAssetsFetchResult)initWithResourcesDataSource:(id)a3;
- (const)resourceIndexes;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (id)storyDisplayAssetAtIndex:(int64_t)a3;
- (id)thumbnailAssetAtIndex:(unint64_t)a3;
- (int64_t)count;
- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3;
- (void)configureWithRange:(_NSRange)a3;
- (void)dealloc;
- (void)setCount:(int64_t)a3;
@end

@implementation _PXStoryDummyDisplayAssetsFetchResult

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
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDummyTimelineProducer.m", 198, @"%s not implemented yet", "-[_PXStoryDummyDisplayAssetsFetchResult thumbnailAssetAtIndex:]");

  abort();
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDummyTimelineProducer.m", 194, @"%s not implemented yet", "-[_PXStoryDummyDisplayAssetsFetchResult cachedCountOfAssetsWithMediaType:]");

  abort();
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDummyTimelineProducer.m", 190, @"%s not implemented yet", "-[_PXStoryDummyDisplayAssetsFetchResult countOfAssetsWithMediaType:]");

  abort();
}

- (BOOL)containsObject:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDummyTimelineProducer.m", 186, @"%s not implemented yet", "-[_PXStoryDummyDisplayAssetsFetchResult containsObject:]");

  abort();
}

- (PXDisplayAsset)lastObject
{
  uint64_t v3 = [(_PXStoryDummyDisplayAssetsFetchResult *)self count];
  if (v3 < 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(_PXStoryDummyDisplayAssetsFetchResult *)self objectAtIndexedSubscript:v3 - 1];
  }
  return (PXDisplayAsset *)v4;
}

- (PXDisplayAsset)firstObject
{
  if ([(_PXStoryDummyDisplayAssetsFetchResult *)self count] < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(_PXStoryDummyDisplayAssetsFetchResult *)self objectAtIndexedSubscript:0];
  }
  return (PXDisplayAsset *)v3;
}

- (id)objectsAtIndexes:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDummyTimelineProducer.m", 173, @"%s not implemented yet", "-[_PXStoryDummyDisplayAssetsFetchResult objectsAtIndexes:]");

  abort();
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(PXStoryResourcesDataSource *)self->_resourcesDataSource displayAssetResourceAtIndex:self->_resourceIndexes[a3]];
  v4 = objc_msgSend(v3, "px_storyResourceDisplayAsset");

  return v4;
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

- (const)resourceIndexes
{
  return self->_resourceIndexes;
}

- (void)setCount:(int64_t)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    _PXGArrayCapacityResizeToCount();
  }
}

- (void)configureWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(_PXStoryDummyDisplayAssetsFetchResult *)self setCount:a3.length];
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
}

- (void)dealloc
{
  free(self->_resourceIndexes);
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryDummyDisplayAssetsFetchResult;
  [(_PXStoryDummyDisplayAssetsFetchResult *)&v3 dealloc];
}

- (_PXStoryDummyDisplayAssetsFetchResult)initWithResourcesDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryDummyDisplayAssetsFetchResult;
  v6 = [(_PXStoryDummyDisplayAssetsFetchResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resourcesDataSource, a3);
  }

  return v7;
}

@end