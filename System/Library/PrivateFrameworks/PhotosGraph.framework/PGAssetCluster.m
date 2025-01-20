@interface PGAssetCluster
- (CLCircularRegion)region;
- (NSArray)assets;
- (PGAssetCluster)initWithAssets:(id)a3 region:(id)a4;
@end

@implementation PGAssetCluster

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (NSArray)assets
{
  return self->_assets;
}

- (PGAssetCluster)initWithAssets:(id)a3 region:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGAssetCluster;
  v9 = [(PGAssetCluster *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assets, a3);
    objc_storeStrong((id *)&v10->_region, a4);
  }

  return v10;
}

@end