@interface SBZStackForegroundSceneOrderedPolicyAssistant
- (SBZStackForegroundSceneOrderedPolicyAssistant)initWithDelegate:(id)a3;
- (SBZStackForegroundSceneOrderedPolicyAssistant)initWithParticipant:(id)a3;
- (id)_foregroundScenes;
- (id)observedSceneSettings;
- (int64_t)resolveProposedPoliciesForForegroundScenes:(id)a3;
- (void)_didUpdateClientSettingsWithDiff:(id)a3;
- (void)_invokePropertyResolution;
- (void)dealloc;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)setForegroundScenes:(id)a3;
@end

@implementation SBZStackForegroundSceneOrderedPolicyAssistant

- (void)setForegroundScenes:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4 && ![v4 count])
  {

    v5 = 0;
  }
  if ((BSEqualArrays() & 1) == 0)
  {
    v6 = objc_msgSend(v5, "bs_differenceWithArray:", self->_foregroundScenes);
    v7 = [(NSArray *)self->_foregroundScenes bs_differenceWithArray:v5];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * v11++) removeObserver:self];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v9);
    }
    v12 = (NSArray *)[v5 copy];
    foregroundScenes = self->_foregroundScenes;
    self->_foregroundScenes = v12;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "addObserver:", self, (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }

    [(SBZStackForegroundSceneOrderedPolicyAssistant *)self _invokePropertyResolution];
  }
}

- (void)_invokePropertyResolution
{
  v3 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)self _foregroundScenes];
  int64_t v4 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)self resolveProposedPoliciesForForegroundScenes:v3];

  if (v4 == 1)
  {
    id v7 = [(id)objc_opt_class() description];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained foregroundSceneZStackPolicyAssistantDidChange:self forReason:v7];

    id v6 = objc_loadWeakRetained((id *)&self->_zStackParticipant);
    [v6 setNeedsUpdatePreferencesWithReason:v7];
  }
}

- (id)_foregroundScenes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(NSArray *)self->_foregroundScenes reverseObjectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v8 sceneIfExists];
          if (v9)
          {
            if (!v5) {
              id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v5 addObject:v9];
          }
        }
        else
        {
          if (!v5) {
            id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v5 addObject:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v7 = a4;
  if ([(NSArray *)self->_foregroundScenes containsObject:a3]) {
    [(SBZStackForegroundSceneOrderedPolicyAssistant *)self _didUpdateClientSettingsWithDiff:v7];
  }
}

- (void)_didUpdateClientSettingsWithDiff:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_observedSceneSettingSelectors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(v4, "containsProperty:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "pointerValue", (void)v10)))
        {

          [(SBZStackForegroundSceneOrderedPolicyAssistant *)self _invokePropertyResolution];
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (SBZStackForegroundSceneOrderedPolicyAssistant)initWithDelegate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBZStackForegroundSceneOrderedPolicyAssistant;
  uint64_t v6 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)&v12 init];
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  if (v5)
  {
    objc_storeWeak((id *)&v6->_delegate, v5);
    uint64_t v8 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)v7 observedSceneSettings];
    observedSceneSettingSelectors = v7->_observedSceneSettingSelectors;
    v7->_observedSceneSettingSelectors = (NSArray *)v8;

LABEL_4:
    return v7;
  }
  long long v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"delegate != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBZStackForegroundSceneOrderedPolicyAssistant initWithDelegate:](a2);
  }
  [v11 UTF8String];
  result = (SBZStackForegroundSceneOrderedPolicyAssistant *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (SBZStackForegroundSceneOrderedPolicyAssistant)initWithParticipant:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBZStackForegroundSceneOrderedPolicyAssistant;
  uint64_t v6 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)&v21 init];
  if (v6)
  {
    id v7 = v5;
    if (v7)
    {
      uint64_t v8 = v7;
      objc_opt_class();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

        objc_storeWeak((id *)&v6->_zStackParticipant, v8);
        uint64_t v9 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)v6 observedSceneSettings];
        observedSceneSettingSelectors = v6->_observedSceneSettingSelectors;
        v6->_observedSceneSettingSelectors = (NSArray *)v9;

        goto LABEL_5;
      }
      uint64_t v16 = NSString;
      uint64_t v17 = (objc_class *)[v8 classForCoder];
      if (!v17) {
        uint64_t v17 = (objc_class *)objc_opt_class();
      }
      uint64_t v18 = NSStringFromClass(v17);
      objc_opt_class();
      long long v19 = (objc_class *)objc_opt_class();
      long long v20 = NSStringFromClass(v19);
      uint64_t v15 = [v16 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"participant", v18, v20];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBZStackForegroundSceneOrderedPolicyAssistant initWithParticipant:](a2);
      }
    }
    else
    {
      objc_super v12 = NSString;
      objc_opt_class();
      long long v13 = (objc_class *)objc_opt_class();
      long long v14 = NSStringFromClass(v13);
      uint64_t v15 = [v12 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"participant", v14];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBZStackForegroundSceneOrderedPolicyAssistant initWithParticipant:](a2);
      }
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8A1C6B0);
  }
LABEL_5:

  return v6;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_foregroundScenes;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeObserver:self];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SBZStackForegroundSceneOrderedPolicyAssistant;
  [(SBZStackForegroundSceneOrderedPolicyAssistant *)&v8 dealloc];
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8 = a4;
  if ([(NSArray *)self->_foregroundScenes containsObject:a3]) {
    [(SBZStackForegroundSceneOrderedPolicyAssistant *)self _didUpdateClientSettingsWithDiff:v8];
  }
}

- (id)observedSceneSettings
{
  uint64_t v4 = [NSString stringWithFormat:@"subclass plz implement me"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    long long v10 = v5;
    __int16 v11 = 2114;
    long long v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"SBZStackForegroundSceneOrderedPolicyAssistant.m";
    __int16 v17 = 1024;
    int v18 = 133;
    __int16 v19 = 2114;
    long long v20 = v4;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (int64_t)resolveProposedPoliciesForForegroundScenes:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [NSString stringWithFormat:@"subclass plz implement me"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    id v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    int v11 = 138544642;
    long long v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = self;
    __int16 v17 = 2114;
    int v18 = @"SBZStackForegroundSceneOrderedPolicyAssistant.m";
    __int16 v19 = 1024;
    int v20 = 137;
    __int16 v21 = 2114;
    long long v22 = v6;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
  }
  [v6 UTF8String];
  int64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneClientSettingsDiffInspector, 0);
  objc_destroyWeak((id *)&self->_zStackParticipant);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observedSceneSettingSelectors, 0);
  objc_storeStrong((id *)&self->_foregroundScenes, 0);
}

- (void)initWithDelegate:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithParticipant:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end