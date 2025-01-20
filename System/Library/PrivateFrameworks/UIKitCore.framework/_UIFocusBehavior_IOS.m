@interface _UIFocusBehavior_IOS
+ (id)sharedInstance;
- (BOOL)_shouldOverrideFocusSystemEnabledForScene:(id)a3;
- (BOOL)addsAccessibilityElementsToFocusEngine;
- (BOOL)allowsRestoringFocusForScreen:(id)a3;
- (BOOL)autoDismissesPopoverControllersOnFocusIntersection;
- (BOOL)cachesPreferredEnvironmentEnumerationResults;
- (BOOL)controlCanBecomeFocused:(id)a3;
- (BOOL)defaultValueForSelectionFollowsFocusInCollectionView:(id)a3;
- (BOOL)defaultValueForSelectionFollowsFocusInTableView:(id)a3;
- (BOOL)disablesFocusabilityForItemsContainingFocus;
- (BOOL)enforcesStrictTargetContentOffsetAdjustmentBehavior;
- (BOOL)honorsFocusSystemEnabledInfoPlistKey;
- (BOOL)ignoresKeyWindowStatusWhenRestoringFocus;
- (BOOL)includesContentScrollViewInPreferredFocusEnvironments;
- (BOOL)legacyIsTransparentFocusRegionSupported;
- (BOOL)modernFocusedItemGetterBehavior;
- (BOOL)preventsCellFocusabilityWhileEditing;
- (BOOL)refinesIndexBarTargetContentOffset;
- (BOOL)requiresLegacyScreenBasedWindowLookup;
- (BOOL)searchBarTextFieldCanBecomeFocused;
- (BOOL)shouldAdjustAnimationTimingForOffscreenDistance;
- (BOOL)shouldCallAccessibilityOverrides;
- (BOOL)shouldConvertIndirectTapsIntoArrowKeys;
- (BOOL)shouldEnableFocusOnSelect;
- (BOOL)shouldSupressIndirectMovementOnSelect;
- (BOOL)shouldUseAccessibilityCompareForFocusGroupsInExternallyPlacedWindows;
- (BOOL)shouldUseAccessibilityCompareForItemGeometry;
- (BOOL)showsFocusRingForItem:(id)a3;
- (BOOL)supportsArrowKeys;
- (BOOL)supportsClipToBounds;
- (BOOL)supportsFrameReporter;
- (BOOL)supportsGameControllers;
- (BOOL)supportsHaptics;
- (BOOL)supportsIndirectPanningMovement;
- (BOOL)supportsIndirectRotaryMovement;
- (BOOL)supportsLinearMovementDebugOverlay;
- (BOOL)supportsMultipleWindows;
- (BOOL)supportsParentFocusRings;
- (BOOL)supportsSounds;
- (BOOL)supportsTabKey;
- (BOOL)supportsViewTransparency;
- (BOOL)syncsFocusAndResponder;
- (BOOL)tabBarButtonCanBecomeFocused;
- (BOOL)tabBarCanBecomeFocused;
- (BOOL)tabBasedMovementLoops;
- (BOOL)textViewCanBecomeFocused:(id)a3;
- (BOOL)throttlesProgrammaticFocusUpdates;
- (BOOL)treatFirstAndLastHeadingsAsGlobal;
- (BOOL)viewControllerPresentationRestoresLastFocusedItem;
- (BOOL)waitForFocusMovementActionToEnableFocusSystem;
- (BOOL)wantsFocusSystemForScene:(id)a3;
- (BOOL)wantsTreeLocking;
- (double)stabilizedLinearFocusMovementTimeout;
- (int64_t)buttonSelectionMode;
- (int64_t)cellFocusability;
- (int64_t)deliverKeyEventsToFocusEngine;
- (int64_t)focusCastingMode;
- (int64_t)focusDeferral;
- (int64_t)focusRingVisibility;
- (int64_t)focusSystemDeactivationMode;
- (int64_t)indirectMovementPriority;
- (int64_t)pageButtonScrollingStyle;
- (int64_t)requiredInputDevices;
- (int64_t)scrollingMode;
- (int64_t)skipKeyCommandsForKeyEvents;
- (unint64_t)defaultFocusScrollOffsetResolver;
- (unint64_t)focusGroupContainmentBehavior;
- (unint64_t)focusGroupMovementBehavior;
@end

@implementation _UIFocusBehavior_IOS

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___UIFocusBehavior_IOS_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2648D8 != -1) {
    dispatch_once(&qword_1EB2648D8, block);
  }
  v2 = (void *)qword_1EB2648D0;
  return v2;
}

- (BOOL)_shouldOverrideFocusSystemEnabledForScene:(id)a3
{
  v3 = [a3 _focusSystemSceneComponent];
  char v4 = [v3 isOverrideFocusSystemEnabled];

  return v4;
}

- (BOOL)wantsFocusSystemForScene:(id)a3
{
  id v4 = a3;
  BOOL v5 = (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIFocusLinkCheckEnabled, @"UIFocusLinkCheckEnabled") & 1) == 0&& !byte_1EB2579B4|| (dyld_program_sdk_at_least() & 1) != 0|| [(_UIFocusBehavior_IOS *)self _shouldOverrideFocusSystemEnabledForScene:v4];

  return v5;
}

- (BOOL)honorsFocusSystemEnabledInfoPlistKey
{
  return 1;
}

- (int64_t)requiredInputDevices
{
  if ([(_UIFocusBehavior_IOS *)self supportsGameControllers]) {
    return 3;
  }
  else {
    return 1;
  }
}

- (BOOL)syncsFocusAndResponder
{
  return 1;
}

- (int64_t)focusDeferral
{
  return 3;
}

- (BOOL)ignoresKeyWindowStatusWhenRestoringFocus
{
  return 1;
}

- (BOOL)allowsRestoringFocusForScreen:(id)a3
{
  return 1;
}

- (BOOL)controlCanBecomeFocused:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v5 = +[_UIApplicationInfoParser mainBundleInfoParser];
  int v6 = [v5 focusEnabledInLimitedControls];

  if (v6)
  {
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();
    objc_opt_class();
    isKindOfClass |= v7 | objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)textViewCanBecomeFocused:(id)a3
{
  return [a3 isEditable];
}

- (BOOL)tabBarCanBecomeFocused
{
  return 0;
}

- (BOOL)tabBarButtonCanBecomeFocused
{
  return 0;
}

- (BOOL)searchBarTextFieldCanBecomeFocused
{
  return 1;
}

- (BOOL)includesContentScrollViewInPreferredFocusEnvironments
{
  return 1;
}

- (int64_t)indirectMovementPriority
{
  return 0;
}

- (unint64_t)focusGroupMovementBehavior
{
  return 30;
}

- (unint64_t)focusGroupContainmentBehavior
{
  return 1010;
}

- (BOOL)enforcesStrictTargetContentOffsetAdjustmentBehavior
{
  return 1;
}

- (unint64_t)defaultFocusScrollOffsetResolver
{
  return 2;
}

- (int64_t)scrollingMode
{
  return 2;
}

- (BOOL)shouldUseAccessibilityCompareForItemGeometry
{
  return 0;
}

- (BOOL)shouldUseAccessibilityCompareForFocusGroupsInExternallyPlacedWindows
{
  return 0;
}

- (int64_t)cellFocusability
{
  if (_UIFocusBehaviorAPIBehavior_onceToken[0] != -1) {
    dispatch_once(_UIFocusBehaviorAPIBehavior_onceToken, &__block_literal_global_581);
  }
  if (_UIFocusBehaviorAPIBehavior_apiFocusBehavior) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)preventsCellFocusabilityWhileEditing
{
  return 0;
}

- (BOOL)defaultValueForSelectionFollowsFocusInCollectionView:(id)a3
{
  id v3 = a3;
  if (!dyld_program_sdk_at_least()) {
    goto LABEL_16;
  }
  id v4 = [v3 traitCollection];
  int v5 = [v4 _hasSplitViewControllerContextSidebarColumn];

  if (v5)
  {
    if (([v3 _delegateSupportsPrimaryAction] & 1) == 0)
    {
      int v6 = [v3 _viewControllerForAncestor];
      char v7 = [v6 splitViewController];

      if (v7)
      {
        unint64_t v8 = [v7 displayMode];
        if (v8 <= 6 && ((1 << v8) & 0x68) != 0)
        {
          LOBYTE(v5) = 0;
LABEL_15:

          goto LABEL_17;
        }
      }
    }
    if ((dyld_program_sdk_at_least() & 1) != 0 || ([v3 isEditing] & 1) == 0)
    {
      uint64_t v9 = [v3 _viewControllerForAncestor];
      if (v9)
      {
        char v7 = (void *)v9;
        do
        {
          objc_opt_class();
          LOBYTE(v5) = objc_opt_isKindOfClass();
          if (v5) {
            break;
          }
          uint64_t v10 = [v7 parentViewController];

          char v7 = (void *)v10;
        }
        while (v10);
        goto LABEL_15;
      }
    }
LABEL_16:
    LOBYTE(v5) = 0;
  }
LABEL_17:

  return v5 & 1;
}

- (BOOL)defaultValueForSelectionFollowsFocusInTableView:(id)a3
{
  id v3 = a3;
  if (!dyld_program_sdk_at_least()) {
    goto LABEL_16;
  }
  id v4 = [v3 traitCollection];
  int v5 = [v4 _hasSplitViewControllerContextSidebarColumn];

  if (v5)
  {
    if (([v3 _delegateSupportsPrimaryAction] & 1) == 0)
    {
      int v6 = [v3 _viewControllerForAncestor];
      char v7 = [v6 splitViewController];

      if (v7)
      {
        unint64_t v8 = [v7 displayMode];
        if (v8 <= 6 && ((1 << v8) & 0x68) != 0)
        {
          LOBYTE(v5) = 0;
LABEL_15:

          goto LABEL_17;
        }
      }
    }
    if ((dyld_program_sdk_at_least() & 1) != 0 || ([v3 isEditing] & 1) == 0)
    {
      uint64_t v9 = [v3 _viewControllerForAncestor];
      if (v9)
      {
        char v7 = (void *)v9;
        do
        {
          objc_opt_class();
          LOBYTE(v5) = objc_opt_isKindOfClass();
          if (v5) {
            break;
          }
          uint64_t v10 = [v7 parentViewController];

          char v7 = (void *)v10;
        }
        while (v10);
        goto LABEL_15;
      }
    }
LABEL_16:
    LOBYTE(v5) = 0;
  }
LABEL_17:

  return v5 & 1;
}

- (BOOL)viewControllerPresentationRestoresLastFocusedItem
{
  return 1;
}

- (BOOL)treatFirstAndLastHeadingsAsGlobal
{
  return 1;
}

- (BOOL)supportsViewTransparency
{
  return dyld_program_sdk_at_least();
}

- (BOOL)supportsMultipleWindows
{
  return dyld_program_sdk_at_least();
}

- (BOOL)requiresLegacyScreenBasedWindowLookup
{
  return 0;
}

- (BOOL)supportsClipToBounds
{
  return 1;
}

- (int64_t)focusCastingMode
{
  return 2;
}

- (BOOL)throttlesProgrammaticFocusUpdates
{
  return 1;
}

- (BOOL)wantsTreeLocking
{
  return 1;
}

- (double)stabilizedLinearFocusMovementTimeout
{
  int v2 = dyld_program_sdk_at_least();
  double result = 0.0;
  if (v2) {
    return 0.5;
  }
  return result;
}

- (BOOL)cachesPreferredEnvironmentEnumerationResults
{
  return 1;
}

- (BOOL)modernFocusedItemGetterBehavior
{
  return 1;
}

- (BOOL)disablesFocusabilityForItemsContainingFocus
{
  return 0;
}

- (BOOL)refinesIndexBarTargetContentOffset
{
  return 0;
}

- (BOOL)addsAccessibilityElementsToFocusEngine
{
  return 0;
}

- (BOOL)shouldAdjustAnimationTimingForOffscreenDistance
{
  return 1;
}

- (BOOL)supportsSounds
{
  return 0;
}

- (BOOL)supportsHaptics
{
  return 0;
}

- (BOOL)supportsFrameReporter
{
  return 0;
}

- (int64_t)buttonSelectionMode
{
  return 2;
}

- (int64_t)focusRingVisibility
{
  int v2 = +[_UIApplicationInfoParser mainBundleInfoParser];
  int v3 = [v2 forcesDefaultFocusAppearance];

  if (v3) {
    return 2;
  }
  else {
    return 3;
  }
}

- (BOOL)supportsParentFocusRings
{
  return 0;
}

- (BOOL)showsFocusRingForItem:(id)a3
{
  return 1;
}

- (BOOL)supportsIndirectPanningMovement
{
  return 0;
}

- (BOOL)supportsIndirectRotaryMovement
{
  return 0;
}

- (BOOL)shouldConvertIndirectTapsIntoArrowKeys
{
  return 0;
}

- (BOOL)supportsGameControllers
{
  int v2 = +[_UIApplicationInfoParser mainBundleInfoParser];
  char v3 = [v2 requiresGameControllerBasedFocus];

  return v3;
}

- (BOOL)supportsArrowKeys
{
  return 1;
}

- (int64_t)pageButtonScrollingStyle
{
  return 0;
}

- (BOOL)supportsTabKey
{
  return 1;
}

- (BOOL)shouldEnableFocusOnSelect
{
  return 0;
}

- (BOOL)shouldSupressIndirectMovementOnSelect
{
  return 0;
}

- (int64_t)deliverKeyEventsToFocusEngine
{
  return 2;
}

- (int64_t)skipKeyCommandsForKeyEvents
{
  return 2;
}

- (BOOL)tabBasedMovementLoops
{
  return 1;
}

- (BOOL)autoDismissesPopoverControllersOnFocusIntersection
{
  return 0;
}

- (int64_t)focusSystemDeactivationMode
{
  return 0;
}

- (BOOL)legacyIsTransparentFocusRegionSupported
{
  return 0;
}

- (BOOL)waitForFocusMovementActionToEnableFocusSystem
{
  return 0;
}

- (BOOL)shouldCallAccessibilityOverrides
{
  return 0;
}

- (BOOL)supportsLinearMovementDebugOverlay
{
  if (qword_1EB2648E0 != -1) {
    dispatch_once(&qword_1EB2648E0, &__block_literal_global_132_1);
  }
  return _MergedGlobals_1274;
}

@end