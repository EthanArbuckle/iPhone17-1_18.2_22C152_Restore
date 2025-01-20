@interface SBSARenderingAndCloningPreferencesProvider
- (id)preferencesFromContext:(id)a3;
@end

@implementation SBSARenderingAndCloningPreferencesProvider

void __69__SBSARenderingAndCloningPreferencesProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
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
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSARenderingAndCloningPreferencesProvider.m", 103, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  long long v14 = *(_OWORD *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 64);
  [v7 setRenderingConfiguration:&v14];
}

- (id)preferencesFromContext:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v7 = self;
    id v8 = v5;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if (!v10)
    {
      v55 = [MEMORY[0x1E4F28B00] currentHandler];
      Class v56 = NSClassFromString(&cfstr_Sbsacontext.isa);
      v57 = (objc_class *)objc_opt_class();
      v58 = NSStringFromClass(v57);
      [v55 handleFailureInMethod:a2, self, @"SBSARenderingAndCloningPreferencesProvider.m", 28, @"Unexpected class – expected '%@', got '%@'", v56, v58 object file lineNumber description];

      id v10 = 0;
      id v5 = v6;
    }
  }
  else
  {
    id v10 = 0;
  }
  v59 = v5;

  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__13;
  v75 = __Block_byref_object_dispose__13;
  Class v11 = [v10 preferences];
  uint64_t v12 = objc_opt_class();
  id v13 = v11;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      long long v14 = v13;
    }
    else {
      long long v14 = 0;
    }
  }
  else
  {
    long long v14 = 0;
  }
  id v15 = v14;

  id v76 = v15;
  BOOL v16 = SBSAContextAndPreferencesRepresentAnyContentVisible(v10, (void *)v72[5]);
  int v17 = [v10 isAnimatedTransitionInProgress];
  uint64_t v18 = [v10 activeDisplay];
  uint64_t v19 = [v10 cloningStyle];
  v20 = [v10 defaultsContext];
  int v21 = [v20 alwaysRenderSystemApertureFillOnGPU];

  v22 = [v10 defaultsContext];
  int v23 = [v22 neverRenderSystemApertureFillOnGPU];

  int v24 = MGGetBoolAnswer();
  unint64_t v25 = 0;
  if (((v16 | v17) & 1) == 0 && (v21 & ~v23 & 1) == 0)
  {
    int v26 = v24;
    int v27 = [v10 isKeyLineRequiredForTransition];
    if (v18 == 1) {
      int v28 = 1;
    }
    else {
      int v28 = v27;
    }
    uint64_t v29 = 1;
    if (v26) {
      uint64_t v29 = 2;
    }
    if (v28) {
      unint64_t v25 = 0;
    }
    else {
      unint64_t v25 = v29;
    }
  }
  uint64_t v30 = [v10 overrideRenderingStyle];
  if (v30 == -1) {
    unint64_t v31 = v25;
  }
  else {
    unint64_t v31 = v30;
  }
  v32 = [v10 defaultsContext];
  char v33 = [v32 alwaysShowSystemApertureInSnapshots];

  if (([v10 isReachabilityActive] & 1) != 0
    || (uint64_t v34 = v31, [v10 isAccessibilityZoomActiveAndEnabled]))
  {
    uint64_t v34 = 3;
  }
  long long v69 = 0uLL;
  uint64_t v70 = 0;
  SBSystemApertureContainerRenderingConfigurationMake(v34, v19, v33, &v69);
  long long v67 = 0uLL;
  uint64_t v68 = 0;
  SBSystemApertureContainerRenderingConfigurationMake(v31, v19, v33, &v67);
  if (self->_previousCloningStyle != v19
    || self->_previousCurtainRenderingStyle != v31
    || self->_previousContainerRenderingStyle != v34)
  {
    if (v34 == v31)
    {
      v35 = SBLogSystemAperturePreferencesStackRenderingCloning();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        SBStringFromSystemApertureContainerRenderingStyle(v31);
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        v37 = SBStringFromSystemApertureContainerCloningStyle(v19);
        *(_DWORD *)buf = 138543618;
        id v78 = v36;
        __int16 v79 = 2114;
        v80 = v37;
        _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEFAULT, "Updating curtain and container rendering style to: %{public}@, cloning style: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v38 = SBLogSystemAperturePreferencesStackRenderingCloning();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        SBStringFromSystemApertureContainerRenderingStyle(v31);
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        v40 = SBStringFromSystemApertureContainerCloningStyle(v19);
        *(_DWORD *)buf = 138543618;
        id v78 = v39;
        __int16 v79 = 2114;
        v80 = v40;
        _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_DEFAULT, "Updating curtain rendering style to: %{public}@, cloning style: %{public}@", buf, 0x16u);
      }
      v35 = SBLogSystemAperturePreferencesStackRenderingCloning();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        SBStringFromSystemApertureContainerRenderingStyle(v34);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = SBStringFromSystemApertureContainerCloningStyle(v19);
        *(_DWORD *)buf = 138543618;
        id v78 = v41;
        __int16 v79 = 2114;
        v80 = v42;
        _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEFAULT, "Updating container rendering style to: %{public}@, cloning style: %{public}@", buf, 0x16u);
      }
    }
  }
  self->_previousContainerRenderingStyle = v34;
  self->_previousCurtainRenderingStyle = v31;
  self->_previousCloningStyle = v19;
  v43 = (void *)v72[5];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __69__SBSARenderingAndCloningPreferencesProvider_preferencesFromContext___block_invoke;
  v62[3] = &unk_1E6AF9D00;
  v62[4] = self;
  v62[5] = &v71;
  v62[6] = a2;
  long long v63 = v69;
  uint64_t v64 = v70;
  long long v65 = v67;
  uint64_t v66 = v68;
  uint64_t v44 = [v43 copyWithBlock:v62];
  v45 = (void *)v72[5];
  v72[5] = v44;

  v46 = (void *)[v10 copyByUpdatingPreferences:v72[5]];
  v61.receiver = self;
  v61.super_class = (Class)SBSARenderingAndCloningPreferencesProvider;
  v47 = [(SBSABasePreferencesProvider *)&v61 preferencesFromContext:v46];
  uint64_t v48 = objc_opt_class();
  id v49 = v47;
  if (v48)
  {
    if (objc_opt_isKindOfClass()) {
      v50 = v49;
    }
    else {
      v50 = 0;
    }
  }
  else
  {
    v50 = 0;
  }
  id v51 = v50;

  v52 = (void *)v72[5];
  v72[5] = (uint64_t)v51;

  id v53 = (id)v72[5];
  _Block_object_dispose(&v71, 8);

  return v53;
}

void __69__SBSARenderingAndCloningPreferencesProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
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

    if (v7) {
      goto LABEL_10;
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSARenderingAndCloningPreferencesProvider.m", 98, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];
  }
  id v7 = 0;
LABEL_10:

  long long v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containerViewDescriptions];
  id v15 = (void *)[v14 mutableCopy];

  if ([v15 count])
  {
    unint64_t v16 = 0;
    do
    {
      int v17 = [v15 objectAtIndex:v16];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __69__SBSARenderingAndCloningPreferencesProvider_preferencesFromContext___block_invoke_2;
      v22[3] = &unk_1E6AF9CD8;
      uint64_t v18 = *(void *)(a1 + 48);
      v22[4] = *(void *)(a1 + 32);
      v22[5] = v18;
      long long v23 = *(_OWORD *)(a1 + 56);
      uint64_t v24 = *(void *)(a1 + 72);
      uint64_t v19 = (void *)[v17 copyWithBlock:v22];

      [v15 replaceObjectAtIndex:v16 withObject:v19];
      ++v16;
    }
    while (v16 < [v15 count]);
  }
  [v7 setContainerViewDescriptions:v15];
  long long v20 = *(_OWORD *)(a1 + 80);
  uint64_t v21 = *(void *)(a1 + 96);
  [v7 setCurtainRenderingConfiguration:&v20];
  long long v20 = *(_OWORD *)(a1 + 80);
  uint64_t v21 = *(void *)(a1 + 96);
  [v7 setHighLevelCurtainRenderingConfiguration:&v20];
}

@end