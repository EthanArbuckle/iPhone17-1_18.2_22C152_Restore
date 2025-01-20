@interface SBSAContainerPressBehaviorProvider
- (id)_contentInteractionBeginBehaviorSettings;
- (id)preferencesFromContext:(id)a3;
@end

@implementation SBSAContainerPressBehaviorProvider

- (id)preferencesFromContext:(id)a3
{
  v93[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
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
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    Class v10 = NSClassFromString(&cfstr_Sbsacontext.isa);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v9 handleFailureInMethod:a2, self, @"SBSAContainerPressBehaviorProvider.m", 46, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];

LABEL_9:
    id v8 = 0;
  }

  v13 = [v8 preferences];
  uint64_t v14 = objc_opt_class();
  id v15 = v13;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  id v17 = v16;

  v18 = [v8 gestureDescriptions];
  v19 = objc_msgSend(v18, "bs_firstObjectPassingTest:", &__block_literal_global_393);

  if (v19) {
    objc_storeStrong((id *)&self->_activeGestureDescription, v19);
  }
  if (self->_activeGestureDescription)
  {
    v20 = [v8 elapsedTimerDescriptions];
    v71 = v20;
    if ([v20 count])
    {
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __61__SBSAContainerPressBehaviorProvider_preferencesFromContext___block_invoke_2;
      v86[3] = &unk_1E6B07858;
      v86[4] = self;
      if ([v20 indexOfObjectPassingTest:v86] != 0x7FFFFFFFFFFFFFFFLL)
      {
        identifierOfActiveTimer = self->_identifierOfActiveTimer;
        self->_identifierOfActiveTimer = 0;

        v22 = [SBSAContainerPressAction alloc];
        v66 = [(SBSAGestureDescription *)self->_activeGestureDescription associatedInterfaceElementIdentifier];
        v67 = v19;
        v92 = @"containerPressBehaviorProvider.pressAction";
        v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
        v24 = [(SBSAContainerStaticTouchAction *)v22 initWithAssociatedInterfaceElementIdentifier:v66 reasons:v23];
        v93[0] = v24;
        v25 = [SBSAImpactFeedbackAction alloc];
        v91 = @"containerPressBehaviorProvider.pressAction";
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
        v26 = id v69 = v4;
        v27 = [(SBSAImpactFeedbackAction *)v25 initWithImpactFeedbackStyle:2 prepareOnly:0 reasons:v26];
        v93[1] = v27;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
        v29 = (void *)[v17 copyByAddingActions:v28];

        v19 = v67;
        id v4 = v69;

        id v17 = (id)[v29 copyWithCancellationOfGestureOfClass:objc_opt_class() context:v8];
      }
    }
    uint64_t v30 = [(SBSAGestureDescription *)self->_activeGestureDescription gestureRecognizerState];
    uint64_t v31 = v30;
    if (v30 >= 3)
    {
      if (v30 == 3 && self->_identifierOfActiveTimer)
      {
        v32 = [SBSAContainerTapAction alloc];
        v33 = [(SBSAGestureDescription *)self->_activeGestureDescription associatedInterfaceElementIdentifier];
        v89 = @"containerPressBehaviorProvider.tapAction";
        id v70 = v4;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
        v34 = v68 = v19;
        v35 = [(SBSAContainerStaticTouchAction *)v32 initWithAssociatedInterfaceElementIdentifier:v33 reasons:v34];
        v90 = v35;
        v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
        uint64_t v37 = [v17 copyByAddingActions:v36];

        id v4 = v70;
        v19 = v68;

        id v17 = (id)v37;
      }
      activeGestureDescription = self->_activeGestureDescription;
      self->_activeGestureDescription = 0;

      v39 = self->_identifierOfActiveTimer;
      self->_identifierOfActiveTimer = 0;
    }
    if (!self->_activeGestureDescription) {
      goto LABEL_34;
    }
    if (v31 == 1)
    {
      if (!self->_identifierOfActiveTimer)
      {
        v40 = [[SBSATimerDescription alloc] initWithTimeInterval:0.2];
        v41 = [(SBSATimerDescription *)v40 timerDescriptionIdentifier];
        v42 = self->_identifierOfActiveTimer;
        self->_identifierOfActiveTimer = v41;

        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __61__SBSAContainerPressBehaviorProvider_preferencesFromContext___block_invoke_3;
        v83[3] = &unk_1E6AF9DA0;
        v84 = v40;
        SEL v85 = a2;
        v83[4] = self;
        v43 = v40;
        v44 = (void *)[v17 copyWithBlock:v83];

        v45 = [SBSAImpactFeedbackAction alloc];
        v87 = @"containerPressBehaviorProvider.pressAction";
        id v46 = v4;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
        v48 = v47 = v19;
        v49 = [(SBSAImpactFeedbackAction *)v45 initWithImpactFeedbackStyle:2 prepareOnly:1 reasons:v48];
        v88 = v49;
        v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
        id v17 = (id)[v44 copyByAddingActions:v50];

        id v4 = v46;
        v19 = v47;
      }
    }
    else if ((unint64_t)(v31 - 1) > 1)
    {
LABEL_34:

      goto LABEL_35;
    }
    v51 = [v17 containerViewDescriptions];
    v52 = (void *)[v51 mutableCopy];

    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __61__SBSAContainerPressBehaviorProvider_preferencesFromContext___block_invoke_4;
    v82[3] = &unk_1E6AFBBB8;
    v82[4] = self;
    v53 = objc_msgSend(v52, "bs_firstObjectPassingTest:", v82);
    v54 = v53;
    if (v53)
    {
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __61__SBSAContainerPressBehaviorProvider_preferencesFromContext___block_invoke_5;
      v78[3] = &unk_1E6AF93C8;
      SEL v81 = a2;
      v78[4] = self;
      id v55 = v53;
      id v79 = v55;
      id v80 = v8;
      id v56 = v8;
      v57 = (void *)[v55 copyWithBlock:v78];
      objc_msgSend(v52, "replaceObjectAtIndex:withObject:", objc_msgSend(v52, "indexOfObject:", v55), v57);
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __61__SBSAContainerPressBehaviorProvider_preferencesFromContext___block_invoke_6;
      v74[3] = &unk_1E6AF93C8;
      SEL v77 = a2;
      v74[4] = self;
      id v75 = v52;
      id v76 = v55;
      uint64_t v58 = [v17 copyWithBlock:v74];

      id v8 = (id)[v56 copyByAddingFlags:1 debugRequestingProvider:self];
      id v17 = (id)v58;
    }

    goto LABEL_34;
  }
LABEL_35:
  v59 = (void *)[v8 copyByUpdatingPreferences:v17];

  v73.receiver = self;
  v73.super_class = (Class)SBSAContainerPressBehaviorProvider;
  v60 = [(SBSABasePreferencesProvider *)&v73 preferencesFromContext:v59];
  uint64_t v61 = objc_opt_class();
  id v62 = v60;
  if (v61)
  {
    if (objc_opt_isKindOfClass()) {
      v63 = v62;
    }
    else {
      v63 = 0;
    }
  }
  else
  {
    v63 = 0;
  }
  id v64 = v63;

  return v64;
}

uint64_t __61__SBSAContainerPressBehaviorProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __61__SBSAContainerPressBehaviorProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 timerDescriptionIdentifier];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

void __61__SBSAContainerPressBehaviorProvider_preferencesFromContext___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v17 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v17;
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

  id v3 = v17;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = a1[6];
    uint64_t v10 = a1[4];
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerPressBehaviorProvider.m", 76, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v17;
LABEL_9:
    id v7 = 0;
  }

  uint64_t v14 = [v7 timerDescriptions];
  if (v14)
  {
    id v15 = [v7 timerDescriptions];
    id v16 = (id)[v15 mutableCopy];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }

  [v16 addObject:a1[5]];
  [v7 setTimerDescriptions:v16];
}

uint64_t __61__SBSAContainerPressBehaviorProvider_preferencesFromContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = a2;
  id v4 = [v2 associatedInterfaceElementIdentifier];
  id v5 = [v3 interfaceElementIdentifier];

  uint64_t v6 = BSEqualObjects();
  return v6;
}

void __61__SBSAContainerPressBehaviorProvider_preferencesFromContext___block_invoke_5(uint64_t a1, void *a2)
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

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerPressBehaviorProvider.m", 90, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  double v24 = 0.0;
  double v25 = 0.0;
  [*(id *)(a1 + 40) bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [*(id *)(a1 + 40) center];
  SBSAScaledAndClippedFrameByScalingDimensions(&v24, *(void **)(a1 + 48), v15, v17, v19, v21, v22, v23, 1.2, 1.2);
  BSRectWithSize();
  objc_msgSend(v7, "setBounds:");
  objc_msgSend(v7, "setContentScale:", v24, v25);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v7, "setContentBounds:");
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");
}

void __61__SBSAContainerPressBehaviorProvider_preferencesFromContext___block_invoke_6(uint64_t a1, void *a2)
{
  id v28 = a2;
  if (v28)
  {
    id v3 = self;
    id v4 = v28;
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

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    Class v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAContainerPressBehaviorProvider.m", 101, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setContainerViewDescriptions:*(void *)(a1 + 40)];
  v13 = objc_opt_class();
  double v14 = [*(id *)(a1 + 32) _contentInteractionBeginBehaviorSettings];
  CGFloat v15 = (void *)[v13 newAnimatedTransitionDescriptionWithBehaviorSettings:v14];

  double v16 = [SBSAInterfaceElementPropertyIdentity alloc];
  CGFloat v17 = [*(id *)(a1 + 48) interfaceElementIdentifier];
  double v18 = [(SBSAInterfaceElementPropertyIdentity *)v16 initWithAssociatedInterfaceElementIdentifier:v17 andProperty:@"bounds"];

  [v6 setAnimatedTransitionDescription:v15 forProperty:v18 withMilestones:0];
  CGFloat v19 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v20 = [*(id *)(a1 + 48) interfaceElementIdentifier];
  CGFloat v21 = [(SBSAInterfaceElementPropertyIdentity *)v19 initWithAssociatedInterfaceElementIdentifier:v20 andProperty:@"contentScale"];
  [v6 associateAnimatedTransitionDescriptionOfProperty:v18 withProperty:v21 withMilestones:0];

  double v22 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v23 = [*(id *)(a1 + 48) interfaceElementIdentifier];
  double v24 = [(SBSAInterfaceElementPropertyIdentity *)v22 initWithAssociatedInterfaceElementIdentifier:v23 andProperty:@"contentBounds"];
  [v6 associateAnimatedTransitionDescriptionOfProperty:v18 withProperty:v24 withMilestones:0];

  double v25 = [SBSAInterfaceElementPropertyIdentity alloc];
  v26 = [*(id *)(a1 + 48) interfaceElementIdentifier];
  v27 = [(SBSAInterfaceElementPropertyIdentity *)v25 initWithAssociatedInterfaceElementIdentifier:v26 andProperty:@"contentCenter"];
  [v6 associateAnimatedTransitionDescriptionOfProperty:v18 withProperty:v27 withMilestones:0];
}

- (id)_contentInteractionBeginBehaviorSettings
{
  id v2 = [(id)objc_opt_class() settings];
  id v3 = [v2 contentInteractionBeginBehaviorSettings];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierOfActiveTimer, 0);
  objc_storeStrong((id *)&self->_activeGestureDescription, 0);
}

@end