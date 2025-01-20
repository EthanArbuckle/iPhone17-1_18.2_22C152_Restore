@interface SBAllowAmbientIdleTimerAttributeHandler
+ (Class)attributeBaseClass;
+ (id)attributeClasses;
- (id)countingTargetForEntry:(id)a3;
- (void)activateWithFirstEntry:(id)a3;
- (void)deactivateWithFinalEntry:(id)a3;
@end

@implementation SBAllowAmbientIdleTimerAttributeHandler

+ (id)attributeClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

- (id)countingTargetForEntry:(id)a3
{
  id v5 = a3;
  v6 = [v5 attribute];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v6 isForSleepFocus]) {
      v7 = @"Sleep";
    }
    else {
      v7 = @"NotSleep";
    }
    v8 = v7;

    return v8;
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[attribute isKindOfClass:[AMAllowAmbientIdleTimerAttribute class]]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBAllowAmbientIdleTimerAttributeHandler *)a2 countingTargetForEntry:(uint64_t)v10];
    }
    [v10 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)activateWithFirstEntry:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __66__SBAllowAmbientIdleTimerAttributeHandler_activateWithFirstEntry___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) attribute];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend((id)_allAmbientIdleTimerControllers, "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_setIdleTimerAllowedForAssertions:forSleepFocus:", 1, objc_msgSend(v1, "isForSleepFocus"));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)deactivateWithFinalEntry:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __68__SBAllowAmbientIdleTimerAttributeHandler_deactivateWithFinalEntry___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) attribute];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend((id)_allAmbientIdleTimerControllers, "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_setIdleTimerAllowedForAssertions:forSleepFocus:", 0, objc_msgSend(v1, "isForSleepFocus"));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)countingTargetForEntry:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  long long v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  long long v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBAmbientIdleTimerController.m";
  __int16 v16 = 1024;
  int v17 = 344;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end