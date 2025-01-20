@interface SBSystemApertureZStackPolicyAssistant
- (BOOL)suppressSystemApertureForSystemChromeSuppression;
- (id)initWithParticipant:(id *)a1;
- (uint64_t)initWithDelegate:(id *)a1;
- (void)_resolveProposedPolicies;
- (void)homeGrabberViewDidUpdateHidden:(id)a3;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)setForegroundExclusiveSceneHandle:(void *)a3 homeGrabberView:;
@end

@implementation SBSystemApertureZStackPolicyAssistant

- (BOOL)suppressSystemApertureForSystemChromeSuppression
{
  if (result) {
    return *(unsigned char *)(result + 24) != 0;
  }
  return result;
}

- (void)setForegroundExclusiveSceneHandle:(void *)a3 homeGrabberView:
{
  id obj = a2;
  id v5 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained == obj)
    {
      v7 = (id *)(a1 + 40);
      id v8 = objc_loadWeakRetained((id *)(a1 + 40));
      v9 = v5;
      if (v8 == v5)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      [WeakRetained removeObserver:a1];
      objc_storeWeak((id *)(a1 + 32), obj);
      [obj addObserver:a1];
      v7 = (id *)(a1 + 40);
      id v8 = objc_loadWeakRetained((id *)(a1 + 40));
      v9 = v5;
      if (v8 == v5) {
        goto LABEL_7;
      }
    }
    v9 = v8;
    [v8 removeObserver:a1];
    objc_storeWeak(v7, v5);
    [v5 addObserver:a1];
LABEL_7:
    -[SBSystemApertureZStackPolicyAssistant _resolveProposedPolicies](a1);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_resolveProposedPolicies
{
  if (!a1) {
    return;
  }
  int v2 = *(unsigned __int8 *)(a1 + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained sceneIfExists];
  v4 = [v3 clientSettings];
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

  int v9 = [v8 statusBarHidden];
  int v10 = [v8 homeIndicatorAutoHidden];

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)(a1 + 40));
    int v12 = [v11 isHidden];

    v9 |= v12;
  }
  BOOL v13 = v2 != v9;
  if (v2 != v9) {
    *(unsigned char *)(a1 + 24) = v9;
  }
  v14 = [WeakRetained application];
  v15 = [v14 bundleIdentifier];

  v16 = [*(id *)(a1 + 48) anyObject];
  char v17 = BSEqualStrings();

  if ((v17 & 1) == 0)
  {
    if (v15)
    {
      uint64_t v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
    }
    else
    {
      uint64_t v18 = 0;
    }
    v19 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v18;

    BOOL v13 = 1;
  }
  v20 = [WeakRetained sceneIdentifier];
  v21 = [*(id *)(a1 + 56) anyObject];
  char v22 = BSEqualStrings();

  if (v22)
  {
    if (!v13) {
      goto LABEL_24;
    }
  }
  else
  {
    if (v20)
    {
      uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v20];
    }
    else
    {
      uint64_t v23 = 0;
    }
    v24 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v23;
  }
  v25 = *(void **)(a1 + 16);
  v26 = [(id)objc_opt_class() description];
  [v25 setNeedsUpdatePreferencesWithReason:v26];

  id v27 = objc_loadWeakRetained((id *)(a1 + 8));
  [v27 systemApertureZStackPolicyAssistantDidChange:a1];

LABEL_24:
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  p_foregroundExclusiveSceneHandle = &self->_foregroundExclusiveSceneHandle;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_foregroundExclusiveSceneHandle);

  if (WeakRetained == v7)
  {
    -[SBSystemApertureZStackPolicyAssistant _resolveProposedPolicies]((uint64_t)self);
  }
}

- (id)initWithParticipant:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)SBSystemApertureZStackPolicyAssistant;
    a1 = (id *)objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      id v5 = v4;
      if (v5)
      {
        id v6 = v5;
        objc_opt_class();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

          objc_storeStrong(a1 + 2, a2);
          goto LABEL_6;
        }
        int v12 = NSString;
        BOOL v13 = (objc_class *)[v6 classForCoder];
        if (!v13) {
          BOOL v13 = (objc_class *)objc_opt_class();
        }
        v14 = NSStringFromClass(v13);
        objc_opt_class();
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        id v11 = [v12 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"participant", v14, v16];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[SBSystemApertureZStackPolicyAssistant initWithParticipant:](sel_initWithParticipant_);
        }
      }
      else
      {
        id v8 = NSString;
        objc_opt_class();
        int v9 = (objc_class *)objc_opt_class();
        int v10 = NSStringFromClass(v9);
        id v11 = [v8 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"participant", v10];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[SBSystemApertureZStackPolicyAssistant initWithParticipant:](sel_initWithParticipant_);
        }
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8B0AF10);
    }
  }
LABEL_6:

  return a1;
}

- (uint64_t)initWithDelegate:(id *)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_5;
  }
  v7.receiver = a1;
  v7.super_class = (Class)SBSystemApertureZStackPolicyAssistant;
  id v4 = (id *)objc_msgSendSuper2(&v7, sel_init);
  a1 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v3)
  {
    objc_storeWeak(v4 + 1, v3);
LABEL_5:

    return (uint64_t)a1;
  }
  id v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"delegate != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBSystemApertureZStackPolicyAssistant initWithDelegate:](sel_initWithDelegate_);
  }
  [v6 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)homeGrabberViewDidUpdateHidden:(id)a3
{
  p_foregroundExclusiveHomeGrabberView = &self->_foregroundExclusiveHomeGrabberView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_foregroundExclusiveHomeGrabberView);

  if (WeakRetained == v5)
  {
    -[SBSystemApertureZStackPolicyAssistant _resolveProposedPolicies]((uint64_t)self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedSceneIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifiersToSuppressInSystemAperture, 0);
  objc_destroyWeak((id *)&self->_foregroundExclusiveHomeGrabberView);
  objc_destroyWeak((id *)&self->_foregroundExclusiveSceneHandle);
  objc_storeStrong((id *)&self->_participant, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithParticipant:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  int v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDelegate:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  int v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end