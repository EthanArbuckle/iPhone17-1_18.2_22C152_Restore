@interface UIEventDeferringBehavior
@end

@implementation UIEventDeferringBehavior

void __65___UIEventDeferringBehavior_Default_wantsLocalCompatibilityRules__block_invoke()
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v3 = _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses))
  {
    BOOL v1 = 1;
  }
  else
  {
    do
    {
      BOOL v1 = v0 >= v3;
      if (v0 < v3) {
        break;
      }
      _UIInternalPreferenceSync(v0, &_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses, @"ShouldWriteCompatibilityEventDeferringRulesForAllProcesses", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v3 = _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses;
    }
    while (v0 != _UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses);
  }
  if (byte_1EB256E84) {
    char v2 = 1;
  }
  else {
    char v2 = v1;
  }
  wantsLocalCompatibilityRules_defaultWantsCompatRules = v2;
}

void __79___UIEventDeferringBehavior_SystemShell_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  int v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79___UIEventDeferringBehavior_SystemShell_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __79___UIEventDeferringBehavior_SystemShell_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned char *)(*(void *)(a1 + 40) + 32) & 1 withName:@"hasSystemShellBehaviorDelegate"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 32) >> 1) & 1 withName:@"delegateWantsLocalCompatibilityRules"];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 32) >> 2) & 1 withName:@"delegateShouldSuppressRemoteRule"];
  id v5 = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 32) >> 3) & 1 withName:@"delegateCompareRemoteRules"];
  id v6 = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 32) >> 4) & 1 withName:@"delegateEvaluatesVisibilityOfRemoteRuleWindow"];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));

  if (WeakRetained)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    if (v14)
    {
      v9 = NSString;
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = [v9 stringWithFormat:@"<%@: %p>", v11, v14];
    }
    else
    {
      v12 = @"(nil)";
    }

    id v13 = (id)[v8 appendObject:v12 withName:@"systemShellBehaviorDelegate"];
  }
}

@end