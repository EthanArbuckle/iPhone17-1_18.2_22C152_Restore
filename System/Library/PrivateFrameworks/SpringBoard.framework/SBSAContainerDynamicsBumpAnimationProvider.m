@interface SBSAContainerDynamicsBumpAnimationProvider
- (id)preferencesFromContext:(id)a3;
@end

@implementation SBSAContainerDynamicsBumpAnimationProvider

- (id)preferencesFromContext:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  v10 = [v9 preferences];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  v41 = v7;
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

  v15 = [v14 containerViewDescriptions];
  v16 = (void *)[v15 mutableCopy];

  v17 = [MEMORY[0x1E4F1CA48] array];
  if ([v16 count])
  {
    for (unint64_t i = 0; i < [v16 count]; ++i)
    {
      id v19 = [v16 objectAtIndexedSubscript:i];
      v20 = [v9 elementContexts];
      v21 = SBSAElementContextAssociatedWithContainerViewDescription(v19, v20, 0);

      if ([v21 activeDynamicAnimation] == 1)
      {
        v22 = [v19 associatedSystemApertureElementIdentity];
        [v17 addObject:v22];

        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __69__SBSAContainerDynamicsBumpAnimationProvider_preferencesFromContext___block_invoke;
        v48[3] = &unk_1E6AF93C8;
        SEL v51 = a2;
        v48[4] = self;
        id v49 = v19;
        id v50 = v9;
        id v19 = (id)[v19 copyWithBlock:v48];
        [v16 replaceObjectAtIndex:i withObject:v19];

        char v23 = 0;
      }
      else
      {
        v42 = v21;
        id v24 = v14;
        id v25 = v9;
        v26 = a2;
        v27 = v17;
        elementIdentitiesWithBumpApplied = self->_elementIdentitiesWithBumpApplied;
        v29 = [v19 associatedSystemApertureElementIdentity];
        LODWORD(elementIdentitiesWithBumpApplied) = [(NSArray *)elementIdentitiesWithBumpApplied containsObject:v29];

        if (!elementIdentitiesWithBumpApplied)
        {
          v17 = v27;
          a2 = v26;
          id v9 = v25;
          id v14 = v24;
          v21 = v42;
          goto LABEL_19;
        }
        char v23 = 1;
        v17 = v27;
        a2 = v26;
        id v9 = v25;
        id v14 = v24;
        v21 = v42;
      }
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __69__SBSAContainerDynamicsBumpAnimationProvider_preferencesFromContext___block_invoke_2;
      v44[3] = &unk_1E6B02F30;
      SEL v46 = a2;
      v44[4] = self;
      char v47 = v23;
      id v19 = v19;
      id v45 = v19;
      uint64_t v30 = [v14 copyWithBlock:v44];

      id v14 = (id)v30;
LABEL_19:
    }
  }
  v31 = (NSArray *)[v17 copy];
  v32 = self->_elementIdentitiesWithBumpApplied;
  self->_elementIdentitiesWithBumpApplied = v31;

  v33 = (void *)[v14 copyByUpdatingContainerViewDescriptions:v16];
  v34 = (void *)[v9 copyByUpdatingPreferences:v33];

  v43.receiver = self;
  v43.super_class = (Class)SBSAContainerDynamicsBumpAnimationProvider;
  v35 = [(SBSABasePreferencesProvider *)&v43 preferencesFromContext:v34];
  uint64_t v36 = objc_opt_class();
  id v37 = v35;
  if (v36)
  {
    if (objc_opt_isKindOfClass()) {
      v38 = v37;
    }
    else {
      v38 = 0;
    }
  }
  else
  {
    v38 = 0;
  }
  id v39 = v38;

  if (![v17 count]) {
    [(SBSABasePreferencesProvider *)self removeFromParentProvider];
  }

  return v39;
}

void __69__SBSAContainerDynamicsBumpAnimationProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  v4 = self;
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
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    id v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerDynamicsBumpAnimationProvider.m", 49, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  double v31 = 0.0;
  double v32 = 0.0;
  [*(id *)(a1 + 40) bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [*(id *)(a1 + 40) center];
  double v23 = v22;
  double v25 = v24;
  v26 = [(id)objc_opt_class() settings];
  [v26 bumpAnimationXScale];
  CGFloat v28 = v27;
  v29 = [(id)objc_opt_class() settings];
  [v29 bumpAnimationYScale];
  SBSAScaledAndClippedFrameByScalingDimensions(&v31, *(void **)(a1 + 48), v15, v17, v19, v21, v23, v25, v28, v30);

  BSRectWithSize();
  objc_msgSend(v7, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  objc_msgSend(v7, "setContentScale:", v31, v32);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v7, "setContentBounds:");
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");
}

void __69__SBSAContainerDynamicsBumpAnimationProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v34 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  v4 = self;
  id v5 = v34;
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

  id v3 = v34;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerDynamicsBumpAnimationProvider.m", 64, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v34;
LABEL_9:
    id v7 = 0;
  }

  int v14 = *(unsigned __int8 *)(a1 + 56);
  CGFloat v15 = [(id)objc_opt_class() settings];
  double v16 = v15;
  if (v14) {
    [v15 bumpAnimationScaleDownSettings];
  }
  else {
  CGFloat v17 = [v15 bumpAnimationScaleUpSettings];
  }

  double v18 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v17];
  CGFloat v19 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v20 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  CGFloat v21 = [(SBSAInterfaceElementPropertyIdentity *)v19 initWithAssociatedInterfaceElementIdentifier:v20 andProperty:@"bounds"];

  [v7 setAnimatedTransitionDescription:v18 forProperty:v21 withMilestones:0];
  double v22 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v23 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  double v24 = [(SBSAInterfaceElementPropertyIdentity *)v22 initWithAssociatedInterfaceElementIdentifier:v23 andProperty:@"center"];
  [v7 associateAnimatedTransitionDescriptionOfProperty:v21 withProperty:v24 withMilestones:0];

  double v25 = [SBSAInterfaceElementPropertyIdentity alloc];
  v26 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  double v27 = [(SBSAInterfaceElementPropertyIdentity *)v25 initWithAssociatedInterfaceElementIdentifier:v26 andProperty:@"contentScale"];
  [v7 associateAnimatedTransitionDescriptionOfProperty:v21 withProperty:v27 withMilestones:0];

  CGFloat v28 = [SBSAInterfaceElementPropertyIdentity alloc];
  v29 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  CGFloat v30 = [(SBSAInterfaceElementPropertyIdentity *)v28 initWithAssociatedInterfaceElementIdentifier:v29 andProperty:@"contentBounds"];
  [v7 associateAnimatedTransitionDescriptionOfProperty:v21 withProperty:v30 withMilestones:0];

  double v31 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v32 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  v33 = [(SBSAInterfaceElementPropertyIdentity *)v31 initWithAssociatedInterfaceElementIdentifier:v32 andProperty:@"contentCenter"];
  [v7 associateAnimatedTransitionDescriptionOfProperty:v21 withProperty:v33 withMilestones:0];
}

- (void).cxx_destruct
{
}

@end