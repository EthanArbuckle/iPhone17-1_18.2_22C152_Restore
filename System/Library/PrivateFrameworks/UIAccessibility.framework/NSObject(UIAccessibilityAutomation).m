@interface NSObject(UIAccessibilityAutomation)
- (BOOL)_accessibilityUserTestingIsBackNavButton;
- (NSString)_accessibilityUserTestingElementType;
- (double)_accessibilityMaxValue;
- (double)_accessibilityMinValue;
- (id)_accessibilityAncestry;
- (id)_accessibilityBaseImplementationUserTestingChildren;
- (id)_accessibilityUserTestingChildrenWithRange:()UIAccessibilityAutomation;
- (id)_accessibilityUserTestingElementAttributes;
- (id)_accessibilityUserTestingElementBaseType;
- (id)_accessibilityUserTestingParent;
- (id)_accessibilityUserTestingSnapshot;
- (id)_accessibilityUserTestingSnapshotAncestorsWithAttributes:()UIAccessibilityAutomation maxDepth:maxChildren:maxArrayCount:honorsModalViews:;
- (id)_accessibilityUserTestingSnapshotDescendantsWithAttributes:()UIAccessibilityAutomation maxDepth:maxChildren:maxArrayCount:honorsModalViews:;
- (id)_accessibilityUserTestingSnapshotWithOptions:()UIAccessibilityAutomation;
- (id)_accessibilityUserTestingSupplementaryViews:()UIAccessibilityAutomation;
- (uint64_t)_accessibilityAbsoluteValue;
- (uint64_t)_accessibilityAutomationType;
- (uint64_t)_accessibilityFauxCollectionViewCellsDisabled;
- (uint64_t)_accessibilityFauxTableViewCellsDisabled;
- (uint64_t)_accessibilityKeyboardKeyEnteredString;
- (uint64_t)_accessibilityUserTestingChildrenCount;
- (uint64_t)_accessibilityUserTestingIsCancelButton;
- (uint64_t)_accessibilityUserTestingIsContinuityButton;
- (uint64_t)_accessibilityUserTestingIsDefaultButton;
- (uint64_t)_accessibilityUserTestingIsDestructiveButton;
- (uint64_t)_accessibilityUserTestingIsElementClassAcceptable;
- (uint64_t)_accessibilityUserTestingIsPreferredButton;
- (uint64_t)_accessibilityUserTestingIsRightNavButton;
- (uint64_t)_setAccessibilityFauxCollectionViewCellsDisabled:()UIAccessibilityAutomation;
- (uint64_t)_setAccessibilityFauxTableViewCellsDisabled:()UIAccessibilityAutomation;
- (uint64_t)automationCustomProperties;
- (uint64_t)automationSystemProperties;
- (uint64_t)setAutomationCustomProperties:()UIAccessibilityAutomation;
- (uint64_t)setAutomationSystemProperties:()UIAccessibilityAutomation;
- (void)_setAccessibilityAutomationType:()UIAccessibilityAutomation;
@end

@implementation NSObject(UIAccessibilityAutomation)

- (uint64_t)setAutomationCustomProperties:()UIAccessibilityAutomation
{
  return [a1 _accessibilitySetRetainedValue:a3 forKey:@"automationCustomProperties"];
}

- (uint64_t)automationCustomProperties
{
  return [a1 _accessibilityValueForKey:@"automationCustomProperties"];
}

- (uint64_t)setAutomationSystemProperties:()UIAccessibilityAutomation
{
  return [a1 _accessibilitySetRetainedValue:a3 forKey:@"automationSystemProperties"];
}

- (uint64_t)automationSystemProperties
{
  return [a1 _accessibilityValueForKey:@"automationSystemProperties"];
}

- (uint64_t)_accessibilityUserTestingIsDefaultButton
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingIsCancelButton
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingIsDestructiveButton
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingIsPreferredButton
{
  return 0;
}

- (BOOL)_accessibilityUserTestingIsBackNavButton
{
  uint64_t v1 = [a1 accessibilityTraits];
  return (UIAccessibilityTraitBackButton & ~v1) == 0;
}

- (uint64_t)_accessibilityUserTestingIsRightNavButton
{
  return 0;
}

- (uint64_t)_accessibilityKeyboardKeyEnteredString
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingIsContinuityButton
{
  return 0;
}

- (id)_accessibilityUserTestingElementAttributes
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  if ([a1 _accessibilityUserTestingIsContinuityButton]) {
    [v2 addObject:@"continuity-button"];
  }
  if ([a1 _accessibilityUserTestingIsDefaultButton]) {
    [v2 addObject:@"default-button"];
  }
  if ([a1 _accessibilityUserTestingIsCancelButton]) {
    [v2 addObject:@"cancel-button"];
  }
  if ([a1 _accessibilityUserTestingIsDestructiveButton]) {
    [v2 addObject:@"destructive-button"];
  }
  if ([a1 _accessibilityUserTestingIsPreferredButton]) {
    [v2 addObject:@"preferred-button"];
  }
  if ([a1 _accessibilityUserTestingIsBackNavButton])
  {
    v3 = @"back-nav-button";
  }
  else
  {
    if (![a1 _accessibilityUserTestingIsRightNavButton]) {
      goto LABEL_16;
    }
    v3 = @"right-nav-button";
  }
  [v2 addObject:v3];
LABEL_16:
  if ([a1 _accessibilityHasDragSources]) {
    [v2 addObject:@"drag-source"];
  }
  if ([a1 _accessibilityHasDragDestinations]) {
    [v2 addObject:@"drag-destination"];
  }

  return v2;
}

- (id)_accessibilityUserTestingElementBaseType
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:v1];
  if ((void *)v2 == v0)
  {
LABEL_5:
  }
  else
  {
    v3 = (void *)v2;
    while (1)
    {
      uint64_t v4 = objc_opt_class();

      if (v1 == (void *)v4) {
        break;
      }
      uint64_t v1 = (void *)[v1 superclass];
      v3 = [MEMORY[0x1E4F28B50] bundleForClass:v1];
      if (v3 == v0) {
        goto LABEL_5;
      }
    }
  }
  v5 = NSStringFromClass((Class)v1);

  return v5;
}

- (void)_setAccessibilityAutomationType:()UIAccessibilityAutomation
{
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"AXAutomationType"];
}

- (uint64_t)_accessibilityAutomationType
{
  id v2 = [a1 _accessibilityValueForKey:@"AXAutomationType"];
  uint64_t v3 = [v2 integerValue];

  if (!v3)
  {
    uint64_t v4 = [a1 accessibilityTraits];
    if ((*MEMORY[0x1E4F434F0] & ~v4) != 0)
    {
      if ((*MEMORY[0x1E4F43538] & ~v4) != 0)
      {
        if ((*MEMORY[0x1E4F43550] & ~v4) != 0)
        {
          if ((*MEMORY[0x1E4F43508] & ~v4) != 0)
          {
            if ((*MEMORY[0x1E4F43518] & ~v4) != 0)
            {
              if ((*MEMORY[0x1E4F43510] & ~v4) != 0) {
                return 0;
              }
              else {
                return 20;
              }
            }
            else
            {
              return 42;
            }
          }
          else
          {
            return 43;
          }
        }
        else
        {
          return 48;
        }
      }
      else
      {
        return 45;
      }
    }
    else if ((*MEMORY[0x1E4F43568] & ~v4) != 0)
    {
      return 9;
    }
    else
    {
      return 40;
    }
  }
  return v3;
}

- (uint64_t)_accessibilityAbsoluteValue
{
  return 0;
}

- (double)_accessibilityMinValue
{
  return 0.0;
}

- (double)_accessibilityMaxValue
{
  return 0.0;
}

- (NSString)_accessibilityUserTestingElementType
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

- (id)_accessibilityUserTestingParent
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([a1 onClientSide] & 1) == 0)
  {
    uint64_t v3 = (const __AXUIElement *)_AXCreateAXUIElementWithElement();
    CFTypeRef value = 0;
    objc_opt_class();
    uint64_t v4 = __UIAccessibilityCastAsClass();
    if ([v4 machPort])
    {
      [v4 machPort];
      _AXUIElementSetMachPortForNextMessage();
      AXUIElementCopyAttributeValue(v3, (CFStringRef)0x138A, &value);
      if (v3) {
        CFRelease(v3);
      }
    }
    else
    {
      if (v3) {
        CFRelease(v3);
      }
      CFTypeRef value = (CFTypeRef)MEMORY[0x19F3CA400]([a1 remotePid], objc_msgSend(a1, "uuidHash"), 9999);
    }
    id v2 = (void *)value;
  }
  else
  {
    id v2 = [a1 accessibilityContainer];
  }

  return v2;
}

- (id)_accessibilityAncestry
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = a1;
  if (v3)
  {
    while (1)
    {
      [v2 addObject:v3];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 onClientSide] & 1) == 0) {
        break;
      }
      uint64_t v4 = [v3 _accessibilityUserTestingParent];

      id v3 = (id)v4;
      if (!v4) {
        goto LABEL_5;
      }
    }
    if ([v3 machPort])
    {
      v8 = (const __AXUIElement *)_AXCreateAXUIElementWithElement();
      CFTypeRef value = 0;
      if (AXUIElementCopyAttributeValue(v8, (CFStringRef)0x13A1, &value) == kAXErrorSuccess)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = [(id)value reverseObjectEnumerator];
          v10 = [v9 allObjects];
          [v2 addObjectsFromArray:v10];
        }
      }
      if (value)
      {
        CFRelease(value);
        CFTypeRef value = 0;
      }
      if (v8) {
        CFRelease(v8);
      }
    }
  }
LABEL_5:
  v5 = [v2 reverseObjectEnumerator];
  v6 = [v5 allObjects];

  return v6;
}

- (id)_accessibilityUserTestingSupplementaryViews:()UIAccessibilityAutomation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA48] array];
  if (a3) {
    [a1 _accessibilitySupplementaryHeaderViews];
  }
  else {
    [a1 _accessibilitySupplementaryFooterViews];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 _accessibilityHasOrderedChildren])
        {
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __83__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSupplementaryViews___block_invoke;
          v13[3] = &unk_1E59B8F30;
          id v14 = v5;
          [v11 accessibilityEnumerateContainerElementsUsingBlock:v13];
        }
        else
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)_accessibilityUserTestingChildrenCount
{
  uint64_t v2 = [a1 _accessibilityBoolValueForKey:@"AXPerformingChildrenCount"];
  [a1 _accessibilitySetBoolValue:1 forKey:@"AXPerformingChildrenCount"];
  if ([a1 _accessibilityHasOrderedChildren])
  {
    id v3 = [a1 _accessibilityUserTestingSupplementaryViews:1];
    uint64_t v4 = [a1 _accessibilityUserTestingSupplementaryViews:0];
    uint64_t v5 = [v3 count];
    uint64_t v6 = [v4 count];
    uint64_t v7 = v6 + [a1 accessibilityElementCount] + v5;
  }
  else
  {
    id v3 = [a1 automationElements];
    uint64_t v7 = [v3 count];
  }

  [a1 _accessibilitySetBoolValue:v2 forKey:@"AXPerformingChildrenCount"];
  return v7;
}

- (id)_accessibilityUserTestingChildrenWithRange:()UIAccessibilityAutomation
{
  if ([a1 _accessibilityHasOrderedChildren])
  {
    uint64_t v7 = [a1 _accessibilityUserTestingSupplementaryViews:1];
    if ([a1 accessibilityShouldEnumerateContainerElementsArrayDirectly]
      && ([a1 _accessibilityElements], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v9 = v8;
      uint64_t v10 = [v8 count];
      int v11 = 0;
    }
    else
    {
      uint64_t v10 = [a1 accessibilityElementCount];
      uint64_t v9 = 0;
      int v11 = 1;
    }
    v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
    if (a3 < [v7 count])
    {
      uint64_t v13 = a4;
      if (a3 + a4 > [v7 count]) {
        uint64_t v13 = [v7 count] - a3;
      }
      if (v13 >= 1)
      {
        id v14 = objc_msgSend(v7, "subarrayWithRange:", a3, v13);
        [v12 addObjectsFromArray:v14];

        a3 = 0;
        a4 -= v13;
      }
    }
    if (a4)
    {
      if ((uint64_t)a3 >= v10 || a4 < 1) {
        goto LABEL_25;
      }
      int64_t v15 = a3;
      do
      {
        if (v11) {
          [a1 accessibilityElementAtIndex:v15];
        }
        else {
        long long v16 = [v9 objectAtIndex:v15];
        }
        if (v16)
        {
          [v12 addObject:v16];
          a3 = 0;
          --a4;
        }

        ++v15;
      }
      while (v15 < v10 && a4);
      if (a4)
      {
LABEL_25:
        long long v17 = [a1 _accessibilityUserTestingSupplementaryViews:0];
        if (a3 < [v17 count])
        {
          if (a3 + a4 > [v17 count]) {
            a4 = [v17 count] - a3;
          }
          if (a4 >= 1)
          {
            long long v18 = objc_msgSend(v17, "subarrayWithRange:", a3, a4);
            [v12 addObjectsFromArray:v18];
          }
        }
      }
    }
  }
  else
  {
    uint64_t v7 = [a1 automationElements];
    if (a3 + a4 <= [v7 count])
    {
      v12 = objc_msgSend(v7, "subarrayWithRange:", a3, a4);
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (uint64_t)_setAccessibilityFauxCollectionViewCellsDisabled:()UIAccessibilityAutomation
{
  return [(id)*MEMORY[0x1E4F43630] _accessibilitySetBoolValue:a3 forKey:@"DisableFauxCollectionViewCells"];
}

- (uint64_t)_accessibilityFauxCollectionViewCellsDisabled
{
  return [(id)*MEMORY[0x1E4F43630] _accessibilityBoolValueForKey:@"DisableFauxCollectionViewCells"];
}

- (uint64_t)_setAccessibilityFauxTableViewCellsDisabled:()UIAccessibilityAutomation
{
  return [(id)*MEMORY[0x1E4F43630] _accessibilitySetBoolValue:a3 forKey:@"DisableFauxTableViewCells"];
}

- (uint64_t)_accessibilityFauxTableViewCellsDisabled
{
  return [(id)*MEMORY[0x1E4F43630] _accessibilityBoolValueForKey:@"DisableFauxTableViewCells"];
}

- (id)_accessibilityBaseImplementationUserTestingChildren
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  id v3 = [a1 _accessibilityUserTestingSupplementaryViews:1];
  [v2 axSafelyAddObjectsFromArray:v3];

  if ([a1 isAccessibilityElement])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = objc_msgSend(a1, "subviews", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [v9 accessibilityIdentifier];

          if (v10) {
            [v2 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v6);
    }
  }
  else
  {
    if (![a1 _accessibilityHasOrderedChildren]) {
      goto LABEL_16;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__NSObject_UIAccessibilityAutomation___accessibilityBaseImplementationUserTestingChildren__block_invoke;
    v18[3] = &unk_1E59B8F30;
    id v19 = v2;
    [a1 accessibilityEnumerateContainerElementsUsingBlock:v18];
    uint64_t v4 = v19;
  }

LABEL_16:
  int v11 = [a1 _accessibilityUserTestingSupplementaryViews:0];
  [v2 axSafelyAddObjectsFromArray:v11];

  if (([a1 _accessibilityTextViewShouldBreakUpParagraphs] & 1) == 0)
  {
    v12 = [a1 _accessibilityInternalTextLinks];
    [v2 axSafelyAddObjectsFromArray:v12];
  }

  return v2;
}

- (uint64_t)_accessibilityUserTestingIsElementClassAcceptable
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(&cfstr_Webaccessibili.isa), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(&cfstr_Wkaccessibilit.isa), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(&cfstr_Sbicon.isa), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(&cfstr_Sbiconlistmode.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)_accessibilityUserTestingSnapshotDescendantsWithAttributes:()UIAccessibilityAutomation maxDepth:maxChildren:maxArrayCount:honorsModalViews:
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = (void *)_AXCreateAXUIElementWithElement();
  [v9 setObject:v10 forKeyedSubscript:@"UIAccessibilitySnapshotKeyElement"];

  int v11 = AXLogUIA();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(UIAccessibilityAutomation) _accessibilityUserTestingSnapshotDescendantsWithAttributes:maxDepth:maxChildren:maxArrayCount:honorsModalViews:]();
  }

  id v44 = v9;
  v75[0] = v9;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
  uint64_t v13 = (void *)[v12 mutableCopy];

  id v14 = 0;
  if ([v13 count])
  {
    unint64_t v53 = 1;
    id v45 = v8;
    int v46 = a7;
    do
    {
      id v15 = v13;

      v50 = [MEMORY[0x1E4F1CA48] array];

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v14 = v15;
      uint64_t v56 = [v14 countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v56)
      {
        uint64_t v55 = *(void *)v66;
        id obj = v14;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v66 != v55) {
              objc_enumerationMutation(obj);
            }
            long long v17 = *(void **)(*((void *)&v65 + 1) + 8 * v16);
            context = (void *)MEMORY[0x19F3CA890]();
            uint64_t v18 = [v17 objectForKeyedSubscript:@"UIAccessibilitySnapshotKeyElement"];
            id v19 = AXLogUIA();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138477827;
              uint64_t v71 = v18;
              _os_log_debug_impl(&dword_19F2DB000, v19, OS_LOG_TYPE_DEBUG, "Current snapshot element: %{private}@", buf, 0xCu);
            }

            uint64_t v20 = _UIAXElementForAXUIElementRef();
            uint64_t v21 = AXLogUIA();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v71 = (uint64_t)v20;
              _os_log_debug_impl(&dword_19F2DB000, v21, OS_LOG_TYPE_DEBUG, "Snapshot element going out:%p", buf, 0xCu);
            }

            v22 = AXLogUIA();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v71 = (uint64_t)v20;
              _os_log_debug_impl(&dword_19F2DB000, v22, OS_LOG_TYPE_DEBUG, "Current snapshot element: %{public}@", buf, 0xCu);
            }
            v58 = (void *)v18;

            id v64 = 0;
            v23 = _accessibilityAttributesForObject(v20, v8, a6, 1, &v64);
            id v24 = v64;
            [v17 setObject:v23 forKeyedSubscript:@"UIAccessibilitySnapshotKeyAttributes"];
            if (v24) {
              [v17 setObject:v24 forKeyedSubscript:@"UIAccessibilitySnapshotKeyAttributeArrayCounts"];
            }
            v25 = [v20 _iosAccessibilityAttributeValue:5030];
            unint64_t v26 = [v25 integerValue];

            v27 = AXLogUIA();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v71 = (uint64_t)v20;
              __int16 v72 = 1026;
              LODWORD(v73) = v26;
              _os_log_debug_impl(&dword_19F2DB000, v27, OS_LOG_TYPE_DEBUG, "Current %{public}@ snapshot child count: %{public}d", buf, 0x12u);
            }

            if (v26 <= a5)
            {
              v29 = [v20 _iosAccessibilityAttributeValue:5001];
              objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
            }
            else
            {
              v28 = [MEMORY[0x1E4F29238] valueWithRange:0];
              v29 = [v20 _iosAccessibilityAttributeValue:95003 forParameter:v28];

              [NSNumber numberWithInteger:v26];
            v30 = };
            [v17 setObject:v30 forKeyedSubscript:@"UIAccessibilitySnapshotKeyChildrenCount"];

            v31 = AXLogUIA();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v71 = (uint64_t)v20;
              __int16 v72 = 2114;
              v73 = v29;
              _os_log_debug_impl(&dword_19F2DB000, v31, OS_LOG_TYPE_DEBUG, "Current snapshot (%{public}@) children: %{public}@", buf, 0x16u);
            }

            if ([v29 count] && v53 < a4)
            {
              v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v29, "count"));
              if (a7)
              {
                v49 = [v29 indexesOfObjectsPassingTest:&__block_literal_global_371];
                v33 = objc_msgSend(v29, "objectsAtIndexes:");
                v34 = AXLogUIA();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v71 = (uint64_t)v33;
                  _os_log_impl(&dword_19F2DB000, v34, OS_LOG_TYPE_INFO, "Possible modal views: %@", buf, 0xCu);
                }

                v48 = v33;
                v35 = [v33 lastObject];
                v36 = v35;
                if (v35)
                {
                  v47 = v23;
                  v37 = [v35 _accessibilityObscuredScreenAllowedViews];
                  v38 = AXLogUIA();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v71 = (uint64_t)v36;
                    __int16 v72 = 2112;
                    v73 = v37;
                    _os_log_impl(&dword_19F2DB000, v38, OS_LOG_TYPE_INFO, "found a modal child and honor modal views: %@ [but allowing these through: %@]", buf, 0x16u);
                  }

                  v39 = (void *)MEMORY[0x1E4F1C978];
                  v69 = v36;
                  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
                  uint64_t v41 = objc_msgSend(v39, "axArrayWithPossiblyNilArrays:", 2, v40, v37);

                  v29 = (void *)v41;
                  id v8 = v45;
                  v23 = v47;
                }

                a7 = v46;
              }
              [v17 setObject:v32 forKeyedSubscript:@"UIAccessibilitySnapshotKeyChildren"];
              v60[0] = MEMORY[0x1E4F143A8];
              v60[1] = 3221225472;
              v60[2] = __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_375;
              v60[3] = &unk_1E59B9A70;
              unint64_t v63 = a5;
              id v61 = v32;
              id v62 = v50;
              id v42 = v32;
              [v29 enumerateObjectsUsingBlock:v60];
            }
            else
            {
              [v17 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:@"UIAccessibilitySnapshotKeyChildren"];
            }

            ++v16;
          }
          while (v56 != v16);
          id v14 = obj;
          uint64_t v56 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
        }
        while (v56);
      }

      ++v53;
      uint64_t v13 = v50;
    }
    while ([v50 count]);
  }

  return v44;
}

- (id)_accessibilityUserTestingSnapshotAncestorsWithAttributes:()UIAccessibilityAutomation maxDepth:maxChildren:maxArrayCount:honorsModalViews:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  int v11 = (void *)_AXCreateAXUIElementWithElement();
  [v10 setObject:v11 forKeyedSubscript:@"UIAccessibilitySnapshotKeyElement"];

  v12 = AXLogUIA();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(UIAccessibilityAutomation) _accessibilityUserTestingSnapshotDescendantsWithAttributes:maxDepth:maxChildren:maxArrayCount:honorsModalViews:]();
  }

  id v13 = a1;
  id v14 = v10;
  id v42 = v14;
  if (v14)
  {
    v47 = v13;
    id v15 = v14;
    id v43 = v9;
    int v46 = a7;
    do
    {
      context = (void *)MEMORY[0x19F3CA890]();
      id v57 = 0;
      uint64_t v16 = _accessibilityAttributesForObject(v13, v9, a6, 1, &v57);
      id v17 = v57;
      uint64_t v18 = [v15 setObject:v16 forKeyedSubscript:@"UIAccessibilitySnapshotKeyAttributes"];
      if (v17) {
        uint64_t v18 = [v15 setObject:v17 forKeyedSubscript:@"UIAccessibilitySnapshotKeyAttributeArrayCounts"];
      }
      if (a5)
      {
        id v19 = [v13 _iosAccessibilityAttributeValue:5030];
        [v15 setObject:v19 forKeyedSubscript:@"UIAccessibilitySnapshotKeyChildrenCount"];
        unint64_t v20 = [v19 integerValue];
        if (v20 >= a5) {
          unint64_t v21 = a5;
        }
        else {
          unint64_t v21 = v20;
        }
        v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, v21);
        v23 = [v13 _iosAccessibilityAttributeValue:95003 forParameter:v22];

        if ([v23 count])
        {
          id v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count"));
          v25 = AXLogUIA();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v60) = a7;
            _os_log_impl(&dword_19F2DB000, v25, OS_LOG_TYPE_INFO, "Modally? %d", buf, 8u);
          }

          if (a7)
          {
            unint64_t v26 = objc_msgSend(v23, "ax_filteredArrayUsingBlock:", &__block_literal_global_377);
            v27 = [v26 firstObject];

            if (v27)
            {
              id v44 = v24;
              v28 = [v27 _accessibilityObscuredScreenAllowedViews];
              v29 = AXLogUIA();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v60 = v27;
                __int16 v61 = 2112;
                id v62 = v28;
                _os_log_impl(&dword_19F2DB000, v29, OS_LOG_TYPE_INFO, "found a modal child and honor modal views: %@ [but allowing these through: %@]", buf, 0x16u);
              }

              v30 = (void *)MEMORY[0x1E4F1C978];
              v58 = v27;
              v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
              uint64_t v32 = objc_msgSend(v30, "axArrayWithPossiblyNilArrays:", 2, v31, v28);

              v23 = (void *)v32;
              id v9 = v43;
              id v24 = v44;
            }

            a7 = v46;
          }
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __148__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotAncestorsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_378;
          v51[3] = &unk_1E59B9A98;
          unint64_t v55 = a5;
          id v52 = v9;
          unint64_t v56 = a6;
          id v53 = v17;
          id v54 = v24;
          id v33 = v24;
          [v23 enumerateObjectsUsingBlock:v51];
          [v15 setObject:v33 forKeyedSubscript:@"UIAccessibilitySnapshotKeyChildren"];
        }
      }
      v34 = (void *)MEMORY[0x19F3CA890](v18);
      v35 = [v47 _iosAccessibilityAttributeValue:5002];
      if (v35)
      {
        v36 = [MEMORY[0x1E4F1CA60] dictionary];
        v37 = (void *)_AXCreateAXUIElementWithElement();
        [v36 setObject:v37 forKeyedSubscript:@"UIAccessibilitySnapshotKeyElement"];

        v38 = AXLogUIA();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v39 = objc_opt_class();
          id v45 = v39;
          v40 = [v36 objectForKeyedSubscript:@"UIAccessibilitySnapshotKeyElement"];
          *(_DWORD *)buf = 138478083;
          v60 = v39;
          a7 = v46;
          __int16 v61 = 2113;
          id v62 = v40;
          _os_log_debug_impl(&dword_19F2DB000, v38, OS_LOG_TYPE_DEBUG, "Setting parent snapshot element: %{private}@, %{private}@", buf, 0x16u);

          id v9 = v43;
        }

        [v15 setObject:v36 forKeyedSubscript:@"UIAccessibilitySnapshotKeyParent"];
      }
      else
      {
        v36 = 0;
      }

      id v13 = v35;
      id v15 = v36;
    }
    while (v36);
  }
  else
  {
    v35 = v13;
  }

  return v42;
}

- (id)_accessibilityUserTestingSnapshotWithOptions:()UIAccessibilityAutomation
{
  id v4 = a3;
  uint64_t v5 = AXLogUIA();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UIAccessibilityAutomation-UserTestingSnapshot", (const char *)&unk_19F34FEBA, buf, 2u);
  }

  uint64_t v6 = [v4 objectForKeyedSubscript:@"attributes"];
  uint64_t v7 = (void *)[v6 mutableCopy];

  id v8 = [v4 objectForKeyedSubscript:@"maxDepth"];
  id v9 = [v4 objectForKeyedSubscript:@"maxChildren"];
  uint64_t v10 = [v4 objectForKeyedSubscript:@"maxArrayCount"];
  int v11 = [v4 objectForKeyedSubscript:@"traverseFromParentsToChildren"];
  v12 = [v4 objectForKeyedSubscript:@"snapshotKeyHonorModalViews"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_403];
    [v7 filterUsingPredicate:v13];
    if ([v7 count])
    {
      uint64_t v25 = [v8 unsignedIntegerValue];
      uint64_t v24 = [v9 unsignedIntegerValue];
      uint64_t v23 = [v10 unsignedIntegerValue];
      int v14 = [v11 BOOLValue];
      if (v12 || AXRequestingClient() != 2) {
        uint64_t v15 = [v12 BOOLValue];
      }
      else {
        uint64_t v15 = 1;
      }
      if (v14) {
        [a1 _accessibilityUserTestingSnapshotDescendantsWithAttributes:v7 maxDepth:v25 maxChildren:v24 maxArrayCount:v23 honorsModalViews:v15];
      }
      else {
      uint64_t v16 = [a1 _accessibilityUserTestingSnapshotAncestorsWithAttributes:v7 maxDepth:v25 maxChildren:v24 maxArrayCount:v23 honorsModalViews:v15];
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = v16;
  id v18 = v4;
  if (_accessibilityPluginPostProcessAutomationData_onceToken != -1) {
    dispatch_once(&_accessibilityPluginPostProcessAutomationData_onceToken, &__block_literal_global_465);
  }
  if (_accessibilityPluginPostProcessAutomationData_Loaded)
  {
    id v19 = [(id)_accessibilityPluginPostProcessAutomationData_Processor performSelector:sel_processSnapshot_options_ withObject:v17 withObject:v18];
  }
  else
  {
    id v19 = v17;
  }
  unint64_t v20 = v19;

  unint64_t v21 = AXLogUIA();
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)unint64_t v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_19F2DB000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UIAccessibilityAutomation-UserTestingSnapshot", (const char *)&unk_19F34FEBA, v26, 2u);
  }

  return v20;
}

- (id)_accessibilityUserTestingSnapshot
{
  v8[5] = *MEMORY[0x1E4F143B8];
  if (_defaultSnapshotAttributes_onceToken != -1) {
    dispatch_once(&_defaultSnapshotAttributes_onceToken, &__block_literal_global_471);
  }
  id v2 = (id)_defaultSnapshotAttributes_defaultAttributes;
  if (_AXSVoiceOverTouchEnabled() || UIAccessibilityIsSwitchControlRunning())
  {
    uint64_t v3 = [v2 arrayByAddingObject:&unk_1EF1719E0];

    id v2 = (id)v3;
  }
  v7[0] = @"attributes";
  v7[1] = @"maxDepth";
  v8[0] = v2;
  v8[1] = &unk_1EF1719F8;
  v7[2] = @"maxChildren";
  v7[3] = @"maxArrayCount";
  v8[2] = &unk_1EF1719F8;
  v8[3] = &unk_1EF1719F8;
  v7[4] = @"traverseFromParentsToChildren";
  v8[4] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  uint64_t v5 = [a1 _accessibilityUserTestingSnapshotWithOptions:v4];

  return v5;
}

- (void)_accessibilityUserTestingSnapshotDescendantsWithAttributes:()UIAccessibilityAutomation maxDepth:maxChildren:maxArrayCount:honorsModalViews:.cold.1()
{
  OUTLINED_FUNCTION_7();
  id v1 = (id)objc_opt_class();
  id v2 = [v0 objectForKeyedSubscript:@"UIAccessibilitySnapshotKeyElement"];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_8(&dword_19F2DB000, v3, v4, "Setting root snapshot element: %{private}@, %{private}@", v5, v6, v7, v8, v9);
}

@end