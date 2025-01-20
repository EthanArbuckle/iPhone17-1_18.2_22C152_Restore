@interface PXKeyAssetHackService
+ (BOOL)keyAssetHackServiceIsEnabled;
- (BOOL)canPerformAction;
- (BOOL)shouldSetKeyAssetForHighlight:(id)a3;
- (id)asset;
- (id)title;
- (void)performAction;
@end

@implementation PXKeyAssetHackService

+ (BOOL)keyAssetHackServiceIsEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PXKeyAssetHackServiceEnabled"];

  return v3;
}

- (BOOL)shouldSetKeyAssetForHighlight:(id)a3
{
  return 0;
}

- (void)performAction
{
  char v3 = [(PXKeyAssetHackService *)self asset];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 photoLibrary];
    v6 = [v5 librarySpecificFetchOptions];

    v7 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v4 withType:6 options:v6];
    v8 = [v7 firstObject];

    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v10 = v8;
      v11 = v10;
      do
      {
        [v9 addObject:v11];
        v12 = [MEMORY[0x1E4F39238] fetchParentHighlightForHighlight:v11 options:v6];
        uint64_t v13 = [v12 firstObject];

        v11 = (void *)v13;
      }
      while (v13);
      v14 = [MEMORY[0x1E4F39238] fetchParentDayGroupHighlightForHighlight:v10 options:v6];
      v15 = [v14 firstObject];

      if (v15) {
        [v9 addObject:v15];
      }
      v16 = [v4 photoLibrary];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __38__PXKeyAssetHackService_performAction__block_invoke;
      v20[3] = &unk_1E5DD0F30;
      id v21 = v9;
      v22 = self;
      id v23 = v4;
      id v19 = 0;
      id v17 = v9;
      [v16 performChangesAndWait:v20 error:&v19];
      id v18 = v19;
    }
  }
}

void __38__PXKeyAssetHackService_performAction__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "shouldSetKeyAssetForHighlight:", v7, (void)v9))
        {
          v8 = [MEMORY[0x1E4F39240] changeRequestForPhotosHighlight:v7];
          [v8 setKeyAssetPrivate:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (BOOL)canPerformAction
{
  if (![(id)objc_opt_class() keyAssetHackServiceIsEnabled]) {
    return 0;
  }
  uint64_t v3 = [(PXKeyAssetHackService *)self asset];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)asset
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(PXDiagnosticsService *)self itemProviders];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierAsset"])
        {
          v8 = [v7 itemForIdentifier:@"PXDiagnosticsItemIdentifierAsset"];
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)title
{
  return @"Set as Key Asset - Should be subclassed";
}

@end