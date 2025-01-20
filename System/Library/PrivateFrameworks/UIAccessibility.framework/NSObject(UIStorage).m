@interface NSObject(UIStorage)
- (BOOL)_accessibilityActivateDragWithDescriptorDictionary:()UIStorage forServiceName:;
- (BOOL)_accessibilityCanBecomeNativeFocused;
- (BOOL)_accessibilityHasActionBlockForKey:()UIStorage;
- (BOOL)_accessibilityHasNativeFocusableElements;
- (BOOL)_accessibilityIsContainedByPreferredNativeFocusElement;
- (BOOL)_accessibilityIsContainedByVideoElement;
- (BOOL)_accessibilityIsFocusParcel;
- (BOOL)_accessibilitySpeakThisCanBeHighlighted;
- (BOOL)_accessibilityUIKitHasNativeFocus;
- (BOOL)_drawsFocusRingWhenChildrenFocused;
- (BOOL)_isAccessibilityExplorerElement;
- (double)_accessibilityScreenPointForSceneReferencePoint:()UIStorage;
- (double)_accessibilityScreenRectForSceneReferenceRect:()UIStorage;
- (double)_axScaleTransformForFocusLayerLineWidth;
- (id)_accessibilityAncestorFocusParcel;
- (id)_accessibilityExtendedLabelForFocusParcelWithLabel:()UIStorage;
- (id)_accessibilityFocusContainer;
- (id)_accessibilityNativeFocusAncestor;
- (id)_accessibilityProxyViewAncestorWhenMissingWindow;
- (id)_accessibilitySpeakThisElementWithIdentifier:()UIStorage;
- (id)_accessibilitySpeakThisElementsAndStrings;
- (id)_accessibilityTextForSubhierarchyIncludingHeaders:()UIStorage focusableItems:exclusions:classExclusions:;
- (id)_accessibilityTextRectsForSpeakThisStringRange:()UIStorage;
- (id)dragDescriptorMatchingDictionary:()UIStorage;
- (uint64_t)_accessibilityAllowsActivationWithoutBeingNativeFocused;
- (uint64_t)_accessibilityApplicationHandleButtonAction:()UIStorage;
- (uint64_t)_accessibilityClearLastFocusedChild;
- (uint64_t)_accessibilityDrawsFocusRingWhenChildrenFocused;
- (uint64_t)_accessibilityElementsWithSemanticContext:()UIStorage;
- (uint64_t)_accessibilityExplorerElementReadPriority;
- (uint64_t)_accessibilityExplorerElements;
- (uint64_t)_accessibilityFocusContainerMoveFocusWithHeading:()UIStorage byGroup:;
- (uint64_t)_accessibilityFocusContainerMoveFocusWithHeading:()UIStorage toElementMatchingQuery:;
- (uint64_t)_accessibilityFocusParcelChildrenCount:()UIStorage;
- (uint64_t)_accessibilityFocusRingStyle;
- (uint64_t)_accessibilityFrameDelegate;
- (uint64_t)_accessibilityFullscreenVideoViewIsVisible;
- (uint64_t)_accessibilityGetBlockForAttribute:()UIStorage;
- (uint64_t)_accessibilityHandleMagicTap;
- (uint64_t)_accessibilityHandleMagicTapForPronunciation;
- (uint64_t)_accessibilityHandlesRemoteFocusMovement;
- (uint64_t)_accessibilityHasNativeFocus;
- (uint64_t)_accessibilityHostPid;
- (uint64_t)_accessibilityIgnoreDelegate;
- (uint64_t)_accessibilityInternalHandleStartStopToggle;
- (uint64_t)_accessibilityIsFocusContainer;
- (uint64_t)_accessibilityMimicsTextInputResponder;
- (uint64_t)_accessibilityMoveFocusWithHeading:()UIStorage;
- (uint64_t)_accessibilityMoveFocusWithHeading:()UIStorage byGroup:;
- (uint64_t)_accessibilityMoveFocusWithHeading:()UIStorage toElementMatchingQuery:;
- (uint64_t)_accessibilityNativeFocusPreferredElement;
- (uint64_t)_accessibilityNativeFocusPreferredElementIsValid;
- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage;
- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage matchingBlock:;
- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage matchingBlock:forExistenceCheckOnly:;
- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage withQueryString:;
- (uint64_t)_accessibilityProxyView;
- (uint64_t)_accessibilityRemembersLastFocusedChild;
- (uint64_t)_accessibilityRemoteElementForSceneID:()UIStorage;
- (uint64_t)_accessibilityRemotePid;
- (uint64_t)_accessibilityRemoteSceneID;
- (uint64_t)_accessibilityRemoveActionBlockForKey:()UIStorage;
- (uint64_t)_accessibilityRemoveAllActionBlocks;
- (uint64_t)_accessibilitySentenceRectsForRange:()UIStorage;
- (uint64_t)_accessibilitySetIgnoreDelegate:()UIStorage;
- (uint64_t)_accessibilitySetNativeFocus;
- (uint64_t)_accessibilityShouldBeExplorerElementWithoutSystemFocus;
- (uint64_t)_accessibilityShouldIgnoreSoundForFailedMoveAttempt;
- (uint64_t)_accessibilityShouldSetNativeFocusWhenATVFocused;
- (uint64_t)_accessibilityShouldSpeakExplorerElementsAfterFocus;
- (uint64_t)_accessibilitySiriContentElementsWithSemanticContext;
- (uint64_t)_accessibilitySiriContentNativeFocusableElements;
- (uint64_t)_accessibilitySortExplorerElements:()UIStorage;
- (uint64_t)_accessibilitySpeakThisMaximumNumberOfElements;
- (uint64_t)_accessibilitySpeakThisPreferredHighlightColor;
- (uint64_t)_accessibilitySpeakThisPreferredUnderlineColor;
- (uint64_t)_accessibilitySpeakThisRootElement;
- (uint64_t)_accessibilitySpeakThisShouldOnlyIncludeVisibleElements;
- (uint64_t)_accessibilitySpeakThisShouldScrollTextRects;
- (uint64_t)_accessibilitySpeakThisViewController;
- (uint64_t)_accessibilitySpeakThisViews;
- (uint64_t)_accessibilitySpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession;
- (uint64_t)_accessibilitySpeakThisViewsFromSceneWithSceneIdentifier:()UIStorage;
- (uint64_t)_accessibilitySubviews;
- (uint64_t)_accessibilitySupplementaryHeaderViewAtIndexPath:()UIStorage;
- (uint64_t)_accessibilityTextForSubhierarchyIncludingHeaders:()UIStorage focusableItems:exclusions:;
- (uint64_t)_accessibilityTextRectsForRange:()UIStorage singleTextRect:;
- (uint64_t)_accessibilityUnfocusableViewCanBeFocusedForFocusEverywhere;
- (uint64_t)_accessibilityViewHierarchyHasNativeFocus;
- (uint64_t)_axGetLastFocusedChild;
- (uint64_t)_axSetLastFocusedChild:()UIStorage;
- (uint64_t)_iosAccessibilityPerformAction:()UIStorage withValue:fencePort:;
- (uint64_t)_setAccessibilityActivateBlock:()UIStorage;
- (uint64_t)_setAccessibilityActivateParagraphInTextViewRangeBlock:()UIStorage;
- (uint64_t)_setAccessibilityActivationPointBlock:()UIStorage;
- (uint64_t)_setAccessibilityAdditionalTraitsBlock:()UIStorage;
- (uint64_t)_setAccessibilityAttributedHintBlock:()UIStorage;
- (uint64_t)_setAccessibilityAttributedUserInputLabelsBlock:()UIStorage;
- (uint64_t)_setAccessibilityAttributedValueBlock:()UIStorage;
- (uint64_t)_setAccessibilityChartDescriptorBlock:()UIStorage;
- (uint64_t)_setAccessibilityColumnCountBlock:()UIStorage;
- (uint64_t)_setAccessibilityColumnRangeBlock:()UIStorage;
- (uint64_t)_setAccessibilityContainerTypeBlock:()UIStorage;
- (uint64_t)_setAccessibilityCustomActionsBlock:()UIStorage;
- (uint64_t)_setAccessibilityCustomContentBlock:()UIStorage;
- (uint64_t)_setAccessibilityDataTableCellElementForRowColumnBlock:()UIStorage;
- (uint64_t)_setAccessibilityDecrementBlock:()UIStorage;
- (uint64_t)_setAccessibilityElementsBlock:()UIStorage;
- (uint64_t)_setAccessibilityElementsHiddenBlock:()UIStorage;
- (uint64_t)_setAccessibilityFrameBlock:()UIStorage;
- (uint64_t)_setAccessibilityFrameForSortingBlock:()UIStorage;
- (uint64_t)_setAccessibilityGuideElementHeaderTextBlock:()UIStorage;
- (uint64_t)_setAccessibilityHeaderElementsBlock:()UIStorage;
- (uint64_t)_setAccessibilityHeaderElementsForColumnBlock:()UIStorage;
- (uint64_t)_setAccessibilityHeaderElementsForRowBlock:()UIStorage;
- (uint64_t)_setAccessibilityHeadingLevelBlock:()UIStorage;
- (uint64_t)_setAccessibilityHintBlock:()UIStorage;
- (uint64_t)_setAccessibilityIdentifierBlock:()UIStorage;
- (uint64_t)_setAccessibilityIncrementBlock:()UIStorage;
- (uint64_t)_setAccessibilityIsRealtimeElementBlock:()UIStorage;
- (uint64_t)_setAccessibilityLabelBlock:()UIStorage;
- (uint64_t)_setAccessibilityLanguageBlock:()UIStorage;
- (uint64_t)_setAccessibilityLinkedUIElementsBlock:()UIStorage;
- (uint64_t)_setAccessibilityMagicTapBlock:()UIStorage;
- (uint64_t)_setAccessibilityNavigationStyleBlock:()UIStorage;
- (uint64_t)_setAccessibilityPathBlock:()UIStorage;
- (uint64_t)_setAccessibilityPerformEscapeBlock:()UIStorage;
- (uint64_t)_setAccessibilityRemoteElementShouldHitTestHostProcessBlock:()UIStorage;
- (uint64_t)_setAccessibilityRespondsToUserInteractionBlock:()UIStorage;
- (uint64_t)_setAccessibilityRowCountBlock:()UIStorage;
- (uint64_t)_setAccessibilityRowRangeBlock:()UIStorage;
- (uint64_t)_setAccessibilityShouldUseHostContextIDLongPress:()UIStorage;
- (uint64_t)_setAccessibilityShouldUseHostContextIDTap:()UIStorage;
- (uint64_t)_setAccessibilitySupplementaryViewSectionHeaderIdentifiersBlock:()UIStorage;
- (uint64_t)_setAccessibilityTextualContextBlock:()UIStorage;
- (uint64_t)_setAccessibilityTraitsBlock:()UIStorage;
- (uint64_t)_setAccessibilityUserInputLabelsBlock:()UIStorage;
- (uint64_t)_setAccessibilityValueBlock:()UIStorage;
- (uint64_t)_setAccessibilityViewIsModalBlock:()UIStorage;
- (uint64_t)_setAutomationElementsBlock:()UIStorage;
- (uint64_t)_setIsAccessibilityElementBlock:()UIStorage;
- (uint64_t)_setShouldGroupAccessibilityChildrenBlock:()UIStorage;
- (void)_accessibilityActionBlock:()UIStorage andValue:forKey:;
- (void)_accessibilityInsertTextAtCursor:()UIStorage;
- (void)_accessibilitySetActionBlock:()UIStorage withValue:forKey:;
- (void)_accessibilitySetBlock:()UIStorage forAttribute:;
- (void)_accessibilitySetFocusRingStyle:()UIStorage;
- (void)_accessibilitySpeakThisElementsAndStrings;
@end

@implementation NSObject(UIStorage)

- (uint64_t)_setAccessibilityElementsHiddenBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:10];
}

- (uint64_t)_setAccessibilityLabelBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:1];
}

- (void)_accessibilitySetBlock:()UIStorage forAttribute:
{
  uint64_t v7 = [a1 _accessibilityValueForKey:@"AccessibilityAttributeBlockStorageKey"];
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F1CA60] dictionary];
    [a1 _accessibilitySetRetainedValue:v12 forKey:@"AccessibilityAttributeBlockStorageKey"];
    uint64_t v7 = (uint64_t)v12;
  }
  id v13 = (id)v7;
  if (a3)
  {
    v8 = _Block_copy(a3);
    v9 = [NSNumber numberWithInteger:a4];
    [v13 setObject:v8 forKey:v9];

    _Block_release(v8);
LABEL_6:
    v11 = v13;
    goto LABEL_7;
  }
  v10 = [NSNumber numberWithInteger:a4];
  [v13 removeObjectForKey:v10];

  if ([v13 count]) {
    goto LABEL_6;
  }
  [a1 _accessibilityRemoveValueForKey:@"AccessibilityAttributeBlockStorageKey"];

  v11 = 0;
LABEL_7:
}

- (uint64_t)_setAccessibilityElementsBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:22];
}

- (uint64_t)_setAccessibilityViewIsModalBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:11];
}

- (uint64_t)_setAccessibilityValueBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:3];
}

- (void)_accessibilitySetActionBlock:()UIStorage withValue:forKey:
{
  id v16 = a3;
  id v8 = a4;
  v9 = [NSNumber numberWithUnsignedInt:a5];
  v10 = [a1 _accessibilityValueForKey:@"AccessibilityActionBlockStorageKey"];
  v11 = [a1 _accessibilityValueForKey:@"AccessibilityActionBlockParameterStorageKey"];
  if (!v10)
  {
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [a1 _accessibilitySetRetainedValue:v10 forKey:@"AccessibilityActionBlockStorageKey"];
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];

    [a1 _accessibilitySetRetainedValue:v12 forKey:@"AccessibilityActionBlockParameterStorageKey"];
    v11 = (void *)v12;
  }
  if (v16)
  {
    id v13 = (void *)[v16 copy];
    v14 = _Block_copy(v13);
    [v10 setObject:v14 forKey:v9];

    if (v8)
    {
      [v11 setObject:v8 forKey:v9];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v11 setObject:v15 forKey:v9];
    }
  }
  else
  {
    [v10 removeObjectForKey:v9];
    [v11 removeObjectForKey:v9];
  }
}

- (uint64_t)_accessibilityInternalHandleStartStopToggle
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F48370] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F48370] identifier];
    v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = AXColorizeFormatLog();
      id v8 = [a1 _accessibilityApplication];
      v9 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v9);
      v10 = _AXStringForArgs();

      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v10;
        _os_log_impl(&dword_19F2DB000, v5, v6, "%{public}@", buf, 0xCu);
      }
    }
  }
  char v11 = objc_msgSend(a1, "_accessibilityHandleMagicTapForPronunciation", v46);
  uint64_t v12 = [MEMORY[0x1E4F48370] sharedInstance];
  char v13 = [v12 ignoreLogging];

  if ((v13 & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F48370] identifier];
    v15 = AXLoggerForFacility();

    os_log_type_t v16 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = AXColorizeFormatLog();
      v47 = NSStringFromBOOL();
      v18 = _AXStringForArgs();

      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v18;
        _os_log_impl(&dword_19F2DB000, v15, v16, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (v11) {
    return 1;
  }
  char v19 = [a1 accessibilityStartStopToggle];
  v20 = [MEMORY[0x1E4F48370] sharedInstance];
  char v21 = [v20 ignoreLogging];

  if ((v21 & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F48370] identifier];
    v23 = AXLoggerForFacility();

    os_log_type_t v24 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = AXColorizeFormatLog();
      v48 = NSStringFromBOOL();
      v26 = _AXStringForArgs();

      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v26;
        _os_log_impl(&dword_19F2DB000, v23, v24, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (v19) {
    return 1;
  }
  char v27 = [(id)*MEMORY[0x1E4F43630] accessibilityStartStopToggle];
  v28 = [MEMORY[0x1E4F48370] sharedInstance];
  char v29 = [v28 ignoreLogging];

  if ((v29 & 1) == 0)
  {
    v30 = [MEMORY[0x1E4F48370] identifier];
    v31 = AXLoggerForFacility();

    os_log_type_t v32 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = AXColorizeFormatLog();
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      v50 = NSStringFromBOOL();
      v36 = _AXStringForArgs();

      if (os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v36;
        _os_log_impl(&dword_19F2DB000, v31, v32, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (v27) {
    return 1;
  }
  uint64_t v37 = [a1 _accessibilityHandleMagicTap];
  v39 = [MEMORY[0x1E4F48370] sharedInstance];
  char v40 = [v39 ignoreLogging];

  if ((v40 & 1) == 0)
  {
    v41 = [MEMORY[0x1E4F48370] identifier];
    v42 = AXLoggerForFacility();

    os_log_type_t v43 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = AXColorizeFormatLog();
      v49 = NSStringFromBOOL();
      v45 = _AXStringForArgs();

      if (os_log_type_enabled(v42, v43))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v45;
        _os_log_impl(&dword_19F2DB000, v42, v43, "%{public}@", buf, 0xCu);
      }
    }
  }
  return v37;
}

- (BOOL)_accessibilityHasActionBlockForKey:()UIStorage
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  char v3 = [a1 _accessibilityValueForKey:@"AccessibilityActionBlockStorageKey"];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKey:v2];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_accessibilityActionBlock:()UIStorage andValue:forKey:
{
  id v11 = [NSNumber numberWithUnsignedInt:a5];
  id v8 = [a1 _accessibilityValueForKey:@"AccessibilityActionBlockStorageKey"];
  v9 = [a1 _accessibilityValueForKey:@"AccessibilityActionBlockParameterStorageKey"];
  if (v8)
  {
    *a3 = [v8 objectForKey:v11];
    id v10 = [v9 objectForKey:v11];
  }
  else
  {
    id v10 = 0;
    *a3 = 0;
  }
  *a4 = v10;
}

- (uint64_t)_accessibilityRemoveAllActionBlocks
{
  [a1 _accessibilitySetRetainedValue:0 forKey:@"AccessibilityActionBlockStorageKey"];

  return [a1 _accessibilitySetRetainedValue:0 forKey:@"AccessibilityActionBlockParameterStorageKey"];
}

- (uint64_t)_accessibilityRemoveActionBlockForKey:()UIStorage
{
  return [a1 _accessibilitySetActionBlock:0 withValue:0 forKey:a3];
}

- (uint64_t)_accessibilityGetBlockForAttribute:()UIStorage
{
  v4 = [a1 _accessibilityValueForKey:@"AccessibilityAttributeBlockStorageKey"];
  if (v4)
  {
    v5 = [NSNumber numberWithInteger:a3];
    uint64_t v6 = [v4 objectForKey:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)_setIsAccessibilityElementBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:0];
}

- (uint64_t)_setAccessibilityIdentifierBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:21];
}

- (uint64_t)_setAccessibilityHintBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:2];
}

- (uint64_t)_setAccessibilityAdditionalTraitsBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:5];
}

- (uint64_t)_setAccessibilityTraitsBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:4];
}

- (uint64_t)_setAccessibilityFrameBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:6];
}

- (uint64_t)_setAccessibilityPathBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:7];
}

- (uint64_t)_setAccessibilityActivationPointBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:8];
}

- (uint64_t)_setAccessibilityLanguageBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:9];
}

- (uint64_t)_setShouldGroupAccessibilityChildrenBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:12];
}

- (uint64_t)_setAccessibilityNavigationStyleBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:13];
}

- (uint64_t)_setAccessibilityHeaderElementsBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:14];
}

- (uint64_t)_setAutomationElementsBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:45];
}

- (uint64_t)_setAccessibilityLinkedUIElementsBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:15];
}

- (uint64_t)_setAccessibilityGuideElementHeaderTextBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:16];
}

- (uint64_t)_setAccessibilityDecrementBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:19];
}

- (uint64_t)_setAccessibilityIncrementBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:18];
}

- (uint64_t)_setAccessibilityActivateBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:17];
}

- (uint64_t)_setAccessibilityPerformEscapeBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:25];
}

- (uint64_t)_setAccessibilityIsRealtimeElementBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:20];
}

- (uint64_t)_setAccessibilityCustomActionsBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:26];
}

- (uint64_t)_setAccessibilitySupplementaryViewSectionHeaderIdentifiersBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:29];
}

- (uint64_t)_setAccessibilityFrameForSortingBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:23];
}

- (uint64_t)_setAccessibilityActivateParagraphInTextViewRangeBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:24];
}

- (uint64_t)_setAccessibilityHeadingLevelBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:27];
}

- (uint64_t)_setAccessibilityCustomContentBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:28];
}

- (uint64_t)_accessibilityFocusRingStyle
{
  v1 = [a1 _accessibilityValueForKey:@"AXFocusRingStyle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 integerValue];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

- (void)_accessibilitySetFocusRingStyle:()UIStorage
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"AXFocusRingStyle"];
}

- (uint64_t)_setAccessibilityChartDescriptorBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:30];
}

- (uint64_t)_setAccessibilityAttributedHintBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:35];
}

- (uint64_t)_setAccessibilityTextualContextBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:36];
}

- (uint64_t)_setAccessibilityContainerTypeBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:43];
}

- (uint64_t)_setAccessibilityUserInputLabelsBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:37];
}

- (uint64_t)_setAccessibilityAttributedUserInputLabelsBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:38];
}

- (uint64_t)_setAccessibilityAttributedValueBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:39];
}

- (uint64_t)_setAccessibilityRespondsToUserInteractionBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:41];
}

- (uint64_t)_setAccessibilityMagicTapBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:44];
}

- (uint64_t)_setAccessibilityRemoteElementShouldHitTestHostProcessBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:5009];
}

- (uint64_t)_setAccessibilityShouldUseHostContextIDTap:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:5007];
}

- (uint64_t)_setAccessibilityShouldUseHostContextIDLongPress:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:5008];
}

- (uint64_t)_setAccessibilityColumnCountBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:5000];
}

- (uint64_t)_setAccessibilityRowCountBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:5001];
}

- (uint64_t)_setAccessibilityColumnRangeBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:5002];
}

- (uint64_t)_setAccessibilityRowRangeBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:5003];
}

- (uint64_t)_setAccessibilityHeaderElementsForColumnBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:5004];
}

- (uint64_t)_setAccessibilityHeaderElementsForRowBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:5005];
}

- (uint64_t)_setAccessibilityDataTableCellElementForRowColumnBlock:()UIStorage
{
  return [a1 _accessibilitySetBlock:a3 forAttribute:5006];
}

- (uint64_t)_accessibilityHandleMagicTapForPronunciation
{
  id v1 = a1;
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v3 = [v2 delegate];
        if (objc_opt_respondsToSelector())
        {
          v4 = [v2 delegate];
          char v5 = [v4 accessibilityPerformMagicTap];

          if (v5) {
            break;
          }
        }
        else
        {
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [v2 delegate];
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {

          goto LABEL_14;
        }
        uint64_t v7 = [v2 delegate];
        char v8 = [v7 accessibilityPerformMagicTap];

        if (v8) {
          break;
        }
      }
    }
LABEL_14:
    uint64_t v9 = [v2 accessibilityContainer];

    id v2 = (void *)v9;
    if (!v9)
    {
      uint64_t v10 = 0;
      goto LABEL_18;
    }
  }
  uint64_t v10 = 1;
LABEL_18:

  return v10;
}

- (uint64_t)_accessibilityHandleMagicTap
{
  id v1 = a1;
  if (v1)
  {
    id v2 = v1;
    while (([v2 accessibilityPerformMagicTap] & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v3 = [MEMORY[0x1E4F42FF8] viewControllerForView:v2];
        if ([v3 accessibilityPerformMagicTap]) {
          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v4 = [v2 delegate];
          if (objc_opt_respondsToSelector())
          {
            char v5 = [v2 delegate];
            char v6 = [v5 accessibilityPerformMagicTap];

            if (v6) {
              goto LABEL_21;
            }
          }
          else
          {
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v7 = [v2 delegate];
          if (objc_opt_respondsToSelector())
          {
            char v8 = [v2 delegate];
            int v9 = [v8 accessibilityPerformMagicTap];

            if (v9)
            {
LABEL_21:

              break;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v10 = [v2 accessibilityContainer];

      id v2 = (void *)v10;
      if (!v10) {
        goto LABEL_18;
      }
    }
    uint64_t v12 = 1;
    goto LABEL_23;
  }
LABEL_18:
  id v11 = (id *)MEMORY[0x1E4F43630];
  if (([(id)*MEMORY[0x1E4F43630] accessibilityPerformMagicTap] & 1) == 0)
  {
    id v2 = [*v11 delegate];
    uint64_t v12 = [v2 accessibilityPerformMagicTap];
LABEL_23:

    return v12;
  }
  return 1;
}

- (double)_accessibilityScreenPointForSceneReferencePoint:()UIStorage
{
  char v5 = [a1 _accessibilityWindow];
  char v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_convertPointFromSceneReferenceSpace:", a2, a3);
    objc_msgSend(v6, "convertPoint:toWindow:", 0);
    a2 = v7;
  }

  return a2;
}

- (double)_accessibilityScreenRectForSceneReferenceRect:()UIStorage
{
  int v9 = [a1 _accessibilityWindow];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_convertRectFromSceneReferenceSpace:", a2, a3, a4, a5);
    objc_msgSend(v10, "convertRect:toWindow:", 0);
    a2 = v11;
  }

  return a2;
}

- (id)dragDescriptorMatchingDictionary:()UIStorage
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v5 = objc_msgSend(a1, "_accessibilityAllDragSourceDescriptors", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 matchesDictionaryRepresentation:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_accessibilityActivateDragWithDescriptorDictionary:()UIStorage forServiceName:
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [a1 dragDescriptorMatchingDictionary:v6];
  int v9 = [v8 view];
  [v8 point];
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = *MEMORY[0x1E4F48870];
  v15 = [v6 objectForKey:*MEMORY[0x1E4F48870]];

  if (v15)
  {
    uint64_t v16 = [v6 objectForKey:v14];
    [v16 CGPointValue];
    double v11 = v17;
    double v13 = v18;
  }
  if (v9)
  {
    if ([MEMORY[0x1E4F49030] isValidServiceName:v7])
    {
      dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x3032000000;
      char v40 = __Block_byref_object_copy__2;
      v41 = __Block_byref_object_dispose__2;
      id v42 = 0;
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F49030]) initWithServiceName:v7];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __89__NSObject_UIStorage___accessibilityActivateDragWithDescriptorDictionary_forServiceName___block_invoke;
      v34[3] = &unk_1E59B96C0;
      v36 = &v37;
      char v21 = v19;
      v35 = v21;
      [v20 getDragEndpoint:v34];
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v22 = v38[5];
      if (v22)
      {
        uint64_t v30 = 0;
        v31 = &v30;
        uint64_t v32 = 0x2020000000;
        char v33 = 0;
        uint64_t v26 = 0;
        char v27 = &v26;
        uint64_t v28 = 0x2020000000;
        char v29 = 0;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __89__NSObject_UIStorage___accessibilityActivateDragWithDescriptorDictionary_forServiceName___block_invoke_2;
        v25[3] = &unk_1E59B96E8;
        v25[4] = &v30;
        v25[5] = &v26;
        objc_msgSend(v9, "_accessibilityBeginDragAtPoint:endpoint:completion:", v22, v25, v11, v13);
        if (*((unsigned char *)v31 + 24)) {
          BOOL v23 = *((unsigned char *)v27 + 24) != 0;
        }
        else {
          BOOL v23 = 1;
        }
        _Block_object_dispose(&v26, 8);
        _Block_object_dispose(&v30, 8);
      }
      else
      {
        BOOL v23 = 0;
      }

      _Block_object_dispose(&v37, 8);
    }
    else
    {
      char v21 = AXLogDragging();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[NSObject(UIStorage) _accessibilityActivateDragWithDescriptorDictionary:forServiceName:]();
      }
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (void)_accessibilityInsertTextAtCursor:()UIStorage
{
  id v7 = a3;
  if (!_accessibilityInsertTextAtCursor__BaseFrameForBrowserInsertTextMethod)
  {
    id v4 = (objc_class *)objc_opt_class();
    _accessibilityInsertTextAtCursor__BaseFrameForBrowserInsertTextMethod = (uint64_t)class_getInstanceMethod(v4, sel_browserAccessibilityInsertTextAtCursor_);
  }
  char v5 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v5, sel_browserAccessibilityInsertTextAtCursor_);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || InstanceMethod == (Method)_accessibilityInsertTextAtCursor__BaseFrameForBrowserInsertTextMethod)
  {
    [a1 _accessibilityInsertText:v7 atPosition:-1];
  }
  else
  {
    [a1 browserAccessibilityInsertTextAtCursor:v7];
  }
}

- (uint64_t)_iosAccessibilityPerformAction:()UIStorage withValue:fencePort:
{
  id v8 = a4;
  if (![a1 _accessibilityHasActionBlockForKey:a3])
  {
LABEL_5:
    uint64_t v12 = 0;
    if ((int)a3 <= 5299)
    {
      switch((int)a3)
      {
        case 2001:
          [v8 pointValue];
          objc_msgSend(a1, "_accessibilityScreenPointForSceneReferencePoint:");
          objc_msgSend(a1, "accessibilityZoomInAtPoint:");
          break;
        case 2002:
          [v8 pointValue];
          objc_msgSend(a1, "_accessibilityScreenPointForSceneReferencePoint:");
          objc_msgSend(a1, "accessibilityZoomOutAtPoint:");
          break;
        case 2003:
          uint64_t v17 = [a1 _accessibilityScrollToVisible];
          goto LABEL_169;
        case 2004:
          if (![a1 _accessibilityShouldPerformIncrementOrDecrement]) {
            goto LABEL_210;
          }
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v28 = [v8 unsignedIntegerValue];
            if (!v28) {
              break;
            }
          }
          else
          {
            uint64_t v28 = 1;
          }
          do
          {
            uint64_t v71 = [a1 _accessibilityGetBlockForAttribute:18];
            v72 = (void *)v71;
            if (v71) {
              (*(void (**)(uint64_t))(v71 + 16))(v71);
            }
            else {
              [a1 accessibilityIncrement];
            }

            uint64_t v12 = 1;
            --v28;
          }
          while (v28);
          goto LABEL_211;
        case 2005:
          if (![a1 _accessibilityShouldPerformIncrementOrDecrement]) {
            goto LABEL_210;
          }
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v29 = [v8 unsignedIntegerValue];
            if (!v29) {
              break;
            }
          }
          else
          {
            uint64_t v29 = 1;
          }
          do
          {
            uint64_t v73 = [a1 _accessibilityGetBlockForAttribute:19];
            v74 = (void *)v73;
            if (v73) {
              (*(void (**)(uint64_t))(v73 + 16))(v73);
            }
            else {
              [a1 accessibilityDecrement];
            }

            uint64_t v12 = 1;
            --v29;
          }
          while (v29);
          goto LABEL_211;
        case 2006:
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v30 = [v8 BOOLValue];
            v31 = a1;
          }
          else
          {
            v31 = a1;
            uint64_t v30 = 1;
          }
          uint64_t v17 = [v31 _accessibilityScrollDownPage:v30];
          goto LABEL_169;
        case 2007:
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v32 = [v8 BOOLValue];
            char v33 = a1;
          }
          else
          {
            char v33 = a1;
            uint64_t v32 = 1;
          }
          uint64_t v17 = [v33 _accessibilityScrollUpPage:v32];
          goto LABEL_169;
        case 2008:
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v34 = [v8 BOOLValue];
            v35 = a1;
          }
          else
          {
            v35 = a1;
            uint64_t v34 = 1;
          }
          uint64_t v17 = [v35 _accessibilityScrollRightPage:v34];
          goto LABEL_169;
        case 2009:
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v36 = [v8 BOOLValue];
            uint64_t v37 = a1;
          }
          else
          {
            uint64_t v37 = a1;
            uint64_t v36 = 1;
          }
          uint64_t v17 = [v37 _accessibilityScrollLeftPage:v36];
          goto LABEL_169;
        case 2010:
          uint64_t v17 = [a1 accessibilityActivate];
          goto LABEL_169;
        case 2011:
          uint64_t v17 = [a1 _accessibilityInternalHandleStartStopToggle];
          goto LABEL_169;
        case 2012:
          uint64_t v17 = [a1 _accessibilityTextOperationAction:v8];
          goto LABEL_169;
        case 2013:
          uint64_t v17 = [a1 _accessibilityPerformEscape];
          goto LABEL_169;
        case 2014:
          [v8 pointValue];
          objc_msgSend(a1, "_accessibilityScreenPointForSceneReferencePoint:");
          objc_msgSend(a1, "_accessibilityScrollToPoint:");
          break;
        case 2015:
          [a1 _accessibilityIncreaseSelection:v8];
          break;
        case 2016:
          [a1 _accessibilityDecreaseSelection:v8];
          break;
        case 2017:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v8 count] != 2) {
            goto LABEL_210;
          }
          v38 = [v8 objectAtIndex:0];
          uint64_t v39 = [v38 BOOLValue];
          char v40 = [v8 objectAtIndex:1];
          [a1 _accessibilityFindSearchResult:v39 withString:v40];

          uint64_t v12 = 1;
          goto LABEL_211;
        case 2018:
          [a1 _accessibilityChangeToKeyplane:v8];
          break;
        case 2019:
          uint64_t v17 = [a1 _accessibilityScrollNextPage];
          goto LABEL_169;
        case 2020:
          uint64_t v17 = [a1 _accessibilityScrollPreviousPage];
          goto LABEL_169;
        case 2021:
          uint64_t v17 = [a1 _accessibilityPerformCustomActionWithIdentifier:v8];
          goto LABEL_169;
        case 2022:
          [a1 _accessibilityJumpToTableIndex:v8];
          break;
        case 2023:
          uint64_t v17 = [a1 _accessibilityTriggerDictationFromPath:v8];
          goto LABEL_169;
        case 2024:
          uint64_t v17 = [MEMORY[0x1E4F48910] registerRemoteElement:v8 remotePort:a5];
          goto LABEL_169;
        case 2025:
          [a1 _accessibilityAnnouncementComplete:v8];
          break;
        case 2026:
          uint64_t v17 = objc_msgSend(a1, "_accessibilityAutoscrollInDirection:", (int)objc_msgSend(v8, "intValue"));
          goto LABEL_169;
        case 2027:
          [a1 _accessibilityPauseAutoscrolling];
          break;
        case 2028:
          [a1 _accessibilityIncreaseAutoscrollSpeed];
          break;
        case 2029:
          [a1 _accessibilityDecreaseAutoscrollSpeed];
          break;
        case 2030:
          [a1 _accessibilityAutoscrollScrollToTop];
          break;
        case 2031:
          [a1 _accessibilityAutoscrollScrollToBottom];
          break;
        case 2032:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_210;
          }
          [v8 floatValue];
          [a1 _accessibilitySetAutoscrollSpeed:v41];
          break;
        case 2033:
          uint64_t v17 = [a1 accessibilityExpandMathEquation:v8];
          goto LABEL_169;
        case 2034:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_210;
          }
          id v18 = [MEMORY[0x1E4F49438] representationWithData:v8];
          uint64_t v27 = [a1 _accessibilityDispatchKeyboardAction:v18];
          goto LABEL_172;
        case 2035:
          uint64_t v17 = [a1 _accessibilityDismissAlternativeKeyPicker];
          goto LABEL_169;
        case 2036:
          uint64_t v17 = [a1 _accessibilitySecondaryActivate];
          goto LABEL_169;
        case 2037:
          [a1 accessibilityIncreaseTrackingDetail];
          break;
        case 2038:
          [a1 accessibilityDecreaseTrackingDetail];
          break;
        case 2039:
          [v8 rectValue];
          objc_msgSend(a1, "_accessibilityScreenRectForSceneReferenceRect:");
          objc_msgSend(a1, "_accessibilityScrollRectToVisible:");
          break;
        case 2040:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_210;
          }
          uint64_t v17 = [a1 _accessibilityLoadURL:v8];
          goto LABEL_169;
        case 2041:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_210;
          }
          uint64_t v17 = [a1 _accessibilityPerformUserTestingAction:v8];
          goto LABEL_169;
        case 2042:
          uint64_t v17 = [a1 _accessibilityBeginMonitoringIdleRunLoop];
          goto LABEL_169;
        case 2043:
          [a1 _accessibilityDetectAnimationsNonActive];
          break;
        case 2044:
          uint64_t v17 = [a1 _accessibilitySetNativeFocus];
          goto LABEL_169;
        case 2045:
          uint64_t v17 = objc_msgSend(a1, "_accessibilityPerformOrbGesture:", (int)objc_msgSend(v8, "intValue"));
          goto LABEL_169;
        case 2046:
          uint64_t v17 = [a1 _accessibilitySavePhotoLabel:v8];
          goto LABEL_169;
        case 2047:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_210;
          }
          id v42 = [v8 objectForKeyedSubscript:@"scrollAmount"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            goto LABEL_210;
          }
          v44 = [v8 objectForKeyedSubscript:@"scrollAmount"];
          [v44 floatValue];
          double v46 = v45;

          v47 = [v8 objectForKeyedSubscript:@"scrollPoint"];
          objc_opt_class();
          char v48 = objc_opt_isKindOfClass();

          if (v48)
          {
            v49 = [v8 objectForKeyedSubscript:@"scrollPoint"];
            [v49 pointValue];
            double MidX = v50;
            double MidY = v52;
          }
          else
          {
            AXDeviceGetMainScreenBounds();
            CGFloat x = v86.origin.x;
            CGFloat y = v86.origin.y;
            CGFloat width = v86.size.width;
            CGFloat height = v86.size.height;
            double MidX = CGRectGetMidX(v86);
            v87.origin.CGFloat x = x;
            v87.origin.CGFloat y = y;
            v87.size.CGFloat width = width;
            v87.size.CGFloat height = height;
            double MidY = CGRectGetMidY(v87);
          }
          uint64_t v17 = objc_msgSend(a1, "_animateScrollViewWithScrollAmount:point:", v46, MidX, MidY);
          goto LABEL_169;
        case 2048:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_210;
          }
          uint64_t v17 = [a1 _accessibilityAlternateActionForURL:v8];
          goto LABEL_169;
        case 2049:
        case 2063:
          goto LABEL_211;
        case 2050:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v8 count] != 2) {
            goto LABEL_210;
          }
          id v54 = v8;
          id v18 = [v54 objectAtIndexedSubscript:0];
          v20 = [v54 objectAtIndexedSubscript:1];

          uint64_t v21 = [a1 _accessibilityActivateDragWithDescriptorDictionary:v20 forServiceName:v18];
          goto LABEL_119;
        case 2051:
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v18 = v8;
          }
          else {
            id v18 = 0;
          }
          uint64_t v27 = [a1 _accessibilityShowContextMenuWithTargetPointValue:v18];
          goto LABEL_172;
        case 2052:
          if ([a1 _accessibilityActivateKeyboardDeleteKey]) {
            goto LABEL_210;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v55 = [v8 valueForKey:@"source"];
            v56 = v55;
            if (v55) {
              _UIAXSetLastKeyboardUsed(v55);
            }
          }
          uint64_t v12 = 1;
          [a1 _accessibilityReplaceCharactersAtCursor:1 withString:0];
          goto LABEL_211;
        case 2053:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_209;
          }
          id v57 = v8;
          v58 = [v57 objectForKey:@"numberofcharacters"];
          objc_opt_class();
          char v59 = objc_opt_isKindOfClass();

          if (v59)
          {
            v60 = [v57 objectForKey:@"numberofcharacters"];
            uint64_t v61 = [v60 unsignedIntegerValue];
          }
          else
          {
            uint64_t v61 = 0;
          }
          objc_opt_class();
          v75 = [v57 objectForKey:@"replacement"];
          v76 = __UIAccessibilityCastAsClass();

          objc_opt_class();
          v77 = [v57 objectForKey:@"source"];
          v78 = __UIAccessibilityCastAsClass();

          if (v59)
          {
            if (v78) {
              _UIAXSetLastKeyboardUsed(v78);
            }
            [a1 _accessibilityReplaceCharactersAtCursor:v61 withString:v76];

            goto LABEL_206;
          }

LABEL_209:
          _AXAssert();
          goto LABEL_210;
        case 2054:
          uint64_t v17 = [a1 _accessibilityActivateKeyboardReturnKey];
          goto LABEL_169;
        case 2055:
          objc_opt_class();
          __UIAccessibilityCastAsClass();
          id v57 = (id)objc_claimAutoreleasedReturnValue();
          if (([a1 _accessibilityInsertTextWithAlternatives:v57] & 1) == 0) {
            [a1 _accessibilityInsertTextAtCursor:v57];
          }
          goto LABEL_206;
        case 2056:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            __UIAccessibilityCastAsClass();
            id v57 = (id)objc_claimAutoreleasedReturnValue();
LABEL_203:
            v68 = 0;
            goto LABEL_204;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v57 = 0;
            goto LABEL_203;
          }
          id v67 = v8;
          id v57 = [v67 objectForKeyedSubscript:*MEMORY[0x1E4F48C20]];
          v68 = [v67 objectForKeyedSubscript:*MEMORY[0x1E4F48C18]];
          v69 = [v67 objectForKeyedSubscript:*MEMORY[0x1E4F48C10]];
          int v70 = [v69 BOOLValue];

          if (v68) {
            _UIAXSetLastKeyboardUsed(v68);
          }

          if (v70)
          {
            [a1 _accessibilityBeginUndoableTextInsertion];
            [a1 _accessibilityHandwritingAttributeShouldEchoCharacter];
            [a1 _accessibilityInsertTextAtCursor:v57];
            [a1 _accessibilityEndUndoableTextInsertion];
            goto LABEL_205;
          }
LABEL_204:
          [a1 _accessibilityHandwritingAttributeShouldEchoCharacter];
          [a1 _accessibilityInsertTextAtCursor:v57];
LABEL_205:

LABEL_206:
          break;
        case 2057:
          id v57 = [MEMORY[0x1E4F42B88] sharedMenuController];
          v62 = [a1 _accessibilityParentView];
          if ([v57 isMenuVisible])
          {
            [v57 hideMenuFromView:v62];
          }
          else
          {
            [v62 bounds];
            AX_CGRectGetCenter();
            objc_msgSend(v57, "showMenuFromView:rect:", v62);
          }

          goto LABEL_206;
        case 2058:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v63 = [a1 _accessibilityCurrentlyFocusedElementForTechnology:v8];
            [v63 _accessibilityHandleATFocused:0 assistiveTech:v8];

            [a1 _accessibilityDidFocusOnOpaqueElement:0 technology:v8];
            uint64_t v12 = 1;
          }
          else
          {
            uint64_t v12 = 0;
          }
          goto LABEL_182;
        case 2059:
LABEL_182:
          [a1 _accessibilityShowEditingHUD];
          goto LABEL_211;
        case 2060:
          v64 = [a1 _accessibilityTextViewTextOperationResponder];
          uint64_t v65 = [v64 _accessibilityBeginUndoableTextInsertion];
          goto LABEL_142;
        case 2061:
          v64 = [a1 _accessibilityTextViewTextOperationResponder];
          uint64_t v65 = [v64 _accessibilityEndUndoableTextInsertion];
LABEL_142:
          uint64_t v12 = v65;

          goto LABEL_211;
        case 2062:
          uint64_t v17 = [a1 _accessibilityResetBannerTimer];
          goto LABEL_169;
        case 2064:
          [v8 pointValue];
          uint64_t v17 = objc_msgSend(a1, "_accessibilityAdjustScrollOffset:");
          goto LABEL_169;
        case 2065:
          uint64_t v17 = [a1 _accessibilityAuthenticatedPasteWithValue:v8];
          goto LABEL_169;
        case 2066:
          [a1 _accessibilityShowKeyboard];
          break;
        case 2067:
          [a1 _accessibilityHideKeyboard];
          break;
        case 2068:
          uint64_t v17 = [a1 _accessibilityScrollToTop];
          goto LABEL_169;
        case 2069:
          uint64_t v17 = [a1 _accessibilityScrollToBottom];
          goto LABEL_169;
        default:
          switch((int)a3)
          {
            case 4020:
              [a1 _accessibilityMapsExplorationBeginFromCurrentElement];
              goto LABEL_210;
            case 4021:
              objc_msgSend(a1, "_accessibilityMapsExplorationContinueWithVertexIndex:", objc_msgSend(v8, "unsignedIntegerValue"));
              goto LABEL_210;
            case 4022:
              [a1 _accessibilityMapsExplorationEnd];
              goto LABEL_210;
            case 4023:
              [v8 pointValue];
              objc_msgSend(a1, "_accessibilityMapsExplorationRecordTouchpoint:");
              goto LABEL_210;
            default:
              if (a3 != 2505) {
                goto LABEL_211;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_210;
              }
              id v18 = [v8 objectForKey:@"replacement"];
              v25 = [v8 objectForKey:@"range"];
              NSRange v26 = NSRangeFromString(v25);

              uint64_t v27 = objc_msgSend(a1, "_accessibilityReplaceTextInRange:withString:", v26.location, v26.length, v18);
              break;
          }
LABEL_172:
          uint64_t v12 = v27;
          goto LABEL_173;
      }
LABEL_207:
      uint64_t v12 = 1;
      goto LABEL_211;
    }
    if ((int)a3 <= 5499)
    {
      switch((int)a3)
      {
        case 5300:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 count] == 2)
          {
            double v13 = [v8 firstObject];
            uint64_t v14 = [v13 unsignedIntegerValue];

            v15 = [v8 lastObject];
            uint64_t v16 = [v15 BOOLValue];

            uint64_t v17 = [a1 _accessibilityFocusContainerMoveFocusWithHeading:v14 byGroup:v16];
LABEL_169:
            uint64_t v12 = v17;
            goto LABEL_211;
          }
          uint64_t v22 = AXLogFocusEngine();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[NSObject(UIStorage) _iosAccessibilityPerformAction:withValue:fencePort:]();
          }
          break;
        case 5304:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 count] == 2)
          {
            id v18 = [v8 firstObject];
            uint64_t v19 = [v18 unsignedIntegerValue];
            v20 = [v8 lastObject];
            uint64_t v21 = [a1 _accessibilityFocusContainerMoveFocusWithHeading:v19 toElementMatchingQuery:v20];
LABEL_119:
            uint64_t v12 = v21;

LABEL_173:
            goto LABEL_211;
          }
          uint64_t v22 = AXLogFocusEngine();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[NSObject(UIStorage) _iosAccessibilityPerformAction:withValue:fencePort:].cold.4();
          }
          break;
        case 5305:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(a1, "_accessibilitySetFocusEnabledInApplication:", objc_msgSend(v8, "BOOLValue"));
            goto LABEL_207;
          }
          uint64_t v22 = AXLogFocusEngine();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[NSObject(UIStorage) _iosAccessibilityPerformAction:withValue:fencePort:].cold.5();
          }
          break;
        case 5307:
          [a1 _accessibilityDidFocusOnApplication];
          goto LABEL_207;
        case 5308:
          objc_msgSend(a1, "_accessibilitySetFocusOnElement:", objc_msgSend(v8, "BOOLValue"));
          goto LABEL_207;
        case 5312:
          [a1 _accessibilityClearLastFocusedChild];
          goto LABEL_207;
        default:
          goto LABEL_211;
      }
LABEL_155:

LABEL_210:
      uint64_t v12 = 0;
      goto LABEL_211;
    }
    if ((int)a3 > 6999)
    {
      if (a3 != 7000)
      {
        if (a3 != 9000) {
          goto LABEL_211;
        }
        [a1 _accessibilitySetCurrentGesture:v8];
        goto LABEL_207;
      }
      objc_opt_class();
      uint64_t v22 = __UIAccessibilityCastAsClass();
      BOOL v23 = (void *)[objc_alloc(MEMORY[0x1E4F49470]) initWithDictionaryRepresentation:v22];
      os_log_type_t v24 = +[UIAccessibilityGameController sharedGameController];
      [v24 pressButton:v23];

      goto LABEL_155;
    }
    if (a3 == 5500)
    {
      if ([a1 conformsToProtocol:&unk_1EF189E70])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [MEMORY[0x1E4F42A20] moveRingToFocusItem:a1 forClient:v8];
        }
        else {
          [MEMORY[0x1E4F42A20] moveRingToFocusItem:a1];
        }
        goto LABEL_207;
      }
      v66 = AXLogUI();
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        goto LABEL_160;
      }
    }
    else
    {
      if (a3 != 5501) {
        goto LABEL_211;
      }
      if ([a1 conformsToProtocol:&unk_1EF189E70])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [MEMORY[0x1E4F42A20] removeRingFromFocusItem:a1 forClient:v8];
        }
        else {
          [MEMORY[0x1E4F42A20] removeRingFromFocusItem:a1];
        }
        goto LABEL_207;
      }
      v66 = AXLogUI();
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        goto LABEL_160;
      }
    }
    -[NSObject(UIStorage) _iosAccessibilityPerformAction:withValue:fencePort:]();
LABEL_160:

    goto LABEL_210;
  }
  id v84 = 0;
  id v85 = 0;
  [a1 _accessibilityActionBlock:&v85 andValue:&v84 forKey:a3];
  int v9 = (uint64_t (**)(id, id))v85;
  id v10 = v84;
  double v11 = v10;
  if (!v9)
  {

    goto LABEL_5;
  }
  uint64_t v12 = v9[2](v9, v10);

LABEL_211:
  return v12;
}

- (uint64_t)_accessibilityMimicsTextInputResponder
{
  return 0;
}

- (uint64_t)_accessibilityIgnoreDelegate
{
  return [a1 _accessibilityBoolValueForKey:@"AXIgnoreDelegate"];
}

- (uint64_t)_accessibilitySetIgnoreDelegate:()UIStorage
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"AXIgnoreDelegate"];
}

- (uint64_t)_accessibilitySpeakThisMaximumNumberOfElements
{
  uint64_t v0 = MGGetProductType();
  uint64_t v1 = 500;
  if (v0 != 3856877970) {
    uint64_t v1 = 1000;
  }
  if (v0 == 3953847432) {
    uint64_t v2 = 500;
  }
  else {
    uint64_t v2 = v1;
  }
  uint64_t v3 = 500;
  if (v0 != 2797549163) {
    uint64_t v3 = 1000;
  }
  if (v0 == 2730762296) {
    uint64_t v4 = 500;
  }
  else {
    uint64_t v4 = v3;
  }
  if (v0 <= 3856877969) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v2;
  }
  uint64_t v6 = 500;
  if (v0 != 1549248876) {
    uint64_t v6 = 1000;
  }
  if (v0 == 1517755655) {
    uint64_t v7 = 500;
  }
  else {
    uint64_t v7 = v6;
  }
  if (v0 == 340218669) {
    uint64_t v8 = 500;
  }
  else {
    uint64_t v8 = v7;
  }
  if (v0 <= 2730762295) {
    return v8;
  }
  else {
    return v5;
  }
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  uint64_t v2 = [a1 _accessibilitySpeakThisMaximumNumberOfElements];
  uint64_t v3 = +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions];
  uint64_t v4 = [a1 _accessibilityLeafDescendantsWithCount:v2 options:v3];
  uint64_t v5 = AXLogSpeakScreen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(UIStorage) _accessibilitySpeakThisElementsAndStrings]();
  }

  if ([v4 count] == v2)
  {
    uint64_t v6 = UIKitAccessibilityLocalizedString(@"speakthis.too.much.content");
    uint64_t v7 = [v4 arrayByAddingObject:v6];

    uint64_t v8 = AXLogSpeakScreen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_19F2DB000, v8, OS_LOG_TYPE_INFO, "Had to truncate content.", v10, 2u);
    }

    uint64_t v4 = (void *)v7;
  }

  return v4;
}

- (uint64_t)_accessibilitySpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession
{
  return 0;
}

- (uint64_t)_accessibilitySpeakThisViewsFromSceneWithSceneIdentifier:()UIStorage
{
  return 0;
}

- (id)_accessibilitySpeakThisElementWithIdentifier:()UIStorage
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[UIAccessibilityElementTraversalOptions options];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__NSObject_UIStorage___accessibilitySpeakThisElementWithIdentifier___block_invoke;
  v13[3] = &unk_1E59B8A80;
  id v6 = v4;
  id v14 = v6;
  [v5 setLeafNodePredicate:v13];
  uint64_t v7 = [a1 _accessibilityLeafDescendantsWithCount:1 shouldStopAtRemoteElement:0 options:v5];
  uint64_t v8 = [v7 firstObject];
  int v9 = AXLogSpeakScreen();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v8 description];
    double v11 = [v8 accessibilityIdentifier];
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_19F2DB000, v9, OS_LOG_TYPE_INFO, "SpeakThisElement %@, accessibilityIdentifier: %@, looking for %@", buf, 0x20u);
  }

  return v8;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:()UIStorage
{
  v27[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend(a1, "_accessibilityTextMarkerForPosition:");
  uint64_t v8 = [a1 _accessibilityTextMarkerForPosition:a3 + a4];
  int v9 = AXLogSpeakScreen();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v7 && v8)
  {
    if (v10) {
      -[NSObject(UIStorage) _accessibilityTextRectsForSpeakThisStringRange:]();
    }

    v27[0] = v7;
    v27[1] = v8;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    [a1 accessibilityBoundsForTextMarkers:v11];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    id v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v13, v15, v17, v19);
    NSRange v26 = v20;
    uint64_t v21 = &v26;
  }
  else
  {
    if (v10) {
      -[NSObject(UIStorage) _accessibilityTextRectsForSpeakThisStringRange:]();
    }

    uint64_t v22 = (void *)MEMORY[0x1E4F29238];
    if ([a1 _accessibilityBoolValueForKey:@"AXSpeakScreenRectsUseVisibleFrame"]) {
      [a1 _accessibilityVisibleFrame];
    }
    else {
      [a1 accessibilityFrame];
    }
    id v20 = objc_msgSend(v22, "valueWithCGRect:");
    v25 = v20;
    uint64_t v21 = &v25;
  }
  BOOL v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

  return v23;
}

- (uint64_t)_accessibilityTextRectsForRange:()UIStorage singleTextRect:
{
  return 0;
}

- (uint64_t)_accessibilitySentenceRectsForRange:()UIStorage
{
  return [a1 _accessibilityTextRectsForRange:a3 singleTextRect:0];
}

- (uint64_t)_accessibilitySpeakThisShouldScrollTextRects
{
  uint64_t v1 = [a1 _iosAccessibilityAttributeValue:2301];
  uint64_t v2 = [v1 BOOLValue] ^ 1;

  return v2;
}

- (uint64_t)_accessibilitySpeakThisShouldOnlyIncludeVisibleElements
{
  return 0;
}

- (BOOL)_accessibilitySpeakThisCanBeHighlighted
{
  uint64_t v1 = [a1 _accessibilityWindow];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)_accessibilitySpeakThisPreferredHighlightColor
{
  return 0;
}

- (uint64_t)_accessibilitySpeakThisPreferredUnderlineColor
{
  return 0;
}

- (uint64_t)_accessibilitySpeakThisViewController
{
  return 0;
}

- (uint64_t)_accessibilitySpeakThisViews
{
  return 0;
}

- (uint64_t)_accessibilityRemoteElementForSceneID:()UIStorage
{
  return 0;
}

- (uint64_t)_accessibilitySpeakThisRootElement
{
  return 0;
}

- (uint64_t)_accessibilityHasNativeFocus
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([a1 safeValueForKey:@"_browserAccessibilityStoredValueHasDOMFocus"],
        BOOL v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    return [a1 safeBoolForKey:@"browserAccessibilityHasDOMFocus"];
  }
  else
  {
    return [a1 _accessibilityUIKitHasNativeFocus];
  }
}

- (BOOL)_accessibilityUIKitHasNativeFocus
{
  BOOL v2 = [a1 _accessibilityParentView];
  uint64_t v3 = [v2 window];
  id v4 = [v3 screen];
  uint64_t v5 = [v4 _accessibilityNativeFocusElement];

  return v5 == a1;
}

- (uint64_t)_accessibilityFullscreenVideoViewIsVisible
{
  return 0;
}

- (uint64_t)_accessibilityViewHierarchyHasNativeFocus
{
  BOOL v2 = [(id)*MEMORY[0x1E4F43630] _accessibilityNativeFocusElement];
  if (v2 == a1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [a1 _accessibilityIsDescendantOfElement:v2];
  }

  return v3;
}

- (uint64_t)_accessibilityShouldSetNativeFocusWhenATVFocused
{
  return 0;
}

- (uint64_t)_accessibilitySetNativeFocus
{
  id v2 = [a1 _accessibilityNativeFocusAncestor];
  if (!v2) {
    id v2 = a1;
  }
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 setObject:v2 forKeyedSubscript:@"AXAssignNativeFocusToElementNotificationFocusedItemUserInfoKey"];
  [v3 postNotificationName:@"AXWillAssignNativeFocusToElementNotification" object:0 userInfo:v4];
  if (v2 && ![v2 conformsToProtocol:&unk_1EF189E70])
  {
    char v6 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    if (([a1 _accessibilityIsFKARunningForFocusItem] & 1) != 0
      || [a1 _accessibilityShouldSetNativeFocusWhenATVFocused])
    {
      uint64_t v5 = _UIAXAssignFocusToItem();
    }
    else
    {
      uint64_t v5 = 0;
    }
    char v6 = 1;
  }
  uint64_t v7 = [NSNumber numberWithBool:v5];
  [v4 setObject:v7 forKeyedSubscript:@"AXAssignNativeFocusToElementNotificationDidSucceedUserInfoKey"];

  if ((v6 & 1) == 0)
  {
    BOOL v10 = [NSString stringWithFormat:@"FocusTarget is not of type UIFocusItem: %@", v2];
    [v4 setObject:v10 forKeyedSubscript:@"AXAssignNativeFocusToElementNotificationFailureReasonUserInfoKey"];
LABEL_21:

    goto LABEL_22;
  }
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F42A18] checkFocusabilityForItem:v2];
    int v9 = v8;
    if (v8)
    {
      BOOL v10 = [v8 safeValueForKey:@"_outputString"];
    }
    else
    {
      BOOL v10 = 0;
    }
    if (v10) {
      double v11 = v10;
    }
    else {
      double v11 = @"Unknown";
    }
    [v4 setObject:v11 forKeyedSubscript:@"AXAssignNativeFocusToElementNotificationFailureReasonUserInfoKey"];

    goto LABEL_21;
  }
LABEL_22:
  [v3 postNotificationName:@"AXDidAssignNativeFocusToElementNotification" object:0 userInfo:v4];

  return v5;
}

- (BOOL)_accessibilityCanBecomeNativeFocused
{
  if ([a1 conformsToProtocol:&unk_1EF189E70])
  {
    id v2 = a1;
    if (![v2 canBecomeFocused])
    {
      BOOL v5 = 0;
LABEL_13:

      return v5;
    }
    uint64_t v3 = [v2 preferredFocusEnvironments];
    if ([v3 count] && !objc_msgSend(v3, "containsObject:", v2)) {
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v5 = 1;
      goto LABEL_12;
    }
    if ([v2 _accessibilityViewIsVisible])
    {
      id v4 = [v2 _accessibilityWindow];
      BOOL v5 = v4 != 0;
    }
    else
    {
LABEL_10:
      BOOL v5 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  return 0;
}

- (uint64_t)_accessibilityNativeFocusPreferredElement
{
  return 0;
}

- (uint64_t)_accessibilityUnfocusableViewCanBeFocusedForFocusEverywhere
{
  return 0;
}

- (uint64_t)_accessibilityShouldBeExplorerElementWithoutSystemFocus
{
  return 1;
}

- (uint64_t)_accessibilityNativeFocusPreferredElementIsValid
{
  return 1;
}

- (uint64_t)_accessibilityShouldIgnoreSoundForFailedMoveAttempt
{
  return 0;
}

- (uint64_t)_accessibilityShouldSpeakExplorerElementsAfterFocus
{
  return 1;
}

- (id)_accessibilityNativeFocusAncestor
{
  id v1 = a1;
  if (v1)
  {
    do
    {
      if (([v1 _acceessibilityUIKitIsUserInteractionDisabled] & 1) == 0
        && ([v1 _accessibilityCanBecomeNativeFocused] & 1) != 0)
      {
        break;
      }
      uint64_t v2 = [v1 accessibilityContainer];

      id v1 = (id)v2;
    }
    while (v2);
  }

  return v1;
}

- (uint64_t)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  return 0;
}

- (uint64_t)_accessibilityRemembersLastFocusedChild
{
  return 0;
}

- (uint64_t)_axGetLastFocusedChild
{
  return MEMORY[0x1F41063B0](a1, &__NSObjectAccessibility___axGetLastFocusedChild);
}

- (uint64_t)_axSetLastFocusedChild:()UIStorage
{
  return MEMORY[0x1F41063F0](a1, &__NSObjectAccessibility___axGetLastFocusedChild);
}

- (double)_axScaleTransformForFocusLayerLineWidth
{
  return 1.0;
}

- (BOOL)_drawsFocusRingWhenChildrenFocused
{
  if (![a1 _accessibilityDrawsFocusRingWhenChildrenFocused]) {
    return 0;
  }
  uint64_t v2 = [a1 _accessibilityFindAncestor:&__block_literal_global_3210 startWithSelf:0];
  BOOL v3 = v2 == 0;

  return v3;
}

- (uint64_t)_accessibilityIsFocusContainer
{
  return 0;
}

- (BOOL)_accessibilityHasNativeFocusableElements
{
  id v1 = [(id)*MEMORY[0x1E4F43630] _accessibilityNativeFocusableElements:a1 matchingBlock:0 forExistenceCheckOnly:1];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (id)_accessibilityFocusContainer
{
  BOOL v2 = [a1 _accessibilityFindAncestor:&__block_literal_global_3212 startWithSelf:1];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [a1 _accessibilityWindowScene];
  }
  BOOL v5 = v4;

  return v5;
}

- (uint64_t)_accessibilityFocusContainerMoveFocusWithHeading:()UIStorage byGroup:
{
  return 0;
}

- (uint64_t)_accessibilityFocusContainerMoveFocusWithHeading:()UIStorage toElementMatchingQuery:
{
  return 0;
}

- (uint64_t)_accessibilityMoveFocusWithHeading:()UIStorage
{
  return [a1 _accessibilityMoveFocusWithHeading:a3 byGroup:0];
}

- (uint64_t)_accessibilityMoveFocusWithHeading:()UIStorage byGroup:
{
  return 0;
}

- (uint64_t)_accessibilityMoveFocusWithHeading:()UIStorage toElementMatchingQuery:
{
  return 0;
}

- (uint64_t)_accessibilityClearLastFocusedChild
{
  return [a1 accessibilityEnumerateAncestorsUsingBlock:&__block_literal_global_3214];
}

- (uint64_t)_accessibilityHandlesRemoteFocusMovement
{
  return 0;
}

- (uint64_t)_accessibilityRemotePid
{
  return 0;
}

- (uint64_t)_accessibilityRemoteSceneID
{
  return 0;
}

- (uint64_t)_accessibilityHostPid
{
  if (!_UIApplicationIsExtension()) {
    return 0;
  }
  BOOL v2 = [a1 _accessibilityWindow];
  BOOL v3 = [v2 rootViewController];

  NSClassFromString(&cfstr_Uiviewservicev.isa);
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [v3 safeIntForKey:@"_hostPID"];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)_accessibilityAllowsActivationWithoutBeingNativeFocused
{
  return 0;
}

- (BOOL)_accessibilityIsContainedByPreferredNativeFocusElement
{
  BOOL v2 = [(id)*MEMORY[0x1E4F43630] _accessibilityNativeFocusPreferredElement];
  BOOL v3 = v2;
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__NSObject_UIStorage___accessibilityIsContainedByPreferredNativeFocusElement__block_invoke;
    v7[3] = &unk_1E59B8A80;
    id v8 = v2;
    uint64_t v4 = [a1 _accessibilityFindAncestor:v7 startWithSelf:1];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_accessibilityIsContainedByVideoElement
{
  if (_accessibilityIsContainedByVideoElement_onceToken != -1) {
    dispatch_once(&_accessibilityIsContainedByVideoElement_onceToken, &__block_literal_global_3222);
  }
  if (__PAIR128__(_accessibilityIsContainedByVideoElement_AVInfoPanelViewController, _accessibilityIsContainedByVideoElement_AVPlayerViewControllerClass) == 0)return 0; {
  BOOL v3 = [a1 _accessibilityFindAncestor:&__block_literal_global_3230 startWithSelf:1];
  }
  BOOL v2 = v3 != 0;

  return v2;
}

- (uint64_t)_accessibilityExplorerElements
{
  return 0;
}

- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage
{
  return 0;
}

- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage withQueryString:
{
  return 0;
}

- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage matchingBlock:
{
  return 0;
}

- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage matchingBlock:forExistenceCheckOnly:
{
  return 0;
}

- (uint64_t)_accessibilitySiriContentNativeFocusableElements
{
  return 0;
}

- (uint64_t)_accessibilityFrameDelegate
{
  return 0;
}

- (uint64_t)_accessibilityExplorerElementReadPriority
{
  return 0;
}

- (uint64_t)_accessibilitySortExplorerElements:()UIStorage
{
  return [a3 sortedArrayUsingComparator:&__block_literal_global_3233];
}

- (BOOL)_isAccessibilityExplorerElement
{
  BOOL v2 = [(id)*MEMORY[0x1E4F43630] _accessibilityNativeFocusPreferredElement];
  if (![a1 isAccessibilityElement]) {
    goto LABEL_4;
  }
  BOOL v3 = 0;
  if ([a1 _accessibilityIsFrameOutOfBoundsConsideringScrollParents:0]) {
    goto LABEL_5;
  }
  uint64_t v4 = [a1 _accessibilityFindAncestor:&__block_literal_global_3235 startWithSelf:1];

  if (v4) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![a1 _accessibilityViewIsVisible]) {
    goto LABEL_4;
  }
  NSClassFromString(&cfstr_Uinavigationit.isa);
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  NSClassFromString(&cfstr_Uinavigationit_0.isa);
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  if ([a1 _accessibilityShouldBeExplorerElementWithoutSystemFocus] && !v2)
  {
    BOOL v3 = 1;
    goto LABEL_5;
  }
  uint64_t v6 = [a1 accessibilityTraits];
  if ((*MEMORY[0x1E4F43500] & v6) != 0
    || ([a1 _accessibilityNativeFocusAncestor],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
LABEL_4:
    BOOL v3 = 0;
    goto LABEL_5;
  }
  id v8 = [a1 _accessibilityAncestorFocusParcel];
  BOOL v3 = 1;
  if (v8)
  {
    int v9 = [v2 _accessibilityAncestorFocusParcel];

    if (v9 == v8) {
      BOOL v3 = 0;
    }
  }

LABEL_5:
  return v3;
}

- (uint64_t)_accessibilitySubviews
{
  return 0;
}

- (uint64_t)_accessibilityTextForSubhierarchyIncludingHeaders:()UIStorage focusableItems:exclusions:
{
  return [a1 _accessibilityTextForSubhierarchyIncludingHeaders:a3 focusableItems:a4 exclusions:a5 classExclusions:0];
}

- (id)_accessibilityTextForSubhierarchyIncludingHeaders:()UIStorage focusableItems:exclusions:classExclusions:
{
  id v10 = a5;
  id v11 = a6;
  double v12 = [MEMORY[0x1E4F1CA70] orderedSet];
  double v13 = [MEMORY[0x1E4F1CA48] array];
  double v14 = [a1 _accessibilitySubviews];
  [v13 axSafelyAddObjectsFromArray:v14];

  if ([v13 count])
  {
    uint64_t v15 = *MEMORY[0x1E4F43500];
    do
    {
      double v16 = [v13 firstObject];
      [v13 removeObject:v16];
      if (([v16 accessibilityElementsHidden] & 1) == 0)
      {
        double v17 = [v16 _accessibilityAXAttributedLabel];
        if ([v17 length]
          && ([v10 containsObject:v17] & 1) == 0
          && ([v11 containsObject:objc_opt_class()] & 1) == 0
          && ((a4 & 1) != 0 || ([v16 _accessibilityCanBecomeNativeFocused] & 1) == 0)
          && ((a3 & 1) != 0 || (v15 & [v16 accessibilityTraits]) == 0))
        {
          [v12 addObject:v17];
        }
        if (([v16 isAccessibilityElement] & 1) == 0)
        {
          double v18 = [v16 _accessibilitySortedElementsWithin];
          [v13 axSafelyAddObjectsFromArray:v18];
        }
      }
    }
    while ([v13 count]);
  }
  double v19 = [v12 array];
  id v20 = UIAXLabelForElements();

  return v20;
}

- (BOOL)_accessibilityIsFocusParcel
{
  return ([a1 _accessibilityCanBecomeNativeFocused] & 1) != 0
      || [a1 _accessibilityFocusParcelChildrenCount:0] == 1;
}

- (uint64_t)_accessibilityFocusParcelChildrenCount:()UIStorage
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([a1 _accessibilityCanBecomeNativeFocused])
  {
    ++a3;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v5 = objc_msgSend(a1, "_accessibilitySubviews", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          a3 = [*(id *)(*((void *)&v11 + 1) + 8 * v9++) _accessibilityFocusParcelChildrenCount:a3];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  return a3;
}

- (id)_accessibilityExtendedLabelForFocusParcelWithLabel:()UIStorage
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v14 = [a1 _accessibilityCanBecomeNativeFocused];
    uint64_t v7 = [a1 _accessibilityAncestorFocusParcel];
    uint64_t v15 = (void *)MEMORY[0x1E4F1C978];
    long long v12 = [a1 _accessibilityAXAttributedValue];
    BOOL v5 = objc_msgSend(v15, "axArrayByIgnoringNilElementsWithCount:", 1, v12);
    id v13 = [v7 _accessibilityTextForSubhierarchyIncludingHeaders:v14 focusableItems:0 exclusions:v5];
    goto LABEL_9;
  }
  BOOL v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  uint64_t v6 = [a1 _accessibilityAncestorFocusParcel];
  uint64_t v7 = (void *)v6;
  if (v6 && (void *)v6 != a1)
  {
    uint64_t v8 = [a1 _accessibilityCanBecomeNativeFocused];
    uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = [a1 _accessibilityAXAttributedValue];
    long long v11 = objc_msgSend(v9, "axArrayByIgnoringNilElementsWithCount:", 1, v10);
    long long v12 = [v7 _accessibilityTextForSubhierarchyIncludingHeaders:v8 focusableItems:0 exclusions:v11];

    if ([v5 axContainsString:v12 options:1])
    {
LABEL_10:

      goto LABEL_11;
    }
    if ([v12 axContainsString:v5 options:1])
    {
      id v13 = v12;
    }
    else
    {
      __UIAXStringForVariables();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_9:
    id v16 = v13;

    BOOL v5 = v16;
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:

  return v5;
}

- (id)_accessibilityAncestorFocusParcel
{
  id v1 = a1;
  if (v1)
  {
    BOOL v2 = v1;
    do
    {
      if ([v2 _accessibilityIsFocusParcel]) {
        id v3 = v2;
      }
      else {
        id v3 = 0;
      }
      id v4 = [v2 accessibilityContainer];

      if (v3) {
        break;
      }
      BOOL v2 = v4;
    }
    while (v4);
  }
  else
  {
    id v3 = 0;
    id v4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilitySupplementaryHeaderViewAtIndexPath:()UIStorage
{
  return 0;
}

- (uint64_t)_accessibilityElementsWithSemanticContext:()UIStorage
{
  return 0;
}

- (uint64_t)_accessibilitySiriContentElementsWithSemanticContext
{
  return 0;
}

- (uint64_t)_accessibilityApplicationHandleButtonAction:()UIStorage
{
  return 0;
}

- (id)_accessibilityProxyViewAncestorWhenMissingWindow
{
  uint64_t v1 = [a1 accessibilityContainer];
  if (v1)
  {
    BOOL v2 = (void *)v1;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v3 = [v2 window];

        if (v3) {
          break;
        }
      }
      id v4 = [v2 _accessibilityProxyView];
      BOOL v5 = [v4 window];

      if (v5)
      {

        goto LABEL_10;
      }
      uint64_t v6 = [v2 accessibilityContainer];

      BOOL v2 = (void *)v6;
      if (!v6) {
        goto LABEL_7;
      }
    }
    id v4 = v2;
  }
  else
  {
LABEL_7:
    id v4 = 0;
  }
LABEL_10:

  return v4;
}

- (uint64_t)_accessibilityProxyView
{
  return 0;
}

- (void)_accessibilityActivateDragWithDescriptorDictionary:()UIStorage forServiceName:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19F2DB000, v0, v1, "Can't start drag for unexpected service name %@", v2, v3, v4, v5, v6);
}

- (void)_iosAccessibilityPerformAction:()UIStorage withValue:fencePort:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19F2DB000, v0, v1, "Not a UIFocusItem: Cannot draw focus around '%@'", v2, v3, v4, v5, v6);
}

- (void)_iosAccessibilityPerformAction:()UIStorage withValue:fencePort:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19F2DB000, v0, v1, "Unexpected parameter for kAXMoveNativeFocusWithHeadingAction: %@", v2, v3, v4, v5, v6);
}

- (void)_iosAccessibilityPerformAction:()UIStorage withValue:fencePort:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19F2DB000, v0, v1, "Unexpected parameter for kAXMoveNativeFocusWithHeadingToElementMatchingQuery: %@", v2, v3, v4, v5, v6);
}

- (void)_iosAccessibilityPerformAction:()UIStorage withValue:fencePort:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19F2DB000, v0, v1, "Unexpected parameter for kAXSetFocusEnabledForApplicationAction: %@", v2, v3, v4, v5, v6);
}

- (void)_accessibilitySpeakThisElementsAndStrings
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "Speak This elements were %{public}@", v2, v3, v4, v5, v6);
}

- (void)_accessibilityTextRectsForSpeakThisStringRange:()UIStorage .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19F2DB000, v0, v1, "Found text markers %{public}@ and %{public}@");
}

- (void)_accessibilityTextRectsForSpeakThisStringRange:()UIStorage .cold.2()
{
  OUTLINED_FUNCTION_15();
  _os_log_debug_impl(&dword_19F2DB000, v0, OS_LOG_TYPE_DEBUG, "Could not find text markers, using entire frame", v1, 2u);
}

@end