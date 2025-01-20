@interface SBHApplicationDataSource
- (FBSALOToken)addApplicationsObservationToken;
- (FBSALOToken)addPlaceholdersObservationToken;
- (FBSALOToken)demoteApplicationsObservationToken;
- (FBSALOToken)removeApplicationsObservationToken;
- (FBSALOToken)removedPlaceholdersObservationToken;
- (FBSALOToken)replaceApplicationsObservationToken;
- (FBSALOToken)updateApplicationsObservationToken;
- (FBSApplicationLibrary)appLibrary;
- (SBHApplicationDataSource)init;
- (SBHApplicationDataSource)initWithOptions:(unint64_t)a3;
- (id)allApplicationPlaceholdersForIconModel:(id)a3;
- (id)allApplicationsForIconModel:(id)a3;
- (id)applicationPlaceholderWithBundleIdentifier:(id)a3;
- (id)applicationPlaceholdersForFrontBoardPlaceholders:(id)a3;
- (id)applicationWithBundleIdentifier:(id)a3;
- (id)applicationsForApplicationsInfo:(id)a3;
- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4;
- (void)_didAddApplicationsInfo:(id)a3;
- (void)_didAddPlaceholders:(id)a3;
- (void)_didRemoveApplicationsInfo:(id)a3;
- (void)_didRemovePlaceholders:(id)a3;
- (void)_didReplaceApplicationsInfo:(id)a3;
- (void)addIconModelApplicationDataSourceObserver:(id)a3;
- (void)dealloc;
- (void)removeIconModelApplicationDataSourceObserver:(id)a3;
- (void)uninstallApplicationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)uninstallApplicationWithBundleIdentifier:(id)a3 options:(unint64_t)a4 completion:(id)a5;
@end

@implementation SBHApplicationDataSource

- (SBHApplicationDataSource)init
{
  return [(SBHApplicationDataSource *)self initWithOptions:3];
}

- (SBHApplicationDataSource)initWithOptions:(unint64_t)a3
{
  v51.receiver = self;
  v51.super_class = (Class)SBHApplicationDataSource;
  v4 = [(SBHApplicationDataSource *)&v51 init];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F628F0]);
    [v5 setAllowConcurrentLoading:1];
    v6 = self;
    [v5 setApplicationInfoClass:v6];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke;
    v50[3] = &__block_descriptor_40_e28_B16__0__LSApplicationProxy_8l;
    v50[4] = a3;
    [v5 setInstalledApplicationFilter:v50];
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    applications = v4->_applications;
    v4->_applications = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    applicationPlaceholders = v4->_applicationPlaceholders;
    v4->_applicationPlaceholders = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F628E8]) initWithConfiguration:v5];
    appLibrary = v4->_appLibrary;
    v4->_appLibrary = (FBSApplicationLibrary *)v11;

    objc_initWeak(&location, v4);
    v13 = v4->_appLibrary;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_2;
    v47[3] = &unk_1E6AB4E30;
    objc_copyWeak(&v48, &location);
    uint64_t v14 = [(FBSApplicationLibrary *)v13 observeDidAddApplicationsWithBlock:v47];
    addApplicationsObservationToken = v4->_addApplicationsObservationToken;
    v4->_addApplicationsObservationToken = (FBSALOToken *)v14;

    v16 = v4->_appLibrary;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_4;
    v45[3] = &unk_1E6AB4E58;
    objc_copyWeak(&v46, &location);
    uint64_t v17 = [(FBSApplicationLibrary *)v16 observeDidReplaceApplicationsWithBlock:v45];
    replaceApplicationsObservationToken = v4->_replaceApplicationsObservationToken;
    v4->_replaceApplicationsObservationToken = (FBSALOToken *)v17;

    v19 = v4->_appLibrary;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_6;
    v43[3] = &unk_1E6AB4E58;
    objc_copyWeak(&v44, &location);
    uint64_t v20 = [(FBSApplicationLibrary *)v19 observeDidUpdateApplicationsWithBlock:v43];
    updateApplicationsObservationToken = v4->_updateApplicationsObservationToken;
    v4->_updateApplicationsObservationToken = (FBSALOToken *)v20;

    v22 = v4->_appLibrary;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_8;
    v41[3] = &unk_1E6AB4E30;
    objc_copyWeak(&v42, &location);
    uint64_t v23 = [(FBSApplicationLibrary *)v22 observeDidRemoveApplicationsWithBlock:v41];
    removeApplicationsObservationToken = v4->_removeApplicationsObservationToken;
    v4->_removeApplicationsObservationToken = (FBSALOToken *)v23;

    v25 = v4->_appLibrary;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_10;
    v39[3] = &unk_1E6AB4E30;
    objc_copyWeak(&v40, &location);
    uint64_t v26 = [(FBSApplicationLibrary *)v25 observeDidDemoteApplicationsWithBlock:v39];
    demoteApplicationsObservationToken = v4->_demoteApplicationsObservationToken;
    v4->_demoteApplicationsObservationToken = (FBSALOToken *)v26;

    v28 = v4->_appLibrary;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_12;
    v37[3] = &unk_1E6AB4E30;
    objc_copyWeak(&v38, &location);
    uint64_t v29 = [(FBSApplicationLibrary *)v28 observeDidAddPlaceholdersWithBlock:v37];
    addPlaceholdersObservationToken = v4->_addPlaceholdersObservationToken;
    v4->_addPlaceholdersObservationToken = (FBSALOToken *)v29;

    v31 = v4->_appLibrary;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __44__SBHApplicationDataSource_initWithOptions___block_invoke_14;
    v35[3] = &unk_1E6AB4E30;
    objc_copyWeak(&v36, &location);
    uint64_t v32 = [(FBSApplicationLibrary *)v31 observeDidCancelPlaceholdersWithBlock:v35];
    removedPlaceholdersObservationToken = v4->_removedPlaceholdersObservationToken;
    v4->_removedPlaceholdersObservationToken = (FBSALOToken *)v32;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }
  return v4;
}

uint64_t __44__SBHApplicationDataSource_initWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 appTags];
  char v5 = [v4 containsObject:@"hidden"];

  if ((v5 & 1) == 0)
  {
    v7 = [v3 applicationType];
    v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      if ([v7 isEqualToString:@"User"]) {
        goto LABEL_11;
      }
      uint64_t v9 = *(void *)(a1 + 32);
    }
    if ((v9 & 2) != 0)
    {
      if ([v8 isEqualToString:@"System"]) {
        goto LABEL_11;
      }
      uint64_t v9 = *(void *)(a1 + 32);
    }
    if ((v9 & 4) == 0 || ([v8 isEqualToString:@"Internal"] & 1) == 0)
    {
      uint64_t v6 = 0;
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v6 = 1;
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v6 = 0;
LABEL_14:

  return v6;
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didAddApplicationsInfo:*(void *)(a1 + 32)];
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didReplaceApplicationsInfo:*(void *)(a1 + 32)];
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didReplaceApplicationsInfo:*(void *)(a1 + 32)];
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didRemoveApplicationsInfo:*(void *)(a1 + 32)];
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didRemoveApplicationsInfo:*(void *)(a1 + 32)];
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didAddPlaceholders:*(void *)(a1 + 32)];
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __44__SBHApplicationDataSource_initWithOptions___block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didRemovePlaceholders:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  if (self->_addApplicationsObservationToken) {
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  }
  if (self->_replaceApplicationsObservationToken) {
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  }
  if (self->_updateApplicationsObservationToken) {
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  }
  if (self->_removeApplicationsObservationToken) {
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  }
  if (self->_demoteApplicationsObservationToken) {
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  }
  if (self->_addPlaceholdersObservationToken) {
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  }
  if (self->_removedPlaceholdersObservationToken) {
    -[FBSApplicationLibrary removeObserverForToken:](self->_appLibrary, "removeObserverForToken:");
  }
  v3.receiver = self;
  v3.super_class = (Class)SBHApplicationDataSource;
  [(SBHApplicationDataSource *)&v3 dealloc];
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_applications objectForKey:v4];
  if (!v5)
  {
    uint64_t v6 = [(FBSApplicationLibrary *)self->_appLibrary applicationInfoForBundleIdentifier:v4];
    if (v6)
    {
      id v5 = [[SBHSimpleApplication alloc] initWithApplicationInfo:v6];
      [(SBHSimpleApplication *)v5 setIconModelApplicationDataSource:self];
      [(NSMutableDictionary *)self->_applications setObject:v5 forKey:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)applicationPlaceholderWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_applicationPlaceholders objectForKey:v4];
  if (!v5)
  {
    uint64_t v6 = [(FBSApplicationLibrary *)self->_appLibrary placeholderWithBundleIdentifier:v4];
    if (v6)
    {
      id v5 = [[SBHProxiedApplicationPlaceholder alloc] initWithPlaceholderProxy:v6];
      [(NSMutableDictionary *)self->_applicationPlaceholders setObject:v5 forKey:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (void)uninstallApplicationWithBundleIdentifier:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E4F628F8];
  id v9 = a3;
  id v10 = objc_alloc_init(v8);
  [v10 setUserInitiated:1];
  appLibrary = self->_appLibrary;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke;
  v13[3] = &unk_1E6AAD560;
  id v14 = v7;
  id v12 = v7;
  [(FBSApplicationLibrary *)appLibrary uninstallApplication:v9 withOptions:v10 completion:v13];
}

void __88__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke_2;
  v5[3] = &unk_1E6AAC8E8;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __88__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(void *)(a1 + 32) == 0);
  }
  return result;
}

- (id)applicationsForApplicationsInfo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "bundleIdentifier", (void)v14);
        id v12 = [(SBHApplicationDataSource *)self applicationWithBundleIdentifier:v11];
        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)applicationPlaceholdersForFrontBoardPlaceholders:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "bundleIdentifier", (void)v14);
        id v12 = [(SBHApplicationDataSource *)self applicationPlaceholderWithBundleIdentifier:v11];
        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_didAddApplicationsInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBHApplicationDataSource *)self applicationsForApplicationsInfo:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 iconModelApplicationDataSource:self applicationsAdded:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_didReplaceApplicationsInfo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v12 = [v11 bundleIdentifier];
        [(NSMutableDictionary *)self->_applications removeObjectForKey:v12];
        long long v13 = [v6 objectForKey:v11];
        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v14 = [(SBHApplicationDataSource *)self applicationsForApplicationsInfo:v5];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v15 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          [v20 iconModelApplicationDataSource:self applicationsUpdated:v14];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }
}

- (void)_didRemoveApplicationsInfo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHApplicationDataSource *)self applicationsForApplicationsInfo:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v22 + 1) + 8 * v10) bundleIdentifier];
        [(NSMutableDictionary *)self->_applications removeObjectForKey:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v12 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * v16);
          if (objc_opt_respondsToSelector()) {
            [v17 iconModelApplicationDataSource:self applicationsRemoved:v5];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
  }
}

- (void)_didAddPlaceholders:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBHApplicationDataSource *)self applicationPlaceholdersForFrontBoardPlaceholders:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 iconModelApplicationDataSource:self applicationPlaceholdersAdded:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_didRemovePlaceholders:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHApplicationDataSource *)self applicationPlaceholdersForFrontBoardPlaceholders:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v22 + 1) + 8 * v10) bundleIdentifier];
        [(NSMutableDictionary *)self->_applicationPlaceholders removeObjectForKey:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v12 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * v16);
          if (objc_opt_respondsToSelector()) {
            [v17 iconModelApplicationDataSource:self applicationPlaceholdersRemoved:v5];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
  }
}

- (id)allApplicationsForIconModel:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(FBSApplicationLibrary *)self->_appLibrary allInstalledApplications];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) bundleIdentifier];
        long long v11 = [(SBHApplicationDataSource *)self applicationWithBundleIdentifier:v10];
        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4
{
  return [(SBHApplicationDataSource *)self applicationWithBundleIdentifier:a4];
}

- (id)allApplicationPlaceholdersForIconModel:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(FBSApplicationLibrary *)self->_appLibrary allPlaceholders];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) bundleIdentifier];
        long long v11 = [(SBHApplicationDataSource *)self applicationPlaceholderWithBundleIdentifier:v10];
        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)addIconModelApplicationDataSourceObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeIconModelApplicationDataSourceObserver:(id)a3
{
}

- (void)uninstallApplicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_completion___block_invoke;
  v8[3] = &unk_1E6AACA68;
  id v9 = v6;
  id v7 = v6;
  [(SBHApplicationDataSource *)self uninstallApplicationWithBundleIdentifier:a3 options:0 completion:v8];
}

uint64_t __80__SBHApplicationDataSource_uninstallApplicationWithBundleIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 1);
  }
  return result;
}

- (FBSApplicationLibrary)appLibrary
{
  return self->_appLibrary;
}

- (FBSALOToken)addApplicationsObservationToken
{
  return self->_addApplicationsObservationToken;
}

- (FBSALOToken)replaceApplicationsObservationToken
{
  return self->_replaceApplicationsObservationToken;
}

- (FBSALOToken)updateApplicationsObservationToken
{
  return self->_updateApplicationsObservationToken;
}

- (FBSALOToken)removeApplicationsObservationToken
{
  return self->_removeApplicationsObservationToken;
}

- (FBSALOToken)demoteApplicationsObservationToken
{
  return self->_demoteApplicationsObservationToken;
}

- (FBSALOToken)addPlaceholdersObservationToken
{
  return self->_addPlaceholdersObservationToken;
}

- (FBSALOToken)removedPlaceholdersObservationToken
{
  return self->_removedPlaceholdersObservationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedPlaceholdersObservationToken, 0);
  objc_storeStrong((id *)&self->_addPlaceholdersObservationToken, 0);
  objc_storeStrong((id *)&self->_demoteApplicationsObservationToken, 0);
  objc_storeStrong((id *)&self->_removeApplicationsObservationToken, 0);
  objc_storeStrong((id *)&self->_updateApplicationsObservationToken, 0);
  objc_storeStrong((id *)&self->_replaceApplicationsObservationToken, 0);
  objc_storeStrong((id *)&self->_addApplicationsObservationToken, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_applicationPlaceholders, 0);
  objc_storeStrong((id *)&self->_applications, 0);
}

@end