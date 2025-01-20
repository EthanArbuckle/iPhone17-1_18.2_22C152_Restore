@interface SBHideSharePlayContentFromSharedScreenController
- (BOOL)_canShareDaemonScenes;
- (BOOL)_deviceHasDaemonSceneThatShouldBeShared;
- (BOOL)_deviceHasDaemonSceneThatShouldBeSharedIfPossible;
- (BOOL)_isCoverSheetFullyPresented;
- (BOOL)_isCoverSheetVisible;
- (BOOL)_isPipViewControllerToHideOnMainDisplay;
- (SBHideSharePlayContentFromSharedScreenController)init;
- (double)_coverSheetWindowLevel;
- (id)_pipViewControllerToHide;
- (id)_systemNotesWindow;
- (id)acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:(id)a3;
- (void)_addAssertion:(id)a3;
- (void)_handleControlCenterDidPresent;
- (void)_handleControlCenterWillDismiss;
- (void)_removeAssertion:(id)a3;
- (void)_resolveHidingBehavior;
- (void)_startHidingViewControllerFromClonedDisplaysIfNeeded:(id)a3;
- (void)_startHidingWindowFromClonedDisplaysIfNeeded:(id)a3;
- (void)_startObservingForActiveHideAssertionIfNeeded;
- (void)_startTrackingPresentable:(id)a3;
- (void)_startTrackingTransientOverlayViewController:(id)a3;
- (void)_stopHidingViewControllerFromClonedDisplaysIfNeeded:(id)a3;
- (void)_stopHidingWindowFromClonedDisplaysIfNeeded:(id)a3;
- (void)_stopObservingForActiveHideAssertionIfNeeded;
- (void)_stopTrackingPresentable:(id)a3;
- (void)_stopTrackingTransientOverlayViewController:(id)a3;
- (void)_windowVisibilityDidChange:(id)a3;
- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5;
- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5;
- (void)dealloc;
- (void)dragSessionDidBegin:(id)a3;
- (void)dragSessionDidEnd:(id)a3;
- (void)mousePointerManager:(id)a3 hardwarePointingDeviceAttachedDidChange:(BOOL)a4;
- (void)transientOverlayPresentationManager:(id)a3 didDismissViewController:(id)a4 wasTopmostPresentation:(BOOL)a5;
- (void)transientOverlayPresentationManager:(id)a3 willPresentViewController:(id)a4;
@end

@implementation SBHideSharePlayContentFromSharedScreenController

- (SBHideSharePlayContentFromSharedScreenController)init
{
  v11.receiver = self;
  v11.super_class = (Class)SBHideSharePlayContentFromSharedScreenController;
  v2 = [(SBHideSharePlayContentFromSharedScreenController *)&v11 init];
  if (v2)
  {
    v3 = [(id)SBApp bannerManager];
    [v3 addTransitionObserver:v2];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__handleControlCenterDidPresent name:@"SBControlCenterControllerDidPresentNotification" object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__handleControlCenterWillDismiss name:@"SBControlCenterControllerWillDismissNotification" object:0];

    v6 = +[SBDraggingSystemManager sharedInstance];
    [v6 addObserver:v2];

    v7 = [(id)SBApp mousePointerManager];
    [v7 addObserver:v2];

    v8 = +[SBWorkspace mainWorkspace];
    v9 = [v8 transientOverlayPresentationManager];
    [v9 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(id)SBApp bannerManager];
  [v3 removeTransitionObserver:self];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"SBControlCenterControllerDidPresentNotification" object:0];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"SBControlCenterControllerWillDismissNotification" object:0];

  v6 = +[SBDraggingSystemManager sharedInstance];
  [v6 removeObserver:self];

  v7 = [(id)SBApp mousePointerManager];
  [v7 removeObserver:self];

  v8 = +[SBWorkspace mainWorkspace];
  v9 = [v8 transientOverlayPresentationManager];
  [v9 removeObserver:self];

  v10.receiver = self;
  v10.super_class = (Class)SBHideSharePlayContentFromSharedScreenController;
  [(SBHideSharePlayContentFromSharedScreenController *)&v10 dealloc];
}

- (id)acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBHideSharePlayContentFromSharedScreenController.m", 76, @"Invalid parameter not satisfying: %@", @"reason != nil" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  v7 = [MEMORY[0x1E4F29128] UUID];
  v8 = [v7 UUIDString];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __116__SBHideSharePlayContentFromSharedScreenController_acquireHideSharePlayContentFromClonedDisplaysAssertionForReason___block_invoke;
  v12[3] = &unk_1E6AF4FB8;
  objc_copyWeak(&v13, &location);
  v9 = (void *)[v6 initWithIdentifier:v8 forReason:v5 invalidationBlock:v12];

  [(SBHideSharePlayContentFromSharedScreenController *)self _addAssertion:v9];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __116__SBHideSharePlayContentFromSharedScreenController_acquireHideSharePlayContentFromClonedDisplaysAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _removeAssertion:v3];
}

- (void)_handleControlCenterDidPresent
{
  self->_isControlCenterFullyPresentedOnMainDisplay = 1;
  [(SBHideSharePlayContentFromSharedScreenController *)self _resolveHidingBehavior];
}

- (void)_handleControlCenterWillDismiss
{
  self->_isControlCenterFullyPresentedOnMainDisplay = 0;
  [(SBHideSharePlayContentFromSharedScreenController *)self _resolveHidingBehavior];
}

- (void)_windowVisibilityDidChange:(id)a3
{
  v4 = [a3 object];
  cloneTerminatingWindow = self->_cloneTerminatingWindow;

  if (v4 != cloneTerminatingWindow)
  {
    [(SBHideSharePlayContentFromSharedScreenController *)self _resolveHidingBehavior];
  }
}

- (void)_resolveHidingBehavior
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  uint64_t v140 = [(NSMutableSet *)self->_activeAssertions count];
  if (v140)
  {
    [(SBHideSharePlayContentFromSharedScreenController *)self _startObservingForActiveHideAssertionIfNeeded];
    uint64_t v3 = [(SBHideSharePlayContentFromSharedScreenController *)self _pipViewControllerToHide];
    BOOL v137 = [(SBHideSharePlayContentFromSharedScreenController *)self _isPipViewControllerToHideOnMainDisplay];
  }
  else
  {
    [(SBHideSharePlayContentFromSharedScreenController *)self _stopObservingForActiveHideAssertionIfNeeded];
    uint64_t v3 = [(SBHideSharePlayContentFromSharedScreenController *)self _pipViewControllerToHide];
    BOOL v137 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipViewControllerBeingHiddenWithDisableUpdateMask);
  id v5 = WeakRetained;
  if (WeakRetained && WeakRetained != (id)v3) {
    [(SBHideSharePlayContentFromSharedScreenController *)self _stopHidingViewControllerFromClonedDisplaysIfNeeded:WeakRetained];
  }
  id v139 = (id)v3;
  if (v140)
  {
    id v6 = [(NSHashTable *)self->_trackedPresentables allObjects];
  }
  else
  {
    id v6 = 0;
  }
  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v171 objects:v181 count:16];
  if (!v7)
  {
    int v144 = 0;
    int v145 = 0;
    goto LABEL_32;
  }
  uint64_t v8 = v7;
  int v144 = 0;
  int v145 = 0;
  id v142 = *(id *)v172;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(id *)v172 != v142) {
        objc_enumerationMutation(obj);
      }
      objc_super v10 = *(void **)(*((void *)&v171 + 1) + 8 * i);
      objc_super v11 = UIViewControllerFromPresentable();
      v12 = [v11 view];
      id v13 = [v12 window];

      v14 = [v13 windowScene];
      uint64_t v15 = objc_opt_class();
      id v16 = v14;
      if (v15)
      {
        if (objc_opt_isKindOfClass()) {
          v17 = v16;
        }
        else {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
      id v18 = v17;

      v19 = [v10 requesterIdentifier];
      if (([v19 isEqualToString:@"com.apple.ConversationKit"] & 1) == 0)
      {

LABEL_24:
        v145 |= [v18 isMainDisplayWindowScene];
        goto LABEL_25;
      }
      v20 = [v10 requestIdentifier];
      int v21 = [v20 hasPrefix:@"com.apple.conversationController"];

      if (!v21) {
        goto LABEL_24;
      }
      [v13 windowLevel];
      double v23 = v22;
      [(SBHideSharePlayContentFromSharedScreenController *)self _coverSheetWindowLevel];
      v144 |= v23 < v24;
LABEL_25:

      if (v144 & 1) != 0 && (v145)
      {
        int v144 = 1;
        int v145 = 1;
        goto LABEL_32;
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v171 objects:v181 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_32:

  if (v140)
  {
    v25 = [(NSHashTable *)self->_trackedTransientOverlays allObjects];
  }
  else
  {
    v25 = 0;
  }
  v138 = v5;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id v143 = v25;
  uint64_t v26 = [v143 countByEnumeratingWithState:&v167 objects:v180 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    int v28 = 0;
    int v29 = 0;
    uint64_t v30 = *(void *)v168;
    while (2)
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v168 != v30) {
          objc_enumerationMutation(v143);
        }
        v32 = [*(id *)(*((void *)&v167 + 1) + 8 * j) view];
        v33 = [v32 window];

        v34 = [v33 windowScene];
        uint64_t v35 = objc_opt_class();
        id v36 = v34;
        if (v35)
        {
          if (objc_opt_isKindOfClass()) {
            v37 = v36;
          }
          else {
            v37 = 0;
          }
        }
        else
        {
          v37 = 0;
        }
        id v38 = v37;

        [v33 windowLevel];
        double v40 = v39;
        [(SBHideSharePlayContentFromSharedScreenController *)self _coverSheetWindowLevel];
        v29 |= v40 < v41;
        int v42 = [v38 isMainDisplayWindowScene];

        v28 |= v42;
        if (v29 & 1) != 0 && (v28)
        {
          int v28 = 1;
          int v29 = 1;
          goto LABEL_52;
        }
      }
      uint64_t v27 = [v143 countByEnumeratingWithState:&v167 objects:v180 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v28 = 0;
    int v29 = 0;
  }
LABEL_52:

  if (v140) {
    int v43 = [(SBHideSharePlayContentFromSharedScreenController *)self _deviceHasDaemonSceneThatShouldBeShared];
  }
  else {
    int v43 = 0;
  }
  v44 = [(id)SBApp windowSceneManager];
  v45 = [v44 connectedWindowScenes];

  uint64_t v46 = [v45 count];
  v47 = (double *)MEMORY[0x1E4F43D00];
  if (v46 == 1)
  {
    v48 = [v45 anyObject];
    int v49 = [v48 isMainDisplayWindowScene];

    int v50 = v49 & ~v43;
    double v51 = *v47;
    if (v49)
    {
      v52 = [(SBHideSharePlayContentFromSharedScreenController *)self _pipViewControllerToHide];
      v53 = [v52 view];
      v54 = [v53 window];

      if ((v145 | v28))
      {
        double v55 = v51;
        if (v145)
        {
          v56 = [(NSHashTable *)self->_trackedPresentables anyObject];
          v57 = UIViewControllerFromPresentable();
          v58 = [v57 view];
          v59 = [v58 window];
          [v59 windowLevel];
          double v55 = v60;
        }
        if (v28)
        {
          v61 = [(NSHashTable *)self->_trackedTransientOverlays anyObject];
          v62 = [v61 view];
          v63 = [v62 window];
          [v63 windowLevel];
          double v51 = v64;
        }
        if (v55 + 0.01 >= v51 + 0.01) {
          double v65 = v55 + 0.01;
        }
        else {
          double v65 = v51 + 0.01;
        }
        LOBYTE(v66) = v144 | v29;
        if (((v144 | v29) & 1) == 0 && v137)
        {
          [v54 windowLevel];
          if (v55 >= v67)
          {
            LOBYTE(v66) = 1;
          }
          else
          {
            [v54 windowLevel];
            LOBYTE(v66) = v51 >= v68;
          }
        }
      }
      else if (self->_isControlCenterFullyPresentedOnMainDisplay)
      {
        v69 = +[SBControlCenterController sharedInstanceIfExists];
        v66 = [v69 _controlCenterWindow];
        [v66 windowLevel];
        double v71 = v70;

        LOBYTE(v66) = 0;
        double v65 = v71 + 0.001;
      }
      else if (v137)
      {
        v72 = [(SBHideSharePlayContentFromSharedScreenController *)self _systemNotesWindow];
        [v72 windowLevel];
        double v74 = v73;

        [v54 windowLevel];
        double v76 = v75;
        double v65 = v75 + -0.001;
        v77 = [(SBHideSharePlayContentFromSharedScreenController *)self _systemNotesWindow];
        LODWORD(v66) = (v74 >= v76) & ~[v77 isHidden];
      }
      else
      {
        LOBYTE(v66) = 0;
        double v65 = v51;
      }

      double v51 = v65;
    }
    else
    {
      LOBYTE(v66) = 0;
    }
  }
  else
  {
    int v50 = 0;
    LOBYTE(v66) = 0;
    double v51 = *MEMORY[0x1E4F43D00];
  }
  double v78 = 0.0;
  if (![(SBHideSharePlayContentFromSharedScreenController *)self _isCoverSheetFullyPresented])
  {
    if ([(SBHideSharePlayContentFromSharedScreenController *)self _isCoverSheetVisible])
    {
      [(SBHideSharePlayContentFromSharedScreenController *)self _coverSheetWindowLevel];
      double v80 = v79 + -0.01;
      if (v51 >= v80) {
        double v78 = v80;
      }
      else {
        double v78 = v51;
      }
    }
    else
    {
      double v78 = v51;
    }
  }
  if (v140) {
    int v81 = v50;
  }
  else {
    int v81 = 0;
  }
  if (v50) {
    BOOL v82 = (char)v66;
  }
  else {
    BOOL v82 = v140 != 0;
  }
  cloneTerminatingWindow = self->_cloneTerminatingWindow;
  if (v81 != 1)
  {
    [(UIWindow *)cloneTerminatingWindow setHidden:1];
    cloneTerminatingLayer = self->_cloneTerminatingLayer;
    self->_cloneTerminatingLayer = 0;

    v98 = self->_cloneTerminatingWindow;
    self->_cloneTerminatingWindow = 0;

    if (v82) {
      goto LABEL_117;
    }
    goto LABEL_97;
  }
  if (!cloneTerminatingWindow)
  {
    v84 = v45;
    v85 = [v45 anyObject];
    v86 = (UIWindow *)[objc_alloc(MEMORY[0x1E4F43058]) initWithWindowScene:v85];
    v87 = self->_cloneTerminatingWindow;
    self->_cloneTerminatingWindow = v86;

    [(UIWindow *)self->_cloneTerminatingWindow setUserInteractionEnabled:0];
    v88 = [(UIWindow *)self->_cloneTerminatingWindow layer];
    [v88 setAllowsHitTesting:0];

    v89 = self->_cloneTerminatingWindow;
    v90 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIWindow *)v89 setBackgroundColor:v90];

    [(UIWindow *)self->_cloneTerminatingWindow setWindowLevel:v78];
    [(UIWindow *)self->_cloneTerminatingWindow setHidden:0];
    if (!self->_cloneTerminatingLayer)
    {
      v91 = (CALayer *)objc_opt_new();
      v92 = self->_cloneTerminatingLayer;
      self->_cloneTerminatingLayer = v91;

      v93 = [(UIWindow *)self->_cloneTerminatingWindow layer];
      v94 = [v93 superlayer];

      if (v94)
      {
        do
        {
          v95 = [v93 superlayer];

          v96 = [v95 superlayer];

          v93 = v95;
        }
        while (v96);
      }
      else
      {
        v95 = v93;
      }
      [v95 addSublayer:self->_cloneTerminatingLayer];
    }
    cloneTerminatingWindow = self->_cloneTerminatingWindow;
    v45 = v84;
  }
  [(UIWindow *)cloneTerminatingWindow setWindowLevel:v78];
  if (!v82)
  {
LABEL_97:
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    v99 = [(NSHashTable *)self->_viewControllersWithDisableUpdateMasks allObjects];
    uint64_t v100 = [v99 countByEnumeratingWithState:&v151 objects:v176 count:16];
    if (v100)
    {
      uint64_t v101 = v100;
      uint64_t v102 = *(void *)v152;
      do
      {
        for (uint64_t k = 0; k != v101; ++k)
        {
          if (*(void *)v152 != v102) {
            objc_enumerationMutation(v99);
          }
          [(SBHideSharePlayContentFromSharedScreenController *)self _stopHidingViewControllerFromClonedDisplaysIfNeeded:*(void *)(*((void *)&v151 + 1) + 8 * k)];
        }
        uint64_t v101 = [v99 countByEnumeratingWithState:&v151 objects:v176 count:16];
      }
      while (v101);
    }

    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    v104 = [(NSHashTable *)self->_windowsBeingHiddenWithDisableUpdateMask allObjects];
    uint64_t v105 = [v104 countByEnumeratingWithState:&v147 objects:v175 count:16];
    if (v105)
    {
      uint64_t v106 = v105;
      uint64_t v107 = *(void *)v148;
      v108 = v139;
      do
      {
        for (uint64_t m = 0; m != v106; ++m)
        {
          if (*(void *)v148 != v107) {
            objc_enumerationMutation(v104);
          }
          [(SBHideSharePlayContentFromSharedScreenController *)self _stopHidingWindowFromClonedDisplaysIfNeeded:*(void *)(*((void *)&v147 + 1) + 8 * m)];
        }
        uint64_t v106 = [v104 countByEnumeratingWithState:&v147 objects:v175 count:16];
      }
      while (v106);
    }
    else
    {
      v108 = v139;
    }
    goto LABEL_158;
  }
LABEL_117:
  v146 = v45;
  objc_storeWeak((id *)&self->_pipViewControllerBeingHiddenWithDisableUpdateMask, v139);
  [(SBHideSharePlayContentFromSharedScreenController *)self _startHidingViewControllerFromClonedDisplaysIfNeeded:v139];
  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  v110 = [(NSHashTable *)self->_trackedPresentables allObjects];
  uint64_t v111 = [v110 countByEnumeratingWithState:&v163 objects:v179 count:16];
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v164;
    do
    {
      for (uint64_t n = 0; n != v112; ++n)
      {
        if (*(void *)v164 != v113) {
          objc_enumerationMutation(v110);
        }
        v115 = *(void **)(*((void *)&v163 + 1) + 8 * n);
        v116 = [v115 requesterIdentifier];
        if ([v116 isEqualToString:@"com.apple.ConversationKit"])
        {
          v117 = [v115 requestIdentifier];
          int v118 = [v117 hasPrefix:@"com.apple.conversationController"];

          if (!v118) {
            continue;
          }
          v116 = UIViewControllerFromPresentable();
          [(SBHideSharePlayContentFromSharedScreenController *)self _startHidingViewControllerFromClonedDisplaysIfNeeded:v116];
        }
      }
      uint64_t v112 = [v110 countByEnumeratingWithState:&v163 objects:v179 count:16];
    }
    while (v112);
  }

  v119 = self->_cloneTerminatingWindow;
  if (v119 && ([(UIWindow *)v119 isHidden] & 1) == 0)
  {
    long long v161 = 0u;
    long long v162 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    v104 = [(NSHashTable *)self->_windowsBeingHiddenWithDisableUpdateMask allObjects];
    uint64_t v133 = [v104 countByEnumeratingWithState:&v159 objects:v178 count:16];
    if (!v133) {
      goto LABEL_157;
    }
    uint64_t v134 = v133;
    uint64_t v135 = *(void *)v160;
    v108 = v139;
    v45 = v146;
    do
    {
      for (iuint64_t i = 0; ii != v134; ++ii)
      {
        if (*(void *)v160 != v135) {
          objc_enumerationMutation(v104);
        }
        [(SBHideSharePlayContentFromSharedScreenController *)self _stopHidingWindowFromClonedDisplaysIfNeeded:*(void *)(*((void *)&v159 + 1) + 8 * ii)];
      }
      uint64_t v134 = [v104 countByEnumeratingWithState:&v159 objects:v178 count:16];
    }
    while (v134);
  }
  else
  {
    v104 = [MEMORY[0x1E4F43058] allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    uint64_t v120 = [v104 countByEnumeratingWithState:&v155 objects:v177 count:16];
    if (v120)
    {
      uint64_t v121 = v120;
      uint64_t v122 = *(void *)v156;
      do
      {
        uint64_t v123 = 0;
        do
        {
          if (*(void *)v156 != v122) {
            objc_enumerationMutation(v104);
          }
          v124 = *(UIWindow **)(*((void *)&v155 + 1) + 8 * v123);
          v125 = [(UIWindow *)v124 windowScene];
          uint64_t v126 = objc_opt_class();
          id v127 = v125;
          if (v126)
          {
            if (objc_opt_isKindOfClass()) {
              v128 = v127;
            }
            else {
              v128 = 0;
            }
          }
          else
          {
            v128 = 0;
          }
          id v129 = v128;

          int v130 = [v129 isMainDisplayWindowScene];
          if (v130
            && v124 != self->_cloneTerminatingWindow
            && ([(UIWindow *)v124 windowLevel], v131 >= v78))
          {
            [(SBHideSharePlayContentFromSharedScreenController *)self _startHidingWindowFromClonedDisplaysIfNeeded:v124];
          }
          else
          {
            [(SBHideSharePlayContentFromSharedScreenController *)self _stopHidingWindowFromClonedDisplaysIfNeeded:v124];
          }
          ++v123;
        }
        while (v121 != v123);
        uint64_t v132 = [v104 countByEnumeratingWithState:&v155 objects:v177 count:16];
        uint64_t v121 = v132;
      }
      while (v132);
    }
LABEL_157:
    v108 = v139;
    v45 = v146;
  }
LABEL_158:
}

- (void)_startObservingForActiveHideAssertionIfNeeded
{
  if (!self->_isObservingPIPWindowLevelsAndVisibility)
  {
    self->_isObservingPIPWindowLevelsAndVisibility = 1;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__windowVisibilityDidChange_ name:*MEMORY[0x1E4F43EE8] object:0];
    [v3 addObserver:self selector:sel__windowVisibilityDidChange_ name:*MEMORY[0x1E4F43EF8] object:0];
    [v3 addObserver:self selector:sel__resolveHidingBehavior name:@"SBCoverSheetWillPresentNotification" object:0];
    [v3 addObserver:self selector:sel__resolveHidingBehavior name:@"SBCoverSheetDidPresentNotification" object:0];
    [v3 addObserver:self selector:sel__resolveHidingBehavior name:@"SBCoverSheetWillDismissNotification" object:0];
    [v3 addObserver:self selector:sel__resolveHidingBehavior name:@"SBCoverSheetDidDismissNotification" object:0];
  }
}

- (void)_stopObservingForActiveHideAssertionIfNeeded
{
  if (self->_isObservingPIPWindowLevelsAndVisibility)
  {
    self->_isObservingPIPWindowLevelsAndVisibility = 0;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4F43EE8] object:0];
    [v3 removeObserver:self name:*MEMORY[0x1E4F43EF8] object:0];
    [v3 removeObserver:self name:@"SBCoverSheetWillPresentNotification" object:0];
    [v3 removeObserver:self name:@"SBCoverSheetDidDismissNotification" object:0];
  }
}

- (void)_addAssertion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (!self->_activeAssertions)
    {
      id v5 = [MEMORY[0x1E4F1CA80] set];
      activeAssertions = self->_activeAssertions;
      self->_activeAssertions = v5;
    }
    uint64_t v7 = SBLogInCallPresentation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "acquiring hide SharePlay content from cloned displays assertion %{public}@", (uint8_t *)&v8, 0xCu);
    }

    [(NSMutableSet *)self->_activeAssertions addObject:v4];
  }
  [(SBHideSharePlayContentFromSharedScreenController *)self _resolveHidingBehavior];
}

- (void)_removeAssertion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = SBLogInCallPresentation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "removing hide SharePlay content from cloned displays assertion %{public}@", (uint8_t *)&v7, 0xCu);
    }

    [(NSMutableSet *)self->_activeAssertions removeObject:v4];
  }
  if (![(NSMutableSet *)self->_activeAssertions count])
  {
    activeAssertions = self->_activeAssertions;
    self->_activeAssertions = 0;
  }
  [(SBHideSharePlayContentFromSharedScreenController *)self _resolveHidingBehavior];
}

- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(SBHideSharePlayContentFromSharedScreenController *)self _startTrackingPresentable:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __115__SBHideSharePlayContentFromSharedScreenController_bannerManager_willPresentPresentable_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E6AF7D20;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 animateAlongsideTransition:0 completion:v10];
}

uint64_t __115__SBHideSharePlayContentFromSharedScreenController_bannerManager_willPresentPresentable_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _stopTrackingPresentable:v5];
  }
  return result;
}

- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __115__SBHideSharePlayContentFromSharedScreenController_bannerManager_willDismissPresentable_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E6AF7D20;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [a5 animateAlongsideTransition:0 completion:v9];
}

uint64_t __115__SBHideSharePlayContentFromSharedScreenController_bannerManager_willDismissPresentable_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if ((result & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _stopTrackingPresentable:v5];
  }
  return result;
}

- (void)_startTrackingPresentable:(id)a3
{
  id v4 = a3;
  trackedPresentables = self->_trackedPresentables;
  id v8 = v4;
  if (!trackedPresentables)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_trackedPresentables;
    self->_trackedPresentables = v6;

    id v4 = v8;
    trackedPresentables = self->_trackedPresentables;
  }
  [(NSHashTable *)trackedPresentables addObject:v4];
  [(SBHideSharePlayContentFromSharedScreenController *)self _resolveHidingBehavior];
}

- (void)_stopTrackingPresentable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = UIViewControllerFromPresentable();
  [(SBHideSharePlayContentFromSharedScreenController *)self _stopHidingViewControllerFromClonedDisplaysIfNeeded:v5];

  [(NSHashTable *)self->_trackedPresentables removeObject:v4];
  if (![(NSHashTable *)self->_trackedPresentables count])
  {
    trackedPresentables = self->_trackedPresentables;
    self->_trackedPresentables = 0;
  }
  [(SBHideSharePlayContentFromSharedScreenController *)self _resolveHidingBehavior];
}

- (id)_pipViewControllerToHide
{
  if (self->_isControlCenterFullyPresentedOnMainDisplay)
  {
    v2 = 0;
  }
  else
  {
    uint64_t v5 = +[SBWorkspace mainWorkspace];
    id v6 = [v5 pipControllerForType:0];

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SBHideSharePlayContentFromSharedScreenController.m" lineNumber:382 description:@"Instance should respond to protocol method"];
    }
    id v7 = [v6 containerViewControllersOnWindowScene:0];
    v2 = objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_160);
  }
  return v2;
}

uint64_t __76__SBHideSharePlayContentFromSharedScreenController__pipViewControllerToHide__block_invoke(uint64_t a1, void *a2)
{
  return [a2 prefersHiddenFromClonedDisplay];
}

- (BOOL)_isPipViewControllerToHideOnMainDisplay
{
  v2 = [(SBHideSharePlayContentFromSharedScreenController *)self _pipViewControllerToHide];
  id v3 = [v2 view];
  id v4 = [v3 window];
  uint64_t v5 = [v4 windowScene];

  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  char v10 = [v9 isMainDisplayWindowScene];
  return v10;
}

- (id)_systemNotesWindow
{
  v2 = [(id)SBApp windowSceneManager];
  id v3 = [v2 embeddedDisplayWindowScene];

  id v4 = +[SBWorkspace mainWorkspace];
  uint64_t v5 = [v4 pipControllerForType:1];
  uint64_t v6 = [v5 _leadingWindowForWindowScene:v3];

  return v6;
}

- (BOOL)_isCoverSheetVisible
{
  v2 = +[SBCoverSheetPresentationManager sharedInstanceIfExists];
  char v3 = [v2 isVisible];

  return v3;
}

- (BOOL)_isCoverSheetFullyPresented
{
  v2 = +[SBCoverSheetPresentationManager sharedInstanceIfExists];
  if ([v2 isVisible])
  {
    char v3 = +[SBCoverSheetPresentationManager sharedInstanceIfExists];
    int v4 = [v3 isTransitioning] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (double)_coverSheetWindowLevel
{
  v2 = +[SBCoverSheetPresentationManager sharedInstanceIfExists];
  char v3 = [v2 coverSheetWindow];
  [v3 windowLevel];
  double v5 = v4;

  return v5;
}

- (void)_startHidingViewControllerFromClonedDisplaysIfNeeded:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && ![(NSHashTable *)self->_viewControllersWithDisableUpdateMasks containsObject:v4])
  {
    viewControllersWithDisableUpdateMasks = self->_viewControllersWithDisableUpdateMasks;
    if (!viewControllersWithDisableUpdateMasks)
    {
      uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_viewControllersWithDisableUpdateMasks;
      self->_viewControllersWithDisableUpdateMasks = v6;

      viewControllersWithDisableUpdateMasks = self->_viewControllersWithDisableUpdateMasks;
    }
    [(NSHashTable *)viewControllersWithDisableUpdateMasks addObject:v4];
    id v8 = [v4 viewIfLoaded];
    id v9 = [v8 layer];

    objc_msgSend(v9, "setDisableUpdateMask:", objc_msgSend(v9, "disableUpdateMask") | 0x10);
    char v10 = SBLogInCallPresentation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Started hiding %{public}@ from cloned display", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_stopHidingViewControllerFromClonedDisplaysIfNeeded:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && [(NSHashTable *)self->_viewControllersWithDisableUpdateMasks containsObject:v4])
  {
    [(NSHashTable *)self->_viewControllersWithDisableUpdateMasks removeObject:v4];
    double v5 = [v4 viewIfLoaded];
    uint64_t v6 = [v5 layer];

    objc_msgSend(v6, "setDisableUpdateMask:", objc_msgSend(v6, "disableUpdateMask") & 0xFFFFFFEFLL);
    id v7 = SBLogInCallPresentation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Stopped hiding %{public}@ from cloned display", (uint8_t *)&v11, 0xCu);
    }
  }
  if (![(NSHashTable *)self->_viewControllersWithDisableUpdateMasks count])
  {
    viewControllersWithDisableUpdateMasks = self->_viewControllersWithDisableUpdateMasks;
    self->_viewControllersWithDisableUpdateMasks = 0;
  }
  p_pipViewControllerBeingHiddenWithDisableUpdateMasuint64_t k = &self->_pipViewControllerBeingHiddenWithDisableUpdateMask;
  id WeakRetained = objc_loadWeakRetained((id *)p_pipViewControllerBeingHiddenWithDisableUpdateMask);

  if (WeakRetained == v4) {
    objc_storeWeak((id *)p_pipViewControllerBeingHiddenWithDisableUpdateMask, 0);
  }
}

- (void)_startHidingWindowFromClonedDisplaysIfNeeded:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && ![(NSHashTable *)self->_windowsBeingHiddenWithDisableUpdateMask containsObject:v4])
  {
    windowsBeingHiddenWithDisableUpdateMasuint64_t k = self->_windowsBeingHiddenWithDisableUpdateMask;
    if (!windowsBeingHiddenWithDisableUpdateMask)
    {
      uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_windowsBeingHiddenWithDisableUpdateMask;
      self->_windowsBeingHiddenWithDisableUpdateMasuint64_t k = v6;

      windowsBeingHiddenWithDisableUpdateMasuint64_t k = self->_windowsBeingHiddenWithDisableUpdateMask;
    }
    [(NSHashTable *)windowsBeingHiddenWithDisableUpdateMask addObject:v4];
    id v8 = [v4 layer];
    objc_msgSend(v8, "setDisableUpdateMask:", objc_msgSend(v8, "disableUpdateMask") | 0x10);
    id v9 = SBLogInCallPresentation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Started hiding %{public}@ from cloned display", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_stopHidingWindowFromClonedDisplaysIfNeeded:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && [(NSHashTable *)self->_windowsBeingHiddenWithDisableUpdateMask containsObject:v4])
  {
    [(NSHashTable *)self->_windowsBeingHiddenWithDisableUpdateMask removeObject:v4];
    double v5 = [v4 layer];
    objc_msgSend(v5, "setDisableUpdateMask:", objc_msgSend(v5, "disableUpdateMask") & 0xFFFFFFEFLL);
    uint64_t v6 = SBLogInCallPresentation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Stopped hiding %{public}@ from cloned display", (uint8_t *)&v8, 0xCu);
    }
  }
  if (![(NSHashTable *)self->_windowsBeingHiddenWithDisableUpdateMask count])
  {
    windowsBeingHiddenWithDisableUpdateMasuint64_t k = self->_windowsBeingHiddenWithDisableUpdateMask;
    self->_windowsBeingHiddenWithDisableUpdateMasuint64_t k = 0;
  }
}

- (BOOL)_deviceHasDaemonSceneThatShouldBeShared
{
  if (![(SBHideSharePlayContentFromSharedScreenController *)self _canShareDaemonScenes]) {
    return 0;
  }
  BOOL v3 = [(SBHideSharePlayContentFromSharedScreenController *)self _deviceHasDaemonSceneThatShouldBeSharedIfPossible];
  BOOL v4 = 1;
  if (!v3)
  {
    uint64_t v5 = SBFEffectiveArtworkSubtype();
    if (v5 > 2795)
    {
      if (v5 != 2796 && v5 != 2868) {
        return 0;
      }
    }
    else if (v5 != 2556 && v5 != 2622)
    {
      return 0;
    }
  }
  return v4;
}

- (BOOL)_canShareDaemonScenes
{
  if (_os_feature_enabled_impl()) {
    return 0;
  }
  else {
    return ![(SBHideSharePlayContentFromSharedScreenController *)self _isCoverSheetVisible];
  }
}

- (BOOL)_deviceHasDaemonSceneThatShouldBeSharedIfPossible
{
  BOOL v3 = [(id)SBApp mousePointerManager];
  BOOL v4 = ([v3 isHardwarePointingDeviceAttached] & 1) != 0 || self->_numberOfActiveDragSessions > 0;

  return v4;
}

- (void)dragSessionDidBegin:(id)a3
{
}

- (void)dragSessionDidEnd:(id)a3
{
}

- (void)mousePointerManager:(id)a3 hardwarePointingDeviceAttachedDidChange:(BOOL)a4
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __112__SBHideSharePlayContentFromSharedScreenController_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke;
  v4[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __112__SBHideSharePlayContentFromSharedScreenController_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resolveHidingBehavior];
}

- (void)transientOverlayPresentationManager:(id)a3 willPresentViewController:(id)a4
{
  [(SBHideSharePlayContentFromSharedScreenController *)self _startTrackingTransientOverlayViewController:a4];
  [(SBHideSharePlayContentFromSharedScreenController *)self _resolveHidingBehavior];
}

- (void)transientOverlayPresentationManager:(id)a3 didDismissViewController:(id)a4 wasTopmostPresentation:(BOOL)a5
{
  [(SBHideSharePlayContentFromSharedScreenController *)self _stopTrackingTransientOverlayViewController:a4];
  [(SBHideSharePlayContentFromSharedScreenController *)self _resolveHidingBehavior];
}

- (void)_startTrackingTransientOverlayViewController:(id)a3
{
  id v4 = a3;
  trackedTransientOverlays = self->_trackedTransientOverlays;
  id v8 = v4;
  if (!trackedTransientOverlays)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_trackedTransientOverlays;
    self->_trackedTransientOverlays = v6;

    id v4 = v8;
    trackedTransientOverlays = self->_trackedTransientOverlays;
  }
  [(NSHashTable *)trackedTransientOverlays addObject:v4];
  [(SBHideSharePlayContentFromSharedScreenController *)self _resolveHidingBehavior];
}

- (void)_stopTrackingTransientOverlayViewController:(id)a3
{
  id v4 = a3;
  [(SBHideSharePlayContentFromSharedScreenController *)self _stopHidingViewControllerFromClonedDisplaysIfNeeded:v4];
  [(NSHashTable *)self->_trackedTransientOverlays removeObject:v4];

  if (![(NSHashTable *)self->_trackedTransientOverlays count])
  {
    trackedTransientOverlays = self->_trackedTransientOverlays;
    self->_trackedTransientOverlays = 0;
  }
  [(SBHideSharePlayContentFromSharedScreenController *)self _resolveHidingBehavior];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedAssertion, 0);
  objc_storeStrong((id *)&self->_cloneTerminatingLayer, 0);
  objc_storeStrong((id *)&self->_cloneTerminatingWindow, 0);
  objc_storeStrong((id *)&self->_activeAssertions, 0);
  objc_destroyWeak((id *)&self->_pipViewControllerBeingHiddenWithDisableUpdateMask);
  objc_storeStrong((id *)&self->_viewControllersWithDisableUpdateMasks, 0);
  objc_storeStrong((id *)&self->_windowsBeingHiddenWithDisableUpdateMask, 0);
  objc_storeStrong((id *)&self->_trackedTransientOverlays, 0);
  objc_storeStrong((id *)&self->_trackedPresentables, 0);
}

@end