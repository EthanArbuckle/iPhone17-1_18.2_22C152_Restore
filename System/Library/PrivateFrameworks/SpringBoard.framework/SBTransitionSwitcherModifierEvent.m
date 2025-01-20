@interface SBTransitionSwitcherModifierEvent
- (BOOL)_isEnteringPageCenterWindowEvent;
- (BOOL)fromAppLayoutWantsExclusiveForeground;
- (BOOL)fromFloatingSwitcherVisible;
- (BOOL)isAnimated;
- (BOOL)isAnyPulseEvent;
- (BOOL)isAnySplitViewToOrFromSlideOverEvent;
- (BOOL)isAppLaunchDuringWindowDragGestureTransition;
- (BOOL)isBannerUnfurlTransition;
- (BOOL)isBreadcrumbTransition;
- (BOOL)isCenterWindowRemovalEvent;
- (BOOL)isCenterWindowToExistingSplitViewEvent;
- (BOOL)isCenterWindowToFullScreenEvent;
- (BOOL)isCenterWindowToNewSplitViewEvent;
- (BOOL)isCenterWindowToSlideOverEvent;
- (BOOL)isCenterWindowZoomingUpFromShelfEvent;
- (BOOL)isCommandTabTransition;
- (BOOL)isContinuityTransition;
- (BOOL)isContinuousExposeConfigurationChangeEvent;
- (BOOL)isDragAndDropTransition;
- (BOOL)isEnteringAnyPeekEvent;
- (BOOL)isEnteringSlideOverPeekEvent;
- (BOOL)isEnteringSplitViewPeekEvent;
- (BOOL)isExitingAnyPeekEvent;
- (BOOL)isExitingCenterWindowEvent;
- (BOOL)isExitingCenterWindowToOtherRoleEvent;
- (BOOL)isExitingSlideOverPeekEvent;
- (BOOL)isExitingSlideOverPeekToAppEvent;
- (BOOL)isExitingSlideOverPeekToHomeScreenEvent;
- (BOOL)isExitingSplitViewPeekEvent;
- (BOOL)isExitingSplitViewPeekToAppEvent;
- (BOOL)isExitingSplitViewPeekToHomeScreenEvent;
- (BOOL)isFloatingPulseEvent;
- (BOOL)isFullScreenToCenterWindowEvent;
- (BOOL)isFullScreenToSplitViewEvent;
- (BOOL)isGestureInitiated;
- (BOOL)isIconZoomDisabled;
- (BOOL)isKeyboardShortcutInitiated;
- (BOOL)isLaunchingFromDockTransition;
- (BOOL)isMainPulseEvent;
- (BOOL)isMorphFromInAppView;
- (BOOL)isMorphFromPIPTransition;
- (BOOL)isMorphToPIPTransition;
- (BOOL)isMoveDisplaysTransition;
- (BOOL)isNewSceneTransition;
- (BOOL)isPresentingPageCenterWindowEvent;
- (BOOL)isPrimaryToSlideOverEvent;
- (BOOL)isQuickActionTransition;
- (BOOL)isReplaceCenterWindowWithNewCenterWindowEvent;
- (BOOL)isShelfRequestTransition;
- (BOOL)isShelfTransition;
- (BOOL)isSideToSlideOverEvent;
- (BOOL)isSlideOverToCenterWindowEvent;
- (BOOL)isSlideOverToFullScreenEvent;
- (BOOL)isSlideOverToPrimaryEvent;
- (BOOL)isSlideOverToSideEvent;
- (BOOL)isSplitViewCrossfadeEvent;
- (BOOL)isSplitViewToCenterWindowEvent;
- (BOOL)isSpotlightTransition;
- (BOOL)isSwappingFullScreenAppSidesEvent;
- (BOOL)isTopAffordanceInitiated;
- (BOOL)isTransitionEvent;
- (BOOL)isZoomFromSystemApertureTransition;
- (BOOL)isiPadOSWindowingModeChangeEvent;
- (BOOL)prefersCenterZoomTransition;
- (BOOL)prefersCrossfadeTransition;
- (BOOL)toAppLayoutWantsExclusiveForeground;
- (BOOL)toFloatingSwitcherVisible;
- (CGPoint)fromCenterOfMovingDisplayItem;
- (CGPoint)toCenterOfMovingDisplayItem;
- (CGSize)fromSizeOfMovingDisplayItem;
- (CGSize)toSizeOfMovingDisplayItem;
- (NSArray)appLayoutsWithRemovalContexts;
- (NSDictionary)fromDisplayItemLayoutAttributesMap;
- (NSDictionary)toDisplayItemLayoutAttributesMap;
- (NSSet)fromDisplayItemsPendingTermination;
- (NSString)ambiguouslyLaunchedBundleIDIfAny;
- (NSString)fromAppExposeBundleID;
- (NSString)toAppExposeBundleID;
- (NSUUID)transitionID;
- (SBAppLayout)activatingAppLayout;
- (SBAppLayout)fromAppLayout;
- (SBAppLayout)fromFloatingAppLayout;
- (SBAppLayout)toAppLayout;
- (SBAppLayout)toFloatingAppLayout;
- (SBBannerUnfurlSourceContext)bannerUnfurlSourceContext;
- (SBConsumableTokenWrapper)zoomFromHardwareButtonPreludeTokenWrapper;
- (SBDisplayItem)movingDisplayItem;
- (SBSwitcherShelf)fromShelf;
- (SBSwitcherShelf)toShelf;
- (SBTransitionSwitcherModifierEvent)initWithTransitionID:(id)a3 phase:(unint64_t)a4 animated:(BOOL)a5;
- (SBTransitionSwitcherModifierMoveDisplaysContext)moveDisplaysContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugPredicateSummary;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)removalContextForAppLayout:(id)a3;
- (int64_t)dosidoTransitionDirection;
- (int64_t)fromEnvironmentMode;
- (int64_t)fromFloatingConfiguration;
- (int64_t)fromInterfaceOrientation;
- (int64_t)fromPeekConfiguration;
- (int64_t)fromSpaceConfiguration;
- (int64_t)fromWindowPickerRole;
- (int64_t)morphingPIPLayoutRole;
- (int64_t)toEnvironmentMode;
- (int64_t)toFloatingConfiguration;
- (int64_t)toInterfaceOrientation;
- (int64_t)toPeekConfiguration;
- (int64_t)toSpaceConfiguration;
- (int64_t)toWindowPickerRole;
- (int64_t)type;
- (unint64_t)phase;
- (void)dealloc;
- (void)setActivatingAppLayout:(id)a3;
- (void)setAmbiguouslyLaunchedBundleIDIfAny:(id)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setAppLaunchDuringWindowDragGestureTransition:(BOOL)a3;
- (void)setBannerUnfurlSourceContext:(id)a3;
- (void)setBannerUnfurlTransition:(BOOL)a3;
- (void)setBreadcrumbTransition:(BOOL)a3;
- (void)setCommandTabTransition:(BOOL)a3;
- (void)setContinuityTransition:(BOOL)a3;
- (void)setContinuousExposeConfigurationChangeEvent:(BOOL)a3;
- (void)setDosidoTransitionDirection:(int64_t)a3;
- (void)setDragAndDropTransition:(BOOL)a3;
- (void)setFromAppExposeBundleID:(id)a3;
- (void)setFromAppLayout:(id)a3;
- (void)setFromAppLayoutWantsExclusiveForeground:(BOOL)a3;
- (void)setFromCenterOfMovingDisplayItem:(CGPoint)a3;
- (void)setFromDisplayItemLayoutAttributesMap:(id)a3;
- (void)setFromDisplayItemsPendingTermination:(id)a3;
- (void)setFromEnvironmentMode:(int64_t)a3;
- (void)setFromFloatingAppLayout:(id)a3;
- (void)setFromFloatingConfiguration:(int64_t)a3;
- (void)setFromFloatingSwitcherVisible:(BOOL)a3;
- (void)setFromInterfaceOrientation:(int64_t)a3;
- (void)setFromPeekConfiguration:(int64_t)a3;
- (void)setFromSizeOfMovingDisplayItem:(CGSize)a3;
- (void)setFromSpaceConfiguration:(int64_t)a3;
- (void)setFromWindowPickerRole:(int64_t)a3;
- (void)setGestureInitiated:(BOOL)a3;
- (void)setIconZoomDisabled:(BOOL)a3;
- (void)setKeyboardShortcutInitiated:(BOOL)a3;
- (void)setLaunchingFromDockTransition:(BOOL)a3;
- (void)setMorphFromInAppView:(BOOL)a3;
- (void)setMorphFromPIPTransition:(BOOL)a3;
- (void)setMorphToPIPTransition:(BOOL)a3;
- (void)setMorphingPIPLayoutRole:(int64_t)a3;
- (void)setMoveDisplaysContext:(id)a3;
- (void)setMoveDisplaysTransition:(BOOL)a3;
- (void)setMovingDisplayItem:(id)a3;
- (void)setNewSceneTransition:(BOOL)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setPrefersCenterZoomTransition:(BOOL)a3;
- (void)setPrefersCrossfadeTransition:(BOOL)a3;
- (void)setQuickActionTransition:(BOOL)a3;
- (void)setRemovalContext:(id)a3 forAppLayout:(id)a4;
- (void)setShelfRequestTransition:(BOOL)a3;
- (void)setShelfTransition:(BOOL)a3;
- (void)setSpotlightTransition:(BOOL)a3;
- (void)setToAppExposeBundleID:(id)a3;
- (void)setToAppLayout:(id)a3;
- (void)setToAppLayoutWantsExclusiveForeground:(BOOL)a3;
- (void)setToCenterOfMovingDisplayItem:(CGPoint)a3;
- (void)setToDisplayItemLayoutAttributesMap:(id)a3;
- (void)setToEnvironmentMode:(int64_t)a3;
- (void)setToFloatingAppLayout:(id)a3;
- (void)setToFloatingConfiguration:(int64_t)a3;
- (void)setToFloatingSwitcherVisible:(BOOL)a3;
- (void)setToInterfaceOrientation:(int64_t)a3;
- (void)setToPeekConfiguration:(int64_t)a3;
- (void)setToSizeOfMovingDisplayItem:(CGSize)a3;
- (void)setToSpaceConfiguration:(int64_t)a3;
- (void)setToWindowPickerRole:(int64_t)a3;
- (void)setTopAffordanceInitiated:(BOOL)a3;
- (void)setZoomFromHardwareButtonPreludeTokenWrapper:(id)a3;
- (void)setZoomFromSystemApertureTransition:(BOOL)a3;
- (void)setiPadOSWindowingModeChangeEvent:(BOOL)a3;
@end

@implementation SBTransitionSwitcherModifierEvent

- (int64_t)type
{
  return 1;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (int64_t)toEnvironmentMode
{
  return self->_toEnvironmentMode;
}

- (BOOL)toFloatingSwitcherVisible
{
  return self->_toFloatingSwitcherVisible;
}

- (SBAppLayout)toFloatingAppLayout
{
  return self->_toFloatingAppLayout;
}

- (BOOL)isMoveDisplaysTransition
{
  return self->_moveDisplaysTransition;
}

- (void)setiPadOSWindowingModeChangeEvent:(BOOL)a3
{
  self->_iPadOSWindowingModeChangeEvent = a3;
}

- (void)setZoomFromSystemApertureTransition:(BOOL)a3
{
  self->_zoomFromSystemApertureTransition = a3;
}

- (void)setTopAffordanceInitiated:(BOOL)a3
{
  self->_topAffordanceInitiated = a3;
}

- (void)setToWindowPickerRole:(int64_t)a3
{
  self->_toWindowPickerRole = a3;
}

- (void)setToSpaceConfiguration:(int64_t)a3
{
  self->_toSpaceConfiguration = a3;
}

- (void)setToPeekConfiguration:(int64_t)a3
{
  self->_toPeekConfiguration = a3;
}

- (void)setToInterfaceOrientation:(int64_t)a3
{
  self->_toInterfaceOrientation = a3;
}

- (void)setToFloatingSwitcherVisible:(BOOL)a3
{
  self->_toFloatingSwitcherVisible = a3;
}

- (void)setToFloatingConfiguration:(int64_t)a3
{
  self->_toFloatingConfiguration = a3;
}

- (void)setToFloatingAppLayout:(id)a3
{
}

- (void)setToEnvironmentMode:(int64_t)a3
{
  self->_toEnvironmentMode = a3;
}

- (void)setToAppLayoutWantsExclusiveForeground:(BOOL)a3
{
  self->_toAppLayoutWantsExclusiveForeground = a3;
}

- (void)setToAppLayout:(id)a3
{
}

- (void)setToAppExposeBundleID:(id)a3
{
}

- (void)setSpotlightTransition:(BOOL)a3
{
  self->_spotlightTransition = a3;
}

- (void)setShelfTransition:(BOOL)a3
{
  self->_shelfTransition = a3;
}

- (void)setShelfRequestTransition:(BOOL)a3
{
  self->_shelfRequestTransition = a3;
}

- (void)setQuickActionTransition:(BOOL)a3
{
  self->_quickActionTransition = a3;
}

- (void)setPrefersCrossfadeTransition:(BOOL)a3
{
  self->_prefersCrossfadeTransition = a3;
}

- (void)setPrefersCenterZoomTransition:(BOOL)a3
{
  self->_prefersCenterZoomTransition = a3;
}

- (void)setNewSceneTransition:(BOOL)a3
{
  self->_newSceneTransition = a3;
}

- (void)setMoveDisplaysTransition:(BOOL)a3
{
  self->_moveDisplaysTransition = a3;
}

- (void)setMorphingPIPLayoutRole:(int64_t)a3
{
  self->_morphingPIPLayoutRole = a3;
}

- (void)setMorphToPIPTransition:(BOOL)a3
{
  self->_morphToPIPTransition = a3;
}

- (void)setMorphFromInAppView:(BOOL)a3
{
  self->_morphFromInAppView = a3;
}

- (void)setLaunchingFromDockTransition:(BOOL)a3
{
  self->_launchingFromDockTransition = a3;
}

- (void)setKeyboardShortcutInitiated:(BOOL)a3
{
  self->_keyboardShortcutInitiated = a3;
}

- (void)setIconZoomDisabled:(BOOL)a3
{
  self->_iconZoomDisabled = a3;
}

- (void)setGestureInitiated:(BOOL)a3
{
  self->_gestureInitiated = a3;
}

- (void)setFromWindowPickerRole:(int64_t)a3
{
  self->_fromWindowPickerRole = a3;
}

- (void)setFromSpaceConfiguration:(int64_t)a3
{
  self->_fromSpaceConfiguration = a3;
}

- (void)setFromPeekConfiguration:(int64_t)a3
{
  self->_fromPeekConfiguration = a3;
}

- (void)setFromInterfaceOrientation:(int64_t)a3
{
  self->_fromInterfaceOrientation = a3;
}

- (void)setFromFloatingSwitcherVisible:(BOOL)a3
{
  self->_fromFloatingSwitcherVisible = a3;
}

- (void)setFromFloatingConfiguration:(int64_t)a3
{
  self->_fromFloatingConfiguration = a3;
}

- (void)setFromFloatingAppLayout:(id)a3
{
}

- (void)setFromEnvironmentMode:(int64_t)a3
{
  self->_fromEnvironmentMode = a3;
}

- (void)setFromDisplayItemsPendingTermination:(id)a3
{
}

- (void)setFromAppLayoutWantsExclusiveForeground:(BOOL)a3
{
  self->_fromAppLayoutWantsExclusiveForeground = a3;
}

- (void)setFromAppLayout:(id)a3
{
}

- (void)setFromAppExposeBundleID:(id)a3
{
}

- (void)setDragAndDropTransition:(BOOL)a3
{
  self->_dragAndDropTransition = a3;
}

- (void)setContinuousExposeConfigurationChangeEvent:(BOOL)a3
{
  self->_continuousExposeConfigurationChangeEvent = a3;
}

- (void)setContinuityTransition:(BOOL)a3
{
  self->_continuityTransition = a3;
}

- (void)setCommandTabTransition:(BOOL)a3
{
  self->_commandTabTransition = a3;
}

- (void)setBreadcrumbTransition:(BOOL)a3
{
  self->_breadcrumbTransition = a3;
}

- (void)setBannerUnfurlTransition:(BOOL)a3
{
  self->_bannerUnfurlTransition = a3;
}

- (void)setBannerUnfurlSourceContext:(id)a3
{
}

- (void)setAppLaunchDuringWindowDragGestureTransition:(BOOL)a3
{
  self->_appLaunchDuringWindowDragGestureTransition = a3;
}

- (void)setActivatingAppLayout:(id)a3
{
}

- (SBTransitionSwitcherModifierEvent)initWithTransitionID:(id)a3 phase:(unint64_t)a4 animated:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBTransitionSwitcherModifierEvent;
  v10 = [(SBTransitionSwitcherModifierEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_transitionID, a3);
    v11->_phase = a4;
    v11->_animated = a5;
  }

  return v11;
}

- (SBConsumableTokenWrapper)zoomFromHardwareButtonPreludeTokenWrapper
{
  return self->_zoomFromHardwareButtonPreludeTokenWrapper;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (BOOL)isTransitionEvent
{
  return 1;
}

- (int64_t)toWindowPickerRole
{
  return self->_toWindowPickerRole;
}

- (NSUUID)transitionID
{
  return self->_transitionID;
}

- (BOOL)isDragAndDropTransition
{
  return self->_dragAndDropTransition;
}

- (BOOL)isAnySplitViewToOrFromSlideOverEvent
{
  v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  v4 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  v5 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingAppLayout];
  v6 = [(SBTransitionSwitcherModifierEvent *)self toFloatingAppLayout];
  v18 = [v3 itemForLayoutRole:1];
  v7 = [v4 itemForLayoutRole:1];
  v8 = [v3 itemForLayoutRole:2];
  id v9 = [v4 itemForLayoutRole:2];
  v10 = [v5 itemForLayoutRole:1];
  uint64_t v11 = [v6 itemForLayoutRole:1];
  v12 = (void *)v11;
  if (v8) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v15 = 1;
  if (v13 || (char v16 = [v8 isEqual:v11], (v16 & 1) == 0 && (objc_msgSend(v18, "isEqual:", v12) & 1) == 0))
  {
    BOOL v14 = !v9 || v10 == 0;
    if (v14 || ([v9 isEqual:v10] & 1) == 0 && (objc_msgSend(v7, "isEqual:", v10) & 1) == 0) {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (SBAppLayout)fromFloatingAppLayout
{
  return self->_fromFloatingAppLayout;
}

- (BOOL)isBannerUnfurlTransition
{
  return self->_bannerUnfurlTransition;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (int64_t)fromEnvironmentMode
{
  return self->_fromEnvironmentMode;
}

- (NSSet)fromDisplayItemsPendingTermination
{
  return self->_fromDisplayItemsPendingTermination;
}

- (NSString)toAppExposeBundleID
{
  return self->_toAppExposeBundleID;
}

- (BOOL)isBreadcrumbTransition
{
  return self->_breadcrumbTransition;
}

- (BOOL)prefersCenterZoomTransition
{
  return self->_prefersCenterZoomTransition;
}

- (BOOL)isZoomFromSystemApertureTransition
{
  return self->_zoomFromSystemApertureTransition;
}

- (BOOL)isSpotlightTransition
{
  return self->_spotlightTransition;
}

- (BOOL)isMorphFromPIPTransition
{
  return self->_morphFromPIPTransition;
}

- (BOOL)isIconZoomDisabled
{
  return self->_iconZoomDisabled;
}

- (BOOL)isExitingSlideOverPeekToAppEvent
{
  uint64_t v3 = [(SBTransitionSwitcherModifierEvent *)self toFloatingConfiguration];
  BOOL v4 = [(SBTransitionSwitcherModifierEvent *)self isExitingSlideOverPeekEvent];
  BOOL result = 0;
  if (v4)
  {
    if (v3) {
      return !SBFloatingConfigurationIsStashed(v3);
    }
  }
  return result;
}

- (BOOL)isExitingSlideOverPeekToHomeScreenEvent
{
  uint64_t v3 = [(SBTransitionSwitcherModifierEvent *)self toFloatingConfiguration];
  BOOL v4 = [(SBTransitionSwitcherModifierEvent *)self isExitingSlideOverPeekEvent];
  if (v4)
  {
    if (v3)
    {
      LOBYTE(v4) = SBFloatingConfigurationIsStashed(v3);
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (int64_t)toFloatingConfiguration
{
  return self->_toFloatingConfiguration;
}

- (BOOL)isEnteringAnyPeekEvent
{
  if (SBPeekConfigurationIsValid([(SBTransitionSwitcherModifierEvent *)self fromPeekConfiguration])) {
    return 0;
  }
  uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toPeekConfiguration];
  return SBPeekConfigurationIsValid(v4);
}

- (BOOL)isExitingSlideOverPeekEvent
{
  if (![(SBTransitionSwitcherModifierEvent *)self isExitingAnyPeekEvent]) {
    return 0;
  }
  uint64_t v3 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingAppLayout];
  uint64_t v4 = [v3 itemForLayoutRole:1];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isExitingAnyPeekEvent
{
  BOOL IsValid = SBPeekConfigurationIsValid([(SBTransitionSwitcherModifierEvent *)self fromPeekConfiguration]);
  if (IsValid) {
    LOBYTE(IsValid) = !SBPeekConfigurationIsValid([(SBTransitionSwitcherModifierEvent *)self toPeekConfiguration]);
  }
  return IsValid;
}

- (int64_t)fromPeekConfiguration
{
  return self->_fromPeekConfiguration;
}

- (int64_t)toPeekConfiguration
{
  return self->_toPeekConfiguration;
}

- (int64_t)toInterfaceOrientation
{
  return self->_toInterfaceOrientation;
}

- (int64_t)fromInterfaceOrientation
{
  return self->_fromInterfaceOrientation;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v81.receiver = self;
  v81.super_class = (Class)SBTransitionSwitcherModifierEvent;
  uint64_t v4 = [(SBSwitcherModifierEvent *)&v81 descriptionBuilderWithMultilinePrefix:a3];
  BOOL v5 = [(NSUUID *)self->_transitionID UUIDString];
  [v4 appendString:v5 withName:@"transitionID"];

  unint64_t v6 = self->_phase - 1;
  if (v6 > 2) {
    v7 = @"Possible";
  }
  else {
    v7 = off_1E6AF9E70[v6];
  }
  [v4 appendString:v7 withName:@"phase"];
  v8 = NSStringFromBOOL();
  [v4 appendString:v8 withName:@"animated"];

  if ((BSEqualObjects() & 1) == 0)
  {
    id v9 = [(SBAppLayout *)self->_fromAppLayout succinctDescription];
    id v10 = (id)[v4 appendObject:v9 withName:@"fromAppLayout"];

    uint64_t v11 = [(SBAppLayout *)self->_toAppLayout succinctDescription];
    id v12 = (id)[v4 appendObject:v11 withName:@"toAppLayout"];
  }
  unint64_t fromEnvironmentMode = self->_fromEnvironmentMode;
  if (fromEnvironmentMode != self->_toEnvironmentMode)
  {
    BOOL v14 = SBStringForUnlockedEnvironmentMode(fromEnvironmentMode);
    [v4 appendString:v14 withName:@"fromEnvironmentMode"];

    BOOL v15 = SBStringForUnlockedEnvironmentMode(self->_toEnvironmentMode);
    [v4 appendString:v15 withName:@"toEnvironmentMode"];
  }
  int64_t fromInterfaceOrientation = self->_fromInterfaceOrientation;
  if (fromInterfaceOrientation != self->_toInterfaceOrientation)
  {
    if (fromInterfaceOrientation == 1)
    {
      v19 = @"UIInterfaceOrientationPortrait";
    }
    else
    {
      v17 = @"UIInterfaceOrientationLandscapeLeft";
      if (fromInterfaceOrientation == 2) {
        v18 = @"UIInterfaceOrientationPortraitUpsideDown";
      }
      else {
        v18 = 0;
      }
      if (fromInterfaceOrientation != 4) {
        v17 = v18;
      }
      if (fromInterfaceOrientation == 3) {
        v19 = @"UIInterfaceOrientationLandscapeRight";
      }
      else {
        v19 = v17;
      }
    }
    [v4 appendString:v19 withName:@"fromOrientation"];
    int64_t toInterfaceOrientation = self->_toInterfaceOrientation;
    if (toInterfaceOrientation == 1)
    {
      v23 = @"UIInterfaceOrientationPortrait";
    }
    else
    {
      v21 = @"UIInterfaceOrientationLandscapeLeft";
      if (toInterfaceOrientation == 2) {
        v22 = @"UIInterfaceOrientationPortraitUpsideDown";
      }
      else {
        v22 = 0;
      }
      if (toInterfaceOrientation != 4) {
        v21 = v22;
      }
      if (toInterfaceOrientation == 3) {
        v23 = @"UIInterfaceOrientationLandscapeRight";
      }
      else {
        v23 = v21;
      }
    }
    [v4 appendString:v23 withName:@"toOrientation"];
  }
  int64_t fromWindowPickerRole = self->_fromWindowPickerRole;
  if (fromWindowPickerRole != self->_toWindowPickerRole)
  {
    v25 = SBLayoutRoleDescription(fromWindowPickerRole);
    [v4 appendString:v25 withName:@"fromWindowPickerRole"];

    v26 = SBLayoutRoleDescription(self->_toWindowPickerRole);
    [v4 appendString:v26 withName:@"toWindowPickerRole"];
  }
  id v27 = (id)[v4 appendBool:self->_fromAppLayoutWantsExclusiveForeground withName:@"fromAppLayoutWantsExclusiveForeground" ifEqualTo:1];
  id v28 = (id)[v4 appendBool:self->_toAppLayoutWantsExclusiveForeground withName:@"toAppLayoutWantsExclusiveForeground" ifEqualTo:1];
  fromFloatingAppLayout = self->_fromFloatingAppLayout;
  if (fromFloatingAppLayout != self->_toFloatingAppLayout)
  {
    v30 = [(SBAppLayout *)fromFloatingAppLayout succinctDescription];
    id v31 = (id)[v4 appendObject:v30 withName:@"fromFloatingAppLayout"];

    v32 = [(SBAppLayout *)self->_toFloatingAppLayout succinctDescription];
    id v33 = (id)[v4 appendObject:v32 withName:@"toFloatingAppLayout"];
  }
  unint64_t fromFloatingConfiguration = self->_fromFloatingConfiguration;
  if (fromFloatingConfiguration != self->_toFloatingConfiguration)
  {
    v35 = SBStringForFloatingConfiguration(fromFloatingConfiguration);
    [v4 appendString:v35 withName:@"fromFloatingConfiguration"];

    v36 = SBStringForFloatingConfiguration(self->_toFloatingConfiguration);
    [v4 appendString:v36 withName:@"toFloatingConfiguration"];
  }
  if (self->_fromFloatingSwitcherVisible != self->_toFloatingSwitcherVisible)
  {
    v37 = NSStringFromBOOL();
    [v4 appendString:v37 withName:@"fromFloatingSwitcherVisible"];

    v38 = NSStringFromBOOL();
    [v4 appendString:v38 withName:@"toFloatingSwitcherVisible"];
  }
  if ((BSEqualStrings() & 1) == 0)
  {
    [v4 appendString:self->_fromAppExposeBundleID withName:@"fromAppExposeBundleID"];
    [v4 appendString:self->_toAppExposeBundleID withName:@"toAppExposeBundleID"];
  }
  [v4 appendString:self->_ambiguouslyLaunchedBundleIDIfAny withName:@"ambiguouslyLaunchedBundleIDIfAny" skipIfEmpty:1];
  unint64_t fromPeekConfiguration = self->_fromPeekConfiguration;
  if (fromPeekConfiguration != self->_toPeekConfiguration)
  {
    v40 = SBStringForPeekConfiguration(fromPeekConfiguration);
    [v4 appendString:v40 withName:@"fromPeekConfiguration"];

    v41 = SBStringForPeekConfiguration(self->_toPeekConfiguration);
    [v4 appendString:v41 withName:@"toPeekConfiguration"];
  }
  unint64_t fromSpaceConfiguration = self->_fromSpaceConfiguration;
  if (fromSpaceConfiguration != self->_toSpaceConfiguration)
  {
    v43 = SBStringForSpaceConfiguration(fromSpaceConfiguration);
    [v4 appendString:v43 withName:@"fromSpaceConfiguration"];

    v44 = SBStringForSpaceConfiguration(self->_toSpaceConfiguration);
    [v4 appendString:v44 withName:@"toSpaceConfiguration"];
  }
  id v45 = (id)[v4 appendObject:self->_bannerUnfurlSourceContext withName:@"bannerUnfurlSourceContext" skipIfNil:1];
  id v46 = (id)[v4 appendBool:self->_prefersCrossfadeTransition withName:@"prefersCrossfadeTransition" ifEqualTo:1];
  if ([(NSMutableDictionary *)self->_appLayoutToRemovalContext count]) {
    [v4 appendString:@"YES" withName:@"isEntityDestructionTransition"];
  }
  id v47 = (id)[v4 appendObject:self->_fromDisplayItemsPendingTermination withName:@"pendingTermination" skipIfNil:1];
  activatingAppLayout = self->_activatingAppLayout;
  if (activatingAppLayout)
  {
    v49 = [(SBAppLayout *)activatingAppLayout succinctDescription];
    id v50 = (id)[v4 appendObject:v49 withName:@"activating"];
  }
  if ((BSEqualObjects() & 1) == 0)
  {
    id v51 = (id)[v4 appendObject:self->_fromDisplayItemLayoutAttributesMap withName:@"fromDisplayItemLayoutAttributesMap"];
    id v52 = (id)[v4 appendObject:self->_toDisplayItemLayoutAttributesMap withName:@"toDisplayItemLayoutAttributesMap"];
  }
  id v53 = (id)[v4 appendObject:self->_moveDisplaysContext withName:@"moveDisplaysContext" skipIfNil:1];
  id v54 = (id)[v4 appendBool:self->_gestureInitiated withName:@"isGestureInitiated" ifEqualTo:1];
  id v55 = (id)[v4 appendBool:self->_keyboardShortcutInitiated withName:@"isKeyboardShortcutInitiated" ifEqualTo:1];
  id v56 = (id)[v4 appendBool:self->_topAffordanceInitiated withName:@"isTopAffordanceInitiated" ifEqualTo:1];
  id v57 = (id)[v4 appendBool:self->_dragAndDropTransition withName:@"isDragAndDropTransition" ifEqualTo:1];
  id v58 = (id)[v4 appendBool:self->_breadcrumbTransition withName:@"isBreadcrumbTransition" ifEqualTo:1];
  id v59 = (id)[v4 appendBool:self->_morphToPIPTransition withName:@"isMorphToPIPTransition" ifEqualTo:1];
  id v60 = (id)[v4 appendBool:self->_morphFromPIPTransition withName:@"isMorphFromPIPTransition" ifEqualTo:1];
  v61 = SBLayoutRoleDescription(self->_morphingPIPLayoutRole);
  [v4 appendString:v61 withName:@"morphingPIPLayoutRole"];

  id v62 = (id)[v4 appendBool:self->_zoomFromSystemApertureTransition withName:@"isZoomFromSystemApertureTransition" ifEqualTo:1];
  id v63 = (id)[v4 appendBool:self->_continuityTransition withName:@"isContinuityTransition" ifEqualTo:1];
  id v64 = (id)[v4 appendBool:self->_bannerUnfurlTransition withName:@"isBannerUnfurlTransition" ifEqualTo:1];
  id v65 = (id)[v4 appendBool:self->_iconZoomDisabled withName:@"isIconZoomDisabled" ifEqualTo:1];
  id v66 = (id)[v4 appendBool:self->_spotlightTransition withName:@"isSpotlightTransition" ifEqualTo:1];
  id v67 = (id)[v4 appendBool:self->_shelfTransition withName:@"isShelfTransition" ifEqualTo:1];
  int64_t dosidoTransitionDirection = self->_dosidoTransitionDirection;
  if (dosidoTransitionDirection) {
    id v69 = (id)[v4 appendInteger:dosidoTransitionDirection withName:@"dosidoTransitionDirection"];
  }
  id v70 = (id)[v4 appendBool:self->_shelfRequestTransition withName:@"isShelfRequestTransition" ifEqualTo:1];
  id v71 = (id)[v4 appendBool:self->_morphFromInAppView withName:@"isMorphFromInAppView" ifEqualTo:1];
  id v72 = (id)[v4 appendBool:self->_quickActionTransition withName:@"isQuickActionTransition" ifEqualTo:1];
  id v73 = (id)[v4 appendBool:self->_newSceneTransition withName:@"isNewSceneTransition" ifEqualTo:1];
  id v74 = (id)[v4 appendBool:self->_moveDisplaysTransition withName:@"isMoveDisplaysTransition" ifEqualTo:1];
  id v75 = (id)[v4 appendBool:self->_continuousExposeConfigurationChangeEvent withName:@"isContinuousExposeConfigurationChangeEvent" ifEqualTo:1];
  id v76 = (id)[v4 appendBool:self->_iPadOSWindowingModeChangeEvent withName:@"iPadOSWindowingModeChangeEvent" ifEqualTo:1];
  id v77 = (id)[v4 appendBool:self->_commandTabTransition withName:@"isCommandTabTransition" ifEqualTo:1];
  id v78 = (id)[v4 appendBool:self->_launchingFromDockTransition withName:@"isLaunchingFromDockTransition" ifEqualTo:1];
  id v79 = (id)[v4 appendBool:self->_appLaunchDuringWindowDragGestureTransition withName:@"isAppLaunchDuringWindowDragGestureTransition" ifEqualTo:1];
  return v4;
}

- (void)dealloc
{
  uint64_t v3 = [(SBConsumableTokenWrapper *)self->_zoomFromHardwareButtonPreludeTokenWrapper consumeToken];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)SBTransitionSwitcherModifierEvent;
  [(SBTransitionSwitcherModifierEvent *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movingDisplayItem, 0);
  objc_storeStrong((id *)&self->_moveDisplaysContext, 0);
  objc_storeStrong((id *)&self->_toDisplayItemLayoutAttributesMap, 0);
  objc_storeStrong((id *)&self->_fromDisplayItemLayoutAttributesMap, 0);
  objc_storeStrong((id *)&self->_activatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fromDisplayItemsPendingTermination, 0);
  objc_storeStrong((id *)&self->_zoomFromHardwareButtonPreludeTokenWrapper, 0);
  objc_storeStrong((id *)&self->_bannerUnfurlSourceContext, 0);
  objc_storeStrong((id *)&self->_ambiguouslyLaunchedBundleIDIfAny, 0);
  objc_storeStrong((id *)&self->_toAppExposeBundleID, 0);
  objc_storeStrong((id *)&self->_fromAppExposeBundleID, 0);
  objc_storeStrong((id *)&self->_toFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fromFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_transitionID, 0);
  objc_storeStrong((id *)&self->_appLayoutToRemovalContext, 0);
}

- (NSArray)appLayoutsWithRemovalContexts
{
  return (NSArray *)[(NSMutableDictionary *)self->_appLayoutToRemovalContext allKeys];
}

- (id)removalContextForAppLayout:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_appLayoutToRemovalContext objectForKey:a3];
}

- (void)setRemovalContext:(id)a3 forAppLayout:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v13;
  id v8 = v6;
  appLayoutToRemovalContext = self->_appLayoutToRemovalContext;
  if (v13)
  {
    if (!appLayoutToRemovalContext)
    {
      id v10 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      uint64_t v11 = self->_appLayoutToRemovalContext;
      self->_appLayoutToRemovalContext = v10;

      id v7 = v13;
      appLayoutToRemovalContext = self->_appLayoutToRemovalContext;
    }
    [(NSMutableDictionary *)appLayoutToRemovalContext setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)appLayoutToRemovalContext removeObjectForKey:v8];
    if (![(NSMutableDictionary *)self->_appLayoutToRemovalContext count])
    {
      id v12 = self->_appLayoutToRemovalContext;
      self->_appLayoutToRemovalContext = 0;
    }
  }
}

- (SBSwitcherShelf)fromShelf
{
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self fromEnvironmentMode];
  int64_t v4 = [(SBTransitionSwitcherModifierEvent *)self fromWindowPickerRole];
  if (v3 != 3) {
    goto LABEL_10;
  }
  if (self->_fromAppExposeBundleID)
  {
    BOOL v5 = [[SBSwitcherShelf alloc] initWithBundleIdentifier:self->_fromAppExposeBundleID layoutRole:0 displayMode:0];
    goto LABEL_11;
  }
  int64_t v6 = v4;
  if (v4 == 3)
  {
    id v7 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingAppLayout];
    id v8 = v7;
    uint64_t v9 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_10;
    }
    id v7 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
    id v8 = v7;
    uint64_t v9 = v6;
  }
  id v10 = [v7 itemForLayoutRole:v9];
  uint64_t v11 = [v10 bundleIdentifier];

  if (v11)
  {
    BOOL v5 = [[SBSwitcherShelf alloc] initWithBundleIdentifier:v11 layoutRole:v6 displayMode:1];

    goto LABEL_11;
  }
LABEL_10:
  BOOL v5 = 0;
LABEL_11:
  return v5;
}

- (SBSwitcherShelf)toShelf
{
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self toEnvironmentMode];
  int64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toWindowPickerRole];
  if (v3 != 3) {
    goto LABEL_5;
  }
  if (self->_toAppExposeBundleID)
  {
    BOOL v5 = [[SBSwitcherShelf alloc] initWithBundleIdentifier:self->_toAppExposeBundleID layoutRole:0 displayMode:0];
    goto LABEL_6;
  }
  int64_t v6 = v4;
  if (v4)
  {
    id v8 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
    uint64_t v9 = [v8 itemForLayoutRole:v6];
    id v10 = [v9 bundleIdentifier];

    BOOL v5 = [[SBSwitcherShelf alloc] initWithBundleIdentifier:v10 layoutRole:v6 displayMode:1];
  }
  else
  {
LABEL_5:
    BOOL v5 = 0;
  }
LABEL_6:
  return v5;
}

- (BOOL)isEnteringSplitViewPeekEvent
{
  if (![(SBTransitionSwitcherModifierEvent *)self isEnteringAnyPeekEvent]) {
    return 0;
  }
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  int64_t v4 = [v3 itemForLayoutRole:1];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isExitingSplitViewPeekEvent
{
  if (![(SBTransitionSwitcherModifierEvent *)self isExitingAnyPeekEvent]) {
    return 0;
  }
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isExitingSplitViewPeekToAppEvent
{
  if (![(SBTransitionSwitcherModifierEvent *)self isExitingSplitViewPeekEvent]) {
    return 0;
  }
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  BOOL v4 = [v3 itemForLayoutRole:1];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isExitingSplitViewPeekToHomeScreenEvent
{
  if (![(SBTransitionSwitcherModifierEvent *)self isExitingSplitViewPeekEvent]) {
    return 0;
  }
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)isEnteringSlideOverPeekEvent
{
  if (![(SBTransitionSwitcherModifierEvent *)self isEnteringAnyPeekEvent]) {
    return 0;
  }
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  BOOL v4 = [v3 itemForLayoutRole:1];
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    int64_t v6 = [(SBTransitionSwitcherModifierEvent *)self toFloatingAppLayout];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (BOOL)isExitingCenterWindowEvent
{
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  if ([v3 centerConfiguration])
  {
    BOOL v4 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
    BOOL v5 = [v4 centerConfiguration] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isExitingCenterWindowToOtherRoleEvent
{
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  BOOL v4 = [v3 itemForLayoutRole:4];

  char v5 = 0;
  if ([(SBTransitionSwitcherModifierEvent *)self isExitingCenterWindowEvent] && v4)
  {
    int64_t v6 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
    if ([v6 containsItem:v4])
    {
      char v5 = 1;
    }
    else
    {
      id v7 = [(SBTransitionSwitcherModifierEvent *)self toFloatingAppLayout];
      char v5 = [v7 containsItem:v4];
    }
  }

  return v5;
}

- (BOOL)isCenterWindowRemovalEvent
{
  if (![(SBTransitionSwitcherModifierEvent *)self isExitingCenterWindowEvent]
    || [(SBTransitionSwitcherModifierEvent *)self isExitingCenterWindowToOtherRoleEvent])
  {
    return 0;
  }
  BOOL v4 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  char v5 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  char v6 = [v4 hasSameItemsInLayoutRoles:6 asAppLayout:v5];

  return v6;
}

- (BOOL)isCenterWindowToFullScreenEvent
{
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingAppLayout];
  BOOL v4 = [(SBTransitionSwitcherModifierEvent *)self toFloatingAppLayout];
  if ([(SBTransitionSwitcherModifierEvent *)self isExitingCenterWindowToOtherRoleEvent])
  {
    char v5 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
    if ([v5 configuration] == 1)
    {
      if (v3 == v4) {
        char v6 = 1;
      }
      else {
        char v6 = [v3 isEqual:v4];
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isCenterWindowToSlideOverEvent
{
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self toFloatingAppLayout];
  LOBYTE(v4) = 0;
  if ([(SBTransitionSwitcherModifierEvent *)self isExitingCenterWindowToOtherRoleEvent]&& v3)
  {
    char v5 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingAppLayout];
    int v4 = [v3 isEqual:v5] ^ 1;
  }
  return v4;
}

- (BOOL)isCenterWindowToNewSplitViewEvent
{
  if (![(SBTransitionSwitcherModifierEvent *)self isExitingCenterWindowToOtherRoleEvent])return 0; {
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  }
  if ([v3 configuration] == 1)
  {
    int v4 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
    char v5 = [v4 isSplitConfiguration];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isCenterWindowToExistingSplitViewEvent
{
  if ([(SBTransitionSwitcherModifierEvent *)self isExitingCenterWindowToOtherRoleEvent])
  {
    int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
    if ([v3 isSplitConfiguration])
    {
      int v4 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
      if ([v4 isSplitConfiguration])
      {
        char v5 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
        char v6 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
        int v7 = [v5 isEqual:v6] ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)_isEnteringPageCenterWindowEvent
{
  int64_t v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  uint64_t v4 = [v3 centerConfiguration];

  char v5 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  uint64_t v6 = [v5 centerConfiguration];

  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = (unint64_t)(v6 - 1) >= 2;
  }
  return !v7;
}

- (BOOL)isPresentingPageCenterWindowEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self _isEnteringPageCenterWindowEvent];
  if (v3)
  {
    uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
    char v5 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
    char v6 = [v4 hasSameItemsInLayoutRoles:6 asAppLayout:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isReplaceCenterWindowWithNewCenterWindowEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  if ([v3 centerConfiguration] == 1
    && [v4 centerConfiguration] == 1
    && ([v3 hasSameItemsInLayoutRoles:16 asAppLayout:v4] & 1) == 0)
  {
    char v5 = [v3 hasSameItemsInLayoutRoles:6 asAppLayout:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isSplitViewToCenterWindowEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  char v5 = [v4 itemForLayoutRole:4];
  if ([(SBTransitionSwitcherModifierEvent *)self _isEnteringPageCenterWindowEvent]
    && (uint64_t v6 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration([v3 configuration]),
        SBSpaceConfigurationIsSplitView(v6))
    && [v4 configuration] == 1)
  {
    BOOL v7 = [v3 itemForLayoutRole:1];
    if ([v7 isEqual:v5])
    {
      char v8 = 1;
    }
    else
    {
      id v10 = [v3 itemForLayoutRole:2];
      char v8 = [v10 isEqual:v5];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isSlideOverToCenterWindowEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  if ([v3 centerConfiguration])
  {
    uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
    char v5 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
    if ([v4 hasSameItemsInLayoutRoles:16 asAppLayout:v5])
    {
      char v6 = 0;
    }
    else
    {
      BOOL v7 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
      char v8 = [v7 itemForLayoutRole:4];
      uint64_t v9 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingAppLayout];
      id v10 = [v9 itemForLayoutRole:1];
      char v6 = [v8 isEqual:v10];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isFullScreenToCenterWindowEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  uint64_t v4 = [v3 itemForLayoutRole:1];

  char v5 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  char v6 = [v5 itemForLayoutRole:4];

  BOOL v7 = 0;
  if ([(SBTransitionSwitcherModifierEvent *)self _isEnteringPageCenterWindowEvent])
  {
    if (v4) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      if ([v4 isEqual:v6])
      {
        uint64_t v9 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
        BOOL v7 = [v9 configuration] == 1;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
  }

  return v7;
}

- (BOOL)isSwappingFullScreenAppSidesEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  char v5 = [v3 itemForLayoutRole:1];
  char v6 = [v3 itemForLayoutRole:2];
  BOOL v7 = [v4 itemForLayoutRole:1];
  uint64_t v8 = [v4 itemForLayoutRole:2];
  uint64_t v9 = (void *)v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v12 = v10 || v7 == 0 || v8 == 0;
  if (v12 || ![v5 isEqual:v8]) {
    char v13 = 0;
  }
  else {
    char v13 = [v6 isEqual:v7];
  }

  return v13;
}

- (BOOL)isCenterWindowZoomingUpFromShelfEvent
{
  if (![(SBTransitionSwitcherModifierEvent *)self isShelfTransition]) {
    return 0;
  }
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  uint64_t v4 = [v3 itemForLayoutRole:4];
  if (v4)
  {
    char v5 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
    char v6 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
    if ([v5 hasSameItemsInLayoutRoles:16 asAppLayout:v6])
    {
      char v7 = 0;
    }
    else
    {
      uint64_t v8 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
      uint64_t v9 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
      char v7 = [v8 hasSameItemsInLayoutRoles:6 asAppLayout:v9];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isAnyPulseEvent
{
  if ([(SBTransitionSwitcherModifierEvent *)self isMainPulseEvent]) {
    return 1;
  }
  return [(SBTransitionSwitcherModifierEvent *)self isFloatingPulseEvent];
}

- (BOOL)isMainPulseEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self activatingAppLayout];
  if (v3)
  {
    uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
    char v5 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
    if ((BSEqualObjects() & 1) == 0)
    {

      char v9 = 0;
      goto LABEL_7;
    }
    char v6 = [(SBTransitionSwitcherModifierEvent *)self fromAppExposeBundleID];
    char v7 = [(SBTransitionSwitcherModifierEvent *)self toAppExposeBundleID];
    int v8 = BSEqualObjects();

    if (v8)
    {
      uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
      char v9 = [v4 isOrContainsAppLayout:v3];
LABEL_7:

      goto LABEL_8;
    }
  }
  char v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)isFloatingPulseEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self activatingAppLayout];
  if (v3)
  {
    uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingAppLayout];
    char v5 = [(SBTransitionSwitcherModifierEvent *)self toFloatingAppLayout];
    if ((BSEqualObjects() & 1) == 0)
    {

      char v9 = 0;
      goto LABEL_7;
    }
    char v6 = [(SBTransitionSwitcherModifierEvent *)self fromAppExposeBundleID];
    char v7 = [(SBTransitionSwitcherModifierEvent *)self toAppExposeBundleID];
    int v8 = BSEqualObjects();

    if (v8)
    {
      uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toFloatingAppLayout];
      char v9 = [v4 isOrContainsAppLayout:v3];
LABEL_7:

      goto LABEL_8;
    }
  }
  char v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)isFullScreenToSplitViewEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  if ([v3 configuration] == 1 && objc_msgSend(v4, "configuration") >= 2)
  {
    char v5 = [v3 itemForLayoutRole:1];
    char v6 = [v4 itemForLayoutRole:1];
    if ([v5 isEqual:v6])
    {
      char v7 = [v3 itemForLayoutRole:2];
      if (v7)
      {
        BOOL v8 = 0;
      }
      else
      {
        char v9 = [v4 itemForLayoutRole:2];
        BOOL v8 = v9 != 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isSplitViewCrossfadeEvent
{
  int64_t v35 = [(SBTransitionSwitcherModifierEvent *)self fromInterfaceOrientation];
  int64_t v34 = [(SBTransitionSwitcherModifierEvent *)self toInterfaceOrientation];
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingAppLayout];
  uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toFloatingAppLayout];

  int64_t v33 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingConfiguration];
  int64_t v5 = [(SBTransitionSwitcherModifierEvent *)self toFloatingConfiguration];
  BOOL v6 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingSwitcherVisible];
  BOOL v7 = [(SBTransitionSwitcherModifierEvent *)self toFloatingSwitcherVisible];
  int64_t v8 = [(SBTransitionSwitcherModifierEvent *)self fromEnvironmentMode];
  int64_t v9 = [(SBTransitionSwitcherModifierEvent *)self toEnvironmentMode];
  int64_t v10 = [(SBTransitionSwitcherModifierEvent *)self fromPeekConfiguration];
  int64_t v11 = [(SBTransitionSwitcherModifierEvent *)self toPeekConfiguration];
  BOOL v12 = [(SBTransitionSwitcherModifierEvent *)self isGestureInitiated];
  BOOL v13 = 0;
  if (!v12 && v35 == v34 && v3 == v4 && v33 == v5 && ((v6 ^ v7) & 1) == 0 && v8 == v9 && v10 == v11)
  {
    BOOL v14 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
    uint64_t v15 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
    char v16 = (void *)v15;
    LOBYTE(v17) = 0;
    if (v14 && v15)
    {
      uint64_t v18 = [v14 itemForLayoutRole:2];
      if (v18
        && (v19 = (void *)v18,
            [v16 itemForLayoutRole:2],
            v20 = objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            v20))
      {
        v21 = (void *)MEMORY[0x1E4F1CAD0];
        v22 = [v14 itemForLayoutRole:1];
        v23 = [v14 itemForLayoutRole:2];
        v24 = objc_msgSend(v21, "setWithObjects:", v22, v23, 0);

        v25 = (void *)MEMORY[0x1E4F1CAD0];
        v26 = [v16 itemForLayoutRole:1];
        id v27 = [v16 itemForLayoutRole:2];
        id v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, 0);

        v29 = (void *)MEMORY[0x1E4F1CAD0];
        v30 = [v14 allItems];
        id v31 = [v29 setWithArray:v30];
        if ([v16 containsAnyItemFromSet:v31]) {
          int v17 = [v24 isEqual:v28] ^ 1;
        }
        else {
          LOBYTE(v17) = 0;
        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }

    return v17;
  }
  return v13;
}

- (BOOL)isPrimaryToSlideOverEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toFloatingAppLayout];
  int64_t v5 = [v3 itemForLayoutRole:1];
  BOOL v6 = [v3 itemForLayoutRole:2];
  uint64_t v7 = [v4 itemForLayoutRole:1];
  int64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9 && ([v5 isEqual:v7] & 1) != 0;

  return v10;
}

- (BOOL)isSideToSlideOverEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self fromAppLayout];
  uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self toFloatingAppLayout];
  int64_t v5 = [v3 itemForLayoutRole:2];
  uint64_t v6 = [v4 itemForLayoutRole:1];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8 && ([v5 isEqual:v6] & 1) != 0;

  return v9;
}

- (BOOL)isSlideOverToPrimaryEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingAppLayout];
  int64_t v5 = [v3 itemForLayoutRole:1];
  uint64_t v6 = [v3 itemForLayoutRole:2];
  uint64_t v7 = [v4 itemForLayoutRole:1];
  BOOL v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9 && ([v5 isEqual:v7] & 1) != 0;

  return v10;
}

- (BOOL)isSlideOverToSideEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingAppLayout];
  int64_t v5 = [v3 itemForLayoutRole:2];
  uint64_t v6 = [v4 itemForLayoutRole:1];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8 && ([v5 isEqual:v6] & 1) != 0;

  return v9;
}

- (BOOL)isSlideOverToFullScreenEvent
{
  BOOL v3 = [(SBTransitionSwitcherModifierEvent *)self toAppLayout];
  uint64_t v4 = [(SBTransitionSwitcherModifierEvent *)self fromFloatingAppLayout];
  int64_t v5 = [v3 itemForLayoutRole:1];
  uint64_t v6 = [v3 itemForLayoutRole:2];
  uint64_t v7 = [v4 itemForLayoutRole:1];
  BOOL v8 = (void *)v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  BOOL v10 = !v9 && ([v5 isEqual:v7] & 1) != 0;

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)SBTransitionSwitcherModifierEvent;
  id v4 = [(SBChainableModifierEvent *)&v34 copyWithZone:a3];
  uint64_t v5 = [(NSUUID *)self->_transitionID copy];
  uint64_t v6 = (void *)*((void *)v4 + 8);
  *((void *)v4 + 8) = v5;

  *((void *)v4 + 9) = self->_phase;
  *((unsigned char *)v4 + 32) = self->_animated;
  uint64_t v7 = [(SBAppLayout *)self->_fromAppLayout copy];
  BOOL v8 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v7;

  *((void *)v4 + 11) = self->_fromEnvironmentMode;
  uint64_t v9 = [(SBAppLayout *)self->_toAppLayout copy];
  BOOL v10 = (void *)*((void *)v4 + 12);
  *((void *)v4 + 12) = v9;

  *((void *)v4 + 13) = self->_toEnvironmentMode;
  *((void *)v4 + 14) = self->_fromInterfaceOrientation;
  *((void *)v4 + 15) = self->_toInterfaceOrientation;
  *((void *)v4 + 16) = self->_fromWindowPickerRole;
  *((void *)v4 + 17) = self->_toWindowPickerRole;
  *((unsigned char *)v4 + 33) = self->_fromAppLayoutWantsExclusiveForeground;
  *((unsigned char *)v4 + 34) = self->_toAppLayoutWantsExclusiveForeground;
  uint64_t v11 = [(SBAppLayout *)self->_fromFloatingAppLayout copy];
  BOOL v12 = (void *)*((void *)v4 + 18);
  *((void *)v4 + 18) = v11;

  *((void *)v4 + 19) = self->_fromFloatingConfiguration;
  *((unsigned char *)v4 + 35) = self->_fromFloatingSwitcherVisible;
  uint64_t v13 = [(SBAppLayout *)self->_toFloatingAppLayout copy];
  BOOL v14 = (void *)*((void *)v4 + 20);
  *((void *)v4 + 20) = v13;

  *((void *)v4 + 21) = self->_toFloatingConfiguration;
  *((unsigned char *)v4 + 36) = self->_toFloatingSwitcherVisible;
  uint64_t v15 = [(NSString *)self->_fromAppExposeBundleID copy];
  char v16 = (void *)*((void *)v4 + 22);
  *((void *)v4 + 22) = v15;

  uint64_t v17 = [(NSString *)self->_toAppExposeBundleID copy];
  uint64_t v18 = (void *)*((void *)v4 + 23);
  *((void *)v4 + 23) = v17;

  uint64_t v19 = [(NSString *)self->_ambiguouslyLaunchedBundleIDIfAny copy];
  v20 = (void *)*((void *)v4 + 24);
  *((void *)v4 + 24) = v19;

  *((void *)v4 + 25) = self->_fromPeekConfiguration;
  *((void *)v4 + 26) = self->_toPeekConfiguration;
  *((void *)v4 + 27) = self->_fromSpaceConfiguration;
  *((void *)v4 + 28) = self->_toSpaceConfiguration;
  uint64_t v21 = [(SBBannerUnfurlSourceContext *)self->_bannerUnfurlSourceContext copy];
  v22 = (void *)*((void *)v4 + 29);
  *((void *)v4 + 29) = v21;

  *((unsigned char *)v4 + 37) = self->_prefersCrossfadeTransition;
  uint64_t v23 = [(NSMutableDictionary *)self->_appLayoutToRemovalContext mutableCopy];
  v24 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v23;

  uint64_t v25 = [(NSSet *)self->_fromDisplayItemsPendingTermination copy];
  v26 = (void *)*((void *)v4 + 31);
  *((void *)v4 + 31) = v25;

  uint64_t v27 = [(SBAppLayout *)self->_activatingAppLayout copy];
  id v28 = (void *)*((void *)v4 + 32);
  *((void *)v4 + 32) = v27;

  uint64_t v29 = [(NSDictionary *)self->_fromDisplayItemLayoutAttributesMap copy];
  v30 = (void *)*((void *)v4 + 33);
  *((void *)v4 + 33) = v29;

  uint64_t v31 = [(NSDictionary *)self->_toDisplayItemLayoutAttributesMap copy];
  v32 = (void *)*((void *)v4 + 34);
  *((void *)v4 + 34) = v31;

  objc_storeStrong((id *)v4 + 35, self->_moveDisplaysContext);
  *((unsigned char *)v4 + 39) = self->_gestureInitiated;
  *((unsigned char *)v4 + 40) = self->_keyboardShortcutInitiated;
  *((unsigned char *)v4 + 41) = self->_topAffordanceInitiated;
  *((unsigned char *)v4 + 42) = self->_dragAndDropTransition;
  *((unsigned char *)v4 + 43) = self->_breadcrumbTransition;
  *((unsigned char *)v4 + 44) = self->_morphToPIPTransition;
  *((unsigned char *)v4 + 45) = self->_morphFromPIPTransition;
  *((void *)v4 + 37) = self->_morphingPIPLayoutRole;
  *((unsigned char *)v4 + 46) = self->_zoomFromSystemApertureTransition;
  *((unsigned char *)v4 + 47) = self->_continuityTransition;
  *((unsigned char *)v4 + 48) = self->_bannerUnfurlTransition;
  *((unsigned char *)v4 + 49) = self->_iconZoomDisabled;
  *((unsigned char *)v4 + 50) = self->_spotlightTransition;
  *((unsigned char *)v4 + 51) = self->_shelfTransition;
  *((void *)v4 + 38) = self->_dosidoTransitionDirection;
  *((unsigned char *)v4 + 52) = self->_shelfRequestTransition;
  *((unsigned char *)v4 + 53) = self->_morphFromInAppView;
  *((unsigned char *)v4 + 54) = self->_quickActionTransition;
  *((unsigned char *)v4 + 55) = self->_newSceneTransition;
  *((unsigned char *)v4 + 56) = self->_moveDisplaysTransition;
  *((unsigned char *)v4 + 57) = self->_continuousExposeConfigurationChangeEvent;
  *((unsigned char *)v4 + 58) = self->_iPadOSWindowingModeChangeEvent;
  *((unsigned char *)v4 + 59) = self->_commandTabTransition;
  *((unsigned char *)v4 + 60) = self->_launchingFromDockTransition;
  *((unsigned char *)v4 + 61) = self->_appLaunchDuringWindowDragGestureTransition;
  return v4;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (int64_t)fromWindowPickerRole
{
  return self->_fromWindowPickerRole;
}

- (BOOL)fromAppLayoutWantsExclusiveForeground
{
  return self->_fromAppLayoutWantsExclusiveForeground;
}

- (BOOL)toAppLayoutWantsExclusiveForeground
{
  return self->_toAppLayoutWantsExclusiveForeground;
}

- (int64_t)fromFloatingConfiguration
{
  return self->_fromFloatingConfiguration;
}

- (BOOL)fromFloatingSwitcherVisible
{
  return self->_fromFloatingSwitcherVisible;
}

- (NSString)fromAppExposeBundleID
{
  return self->_fromAppExposeBundleID;
}

- (NSString)ambiguouslyLaunchedBundleIDIfAny
{
  return self->_ambiguouslyLaunchedBundleIDIfAny;
}

- (void)setAmbiguouslyLaunchedBundleIDIfAny:(id)a3
{
}

- (int64_t)fromSpaceConfiguration
{
  return self->_fromSpaceConfiguration;
}

- (int64_t)toSpaceConfiguration
{
  return self->_toSpaceConfiguration;
}

- (SBBannerUnfurlSourceContext)bannerUnfurlSourceContext
{
  return self->_bannerUnfurlSourceContext;
}

- (BOOL)prefersCrossfadeTransition
{
  return self->_prefersCrossfadeTransition;
}

- (void)setZoomFromHardwareButtonPreludeTokenWrapper:(id)a3
{
}

- (SBAppLayout)activatingAppLayout
{
  return self->_activatingAppLayout;
}

- (NSDictionary)fromDisplayItemLayoutAttributesMap
{
  return self->_fromDisplayItemLayoutAttributesMap;
}

- (void)setFromDisplayItemLayoutAttributesMap:(id)a3
{
}

- (NSDictionary)toDisplayItemLayoutAttributesMap
{
  return self->_toDisplayItemLayoutAttributesMap;
}

- (void)setToDisplayItemLayoutAttributesMap:(id)a3
{
}

- (SBTransitionSwitcherModifierMoveDisplaysContext)moveDisplaysContext
{
  return self->_moveDisplaysContext;
}

- (void)setMoveDisplaysContext:(id)a3
{
}

- (SBDisplayItem)movingDisplayItem
{
  return self->_movingDisplayItem;
}

- (void)setMovingDisplayItem:(id)a3
{
}

- (CGSize)fromSizeOfMovingDisplayItem
{
  double width = self->_fromSizeOfMovingDisplayItem.width;
  double height = self->_fromSizeOfMovingDisplayItem.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFromSizeOfMovingDisplayItem:(CGSize)a3
{
  self->_fromSizeOfMovingDisplayItem = a3;
}

- (CGPoint)fromCenterOfMovingDisplayItem
{
  double x = self->_fromCenterOfMovingDisplayItem.x;
  double y = self->_fromCenterOfMovingDisplayItem.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFromCenterOfMovingDisplayItem:(CGPoint)a3
{
  self->_fromCenterOfMovingDisplayItem = a3;
}

- (CGSize)toSizeOfMovingDisplayItem
{
  double width = self->_toSizeOfMovingDisplayItem.width;
  double height = self->_toSizeOfMovingDisplayItem.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setToSizeOfMovingDisplayItem:(CGSize)a3
{
  self->_toSizeOfMovingDisplayItem = a3;
}

- (CGPoint)toCenterOfMovingDisplayItem
{
  double x = self->_toCenterOfMovingDisplayItem.x;
  double y = self->_toCenterOfMovingDisplayItem.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setToCenterOfMovingDisplayItem:(CGPoint)a3
{
  self->_toCenterOfMovingDisplayItem = a3;
}

- (BOOL)isGestureInitiated
{
  return self->_gestureInitiated;
}

- (BOOL)isKeyboardShortcutInitiated
{
  return self->_keyboardShortcutInitiated;
}

- (BOOL)isTopAffordanceInitiated
{
  return self->_topAffordanceInitiated;
}

- (BOOL)isMorphToPIPTransition
{
  return self->_morphToPIPTransition;
}

- (void)setMorphFromPIPTransition:(BOOL)a3
{
  self->_morphFromPIPTransition = a3;
}

- (int64_t)morphingPIPLayoutRole
{
  return self->_morphingPIPLayoutRole;
}

- (BOOL)isContinuityTransition
{
  return self->_continuityTransition;
}

- (BOOL)isShelfTransition
{
  return self->_shelfTransition;
}

- (int64_t)dosidoTransitionDirection
{
  return self->_dosidoTransitionDirection;
}

- (void)setDosidoTransitionDirection:(int64_t)a3
{
  self->_int64_t dosidoTransitionDirection = a3;
}

- (BOOL)isShelfRequestTransition
{
  return self->_shelfRequestTransition;
}

- (BOOL)isMorphFromInAppView
{
  return self->_morphFromInAppView;
}

- (BOOL)isQuickActionTransition
{
  return self->_quickActionTransition;
}

- (BOOL)isNewSceneTransition
{
  return self->_newSceneTransition;
}

- (BOOL)isContinuousExposeConfigurationChangeEvent
{
  return self->_continuousExposeConfigurationChangeEvent;
}

- (BOOL)isiPadOSWindowingModeChangeEvent
{
  return self->_iPadOSWindowingModeChangeEvent;
}

- (BOOL)isCommandTabTransition
{
  return self->_commandTabTransition;
}

- (BOOL)isLaunchingFromDockTransition
{
  return self->_launchingFromDockTransition;
}

- (BOOL)isAppLaunchDuringWindowDragGestureTransition
{
  return self->_appLaunchDuringWindowDragGestureTransition;
}

- (id)debugPredicateSummary
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v68 = objc_opt_new();
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v49 = NSStringFromSelector(sel_isAnyPulseEvent);
  v73[0] = v49;
  id v47 = NSStringFromSelector(sel_isMainPulseEvent);
  v73[1] = v47;
  id v46 = NSStringFromSelector(sel_isFloatingPulseEvent);
  v73[2] = v46;
  id v65 = NSStringFromSelector(sel_isFullScreenToSplitViewEvent);
  v73[3] = v65;
  id v64 = NSStringFromSelector(sel_isSplitViewCrossfadeEvent);
  v73[4] = v64;
  id v63 = NSStringFromSelector(sel_isAnySplitViewToOrFromSlideOverEvent);
  v73[5] = v63;
  id v62 = NSStringFromSelector(sel_isPrimaryToSlideOverEvent);
  v73[6] = v62;
  v61 = NSStringFromSelector(sel_isSideToSlideOverEvent);
  v73[7] = v61;
  id v60 = NSStringFromSelector(sel_isSlideOverToPrimaryEvent);
  v73[8] = v60;
  id v59 = NSStringFromSelector(sel_isSlideOverToSideEvent);
  v73[9] = v59;
  id v58 = NSStringFromSelector(sel_isSlideOverToFullScreenEvent);
  v73[10] = v58;
  id v57 = NSStringFromSelector(sel_isEnteringAnyPeekEvent);
  v73[11] = v57;
  id v56 = NSStringFromSelector(sel_isExitingAnyPeekEvent);
  v73[12] = v56;
  id v55 = NSStringFromSelector(sel_isEnteringSplitViewPeekEvent);
  v73[13] = v55;
  id v54 = NSStringFromSelector(sel_isExitingSplitViewPeekEvent);
  v73[14] = v54;
  id v53 = NSStringFromSelector(sel_isExitingSplitViewPeekToAppEvent);
  v73[15] = v53;
  id v52 = NSStringFromSelector(sel_isExitingSplitViewPeekToHomeScreenEvent);
  v73[16] = v52;
  id v51 = NSStringFromSelector(sel_isEnteringSlideOverPeekEvent);
  v73[17] = v51;
  id v50 = NSStringFromSelector(sel_isExitingSlideOverPeekEvent);
  v73[18] = v50;
  v48 = NSStringFromSelector(sel_isExitingSlideOverPeekToAppEvent);
  v73[19] = v48;
  id v45 = NSStringFromSelector(sel_isExitingSlideOverPeekToHomeScreenEvent);
  v73[20] = v45;
  v44 = NSStringFromSelector(sel_isExitingCenterWindowEvent);
  v73[21] = v44;
  v43 = NSStringFromSelector(sel_isCenterWindowRemovalEvent);
  v73[22] = v43;
  v42 = NSStringFromSelector(sel_isCenterWindowToFullScreenEvent);
  v73[23] = v42;
  v41 = NSStringFromSelector(sel_isCenterWindowToSlideOverEvent);
  v73[24] = v41;
  v40 = NSStringFromSelector(sel_isCenterWindowToNewSplitViewEvent);
  v73[25] = v40;
  v39 = NSStringFromSelector(sel_isCenterWindowToExistingSplitViewEvent);
  v73[26] = v39;
  v38 = NSStringFromSelector(sel_isReplaceCenterWindowWithNewCenterWindowEvent);
  v73[27] = v38;
  v37 = NSStringFromSelector(sel_isPresentingPageCenterWindowEvent);
  v73[28] = v37;
  v36 = NSStringFromSelector(sel_isSplitViewToCenterWindowEvent);
  v73[29] = v36;
  int64_t v35 = NSStringFromSelector(sel_isSlideOverToCenterWindowEvent);
  v73[30] = v35;
  objc_super v34 = NSStringFromSelector(sel_isFullScreenToCenterWindowEvent);
  v73[31] = v34;
  int64_t v33 = NSStringFromSelector(sel_isSwappingFullScreenAppSidesEvent);
  v73[32] = v33;
  v32 = NSStringFromSelector(sel_isCenterWindowZoomingUpFromShelfEvent);
  v73[33] = v32;
  uint64_t v31 = NSStringFromSelector(sel_isGestureInitiated);
  v73[34] = v31;
  v30 = NSStringFromSelector(sel_isDragAndDropTransition);
  v73[35] = v30;
  uint64_t v29 = NSStringFromSelector(sel_isBreadcrumbTransition);
  v73[36] = v29;
  id v28 = NSStringFromSelector(sel_isMorphToPIPTransition);
  v73[37] = v28;
  uint64_t v27 = NSStringFromSelector(sel_isMorphFromPIPTransition);
  v73[38] = v27;
  v26 = NSStringFromSelector(sel_isContinuityTransition);
  v73[39] = v26;
  uint64_t v25 = NSStringFromSelector(sel_isBannerUnfurlTransition);
  v73[40] = v25;
  v24 = NSStringFromSelector(sel_isIconZoomDisabled);
  v73[41] = v24;
  uint64_t v23 = NSStringFromSelector(sel_isSpotlightTransition);
  v73[42] = v23;
  v2 = NSStringFromSelector(sel_isShelfTransition);
  v73[43] = v2;
  BOOL v3 = NSStringFromSelector(sel_isShelfRequestTransition);
  v73[44] = v3;
  id v4 = NSStringFromSelector(sel_isMorphFromInAppView);
  v73[45] = v4;
  uint64_t v5 = NSStringFromSelector(sel_isQuickActionTransition);
  v73[46] = v5;
  uint64_t v6 = NSStringFromSelector(sel_isNewSceneTransition);
  v73[47] = v6;
  uint64_t v7 = NSStringFromSelector(sel_isMoveDisplaysTransition);
  v73[48] = v7;
  BOOL v8 = NSStringFromSelector(sel_isContinuousExposeConfigurationChangeEvent);
  v73[49] = v8;
  uint64_t v9 = NSStringFromSelector(sel_isiPadOSWindowingModeChangeEvent);
  v73[50] = v9;
  BOOL v10 = NSStringFromSelector(sel_isCommandTabTransition);
  v73[51] = v10;
  uint64_t v11 = NSStringFromSelector(sel_isLaunchingFromDockTransition);
  v73[52] = v11;
  id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:53];

  uint64_t v12 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v70 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v17 = [(SBTransitionSwitcherModifierEvent *)self valueForKeyPath:v16];
        int v18 = [v17 BOOLValue];

        if (v18) {
          uint64_t v19 = @"YES";
        }
        else {
          uint64_t v19 = @"NO";
        }
        v20 = [NSString stringWithFormat:@"%@: %@", v16, v19];
        [v68 addObject:v20];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
    }
    while (v13);
  }

  uint64_t v21 = [v68 componentsJoinedByString:@"\n"];

  return v21;
}

@end