@interface SBSAContainerPruningProvider
- (id)preferencesFromContext:(id)a3;
@end

@implementation SBSAContainerPruningProvider

- (id)preferencesFromContext:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
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
    [v10 handleFailureInMethod:a2, self, @"SBSAContainerPruningProvider.m", 26, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v9 = 0;
  }

  if (!v9) {
    goto LABEL_45;
  }
  v14 = [v9 preferences];
  int v15 = [v9 containsAnyOfSignals:3];
  uint64_t v16 = [v9 flags] & 3;
  int v17 = [v14 isCollisionImminent];
  int v18 = v17;
  if (v15 && !v16 && (v17 & 1) == 0)
  {
    v45 = self;
    id v46 = v5;
    v44 = v14;
    v19 = [v14 containerViewDescriptions];
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v21 = [v9 elementContexts];
    unint64_t v22 = [v9 minimumNumberOfContainers];
    unint64_t v23 = [v21 count];
    if (v22 <= v23) {
      unint64_t v24 = v23;
    }
    else {
      unint64_t v24 = v22;
    }
    unint64_t v25 = [v9 maximumNumberOfElements];
    if (v24 >= v25) {
      unint64_t v26 = v25;
    }
    else {
      unint64_t v26 = v24;
    }
    if (v26)
    {
      for (unint64_t i = 0; v26 != i; ++i)
      {
        if (i >= v22)
        {
          if (i >= [v21 count]) {
            continue;
          }
          v29 = [v21 objectAtIndexedSubscript:i];
          if (!v29) {
            continue;
          }
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __55__SBSAContainerPruningProvider_preferencesFromContext___block_invoke;
          v48[3] = &unk_1E6AFBBB8;
          id v49 = v29;
          id v28 = v29;
          v30 = [v19 bs_firstObjectPassingTest:v48];
          if (v30) {
            [v20 addObject:v30];
          }
        }
        else
        {
          if (i >= [v19 count])
          {
            id v28 = 0;
          }
          else
          {
            id v28 = [v19 objectAtIndexedSubscript:i];
          }
          [v20 addObject:v28];
        }
      }
    }
    v31 = SBLogSystemAperturePreferencesStackPruning();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);

    if (v32)
    {
      v33 = [v9 containerViewDescriptions];
      v34 = objc_msgSend(v33, "bs_compactMap:", &__block_literal_global_144);

      v35 = objc_msgSend(v20, "bs_compactMap:", &__block_literal_global_144);
      v36 = objc_msgSend(v34, "bs_differenceWithArray:", v35);
      if ([v36 count])
      {
        v37 = SBLogSystemAperturePreferencesStackPruning();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          [(SBSAContainerPruningProvider *)v9 preferencesFromContext:v37];
        }
      }
    }
    v14 = (void *)[v44 copyByUpdatingContainerViewDescriptions:v20];

    uint64_t v38 = [v9 copyByUpdatingPreferences:v14];
    id v9 = (id)v38;
    self = v45;
    id v5 = v46;
    goto LABEL_43;
  }
  if (v15)
  {
    v19 = SBLogSystemAperturePreferencesStackPruning();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v41 = [v9 queryIteration];
      v42 = &stru_1F3084718;
      v43 = @" Pressing or Resizing,";
      if (!v16) {
        v43 = &stru_1F3084718;
      }
      *(_DWORD *)buf = 134349570;
      uint64_t v51 = v41;
      __int16 v52 = 2112;
      v53 = v43;
      if (v18) {
        v42 = @" Collision Imminent";
      }
      __int16 v54 = 2112;
      v55 = v42;
      _os_log_debug_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEBUG, "[%{public}lu] Deferring pruning because:%@%@", buf, 0x20u);
    }
LABEL_43:
  }
LABEL_45:
  v47.receiver = self;
  v47.super_class = (Class)SBSAContainerPruningProvider;
  v39 = [(SBSABasePreferencesProvider *)&v47 preferencesFromContext:v9];

  return v39;
}

uint64_t __55__SBSAContainerPruningProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 associatedSystemApertureElementIdentity];
  uint64_t v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

uint64_t __55__SBSAContainerPruningProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 interfaceElementIdentifier];
}

- (void)preferencesFromContext:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 queryIteration];
  v6 = [a2 description];
  int v7 = 134349314;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "[%{public}lu] Performing pruning and removing container with identifier: %@", (uint8_t *)&v7, 0x16u);
}

@end