@interface NSObject(UIAccessibilityOpaqueElementProvider)
+ (void)_accessibilityUpdateOpaqueFocusStateForTechnology:()UIAccessibilityOpaqueElementProvider oldElement:newElement:;
- (id)_accessibilityCurrentlyFocusedElementForTechnology:()UIAccessibilityOpaqueElementProvider;
- (id)_accessibilityFocusStatePerTechnology;
- (uint64_t)_accessibilityReusableViewForOpaqueElement:()UIAccessibilityOpaqueElementProvider;
- (void)_accessibilityDidFocusOnOpaqueElement:()UIAccessibilityOpaqueElementProvider technology:;
- (void)_accessibilityDidReuseOpaqueElementView:()UIAccessibilityOpaqueElementProvider;
- (void)_accessibilityUpdateFocusState:()UIAccessibilityOpaqueElementProvider forFocusedElement:;
@end

@implementation NSObject(UIAccessibilityOpaqueElementProvider)

- (id)_accessibilityFocusStatePerTechnology
{
  v2 = objc_getAssociatedObject(a1, &_opaqueFocusState);
  if (!v2)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_setAssociatedObject(a1, &_opaqueFocusState, v2, (void *)1);
  }

  return v2;
}

- (void)_accessibilityDidFocusOnOpaqueElement:()UIAccessibilityOpaqueElementProvider technology:
{
  id v10 = a3;
  id v6 = a4;
  if (([a1 isAccessibilityOpaqueElementProvider] & 1) == 0)
  {
    v9 = a1;
    _AXAssert();
  }
  v7 = objc_msgSend(a1, "_accessibilityFocusStatePerTechnology", v9);
  v8 = [v7 objectForKeyedSubscript:v6];
  if (!v8)
  {
    v8 = objc_alloc_init(UIAccessibilityOpaqueFocusState);
    [v7 setObject:v8 forKeyedSubscript:v6];
  }
  [a1 _accessibilityUpdateFocusState:v8 forFocusedElement:v10];
}

+ (void)_accessibilityUpdateOpaqueFocusStateForTechnology:()UIAccessibilityOpaqueElementProvider oldElement:newElement:
{
  id v11 = a3;
  id v7 = a5;
  id v8 = a4;
  v9 = [v7 _accessibilityOpaqueElementParent];
  id v10 = [v8 _accessibilityOpaqueElementParent];

  if (v9 != v10) {
    [v10 _accessibilityDidFocusOnOpaqueElement:0 technology:v11];
  }
  [v9 _accessibilityDidFocusOnOpaqueElement:v7 technology:v11];
}

- (void)_accessibilityUpdateFocusState:()UIAccessibilityOpaqueElementProvider forFocusedElement:
{
  id v6 = a3;
  id v7 = a4;
  [v6 setElement:v7];
  [v7 accessibilityFrame];
  objc_msgSend(v6, "setSceneRelativeFrame:");
  if (v7)
  {
    id v8 = [a1 _accessibilityReusableViewForOpaqueElement:v7];
    [v6 setReusableView:v8];
  }
  [v6 setHasBeenReused:0];
  v9 = AXLogOpaqueElements();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(UIAccessibilityOpaqueElementProvider) _accessibilityUpdateFocusState:forFocusedElement:]((uint64_t)a1, (uint64_t)v6, v9);
  }
}

- (id)_accessibilityCurrentlyFocusedElementForTechnology:()UIAccessibilityOpaqueElementProvider
{
  id v4 = a3;
  v5 = [a1 _accessibilityFocusStatePerTechnology];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 element];
  if (![v6 hasFocus]) {
    goto LABEL_9;
  }
  if (!v7)
  {
    v25 = AXLogOpaqueElements();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[NSObject(UIAccessibilityOpaqueElementProvider) _accessibilityCurrentlyFocusedElementForTechnology:](v25);
    }
    goto LABEL_16;
  }
  id v8 = [v7 _accessibilityParentView];
  if ([v8 _accessibilityViewIsVisible]
    && ([v7 _accessibilityWindow], (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    uint64_t v10 = [v7 accessibilityTraits];
    uint64_t v11 = UIAccessibilityTraitSpacer & v10;

    if (!v11)
    {
      v25 = AXLogOpaqueElements();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[NSObject(UIAccessibilityOpaqueElementProvider) _accessibilityCurrentlyFocusedElementForTechnology:](v7);
      }
      goto LABEL_16;
    }
  }
  if (![v6 hasBeenReused]) {
    goto LABEL_9;
  }
  [v7 accessibilityFrame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  [v6 sceneRelativeFrame];
  v34.origin.x = v20;
  v34.origin.y = v21;
  v34.size.width = v22;
  v34.size.height = v23;
  v31.origin.x = v13;
  v31.origin.y = v15;
  v31.size.width = v17;
  v31.size.height = v19;
  if (CGRectEqualToRect(v31, v34))
  {
LABEL_9:
    v24 = v7;
    goto LABEL_21;
  }
  v25 = AXLogOpaqueElements();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    [(NSObject(UIAccessibilityOpaqueElementProvider) *)v6 _accessibilityCurrentlyFocusedElementForTechnology:v25];
  }
LABEL_16:

  [v6 sceneRelativeFrame];
  double MidX = CGRectGetMidX(v32);
  [v6 sceneRelativeFrame];
  double MidY = CGRectGetMidY(v33);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _AXAssert();
  }
  v24 = objc_msgSend(a1, "_accessibilityHitTest:withEvent:", 0, UIAccessibilityPointToPoint(a1, MidX, MidY));

  v28 = AXLogOpaqueElements();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(UIAccessibilityOpaqueElementProvider) _accessibilityCurrentlyFocusedElementForTechnology:](v6);
  }

LABEL_21:

  return v24;
}

- (uint64_t)_accessibilityReusableViewForOpaqueElement:()UIAccessibilityOpaqueElementProvider
{
  return 0;
}

- (void)_accessibilityDidReuseOpaqueElementView:()UIAccessibilityOpaqueElementProvider
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a1, "_accessibilityFocusStatePerTechnology", 0);
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v12 = [v11 reusableView];

        if (v12 == v4) {
          [v11 setHasBeenReused:1];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)_accessibilityUpdateFocusState:()UIAccessibilityOpaqueElementProvider forFocusedElement:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_19F2DB000, log, OS_LOG_TYPE_DEBUG, "Opaque element provider: %{public}@. Focus state: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_accessibilityCurrentlyFocusedElementForTechnology:()UIAccessibilityOpaqueElementProvider .cold.1(void *a1)
{
  [a1 sceneRelativeFrame];
  v1 = NSStringFromCGRect(v8);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8(&dword_19F2DB000, v2, v3, "Hit tested result from frame %{public}@ was %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_accessibilityCurrentlyFocusedElementForTechnology:()UIAccessibilityOpaqueElementProvider .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19F2DB000, log, OS_LOG_TYPE_DEBUG, "Had focus, but element had disappeared.", v1, 2u);
}

- (void)_accessibilityCurrentlyFocusedElementForTechnology:()UIAccessibilityOpaqueElementProvider .cold.3(void *a1)
{
  v1 = [a1 _accessibilityParentView];
  [v1 _accessibilityViewIsVisible];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8(&dword_19F2DB000, v2, v3, "Parent view was %@. Time to hit test for a replacement element. Old element: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_accessibilityCurrentlyFocusedElementForTechnology:()UIAccessibilityOpaqueElementProvider .cold.4(void *a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a1 sceneRelativeFrame];
  uint64_t v5 = NSStringFromCGRect(v14);
  [a2 accessibilityFrame];
  uint64_t v6 = NSStringFromCGRect(v15);
  int v9 = 138543874;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_0_1();
  __int16 v11 = v7;
  uint64_t v12 = v8;
  _os_log_debug_impl(&dword_19F2DB000, a3, OS_LOG_TYPE_DEBUG, "Mismatched rects for saved frame %{public}@, element %{public}@ with frame %{public}@.", (uint8_t *)&v9, 0x20u);
}

@end