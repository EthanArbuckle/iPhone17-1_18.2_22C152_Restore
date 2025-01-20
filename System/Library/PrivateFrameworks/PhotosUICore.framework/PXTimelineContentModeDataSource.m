@interface PXTimelineContentModeDataSource
- (NSString)name;
- (PHFetchResult)assetSources;
- (PXTimelineContentModeDataSource)initWithName:(id)a3 assetSources:(id)a4;
- (void)setAssetSources:(id)a3;
- (void)setName:(id)a3;
@end

@implementation PXTimelineContentModeDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSources, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAssetSources:(id)a3
{
}

- (PHFetchResult)assetSources
{
  return self->_assetSources;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (PXTimelineContentModeDataSource)initWithName:(id)a3 assetSources:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXTimelineContentModeDataSource;
  v9 = [(PXTimelineContentModeDataSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_assetSources, a4);
  }

  return v10;
}

@end