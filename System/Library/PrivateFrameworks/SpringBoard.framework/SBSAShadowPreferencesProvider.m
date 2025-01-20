@interface SBSAShadowPreferencesProvider
- (BOOL)_stretchProviderPresentInStack;
- (id)preferencesFromContext:(id)a3;
- (int64_t)_shadowStyleForContainerDescription:(id)a3 elementContext:(id)a4 useHeavyShadowForTransition:(BOOL)a5 isFirstContainer:(BOOL)a6;
@end

@implementation SBSAShadowPreferencesProvider

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
    [v10 handleFailureInMethod:a2, self, @"SBSAShadowPreferencesProvider.m", 22, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v9 = 0;
  }

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__9;
  v44 = __Block_byref_object_dispose__9;
  v14 = [v9 preferences];
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

  id v45 = v18;
  v19 = [v9 elementContexts];
  v20 = (void *)v41[5];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __56__SBSAShadowPreferencesProvider_preferencesFromContext___block_invoke;
  v35[3] = &unk_1E6AF95F0;
  v35[4] = self;
  v38 = &v40;
  SEL v39 = a2;
  id v21 = v19;
  id v36 = v21;
  id v22 = v9;
  id v37 = v22;
  uint64_t v23 = [v20 copyWithBlock:v35];
  v24 = (void *)v41[5];
  v41[5] = v23;

  v25 = (void *)[v22 copyByUpdatingPreferences:v41[5]];
  v34.receiver = self;
  v34.super_class = (Class)SBSAShadowPreferencesProvider;
  v26 = [(SBSABasePreferencesProvider *)&v34 preferencesFromContext:v25];
  uint64_t v27 = objc_opt_class();
  id v28 = v26;
  if (v27)
  {
    if (objc_opt_isKindOfClass()) {
      v29 = v28;
    }
    else {
      v29 = 0;
    }
  }
  else
  {
    v29 = 0;
  }
  id v30 = v29;

  v31 = (void *)v41[5];
  v41[5] = (uint64_t)v30;

  id v32 = (id)v41[5];
  _Block_object_dispose(&v40, 8);

  return v32;
}

void __56__SBSAShadowPreferencesProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v16 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  v4 = self;
  id v5 = v16;
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

  id v3 = v16;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAShadowPreferencesProvider.m", 33, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v16;
LABEL_9:
    id v7 = 0;
  }

  v14 = SBSAElementContextAssociatedWithContainerViewDescription(*(void **)(a1 + 40), *(void **)(a1 + 48), 0);
  if ([*(id *)(a1 + 56) isHeavyShadowRequiredForTransition]) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = [*(id *)(a1 + 32) _stretchProviderPresentInStack];
  }
  objc_msgSend(v7, "setShadowStyle:", objc_msgSend(*(id *)(a1 + 32), "_shadowStyleForContainerDescription:elementContext:useHeavyShadowForTransition:isFirstContainer:", *(void *)(a1 + 40), v14, v15, *(void *)(a1 + 72) == 0));
}

- (int64_t)_shadowStyleForContainerDescription:(id)a3 elementContext:(id)a4 useHeavyShadowForTransition:(BOOL)a5 isFirstContainer:(BOOL)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  Class v11 = [(id)objc_opt_class() settings];
  int v12 = [v11 elementShadowEnabled];

  if (!v12) {
    goto LABEL_14;
  }
  if (v7 && a6)
  {
    int64_t v13 = 7;
    goto LABEL_15;
  }
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v14 = [v10 layoutMode];
  [v9 bounds];
  if ((unint64_t)(v14 - 1) < 2)
  {
    if ([v10 systemApertureLayoutCustomizingOptions]) {
      int64_t v13 = 2;
    }
    else {
      int64_t v13 = 1;
    }
    goto LABEL_15;
  }
  if (v14 != 3)
  {
LABEL_14:
    int64_t v13 = 0;
    goto LABEL_15;
  }
  if (v15 <= 37.0)
  {
    int64_t v13 = 1;
  }
  else if (v15 >= 74.0)
  {
    if (v15 >= 92.0 || v15 < 74.0) {
      int64_t v13 = 4;
    }
    else {
      int64_t v13 = 3;
    }
  }
  else
  {
    int64_t v13 = 2;
  }
  uint64_t v18 = [v10 systemApertureCustomLayout];
  if ((unint64_t)(v18 - 1) >= 2)
  {
    if (v18 == 3) {
      int64_t v13 = 6;
    }
  }
  else
  {
    int64_t v13 = 5;
  }
LABEL_15:

  return v13;
}

- (BOOL)_stretchProviderPresentInStack
{
  v2 = self;
  if (v2)
  {
    id v3 = v2;
    do
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        break;
      }
      uint64_t v5 = [v3 parentProvider];

      id v3 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

void __56__SBSAShadowPreferencesProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
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

    if (v7) {
      goto LABEL_10;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    int v12 = (objc_class *)objc_opt_class();
    int64_t v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAShadowPreferencesProvider.m", 27, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];
  }
  id v7 = 0;
LABEL_10:

  uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containerViewDescriptions];
  double v15 = (void *)[v14 mutableCopy];

  if ([v15 count])
  {
    unint64_t v16 = 0;
    do
    {
      v17 = [v15 objectAtIndex:v16];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __56__SBSAShadowPreferencesProvider_preferencesFromContext___block_invoke_2;
      v24[3] = &unk_1E6AF95C8;
      uint64_t v28 = *(void *)(a1 + 64);
      uint64_t v18 = *(void **)(a1 + 40);
      v24[4] = *(void *)(a1 + 32);
      id v25 = v17;
      id v26 = v18;
      id v27 = *(id *)(a1 + 48);
      unint64_t v29 = v16;
      v19 = (void *)[v17 copyWithBlock:v24];
      [v15 replaceObjectAtIndex:v16 withObject:v19];
      v20 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"shadowStyle"];
      id v21 = [SBSAInterfaceElementPropertyIdentity alloc];
      id v22 = [v19 interfaceElementIdentifier];
      uint64_t v23 = [(SBSAInterfaceElementPropertyIdentity *)v21 initWithAssociatedInterfaceElementIdentifier:v22 andProperty:@"shadowStyle"];
      [v7 setAnimatedTransitionDescription:v20 forProperty:v23 withMilestones:0];

      ++v16;
    }
    while (v16 < [v15 count]);
  }
  [v7 setContainerViewDescriptions:v15];
}

@end