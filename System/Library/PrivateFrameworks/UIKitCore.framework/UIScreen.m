@interface UIScreen
+ (BOOL)_isProbablyBeingRecorded;
+ (BOOL)_shouldDisableJail;
+ (BOOL)_supportsInvalidatingFocusCache;
+ (CGAffineTransform)transformForScreenOriginRotation:(SEL)a3;
+ (CGAffineTransform)transformToRotateScreen:(SEL)a3;
+ (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4;
+ (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4;
+ (CGRect)convertRect:(CGRect)a3 fromView:(id)a4;
+ (CGRect)convertRect:(CGRect)a3 toView:(id)a4;
+ (UIScreen)mainScreen;
+ (id)__displayConfigurationsForViewService;
+ (id)_carScreen;
+ (id)_embeddedScreen;
+ (id)_mainScreenThreadSafeTraitCollection;
+ (id)_screenForScene:(id)a3;
+ (id)_screenWithDisplayName:(id)a3;
+ (id)_screenWithEventDisplay:(id)a3;
+ (id)_screenWithFBSDisplayIdentity:(id)a3;
+ (id)_screenWithIntegerDisplayID:(unsigned int)a3;
+ (id)_screens;
+ (id)_shortScreensDescription;
+ (void)_FBSDisplayConfigurationConnected:(id)a3 andNotify:(BOOL)a4;
+ (void)_FBSDisplayConfigurationConnected:(id)a3 andNotify:(BOOL)a4 forceMain:(BOOL)a5;
+ (void)_FBSDisplayConfigurationConnected:(id)a3 forInitialDisplayContext:(id)a4 andNotify:(BOOL)a5 forceMain:(BOOL)a6;
+ (void)_FBSDisplayDidPossiblyConnect:(id)a3;
+ (void)_FBSDisplayDidPossiblyConnect:(id)a3 withScene:(id)a4;
+ (void)_FBSDisplayDidPossiblyConnect:(id)a3 withScene:(id)a4 andPost:(BOOL)a5;
+ (void)_FBSDisplayDidPossiblyDisconnect:(id)a3;
+ (void)_FBSDisplayDidPossiblyDisconnect:(id)a3 forSceneDestruction:(id)a4;
+ (void)_FBSDisplayIdentityDisconnected:(id)a3;
+ (void)_enumerateScreensWithBlock:(id)a3;
+ (void)_prepareScreensForAppResume;
+ (void)initialize;
- (BOOL)_UIIBAlwaysProvidePeripheryInsets;
- (BOOL)_areListsLimited;
- (BOOL)_areMusicListsLimited;
- (BOOL)_expectsSecureRendering;
- (BOOL)_hasWindows;
- (BOOL)_isCarInstrumentsScreen;
- (BOOL)_isCarPlayHumanPresenceInRange;
- (BOOL)_isCarPlayNightModeEnabled;
- (BOOL)_isCarScreen;
- (BOOL)_isEmbeddedScreen;
- (BOOL)_isExternal;
- (BOOL)_isFocusSystemLoaded;
- (BOOL)_isForceTouchCapable;
- (BOOL)_isMainLikeScreen;
- (BOOL)_isMainScreen;
- (BOOL)_isOverscanned;
- (BOOL)_isPerformingSystemSnapshot;
- (BOOL)_isRightHandDrive;
- (BOOL)_isSoftKeyboardLimited;
- (BOOL)_isUserInterfaceLimited:(unint64_t)a3;
- (BOOL)_isValidInterfaceOrientation:(int64_t)a3;
- (BOOL)_isWorkspaceCapable;
- (BOOL)_supportsCarPlayHumanPresence;
- (BOOL)_supportsDeferredFocus;
- (BOOL)_supportsDragging;
- (BOOL)_wantsWideContentMargins;
- (BOOL)isCaptured;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)supportsFocus;
- (BOOL)wantsSoftwareDimming;
- (CADisplayLink)displayLinkWithTarget:(id)target selector:(SEL)sel;
- (CARSession)_carSession;
- (CFTimeInterval)calibratedLatency;
- (CGFloat)brightness;
- (CGFloat)currentEDRHeadroom;
- (CGFloat)nativeScale;
- (CGFloat)potentialEDRHeadroom;
- (CGFloat)scale;
- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4;
- (CGRect)_applicationFrame;
- (CGRect)_applicationFrameForInterfaceOrientation:(int64_t)a3;
- (CGRect)_applicationFrameForInterfaceOrientation:(int64_t)a3 usingStatusbarHeight:(double)a4;
- (CGRect)_applicationFrameForInterfaceOrientation:(int64_t)a3 usingStatusbarHeight:(double)a4 ignoreStatusBar:(BOOL)a5;
- (CGRect)_applicationFrameWithoutOverscanForInterfaceOrientation:(int64_t)a3 usingStatusbarHeight:(double)a4 ignoreStatusBar:(BOOL)a5;
- (CGRect)_boundsForInterfaceOrientation:(int64_t)a3;
- (CGRect)_interfaceOrientedMainSceneBounds;
- (CGRect)_mainSceneBoundsForInterfaceOrientation:(int64_t)a3;
- (CGRect)_mainSceneFrame;
- (CGRect)_mainSceneReferenceBounds;
- (CGRect)_nativeDisplayBounds;
- (CGRect)_referenceBounds;
- (CGRect)_unjailedReferenceBounds;
- (CGRect)_unjailedReferenceBoundsForInterfaceOrientation:(int64_t)a3;
- (CGRect)_unjailedReferenceBoundsInPixels;
- (CGRect)bounds;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (FBSDisplayConfiguration)displayConfiguration;
- (NSArray)availableModes;
- (NSArray)preferredFocusEnvironments;
- (NSInteger)maximumFramesPerSecond;
- (NSString)debugDescription;
- (UIEdgeInsets)_displayPeripheryInsets;
- (UIEdgeInsets)_peripheryInsets;
- (UIEdgeInsets)overscanCompensationInsets;
- (UIFocusEnvironment)_focusedWindow;
- (UIFocusSystem)_focusSystem;
- (UIScreen)initWithDisplayConfiguration:(id)a3;
- (UIScreen)initWithDisplayConfiguration:(id)a3 forceMainScreen:(BOOL)a4;
- (UIScreen)mirroredScreen;
- (UIScreenMode)currentMode;
- (UIScreenMode)preferredMode;
- (UIScreenOverscanCompensation)overscanCompensation;
- (UIScreenReferenceDisplayModeStatus)referenceDisplayModeStatus;
- (UISoftwareDimmingWindow)_softwareDimmingWindow;
- (UITraitCollection)_defaultTraitCollection;
- (UITraitCollection)_lastNotifiedTraitCollection;
- (UITraitCollection)_overrideTraitCollection;
- (UITraitCollection)traitCollection;
- (UIView)focusedView;
- (UIView)snapshotViewAfterScreenUpdates:(BOOL)afterUpdates;
- (UIWindow)_preferredFocusedWindow;
- (_UIDragManager)_dragManager;
- (_UIInteractiveHighlightEnvironment)_interactiveHighlightEnvironment;
- (_UIScreenBoundingPathUtilities)_boundingPathUtilities;
- (double)_displayCornerRadius;
- (double)_displayCornerRadiusIgnoringZoom;
- (double)_nativePointsPerMillimeter;
- (double)_nativeScale;
- (double)_nativeScaleWithLevel:(unint64_t)a3;
- (double)_pointsPerInch;
- (double)_refreshRate;
- (double)_rotation;
- (double)_scale;
- (double)_touchRadiusScaleFactor;
- (float)_lastNotifiedBacklightLevel;
- (float)rawBrightnessForBacklightLevel:(float)a3;
- (id)_appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:(void *)a1;
- (id)_capabilities;
- (id)_capabilityForKey:(id)a3;
- (id)_defaultTraitCollectionForInterfaceOrientation:(int64_t)a3;
- (id)_defaultTraitCollectionForInterfaceOrientation:(int64_t)a3 inBounds:(CGRect)a4;
- (id)_display;
- (id)_displayID;
- (id)_displayInfoProvider;
- (id)_eventDisplay;
- (id)_exclusionArea;
- (id)_lazySoftwareDimmingWindow;
- (id)_name;
- (id)_orientationDebugDescription;
- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3;
- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3;
- (id)_preferredFocusedWindowScene;
- (id)_preventDisconnectionForReason:(uint64_t)a1;
- (id)_snapshotDisplaySystemIdentifier;
- (id)_snapshotExcludingWindows:(id)a3 withRect:(CGRect)a4;
- (id)_traitTrace;
- (id)_traitTrace:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayIdentity;
- (id)fbsDisplay;
- (id)fixedCoordinateSpace;
- (id)focusItemsInRect:(CGRect)a3;
- (id)focusedItem;
- (id)snapshotView;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)bitsPerComponent;
- (int64_t)_effectiveUserInterfaceStyle;
- (int64_t)_forceTouchCapability;
- (int64_t)_imageOrientation;
- (int64_t)_interfaceOrientation;
- (int64_t)_maximumFramesPerSecond;
- (int64_t)_screenType;
- (int64_t)_userInterfaceIdiom;
- (int64_t)gamut;
- (unint64_t)_artworkSubtype;
- (unsigned)_integerDisplayID;
- (unsigned)_seed;
- (void)_beginObservingBacklightLevelNotifications;
- (void)_clearCarPlayHumanPresenceState;
- (void)_computeMetrics;
- (void)_computeMetrics:(BOOL)a3;
- (void)_connectScreen;
- (void)_disconnectScreen;
- (void)_endObservingBacklightLevelNotifications;
- (void)_ensureComputedMainScreenDPI;
- (void)_evaluateCapturedStateForReason:(void *)a1;
- (void)_externalDeviceNightModeDidChange:(id)a3;
- (void)_fetchInitialCarPlayHumanPresenceStatusIfNeeded;
- (void)_invalidate;
- (void)_limitedUIDidChange:(id)a3;
- (void)_notifyTraitsChangedAndPropagate;
- (void)_postBrightnessDidChangeNotificationIfAppropriate;
- (void)_prepareForWindow;
- (void)_resetUserInterfaceIdiom;
- (void)_setBoundingPathUtilities:(id)a3;
- (void)_setCapability:(id)a3 forKey:(id)a4;
- (void)_setCaptured:(BOOL)a3;
- (void)_setCarPlayHumanPresenceInRange:(BOOL)a3;
- (void)_setDefaultTraitCollection:(id)a3;
- (void)_setExternalDeviceShouldInputText:(BOOL)a3;
- (void)_setFocusedWindow:(id)a3;
- (void)_setInitialDisplayContext:(id)a3;
- (void)_setInterfaceOrientation:(int64_t)a3;
- (void)_setInterfaceOrientation:(int64_t)a3 andNotify:(BOOL)a4;
- (void)_setLastNotifiedBacklightLevel:(float)a3;
- (void)_setLastNotifiedTraitCollection:(id)a3;
- (void)_setMainScreen:(BOOL)a3;
- (void)_setNeedsNonDeferredFocusUpdate;
- (void)_setOverrideTraitCollection:(id)a3;
- (void)_setPerformingSystemSnapshot:(BOOL)a3;
- (void)_setReferenceDisplayModeStatus:(int64_t)a3;
- (void)_setScale:(double)a3;
- (void)_setSceneProvidedDisplayCornerRadius:(double)a3;
- (void)_setSoftwareDimmingWindow:(id)a3;
- (void)_setUIIBAlwaysProvidePeripheryInsets:(BOOL)a3;
- (void)_setUserInterfaceIdiom:(int64_t)a3;
- (void)_setUserInterfaceStyleIfNecessary:(int64_t)a3 firstTimeOnly:(BOOL)a4;
- (void)_updateAvailableDisplayModes;
- (void)_updateCapabilities;
- (void)_updateDisplayConfiguration:(id)a3;
- (void)_updateTraits;
- (void)_updateTraitsForWindowScenesCallingParentWillTransition:(BOOL)a3;
- (void)_updateUserInterfaceIdiom;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBitsPerComponent:(int)a3;
- (void)setBrightness:(CGFloat)brightness;
- (void)setCarSession:(id)a3;
- (void)setCurrentMode:(UIScreenMode *)currentMode;
- (void)setDisplayConfiguration:(id)a3;
- (void)setFocusEnabled:(BOOL)a3;
- (void)setNeedsFocusUpdate;
- (void)setOverscanCompensation:(UIScreenOverscanCompensation)overscanCompensation;
- (void)setWantsSoftwareDimming:(BOOL)wantsSoftwareDimming;
- (void)updateFocusIfNeeded;
@end

@implementation UIScreen

- (CGFloat)scale
{
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, @"FakeMainScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EB2575AC&& self->_isFakeScreen)
  {
    int v3 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB2575E8, @"FakeMainScreenScale", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
    CGFloat result = (double)qword_1EB2575F0;
    if (v3) {
      return 2.0;
    }
  }
  else if ([(UIScreen *)self _isMainScreen])
  {
    return _UIScreenForcedMainScreenScale(1);
  }
  else
  {
    return self->_scale;
  }
  return result;
}

- (BOOL)_isMainScreen
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  int v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  if (v3)
  {
    v4 = [(FBSDisplayConfiguration *)v3 identity];
    v5 = v4;
    if (self->_mainScreen)
    {
      v6 = [v4 rootIdentity];
      BOOL v7 = v6 == v5;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

+ (UIScreen)mainScreen
{
  if (qword_1EB25C560)
  {
    id v2 = (id)qword_1EB25C560;
  }
  else
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__116;
    v17 = __Block_byref_object_dispose__116;
    id v18 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v10 = __22__UIScreen_mainScreen__block_invoke;
    v11 = &unk_1E52D9900;
    v12 = &v13;
    v5 = v9;
    os_unfair_lock_lock((os_unfair_lock_t)&__UIScreenMutableScreensArrayAccessLock);
    v10((uint64_t)v5);

    os_unfair_lock_unlock((os_unfair_lock_t)&__UIScreenMutableScreensArrayAccessLock);
    if (!v14[5])
    {
      BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:a1 file:@"UIScreen.m" lineNumber:703 description:@"returning nil screen from mainScreen is not allowed!"];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, a1, @"UIScreen.m", 704, @"firstObject in screens array (%@) is not a UIScreen object", v14[5] object file lineNumber description];
    }
    id v2 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  return (UIScreen *)v2;
}

void __22__UIScreen_mainScreen__block_invoke(uint64_t a1)
{
  if (qword_1EB25C5E8 != -1) {
    dispatch_once(&qword_1EB25C5E8, &__block_literal_global_899_0);
  }
  id v5 = (id)qword_1EB25C5F0;
  uint64_t v2 = [v5 firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (double)_scale
{
  return self->_scale;
}

- (double)_nativeScale
{
  [(UIScreen *)self _nativeScaleWithLevel:2];
  return result;
}

- (int64_t)_userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (BOOL)_wantsWideContentMargins
{
  uint64_t v3 = +[UIScreen mainScreen];
  if (v3 != self)
  {

LABEL_7:
    LOBYTE(v7) = 0;
    return v7;
  }
  char v4 = dyld_program_sdk_at_least();

  if ((v4 & 1) == 0) {
    goto LABEL_7;
  }
  $012B70957C36FBAE3F3275CB0B70138F screenFlags = self->_screenFlags;
  if ((*(_WORD *)&screenFlags & 0x800) == 0)
  {
    if (_UIDeviceNativeUserInterfaceIdiom())
    {
      MGGetBoolAnswer();
      int v6 = 2048;
    }
    else
    {
      int v8 = MGGetBoolAnswer();
      int v9 = MGGetBoolAnswer();
      int v6 = 2048;
      if (v8 && v9)
      {
        if (self->_referenceBounds.size.width <= 375.0) {
          int v6 = 2048;
        }
        else {
          int v6 = 3072;
        }
      }
    }
    $012B70957C36FBAE3F3275CB0B70138F screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&self->_screenFlags & 0xFFFFF3FF | v6);
    self->_$012B70957C36FBAE3F3275CB0B70138F screenFlags = screenFlags;
  }
  return (*(unsigned int *)&screenFlags >> 10) & 1;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  uint64_t v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  return v3;
}

- (unint64_t)_artworkSubtype
{
  return 0;
}

- (UITraitCollection)traitCollection
{
  overrideTraitCollection = self->_overrideTraitCollection;
  if (!overrideTraitCollection) {
    overrideTraitCollection = self->_defaultTraitCollection;
  }
  return overrideTraitCollection;
}

- (CGRect)bounds
{
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    [(UIScreen *)self _boundsForInterfaceOrientation:[(UIScreen *)self _interfaceOrientation]];
  }
  else
  {
    double x = self->_referenceBounds.origin.x;
    double y = self->_referenceBounds.origin.y;
    double width = self->_referenceBounds.size.width;
    double height = self->_referenceBounds.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)_interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (CGRect)_boundsForInterfaceOrientation:(int64_t)a3
{
  CGFloat x = self->_referenceBounds.origin.x;
  CGFloat y = self->_referenceBounds.origin.y;
  CGFloat width = self->_referenceBounds.size.width;
  CGFloat height = self->_referenceBounds.size.height;
  if (![(UIScreen *)self _isExternal] || ![(UIScreen *)self _isMainLikeScreen])
  {
    if ((unint64_t)(a3 - 3) > 1) {
      goto LABEL_8;
    }
LABEL_7:
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    CGFloat v9 = CGRectGetWidth(v14);
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    CGFloat width = CGRectGetHeight(v15);
    CGFloat height = v9;
    goto LABEL_8;
  }
  if ((unint64_t)(a3 - 3) <= 1 && (*(_DWORD *)&self->_screenFlags & 0x10000) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (BOOL)_isEmbeddedScreen
{
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, @"FakeMainScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EB2575AC&& self->_isFakeScreen|| !self->_mainScreen)
  {
    return 0;
  }
  else
  {
    return ![(UIScreen *)self _isExternal];
  }
}

- (BOOL)_isExternal
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  uint64_t v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  if (v3) {
    char v4 = [(FBSDisplayConfiguration *)v3 isExternal];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (CGRect)_referenceBounds
{
  double x = self->_referenceBounds.origin.x;
  double y = self->_referenceBounds.origin.y;
  double width = self->_referenceBounds.size.width;
  double height = self->_referenceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_unjailedReferenceBounds
{
  double x = self->_unjailedReferenceBounds.origin.x;
  double y = self->_unjailedReferenceBounds.origin.y;
  double width = self->_unjailedReferenceBounds.size.width;
  double height = self->_unjailedReferenceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v9 = (UIScreen *)a4;
  double v10 = v9;
  if (v9 && v9 != self)
  {
    double v11 = self;
    if (objc_opt_isKindOfClass())
    {

LABEL_7:
      double x = *MEMORY[0x1E4F1DB20];
      double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v12 = [(UIScreen *)v10 _screen];

      if (v12 != self) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    -[UIScreen convertRect:toCoordinateSpace:](v10, "convertRect:toCoordinateSpace:", self, x, y, width, height);
    double x = v13;
    double y = v14;
    double width = v15;
    double height = v16;
  }
LABEL_10:

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (_UIScreenBoundingPathUtilities)_boundingPathUtilities
{
  boundingPathUtilities = self->_boundingPathUtilities;
  if (!boundingPathUtilities)
  {
    char v4 = +[_UIScreenBoundingPathUtilities boundingPathUtilitiesForScreen:self];
    id v5 = self->_boundingPathUtilities;
    self->_boundingPathUtilities = v4;

    boundingPathUtilities = self->_boundingPathUtilities;
  }
  return boundingPathUtilities;
}

void __68__UIScreen__defaultTraitCollectionForInterfaceOrientation_inBounds___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  [v19 setUserInterfaceIdiom:*(void *)(*(void *)(a1 + 32) + 96)];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[12];
  [v3 scale];
  objc_msgSend(v19, "setDisplayScale:");
  [v19 setDisplayGamut:*(void *)(*(void *)(a1 + 32) + 88)];
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v19, "setHorizontalSizeClass:", _UIUserInterfaceSizeClassForWidthAndUserInterfaceIdiomWithHomeButton(*(void *)(*(void *)(a1 + 32) + 96), +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton"), *(double *)(a1 + 64)));
    unint64_t v5 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v5 <= 8)
    {
      if (((1 << v5) & 0x126) != 0)
      {
        uint64_t v6 = 2;
LABEL_10:
        [v19 setVerticalSizeClass:v6];
        goto LABEL_11;
      }
      if (!v5)
      {
        double v7 = *(double *)(a1 + 72);
        _UIScreenReferenceBoundsSizeForType(1uLL);
        if (v8 > v7) {
          uint64_t v6 = 1;
        }
        else {
          uint64_t v6 = 2;
        }
        goto LABEL_10;
      }
    }
    uint64_t v6 = 0;
    goto LABEL_10;
  }
LABEL_11:
  CGFloat v9 = [*(id *)(a1 + 32) _capabilityForKey:@"UIScreenCapabilityInteractionModelsKey"];
  objc_msgSend(v19, "_setNSUIntegerValue:forTraitToken:", objc_msgSend(v9, "integerValue"), 0x1ED3F5B98);

  double v10 = [*(id *)(a1 + 32) _capabilityForKey:@"UIScreenCapabilityTouchLevelsKey"];
  objc_msgSend(v19, "_setNSIntegerValue:forTraitToken:", objc_msgSend(v10, "integerValue"), 0x1ED3F5B80);

  double v11 = [*(id *)(a1 + 32) _capabilityForKey:@"UIScreenCapabilityPrimaryInteractionModelKey"];
  objc_msgSend(v19, "_setNSUIntegerValue:forTraitToken:", objc_msgSend(v11, "integerValue"), 0x1ED3F5BB0);

  objc_msgSend(v19, "_setNSIntegerValue:forTraitToken:", objc_msgSend(*(id *)(a1 + 32), "_artworkSubtype"), 0x1ED3F5BC8);
  objc_msgSend(v19, "setUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 32), "_effectiveUserInterfaceStyle"));
  objc_msgSend(v19, "setLayoutDirection:", objc_msgSend((id)UIApp, "userInterfaceLayoutDirection"));
  objc_msgSend(v19, "setForceTouchCapability:", objc_msgSend(*(id *)(a1 + 32), "_forceTouchCapability"));
  double v12 = +[UIContentSizeCategoryPreference system];
  double v13 = [v12 preferredContentSizeCategory];

  if (v4 == 3)
  {
    double v14 = +[UIContentSizeCategoryPreference system];
    uint64_t v15 = [v14 preferredContentSizeCategoryCarPlay];

    double v13 = (void *)v15;
  }
  [v19 setPreferredContentSizeCategory:v13];
  [*(id *)(a1 + 32) _traitCollectionDisplayCornerRadius];
  objc_msgSend(v19, "_setCGFloatValue:forTraitToken:", 0x1ED3F5BE0);
  int v16 = _AXSEnhanceTextLegibilityEnabled();
  if (v4 == 3) {
    int v16 = _AXSCarPlayEnhanceTextLegibilityEnabled();
  }
  [v19 setLegibilityWeight:v16 != 0];
  [v19 _setNSIntegerValue:1 forTraitToken:0x1ED3F5BF8];
  [v19 _setNSIntegerValue:1 forTraitToken:0x1ED3F5C10];
  [v19 _setNSIntegerValue:0 forTraitToken:0x1ED3F5C28];
  [v19 setAccessibilityContrast:_AXDarkenSystemColors() != 0];
  [v19 _setNSIntegerValue:0 forTraitToken:0x1ED3F5C40];
  [v19 setUserInterfaceLevel:0];
  [v19 setActiveAppearance:1];
  [v19 _setNSIntegerValue:-1 forTraitToken:0x1ED3F5CA0];
  double v17 = +[_UIHDRUsageCoordinator sharedInstance]();
  [*(id *)(a1 + 32) potentialEDRHeadroom];
  -[_UIHDRUsageCoordinator applyRangeForHeadroom:toMutableTraits:]((uint64_t)v17, v19, v18);

  [v19 _setNSIntegerValue:0 forTraitToken:0x1ED3F5C70];
}

- (id)_capabilityForKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unint64_t v5 = [(UIScreen *)self _capabilities];
    uint64_t v6 = [v5 objectForKey:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)_capabilities
{
  uint64_t v2 = (void *)[(NSDictionary *)self->_capabilities copy];
  return v2;
}

- (BOOL)isCaptured
{
  return self->_captured;
}

- (double)_displayCornerRadius
{
  if ([(UIScreen *)self _isEmbeddedScreen])
  {
    if (_displayCornerRadius_onceToken != -1) {
      dispatch_once(&_displayCornerRadius_onceToken, &__block_literal_global_264);
    }
    return *(double *)&_displayCornerRadius_embeddedDisplayCornerRadius;
  }
  else
  {
    id v4 = [(UIScreen *)self displayIdentity];
    int v5 = [v4 isUIKitMainLike];

    double result = 0.0;
    if (v5) {
      return self->_sceneProvidedCornerRadius;
    }
  }
  return result;
}

- (int64_t)_forceTouchCapability
{
  if (![(UIScreen *)self _isForceTouchCapable]) {
    return 1;
  }
  if (_AXSForceTouchEnabled()) {
    return 2;
  }
  return 1;
}

- (int64_t)_screenType
{
  int64_t result = self->_screenType;
  if (result == -1)
  {
    int64_t result = _UIScreenTypeForScreen(self);
    self->_screenType = result;
  }
  return result;
}

- (id)fixedCoordinateSpace
{
  fixedCoordinateSpace = self->_fixedCoordinateSpace;
  if (!fixedCoordinateSpace)
  {
    id v4 = objc_alloc_init(_UIScreenFixedCoordinateSpace);
    int v5 = self->_fixedCoordinateSpace;
    self->_fixedCoordinateSpace = v4;

    [(_UIScreenFixedCoordinateSpace *)self->_fixedCoordinateSpace _setScreen:self];
    fixedCoordinateSpace = self->_fixedCoordinateSpace;
  }
  return fixedCoordinateSpace;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  CGFloat v9 = (UIScreen *)a4;
  double v10 = v9;
  if (v9 && v9 != self)
  {
    double v11 = self;
    if (objc_opt_isKindOfClass())
    {

      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v12 = [(UIScreen *)v10 _screen];

      if (v12 != self)
      {
LABEL_7:
        if (os_variant_has_internal_diagnostics())
        {
          double v14 = __UIFaultDebugAssertLog();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
            goto LABEL_13;
          }
          v40.origin.double x = x;
          v40.origin.double y = y;
          v40.size.double width = width;
          v40.size.double height = height;
          uint64_t v15 = NSStringFromCGRect(v40);
          int v16 = [NSString stringWithFormat:@"%@ (oriented)", self];
          v29 = NSString;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v31 = @"fixed";
          if (isKindOfClass) {
            v31 = @"oriented";
          }
          double v20 = [v29 stringWithFormat:@"%@ (%@)", v10, v31];
          *(_DWORD *)buf = 138412802;
          v33 = v15;
          __int16 v34 = 2112;
          v35 = v16;
          __int16 v36 = 2112;
          v37 = v20;
          _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Attempting to convert rect: %@ from %@ to %@, which is not a valid conversion; returning CGRectNull.",
            buf,
            0x20u);
        }
        else
        {
          double v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &convertRect_toCoordinateSpace____s_category) + 8);
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
LABEL_14:
            double x = *MEMORY[0x1E4F1DB20];
            double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
            double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
            double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
            goto LABEL_17;
          }
          double v14 = v13;
          v39.origin.double x = x;
          v39.origin.double y = y;
          v39.size.double width = width;
          v39.size.double height = height;
          uint64_t v15 = NSStringFromCGRect(v39);
          int v16 = [NSString stringWithFormat:@"%@ (oriented)", self];
          double v17 = NSString;
          objc_opt_class();
          char v18 = objc_opt_isKindOfClass();
          id v19 = @"fixed";
          if (v18) {
            id v19 = @"oriented";
          }
          double v20 = [v17 stringWithFormat:@"%@ (%@)", v10, v19];
          *(_DWORD *)buf = 138412802;
          v33 = v15;
          __int16 v34 = 2112;
          v35 = v16;
          __int16 v36 = 2112;
          v37 = v20;
          _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Attempting to convert rect: %@ from %@ to %@, which is not a valid conversion; returning CGRectNull.",
            buf,
            0x20u);
        }

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
    }
    -[UIScreen convertRect:fromCoordinateSpace:](v10, "convertRect:fromCoordinateSpace:", self, x, y, width, height);
    double x = v21;
    double y = v22;
    double width = v23;
    double height = v24;
  }
LABEL_17:

  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGRect)_applicationFrameForInterfaceOrientation:(int64_t)a3 usingStatusbarHeight:(double)a4 ignoreStatusBar:(BOOL)a5
{
  [(UIScreen *)self _applicationFrameWithoutOverscanForInterfaceOrientation:a3 usingStatusbarHeight:a5 ignoreStatusBar:a4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if ([(UIScreen *)self overscanCompensation] == UIScreenOverscanCompensationNone
    && _UIDeviceNativeUserInterfaceIdiom() != 2)
  {
    [(UIScreen *)self overscanCompensationInsets];
    double v7 = v7 + v14;
    double v9 = v9 + v15;
    double v11 = v11 - (v14 + v16);
    double v13 = v13 - (v15 + v17);
  }
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (UIEdgeInsets)overscanCompensationInsets
{
  double v3 = 0.0;
  if ([(UIScreen *)self overscanCompensation])
  {
    BOOL v4 = [(UIScreen *)self _isOverscanned];
    double v5 = 0.0;
    if (v4)
    {
      [(UIScreen *)self _applicationFrameWithoutOverscanForInterfaceOrientation:[(UIScreen *)self _interfaceOrientation] usingStatusbarHeight:0 ignoreStatusBar:0.0];
      double v7 = v6;
      double v9 = v8;
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
      double v10 = self->__displayConfiguration;
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
      [(FBSDisplayConfiguration *)v10 safeOverscanRatio];
      double v12 = v11;
      double v14 = v13;

      double v15 = ceil(v7 * v12);
      double v16 = ceil(v9 * v14);
      int v17 = vcvtpd_s64_f64(v7 * v12);
      if (v17 >= 0) {
        int v18 = v17 & 1;
      }
      else {
        int v18 = -(v17 & 1);
      }
      double v19 = (double)v18;
      int v20 = vcvtpd_s64_f64(v9 * v14);
      double v21 = v15 + v19;
      if (v20 >= 0) {
        int v22 = v20 & 1;
      }
      else {
        int v22 = -(v20 & 1);
      }
      double v5 = (v7 - v21) * 0.5;
      double v3 = (v9 - (v16 + (double)v22)) * 0.5;
    }
  }
  else
  {
    double v5 = 0.0;
  }
  double v23 = v3;
  double v24 = v3;
  double v25 = v5;
  result.right = v25;
  result.bottom = v24;
  result.left = v5;
  result.top = v23;
  return result;
}

- (UIScreenOverscanCompensation)overscanCompensation
{
  unint64_t screenFlags = self->_screenFlags;
  if ((screenFlags & 0x80) != 0) {
    return (screenFlags >> 8) & 3;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  BOOL v4 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  double v5 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:self];
  double v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 _screenRequestedOverscanCompensation];
    uint64_t v8 = v7 == 2;
    if (!v7) {
      uint64_t v8 = 2;
    }
    if (v7 == -1) {
      UIScreenOverscanCompensation v9 = UIScreenOverscanCompensationNone;
    }
    else {
      UIScreenOverscanCompensation v9 = v8;
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
    double v10 = self->__displayConfiguration;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
    uint64_t v11 = [(FBSDisplayConfiguration *)v10 overscanCompensation];

    if (v11) {
      UIScreenOverscanCompensation v9 = (unint64_t)(v11 == 2);
    }
    else {
      UIScreenOverscanCompensation v9 = UIScreenOverscanCompensationNone;
    }
  }

  return v9;
}

- (BOOL)_isOverscanned
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  double v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  char v4 = [(FBSDisplayConfiguration *)v3 isOverscanned];

  return v4;
}

- (int64_t)_effectiveUserInterfaceStyle
{
  if (![(UIScreen *)self _isMainLikeScreen])
  {
    if ([(UIScreen *)self _isCarScreen])
    {
      if ((_UIInternalPreferenceUsesDefault(&dword_1EB2575C0, @"ApplySceneUserInterfaceStyleToCarScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1EB2575C4)
      {
        if (!dyld_program_sdk_at_least())
        {
LABEL_16:
          if ([(UIScreen *)self _isCarPlayNightModeEnabled]) {
            return 2;
          }
          else {
            return 1;
          }
        }
        char v4 = [(CARSession *)self->_carSession configuration];
        uint64_t v5 = [v4 userInterfaceStyle];

        if (v5 != 1)
        {
          if (v5) {
            return 2;
          }
          goto LABEL_16;
        }
        return 1;
      }
    }
    else
    {
      if (![(UIScreen *)self _isCarInstrumentsScreen]) {
        return 1;
      }
      char v6 = _UIInternalPreferenceUsesDefault(&dword_1EB2575C0, @"ApplySceneUserInterfaceStyleToCarScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int64_t result = 2;
      if ((v6 & 1) != 0 || !byte_1EB2575C4) {
        return result;
      }
    }
    if (self->_lastUpdatedCanvasUserInterfaceStyle) {
      return self->_lastUpdatedCanvasUserInterfaceStyle;
    }
    else {
      return 2;
    }
  }
  int64_t result = [(id)UIApp _effectiveUserInterfaceStyle];
  if (!result
    && ((_UIInternalPreferenceUsesDefault(&dword_1EB2575B8, @"ApplySceneUserInterfaceStyleToScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& !byte_1EB2575BC|| (int64_t result = self->_lastUpdatedCanvasUserInterfaceStyle) == 0))
  {
    int64_t result = [(UISDisplayContext *)self->_initialDisplayContext userInterfaceStyle];
    if (!result)
    {
      if ((_UIInternalPreferenceUsesDefault(&dword_1EB2575B8, @"ApplySceneUserInterfaceStyleToScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& !byte_1EB2575BC)
      {
        return 0;
      }
      if ([(id)UIApp isFrontBoard])
      {
        uint64_t v7 = +[UIUserInterfaceStyleArbiter sharedInstance];
        if (v7)
        {
          uint64_t v8 = v7;
          int64_t v9 = [v7 currentStyle];

          return v9;
        }
      }
      return 1;
    }
  }
  return result;
}

- (BOOL)_isMainLikeScreen
{
  if (self->_mainScreen) {
    return 1;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  char v4 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  char v5 = [(FBSDisplayConfiguration *)v4 isUIKitMainLike];

  return v5;
}

+ (id)_screenForScene:(id)a3
{
  char v4 = [a3 settings];
  char v5 = [v4 displayIdentity];
  char v6 = [a1 _screenWithFBSDisplayIdentity:v5];

  return v6;
}

- (CGFloat)potentialEDRHeadroom
{
  uint64_t v2 = [(UIScreen *)self displayIdentity];
  double v3 = v2;
  if (v2)
  {
    [v2 displayID];
    CADisplayGetPotentialHeadroom();
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

+ (id)_screenWithFBSDisplayIdentity:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (unint64_t)a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  float v4 = _UIScreenAllScreens();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v10 = objc_msgSend(v9, "displayIdentity", (void)v15);
        if ([v10 isEqual:v3])
        {

LABEL_13:
          id v13 = v9;
          goto LABEL_14;
        }
        uint64_t v11 = [v9 displayIdentity];
        unint64_t v12 = v3 | v11;

        if (!v12) {
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      id v13 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_14:

  return v13;
}

- (id)displayIdentity
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  unint64_t v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  float v4 = [(FBSDisplayConfiguration *)v3 identity];

  return v4;
}

+ (id)_screens
{
  v0 = self;
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __20__UIScreen__screens__block_invoke;
  v4[3] = &unk_1E52F2450;
  id v2 = v1;
  id v5 = v2;
  [v0 _enumerateScreensWithBlock:v4];

  return v2;
}

+ (void)_enumerateScreensWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void (**)(id, uint64_t, char *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  float v4 = _UIScreenAllScreens();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
      char v10 = 0;
      v3[2](v3, v9, &v10);
      if (v10) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t __20__UIScreen__screens__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)_mainScreenThreadSafeTraitCollection
{
  id v2 = +[UIScreen mainScreen];
  os_unfair_lock_lock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);
  unint64_t v3 = (void *)v2[29];
  if (!v3) {
    unint64_t v3 = (void *)v2[28];
  }
  id v4 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);

  return v4;
}

- (int64_t)gamut
{
  return self->_gamut;
}

- (UIScreen)initWithDisplayConfiguration:(id)a3 forceMainScreen:(BOOL)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)UIScreen;
  uint64_t v7 = [(UIScreen *)&v32 init];
  if (v7)
  {
    if (a4) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 isMainDisplay];
    }
    v7->_mainScreen = v8;
    _UIScreenWriteDisplayConfiguration((uint64_t)v7, v6);
    v7->_userInterfaceIdiom = -1;
    v7->_screenType = -1;
    if (dyld_program_sdk_at_least())
    {
      uint64_t v9 = +[UITraitCollection _emptyTraitCollection]();
      defaultTraitCollection = v7->_defaultTraitCollection;
      v7->_defaultTraitCollection = (UITraitCollection *)v9;

      objc_storeStrong((id *)&v7->_lastNotifiedTraitCollection, v7->_defaultTraitCollection);
    }
    [(UIScreen *)v7 _computeMetrics];
    v7->_unint64_t screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&v7->_screenFlags & 0xFFFFFFF0 | 8);
    [(UIScreen *)v7 _beginObservingBacklightLevelNotifications];
    long long v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel__accessibilityForceTouchEnabledChanged_ name:@"UIAccessibilityForceTouchStatusChangedNotification" object:0];
    [v11 addObserver:v7 selector:sel__accessibilityBoldTextChanged_ name:@"UIAccessibilityBoldTextStatusDidChangeNotification" object:0];
    [v11 addObserver:v7 selector:sel__accessibilityBoldTextChanged_ name:@"UIAccessibilityCarPlayBoldTextStatusDidChangeNotification" object:0];
    [v11 addObserver:v7 selector:sel__handleEffectiveUserInterfaceStyleChanged_ name:0x1ED15D080 object:0];
    [v11 addObserver:v7 selector:sel__accessibilityTraitFlagsChanged_ name:@"UIAccessibilityDarkerSystemColorsStatusDidChangeNotification" object:0];
    [v11 addObserver:v7 selector:sel__handleForcedUserInterfaceLayoutDirectionChanged_ name:0x1ED15D0A0 object:0];
    BOOL v12 = [(UIScreen *)v7 _isCarScreen];
    if (!v12 && ![(UIScreen *)v7 _isCarInstrumentsScreen]) {
      goto LABEL_24;
    }
    +[_UICarPlaySession sharedInstance]();
    long long v13 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[_UICarPlaySession currentSession](v13);
    carSession = v7->_carSession;
    v7->_carSession = (CARSession *)v14;

    if (!v7->_carSession)
    {
      uint64_t v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIScreen", &qword_1EB25C570) + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = v16;
        long long v18 = [(UIScreen *)v7 _displayID];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "Failed to load car session on display: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!v12) {
      goto LABEL_24;
    }
    [v11 addObserver:v7 selector:sel__clearCarPlayHumanPresenceState name:@"UIApplicationWillResignActiveNotification" object:0];
    [v11 addObserver:v7 selector:sel__fetchInitialCarPlayHumanPresenceStatusIfNeeded name:@"UIApplicationWillEnterForegroundNotification" object:0];
    uint64_t v33 = 0;
    __int16 v34 = &v33;
    uint64_t v35 = 0x2020000000;
    double v19 = (void *)qword_1EB25C638;
    uint64_t v36 = qword_1EB25C638;
    if (!qword_1EB25C638)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v38 = __getCARSessionLimitUserInterfacesChangedNotificationSymbolLoc_block_invoke;
      CGRect v39 = &unk_1E52D9900;
      CGRect v40 = &v33;
      uint64_t v20 = CarKitLibrary();
      double v21 = dlsym(v20, "CARSessionLimitUserInterfacesChangedNotification");
      *(void *)(v40[1] + 24) = v21;
      qword_1EB25C638 = *(void *)(v40[1] + 24);
      double v19 = (void *)v34[3];
    }
    _Block_object_dispose(&v33, 8);
    if (v19)
    {
      [v11 addObserver:v7 selector:sel__limitedUIDidChange_ name:*v19 object:0];
      int v22 = _UIInternalPreferenceUsesDefault(&dword_1EB2575C0, @"ApplySceneUserInterfaceStyleToCarScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      if (byte_1EB2575C4) {
        int v23 = v22;
      }
      else {
        int v23 = 1;
      }
      if (v23 != 1) {
        goto LABEL_24;
      }
      uint64_t v33 = 0;
      __int16 v34 = &v33;
      uint64_t v35 = 0x2020000000;
      double v24 = (void *)qword_1EB25C640;
      uint64_t v36 = qword_1EB25C640;
      if (!qword_1EB25C640)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v38 = __getCARSessionNightModeChangedNotificationSymbolLoc_block_invoke;
        CGRect v39 = &unk_1E52D9900;
        CGRect v40 = &v33;
        double v25 = CarKitLibrary();
        double v26 = dlsym(v25, "CARSessionNightModeChangedNotification");
        *(void *)(v40[1] + 24) = v26;
        qword_1EB25C640 = *(void *)(v40[1] + 24);
        double v24 = (void *)v34[3];
      }
      _Block_object_dispose(&v33, 8);
      if (v24)
      {
        [v11 addObserver:v7 selector:sel__externalDeviceNightModeDidChange_ name:*v24 object:0];
LABEL_24:

        goto LABEL_25;
      }
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v31 = [NSString stringWithUTF8String:"NSString *getCARSessionNightModeChangedNotification(void)"];
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"UIScreen.m", 108, @"%s", dlerror());
    }
    else
    {
      double v28 = [MEMORY[0x1E4F28B00] currentHandler];
      v29 = [NSString stringWithUTF8String:"NSString *getCARSessionLimitUserInterfacesChangedNotification(void)"];
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"UIScreen.m", 107, @"%s", dlerror());
    }
    __break(1u);
  }
LABEL_25:

  return v7;
}

- (BOOL)_isCarScreen
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  unint64_t v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  char v4 = [(FBSDisplayConfiguration *)v3 isCarDisplay];

  return v4;
}

- (void)_computeMetrics
{
}

- (void)_computeMetrics:(BOOL)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  char v10 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  char v4 = v10;
  if (v10)
  {
    [(FBSDisplayConfiguration *)v10 scale];
    char v4 = v10;
  }
  else
  {
    double v5 = 1.0;
  }
  self->_scale = v5;
  self->_gamut = [(FBSDisplayConfiguration *)v4 colorGamut] != 0;
  if ([(id)UIApp _fakingRequiresHighResolution] && self->_scale == 1.0) {
    self->_scale = 2.0;
  }
  [(FBSDisplayConfiguration *)v10 bounds];
  self->_unjailedReferenceBounds.origin.double x = v6;
  self->_unjailedReferenceBounds.origin.double y = v7;
  self->_unjailedReferenceBounds.size.double width = v8;
  self->_unjailedReferenceBounds.size.double height = v9;
  self->_referenceBounds.origin = self->_unjailedReferenceBounds.origin;
  self->_referenceBounds.size = self->_unjailedReferenceBounds.size;
  *(_DWORD *)&self->_screenFlags &= ~0x1000u;
}

- (BOOL)_isCarInstrumentsScreen
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  unint64_t v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  char v4 = [(FBSDisplayConfiguration *)v3 isCarInstrumentsDisplay];

  return v4;
}

- (void)_beginObservingBacklightLevelNotifications
{
  if ([(UIScreen *)self _isEmbeddedScreen])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_UIScreenBacklightLevelDidChangeCallback, @"UIBacklightLevelChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    char v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4FB91D8];
    CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_UIScreenAccessibilityInvertColorsDidChangeCallback, v5, 0, (CFNotificationSuspensionBehavior)0);
  }
}

- (UIEdgeInsets)_peripheryInsets
{
  [(UIScreen *)self _displayPeripheryInsets];
  double v6 = v5;
  double v7 = v3;
  double v8 = v4;
  int64_t interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation == 2)
  {
    double v4 = v3;
    double v10 = v6;
    double v3 = v8;
LABEL_8:
    double v7 = v6;
    goto LABEL_9;
  }
  if (interfaceOrientation == 3)
  {
    double v4 = v6;
    double v10 = v3;
    double v3 = v6;
    double v7 = v8;
    goto LABEL_9;
  }
  if (interfaceOrientation != 4)
  {
    double v10 = v6;
    goto LABEL_8;
  }
  double v4 = v6;
  double v10 = v8;
  double v3 = v6;
LABEL_9:
  result.right = v4;
  result.bottom = v10;
  result.left = v3;
  result.top = v7;
  return result;
}

+ (id)_embeddedScreen
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = _UIScreenAllScreens();
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "_isEmbeddedScreen", (void)v8))
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (UIEdgeInsets)_displayPeripheryInsets
{
  id v2 = [(UIScreen *)self _displayInfoProvider];
  [v2 peripheryInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)_exclusionArea
{
  id v2 = [(UIScreen *)self _displayInfoProvider];
  double v3 = [v2 exclusionArea];

  return v3;
}

- (id)_displayInfoProvider
{
  displayInfoProvider = self->_displayInfoProvider;
  if (!displayInfoProvider)
  {
    if (UIApplicationSceneClassicModeWantsSafeAreaInsets(+[UIApplication _classicMode]))
    {
      [(id)UIApp isFrontBoard];
      if (![(UIScreen *)self _UIIBAlwaysProvidePeripheryInsets]
        && ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ForceIOSDeviceInsets, @"ForceIOSDeviceInsets", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1EB256E2C))
      {
        double v8 = +[_UIScreenInitialDisplayConfigurationLoader sharedLoader];
        double v9 = [v8 initialDisplayContext];

        double v4 = [v9 displayEdgeInfo];
        double v5 = [v9 exclusionArea];

        if (v4) {
          goto LABEL_16;
        }
LABEL_10:
        _UIDisplayInfoNullProvider();
        double v6 = (_UIDisplayInfoProviding *)objc_claimAutoreleasedReturnValue();
        double v4 = self->_displayInfoProvider;
        self->_displayInfoProvider = v6;
LABEL_11:

        displayInfoProvider = self->_displayInfoProvider;
        goto LABEL_12;
      }
      if ([(UIScreen *)self _isEmbeddedScreen])
      {
        double v4 = [MEMORY[0x1E4FB33B0] defaultDisplayEdgeInfoForceInsets:(byte_1EB256E2C != 0) & ~_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ForceIOSDeviceInsets, @"ForceIOSDeviceInsets", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool)];
        double v5 = 0;
        if (!v4) {
          goto LABEL_10;
        }
LABEL_16:
        id v10 = objc_alloc(MEMORY[0x1E4FB33E0]);
        os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
        double v11 = self->__displayConfiguration;
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
        double v12 = (_UIDisplayInfoProviding *)[v10 initWithDisplayConfiguration:v11 displayEdgeInfo:v4 exclusionArea:v5];
        double v13 = self->_displayInfoProvider;
        self->_displayInfoProvider = v12;

        goto LABEL_11;
      }
    }
    double v5 = 0;
    goto LABEL_10;
  }
LABEL_12:
  return displayInfoProvider;
}

- (BOOL)_UIIBAlwaysProvidePeripheryInsets
{
  return self->__UIIBAlwaysProvidePeripheryInsets;
}

+ (void)initialize
{
  if ((id)objc_opt_class() != a1) {
    return;
  }
  if (qword_1EB25C5F8 != -1) {
    dispatch_once(&qword_1EB25C5F8, &__block_literal_global_901_0);
  }
  int v2 = byte_1EB25C542;
  if (qword_1EB25C600 != -1) {
    dispatch_once(&qword_1EB25C600, &__block_literal_global_909);
  }
  int v3 = byte_1EB25C543;
  double v4 = +[_UIScreenInitialDisplayConfigurationLoader sharedLoader];
  id v8 = [v4 initialDisplayContext];

  double v5 = v8;
  if (v8)
  {
    if (!v2)
    {
      double v6 = [v8 displayConfiguration];
      +[UIScreen _FBSDisplayConfigurationConnected:v6 forInitialDisplayContext:v8 andNotify:0 forceMain:1];

      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_134_0);
LABEL_12:
      double v5 = v8;
    }
  }
  else if (!v2 || v3)
  {
    double v7 = [[UIScreen alloc] initWithDisplayConfiguration:0 forceMainScreen:1];
    _UIScreenAddScreen(v7, 1);
    [(UIScreen *)v7 _connectScreen];

    goto LABEL_12;
  }
}

+ (void)_FBSDisplayConfigurationConnected:(id)a3 forInitialDisplayContext:(id)a4 andNotify:(BOOL)a5 forceMain:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  double v12 = [v10 identity];
  double v13 = [a1 _screenWithFBSDisplayIdentity:v12];

  if (v13)
  {
    [v13 _updateDisplayConfiguration:v10];
    _UIScreenAddScreen(v13, v11 != 0);
  }
  else
  {
    double v14 = [[UIScreen alloc] initWithDisplayConfiguration:v10 forceMainScreen:v6];
    double v13 = v14;
    if (v11) {
      [(UIScreen *)v14 _setInitialDisplayContext:v11];
    }
    _UIScreenAddScreen(v13, v11 != 0);
    [v13 _connectScreen];
    if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, @"FakeMainScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EB2575AC)
    {
      if (qword_1EB25C5F8 != -1) {
        dispatch_once(&qword_1EB25C5F8, &__block_literal_global_901_0);
      }
      if (!byte_1EB25C542
        && (_UIApplicationIsExtension() & 1) == 0
        && [v13 _isEmbeddedScreen]
        && (!_UIApplicationMayVendViews()
         || (_UIInternalPreferenceUsesDefault(&_MergedGlobals_913, @"FakeMainScreenIncludeViewServices", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EB2575B4))
      {
        if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB2575C8, @"FakeMainScreenWidth", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger))double v15 = 1920.0; {
        else
        }
          double v15 = (double)qword_1EB2575D0;
        if (_UIInternalPreferenceUsesDefault((int *)algn_1EB2575D8, @"FakeMainScreenHeight", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger))double v16 = 1080.0; {
        else
        }
          double v16 = (double)qword_1EB2575E0;
        long long v17 = [v10 currentMode];
        long long v18 = objc_msgSend(v17, "_copyWithOverrideSize:", v15, v16);

        double v19 = (void *)[v10 copyWithOverrideMode:v18];
        uint64_t v20 = [[UIScreen alloc] initWithDisplayConfiguration:v19 forceMainScreen:v6];
        v20->_isFakeScreen = 1;
        [(UIScreen *)v20 _connectScreen];
        objc_storeStrong((id *)&qword_1EB25C560, v20);
        double v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIScreen", (unint64_t *)algn_1EB25C568) + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v22 = v21;
          int v23 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB2575E8, @"FakeMainScreenScale", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
          int v24 = (__int16)qword_1EB2575F0;
          if (v23) {
            int v24 = 2;
          }
          int v26 = 134218496;
          double v27 = v15;
          __int16 v28 = 2048;
          double v29 = v16;
          __int16 v30 = 1024;
          int v31 = v24;
          _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Created fake [UIScreen mainScreen] with size %f x %f and scale @%ix", (uint8_t *)&v26, 0x1Cu);
        }
      }
    }
    if (v7)
    {
      double v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v25 postNotificationName:@"_UIScreenDidConnectNotification" object:v13 userInfo:0];
      [v25 postNotificationName:@"UIScreenDidConnectNotification" object:v13 userInfo:0];
    }
  }
}

- (void)_updateDisplayConfiguration:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  double v5 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  if ([(FBSDisplayConfiguration *)v5 isEqual:v4]) {
    goto LABEL_33;
  }
  BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  BOOL v7 = [(FBSDisplayConfiguration *)v5 hardwareIdentifier];
  uint64_t v8 = [v4 hardwareIdentifier];
  v50 = v7;
  v51 = v6;
  v49 = (void *)v8;
  if (v7 == (void *)v8 || (uint64_t v9 = v8, ([v7 isEqualToString:v8] & 1) != 0))
  {
    int v44 = 0;
    v45 = 0;
  }
  else
  {
    id v10 = objc_opt_new();
    id v11 = v10;
    if (v7) {
      [v10 setObject:v7 forKey:@"_UIScreenOldUniqueIdUserInfoKey"];
    }
    if (v9) {
      [v11 setObject:v9 forKey:@"_UIScreenNewUniqueIdUserInfoKey"];
    }
    v45 = v11;
    [v6 postNotificationName:@"_UIScreenUniqueIdWillChangeNotification" object:self userInfo:v11];
    int v44 = 1;
  }
  _UIScreenWriteDisplayConfiguration((uint64_t)self, v4);
  double v12 = [(FBSDisplayConfiguration *)v5 availableModes];
  double v13 = [v4 availableModes];
  char v14 = [v12 isEqualToSet:v13];

  uint64_t v15 = [(FBSDisplayConfiguration *)v5 currentMode];
  double v16 = [v4 currentMode];
  unsigned __int8 v48 = [(id)v15 isEqual:v16];

  LODWORD(v15) = [(FBSDisplayConfiguration *)v5 isOverscanned];
  int v17 = v15 ^ [v4 isOverscanned];
  uint64_t v18 = [(FBSDisplayConfiguration *)v5 overscanCompensation];
  uint64_t v19 = [v4 overscanCompensation];
  int v47 = [(FBSDisplayConfiguration *)v5 isCloningSupported];
  int v46 = [v4 isCloningSupported];
  [(FBSDisplayConfiguration *)v5 bounds];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  [v4 bounds];
  v54.origin.double x = v28;
  v54.origin.double y = v29;
  v54.size.double width = v30;
  v54.size.double height = v31;
  v53.origin.double x = v21;
  v53.origin.double y = v23;
  v53.size.double width = v25;
  v53.size.double height = v27;
  BOOL v32 = CGRectEqualToRect(v53, v54);
  [(FBSDisplayConfiguration *)v5 scale];
  double v34 = v33;
  [v4 scale];
  double v36 = v35;
  BOOL v37 = [(FBSDisplayConfiguration *)v5 colorGamut] == 0;
  BOOL v38 = [v4 colorGamut] != 0;
  if ((v14 & 1) == 0) {
    [(UIScreen *)self _updateAvailableDisplayModes];
  }
  int v39 = v37 ^ v38;
  double v40 = vabdd_f64(v34, v36);
  if (v18 == v19) {
    char v41 = v17;
  }
  else {
    char v41 = 1;
  }
  if ((v41 & 1) != 0 || !v32 || v40 >= 2.22044605e-16 || v39 != 1) {
    [(UIScreen *)self _computeMetrics];
  }
  if (v40 < 2.22044605e-16)
  {
    v42 = v49;
    if (v39) {
      goto LABEL_24;
    }
  }
  else
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __40__UIScreen__updateDisplayConfiguration___block_invoke;
    v52[3] = &unk_1E52DAE18;
    v52[4] = self;
    +[UIScene _enumerateAllWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 asCopy:0 withBlock:v52];
    v42 = v49;
  }
  [(UIScreen *)self _updateTraits];
LABEL_24:
  if (((v48 ^ 1 | v17) & 1) != 0 || v18 != v19) {
    [v51 postNotificationName:@"UIScreenModeDidChangeNotification" object:self userInfo:0];
  }
  if (v47 != v46 && ![(UIScreen *)self _hasWindows]) {
    [v51 postNotificationName:@"UIScreenMirroredScreenDidChangeNotification" object:self];
  }
  if (v44) {
    [v51 postNotificationName:@"_UIScreenUniqueIdDidChangeNotification" object:self userInfo:v45];
  }
  displayInfoProvider = self->_displayInfoProvider;
  self->_displayInfoProvider = 0;

  [v51 postNotificationName:@"_UIScreenDisplayConfigurationUpdatedNotification" object:self];
LABEL_33:
}

- (void)_setInitialDisplayContext:(id)a3
{
}

- (void)_connectScreen
{
  if ([(UIScreen *)self _isExternal] && [(UIScreen *)self _isMainLikeScreen]) {
    [(UIScreen *)self _setInterfaceOrientation:1 andNotify:0];
  }
  else {
    [(UIScreen *)self _updateTraits];
  }
  *(_DWORD *)&self->_screenFlags |= 0x20u;
}

- (void)_updateUserInterfaceIdiom
{
  if ([(UIScreen *)self _isMainLikeScreen])
  {
    int v3 = +[UIDevice currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];
  }
  else if ([(UIScreen *)self _isCarScreen] {
         || [(UIScreen *)self _isCarInstrumentsScreen])
  }
  {
    uint64_t v4 = 3;
  }
  else
  {
    uint64_t v4 = -1;
  }
  [(UIScreen *)self _setUserInterfaceIdiom:v4];
}

- (void)_updateCapabilities
{
  v54[2] = *MEMORY[0x1E4F143B8];
  if ([(UIScreen *)self _isMainLikeScreen])
  {
    int v3 = +[UIDevice currentDevice];
    if ([v3 userInterfaceIdiom] == 2)
    {
    }
    else
    {
      CGFloat v21 = +[UIDevice currentDevice];
      uint64_t v22 = [v21 userInterfaceIdiom];

      if (v22 != 8)
      {
        v51[0] = @"UIScreenCapabilityInteractionModelsKey";
        v51[1] = @"UIScreenCapabilityTouchLevelsKey";
        v52[0] = &unk_1ED3F4488;
        v52[1] = &unk_1ED3F4470;
        CGFloat v23 = (void *)MEMORY[0x1E4F1C9E8];
        double v24 = v52;
        CGFloat v25 = v51;
        goto LABEL_23;
      }
    }
    v53[0] = @"UIScreenCapabilityInteractionModelsKey";
    v53[1] = @"UIScreenCapabilityTouchLevelsKey";
    v54[0] = &unk_1ED3F4458;
    v54[1] = &unk_1ED3F4470;
    CGFloat v23 = (void *)MEMORY[0x1E4F1C9E8];
    double v24 = v54;
    CGFloat v25 = v53;
LABEL_23:
    CGFloat v27 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:2];
    goto LABEL_43;
  }
  if ([(UIScreen *)self _isCarScreen]
    || [(UIScreen *)self _isCarInstrumentsScreen])
  {
    uint64_t v4 = [(CARSession *)self->_carSession configuration];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    double v5 = objc_msgSend(v4, "screens", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v41 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v11 = [v10 identifier];
          double v12 = [(UIScreen *)self _displayID];
          int v13 = [v11 isEqualToString:v12];

          if (v13)
          {
            unint64_t v26 = [v10 availableInteractionModels];
            uint64_t v18 = (v26 >> 1) & 2 | v26 & 8;
            if ((v26 & 2) != 0)
            {
              v18 |= 1uLL;
              uint64_t v20 = [v10 supportsHighFidelityTouch] ^ 1;
            }
            else
            {
              uint64_t v20 = 2;
            }
            unint64_t v28 = [v10 primaryInteractionModel];
            uint64_t v29 = 8;
            if ((v28 & 8) == 0) {
              uint64_t v29 = (v28 >> 1) & 1;
            }
            if ((v28 & 4) != 0) {
              uint64_t v19 = 2;
            }
            else {
              uint64_t v19 = v29;
            }

            goto LABEL_31;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    char v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIScreen", &_updateCapabilities___s_category) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v14;
      double v16 = [(UIScreen *)self _displayID];
      int v17 = [v4 screenIDs];
      *(_DWORD *)long long buf = 138543618;
      int v47 = v16;
      __int16 v48 = 2114;
      v49 = v17;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "Failed to find matching car screen. Expected: %{public}@; Found: %{public}@",
        buf,
        0x16u);
    }
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = -1;
LABEL_31:
    int v30 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_CarPlayPrimaryInteractionModel, @"CarPlayPrimaryInteractionModel", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
    uint64_t v31 = qword_1E8FD52A8;
    if (v30) {
      uint64_t v31 = 0;
    }
    if (v31) {
      uint64_t v32 = v31;
    }
    else {
      uint64_t v32 = v19;
    }
    v44[0] = @"UIScreenCapabilityInteractionModelsKey";
    double v33 = [NSNumber numberWithUnsignedInteger:v18];
    v45[0] = v33;
    v44[1] = @"UIScreenCapabilityTouchLevelsKey";
    double v34 = [NSNumber numberWithInteger:v20];
    v45[1] = v34;
    v44[2] = @"UIScreenCapabilityPrimaryInteractionModelKey";
    double v35 = [NSNumber numberWithUnsignedInteger:v32];
    v45[2] = v35;
    CGFloat v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];

    if ([v4 rightHandDrive]) {
      int v36 = 0x2000;
    }
    else {
      int v36 = 0;
    }
    self->_unint64_t screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&self->_screenFlags & 0xFFFFDFFF | v36);
    BOOL v37 = [(CARSession *)self->_carSession nightMode];
    if ([v37 BOOLValue]) {
      int v38 = 0x4000;
    }
    else {
      int v38 = 0;
    }
    self->_unint64_t screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&self->_screenFlags & 0xFFFFBFFF | v38);
  }
  else
  {
    CGFloat v27 = 0;
  }
LABEL_43:
  capabilities = self->_capabilities;
  self->_capabilities = v27;
}

- (void)_setUserInterfaceIdiom:(int64_t)a3
{
  if ((unint64_t)(a3 - 11) <= 0xFFFFFFFFFFFFFFF3)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"UIScreen.m", 2397, @"Invalid parameter not satisfying: %@", @"UIUserInterfaceIdiomFirst <= idiom && idiom <= UIUserInterfaceIdiomLast" object file lineNumber description];
  }
  self->_userInterfaceIdiom = a3;
  +[UIView _performInitializationForIdiomIfNeccessary:]((uint64_t)UIView, a3);
  [(UIScreen *)self _computeMetrics];
}

+ (void)_FBSDisplayConfigurationConnected:(id)a3 andNotify:(BOOL)a4 forceMain:(BOOL)a5
{
}

+ (void)_FBSDisplayConfigurationConnected:(id)a3 andNotify:(BOOL)a4
{
}

- (void)_updateTraits
{
  id v3 = [(UIScreen *)self _defaultTraitCollectionForInterfaceOrientation:[(UIScreen *)self _interfaceOrientation]];
  [(UIScreen *)self _setDefaultTraitCollection:v3];
}

- (id)_defaultTraitCollectionForInterfaceOrientation:(int64_t)a3
{
  -[UIScreen _boundsForInterfaceOrientation:](self, "_boundsForInterfaceOrientation:");
  return -[UIScreen _defaultTraitCollectionForInterfaceOrientation:inBounds:](self, "_defaultTraitCollectionForInterfaceOrientation:inBounds:", a3);
}

- (id)_defaultTraitCollectionForInterfaceOrientation:(int64_t)a3 inBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = +[UIDevice currentDevice];
  id v11 = +[UIView _defaultInteractionTintColorForIdiom:](UIView, "_defaultInteractionTintColorForIdiom:", [v10 userInterfaceIdiom]);

  double v12 = +[UITraitCollection _traitCollectionWithTintColor:]((uint64_t)UITraitCollection, v11);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__UIScreen__defaultTraitCollectionForInterfaceOrientation_inBounds___block_invoke;
  v15[3] = &unk_1E52F2518;
  v15[4] = self;
  v15[5] = a3;
  *(CGFloat *)&v15[6] = x;
  *(CGFloat *)&v15[7] = y;
  *(CGFloat *)&v15[8] = width;
  *(CGFloat *)&v15[9] = height;
  int v13 = [v12 traitCollectionByModifyingTraits:v15];

  return v13;
}

- (void)_setDefaultTraitCollection:(id)a3
{
  double v5 = (UITraitCollection *)a3;
  defaultTraitCollection = self->_defaultTraitCollection;
  if (defaultTraitCollection != v5)
  {
    id v11 = v5;
    BOOL v7 = [(UITraitCollection *)defaultTraitCollection isEqual:v5];
    double v5 = v11;
    if (!v7)
    {
      overrideTraitCollection = self->_overrideTraitCollection;
      if (!overrideTraitCollection) {
        overrideTraitCollection = v11;
      }
      uint64_t v9 = overrideTraitCollection;
      if ([(UIScreen *)self _isMainScreen])
      {
        os_unfair_lock_lock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);
        objc_storeStrong((id *)&self->_defaultTraitCollection, a3);
        os_unfair_lock_unlock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);
      }
      else
      {
        objc_storeStrong((id *)&self->_defaultTraitCollection, a3);
      }
      id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];

      [v10 postNotificationName:@"_UIScreenDefaultTraitCollectionDidChangeNotification" object:self userInfo:0];
      [(UIScreen *)self _notifyTraitsChangedAndPropagate];
      double v5 = v11;
    }
  }
}

- (void)_notifyTraitsChangedAndPropagate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = self->_lastNotifiedTraitCollection;
  uint64_t v4 = [(UIScreen *)self traitCollection];
  double v5 = v4;
  if (v3 != v4 && ![(UITraitCollection *)v4 isEqual:v3])
  {
    if ([(UIScreen *)self _isMainScreen]) {
      +[UITraitCollection _setBackgroundThreadFallbackTraitCollection:]((uint64_t)UITraitCollection, v5);
    }
    [(UIScreen *)self _setLastNotifiedTraitCollection:v5];
    uint64_t v6 = self;
    BOOL v7 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v6, (uint64_t)self, (uint64_t)sel_traitCollectionDidChange_);

    if (v7)
    {
      id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("TraitCollectionChange", &_notifyTraitsChangedAndPropagate___s_category)+ 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        double v12 = NSStringFromSelector(sel_traitCollectionDidChange_);
        int v13 = +[UITraitCollection _descriptionForChangeFromTraitCollection:v3 toTraitCollection:v5];
        int v14 = 138413314;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        int v17 = self;
        __int16 v18 = 2112;
        uint64_t v19 = v13;
        __int16 v20 = 2112;
        CGFloat v21 = v3;
        __int16 v22 = 2112;
        CGFloat v23 = v5;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► previous: %@\n\t► current: %@", (uint8_t *)&v14, 0x34u);
      }
    }
    [(UIScreen *)self traitCollectionDidChange:v3];
    [(UIScreen *)self _updateTraitsForWindowScenesCallingParentWillTransition:1];
    uint64_t v8 = [(UITraitCollection *)v3 userInterfaceStyle];
    if (v8 != [(UITraitCollection *)v5 userInterfaceStyle])
    {
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"_UIScreenUserInterfaceStyleDidChangeForSmartInvertNotification" object:self];
    }
  }
}

- (void)_updateTraitsForWindowScenesCallingParentWillTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 _hostsWindows])
        {
          id v11 = [v10 _screen];

          if (v11 == self) {
            [v10 _updateSceneTraitsAndPushTraitsToScreen:0 callParentWillTransitionToTraitCollection:v3];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_setLastNotifiedTraitCollection:(id)a3
{
}

- (BOOL)_isForceTouchCapable
{
  BOOL v2 = [(UIScreen *)self _isEmbeddedScreen];
  if (v2)
  {
    BOOL v3 = +[UIDevice currentDevice];
    char v4 = [v3 _supportsForceTouch];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (double)_touchRadiusScaleFactor
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  BOOL v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  if (os_variant_has_internal_diagnostics())
  {
    if (!v3)
    {
      id v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "displayConfiguration should not be nil", buf, 2u);
      }
    }
  }
  else if (!v3)
  {
    id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C588) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "displayConfiguration should not be nil", v12, 2u);
    }
  }
  [(FBSDisplayConfiguration *)v3 pixelSize];
  if (v4 >= v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  [(UIScreen *)self scale];
  double v8 = v6 / v7;

  return v8;
}

- (double)_nativeScaleWithLevel:(unint64_t)a3
{
  if ([(UIScreen *)self _isMainScreen] || self && (*((unsigned char *)&self->_screenFlags + 2) & 1) != 0)
  {
    [(UIScreen *)self _nativeDisplayBounds];
    return v5 / self->_unjailedReferenceBounds.size.width;
  }
  else
  {
    [(UIScreen *)self scale];
  }
  return result;
}

- (CGRect)_nativeDisplayBounds
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  double v5 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  [(FBSDisplayConfiguration *)v5 pixelSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v4;
  double v12 = v7;
  double v13 = v9;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (void)_setReferenceDisplayModeStatus:(int64_t)a3
{
  if ([(UIScreen *)self _isEmbeddedScreen])
  {
    int64_t referenceDisplayModeStatus = self->_referenceDisplayModeStatus;
    if (a3 || !referenceDisplayModeStatus)
    {
      self->_int64_t referenceDisplayModeStatus = a3;
      if (referenceDisplayModeStatus != a3)
      {
        id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v6 postNotificationName:@"UIScreenReferenceDisplayModeStatusDidChangeNotification" object:self userInfo:0];
      }
    }
  }
}

- (void)_setInterfaceOrientation:(int64_t)a3 andNotify:(BOOL)a4
{
  int64_t interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation != a3)
  {
    $012B70957C36FBAE3F3275CB0B70138F screenFlags = self->_screenFlags;
    if ((*(_WORD *)&screenFlags & 0x8000) != 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        long long v14 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "-[UIScreen _setInterfaceOrientation:] re-entry detected.", buf, 2u);
        }
      }
      else
      {
        double v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setInterfaceOrientation_andNotify____s_category)
                           + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long v15 = 0;
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "-[UIScreen _setInterfaceOrientation:] re-entry detected.", v15, 2u);
        }
      }
    }
    else
    {
      BOOL v7 = a4;
      self->_$012B70957C36FBAE3F3275CB0B70138F screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&screenFlags | 0x8000);
      self->_int64_t interfaceOrientation = a3;
      [(UIScreen *)self _updateTraits];
      [(UIScreen *)self _computeMetrics];
      if (v7)
      {
        double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v8 postNotificationName:@"_UIScreenInterfaceOrientationDidChangeNotification" object:self];
        if ((unint64_t)(interfaceOrientation - 1) < 2 != (unint64_t)(self->_interfaceOrientation - 1) < 2)
        {
          [(UIScreen *)self _displayPeripheryInsets];
          if (v12 != 0.0 || v9 != 0.0 || v11 != 0.0 || v10 != 0.0) {
            [v8 postNotificationName:@"_UIScreenDidChangePeripheryInsetsNotification" object:self];
          }
        }
      }
      *(_DWORD *)&self->_screenFlags &= ~0x8000u;
    }
  }
}

- (void)_setInterfaceOrientation:(int64_t)a3
{
}

void __59__UIScreen_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[UIScreen _evaluateCapturedStateForReason:](WeakRetained, @"CADisplay KVO");
}

- (void)_evaluateCapturedStateForReason:(void *)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (qword_1EB25C648 != -1) {
      dispatch_once(&qword_1EB25C648, &__block_literal_global_953);
    }
    id v4 = (id)qword_1EB25C650;
    double v5 = v4;
    if (v4)
    {
      char v6 = [v4 BOOLValue];
    }
    else
    {
      BOOL v7 = [a1 displayConfiguration];
      double v8 = [v7 CADisplay];
      char v9 = [v8 isCloned];

      if (v9)
      {
        char v6 = 1;
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        double v10 = +[UIScene _scenesIncludingInternal:1];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:buf count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          id v30 = v3;
          char v31 = 0;
          char v13 = 0;
          char v14 = 0;
          uint64_t v15 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v33 != v15) {
                objc_enumerationMutation(v10);
              }
              uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              if ([v17 _hostsWindows])
              {
                if (([v17 _hasSettingsScene] & 1) == 0)
                {
                  __int16 v18 = [v17 _screen];

                  if (v18 == a1)
                  {
                    uint64_t v19 = [v17 renderingEnvironment];
                    char v20 = [v19 isCapturingContentForAdditionalRenderingDestination];

                    if (v17 && (![v17 activationState] || objc_msgSend(v17, "activationState") == 1)) {
                      LOBYTE(v21) = 1;
                    }
                    else {
                      int v21 = [v17 _hasLifecycle] ^ 1;
                    }
                    v31 |= v21 & v20;
                    v13 |= v20 & ~(_BYTE)v21;
                    v14 |= v21;
                  }
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:buf count:16];
          }
          while (v12);

          if (v14 & 1 | ((v13 & 1) == 0)) {
            char v6 = v14 & v31;
          }
          else {
            char v6 = [a1 isCaptured];
          }
          double v5 = 0;
          id v3 = v30;
        }
        else
        {

          char v6 = 0;
        }
      }
    }

    __int16 v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIScreen", &qword_1EB25C578) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v23 = NSString;
      id v24 = a1;
      CGFloat v25 = v22;
      unint64_t v26 = (objc_class *)objc_opt_class();
      CGFloat v27 = NSStringFromClass(v26);
      unint64_t v28 = [v23 stringWithFormat:@"<%@: %p>", v27, v24];

      *(_DWORD *)long long buf = 67240706;
      int v37 = v6 & 1;
      __int16 v38 = 2114;
      int v39 = v28;
      __int16 v40 = 2114;
      id v41 = v3;
      _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_DEFAULT, "Evaluated capturing state as %{public}d on %{public}@ for %{public}@", buf, 0x1Cu);
    }
    if ((v6 & 1) != [a1 isCaptured])
    {
      objc_msgSend(a1, "_setCaptured:");
      uint64_t v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v29 postNotificationName:@"UIScreenCapturedDidChangeNotification" object:a1 userInfo:0];

      [a1 _updateTraitsForWindowScenesCallingParentWillTransition:0];
    }
  }
}

- (CGFloat)nativeScale
{
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, @"FakeMainScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EB2575AC&& self->_isFakeScreen)
  {
    int v3 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB2575E8, @"FakeMainScreenScale", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
    CGFloat result = (double)qword_1EB2575F0;
    if (v3) {
      return 2.0;
    }
  }
  else
  {
    [(UIScreen *)self _nativeScaleWithLevel:2];
    double v6 = v5;
    [(UIScreen *)self _isMainScreen];
    return v6;
  }
  return result;
}

- (double)_displayCornerRadiusIgnoringZoom
{
  unint64_t v3 = [(UIScreen *)self _screenType];
  if (v3 == -1)
  {
    [(UIScreen *)self _displayCornerRadius];
  }
  else
  {
    return _UIScreenCornerRadiusForTypeIgnoringZoom(v3);
  }
  return result;
}

- (NSInteger)maximumFramesPerSecond
{
  if (qword_1EB25C590 != -1) {
    dispatch_once(&qword_1EB25C590, &__block_literal_global_205);
  }
  if (byte_1EB25C541) {
    return 60;
  }
  return [(UIScreen *)self _maximumFramesPerSecond];
}

- (int64_t)_maximumFramesPerSecond
{
  [(UIScreen *)self _refreshRate];
  if (v2 <= 0.0) {
    return 60;
  }
  else {
    return llround(1.0 / v2);
  }
}

- (double)_refreshRate
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  unint64_t v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  [(FBSDisplayConfiguration *)v3 refreshRate];
  double v5 = v4;

  return 1.0 / v5;
}

- (CGRect)_applicationFrameWithoutOverscanForInterfaceOrientation:(int64_t)a3 usingStatusbarHeight:(double)a4 ignoreStatusBar:(BOOL)a5
{
  BOOL v5 = a5;
  if (_UIAppUseModernRotationAndPresentationBehaviors()) {
    [(UIScreen *)self _mainSceneBoundsForInterfaceOrientation:a3];
  }
  else {
    [(UIScreen *)self _referenceBounds];
  }
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  if (v5) {
    a4 = 0.0;
  }
  if ([(UIScreen *)self _userInterfaceIdiom] == 3
    && +[UIScreen _shouldDisableJail])
  {
    +[UIStatusBar_Base heightForStyle:400 orientation:1 inWindow:0];
    double v16 = v16 - v17;
    a4 = 0.0;
  }
  __int16 v18 = __UIStatusBarManagerForWindow(0);
  char v19 = [v18 isStatusBarHidden];

  if ((v19 & 1) == 0 && [(UIScreen *)self _isMainLikeScreen])
  {
    if (a4 <= 0.0 && !v5)
    {
      [(id)UIApp statusBarHeightForOrientation:a3];
      a4 = v20;
    }
    if (_UIAppUseModernRotationAndPresentationBehaviors())
    {
LABEL_15:
      double v14 = v14 + a4;
LABEL_16:
      double v16 = v16 - a4;
    }
    else
    {
      switch(a3)
      {
        case 1:
          goto LABEL_15;
        case 2:
          goto LABEL_16;
        case 3:
          goto LABEL_19;
        case 4:
          double v13 = v13 + a4;
LABEL_19:
          double v15 = v15 - a4;
          break;
        default:
          break;
      }
    }
  }
  double v21 = v13;
  double v22 = v14;
  double v23 = v15;
  double v24 = v16;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)_mainSceneBoundsForInterfaceOrientation:(int64_t)a3
{
  [(UIScreen *)self _mainSceneReferenceBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat Height = v9;
  CGFloat v12 = v11;
  if (!self
    || ![(UIScreen *)self _isExternal]
    || ![(UIScreen *)self _isMainLikeScreen])
  {
    if ((unint64_t)(a3 - 3) > 1) {
      goto LABEL_9;
    }
LABEL_8:
    v18.origin.CGFloat x = v6;
    v18.origin.CGFloat y = v8;
    v18.size.CGFloat width = Height;
    v18.size.CGFloat height = v12;
    CGFloat Width = CGRectGetWidth(v18);
    v19.origin.CGFloat x = v6;
    v19.origin.CGFloat y = v8;
    v19.size.CGFloat width = Height;
    v19.size.CGFloat height = v12;
    CGFloat Height = CGRectGetHeight(v19);
    CGFloat v12 = Width;
    goto LABEL_9;
  }
  if ((unint64_t)(a3 - 3) <= 1 && (*(_DWORD *)&self->_screenFlags & 0x10000) != 0) {
    goto LABEL_8;
  }
LABEL_9:
  double v14 = v6;
  double v15 = v8;
  double v16 = Height;
  double v17 = v12;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)_mainSceneReferenceBounds
{
  if (([(id)UIApp _appAdoptsUISceneLifecycle] & 1) != 0 || -[UIScreen _isExternal](self, "_isExternal"))
  {
    if (qword_1EB25C5F8 != -1) {
      dispatch_once(&qword_1EB25C5F8, &__block_literal_global_901_0);
    }
    if (byte_1EB25C542)
    {
      CGFloat x = *MEMORY[0x1E4F1DB28];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      CGFloat x = self->_unjailedReferenceBounds.origin.x;
      CGFloat y = self->_unjailedReferenceBounds.origin.y;
      CGFloat width = self->_unjailedReferenceBounds.size.width;
      CGFloat height = self->_unjailedReferenceBounds.size.height;
    }
  }
  else
  {
    double v7 = [(id)UIApp _findUISceneForLegacyInterfaceOrientation];
    [v7 _referenceBounds];
    CGFloat x = v8;
    CGFloat y = v9;
    CGFloat width = v10;
    CGFloat height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (id)_name
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  unint64_t v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  if (v3)
  {
    double v4 = [(FBSDisplayConfiguration *)v3 name];
  }
  else
  {
    double v4 = @"LCD";
  }

  return v4;
}

void __32__UIScreen__displayCornerRadius__block_invoke()
{
  int v0 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DisplayCornerRadiusOverride, @"DisplayCornerRadiusOverride", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  uint64_t v1 = qword_1EB2575A0;
  if (v0) {
    *(double *)&uint64_t v1 = -1.0;
  }
  _displayCornerRadius_embeddedDisplayCornerRadius = v1;
  if (*(double *)&v1 < 0.0)
  {
    double v2 = +[_UIDeviceInitialDeviceConfigurationLoader sharedLoader];
    unint64_t v3 = [v2 initialDeviceContext];
    double v4 = v3;
    if (v3)
    {
      [v3 deviceInfoFloatValueForKey:*MEMORY[0x1E4FB34D8]];
      _displayCornerRadius_embeddedDisplayCornerRadius = v5;
    }

    uint64_t v1 = _displayCornerRadius_embeddedDisplayCornerRadius;
  }
  if (*(double *)&v1 < 0.0)
  {
    CGFloat v6 = (void *)MGCopyAnswer();
    if (v6)
    {
      double v9 = v6;
      [v6 floatValue];
      CGFloat v6 = v9;
      double v8 = v7;
    }
    else
    {
      double v8 = 0.0;
    }
    _displayCornerRadius_embeddedDisplayCornerRadius = *(void *)&v8;
  }
}

uint64_t __34__UIScreen_maximumFramesPerSecond__block_invoke()
{
  uint64_t result = _UIVariableFrameDurationEnabled();
  if (result)
  {
    uint64_t result = dyld_program_sdk_at_least();
    char v1 = result ^ 1;
  }
  else
  {
    char v1 = 0;
  }
  byte_1EB25C541 = v1;
  return result;
}

- (BOOL)_isUserInterfaceLimited:(unint64_t)a3
{
  if ([(UIScreen *)self _userInterfaceIdiom] != 3) {
    return 0;
  }
  uint64_t v5 = [(CARSession *)self->_carSession limitUserInterfaces];
  int v6 = [v5 BOOLValue];

  if (!v6) {
    return 0;
  }
  float v7 = [(CARSession *)self->_carSession configuration];
  uint64_t v8 = [v7 limitableUserInterfaces];

  return (v8 & a3) != 0;
}

- (BOOL)_areListsLimited
{
  return [(UIScreen *)self _isUserInterfaceLimited:4];
}

- (CGRect)_applicationFrame
{
  int64_t v3 = [(UIScreen *)self _interfaceOrientation];
  [(UIScreen *)self _applicationFrameForInterfaceOrientation:v3];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)_applicationFrameForInterfaceOrientation:(int64_t)a3 usingStatusbarHeight:(double)a4
{
  [(UIScreen *)self _applicationFrameForInterfaceOrientation:a3 usingStatusbarHeight:0 ignoreStatusBar:a4];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)_applicationFrameForInterfaceOrientation:(int64_t)a3
{
  [(UIScreen *)self _applicationFrameForInterfaceOrientation:a3 usingStatusbarHeight:0.0];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)_mainSceneFrame
{
  if ([(UIScreen *)self _isMainScreen]
    && !+[UIApplication _isClassic])
  {
    double v7 = [(id)UIApp _mainScene];
    uint64_t v8 = [v7 settings];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    [(UIScreen *)self _referenceBounds];
    double v3 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace([(UIScreen *)self _interfaceOrientation], v10, v12, v14, v16, v17, v18);
  }
  else if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    [(UIScreen *)self _interfaceOrientedMainSceneBounds];
  }
  else
  {
    [(UIScreen *)self _mainSceneReferenceBounds];
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CADisplayLink)displayLinkWithTarget:(id)target selector:(SEL)sel
{
  id v6 = target;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  double v7 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F39B68];
    double v9 = [(FBSDisplayConfiguration *)v7 CADisplay];
    double v10 = [v8 displayLinkWithDisplay:v9 target:v6 selector:sel];
  }
  else
  {
    double v10 = 0;
  }

  return (CADisplayLink *)v10;
}

- (UITraitCollection)_defaultTraitCollection
{
  return self->_defaultTraitCollection;
}

void __22__UIScreen_initialize__block_invoke()
{
  if (!UIApp)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4F62970]);
    char v1 = (void *)_UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor;
    _UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor = (uint64_t)v0;

    double v2 = (void *)_UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor;
    double v3 = +[_UIDisplayObserver sharedObserver];
    [v2 addObserver:v3];

    id v7 = +[_UIDisplayObserver sharedObserver];
    uint64_t v4 = _UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor;
    double v5 = [(id)_UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor mainIdentity];
    id v6 = [(id)_UIInternalPreference_FakeMainScreenScale_block_invoke_liveForeverMonitor mainConfiguration];
    [v7 displayMonitor:v4 didUpdateIdentity:v5 withConfiguration:v6];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &__UIScreenCapturedKey)
  {
    objc_initWeak(&location, self);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __59__UIScreen_observeValueForKeyPath_ofObject_change_context___block_invoke;
    double v17 = &unk_1E52DC308;
    objc_copyWeak(&v18, &location);
    BSDispatchMain();
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIScreen;
    [(UIScreen *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)setWantsSoftwareDimming:(BOOL)wantsSoftwareDimming
{
  self->_wantsSoftwareDimming = wantsSoftwareDimming;
}

- (UIScreenMode)currentMode
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  double v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  if (v3)
  {
    uint64_t v4 = [(FBSDisplayConfiguration *)v3 currentMode];
    double v5 = +[UIScreenMode _screenModeForDisplayMode:v4 mainScreen:[(UIScreen *)self _isMainScreen] actualDisplayScale:self->_scale];
  }
  else
  {
    double v5 = 0;
  }

  return (UIScreenMode *)v5;
}

- (void)_setUserInterfaceStyleIfNecessary:(int64_t)a3 firstTimeOnly:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(UIScreen *)self _isMainLikeScreen]
    || ((int v7 = _UIInternalPreferenceUsesDefault(&dword_1EB2575B8, @"ApplySceneUserInterfaceStyleToScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool), byte_1EB2575BC)? (v8 = 1): (v8 = v7), !a3 || !v8))
  {
    if ((_UIInternalPreferenceUsesDefault(&dword_1EB2575C0, @"ApplySceneUserInterfaceStyleToCarScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1EB2575C4)
    {
      return;
    }
    if ([(UIScreen *)self _isCarScreen])
    {
      if (!a3) {
        return;
      }
    }
    else
    {
      BOOL v9 = [(UIScreen *)self _isCarInstrumentsScreen];
      if (!a3 || !v9) {
        return;
      }
    }
  }
  if (!v4 || !self->_lastUpdatedCanvasUserInterfaceStyle)
  {
    self->_lastUpdatedCanvasUserInterfaceStyle = a3;
    [(UIScreen *)self _updateTraits];
  }
}

- (UIScreen)mirroredScreen
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  double v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  int v4 = [(FBSDisplayConfiguration *)v3 isCloningSupported];

  if (v4 && ![(UIScreen *)self _hasWindows])
  {
    double v5 = +[UIScreen mainScreen];
  }
  else
  {
    double v5 = 0;
  }
  return (UIScreen *)v5;
}

void __22__UIScreen__carScreen__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v7 = [a2 displayConfiguration];
  int v8 = [v7 isCarDisplay];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)_carScreen
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__116;
  id v10 = __Block_byref_object_dispose__116;
  id v11 = 0;
  double v2 = _UIScreenAllScreens();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__UIScreen__carScreen__block_invoke;
  v5[3] = &unk_1E52F2478;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (CGAffineTransform)transformForScreenOriginRotation:(SEL)a3
{
  uint64_t v6 = +[UIScreen mainScreen];
  [v6 _referenceBounds];
  double v8 = v7;
  double v10 = v9;

  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v13, v8 * 0.5, v10 * 0.5);
  CGAffineTransformRotate(&v14, &v13, a4);
  CGAffineTransform v12 = v14;
  return CGAffineTransformTranslate(retstr, &v12, v8 * -0.5, v10 * -0.5);
}

+ (CGAffineTransform)transformToRotateScreen:(SEL)a3
{
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeRotation(&v11, -a4);
  double v5 = +[UIScreen mainScreen];
  [v5 _referenceBounds];
  CGAffineTransform t1 = v11;
  CGRect v13 = CGRectApplyAffineTransform(v12, &t1);
  double x = v13.origin.x;
  double y = v13.origin.y;

  CGAffineTransformMakeTranslation(&v9, -x, -y);
  CGAffineTransform t1 = v11;
  return CGAffineTransformConcat(retstr, &t1, &v9);
}

+ (id)_screenWithDisplayName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v4 = _UIScreenAllScreens();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        CGAffineTransform v9 = *(id **)(*((void *)&v14 + 1) + 8 * i);
        os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
        id v10 = v9[20];
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
        CGAffineTransform v11 = objc_msgSend(v10, "name", (void)v14);

        LOBYTE(v10) = [v11 isEqualToString:v3];
        if (v10)
        {
          CGRect v12 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  CGRect v12 = 0;
LABEL_11:

  return v12;
}

+ (id)_screenWithEventDisplay:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v4 = _UIScreenAllScreens();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          CGAffineTransform v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "_eventDisplay", (void)v14);
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          if (v10 == v3)
          {
            CGAffineTransform v11 = v3;
LABEL_14:
            id v12 = v9;

            goto LABEL_15;
          }
          CGAffineTransform v11 = v10;
          if ([v10 isEqual:v3]) {
            goto LABEL_14;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v12 = 0;
  }
  else
  {
    id v12 = +[UIScreen mainScreen];
  }
LABEL_15:

  return v12;
}

+ (id)_screenWithIntegerDisplayID:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v4 = _UIScreenAllScreens();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        CGAffineTransform v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "displayIdentity", (void)v14);
        int v11 = [v10 displayID];

        if (v11 == a3)
        {
          id v12 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

+ (void)_prepareScreensForAppResume
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v2 = +[UIScreen _screens]();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_computeMetrics", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (void)_FBSDisplayDidPossiblyConnect:(id)a3
{
}

+ (void)_FBSDisplayDidPossiblyConnect:(id)a3 withScene:(id)a4
{
}

+ (void)_FBSDisplayDidPossiblyConnect:(id)a3 withScene:(id)a4 andPost:(BOOL)a5
{
  BOOL v5 = a5;
  objc_msgSend(a4, "settings", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  long long v7 = [v8 displayConfiguration];
  [a1 _FBSDisplayConfigurationConnected:v7 andNotify:v5];
}

+ (void)_FBSDisplayDidPossiblyDisconnect:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() _FBSDisplayDidPossiblyDisconnect:v3 forSceneDestruction:0];
}

+ (void)_FBSDisplayDidPossiblyDisconnect:(id)a3 forSceneDestruction:(id)a4
{
  id v5 = [a3 identity];
  [a1 _FBSDisplayIdentityDisconnected:v5];
}

+ (void)_FBSDisplayIdentityDisconnected:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[UIScreen _screenWithFBSDisplayIdentity:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    uint64_t v25 = 0;
    unint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    double v21 = ___UIScreenRemoveScreen_block_invoke;
    double v22 = &unk_1E52E4728;
    id v7 = v6;
    id v23 = v7;
    double v24 = &v25;
    id v8 = &v19;
    os_unfair_lock_lock((os_unfair_lock_t)&__UIScreenMutableScreensArrayAccessLock);
    v21((uint64_t)v8);

    os_unfair_lock_unlock((os_unfair_lock_t)&__UIScreenMutableScreensArrayAccessLock);
    if (qword_1EB25C5F8 != -1) {
      dispatch_once(&qword_1EB25C5F8, &__block_literal_global_901_0);
    }
    if (byte_1EB25C542 && os_variant_has_internal_diagnostics())
    {
      long long v10 = *(id *)(__UILogGetCategoryCachedImpl("UIWindowSceneTraitCollection", &qword_1EB25C630)+ 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v7;
        uint64_t v12 = NSString;
        CGRect v13 = (objc_class *)objc_opt_class();
        long long v14 = NSStringFromClass(v13);
        long long v15 = [v12 stringWithFormat:@"<%@: %p>", v14, v11, v19, v20];

        id v16 = v15;
        uint64_t v17 = +[UIScreen _shortScreensDescription];
        *(_DWORD *)long long buf = 138412546;
        id v30 = v16;
        __int16 v31 = 2112;
        id v18 = (void *)v17;
        uint64_t v32 = v17;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "Removing screen %@, now we have %@", buf, 0x16u);
      }
    }
    BOOL v9 = *((unsigned char *)v26 + 24) == 0;

    _Block_object_dispose(&v25, 8);
    if (!v9)
    {
      if (*((void *)v7 + 31)) {
        *((_DWORD *)v7 + 50) |= 0x40u;
      }
      else {
        [v7 _disconnectScreen];
      }
    }
  }
}

- (UIScreen)initWithDisplayConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = -[UIScreen initWithDisplayConfiguration:forceMainScreen:](self, "initWithDisplayConfiguration:forceMainScreen:", v4, [v4 isMainDisplay]);

  return v5;
}

- (void)_invalidate
{
  *(_DWORD *)&self->_screenFlags &= 0xFFFFFFCF;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(UIScreen *)self _endObservingBacklightLevelNotifications];
  [(UIScreen *)self _setSoftwareDimmingWindow:0];
  fixedCoordinateSpace = self->_fixedCoordinateSpace;
  [(_UIScreenFixedCoordinateSpace *)fixedCoordinateSpace _setScreen:0];
}

- (void)dealloc
{
  [(UIScreen *)self _invalidate];
  _UIScreenWriteDisplayConfiguration((uint64_t)self, 0);
  v3.receiver = self;
  v3.super_class = (Class)UIScreen;
  [(UIScreen *)&v3 dealloc];
}

- (void)_updateAvailableDisplayModes
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  objc_super v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  id v4 = [(FBSDisplayConfiguration *)v3 availableModes];

  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v11 hdrMode] == 1)
        {
          [v11 pixelSize];
LABEL_12:
          if (!dyld_program_sdk_at_least()) {
            continue;
          }
          goto LABEL_13;
        }
        uint64_t v12 = [v11 hdrMode];
        [v11 pixelSize];
        if (v12 == 2 || v13 > 1920.0) {
          goto LABEL_12;
        }
LABEL_13:
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __40__UIScreen__updateAvailableDisplayModes__block_invoke;
        v20[3] = &unk_1E52F24A8;
        v20[4] = v11;
        long long v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:v20];
        id v16 = [v5 filteredArrayUsingPredicate:v15];

        if (![v16 count])
        {
          uint64_t v17 = +[UIScreenMode _screenModeForDisplayMode:v11 mainScreen:[(UIScreen *)self _isMainScreen] actualDisplayScale:self->_scale];
          [v5 addObject:v17];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  id v18 = [v5 sortedArrayUsingComparator:&__block_literal_global_184];
  availableDisplayModes = self->_availableDisplayModes;
  self->_availableDisplayModes = v18;
}

BOOL __40__UIScreen__updateAvailableDisplayModes__block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 pixelSize];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [v3 _displayMode];

  [v8 pixelSize];
  BOOL v11 = v7 == v10 && v5 == v9;

  return v11;
}

uint64_t __40__UIScreen__updateAvailableDisplayModes__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  [v5 size];
  double v7 = v6;
  [v5 size];
  double v9 = v8;

  double v10 = v7 * v9;
  [v4 size];
  double v12 = v11;
  [v4 size];
  double v14 = v13;

  uint64_t v15 = -1;
  if (v10 >= v12 * v14) {
    uint64_t v15 = 1;
  }
  if (v10 == v12 * v14) {
    return 0;
  }
  else {
    return v15;
  }
}

- (void)setDisplayConfiguration:(id)a3
{
}

void __40__UIScreen__updateDisplayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 screen];
  id v4 = *(void **)(a1 + 32);

  if (v3 == v4) {
    [v5 _updateTransformLayer];
  }
}

- (BOOL)_hasWindows
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) screen];

        if (v8 == self)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

+ (BOOL)_isProbablyBeingRecorded
{
  if (qword_1EB25C648 != -1) {
    dispatch_once(&qword_1EB25C648, &__block_literal_global_953);
  }
  id v2 = (id)qword_1EB25C650;
  id v3 = v2;
  if (v2)
  {
    char v4 = [v2 BOOLValue];
LABEL_9:

    return v4;
  }
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v5 = (unsigned int (*)(void))off_1EB25C658;
  long long v13 = off_1EB25C658;
  if (!off_1EB25C658)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __getFigOutputMonitorIsScreenProbablyBeingRecordedSymbolLoc_block_invoke;
    v9[3] = &unk_1E52D9900;
    v9[4] = &v10;
    __getFigOutputMonitorIsScreenProbablyBeingRecordedSymbolLoc_block_invoke(v9);
    uint64_t v5 = (unsigned int (*)(void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v5)
  {
    char v4 = v5() != 0;
    goto LABEL_9;
  }
  double v7 = [MEMORY[0x1E4F28B00] currentHandler];
  double v8 = [NSString stringWithUTF8String:"Boolean __FigOutputMonitorIsScreenProbablyBeingRecorded(void)"];
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"UIScreen.m", 133, @"%s", dlerror());

  __break(1u);
  return result;
}

+ (BOOL)_shouldDisableJail
{
  if (qword_1EB25C580 != -1) {
    dispatch_once(&qword_1EB25C580, &__block_literal_global_189);
  }
  return _MergedGlobals_47;
}

void __30__UIScreen__shouldDisableJail__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v0 = [v2 infoDictionary];
  char v1 = [v0 objectForKey:@"UIApplicationShouldDisableScreenJail"];
  _MergedGlobals_47 = [v1 BOOLValue];
}

- (CGRect)_unjailedReferenceBoundsInPixels
{
  double scale = self->_scale;
  double v3 = self->_unjailedReferenceBounds.origin.x * scale;
  double v4 = scale * self->_unjailedReferenceBounds.origin.y;
  double v5 = scale * self->_unjailedReferenceBounds.size.width;
  double v6 = scale * self->_unjailedReferenceBounds.size.height;
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_unjailedReferenceBoundsForInterfaceOrientation:(int64_t)a3
{
  CGFloat x = self->_unjailedReferenceBounds.origin.x;
  CGFloat y = self->_unjailedReferenceBounds.origin.y;
  CGFloat width = self->_unjailedReferenceBounds.size.width;
  CGFloat height = self->_unjailedReferenceBounds.size.height;
  if (![(UIScreen *)self _isExternal] || ![(UIScreen *)self _isMainLikeScreen])
  {
    if ((unint64_t)(a3 - 3) > 1) {
      goto LABEL_8;
    }
LABEL_7:
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    CGFloat v9 = CGRectGetWidth(v14);
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    CGFloat width = CGRectGetHeight(v15);
    CGFloat height = v9;
    goto LABEL_8;
  }
  if ((unint64_t)(a3 - 3) <= 1 && (*(_DWORD *)&self->_screenFlags & 0x10000) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)_interfaceOrientedMainSceneBounds
{
  int64_t v3 = [(UIScreen *)self _interfaceOrientation];
  [(UIScreen *)self _mainSceneBoundsForInterfaceOrientation:v3];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (double)_rotation
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  int64_t v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  [(FBSDisplayConfiguration *)v3 nativeOrientation];
  double v5 = v4;

  double result = 6.28318531 - v5;
  if (v5 == 0.0) {
    return 0.0;
  }
  return result;
}

- (int64_t)_imageOrientation
{
  [(UIScreen *)self _rotation];
  if (v3 == 0.0) {
    return 0;
  }
  [(UIScreen *)self _rotation];
  *(float *)&double v5 = v5;
  if (fabsf(*(float *)&v5 + -1.5708) < 0.00000011921) {
    return 3;
  }
  [(UIScreen *)self _rotation];
  *(float *)&double v6 = v6;
  if (fabsf(*(float *)&v6 + -4.7124) >= 0.00000011921)
  {
    double v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3A8];
    [(UIScreen *)self _rotation];
    objc_msgSend(v7, "raise:format:", v8, @"Unsupported screen orientation: %f", v9);
    return 0;
  }
  return 2;
}

- (CFTimeInterval)calibratedLatency
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  double v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  [(FBSDisplayConfiguration *)v3 latency];
  double v5 = v4;

  return v5;
}

- (UIScreenMode)preferredMode
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  double v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  if (v3)
  {
    double v4 = [(FBSDisplayConfiguration *)v3 preferredMode];
    double v5 = +[UIScreenMode _screenModeForDisplayMode:v4 mainScreen:[(UIScreen *)self _isMainScreen] actualDisplayScale:self->_scale];
  }
  else
  {
    double v5 = 0;
  }

  return (UIScreenMode *)v5;
}

- (int)bitsPerComponent
{
  return *(_DWORD *)&self->_screenFlags & 0xF;
}

- (void)setBitsPerComponent:(int)a3
{
  self->_$012B70957C36FBAE3F3275CB0B70138F screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&self->_screenFlags & 0xFFFFFFF0 | a3 & 0xF);
}

- (void)setCurrentMode:(UIScreenMode *)currentMode
{
  double v7 = currentMode;
  *(_DWORD *)&self->_screenFlags |= 0x10u;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  double v4 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  if (v7 && v4)
  {
    double v5 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:self];
    double v6 = [(UIScreenMode *)v7 _displayMode];
    [v6 nativePixelSize];
    objc_msgSend(v5, "_setScreenRequestedDisplayNativePixelSize:");
  }
}

- (NSArray)availableModes
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  displayConfiguration = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  if (displayConfiguration)
  {
    availableDisplayModes = self->_availableDisplayModes;
    if (!availableDisplayModes)
    {
      [(UIScreen *)self _updateAvailableDisplayModes];
      availableDisplayModes = self->_availableDisplayModes;
    }
    double v5 = (void *)[(NSArray *)availableDisplayModes copy];
  }
  else
  {
    double v5 = [MEMORY[0x1E4F1C978] array];
  }
  return (NSArray *)v5;
}

- (void)setOverscanCompensation:(UIScreenOverscanCompensation)overscanCompensation
{
  self->_$012B70957C36FBAE3F3275CB0B70138F screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&self->_screenFlags & 0xFFFFFC7F | ((overscanCompensation & 3) << 8) | 0x80);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  double v5 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  double v6 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:self];
  double v7 = v6;
  if (v6)
  {
    uint64_t v8 = 1;
    if (overscanCompensation == UIScreenOverscanCompensationInsetBounds) {
      uint64_t v8 = 2;
    }
    if (overscanCompensation == UIScreenOverscanCompensationNone) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v8;
    }
    [v6 _setScreenRequestedOverscanCompensation:v9];
  }
  else
  {
    double v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("OverscanCompensation", &qword_1EB25C598) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Requesting to set overscan compensation when we do not have a window scene", v11, 2u);
    }
  }
}

- (unsigned)_integerDisplayID
{
  id v2 = [(UIScreen *)self displayIdentity];
  unsigned int v3 = [v2 displayID];

  return v3;
}

- (unsigned)_seed
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  unsigned int v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  double v4 = [(FBSDisplayConfiguration *)v3 CADisplay];

  LODWORD(v3) = [v4 seed];
  return v3;
}

- (void)_limitedUIDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__UIScreen__limitedUIDidChange___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __32__UIScreen__limitedUIDidChange___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"UIScreenCarScreenLimitedUIDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (void)_externalDeviceNightModeDidChange:(id)a3
{
  double v4 = [(CARSession *)self->_carSession nightMode];
  char v5 = [v4 BOOLValue];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__UIScreen__externalDeviceNightModeDidChange___block_invoke;
  v6[3] = &unk_1E52D9FC0;
  v6[4] = self;
  char v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __46__UIScreen__externalDeviceNightModeDidChange___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 200) = *(_DWORD *)(*(void *)(a1 + 32) + 200) & 0xFFFFBFFF | (*(unsigned __int8 *)(a1 + 40) << 14);
  return [*(id *)(a1 + 32) _updateTraits];
}

- (void)_clearCarPlayHumanPresenceState
{
  *(unsigned char *)&self->_carPlayHumanPresenceStatus &= ~1u;
}

- (void)_fetchInitialCarPlayHumanPresenceStatusIfNeeded
{
  if ([(UIScreen *)self _isCarScreen])
  {
    if ((*(unsigned char *)&self->_carPlayHumanPresenceStatus & 1) == 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
      unsigned int v3 = self->__displayConfiguration;
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
      double v4 = [(FBSDisplayConfiguration *)v3 hardwareIdentifier];

      HIBYTE(v5) = 0;
      LODWORD(v5) = 0;
      BKSHIDServicesGetHumanPresenceStatus();
      *(unsigned char *)&self->_carPlayHumanPresenceStatus = *(unsigned char *)&self->_carPlayHumanPresenceStatus & 0xFC | 1;
      -[UIScreen _setCarPlayHumanPresenceInRange:](self, "_setCarPlayHumanPresenceInRange:", 0, v5);
    }
  }
}

- (BOOL)_supportsCarPlayHumanPresence
{
  return (*(unsigned char *)&self->_carPlayHumanPresenceStatus >> 1) & 1;
}

- (BOOL)_isCarPlayHumanPresenceInRange
{
  return (*(unsigned char *)&self->_carPlayHumanPresenceStatus >> 2) & 1;
}

- (void)_setCarPlayHumanPresenceInRange:(BOOL)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  char carPlayHumanPresenceStatus = (char)self->_carPlayHumanPresenceStatus;
  if (((((carPlayHumanPresenceStatus & 4) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    if (a3) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_char carPlayHumanPresenceStatus = carPlayHumanPresenceStatus & 0xFB | v6;
    char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v10 = @"IsCarPlayHumanPresenceInRange";
    uint64_t v8 = [NSNumber numberWithBool:v4];
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 postNotificationName:@"UIScreenCarPlayHumanPresenceDidChangeNotification" object:self userInfo:v9];
  }
}

- (BOOL)_expectsSecureRendering
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  unsigned int v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  char v4 = [(FBSDisplayConfiguration *)v3 expectsSecureRendering];

  return v4;
}

- (void)_prepareForWindow
{
  $012B70957C36FBAE3F3275CB0B70138F screenFlags = self->_screenFlags;
  if ((*(unsigned char *)&screenFlags & 0x10) == 0) {
    self->_$012B70957C36FBAE3F3275CB0B70138F screenFlags = ($012B70957C36FBAE3F3275CB0B70138F)(*(_DWORD *)&screenFlags | 0x10);
  }
}

- (CGFloat)currentEDRHeadroom
{
  id v2 = [(UIScreen *)self displayIdentity];
  unsigned int v3 = v2;
  if (v2)
  {
    [v2 displayID];
    CADisplayGetCurrentHeadroom();
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (void)_setScale:(double)a3
{
  self->_double scale = a3;
}

- (void)_ensureComputedMainScreenDPI
{
  if ((*((unsigned char *)&self->_screenFlags + 1) & 0x10) == 0)
  {
    if ([(UIScreen *)self _isEmbeddedScreen])
    {
      self->_pointsPerInch = 0.0;
      self->_nativePointsPerMillimeter = 0.0;
      unsigned int v3 = (void *)MGCopyAnswer();
      if (v3)
      {
        float v4 = v3;
        CFTypeID v5 = CFGetTypeID(v3);
        if (v5 == CFNumberGetTypeID())
        {
          [v4 floatValue];
          double v7 = v6;
          [(UIScreen *)self scale];
          self->_pointsPerInch = v7 / v8;
          [(UIScreen *)self nativeScale];
          self->_nativePointsPerMillimeter = v7 / 25.4 / v9;
          *(_DWORD *)&self->_screenFlags |= 0x1000u;
        }
        CFRelease(v4);
      }
    }
  }
}

- (double)_pointsPerInch
{
  return self->_pointsPerInch;
}

- (double)_nativePointsPerMillimeter
{
  return self->_nativePointsPerMillimeter;
}

- (BOOL)_isValidInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)_disconnectScreen
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)&self->_screenFlags &= ~0x40u;
  unsigned int v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIScreen", &_disconnectScreen___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    float v4 = NSString;
    CFTypeID v5 = self;
    float v6 = v3;
    double v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    double v9 = [v4 stringWithFormat:@"<%@: %p>", v8, v5];

    *(_DWORD *)long long buf = 138543362;
    double v12 = v9;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Disconnecting screen: %{public}@", buf, 0xCu);
  }
  double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"_UIScreenDidDisconnectNotification" object:self userInfo:0];
  [v10 postNotificationName:@"UIScreenDidDisconnectNotification" object:self userInfo:0];
  [(UIScreen *)self _invalidate];
}

- (id)_preventDisconnectionForReason:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && (*(_DWORD *)(a1 + 200) & 0x60) == 0x20)
  {
    if (!*(void *)(a1 + 248))
    {
      uint64_t v4 = objc_opt_new();
      CFTypeID v5 = *(void **)(a1 + 248);
      *(void *)(a1 + 248) = v4;
    }
    float v6 = objc_msgSend(NSString, "stringWithFormat:", @"UIScreen-%p-%lu", a1, ++qword_1EB25C5A0);
    id v7 = objc_alloc(MEMORY[0x1E4F4F838]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __43__UIScreen__preventDisconnectionForReason___block_invoke;
    v20[3] = &unk_1E52F24F0;
    v20[4] = a1;
    double v8 = (void *)[v7 initWithIdentifier:v6 forReason:v3 queue:MEMORY[0x1E4F14428] invalidationBlock:v20];
    [*(id *)(a1 + 248) addObject:v8];
    double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIScreen", (unint64_t *)algn_1EB25C5A8) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = NSString;
      id v11 = (id)a1;
      double v12 = v9;
      uint64_t v13 = (objc_class *)objc_opt_class();
      CGRect v14 = NSStringFromClass(v13);
      CGRect v15 = [v10 stringWithFormat:@"<%@: %p>", v14, v11];

      uint64_t v16 = *(void **)(a1 + 248);
      id v17 = v15;
      uint64_t v18 = [v16 count];
      *(_DWORD *)long long buf = 138543874;
      long long v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = v18;
      __int16 v25 = 2114;
      uint64_t v26 = v8;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "Preventing disconnection of screen: %{public}@; assertionsCount: %lu; assertion: %{public}@",
        buf,
        0x20u);
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

void __43__UIScreen__preventDisconnectionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    if (([*(id *)(v2 + 248) containsObject:v3] & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v16 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          uint64_t v17 = *(void *)(v2 + 248);
          *(_DWORD *)long long buf = 138412546;
          id v19 = v3;
          __int16 v20 = 2112;
          uint64_t v21 = v17;
          _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "Attempting to remove untracked disconnectionPreventionAssertion: %@; _disconnectionPreventionAssertions: %@",
            buf,
            0x16u);
        }
      }
      else
      {
        CGRect v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C5B0) + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = *(void *)(v2 + 248);
          *(_DWORD *)long long buf = 138412546;
          id v19 = v3;
          __int16 v20 = 2112;
          uint64_t v21 = v15;
          _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Attempting to remove untracked disconnectionPreventionAssertion: %@; _disconnectionPreventionAssertions: %@",
            buf,
            0x16u);
        }
      }
    }
    uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIScreen", &qword_1EB25C5B8) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeID v5 = NSString;
      id v6 = (id)v2;
      id v7 = v4;
      double v8 = (objc_class *)objc_opt_class();
      double v9 = NSStringFromClass(v8);
      double v10 = [v5 stringWithFormat:@"<%@: %p>", v9, v6];

      id v11 = *(void **)(v2 + 248);
      id v12 = v10;
      uint64_t v13 = [v11 count];
      *(_DWORD *)long long buf = 138543874;
      id v19 = v10;
      __int16 v20 = 2048;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      id v23 = v3;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Removing disconnectionPreventionAssertion from screen: %{public}@; assertionsCount: %lu; assertion: %{public}@; ",
        buf,
        0x20u);
    }
    [*(id *)(v2 + 248) removeObject:v3];
    if (![*(id *)(v2 + 248) count] && (*(unsigned char *)(v2 + 200) & 0x40) != 0) {
      [(id)v2 _disconnectScreen];
    }
  }
}

- (void)_resetUserInterfaceIdiom
{
  [(UIScreen *)self _updateUserInterfaceIdiom];
  [(UIScreen *)self _updateTraits];
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  -[UIScreen convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  -[UIScreen convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (id)_traitTrace:(id)a3
{
  return _UITraitTraceForTraitEnvironmentAndQueryString(self, a3);
}

- (id)_traitTrace
{
  return [(UIScreen *)self _traitTrace:0];
}

- (void)_setOverrideTraitCollection:(id)a3
{
  double v5 = (UITraitCollection *)a3;
  overrideTraitCollection = self->_overrideTraitCollection;
  if (overrideTraitCollection != v5)
  {
    double v10 = v5;
    BOOL v7 = [(UITraitCollection *)overrideTraitCollection isEqual:v5];
    double v5 = v10;
    if (!v7)
    {
      defaultTraitCollection = v10;
      if (!v10) {
        defaultTraitCollection = self->_defaultTraitCollection;
      }
      double v9 = defaultTraitCollection;
      if ([(UIScreen *)self _isMainScreen])
      {
        os_unfair_lock_lock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);
        objc_storeStrong((id *)&self->_overrideTraitCollection, a3);
        os_unfair_lock_unlock((os_unfair_lock_t)&_UIMainScreenTraitCollectionLock);
      }
      else
      {
        objc_storeStrong((id *)&self->_overrideTraitCollection, a3);
      }
      [(UIScreen *)self _notifyTraitsChangedAndPropagate];

      double v5 = v10;
    }
  }
}

- (void)_setCapability:(id)a3 forKey:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    double v8 = [(UIScreen *)self _capabilities];
    id v12 = v8;
    if (v8) {
      double v9 = (NSDictionary *)[v8 mutableCopy];
    }
    else {
      double v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    double v10 = v9;
    [(NSDictionary *)v9 setObject:v7 forKey:v6];

    capabilities = self->_capabilities;
    self->_capabilities = v10;

    [(UIScreen *)self _computeMetrics];
  }
}

- (void)_setSceneProvidedDisplayCornerRadius:(double)a3
{
  self->_sceneProvidedCornerRadius = a3;
}

- (void)_setExternalDeviceShouldInputText:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(UIScreen *)self _userInterfaceIdiom] == 3)
  {
    double v5 = [(UIScreen *)self traitCollection];
    uint64_t v6 = [v5 primaryInteractionModel];

    if (v6 != 8)
    {
      id v7 = [(CARSession *)self->_carSession inputDeviceManager];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      double v8 = objc_msgSend(v7, "inputDevices", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            [(CARSession *)self->_carSession setInputMode:v3 forInputDevice:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
  }
}

+ (id)__displayConfigurationsForViewService
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = +[UIScreen _screens]();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v8, "_isMainScreen", (void)v12) & 1) == 0
          && (![(id)UIApp _isSpringBoard] || (objc_msgSend(v8, "_isCarScreen") & 1) == 0))
        {
          uint64_t v9 = [v8 displayConfiguration];
          [v2 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v10 = (void *)[v2 copy];
  return v10;
}

- (id)fbsDisplay
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  BOOL v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  return v3;
}

- (id)_displayID
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  BOOL v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  uint64_t v4 = [(FBSDisplayConfiguration *)v3 hardwareIdentifier];
  if (!v4)
  {
    if (![(FBSDisplayConfiguration *)v3 isExternal])
    {
LABEL_8:
      uint64_t v4 = 0;
      goto LABEL_9;
    }
    uint64_t v5 = [(FBSDisplayConfiguration *)v3 CADisplay];
    [v5 update];

    uint64_t v6 = [(FBSDisplayConfiguration *)v3 CADisplay];
    uint64_t v4 = [v6 uniqueId];

    if (!v3) {
      goto LABEL_9;
    }
    if (!os_variant_has_internal_diagnostics())
    {
      if (v4) {
        goto LABEL_9;
      }
      id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C5C0) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        uint64_t v11 = self;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Could not obtain unique identifier for attached screen %@", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_8;
    }
    if (!v4)
    {
      uint64_t v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        int v10 = 138412290;
        uint64_t v11 = self;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Could not obtain unique identifier for attached screen %@", (uint8_t *)&v10, 0xCu);
      }

      goto LABEL_8;
    }
  }
LABEL_9:

  return v4;
}

- (id)_eventDisplay
{
  eventDisplaCGFloat y = self->__eventDisplay;
  if (!eventDisplay)
  {
    uint64_t v4 = [(UIScreen *)self _displayID];
    if (v4) {
      [MEMORY[0x1E4F4F2D0] displayWithHardwareIdentifier:v4];
    }
    else {
    uint64_t v5 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
    }
    uint64_t v6 = self->__eventDisplay;
    self->__eventDisplaCGFloat y = v5;

    eventDisplaCGFloat y = self->__eventDisplay;
  }
  return eventDisplay;
}

- (BOOL)_isWorkspaceCapable
{
  if ([(UIScreen *)self _isMainLikeScreen]) {
    return 1;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  uint64_t v4 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  char v5 = [(FBSDisplayConfiguration *)v4 isCarDisplay];

  return v5;
}

- (BOOL)_isSoftKeyboardLimited
{
  return [(UIScreen *)self _isUserInterfaceLimited:1];
}

- (BOOL)_areMusicListsLimited
{
  return [(UIScreen *)self _isUserInterfaceLimited:8];
}

- (BOOL)_isCarPlayNightModeEnabled
{
  if ([(UIScreen *)self _userInterfaceIdiom] == 3) {
    return (*((unsigned __int8 *)&self->_screenFlags + 1) >> 6) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_isRightHandDrive
{
  if ([(UIScreen *)self _userInterfaceIdiom] == 3) {
    return (*((unsigned __int8 *)&self->_screenFlags + 1) >> 5) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)_display
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB25C548);
  BOOL v3 = self->__displayConfiguration;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB25C548);
  uint64_t v4 = [(FBSDisplayConfiguration *)v3 CADisplay];

  return v4;
}

- (id)_lazySoftwareDimmingWindow
{
  BOOL v3 = [(UIScreen *)self _softwareDimmingWindow];
  if (!v3)
  {
    uint64_t v4 = [UISoftwareDimmingWindow alloc];
    char v5 = +[UIScreen mainScreen];
    [v5 bounds];
    BOOL v3 = -[UISoftwareDimmingWindow initWithFrame:](v4, "initWithFrame:");

    [(UIScreen *)self _setSoftwareDimmingWindow:v3];
    [(UIWindow *)v3 setHidden:0];
  }
  return v3;
}

- (float)rawBrightnessForBacklightLevel:(float)a3
{
  uint64_t v4 = [(UIScreen *)self _softwareDimmingWindow];
  [v4 overlayLevel];
  float v6 = v5 + a3;

  return v6;
}

- (void)_postBrightnessDidChangeNotificationIfAppropriate
{
  if ([(id)UIApp _isSpringBoard])
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"UIScreenBrightnessDidChangeNotification" object:self];
  }
  else
  {
    BOOL v3 = +[UIDevice currentDevice];
    [v3 _backlightLevel];
    float v5 = v4;

    [(UIScreen *)self _lastNotifiedBacklightLevel];
    if (*(float *)&v6 != v5)
    {
      id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:@"UIScreenBrightnessDidChangeNotification" object:self];
    }
    *(float *)&double v6 = v5;
    [(UIScreen *)self _setLastNotifiedBacklightLevel:v6];
  }
}

- (void)_endObservingBacklightLevelNotifications
{
  if ([(UIScreen *)self _isEmbeddedScreen])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"UIBacklightLevelChangedNotification", 0);
    float v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4FB91D8];
    CFNotificationCenterRemoveObserver(v4, self, v5, 0);
  }
}

- (void)setBrightness:(CGFloat)brightness
{
  v36[3] = *MEMORY[0x1E4F143B8];
  if ([(UIScreen *)self _supportsBrightness])
  {
    float v5 = brightness;
    float v6 = 0.0;
    if (v5 < 0.0) {
      float v5 = 0.0;
    }
    if (v5 <= 1.0) {
      float v7 = v5;
    }
    else {
      float v7 = 1.0;
    }
    id v8 = +[UIDevice currentDevice];
    [v8 _backlightLevel];
    float v10 = v9;

    uint64_t v11 = +[UIDevice currentDevice];
    [v11 _softwareDimmingAlpha];
    float v13 = v12;

    *(float *)&double v14 = v10;
    [(UIScreen *)self rawBrightnessForBacklightLevel:v14];
    double v16 = v13 + 1.0;
    float v17 = (float)(v13 + v15) / v16;
    if (v7 != v17)
    {
      double v18 = v16 * v7 - v13;
      *(float *)&double v18 = v18;
      if (self->_wantsSoftwareDimming) {
        float v19 = *(float *)&v18;
      }
      else {
        float v19 = v7;
      }
      if (v19 >= 0.0) {
        float v6 = v19;
      }
      if (v6 != v10)
      {
        *(float *)&double v18 = v6;
        [(UIScreen *)self _setLastNotifiedBacklightLevel:v18];
        __int16 v20 = +[UIDevice currentDevice];
        *(float *)&double v21 = v6;
        [v20 _setBacklightLevel:v21];

        v35[0] = @"CurrLevel";
        *(float *)&double v22 = v6;
        id v23 = [NSNumber numberWithFloat:v22];
        v36[0] = v23;
        v35[1] = @"PrevLevel";
        *(float *)&double v24 = v10;
        __int16 v25 = [NSNumber numberWithFloat:v24];
        v36[1] = v25;
        v35[2] = @"Timestamp";
        uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
        v36[2] = v26;
        uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];

        PLLogRegisteredEvent();
      }
      if (v19 < 0.0)
      {
        char v28 = [(UIScreen *)self _lazySoftwareDimmingWindow];
        *(float *)&double v29 = v19;
        [v28 setOverlayLevel:v29];

        id v30 = [(UIScreen *)self _lazySoftwareDimmingWindow];
        [v30 setHidden:0];
LABEL_17:

        return;
      }
      uint64_t v32 = [(UIScreen *)self _softwareDimmingWindow];

      if (v32)
      {
        uint64_t v33 = [(UIScreen *)self _softwareDimmingWindow];
        [v33 setHidden:1];

        [(UIScreen *)self _setSoftwareDimmingWindow:0];
      }
    }
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v30 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long v34 = 0;
        _os_log_fault_impl(&dword_1853B0000, v30, OS_LOG_TYPE_FAULT, "The brightness property is only supported by the main screen.", v34, 2u);
      }
      goto LABEL_17;
    }
    __int16 v31 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setBrightness____s_category) + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v34 = 0;
      _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "The brightness property is only supported by the main screen.", v34, 2u);
    }
  }
}

- (CGFloat)brightness
{
  if ([(UIScreen *)self _supportsBrightness])
  {
    BOOL wantsSoftwareDimming = self->_wantsSoftwareDimming;
    float v4 = +[UIDevice currentDevice];
    [v4 _backlightLevel];
    if (wantsSoftwareDimming)
    {
      -[UIScreen rawBrightnessForBacklightLevel:](self, "rawBrightnessForBacklightLevel:");
      float v7 = v6;
      id v8 = +[UIDevice currentDevice];
      [v8 _softwareDimmingAlpha];
      float v10 = (float)(v7 + v9) / (v9 + 1.0);
      double v11 = v10;
    }
    else
    {
      double v11 = v5;
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    double v14 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "The brightness property is only supported by the main screen.", buf, 2u);
    }

    return -1.0;
  }
  else
  {
    float v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &brightness___s_category) + 8);
    double v11 = -1.0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)float v15 = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "The brightness property is only supported by the main screen.", v15, 2u);
    }
  }
  return v11;
}

- (NSString)debugDescription
{
  return (NSString *)[(UIScreen *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(UIScreen *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(UIScreen *)self bounds];
  id v4 = (id)objc_msgSend(v3, "appendRect:withName:", @"bounds");
  float v5 = [(UIScreen *)self currentMode];
  if (v5) {
    id v6 = (id)[v3 appendObject:v5 withName:@"mode"];
  }
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, @"FakeMainScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EB2575AC)
  {
    id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[UIScreen _isMainScreen](self, "_isMainScreen"), @"isMainScreen");
    id v8 = (id)[v3 appendBool:self->_isFakeScreen withName:@"isFakeScreen"];
  }

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(UIScreen *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(UIScreen *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  id v6 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v6 setActiveMultilinePrefix:v4];

  [(UIScreen *)self bounds];
  id v7 = (id)objc_msgSend(v6, "appendRect:withName:", @"bounds");
  id v8 = [(UIScreen *)self currentMode];
  if (v8) {
    id v9 = (id)[v6 appendObject:v8 withName:@"mode"];
  }
  if (has_internal_diagnostics)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke;
    v12[3] = &unk_1E52D9F98;
    id v13 = v6;
    double v14 = self;
    id v10 = (id)[v13 modifyBody:v12];
  }
  return v6;
}

void __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

id __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) displayIdentity];
  id v4 = (id)[v2 appendObject:v3 withName:@"displayIdentity"];

  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_isMainLikeScreen"), @"isMainLikeScreen");
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_isExternal"), @"isExternal");
  id v7 = (id)[*(id *)(a1 + 32) appendBool:(*(_DWORD *)(*(void *)(a1 + 40) + 200) >> 5) & 1 withName:@"connected"];
  id v8 = (id)[*(id *)(a1 + 32) appendBool:(*(_DWORD *)(*(void *)(a1 + 40) + 200) >> 6) & 1 withName:@"needsDisconnection"];
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FakeMainScreen, @"FakeMainScreen", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EB2575AC)
  {
    id v9 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 208) withName:@"isFakeScreen"];
  }
  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendReferenceDisplayModeStatus:withName:skipIfNotSupported:", objc_msgSend(*(id *)(a1 + 40), "referenceDisplayModeStatus"), @"referenceDisplayModeStatus", 1);
  id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendUserInterfaceIdiom:withName:", objc_msgSend(*(id *)(a1 + 40), "_userInterfaceIdiom"), @"userInterfaceIdiom");
  id v12 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "_interfaceOrientation"), @"interfaceOrientation");
  id v13 = *(void **)(a1 + 32);
  double v14 = *(unsigned char **)(a1 + 40);
  BOOL v15 = v14
     && [*(id *)(a1 + 40) _isExternal]
     && [v14 _isMainLikeScreen]
     && (v14[202] & 1) == 0;
  id v16 = (id)[v13 appendBool:v15 withName:@"ignoresOrientationForBounds"];
  float v17 = *(void **)(a1 + 40);
  if (v17[31])
  {
    double v18 = *(void **)(a1 + 32);
    float v19 = [v18 activeMultilinePrefix];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    __int16 v25 = __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    uint64_t v26 = &unk_1E52D9F98;
    int8x16_t v22 = *(int8x16_t *)(a1 + 32);
    id v20 = (id)v22.i64[0];
    int8x16_t v27 = vextq_s8(v22, v22, 8uLL);
    [v18 appendBodySectionWithName:@"disconnectionPreventionAssertions" multilinePrefix:v19 block:&v23];

    float v17 = *(void **)(a1 + 40);
  }
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(v17, "isCaptured", *(_OWORD *)&v22, v23, v24, v25, v26), @"captured", 1);
}

void __50__UIScreen_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 248);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), 0, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

+ (id)_shortScreensDescription
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[UIScreen _screens]();
  id v4 = objc_alloc(MEMORY[0x1E4F28E78]);
  float v19 = v3;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu screen(s): ", objc_msgSend(v3, "count"));
  uint64_t v6 = (void *)[v4 initWithString:v5];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  +[UIScreen _screens]();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = objc_opt_class();
        [v11 bounds];
        v28.CGFloat width = v13;
        v28.CGFloat height = v14;
        BOOL v15 = NSStringFromCGSize(v28);
        int v16 = [v11 _isMainLikeScreen];
        float v17 = @"NO";
        if (v16) {
          float v17 = @"YES";
        }
        [v6 appendFormat:@"<%@: %p; bounds = %@; mainLike=%@> ", v12, a1, v15, v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return v6;
}

+ (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [v6 window];
  }
  uint64_t v8 = v7;
  objc_msgSend(v7, "convertPoint:fromWindow:", 0, x, y);
  objc_msgSend(v6, "convertPoint:fromView:", 0);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

+ (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [v6 window];
  }
  uint64_t v8 = v7;
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  objc_msgSend(v8, "convertPoint:toWindow:", 0);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

+ (CGRect)convertRect:(CGRect)a3 toView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [v8 window];
  }
  double v10 = v9;
  objc_msgSend(v9, "convertRect:fromWindow:", 0, x, y, width, height);
  objc_msgSend(v8, "convertRect:fromView:", 0);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

+ (CGRect)convertRect:(CGRect)a3 fromView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [v8 window];
  }
  double v10 = v9;
  objc_msgSend(v8, "convertRect:toView:", 0, x, y, width, height);
  objc_msgSend(v10, "convertRect:toWindow:", 0);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (id)_snapshotExcludingWindows:(id)a3 withRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  double v10 = (void *)MEMORY[0x1E4F1CA48];
  double v11 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 forScreen:self];
  double v12 = [v10 arrayWithArray:v11];

  if (v9 && [v9 count]) {
    [v12 removeObjectsInArray:v9];
  }
  double v13 = _UISnapshotWindowsCompatibilityRect(v12, self, x, y, width, height);

  return v13;
}

- (id)_preferredFocusedWindowScene
{
  id v2 = [(UIScreen *)self _preferredFocusedWindow];
  uint64_t v3 = [v2 windowScene];

  return v3;
}

- (UIFocusSystem)_focusSystem
{
  id v2 = [(UIScreen *)self _preferredFocusedWindowScene];
  uint64_t v3 = [v2 focusSystem];

  return (UIFocusSystem *)v3;
}

- (BOOL)_isFocusSystemLoaded
{
  id v2 = [(UIScreen *)self _preferredFocusedWindowScene];
  uint64_t v3 = [v2 focusSystem];

  return v3 != 0;
}

- (void)setFocusEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIScreen *)self _preferredFocusedWindowScene];
  id v5 = [v4 focusSystem];

  [v5 _setEnabled:v3];
}

- (id)focusedItem
{
  id v2 = [(UIScreen *)self _preferredFocusedWindowScene];
  BOOL v3 = [v2 focusSystem];

  id v4 = [v3 focusedItem];

  return v4;
}

- (UIView)focusedView
{
  id v2 = [(UIScreen *)self _preferredFocusedWindowScene];
  BOOL v3 = [v2 focusSystem];

  id v4 = [v3 _focusedView];

  return (UIView *)v4;
}

- (BOOL)supportsFocus
{
  BOOL v3 = [(UIScreen *)self _preferredFocusedWindowScene];
  if (!v3)
  {
    BOOL v3 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:self];
  }
  id v4 = _UIFocusBehaviorForScene(v3);
  char v5 = [v4 wantsFocusSystemForScene:v3];

  return v5;
}

- (BOOL)_supportsDeferredFocus
{
  id v2 = [(UIScreen *)self traitCollection];
  BOOL v3 = [v2 primaryInteractionModel] == 1;

  return v3;
}

- (UIWindow)_preferredFocusedWindow
{
  focusedWindow = self->__focusedWindow;
  if (focusedWindow)
  {
    BOOL v3 = focusedWindow;
  }
  else
  {
    BOOL v3 = [(id)UIApp _keyWindowForScreen:self];
  }
  return (UIWindow *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __UIFocusEnvironmentPreferredFocusedView(self, 0);
  BOOL v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (void)setNeedsFocusUpdate
{
  id v4 = [[_UIFocusUpdateRequest alloc] initWithEnvironment:self];
  BOOL v3 = [(UIScreen *)self _focusSystem];
  [v3 _requestFocusUpdate:v4];
}

- (void)updateFocusIfNeeded
{
  id v2 = [(UIScreen *)self _focusSystem];
  [v2 updateFocusIfNeeded];
}

- (void)_setNeedsNonDeferredFocusUpdate
{
  BOOL v3 = [_UIFocusUpdateRequest alloc];
  id v4 = [(UIScreen *)self _focusSystem];
  id v6 = [(_UIFocusUpdateRequest *)v3 initWithEnvironment:v4];

  [(_UIFocusUpdateRequest *)v6 setAllowsDeferral:0];
  char v5 = [(UIScreen *)self _focusSystem];
  [v5 _requestFocusUpdate:v6];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  if ([(UIScreen *)self _userInterfaceIdiom] == 3)
  {
    id v9 = [(UIScreen *)self _preferredFocusedWindow];
    if (v9) {
      [v8 addObject:v9];
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v10 = +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          double v16 = [v15 screen];

          if (v16 == self)
          {
            double v17 = [v15 _focusSystemSceneComponent];
            double v18 = v17;
            if (v17)
            {
              double v19 = [v17 focusSystem];
              double v20 = [v19 focusItemContainer];
              double v21 = objc_msgSend(v20, "focusItemsInRect:", x, y, width, height);
              [v8 addObjectsFromArray:v21];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }
  }
  return v8;
}

- (_UIDragManager)_dragManager
{
  if (!self->_dragManager && [(UIScreen *)self _supportsDragging])
  {
    BOOL v3 = [[_UIDragManager alloc] initWithScreen:self];
    dragManager = self->_dragManager;
    self->_dragManager = v3;
  }
  char v5 = self->_dragManager;
  return v5;
}

- (BOOL)_supportsDragging
{
  unint64_t v3 = [(UIScreen *)self _userInterfaceIdiom];
  if (v3 - 5 < 2) {
    return 1;
  }
  if (v3 > 1) {
    return 0;
  }
  return [(UIScreen *)self _isMainLikeScreen];
}

- (_UIInteractiveHighlightEnvironment)_interactiveHighlightEnvironment
{
  interactiveHighlightEnvironment = self->_interactiveHighlightEnvironment;
  if (!interactiveHighlightEnvironment)
  {
    id v4 = [[_UIInteractiveHighlightEnvironment alloc] initWithContainerScreen:self];
    char v5 = self->_interactiveHighlightEnvironment;
    self->_interactiveHighlightEnvironment = v4;

    interactiveHighlightEnvironment = self->_interactiveHighlightEnvironment;
  }
  return interactiveHighlightEnvironment;
}

- (UITraitCollection)_overrideTraitCollection
{
  return self->_overrideTraitCollection;
}

- (UITraitCollection)_lastNotifiedTraitCollection
{
  return self->_lastNotifiedTraitCollection;
}

- (BOOL)_isPerformingSystemSnapshot
{
  return self->_performingSystemSnapshot;
}

- (void)_setPerformingSystemSnapshot:(BOOL)a3
{
  self->_performingSystemSnapshot = a3;
}

- (BOOL)wantsSoftwareDimming
{
  return self->_wantsSoftwareDimming;
}

- (UISoftwareDimmingWindow)_softwareDimmingWindow
{
  return self->_softwareDimmingWindow;
}

- (void)_setSoftwareDimmingWindow:(id)a3
{
}

- (float)_lastNotifiedBacklightLevel
{
  return self->_lastNotifiedBacklightLevel;
}

- (void)_setLastNotifiedBacklightLevel:(float)a3
{
  self->_lastNotifiedBacklightLevel = a3;
}

- (void)_setCaptured:(BOOL)a3
{
  self->_captured = a3;
}

- (UIScreenReferenceDisplayModeStatus)referenceDisplayModeStatus
{
  return self->_referenceDisplayModeStatus;
}

- (void)_setUIIBAlwaysProvidePeripheryInsets:(BOOL)a3
{
  self->__UIIBAlwaysProvidePeripheryInsets = a3;
}

- (CARSession)_carSession
{
  return self->_carSession;
}

- (void)setCarSession:(id)a3
{
}

- (void)_setBoundingPathUtilities:(id)a3
{
}

- (void)_setMainScreen:(BOOL)a3
{
  self->_mainScreen = a3;
}

- (UIFocusEnvironment)_focusedWindow
{
  return self->__focusedWindow;
}

- (void)_setFocusedWindow:(id)a3
{
  self->__focusedWindow = (UIFocusEnvironment *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingPathUtilities, 0);
  objc_storeStrong((id *)&self->_carSession, 0);
  objc_storeStrong((id *)&self->_interactiveHighlightEnvironment, 0);
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_softwareDimmingWindow, 0);
  objc_storeStrong((id *)&self->_disconnectionPreventionAssertions, 0);
  objc_storeStrong((id *)&self->_lastNotifiedTraitCollection, 0);
  objc_storeStrong((id *)&self->_overrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_defaultTraitCollection, 0);
  objc_storeStrong((id *)&self->__eventDisplay, 0);
  objc_storeStrong((id *)&self->__displayConfiguration, 0);
  objc_storeStrong((id *)&self->_displayInfoProvider, 0);
  objc_storeStrong((id *)&self->_fixedCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_availableDisplayModes, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_initialDisplayContext, 0);
}

- (UIView)snapshotViewAfterScreenUpdates:(BOOL)afterUpdates
{
  return (UIView *)_UISnapshotScreenCompatibilityRectAfterCommit(self, afterUpdates, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
}

- (id)snapshotView
{
  return _UISnapshotScreenCompatibilityRectAfterCommit(self, 0, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
}

- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  id v7 = (id)objc_msgSend(v6, "ui_appendInterfaceOrientation:withName:", -[UIScreen _interfaceOrientation](self, "_interfaceOrientation"), @"orientation");
  [(UIScreen *)self applicationFrame];
  id v8 = (id)objc_msgSend(v6, "appendRect:withName:", @"applicationFrame");
  return v6;
}

- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(UIScreen *)self _orientationDebugDescriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)_orientationDebugDescription
{
  return [(UIScreen *)self _orientationDebugDescriptionWithMultilinePrefix:0];
}

- (id)_appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:(void *)a1
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = -[UIScreen _snapshotDisplaySystemIdentifier]((uint64_t)a1);
    if (v4)
    {
      uint64_t v5 = *MEMORY[0x1E4F3A500];
      id v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F3A500]];

      if (!v6)
      {
        uint64_t v10 = v5;
        v11[0] = v4;
        id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
        uint64_t v8 = objc_msgSend(v3, "bs_dictionaryByAddingEntriesFromDictionary:", v7);

        id v3 = (id)v8;
      }
    }
    id v3 = v3;

    a1 = v3;
  }

  return a1;
}

- (id)_snapshotDisplaySystemIdentifier
{
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__UIScreen_SnapshottingSupport___snapshotDisplaySystemIdentifier__block_invoke;
    v5[3] = &unk_1E52DFF48;
    v5[4] = a1;
    char v1 = +[_UISceneLifecycleMultiplexer mostActiveSceneWithTest:v5];
    id v2 = [v1 renderingEnvironment];
    id v3 = [v2 systemDisplayIdentifier];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

BOOL __65__UIScreen_SnapshottingSupport___snapshotDisplaySystemIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _hostsWindows])
  {
    id v4 = [v3 _screen];
    BOOL v5 = v4 == *(void **)(a1 + 32);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end