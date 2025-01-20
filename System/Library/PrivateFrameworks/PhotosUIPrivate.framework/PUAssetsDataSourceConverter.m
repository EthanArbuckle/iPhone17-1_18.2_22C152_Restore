@interface PUAssetsDataSourceConverter
+ (PUTilingDataSourceConverter)defaultConverter;
- (BOOL)convertIndexPath:(id *)a3 tileKind:(id *)a4 fromDataSource:(id)a5 toDataSource:(id)a6;
- (BOOL)shouldReloadTileControllerFromAsset:(id)a3 toAsset:(id)a4 tileKind:(id)a5;
@end

@implementation PUAssetsDataSourceConverter

- (BOOL)shouldReloadTileControllerFromAsset:(id)a3 toAsset:(id)a4 tileKind:(id)a5
{
  return 0;
}

- (BOOL)convertIndexPath:(id *)a3 tileKind:(id *)a4 fromDataSource:(id)a5 toDataSource:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PUAssetsDataSourceConverter;
  if ([(PUTilingDataSourceConverter *)&v21 convertIndexPath:a3 tileKind:a4 fromDataSource:v10 toDataSource:v11])
  {
    char v12 = 1;
  }
  else
  {
    id v13 = *a3;
    id v14 = *a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()) {
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v15 = [v11 convertIndexPath:v13 fromAssetsDataSource:v10];
      if (v15)
      {
        id v16 = [v10 assetAtIndexPath:v13];
        v17 = [v11 assetAtIndexPath:v15];
        BOOL v18 = [(PUAssetsDataSourceConverter *)self shouldReloadTileControllerFromAsset:v16 toAsset:v17 tileKind:v14];
        if (v18)
        {
        }
        else
        {
          id v20 = v14;

          *a3 = v15;
          id v16 = v20;
          *a4 = v16;
        }
        char v12 = !v18;
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
      v15 = 0;
    }
  }
  return v12;
}

+ (PUTilingDataSourceConverter)defaultConverter
{
  if (defaultConverter_onceToken != -1) {
    dispatch_once(&defaultConverter_onceToken, &__block_literal_global_12748);
  }
  v2 = (void *)defaultConverter_defaultConverter;
  return (PUTilingDataSourceConverter *)v2;
}

void __47__PUAssetsDataSourceConverter_defaultConverter__block_invoke()
{
  v0 = objc_alloc_init(PUAssetsDataSourceConverter);
  v1 = (void *)defaultConverter_defaultConverter;
  defaultConverter_defaultConverter = (uint64_t)v0;
}

@end