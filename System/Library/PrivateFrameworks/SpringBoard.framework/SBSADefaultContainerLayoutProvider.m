@interface SBSADefaultContainerLayoutProvider
- (id)behaviorSettingsForProperty:(id)a3;
- (id)defaultTransitionSettings;
- (id)preferencesFromContext:(id)a3;
- (unint64_t)_indexOfContainerViewDescriptionWithIdentifier:(id)a3;
- (void)_pruneContainerDescriptionWithIdentifier:(id)a3;
- (void)_updateContainerDescriptionAtIndex:(unint64_t)a3 transitionDescriptions:(id)a4 context:(id)a5 updateReason:(id *)a6;
- (void)_updateContainerViewDescription:(id)a3 transitionDescriptions:(id)a4 context:(id)a5;
- (void)_updateContainerViewDescriptionInCollection:(id)a3;
@end

@implementation SBSADefaultContainerLayoutProvider

void __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v22 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  v4 = self;
  id v5 = v22;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  id v3 = v22;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSADefaultContainerLayoutProvider.m", 133, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v22;
LABEL_9:
    id v7 = 0;
  }

  v14 = *(void **)(a1 + 40);
  v15 = [*(id *)(a1 + 48) elementContexts];
  v16 = SBSAElementContextAssociatedWithContainerViewDescription(v14, v15, 0);

  uint64_t v17 = 0;
  if ([v16 layoutMode] == 3) {
    uint64_t v17 = [v16 systemApertureCustomLayout];
  }
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v7, "setCornerRadius:", SBSACornerRadiusForContainerBounds(v17, *(void **)(a1 + 48), v18, v19, v20, v21));
}

void __101__SBSADefaultContainerLayoutProvider__updateContainerViewDescription_transitionDescriptions_context___block_invoke_2(uint64_t a1, void *a2)
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
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSADefaultContainerLayoutProvider.m", 196, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  if (*(unsigned char *)(a1 + 96)) {
    [MEMORY[0x1E4F29128] UUID];
  }
  else {
  v14 = [v7 interfaceElementIdentifier];
  }
  [v7 setInterfaceElementIdentifier:v14];
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  BSRectWithSize();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  objc_msgSend(v7, "setBounds:");
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  double v23 = 0.0;
  if (!*(unsigned char *)(a1 + 96)) {
    double v23 = 1.0;
  }
  [v7 setAlpha:v23];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_msgSend(v7, "setScale:", 1.0, 1.0);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v7 setCornerRadius:0.0];
  objc_msgSend(v7, "setContentScale:", 1.0, 1.0);
  v24 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v24 setDefaultCriticallyDampedValues];
  v25 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v24];
  v26 = *(void **)(a1 + 40);
  v27 = [[SBSAInterfaceElementPropertyIdentity alloc] initWithAssociatedInterfaceElementIdentifier:v14 andProperty:@"contentScale"];
  [v26 setObject:v25 forKey:v27];

  objc_msgSend(v7, "setContentBounds:", v16, v18, v20, v22);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v7 setKeyLineMode:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v28 = [MEMORY[0x1E4F428B8] colorWithWhite:0.5 alpha:1.0];
  [v7 setKeyLineTintColor:v28];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v7 setShadowStyle:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  SBSystemApertureContainerRenderingConfigurationMake(0, 2, 0, v29);
  [v7 setRenderingConfiguration:v29];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __101__SBSADefaultContainerLayoutProvider__updateContainerViewDescription_transitionDescriptions_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v12 && v5)
  {
    if (*(unsigned char *)(a1 + 48)) {
      [MEMORY[0x1E4FA5F08] unanimatedBehaviorSettings];
    }
    else {
    v6 = [*(id *)(a1 + 32) behaviorSettingsForProperty:v5];
    }
    id v7 = [MEMORY[0x1E4F29128] UUID];
    v8 = [(id)objc_opt_class() description];
    uint64_t v9 = +[SBSAAnimatedTransitionDescription animatedTransitionDescriptionWithAnimatedTransitionIdentifier:v7 behaviorSettings:v6 milestones:0 responsibleProvider:v8];

    uint64_t v10 = *(void **)(a1 + 40);
    Class v11 = [[SBSAInterfaceElementPropertyIdentity alloc] initWithAssociatedInterfaceElementIdentifier:v12 andProperty:v5];
    [v10 setObject:v9 forKey:v11];
  }
}

- (id)behaviorSettingsForProperty:(id)a3
{
  id v4 = a3;
  if ((BSEqualStrings() & 1) != 0 || BSEqualStrings())
  {
    id v5 = [(id)objc_opt_class() settings];
    v6 = [v5 keyLineStyleTransition];

    if (v6) {
      goto LABEL_9;
    }
  }
  else if ((BSEqualStrings() & 1) != 0 || BSEqualStrings())
  {
    v6 = [MEMORY[0x1E4FA5F08] unanimatedBehaviorSettings];
    if (v6) {
      goto LABEL_9;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SBSADefaultContainerLayoutProvider;
  v6 = [(SBSABasePreferencesProvider *)&v8 behaviorSettingsForProperty:v4];
LABEL_9:

  return v6;
}

- (id)defaultTransitionSettings
{
  v2 = [(id)objc_opt_class() settings];
  id v3 = [v2 inertInterfaceElementTransitionSettings];

  return v3;
}

void __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v29 = a2;
  if (v29)
  {
    id v3 = self;
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

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    Class v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSADefaultContainerLayoutProvider.m", 104, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  v13 = [SBSAInterfaceElementPropertyIdentity alloc];
  v14 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  double v15 = [(SBSAInterfaceElementPropertyIdentity *)v13 initWithAssociatedInterfaceElementIdentifier:v14 andProperty:@"blurFrame"];

  double v16 = *(void **)(a1 + 32);
  double v17 = [(SBSAInterfaceElementPropertyIdentity *)v15 interfaceElementProperty];
  double v18 = [v16 behaviorSettingsForProperty:v17];

  double v19 = [MEMORY[0x1E4F29128] UUID];
  double v20 = [(id)objc_opt_class() description];
  double v21 = +[SBSAAnimatedTransitionDescription animatedTransitionDescriptionWithAnimatedTransitionIdentifier:v19 behaviorSettings:v18 milestones:0 responsibleProvider:v20];

  [v6 setAnimatedTransitionDescription:v21 forProperty:v15 withMilestones:0];
  double v22 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v23 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  v24 = [(SBSAInterfaceElementPropertyIdentity *)v22 initWithAssociatedInterfaceElementIdentifier:v23 andProperty:@"blurHidden"];

  v25 = [MEMORY[0x1E4F29128] UUID];
  v26 = [MEMORY[0x1E4FA5F08] unanimatedBehaviorSettings];
  v27 = [(id)objc_opt_class() description];
  v28 = +[SBSAAnimatedTransitionDescription animatedTransitionDescriptionWithAnimatedTransitionIdentifier:v25 behaviorSettings:v26 milestones:0 responsibleProvider:v27];

  [v6 setAnimatedTransitionDescription:v28 forProperty:v24 withMilestones:0];
}

void __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
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
    uint64_t v9 = a1[6];
    uint64_t v10 = a1[4];
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSADefaultContainerLayoutProvider.m", 89, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  [v7 setContainerViewDescriptions:*(void *)(a1[4] + 32)];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = *(id *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        double v20 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKey:v19];
        [v7 setAnimatedTransitionDescription:v20 forProperty:v19 withMilestones:0];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }
}

- (id)preferencesFromContext:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = self;
    id v7 = v4;
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

    if (!v9)
    {
      v60 = [MEMORY[0x1E4F28B00] currentHandler];
      Class v61 = NSClassFromString(&cfstr_Sbsacontext.isa);
      v62 = (objc_class *)objc_opt_class();
      v63 = NSStringFromClass(v62);
      [v60 handleFailureInMethod:a2, self, @"SBSADefaultContainerLayoutProvider.m", 66, @"Unexpected class – expected '%@', got '%@'", v61, v63 object file lineNumber description];

      id v9 = 0;
      id v4 = v5;
    }
  }
  else
  {
    id v9 = 0;
  }
  v65 = v4;

  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v10 = [v9 preferences];
  if (!v10) {
    goto LABEL_18;
  }
  Class v11 = self;
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

  if (!v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    Class v16 = NSClassFromString(&cfstr_Sbsapreference.isa);
    uint64_t v17 = (objc_class *)objc_opt_class();
    double v18 = NSStringFromClass(v17);
    [v15 handleFailureInMethod:a2, self, @"SBSADefaultContainerLayoutProvider.m", 68, @"Unexpected class – expected '%@', got '%@'", v16, v18 object file lineNumber description];

LABEL_18:
    id v14 = 0;
  }

  v67 = [v9 elementContexts];
  v70 = [v9 containerViewDescriptions];
  unint64_t v19 = [v9 minimumNumberOfContainers];
  unint64_t v20 = [v67 count];
  if (v19 <= v20) {
    unint64_t v19 = v20;
  }
  unint64_t v21 = [v9 maximumNumberOfElements];
  if (v19 >= v21) {
    unint64_t v22 = v21;
  }
  else {
    unint64_t v22 = v19;
  }
  unint64_t v23 = [(NSMutableArray *)self->_orderedContainerDescriptions count];
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__112;
  v97 = __Block_byref_object_dispose__112;
  id v98 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v23 > v22) {
    unint64_t v22 = v23;
  }
  if (v22)
  {
    for (unint64_t i = 0; i != v22; ++i)
    {
      if ([v70 count] > i
        && ([v70 objectAtIndexedSubscript:i], (v25 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [(SBSADefaultContainerLayoutProvider *)self _updateContainerViewDescription:v25 transitionDescriptions:v94[5] context:v9];
        id v26 = 0;
      }
      else
      {
        uint64_t v27 = v94[5];
        id v92 = 0;
        [(SBSADefaultContainerLayoutProvider *)self _updateContainerDescriptionAtIndex:i transitionDescriptions:v27 context:v9 updateReason:&v92];
        id v26 = v92;
        if (v26) {
          [v68 addObject:v26];
        }
        v25 = 0;
      }
    }
  }
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke;
  v91[3] = &unk_1E6AFDF60;
  v91[4] = self;
  v91[5] = &v93;
  v91[6] = a2;
  v66 = (void *)MEMORY[0x1D948C7A0](v91);
  if (v14)
  {
    v28 = (void *)[v14 copyWithBlock:v66];
  }
  else
  {
    v28 = +[SBSAPreferences instanceWithBlock:v66];
  }
  id v29 = objc_alloc_init(SBSABackgroundBlurDescription);
  objc_msgSend((id)objc_opt_class(), "frameForVariableBlurUnderContainerViewWithFrame:offscreen:context:", 1, v9, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  id v30 = -[SBSABackgroundBlurDescription copyBySettingBlurFrame:](v29, "copyBySettingBlurFrame:");

  v31 = (void *)[v30 copyBySettingBlurHidden:1];
  v32 = (void *)[v28 copyByUpdatingBackgroundBlurDescription:v31];

  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_2;
  v88[3] = &unk_1E6AF9DA0;
  SEL v90 = a2;
  v88[4] = self;
  id v64 = v31;
  id v89 = v64;
  v33 = (void *)[v32 copyWithBlock:v88];

  v69 = (void *)[v9 copyByUpdatingPreferences:v33];
  v87.receiver = self;
  v87.super_class = (Class)SBSADefaultContainerLayoutProvider;
  v34 = [(SBSABasePreferencesProvider *)&v87 preferencesFromContext:v69];
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
  id v72 = v37;

  v38 = [v72 containerViewDescriptions];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v39 = (void *)[(NSMutableArray *)self->_orderedContainerDescriptions copy];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v83 objects:v100 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v84 != v41) {
          objc_enumerationMutation(v39);
        }
        v43 = [*(id *)(*((void *)&v83 + 1) + 8 * j) interfaceElementIdentifier];
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_3;
        v81[3] = &unk_1E6AF9D50;
        id v44 = v43;
        id v82 = v44;
        if ([v38 indexOfObjectPassingTest:v81] == 0x7FFFFFFFFFFFFFFFLL) {
          [(SBSADefaultContainerLayoutProvider *)self _pruneContainerDescriptionWithIdentifier:v44];
        }
      }
      uint64_t v40 = [v39 countByEnumeratingWithState:&v83 objects:v100 count:16];
    }
    while (v40);
  }

  v45 = (void *)[v38 mutableCopy];
  for (unint64_t k = 0; k < [v38 count]; ++k)
  {
    v47 = [v38 objectAtIndex:k];
    [v47 cornerRadius];
    if (v48 == 0.0)
    {
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_4;
      v77[3] = &unk_1E6AF93C8;
      SEL v80 = a2;
      v77[4] = self;
      id v49 = v47;
      id v78 = v49;
      id v79 = v69;
      v50 = (void *)[v49 copyWithBlock:v77];
      [v45 replaceObjectAtIndex:k withObject:v50];
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_5;
      v74[3] = &unk_1E6AF9DA0;
      SEL v76 = a2;
      v74[4] = self;
      id v51 = v50;
      id v75 = v51;
      uint64_t v52 = [v72 copyWithBlock:v74];

      id v72 = (id)v52;
    }
  }
  v53 = (void *)[v72 copyByUpdatingContainerViewDescriptions:v45];

  if ([v68 count])
  {
    v54 = [SBSAPreferencesDidChangeAction alloc];
    v55 = [v68 allObjects];
    v56 = [(SBSAPreferencesDidChangeAction *)v54 initWithReasons:v55];
    v99 = v56;
    v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
    uint64_t v58 = [v53 copyByAddingActions:v57];

    v53 = (void *)v58;
  }

  _Block_object_dispose(&v93, 8);
  return v53;
}

void __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_5(uint64_t a1, void *a2)
{
  id v19 = a2;
  if (v19)
  {
    id v3 = self;
    id v4 = v19;
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
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    Class v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSADefaultContainerLayoutProvider.m", 140, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  v13 = [SBSAInterfaceElementPropertyIdentity alloc];
  id v14 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  uint64_t v15 = [(SBSAInterfaceElementPropertyIdentity *)v13 initWithAssociatedInterfaceElementIdentifier:v14 andProperty:@"bounds"];

  Class v16 = [SBSAInterfaceElementPropertyIdentity alloc];
  uint64_t v17 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  double v18 = [(SBSAInterfaceElementPropertyIdentity *)v16 initWithAssociatedInterfaceElementIdentifier:v17 andProperty:@"cornerRadius"];

  [v6 associateAnimatedTransitionDescriptionOfProperty:v15 withProperty:v18 withMilestones:0];
}

- (void)_updateContainerViewDescription:(id)a3 transitionDescriptions:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = self;
  objc_sync_enter(v12);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __101__SBSADefaultContainerLayoutProvider__updateContainerViewDescription_transitionDescriptions_context___block_invoke;
  v36[3] = &unk_1E6B0C5C0;
  BOOL v38 = v9 == 0;
  v36[4] = v12;
  id v13 = v10;
  id v37 = v13;
  id v14 = (void *)MEMORY[0x1D948C7A0](v36);
  [v11 inertContainerFrame];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __101__SBSADefaultContainerLayoutProvider__updateContainerViewDescription_transitionDescriptions_context___block_invoke_2;
  id v26 = &unk_1E6B0C5E8;
  SEL v30 = a2;
  uint64_t v27 = v12;
  BOOL v35 = v9 == 0;
  uint64_t v31 = v15;
  uint64_t v32 = v16;
  uint64_t v33 = v17;
  uint64_t v34 = v18;
  id v19 = v14;
  id v29 = v19;
  id v20 = v13;
  id v28 = v20;
  unint64_t v21 = (void *)MEMORY[0x1D948C7A0](&v23);
  if (v9)
  {
    unint64_t v22 = objc_msgSend(v9, "copyWithBlock:", v21, v23, v24, v25, v26, v27);
  }
  else
  {
    unint64_t v22 = +[SBSAViewDescription instanceWithBlock:](SBSAContainerViewDescription, "instanceWithBlock:", v21, v23, v24, v25, v26, v27);
  }
  [(SBSADefaultContainerLayoutProvider *)v12 _updateContainerViewDescriptionInCollection:v22];

  objc_sync_exit(v12);
}

- (void)_updateContainerViewDescriptionInCollection:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!v4->_orderedContainerDescriptions)
    {
      id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      orderedContainerDescriptions = v4->_orderedContainerDescriptions;
      v4->_orderedContainerDescriptions = v5;
    }
    id v7 = [v10 interfaceElementIdentifier];
    uint64_t v8 = [(SBSADefaultContainerLayoutProvider *)v4 _indexOfContainerViewDescriptionWithIdentifier:v7];

    id v9 = v4->_orderedContainerDescriptions;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)v9 addObject:v10];
    }
    else {
      [(NSMutableArray *)v9 replaceObjectAtIndex:v8 withObject:v10];
    }
    objc_sync_exit(v4);
  }
}

- (unint64_t)_indexOfContainerViewDescriptionWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    orderedContainerDescriptions = v5->_orderedContainerDescriptions;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __85__SBSADefaultContainerLayoutProvider__indexOfContainerViewDescriptionWithIdentifier___block_invoke;
    v9[3] = &unk_1E6AF9D50;
    id v10 = v4;
    unint64_t v7 = [(NSMutableArray *)orderedContainerDescriptions indexOfObjectPassingTest:v9];

    objc_sync_exit(v5);
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

uint64_t __85__SBSADefaultContainerLayoutProvider__indexOfContainerViewDescriptionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 interfaceElementIdentifier];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

uint64_t __61__SBSADefaultContainerLayoutProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 interfaceElementIdentifier];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

- (void)_updateContainerDescriptionAtIndex:(unint64_t)a3 transitionDescriptions:(id)a4 context:(id)a5 updateReason:(id *)a6
{
  id v15 = a4;
  id v11 = a5;
  id v12 = self;
  objc_sync_enter(v12);
  if ([(NSMutableArray *)v12->_orderedContainerDescriptions count] <= a3
    || ([(NSMutableArray *)v12->_orderedContainerDescriptions objectAtIndexedSubscript:a3],
        (id v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([(NSMutableArray *)v12->_orderedContainerDescriptions count] != a3)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v12, @"SBSADefaultContainerLayoutProvider.m", 237, @"Requested index '%lu' isn't the next available index: %@", a3, v12->_orderedContainerDescriptions object file lineNumber description];
    }
    id v13 = 0;
    if (a6) {
      *a6 = @"inertLayoutProvider.newContainer";
    }
  }
  [(SBSADefaultContainerLayoutProvider *)v12 _updateContainerViewDescription:v13 transitionDescriptions:v15 context:v11];

  objc_sync_exit(v12);
}

- (void)_pruneContainerDescriptionWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(SBSADefaultContainerLayoutProvider *)v5 _indexOfContainerViewDescriptionWithIdentifier:v7];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)v5->_orderedContainerDescriptions removeObjectAtIndex:v6];
    }
    objc_sync_exit(v5);

    id v4 = v7;
  }
}

- (void).cxx_destruct
{
}

@end