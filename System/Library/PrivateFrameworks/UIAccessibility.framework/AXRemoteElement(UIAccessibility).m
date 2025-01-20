@interface AXRemoteElement(UIAccessibility)
- (id)_handleElementTraversalRequestMovingForward:()UIAccessibility count:shouldIncludeSelf:wantsContainers:;
- (id)_iosAccessibilityAttributeValue:()UIAccessibility;
- (id)_iosAccessibilityAttributeValue:()UIAccessibility forParameter:;
- (uint64_t)_accessibilityIsRemoteElement;
- (uint64_t)_ancestorElementThatSupportsActivationAction;
- (uint64_t)accessibilityActivate;
- (uint64_t)accessibilityViewIsModal;
@end

@implementation AXRemoteElement(UIAccessibility)

- (uint64_t)accessibilityViewIsModal
{
  return 1;
}

- (uint64_t)_accessibilityIsRemoteElement
{
  return 1;
}

- (id)_handleElementTraversalRequestMovingForward:()UIAccessibility count:shouldIncludeSelf:wantsContainers:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v11 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
  if (AXRequestingClient() == 11)
  {
    uint64_t v12 = +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions];

    v11 = (void *)v12;
  }
  if (a3) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  [v11 setDirection:v13];
  if (a6)
  {
    [v11 setLeafNodePredicate:&__block_literal_global_9];
    [v11 setIncludeAncestorsOfSelfInSiblingMatch:1];
  }
  v14 = [a1 _accessibilityLeafDescendantsWithCount:a4 shouldStopAtRemoteElement:1 options:v11];
  if ([v14 count] < a4)
  {
    v15 = [v14 lastObject];
    char v16 = [v15 _accessibilityIsRemoteElement];

    if ((v16 & 1) == 0)
    {
      if (!v14) {
        _AXAssert();
      }
      uint64_t v17 = [v14 arrayByAddingObject:a1];

      v14 = (void *)v17;
    }
  }
  if ((a5 & 1) == 0)
  {
    v18 = [v14 lastObject];
    int v19 = [v18 isEqual:a1];

    if (v19)
    {
      v20 = (void *)[v14 mutableCopy];
      [v20 removeLastObject];

      v14 = v20;
    }
  }
  v21 = AXLogElementTraversal();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v23 = @"previous";
    int v24 = 138544131;
    if (a3) {
      v23 = @"next";
    }
    v25 = v23;
    __int16 v26 = 2114;
    v27 = a1;
    __int16 v28 = 2048;
    unint64_t v29 = a4;
    __int16 v30 = 2113;
    v31 = v14;
    _os_log_debug_impl(&dword_19F2DB000, v21, OS_LOG_TYPE_DEBUG, "*** Returning remote %{public}@ elements for %{public}@ with count %lu: %{private}@", (uint8_t *)&v24, 0x2Au);
  }

  return v14;
}

- (id)_iosAccessibilityAttributeValue:()UIAccessibility forParameter:
{
  id v6 = a4;
  if ((unint64_t)(a3 - 92501) >= 2 && a3 != 95252)
  {
    objc_msgSendSuper2(&v13, sel__iosAccessibilityAttributeValue_forParameter_, a3, v6, a1, &off_1EF1A8460, v14.receiver, v14.super_class);
    uint64_t v10 = LABEL_13:;
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 unsignedIntValue];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v6 objectForKey:*MEMORY[0x1E4F48890]];
      uint64_t v8 = [v9 unsignedIntegerValue];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  if ([a1 onClientSide])
  {
    objc_msgSendSuper2(&v14, sel__iosAccessibilityAttributeValue_forParameter_, a3, v6, v13.receiver, v13.super_class, a1, &off_1EF1A8460);
    goto LABEL_13;
  }
  uint64_t v10 = [a1 _handleElementTraversalRequestMovingForward:a3 != 92502 count:v8 shouldIncludeSelf:a3 != 95252 wantsContainers:0];
LABEL_15:
  v11 = (void *)v10;

  return v11;
}

- (id)_iosAccessibilityAttributeValue:()UIAccessibility
{
  if (a3 > 2999)
  {
    switch(a3)
    {
      case 3022:
        uint64_t v5 = [(id)*MEMORY[0x1E4F43630] _accessibilityExplorerElements];
        goto LABEL_26;
      case 3023:
      case 3024:
      case 3026:
      case 3027:
      case 3028:
      case 3030:
        goto LABEL_18;
      case 3025:
        uint64_t v5 = [(id)*MEMORY[0x1E4F43630] _accessibilityElementsWithSemanticContext:0];
        goto LABEL_26;
      case 3029:
        uint64_t v5 = [(id)*MEMORY[0x1E4F43630] _accessibilityNativeFocusableElements:0];
        goto LABEL_26;
      case 3031:
        uint64_t v5 = [(id)*MEMORY[0x1E4F43630] _accessibilitySiriContentNativeFocusableElements];
        goto LABEL_26;
      case 3032:
        uint64_t v5 = [(id)*MEMORY[0x1E4F43630] _accessibilitySiriContentElementsWithSemanticContext];
        goto LABEL_26;
      default:
        if (a3 != 3000) {
          goto LABEL_18;
        }
        if ([a1 onClientSide])
        {
          objc_msgSendSuper2(&v18, sel__iosAccessibilityAttributeValue_, 3000, v12, v13, v14, v15, v16.receiver, v16.super_class, v17.receiver, v17.super_class, a1, &off_1EF1A8460);
          goto LABEL_25;
        }
        v9 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
        v11 = [a1 _accessibilityLeafDescendantsWithCount:1 options:v9];
        uint64_t v8 = [v11 firstObject];

        break;
    }
  }
  else
  {
    if ((unint64_t)(a3 - 2014) >= 2)
    {
      if (a3 == 2019)
      {
        if ([a1 onClientSide])
        {
          v7 = [a1 _ancestorElementThatSupportsActivationAction];

          if (v7)
          {
            uint64_t v8 = (void *)MEMORY[0x1E4F1CC38];
            goto LABEL_27;
          }
        }
        objc_msgSendSuper2(&v17, sel__iosAccessibilityAttributeValue_, 2019, v12, v13, v14, v15, v16.receiver, v16.super_class, a1, &off_1EF1A8460, v18.receiver, v18.super_class);
        goto LABEL_25;
      }
      if (a3 == 2196)
      {
        if (([a1 onClientSide] & 1) == 0)
        {
          uint64_t v5 = [a1 _handleElementTraversalRequestMovingForward:1 count:5 shouldIncludeSelf:1 wantsContainers:0];
          goto LABEL_26;
        }
        objc_msgSendSuper2(&v16, sel__iosAccessibilityAttributeValue_, 2196, v12, v13, v14, v15, a1, &off_1EF1A8460, v17.receiver, v17.super_class, v18.receiver, v18.super_class);
        uint64_t v5 = LABEL_25:;
LABEL_26:
        uint64_t v8 = (void *)v5;
        goto LABEL_27;
      }
LABEL_18:
      uint64_t v12 = a1;
      objc_super v13 = &off_1EF1A8460;
      id v6 = (objc_super *)&v12;
LABEL_19:
      -[objc_super _iosAccessibilityAttributeValue:](v6, sel__iosAccessibilityAttributeValue_, a3, v12, v13, v14, v15, v16.receiver, v16.super_class, v17.receiver, v17.super_class, v18.receiver, v18.super_class);
      goto LABEL_25;
    }
    if ([a1 onClientSide])
    {
      objc_super v14 = a1;
      v15 = &off_1EF1A8460;
      id v6 = (objc_super *)&v14;
      goto LABEL_19;
    }
    v9 = [a1 _handleElementTraversalRequestMovingForward:a3 != 2015 count:1 shouldIncludeSelf:1 wantsContainers:1];
    uint64_t v8 = [v9 firstObject];
  }

LABEL_27:

  return v8;
}

- (uint64_t)accessibilityActivate
{
  v1 = [a1 _ancestorElementThatSupportsActivationAction];
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 accessibilityActivate];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)_ancestorElementThatSupportsActivationAction
{
  return [a1 _accessibilityFindAncestor:&__block_literal_global_281 startWithSelf:0];
}

@end