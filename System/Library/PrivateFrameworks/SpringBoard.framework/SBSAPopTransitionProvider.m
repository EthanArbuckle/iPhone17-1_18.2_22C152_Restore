@interface SBSAPopTransitionProvider
- (id)preferencesFromContext:(id)a3;
@end

@implementation SBSAPopTransitionProvider

- (id)preferencesFromContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
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

  v9 = [v8 elementContexts];
  v27.receiver = self;
  v27.super_class = (Class)SBSAPopTransitionProvider;
  v10 = [(SBSABasePreferencesProvider *)&v27 preferencesFromContext:v8];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
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

  if ([v9 count])
  {
    unint64_t v17 = 0;
    do
    {
      if ([v16 count] <= v17)
      {
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:a2, self, @"SBSAPopTransitionProvider.m", 25, @"No container view description at index '%lu': %@", v17, v16 object file lineNumber description];
      }
      v18 = [v16 objectAtIndexedSubscript:v17];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __52__SBSAPopTransitionProvider_preferencesFromContext___block_invoke;
      v24[3] = &unk_1E6AF9DA0;
      id v25 = v18;
      SEL v26 = a2;
      v24[4] = self;
      id v19 = v18;
      v20 = (void *)[v14 copyWithBlock:v24];

      ++v17;
      id v14 = v20;
    }
    while (v17 < [v9 count]);
  }
  else
  {
    v20 = v14;
  }

  return v20;
}

void __52__SBSAPopTransitionProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v27 = a2;
  if (v27)
  {
    v3 = self;
    id v4 = v27;
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

    if (v6) {
      goto LABEL_10;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAPopTransitionProvider.m", 28, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  v13 = [(id)objc_opt_class() settings];
  id v14 = [v13 popToCustomInterfaceElementTransitionSettings];
  v15 = [v14 centerBehaviorSettings];

  v16 = [(id)objc_opt_class() settings];
  unint64_t v17 = [v16 popToCustomInterfaceElementTransitionSettings];
  v18 = [v17 boundsBehaviorSettings];

  id v19 = [SBSAInterfaceElementPropertyIdentity alloc];
  v20 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  v21 = [(SBSAInterfaceElementPropertyIdentity *)v19 initWithAssociatedInterfaceElementIdentifier:v20 andProperty:@"bounds"];

  id v22 = +[SBSABasePreferencesProvider newAnimatedTransitionDescriptionWithBehaviorSettings:v15];
  [v6 setAnimatedTransitionDescription:v22 forProperty:v21 withMilestones:0];

  v23 = [SBSAInterfaceElementPropertyIdentity alloc];
  v24 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  id v25 = [(SBSAInterfaceElementPropertyIdentity *)v23 initWithAssociatedInterfaceElementIdentifier:v24 andProperty:@"center"];

  id v26 = +[SBSABasePreferencesProvider newAnimatedTransitionDescriptionWithBehaviorSettings:v18];
  [v6 setAnimatedTransitionDescription:v26 forProperty:v25 withMilestones:0];
}

@end