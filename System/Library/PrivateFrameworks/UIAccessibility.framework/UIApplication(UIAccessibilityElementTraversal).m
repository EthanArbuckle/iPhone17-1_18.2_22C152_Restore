@interface UIApplication(UIAccessibilityElementTraversal)
- (id)_accessibilityElementWindowsWithOptions:()UIAccessibilityElementTraversal referenceWindow:;
- (id)_accessibilityElementWindowsWithOptions:()UIAccessibilityElementTraversal referenceWindow:allWindows:;
- (id)_accessibilityTraversalWindows;
- (id)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal referenceWindow:;
- (uint64_t)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:;
- (uint64_t)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal;
- (void)_accessibilityAddKeyboardWindowToArray:()UIAccessibilityElementTraversal forModalWindow:;
@end

@implementation UIApplication(UIAccessibilityElementTraversal)

- (uint64_t)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:
{
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (uint64_t)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal
{
  return [a1 _accessibilityViewChildrenWithOptions:a3 referenceWindow:0];
}

- (id)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal referenceWindow:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [a1 _accessibilityMainWindow];
  }
  v8 = [MEMORY[0x1E4F1CA48] array];
  v24 = v7;
  v25 = a1;
  v9 = [a1 _accessibilityElementWindowsWithOptions:v6 referenceWindow:v7];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0x1E4F42000uLL;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = objc_msgSend(*(id *)(v12 + 4080), "_accessibilityElementsAndContainersDescendingFromViews:options:sorted:", *(void *)(*((void *)&v26 + 1) + 8 * i), v6, objc_msgSend(v6, "sorted"));
        if (v15)
        {
          if ([v6 shouldReturnScannerGroups]
            && (unint64_t)[v9 count] >= 2)
          {
            v16 = v8;
            v17 = (void *)MEMORY[0x1E4F1CA60];
            v30 = @"GroupElements";
            v31 = v15;
            v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
            v19 = [v17 dictionaryWithDictionary:v18];

            [v19 setObject:&unk_1EF1718C0 forKeyedSubscript:@"GroupTraits"];
            v20 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v25, "_accessibilityScanningBehaviorTraits") | 0x10);
            [v19 setObject:v20 forKeyedSubscript:@"GroupScanBehaviorTraits"];

            v21 = [v25 _accessibilityGroupIdentifier];
            if (v21) {
              [v19 setObject:v21 forKeyedSubscript:@"GroupIdentifier"];
            }
            v8 = v16;
            [v16 addObject:v19];

            unint64_t v12 = 0x1E4F42000;
          }
          else
          {
            [v8 axSafelyAddObjectsFromArray:v15];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v11);
  }
  v22 = AXLogElementTraversal();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[UIApplication(UIAccessibilityElementTraversal) _accessibilityViewChildrenWithOptions:referenceWindow:]();
  }

  return v8;
}

- (void)_accessibilityAddKeyboardWindowToArray:()UIAccessibilityElementTraversal forModalWindow:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AXUIAllKeyboardWindows();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__UIApplication_UIAccessibilityElementTraversal___accessibilityAddKeyboardWindowToArray_forModalWindow___block_invoke;
  v10[3] = &unk_1E59B8CB8;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v10];
}

- (id)_accessibilityTraversalWindows
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v3 = +[UIAccessibilityElementTraversalOptions options];
  [v3 setShouldIncludeStatusBarWindow:1];
  v4 = [a1 _accessibilityMainWindow];
  id v5 = [a1 _accessibilityElementWindowsWithOptions:v3 referenceWindow:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v2, "axSafelyAddObjectsFromArray:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v2;
}

- (id)_accessibilityElementWindowsWithOptions:()UIAccessibilityElementTraversal referenceWindow:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__0;
  long long v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  AXPerformSafeBlock();
  uint64_t v8 = [a1 _accessibilityElementWindowsWithOptions:v6 referenceWindow:v7 allWindows:v11[5]];
  _Block_object_dispose(&v10, 8);

  return v8;
}

- (id)_accessibilityElementWindowsWithOptions:()UIAccessibilityElementTraversal referenceWindow:allWindows:
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v73 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  if (!_TextEffectsWindow)
  {
    _TextEffectsWindow = (uint64_t)NSClassFromString(&cfstr_Uitexteffectsw.isa);
    _CarPlayStatusBarWindow = (uint64_t)NSClassFromString(&cfstr_Dbstatusbarhos.isa);
    _StatusBarWindow = (uint64_t)NSClassFromString(&cfstr_Uistatusbarwin.isa);
    _SBMainSwitcherWindow = (uint64_t)NSClassFromString(&cfstr_Sbmainswitcher.isa);
    _SBBannerWindow = (uint64_t)NSClassFromString(&cfstr_Sbnotification.isa);
    _SSScreenshotsWindow = (uint64_t)NSClassFromString(&cfstr_Ssscreenshotsw.isa);
    _SBJindoWindow = (uint64_t)NSClassFromString(&cfstr_Sbsystemapertu.isa);
  }
  if ([v9 _accessibilityIsIsolatedWindow])
  {
    id v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
    [v10 addObject:v11];

    goto LABEL_95;
  }
  uint64_t v12 = objc_opt_new();
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __117__UIApplication_UIAccessibilityElementTraversal___accessibilityElementWindowsWithOptions_referenceWindow_allWindows___block_invoke;
  v100[3] = &unk_1E59B8CE0;
  id v72 = v12;
  id v101 = v72;
  [v73 enumerateObjectsUsingBlock:v100];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 accessibilityViewIsModal])
  {
    long long v13 = [MEMORY[0x1E4F1CA48] array];
    [a1 _accessibilityAddKeyboardWindowToArray:v13 forModalWindow:v9];
    [v13 addObject:v9];
    [v10 addObject:v13];
    goto LABEL_94;
  }
  long long v13 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = [v72 allKeys];
  id v15 = (void *)[v14 mutableCopy];

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  obuint64_t j = v15;
  uint64_t v74 = [obj countByEnumeratingWithState:&v96 objects:v106 count:16];
  if (!v74) {
    goto LABEL_93;
  }
  uint64_t v69 = *(void *)v97;
  v70 = v10;
  id v71 = v9;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v97 != v69) {
        objc_enumerationMutation(obj);
      }
      uint64_t v77 = v16;
      uint64_t v75 = *(void *)(*((void *)&v96 + 1) + 8 * v16);
      uint64_t v17 = objc_msgSend(v72, "objectForKeyedSubscript:");
      v18 = [MEMORY[0x1E4F1CA48] array];
      v78 = [MEMORY[0x1E4F1CA48] array];
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      v76 = v17;
      v19 = [v17 reverseObjectEnumerator];
      v20 = [v19 allObjects];

      uint64_t v21 = [v20 countByEnumeratingWithState:&v92 objects:v105 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v93;
        double v24 = -1.79769313e308;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v93 != v23) {
              objc_enumerationMutation(v20);
            }
            long long v26 = *(void **)(*((void *)&v92 + 1) + 8 * v25);
            if (![v26 accessibilityIsWindow]) {
              goto LABEL_39;
            }
            if ([v26 accessibilityElementsHidden]) {
              goto LABEL_39;
            }
            [v26 alpha];
            if (v27 <= 0.0 || ([v26 isHidden] & 1) != 0) {
              goto LABEL_39;
            }
            [v26 windowLevel];
            if (v28 < v24) {
              goto LABEL_26;
            }
            if (![v26 isUserInteractionEnabled]) {
              goto LABEL_26;
            }
            [v26 alpha];
            if (v29 <= 0.0 || ([v26 isHidden] & 1) != 0) {
              goto LABEL_26;
            }
            int v33 = [v26 _accessibilityIsIsolatedWindow];
            char v34 = v33;
            if (v33
              && (![v8 shouldIncludeStatusBarWindow] || (objc_opt_isKindOfClass() & 1) == 0))
            {
              goto LABEL_39;
            }
            if (objc_opt_isKindOfClass()) {
              goto LABEL_45;
            }
            if (objc_opt_isKindOfClass() & 1) == 0 || ([v26 isHidden])
            {
              if (v34)
              {
                int v30 = 1;
              }
              else
              {
                if ((objc_opt_isKindOfClass() & 1) == 0
                  && (objc_opt_isKindOfClass() & 1) == 0
                  && (objc_opt_isKindOfClass() & 1) == 0)
                {
                  [v26 windowLevel];
                  if (v35 > v24) {
                    [v78 removeAllObjects];
                  }
                  [v26 windowLevel];
                  double v24 = v36;
                  [v78 addObject:v26];
                }
LABEL_26:
                int v30 = 0;
              }
              if ([v8 shouldIncludeStatusBarWindow]
                && ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0))
              {
                [v26 _accessibilityWindowVisible];
                goto LABEL_32;
              }
              if ((v30 | [v26 _accessibilityWindowVisible]) == 1) {
LABEL_32:
              }
                [v18 addObject:v26];
              if (objc_opt_class() == _SBBannerWindow) {
                [v18 insertObject:v26 atIndex:0];
              }
              if (objc_opt_class() == _SSScreenshotsWindow)
              {
                v31 = [MEMORY[0x1E4F49478] server];
                int v32 = [v31 isScreenshotWindowVisible];

                if (v32) {
                  [v18 insertObject:v26 atIndex:0];
                }
              }
              if ([v26 accessibilityViewIsModal]) {
                goto LABEL_59;
              }
              goto LABEL_39;
            }
            v37 = [v26 subviews];
            uint64_t v38 = [v37 count];

            if (v38) {
LABEL_45:
            }
              [v18 addObject:v26];
LABEL_39:
            ++v25;
          }
          while (v22 != v25);
          uint64_t v39 = [v20 countByEnumeratingWithState:&v92 objects:v105 count:16];
          uint64_t v22 = v39;
        }
        while (v39);
      }
LABEL_59:

      [v13 addObjectsFromArray:v18];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __117__UIApplication_UIAccessibilityElementTraversal___accessibilityElementWindowsWithOptions_referenceWindow_allWindows___block_invoke_2;
      aBlock[3] = &unk_1E59B8D08;
      aBlock[4] = v75;
      v40 = (unsigned int (**)(void *, id))_Block_copy(aBlock);
      v41 = [(id)*MEMORY[0x1E4F43630] keyWindow];
      if ([v73 containsObject:v41]) {
        v42 = v41;
      }
      else {
        v42 = 0;
      }
      id v43 = v42;

      v44 = v78;
      if (v43
        && (![v78 count] || (objc_msgSend(v78, "containsObject:", v43) & 1) == 0)
        && ([v13 containsObject:v43] & 1) == 0)
      {
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v45 = v78;
        uint64_t v46 = [v45 countByEnumeratingWithState:&v87 objects:v104 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v88;
          while (2)
          {
            for (uint64_t i = 0; i != v47; ++i)
            {
              if (*(void *)v88 != v48) {
                objc_enumerationMutation(v45);
              }
              if ([*(id *)(*((void *)&v87 + 1) + 8 * i) accessibilityViewIsModal])
              {

                v44 = v78;
                goto LABEL_78;
              }
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v87 objects:v104 count:16];
            if (v47) {
              continue;
            }
            break;
          }
        }

        v44 = v78;
        if (([v43 accessibilityElementsHidden] & 1) == 0 && v40[2](v40, v43))
        {
          [v18 addObject:v43];
          [v13 addObject:v43];
        }
      }
LABEL_78:
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v50 = v44;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v83 objects:v103 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v84;
        do
        {
          for (uint64_t j = 0; j != v52; ++j)
          {
            if (*(void *)v84 != v53) {
              objc_enumerationMutation(v50);
            }
            uint64_t v55 = *(void *)(*((void *)&v83 + 1) + 8 * j);
            if (([v13 containsObject:v55] & 1) == 0)
            {
              [v18 addObject:v55];
              [v13 addObject:v55];
            }
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:&v83 objects:v103 count:16];
        }
        while (v52);
      }

      id v9 = v71;
      if (v71 && ([v13 containsObject:v71] & 1) == 0 && v40[2](v40, v71))
      {
        [v18 addObject:v71];
        [v13 addObject:v71];
      }
      [v13 addObjectsFromArray:v18];
      uint64_t v10 = v70;
      [v70 addObject:v18];

      uint64_t v16 = v77 + 1;
    }
    while (v77 + 1 != v74);
    uint64_t v74 = [obj countByEnumeratingWithState:&v96 objects:v106 count:16];
  }
  while (v74);
LABEL_93:

LABEL_94:
LABEL_95:
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v56 = v10;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v79 objects:v102 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v80;
    do
    {
      for (uint64_t k = 0; k != v58; ++k)
      {
        if (*(void *)v80 != v59) {
          objc_enumerationMutation(v56);
        }
        v61 = *(void **)(*((void *)&v79 + 1) + 8 * k);
        uint64_t v62 = [v61 count];
        if (v62 - 1 >= 0)
        {
          uint64_t v63 = v62;
          do
          {
            v64 = [v61 objectAtIndexedSubscript:--v63];
            if (([v64 accessibilityElementsHidden] & 1) != 0 || (objc_msgSend(v64, "alpha"), v65 <= 0.0)) {
              [v61 removeObjectAtIndex:v63];
            }
          }
          while (v63 > 0);
        }
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v79 objects:v102 count:16];
    }
    while (v58);
  }

  v66 = AXLogElementTraversal();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
    -[UIApplication(UIAccessibilityElementTraversal) _accessibilityElementWindowsWithOptions:referenceWindow:allWindows:]();
  }

  return v56;
}

- (void)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal referenceWindow:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "Children of the UIApp are %{public}@", v2, v3, v4, v5, v6);
}

- (void)_accessibilityElementWindowsWithOptions:()UIAccessibilityElementTraversal referenceWindow:allWindows:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19F2DB000, v0, v1, "All windows are %{public}@. Reference window was %{public}@");
}

@end