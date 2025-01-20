@interface PXStoryReusableDisplayAsset
- (BOOL)respondsToSelector:(SEL)a3;
- (PXStoryResourcesDataSource)resourcesDataSource;
- (id)displayAsset;
- (id)forwardingTargetForSelector:(SEL)a3;
- (int64_t)resourceIndex;
- (void)configureWithDisplayResourceIndex:(int64_t)a3 resourcesDataSource:(id)a4;
@end

@implementation PXStoryReusableDisplayAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
}

- (int64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (id)displayAsset
{
  return self->_displayAsset;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryReusableDisplayAsset;
  if (-[PXStoryReusableDisplayAsset respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_displayAsset;
}

- (void)configureWithDisplayResourceIndex:(int64_t)a3 resourcesDataSource:(id)a4
{
  objc_storeStrong((id *)&self->_resourcesDataSource, a4);
  id v7 = a4;
  self->_resourceIndex = a3;
  id v10 = [(PXStoryResourcesDataSource *)self->_resourcesDataSource displayAssetResourceAtIndex:a3];
  objc_msgSend(v10, "px_storyResourceDisplayAsset");
  v8 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
  displayAsset = self->_displayAsset;
  self->_displayAsset = v8;
}

@end