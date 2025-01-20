@interface _UIFocusBehavior_TV
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
- (_UIFocusBehavior_TV)init;
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
- (void)_handleRemoteTouchSurfaceTypeDidChangeNotification:(id)a3;
- (void)dealloc;
@end

@implementation _UIFocusBehavior_TV

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37___UIFocusBehavior_TV_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB264E90 != -1) {
    dispatch_once(&qword_1EB264E90, block);
  }
  v2 = (void *)_MergedGlobals_1308;
  return v2;
}

- (_UIFocusBehavior_TV)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFocusBehavior_TV;
  v2 = [(_UIFocusBehavior_TV *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleRemoteTouchSurfaceTypeDidChangeNotification_ name:@"_UIDeviceRemoteTouchSurfaceTypeDidChangeNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIDeviceRemoteTouchSurfaceTypeDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIFocusBehavior_TV;
  [(_UIFocusBehavior_TV *)&v4 dealloc];
}

- (BOOL)wantsFocusSystemForScene:(id)a3
{
  return 1;
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
  return 32;
}

- (unint64_t)focusGroupContainmentBehavior
{
  return 296;
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
  return 0;
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
  return 1;
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
  return 0;
}

- (BOOL)supportsClipToBounds
{
  return dyld_program_sdk_at_least();
}

- (int64_t)focusCastingMode
{
  return 1;
}

- (BOOL)throttlesProgrammaticFocusUpdates
{
  return 0;
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
  return 0;
}

- (BOOL)modernFocusedItemGetterBehavior
{
  return 0;
}

- (BOOL)disablesFocusabilityForItemsContainingFocus
{
  return 0;
}

- (BOOL)refinesIndexBarTargetContentOffset
{
  return 1;
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
  return 1;
}

- (BOOL)supportsHaptics
{
  return 0;
}

- (BOOL)supportsFrameReporter
{
  return 1;
}

- (int64_t)buttonSelectionMode
{
  return 2;
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
  return 1;
}

- (BOOL)supportsIndirectRotaryMovement
{
  int v2 = B519BehaviorEnabled();
  if (v2)
  {
    char v3 = _os_feature_enabled_impl();
    char v4 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_B519_SupportsIndirectRotaryMovement, @"B519_SupportsIndirectRotaryMovement", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    if (byte_1E8FD554C) {
      char v5 = 1;
    }
    else {
      char v5 = v4;
    }
    LOBYTE(v2) = v3 & v5;
  }
  return v2;
}

- (BOOL)shouldConvertIndirectTapsIntoArrowKeys
{
  return !B519BehaviorEnabled()
      || _AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled() != 0;
}

- (BOOL)supportsGameControllers
{
  return 1;
}

- (BOOL)supportsArrowKeys
{
  return 1;
}

- (int64_t)pageButtonScrollingStyle
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  int v2 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusPageButtonScrollingStyle, @"FocusPageButtonScrollingStyle", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
  int64_t v3 = qword_1E8FD5558;
  if (v2) {
    int64_t v3 = 1;
  }
  if (v3 <= 3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)supportsTabKey
{
  return 0;
}

- (int64_t)indirectMovementPriority
{
  if (!B519BehaviorEnabled()) {
    return 0;
  }
  int v2 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_B519_ButtonPressesCancelMovement, @"B519_ButtonPressesCancelMovement", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  if (byte_1E8FD5544) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)shouldEnableFocusOnSelect
{
  return 0;
}

- (int64_t)deliverKeyEventsToFocusEngine
{
  return 1;
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
  return 1;
}

- (int64_t)focusSystemDeactivationMode
{
  return 1;
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
  return 0;
}

- (void)_handleRemoteTouchSurfaceTypeDidChangeNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:@"_UIFocusBehaviorDidChangeNotification" object:0];
}

@end