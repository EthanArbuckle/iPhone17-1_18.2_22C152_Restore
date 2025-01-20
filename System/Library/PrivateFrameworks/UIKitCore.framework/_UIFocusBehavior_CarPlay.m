@interface _UIFocusBehavior_CarPlay
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

@implementation _UIFocusBehavior_CarPlay

+ (id)sharedInstance
{
  return 0;
}

- (BOOL)wantsFocusSystemForScene:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIFocusBehavior_CarPlay.m", 30, @"Attempting to initialize CarPlay focus system with a scene (%@) that is not a windowScene", v5 object file lineNumber description];
  }
  v6 = [v5 traitCollection];
  char v7 = [v6 interactionModel];

  return (v7 & 0xA) != 0;
}

- (BOOL)honorsFocusSystemEnabledInfoPlistKey
{
  return 1;
}

- (int64_t)requiredInputDevices
{
  return 0;
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
  return 0;
}

- (BOOL)allowsRestoringFocusForScreen:(id)a3
{
  return [a3 _isCarInstrumentsScreen] ^ 1;
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
  return 1;
}

- (BOOL)tabBarButtonCanBecomeFocused
{
  return 1;
}

- (BOOL)searchBarTextFieldCanBecomeFocused
{
  return 0;
}

- (BOOL)includesContentScrollViewInPreferredFocusEnvironments
{
  return 0;
}

- (unint64_t)focusGroupMovementBehavior
{
  return 0;
}

- (unint64_t)focusGroupContainmentBehavior
{
  return 0;
}

- (BOOL)enforcesStrictTargetContentOffsetAdjustmentBehavior
{
  return 0;
}

- (unint64_t)defaultFocusScrollOffsetResolver
{
  return 0;
}

- (int64_t)scrollingMode
{
  return 1;
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
  return 0;
}

- (BOOL)preventsCellFocusabilityWhileEditing
{
  return 1;
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
  return 0;
}

- (BOOL)treatFirstAndLastHeadingsAsGlobal
{
  return 0;
}

- (BOOL)supportsViewTransparency
{
  return 0;
}

- (BOOL)supportsMultipleWindows
{
  return 0;
}

- (BOOL)requiresLegacyScreenBasedWindowLookup
{
  return 1;
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
  return 0;
}

- (BOOL)wantsTreeLocking
{
  return 0;
}

- (double)stabilizedLinearFocusMovementTimeout
{
  return -1.0;
}

- (BOOL)cachesPreferredEnvironmentEnumerationResults
{
  return 0;
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

- (int64_t)buttonSelectionMode
{
  return 3;
}

- (int64_t)focusRingVisibility
{
  return 0;
}

- (BOOL)supportsParentFocusRings
{
  return 0;
}

- (BOOL)showsFocusRingForItem:(id)a3
{
  return 0;
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
  return 0;
}

- (BOOL)supportsArrowKeys
{
  return 0;
}

- (int64_t)pageButtonScrollingStyle
{
  return 0;
}

- (BOOL)supportsTabKey
{
  return 0;
}

- (int64_t)indirectMovementPriority
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

- (BOOL)shouldAdjustAnimationTimingForOffscreenDistance
{
  return 0;
}

- (BOOL)supportsSounds
{
  return 0;
}

- (BOOL)supportsHaptics
{
  return 1;
}

- (BOOL)supportsFrameReporter
{
  return 0;
}

- (BOOL)legacyIsTransparentFocusRegionSupported
{
  return 1;
}

- (BOOL)waitForFocusMovementActionToEnableFocusSystem
{
  return 1;
}

- (BOOL)shouldCallAccessibilityOverrides
{
  return 0;
}

- (BOOL)supportsLinearMovementDebugOverlay
{
  return 0;
}

@end