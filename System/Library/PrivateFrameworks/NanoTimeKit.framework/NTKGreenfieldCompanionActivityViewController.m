@interface NTKGreenfieldCompanionActivityViewController
- (NTKGreenfieldCompanionActivityViewController)initWithDraftRecipe:(id)a3 previewImage:(id)a4;
- (id)_customizationGroupsForActivityViewController:(id)a3;
- (void)_handleCustomizationValueChange:(id)a3 sharingOption:(id)a4;
- (void)companionActivityItemProvider:(id)a3 handleError:(id)a4;
@end

@implementation NTKGreenfieldCompanionActivityViewController

- (NTKGreenfieldCompanionActivityViewController)initWithDraftRecipe:(id)a3 previewImage:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [[NTKGreenfieldCompanionActivityItemProvider alloc] initWithDraftRecipe:v7 previewImage:v8];

  [(NTKGreenfieldCompanionActivityItemProvider *)v9 setDelegate:self];
  v22[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v20.receiver = self;
  v20.super_class = (Class)NTKGreenfieldCompanionActivityViewController;
  v11 = [(NTKGreenfieldCompanionActivityViewController *)&v20 initWithActivityItems:v10 applicationActivities:0];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_draftRecipe, a3);
    [(NTKGreenfieldCompanionActivityViewController *)v11 setObjectManipulationDelegate:v11];
    uint64_t v12 = *MEMORY[0x1E4F9F3A8];
    v21[0] = *MEMORY[0x1E4F9F390];
    v21[1] = v12;
    uint64_t v13 = *MEMORY[0x1E4F9F3C0];
    v21[2] = *MEMORY[0x1E4F9F3B8];
    v21[3] = v13;
    uint64_t v14 = *MEMORY[0x1E4F9F3C8];
    v21[4] = *MEMORY[0x1E4F9F350];
    v21[5] = v14;
    uint64_t v15 = *MEMORY[0x1E4F9F398];
    v21[6] = *MEMORY[0x1E4F9F340];
    v21[7] = v15;
    uint64_t v16 = *MEMORY[0x1E4F9F3A0];
    v21[8] = *MEMORY[0x1E4F9F3B0];
    v21[9] = v16;
    uint64_t v17 = *MEMORY[0x1E4F9F378];
    v21[10] = *MEMORY[0x1E4F9F388];
    v21[11] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:12];
    [(NTKGreenfieldCompanionActivityViewController *)v11 setExcludedActivityTypes:v18];
  }
  return v11;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  val = self;
  draftRecipe = self->_draftRecipe;
  if (draftRecipe)
  {
    v30 = [(NTKGreenfieldDraftRecipe *)draftRecipe sortedComplicationSharingOptions];
    if ([v30 count])
    {
      id v34 = [MEMORY[0x1E4F1CA48] array];
      [(NTKGreenfieldDraftRecipe *)self->_draftRecipe sortedComplicationSharingOptions];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v35 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v35)
      {
        uint64_t v33 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v41 != v33) {
              objc_enumerationMutation(obj);
            }
            v6 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            id v7 = val->_draftRecipe;
            id v8 = [v6 uniqueIdentifier];
            uint64_t v9 = [(NTKGreenfieldDraftRecipe *)v7 optionForComplicationUniqueIdentifier:v8];

            v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
            uint64_t v11 = [v6 optionType];
            if (v11 == 1)
            {
              uint64_t v15 = +[NTKGreenfieldDraftRecipe titleFromComplicationOption:0];
              [v10 addObject:v15];

              uint64_t v16 = +[NTKGreenfieldDraftRecipe titleFromComplicationOption:1];
              [v10 addObject:v16];

              uint64_t v17 = +[NTKGreenfieldDraftRecipe titleFromComplicationOption:2];
              [v10 addObject:v17];

              if (v9 == 2) {
                uint64_t v14 = 2;
              }
              else {
                uint64_t v14 = v9 == 1;
              }
            }
            else if (v11)
            {
              uint64_t v14 = 0;
            }
            else
            {
              uint64_t v12 = +[NTKGreenfieldDraftRecipe titleFromComplicationOption:1];
              [v10 addObject:v12];

              uint64_t v13 = +[NTKGreenfieldDraftRecipe titleFromComplicationOption:2];
              [v10 addObject:v13];

              uint64_t v14 = v9 == 2;
            }
            v18 = +[NTKGreenfieldDraftRecipe descriptionFromComplicationOption:v9];
            v19 = NSString;
            objc_super v20 = [v6 uniqueIdentifier];
            v21 = [v19 stringWithFormat:@"%@.picker", v20];

            objc_initWeak(&location, val);
            v22 = (void *)MEMORY[0x1E4F9F320];
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __94__NTKGreenfieldCompanionActivityViewController__customizationGroupsForActivityViewController___block_invoke;
            v37[3] = &unk_1E62C7198;
            objc_copyWeak(&v38, &location);
            v37[4] = v6;
            v23 = [v22 pickerCustomizationWithIdentifier:v21 options:v10 selectedOptionIndex:v14 footerText:v18 valueChangedHandler:v37];
            id v24 = objc_alloc(MEMORY[0x1E4F9F328]);
            v25 = [v6 name];
            v26 = [v6 uniqueIdentifier];
            v44 = v23;
            v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
            v28 = (void *)[v24 _initGroupWithName:v25 identifier:v26 customizations:v27];

            [v34 addObject:v28];
            objc_destroyWeak(&v38);
            objc_destroyWeak(&location);
          }
          uint64_t v35 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v35);
      }
    }
    else
    {
      id v34 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v34 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v34;
}

void __94__NTKGreenfieldCompanionActivityViewController__customizationGroupsForActivityViewController___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleCustomizationValueChange:v4 sharingOption:*(void *)(a1 + 32)];
}

- (void)_handleCustomizationValueChange:(id)a3 sharingOption:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 optionType];
  if (v8 != 1)
  {
    if (!v8)
    {
      uint64_t v9 = 1;
      if (![v6 selectedOptionIndex]) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (![v6 selectedOptionIndex])
  {
LABEL_8:
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  if ([v6 selectedOptionIndex] != 1)
  {
    uint64_t v9 = 2;
LABEL_10:
    uint64_t v9 = 2 * ([v6 selectedOptionIndex] == v9);
    goto LABEL_11;
  }
  uint64_t v9 = 1;
LABEL_11:
  draftRecipe = self->_draftRecipe;
  uint64_t v11 = [v7 uniqueIdentifier];
  [(NTKGreenfieldDraftRecipe *)draftRecipe setComplicationOption:v9 forComplicationUniqueIdentifier:v11];

  uint64_t v12 = self->_draftRecipe;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__NTKGreenfieldCompanionActivityViewController__handleCustomizationValueChange_sharingOption___block_invoke;
  v13[3] = &unk_1E62C3890;
  v13[4] = self;
  +[NTKGreenfieldUtilities generateFacePreviewImageFromDraftRecipe:v12 borderType:1 completionBlock:v13];
}

void __94__NTKGreenfieldCompanionActivityViewController__handleCustomizationValueChange_sharingOption___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [[NTKGreenfieldCompanionActivityItemProvider alloc] initWithDraftRecipe:*(void *)(*(void *)(a1 + 32) + 1336) previewImage:v3];
    [(NTKGreenfieldCompanionActivityItemProvider *)v4 setDelegate:*(void *)(a1 + 32)];
    v5 = *(void **)(a1 + 32);
    v7[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v5 _updateActivityItems:v6];
  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    id v4 = (NTKGreenfieldCompanionActivityItemProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super.super.super, OS_LOG_TYPE_ERROR)) {
      __94__NTKGreenfieldCompanionActivityViewController__handleCustomizationValueChange_sharingOption___block_invoke_cold_1(&v4->super.super.super);
    }
  }
}

- (void)companionActivityItemProvider:(id)a3 handleError:(id)a4
{
  id v7 = a4;
  v5 = [(NTKGreenfieldCompanionActivityViewController *)self completionWithItemsHandler];

  if (v5)
  {
    id v6 = [(NTKGreenfieldCompanionActivityViewController *)self completionWithItemsHandler];
    ((void (**)(void, __CFString *, void, void, id))v6)[2](v6, @"Greenfield", 0, 0, v7);

    [(NTKGreenfieldCompanionActivityViewController *)self setCompletionWithItemsHandler:0];
  }
}

- (void).cxx_destruct
{
}

void __94__NTKGreenfieldCompanionActivityViewController__handleCustomizationValueChange_sharingOption___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Failed to generate the updated recipe after sharing options has changed.", v1, 2u);
}

@end