@interface UIWindowScene(UIAccessibilityElementTraversal)
- (id)_accessibilityTraversalWindows;
- (id)_accessibilityTraversalWindowsWithOptions:()UIAccessibilityElementTraversal;
- (id)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal;
@end

@implementation UIWindowScene(UIAccessibilityElementTraversal)

- (id)_accessibilityTraversalWindows
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = +[UIAccessibilityElementTraversalOptions options];
  [v2 setShouldIncludeStatusBarWindow:1];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [a1 _accessibilityTraversalWindowsWithOptions:v2];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 axSafelyAddObjectsFromArray:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_accessibilityTraversalWindowsWithOptions:()UIAccessibilityElementTraversal
{
  id v4 = a3;
  uint64_t v5 = [a1 _visibleWindows];
  uint64_t v6 = (void *)[v5 mutableCopy];

  [v6 sortWithOptions:16 usingComparator:&__block_literal_global_541];
  uint64_t v7 = (id *)MEMORY[0x1E4F43630];
  v8 = [(id)*MEMORY[0x1E4F43630] _accessibilityMainWindow];
  v9 = [v8 windowScene];

  if (v9 != a1)
  {
    long long v10 = [*v7 _accessibilityMainWindowInWindows:v6];
    long long v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [a1 keyWindow];
    }
    id v13 = v12;

    v8 = v13;
  }
  v14 = [*v7 _accessibilityElementWindowsWithOptions:v4 referenceWindow:v8 allWindows:v6];

  return v14;
}

- (id)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  v21 = a1;
  uint64_t v6 = [a1 _accessibilityTraversalWindowsWithOptions:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0x1E4F42000uLL;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = objc_msgSend(*(id *)(v9 + 4080), "_accessibilityElementsAndContainersDescendingFromViews:options:sorted:", *(void *)(*((void *)&v22 + 1) + 8 * i), v4, objc_msgSend(v4, "sorted"));
        if (v12)
        {
          if ([v4 shouldReturnScannerGroups]
            && (unint64_t)[v6 count] >= 2)
          {
            id v13 = v5;
            v14 = (void *)MEMORY[0x1E4F1CA60];
            v26 = @"GroupElements";
            v27 = v12;
            uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
            v16 = [v14 dictionaryWithDictionary:v15];

            [v16 setObject:&unk_1EF1718C0 forKeyedSubscript:@"GroupTraits"];
            v17 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v21, "_accessibilityScanningBehaviorTraits") | 0x10);
            [v16 setObject:v17 forKeyedSubscript:@"GroupScanBehaviorTraits"];

            v18 = [v21 _accessibilityGroupIdentifier];
            if (v18) {
              [v16 setObject:v18 forKeyedSubscript:@"GroupIdentifier"];
            }
            uint64_t v5 = v13;
            [v13 addObject:v16];

            unint64_t v9 = 0x1E4F42000;
          }
          else
          {
            [v5 axSafelyAddObjectsFromArray:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }
  v19 = AXLogElementTraversal();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[UIWindowScene(UIAccessibilityElementTraversal) _accessibilityViewChildrenWithOptions:]();
  }

  return v5;
}

- (void)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "Children of the window scene are %{public}@", v2, v3, v4, v5, v6);
}

@end