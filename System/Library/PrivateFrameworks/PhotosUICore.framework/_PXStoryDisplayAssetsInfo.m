@interface _PXStoryDisplayAssetsInfo
- (_PXStoryDisplayAssetsInfo)init;
- (const)assetContentInfos;
- (const)nUpPlaybackStyles;
- (const)oneUpPlaybackStyles;
- (const)originalPlaybackStyles;
- (id)displayAssetsWithCount:(int64_t)a3;
- (int64_t)count;
- (void)configureWithRange:(_NSRange)a3 resourcesDataSource:(id)a4 timelineStyle:(id)a5 nUpPlaybackStyleMapping:(const int64_t *)a6;
- (void)dealloc;
@end

@implementation _PXStoryDisplayAssetsInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineStyle, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
}

- (const)assetContentInfos
{
  return self->_assetContentInfos;
}

- (int64_t)count
{
  return self->_count;
}

- (const)nUpPlaybackStyles
{
  return self->_nUpPlaybackStyles;
}

- (const)oneUpPlaybackStyles
{
  p_oneUpPlaybackStyle = &self->_oneUpPlaybackStyle;
  if (!self->_oneUpPlaybackStyle && self->_count >= 1)
  {
    v4 = [(_PXStoryDisplayAssetsFetchResult *)self->_displayAssets storyDisplayAssetAtIndex:0];
    self->_oneUpPlaybackStyle = [(PXStoryTimelineStyle *)self->_timelineStyle finalOneUpPlaybackStyleForDisplayAsset:v4 originalPlaybackStyle:*self->_originalPlaybackStyles];
  }
  return p_oneUpPlaybackStyle;
}

- (const)originalPlaybackStyles
{
  return self->_originalPlaybackStyles;
}

- (id)displayAssetsWithCount:(int64_t)a3
{
  [(_PXStoryDisplayAssetsFetchResult *)self->_displayAssets setCount:a3];
  displayAssets = self->_displayAssets;
  return displayAssets;
}

- (void)configureWithRange:(_NSRange)a3 resourcesDataSource:(id)a4 timelineStyle:(id)a5 nUpPlaybackStyleMapping:(const int64_t *)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a5;
  -[_PXStoryDisplayAssetsFetchResult configureWithRange:resourcesDataSource:](self->_displayAssets, "configureWithRange:resourcesDataSource:", location, length, a4);
  objc_storeStrong((id *)&self->_timelineStyle, a5);
  self->_count = [(_PXStoryDisplayAssetsFetchResult *)self->_displayAssets configuredCount];
  *(void *)&long long v12 = self->_capacity;
  _PXGArrayCapacityResizeToCount();
}

- (void)dealloc
{
  free(self->_originalPlaybackStyles);
  free(self->_nUpPlaybackStyles);
  free(self->_assetContentInfos);
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryDisplayAssetsInfo;
  [(_PXStoryDisplayAssetsInfo *)&v3 dealloc];
}

- (_PXStoryDisplayAssetsInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PXStoryDisplayAssetsInfo;
  v2 = [(_PXStoryDisplayAssetsInfo *)&v6 init];
  if (v2)
  {
    objc_super v3 = objc_alloc_init(_PXStoryDisplayAssetsFetchResult);
    displayAssets = v2->_displayAssets;
    v2->_displayAssets = v3;
  }
  return v2;
}

@end