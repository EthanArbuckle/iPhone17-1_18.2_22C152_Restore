@interface PXStoryDemoActivity
+ (int64_t)activityCategory;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)assets;
@end

@implementation PXStoryDemoActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [PXStoryConfiguration alloc];
  [(PXActivity *)self itemSourceController];
  [(id)objc_claimAutoreleasedReturnValue() assets];
  [(id)objc_claimAutoreleasedReturnValue() array];
  objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromArray();
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v4 = +[PXRootSettings sharedInstance];
  int v5 = [v4 canShowInternalUI];

  if (!v5) {
    return 0;
  }
  v6 = [(PXActivity *)self itemSourceController];
  id v7 = [v6 assets];
  BOOL v8 = [v7 count] != 0;

  return v8;
}

- (id)assets
{
  v2 = [(PXActivity *)self itemSourceController];
  v3 = (void *)MEMORY[0x1E4F1C978];
  v4 = [v2 assets];
  int v5 = [v4 array];
  v6 = [v3 arrayWithArray:v5];

  return v6;
}

- (id)_systemImageName
{
  return @"play.rectangle.fill";
}

- (id)activityTitle
{
  return @"(Internal) Interactive Memory Demo";
}

- (id)activityType
{
  v2 = @"PXActivityTypeInternalStoryDemo";
  return @"PXActivityTypeInternalStoryDemo";
}

@end