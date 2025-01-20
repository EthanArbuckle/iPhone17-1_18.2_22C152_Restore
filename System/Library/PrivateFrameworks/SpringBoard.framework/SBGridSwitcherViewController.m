@interface SBGridSwitcherViewController
- (id)targetItemForSpringLoadingInteractionInView:(id)a3 atLocation:(CGPoint)a4 forDropSession:(id)a5;
- (id)targetViewForSpringLoadingEffectForView:(id)a3;
- (void)_setupSpringLoadingSupport;
- (void)viewDidLoad;
@end

@implementation SBGridSwitcherViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBGridSwitcherViewController;
  [(SBFluidSwitcherViewController *)&v3 viewDidLoad];
  [(SBGridSwitcherViewController *)self _setupSpringLoadingSupport];
}

- (void)_setupSpringLoadingSupport
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA5FE8]);
  id v4 = objc_alloc_init(MEMORY[0x1E4FA5FF0]);
  [v3 setDelegate:self];
  [v4 setDelegate:self];
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F42E10]);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __58__SBGridSwitcherViewController__setupSpringLoadingSupport__block_invoke;
  v11 = &unk_1E6B0C680;
  objc_copyWeak(&v12, &location);
  v6 = (void *)[v5 initWithInteractionBehavior:v3 interactionEffect:v4 activationHandler:&v8];
  v7 = [(SBFluidSwitcherViewController *)self contentView];
  [v7 addInteraction:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __58__SBGridSwitcherViewController__setupSpringLoadingSupport__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [v4 targetItem];

  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  [WeakRetained didSelectContainer:v9 modifierFlags:0];
}

- (id)targetItemForSpringLoadingInteractionInView:(id)a3 atLocation:(CGPoint)a4 forDropSession:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(SBFluidSwitcherViewController *)self layoutContext];
  v10 = [v9 activeGesture];

  v11 = [v10 gestureEvent];
  uint64_t v12 = objc_opt_class();
  id v13 = v11;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  id v15 = v14;

  int v16 = [v15 isSwitcherDrag];
  if (v16)
  {
    v17 = SBLogAppSwitcherDrag();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v10;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_INFO, "Not spring-loading because of active gesture: %@", buf, 0xCu);
    }
LABEL_27:

    int v26 = 0;
  }
  else
  {

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v10 = [v8 items];
    uint64_t v18 = [v10 countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v57;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v57 != v20) {
            objc_enumerationMutation(v10);
          }
          v22 = [*(id *)(*((void *)&v56 + 1) + 8 * i) localObject];
          uint64_t v23 = objc_opt_class();
          id v24 = v22;
          if (v23)
          {
            if (objc_opt_isKindOfClass()) {
              v25 = v24;
            }
            else {
              v25 = 0;
            }
          }
          else
          {
            v25 = 0;
          }
          v17 = v25;

          if (v17 && [v17 startLocation] == 11)
          {
            v27 = SBLogAppSwitcherDrag();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v17;
              _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_INFO, "Not spring-loading because dragged items came from switcher: %@", buf, 0xCu);
            }

            goto LABEL_27;
          }
        }
        uint64_t v19 = [v10 countByEnumeratingWithState:&v56 objects:v66 count:16];
        int v26 = 1;
        if (v19) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v26 = 1;
    }
  }

  unint64_t v28 = [(SBFluidSwitcherViewController *)self _windowManagementStyle];
  v29 = [(SBFluidSwitcherViewController *)self layoutContext];
  v30 = [v29 layoutState];

  uint64_t v31 = [v30 unlockedEnvironmentMode];
  unint64_t v32 = v31;
  if (!v26) {
    goto LABEL_36;
  }
  unint64_t v33 = v31 & 0xFFFFFFFFFFFFFFFELL;
  if (v28 != 2) {
    unint64_t v33 = v31;
  }
  if (v33 != 2)
  {
    v35 = SBLogAppSwitcherDrag();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = SBStringForUnlockedEnvironmentMode(v32);
      *(_DWORD *)buf = 138412546;
      v63 = v36;
      __int16 v64 = 1024;
      BOOL v65 = v28 == 2;
      _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_INFO, "Not spring-loading for unlockedEnvironmentMode: %@, with chamoisIsEnabled: %d", buf, 0x12u);
    }
LABEL_36:
    int v34 = 0;
    goto LABEL_37;
  }
  int v34 = 1;
LABEL_37:
  v37 = -[SBFluidSwitcherViewController _itemContainerAtLocation:environment:](self, "_itemContainerAtLocation:environment:", 0, x, y);
  uint64_t v38 = [v37 appLayout];
  v39 = (void *)v38;
  id v40 = 0;
  if (v37 && v38)
  {
    [v37 killingProgress];
    if (!BSFloatIsZero() || [v39 type])
    {
      id v40 = 0;
      goto LABEL_42;
    }
    id v43 = [MEMORY[0x1E4FA6430] draggedItemBundleIdentifiersInDrag:v8];
    uint64_t v44 = [v43 count];
    if (v44 != 1)
    {
      if (!v44 && ([v37 isEligibleForContentDragSpringLoading] & 1) != 0) {
        goto LABEL_61;
      }
LABEL_59:
      id v40 = 0;
LABEL_63:

      goto LABEL_42;
    }
    v45 = [v43 firstObject];
    if (!v34)
    {
      id v40 = 0;
LABEL_62:

      goto LABEL_63;
    }
    if ([v39 containsItemWithBundleIdentifier:v45])
    {
      v46 = +[SBApplicationController sharedInstance];
      v55 = [v46 applicationWithBundleIdentifier:v45];

      v47 = [v55 info];
      int v48 = [v47 supportsMultiwindow];

      if (!v48 || v28 != 2 || v32 != 3)
      {

        if (!v48) {
          goto LABEL_59;
        }
LABEL_61:
        id v40 = v37;

        uint64_t v60 = *MEMORY[0x1E4FA74D8];
        v61 = &unk_1F334B558;
        v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        v54 = (void *)MEMORY[0x1E4FA5E78];
        id v43 = v53;
        v45 = [v54 sharedInstance];
        [v45 emitEvent:31 withPayload:v43];

        goto LABEL_62;
      }
    }
    else if (v28 != 2 || v32 != 3)
    {

      goto LABEL_61;
    }
    v49 = [v30 appLayout];
    uint64_t v50 = [v49 zOrderedItems];
    v51 = [(id)v50 firstObject];

    v52 = [v39 itemForLayoutRole:1];
    LOBYTE(v50) = [v51 isEqual:v52];

    if (v50) {
      goto LABEL_59;
    }
    goto LABEL_61;
  }
LABEL_42:
  id v41 = v40;

  return v41;
}

- (id)targetViewForSpringLoadingEffectForView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 _springLoadingEffectTargetView];

  return v8;
}

@end