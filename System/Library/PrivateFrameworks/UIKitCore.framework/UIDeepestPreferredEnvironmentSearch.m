@interface UIDeepestPreferredEnvironmentSearch
@end

@implementation UIDeepestPreferredEnvironmentSearch

void __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if ([v11 isLeafPreference])
  {
    if ([v11 isPrimaryPreference])
    {
      uint64_t v5 = [v11 environment];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      *a3 = 3;
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    else
    {
      uint64_t v8 = 0;
    }
    v9 = *(void **)(a1 + 32);
    v10 = [v11 environment];
    [v9 setResolvedPreference:v8 forEnvironment:v10];
  }
  [*(id *)(a1 + 40) _reportFinishedEvaluatingAllPreferencesForEnvironmentInContext:v11 result:a3];
}

BOOL __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 environment];
  BOOL v4 = v3 != *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return v4;
}

void __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_3(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 environment];
  if (([v5 isPreferredByItself] & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v5 preferredEnvironments];
    [v7 setPreferredEnvironments:v8 forEnvironment:v6];

    char v41 = 0;
    v9 = [*(id *)(a1 + 32) preferredEnvironmentsForEnvironment:v6 isFinal:&v41];
    v10 = [v9 firstObject];

    if (v41)
    {
      if ([v5 isPrimaryPreference])
      {
        uint64_t v11 = [*(id *)(a1 + 32) deepestPrimaryPreferredEnvironmentForEnvironment:*(void *)(a1 + 40)];
        uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
        v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
      }
      v14 = _UIFocusItemSafeCast(v10);
      uint64_t v15 = [v5 debugStack];
      v16 = NSString;
      id v17 = v6;
      v39 = v10;
      v40 = a3;
      v38 = v16;
      v18 = (void *)v15;
      if (v17)
      {
        v19 = NSString;
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        v22 = [v19 stringWithFormat:@"<%@: %p>", v21, v17];
      }
      else
      {
        v22 = @"(nil)";
      }

      id v27 = v14;
      if (v27)
      {
        v28 = v14;
        v29 = NSString;
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        v32 = [v29 stringWithFormat:@"<%@: %p>", v31, v27];

        v33 = [v38 stringWithFormat:@"Using cached result for %@. Preferring %@", v22, v32];
        v34 = +[_UIDebugLogMessage messageWithStyle:2 string:v33];
        [v18 addMessage:v34];

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v28);
        uint64_t v35 = 3;
      }
      else
      {

        v36 = [v16 stringWithFormat:@"Using cached result for %@. Preferring %@", v22, @"(nil)"];
        v37 = +[_UIDebugLogMessage messageWithStyle:2 string:v36];
        [v18 addMessage:v37];

        uint64_t v35 = 1;
      }
      uint64_t *v40 = v35;

      goto LABEL_23;
    }
  }
  v23 = [*(id *)(a1 + 48) focusSystem];
  v24 = v23;
  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)
    && [v23 _isEnvironmentLocked:v6])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v6);
  }
  if (([v5 isPreferredByItself] & 1) == 0)
  {
    v25 = _UIFocusItemSafeCast(v6);
    v26 = v25;
    if (v24 && v25 && _UIFocusItemIsFocusedOrFocusableInFocusSystem(v25, v24))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v26);
      [*(id *)(a1 + 56) _reportFoundFocusableItem:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) inContext:v5];
    }
  }
LABEL_23:
}

void __87___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusEnvironmentForEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [v6 environment];
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && [*(id *)(a1 + 32) _isEnvironmentLocked:v5])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  }
  if ([v6 isLeafPreference])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    *a3 = 3;
  }
}

void __125___UIDeepestPreferredEnvironmentSearch__overridingPreferredFocusEnvironmentForPreferredEnvironment_visitedFocusEnvironments___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    *a3 = 1;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = [v7 _overridingPreferredFocusEnvironment];
      if (v6)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      }
    }
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __110___UIDeepestPreferredEnvironmentSearch__reportFinishedEvaluatingAllPreferencesForEnvironmentInContext_result___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 environment];

  if (v8 != v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end