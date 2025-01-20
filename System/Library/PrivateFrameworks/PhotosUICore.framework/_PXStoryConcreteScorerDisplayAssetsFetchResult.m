@interface _PXStoryConcreteScorerDisplayAssetsFetchResult
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
- (void)addResourceWithIndex:(int64_t)a3;
- (void)dealloc;
- (void)removeAllResources;
- (void)setCount:(int64_t)a3;
- (void)setResourcesDataSource:(id)a3;
@end

@implementation _PXStoryConcreteScorerDisplayAssetsFetchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setResourcesDataSource:(id)a3
{
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteTimelineScorer.m", 475, @"%s not implemented yet", "-[_PXStoryConcreteScorerDisplayAssetsFetchResult thumbnailAssetAtIndex:]");

  abort();
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteTimelineScorer.m", 471, @"%s not implemented yet", "-[_PXStoryConcreteScorerDisplayAssetsFetchResult cachedCountOfAssetsWithMediaType:]");

  abort();
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteTimelineScorer.m", 467, @"%s not implemented yet", "-[_PXStoryConcreteScorerDisplayAssetsFetchResult countOfAssetsWithMediaType:]");

  abort();
}

- (BOOL)containsObject:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteTimelineScorer.m", 463, @"%s not implemented yet", "-[_PXStoryConcreteScorerDisplayAssetsFetchResult containsObject:]");

  abort();
}

- (PXDisplayAsset)lastObject
{
  uint64_t v3 = [(_PXStoryConcreteScorerDisplayAssetsFetchResult *)self count];
  if (v3 < 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(_PXStoryConcreteScorerDisplayAssetsFetchResult *)self objectAtIndexedSubscript:v3 - 1];
  }
  return (PXDisplayAsset *)v4;
}

- (PXDisplayAsset)firstObject
{
  if ([(_PXStoryConcreteScorerDisplayAssetsFetchResult *)self count] < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(_PXStoryConcreteScorerDisplayAssetsFetchResult *)self objectAtIndexedSubscript:0];
  }
  return (PXDisplayAsset *)v3;
}

- (id)objectsAtIndexes:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteTimelineScorer.m", 450, @"%s not implemented yet", "-[_PXStoryConcreteScorerDisplayAssetsFetchResult objectsAtIndexes:]");

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

- (void)addResourceWithIndex:(int64_t)a3
{
  int64_t v5 = [(_PXStoryConcreteScorerDisplayAssetsFetchResult *)self count];
  [(_PXStoryConcreteScorerDisplayAssetsFetchResult *)self setCount:[(_PXStoryConcreteScorerDisplayAssetsFetchResult *)self count] + 1];
  self->_resourceIndexes[v5] = a3;
}

- (void)removeAllResources
{
}

- (void)dealloc
{
  free(self->_resourceIndexes);
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryConcreteScorerDisplayAssetsFetchResult;
  [(_PXStoryConcreteScorerDisplayAssetsFetchResult *)&v3 dealloc];
}

@end