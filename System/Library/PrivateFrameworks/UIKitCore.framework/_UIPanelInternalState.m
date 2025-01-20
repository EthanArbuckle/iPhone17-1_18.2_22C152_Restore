@interface _UIPanelInternalState
- (UIPanelControllerDelegate)delegate;
- (UISlidingBarConfiguration)configuration;
- (UISlidingBarStateRequest)externallyAnimatingStateRequest;
- (UISlidingBarStateRequest)interactiveStateRequest;
- (UISlidingBarStateRequest)stateRequest;
- (UIViewController)collapsedViewController;
- (UIViewController)leadingViewController;
- (UIViewController)mainViewController;
- (UIViewController)preservedDetailController;
- (UIViewController)supplementaryViewController;
- (UIViewController)trailingViewController;
- (_UIPanelAnimationState)animationState;
- (double)_defaultWidthForViewController:(id)a3 parentWidth:(double)a4;
- (double)keyboardAdjustment;
- (id)_allowedLeadingWidthsForParentWidth:(double)a3;
- (id)_allowedSupplementaryWidthsForParentWidth:(double)a3;
- (id)_allowedTrailingWidthsForParentWidth:(double)a3;
- (id)_allowedWidthsForViewController:(id)a3 parentWidth:(double)a4;
- (id)_stateForInteractiveRequest:(id)a3 withAffectedSides:(int64_t)a4 inPossibleStates:(id)a5;
- (id)computePossibleStatesGivenParentView:(id)a3 withSize:(CGSize)a4;
- (id)computePossibleStatesGivenParentView:(id)a3 withSize:(CGSize)a4 forceOverlay:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)collapsedState;
- (int64_t)externallyAnimatingAffectedSides;
- (void)setAnimationState:(id)a3;
- (void)setCollapsedState:(int64_t)a3;
- (void)setCollapsedViewController:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternallyAnimatingAffectedSides:(int64_t)a3;
- (void)setExternallyAnimatingStateRequest:(id)a3;
- (void)setInteractiveStateRequest:(id)a3;
- (void)setKeyboardAdjustment:(double)a3;
- (void)setLeadingViewController:(id)a3;
- (void)setMainViewController:(id)a3;
- (void)setPreservedDetailController:(id)a3;
- (void)setStateRequest:(id)a3;
- (void)setSupplementaryViewController:(id)a3;
- (void)setTrailingViewController:(id)a3;
@end

@implementation _UIPanelInternalState

- (UIViewController)mainViewController
{
  return self->_mainViewController;
}

- (UIViewController)collapsedViewController
{
  return self->_collapsedViewController;
}

- (int64_t)collapsedState
{
  return self->_collapsedState;
}

- (UIViewController)leadingViewController
{
  return self->_leadingViewController;
}

- (UIViewController)trailingViewController
{
  return self->_trailingViewController;
}

- (_UIPanelAnimationState)animationState
{
  return self->_animationState;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(_UIPanelInternalState *)self mainViewController];
  [v4 setMainViewController:v5];

  v6 = [(_UIPanelInternalState *)self leadingViewController];
  [v4 setLeadingViewController:v6];

  v7 = [(_UIPanelInternalState *)self trailingViewController];
  [v4 setTrailingViewController:v7];

  v8 = [(_UIPanelInternalState *)self supplementaryViewController];
  [v4 setSupplementaryViewController:v8];

  v9 = [(_UIPanelInternalState *)self collapsedViewController];
  [v4 setCollapsedViewController:v9];

  v10 = [(_UIPanelInternalState *)self preservedDetailController];
  [v4 setPreservedDetailController:v10];

  v11 = [(_UIPanelInternalState *)self delegate];
  [v4 setDelegate:v11];

  v12 = [(_UIPanelInternalState *)self configuration];
  [v4 setConfiguration:v12];

  v13 = [(_UIPanelInternalState *)self stateRequest];
  [v4 setStateRequest:v13];

  v14 = [(_UIPanelInternalState *)self externallyAnimatingStateRequest];
  [v4 setExternallyAnimatingStateRequest:v14];

  objc_msgSend(v4, "setExternallyAnimatingAffectedSides:", -[_UIPanelInternalState externallyAnimatingAffectedSides](self, "externallyAnimatingAffectedSides"));
  v15 = [(_UIPanelInternalState *)self animationState];
  [v4 setAnimationState:v15];

  v16 = [(_UIPanelInternalState *)self interactiveStateRequest];
  [v4 setInteractiveStateRequest:v16];

  objc_msgSend(v4, "setCollapsedState:", -[_UIPanelInternalState collapsedState](self, "collapsedState"));
  [(_UIPanelInternalState *)self keyboardAdjustment];
  objc_msgSend(v4, "setKeyboardAdjustment:");
  return v4;
}

- (void)setMainViewController:(id)a3
{
  id v4 = (UIViewController *)a3;
  if (v4)
  {
    v5 = [(_UIPanelInternalState *)self leadingViewController];

    if (v5 == v4)
    {
      [(_UIPanelInternalState *)self setLeadingViewController:0];
    }
    else
    {
      v6 = [(_UIPanelInternalState *)self trailingViewController];

      if (v6 == v4)
      {
        [(_UIPanelInternalState *)self setTrailingViewController:0];
      }
      else
      {
        v7 = [(_UIPanelInternalState *)self supplementaryViewController];

        if (v7 == v4) {
          [(_UIPanelInternalState *)self setSupplementaryViewController:0];
        }
      }
    }
  }
  mainViewController = self->_mainViewController;
  self->_mainViewController = v4;
}

- (void)setCollapsedState:(int64_t)a3
{
  self->_collapsedState = a3;
}

- (void)setConfiguration:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setCollapsedViewController:(id)a3
{
}

- (void)setSupplementaryViewController:(id)a3
{
  id v4 = (UIViewController *)a3;
  if (v4)
  {
    v5 = [(_UIPanelInternalState *)self mainViewController];

    if (v5 == v4)
    {
      [(_UIPanelInternalState *)self setMainViewController:0];
    }
    else
    {
      v6 = [(_UIPanelInternalState *)self leadingViewController];

      if (v6 == v4)
      {
        [(_UIPanelInternalState *)self setLeadingViewController:0];
      }
      else
      {
        v7 = [(_UIPanelInternalState *)self trailingViewController];

        if (v7 == v4) {
          [(_UIPanelInternalState *)self setTrailingViewController:0];
        }
      }
    }
  }
  supplementaryViewController = self->_supplementaryViewController;
  self->_supplementaryViewController = v4;
}

- (void)setPreservedDetailController:(id)a3
{
}

- (void)setLeadingViewController:(id)a3
{
  id v4 = (UIViewController *)a3;
  if (v4)
  {
    v5 = [(_UIPanelInternalState *)self mainViewController];

    if (v5 == v4)
    {
      [(_UIPanelInternalState *)self setMainViewController:0];
    }
    else
    {
      v6 = [(_UIPanelInternalState *)self trailingViewController];

      if (v6 == v4)
      {
        [(_UIPanelInternalState *)self setTrailingViewController:0];
      }
      else
      {
        v7 = [(_UIPanelInternalState *)self supplementaryViewController];

        if (v7 == v4) {
          [(_UIPanelInternalState *)self setSupplementaryViewController:0];
        }
      }
    }
  }
  leadingViewController = self->_leadingViewController;
  self->_leadingViewController = v4;
}

- (void)setTrailingViewController:(id)a3
{
  id v4 = (UIViewController *)a3;
  if (v4)
  {
    v5 = [(_UIPanelInternalState *)self leadingViewController];

    if (v5 == v4)
    {
      [(_UIPanelInternalState *)self setLeadingViewController:0];
    }
    else
    {
      v6 = [(_UIPanelInternalState *)self mainViewController];

      if (v6 == v4)
      {
        [(_UIPanelInternalState *)self setMainViewController:0];
      }
      else
      {
        v7 = [(_UIPanelInternalState *)self supplementaryViewController];

        if (v7 == v4) {
          [(_UIPanelInternalState *)self setSupplementaryViewController:0];
        }
      }
    }
  }
  trailingViewController = self->_trailingViewController;
  self->_trailingViewController = v4;
}

- (UIViewController)preservedDetailController
{
  return self->_preservedDetailController;
}

- (void)setStateRequest:(id)a3
{
}

- (void)setKeyboardAdjustment:(double)a3
{
  self->_keyboardAdjustment = a3;
}

- (void)setInteractiveStateRequest:(id)a3
{
}

- (void)setExternallyAnimatingStateRequest:(id)a3
{
}

- (void)setExternallyAnimatingAffectedSides:(int64_t)a3
{
  self->_externallyAnimatingAffectedSides = a3;
}

- (void)setAnimationState:(id)a3
{
}

- (double)keyboardAdjustment
{
  return self->_keyboardAdjustment;
}

- (int64_t)externallyAnimatingAffectedSides
{
  return self->_externallyAnimatingAffectedSides;
}

- (UISlidingBarStateRequest)externallyAnimatingStateRequest
{
  return self->_externallyAnimatingStateRequest;
}

- (UISlidingBarStateRequest)interactiveStateRequest
{
  return self->_interactiveStateRequest;
}

- (UISlidingBarStateRequest)stateRequest
{
  return self->_stateRequest;
}

- (id)computePossibleStatesGivenParentView:(id)a3 withSize:(CGSize)a4 forceOverlay:(BOOL)a5
{
  BOOL v5 = a5;
  double width = a4.width;
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke;
  aBlock[3] = &unk_1E52E95C8;
  aBlock[4] = self;
  id v10 = v9;
  id v141 = v10;
  v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  if ([(_UIPanelInternalState *)self collapsedState] != 1
    && [(_UIPanelInternalState *)self collapsedState] != 2)
  {
    BOOL v112 = v5;
    v106 = v11;
    v82 = v10;
    v12 = [(_UIPanelInternalState *)self configuration];
    v136[0] = MEMORY[0x1E4F143A8];
    v136[1] = 3221225472;
    v137 = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_3;
    v138 = &unk_1E52E9610;
    id v83 = v8;
    id v13 = v8;
    id v139 = v13;
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v131 = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_203;
    v132 = &unk_1E52E9638;
    double v135 = width;
    id v14 = v12;
    id v133 = v14;
    id v15 = v13;
    id v134 = v15;
    uint64_t v16 = [v14 leadingMayBeHidden];
    uint64_t v17 = [v14 trailingMayBeHidden];
    int v114 = [v14 supplementaryMayBeHidden];
    uint64_t v18 = [v14 supplementaryEdge];
    v19 = [(_UIPanelInternalState *)self leadingViewController];
    v20 = [(_UIPanelInternalState *)self _allowedLeadingWidthsForParentWidth:width];
    v21 = v137((uint64_t)v136, (uint64_t)v19, v20, v16);

    v22 = [(_UIPanelInternalState *)self trailingViewController];
    v23 = [(_UIPanelInternalState *)self _allowedTrailingWidthsForParentWidth:width];
    v24 = v137((uint64_t)v136, (uint64_t)v22, v23, v17);

    v25 = [(_UIPanelInternalState *)self supplementaryViewController];
    v105 = self;
    v26 = [(_UIPanelInternalState *)self _allowedSupplementaryWidthsForParentWidth:width];
    v27 = v137((uint64_t)v136, (uint64_t)v25, v26, v114);

    double v28 = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_2_205(v21);
    v88 = v24;
    double v29 = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_2_205(v24);
    v96 = v27;
    double v30 = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_2_205(v27);
    BOOL v31 = v30 > 0.0;
    double v86 = v28;
    BOOL v32 = v28 > 0.0 && v30 > 0.0;
    BOOL v85 = v32;
    double v93 = v29;
    if (v29 <= 0.0) {
      BOOL v31 = 0;
    }
    BOOL v92 = v31;
    [v14 minimumMainWidthFraction];
    UICeilToViewScale(v15);
    double v110 = v33;
    [v14 minimumMainWidthFractionForSecondColumn];
    UICeilToViewScale(v15);
    double v102 = v34;
    v115 = v14;
    [v14 maximumMainWidth];
    v101 = v15;
    UICeilToViewScale(v15);
    double v109 = v35;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id obj = v21;
    uint64_t v89 = [obj countByEnumeratingWithState:&v126 objects:v146 count:16];
    if (!v89)
    {
      char v107 = 0;
      uint64_t v104 = 0;
      goto LABEL_114;
    }
    BOOL v100 = v18 != 0;
    uint64_t v87 = *(void *)v127;
    char v107 = 0;
    int v108 = !v112;
    uint64_t v104 = 0;
    double v111 = 0.0;
    double v113 = 0.0;
    double v36 = 0.0;
    uint64_t v37 = v18;
    while (1)
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v127 != v87) {
          objc_enumerationMutation(obj);
        }
        uint64_t v90 = v38;
        [*(id *)(*((void *)&v126 + 1) + 8 * v38) doubleValue];
        double v40 = v39;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id v91 = v88;
        uint64_t v98 = [v91 countByEnumeratingWithState:&v122 objects:v145 count:16];
        if (v98)
        {
          BOOL v41 = v86 > 0.0;
          uint64_t v97 = *(void *)v123;
          BOOL v42 = v85;
          if (v40 <= 0.0) {
            BOOL v42 = 0;
          }
          if (v40 > v86) {
            BOOL v41 = 0;
          }
          BOOL v94 = v41;
          BOOL v95 = v42;
          do
          {
            uint64_t v43 = 0;
            do
            {
              if (*(void *)v123 != v97) {
                objc_enumerationMutation(v91);
              }
              uint64_t v99 = v43;
              [*(id *)(*((void *)&v122 + 1) + 8 * v43) doubleValue];
              double v45 = v44;
              long long v118 = 0u;
              long long v119 = 0u;
              long long v120 = 0u;
              long long v121 = 0u;
              id v46 = v96;
              uint64_t v47 = [v46 countByEnumeratingWithState:&v118 objects:v144 count:16];
              if (v47)
              {
                uint64_t v48 = v47;
                BOOL v49 = v93 > 0.0;
                uint64_t v50 = *(void *)v119;
                BOOL v51 = v92;
                if (v45 <= 0.0) {
                  BOOL v51 = 0;
                }
                if (v45 > v93) {
                  BOOL v49 = 0;
                }
                BOOL v52 = v94 || v49;
                if (v37) {
                  double v53 = v45;
                }
                else {
                  double v53 = v40;
                }
                double v103 = v53;
                BOOL v54 = v95 || v51;
                do
                {
                  uint64_t v55 = 0;
                  do
                  {
                    if (*(void *)v119 != v50) {
                      objc_enumerationMutation(v46);
                    }
                    [*(id *)(*((void *)&v118 + 1) + 8 * v55) doubleValue];
                    if (v56 != 0.0 || !v54)
                    {
                      double v58 = v56;
                      double v59 = -0.0;
                      if (v37) {
                        double v60 = -0.0;
                      }
                      else {
                        double v60 = v58;
                      }
                      double v61 = v40 + v60;
                      if (v37) {
                        double v59 = v58;
                      }
                      double v62 = v45 + v59;
                      int v63 = [v115 allowTotalWidthGreaterThanParent];
                      if ((v63 & 1) == 0 && v61 != 0.0 && v62 != 0.0)
                      {
                        if (os_variant_has_internal_diagnostics())
                        {
                          v77 = __UIFaultDebugAssertLog();
                          if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v143 = v115;
                            _os_log_fault_impl(&dword_1853B0000, v77, OS_LOG_TYPE_FAULT, "Simultaneous nonzero leading and trailing widths not supported for allowTotalWidthGreaterThanParent. Configuration = %@", buf, 0xCu);
                          }
                        }
                        else
                        {
                          v76 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_20) + 8);
                          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v143 = v115;
                            _os_log_impl(&dword_1853B0000, v76, OS_LOG_TYPE_ERROR, "Simultaneous nonzero leading and trailing widths not supported for allowTotalWidthGreaterThanParent. Configuration = %@", buf, 0xCu);
                          }
                        }
                      }
                      double v64 = width;
                      if ((v63 & 1) == 0) {
                        ((void (*)(void *, void, double, double))v131)(v130, 0, v61, v62);
                      }
                      if (!v52 && (v58 <= v30 ? (BOOL v65 = v30 <= 0.0) : (BOOL v65 = 1), v65))
                      {
                        char v66 = 0;
                        double v67 = v102;
                      }
                      else
                      {
                        char v66 = 1;
                        double v67 = v110;
                      }
                      if (v64 >= 0.0 && v64 <= v109)
                      {
                        uint64_t v68 = v37;
                        if (v64 >= v67) {
                          int v69 = v108;
                        }
                        else {
                          int v69 = 0;
                        }
                        if (v69)
                        {
                          char v107 = 0;
                          uint64_t v104 = 0;
                          double v111 = v45;
                          double v113 = v40;
                          double v36 = v58;
                          goto LABEL_63;
                        }
                        if (v58 <= 0.0)
                        {
                          if (v40 <= 0.0)
                          {
                            if (v45 <= 0.0) {
                              goto LABEL_63;
                            }
                            if (v66)
                            {
                              BYTE4(v104) = 1;
                              double v111 = 0.0;
                              goto LABEL_63;
                            }
                            if ([v115 allowMixedSideBySideAndOverlay] && v111 > 0.0)
                            {
                              BYTE4(v104) = 0;
                              goto LABEL_63;
                            }
                          }
                          else
                          {
                            if (v66)
                            {
                              double v113 = 0.0;
                              char v107 = 1;
                              goto LABEL_63;
                            }
                            if ([v115 allowMixedSideBySideAndOverlay] && v113 > 0.0)
                            {
                              char v107 = 0;
                              goto LABEL_63;
                            }
                          }
                          goto LABEL_80;
                        }
                        if (v58 <= v30)
                        {
                          double v36 = 0.0;
                          if (v68) {
                            double v74 = 0.0;
                          }
                          else {
                            double v74 = v111;
                          }
                          v107 |= v68 == 0;
                          BYTE4(v104) |= v100;
                          double v75 = v113;
                          if (!v68) {
                            double v75 = 0.0;
                          }
                          double v111 = v74;
                          double v113 = v75;
                          LOBYTE(v104) = 1;
LABEL_63:
                          v70 = [(_UIPanelInternalState *)v105 stateRequest];
                          [v70 supplementaryWidth];

                          double v71 = 0.0;
                          if ((v63 & v69) == 1 && v58 > 0.0 && v103 > 0.0)
                          {
                            objc_msgSend(v101, "_currentScreenScale", 0.0, v103);
                            if (v68) {
                              objc_msgSend(v115, "trailingBorderWidthForScale:");
                            }
                            else {
                              objc_msgSend(v115, "leadingBorderWidthForScale:");
                            }
                            double v71 = width - v58 - v72;
                          }
                          v116[0] = MEMORY[0x1E4F143A8];
                          v116[1] = 3221225472;
                          v116[2] = __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_210;
                          v116[3] = &__block_descriptor_89_e27_v16__0__UISlidingBarState_8l;
                          *(double *)&v116[4] = v40;
                          *(double *)&v116[5] = v45;
                          *(double *)&v116[6] = v58;
                          *(double *)&v116[7] = v71;
                          char v117 = v69;
                          *(double *)&v116[8] = v113;
                          *(double *)&v116[9] = v111;
                          *(double *)&v116[10] = v36;
                          v106[2](v106, v116);
LABEL_80:
                          uint64_t v37 = v68;
                          goto LABEL_81;
                        }
                        if (![v115 allowMixedSideBySideAndOverlay]) {
                          goto LABEL_80;
                        }
                        uint64_t v37 = v68;
                        if (os_variant_has_internal_diagnostics())
                        {
                          v78 = __UIFaultDebugAssertLog();
                          if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v143 = v115;
                            _os_log_fault_impl(&dword_1853B0000, v78, OS_LOG_TYPE_FAULT, "allowMixedSideBySideAndOverlay not supported for nonzero supplementary width. Configuration = %@", buf, 0xCu);
                          }
                        }
                        else
                        {
                          v73 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2584D0) + 8);
                          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v143 = v115;
                            _os_log_impl(&dword_1853B0000, v73, OS_LOG_TYPE_ERROR, "allowMixedSideBySideAndOverlay not supported for nonzero supplementary width. Configuration = %@", buf, 0xCu);
                          }
                        }
                      }
                    }
LABEL_81:
                    ++v55;
                  }
                  while (v48 != v55);
                  uint64_t v79 = [v46 countByEnumeratingWithState:&v118 objects:v144 count:16];
                  uint64_t v48 = v79;
                }
                while (v79);
              }

              uint64_t v43 = v99 + 1;
            }
            while (v99 + 1 != v98);
            uint64_t v98 = [v91 countByEnumeratingWithState:&v122 objects:v145 count:16];
          }
          while (v98);
        }

        uint64_t v38 = v90 + 1;
      }
      while (v90 + 1 != v89);
      uint64_t v89 = [obj countByEnumeratingWithState:&v126 objects:v146 count:16];
      if (!v89)
      {
LABEL_114:

        id v10 = v82;
        _updateTreatsHiddenAsOverlapsInStates(v82, v107 & 1, BYTE4(v104) & 1, v104 & 1);

        id v8 = v83;
        v11 = v106;
        goto LABEL_115;
      }
    }
  }
  v11[2](v11, &__block_literal_global_139);
LABEL_115:
  id v80 = v10;

  return v80;
}

- (UISlidingBarConfiguration)configuration
{
  return self->_configuration;
}

- (UIViewController)supplementaryViewController
{
  return self->_supplementaryViewController;
}

- (UIPanelControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIPanelControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactiveStateRequest, 0);
  objc_storeStrong((id *)&self->_animationState, 0);
  objc_storeStrong((id *)&self->_externallyAnimatingStateRequest, 0);
  objc_storeStrong((id *)&self->_stateRequest, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preservedDetailController, 0);
  objc_storeStrong((id *)&self->_collapsedViewController, 0);
  objc_storeStrong((id *)&self->_trailingViewController, 0);
  objc_storeStrong((id *)&self->_supplementaryViewController, 0);
  objc_storeStrong((id *)&self->_leadingViewController, 0);
  objc_storeStrong((id *)&self->_mainViewController, 0);
}

- (id)_allowedWidthsForViewController:(id)a3 parentWidth:(double)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [v6 _preferredContentSizes];
  if ([v8 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "CGSizeValue", (void)v22);
          if (v14 > 0.0)
          {
            id v15 = objc_msgSend(NSNumber, "numberWithDouble:");
            [v7 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
    goto LABEL_18;
  }
  if ([v6 _isNavigationController]) {
    [v6 _preferredContentSizeForcingLoad:0];
  }
  else {
    [v6 preferredContentSize];
  }
  if (v16 > 0.0
    || ([(_UIPanelInternalState *)self _defaultWidthForViewController:v6 parentWidth:a4], v17 > 0.0))
  {
    objc_msgSend(NSNumber, "numberWithDouble:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [v7 addObject:v9];
LABEL_18:
  }
  if ((unint64_t)objc_msgSend(v7, "count", (void)v22) >= 2)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    v19 = [v18 allObjects];
    uint64_t v20 = [v19 mutableCopy];

    v7 = (void *)v20;
  }
  [v7 sortUsingSelector:sel_compare_];

  return v7;
}

- (double)_defaultWidthForViewController:(id)a3 parentWidth:(double)a4
{
  id v6 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  double v10 = 0.0;
  if (v9)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 panelController:0 expectedWidthForColumnForViewController:v6];
    double v10 = v12;
  }
  id v13 = [v6 traitCollection];
  uint64_t v14 = [v13 userInterfaceIdiom];

  switch(v14)
  {
    case 0:
      if (v10 == 0.0)
      {
        double v15 = 0.4;
        goto LABEL_7;
      }
      break;
    case 1:
      if (v10 == 0.0)
      {
        double v16 = +[UIScreen mainScreen];
        [v16 _referenceBounds];
        double Height = CGRectGetHeight(v19);

        if (Height <= 1210.0) {
          double v10 = 320.0;
        }
        else {
          double v10 = 375.0;
        }
      }
      break;
    case 2:
    case 8:
      double v15 = 0.33;
LABEL_7:
      double v10 = ceil(a4 * v15);
      break;
    default:
      break;
  }

  return v10;
}

- (id)_allowedLeadingWidthsForParentWidth:(double)a3
{
  BOOL v5 = [(_UIPanelInternalState *)self configuration];
  id v6 = [v5 leadingWidths];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [(_UIPanelInternalState *)self configuration];
    [v8 leadingWidths];
  }
  else
  {
    id v8 = [(_UIPanelInternalState *)self leadingViewController];
    [(_UIPanelInternalState *)self _allowedWidthsForViewController:v8 parentWidth:a3];
  char v9 = };

  return v9;
}

- (id)_allowedTrailingWidthsForParentWidth:(double)a3
{
  BOOL v5 = [(_UIPanelInternalState *)self configuration];
  id v6 = [v5 trailingWidths];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [(_UIPanelInternalState *)self configuration];
    [v8 trailingWidths];
  }
  else
  {
    id v8 = [(_UIPanelInternalState *)self trailingViewController];
    [(_UIPanelInternalState *)self _allowedWidthsForViewController:v8 parentWidth:a3];
  char v9 = };

  return v9;
}

- (id)_allowedSupplementaryWidthsForParentWidth:(double)a3
{
  BOOL v5 = [(_UIPanelInternalState *)self configuration];
  id v6 = [v5 supplementaryWidths];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [(_UIPanelInternalState *)self configuration];
    [v8 supplementaryWidths];
  }
  else
  {
    id v8 = [(_UIPanelInternalState *)self supplementaryViewController];
    [(_UIPanelInternalState *)self _allowedWidthsForViewController:v8 parentWidth:a3];
  char v9 = };

  return v9;
}

- (id)computePossibleStatesGivenParentView:(id)a3 withSize:(CGSize)a4
{
  return -[_UIPanelInternalState computePossibleStatesGivenParentView:withSize:forceOverlay:](self, "computePossibleStatesGivenParentView:withSize:forceOverlay:", a3, 0, a4.width, a4.height);
}

- (id)_stateForInteractiveRequest:(id)a3 withAffectedSides:(int64_t)a4 inPossibleStates:(id)a5
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  double v10 = [v8 _closestEqualOrLargerState:v9];
  id v11 = (void *)[v10 copy];

  int v12 = [v11 _leadingEntirelyOverlapsMain];
  int v100 = [v11 _trailingEntirelyOverlapsMain];
  int v101 = [v11 _supplementaryEntirelyOverlapsMain];
  id v13 = [(_UIPanelInternalState *)self configuration];
  [v11 setConfiguration:v13];

  [v8 leadingWidth];
  double v15 = v14;
  [v11 leadingWidth];
  double v17 = v15 - v16;
  [v11 _leadingOverlayWidth];
  [v11 _setLeadingOverlayWidth:v18 + v17];
  [v8 trailingWidth];
  double v20 = v19;
  [v11 trailingWidth];
  double v22 = v20 - v21;
  [v11 _trailingOverlayWidth];
  [v11 _setTrailingOverlayWidth:v23 + v22];
  [v8 supplementaryWidth];
  double v25 = v24;
  [v11 supplementaryWidth];
  double v27 = v25 - v26;
  [v11 _supplementaryOverlayWidth];
  [v11 _setSupplementaryOverlayWidth:v28 + v27];
  [v8 leadingWidth];
  objc_msgSend(v11, "setLeadingWidth:");
  [v8 leadingOffscreenWidth];
  objc_msgSend(v11, "setLeadingOffscreenWidth:");
  [v8 trailingWidth];
  objc_msgSend(v11, "setTrailingWidth:");
  [v8 trailingOffscreenWidth];
  objc_msgSend(v11, "setTrailingOffscreenWidth:");
  [v8 supplementaryWidth];
  objc_msgSend(v11, "setSupplementaryWidth:");
  [v8 supplementaryOffscreenWidth];
  objc_msgSend(v11, "setSupplementaryOffscreenWidth:");
  [v8 rubberBandInset];
  objc_msgSend(v11, "set_rubberBandInset:");
  double v29 = [(_UIPanelInternalState *)self configuration];
  int v30 = a4 & 1;
  if ([v29 leadingMayBeHidden])
  {
    [v8 leadingWidth];
    if (v31 <= 0.0 && ([v8 leadingOffscreenWidth], v32 <= 0.0)) {
      int v33 = a4 & 1;
    }
    else {
      int v33 = 1;
    }
  }
  else
  {
    int v33 = 0;
  }
  int64_t v102 = a4;
  id v103 = v9;
  if ([v29 supplementaryEdge] || !objc_msgSend(v29, "supplementaryMayBeHidden"))
  {
    int v30 = 0;
    goto LABEL_13;
  }
  [v8 supplementaryWidth];
  if (v34 <= 0.0)
  {
    [v8 supplementaryOffscreenWidth];
    if (v35 <= 0.0)
    {
LABEL_13:
      double v36 = 0.0;
      if ((v33 | v30) != 1) {
        goto LABEL_62;
      }
      goto LABEL_14;
    }
  }
  int v30 = 1;
LABEL_14:
  LODWORD(v98) = v12;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v37 = v9;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v108 objects:v113 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v109;
    double v41 = 0.0;
    double v42 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        double v44 = v42;
        if (*(void *)v109 != v40) {
          objc_enumerationMutation(v37);
        }
        double v45 = *(void **)(*((void *)&v108 + 1) + 8 * i);
        objc_msgSend(v45, "leadingWidth", v98);
        double v47 = fmin(v41, v46);
        if (v41 == 0.0) {
          double v47 = v46;
        }
        if (v46 > 0.0) {
          double v41 = v47;
        }
        [v45 supplementaryWidth];
        if (v48 > 0.0)
        {
          double v42 = v48;
          if (v44 != 0.0) {
            double v42 = fmin(v44, v48);
          }
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v108 objects:v113 count:16];
    }
    while (v39);
  }
  else
  {
    double v41 = 0.0;
    double v42 = 0.0;
  }

  [v8 leadingWidth];
  double v50 = v49;
  [v8 supplementaryWidth];
  double v52 = v51;
  if (v33)
  {
    [v8 leadingOffscreenWidth];
    a4 = v102;
    int v53 = v98;
    if (v54 <= 0.0)
    {
      char v55 = 0;
      if (v41 > 0.0 && v50 < v41) {
        char v55 = v102 | (v50 > 0.0);
      }
    }
    else
    {
      char v55 = 1;
    }
  }
  else
  {
    char v55 = 0;
    a4 = v102;
    int v53 = v98;
  }
  BOOL v56 = 0;
  if (v42 > 0.0) {
    int v57 = v30;
  }
  else {
    int v57 = 0;
  }
  if (v57 == 1 && v52 < v42) {
    BOOL v56 = v52 > 0.0 || (a4 & 5) == 5;
  }
  double v36 = 0.0;
  if (v55)
  {
    [v11 setLeadingWidth:v41];
    [v11 supplementaryWidth];
    BOOL v60 = v41 <= 0.0 || v59 <= 0.0;
    double v36 = v60 ? 0.0 : (v41 - v50) * 0.5;
    objc_msgSend(v11, "setLeadingDragOffset:", v41 - v50 - v36, v98);
    if (v53) {
      [v11 _setLeadingOverlayWidth:v41];
    }
  }
  if (v56)
  {
    [v11 setSupplementaryWidth:v42];
    [v11 setSupplementaryDragOffset:v42 - v52];
    if (v101) {
      [v11 _setSupplementaryOverlayWidth:v42];
    }
  }
  else
  {
    [v8 supplementaryOffscreenWidth];
    if (v61 > 0.0)
    {
      [v8 supplementaryWidth];
      if (v62 == 0.0)
      {
        [v11 supplementaryOffscreenWidth];
        objc_msgSend(v11, "setSupplementaryDragOffset:");
      }
    }
  }
  id v9 = v103;
  if (v36 != 0.0)
  {
    [v11 supplementaryDragOffset];
    [v11 setSupplementaryDragOffset:v36 + v63];
  }
LABEL_62:
  unint64_t v64 = ((unint64_t)a4 >> 1) & 1;
  if (objc_msgSend(v29, "trailingMayBeHidden", v98))
  {
    [v8 trailingWidth];
    if (v65 <= 0.0 && ([v8 trailingOffscreenWidth], v66 <= 0.0)) {
      unint64_t v67 = ((unint64_t)a4 >> 1) & 1;
    }
    else {
      LODWORD(v67) = 1;
    }
  }
  else
  {
    LODWORD(v67) = 0;
  }
  if ([v29 supplementaryEdge] != 1 || !objc_msgSend(v29, "supplementaryMayBeHidden"))
  {
    LODWORD(v69) = 0;
    goto LABEL_77;
  }
  [v8 supplementaryWidth];
  if (v68 <= 0.0)
  {
    [v8 supplementaryOffscreenWidth];
    unint64_t v69 = ((unint64_t)a4 >> 1) & 1;
    if (v70 <= 0.0)
    {
LABEL_77:
      if ((v67 | v69) != 1) {
        goto LABEL_125;
      }
      goto LABEL_78;
    }
  }
  LODWORD(v69) = 1;
LABEL_78:
  unint64_t v99 = v64;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v71 = v9;
  uint64_t v72 = [v71 countByEnumeratingWithState:&v104 objects:v112 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v105;
    double v75 = 0.0;
    double v76 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v73; ++j)
      {
        double v78 = v76;
        if (*(void *)v105 != v74) {
          objc_enumerationMutation(v71);
        }
        uint64_t v79 = *(void **)(*((void *)&v104 + 1) + 8 * j);
        objc_msgSend(v79, "trailingWidth", v99);
        double v81 = fmin(v75, v80);
        if (v75 == 0.0) {
          double v81 = v80;
        }
        if (v80 > 0.0) {
          double v75 = v81;
        }
        [v79 supplementaryWidth];
        if (v82 > 0.0)
        {
          double v76 = v82;
          if (v78 != 0.0) {
            double v76 = fmin(v78, v82);
          }
        }
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v104 objects:v112 count:16];
    }
    while (v73);
  }
  else
  {
    double v75 = 0.0;
    double v76 = 0.0;
  }

  [v8 trailingWidth];
  double v84 = v83;
  [v8 supplementaryWidth];
  double v86 = v85;
  if (v67)
  {
    [v8 trailingOffscreenWidth];
    if (v87 <= 0.0)
    {
      int v88 = 0;
      if (v75 > 0.0 && v84 < v75)
      {
        if (v84 > 0.0) {
          int v88 = 1;
        }
        else {
          int v88 = v99;
        }
      }
    }
    else
    {
      int v88 = 1;
    }
  }
  else
  {
    int v88 = 0;
  }
  BOOL v89 = 0;
  if (v76 > 0.0) {
    int v90 = v69;
  }
  else {
    int v90 = 0;
  }
  if (v90 == 1 && v86 < v76) {
    BOOL v89 = v86 > 0.0 || (v102 & 6) == 6;
  }
  if (v88)
  {
    [v11 setTrailingWidth:v75];
    [v11 supplementaryWidth];
    if (v75 > 0.0 && v92 > 0.0) {
      double v36 = (v75 - v84) * 0.5;
    }
    objc_msgSend(v11, "setTrailingDragOffset:", v75 - v84 - v36, v99);
    if (v100) {
      [v11 _setTrailingOverlayWidth:v75];
    }
  }
  if (v89)
  {
    [v11 setSupplementaryWidth:v76];
    [v11 setSupplementaryDragOffset:v76 - v86];
    if (v101) {
      [v11 _setSupplementaryOverlayWidth:v76];
    }
  }
  else
  {
    [v8 supplementaryOffscreenWidth];
    if (v94 > 0.0)
    {
      [v8 supplementaryWidth];
      if (v95 == 0.0)
      {
        [v11 supplementaryOffscreenWidth];
        objc_msgSend(v11, "setSupplementaryDragOffset:");
      }
    }
  }
  id v9 = v103;
  if (v36 != 0.0)
  {
    [v11 supplementaryDragOffset];
    [v11 setSupplementaryDragOffset:v36 + v96];
  }
LABEL_125:

  return v11;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)_UIPanelInternalState;
  v3 = [(_UIPanelInternalState *)&v10 description];
  id v4 = (void *)[v3 mutableCopy];

  if (os_variant_has_internal_diagnostics())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "appendFormat:", @" delegate=%p", WeakRetained);

    if (self->_leadingViewController) {
      objc_msgSend(v4, "appendFormat:", @" leading=%p", self->_leadingViewController);
    }
    if (self->_trailingViewController) {
      objc_msgSend(v4, "appendFormat:", @" trailing=%p", self->_trailingViewController);
    }
    if (self->_supplementaryViewController) {
      objc_msgSend(v4, "appendFormat:", @" supplementary=%p", self->_supplementaryViewController);
    }
    if (self->_mainViewController) {
      objc_msgSend(v4, "appendFormat:", @" main=%p", self->_mainViewController);
    }
    if (self->_collapsedViewController) {
      objc_msgSend(v4, "appendFormat:", @" collapsed=%p", self->_collapsedViewController);
    }
    if (self->_preservedDetailController) {
      objc_msgSend(v4, "appendFormat:", @" preserved=%p", self->_preservedDetailController);
    }
    if (self->_animationState) {
      objc_msgSend(v4, "appendFormat:", @" animState=%p", self->_animationState);
    }
    objc_msgSend(v4, "appendFormat:", @" stateReq=%p config=%p", self->_stateRequest, self->_configuration);
    int64_t collapsedState = self->_collapsedState;
    if (collapsedState == 1)
    {
      id v9 = @" collapsing";
    }
    else
    {
      id v8 = @" expanding";
      if (!collapsedState) {
        id v8 = @" expanded";
      }
      if (collapsedState == 2) {
        id v9 = @" collapsed";
      }
      else {
        id v9 = v8;
      }
    }
    [v4 appendString:v9];
  }
  return v4;
}

@end