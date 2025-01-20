@interface SBSARecombinationTransitionProvider
- (id)preferencesFromContext:(id)a3;
@end

@implementation SBSARecombinationTransitionProvider

- (id)preferencesFromContext:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_9;
  }
  v6 = self;
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

  if (!v9)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    Class v11 = NSClassFromString(&cfstr_Sbsacontext.isa);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v10 handleFailureInMethod:a2, self, @"SBSARecombinationTransitionProvider.m", 21, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v9 = 0;
  }

  v14 = [v9 preferences];
  if (!v14)
  {
LABEL_18:
    id v18 = 0;
    goto LABEL_19;
  }
  v15 = self;
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

  if (!v18)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    Class v20 = NSClassFromString(&cfstr_Sbsapreference.isa);
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v19 handleFailureInMethod:a2, self, @"SBSARecombinationTransitionProvider.m", 22, @"Unexpected class – expected '%@', got '%@'", v20, v22 object file lineNumber description];

    goto LABEL_18;
  }
LABEL_19:

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __62__SBSARecombinationTransitionProvider_preferencesFromContext___block_invoke;
  v32[3] = &unk_1E6AF53A0;
  v32[4] = self;
  v32[5] = a2;
  v23 = (void *)[v18 copyWithBlock:v32];

  v24 = (void *)[v9 copyByUpdatingPreferences:v23];
  v31.receiver = self;
  v31.super_class = (Class)SBSARecombinationTransitionProvider;
  v25 = [(SBSABasePreferencesProvider *)&v31 preferencesFromContext:v24];
  uint64_t v26 = objc_opt_class();
  id v27 = v25;
  if (v26)
  {
    if (objc_opt_isKindOfClass()) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
  }
  id v29 = v28;

  return v29;
}

void __62__SBSARecombinationTransitionProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v29 = v2;
  if (!v2) {
    goto LABEL_9;
  }
  v3 = self;
  id v4 = v29;
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

  id v2 = v29;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    Class v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSARecombinationTransitionProvider.m", 24, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];

    id v2 = v29;
LABEL_9:
    id v6 = 0;
  }

  [v6 setBlobEnabled:1];
  v13 = [v6 containerViewDescriptions];
  if ([v13 count])
  {
    unint64_t v14 = 0;
    do
    {
      if (v14)
      {
        v15 = [v13 objectAtIndex:v14];
        id v16 = [(id)objc_opt_class() settings];
        v17 = [v16 inertInterfaceElementTransitionSettings];
        id v18 = [v17 boundsBehaviorSettings];

        v19 = [(id)objc_opt_class() settings];
        Class v20 = [v19 recombinationSecondaryBoundsYSettings];

        v21 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v18];
        v22 = (void *)[v21 copyBySettingAuxillaryBehaviorSettings:v20 forKeyPath:@"size.height"];

        v23 = [SBSAInterfaceElementPropertyIdentity alloc];
        v24 = [v15 interfaceElementIdentifier];
        v25 = [(SBSAInterfaceElementPropertyIdentity *)v23 initWithAssociatedInterfaceElementIdentifier:v24 andProperty:@"bounds"];

        [v6 setAnimatedTransitionDescription:v22 forProperty:v25 withMilestones:0];
        uint64_t v26 = [SBSAInterfaceElementPropertyIdentity alloc];
        id v27 = [v15 interfaceElementIdentifier];
        v28 = [(SBSAInterfaceElementPropertyIdentity *)v26 initWithAssociatedInterfaceElementIdentifier:v27 andProperty:@"contentBounds"];

        [v6 associateAnimatedTransitionDescriptionOfProperty:v25 withProperty:v28 withMilestones:0];
      }
      ++v14;
    }
    while (v14 < [v13 count]);
  }
}

@end