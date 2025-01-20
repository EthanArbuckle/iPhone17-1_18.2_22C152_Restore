@interface SearchUIShowPhotosOneUpViewHandler
+ (id)matchedPersonLocalIdentifiersForCommand:(id)a3;
+ (id)matchedSceneIdentifiersForCommand:(id)a3 andType:(int)a4;
- (BOOL)supportsCopy;
- (BOOL)useSourceViewAsPreviewForDragging;
- (id)additionalActionMenuItems;
- (id)createViewControllerForCommand:(id)a3 environment:(id)a4;
- (id)itemProvider;
- (unint64_t)destination;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUIShowPhotosOneUpViewHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v7 = a5;
  id v9 = +[SearchUIPhotosOneUpController sharedController];
  v8 = [(SearchUICommandHandler *)self rowModel];
  [v9 presentOneUpViewForRowModel:v8 triggerEvent:a4 environment:v7];
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v5 = a4;
  v6 = +[SearchUIPhotosOneUpController sharedController];
  id v7 = [(SearchUICommandHandler *)self rowModel];
  v8 = [v6 previewViewControllerForRowModel:v7 environment:v5];

  return v8;
}

- (BOOL)supportsCopy
{
  return 1;
}

- (id)additionalActionMenuItems
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = [(SearchUICommandHandler *)self command];
  v3 = [v2 _matchedPerson];
  v4 = [v3 photosIdentifier];

  if (v4)
  {
    id v5 = [v3 photosIdentifier];
    v20[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v7 = [v2 photosLibraryImage];
    v8 = +[SearchUIPhotosUtilities fetchResultForPersonIdentifiers:isSyndicated:](SearchUIPhotosUtilities, "fetchResultForPersonIdentifiers:isSyndicated:", v6, [v7 isSyndicated]);
    id v9 = [v8 firstObject];

    v10 = [MEMORY[0x1E4F90450] notThisPersonLocalizedTitleForPerson:v9];
    v11 = [MEMORY[0x1E4F90450] notThisPersonSystemImage];
    v12 = (void *)MEMORY[0x1E4FB13F0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__SearchUIShowPhotosOneUpViewHandler_additionalActionMenuItems__block_invoke;
    v16[3] = &unk_1E6E72D80;
    id v17 = v2;
    id v18 = v3;
    v13 = [v12 actionWithTitle:v10 image:v11 identifier:0 handler:v16];
    [v13 setAttributes:2];
    v19 = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

void __63__SearchUIShowPhotosOneUpViewHandler_additionalActionMenuItems__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) photosLibraryImage];
  id v3 = +[SearchUIImage imageWithSFImage:v2];

  [v3 rejectPerson:*(void *)(a1 + 40)];
}

- (id)itemProvider
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = [(SearchUICommandHandler *)self command];
  id v3 = [v2 photosLibraryImage];
  v4 = [v3 photoIdentifier];

  id v5 = +[SearchUIPhotosOneUpController sharedController];
  v14[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v5 updateWithCoreSpotlightIdentifiers:v6 currentCorespotlightIdentifier:v4];

  id v7 = [v5 activeDataSourceManager];
  v8 = [v7 dataSource];
  id v9 = [v8 photosDataSource];

  v10 = [v9 indexPathForFirstAsset];
  v11 = [v9 assetAtIndexPath:v10];

  if (v11)
  {
    v12 = PUItemProviderForAsset();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)useSourceViewAsPreviewForDragging
{
  return 1;
}

- (unint64_t)destination
{
  return 3;
}

+ (id)matchedSceneIdentifiersForCommand:(id)a3 andType:(int)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = objc_msgSend(v5, "matchedScenes", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 sceneType] == a4)
        {
          v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "sceneIdentifier"));
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v14 = (void *)[v6 copy];
  return v14;
}

+ (id)matchedPersonLocalIdentifiersForCommand:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v3 matchedPeople];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 photosIdentifier];

        if (v11)
        {
          v12 = [v10 photosIdentifier];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  v13 = (void *)[v4 copy];

  return v13;
}

@end