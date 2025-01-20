@interface PUEditDateTimeActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
@end

@implementation PUEditDateTimeActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    return 0;
  }
  v4 = [(PXActivity *)self itemSourceController];
  v5 = [v4 assets];
  v6 = [v5 array];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "canPerformEditOperation:", 3, (void)v14))
        {
          BOOL v12 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (id)activityViewController
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXActivity *)self itemSourceController];
  v4 = [v3 assets];
  v5 = [v4 array];

  v6 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v5 title:0];
  id v7 = (void *)MEMORY[0x1E4F390A0];
  uint64_t v8 = [v5 objectAtIndexedSubscript:0];
  uint64_t v9 = [v7 fetchOptionsWithPhotoLibrary:0 orObject:v8];

  v15[0] = *MEMORY[0x1E4F394E8];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v9 setFetchPropertySets:v10];

  v11 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v6 options:v9];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__PUEditDateTimeActivity_activityViewController__block_invoke;
  v14[3] = &unk_1E5F2CEE8;
  v14[4] = self;
  BOOL v12 = [MEMORY[0x1E4F90520] dateTimeViewControllerWithAssets:v11 completion:v14];

  return v12;
}

uint64_t __48__PUEditDateTimeActivity_activityViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) activityDidFinish:a2];
}

- (id)_systemImageName
{
  return @"calendar.badge.clock";
}

- (id)activityTitle
{
  return PULocalizedString(@"SHARING_EDIT_DATE_TIME_TITLE");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F909D8];
}

@end