@interface PUDuplicateActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PUDuplicateActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (void)performActivity
{
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v4 = [(PXActivity *)self itemSourceController];
  int v5 = [v4 isPreparingIndividualItems];

  if (!v5) {
    return 0;
  }
  v6 = (void *)MEMORY[0x1E4F90128];
  v7 = [(PXActivity *)self itemSourceController];
  v8 = [v7 assets];
  LOBYTE(v6) = [v6 canPerformOnAllAssets:v8];

  return (char)v6;
}

- (id)_systemImageName
{
  return @"plus.square.on.square";
}

- (id)activityTitle
{
  return PULocalizedString(@"DUPLICATE_ASSET_ACTIVITY");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F909D0];
}

@end