@interface _UIFocusBehavior_FKA
+ (id)sharedInstance;
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

@implementation _UIFocusBehavior_FKA

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___UIFocusBehavior_FKA_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2603E0 != -1) {
    dispatch_once(&qword_1EB2603E0, block);
  }
  v2 = (void *)_MergedGlobals_1030;
  return v2;
}

- (BOOL)wantsFocusSystemForScene:(id)a3
{
  return 1;
}

- (BOOL)honorsFocusSystemEnabledInfoPlistKey
{
  return 0;
}

- (int64_t)requiredInputDevices
{
  if (_AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation()) {
    return 0;
  }
  if ([(_UIFocusBehavior_FKA *)self supportsGameControllers]) {
    return 3;
  }
  return 1;
}

- (BOOL)syncsFocusAndResponder
{
  return 0;
}

- (int64_t)focusDeferral
{
  return 0;
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
  return 1;
}

- (BOOL)textViewCanBecomeFocused:(id)a3
{
  return [a3 isSelectable];
}

- (BOOL)tabBarCanBecomeFocused
{
  return 0;
}

- (BOOL)tabBarButtonCanBecomeFocused
{
  return 1;
}

- (BOOL)searchBarTextFieldCanBecomeFocused
{
  return 1;
}

- (BOOL)includesContentScrollViewInPreferredFocusEnvironments
{
  return 1;
}

- (BOOL)supportsTabKey
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
  return 1;
}

- (BOOL)shouldUseAccessibilityCompareForFocusGroupsInExternallyPlacedWindows
{
  return 1;
}

- (int64_t)cellFocusability
{
  return 0;
}

- (BOOL)preventsCellFocusabilityWhileEditing
{
  return 0;
}

- (BOOL)defaultValueForSelectionFollowsFocusInCollectionView:(id)a3
{
  return 0;
}

- (BOOL)defaultValueForSelectionFollowsFocusInTableView:(id)a3
{
  return 0;
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
  return dyld_program_sdk_at_least();
}

- (int64_t)focusCastingMode
{
  return 0;
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
  return -1.0;
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
  return 1;
}

- (BOOL)refinesIndexBarTargetContentOffset
{
  return 0;
}

- (BOOL)addsAccessibilityElementsToFocusEngine
{
  return 1;
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
  return 0;
}

- (int64_t)focusRingVisibility
{
  return 1;
}

- (BOOL)supportsParentFocusRings
{
  return 1;
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
  v2 = +[_UIApplicationInfoParser mainBundleInfoParser];
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
  return 0;
}

- (int64_t)skipKeyCommandsForKeyEvents
{
  return 0;
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
  return 1;
}

- (BOOL)waitForFocusMovementActionToEnableFocusSystem
{
  return 0;
}

- (BOOL)shouldCallAccessibilityOverrides
{
  return 1;
}

- (BOOL)supportsLinearMovementDebugOverlay
{
  return 0;
}

@end