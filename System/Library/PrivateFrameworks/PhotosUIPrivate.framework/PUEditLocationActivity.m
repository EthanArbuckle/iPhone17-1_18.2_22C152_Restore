@interface PUEditLocationActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)locationSearchDataSource:(id)a3 didSelectLocationSearchResult:(id)a4;
- (void)locationSearchDataSourceDidRemoveLocation:(id)a3;
@end

@implementation PUEditLocationActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (void)locationSearchDataSourceDidRemoveLocation:(id)a3
{
}

- (void)locationSearchDataSource:(id)a3 didSelectLocationSearchResult:(id)a4
{
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    v5 = [(PXActivity *)self itemSourceController];
    v6 = [v5 assets];
    v7 = [v6 array];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__PUEditLocationActivity_canPerformWithActivityItems___block_invoke;
    v10[3] = &unk_1E5F298E0;
    v10[4] = &v11;
    [v7 enumerateObjectsUsingBlock:v10];
    BOOL v8 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __54__PUEditLocationActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 canPerformEditOperation:3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

- (id)activityViewController
{
  v3 = [(PXActivity *)self itemSourceController];
  id v4 = [v3 assets];
  v5 = [v4 array];

  v6 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v5 title:0];
  v7 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__PUEditLocationActivity_activityViewController__block_invoke;
  v10[3] = &unk_1E5F2CEE8;
  v10[4] = self;
  BOOL v8 = [MEMORY[0x1E4F90530] searchViewControllerWithAssets:v7 delegate:self completion:v10];

  return v8;
}

uint64_t __48__PUEditLocationActivity_activityViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) activityDidFinish:a2];
}

- (id)_systemImageName
{
  return @"mappin.circle";
}

- (id)activityTitle
{
  return PULocalizedString(@"SHARING_EDIT_LOCATION");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F909E0];
}

@end