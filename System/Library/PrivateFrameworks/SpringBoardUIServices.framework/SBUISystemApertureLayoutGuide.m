@interface SBUISystemApertureLayoutGuide
+ (BOOL)prepareLayoutGuidesForViewControllerIfNeeded:(id)a3 onlyIfEmpty:(BOOL)a4;
+ (void)_addUnpreparedLayoutGuide:(id)a3;
+ (void)_enumerateSystemApertureRootLayoutGuidesForViewController:(id)a3 usingBlock:(id)a4;
+ (void)_enumerateUnpreparedSystemApertureLayoutGuides:(id)a3;
+ (void)_removeUnpreparedLayoutGuideIfNeeded:(id)a3;
- (BOOL)_createOrUpdateConcentricRootLayoutGuideWithWindow:(id)a3;
- (BOOL)_createOrUpdateConstraintsIfIsRootAndInAWindow;
- (BOOL)_createOrUpdateFixedFrameRootConstraintsWithWindow:(id)a3;
- (BOOL)_createOrUpdateInsetBasedRootGuideWithWindow:(id)a3;
- (BOOL)_requiresExplicitFrame;
- (BOOL)_requiresFloatableFixedSize;
- (BOOL)_requiresInitialSetup;
- (BOOL)_requiresInsets;
- (BOOL)constraintNeedsActivation:(id)a3;
- (NSArray)constraints;
- (id)_rootGuide;
- (id)_rootGuideView;
- (void)_activateConstraintsWithRootLayoutGuide;
- (void)_createOrUpdateConstraintsIfIsRootAndInAWindow;
- (void)activateConstraintsIfNeeded;
- (void)prepareIfNeeded;
- (void)setConstraints:(id)a3;
@end

@implementation SBUISystemApertureLayoutGuide

+ (BOOL)prepareLayoutGuidesForViewControllerIfNeeded:(id)a3 onlyIfEmpty:(BOOL)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__SBUISystemApertureLayoutGuide_prepareLayoutGuidesForViewControllerIfNeeded_onlyIfEmpty___block_invoke;
  v12[3] = &unk_1E5CCD350;
  BOOL v13 = a4;
  v12[4] = &v14;
  [a1 _enumerateSystemApertureRootLayoutGuidesForViewController:v6 usingBlock:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__SBUISystemApertureLayoutGuide_prepareLayoutGuidesForViewControllerIfNeeded_onlyIfEmpty___block_invoke_2;
  v9[3] = &unk_1E5CCD378;
  id v7 = v6;
  id v10 = v7;
  v11 = &v14;
  [a1 _enumerateUnpreparedSystemApertureLayoutGuides:v9];
  LOBYTE(a1) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)a1;
}

uint64_t __90__SBUISystemApertureLayoutGuide_prepareLayoutGuidesForViewControllerIfNeeded_onlyIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  id v7 = v3;
  if (!*(unsigned char *)(a1 + 40) || ([v3 layoutFrame], uint64_t IsEmpty = CGRectIsEmpty(v9), v4 = v7, IsEmpty))
  {
    uint64_t IsEmpty = [v4 _createOrUpdateConstraintsIfIsRootAndInAWindow];
    v4 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= IsEmpty;
  }
  return MEMORY[0x1F41817F8](IsEmpty, v4);
}

void __90__SBUISystemApertureLayoutGuide_prepareLayoutGuidesForViewControllerIfNeeded_onlyIfEmpty___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 owningView];
  v4 = [*(id *)(a1 + 32) viewIfLoaded];
  int v5 = [v3 isDescendantOfView:v4];

  if (v5)
  {
    [v6 prepareIfNeeded];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v6 _requiresInitialSetup] ^ 1;
  }
}

+ (void)_addUnpreparedLayoutGuide:(id)a3
{
  id v3 = a3;
  v4 = (void *)SBUISystemApertureUnpreparedLayoutGuides;
  id v7 = v3;
  if (!SBUISystemApertureUnpreparedLayoutGuides)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v6 = (void *)SBUISystemApertureUnpreparedLayoutGuides;
    SBUISystemApertureUnpreparedLayoutGuides = v5;

    id v3 = v7;
    v4 = (void *)SBUISystemApertureUnpreparedLayoutGuides;
  }
  [v4 addObject:v3];
}

+ (void)_removeUnpreparedLayoutGuideIfNeeded:(id)a3
{
  [(id)SBUISystemApertureUnpreparedLayoutGuides removeObject:a3];
  if (![(id)SBUISystemApertureUnpreparedLayoutGuides count])
  {
    id v3 = (void *)SBUISystemApertureUnpreparedLayoutGuides;
    SBUISystemApertureUnpreparedLayoutGuides = 0;
  }
}

+ (void)_enumerateUnpreparedSystemApertureLayoutGuides:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, void))a3;
  v4 = [(id)SBUISystemApertureUnpreparedLayoutGuides allObjects];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        v3[2](v3, *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (void)_enumerateSystemApertureRootLayoutGuidesForViewController:(id)a3 usingBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void))a4;
  uint64_t v6 = [a3 systemApertureElementContextPrivate];
  uint64_t v7 = [v6 layoutGuideRootView];

  uint64_t v8 = [v7 layoutGuides];
  long long v9 = objc_msgSend(v8, "bs_compactMap:", &__block_literal_global_11);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        v5[2](v5, *(void *)(*((void *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

id __102__SBUISystemApertureLayoutGuide__enumerateSystemApertureRootLayoutGuidesForViewController_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)prepareIfNeeded
{
  if ([(SBUISystemApertureLayoutGuide *)self _requiresInitialSetup])
  {
    uint64_t v3 = [(SBUISystemApertureLayoutGuide *)self owningView];
    id v4 = [(SBUISystemApertureLayoutGuide *)self _rootGuideView];
    if (v4)
    {
      if (v3 == v4) {
        [(SBUISystemApertureLayoutGuide *)self _createOrUpdateConstraintsIfIsRootAndInAWindow];
      }
      else {
        [(SBUISystemApertureLayoutGuide *)self _activateConstraintsWithRootLayoutGuide];
      }
    }
  }
  if ([(SBUISystemApertureLayoutGuide *)self _requiresInitialSetup])
  {
    +[SBUISystemApertureLayoutGuide _addUnpreparedLayoutGuide:self];
  }
  else
  {
    +[SBUISystemApertureLayoutGuide _removeUnpreparedLayoutGuideIfNeeded:self];
  }
}

- (void)activateConstraintsIfNeeded
{
  uint64_t v3 = [(SBUISystemApertureLayoutGuide *)self owningView];
  id v4 = [(SBUISystemApertureLayoutGuide *)self _rootGuideView];
  if ([v3 _isInAWindow])
  {
    if (v4)
    {
      if (![(SBUISystemApertureLayoutGuide *)self _requiresInitialSetup])
      {
        uint64_t v5 = [(SBUISystemApertureLayoutGuide *)self constraints];
        uint64_t v6 = [v5 count];

        if (v6)
        {
          uint64_t v7 = [(SBUISystemApertureLayoutGuide *)self constraints];
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __60__SBUISystemApertureLayoutGuide_activateConstraintsIfNeeded__block_invoke;
          v9[3] = &unk_1E5CCD3C0;
          void v9[4] = self;
          uint64_t v8 = objc_msgSend(v7, "bs_filter:", v9);

          if ([v8 count]) {
            [MEMORY[0x1E4F28DC8] activateConstraints:v8];
          }
        }
      }
    }
  }
}

uint64_t __60__SBUISystemApertureLayoutGuide_activateConstraintsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) constraintNeedsActivation:a2];
}

- (BOOL)constraintNeedsActivation:(id)a3
{
  id v4 = a3;
  if ([v4 isActive])
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = [v4 firstItem];

    uint64_t v7 = [v4 secondItem];
    uint64_t v8 = v7;
    if (v6 != self)
    {

      if (v8 == self)
      {
        uint64_t v8 = [v4 firstItem];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v12 = v11;

    if (!v12)
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = v10;
      if (v13)
      {
        if (objc_opt_isKindOfClass()) {
          long long v15 = v14;
        }
        else {
          long long v15 = 0;
        }
      }
      else
      {
        long long v15 = 0;
      }
      long long v16 = v15;

      uint64_t v12 = [(SBUISystemApertureLayoutGuide *)v16 owningView];
    }
    long long v17 = [(SBUISystemApertureLayoutGuide *)self owningView];
    long long v18 = v17;
    if (v12 && ([v17 isDescendantOfView:v12] & 1) == 0) {
      char v5 = [(SBUISystemApertureLayoutGuide *)v12 isDescendantOfView:v18];
    }
    else {
      char v5 = 1;
    }
  }
  return v5;
}

- (id)_rootGuideView
{
  id v2 = [(SBUISystemApertureLayoutGuide *)self owningView];
  uint64_t v3 = [v2 systemApertureElementContextPrivate];
  id v4 = [v3 layoutGuideRootView];

  return v4;
}

- (id)_rootGuide
{
  uint64_t v3 = [(SBUISystemApertureLayoutGuide *)self _rootGuideView];
  id v4 = [(SBUISystemApertureLayoutGuide *)self identifier];
  char v5 = objc_msgSend(v3, "SBUISA_systemApertureLayoutGuideWithIdentifier:", v4);
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

  return v9;
}

- (void)_activateConstraintsWithRootLayoutGuide
{
  v24[4] = *MEMORY[0x1E4F143B8];
  if (![(SBUISystemApertureLayoutGuide *)self _requiresInitialSetup])
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBUISystemApertureLayoutGuide.m" lineNumber:220 description:@"Illegal attempt to activateConstraintsWithRootLayoutGuide when requiresInitialSetup is NO."];
  }
  id v4 = [(SBUISystemApertureLayoutGuide *)self _rootGuide];
  char v5 = [(SBUISystemApertureLayoutGuide *)v4 owningView];
  objc_storeWeak((id *)&self->_currentRootGuideView, v5);

  if (v4 != self)
  {
    uint64_t v6 = [(SBUISystemApertureLayoutGuide *)self constraints];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28DC8];
      id v9 = [(SBUISystemApertureLayoutGuide *)self constraints];
      [v8 deactivateConstraints:v9];
    }
    if (v4)
    {
      v23 = [(SBUISystemApertureLayoutGuide *)self centerXAnchor];
      v22 = [(SBUISystemApertureLayoutGuide *)v4 centerXAnchor];
      v21 = [v23 constraintEqualToAnchor:v22];
      v24[0] = v21;
      uint64_t v20 = [(SBUISystemApertureLayoutGuide *)self centerYAnchor];
      v19 = [(SBUISystemApertureLayoutGuide *)v4 centerYAnchor];
      id v10 = [v20 constraintEqualToAnchor:v19];
      v24[1] = v10;
      uint64_t v11 = [(SBUISystemApertureLayoutGuide *)self widthAnchor];
      uint64_t v12 = [(SBUISystemApertureLayoutGuide *)v4 widthAnchor];
      uint64_t v13 = [v11 constraintEqualToAnchor:v12];
      v24[2] = v13;
      uint64_t v14 = [(SBUISystemApertureLayoutGuide *)self heightAnchor];
      long long v15 = [(SBUISystemApertureLayoutGuide *)v4 heightAnchor];
      long long v16 = [v14 constraintEqualToAnchor:v15];
      v24[3] = v16;
      long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];

      [(SBUISystemApertureLayoutGuide *)self setConstraints:v17];
      [MEMORY[0x1E4F28DC8] activateConstraints:v17];
    }
  }
}

- (BOOL)_createOrUpdateConstraintsIfIsRootAndInAWindow
{
  uint64_t v3 = [(SBUISystemApertureLayoutGuide *)self owningView];
  id v4 = [v3 window];
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v3;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v6 = v9;
  }
  id v10 = [(SBUISystemApertureLayoutGuide *)self _rootGuide];

  BOOL v11 = 0;
  if (v10 != self || !v6) {
    goto LABEL_18;
  }
  if ([(SBUISystemApertureLayoutGuide *)self _requiresFloatableFixedSize])
  {
    BOOL v12 = [(SBUISystemApertureLayoutGuide *)self _createOrUpdateConcentricRootLayoutGuideWithWindow:v6];
LABEL_17:
    BOOL v11 = v12;
LABEL_18:

    return v11;
  }
  if ([(SBUISystemApertureLayoutGuide *)self _requiresInsets])
  {
    BOOL v12 = [(SBUISystemApertureLayoutGuide *)self _createOrUpdateInsetBasedRootGuideWithWindow:v6];
    goto LABEL_17;
  }
  if ([(SBUISystemApertureLayoutGuide *)self _requiresExplicitFrame])
  {
    BOOL v12 = [(SBUISystemApertureLayoutGuide *)self _createOrUpdateFixedFrameRootConstraintsWithWindow:v6];
    goto LABEL_17;
  }
  uint64_t v14 = [NSString stringWithFormat:@"Unhandled layout guide identifier"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBUISystemApertureLayoutGuide _createOrUpdateConstraintsIfIsRootAndInAWindow]();
  }
  [v14 UTF8String];
  BOOL result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)_requiresInitialSetup
{
  uint64_t v3 = [(SBUISystemApertureLayoutGuide *)self constraints];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 1;
  }
  char v5 = [(SBUISystemApertureLayoutGuide *)self owningView];
  id v6 = [(SBUISystemApertureLayoutGuide *)self _rootGuideView];

  if (v5 == v6) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentRootGuideView);
  id v8 = [(SBUISystemApertureLayoutGuide *)self _rootGuideView];
  BOOL v9 = WeakRetained != v8;

  return v9;
}

- (BOOL)_requiresExplicitFrame
{
  if ([(SBUISystemApertureLayoutGuide *)self _requiresInsets]) {
    return 0;
  }
  else {
    return ![(SBUISystemApertureLayoutGuide *)self _requiresFloatableFixedSize];
  }
}

- (BOOL)_requiresInsets
{
  id v2 = [(SBUISystemApertureLayoutGuide *)self identifier];
  if ([v2 isEqualToString:@"SBUISystemApertureCustomControlsContentLayoutGuideIdentifier"]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isEqualToString:@"SBUISystemApertureLegibleContentLayoutMarginsGuideIdentifier"];
  }

  return v3;
}

- (BOOL)_requiresFloatableFixedSize
{
  id v2 = [(SBUISystemApertureLayoutGuide *)self identifier];
  if ([v2 isEqualToString:@"SBUISystemApertureLeadingConcentricContentLayoutGuideIdentifier"]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isEqualToString:@"SBUISystemApertureTrailingConcentricContentLayoutGuideIdentifier"];
  }

  return v3;
}

- (BOOL)_createOrUpdateFixedFrameRootConstraintsWithWindow:(id)a3
{
  v138[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SBUISystemApertureLayoutGuide *)self _requiresExplicitFrame])
  {
    v123 = [NSString stringWithFormat:@"Don't set a frame on a layout guide that doesn't require one."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBUISystemApertureLayoutGuide _createOrUpdateFixedFrameRootConstraintsWithWindow:]();
    }
LABEL_49:
    [v123 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A7633784);
  }
  char v5 = [v4 windowScene];
  id v6 = [v5 _FBSScene];
  uint64_t v7 = [v6 settings];

  id v8 = [(SBUISystemApertureLayoutGuide *)self identifier];
  BOOL v9 = (double *)MEMORY[0x1E4F1DB28];
  double v10 = *MEMORY[0x1E4F1DB28];
  id v11 = [(SBUISystemApertureLayoutGuide *)self owningView];
  uint64_t v12 = objc_msgSend(v11, "SBUISA_layoutMode");
  if ([v8 isEqualToString:@"SBUISystemApertureObstructedAreaLayoutGuideIdentifier"])
  {
    objc_msgSend(v7, "SBUISA_obstructedAreaLayoutFrame");
LABEL_10:
    double x = v13;
    double v18 = v14;
    double v19 = v15;
    double v20 = v16;
    goto LABEL_11;
  }
  if ([v8 isEqualToString:@"SBUISystemApertureLeadingAreaLayoutGuideIdentifier"])
  {
    objc_msgSend(v7, "SBUISA_resolvedLeadingViewFrame");
    goto LABEL_10;
  }
  if ([v8 isEqualToString:@"SBUISystemApertureTrailingAreaLayoutGuideIdentifier"])
  {
    objc_msgSend(v7, "SBUISA_resolvedTrailingViewFrame");
    goto LABEL_10;
  }
  if ([v8 isEqualToString:@"SBUISystemApertureMinimalAreaLayoutGuideIdentifier"])
  {
    objc_msgSend(v7, "SBUISA_resolvedMinimalViewFrame");
    goto LABEL_10;
  }
  CGFloat recta = v10;
  if ([v8 isEqualToString:@"kSBUISystemApertureMinimumContentSizeLayoutMarginsGuideIdentifier"])
  {
    [v4 bounds];
    [v4 bounds];
    CGRectGetMinY(v149);
    [v4 bounds];
    double MidX = CGRectGetMidX(v150);
    if (v12 != 2)
    {
      v78 = objc_msgSend(v11, "SBUISA_systemApertureObstructedAreaLayoutGuide", MidX);
      [v78 layoutFrame];
      objc_msgSend(v4, "convertRect:fromView:", v11);
      CGFloat v80 = v79;
      CGFloat v82 = v81;
      CGFloat v84 = v83;
      CGFloat v86 = v85;

      v151.origin.double x = v80;
      v151.origin.CGFloat y = v82;
      v151.size.CGFloat width = v84;
      v151.size.CGFloat height = v86;
      CGRectIsEmpty(v151);
    }
    [v4 bounds];
    uint64_t v124 = 0;
    UIRectCenteredXInRectScale();
    double x = v87;
    double v18 = v88;
    double v19 = v89;
    double v20 = v90;
    goto LABEL_43;
  }
  if (![v8 isEqualToString:@"SBUISystemApertureMaximumContentSizeLayoutMarginsGuideIdentifier"])
  {
    v123 = [NSString stringWithFormat:@"Unhandled layout guide identifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBUISystemApertureLayoutGuide _createOrUpdateFixedFrameRootConstraintsWithWindow:]();
    }
    goto LABEL_49;
  }
  v91 = objc_msgSend(v11, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  [v91 layoutFrame];
  objc_msgSend(v4, "convertRect:fromView:", v11);
  double v93 = v92;
  CGFloat MinY = v94;
  CGFloat v97 = v96;
  CGFloat v99 = v98;

  if (v12 != 4)
  {
    if (v12 == 3)
    {
      v104 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
      [v104 maximumCompactSize];
      CGFloat v106 = v105;
      CGFloat v108 = v107;

      v152.origin.double x = v93;
      v152.origin.CGFloat y = MinY;
      v152.size.CGFloat width = v97;
      v152.size.CGFloat height = v99;
      CGFloat MinY = CGRectGetMinY(v152);
      v109 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
      [v109 maximumExpandedSize];
      double v111 = v110;
      v153.origin.double x = recta;
      v153.origin.CGFloat y = MinY;
      v153.size.CGFloat width = v106;
      v153.size.CGFloat height = v108;
      double v93 = (v111 - CGRectGetWidth(v153)) * 0.5;

      CGFloat v99 = v108;
      CGFloat v97 = v106;
      goto LABEL_42;
    }
    if (v12 != 2)
    {
      v112 = [(SBUISystemApertureLayoutGuide *)self constraints];
      uint64_t v113 = [v112 count];

      if (v113)
      {
        [(SBUISystemApertureLayoutGuide *)self layoutFrame];
        objc_msgSend(v4, "convertRect:fromView:", v11);
        CGFloat y = v154.origin.y;
        CGFloat width = v154.size.width;
        CGFloat height = v154.size.height;
        CGFloat rect_24a = v154.origin.x;
        double v117 = CGRectGetWidth(v154);
        v155.origin.double x = v93;
        v155.origin.CGFloat y = MinY;
        v155.size.CGFloat width = v97;
        v155.size.CGFloat height = v99;
        if (v117 < CGRectGetWidth(v155))
        {
          CGFloat v99 = height;
          CGFloat v97 = width;
          CGFloat MinY = y;
          double v93 = rect_24a;
        }
      }
      goto LABEL_42;
    }
  }
  [v4 bounds];
  double v93 = v100;
  CGFloat MinY = v101;
  CGFloat v97 = v102;
  CGFloat v99 = v103;
LABEL_42:
  v118 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
  [v118 maximumExpandedSize];

  BSRectWithSize();
  [v4 bounds];
  uint64_t v124 = 0;
  UIRectCenteredXInRectScale();
  v159.origin.double x = v119;
  v159.origin.CGFloat y = v120;
  v159.size.CGFloat width = v121;
  v159.size.CGFloat height = v122;
  v156.origin.double x = v93;
  v156.origin.CGFloat y = MinY;
  v156.size.CGFloat width = v97;
  v156.size.CGFloat height = v99;
  CGRect v157 = CGRectIntersection(v156, v159);
  double x = v157.origin.x;
  double v18 = v157.origin.y;
  double v19 = v157.size.width;
  double v20 = v157.size.height;
LABEL_43:
  double v10 = recta;
LABEL_11:
  objc_msgSend(v11, "bounds", v124);
  CGFloat v22 = v21;
  CGFloat rect_16 = v24;
  CGFloat rect_24 = v23;
  CGFloat v26 = v25;
  if (v11 != v4)
  {
    objc_msgSend(v4, "convertRect:toView:", v11, x, v18, v19, v20);
    double x = v27;
    double v18 = v28;
    double v19 = v29;
    double v20 = v30;
  }
  rect_8 = v4;
  v139.origin.double x = v22;
  v139.size.CGFloat height = rect_16;
  v139.origin.CGFloat y = rect_24;
  v139.size.CGFloat width = v26;
  v158.origin.double x = x;
  v158.origin.CGFloat y = v18;
  v158.size.CGFloat width = v19;
  v158.size.CGFloat height = v20;
  CGRect v140 = CGRectIntersection(v139, v158);
  CGFloat v31 = v140.origin.x;
  CGFloat v32 = v140.origin.y;
  CGFloat v33 = v140.size.width;
  CGFloat v34 = v140.size.height;
  if (CGRectIsNull(v140)) {
    goto LABEL_16;
  }
  v141.origin.double x = v31;
  v141.origin.CGFloat y = v32;
  v141.size.CGFloat width = v33;
  v141.size.CGFloat height = v34;
  if (CGRectIsInfinite(v141)
    || (v142.origin.double x = v31, v142.origin.y = v32, v142.size.width = v33, v142.size.height = v34, CGRectIsEmpty(v142)))
  {
LABEL_16:
    CGFloat v32 = v9[1];
    CGFloat v33 = v9[2];
    CGFloat v31 = v10;
    CGFloat v34 = v9[3];
  }
  v143.origin.double x = v31;
  v143.origin.CGFloat y = v32;
  v143.size.CGFloat width = v33;
  v143.size.CGFloat height = v34;
  double rectb = CGRectGetMidX(v143);
  v144.origin.double x = v31;
  v144.origin.CGFloat y = v32;
  v144.size.CGFloat width = v33;
  v144.size.CGFloat height = v34;
  double MidY = CGRectGetMidY(v144);
  v145.origin.double x = v22;
  v145.origin.CGFloat y = rect_24;
  v145.size.CGFloat width = v26;
  v145.size.CGFloat height = rect_16;
  double rect = rectb - CGRectGetMidX(v145);
  v146.origin.double x = v22;
  v146.origin.CGFloat y = rect_24;
  v146.size.CGFloat width = v26;
  v146.size.CGFloat height = rect_16;
  double v35 = MidY - CGRectGetMidY(v146);
  v147.origin.double x = v31;
  v147.origin.CGFloat y = v32;
  v147.size.CGFloat width = v33;
  v147.size.CGFloat height = v34;
  double v36 = CGRectGetWidth(v147);
  v148.origin.double x = v31;
  v148.origin.CGFloat y = v32;
  v148.size.CGFloat width = v33;
  v148.size.CGFloat height = v34;
  double v37 = CGRectGetHeight(v148);
  v38 = [(SBUISystemApertureLayoutGuide *)self constraints];
  uint64_t v39 = [v38 count];

  if (v39)
  {
    v40 = [(SBUISystemApertureLayoutGuide *)self constraints];
    v41 = [v40 objectAtIndexedSubscript:0];
    [v41 constant];
    BOOL v43 = v42 != rect;

    v44 = [(SBUISystemApertureLayoutGuide *)self constraints];
    v45 = [v44 objectAtIndexedSubscript:1];
    [v45 constant];
    if (v46 != v35) {
      BOOL v43 = 1;
    }

    v47 = [(SBUISystemApertureLayoutGuide *)self constraints];
    v48 = [v47 objectAtIndexedSubscript:2];
    [v48 constant];
    if (v49 != v36) {
      BOOL v43 = 1;
    }

    v50 = [(SBUISystemApertureLayoutGuide *)self constraints];
    v51 = [v50 objectAtIndexedSubscript:3];
    [v51 constant];
    BOOL v53 = v52 != v37 || v43;

    v54 = [(SBUISystemApertureLayoutGuide *)self constraints];
    v55 = [v54 objectAtIndexedSubscript:0];
    [v55 setConstant:rect];

    v56 = [(SBUISystemApertureLayoutGuide *)self constraints];
    v57 = [v56 objectAtIndexedSubscript:1];
    [v57 setConstant:v35];

    v58 = [(SBUISystemApertureLayoutGuide *)self constraints];
    v59 = [v58 objectAtIndexedSubscript:2];
    [v59 setConstant:v36];

    v60 = [(SBUISystemApertureLayoutGuide *)self constraints];
    v61 = [v60 objectAtIndexedSubscript:3];
    [v61 setConstant:v37];

    v62 = [(SBUISystemApertureLayoutGuide *)self constraints];
    v63 = [v62 firstObject];
    char v64 = [v63 isActive];

    if ((v64 & 1) == 0)
    {
      v65 = (void *)MEMORY[0x1E4F28DC8];
      v66 = [(SBUISystemApertureLayoutGuide *)self constraints];
      [v65 activateConstraints:v66];
    }
  }
  else
  {
    v127 = [(SBUISystemApertureLayoutGuide *)self centerXAnchor];
    v125 = [v11 centerXAnchor];
    rectc = [v127 constraintEqualToAnchor:v125 constant:rect];
    v138[0] = rectc;
    [(SBUISystemApertureLayoutGuide *)self centerYAnchor];
    v67 = rect_24b = v7;
    [v11 centerYAnchor];
    v68 = rect_16a = v8;
    v69 = [v67 constraintEqualToAnchor:v68 constant:v35];
    v138[1] = v69;
    v70 = [(SBUISystemApertureLayoutGuide *)self widthAnchor];
    [v70 constraintEqualToConstant:v36];
    v72 = v71 = v11;
    v138[2] = v72;
    v73 = [(SBUISystemApertureLayoutGuide *)self heightAnchor];
    v74 = [v73 constraintEqualToConstant:v37];
    v138[3] = v74;
    v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:4];

    id v11 = v71;
    id v8 = rect_16a;

    uint64_t v7 = rect_24b;
    [(SBUISystemApertureLayoutGuide *)self setConstraints:v75];
    [MEMORY[0x1E4F28DC8] activateConstraints:v75];

    BOOL v53 = 1;
  }

  return v53;
}

- (BOOL)_createOrUpdateConcentricRootLayoutGuideWithWindow:(id)a3
{
  v53[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SBUISystemApertureLayoutGuide *)self _requiresFloatableFixedSize])
  {
    double v42 = [NSString stringWithFormat:@"Illegal attempt to use floatable fixed size"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBUISystemApertureLayoutGuide _createOrUpdateConcentricRootLayoutGuideWithWindow:]();
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A7633CB4);
  }
  double v52 = [(SBUISystemApertureLayoutGuide *)self identifier];
  char v5 = [(SBUISystemApertureLayoutGuide *)self owningView];
  id v6 = [v5 systemApertureHostedElementContext];
  uint64_t v7 = [v6 systemApertureElement];
  id v8 = [v7 view];

  BOOL v9 = [v4 windowScene];
  double v10 = [v9 _FBSScene];
  id v11 = [v10 settings];

  objc_msgSend(v11, "SBUISA_obstructedAreaLayoutFrame");
  double v13 = v12;
  if (![v8 isDescendantOfView:v5])
  {
    BOOL v22 = 0;
    goto LABEL_24;
  }
  double v14 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
  [v14 expandedConcentricAreaSize];
  double v16 = v15;
  double v18 = v17;

  uint64_t v19 = objc_msgSend(v5, "SBUISA_layoutMode");
  if ((unint64_t)(v19 + 1) < 4)
  {
    double v13 = v13 * 0.5;
LABEL_5:
    double v18 = v13;
    goto LABEL_6;
  }
  if (v19 == 3) {
    goto LABEL_5;
  }
  if (v19 == 4)
  {
    double v13 = v16;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
LABEL_6:
  double v20 = [(SBUISystemApertureLayoutGuide *)self constraints];
  if ([v52 isEqualToString:@"SBUISystemApertureLeadingConcentricContentLayoutGuideIdentifier"])
  {
    uint64_t v21 = [v8 leadingAnchor];
    [(SBUISystemApertureLayoutGuide *)self leadingAnchor];
  }
  else
  {
    uint64_t v21 = [v8 trailingAnchor];
    [(SBUISystemApertureLayoutGuide *)self trailingAnchor];
  double v23 = };
  v51 = v11;
  if ([v20 count])
  {
    v48 = v23;
    double v24 = [v20 objectAtIndexedSubscript:0];
    [v24 constant];
    v50 = (void *)v21;
    if (v25 == v13)
    {
      CGFloat v26 = [v20 objectAtIndexedSubscript:1];
      [v26 constant];
      BOOL v22 = v27 != v18;
    }
    else
    {
      BOOL v22 = 1;
    }

    CGFloat v34 = [v20 objectAtIndexedSubscript:0];
    [v34 setConstant:v13];

    double v35 = [v20 objectAtIndexedSubscript:1];
    [v35 setConstant:v18];

    double v36 = [(SBUISystemApertureLayoutGuide *)self constraints];
    double v37 = [v36 firstObject];
    if ([v37 isActive])
    {
    }
    else
    {
      int v38 = [v5 isDescendantOfView:v8];

      if (v38)
      {
        uint64_t v39 = (void *)MEMORY[0x1E4F28DC8];
        v40 = [(SBUISystemApertureLayoutGuide *)self constraints];
        [v39 activateConstraints:v40];
      }
    }
    double v23 = v48;
    CGFloat v33 = v50;
  }
  else
  {
    v47 = [(SBUISystemApertureLayoutGuide *)self widthAnchor];
    double v46 = [v47 constraintEqualToConstant:v13];
    v53[0] = v46;
    v45 = [(SBUISystemApertureLayoutGuide *)self heightAnchor];
    v44 = [v45 constraintEqualToConstant:v18];
    v53[1] = v44;
    BOOL v43 = [(SBUISystemApertureLayoutGuide *)self topAnchor];
    double v28 = [v8 topAnchor];
    double v29 = [v43 constraintEqualToAnchor:v28];
    v53[2] = v29;
    [v23 constraintEqualToAnchor:v21];
    v31 = double v30 = (void *)v21;
    v53[3] = v31;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];
    uint64_t v32 = v49 = v4;

    CGFloat v33 = v30;
    [(SBUISystemApertureLayoutGuide *)self setConstraints:v32];
    [MEMORY[0x1E4F28DC8] activateConstraints:v32];
    BOOL v22 = 1;
    double v20 = (void *)v32;
    id v4 = v49;
  }

  id v11 = v51;
LABEL_24:

  return v22;
}

- (BOOL)_createOrUpdateInsetBasedRootGuideWithWindow:(id)a3
{
  v76[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SBUISystemApertureLayoutGuide *)self _requiresInsets])
  {
    v48 = [NSString stringWithFormat:@"Illegal attempt to use inset based guide when fixed frame required"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBUISystemApertureLayoutGuide _createOrUpdateInsetBasedRootGuideWithWindow:]();
    }
    goto LABEL_28;
  }
  char v5 = [(SBUISystemApertureLayoutGuide *)self identifier];
  id v6 = [(SBUISystemApertureLayoutGuide *)self owningView];
  uint64_t v7 = [v6 systemApertureHostedElementContext];
  BOOL v9 = [v7 systemApertureElement];
  id v8 = [v9 view];

  LODWORD(v9) = [v8 isDescendantOfView:v6];
  if (!v9) {
    goto LABEL_19;
  }
  uint64_t v10 = objc_msgSend(v6, "SBUISA_layoutMode");
  if (v10 == 4)
  {
    if ([v5 isEqualToString:@"SBUISystemApertureLegibleContentLayoutMarginsGuideIdentifier"])
    {
      double v12 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
      [v12 expandedLegibleAreaInsets];
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"SBUISystemApertureCustomControlsContentLayoutGuideIdentifier"])
    {
      double v20 = objc_msgSend(v8, "SBUISA_systemApertureObstructedAreaLayoutGuide");
      [v20 layoutFrame];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;

      double v29 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
      [v29 expandedControlsAreaInsets];
      double v18 = v30;
      double v11 = v31;
      double v19 = v32;

      v77.origin.double x = v22;
      v77.origin.CGFloat y = v24;
      v77.size.CGFloat width = v26;
      v77.size.CGFloat height = v28;
      double MaxY = CGRectGetMaxY(v77);
      goto LABEL_15;
    }
    v48 = [NSString stringWithFormat:@"Unhandled layout guide identifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBUISystemApertureLayoutGuide _createOrUpdateInsetBasedRootGuideWithWindow:]();
    }
LABEL_28:
    [v48 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A7634368);
  }
  double v11 = *(double *)(MEMORY[0x1E4F424F0] + 16);
  if (v10 != 3)
  {
    double MaxY = *MEMORY[0x1E4F424F0];
    double v18 = *(double *)(MEMORY[0x1E4F424F0] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F424F0] + 24);
    goto LABEL_15;
  }
  if (![v5 isEqualToString:@"SBUISystemApertureLegibleContentLayoutMarginsGuideIdentifier"])
  {
    if (([v5 isEqualToString:@"SBUISystemApertureCustomControlsContentLayoutGuideIdentifier"] & 1) == 0)
    {
      id v49 = [NSString stringWithFormat:@"Unhandled layout guide identifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBUISystemApertureLayoutGuide _createOrUpdateInsetBasedRootGuideWithWindow:]();
      }
      [v49 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A76343C4);
    }
    double MaxY = 5.0;
    double v19 = 10.0;
    double v18 = 10.0;
    goto LABEL_15;
  }
  double v12 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
  [v12 compactLegibleAreaInsets];
LABEL_9:
  double MaxY = v13;
  double v18 = v14;
  double v11 = v15;
  double v19 = v16;

LABEL_15:
  CGFloat v33 = [(SBUISystemApertureLayoutGuide *)self constraints];
  if ([v33 count])
  {
    CGFloat v34 = [v33 objectAtIndexedSubscript:0];
    [v34 setConstant:MaxY];

    double v35 = [v33 objectAtIndexedSubscript:1];
    [v35 setConstant:v18];

    double v36 = [v33 objectAtIndexedSubscript:2];
    [v36 setConstant:-v11];

    double v37 = [v33 objectAtIndexedSubscript:3];
    [v37 setConstant:-v19];
  }
  else
  {
    v73 = [(SBUISystemApertureLayoutGuide *)self topAnchor];
    v72 = [v8 topAnchor];
    v71 = [v73 constraintEqualToAnchor:v72 constant:MaxY];
    LODWORD(v38) = 1148845916;
    v70 = objc_msgSend(v71, "SBUISA_withPriority:", v38);
    v76[0] = v70;
    v69 = [(SBUISystemApertureLayoutGuide *)self leadingAnchor];
    v68 = [v8 leadingAnchor];
    v67 = [v69 constraintEqualToAnchor:v68 constant:v18];
    LODWORD(v39) = 1148845916;
    v66 = objc_msgSend(v67, "SBUISA_withPriority:", v39);
    v76[1] = v66;
    v65 = [(SBUISystemApertureLayoutGuide *)self bottomAnchor];
    char v64 = [v8 bottomAnchor];
    v63 = [v65 constraintEqualToAnchor:v64 constant:-v11];
    LODWORD(v40) = 1148845916;
    v62 = objc_msgSend(v63, "SBUISA_withPriority:", v40);
    v76[2] = v62;
    v61 = [(SBUISystemApertureLayoutGuide *)self trailingAnchor];
    v60 = [v8 trailingAnchor];
    v59 = [v61 constraintEqualToAnchor:v60 constant:-v19];
    LODWORD(v41) = 1148845916;
    v58 = objc_msgSend(v59, "SBUISA_withPriority:", v41);
    v76[3] = v58;
    v56 = [(SBUISystemApertureLayoutGuide *)self topAnchor];
    v55 = [v8 topAnchor];
    v54 = [v56 constraintGreaterThanOrEqualToAnchor:v55];
    v76[4] = v54;
    BOOL v53 = [(SBUISystemApertureLayoutGuide *)self leadingAnchor];
    double v52 = [v8 leadingAnchor];
    v51 = [v53 constraintGreaterThanOrEqualToAnchor:v52];
    v76[5] = v51;
    v50 = [(SBUISystemApertureLayoutGuide *)self bottomAnchor];
    [v8 bottomAnchor];
    double v42 = v74 = v5;
    [v50 constraintLessThanOrEqualToAnchor:v42];
    BOOL v43 = v75 = v4;
    v76[6] = v43;
    v44 = [(SBUISystemApertureLayoutGuide *)self trailingAnchor];
    [v8 trailingAnchor];
    BOOL v9 = v45 = (char)v9;
    double v46 = [v44 constraintLessThanOrEqualToAnchor:v9];
    v76[7] = v46;
    uint64_t v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:8];

    LOBYTE(v9) = v45;
    id v4 = v75;

    char v5 = v74;
    CGFloat v33 = (void *)v57;
    [(SBUISystemApertureLayoutGuide *)self setConstraints:v57];
    [MEMORY[0x1E4F28DC8] activateConstraints:v57];
  }

LABEL_19:
  return (char)v9;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_destroyWeak((id *)&self->_currentRootGuideView);
}

- (void)_createOrUpdateConstraintsIfIsRootAndInAWindow
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A7607000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createOrUpdateFixedFrameRootConstraintsWithWindow:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A7607000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createOrUpdateFixedFrameRootConstraintsWithWindow:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A7607000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createOrUpdateConcentricRootLayoutGuideWithWindow:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A7607000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createOrUpdateInsetBasedRootGuideWithWindow:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A7607000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createOrUpdateInsetBasedRootGuideWithWindow:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A7607000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createOrUpdateInsetBasedRootGuideWithWindow:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A7607000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end