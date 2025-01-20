@interface SBSwitcherShelfViewController
- (BOOL)_dismissShelfIfNeededWithLocation:(CGPoint)a3 window:(id)a4;
- (BOOL)isPresentingOrDismissing;
- (BOOL)presented;
- (BOOL)switcherContentController:(id)a3 shouldSkipNonAnimatedLayoutPassAfterTransition:(id)a4;
- (BOOL)switcherContentController:(id)a3 supportsTitleItemsForAppLayout:(id)a4;
- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4;
- (CGRect)_frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4;
- (CGRect)_frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4;
- (CGRect)_frameForItemWithRole:(int64_t)a3 inMainAppLayout:(id)a4 interfaceOrientation:(int64_t)a5;
- (CGRect)itemFrameForAppLayout:(id)a3;
- (CGRect)presentationTargetFrame;
- (CGRect)switcherContentController:(id)a3 frameForCenterItemWithConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5;
- (CGRect)switcherContentController:(id)a3 frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a4 floatingConfiguration:(int64_t)a5;
- (CGRect)switcherContentController:(id)a3 frameForItemWithRole:(int64_t)a4 inMainAppLayout:(id)a5 interfaceOrientation:(int64_t)a6;
- (NSArray)appLayouts;
- (NSSet)focusedDisplayItems;
- (NSSet)ignoredDisplayItems;
- (SBPortalView)homeAffordancePortalView;
- (SBSwitcherShelf)shelf;
- (SBSwitcherShelfViewController)initWithShelf:(id)a3 dataSource:(id)a4 delegate:(id)a5;
- (SBSwitcherShelfViewControllerDataSource)dataSource;
- (SBSwitcherShelfViewControllerDelegate)delegate;
- (double)itemCornerRadiusForAppLayout:(id)a3;
- (double)itemScaleForAppLayout:(id)a3;
- (id)_appLayouts;
- (id)_transitionEventForContext:(id)a3 identifier:(id)a4 phase:(unint64_t)a5 animated:(BOOL)a6;
- (id)_windowScene;
- (id)appLayoutsForSwitcherContentController:(id)a3;
- (id)beginHidingAppLayout:(id)a3 forReason:(id)a4;
- (id)shelfLiveContentOverlayCoordinator:(id)a3 liveViewForAppLayout:(id)a4;
- (id)shelfLiveContentOverlayCoordinatorAppLayouts:(id)a3;
- (id)shelfLiveContentOverlayCoordinatorSnapshotCache:(id)a3;
- (id)switcherContentController:(id)a3 transitionEventForContext:(id)a4 identifier:(id)a5 phase:(unint64_t)a6 animated:(BOOL)a7;
- (int64_t)activeInterfaceOrientationForSwitcherContentController:(id)a3;
- (int64_t)contentOrientation;
- (int64_t)nextDisplayItemInteractionTimeForSwitcherContentController:(id)a3;
- (int64_t)switcherInterfaceOrientationForSwitcherContentController:(id)a3;
- (unint64_t)animationStyle;
- (unint64_t)contentOptions;
- (unint64_t)windowManagementStyleForSwitcherContentController:(id)a3;
- (void)_dockHeightWillChange:(id)a3;
- (void)_performNewWindowRequestForBundleIdentifier:(id)a3;
- (void)_performSwitcherTransitionRequest:(id)a3;
- (void)_rebuildCachedAppLayouts;
- (void)assistantWillAppear:(id)a3 windowScene:(id)a4;
- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)dismissShelfForAccessibilityTransition;
- (void)dismissShelfForShelfTransition;
- (void)dismissShelfWithTransitionSource:(int64_t)a3;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4;
- (void)loadView;
- (void)performKeyboardShortcutAction:(int64_t)a3;
- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setContentOptions:(unint64_t)a3;
- (void)setContentOrientation:(int64_t)a3;
- (void)setFocusedDisplayItems:(id)a3;
- (void)setHomeAffordancePortalView:(id)a3;
- (void)setIgnoredDisplayItems:(id)a3;
- (void)setPresented:(BOOL)a3 withTargetFrame:(CGRect)a4 style:(unint64_t)a5 completion:(id)a6;
- (void)switcherContentController:(id)a3 deletedDisplayItem:(id)a4 inAppLayout:(id)a5 forReason:(int64_t)a6;
- (void)switcherContentController:(id)a3 performTransitionWithRequest:(id)a4 gestureInitiated:(BOOL)a5;
- (void)switcherContentController:(id)a3 requestNewWindowForBundleIdentifier:(id)a4;
- (void)switcherContentController:(id)a3 setContentOrientation:(int64_t)a4;
- (void)transientUI:(id)a3 wasIndirectPannedToDismissFromGestureRecognizer:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SBSwitcherShelfViewController

- (SBSwitcherShelfViewController)initWithShelf:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)SBSwitcherShelfViewController;
  v12 = [(SBSwitcherShelfViewController *)&v28 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shelf, a3);
    objc_storeWeak((id *)&v13->_dataSource, v10);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = SBAppLayoutGenericAppLayoutWithConfiguration(3);
    [v10 switcherShelfViewController:v13 frameForItemWithRole:1 inMainAppLayout:v14 interfaceOrientation:3];
    v13->_halfHalfSize.width = v15;
    v13->_halfHalfSize.height = v16;

    v17 = objc_alloc_init(SBShelfRootSwitcherModifier);
    rootModifier = v13->_rootModifier;
    v13->_rootModifier = v17;

    [(SBShelfRootSwitcherModifier *)v13->_rootModifier setDisplayMode:[(SBSwitcherShelf *)v13->_shelf displayMode]];
    v19 = [[SBShelfLiveContentOverlayCoordinator alloc] initWithShelfDelegate:v13];
    liveContentOverlayCoordinator = v13->_liveContentOverlayCoordinator;
    v13->_liveContentOverlayCoordinator = v19;

    v21 = [[SBFluidSwitcherViewController alloc] initWithRootModifier:v13->_rootModifier liveContentOverlayCoordinator:v13->_liveContentOverlayCoordinator dataSource:v13 delegate:v13 debugName:@"Shelf"];
    contentViewController = v13->_contentViewController;
    v13->_contentViewController = v21;

    v23 = +[SBAssistantController sharedInstance];
    [v23 addObserver:v13];

    id v24 = objc_alloc_init(MEMORY[0x1E4F4E708]);
    [v24 setIdentifier:@"com.apple.SpringBoard.SwitcherShelfViewController"];
    [v24 setEventMask:4];
    [v24 setAttentionLostTimeout:0.0];
    v25 = objc_alloc_init(SBAttentionAwarenessClient);
    idleTouchAwarenessClient = v13->_idleTouchAwarenessClient;
    v13->_idleTouchAwarenessClient = v25;

    [(SBAttentionAwarenessClient *)v13->_idleTouchAwarenessClient setConfiguration:v24];
    [(SBAttentionAwarenessClient *)v13->_idleTouchAwarenessClient setDelegate:v13];
  }
  return v13;
}

- (void)dealloc
{
  v3 = +[SBAssistantController sharedInstance];
  [v3 removeObserver:self];

  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:0];
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setDelegate:0];
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient invalidate];
  [(SBFluidSwitcherViewController *)self->_contentViewController invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherShelfViewController;
  [(SBSwitcherShelfViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = [SBSwitcherShelfView alloc];
  objc_super v4 = -[SBSwitcherShelfView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBSwitcherShelfViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherShelfViewController;
  [(SBSwitcherShelfViewController *)&v4 viewDidLoad];
  [(SBSwitcherShelfViewController *)self bs_addChildViewController:self->_contentViewController];
  [(SBSwitcherShelfViewController *)self _rebuildCachedAppLayouts];
  if (!self->_activePresentationAndDismissalAnimations && !self->_presented)
  {
    v3 = [(SBFluidSwitcherViewController *)self->_contentViewController view];
    [v3 setHidden:1];
  }
}

- (void)viewWillLayoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)SBSwitcherShelfViewController;
  [(SBSwitcherShelfViewController *)&v39 viewWillLayoutSubviews];
  v3 = [(SBSwitcherShelfViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  UIRectGetCenter();
  double v13 = v12;
  double v15 = v14;
  CGFloat v16 = [(SBFluidSwitcherViewController *)self->_contentViewController view];
  objc_msgSend(v16, "setBounds:", v5, v7, v9, v11);

  v17 = [(SBFluidSwitcherViewController *)self->_contentViewController view];
  objc_msgSend(v17, "setCenter:", v13, v15);

  homeAffordancePortalView = self->_homeAffordancePortalView;
  if (homeAffordancePortalView)
  {
    v19 = [(SBPortalView *)homeAffordancePortalView sourceView];
    v20 = v19;
    if (v19)
    {
      [v19 bounds];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      [v20 center];
      double v30 = v29;
      double v32 = v31;
      v33 = [(SBSwitcherShelfViewController *)self view];
      objc_msgSend(v20, "convertPoint:toView:", v33, v30, v32);
      double v35 = v34;
      double v37 = v36;

      -[SBPortalView setBounds:](self->_homeAffordancePortalView, "setBounds:", v22, v24, v26, v28);
      -[SBPortalView setCenter:](self->_homeAffordancePortalView, "setCenter:", v35, v37);
    }
    v38 = [(SBSwitcherShelfViewController *)self view];
    [v38 bringSubviewToFront:self->_homeAffordancePortalView];
  }
}

- (void)viewDidLayoutSubviews
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SBSwitcherShelfViewController;
  [(SBSwitcherShelfViewController *)&v9 viewDidLayoutSubviews];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v10 = @"SBSwitcherShelfHeight";
  double v4 = NSNumber;
  double v5 = [(SBSwitcherShelfViewController *)self view];
  [v5 bounds];
  double v7 = [v4 numberWithDouble:v6];
  v11[0] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v3 postNotificationName:@"SBSwitcherShelfHeightDidChangeNotification" object:self userInfo:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherShelfViewController;
  [(SBSwitcherShelfViewController *)&v7 viewWillAppear:a3];
  double v4 = [(SBSwitcherShelfViewController *)self _windowScene];
  double v5 = [v4 transientUIInteractionManager];

  [v5 registerParticipantForTapToDismiss:self];
  [v5 registerParticipantForIndirectPanToDismiss:self];
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:1];
  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__dockHeightWillChange_ name:@"SBFloatingDockControllerHeightWillChangeNotification" object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SBSwitcherShelfViewController;
  [(SBSwitcherShelfViewController *)&v9 viewWillDisappear:a3];
  double v4 = [(SBSwitcherShelfViewController *)self _windowScene];
  double v5 = [v4 transientUIInteractionManager];

  [v5 unregisterParticipantForTapToDismiss:self];
  [v5 unregisterParticipantForIndirectPanToDismiss:self];
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:0];
  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v10 = @"SBSwitcherShelfHeight";
  v11[0] = &unk_1F334B708;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v6 postNotificationName:@"SBSwitcherShelfHeightDidChangeNotification" object:self userInfo:v7];

  double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self];
}

- (BOOL)isPresentingOrDismissing
{
  return self->_activePresentationAndDismissalAnimations != 0;
}

- (void)setContentOptions:(unint64_t)a3
{
  if (self->_contentOptions != a3)
  {
    self->_contentOptions = a3;
    [(SBSwitcherShelfViewController *)self _rebuildCachedAppLayouts];
  }
}

- (void)setIgnoredDisplayItems:(id)a3
{
  id v6 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    double v4 = (NSSet *)[v6 copy];
    ignoredDisplayItems = self->_ignoredDisplayItems;
    self->_ignoredDisplayItems = v4;

    [(SBSwitcherShelfViewController *)self _rebuildCachedAppLayouts];
  }
}

- (void)setContentOrientation:(int64_t)a3
{
  int64_t v3 = a3;
  if ((unint64_t)(a3 - 1) <= 1 && [(SBSwitcherShelf *)self->_shelf displayMode] == 1) {
    int64_t v3 = 3;
  }
  if (v3 != self->_contentOrientation)
  {
    self->_contentOrientation = v3;
    [(SBFluidSwitcherViewController *)self->_contentViewController setContentOrientation:v3];
    id v5 = [(SBSwitcherShelfViewController *)self view];
    [v5 setNeedsLayout];
  }
}

- (NSSet)focusedDisplayItems
{
  return (NSSet *)[(SBFluidSwitcherViewController *)self->_contentViewController shelfFocusedDisplayItems];
}

- (void)setFocusedDisplayItems:(id)a3
{
}

- (void)_rebuildCachedAppLayouts
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  if (!self->_shelf) {
    return;
  }
  v2 = self;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v4 = [(SBSwitcherShelfViewController *)v2 _appLayouts];
  id v5 = objc_opt_new();
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v120 objects:v133 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v121;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v121 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v120 + 1) + 8 * i);
        if (([v11 containsAnyItemFromSet:v5] & 1) == 0)
        {
          [v3 addObject:v11];
          double v12 = [v11 allItems];
          [v5 addObjectsFromArray:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v120 objects:v133 count:16];
    }
    while (v8);
  }

  id v90 = (id)objc_opt_new();
  uint64_t v13 = [(SBSwitcherShelf *)v2->_shelf displayMode];
  v91 = v2;
  if (v13)
  {
    if (v13 == 1)
    {
      unint64_t contentOptions = v2->_contentOptions;
      id v87 = v6;
      v79 = v5;
      id v80 = v3;
      if ((contentOptions & 2) != 0)
      {
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id obj = v3;
        id v85 = (id)[obj countByEnumeratingWithState:&v104 objects:v129 count:16];
        if (v85)
        {
          uint64_t v83 = *(void *)v105;
          do
          {
            for (j = 0; j != v85; j = (char *)j + 1)
            {
              if (*(void *)v105 != v83) {
                objc_enumerationMutation(obj);
              }
              CGFloat v16 = *(void **)(*((void *)&v104 + 1) + 8 * (void)j);
              if ([v16 environment] == 1 || objc_msgSend(v16, "environment") == 2)
              {
                v88 = j;
                long long v102 = 0u;
                long long v103 = 0u;
                long long v100 = 0u;
                long long v101 = 0u;
                v17 = [v16 leafAppLayouts];
                uint64_t v18 = [v17 countByEnumeratingWithState:&v100 objects:v128 count:16];
                if (v18)
                {
                  uint64_t v19 = v18;
                  uint64_t v20 = *(void *)v101;
                  do
                  {
                    for (uint64_t k = 0; k != v19; ++k)
                    {
                      if (*(void *)v101 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      double v22 = *(void **)(*((void *)&v100 + 1) + 8 * k);
                      double v23 = [v22 allItems];
                      double v24 = [v23 firstObject];
                      double v25 = [v24 bundleIdentifier];
                      double v26 = [(SBSwitcherShelf *)v2->_shelf bundleIdentifier];
                      int v27 = [v25 isEqual:v26];

                      v2 = v91;
                      if (v27 && ([v22 containsAnyItemFromSet:v91->_ignoredDisplayItems] & 1) == 0) {
                        [v90 addObject:v22];
                      }
                    }
                    uint64_t v19 = [v17 countByEnumeratingWithState:&v100 objects:v128 count:16];
                  }
                  while (v19);
                }

                id v6 = v87;
                j = v88;
              }
            }
            id v85 = (id)[obj countByEnumeratingWithState:&v104 objects:v129 count:16];
          }
          while (v85);
        }

        id v3 = v80;
        unint64_t contentOptions = v2->_contentOptions;
        id v5 = v79;
      }
      if (contentOptions)
      {
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v86 = v3;
        uint64_t v28 = [v86 countByEnumeratingWithState:&v96 objects:v127 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          id v30 = *(id *)v97;
          id obja = *(id *)v97;
          do
          {
            uint64_t v31 = 0;
            uint64_t v84 = v29;
            do
            {
              if (*(id *)v97 != v30) {
                objc_enumerationMutation(v86);
              }
              double v32 = *(void **)(*((void *)&v96 + 1) + 8 * v31);
              if ([v32 environment] == 3)
              {
                uint64_t v89 = v31;
                long long v94 = 0u;
                long long v95 = 0u;
                long long v92 = 0u;
                long long v93 = 0u;
                v33 = [v32 leafAppLayouts];
                uint64_t v34 = [v33 countByEnumeratingWithState:&v92 objects:v126 count:16];
                if (v34)
                {
                  uint64_t v35 = v34;
                  uint64_t v36 = *(void *)v93;
                  do
                  {
                    for (uint64_t m = 0; m != v35; ++m)
                    {
                      if (*(void *)v93 != v36) {
                        objc_enumerationMutation(v33);
                      }
                      v38 = *(void **)(*((void *)&v92 + 1) + 8 * m);
                      objc_super v39 = [v38 allItems];
                      v40 = [v39 firstObject];
                      v41 = [v40 bundleIdentifier];
                      v42 = [(SBSwitcherShelf *)v2->_shelf bundleIdentifier];
                      int v43 = [v41 isEqual:v42];

                      if (v43 && ([v38 containsAnyItemFromSet:v91->_ignoredDisplayItems] & 1) == 0) {
                        [v90 addObject:v38];
                      }
                      v2 = v91;
                    }
                    uint64_t v35 = [v33 countByEnumeratingWithState:&v92 objects:v126 count:16];
                  }
                  while (v35);
                }

                id v6 = v87;
                uint64_t v31 = v89;
                id v30 = obja;
                uint64_t v29 = v84;
              }
              ++v31;
            }
            while (v31 != v29);
            uint64_t v29 = [v86 countByEnumeratingWithState:&v96 objects:v127 count:16];
          }
          while (v29);
        }

        id v5 = v79;
        id v3 = v80;
      }
    }
    goto LABEL_94;
  }
  unint64_t v44 = v2->_contentOptions;
  if ((v44 & 2) == 0)
  {
    if ((v44 & 1) == 0) {
      goto LABEL_58;
    }
LABEL_72:
    v52 = v5;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v53 = v3;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v112 objects:v131 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v113;
      do
      {
        for (uint64_t n = 0; n != v55; ++n)
        {
          if (*(void *)v113 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = *(void **)(*((void *)&v112 + 1) + 8 * n);
          if ([v58 environment] == 3
            && ([v58 containsAnyItemFromSet:v91->_ignoredDisplayItems] & 1) == 0)
          {
            [v90 addObject:v58];
          }
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v112 objects:v131 count:16];
      }
      while (v55);
    }

    v2 = v91;
    id v5 = v52;
    if ((v91->_contentOptions & 2) == 0) {
      goto LABEL_94;
    }
    goto LABEL_83;
  }
  v45 = v5;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v46 = v3;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v116 objects:v132 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v117;
    do
    {
      for (iuint64_t i = 0; ii != v48; ++ii)
      {
        if (*(void *)v117 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = *(void **)(*((void *)&v116 + 1) + 8 * ii);
        if ([v51 environment] == 1
          && ([v51 containsAnyItemFromSet:v91->_ignoredDisplayItems] & 1) == 0)
        {
          [v90 addObject:v51];
        }
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v116 objects:v132 count:16];
    }
    while (v48);
  }

  v2 = v91;
  unint64_t v44 = v91->_contentOptions;
  id v5 = v45;
  if (v44) {
    goto LABEL_72;
  }
LABEL_58:
  if ((v44 & 2) != 0)
  {
LABEL_83:
    v59 = v5;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v60 = v3;
    uint64_t v61 = [v60 countByEnumeratingWithState:&v108 objects:v130 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v109;
      do
      {
        for (uint64_t jj = 0; jj != v62; ++jj)
        {
          if (*(void *)v109 != v63) {
            objc_enumerationMutation(v60);
          }
          v65 = *(void **)(*((void *)&v108 + 1) + 8 * jj);
          if ([v65 environment] == 2
            && ([v65 containsAnyItemFromSet:v91->_ignoredDisplayItems] & 1) == 0)
          {
            [v90 addObject:v65];
          }
        }
        uint64_t v62 = [v60 countByEnumeratingWithState:&v108 objects:v130 count:16];
      }
      while (v62);
    }

    v2 = v91;
    id v5 = v59;
  }
LABEL_94:
  if ((v2->_contentOptions & 4) != 0)
  {
    v66 = [SBDisplayItem alloc];
    v67 = [(SBSwitcherShelf *)v2->_shelf bundleIdentifier];
    v68 = [(SBDisplayItem *)v66 initWithType:6 bundleIdentifier:v67 uniqueIdentifier:&stru_1F3084718];

    v69 = [(UIViewController *)v2 _sbWindowScene];
    v70 = [v69 layoutStateProvider];
    v71 = [v70 layoutState];
    uint64_t v72 = [v71 displayOrdinal];

    v73 = [SBAppLayout alloc];
    v74 = [NSNumber numberWithInteger:1];
    v124 = v74;
    v125 = v68;
    v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
    uint64_t v76 = v72;
    v2 = v91;
    v77 = [(SBAppLayout *)v73 initWithItemsForLayoutRoles:v75 configuration:1 environment:1 preferredDisplayOrdinal:v76];

    [v90 insertObject:v77 atIndex:0];
  }
  objc_storeStrong((id *)&v2->_appLayouts, v90);
  v78 = [(SBFluidSwitcherViewController *)v2->_contentViewController viewIfLoaded];

  if (v78) {
    [(SBFluidSwitcherViewController *)v2->_contentViewController noteAppLayoutsDidChange];
  }
}

- (void)setPresented:(BOOL)a3 withTargetFrame:(CGRect)a4 style:(unint64_t)a5 completion:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  BOOL v11 = a3;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  double v14 = v13;
  if (self->_presented == v11)
  {
    if (v13) {
      (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 1, 0);
    }
  }
  else
  {
    self->_presented = v11;
    self->_presentationTargetFrame.origin.CGFloat x = x;
    self->_presentationTargetFrame.origin.CGFloat y = y;
    self->_presentationTargetFrame.size.CGFloat width = width;
    self->_presentationTargetFrame.size.CGFloat height = height;
    self->_animationStyle = a5;
    if (self->_presented)
    {
      double v15 = [(SBFluidSwitcherViewController *)self->_contentViewController view];
      [v15 setHidden:0];
    }
    else
    {
      CGFloat v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v31 = @"SBSwitcherShelfHeight";
      v32[0] = &unk_1F334B708;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      [v16 postNotificationName:@"SBSwitcherShelfHeightDidChangeNotification" object:self userInfo:v17];
    }
    if (v11) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = 2;
    }
    [(SBShelfRootSwitcherModifier *)self->_rootModifier setAppearanceState:v18];
    -[SBShelfRootSwitcherModifier setTargetFrame:](self->_rootModifier, "setTargetFrame:", self->_presentationTargetFrame.origin.x, self->_presentationTargetFrame.origin.y, self->_presentationTargetFrame.size.width, self->_presentationTargetFrame.size.height);
    [(SBShelfRootSwitcherModifier *)self->_rootModifier setAnimationStyle:self->_animationStyle];
    uint64_t v19 = +[SBWorkspace mainWorkspace];
    uint64_t v20 = [v19 createRequestWithOptions:0];

    [v20 finalize];
    ++self->_activePresentationAndDismissalAnimations;
    objc_initWeak(&location, self);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    double v26 = __79__SBSwitcherShelfViewController_setPresented_withTargetFrame_style_completion___block_invoke;
    int v27 = &unk_1E6AF7498;
    objc_copyWeak(&v29, &location);
    id v28 = v14;
    double v21 = (void *)MEMORY[0x1D948C7A0](&v24);
    contentViewController = self->_contentViewController;
    double v23 = objc_msgSend(v20, "applicationContext", v24, v25, v26, v27);
    [(SBFluidSwitcherViewController *)contentViewController performTransitionWithContext:v23 animated:1 completion:v21];

    [(SBShelfRootSwitcherModifier *)self->_rootModifier setAppearanceState:0];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
}

uint64_t __79__SBSwitcherShelfViewController_setPresented_withTargetFrame_style_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (uint64_t)WeakRetained[129] - 1;
    WeakRetained[129] = (id)v6;
    if (!v6)
    {
      int v7 = *((unsigned __int8 *)WeakRetained + 1040);
      id v13 = (unsigned __int8 *)WeakRetained;
      if (!*((unsigned char *)WeakRetained + 1040))
      {
        uint64_t v8 = [WeakRetained[122] view];
        [v8 setHidden:1];

        id v5 = (id *)v13;
      }
      BOOL v9 = v7 != 0;
      id v10 = objc_loadWeakRetained(v5 + 133);
      [v10 switcherShelfViewController:v13 didFinishPresentation:v9];
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, void))(v11 + 16))(v11, a2, 0);
  }
  return MEMORY[0x1F4181820]();
}

- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  int v7 = (void (**)(id, uint64_t, void))a5;
  uint64_t v8 = [a3 request];
  BOOL v9 = [v8 applicationContext];
  id v10 = [v9 layoutState];

  if ([(SBSwitcherShelf *)self->_shelf displayMode])
  {
    if ([(SBSwitcherShelf *)self->_shelf displayMode] != 1
      || [(SBSwitcherShelf *)self->_shelf layoutRole] != 3)
    {
      double v12 = [v10 appLayout];
      id v13 = objc_msgSend(v12, "leafAppLayoutForRole:", -[SBSwitcherShelf layoutRole](self->_shelf, "layoutRole"));

      if (!v13) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v11 = [v10 floatingAppLayout];
  }
  else
  {
    uint64_t v11 = [v10 appLayout];
  }
  id v13 = (void *)v11;
  if (!v11)
  {
LABEL_10:
    if (v7) {
      v7[2](v7, 1, 0);
    }
    id v14 = 0;
    goto LABEL_20;
  }
LABEL_9:
  if ([(NSArray *)self->_appLayouts containsObject:v13]) {
    goto LABEL_10;
  }
  uint64_t v34 = v8;
  id v14 = v13;
  unint64_t v15 = (self->_contentOptions >> 2) & 1;
  contentViewController = self->_contentViewController;
  v42[0] = v14;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:v15];
  v41 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  uint64_t v20 = [(SBFluidSwitcherViewController *)contentViewController shouldAnimateInsertionOfAppLayouts:v17 atIndexes:v19];

  if (v20)
  {
    double v32 = self->_contentViewController;
    id v40 = v14;
    double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    double v22 = [NSNumber numberWithUnsignedInteger:v15];
    objc_super v39 = v22;
    double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    [(SBFluidSwitcherViewController *)v32 prepareAnimatedInsertionOfAppLayouts:v21 atIndexes:v23];
  }
  [(SBSwitcherShelfViewController *)self _rebuildCachedAppLayouts];
  uint64_t v24 = self->_contentViewController;
  id v38 = v14;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  unint64_t v33 = v15;
  double v26 = [NSNumber numberWithUnsignedInteger:v15];
  double v37 = v26;
  int v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  [(SBFluidSwitcherViewController *)v24 noteModelDidMutateForInsertionOfAppLayouts:v25 atIndexes:v27 willAnimate:v20];

  if (v20)
  {
    id v28 = self->_contentViewController;
    id v36 = v14;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    id v30 = [NSNumber numberWithUnsignedInteger:v33];
    uint64_t v35 = v30;
    uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    [(SBFluidSwitcherViewController *)v28 performAnimatedInsertionOfAppLayouts:v29 atIndexes:v31 completion:v7];
  }
  else if (v7)
  {
    v7[2](v7, 1, 0);
  }
  uint64_t v8 = v34;
LABEL_20:
}

- (void)performKeyboardShortcutAction:(int64_t)a3
{
  if (a3 == 3) {
    [(SBSwitcherShelfViewController *)self dismissShelfForShelfTransition];
  }
}

- (id)beginHidingAppLayout:(id)a3 forReason:(id)a4
{
  return [(SBFluidSwitcherViewController *)self->_contentViewController beginHidingAppLayout:a3 forReason:a4];
}

- (CGRect)itemFrameForAppLayout:(id)a3
{
  [(SBFluidSwitcherViewController *)self->_contentViewController completedTransitionFrameForAppLayout:a3];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (double)itemScaleForAppLayout:(id)a3
{
  [(SBFluidSwitcherViewController *)self->_contentViewController scaleForAppLayout:a3];
  return result;
}

- (double)itemCornerRadiusForAppLayout:(id)a3
{
  [(SBFluidSwitcherViewController *)self->_contentViewController cornerRadiusForAppLayout:a3];
  return result;
}

- (void)setHomeAffordancePortalView:(id)a3
{
  double v5 = (SBPortalView *)a3;
  p_homeAffordancePortalView = (id *)&self->_homeAffordancePortalView;
  homeAffordancePortalView = self->_homeAffordancePortalView;
  uint64_t v11 = v5;
  if (homeAffordancePortalView != v5)
  {
    if (homeAffordancePortalView)
    {
      [(SBPortalView *)homeAffordancePortalView removeFromSuperview];
      id v8 = *p_homeAffordancePortalView;
      id *p_homeAffordancePortalView = 0;
    }
    objc_storeStrong((id *)&self->_homeAffordancePortalView, a3);
    if (*p_homeAffordancePortalView)
    {
      [*p_homeAffordancePortalView setPassesTouchesThrough:1];
      BOOL v9 = [(SBSwitcherShelfViewController *)self view];
      [v9 addSubview:*p_homeAffordancePortalView];

      id v10 = [(SBSwitcherShelfViewController *)self view];
      [v10 setNeedsLayout];
    }
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(SBFluidSwitcherViewController *)self->_contentViewController layoutStateTransitionCoordinator:v7 transitionDidBeginWithTransitionContext:v6];
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(SBFluidSwitcherViewController *)self->_contentViewController layoutStateTransitionCoordinator:v7 transitionWillEndWithTransitionContext:v6];
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(SBFluidSwitcherViewController *)self->_contentViewController layoutStateTransitionCoordinator:v7 transitionDidEndWithTransitionContext:v6];
  }
}

- (id)appLayoutsForSwitcherContentController:(id)a3
{
  return self->_appLayouts;
}

- (int64_t)nextDisplayItemInteractionTimeForSwitcherContentController:(id)a3
{
  double v4 = [(SBSwitcherShelfViewController *)self dataSource];
  int64_t v5 = [v4 nextDisplayItemInteractionTimeForSwitcherShelfViewController:self];

  return v5;
}

- (int64_t)switcherInterfaceOrientationForSwitcherContentController:(id)a3
{
  return self->_contentOrientation;
}

- (int64_t)activeInterfaceOrientationForSwitcherContentController:(id)a3
{
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation", a3);
}

- (CGRect)switcherContentController:(id)a3 frameForItemWithRole:(int64_t)a4 inMainAppLayout:(id)a5 interfaceOrientation:(int64_t)a6
{
  id v13 = a5;
  unint64_t v14 = [(SBSwitcherShelf *)self->_shelf displayMode];
  if (v14 == 1)
  {
    SBRectWithSize();
    goto LABEL_5;
  }
  if (!v14)
  {
    [(SBSwitcherShelfViewController *)self _frameForItemWithRole:a4 inMainAppLayout:v13 interfaceOrientation:a6];
LABEL_5:
    double v6 = v15;
    double v7 = v16;
    double v8 = v17;
    double v9 = v18;
  }

  double v19 = v6;
  double v20 = v7;
  double v21 = v8;
  double v22 = v9;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (id)switcherContentController:(id)a3 transitionEventForContext:(id)a4 identifier:(id)a5 phase:(unint64_t)a6 animated:(BOOL)a7
{
  return [(SBSwitcherShelfViewController *)self _transitionEventForContext:a4 identifier:a5 phase:a6 animated:a7];
}

- (CGRect)switcherContentController:(id)a3 frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a4 floatingConfiguration:(int64_t)a5
{
  unint64_t v8 = [(SBSwitcherShelf *)self->_shelf displayMode];
  if (v8 == 1)
  {
    SBRectWithSize();
  }
  else if (!v8)
  {
    [(SBSwitcherShelfViewController *)self _frameForFloatingAppLayoutInInterfaceOrientation:a4 floatingConfiguration:a5];
  }
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGRect)switcherContentController:(id)a3 frameForCenterItemWithConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5
{
  [(SBSwitcherShelfViewController *)self _frameForCenterItemWithConfiguration:a4 interfaceOrientation:a5];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (BOOL)switcherContentController:(id)a3 supportsTitleItemsForAppLayout:(id)a4
{
  id v4 = a4;
  if ([v4 type]) {
    BOOL v5 = [v4 type] == 5;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (unint64_t)windowManagementStyleForSwitcherContentController:(id)a3
{
  return 1;
}

- (void)switcherContentController:(id)a3 performTransitionWithRequest:(id)a4 gestureInitiated:(BOOL)a5
{
}

- (void)switcherContentController:(id)a3 deletedDisplayItem:(id)a4 inAppLayout:(id)a5 forReason:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 layoutRoleForItem:v9];
  contentViewController = self->_contentViewController;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __100__SBSwitcherShelfViewController_switcherContentController_deletedDisplayItem_inAppLayout_forReason___block_invoke;
  v14[3] = &unk_1E6AF6FC0;
  double v16 = self;
  int64_t v17 = a6;
  id v15 = v9;
  id v13 = v9;
  [(SBFluidSwitcherViewController *)contentViewController removeLayoutRole:v11 inSpace:v10 mutationBlock:v14 reason:a6];
}

void __100__SBSwitcherShelfViewController_switcherContentController_deletedDisplayItem_inAppLayout_forReason___block_invoke(uint64_t a1)
{
  id v2 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  [v2 _removeDisplayItem:*(void *)(a1 + 32) forReason:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) _rebuildCachedAppLayouts];
}

- (void)switcherContentController:(id)a3 setContentOrientation:(int64_t)a4
{
}

- (void)switcherContentController:(id)a3 requestNewWindowForBundleIdentifier:(id)a4
{
}

- (BOOL)switcherContentController:(id)a3 shouldSkipNonAnimatedLayoutPassAfterTransition:(id)a4
{
  return 1;
}

- (BOOL)_dismissShelfIfNeededWithLocation:(CGPoint)a3 window:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(SBSwitcherShelfViewController *)self view];
  id v9 = [v7 screen];
  id v10 = [v9 fixedCoordinateSpace];

  objc_msgSend(v7, "convertPoint:toCoordinateSpace:", v10, x, y);
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v10);
  uint64_t v11 = objc_msgSend(v8, "hitTest:withEvent:", 0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v13 = objc_msgSend(WeakRetained, "switcherShelfViewController:hitTestedToTopAffordance:window:", self, v7, x, y);

  if (v11)
  {
    unint64_t v14 = [(SBSwitcherShelfViewController *)self view];
    if (v11 == v14)
    {
      int v16 = 1;
    }
    else
    {
      id v15 = [(SBFluidSwitcherViewController *)self->_contentViewController view];
      int v16 = [v11 isDescendantOfView:v15] ^ 1;
    }
  }
  else
  {
    int v16 = 1;
  }
  if ((v16 & (v13 ^ 1)) == 1 && self->_presented) {
    [(SBSwitcherShelfViewController *)self dismissShelfForShelfTransition];
  }

  return v16 & (v13 ^ 1);
}

- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4
{
  id v5 = a3;
  double v6 = [v5 view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = [v5 window];
  double v12 = [v5 view];
  objc_msgSend(v11, "convertPoint:fromView:", v12, v8, v10);
  double v14 = v13;
  double v16 = v15;

  int64_t v17 = [v5 window];

  LOBYTE(self) = -[SBSwitcherShelfViewController _dismissShelfIfNeededWithLocation:window:](self, "_dismissShelfIfNeededWithLocation:window:", v17, v14, v16);
  return (char)self;
}

- (void)transientUI:(id)a3 wasIndirectPannedToDismissFromGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v6 view];
  [v6 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = [v7 window];
  double v14 = [v6 view];

  objc_msgSend(v13, "convertPoint:fromView:", v14, v10, v12);
  double v16 = v15;
  double v18 = v17;

  id v19 = [v7 window];

  -[SBSwitcherShelfViewController _dismissShelfIfNeededWithLocation:window:](self, "_dismissShelfIfNeededWithLocation:window:", v19, v16, v18);
}

- (id)shelfLiveContentOverlayCoordinatorAppLayouts:(id)a3
{
  return self->_appLayouts;
}

- (id)shelfLiveContentOverlayCoordinatorSnapshotCache:(id)a3
{
  return [(SBFluidSwitcherViewController *)self->_contentViewController snapshotCache];
}

- (id)shelfLiveContentOverlayCoordinator:(id)a3 liveViewForAppLayout:(id)a4
{
  id v5 = a4;
  id v6 = [(SBSwitcherShelfViewController *)self delegate];
  id v7 = [v6 switcherShelfViewController:self liveViewForAppLayout:v5];

  return v7;
}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  if (self->_presented) {
    [(SBSwitcherShelfViewController *)self dismissShelfForShelfTransition];
  }
}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  id v8 = +[SBWorkspace mainWorkspace];
  id v5 = [v8 keyboardFocusController];
  id v6 = [v5 externalSceneWithFocus];
  if (v6)
  {
    BOOL presented = self->_presented;

    if (presented)
    {
      [(SBSwitcherShelfViewController *)self dismissShelfForShelfTransition];
    }
  }
  else
  {
  }
}

- (id)_windowScene
{
  double v3 = [(SBSwitcherShelfViewController *)self dataSource];
  id v4 = [v3 windowSceneForSwitcherShelfViewController:self];

  return v4;
}

- (id)_appLayouts
{
  double v3 = [(SBSwitcherShelfViewController *)self dataSource];
  id v4 = [v3 appLayoutsForSwitcherShelfViewController:self];

  return v4;
}

- (CGRect)_frameForItemWithRole:(int64_t)a3 inMainAppLayout:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v8 = a4;
  double v9 = [(SBSwitcherShelfViewController *)self dataSource];
  [v9 switcherShelfViewController:self frameForItemWithRole:a3 inMainAppLayout:v8 interfaceOrientation:a5];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)_frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4
{
  id v7 = [(SBSwitcherShelfViewController *)self dataSource];
  [v7 switcherShelfViewController:self frameForFloatingAppLayoutInInterfaceOrientation:a3 floatingConfiguration:a4];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)_frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  id v7 = [(SBSwitcherShelfViewController *)self dataSource];
  [v7 switcherShelfViewController:self frameForCenterItemWithConfiguration:a3 interfaceOrientation:a4];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (id)_transitionEventForContext:(id)a3 identifier:(id)a4 phase:(unint64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a3;
  double v12 = [(SBSwitcherShelfViewController *)self dataSource];
  double v13 = [v12 switcherShelfViewController:self transitionEventForContext:v11 identifier:v10 phase:a5 animated:v6];

  return v13;
}

- (void)_performNewWindowRequestForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[SBApplicationController sharedInstance];
  BOOL v6 = [v5 applicationWithBundleIdentifier:v4];

  id v7 = +[SBWorkspace mainWorkspace];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke;
  v9[3] = &unk_1E6AF67B0;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  [v7 requestTransitionWithBuilder:v9];
}

void __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:35];
  [v3 setEventLabel:@"NewWindowRequest"];
  id v4 = +[SBDeviceApplicationSceneEntity newEntityWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke_2;
  v6[3] = &unk_1E6AF5638;
  v6[4] = *(void *)(a1 + 40);
  id v7 = v4;
  id v5 = v4;
  [v3 modifyApplicationContext:v6];
}

void __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 1048) displayMode])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke_3;
    v8[3] = &unk_1E6B00330;
    v8[4] = *(void *)(a1 + 32);
    id v4 = v3;
    id v9 = v4;
    id v10 = *(id *)(a1 + 40);
    SBLayoutRoleEnumerateValidRoles(v8);
    id v5 = [v4 previousLayoutState];
    objc_msgSend(v4, "setRequestedWindowPickerRole:", objc_msgSend(v5, "windowPickerRole"));
  }
  else
  {
    [v3 setActivatingEntity:*(void *)(a1 + 40)];
    BOOL v6 = [v3 previousLayoutState];
    id v7 = [v6 bundleIDShowingAppExpose];
    [v3 setRequestedAppExposeBundleID:v7];
  }
}

void __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1[4] + 1048) layoutRole];
  id v5 = (void *)a1[5];
  if (v4 == a2)
  {
    uint64_t v6 = a1[6];
    uint64_t v7 = [*(id *)(a1[4] + 1048) layoutRole];
    [v5 setEntity:v6 forLayoutRole:v7];
  }
  else
  {
    id v8 = +[SBWorkspaceEntity entity];
    [v5 setEntity:v8 forLayoutRole:a2];
  }
}

- (void)_performSwitcherTransitionRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[SBWorkspace mainWorkspace];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke;
  v7[3] = &unk_1E6AFF260;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 requestTransitionWithOptions:0 builder:0 validator:v7];
}

uint64_t __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  [v4 _configureRequest:v3 forSwitcherTransitionRequest:*(void *)(a1 + 32) withEventLabel:@"ShelfTransition"];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 1048) displayMode];
  id v6 = [*(id *)(a1 + 32) appLayout];
  uint64_t v7 = v6;
  if (v6) {
    BOOL v8 = v5 == 1;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    if ([v6 environment] != 3)
    {
      uint64_t v9 = [v7 environment];
      id v10 = &SBLayoutRolePrimary;
      if (v9 != 1) {
        id v10 = &SBLayoutRoleFloating;
      }
      uint64_t v11 = *v10;
      double v12 = [v3 applicationContext];
      double v13 = [v12 entityForLayoutRole:v11];

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_2;
      v25[3] = &unk_1E6AF5638;
      v25[4] = *(void *)(a1 + 40);
      id v26 = v13;
      id v14 = v13;
      [v3 modifyApplicationContext:v25];
    }
  }
  else if (v6 && !v5 && [v6 environment] != 3 && objc_msgSend(v7, "environment") != 2)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_4;
    v24[3] = &unk_1E6AF57C0;
    v24[4] = *(void *)(a1 + 40);
    [v3 modifyApplicationContext:v24];
  }
  uint64_t v15 = [*(id *)(a1 + 32) floatingConfiguration];
  double v16 = [*(id *)(a1 + 40) _windowScene];
  double v17 = [v16 layoutStateProvider];
  double v18 = [v17 layoutState];
  uint64_t v19 = [v18 floatingConfiguration];

  if ([v7 environment] == 3 && !SBFloatingConfigurationIsStashed(v19))
  {
    if (SBFloatingConfigurationIsLeft(v19))
    {
      uint64_t v20 = 3;
    }
    else
    {
      BOOL IsRight = SBFloatingConfigurationIsRight(v19);
      uint64_t v20 = 4;
      if (!IsRight) {
        uint64_t v20 = v15;
      }
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_5;
    v23[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
    v23[4] = v20;
    [v3 modifyApplicationContext:v23];
  }
  [v3 setSource:52];

  return 1;
}

void __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_3;
  v6[3] = &unk_1E6B00330;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  SBLayoutRoleEnumerateValidRoles(v6);
  objc_msgSend(v5, "setRequestedWindowPickerRole:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "layoutRole"));
  [v5 setActivatingEntity:0];
}

void __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1[4] + 1048) layoutRole];
  id v5 = (void *)a1[5];
  if (v4 == a2)
  {
    uint64_t v6 = a1[6];
    uint64_t v7 = [*(id *)(a1[4] + 1048) layoutRole];
    [v5 setEntity:v6 forLayoutRole:v7];
  }
  else
  {
    id v8 = +[SBWorkspaceEntity entity];
    [v5 setEntity:v8 forLayoutRole:a2];
  }
}

void __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 1048);
  id v3 = a2;
  id v4 = [v2 bundleIdentifier];
  [v3 setRequestedAppExposeBundleID:v4];
}

uint64_t __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setRequestedFloatingConfiguration:*(void *)(a1 + 32)];
}

- (void)dismissShelfForShelfTransition
{
}

- (void)dismissShelfForAccessibilityTransition
{
}

- (void)dismissShelfWithTransitionSource:(int64_t)a3
{
  id v5 = +[SBWorkspace mainWorkspace];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__SBSwitcherShelfViewController_dismissShelfWithTransitionSource___block_invoke;
  v6[3] = &unk_1E6AFF458;
  v6[4] = self;
  void v6[5] = a3;
  [v5 requestTransitionWithOptions:0 builder:v6 validator:0];
}

void __66__SBSwitcherShelfViewController_dismissShelfWithTransitionSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setSource:v3];
  [v4 setEventLabel:@"DismissShelf"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__SBSwitcherShelfViewController_dismissShelfWithTransitionSource___block_invoke_2;
  v5[3] = &unk_1E6AF57C0;
  v5[4] = *(void *)(a1 + 32);
  [v4 modifyApplicationContext:v5];
}

void __66__SBSwitcherShelfViewController_dismissShelfWithTransitionSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1048) displayMode];
  if (v3 == 1)
  {
    [v4 setRequestedAppExposeBundleID:0];
  }
  else if (!v3)
  {
    [v4 setRequestedWindowPickerRole:0];
  }
}

- (void)_dockHeightWillChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"SBFloatingDockControllerHeight"];
  [v6 doubleValue];

  uint64_t v7 = [v4 userInfo];

  id v8 = [v7 objectForKey:@"SBFloatingDockControllerHeightChangeInteractive"];
  char v9 = [v8 BOOLValue];

  if ((BSFloatIsZero() & 1) == 0 && (v9 & 1) == 0 && self->_presented)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__SBSwitcherShelfViewController__dockHeightWillChange___block_invoke;
    v10[3] = &unk_1E6AF4AC0;
    v10[4] = self;
    [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v10];
  }
}

uint64_t __55__SBSwitcherShelfViewController__dockHeightWillChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissShelfForShelfTransition];
}

- (SBSwitcherShelf)shelf
{
  return self->_shelf;
}

- (SBSwitcherShelfViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBSwitcherShelfViewControllerDataSource *)WeakRetained;
}

- (SBSwitcherShelfViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSwitcherShelfViewControllerDelegate *)WeakRetained;
}

- (NSArray)appLayouts
{
  return self->_appLayouts;
}

- (unint64_t)contentOptions
{
  return self->_contentOptions;
}

- (NSSet)ignoredDisplayItems
{
  return self->_ignoredDisplayItems;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (SBPortalView)homeAffordancePortalView
{
  return self->_homeAffordancePortalView;
}

- (BOOL)presented
{
  return self->_presented;
}

- (CGRect)presentationTargetFrame
{
  double x = self->_presentationTargetFrame.origin.x;
  double y = self->_presentationTargetFrame.origin.y;
  double width = self->_presentationTargetFrame.size.width;
  double height = self->_presentationTargetFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)animationStyle
{
  return self->_animationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordancePortalView, 0);
  objc_storeStrong((id *)&self->_ignoredDisplayItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_shelf, 0);
  objc_storeStrong((id *)&self->_appLayouts, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
  objc_storeStrong((id *)&self->_rootModifier, 0);
  objc_storeStrong((id *)&self->_liveContentOverlayCoordinator, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end