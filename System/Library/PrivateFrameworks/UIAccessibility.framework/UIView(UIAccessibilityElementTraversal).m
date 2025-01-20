@interface UIView(UIAccessibilityElementTraversal)
+ (id)_accessibilityElementsAndContainersDescendingFromViews:()UIAccessibilityElementTraversal options:sorted:;
+ (id)_subviewsReplacedByModalViewSubviewsIfNecessary:()UIAccessibilityElementTraversal;
- (id)_accessibilitySubviewsForGettingElementsWithOptions:()UIAccessibilityElementTraversal;
- (id)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal;
- (uint64_t)_accessibilityIsSortingInUpperFrame;
- (uint64_t)_accessibilitySetIsSortingInUpperFrame:()UIAccessibilityElementTraversal;
- (uint64_t)_accessibilityShouldBeProcessed:()UIAccessibilityElementTraversal;
- (uint64_t)_accessibilityShouldUseSupplementaryViews;
@end

@implementation UIView(UIAccessibilityElementTraversal)

+ (id)_subviewsReplacedByModalViewSubviewsIfNecessary:()UIAccessibilityElementTraversal
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = [v3 reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (!v5)
  {
    v7 = 0;
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v6 = v5;
  v7 = 0;
  uint64_t v8 = *(void *)v30;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if ([v10 accessibilityViewIsModal]
        && [v10 _accessibilityViewIsVisible])
      {
        id v11 = v10;

        v7 = v11;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  }
  while (v6);

  if (v7)
  {
    v24 = v3;
    v12 = [v7 _accessibilityObscuredScreenAllowedViews];
    v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
    v14 = [v7 _accessibilityWindow];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v4 = v12;
    uint64_t v15 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v4);
          }
          v19 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          uint64_t v20 = [v19 _accessibilityWindow];
          v21 = (void *)v20;
          if (v19 != v14)
          {
            if (v14 == (void *)v20
              || (AXUIKeyboardWindow(), v22 = objc_claimAutoreleasedReturnValue(), v22, v21 != v22))
            {
              [v13 addObject:v19];
            }
          }
        }
        uint64_t v16 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v16);
    }

    id v3 = v13;
    goto LABEL_25;
  }
LABEL_26:

  return v3;
}

- (uint64_t)_accessibilityShouldUseSupplementaryViews
{
  if ([a1 _accessibilityHasOrderedChildren]) {
    return 1;
  }

  return [a1 isAccessibilityElement];
}

- (id)_accessibilitySubviewsForGettingElementsWithOptions:()UIAccessibilityElementTraversal
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 _accessibilitySubviews];
  uint64_t v6 = [v5 reverseObjectEnumerator];
  v7 = [v6 allObjects];

  uint64_t v8 = AXLogElementTraversal();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[UIView(UIAccessibilityElementTraversal) _accessibilitySubviewsForGettingElementsWithOptions:].cold.4();
  }

  if ([v4 shouldUseAllSubviews])
  {
    v9 = v7;
    goto LABEL_45;
  }
  v9 = [MEMORY[0x1E4F42FF0] _subviewsReplacedByModalViewSubviewsIfNecessary:v7];

  v10 = AXLogElementTraversal();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[UIView(UIAccessibilityElementTraversal) _accessibilitySubviewsForGettingElementsWithOptions:]();
  }

  if (([v4 shouldIncludeKeyboardObscuredElements] & 1) == 0)
  {
    id v54 = v4;
    id v11 = v9;
    id v12 = a1;
    int v13 = [(id)*MEMORY[0x1E4F43630] _accessibilitySoftwareKeyboardActive];
    id v14 = [MEMORY[0x1E4F42B08] activeKeyboard];
    v60 = AXUIAllKeyboardWindows();
    v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (!v16) {
      goto LABEL_39;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v66;
    id v56 = v12;
    v57 = v9;
    int v55 = v13;
    id v59 = v15;
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v66 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(id *)(*((void *)&v65 + 1) + 8 * v19);
        if (v20 != v12)
        {
          if (v20 == v14) {
            int v21 = 0;
          }
          else {
            int v21 = v13;
          }
          if (v21 != 1) {
            goto LABEL_34;
          }
          if ([*(id *)(*((void *)&v65 + 1) + 8 * v19) _accessibilityIsDescendantOfElement:v14]) {
            goto LABEL_34;
          }
          v22 = [v20 window];
          char v23 = [v60 containsObject:v22];

          id v15 = v59;
          if (v23) {
            goto LABEL_34;
          }
          [v20 accessibilityFrame];
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          CGFloat v29 = v28;
          CGFloat v31 = v30;
          AXDeviceGetMainScreenBounds();
          v76.origin.CGFloat x = v32;
          v76.origin.CGFloat y = v33;
          v76.size.CGFloat width = v34;
          v76.size.CGFloat height = v35;
          v73.origin.CGFloat x = v25;
          v73.origin.CGFloat y = v27;
          v73.size.CGFloat width = v29;
          v73.size.CGFloat height = v31;
          CGRect v74 = CGRectIntersection(v73, v76);
          CGFloat x = v74.origin.x;
          CGFloat y = v74.origin.y;
          CGFloat width = v74.size.width;
          CGFloat height = v74.size.height;
          if (CGRectIsEmpty(v74)) {
            goto LABEL_34;
          }
          [v14 accessibilityFrame];
          v77.origin.CGFloat x = x;
          v77.origin.CGFloat y = y;
          v77.size.CGFloat width = width;
          v77.size.CGFloat height = height;
          if (!CGRectContainsRect(v75, v77)) {
            goto LABEL_34;
          }
          v58 = [v20 window];
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v40 = v60;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v61 objects:v69 count:16];
          double v42 = 3.40282347e38;
          if (v41)
          {
            uint64_t v43 = v41;
            uint64_t v44 = *(void *)v62;
            double v42 = 3.40282347e38;
            do
            {
              for (uint64_t i = 0; i != v43; ++i)
              {
                if (*(void *)v62 != v44) {
                  objc_enumerationMutation(v40);
                }
                v46 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                [v46 level];
                if (v47 < v42)
                {
                  [v46 level];
                  double v42 = v48;
                }
              }
              uint64_t v43 = [v40 countByEnumeratingWithState:&v61 objects:v69 count:16];
            }
            while (v43);
          }

          if (([v40 containsObject:v58] & 1) == 0)
          {
            [v58 level];
            if (v49 > v42)
            {

              id v12 = v56;
              v9 = v57;
              int v13 = v55;
              id v15 = v59;
LABEL_34:
              [v9 addObject:v20];
              goto LABEL_35;
            }
          }

          id v12 = v56;
          v9 = v57;
          int v13 = v55;
          id v15 = v59;
        }
LABEL_35:
        ++v19;
      }
      while (v19 != v17);
      uint64_t v50 = [v15 countByEnumeratingWithState:&v65 objects:v70 count:16];
      uint64_t v17 = v50;
      if (!v50)
      {
LABEL_39:

        v51 = AXLogElementTraversal();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          -[UIView(UIAccessibilityElementTraversal) _accessibilitySubviewsForGettingElementsWithOptions:]();
        }

        id v4 = v54;
        break;
      }
    }
  }
  v52 = AXLogElementTraversal();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    -[UIView(UIAccessibilityElementTraversal) _accessibilitySubviewsForGettingElementsWithOptions:]();
  }

LABEL_45:

  return v9;
}

+ (id)_accessibilityElementsAndContainersDescendingFromViews:()UIAccessibilityElementTraversal options:sorted:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v14 = [v13 _accessibilityAdditionalElements];
        id v15 = objc_msgSend(v14, "ax_filteredArrayUsingBlock:", &__block_literal_global_527);
        [v8 axSafelyAddObjectsFromArray:v15];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v16 = [v13 _accessibilitySubviewsForGettingElementsWithOptions:v7];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v27 != v19) {
                objc_enumerationMutation(v16);
              }
              [*(id *)(*((void *)&v26 + 1) + 8 * j) _addAccessibilityElementsAndOrderedContainersWithOptions:v7 toCollection:v8];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v18);
        }

        int v21 = [v13 _accessibilityAdditionalElements];
        v22 = objc_msgSend(v21, "ax_filteredArrayUsingBlock:", &__block_literal_global_529);
        [v8 axSafelyAddObjectsFromArray:v22];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  if (a5) {
    [v8 sortUsingSelector:sel__accessibilityCompareGeometryForViewOrDictionary_];
  }

  return v8;
}

- (uint64_t)_accessibilityIsSortingInUpperFrame
{
  return MEMORY[0x1F4106398](a1, &__NSObject___accessibilityIsSortingInUpperFrame);
}

- (uint64_t)_accessibilitySetIsSortingInUpperFrame:()UIAccessibilityElementTraversal
{
  return MEMORY[0x1F41063D0](a1, &__NSObject___accessibilityIsSortingInUpperFrame);
}

- (id)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [a1 _accessibilityIsSortingInUpperFrame];
  if ((v5 & 1) == 0) {
    [a1 _accessibilitySetIsSortingInUpperFrame:1];
  }
  id v6 = objc_opt_class();
  v10[0] = a1;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v8 = objc_msgSend(v6, "_accessibilityElementsAndContainersDescendingFromViews:options:sorted:", v7, v4, objc_msgSend(v4, "sorted") & (v5 ^ 1));

  if ((v5 & 1) == 0) {
    [a1 _accessibilitySetIsSortingInUpperFrame:0];
  }

  return v8;
}

- (uint64_t)_accessibilityShouldBeProcessed:()UIAccessibilityElementTraversal
{
  id v4 = a3;
  if ([v4 includeWindowlessViews])
  {
    [a1 frame];
    if (v5 > 1.0)
    {
      [a1 frame];
      if (v6 > 1.0 && ([a1 isHidden] & 1) == 0)
      {
        [a1 alpha];
        if (v7 > 0.0) {
          goto LABEL_24;
        }
      }
    }
  }
  if (([a1 _accessibilityViewIsVisible] & 1) != 0
    || [v4 includeHiddenViews])
  {
    [a1 accessibilityFrame];
    BOOL v10 = v9 < 1.0 && v8 < 1.0;
    if (!v10 || [a1 _accessibilityOverridesInvalidFrames])
    {
      if ((UIAccessibilityIsWidgetExtension() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_24;
        }
        id v12 = [a1 _accessibilityAncestorIsKindOf:objc_opt_class()];
        if (v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {

          goto LABEL_24;
        }
        id v14 = [a1 _accessibilityAncestorIsKindOf:objc_opt_class()];

        if (v14) {
          goto LABEL_24;
        }
      }
      uint64_t v11 = [(id)*MEMORY[0x1E4F43630] _accessibilityContainerToStopVisibilityCheck];
      if (v11)
      {

LABEL_24:
        uint64_t v13 = 1;
        goto LABEL_25;
      }
      if (([a1 _accessibilityIsFrameOutOfBounds] & 1) == 0) {
        goto LABEL_24;
      }
    }
  }
  uint64_t v13 = 0;
LABEL_25:

  return v13;
}

- (void)_accessibilitySubviewsForGettingElementsWithOptions:()UIAccessibilityElementTraversal .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "After filtering obscured: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_accessibilitySubviewsForGettingElementsWithOptions:()UIAccessibilityElementTraversal .cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "After filtering elements behind KB: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_accessibilitySubviewsForGettingElementsWithOptions:()UIAccessibilityElementTraversal .cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "After replacing with modal views: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_accessibilitySubviewsForGettingElementsWithOptions:()UIAccessibilityElementTraversal .cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19F2DB000, v0, v1, "Self: %{public}@. Subviews: %{public}@");
}

@end