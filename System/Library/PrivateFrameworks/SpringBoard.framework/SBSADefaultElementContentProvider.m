@interface SBSADefaultElementContentProvider
- (id)_updatedElementDescriptionAssociatedWithElementContext:(id)a3 transitionDescriptions:(id)a4 context:(id)a5 updateReasons:(id)a6;
- (id)_updatedElementDescriptionFromDescription:(id)a3 associatedElementContext:(id)a4 associatedSnapshotContext:(id)a5 transitionDescriptions:(id)a6 context:(id)a7 updateReasons:(id)a8;
- (id)defaultTransitionSettings;
- (id)preferencesFromContext:(id)a3;
- (void)_pruneElementDescriptionWithIdentifier:(id)a3;
@end

@implementation SBSADefaultElementContentProvider

- (id)preferencesFromContext:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v74 = self;
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
      v61 = [MEMORY[0x1E4F28B00] currentHandler];
      Class v62 = NSClassFromString(&cfstr_Sbsacontext.isa);
      v63 = (objc_class *)objc_opt_class();
      v64 = NSStringFromClass(v63);
      Class v65 = v62;
      self = v74;
      [v61 handleFailureInMethod:a2, v74, @"SBSADefaultElementContentProvider.m", 49, @"Unexpected class – expected '%@', got '%@'", v65, v64 object file lineNumber description];
    }
  }
  else
  {
    id v8 = 0;
  }
  v66 = v4;

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v10 = [v8 preferences];
  v72 = v9;
  if (!v10) {
    goto LABEL_18;
  }
  v11 = self;
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

  id v9 = v72;
  v67 = v14;
  if (!v14)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    Class v16 = NSClassFromString(&cfstr_Sbsapreference.isa);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v15 handleFailureInMethod:a2, self, @"SBSADefaultElementContentProvider.m", 51, @"Unexpected class – expected '%@', got '%@'", v16, v18 object file lineNumber description];

    id v9 = v72;
LABEL_18:
    v67 = 0;
  }

  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v20 = [v8 elementContexts];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v89 objects:v95 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v90 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = [(SBSADefaultElementContentProvider *)self _updatedElementDescriptionAssociatedWithElementContext:*(void *)(*((void *)&v89 + 1) + 8 * i) transitionDescriptions:v75 context:v8 updateReasons:v9];
        v26 = v25;
        if (v25)
        {
          v27 = [v25 interfaceElementIdentifier];
          [v19 addObject:v27];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v89 objects:v95 count:16];
    }
    while (v22);
  }

  int v28 = [v8 isAnimatedTransitionInProgress];
  if (self->_wasAnimating) {
    int v29 = v28 ^ 1;
  }
  else {
    int v29 = 0;
  }
  self->_wasAnimating = v28;
  v71 = v8;
  int v30 = [v8 containsAnyOfSignals:3];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v31 = [(NSMutableDictionary *)self->_identifiersToElementDescriptions allValues];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v85 objects:v94 count:16];
  v70 = v19;
  if (v32)
  {
    uint64_t v33 = v32;
    int v34 = v30 | v29;
    uint64_t v35 = *(void *)v86;
    int v69 = v34;
    do
    {
      uint64_t v36 = 0;
      uint64_t v73 = v33;
      do
      {
        if (*(void *)v86 != v35) {
          objc_enumerationMutation(v31);
        }
        v37 = *(void **)(*((void *)&v85 + 1) + 8 * v36);
        v38 = [v37 interfaceElementIdentifier];
        if (([v19 containsObject:v38] & 1) == 0)
        {
          if (v34)
          {
            [(SBSADefaultElementContentProvider *)v74 _pruneElementDescriptionWithIdentifier:v38];
          }
          else
          {
            v39 = [v37 associatedSystemApertureElementIdentity];
            [v71 elementContexts];
            v41 = v40 = v31;
            v83[0] = MEMORY[0x1E4F143A8];
            v83[1] = 3221225472;
            v83[2] = __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke;
            v83[3] = &unk_1E6AF9378;
            id v42 = v39;
            id v84 = v42;
            v43 = objc_msgSend(v41, "bs_firstObjectPassingTest:", v83);

            v44 = [v71 elementSnapshotContexts];
            v81[0] = MEMORY[0x1E4F143A8];
            v81[1] = 3221225472;
            v81[2] = __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke_2;
            v81[3] = &unk_1E6AF93A0;
            id v82 = v42;
            id v45 = v42;
            v46 = objc_msgSend(v44, "bs_firstObjectPassingTest:", v81);

            v31 = v40;
            id v19 = v70;
            id v47 = [(SBSADefaultElementContentProvider *)v74 _updatedElementDescriptionFromDescription:v37 associatedElementContext:v43 associatedSnapshotContext:v46 transitionDescriptions:v75 context:v71 updateReasons:v72];

            uint64_t v33 = v73;
            int v34 = v69;
          }
        }

        ++v36;
      }
      while (v33 != v36);
      uint64_t v33 = [v31 countByEnumeratingWithState:&v85 objects:v94 count:16];
    }
    while (v33);
  }

  v48 = v74->_identifiersToElementDescriptions;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke_3;
  v77[3] = &unk_1E6AF93C8;
  SEL v80 = a2;
  v77[4] = v74;
  v49 = v48;
  v78 = v49;
  id v50 = v75;
  id v79 = v50;
  v51 = (void *)MEMORY[0x1D948C7A0](v77);
  if (v67)
  {
    v52 = (void *)[v67 copyWithBlock:v51];
  }
  else
  {
    v52 = +[SBSAPreferences instanceWithBlock:v51];
  }
  if ([v72 count])
  {
    v53 = [SBSAPreferencesDidChangeAction alloc];
    v54 = [v72 allObjects];
    v55 = [(SBSAPreferencesDidChangeAction *)v53 initWithReasons:v54];
    v93 = v55;
    v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
    uint64_t v57 = [v52 copyByAddingActions:v56];

    v52 = (void *)v57;
  }
  v58 = (void *)[v71 copyByUpdatingPreferences:v52];

  v76.receiver = v74;
  v76.super_class = (Class)SBSADefaultElementContentProvider;
  v59 = [(SBSABasePreferencesProvider *)&v76 preferencesFromContext:v58];

  return v59;
}

void __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSADefaultElementContentProvider.m", 91, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }
  v26 = v3;

  id v14 = [*(id *)(a1 + 40) allValues];
  [v7 setElementDescriptions:v14];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v21 = [*(id *)(a1 + 48) objectForKey:v20];
        uint64_t v22 = objc_opt_class();
        id v23 = v21;
        if (v22)
        {
          if (objc_opt_isKindOfClass()) {
            v24 = v23;
          }
          else {
            v24 = 0;
          }
        }
        else
        {
          v24 = 0;
        }
        id v25 = v24;

        if (v25) {
          [v7 associateAnimatedTransitionDescriptionOfProperty:v25 withProperty:v20 withMilestones:0];
        }
        else {
          [v7 setAnimatedTransitionDescription:v23 forProperty:v20 withMilestones:0];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v17);
  }
}

- (id)defaultTransitionSettings
{
  v2 = [(id)objc_opt_class() settings];
  id v3 = [v2 elementContentTransitionSettings];

  return v3;
}

uint64_t __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke()
{
  return SAElementIdentityEqualToIdentity();
}

uint64_t __60__SBSADefaultElementContentProvider_preferencesFromContext___block_invoke_2()
{
  return SAElementIdentityEqualToIdentity();
}

- (id)_updatedElementDescriptionFromDescription:(id)a3 associatedElementContext:(id)a4 associatedSnapshotContext:(id)a5 transitionDescriptions:(id)a6 context:(id)a7 updateReasons:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v21 = self;
  objc_sync_enter(v21);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __175__SBSADefaultElementContentProvider__updatedElementDescriptionFromDescription_associatedElementContext_associatedSnapshotContext_transitionDescriptions_context_updateReasons___block_invoke;
  v44[3] = &unk_1E6AF93F0;
  v44[4] = v21;
  id v35 = v18;
  id v45 = v35;
  uint64_t v22 = (void *)MEMORY[0x1D948C7A0](v44);
  if (!v15) {
    [v20 addObject:@"defaultElementContentProvider.updateReason.newElementDescription"];
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __175__SBSADefaultElementContentProvider__updatedElementDescriptionFromDescription_associatedElementContext_associatedSnapshotContext_transitionDescriptions_context_updateReasons___block_invoke_2;
  v36[3] = &unk_1E6AF9418;
  SEL v42 = a2;
  v36[4] = v21;
  BOOL v43 = v15 == 0;
  id v23 = v16;
  id v37 = v23;
  id v24 = v22;
  id v41 = v24;
  id v25 = v17;
  id v38 = v25;
  id v26 = v19;
  id v39 = v26;
  id v27 = v20;
  id v40 = v27;
  long long v28 = (void *)MEMORY[0x1D948C7A0](v36);
  if (v15)
  {
    long long v29 = (void *)[v15 copyWithBlock:v28];
  }
  else
  {
    long long v29 = +[SBSAElementDescription instanceWithBlock:v28];
  }
  identifiersToElementDescriptions = v21->_identifiersToElementDescriptions;
  if (!identifiersToElementDescriptions)
  {
    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v32 = v21->_identifiersToElementDescriptions;
    v21->_identifiersToElementDescriptions = v31;

    identifiersToElementDescriptions = v21->_identifiersToElementDescriptions;
  }
  uint64_t v33 = [v29 interfaceElementIdentifier];
  [(NSMutableDictionary *)identifiersToElementDescriptions setObject:v29 forKey:v33];

  objc_sync_exit(v21);
  return v29;
}

void __175__SBSADefaultElementContentProvider__updatedElementDescriptionFromDescription_associatedElementContext_associatedSnapshotContext_transitionDescriptions_context_updateReasons___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a2 && a3)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = a3;
    id v9 = a2;
    id v12 = (id)[v7 newAnimatedTransitionDescriptionForProperty:v8 animated:a4];
    uint64_t v10 = *(void **)(a1 + 40);
    Class v11 = [[SBSAInterfaceElementPropertyIdentity alloc] initWithAssociatedInterfaceElementIdentifier:v9 andProperty:v8];

    [v10 setObject:v12 forKey:v11];
  }
}

void __175__SBSADefaultElementContentProvider__updatedElementDescriptionFromDescription_associatedElementContext_associatedSnapshotContext_transitionDescriptions_context_updateReasons___block_invoke_2(uint64_t a1, void *a2)
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
    uint64_t v9 = *(void *)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsaelementdes.isa);
    id v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSADefaultElementContentProvider.m", 126, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  if (*(unsigned char *)(a1 + 88)) {
    [MEMORY[0x1E4F29128] UUID];
  }
  else {
  id v14 = [v7 interfaceElementIdentifier];
  }
  if (*(unsigned char *)(a1 + 88)) {
    [v7 setInterfaceElementIdentifier:v14];
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v7, "setAssociatedSystemApertureElementIdentity:");
  }
  if (*(unsigned char *)(a1 + 88)) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 3;
  }
  [v7 setAppearState:v15];
  double v16 = 0.0;
  [v7 setSensorObscuringShadowProgress:0.0];
  [v7 setLeadingViewBlurProgress:1.0];
  (*(void (**)(void, void *, __CFString *, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, @"leadingViewBlurProgress", *(unsigned char *)(a1 + 88) == 0);
  [v7 setLeadingViewAlpha:0.0];
  (*(void (**)(void, void *, __CFString *, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, @"leadingViewAlpha", *(unsigned char *)(a1 + 88) == 0);
  long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v28 = *MEMORY[0x1E4F1DAB8];
  long long v26 = v28;
  long long v29 = v27;
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v25 = v30;
  [v7 setLeadingViewTransform:&v28];
  (*(void (**)(void, void *, __CFString *, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, @"leadingViewTransform", *(unsigned char *)(a1 + 88) == 0);
  [v7 setTrailingViewBlurProgress:1.0];
  (*(void (**)(void, void *, __CFString *, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, @"trailingViewBlurProgress", *(unsigned char *)(a1 + 88) == 0);
  [v7 setTrailingViewAlpha:0.0];
  (*(void (**)(void, void *, __CFString *, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, @"trailingViewAlpha", *(unsigned char *)(a1 + 88) == 0);
  long long v28 = v26;
  long long v29 = v27;
  long long v30 = v25;
  [v7 setTrailingViewTransform:&v28];
  (*(void (**)(void, void *, __CFString *, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, @"trailingViewTransform", *(unsigned char *)(a1 + 88) == 0);
  [v7 setMinimalViewBlurProgress:1.0];
  (*(void (**)(void, void *, __CFString *, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, @"minimalViewBlurProgress", *(unsigned char *)(a1 + 88) == 0);
  [v7 setMinimalViewAlpha:0.0];
  (*(void (**)(void, void *, __CFString *, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, @"minimalViewAlpha", *(unsigned char *)(a1 + 88) == 0);
  long long v28 = v26;
  long long v29 = v27;
  long long v30 = v25;
  [v7 setMinimalViewTransform:&v28];
  (*(void (**)(void, void *, __CFString *, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, @"minimalViewTransform", *(unsigned char *)(a1 + 88) == 0);
  [v7 setCustomContentBlurProgress:1.0];
  (*(void (**)(void, void *, __CFString *, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, @"customContentBlurProgress", *(unsigned char *)(a1 + 88) == 0);
  [v7 setCustomContentAlpha:0.0];
  (*(void (**)(void, void *, __CFString *, BOOL))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v14, @"customContentAlpha", *(unsigned char *)(a1 + 88) == 0);
  id v17 = [*(id *)(a1 + 48) snapshotReason];
  int v18 = BSEqualStrings();
  id v19 = [*(id *)(a1 + 56) preferences];
  id v20 = [v19 elementLayoutTransition];
  int v21 = [v20 isTransitionFromCustom];

  if ((v21 & 1) != 0 || v18)
  {
    if (v18) {
      double v24 = 1.0;
    }
    else {
      double v24 = 0.0;
    }
    if (!v18) {
      double v16 = 1.0;
    }
    [v7 setSnapshotViewBlurProgress:v24];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    [v7 setSnapshotViewAlpha:v16];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    id v23 = @"defaultElementContentProvider.snapshotReason.transitionFromCustom";
    uint64_t v22 = v7;
  }
  else
  {
    uint64_t v22 = v7;
    id v23 = 0;
  }
  [v22 setSnapshotReason:v23];
  if (((v21 ^ 1 | v18) & 1) == 0) {
    [*(id *)(a1 + 64) addObject:@"defaultElementContentProvider.updateReason.snapshotRequired"];
  }
}

- (id)_updatedElementDescriptionAssociatedWithElementContext:(id)a3 transitionDescriptions:(id)a4 context:(id)a5 updateReasons:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  objc_sync_enter(v14);
  if (v10)
  {
    uint64_t v15 = [(NSMutableDictionary *)v14->_identifiersToElementDescriptions allValues];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __137__SBSADefaultElementContentProvider__updatedElementDescriptionAssociatedWithElementContext_transitionDescriptions_context_updateReasons___block_invoke;
    v28[3] = &unk_1E6AF9440;
    id v16 = v10;
    id v29 = v16;
    id v17 = objc_msgSend(v15, "bs_firstObjectPassingTest:", v28);
    int v18 = [v12 elementSnapshotContexts];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    long long v25 = __137__SBSADefaultElementContentProvider__updatedElementDescriptionAssociatedWithElementContext_transitionDescriptions_context_updateReasons___block_invoke_2;
    long long v26 = &unk_1E6AF93A0;
    id v19 = v16;
    id v27 = v19;
    id v20 = objc_msgSend(v18, "bs_firstObjectPassingTest:", &v23);

    int v21 = -[SBSADefaultElementContentProvider _updatedElementDescriptionFromDescription:associatedElementContext:associatedSnapshotContext:transitionDescriptions:context:updateReasons:](v14, "_updatedElementDescriptionFromDescription:associatedElementContext:associatedSnapshotContext:transitionDescriptions:context:updateReasons:", v17, v19, v20, v11, v12, v13, v23, v24, v25, v26);
  }
  else
  {
    int v21 = 0;
  }
  objc_sync_exit(v14);

  return v21;
}

uint64_t __137__SBSADefaultElementContentProvider__updatedElementDescriptionAssociatedWithElementContext_transitionDescriptions_context_updateReasons___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 associatedSystemApertureElementIdentity];
  uint64_t v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

uint64_t __137__SBSADefaultElementContentProvider__updatedElementDescriptionAssociatedWithElementContext_transitionDescriptions_context_updateReasons___block_invoke_2()
{
  return SAElementIdentityEqualToIdentity();
}

- (void)_pruneElementDescriptionWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    [(NSMutableDictionary *)v5->_identifiersToElementDescriptions removeObjectForKey:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void).cxx_destruct
{
}

@end