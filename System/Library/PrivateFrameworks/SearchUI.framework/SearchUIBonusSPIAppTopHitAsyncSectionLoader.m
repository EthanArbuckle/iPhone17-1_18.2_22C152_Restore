@interface SearchUIBonusSPIAppTopHitAsyncSectionLoader
+ (BOOL)supportsSectionModel:(id)a3;
- (void)fetchCardSectionsWithCompletionHandler:(id)a3;
@end

@implementation SearchUIBonusSPIAppTopHitAsyncSectionLoader

+ (BOOL)supportsSectionModel:(id)a3
{
  id v4 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___SearchUIBonusSPIAppTopHitAsyncSectionLoader;
  if (objc_msgSendSuper2(&v12, sel_supportsSectionModel_, v4))
  {
    v5 = (void *)MEMORY[0x1E4FA5DE8];
    v6 = [v4 rowModels];
    v7 = [v6 firstObject];
    v8 = [v7 identifyingResult];
    v9 = [v8 resultBundleId];
    char v10 = [v5 supportsBonusSPI:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)fetchCardSectionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SearchUIAsyncSectionLoader *)self delegate];
  char v6 = [v5 deviceIsAuthenticated];

  if ((v6 & 1) != 0
    && ([(SearchUIAppTopHitAsyncSectionLoader *)self bundleIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = WFTopHitContextualActionTypeForBundleIdentifier(),
        v7,
        v8))
  {
    v9 = (void *)MEMORY[0x1E4FB4A18];
    uint64_t v10 = [(id)objc_opt_class() maxNumOfTopHitEntities];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__SearchUIBonusSPIAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E6E746E0;
    v12[4] = self;
    id v13 = v4;
    [v9 getTopHitContextualActionsForType:v8 limit:v10 completion:v12];
  }
  else
  {
    v11 = [(SearchUIAppTopHitAsyncSectionLoader *)self responseForCardSections:MEMORY[0x1E4F1CBF0] animated:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v11);
  }
}

void __86__SearchUIBonusSPIAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v51[5] = *MEMORY[0x1E4F143B8];
  id v49 = a2;
  id v5 = a3;
  if (!v5 && v49 && [v49 count])
  {
    v40 = objc_opt_new();
    unint64_t v8 = [v49 count];
    unint64_t v9 = [(id)objc_opt_class() maxNumOfTopHitEntities];
    if (v8 >= v9) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      unint64_t v11 = 0;
      objc_super v12 = &off_1E6E71000;
      do
      {
        id v13 = [v49 objectAtIndexedSubscript:v11];
        v14 = v12[379];
        v15 = [v13 icon];
        v16 = [v14 imageFromContexualActionIcon:v15];

        v17 = v12[379];
        v18 = [v13 accessoryIcon];
        v19 = [v17 imageFromContexualActionIcon:v18];
        [v16 setBadgingImage:v19];

        v20 = objc_opt_new();
        v21 = WFDataFromSpotlightResultRunnable();
        id v22 = 0;
        [v20 setIntentMessageData:v21];

        v23 = [*(id *)(a1 + 32) bundleIdentifier];
        [v20 setApplicationBundleIdentifier:v23];

        v24 = [v13 identifier];
        [v20 setCommandDetail:v24];

        if (v22)
        {
          v25 = v16;
          v26 = SearchUIAppTopHitSectionLoaderLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            __86__SearchUIBonusSPIAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke_cold_1(v50, v22, v51, v26);
          }
        }
        else
        {
          [v20 setIsRunnableWorkflow:1];
          [v13 spotlightItem];
          v26 = v47 = v16;
          id v44 = objc_alloc(MEMORY[0x1E4FA5DC8]);
          v48 = [v26 uniqueIdentifier];
          v41 = [*(id *)(a1 + 32) bundleIdentifier];
          v46 = [v26 attributeSet];
          v43 = [v46 serializedAttributes];
          v27 = [v43 allKeys];
          v42 = [v26 attributeSet];
          v28 = [v42 serializedAttributes];
          v29 = [v28 allValues];
          [v13 subtitle];
          v31 = uint64_t v30 = a1;
          v45 = (void *)[v44 initWithIdentifier:v48 bundleIdentifier:v41 protectionClass:@"Priority" attributeKeys:v27 attributeValues:v29 type:3 completion:v31];

          a1 = v30;
          objc_super v12 = &off_1E6E71000;

          v32 = *(void **)(v30 + 32);
          v33 = [v13 subtitle];
          v34 = [v32 buildVerticalLayoutCardSectionFromResult:v47 title:v33 subtitle:0 command:v20];

          id v22 = 0;
          [v34 setSpotlightBackingResult:v45];
          [v40 addObject:v34];

          v25 = v47;
        }

        ++v11;
        unint64_t v35 = [v49 count];
        unint64_t v36 = [(id)objc_opt_class() maxNumOfTopHitEntities];
        if (v35 >= v36) {
          unint64_t v37 = v36;
        }
        else {
          unint64_t v37 = v35;
        }
      }
      while (v11 < v37);
    }
    uint64_t v38 = *(void *)(a1 + 40);
    v39 = [*(id *)(a1 + 32) responseForCardSections:v40 animated:0];
    (*(void (**)(uint64_t, void *))(v38 + 16))(v38, v39);

    id v5 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = [*(id *)(a1 + 32) responseForCardSections:MEMORY[0x1E4F1CBF0] animated:0];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

void __86__SearchUIBonusSPIAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  v7 = [a2 localizedDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1E45B5000, a4, OS_LOG_TYPE_ERROR, "Unable to encode result runnable: %@", a1, 0xCu);
}

@end