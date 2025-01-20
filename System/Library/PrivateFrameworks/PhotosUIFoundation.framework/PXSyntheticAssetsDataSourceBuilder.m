@interface PXSyntheticAssetsDataSourceBuilder
- (NSArray)assetCollections;
- (NSArray)assetsBySection;
- (PXSyntheticAssetsDataSourceBuilder)init;
- (void)appendDisplayAssetSectionWithCount:(int64_t)a3 assetCollection:(id)a4 assetBlock:(id)a5;
- (void)appendDisplayAssetsWithCount:(int64_t)a3 assetBlock:(id)a4;
@end

@implementation PXSyntheticAssetsDataSourceBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAssetCollections, 0);

  objc_storeStrong((id *)&self->_mutableAssetsBySection, 0);
}

- (void)appendDisplayAssetsWithCount:(int64_t)a3 assetBlock:(id)a4
{
  v15 = (void (**)(id, uint64_t, uint64_t))a4;
  if (a3 <= 0)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSourceBuilder.m", 49, @"Invalid parameter not satisfying: %@", @"count > 0" object file lineNumber description];
  }
  v7 = [(NSMutableArray *)self->_mutableAssetsBySection lastObject];
  if (!v7)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSourceBuilder.m" lineNumber:51 description:@"Append may not be called before there are any sections"];
  }
  uint64_t v8 = [(NSMutableArray *)self->_mutableAssetsBySection count];
  uint64_t v9 = [v7 count];
  if (a3 >= 1)
  {
    uint64_t v10 = v9;
    uint64_t v11 = v8 - 1;
    do
    {
      v12 = v15[2](v15, v11, v10);
      [v7 addObject:v12];

      ++v10;
      --a3;
    }
    while (a3);
  }
}

- (void)appendDisplayAssetSectionWithCount:(int64_t)a3 assetCollection:(id)a4 assetBlock:(id)a5
{
  id v18 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(void, void, void))v9;
  if (a3 && !v9)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSourceBuilder.m", 36, @"Invalid parameter not satisfying: %@", @"assetBlock != nil || count == 0" object file lineNumber description];
  }
  uint64_t v11 = [(NSMutableArray *)self->_mutableAssetsBySection count];
  v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
  if (a3 >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      v14 = v10[2](v10, v11, v13);
      [v12 addObject:v14];

      ++v13;
    }
    while (a3 != v13);
  }
  [(NSMutableArray *)self->_mutableAssetsBySection addObject:v12];
  mutableAssetCollections = self->_mutableAssetCollections;
  v16 = (void *)[v18 copyWithZone:0];
  [(NSMutableArray *)mutableAssetCollections addObject:v16];
}

- (NSArray)assetCollections
{
  v2 = (void *)[(NSMutableArray *)self->_mutableAssetCollections copy];

  return (NSArray *)v2;
}

- (NSArray)assetsBySection
{
  v2 = (void *)[(NSMutableArray *)self->_mutableAssetsBySection copy];

  return (NSArray *)v2;
}

- (PXSyntheticAssetsDataSourceBuilder)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXSyntheticAssetsDataSourceBuilder;
  v2 = [(PXSyntheticAssetsDataSourceBuilder *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableAssetsBySection = v2->_mutableAssetsBySection;
    v2->_mutableAssetsBySection = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableAssetCollections = v2->_mutableAssetCollections;
    v2->_mutableAssetCollections = v5;
  }
  return v2;
}

@end