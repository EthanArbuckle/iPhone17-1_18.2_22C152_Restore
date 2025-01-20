@interface SearchUIPhotosOneUpController
+ (id)bundleIdentifierForAsset:(id)a3;
+ (id)corespotlightIdentifierForAsset:(id)a3;
+ (id)sharedController;
- (BOOL)isSyndicated;
- (BOOL)updateWithCoreSpotlightIdentifiers:(id)a3 currentCorespotlightIdentifier:(id)a4;
- (BOOL)updateWithRowModel:(id)a3 environment:(id)a4;
- (NSDictionary)rowModelsForCorespotlightIdentifiers;
- (PXAssetReference)navigatedAssetReference;
- (PXPhotoKitAssetsDataSourceManager)activeDataSourceManager;
- (SFShowPhotosOneUpViewCommand)command;
- (SearchUICommandEnvironment)commandEnvironment;
- (UIView)hiddenView;
- (UIViewController)peekedViewController;
- (id)imageViewInView:(id)a3;
- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4;
- (id)oneUpPresentationActionManager:(id)a3;
- (id)oneUpPresentationMatchedAudioIdentifiers:(id)a3;
- (id)oneUpPresentationMatchedHumanActionIdentifiers:(id)a3;
- (id)oneUpPresentationMatchedPersonLocalIdentifiers:(id)a3;
- (id)oneUpPresentationMatchedQueryStrings:(id)a3;
- (id)oneUpPresentationMatchedSceneIdentifiers:(id)a3;
- (id)oneUpPresentationMediaProvider:(id)a3;
- (id)previewViewControllerForRowModel:(id)a3 environment:(id)a4;
- (id)rowModelForAsset:(id)a3;
- (id)rowModelForAssetReference:(id)a3;
- (id)undoManagerForActionPerformer:(id)a3;
- (id)viewForAssetReference:(id)a3;
- (int64_t)oneUpPresentationActionContext:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4;
- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4;
- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4;
- (void)presentOneUpViewForRowModel:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
- (void)setActiveDataSourceManager:(id)a3;
- (void)setCommand:(id)a3;
- (void)setCommandEnvironment:(id)a3;
- (void)setHiddenView:(id)a3;
- (void)setIsSyndicated:(BOOL)a3;
- (void)setNavigatedAssetReference:(id)a3;
- (void)setPeekedViewController:(id)a3;
- (void)setRowModelsForCorespotlightIdentifiers:(id)a3;
@end

@implementation SearchUIPhotosOneUpController

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_48);
  }
  v2 = (void *)sharedController_sharedController;
  return v2;
}

uint64_t __49__SearchUIPhotosOneUpController_sharedController__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedController_sharedController;
  sharedController_sharedController = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)corespotlightIdentifierForAsset:(id)a3
{
  id v3 = a3;
  v4 = [v3 photoLibrary];
  uint64_t v5 = [v4 wellKnownPhotoLibraryIdentifier];

  v6 = [v3 curationProperties];
  v7 = [v6 syndicationIdentifier];

  if (v5 == 3 && v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v3 uuid];
  }
  v9 = v8;

  return v9;
}

- (id)previewViewControllerForRowModel:(id)a3 environment:(id)a4
{
  id v6 = a4;
  if ([(SearchUIPhotosOneUpController *)self updateWithRowModel:a3 environment:v6])
  {
    v7 = [v6 presentingViewController];
    id v8 = objc_msgSend(v7, "px_oneUpPresentation");
    v9 = [v8 previewViewControllerAllowingActions:1];
  }
  else
  {
    v9 = 0;
  }
  [(SearchUIPhotosOneUpController *)self setPeekedViewController:v9];

  return v9;
}

- (void)presentOneUpViewForRowModel:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  v9 = v8;
  if (a4 == 6)
  {
    v10 = [v8 presentingViewController];
    v11 = objc_msgSend(v10, "px_oneUpPresentation");
    v12 = [(SearchUIPhotosOneUpController *)self peekedViewController];
    [v11 commitPreviewViewController:v12];
  }
  else
  {
    if (![(SearchUIPhotosOneUpController *)self updateWithRowModel:v13 environment:v8])goto LABEL_8; {
    v10 = [v9 feedbackDelegate];
    }
    if (objc_opt_respondsToSelector()) {
      [v10 resignTextField];
    }
    v11 = [v9 presentingViewController];
    v12 = objc_msgSend(v11, "px_oneUpPresentation");
    [v12 startWithConfigurationHandler:&__block_literal_global_230];
  }

LABEL_8:
}

uint64_t __86__SearchUIPhotosOneUpController_presentOneUpViewForRowModel_triggerEvent_environment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInteractiveMode:0];
}

- (BOOL)updateWithRowModel:(id)a3 environment:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v6 = a4;
  v29 = self;
  [(SearchUIPhotosOneUpController *)self setCommandEnvironment:v6];
  v28 = objc_opt_new();
  v26 = v6;
  v27 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v7 = [v6 lastEngagedSection];
  id v8 = [v7 rowModels];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v30 = 0;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v32 + 1) + 8 * i);
        v14 = [v13 cardSection];
        v15 = [v14 command];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v15;
          v17 = [v16 photosLibraryImage];
          v18 = [v17 photoIdentifier];

          uint64_t v19 = [v18 length];
          if (v13 == v31 && v19 != 0)
          {
            [v27 addObject:v18];
            [v28 setObject:v31 forKeyedSubscript:v18];
            id v21 = v18;

            v22 = [v16 photosLibraryImage];
            -[SearchUIPhotosOneUpController setIsSyndicated:](v29, "setIsSyndicated:", [v22 isSyndicated]);

            v30 = v21;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v10);
  }
  else
  {
    v30 = 0;
  }

  [(SearchUIPhotosOneUpController *)v29 setRowModelsForCorespotlightIdentifiers:v28];
  [(SearchUIPhotosOneUpController *)v29 setActiveDataSourceManager:0];
  [(SearchUIPhotosOneUpController *)v29 setNavigatedAssetReference:0];
  v23 = [v31 cardSection];
  v24 = [v23 command];
  [(SearchUIPhotosOneUpController *)v29 setCommand:v24];

  LOBYTE(v23) = [(SearchUIPhotosOneUpController *)v29 updateWithCoreSpotlightIdentifiers:v27 currentCorespotlightIdentifier:v30];
  return (char)v23;
}

- (BOOL)updateWithCoreSpotlightIdentifiers:(id)a3 currentCorespotlightIdentifier:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v50 = a4;
  if ([v6 count])
  {
    BOOL v7 = [(SearchUIPhotosOneUpController *)self isSyndicated];
    id v8 = +[SearchUIPhotosUtilities fetchResultForPhotoIdentifiers:v6 isSyndicated:v7];
    if (![v8 count])
    {
      BOOL v25 = 0;
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v9 = objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v8 = v8;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v57 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          v15 = [(id)objc_opt_class() corespotlightIdentifierForAsset:v14];
          [v9 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v11);
    }

    if ((unint64_t)[v8 count] < 2)
    {
      v26 = [v9 objectForKeyedSubscript:v50];

      if (!v26) {
        goto LABEL_30;
      }
      uint64_t v21 = 0;
    }
    else
    {
      BOOL v44 = v7;
      v46 = v8;
      id v16 = objc_opt_new();
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v48 = v6;
      id v17 = v6;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v53;
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v53 != v20) {
              objc_enumerationMutation(v17);
            }
            v23 = *(void **)(*((void *)&v52 + 1) + 8 * j);
            v24 = [v9 objectForKeyedSubscript:v23];
            if (v24)
            {
              if ([v23 isEqualToString:v50]) {
                uint64_t v21 = [v16 count];
              }
              [v16 addObject:v24];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v61 count:16];
        }
        while (v19);
      }
      else
      {
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      }

      v27 = +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:v44];
      id v8 = (id)[objc_alloc(MEMORY[0x1E4F39150]) initWithObjects:v16 photoLibrary:v27 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

      BOOL v25 = 0;
      id v6 = v48;
      if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_32;
      }
    }
    v28 = [v9 objectForKeyedSubscript:v50];
    char v29 = [v28 isHidden];

    if ((v29 & 1) == 0)
    {
      v47 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v8 title:0];
      v30 = (void *)MEMORY[0x1E4F39008];
      v60 = v47;
      BOOL v25 = 1;
      id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
      v45 = [v30 transientCollectionListWithCollections:v31 title:0];

      v43 = [MEMORY[0x1E4F38EE8] fetchCollectionsInCollectionList:v45 options:0];
      long long v32 = (void *)[objc_alloc(MEMORY[0x1E4F90508]) initWithCollectionListFetchResult:v43 options:0];
      id v49 = v6;
      long long v33 = (void *)[objc_alloc(MEMORY[0x1E4F90500]) initWithPhotosDataSourceConfiguration:v32];
      long long v34 = (void *)[objc_alloc(MEMORY[0x1E4F90468]) initWithPhotosDataSource:v33];
      [(SearchUIPhotosOneUpController *)self setActiveDataSourceManager:v34];

      long long v35 = [(SearchUIPhotosOneUpController *)self activeDataSourceManager];
      [v35 dataSource];
      uint64_t v37 = v36 = v8;

      v51[0] = [v37 identifier];
      v51[1] = 0;
      v51[2] = v21;
      v51[3] = 0x7FFFFFFFFFFFFFFFLL;
      v38 = [v37 assetReferenceAtItemIndexPath:v51];
      [(SearchUIPhotosOneUpController *)self setNavigatedAssetReference:v38];

      v39 = [(SearchUIPhotosOneUpController *)self commandEnvironment];
      v40 = [v39 presentingViewController];

      objc_msgSend(v40, "px_enableOneUpPresentation");
      v41 = objc_msgSend(v40, "px_oneUpPresentation");
      [v41 setDelegate:self];

      id v8 = v36;
      id v6 = v49;

      goto LABEL_32;
    }
LABEL_30:
    BOOL v25 = 0;
LABEL_32:

    goto LABEL_33;
  }
  BOOL v25 = 0;
LABEL_34:

  return v25;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  if (oneUpPresentationMediaProvider__onceToken[0] != -1) {
    dispatch_once(oneUpPresentationMediaProvider__onceToken, &__block_literal_global_240);
  }
  BOOL v4 = [(SearchUIPhotosOneUpController *)self isSyndicated];
  uint64_t v5 = &oneUpPresentationMediaProvider__syndicatedMediaProvider;
  if (!v4) {
    uint64_t v5 = &oneUpPresentationMediaProvider__mediaProvider;
  }
  id v6 = (void *)*v5;
  return v6;
}

void __64__SearchUIPhotosOneUpController_oneUpPresentationMediaProvider___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F904E0]);
  uint64_t v1 = [MEMORY[0x1E4F38FB0] defaultManager];
  v2 = +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:0];
  uint64_t v3 = [v0 initWithImageManager:v1 library:v2];
  BOOL v4 = (void *)oneUpPresentationMediaProvider__mediaProvider;
  oneUpPresentationMediaProvider__mediaProvider = v3;

  id v5 = objc_alloc(MEMORY[0x1E4F904E0]);
  id v9 = [MEMORY[0x1E4F38FB0] defaultManager];
  id v6 = +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:1];
  uint64_t v7 = [v5 initWithImageManager:v9 library:v6];
  id v8 = (void *)oneUpPresentationMediaProvider__syndicatedMediaProvider;
  oneUpPresentationMediaProvider__syndicatedMediaProvider = v7;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (id)rowModelForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = [v4 asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 asset];
    uint64_t v7 = [(SearchUIPhotosOneUpController *)self rowModelForAsset:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)rowModelForAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() corespotlightIdentifierForAsset:v4];

  id v6 = [(SearchUIPhotosOneUpController *)self rowModelsForCorespotlightIdentifiers];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v7 = [(SearchUIPhotosOneUpController *)self rowModelForAssetReference:a4];
  id v5 = [(SearchUIPhotosOneUpController *)self commandEnvironment];
  id v6 = [v5 rowModelViewDelegate];
  [v6 scrollRowModelToVisible:v7];
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  id v5 = [(SearchUIPhotosOneUpController *)self viewForAssetReference:a4];
  id v6 = objc_alloc(MEMORY[0x1E4F905F8]);
  [v5 bounds];
  id v7 = objc_msgSend(v6, "initWithRect:inCoordinateSpace:", v5);
  id v8 = [(SearchUIPhotosOneUpController *)self imageViewInView:v5];
  id v9 = [v8 layer];
  if ([v9 maskedCorners])
  {
    uint64_t v10 = objc_opt_new();
    [v9 cornerRadius];
    objc_msgSend(v10, "setCornerRadius:");
    objc_msgSend(v10, "setCornerMask:", objc_msgSend(v9, "maskedCorners"));
    uint64_t v11 = [v9 cornerCurve];
    [v10 setCornerCurve:v11];

    [v7 setImageViewSpec:v10];
  }

  return v7;
}

- (id)imageViewInView:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = objc_msgSend(v4, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [(SearchUIPhotosOneUpController *)self imageViewInView:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          if (v11)
          {
            id v5 = (id)v11;

            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_13:

  return v5;
}

- (int64_t)oneUpPresentationActionContext:(id)a3
{
  return 0xFFFFLL;
}

- (id)oneUpPresentationActionManager:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F90658]);
  id v5 = [(SearchUIPhotosOneUpController *)self activeDataSourceManager];
  id v6 = (void *)[v4 initWithDataSourceManager:v5];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F90450]) initWithSelectionManager:v6];
  uint64_t v8 = [(SearchUIPhotosOneUpController *)self command];
  uint64_t v9 = [v8 _matchedPerson];
  uint64_t v10 = [v9 photosIdentifier];

  [v7 setPerformerDelegate:self];
  if (v10)
  {
    v16[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v12 = [v8 photosLibraryImage];
    long long v13 = +[SearchUIPhotosUtilities fetchResultForPersonIdentifiers:isSyndicated:](SearchUIPhotosUtilities, "fetchResultForPersonIdentifiers:isSyndicated:", v11, [v12 isSyndicated]);
    long long v14 = [v13 firstObject];
    [v7 setPerson:v14];
  }
  return v7;
}

- (id)oneUpPresentationMatchedQueryStrings:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SearchUIPhotosOneUpController *)self commandEnvironment];
  id v4 = [v3 searchString];
  id v5 = [v4 lowercaseString];

  id v6 = &stru_1F40279D8;
  if (v5) {
    id v6 = v5;
  }
  v9[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (id)oneUpPresentationMatchedSceneIdentifiers:(id)a3
{
  uint64_t v3 = [(SearchUIPhotosOneUpController *)self command];
  id v4 = +[SearchUIShowPhotosOneUpViewHandler matchedSceneIdentifiersForCommand:v3 andType:1];

  return v4;
}

- (id)oneUpPresentationMatchedAudioIdentifiers:(id)a3
{
  uint64_t v3 = [(SearchUIPhotosOneUpController *)self command];
  id v4 = +[SearchUIShowPhotosOneUpViewHandler matchedSceneIdentifiersForCommand:v3 andType:3];

  return v4;
}

- (id)oneUpPresentationMatchedHumanActionIdentifiers:(id)a3
{
  uint64_t v3 = [(SearchUIPhotosOneUpController *)self command];
  id v4 = +[SearchUIShowPhotosOneUpViewHandler matchedSceneIdentifiersForCommand:v3 andType:2];

  return v4;
}

- (id)oneUpPresentationMatchedPersonLocalIdentifiers:(id)a3
{
  uint64_t v3 = [(SearchUIPhotosOneUpController *)self command];
  id v4 = +[SearchUIShowPhotosOneUpViewHandler matchedPersonLocalIdentifiersForCommand:v3];

  return v4;
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  id v5 = a4;
  id v6 = [(SearchUIPhotosOneUpController *)self hiddenView];
  [v6 setHidden:0];

  uint64_t v7 = [v5 anyObject];

  id v8 = [(SearchUIPhotosOneUpController *)self viewForAssetReference:v7];

  [v8 setHidden:1];
  [(SearchUIPhotosOneUpController *)self setHiddenView:v8];
}

- (id)viewForAssetReference:(id)a3
{
  id v4 = [(SearchUIPhotosOneUpController *)self rowModelForAssetReference:a3];
  id v5 = [(SearchUIPhotosOneUpController *)self commandEnvironment];
  id v6 = [v5 rowModelViewDelegate];
  uint64_t v7 = [v6 viewForRowModel:v4];

  return v7;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  if (a4 != 30) {
    return;
  }
  id v6 = a3;
  id v16 = [v6 actionType];
  uint64_t v7 = [v6 selectionSnapshot];

  id v8 = [v7 firstObject];

  uint64_t v9 = [(SearchUIPhotosOneUpController *)self rowModelForAsset:v8];
  uint64_t v10 = [(SearchUIPhotosOneUpController *)self commandEnvironment];
  if ([v16 isEqualToString:*MEMORY[0x1E4F90D98]])
  {
    uint64_t v11 = [(id)objc_opt_class() bundleIdentifierForAsset:v8];
    uint64_t v12 = [(id)objc_opt_class() corespotlightIdentifierForAsset:v8];
    if (!v11)
    {
LABEL_13:

      goto LABEL_14;
    }
    if ([v11 hasPrefix:@"com.apple"]
      && [v11 containsString:@"FileProvider"])
    {
      long long v13 = objc_opt_new();
      [v13 setFileProviderIdentifier:v11];
    }
    else
    {
      long long v13 = objc_opt_new();
      [v13 setApplicationBundleIdentifier:v11];
    }
    [v13 setCoreSpotlightIdentifier:v12];
    long long v14 = objc_opt_new();
    [v14 setCommand:v13];
    long long v15 = +[SearchUICommandHandler handlerForButton:v14 rowModel:v9 environment:v10];
    [v15 executeWithTriggerEvent:2];

LABEL_12:
    goto LABEL_13;
  }
  if ([v16 isEqualToString:*MEMORY[0x1E4F90D70]])
  {
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = objc_opt_new();
    [v12 setCommand:v11];
    long long v13 = +[SearchUICommandHandler handlerForButton:v12 rowModel:v9 environment:v10];
    [v13 wasPerformedWithTriggerEvent:2];
    goto LABEL_12;
  }
LABEL_14:
}

- (id)undoManagerForActionPerformer:(id)a3
{
  return 0;
}

+ (id)bundleIdentifierForAsset:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 photoLibrary];
  uint64_t v5 = [v4 wellKnownPhotoLibraryIdentifier];

  if (v5 == 3)
  {
    id v6 = [v3 curationProperties];
    uint64_t v7 = [v6 importedByBundleIdentifier];
  }
  else
  {
    uint64_t v7 = +[SearchUIUtilities bundleIdentifierForApp:13];
  }

  return v7;
}

- (PXPhotoKitAssetsDataSourceManager)activeDataSourceManager
{
  return self->_activeDataSourceManager;
}

- (void)setActiveDataSourceManager:(id)a3
{
}

- (PXAssetReference)navigatedAssetReference
{
  return self->_navigatedAssetReference;
}

- (void)setNavigatedAssetReference:(id)a3
{
}

- (BOOL)isSyndicated
{
  return self->_isSyndicated;
}

- (void)setIsSyndicated:(BOOL)a3
{
  self->_isSyndicated = a3;
}

- (SFShowPhotosOneUpViewCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (NSDictionary)rowModelsForCorespotlightIdentifiers
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRowModelsForCorespotlightIdentifiers:(id)a3
{
}

- (SearchUICommandEnvironment)commandEnvironment
{
  return (SearchUICommandEnvironment *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCommandEnvironment:(id)a3
{
}

- (UIView)hiddenView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hiddenView);
  return (UIView *)WeakRetained;
}

- (void)setHiddenView:(id)a3
{
}

- (UIViewController)peekedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peekedViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPeekedViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_peekedViewController);
  objc_destroyWeak((id *)&self->_hiddenView);
  objc_storeStrong((id *)&self->_commandEnvironment, 0);
  objc_storeStrong((id *)&self->_rowModelsForCorespotlightIdentifiers, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_navigatedAssetReference, 0);
  objc_storeStrong((id *)&self->_activeDataSourceManager, 0);
}

@end