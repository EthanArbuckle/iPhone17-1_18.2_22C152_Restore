@interface SBIconVisibilityService
- (SBIconVisibilityService)initWithIconModel:(id)a3;
- (id)iconStateDisplayIdentifiers;
- (void)_visibleIdentifiersChanged:(id)a3;
- (void)dealloc;
@end

@implementation SBIconVisibilityService

- (SBIconVisibilityService)initWithIconModel:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIconVisibilityService;
  v6 = [(SBIconVisibilityService *)&v11 init];
  if (v6)
  {
    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    iconStateDisplayIdentifiersLock = v6->_iconStateDisplayIdentifiersLock;
    v6->_iconStateDisplayIdentifiersLock = v7;

    objc_storeStrong((id *)&v6->_iconModel, a3);
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel__visibleIdentifiersChanged_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];
    [v9 addObserver:v6 selector:sel__visibleIdentifiersChanged_ name:*MEMORY[0x1E4FA66F8] object:v5];
    [v9 addObserver:v6 selector:sel__visibleIdentifiersChanged_ name:*MEMORY[0x1E4FA66E8] object:v5];
    [v9 addObserver:v6 selector:sel__visibleIdentifiersChanged_ name:*MEMORY[0x1E4FA6708] object:v5];
    [v9 addObserver:v6 selector:sel__visibleIdentifiersChanged_ name:*MEMORY[0x1E4FA66F0] object:v5];
    [(SBIconVisibilityService *)v6 _visibleIdentifiersChanged:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBIconVisibilityService;
  [(SBIconVisibilityService *)&v4 dealloc];
}

- (id)iconStateDisplayIdentifiers
{
  [(NSLock *)self->_iconStateDisplayIdentifiersLock lock];
  v3 = self->_iconStateDisplayIdentifiers;
  [(NSLock *)self->_iconStateDisplayIdentifiersLock unlock];
  return v3;
}

- (void)_visibleIdentifiersChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SBIconVisibilityService__visibleIdentifiersChanged___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __54__SBIconVisibilityService__visibleIdentifiersChanged___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) name];
  int v3 = [@"SBInstalledApplicationsDidChangeNotification" isEqualToString:v2];
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if ((v3 & 1) == 0)
    {
      id v5 = [v4 object];
      v6 = *(void **)(*(void *)(a1 + 40) + 8);

      if (v5 != v6) {
        goto LABEL_61;
      }
    }
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v8 = [*(id *)(a1 + 40) iconStateDisplayIdentifiers];
  v9 = (void *)[v7 initWithSet:v8];

  v10 = (void *)[v9 mutableCopy];
  objc_super v11 = [*(id *)(a1 + 32) userInfo];
  if ([(id)*MEMORY[0x1E4FA66F8] isEqualToString:v2])
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v12 = [v11 objectForKey:*MEMORY[0x1E4FA6870]];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v66 objects:v73 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v67 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          if ([v17 isApplicationIcon] && objc_msgSend(v17, "hasApplication"))
          {
            v18 = [v17 applicationBundleID];
            [v10 addObject:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v66 objects:v73 count:16];
      }
      while (v14);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v19 = [v11 objectForKey:*MEMORY[0x1E4FA6868]];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v63 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v62 + 1) + 8 * j);
          if ([v24 isApplicationIcon])
          {
            v25 = [v24 applicationBundleID];
            [v10 removeObject:v25];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v62 objects:v72 count:16];
      }
      while (v21);
    }
    goto LABEL_57;
  }
  if (v3)
  {
    v48 = v9;
    id v26 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v27 = [v11 objectForKey:@"SBInstalledApplicationsAddedBundleIDs"];
    v28 = (void *)[v26 initWithSet:v27];

    v49 = v11;
    v29 = [v11 objectForKey:@"SBInstalledApplicationsReplacedBundleIDs"];
    [v28 unionSet:v29];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    obuint64_t j = v28;
    uint64_t v30 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v59;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v59 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v58 + 1) + 8 * k);
          uint64_t v35 = *(void *)(a1 + 40);
          v36 = *(void **)(v35 + 8);
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __54__SBIconVisibilityService__visibleIdentifiersChanged___block_invoke_2;
          v55[3] = &unk_1E6B01C68;
          v55[4] = v35;
          id v56 = v10;
          uint64_t v57 = v34;
          [v36 enumerateApplicationIconsForBundleIdentifier:v34 usingBlock:v55];
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
      }
      while (v31);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v37 = [v49 objectForKey:@"SBInstalledApplicationsRemovedBundleIDs"];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v51 objects:v70 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v52;
      do
      {
        for (uint64_t m = 0; m != v39; ++m)
        {
          if (*(void *)v52 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v51 + 1) + 8 * m);
          v43 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "expectedIconForDisplayIdentifier:", v42, v48);
          if (([*(id *)(*(void *)(a1 + 40) + 8) isIconVisible:v43] & 1) == 0) {
            [v10 removeObject:v42];
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v51 objects:v70 count:16];
      }
      while (v39);
    }

    v9 = v48;
    objc_super v11 = v49;
    goto LABEL_58;
  }
  if ([(id)*MEMORY[0x1E4FA66E8] isEqualToString:v2])
  {
    v19 = [v11 objectForKey:*MEMORY[0x1E4FA6860]];
    if ((![v19 isApplicationIcon] || (objc_msgSend(v19, "hasApplication") & 1) == 0)
      && ![v19 isBookmarkIcon]
      || ![*(id *)(*(void *)(a1 + 40) + 8) isIconVisible:v19])
    {
      goto LABEL_57;
    }
    v44 = [v19 leafIdentifier];
    [v10 addObject:v44];
LABEL_53:

    goto LABEL_57;
  }
  if ([(id)*MEMORY[0x1E4FA6708] isEqualToString:v2])
  {
    v19 = [v11 objectForKey:*MEMORY[0x1E4FA6860]];
    if (([v19 isApplicationIcon] & 1) == 0 && !objc_msgSend(v19, "isBookmarkIcon")) {
      goto LABEL_57;
    }
    v44 = [v19 leafIdentifier];
    [v10 removeObject:v44];
    goto LABEL_53;
  }
  if (([(id)*MEMORY[0x1E4FA66F0] isEqualToString:v2] & 1) == 0 && *(void *)(a1 + 32)) {
    goto LABEL_58;
  }
  [v10 removeAllObjects];
  v19 = [*(id *)(*(void *)(a1 + 40) + 8) visibleIconIdentifiers];
  [v10 unionSet:v19];
LABEL_57:

LABEL_58:
  if ((objc_msgSend(v10, "isEqual:", v9, v48) & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 40) + 16) lock];
    uint64_t v45 = [v10 copy];
    uint64_t v46 = *(void *)(a1 + 40);
    v47 = *(void **)(v46 + 24);
    *(void *)(v46 + 24) = v45;

    [*(id *)(*(void *)(a1 + 40) + 16) unlock];
    notify_post("com.apple.springboard.display-identifiers.changed");
  }

LABEL_61:
}

uint64_t __54__SBIconVisibilityService__visibleIdentifiersChanged___block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1[4] + 8) isIconVisible:a2];
  if (result)
  {
    id v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    return [v4 addObject:v5];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconStateDisplayIdentifiers, 0);
  objc_storeStrong((id *)&self->_iconStateDisplayIdentifiersLock, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
}

@end