@interface SBHProactivePageSuggestionsManager
- (ATXSuggestedPagesClient)suggestedPagesClient;
- (SBHIconManager)iconManager;
- (SBHProactivePageSuggestionsManager)initWithIconManager:(id)a3;
- (SBHProactivePageSuggestionsManager)initWithIconManager:(id)a3 overridingRootFolder:(id)a4;
- (SBRootFolder)rootFolder;
- (id)_iconForATXHomeScreenApp:(id)a3 iconModel:(id)a4 rootFolder:(id)a5;
- (void)_addLeafIcons:(id)a3 toList:(id)a4 iconModel:(id)a5 rootFolder:(id)a6 snapshot:(BOOL)a7;
- (void)_addSuggestedPage:(id)a3 atIndex:(unint64_t)a4 forSnapshot:(BOOL)a5 focusMode:(id)a6;
- (void)_addSuggestedPageWithPageType:(id)a3 focusModeIdentifier:(id)a4;
- (void)addSuggestedPages:(id)a3 withFocusModeIdentifier:(id)a4 forSnapshot:(BOOL)a5 completion:(id)a6;
- (void)setIconManager:(id)a3;
- (void)setRootFolder:(id)a3;
- (void)setSuggestedPagesClient:(id)a3;
@end

@implementation SBHProactivePageSuggestionsManager

- (SBHProactivePageSuggestionsManager)initWithIconManager:(id)a3
{
  return [(SBHProactivePageSuggestionsManager *)self initWithIconManager:a3 overridingRootFolder:0];
}

- (SBHProactivePageSuggestionsManager)initWithIconManager:(id)a3 overridingRootFolder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHProactivePageSuggestionsManager;
  v8 = [(SBHProactivePageSuggestionsManager *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_iconManager, v6);
    if (v7)
    {
      objc_storeWeak((id *)&v9->_rootFolder, v7);
    }
    else
    {
      v10 = [v6 rootFolder];
      objc_storeWeak((id *)&v9->_rootFolder, v10);
    }
    v11 = (ATXSuggestedPagesClient *)objc_alloc_init(MEMORY[0x1E4F4B360]);
    suggestedPagesClient = v9->_suggestedPagesClient;
    v9->_suggestedPagesClient = v11;
  }
  return v9;
}

- (void)addSuggestedPages:(id)a3 withFocusModeIdentifier:(id)a4 forSnapshot:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v13 = (void (**)(void))a6;
  objc_super v14 = SBLogFocusModes();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v17;
    __int16 v29 = 2048;
    uint64_t v30 = [v11 count];
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 1024;
    BOOL v34 = v7;
    _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "[%@ %@] suggestedPages: %li, focusModeIdentifier: %@, snapshot: %d", buf, 0x30u);
  }
  v18 = [SBHFocusMode alloc];
  v19 = [(SBHProactivePageSuggestionsManager *)self rootFolder];
  v20 = [(SBHFocusMode *)v18 initWithIdentifier:v12 folder:v19];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __103__SBHProactivePageSuggestionsManager_addSuggestedPages_withFocusModeIdentifier_forSnapshot_completion___block_invoke;
  v22[3] = &unk_1E6AB1268;
  BOOL v24 = v7;
  v22[4] = self;
  v23 = v20;
  v21 = v20;
  [v11 enumerateObjectsUsingBlock:v22];
  if (v13) {
    v13[2](v13);
  }
}

uint64_t __103__SBHProactivePageSuggestionsManager_addSuggestedPages_withFocusModeIdentifier_forSnapshot_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _addSuggestedPage:a2 atIndex:a3 forSnapshot:*(unsigned __int8 *)(a1 + 48) focusMode:*(void *)(a1 + 40)];
}

- (void)_addSuggestedPage:(id)a3 atIndex:(unint64_t)a4 forSnapshot:(BOOL)a5 focusMode:(id)a6
{
  BOOL v7 = a5;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v10 = a6;
  v72 = [(SBHProactivePageSuggestionsManager *)self iconManager];
  v58 = self;
  id v11 = [(SBHProactivePageSuggestionsManager *)self rootFolder];
  [v11 model];
  v60 = v59 = v10;
  BOOL v61 = v7;
  if (v7)
  {
    id v12 = [v11 addEmptyList];
    v13 = SBLogFocusModes();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    objc_super v14 = "Preparing to add a suggested page for a snapshot (skipping focus mode configuration)...";
LABEL_12:
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    goto LABEL_13;
  }
  id v12 = [v11 insertEmptyListAtIndex:a4];
  v15 = SBLogFocusModes();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "Preparing to add a suggested page...", buf, 2u);
  }

  if (!v10)
  {
    v13 = SBLogFocusModes();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    objc_super v14 = "No focus mode was provided";
    goto LABEL_12;
  }
  [v12 setHidden:1];
  [v10 addToList:v12];
  v13 = [v72 focusModeManager];
  v16 = [v10 identifier];
  [v13 addFocusModeRequiringIntroduction:v16];
  v17 = SBLogFocusModes();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v89 = v59;
    _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "Successfully configured suggested page for focus mode: %{public}@", buf, 0xCu);
  }

LABEL_13:
  v18 = SBLogFocusModes();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_DEFAULT, "Adding leaf icons...", buf, 2u);
  }

  v57 = [v62 leafIcons];
  -[SBHProactivePageSuggestionsManager _addLeafIcons:toList:iconModel:rootFolder:snapshot:](self, "_addLeafIcons:toList:iconModel:rootFolder:snapshot:");
  v19 = SBLogFocusModes();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_DEFAULT, "Adding widgets...", buf, 2u);
  }

  [v62 stacks];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v68 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
  if (v68)
  {
    uint64_t v20 = 3;
    if (!v61) {
      uint64_t v20 = 0;
    }
    uint64_t v64 = v20;
    uint64_t v65 = *(void *)v82;
    v66 = v12;
    v67 = v11;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v82 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v71 = v21;
        v22 = *(void **)(*((void *)&v81 + 1) + 8 * v21);
        v23 = SBLogFocusModes();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v89 = v22;
          _os_log_impl(&dword_1D7F0A000, v23, OS_LOG_TYPE_DEFAULT, "Widget: %{public}@", buf, 0xCu);
        }

        id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v69 = v22;
        __int16 v27 = [v22 widgets];
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v77 objects:v86 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v78;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v78 != v30) {
                objc_enumerationMutation(v27);
              }
              id v32 = *(void **)(*((void *)&v77 + 1) + 8 * i);
              __int16 v33 = [v32 extensionBundleId];
              [v24 addObject:v33];

              BOOL v34 = [v32 widgetKind];
              [v25 addObject:v34];

              uint64_t v35 = [v32 appBundleId];
              [v26 addObject:v35];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v77 objects:v86 count:16];
          }
          while (v29);
        }
        v70 = v24;
        v36 = [[SBWidgetIcon alloc] initWithWidgetExtensionIdentifiers:v24 widgetKinds:v25 widgetContainerBundleIdentifiers:v26 suggestionSource:v64];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v37 = v27;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v73 objects:v85 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v74;
          do
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v74 != v40) {
                objc_enumerationMutation(v37);
              }
              v42 = *(void **)(*((void *)&v73 + 1) + 8 * j);
              v43 = [v42 intent];
              if (v43)
              {
                v44 = [(SBIcon *)v36 uniqueIdentifier];
                v45 = [v42 widgetUniqueId];
                [v72 setTemporaryIntent:v43 forIconWithIdentifier:v44 widgetUniqueIdentifier:v45];
              }
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v73 objects:v85 count:16];
          }
          while (v39);
        }

        v46 = SBHStackLayoutSizeToIconGridSizeClass([v69 stackLayoutSize]);
        [(SBIcon *)v36 setGridSizeClass:v46];
        uint64_t v47 = SBIconCoordinateMake([v69 coordinateColumn] + 1, objc_msgSend(v69, "coordinateRow") + 1);
        id v12 = v66;
        id v49 = (id)objc_msgSend(v66, "insertIcon:atCoordinate:gridCellInfoOptions:mutationOptions:", v36, v47, v48, 0, 0);

        uint64_t v21 = v71 + 1;
        id v11 = v67;
      }
      while (v71 + 1 != v68);
      uint64_t v68 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
    }
    while (v68);
  }
  if ([v12 isEmpty])
  {
    [v11 removeList:v12];
    v50 = v62;
  }
  else
  {
    v50 = v62;
    if (!v61)
    {
      v51 = [v12 uniqueIdentifier];
      [v62 setUniqueIdentifier:v51];

      v52 = [v59 identifier];

      if (v52)
      {
        v53 = (void *)MEMORY[0x1E4F1CAD0];
        v54 = [v59 identifier];
        v55 = [v53 setWithObject:v54];
        [v62 setAssociatedModeUUIDs:v55];

        v50 = v62;
      }
      v56 = [(SBHProactivePageSuggestionsManager *)v58 suggestedPagesClient];
      [v56 didInstallSuggestedPage:v50];
    }
  }
}

- (void)_addSuggestedPageWithPageType:(id)a3 focusModeIdentifier:(id)a4
{
  id v6 = a4;
  BOOL v7 = [&unk_1F300F3C8 objectForKey:a3];
  uint64_t v8 = [v7 integerValue];

  id v9 = objc_alloc_init(MEMORY[0x1E4F4B368]);
  [v9 setPageType:v8];
  id v10 = objc_alloc_init(MEMORY[0x1E4F4B378]);
  id v11 = [(SBHProactivePageSuggestionsManager *)self suggestedPagesClient];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke;
  v13[3] = &unk_1E6AB12B8;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v11 suggestedPagesWithFilter:v9 layoutOptions:v10 completionHandler:v13];
}

void __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke_2;
  block[3] = &unk_1E6AACDE0;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke_2(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke_3;
  v3[3] = &unk_1E6AB1290;
  v1 = (void *)a1[4];
  v2 = (void *)a1[6];
  v3[4] = a1[5];
  id v4 = v2;
  [v1 enumerateObjectsUsingBlock:v3];
}

void __88__SBHProactivePageSuggestionsManager__addSuggestedPageWithPageType_focusModeIdentifier___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    *a4 = 1;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v9 = a2;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a2;
    id v8 = [v6 arrayWithObjects:&v9 count:1];
    objc_msgSend(v5, "addSuggestedPages:withFocusModeIdentifier:forSnapshot:completion:", v8, *(void *)(a1 + 40), 0, 0, v9, v10);
  }
}

- (void)_addLeafIcons:(id)a3 toList:(id)a4 iconModel:(id)a5 rootFolder:(id)a6 snapshot:(BOOL)a7
{
  BOOL v61 = a7;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v59 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v11;
  uint64_t v14 = [v11 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v57 = *(void *)v67;
    do
    {
      uint64_t v16 = 0;
      uint64_t v58 = v15;
      do
      {
        if (*(void *)v67 != v57) {
          objc_enumerationMutation(obj);
        }
        os_log_t v17 = *(os_log_t *)(*((void *)&v66 + 1) + 8 * v16);
        v18 = SBLogFocusModes();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          os_log_t v71 = v17;
          _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_DEFAULT, "Icon: %{public}@", buf, 0xCu);
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = v17;
          if (v19)
          {
            if (objc_opt_isKindOfClass()) {
              uint64_t v21 = v20;
            }
            else {
              uint64_t v21 = 0;
            }
          }
          else
          {
            uint64_t v21 = 0;
          }
          v22 = v21;

          v23 = [(SBHProactivePageSuggestionsManager *)self _iconForATXHomeScreenApp:v22 iconModel:v12 rootFolder:v13];

          [v59 addIcon:v23];
        }
        objc_opt_class();
        uint64_t v60 = v16;
        if (objc_opt_isKindOfClass())
        {
          uint64_t v24 = objc_opt_class();
          id v25 = v17;
          os_log_t log = v17;
          if (v24)
          {
            if (objc_opt_isKindOfClass()) {
              id v26 = v25;
            }
            else {
              id v26 = 0;
            }
          }
          else
          {
            id v26 = 0;
          }
          __int16 v27 = v26;

          v53 = [v27 name];
          uint64_t v28 = [[SBFolder alloc] initWithDisplayName:v53 maxListCount:9 maxIconCountInLists:9];
          v54 = v27;
          uint64_t v29 = [v27 folderPages];
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v62 objects:v74 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v63;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v63 != v32) {
                  objc_enumerationMutation(v29);
                }
                BOOL v34 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                uint64_t v35 = SBLogFocusModes();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D7F0A000, v35, OS_LOG_TYPE_DEFAULT, "Adding a folder icon...", buf, 2u);
                }

                v36 = [v34 contents];
                id v37 = [(SBFolder *)v28 firstList];
                [(SBHProactivePageSuggestionsManager *)self _addLeafIcons:v36 toList:v37 iconModel:v12 rootFolder:v13 snapshot:v61];
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v62 objects:v74 count:16];
            }
            while (v31);
          }
          uint64_t v38 = [[SBFolderIcon alloc] initWithFolder:v28];
          [v59 addIcon:v38];

          uint64_t v15 = v58;
          uint64_t v16 = v60;
          os_log_t v17 = log;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v39 = [v17 identifier];
          uint64_t v40 = [v17 bundleIdentifierForDisplay];
          uint64_t v41 = [v17 name];
          id v42 = objc_alloc_init(MEMORY[0x1E4FB1F10]);
          [v42 setIdentifier:v39];
          [v42 setShortcutIdentifier:v39];
          v43 = (void *)v40;
          [v42 setApplicationBundleIdentifier:v40];
          v44 = (void *)v41;
          [v42 setTitle:v41];
          v45 = [NSString stringWithFormat:@"shortcuts://x-callback-url/run-shortcut?id=%@&source=homescreen", v39];
          v46 = [MEMORY[0x1E4F1CB10] URLWithString:v45];
          [v42 setPageURL:v46];

          uint64_t v47 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", -[NSObject icon](v17, "icon"));
          [v42 setIconImage:v47 isPrecomposed:0];
          if (!v61 && ([v42 createOnDisk] & 1) == 0)
          {
            uint64_t v48 = SBLogIcon();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              id v49 = (objc_class *)objc_opt_class();
              NSStringFromClass(v49);
              v50 = loga = v48;
              *(_DWORD *)buf = 138412546;
              os_log_t v71 = v50;
              __int16 v72 = 2112;
              id v73 = v42;
              _os_log_impl(&dword_1D7F0A000, loga, OS_LOG_TYPE_DEFAULT, "[%@] Failed to save web clip %@", buf, 0x16u);

              uint64_t v48 = loga;
            }
          }
          v51 = [v12 addBookmarkIconForWebClip:v42];
          [v59 addIcon:v51];

          uint64_t v16 = v60;
          uint64_t v15 = v58;
        }
        ++v16;
      }
      while (v16 != v15);
      uint64_t v15 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v15);
  }
}

- (id)_iconForATXHomeScreenApp:(id)a3 iconModel:(id)a4 rootFolder:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a3 bundleId];
  id v11 = [v8 applicationIconForBundleIdentifier:v10];
  if (v11)
  {
    id v12 = [v9 indexPathForIcon:v11 includingPlaceholders:0];

    if (v12)
    {
      id v13 = [v8 addAdditionalIconMatchingIcon:v11];
    }
    else
    {
      id v13 = v11;
    }
    uint64_t v15 = v13;
  }
  else
  {
    uint64_t v14 = SBLogFocusModes();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[SBHProactivePageSuggestionsManager _iconForATXHomeScreenApp:iconModel:rootFolder:]((uint64_t)self, (uint64_t)v10, v14);
    }

    uint64_t v15 = 0;
  }

  return v15;
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (void)setIconManager:(id)a3
{
}

- (SBRootFolder)rootFolder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootFolder);
  return (SBRootFolder *)WeakRetained;
}

- (void)setRootFolder:(id)a3
{
}

- (ATXSuggestedPagesClient)suggestedPagesClient
{
  return self->_suggestedPagesClient;
}

- (void)setSuggestedPagesClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPagesClient, 0);
  objc_destroyWeak((id *)&self->_rootFolder);
  objc_destroyWeak((id *)&self->_iconManager);
}

- (void)_iconForATXHomeScreenApp:(uint64_t)a1 iconModel:(uint64_t)a2 rootFolder:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_fault_impl(&dword_1D7F0A000, a3, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to create app icon for suggested bundle identifier: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end