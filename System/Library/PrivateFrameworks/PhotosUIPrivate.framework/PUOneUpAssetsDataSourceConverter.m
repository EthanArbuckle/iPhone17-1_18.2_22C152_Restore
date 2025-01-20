@interface PUOneUpAssetsDataSourceConverter
+ (id)defaultConverter;
- (BOOL)shouldReloadTileControllerFromAsset:(id)a3 toAsset:(id)a4 tileKind:(id)a5;
@end

@implementation PUOneUpAssetsDataSourceConverter

- (BOOL)shouldReloadTileControllerFromAsset:(id)a3 toAsset:(id)a4 tileKind:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5 == @"PUTileKindItemContent")
  {
    if ([v7 canPlayPhotoIris]) {
      int v10 = 1;
    }
    else {
      int v10 = [v7 isPhotoIrisPlaceholder];
    }
    if ([v8 canPlayPhotoIris]) {
      int v11 = 1;
    }
    else {
      int v11 = [v8 isPhotoIrisPlaceholder];
    }
    int v12 = [v7 canPlayLoopingVideo];
    int v13 = v12 ^ [v8 canPlayLoopingVideo];
    if (v10 == v11) {
      BOOL v9 = v13;
    }
    else {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)defaultConverter
{
  if (defaultConverter_onceToken_45386 != -1) {
    dispatch_once(&defaultConverter_onceToken_45386, &__block_literal_global_45387);
  }
  v2 = (void *)defaultConverter_defaultConverter_45388;
  return v2;
}

void __52__PUOneUpAssetsDataSourceConverter_defaultConverter__block_invoke()
{
  v0 = objc_alloc_init(PUOneUpAssetsDataSourceConverter);
  v1 = (void *)defaultConverter_defaultConverter_45388;
  defaultConverter_defaultConverter_45388 = (uint64_t)v0;
}

@end