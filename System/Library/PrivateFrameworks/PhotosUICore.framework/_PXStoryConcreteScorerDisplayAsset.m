@interface _PXStoryConcreteScorerDisplayAsset
- (id)displayAsset;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)resourcesDataSource;
- (int64_t)resourceIndex;
- (void)setResourceIndex:(int64_t)a3 resourcesDataSource:(id)a4;
@end

@implementation _PXStoryConcreteScorerDisplayAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
}

- (id)displayAsset
{
  return self->_displayAsset;
}

- (int64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (id)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_displayAsset;
}

- (void)setResourceIndex:(int64_t)a3 resourcesDataSource:(id)a4
{
  self->_resourceIndex = a3;
  objc_storeStrong((id *)&self->_resourcesDataSource, a4);
  id v6 = a4;
  id v9 = [v6 displayAssetResourceAtIndex:self->_resourceIndex];
  objc_msgSend(v9, "px_storyResourceDisplayAsset");
  v7 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
  displayAsset = self->_displayAsset;
  self->_displayAsset = v7;
}

@end