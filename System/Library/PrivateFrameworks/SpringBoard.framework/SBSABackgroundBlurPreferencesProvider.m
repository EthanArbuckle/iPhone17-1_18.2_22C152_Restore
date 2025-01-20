@interface SBSABackgroundBlurPreferencesProvider
+ (CGRect)frameForVariableBlurUnderContainerViewWithFrame:(CGRect)a3 offscreen:(BOOL)a4 context:(id)a5;
- (id)preferencesFromContext:(id)a3;
@end

@implementation SBSABackgroundBlurPreferencesProvider

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
    [v10 handleFailureInMethod:a2, self, @"SBSABackgroundBlurPreferencesProvider.m", 39, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v9 = 0;
  }

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__89;
  v41 = __Block_byref_object_dispose__89;
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

  id v42 = v18;
  v19 = (void *)v38[5];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __64__SBSABackgroundBlurPreferencesProvider_preferencesFromContext___block_invoke;
  v33[3] = &unk_1E6B05418;
  SEL v36 = a2;
  v33[4] = self;
  id v20 = v9;
  id v34 = v20;
  v35 = &v37;
  uint64_t v21 = [v19 copyWithBlock:v33];
  v22 = (void *)v38[5];
  v38[5] = v21;

  v23 = (void *)[v20 copyByUpdatingPreferences:v38[5]];
  v32.receiver = self;
  v32.super_class = (Class)SBSABackgroundBlurPreferencesProvider;
  v24 = [(SBSABasePreferencesProvider *)&v32 preferencesFromContext:v23];
  uint64_t v25 = objc_opt_class();
  id v26 = v24;
  if (v25)
  {
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }
  id v28 = v27;

  v29 = (void *)v38[5];
  v38[5] = (uint64_t)v28;

  id v30 = (id)v38[5];
  _Block_object_dispose(&v37, 8);

  return v30;
}

+ (CGRect)frameForVariableBlurUnderContainerViewWithFrame:(CGRect)a3 offscreen:(BOOL)a4 context:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a5;
  if (a4)
  {
    double v11 = -360.0;
  }
  else
  {
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double v12 = CGRectGetMaxY(v18) + -40.0;
    if (v12 <= 180.0) {
      double v11 = v12 + -180.0;
    }
    else {
      double v11 = 0.0;
    }
  }
  [v10 systemContainerBounds];
  CGFloat v13 = CGRectGetWidth(v19);

  double v14 = 360.0;
  double v15 = 0.0;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

void __64__SBSABackgroundBlurPreferencesProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
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

  id v8 = v7;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 32);
    Class v12 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    CGFloat v13 = (objc_class *)objc_opt_class();
    double v14 = NSStringFromClass(v13);
    [v9 handleFailureInMethod:v10, v11, @"SBSABackgroundBlurPreferencesProvider.m", 43, @"Unexpected class – expected '%@', got '%@'", v12, v14 object file lineNumber description];

LABEL_9:
    id v8 = 0;
  }
  id v75 = v3;

  double v15 = [*(id *)(a1 + 40) elementContexts];
  double v16 = [v15 objectAtIndex:0];

  double v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) containerViewDescriptions];
  CGRect v18 = [v17 objectAtIndex:0];

  uint64_t v19 = [v16 layoutMode];
  v78 = v16;
  uint64_t v20 = [v16 systemApertureCustomLayout];
  int v21 = [*(id *)(a1 + 40) isReduceTransparencyEnabled];
  v22 = [(id)objc_opt_class() settings];
  int v23 = [v22 backgroundBlurEnabled];

  v81 = v18;
  [v18 bounds];
  int v28 = 0;
  if (v19 == 3 && v20 != 2)
  {
    if (CGRectGetHeight(*(CGRect *)&v24) >= 74.0) {
      int v28 = v23 & ~v21;
    }
    else {
      int v28 = 0;
    }
  }
  v79 = v8;
  v29 = v18;
  [v18 center];
  SBUnintegralizedRectCenteredAboutPoint();
  objc_msgSend((id)objc_opt_class(), "frameForVariableBlurUnderContainerViewWithFrame:offscreen:context:", v28 ^ 1u, *(void *)(a1 + 40), v30, v31, v32, v33);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  id v42 = objc_alloc_init(SBSABackgroundBlurDescription);
  v43 = [SBSAInterfaceElementPropertyIdentity alloc];
  v77 = v42;
  v44 = [(SBSABackgroundBlurDescription *)v42 interfaceElementIdentifier];
  obj = [(SBSAInterfaceElementPropertyIdentity *)v43 initWithAssociatedInterfaceElementIdentifier:v44 andProperty:@"blurFrame"];

  v45 = [SBSAInterfaceElementPropertyIdentity alloc];
  v46 = [v81 interfaceElementIdentifier];
  v76 = [(SBSAInterfaceElementPropertyIdentity *)v45 initWithAssociatedInterfaceElementIdentifier:v46 andProperty:@"bounds"];

  uint64_t v47 = *(void *)(a1 + 32);
  if (((v28 ^ 1) & 1) == 0)
  {
    v48 = *(void **)(v47 + 40);
    *(void *)(v47 + 40) = 0;

    int v49 = 0;
    uint64_t v50 = 2;
LABEL_17:
    v51 = v75;
    goto LABEL_37;
  }
  uint64_t v50 = *(void *)(v47 + 32);
  if (v50 == 1)
  {
    if (!*(void *)(v47 + 40))
    {
      int v49 = 0;
      uint64_t v50 = 1;
      goto LABEL_17;
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v52 = [*(id *)(a1 + 40) animatedTransitionResults];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v82 objects:v90 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v83;
      uint64_t v50 = 1;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v83 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          v58 = [v57 associatedInterfaceElementPropertyIdentity];
          int v59 = [v58 isEqual:*(void *)(*(void *)(a1 + 32) + 40)];

          if (v59 && [v57 finished])
          {
            uint64_t v60 = *(void *)(a1 + 32);
            v61 = *(void **)(v60 + 40);
            *(void *)(v60 + 40) = 0;

            uint64_t v50 = 0;
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v82 objects:v90 count:16];
      }
      while (v54);
    }
    else
    {
      uint64_t v50 = 1;
    }

    int v49 = 0;
    v51 = v75;
    v29 = v81;
  }
  else
  {
    v51 = v75;
    if (v50 == 2)
    {
      objc_storeStrong((id *)(v47 + 40), obj);
      int v49 = 1;
      uint64_t v50 = 1;
    }
    else
    {
      int v49 = 0;
    }
  }
LABEL_37:
  if (v50 != *(void *)(*(void *)(a1 + 32) + 32))
  {
    v62 = SBLogSystemApertureController();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v63 = *(void *)(*(void *)(a1 + 32) + 32);
      if (v63 == 1) {
        v64 = @"visible-pending-milestone";
      }
      else {
        v64 = @"hidden";
      }
      if (v63 == 2) {
        v65 = @"visible";
      }
      else {
        v65 = v64;
      }
      v66 = v65;
      if (v50 == 1) {
        v67 = @"visible-pending-milestone";
      }
      else {
        v67 = @"hidden";
      }
      if (v50 == 2) {
        v67 = @"visible";
      }
      v29 = v81;
      v68 = v67;
      *(_DWORD *)buf = 138543618;
      v87 = v66;
      __int16 v88 = 2114;
      v89 = v68;
      _os_log_impl(&dword_1D85BA000, v62, OS_LOG_TYPE_DEFAULT, "Background Blur: Updating background blur visibility: (%{public}@) -> (%{public}@)", buf, 0x16u);
    }
    *(void *)(*(void *)(a1 + 32) + 32) = v50;
  }
  v69 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) effectiveAnimatedTransitionDescriptionForProperty:v76];
  if (v69)
  {
    v70 = v79;
    v71 = obj;
    if (v49)
    {
      v72 = [MEMORY[0x1E4F1CAD0] setWithObject:0x1F3348CE8];
    }
    else
    {
      v72 = 0;
    }
    [v79 associateAnimatedTransitionDescriptionOfProperty:v76 withProperty:obj withMilestones:v72];
    goto LABEL_59;
  }
  v70 = v79;
  v71 = obj;
  if (v49)
  {
    v72 = [MEMORY[0x1E4F28B00] currentHandler];
    [v72 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"SBSABackgroundBlurPreferencesProvider.m" lineNumber:102 description:@"Can't add milestone when there's no dismissal animation."];
LABEL_59:
  }
  id v73 = [(SBSABackgroundBlurDescription *)v77 copyBySettingBlurHidden:*(void *)(*(void *)(a1 + 32) + 32) == 0];

  v74 = objc_msgSend(v73, "copyBySettingBlurFrame:", v35, v37, v39, v41);
  [v70 setBackgroundBlurDescription:v74];
}

- (void).cxx_destruct
{
}

@end