@interface SBSALayoutModeLayoutProvider
- (NSString)description;
- (SBSALayoutModeLayoutProvider)initWithLayoutMode:(int64_t)a3;
- (id)defaultTransitionSettings;
- (id)preferencesFromContext:(id)a3;
- (int64_t)supportedElementLayoutMode;
@end

@implementation SBSALayoutModeLayoutProvider

- (SBSALayoutModeLayoutProvider)initWithLayoutMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = SAUIStringFromElementViewLayoutMode();
    [v7 handleFailureInMethod:a2, self, @"SBSALayoutModeLayoutProvider.m", 43, @"Unsupported layout mode: %@", v8 object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)SBSALayoutModeLayoutProvider;
  result = [(SBSABasePreferencesProvider *)&v9 init];
  if (result) {
    result->_supportedElementLayoutMode = a3;
  }
  return result;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = SAUIStringFromElementViewLayoutMode();
  v6 = [v3 stringWithFormat:@"<%@: %p; supportedElementLayoutMode: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (id)preferencesFromContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v8 = v7;

    if (!v8)
    {
      v63 = [MEMORY[0x1E4F28B00] currentHandler];
      Class v64 = NSClassFromString(&cfstr_Sbsacontext.isa);
      v65 = (objc_class *)objc_opt_class();
      v66 = NSStringFromClass(v65);
      [v63 handleFailureInMethod:a2, self, @"SBSALayoutModeLayoutProvider.m", 59, @"Unexpected class – expected '%@', got '%@'", v64, v66 object file lineNumber description];
    }
  }
  else
  {
    id v8 = 0;
  }

  objc_super v9 = [v8 elementContexts];
  v10 = [v8 preferences];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  v67 = v4;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  v15 = [v14 elementDescriptions];
  v75 = (void *)[v15 mutableCopy];

  v78 = v14;
  v16 = [v14 containerViewDescriptions];
  v17 = (void *)[v16 mutableCopy];

  BOOL v73 = !self->_performedInitialLayoutIfNecessary && self->_supportedElementLayoutMode == 3;
  v74 = v8;
  self->_performedInitialLayoutIfNecessary = 1;
  if ([v9 count])
  {
    unint64_t v18 = 0;
    v69 = v98;
    v70 = v101;
    v68 = v96;
    v71 = v17;
    v72 = v9;
    while (1)
    {
      v19 = [v9 objectAtIndex:v18];
      uint64_t v124 = 0x7FFFFFFFFFFFFFFFLL;
      v79 = SBSAElementDescriptionAssociatedWithElementIdentity(v19, v75, &v124);
      uint64_t v20 = [v19 layoutMode];
      if (v20 != [(SBSALayoutModeLayoutProvider *)self supportedElementLayoutMode])
      {
        v54 = [MEMORY[0x1E4F28B00] currentHandler];
        [(SBSALayoutModeLayoutProvider *)self supportedElementLayoutMode];
        v55 = SAUIStringFromElementViewLayoutMode();
        [v54 handleFailureInMethod:a2, self, @"SBSALayoutModeLayoutProvider.m", 70, @"Layout mode of element context doesn't match supported layout mode ('%@'): %@", v55, v19, v67, v68, v69, v70 object file lineNumber description];
      }
      if ([v17 count] <= v18)
      {
        v56 = [MEMORY[0x1E4F28B00] currentHandler];
        [v56 handleFailureInMethod:a2, self, @"SBSALayoutModeLayoutProvider.m", 71, @"No container view description at index '%lu': %@", v18, v17 object file lineNumber description];
      }
      v21 = [v17 objectAtIndexedSubscript:v18];
      CGFloat v76 = SBSAFrameForElementInCollection(v18, v9, v74);
      uint64_t v23 = v22;
      uint64_t v25 = v24;
      uint64_t v27 = v26;
      BSRectWithSize();
      uint64_t v29 = v28;
      uint64_t v31 = v30;
      uint64_t v33 = v32;
      uint64_t v35 = v34;
      BOOL v36 = [v19 systemApertureCustomLayoutCustomAnimationStyle] == 3;
      v122[0] = 0;
      v122[1] = v122;
      v122[2] = 0x2020000000;
      char v123 = 0;
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke;
      v109[3] = &unk_1E6B06F20;
      SEL v113 = a2;
      v109[4] = self;
      id v37 = v19;
      uint64_t v114 = v29;
      uint64_t v115 = v31;
      uint64_t v116 = v33;
      uint64_t v117 = v35;
      CGFloat v118 = v76;
      uint64_t v119 = v23;
      uint64_t v120 = v25;
      uint64_t v121 = v27;
      id v110 = v37;
      v112 = v122;
      id v38 = v74;
      id v111 = v38;
      v39 = (void *)[v21 copyWithBlock:v109];

      v107[0] = 0;
      v107[1] = v107;
      v107[2] = 0x3032000000;
      v107[3] = __Block_byref_object_copy__81;
      v107[4] = __Block_byref_object_dispose__81;
      id v108 = 0;
      uint64_t v103 = 0;
      v104 = &v103;
      uint64_t v105 = 0x2020000000;
      char v106 = 0;
      [v17 replaceObjectAtIndex:v18 withObject:v39];
      if (v124 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_33;
      }
      v40 = self;
      v41 = [v38 elementSnapshotContexts];
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v101[0] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_33;
      v101[1] = &unk_1E6AF93A0;
      id v42 = v37;
      id v102 = v42;
      v43 = objc_msgSend(v41, "bs_firstObjectPassingTest:", v100);

      v44 = [v43 snapshotReason];
      v45 = [v78 elementLayoutTransition];
      int v46 = [v45 isSingleElementExpansion];

      int v47 = BSEqualStrings();
      int v48 = v46 | v47;
      if ((v46 | v47) == 1)
      {
        v97[0] = MEMORY[0x1E4F143A8];
        v97[1] = 3221225472;
        v98[0] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_2;
        v98[1] = &unk_1E6B06F48;
        char v99 = v47;
        v98[2] = v40;
        v98[3] = v107;
        v98[4] = a2;
        uint64_t v49 = [v79 copyWithBlock:v97];

        v79 = (void *)v49;
      }
      if ([v42 systemApertureLayoutCustomizingOptions])
      {
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v96[0] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_3;
        v96[1] = &unk_1E6AF53A0;
        v96[2] = v40;
        v96[3] = a2;
        uint64_t v50 = [v79 copyWithBlock:v95];

        *((unsigned char *)v104 + 24) = 1;
        v79 = (void *)v50;
      }
      else if (!v48)
      {
        goto LABEL_32;
      }
      [v75 replaceObjectAtIndex:v124 withObject:v79];
LABEL_32:

      self = v40;
LABEL_33:
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_4;
      v86[3] = &unk_1E6B06F70;
      SEL v92 = a2;
      BOOL v93 = v36;
      v86[4] = self;
      v89 = v122;
      id v51 = v39;
      id v87 = v51;
      v90 = v107;
      BOOL v94 = v73;
      id v52 = v79;
      id v88 = v52;
      v91 = &v103;
      v53 = (void *)[v78 copyWithBlock:v86];

      _Block_object_dispose(&v103, 8);
      _Block_object_dispose(v107, 8);

      _Block_object_dispose(v122, 8);
      ++v18;
      objc_super v9 = v72;
      v78 = v53;
      v17 = v71;
      if (v18 >= [v72 count]) {
        goto LABEL_36;
      }
    }
  }
  v53 = v14;
LABEL_36:
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_5;
  v81[3] = &unk_1E6AFBB90;
  v81[4] = self;
  id v82 = v17;
  id v83 = v75;
  SEL v84 = a2;
  BOOL v85 = v73;
  id v57 = v17;
  id v58 = v75;
  v59 = (void *)[v53 copyWithBlock:v81];

  v60 = (void *)[v74 copyByUpdatingPreferences:v59];
  v80.receiver = self;
  v80.super_class = (Class)SBSALayoutModeLayoutProvider;
  v61 = [(SBSABasePreferencesProvider *)&v80 preferencesFromContext:v60];

  return v61;
}

void __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    id v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSALayoutModeLayoutProvider.m", 78, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  [v7 setAssociatedSystemApertureElementIdentity:*(void *)(a1 + 40)];
  objc_msgSend(v7, "setBounds:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  memset(&v46, 0, sizeof(v46));
  [v7 contentScale];
  SBSAAffineTransformFromContentScale((uint64_t)&v46, v14, v15);
  CGAffineTransform v44 = v46;
  CGAffineTransformInvert(&v45, &v44);
  CGRect v47 = CGRectApplyAffineTransform(*(CGRect *)(a1 + 72), &v45);
  objc_msgSend(v7, "setContentBounds:", v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");
  if (([*(id *)(a1 + 40) systemApertureLayoutCustomizingOptions] & 1) != 0
    && [*(id *)(a1 + 32) supportedElementLayoutMode] == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v16 = v3;
    if (v3)
    {
      v17 = self;
      id v18 = v16;
      if (v17)
      {
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
      }
      else
      {
        v19 = 0;
      }
      id v20 = v19;

      if (v20) {
        goto LABEL_21;
      }
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v22 = *(void *)(a1 + 64);
      uint64_t v23 = *(void *)(a1 + 32);
      Class v24 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
      uint64_t v25 = (objc_class *)objc_opt_class();
      uint64_t v26 = NSStringFromClass(v25);
      [v21 handleFailureInMethod:v22, v23, @"SBSALayoutModeLayoutProvider.m", 90, @"Unexpected class – expected '%@', got '%@'", v24, v26 object file lineNumber description];
    }
    id v20 = 0;
LABEL_21:

    memset(&v44, 0, 32);
    [v20 bounds];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    [v20 center];
    double v36 = v35;
    double v38 = v37;
    v39 = [(id)objc_opt_class() settings];
    [v39 prominentPillScale];
    CGFloat v41 = v40;
    id v42 = [(id)objc_opt_class() settings];
    [v42 prominentPillVerticalOffsetProportion];
    SBSAScaledAndClippedFrameByScalingLeadingTrailingViews(&v44.a, *(void **)(a1 + 48), v28, v30, v32, v34, v36, v38, v41, v43);

    BSRectWithSize();
    objc_msgSend(v20, "setBounds:");
    UIRectGetCenter();
    objc_msgSend(v20, "setCenter:");
    objc_msgSend(v20, "setContentBounds:", v44.a, v44.b, v44.c, v44.d);
    UIRectGetCenter();
    objc_msgSend(v20, "setContentCenter:");
  }
}

uint64_t __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_33()
{
  return SAElementIdentityEqualToIdentity();
}

void __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (!v17) {
    goto LABEL_9;
  }
  id v3 = self;
  id v4 = v17;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsaelementdes.isa);
    Class v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSALayoutModeLayoutProvider.m", 115, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];

LABEL_9:
    id v6 = 0;
  }

  if (*(unsigned char *)(a1 + 56)) {
    double v13 = 1.0;
  }
  else {
    double v13 = 0.0;
  }
  [v6 setSnapshotViewBlurProgress:v13];
  if (*(unsigned char *)(a1 + 56)) {
    double v14 = 0.0;
  }
  else {
    double v14 = 1.0;
  }
  [v6 setSnapshotViewAlpha:v14];
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = @"layoutModeLayoutProvider.snapshotReason.transitionToCustom";

  [v6 setSnapshotReason:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    Class v11 = NSClassFromString(&cfstr_Sbsaelementdes.isa);
    id v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSALayoutModeLayoutProvider.m", 125, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  double v14 = [(id)objc_opt_class() settings];
  [v14 prominentPillContentScale];
  CGFloat v16 = v15;

  if (v7) {
    [v7 leadingViewTransform];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  CGAffineTransformScale(&v22, &v21, v16, v16);
  [v7 setLeadingViewTransform:&v22];
  if (v7) {
    [v7 trailingViewTransform];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }
  CGAffineTransformScale(&v20, &v19, v16, v16);
  [v7 setTrailingViewTransform:&v20];
  if (v7) {
    [v7 minimalViewTransform];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CGAffineTransformScale(&v18, &v17, v16, v16);
  [v7 setMinimalViewTransform:&v18];
}

void __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v56 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v56;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v3 = v56;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSALayoutModeLayoutProvider.m", 139, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v56;
LABEL_9:
    id v7 = 0;
  }

  if (*(unsigned char *)(a1 + 88))
  {
    double v14 = [(id)objc_opt_class() settings];
    double v15 = [v14 jindoBoundsOval];

    CGFloat v16 = [(id)objc_opt_class() settings];
    uint64_t v17 = [v16 jindoBoundsOval];
LABEL_14:
    CGAffineTransform v19 = (void *)v17;

    goto LABEL_15;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    CGAffineTransform v18 = [(id)objc_opt_class() settings];
    double v15 = [v18 transitionToProminentPillSettings];

    CGFloat v16 = [(id)objc_opt_class() settings];
    uint64_t v17 = [v16 transitionToProminentPillSettings];
    goto LABEL_14;
  }
  double v15 = [*(id *)(a1 + 32) behaviorSettingsForProperty:@"bounds"];
  CGAffineTransform v19 = [*(id *)(a1 + 32) behaviorSettingsForProperty:@"center"];
LABEL_15:
  CGAffineTransform v20 = [SBSAInterfaceElementPropertyIdentity alloc];
  CGAffineTransform v21 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  CGAffineTransform v22 = [(SBSAInterfaceElementPropertyIdentity *)v20 initWithAssociatedInterfaceElementIdentifier:v21 andProperty:@"bounds"];

  id v23 = +[SBSABasePreferencesProvider newAnimatedTransitionDescriptionWithBehaviorSettings:v15];
  [v7 setAnimatedTransitionDescription:v23 forProperty:v22 withMilestones:0];

  Class v24 = [SBSAInterfaceElementPropertyIdentity alloc];
  uint64_t v25 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  uint64_t v26 = [(SBSAInterfaceElementPropertyIdentity *)v24 initWithAssociatedInterfaceElementIdentifier:v25 andProperty:@"center"];

  id v27 = +[SBSABasePreferencesProvider newAnimatedTransitionDescriptionWithBehaviorSettings:v19];
  [v7 setAnimatedTransitionDescription:v27 forProperty:v26 withMilestones:0];

  double v28 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v29 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  double v30 = [(SBSAInterfaceElementPropertyIdentity *)v28 initWithAssociatedInterfaceElementIdentifier:v29 andProperty:@"contentBounds"];
  [v7 associateAnimatedTransitionDescriptionOfProperty:v22 withProperty:v30 withMilestones:0];

  double v31 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v32 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  double v33 = [(SBSAInterfaceElementPropertyIdentity *)v31 initWithAssociatedInterfaceElementIdentifier:v32 andProperty:@"contentCenter"];
  [v7 associateAnimatedTransitionDescriptionOfProperty:v26 withProperty:v33 withMilestones:0];

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v55 = v19;
    double v34 = v15;
    if (*(unsigned char *)(a1 + 89))
    {
      double v35 = [MEMORY[0x1E4FA5F08] unanimatedBehaviorSettings];
    }
    else
    {
      double v36 = [(id)objc_opt_class() settings];
      double v37 = [v36 elementContentTransitionSettings];
      double v35 = [v37 snapshotBehaviorSettings];
    }
    double v38 = [SBSAInterfaceElementPropertyIdentity alloc];
    v39 = [*(id *)(a1 + 48) interfaceElementIdentifier];
    double v40 = [(SBSAInterfaceElementPropertyIdentity *)v38 initWithAssociatedInterfaceElementIdentifier:v39 andProperty:@"snapshotViewBlurProgress"];

    CGFloat v41 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v35];
    [v7 setAnimatedTransitionDescription:v41 forProperty:v40 withMilestones:0];

    id v42 = [SBSAInterfaceElementPropertyIdentity alloc];
    double v43 = [*(id *)(a1 + 48) interfaceElementIdentifier];
    CGAffineTransform v44 = [(SBSAInterfaceElementPropertyIdentity *)v42 initWithAssociatedInterfaceElementIdentifier:v43 andProperty:@"snapshotViewAlpha"];

    CGAffineTransform v45 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v35];
    [v7 setAnimatedTransitionDescription:v45 forProperty:v44 withMilestones:0];

    double v15 = v34;
    CGAffineTransform v19 = v55;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    CGAffineTransform v46 = [SBSAInterfaceElementPropertyIdentity alloc];
    CGRect v47 = [*(id *)(a1 + 48) interfaceElementIdentifier];
    int v48 = [(SBSAInterfaceElementPropertyIdentity *)v46 initWithAssociatedInterfaceElementIdentifier:v47 andProperty:@"leadingViewTransform"];

    [v7 associateAnimatedTransitionDescriptionOfProperty:v22 withProperty:v48 withMilestones:0];
    uint64_t v49 = [SBSAInterfaceElementPropertyIdentity alloc];
    uint64_t v50 = [*(id *)(a1 + 48) interfaceElementIdentifier];
    id v51 = [(SBSAInterfaceElementPropertyIdentity *)v49 initWithAssociatedInterfaceElementIdentifier:v50 andProperty:@"trailingViewTransform"];

    [v7 associateAnimatedTransitionDescriptionOfProperty:v22 withProperty:v51 withMilestones:0];
    id v52 = [SBSAInterfaceElementPropertyIdentity alloc];
    v53 = [*(id *)(a1 + 48) interfaceElementIdentifier];
    v54 = [(SBSAInterfaceElementPropertyIdentity *)v52 initWithAssociatedInterfaceElementIdentifier:v53 andProperty:@"minimalViewTransform"];

    [v7 associateAnimatedTransitionDescriptionOfProperty:v22 withProperty:v54 withMilestones:0];
  }
}

void __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_5(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSALayoutModeLayoutProvider.m", 176, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  [v7 setContainerViewDescriptions:*(void *)(a1 + 40)];
  [v7 setElementDescriptions:*(void *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 64))
  {
    double v14 = [v7 actions];
    double v15 = [SBSAPreferencesDidChangeAction alloc];
    v21[0] = @"layoutModeLayoutProvider.updateReason.snapshotRequired";
    CGFloat v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    uint64_t v17 = [(SBSAPreferencesDidChangeAction *)v15 initWithReasons:v16];

    if (v14)
    {
      uint64_t v18 = [v14 arrayByAddingObject:v17];
    }
    else
    {
      CGAffineTransform v20 = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    }
    CGAffineTransform v19 = (void *)v18;
    [v7 setActions:v18];
  }
}

- (id)defaultTransitionSettings
{
  int64_t supportedElementLayoutMode = self->_supportedElementLayoutMode;
  switch(supportedElementLayoutMode)
  {
    case 3:
      id v3 = [(id)objc_opt_class() settings];
      uint64_t v4 = [v3 customInterfaceElementTransitionSettings];
      goto LABEL_7;
    case 2:
      id v3 = [(id)objc_opt_class() settings];
      uint64_t v4 = [v3 compactInterfaceElementTransitionSettings];
LABEL_7:
      id v5 = (void *)v4;

      if (v5) {
        goto LABEL_9;
      }
      break;
    case 1:
      id v3 = [(id)objc_opt_class() settings];
      uint64_t v4 = [v3 minimalInterfaceElementTransitionSettings];
      goto LABEL_7;
  }
  id v6 = [(id)objc_opt_class() settings];
  id v5 = [v6 defaultInterfaceElementTransitionSettings];

LABEL_9:
  return v5;
}

- (int64_t)supportedElementLayoutMode
{
  return self->_supportedElementLayoutMode;
}

@end