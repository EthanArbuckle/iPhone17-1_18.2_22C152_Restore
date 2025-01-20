@interface SBApplication
+ (BOOL)KJHKJHw39rq9w87q903475q0983rskjd;
+ (BOOL)_displayZoomSizesOnThisDeviceNeedRedaction;
+ (CGSize)_defaultLaunchingSizeForClassicMode:(int64_t)a3;
+ (CGSize)_defaultLaunchingSizeForDisplayConfiguration:(id)a3 classicMode:(int64_t)a4;
+ (CGSize)_standardCanvasSizeForClassicMode:(int64_t)a3;
+ (id)_appStateKeysToPrefetch;
+ (id)_deviceSafeAreaInsets;
+ (id)restrictedClassicModeDisplayConfigurationForDisplayConfiguration:(id)a3 classicMode:(int64_t)a4;
+ (id)snapshotSortDescriptorForContentTypeMask;
+ (id)snapshotSortDescriptorForCreationDate;
+ (id)snapshotSortDescriptorForCustomSafeAreaInsets:(id)a3;
+ (id)snapshotSortDescriptorForImageScale:(double)a3;
+ (id)snapshotSortDescriptorForInterfaceOrientationMask:(unint64_t)a3;
+ (id)snapshotSortDescriptorForLaunchInterfaceIdentifier:(id)a3;
+ (id)snapshotSortDescriptorForNames:(id)a3;
+ (id)snapshotSortDescriptorForReferenceSize:(CGSize)a3;
+ (id)snapshotSortDescriptorForRequiredOSVersion:(id)a3;
+ (id)snapshotSortDescriptorForScheme:(id)a3;
+ (id)snapshotSortDescriptorForStatusBarStateMask:(unint64_t)a3;
+ (id)snapshotSortDescriptorForUIUserInterfaceStyle:(int64_t)a3;
+ (id)snapshotSortDescriptorPreferringProtectedContent;
+ (id)snapshotSortDescriptorsForNames:(id)a3 scheme:(id)a4 imageScale:(double)a5 referenceSize:(CGSize)a6 userInterfaceStyle:(int64_t)a7 statusBarStateMask:(unint64_t)a8 interfaceOrientationMask:(unint64_t)a9 requiredOSVersion:(id)a10;
+ (int64_t)_bestAvailableClassicModeForHostingExtensionContainedInApplication:(BOOL)a3;
+ (int64_t)_bestClassicModeForScreenType:(unint64_t)a3;
+ (int64_t)_classicModeForLaunchingSize:(CGSize)a3;
+ (int64_t)_classicModeReplacingMoreSpaceWithEquivalentStandardCanvasForClassicMode:(int64_t)a3;
+ (unint64_t)_canonicalScreenTypeForClassicMode:(int64_t)a3;
+ (unint64_t)_niceScreenTypeForClassicType:(unint64_t)a3 matchingAValidDisplayZoomModeOnScreenType:(unint64_t)a4;
+ (unint64_t)_unobscuredScreenTypeForScreenType:(uint64_t)a1;
+ (void)_markAllManifestsForReingestion;
+ (void)_reingestStaticDefaultImagesForAllApps;
- (BOOL)_canLaunchInClassicMode:(int64_t)a3;
- (BOOL)_classicAppScaledOnPhone;
- (BOOL)_classicAppScaledPadOnPad;
- (BOOL)_classicAppScaledPhoneOnPad;
- (BOOL)_isClassicViaOverride;
- (BOOL)_isNewlyInstalled;
- (BOOL)_isRecentlyUpdated;
- (BOOL)_supportsApplicationType:(unint64_t)a3;
- (BOOL)_useSupportedTypesForSplashBoard;
- (BOOL)alwaysMaximizedInChamois;
- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3;
- (BOOL)classicAppFullScreen;
- (BOOL)classicAppNonFullScreenWithHomeAffordance;
- (BOOL)classicAppRequiresHiDPI;
- (BOOL)classicAppScaled;
- (BOOL)classicAppScaledWithAspectRatioCloseEnoughToBeTreatedAsFullScreen;
- (BOOL)classicAppWithOwnSafeArea;
- (BOOL)classicAppWithRoundedCorners;
- (BOOL)classicAppZoomedIn;
- (BOOL)classicAppZoomedInOrRequiresHiDPI;
- (BOOL)hasDisplayedLaunchAlertForType:(unint64_t)a3;
- (BOOL)hasHiddenTag;
- (BOOL)hasProminentlyIndicatedLocationUseWhileForeground;
- (BOOL)hasRegisteredBackgroundActivityWithIdentifier:(id)a3;
- (BOOL)hasShownDataPlanAlertSinceLock;
- (BOOL)icon:(id)a3 canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5;
- (BOOL)iconAllowsLaunch:(id)a3;
- (BOOL)iconCanTightenLabel:(id)a3;
- (BOOL)iconCanTruncateLabel:(id)a3;
- (BOOL)iconCompleteUninstall:(id)a3;
- (BOOL)includesStatusBarInClassicJailForInterfaceOrientation:(int64_t)a3;
- (BOOL)isAnyTerminationAssertionHeld;
- (BOOL)isAnyTerminationAssertionInEffect;
- (BOOL)isAppClip;
- (BOOL)isAppleApplication;
- (BOOL)isCacheCleaningTerminationAssertionHeld;
- (BOOL)isClassic;
- (BOOL)isConnectedToExternalAccessory;
- (BOOL)isFaceTime;
- (BOOL)isInternalApplication;
- (BOOL)isMedusaCapable;
- (BOOL)isMobilePhone;
- (BOOL)isNowRecordingApplication;
- (BOOL)isPaperBoard;
- (BOOL)isPlayingAudio;
- (BOOL)isRestoringIcon;
- (BOOL)isSameExecutableAsApplication:(id)a3;
- (BOOL)isSetup;
- (BOOL)isSpotlight;
- (BOOL)isSpringBoard;
- (BOOL)isSystemApplication;
- (BOOL)isTimedOutForIcon:(id)a3;
- (BOOL)isUninstallSupported;
- (BOOL)isUninstalled;
- (BOOL)isWebApplication;
- (BOOL)restrictedToTheEmbeddedDisplayInChamois;
- (BOOL)shouldReceiveSourceApplicationContextFromOriginatingApplication:(id)a3;
- (BOOL)showsProgress;
- (BOOL)supportsChamoisOnExternalDisplay;
- (BOOL)supportsChamoisViewResizing;
- (BOOL)supportsMixedOrientationForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4;
- (BOOL)supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4;
- (BOOL)supportsMultitaskingShelf;
- (BOOL)suppressesControlCenter;
- (BOOL)suppressesCoverSheetGesture;
- (BOOL)usesBackgroundNetwork;
- (BOOL)usesEdgeNetwork;
- (BOOL)usesWiFiNetwork;
- (BOOL)wantsAutoLaunchForVOIP;
- (CGRect)snapshotFrameForClassicInsideBounds:(CGRect)a3 forOrientation:(int64_t)a4 scaleFactor:(CGSize *)a5 inReferenceSpace:(BOOL)a6;
- (CGSize)defaultLaunchingSizeForDisplayConfiguration:(id)a3;
- (CGSize)snapshotSizeAdjustedForLegacyStatusBarBasedOnSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 contentFrame:(CGRect *)a5;
- (FBProcessExitContext)lastExitContext;
- (NSArray)dynamicApplicationShortcutItems;
- (NSArray)tags;
- (NSDate)nextWakeDate;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)iconIdentifier;
- (NSString)vendorName;
- (NSURL)bundleURL;
- (SBApplication)initWithApplicationInfo:(id)a3;
- (SBApplicationAppProtectionAssistant)appProtectionAssistant;
- (SBApplicationInfo)info;
- (SBApplicationProcessState)_internalProcessState;
- (SBApplicationWakeScheduler)legacyVOIPPeriodicWakeScheduler;
- (SBDisplayItemLayoutAttributes)lastWindowLayoutAttributes;
- (id)_classicModeForHostingExtensionContainedInThisApplicationInUnknownHostingHierarchy;
- (id)_dataStore;
- (id)_defaultLaunchImageBaseName;
- (id)_defaultPNGNameFromSuspensionSettingsWithExpiration:(double *)a3 sceneID:(id)a4;
- (id)_defaultPNGNameUsingFallbacksWithSceneID:(id)a3 contentOverridesContext:(id)a4;
- (id)_initializationRequestContext;
- (id)_normalizeSnapshotName:(id)a3;
- (id)_preferredImagePathByScaleInBundle:(id)a3 resourceName:(id)a4 ofType:(id)a5 scale:(double)a6 outScale:(double *)a7;
- (id)_preferredImagePathInBundle:(id)a3 baseResourceName:(id)a4 ofType:(id)a5 forMainScene:(BOOL)a6 size:(CGSize)a7 scale:(double)a8 outScale:(double *)a9;
- (id)_prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:(id)a3;
- (id)_sceneIdentifierForStoredPersistenceIdentifier:(id)a3;
- (id)_snapshotManifest;
- (id)_snapshotManifestCreateIfNeeded:(BOOL)a3;
- (id)_snapshotsWithImageName:(id)a3 sceneHandle:(id)a4 referenceSize:(CGSize)a5 requireExactSize:(BOOL)a6 launchingScale:(double)a7 contentTypeMask:(unint64_t)a8 statusBarStateMask:(unint64_t)a9 launchingOrientation:(int64_t)a10 contentOverridesContext:(id)a11 userInterfaceStyle:(int64_t)a12 displayEdgeInfo:(id)a13;
- (id)_windowSceneFromApplicationSceneHandle:(id)a3;
- (id)backgroundActivityAttributionsByIdentifier;
- (id)badgeValue;
- (id)bestSnapshotWithImageName:(id)a3 sceneHandle:(id)a4 variantID:(id)a5 scale:(double)a6 referenceSize:(CGSize)a7 requireExactSize:(BOOL)a8 contentTypeMask:(unint64_t)a9 statusBarStateMask:(unint64_t)a10 launchingOrientation:(int64_t)a11 contentOverridesContext:(id)a12 userInterfaceStyle:(int64_t)a13 displayEdgeInfo:(id)a14;
- (id)cachedImageForSnapshot:(id)a3 interfaceOrientation:(int64_t)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)folderFallbackTitleForIcon:(id)a3;
- (id)folderTitleOptionsForIcon:(id)a3;
- (id)iTunesCategoriesOrderedByRelevancyForIcon:(id)a3;
- (id)icon:(id)a3 displayNameForObscuredDisabledLaunchForLocation:(id)a4;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (id)icon:(id)a3 layerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4;
- (id)imageForSnapshot:(id)a3 interfaceOrientation:(int64_t)a4;
- (id)mostRecentSceneSnapshotsForSceneHandle:(id)a3 scale:(double)a4 launchingOrientation:(int64_t)a5;
- (id)restrictedClassicModeDisplayConfigurationForDisplayConfiguration:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)supportedGridSizeClassesForIcon:(id)a3;
- (id)tagsForIcon:(id)a3;
- (int)_applicationRestorationCheckState;
- (int)dataUsage;
- (int64_t)_classicMode;
- (int64_t)_classicModeFromSupportedTypes;
- (int64_t)_defaultClassicMode;
- (int64_t)dataOwnershipRoleAsDragDropTargetForIcon:(id)a3;
- (int64_t)labelAccessoryTypeForIcon:(id)a3;
- (int64_t)preferredSizingPolicyForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6;
- (uint64_t)_bypassesClassicMode;
- (uint64_t)_isNewEnoughToKnowAbout2020Phones;
- (uint64_t)_isNewEnoughToKnowAboutRoundPads;
- (uint64_t)_screenTypeForClassicMode:(uint64_t)a1;
- (unint64_t)_supportedTypeForClassicModeNone;
- (unint64_t)failedAutoLaunchCountForVOIP;
- (unint64_t)failedLaunchCount;
- (unint64_t)priorityForIcon:(id)a3;
- (unint64_t)supportedSizingPoliciesForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6;
- (void)__noteSnapshotDidUpdate:(int64_t)a3 forSceneIdentifier:(id)a4;
- (void)_calculateSupportedTypesForSplashBoard;
- (void)_calculateSupportedTypesLazilyIfNecessary;
- (void)_classicModeForHostingExtensionContainedInApplication:(void *)a1;
- (void)_clearSceneTitles;
- (void)_didExitWithContext:(id)a3;
- (void)_didSuspend;
- (void)_ingestDefaultPNGsInManifest:(id)a3 withLaunchImageBaseName:(id)a4;
- (void)_ingestInfoPlistImagesInManifest:(id)a3;
- (void)_invalidateBackgroundActivityAttributions;
- (void)_lockStateDidChange:(id)a3;
- (void)_noteIconDataSourceDidChange;
- (void)_noteProcess:(id)a3 didChangeToState:(id)a4;
- (void)_noteSnapshotDidUpdateForSceneIdentifier:(id)a3;
- (void)_noteSnapshotDidUpdateForSceneIdentifiers:(id)a3;
- (void)_processDidLaunch:(id)a3;
- (void)_processWillLaunch:(id)a3;
- (void)_purgeAndResetStaticDefaultImagesInSnapshotManifest;
- (void)_purgeStaticDefaultImagesInSnapshotManifest;
- (void)_recalculateApplicationSupportedTypes;
- (void)_reingestStaticDefaultImagesInSnapshotManifest;
- (void)_resetDataUsage;
- (void)_resetLaunchImageIngestionStatus;
- (void)_setApplicationRestorationCheckState:(int)a3;
- (void)_setClassicAppZoomedIn:(BOOL)a3;
- (void)_setCurrentClassicMode:(int64_t)a3;
- (void)_setDataUsage:(int)a3;
- (void)_setDefaultClassicModeOverride:(int64_t)a3;
- (void)_setInternalProcessState:(id)a3;
- (void)_setLaunchPrevented:(BOOL)a3;
- (void)_setNewlyInstalled:(BOOL)a3;
- (void)_setRecentlyUpdated:(BOOL)a3;
- (void)_updateProcess:(id)a3 withState:(id)a4;
- (void)_updateRecentlyUpdatedTimer;
- (void)_xbactivity_saveSnapshotForSceneHandle:(id)a3 context:(id)a4 completion:(id)a5;
- (void)clearNewlyInstalledAndRecentlyUpdatedStatus;
- (void)createDownscaledVariantForSnapshot:(id)a3 sceneHandle:(id)a4 scaleFactor:(double)a5 didSaveImage:(id)a6;
- (void)dealloc;
- (void)deleteAllSnapshots;
- (void)deleteSnapshotForContext:(id)a3;
- (void)flushSnapshotsForAllScenes;
- (void)flushSnapshotsForAllScenesIncludingAllLegacyImages;
- (void)flushSnapshotsForSceneID:(id)a3;
- (void)icon:(id)a3 prepareToMakeLayerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (void)launchFromIcon:(id)a3 location:(id)a4 context:(id)a5;
- (void)manifest:(id)a3 didPurgeProtectedContentSnapshotsWithGroupIdentifiers:(id)a4;
- (void)markNewlyInstalled;
- (void)markRecentlyUpdated;
- (void)preHeatForUserLaunchIfNecessaryWithAbsoluteTime:(unint64_t)a3 andContinuousTime:(unint64_t)a4;
- (void)purgeCaches;
- (void)refreshLaunchImagesInSnapshotManifestIfNeeded;
- (void)releaseBackgroundActivityAttribution:(id)a3;
- (void)saveSnapshotForSceneHandle:(id)a3 context:(id)a4 completion:(id)a5;
- (void)saveSuspendSnapshot:(id)a3 forSceneHandle:(id)a4;
- (void)setBadgeValue:(id)a3;
- (void)setConnectedToExternalAccessory:(BOOL)a3;
- (void)setDynamicApplicationShortcutItems:(id)a3;
- (void)setFailedAutoLaunchCountForVOIP:(unint64_t)a3;
- (void)setHasDisplayedLaunchAlert:(BOOL)a3 forType:(unint64_t)a4;
- (void)setHasProminentlyIndicatedLocationUseWhileForeground:(BOOL)a3;
- (void)setHasShownDataPlanAlertSinceLock:(BOOL)a3;
- (void)setInfo:(id)a3;
- (void)setLastWindowLayoutAttributes:(id)a3;
- (void)setNextWakeDate:(id)a3;
- (void)setNowRecordingApplication:(BOOL)a3;
- (void)setPlayingAudio:(BOOL)a3;
- (void)setRestoringIcon:(BOOL)a3;
- (void)setShowsProgress:(BOOL)a3;
- (void)setUninstalled:(BOOL)a3;
- (void)setUsesBackgroundNetwork:(BOOL)a3;
- (void)setUsesEdgeNetwork:(BOOL)a3;
- (void)setUsesWiFiNetwork:(BOOL)a3;
- (void)setWantsAutoLaunchForVOIP:(BOOL)a3;
- (void)takeBackgroundActivityAttribution:(id)a3;
- (void)uninstall;
@end

@implementation SBApplication

- (SBApplicationProcessState)_internalProcessState
{
  return (SBApplicationProcessState *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isCacheCleaningTerminationAssertionHeld
{
  return 0;
}

- (BOOL)iconCanTruncateLabel:(id)a3
{
  return 1;
}

- (BOOL)iconCanTightenLabel:(id)a3
{
  return 1;
}

- (BOOL)supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4
{
  id v6 = a4;
  if (a3 == 2) {
    LODWORD(self) = ![(SBApplication *)self alwaysMaximizedInChamois];
  }
  else {
    LOBYTE(self) = a3 == 1 && [(SBApplication *)self isMedusaCapable];
  }

  return (char)self;
}

- (id)_dataStore
{
  return self->_dataStore;
}

- (BOOL)isTimedOutForIcon:(id)a3
{
  v3 = [(SBApplication *)self info];
  char v4 = [v3 isBlockedForScreenTimeExpiration];

  return v4;
}

- (SBApplicationInfo)info
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_appInfo;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)classicAppNonFullScreenWithHomeAffordance
{
  if (SBFEffectiveHomeButtonType() != 2
    || [(SBApplication *)self classicAppScaledWithAspectRatioCloseEnoughToBeTreatedAsFullScreen])
  {
    return 0;
  }
  int v5 = __sb__runningInSpringBoard();
  char v6 = v5;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_17;
    }
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if (v6) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2)
    {
LABEL_16:

      goto LABEL_17;
    }
  }
  BOOL v7 = SBApplicationClassicModeExpectsRoundedCorners([(SBApplication *)self _classicMode]);
  if ((v6 & 1) == 0) {

  }
  if (v7) {
    return 0;
  }
LABEL_17:
  return [(SBApplication *)self isClassic];
}

- (BOOL)classicAppScaledWithAspectRatioCloseEnoughToBeTreatedAsFullScreen
{
  int64_t v5 = [(SBApplication *)self _classicMode];
  int v6 = __sb__runningInSpringBoard();
  char v7 = v6;
  if (v6)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (BSSizeEqualToSize())
  {
    BOOL v8 = v5 == 17;
    goto LABEL_14;
  }
  int v9 = __sb__runningInSpringBoard();
  char v10 = v9;
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (!BSSizeEqualToSize())
  {
    BOOL v8 = 0;
    if (v10) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  BOOL v8 = v5 == 17;
  if ((v10 & 1) == 0) {
LABEL_13:
  }

LABEL_14:
  if ((v7 & 1) == 0) {

  }
  if (v8) {
    return 1;
  }
  int v11 = __sb__runningInSpringBoard();
  char v12 = v11;
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  char v13 = BSSizeEqualToSize();
  if (v5 == 16) {
    char v14 = v13;
  }
  else {
    char v14 = 0;
  }
  if ((v12 & 1) == 0) {

  }
  if (v14) {
    return 1;
  }
  int v15 = __sb__runningInSpringBoard();
  char v16 = v15;
  if (v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  char v17 = BSSizeEqualToSize();
  char v18 = v5 == 20;
  if (v5 == 20) {
    char v19 = v17;
  }
  else {
    char v19 = 0;
  }
  if ((v16 & 1) == 0) {

  }
  if (v19) {
    return 1;
  }
  int v20 = __sb__runningInSpringBoard();
  char v21 = v20;
  if (v20)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (!BSSizeEqualToSize())
  {
    int v23 = __sb__runningInSpringBoard();
    char v24 = v23;
    if (v23)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [v3 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
    {
      BOOL v22 = v5 == 15;
      goto LABEL_54;
    }
    int v25 = __sb__runningInSpringBoard();
    char v26 = v25;
    if (v25)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      char v4 = [MEMORY[0x1E4F42D90] mainScreen];
      [v4 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize())
    {
      BOOL v22 = v5 == 15;
      if (v26)
      {
LABEL_54:
        if (v24)
        {
          if ((v21 & 1) == 0) {
            goto LABEL_59;
          }
        }
        else
        {

          if ((v21 & 1) == 0) {
            goto LABEL_59;
          }
        }
LABEL_56:
        if (!v22) {
          goto LABEL_60;
        }
        return 1;
      }
    }
    else
    {
      BOOL v22 = 0;
      if (v26) {
        goto LABEL_54;
      }
    }

    goto LABEL_54;
  }
  BOOL v22 = v5 == 15;
  if (v21) {
    goto LABEL_56;
  }
LABEL_59:

  if (v22) {
    return 1;
  }
LABEL_60:
  int v27 = __sb__runningInSpringBoard();
  char v28 = v27;
  if (v27)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    int v29 = __sb__runningInSpringBoard();
    char v30 = v29;
    if (v29)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [v3 _referenceBounds];
    }
    BSSizeRoundForScale();
    char v31 = BSSizeEqualToSize();
    char v18 = v5 == 20 ? v31 : 0;
    if ((v30 & 1) == 0) {
  }
    }
  if ((v28 & 1) == 0) {

  }
  if (v18) {
    return 1;
  }
  int v32 = __sb__runningInSpringBoard();
  char v33 = v32;
  if (v32)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  char v34 = BSSizeEqualToSize();
  if (v5 == 22) {
    char v35 = v34;
  }
  else {
    char v35 = 0;
  }
  if ((v33 & 1) == 0) {

  }
  if (v35) {
    return 1;
  }
  int v36 = __sb__runningInSpringBoard();
  char v37 = v36;
  if (v36)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  char v38 = BSSizeEqualToSize();
  if (v5 == 21) {
    char v39 = v38;
  }
  else {
    char v39 = 0;
  }
  if ((v37 & 1) == 0) {

  }
  if (v39) {
    return 1;
  }
  int v40 = __sb__runningInSpringBoard();
  char v41 = v40;
  if (v40)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  char v42 = BSSizeEqualToSize();
  if (v5 == 18) {
    char v43 = v42;
  }
  else {
    char v43 = 0;
  }
  if ((v41 & 1) == 0) {

  }
  if (v43) {
    return 1;
  }
  int v44 = __sb__runningInSpringBoard();
  char v45 = v44;
  if (v44)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  char v46 = BSSizeEqualToSize();
  if (v5 == 17) {
    char v47 = v46;
  }
  else {
    char v47 = 0;
  }
  if ((v45 & 1) == 0) {

  }
  if (v47) {
    return 1;
  }
  int v50 = __sb__runningInSpringBoard();
  char v51 = v50;
  if (v50)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  char v52 = BSSizeEqualToSize();
  if (v5 == 16) {
    BOOL v48 = v52;
  }
  else {
    BOOL v48 = 0;
  }
  if ((v51 & 1) == 0) {

  }
  return v48;
}

- (id)restrictedClassicModeDisplayConfigurationForDisplayConfiguration:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_msgSend((id)objc_opt_class(), "restrictedClassicModeDisplayConfigurationForDisplayConfiguration:classicMode:", v4, -[SBApplication _classicMode](self, "_classicMode"));

  return v5;
}

+ (id)restrictedClassicModeDisplayConfigurationForDisplayConfiguration:(id)a3 classicMode:(int64_t)a4
{
  id v6 = a3;
  char v7 = [v6 identity];
  BOOL v8 = v7;
  if ((unint64_t)(a4 - 1) <= 0xFFFFFFFFFFFFFFFDLL && [v7 isMainRootDisplay])
  {
    [a1 _defaultLaunchingSizeForDisplayConfiguration:v6 classicMode:a4];
    double v10 = v9;
    double v12 = v11;
    char v13 = [v6 currentMode];
    char v14 = objc_msgSend(v13, "_copyWithOverrideSize:", v10, v12);

    int v15 = (void *)[v6 copyWithOverrideMode:v14];
    if (SBApplicationClassicModeRepresentsMoreSpace(a4))
    {
      [v15 pixelSize];
      double v17 = v16;
      double v19 = v18;
      [a1 _standardCanvasSizeForClassicMode:a4];
      double v21 = v20;
      double v23 = v22;
      [v15 pointScale];
      double v25 = v23 * v24;
      double v26 = v21 * v24;
      if (v17 != v26 || v19 != v25)
      {
        char v28 = (void *)[objc_alloc(MEMORY[0x1E4F62920]) initWithConfiguration:v15];
        [v15 _nativeBounds];
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        [v15 bounds];
        objc_msgSend(v28, "setPixelSize:nativeBounds:bounds:", v26, v25, v30, v32, v34, v36, v37, v38, v39, v40);
        id v45 = 0;
        uint64_t v41 = [v28 buildConfigurationWithError:&v45];
        id v42 = v45;

        if (v42)
        {
          char v43 = SBLogClassicMode();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            +[SBApplication(Classic) restrictedClassicModeDisplayConfigurationForDisplayConfiguration:classicMode:](v42, v43);
          }
        }
        int v15 = (void *)v41;
      }
    }

    id v6 = v15;
  }

  return v6;
}

- (BOOL)classicAppWithRoundedCorners
{
  uint64_t v2 = [(SBApplication *)self _classicMode];
  return SBApplicationClassicModeExpectsRoundedCorners(v2);
}

- (BOOL)isSetup
{
  uint64_t v2 = [(SBApplication *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.purplebuddy"];

  return v3;
}

- (BOOL)supportsMixedOrientationForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4
{
  id v6 = a4;
  if (a3 >= 2)
  {
    if (a3 == 2) {
      LODWORD(self) = ![(SBApplication *)self supportsChamoisSceneResizing];
    }
    else {
      LOBYTE(self) = 0;
    }
  }
  else
  {
    LOBYTE(self) = [(SBApplication *)self classicAppPhoneAppRunningOnPad];
  }

  return (char)self;
}

- (BOOL)_classicAppScaledPhoneOnPad
{
  if (![(SBApplication *)self isClassic]) {
    goto LABEL_5;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      return ![(SBApplication *)self _classicAppScaledPadOnPad];
    }
LABEL_5:
    LOBYTE(v3) = 0;
    return v3;
  }
  id v4 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v4 userInterfaceIdiom] == 1) {
    BOOL v3 = ![(SBApplication *)self _classicAppScaledPadOnPad];
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)isMedusaCapable
{
  if (![(SBApplicationInfo *)self->_appInfo wantsFullScreen]
    || (BOOL v3 = [(SBApplication *)self isClassic]))
  {
    if (self->_calculatedSupportedTypes)
    {
      BOOL v4 = [(SBApplication *)self isClassic];
LABEL_5:
      LOBYTE(v3) = !v4;
      return v3;
    }
    BOOL v3 = [(SBApplicationInfo *)self->_appInfo usesSplashBoard];
    if (v3)
    {
      BOOL v3 = [(SBApplicationInfo *)self->_appInfo isMonarchLinked];
      if (v3)
      {
        BOOL v4 = [(SBApplication *)self _isClassicViaOverride];
        goto LABEL_5;
      }
    }
  }
  return v3;
}

- (BOOL)isClassic
{
  return (unint64_t)([(SBApplication *)self _classicMode] - 1) < 0xFFFFFFFFFFFFFFFELL;
}

- (int64_t)_classicMode
{
  if (self->_currentClassicMode == -1) {
    return [(SBApplication *)self _defaultClassicMode];
  }
  else {
    return self->_currentClassicMode;
  }
}

- (int64_t)_defaultClassicMode
{
  int64_t result = self->_defaultClassicModeOverride;
  if (result == -1)
  {
    [(SBApplication *)self _calculateSupportedTypesLazilyIfNecessary];
    int64_t result = [(SBApplication *)self _classicModeFromSupportedTypes];
    if (result == -1) {
      return 0;
    }
  }
  return result;
}

- (void)_calculateSupportedTypesLazilyIfNecessary
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  if (self->_calculatedSupportedTypes) {
    return;
  }
  if (-[SBApplication _bypassesClassicMode]((uint64_t)self))
  {
    self->_supportedTypes |= 0xFFFFFFFFFFFF3FFFLL;
    goto LABEL_332;
  }
  uint64_t v5 = 168;
  if ([(SBApplicationInfo *)self->_appInfo usesSplashBoard])
  {
    [(SBApplication *)self _calculateSupportedTypesForSplashBoard];
    goto LABEL_332;
  }
  id v6 = (double *)MGCopyAnswer();
  char v7 = [(SBApplication *)self _snapshotManifest];
  uint64_t v8 = [MEMORY[0x1E4FA58C8] predicate];
  [(id)v8 setContentTypeMask:4];
  [(id)v8 setRequiredOSVersion:v6];
  double v9 = [v7 defaultGroupIdentifier];
  v115 = (void *)v8;
  v116 = v7;
  v117 = [v7 snapshotsForGroupID:v9 matchingPredicate:v8];

  if (![(SBApplication *)self _supportsApplicationType:2]) {
    goto LABEL_86;
  }
  int v10 = __sb__runningInSpringBoard();
  char v11 = v10;
  if (v10)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      BOOL v12 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom] != 1)
    {
      BOOL v12 = 0;
LABEL_18:

      goto LABEL_19;
    }
  }
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v12 = v13 >= *(double *)(MEMORY[0x1E4FA6E50] + 264);
  if ((v2 & 1) == 0) {

  }
  if ((v11 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_19:
  int v14 = __sb__runningInSpringBoard();
  char v15 = v14;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      BOOL v16 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom] != 1)
    {
      BOOL v16 = 0;
LABEL_30:

      goto LABEL_31;
    }
  }
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v16 = v17 >= *(double *)(MEMORY[0x1E4FA6E50] + 248);
  if ((v2 & 1) == 0) {

  }
  if ((v15 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_31:
  int v18 = __sb__runningInSpringBoard();
  char v19 = v18;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2 || SBFEffectiveHomeButtonType() != 2)
    {
      BOOL v20 = 0;
      goto LABEL_45;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom] != 1 || SBFEffectiveHomeButtonType() != 2)
    {
      BOOL v20 = 0;
LABEL_44:

      goto LABEL_45;
    }
  }
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v20 = v21 >= *(double *)(MEMORY[0x1E4FA6E50] + 328);
  if ((v2 & 1) == 0) {

  }
  if ((v19 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_45:
  int v22 = __sb__runningInSpringBoard();
  char v23 = v22;
  if (!v22)
  {
    uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v2 userInterfaceIdiom] != 1 || SBFEffectiveHomeButtonType() != 2)
    {
      uint64_t v8 = 0;
      goto LABEL_61;
    }
LABEL_51:
    int v24 = __sb__runningInSpringBoard();
    char v25 = v24;
    if (v24)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v124 = [MEMORY[0x1E4F42D90] mainScreen];
      [v124 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v26 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      uint64_t v8 = [(SBApplicationInfo *)self->_appInfo isPeaceBLinked];
      if (v25) {
        goto LABEL_60;
      }
    }
    else
    {
      uint64_t v8 = 0;
      if (v25)
      {
LABEL_60:
        if (v23) {
          goto LABEL_62;
        }
LABEL_61:

        goto LABEL_62;
      }
    }

    goto LABEL_60;
  }
  if (SBFEffectiveDeviceClass() == 2 && SBFEffectiveHomeButtonType() == 2) {
    goto LABEL_51;
  }
  uint64_t v8 = 0;
LABEL_62:
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v27 = v117;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v131 objects:v136 count:16];
  if (!v28)
  {

    goto LABEL_84;
  }
  uint64_t v29 = v28;
  v114 = v6;
  uint64_t v30 = *(void *)v132;
  do
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if (*(void *)v132 != v30) {
        objc_enumerationMutation(v27);
      }
      objc_msgSend(*(id *)(*((void *)&v131 + 1) + 8 * i), "referenceSize", v114);
      if (v12 && BSSizeEqualToSize())
      {
        unint64_t supportedTypes = self->_supportedTypes;
        if (v8) {
          unint64_t v33 = supportedTypes | 0x18000000;
        }
        else {
          unint64_t v33 = supportedTypes | 0x8000000;
        }
        goto LABEL_78;
      }
      if (v16 && BSSizeEqualToSize())
      {
        unint64_t v33 = self->_supportedTypes | 0x400000;
LABEL_78:
        self->_unint64_t supportedTypes = v33;
        continue;
      }
      if (v20 && BSSizeEqualToSize())
      {
        unint64_t v33 = self->_supportedTypes | 0x800000;
        goto LABEL_78;
      }
    }
    uint64_t v29 = [v27 countByEnumeratingWithState:&v131 objects:v136 count:16];
  }
  while (v29);

  id v6 = v114;
  if (!self) {
    goto LABEL_86;
  }
LABEL_84:
  if ([(SBApplicationInfo *)self->_appInfo isPeaceBLinked]) {
    self->_supportedTypes |= 0x20000uLL;
  }
LABEL_86:
  if (![(SBApplication *)self _supportsApplicationType:1]) {
    goto LABEL_331;
  }
  uint64_t v34 = __sb__runningInSpringBoard();
  uint64_t v35 = MEMORY[0x1E4FA6E50];
  double v36 = (double *)MEMORY[0x1E4FA6E50];
  if (!v34)
  {
    uint64_t v8 = [MEMORY[0x1E4F42948] currentDevice];
    if (![(id)v8 userInterfaceIdiom]) {
      goto LABEL_93;
    }
    char v37 = 0;
    int v38 = 1;
LABEL_98:
    uint64_t v41 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v42 = [v41 userInterfaceIdiom];

    BOOL v122 = (v42 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    if ((v37 & 1) == 0) {
      goto LABEL_102;
    }
LABEL_99:

    if (v38) {
      goto LABEL_103;
    }
    goto LABEL_104;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
  {
    char v37 = 0;
    int v38 = 0;
    goto LABEL_98;
  }
LABEL_93:
  int v38 = v34 ^ 1;
  int v39 = __sb__runningInSpringBoard();
  if (v39)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v34 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v34 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v40 < *(double *)(v35 + 40))
  {
    char v37 = v39 ^ 1;
    goto LABEL_98;
  }
  BOOL v122 = 1;
  if ((v39 & 1) == 0) {
    goto LABEL_99;
  }
LABEL_102:
  if (v38) {
LABEL_103:
  }

LABEL_104:
  uint64_t v43 = __sb__runningInSpringBoard();
  if (!v43)
  {
    uint64_t v8 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v8 userInterfaceIdiom])
    {
      char v46 = 0;
      int v45 = 1;
      goto LABEL_116;
    }
LABEL_110:
    int v44 = v36;
    goto LABEL_111;
  }
  if (!SBFEffectiveDeviceClass()) {
    goto LABEL_110;
  }
  int v44 = v36;
  if (SBFEffectiveDeviceClass() != 1)
  {
    int v45 = 0;
    char v46 = 0;
    goto LABEL_116;
  }
LABEL_111:
  int v45 = v43 ^ 1;
  int v47 = __sb__runningInSpringBoard();
  if (v47)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v43 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v43 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v48 >= v44[7])
  {
    BOOL v121 = 1;
    if ((v47 & 1) == 0) {
      goto LABEL_117;
    }
LABEL_120:
    if (!v45) {
      goto LABEL_122;
    }
    goto LABEL_121;
  }
  char v46 = v47 ^ 1;
LABEL_116:
  int v44 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v49 = [v44 userInterfaceIdiom];

  BOOL v121 = (v49 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if ((v46 & 1) == 0) {
    goto LABEL_120;
  }
LABEL_117:

  if (v45) {
LABEL_121:
  }

LABEL_122:
  int v50 = __sb__runningInSpringBoard();
  v114 = v6;
  if (v50)
  {
    if (SBFEffectiveDeviceClass())
    {
      char v51 = v36;
      if (SBFEffectiveDeviceClass() != 1)
      {
        int v52 = 0;
        int v53 = 0;
        goto LABEL_133;
      }
    }
    else
    {
      char v51 = v36;
    }
LABEL_129:
    int v52 = v50 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v54 = __sb__runningInSpringBoard();
      if (v54)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v8 = [MEMORY[0x1E4F42D90] mainScreen];
        [(id)v8 _referenceBounds];
      }
      int v53 = v54 ^ 1;
      BSSizeRoundForScale();
      if (v59 >= v51[11])
      {
        BOOL v126 = 1;
        goto LABEL_161;
      }
    }
    else
    {
      int v53 = 0;
    }
  }
  else
  {
    int v44 = [MEMORY[0x1E4F42948] currentDevice];
    char v51 = v36;
    if (![v44 userInterfaceIdiom]) {
      goto LABEL_129;
    }
    int v53 = 0;
    int v52 = 1;
  }
LABEL_133:
  int v55 = __sb__runningInSpringBoard();
  char v56 = v55;
  if (!v55)
  {
    double v36 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v36 userInterfaceIdiom] == 1)
    {
      if (SBFEffectiveHomeButtonType() == 2) {
        goto LABEL_139;
      }
      BOOL v126 = 0;
      goto LABEL_160;
    }

LABEL_142:
    BOOL v126 = 0;
    goto LABEL_161;
  }
  if (SBFEffectiveDeviceClass() != 2) {
    goto LABEL_142;
  }
  if (SBFEffectiveHomeButtonType() != 2)
  {
    BOOL v126 = 0;
    goto LABEL_151;
  }
LABEL_139:
  id v6 = v44;
  int v57 = __sb__runningInSpringBoard();
  char v58 = v57;
  if (v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    int v44 = [MEMORY[0x1E4F42D90] mainScreen];
    [v44 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v126 = v60 >= v51[53];
  if ((v58 & 1) == 0) {

  }
  int v44 = v6;
  if (v56)
  {
LABEL_151:
    if (!v53) {
      goto LABEL_152;
    }
LABEL_162:

    if ((v52 & 1) == 0) {
      goto LABEL_154;
    }
LABEL_153:

    goto LABEL_154;
  }
LABEL_160:

LABEL_161:
  if (v53) {
    goto LABEL_162;
  }
LABEL_152:
  if (v52) {
    goto LABEL_153;
  }
LABEL_154:
  int v61 = __sb__runningInSpringBoard();
  if (v61)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v62 = 0;
      int v63 = 0;
      goto LABEL_168;
    }
LABEL_164:
    int v62 = v61 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v64 = __sb__runningInSpringBoard();
      if (v64)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v124 = [MEMORY[0x1E4F42D90] mainScreen];
        [v124 _referenceBounds];
      }
      int v63 = v64 ^ 1;
      BSSizeRoundForScale();
      if (v70 >= v51[15])
      {
        BOOL v67 = 1;
        goto LABEL_196;
      }
    }
    else
    {
      int v63 = 0;
    }
  }
  else
  {
    int v44 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v44 userInterfaceIdiom]) {
      goto LABEL_164;
    }
    int v63 = 0;
    int v62 = 1;
  }
LABEL_168:
  int v65 = __sb__runningInSpringBoard();
  char v66 = v65;
  if (!v65)
  {
    double v36 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v36 userInterfaceIdiom] == 1)
    {
      if (SBFEffectiveHomeButtonType() == 2) {
        goto LABEL_174;
      }
      BOOL v67 = 0;
      goto LABEL_195;
    }

LABEL_177:
    BOOL v67 = 0;
    goto LABEL_196;
  }
  if (SBFEffectiveDeviceClass() != 2) {
    goto LABEL_177;
  }
  if (SBFEffectiveHomeButtonType() != 2)
  {
    BOOL v67 = 0;
    goto LABEL_186;
  }
LABEL_174:
  v123 = v44;
  id v6 = (double *)0x1E4F42000;
  int v68 = __sb__runningInSpringBoard();
  char v69 = v68;
  if (v68)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    int v44 = [MEMORY[0x1E4F42D90] mainScreen];
    [v44 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v67 = v71 >= v51[53];
  if ((v69 & 1) == 0) {

  }
  int v44 = v123;
  if (v66)
  {
LABEL_186:
    v72 = v124;
    if (!v63) {
      goto LABEL_187;
    }
LABEL_197:

    if ((v62 & 1) == 0) {
      goto LABEL_189;
    }
LABEL_188:

    goto LABEL_189;
  }
LABEL_195:

LABEL_196:
  v72 = v124;
  if (v63) {
    goto LABEL_197;
  }
LABEL_187:
  if (v62) {
    goto LABEL_188;
  }
LABEL_189:
  int v73 = __sb__runningInSpringBoard();
  if (v73)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v74 = 0;
      int v75 = 0;
      goto LABEL_203;
    }
LABEL_199:
    int v74 = v73 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v76 = __sb__runningInSpringBoard();
      if (v76)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v123 = [MEMORY[0x1E4F42D90] mainScreen];
        [v123 _referenceBounds];
      }
      int v75 = v76 ^ 1;
      BSSizeRoundForScale();
      if (v81 >= v51[13])
      {
        BOOL v125 = 1;
        goto LABEL_231;
      }
    }
    else
    {
      int v75 = 0;
    }
  }
  else
  {
    int v44 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v44 userInterfaceIdiom]) {
      goto LABEL_199;
    }
    int v75 = 0;
    int v74 = 1;
  }
LABEL_203:
  int v77 = __sb__runningInSpringBoard();
  char v78 = v77;
  if (!v77)
  {
    double v36 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v36 userInterfaceIdiom] == 1)
    {
      if (SBFEffectiveHomeButtonType() == 2) {
        goto LABEL_209;
      }
      BOOL v125 = 0;
      goto LABEL_230;
    }

LABEL_212:
    BOOL v125 = 0;
    goto LABEL_231;
  }
  if (SBFEffectiveDeviceClass() != 2) {
    goto LABEL_212;
  }
  if (SBFEffectiveHomeButtonType() != 2)
  {
    BOOL v125 = 0;
    goto LABEL_221;
  }
LABEL_209:
  v120 = v44;
  id v6 = (double *)0x1E4F42000;
  int v79 = __sb__runningInSpringBoard();
  char v80 = v79;
  if (v79)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    int v44 = [MEMORY[0x1E4F42D90] mainScreen];
    [v44 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v125 = v82 >= v51[53];
  if ((v80 & 1) == 0) {

  }
  int v44 = v120;
  if (v78)
  {
LABEL_221:
    v83 = v123;
    if (!v75) {
      goto LABEL_222;
    }
LABEL_232:

    if ((v74 & 1) == 0) {
      goto LABEL_224;
    }
LABEL_223:

    goto LABEL_224;
  }
LABEL_230:

LABEL_231:
  v83 = v123;
  if (v75) {
    goto LABEL_232;
  }
LABEL_222:
  if (v74) {
    goto LABEL_223;
  }
LABEL_224:
  int v84 = __sb__runningInSpringBoard();
  if (v84)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v85 = 0;
      int v86 = 0;
      goto LABEL_238;
    }
LABEL_234:
    uint64_t v85 = v84 ^ 1u;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v87 = __sb__runningInSpringBoard();
      if (v87)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v123 = [MEMORY[0x1E4F42D90] mainScreen];
        [v123 _referenceBounds];
      }
      int v86 = v87 ^ 1;
      BSSizeRoundForScale();
      if (v93 >= v51[17])
      {
        BOOL v90 = 1;
        goto LABEL_271;
      }
    }
    else
    {
      int v86 = 0;
    }
  }
  else
  {
    v120 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v120 userInterfaceIdiom]) {
      goto LABEL_234;
    }
    int v86 = 0;
    uint64_t v85 = 1;
  }
LABEL_238:
  int v88 = __sb__runningInSpringBoard();
  char v89 = v88;
  if (!v88)
  {
    id v6 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v6 userInterfaceIdiom] == 1)
    {
      if (SBFEffectiveHomeButtonType() == 2) {
        goto LABEL_244;
      }
      BOOL v90 = 0;
      goto LABEL_270;
    }

LABEL_247:
    BOOL v90 = 0;
    goto LABEL_271;
  }
  if (SBFEffectiveDeviceClass() != 2) {
    goto LABEL_247;
  }
  if (SBFEffectiveHomeButtonType() != 2)
  {
    BOOL v90 = 0;
    goto LABEL_256;
  }
LABEL_244:
  int v91 = __sb__runningInSpringBoard();
  char v92 = v91;
  if (v91)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    int v44 = [MEMORY[0x1E4F42D90] mainScreen];
    [v44 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v90 = v94 >= v51[53];
  if ((v92 & 1) == 0) {

  }
  if (v89)
  {
LABEL_256:
    v95 = v123;
    if (!v86) {
      goto LABEL_257;
    }
LABEL_272:

    if ((v85 & 1) == 0) {
      goto LABEL_259;
    }
LABEL_258:

    goto LABEL_259;
  }
LABEL_270:

LABEL_271:
  v95 = v123;
  if (v86) {
    goto LABEL_272;
  }
LABEL_257:
  if (v85) {
    goto LABEL_258;
  }
LABEL_259:
  int v96 = __sb__runningInSpringBoard();
  char v97 = v96;
  if (v96)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      BOOL v98 = 0;
      goto LABEL_301;
    }
    if (SBFEffectiveHomeButtonType() != 2)
    {
      BOOL v98 = 0;
      if (v97) {
        goto LABEL_301;
      }
LABEL_300:

      goto LABEL_301;
    }
  }
  else
  {
    uint64_t v85 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v85 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2)
    {
      BOOL v98 = 0;
      goto LABEL_300;
    }
  }
  int v99 = __sb__runningInSpringBoard();
  char v100 = v99;
  if (v99)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v123 = [MEMORY[0x1E4F42D90] mainScreen];
    [v123 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v101 < v51[9])
  {
    BOOL v98 = 0;
    if ((v100 & 1) == 0) {
      goto LABEL_278;
    }
LABEL_299:
    if (v97) {
      goto LABEL_301;
    }
    goto LABEL_300;
  }
  v102 = (double *)0x1E4F42000;
  int v103 = __sb__runningInSpringBoard();
  char v104 = v103;
  if (!v103)
  {
    v102 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v102 userInterfaceIdiom])
    {
      if (SBFEffectiveHomeButtonType() != 2)
      {
        v120 = v102;
        BOOL v98 = 1;
LABEL_335:

        if (v100) {
          goto LABEL_299;
        }
        goto LABEL_278;
      }
LABEL_291:
      int v119 = __sb__runningInSpringBoard();
      v120 = v102;
      if (v119)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v118 = [MEMORY[0x1E4F42D90] mainScreen];
        [v118 _referenceBounds];
      }
      BSSizeRoundForScale();
      BOOL v98 = v105 < v51[11];
      if (v119)
      {
        if (v104) {
          goto LABEL_298;
        }
      }
      else
      {

        if (v104) {
          goto LABEL_298;
        }
      }
      goto LABEL_335;
    }

LABEL_288:
    BOOL v98 = 1;
    if (v100) {
      goto LABEL_299;
    }
    goto LABEL_278;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
    goto LABEL_288;
  }
  if (SBFEffectiveHomeButtonType() == 2) {
    goto LABEL_291;
  }
  BOOL v98 = 1;
  if ((v104 & 1) == 0) {
    goto LABEL_335;
  }
LABEL_298:
  if (v100) {
    goto LABEL_299;
  }
LABEL_278:

  if ((v97 & 1) == 0) {
    goto LABEL_300;
  }
LABEL_301:
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v106 = v117;
  uint64_t v107 = [v106 countByEnumeratingWithState:&v127 objects:v135 count:16];
  if (!v107) {
    goto LABEL_330;
  }
  uint64_t v108 = v107;
  uint64_t v109 = *(void *)v128;
  int v110 = v90 || v125;
  while (2)
  {
    uint64_t v111 = 0;
    while (2)
    {
      if (*(void *)v128 != v109) {
        objc_enumerationMutation(v106);
      }
      objc_msgSend(*(id *)(*((void *)&v127 + 1) + 8 * v111), "referenceSize", v114);
      if (v110 && ((BSSizeEqualToSize() & 1) != 0 || (BSSizeEqualToSize() & 1) != 0))
      {
        uint64_t v112 = 2176;
        goto LABEL_327;
      }
      if (v98 && ((BSSizeEqualToSize() & 1) != 0 || (BSSizeEqualToSize() & 1) != 0 || (BSSizeEqualToSize() & 1) != 0))
      {
        uint64_t v112 = 32;
        goto LABEL_327;
      }
      if (v67 && (BSSizeEqualToSize() & 1) != 0)
      {
        uint64_t v112 = 1024;
        goto LABEL_327;
      }
      if (v126 && (BSSizeEqualToSize() & 1) != 0)
      {
        uint64_t v112 = 64;
        goto LABEL_327;
      }
      if (v122 || v121) && ((BSSizeEqualToSize() & 1) != 0 || (BSSizeEqualToSize()))
      {
        uint64_t v112 = 28;
        goto LABEL_327;
      }
      if (BSSizeEqualToSize())
      {
        uint64_t v112 = 4;
LABEL_327:
        self->_supportedTypes |= v112;
      }
      if (v108 != ++v111) {
        continue;
      }
      break;
    }
    uint64_t v108 = [v106 countByEnumeratingWithState:&v127 objects:v135 count:16];
    if (v108) {
      continue;
    }
    break;
  }
LABEL_330:

  id v6 = v114;
LABEL_331:

LABEL_332:
  id v113 = [(SBApplication *)self _snapshotManifest];
  self->_calculatedSupportedTypes = 1;
}

- (int64_t)_classicModeFromSupportedTypes
{
  if ([(SBApplicationInfo *)self->_appInfo usesSplashBoard]
    && ![(SBApplication *)self _useSupportedTypesForSplashBoard])
  {
    return -1;
  }
  if (-[SBApplication _bypassesClassicMode]((uint64_t)self)) {
    return 0;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v2 = (void *)[v8 userInterfaceIdiom];

    if (v2 != (void *)1)
    {
LABEL_7:
      int v5 = __sb__runningInSpringBoard();
      char v6 = v5;
      if (v5)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v11 = (double *)MEMORY[0x1E4FA6E50];
      if (BSSizeEqualToSize())
      {
        BOOL v12 = [(SBApplication *)self _supportsApplicationType:0x2000];
        if (v6)
        {
LABEL_26:
          if (v12) {
            goto LABEL_294;
          }
          int v15 = __sb__runningInSpringBoard();
          char v16 = v15;
          if (v15)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
            [v2 _referenceBounds];
          }
          BSSizeRoundForScale();
          if (BSSizeEqualToSize())
          {
            BOOL v17 = [(SBApplication *)self _supportsApplicationType:4096];
            if (v16) {
              goto LABEL_37;
            }
          }
          else
          {
            BOOL v17 = 0;
            if (v16)
            {
LABEL_37:
              if (v17) {
                goto LABEL_294;
              }
              int v18 = __sb__runningInSpringBoard();
              char v19 = v18;
              if (v18)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              double v22 = v11[17];
              if (BSSizeEqualToSize()) {
                BOOL v23 = [(SBApplication *)self _supportsApplicationType:2048];
              }
              else {
                BOOL v23 = 0;
              }
              if ((v19 & 1) == 0) {

              }
              if (v23) {
                goto LABEL_294;
              }
              int v28 = __sb__runningInSpringBoard();
              char v29 = v28;
              if (v28)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              double v34 = v11[15];
              if (BSSizeEqualToSize()) {
                BOOL v35 = [(SBApplication *)self _supportsApplicationType:1024];
              }
              else {
                BOOL v35 = 0;
              }
              if ((v29 & 1) == 0) {

              }
              if (v35) {
                goto LABEL_294;
              }
              int v42 = __sb__runningInSpringBoard();
              char v43 = v42;
              if (v42)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize()) {
                BOOL v54 = [(SBApplication *)self _supportsApplicationType:512];
              }
              else {
                BOOL v54 = 0;
              }
              if ((v43 & 1) == 0) {

              }
              if (v54) {
                goto LABEL_294;
              }
              int v59 = __sb__runningInSpringBoard();
              char v60 = v59;
              if (v59)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize()) {
                BOOL v67 = [(SBApplication *)self _supportsApplicationType:256];
              }
              else {
                BOOL v67 = 0;
              }
              if ((v60 & 1) == 0) {

              }
              if (v67) {
                goto LABEL_294;
              }
              int v70 = __sb__runningInSpringBoard();
              char v71 = v70;
              if (v70)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              double v191 = v11[13];
              if (BSSizeEqualToSize()) {
                BOOL v73 = [(SBApplication *)self _supportsApplicationType:128];
              }
              else {
                BOOL v73 = 0;
              }
              if ((v71 & 1) == 0) {

              }
              if (v73) {
                goto LABEL_294;
              }
              int v76 = __sb__runningInSpringBoard();
              char v77 = v76;
              if (v76)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize()) {
                BOOL v79 = [(SBApplication *)self _supportsApplicationType:64];
              }
              else {
                BOOL v79 = 0;
              }
              if ((v77 & 1) == 0) {

              }
              if (v79) {
                goto LABEL_294;
              }
              int v82 = __sb__runningInSpringBoard();
              char v83 = v82;
              if (v82)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize()) {
                BOOL v85 = [(SBApplication *)self _supportsApplicationType:32];
              }
              else {
                BOOL v85 = 0;
              }
              if ((v83 & 1) == 0) {

              }
              if (v85) {
                goto LABEL_294;
              }
              int v88 = __sb__runningInSpringBoard();
              char v89 = v88;
              if (v88)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize()) {
                BOOL v91 = [(SBApplication *)self _supportsApplicationType:16];
              }
              else {
                BOOL v91 = 0;
              }
              if ((v89 & 1) == 0) {

              }
              if (v91) {
                goto LABEL_294;
              }
              int v94 = __sb__runningInSpringBoard();
              char v95 = v94;
              if (v94)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              double v190 = v11[5];
              if (BSSizeEqualToSize()) {
                BOOL v97 = [(SBApplication *)self _supportsApplicationType:8];
              }
              else {
                BOOL v97 = 0;
              }
              if ((v95 & 1) == 0) {

              }
              if (v97) {
                goto LABEL_294;
              }
              int v100 = __sb__runningInSpringBoard();
              char v101 = v100;
              if (v100)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              if (BSSizeEqualToSize()) {
                BOOL v103 = [(SBApplication *)self _supportsApplicationType:4];
              }
              else {
                BOOL v103 = 0;
              }
              if ((v101 & 1) == 0) {

              }
              if (v103)
              {
LABEL_294:
                if (+[SBApplication _displayZoomSizesOnThisDeviceNeedRedaction]())
                {
                  int v106 = __sb__runningInSpringBoard();
                  char v107 = v106;
                  if (v106)
                  {
                    __sb__mainScreenReferenceBounds();
                  }
                  else
                  {
                    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                    [v2 _referenceBounds];
                  }
                  BSSizeRoundForScale();
                  if (BSSizeEqualToSize())
                  {
                    BOOL v108 = [(SBApplication *)self _supportsApplicationType:64];
                    if (v107) {
                      goto LABEL_303;
                    }
                  }
                  else
                  {
                    BOOL v108 = 0;
                    if (v107)
                    {
LABEL_303:
                      if (v108) {
                        return 6;
                      }
                      int v109 = __sb__runningInSpringBoard();
                      char v66 = v109;
                      if (v109)
                      {
                        __sb__mainScreenReferenceBounds();
                      }
                      else
                      {
                        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                        [v2 _referenceBounds];
                      }
                      BSSizeRoundForScale();
                      if (BSSizeEqualToSize())
                      {
                        if ([(SBApplication *)self _supportsApplicationType:32]) {
                          int64_t v4 = 5;
                        }
                        else {
                          int64_t v4 = 0;
                        }
                      }
                      else
                      {
                        int64_t v4 = 0;
                      }
                      goto LABEL_313;
                    }
                  }

                  goto LABEL_303;
                }
                return 0;
              }
              int v110 = __sb__runningInSpringBoard();
              char v111 = v110;
              if (v110)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              if (BSSizeLessThanSize()) {
                BOOL v113 = [(SBApplication *)self _supportsApplicationType:4096];
              }
              else {
                BOOL v113 = 0;
              }
              if ((v111 & 1) == 0) {

              }
              if (v113) {
                return 11;
              }
              int v116 = __sb__runningInSpringBoard();
              char v117 = v116;
              if (v116)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              if (BSSizeLessThanSize()) {
                BOOL v119 = [(SBApplication *)self _supportsApplicationType:2048];
              }
              else {
                BOOL v119 = 0;
              }
              if ((v117 & 1) == 0) {

              }
              if (!v119)
              {
                int v122 = __sb__runningInSpringBoard();
                char v123 = v122;
                if (v122)
                {
                  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
                    goto LABEL_391;
                  }
                  if (SBFEffectiveHomeButtonType() != 2)
                  {
                    if (v123) {
                      goto LABEL_391;
                    }
LABEL_371:

                    goto LABEL_391;
                  }
                }
                else
                {
                  uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
                  if ([v2 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
                    goto LABEL_371;
                  }
                }
                int v125 = __sb__runningInSpringBoard();
                char v126 = v125;
                if (v125)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  char v11 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v11 _referenceBounds];
                }
                BSSizeRoundForScale();
                if (v132 >= v22)
                {
                  BOOL v133 = [(SBApplication *)self _supportsApplicationType:1024];
                  if (v126) {
                    goto LABEL_388;
                  }
                }
                else
                {
                  BOOL v133 = 0;
                  if (v126)
                  {
LABEL_388:
                    if ((v123 & 1) == 0) {

                    }
                    if (!v133)
                    {
LABEL_391:
                      int v134 = __sb__runningInSpringBoard();
                      char v135 = v134;
                      if (v134)
                      {
                        __sb__mainScreenReferenceBounds();
                      }
                      else
                      {
                        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                        [v2 _referenceBounds];
                      }
                      BSSizeRoundForScale();
                      if (BSSizeLessThanSize()) {
                        BOOL v136 = [(SBApplication *)self _supportsApplicationType:256];
                      }
                      else {
                        BOOL v136 = 0;
                      }
                      if ((v135 & 1) == 0) {

                      }
                      if (v136) {
                        return 8;
                      }
                      int v137 = __sb__runningInSpringBoard();
                      char v138 = v137;
                      if (v137)
                      {
                        __sb__mainScreenReferenceBounds();
                      }
                      else
                      {
                        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                        [v2 _referenceBounds];
                      }
                      BSSizeRoundForScale();
                      if (BSSizeLessThanSize()) {
                        BOOL v139 = [(SBApplication *)self _supportsApplicationType:128];
                      }
                      else {
                        BOOL v139 = 0;
                      }
                      if ((v138 & 1) == 0) {

                      }
                      if (!v139)
                      {
                        int v140 = __sb__runningInSpringBoard();
                        char v141 = v140;
                        if (v140)
                        {
                          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
                            goto LABEL_460;
                          }
                          if (SBFEffectiveHomeButtonType() != 2)
                          {
                            if (v141) {
                              goto LABEL_460;
                            }
LABEL_430:

                            goto LABEL_460;
                          }
                        }
                        else
                        {
                          uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
                          if ([v2 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
                            goto LABEL_430;
                          }
                        }
                        int v145 = __sb__runningInSpringBoard();
                        char v146 = v145;
                        if (v145)
                        {
                          __sb__mainScreenReferenceBounds();
                        }
                        else
                        {
                          char v11 = [MEMORY[0x1E4F42D90] mainScreen];
                          [v11 _referenceBounds];
                        }
                        BSSizeRoundForScale();
                        if (v153 >= v191)
                        {
                          BOOL v154 = [(SBApplication *)self _supportsApplicationType:64];
                          if (v146) {
                            goto LABEL_457;
                          }
                        }
                        else
                        {
                          BOOL v154 = 0;
                          if (v146)
                          {
LABEL_457:
                            if ((v141 & 1) == 0) {

                            }
                            if (v154) {
                              return 6;
                            }
LABEL_460:
                            int v155 = __sb__runningInSpringBoard();
                            char v156 = v155;
                            if (v155)
                            {
                              if (SBFEffectiveDeviceClass()
                                && SBFEffectiveDeviceClass() != 1)
                              {
                                goto LABEL_471;
                              }
                              if (SBFEffectiveHomeButtonType() != 2)
                              {
                                if (v156)
                                {
LABEL_471:
                                  int v159 = __sb__runningInSpringBoard();
                                  char v160 = v159;
                                  if (v159)
                                  {
                                    __sb__mainScreenReferenceBounds();
                                  }
                                  else
                                  {
                                    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                                    [v2 _referenceBounds];
                                  }
                                  BSSizeRoundForScale();
                                  if (BSSizeGreaterThanOrEqualToSize()) {
                                    BOOL v161 = [(SBApplication *)self _supportsApplicationType:8];
                                  }
                                  else {
                                    BOOL v161 = 0;
                                  }
                                  if ((v160 & 1) == 0) {

                                  }
                                  if (!v161)
                                  {
                                    int v162 = __sb__runningInSpringBoard();
                                    char v163 = v162;
                                    if (v162)
                                    {
                                      if (SBFEffectiveDeviceClass()
                                        && SBFEffectiveDeviceClass() != 1)
                                      {
                                        return 1;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
                                      if ([v2 userInterfaceIdiom])
                                      {

                                        return 1;
                                      }
                                    }
                                    int v169 = __sb__runningInSpringBoard();
                                    char v170 = v169;
                                    if (v169)
                                    {
                                      __sb__mainScreenReferenceBounds();
                                    }
                                    else
                                    {
                                      char v11 = [MEMORY[0x1E4F42D90] mainScreen];
                                      [v11 _referenceBounds];
                                    }
                                    BSSizeRoundForScale();
                                    if (v171 >= v190)
                                    {
                                      BOOL v172 = [(SBApplication *)self _supportsApplicationType:4];
                                      if (v170) {
                                        goto LABEL_515;
                                      }
                                    }
                                    else
                                    {
                                      BOOL v172 = 0;
                                      if (v170)
                                      {
LABEL_515:
                                        if (v163)
                                        {
                                          if (!v172) {
                                            return 1;
                                          }
                                        }
                                        else
                                        {

                                          if (!v172) {
                                            return 1;
                                          }
                                        }
                                        return 2;
                                      }
                                    }

                                    goto LABEL_515;
                                  }
                                  return 3;
                                }
LABEL_470:

                                goto LABEL_471;
                              }
                            }
                            else
                            {
                              uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
                              if ([v2 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
                                goto LABEL_470;
                              }
                            }
                            int v157 = __sb__runningInSpringBoard();
                            char v158 = v157;
                            if (v157)
                            {
                              __sb__mainScreenReferenceBounds();
                            }
                            else
                            {
                              char v11 = [MEMORY[0x1E4F42D90] mainScreen];
                              [v11 _referenceBounds];
                            }
                            BSSizeRoundForScale();
                            if (v164 >= v34)
                            {
                              BOOL v165 = [(SBApplication *)self _supportsApplicationType:16];
                              if (v158) {
                                goto LABEL_492;
                              }
                            }
                            else
                            {
                              BOOL v165 = 0;
                              if (v158)
                              {
LABEL_492:
                                if (v156)
                                {
                                  if (!v165) {
                                    goto LABEL_471;
                                  }
                                }
                                else
                                {

                                  if (!v165) {
                                    goto LABEL_471;
                                  }
                                }
                                return 4;
                              }
                            }

                            goto LABEL_492;
                          }
                        }

                        goto LABEL_457;
                      }
                      return 7;
                    }
                    return 9;
                  }
                }

                goto LABEL_388;
              }
              return 10;
            }
          }

          goto LABEL_37;
        }
      }
      else
      {
        BOOL v12 = 0;
        if (v6) {
          goto LABEL_26;
        }
      }

      goto LABEL_26;
    }
  }
  uint64_t v2 = (void *)SBFEffectiveHomeButtonType();
  if (![(SBApplication *)self _supportsApplicationType:2])
  {
    if (v2 == (void *)2)
    {
      if ([(SBApplication *)self _supportsApplicationType:2048])
      {
        int v13 = __sb__runningInSpringBoard();
        char v14 = v13;
        if (v13)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
          [v2 _referenceBounds];
        }
        BSSizeRoundForScale();
        char v30 = BSSizeGreaterThanOrEqualToSize();
        char v31 = v30;
        if (v14)
        {
          if (v30) {
            return 10;
          }
        }
        else
        {

          if (v31) {
            return 10;
          }
        }
      }
      if ([(SBApplication *)self _supportsApplicationType:1024])
      {
        int v36 = __sb__runningInSpringBoard();
        char v37 = v36;
        if (v36)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
          [v2 _referenceBounds];
        }
        BSSizeRoundForScale();
        char v44 = BSSizeGreaterThanOrEqualToSize();
        char v45 = v44;
        if (v37)
        {
          if (v44) {
            return 9;
          }
        }
        else
        {

          if (v45) {
            return 9;
          }
        }
      }
      if ([(SBApplication *)self _supportsApplicationType:128])
      {
        int v46 = __sb__runningInSpringBoard();
        char v47 = v46;
        if (v46)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
          [v2 _referenceBounds];
        }
        BSSizeRoundForScale();
        char v48 = BSSizeGreaterThanOrEqualToSize();
        char v49 = v48;
        if (v47)
        {
          if (v48) {
            return 7;
          }
        }
        else
        {

          if (v49) {
            return 7;
          }
        }
      }
      if ([(SBApplication *)self _supportsApplicationType:64])
      {
        int v50 = __sb__runningInSpringBoard();
        char v51 = v50;
        if (v50)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
          [v2 _referenceBounds];
        }
        BSSizeRoundForScale();
        char v61 = BSSizeGreaterThanOrEqualToSize();
        char v62 = v61;
        if (v51)
        {
          if (v61) {
            return 6;
          }
        }
        else
        {

          if (v62) {
            return 6;
          }
        }
      }
    }
    if (![(SBApplication *)self _supportsApplicationType:8])
    {
      if ([(SBApplication *)self _supportsApplicationType:4]) {
        return 2;
      }
      else {
        return 1;
      }
    }
    return 3;
  }
  int v9 = __sb__runningInSpringBoard();
  char v10 = v9;
  if (v2 == (void *)2)
  {
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v20 = [(SBApplication *)self _supportsApplicationType:0x40000000];
    }
    else {
      BOOL v20 = 0;
    }
    if ((v10 & 1) == 0) {

    }
    if (v20) {
      return 0;
    }
    int v24 = __sb__runningInSpringBoard();
    char v25 = v24;
    if (v24)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v32 = [(SBApplication *)self _supportsApplicationType:0x10000000];
    }
    else {
      BOOL v32 = 0;
    }
    if ((v25 & 1) == 0) {

    }
    if (v32) {
      return 0;
    }
    int v38 = __sb__runningInSpringBoard();
    char v39 = v38;
    if (v38)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v52 = [(SBApplication *)self _supportsApplicationType:0x800000];
    }
    else {
      BOOL v52 = 0;
    }
    if ((v39 & 1) == 0) {

    }
    if (v52) {
      return 0;
    }
    int v55 = __sb__runningInSpringBoard();
    char v56 = v55;
    if (v55)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v63 = [(SBApplication *)self _supportsApplicationType:0x2000000];
    }
    else {
      BOOL v63 = 0;
    }
    if ((v56 & 1) == 0) {

    }
    if (v63) {
      return 0;
    }
    int v68 = __sb__runningInSpringBoard();
    char v69 = v68;
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v72 = [(SBApplication *)self _supportsApplicationType:0x100000];
    }
    else {
      BOOL v72 = 0;
    }
    if ((v69 & 1) == 0) {

    }
    if (v72) {
      return 0;
    }
    int v74 = __sb__runningInSpringBoard();
    char v75 = v74;
    if (v74)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v78 = [(SBApplication *)self _supportsApplicationType:0x20000];
    }
    else {
      BOOL v78 = 0;
    }
    if ((v75 & 1) == 0) {

    }
    if (v78) {
      return 0;
    }
    int v80 = __sb__runningInSpringBoard();
    char v81 = v80;
    if (v80)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v84 = [(SBApplication *)self _supportsApplicationType:0x40000];
    }
    else {
      BOOL v84 = 0;
    }
    if ((v81 & 1) == 0) {

    }
    if (v84) {
      return 0;
    }
    int v86 = __sb__runningInSpringBoard();
    char v87 = v86;
    if (v86)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v90 = [(SBApplication *)self _supportsApplicationType:0x10000];
    }
    else {
      BOOL v90 = 0;
    }
    if ((v87 & 1) == 0) {

    }
    if (v90) {
      return 0;
    }
    int v92 = __sb__runningInSpringBoard();
    char v93 = v92;
    if (v92)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v96 = [(SBApplication *)self _supportsApplicationType:0x200000];
    }
    else {
      BOOL v96 = 0;
    }
    if ((v93 & 1) == 0) {

    }
    if (v96) {
      return 0;
    }
    int v98 = __sb__runningInSpringBoard();
    char v99 = v98;
    if (v98)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v102 = [(SBApplication *)self _supportsApplicationType:0x1000000];
    }
    else {
      BOOL v102 = 0;
    }
    if ((v99 & 1) == 0) {

    }
    if (v102) {
      return 0;
    }
    int v104 = __sb__runningInSpringBoard();
    char v105 = v104;
    if (v104)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v112 = [(SBApplication *)self _supportsApplicationType:0x4000000];
    }
    else {
      BOOL v112 = 0;
    }
    if ((v105 & 1) == 0) {

    }
    if (v112) {
      return 0;
    }
    int v114 = __sb__runningInSpringBoard();
    char v115 = v114;
    if (v114)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v118 = [(SBApplication *)self _supportsApplicationType:0x20000000];
    }
    else {
      BOOL v118 = 0;
    }
    if ((v115 & 1) == 0) {

    }
    if (v118) {
      return 0;
    }
    int v120 = __sb__runningInSpringBoard();
    char v121 = v120;
    if (v120)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v124 = [(SBApplication *)self _supportsApplicationType:0xFFFFFFFF80000000];
    }
    else {
      BOOL v124 = 0;
    }
    if ((v121 & 1) == 0) {

    }
    if (v124) {
      return 0;
    }
    int v127 = __sb__runningInSpringBoard();
    char v128 = v127;
    if (v127)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize()) {
      BOOL v129 = [(SBApplication *)self _supportsApplicationType:0x20000000];
    }
    else {
      BOOL v129 = 0;
    }
    if ((v128 & 1) == 0) {

    }
    if (v129) {
      return 22;
    }
    int v130 = __sb__runningInSpringBoard();
    char v131 = v130;
    if (v130)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize()) {
      BOOL v142 = [(SBApplication *)self _supportsApplicationType:0x1000000];
    }
    else {
      BOOL v142 = 0;
    }
    if ((v131 & 1) == 0) {

    }
    if (v142) {
      return 19;
    }
    int v143 = __sb__runningInSpringBoard();
    char v144 = v143;
    if (v143)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize()) {
      BOOL v147 = [(SBApplication *)self _supportsApplicationType:0x40000000];
    }
    else {
      BOOL v147 = 0;
    }
    if ((v144 & 1) == 0) {

    }
    if (v147) {
      return 21;
    }
    int v148 = __sb__runningInSpringBoard();
    char v149 = v148;
    if (v148)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize()) {
      BOOL v150 = [(SBApplication *)self _supportsApplicationType:0x10000000];
    }
    else {
      BOOL v150 = 0;
    }
    if ((v149 & 1) == 0) {

    }
    if (v150) {
      return 20;
    }
    int v151 = __sb__runningInSpringBoard();
    char v152 = v151;
    if (v151)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize()) {
      BOOL v166 = [(SBApplication *)self _supportsApplicationType:0x8000000];
    }
    else {
      BOOL v166 = 0;
    }
    if ((v152 & 1) == 0) {

    }
    if (v166) {
      return 14;
    }
    int v167 = __sb__runningInSpringBoard();
    char v168 = v167;
    if (v167)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v173 = [(SBApplication *)self _supportsApplicationType:0x2000000];
    }
    else {
      BOOL v173 = 0;
    }
    if ((v168 & 1) == 0) {

    }
    if (v173) {
      return 18;
    }
    int v174 = __sb__runningInSpringBoard();
    char v175 = v174;
    if (v174)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize()) {
      BOOL v176 = [(SBApplication *)self _supportsApplicationType:0x800000];
    }
    else {
      BOOL v176 = 0;
    }
    if ((v175 & 1) == 0) {

    }
    if (v176) {
      return 17;
    }
    int v177 = __sb__runningInSpringBoard();
    char v178 = v177;
    if (v177)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeGreaterThanOrEqualToSize()) {
      BOOL v179 = [(SBApplication *)self _supportsApplicationType:0x10000000];
    }
    else {
      BOOL v179 = 0;
    }
    if ((v178 & 1) == 0) {

    }
    if (v179) {
      return 20;
    }
    int v180 = __sb__runningInSpringBoard();
    char v181 = v180;
    if (v180)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v182 = [(SBApplication *)self _supportsApplicationType:0x800000];
    }
    else {
      BOOL v182 = 0;
    }
    if ((v181 & 1) == 0) {

    }
    if (v182) {
      return 17;
    }
    int v183 = __sb__runningInSpringBoard();
    char v184 = v183;
    if (v183)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v185 = [(SBApplication *)self _supportsApplicationType:0x100000];
    }
    else {
      BOOL v185 = 0;
    }
    if ((v184 & 1) == 0) {

    }
    if (v185) {
      return 16;
    }
    int v186 = __sb__runningInSpringBoard();
    char v187 = v186;
    if (v186)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (BSSizeEqualToSize()) {
      BOOL v188 = [(SBApplication *)self _supportsApplicationType:0x800000];
    }
    else {
      BOOL v188 = 0;
    }
    if ((v187 & 1) == 0) {

    }
    if (v188) {
      return 17;
    }
    if ([(SBApplication *)self _supportsApplicationType:0x20000]) {
      return 15;
    }
    int v189 = __sb__runningInSpringBoard();
    char v66 = v189;
    if (!v189) {
      goto LABEL_182;
    }
LABEL_166:
    __sb__mainScreenReferenceBounds();
    goto LABEL_183;
  }
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (BSSizeEqualToSize()) {
    BOOL v21 = [(SBApplication *)self _supportsApplicationType:0x8000000];
  }
  else {
    BOOL v21 = 0;
  }
  if ((v10 & 1) == 0) {

  }
  if (v21) {
    return 0;
  }
  int v26 = __sb__runningInSpringBoard();
  char v27 = v26;
  if (v26)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (BSSizeEqualToSize()) {
    BOOL v33 = [(SBApplication *)self _supportsApplicationType:0x80000];
  }
  else {
    BOOL v33 = 0;
  }
  if ((v27 & 1) == 0) {

  }
  if (v33) {
    return 0;
  }
  int v40 = __sb__runningInSpringBoard();
  char v41 = v40;
  if (v40)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (BSSizeEqualToSize()) {
    BOOL v53 = [(SBApplication *)self _supportsApplicationType:0x400000];
  }
  else {
    BOOL v53 = 0;
  }
  if ((v41 & 1) == 0) {

  }
  if (v53) {
    return 0;
  }
  int v57 = __sb__runningInSpringBoard();
  char v58 = v57;
  if (v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  char v64 = BSSizeEqualToSize();
  if ((v58 & 1) == 0) {

  }
  if (v64) {
    return 0;
  }
  int v65 = __sb__runningInSpringBoard();
  char v66 = v65;
  if (v65) {
    goto LABEL_166;
  }
LABEL_182:
  uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 _referenceBounds];
LABEL_183:
  BSSizeRoundForScale();
  if (BSSizeGreaterThanOrEqualToSize())
  {
    if ([(SBApplication *)self _supportsApplicationType:0x400000]) {
      int64_t v4 = 13;
    }
    else {
      int64_t v4 = 12;
    }
  }
  else
  {
    int64_t v4 = 12;
  }
LABEL_313:
  if ((v66 & 1) == 0) {

  }
  return v4;
}

- (int64_t)labelAccessoryTypeForIcon:(id)a3
{
  if ([(SBApplicationInfo *)self->_appInfo isBlockedForScreenTimeExpiration]) {
    return 4;
  }
  if ([(SBApplicationInfo *)self->_appInfo isCloudDemoted]) {
    return 3;
  }
  if (([(SBApplication *)self _isNewlyInstalled]
     || [(SBApplication *)self _isRecentlyUpdated])
    && ![(SBApplication *)self isSystemApplication])
  {
    return 1;
  }
  if ([(SBApplicationInfo *)self->_appInfo isBeta]) {
    return 2;
  }
  return 0;
}

- (BOOL)_isRecentlyUpdated
{
  char v2 = *((unsigned char *)self + 80) & 7;
  if (!v2)
  {
    int64_t v4 = [(FBSApplicationDataStore *)self->_dataStore safeObjectForKey:@"SBApplicationRecentlyUpdated" ofType:objc_opt_class()];
    int v5 = [v4 BOOLValue];

    if (v5) {
      char v2 = 1;
    }
    else {
      char v2 = 2;
    }
    *((unsigned char *)self + 80) = *((unsigned char *)self + 80) & 0xF8 | v2;
  }
  return v2 == 1;
}

- (BOOL)_isNewlyInstalled
{
  if ([(SBApplication *)self isSystemApplication]
    || [(SBApplication *)self isInternalApplication])
  {
    return 0;
  }
  int v4 = *((unsigned char *)self + 80) & 0x38;
  if ((*((unsigned char *)self + 80) & 0x38) == 0)
  {
    int v5 = [(FBSApplicationDataStore *)self->_dataStore safeObjectForKey:@"SBApplicationIsNewlyInstalled" ofType:objc_opt_class()];
    int v6 = [v5 BOOLValue];

    if (v6) {
      int v4 = 8;
    }
    else {
      int v4 = 16;
    }
    *((unsigned char *)self + 80) = *((unsigned char *)self + 80) & 0xC7 | v4;
  }
  return v4 == 8;
}

- (BOOL)isSystemApplication
{
  return [(SBApplicationInfo *)self->_appInfo isSystemApplication];
}

- (uint64_t)_bypassesClassicMode
{
  if (result)
  {
    v1 = (id *)result;
    if (([*(id *)(result + 168) disablesClassicMode] & 1) != 0
      || ([v1[21] hasViewServicesEntitlement] & 1) != 0)
    {
      return 1;
    }
    else
    {
      return [v1 isSystemApplication];
    }
  }
  return result;
}

- (BOOL)_useSupportedTypesForSplashBoard
{
  return 1;
}

- (NSArray)tags
{
  return (NSArray *)[(SBApplicationInfo *)self->_appInfo tags];
}

- (BOOL)isAppClip
{
  return [(SBApplicationInfo *)self->_appInfo isAppClip];
}

- (BOOL)hasHiddenTag
{
  return [(SBApplicationInfo *)self->_appInfo hasHiddenTag];
}

- (BOOL)iconAllowsLaunch:(id)a3
{
  return ![(SBApplication *)self isAnyTerminationAssertionInEffect];
}

- (BOOL)isAnyTerminationAssertionInEffect
{
  if (self->_launchWillBePrevented)
  {
    char v2 = [(SBApplication *)self processState];
    int v3 = [v2 isRunning] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isUninstalled
{
  char v2 = self;
  objc_sync_enter(v2);
  BOOL uninstalled = v2->_uninstalled;
  objc_sync_exit(v2);

  return uninstalled;
}

- (BOOL)supportsChamoisOnExternalDisplay
{
  if ([(SBApplicationInfo *)self->_appInfo isSydneyLinked]) {
    return 1;
  }
  return [(SBApplication *)self supportsChamoisSceneResizing];
}

- (void)setUsesEdgeNetwork:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SBApplication *)self dataUsage];
  if (((((v5 & 1) == 0) ^ v3) & 1) == 0)
  {
    [(SBApplication *)self _setDataUsage:v5 & 0xFFFFFFFE | v3];
  }
}

- (void)setUsesWiFiNetwork:(BOOL)a3
{
  int v3 = a3;
  int v5 = [(SBApplication *)self dataUsage];
  if ((v5 & 2) != v3)
  {
    if (v3) {
      int v6 = 2;
    }
    else {
      int v6 = 0;
    }
    [(SBApplication *)self _setDataUsage:v5 & 0xFFFFFFFD | v6];
  }
}

- (int)dataUsage
{
  if (self->_dataFlagsIsSet) {
    return *((unsigned __int8 *)self + 84);
  }
  else {
    return [(SBApplicationInfo *)self->_appInfo networkUsageTypes];
  }
}

- (BOOL)hasDisplayedLaunchAlertForType:(unint64_t)a3
{
  return (a3 & ~self->_displayedLaunchAlerts) == 0;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isWebApplication
{
  return 0;
}

- (BOOL)supportsChamoisViewResizing
{
  return ![(SBApplication *)self alwaysMaximizedInChamois];
}

- (BOOL)alwaysMaximizedInChamois
{
  if (alwaysMaximizedInChamois_onceToken != -1) {
    dispatch_once(&alwaysMaximizedInChamois_onceToken, &__block_literal_global_148);
  }
  int v3 = (void *)alwaysMaximizedInChamois_sAlwaysMaximizedBundleIDs;
  int v4 = [(SBApplication *)self bundleIdentifier];
  LOBYTE(v3) = [v3 containsObject:v4];

  return (char)v3;
}

- (id)tagsForIcon:(id)a3
{
  int v3 = [(SBApplication *)self info];
  int v4 = [v3 tags];

  return v4;
}

- (void)_updateProcess:(id)a3 withState:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v7 = (FBApplicationProcess *)a3;
  id v8 = a4;
  int v9 = [(SBApplication *)self _internalProcessState];
  if (v7) {
    id v10 = [[SBApplicationProcessState alloc] _initWithProcess:v7 stateSnapshot:v8];
  }
  else {
    id v10 = 0;
  }
  if (self->_process != v7) {
    objc_storeStrong((id *)&self->_process, a3);
  }
  [(SBApplication *)self _setInternalProcessState:v10];
  char v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = [(SBApplication *)self bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    BOOL v20 = v12;
    __int16 v21 = 2114;
    id v22 = v10;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Application process state changed for %{public}@: %{public}@", buf, 0x16u);
  }
  uint64_t v13 = [v9 taskState];
  uint64_t v14 = [v8 taskState];
  if (v13 != 3 && v14 == 3) {
    [(SBApplication *)self _didSuspend];
  }
  if (v9)
  {
    BOOL v17 = @"previousProcessState";
    int v18 = v9;
    int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  }
  else
  {
    int v15 = 0;
  }
  char v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 postNotificationName:@"SBApplicationProcessStateDidChange" object:self userInfo:v15];
}

- (void)_setInternalProcessState:(id)a3
{
}

- (void)_didSuspend
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = SBLogWorkspace();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = [(SBApplication *)self bundleIdentifier];
    int v6 = 136315394;
    char v7 = "-[SBApplication _didSuspend]";
    __int16 v8 = 2114;
    int v9 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "%s %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(SBApplication *)self _resetDataUsage];
  if ([(NSString *)self->_bundleIdentifier isEqual:@"com.apple.Preferences"])
  {
    int v5 = _didSuspend_token;
    if (_didSuspend_token != -1
      || (notify_register_check("com.apple.airportsettingsvisible", &_didSuspend_token),
          int v5 = _didSuspend_token,
          _didSuspend_token != -1))
    {
      notify_set_state(v5, 0);
      notify_post("com.apple.airportsettingsvisible");
    }
  }
}

- (void)_resetDataUsage
{
  self->_dataFlagsIsSet = 0;
}

- (BOOL)classicAppScaled
{
  if (!self->_calculatedSupportedTypes) {
    return 0;
  }
  if ([(SBApplication *)self _classicAppScaledOnPhone]
    || [(SBApplication *)self _classicAppScaledPadOnPad])
  {
    return 1;
  }
  return [(SBApplication *)self _classicAppScaledPhoneOnPad];
}

- (BOOL)_classicAppScaledPadOnPad
{
  uint64_t v2 = [(SBApplication *)self _classicMode];
  return SBApplicationClassicModeRepresentsPad(v2);
}

- (BOOL)_classicAppScaledOnPhone
{
  if (![(SBApplication *)self isClassic]) {
    return 0;
  }
  int v4 = __sb__runningInSpringBoard();
  char v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      return 0;
    }
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom])
    {
      BOOL v6 = 0;
LABEL_14:

      return v6;
    }
  }
  int v7 = __sb__runningInSpringBoard();
  char v8 = v7;
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    int v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v6 = v9 >= *(double *)(MEMORY[0x1E4FA6E50] + 40);
  if ((v8 & 1) == 0) {

  }
  if ((v5 & 1) == 0) {
    goto LABEL_14;
  }
  return v6;
}

- (id)backgroundActivityAttributionsByIdentifier
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_backgroundActivityAttributionsByIdentifier;
  uint64_t v4 = [(NSMapTable *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double v9 = [(NSMapTable *)self->_backgroundActivityAttributionsByIdentifier objectForKey:v8];
        uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
        char v11 = [v9 allObjects];
        BOOL v12 = [v10 setWithArray:v11];

        [v3 setObject:v12 forKey:v8];
      }
      uint64_t v5 = [(NSMapTable *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)setHasProminentlyIndicatedLocationUseWhileForeground:(BOOL)a3
{
  self->_hasProminentlyIndicatedLocationUseWhileForeground = a3;
}

- (BOOL)hasRegisteredBackgroundActivityWithIdentifier:(id)a3
{
  int v3 = [(NSMapTable *)self->_backgroundActivityAttributionsByIdentifier objectForKey:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)restrictedToTheEmbeddedDisplayInChamois
{
  if (restrictedToTheEmbeddedDisplayInChamois_onceToken != -1) {
    dispatch_once(&restrictedToTheEmbeddedDisplayInChamois_onceToken, &__block_literal_global_2_0);
  }
  int v3 = (void *)restrictedToTheEmbeddedDisplayInChamois_sRestrictedToEmbeddedBundleIDs;
  BOOL v4 = [(SBApplication *)self bundleIdentifier];
  LOBYTE(v3) = [v3 containsObject:v4];

  return (char)v3;
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBApplication *)self succinctDescriptionBuilder];
  int v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  int v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  BOOL v4 = [(SBApplication *)self bundleIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:0];

  return v3;
}

- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v10 iconView];
  if (objc_opt_respondsToSelector())
  {
    BOOL v12 = [v10 actions];
  }
  else
  {
    BOOL v12 = 0;
  }
  uint64_t v13 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!v11) {
      goto LABEL_13;
    }
    long long v15 = objc_alloc_init(SBActivationSettings);
    long long v16 = [v11 _sbWindowScene];
    if ([(SBApplication *)self restrictedToTheEmbeddedDisplayInChamois]
      && [v16 isExtendedDisplayWindowScene])
    {
      long long v17 = [(id)SBApp windowSceneManager];
      uint64_t v18 = [v17 embeddedDisplayWindowScene];

      long long v16 = (void *)v18;
    }
    [(SBActivationSettings *)v15 setObject:v16 forActivationSetting:69];

    if (!v15) {
      goto LABEL_13;
    }
LABEL_12:
    char v19 = v15;
    uint64_t v20 = v19;
    goto LABEL_14;
  }
  long long v15 = [v10 activationSettings];
  if (v15) {
    goto LABEL_12;
  }
LABEL_13:
  char v19 = objc_alloc_init(SBActivationSettings);
  uint64_t v20 = 0;
LABEL_14:
  __int16 v21 = SBLogIcon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [(SBApplication *)self bundleIdentifier];
    int v25 = 138412802;
    int v26 = v22;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2114;
    id v30 = v9;
    _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Launching application %@ from icon %@, location: %{public}@", (uint8_t *)&v25, 0x20u);
  }
  uint64_t v23 = +[SBUIController sharedInstance];
  [v23 activateApplication:self fromIcon:v8 location:v9 activationSettings:v19 actions:v12];

  return 1;
}

- (id)_defaultPNGNameFromSuspensionSettingsWithExpiration:(double *)a3 sceneID:(id)a4
{
  id v6 = a4;
  int v7 = [(SBApplication *)self _dataStore];
  id v8 = [v7 sceneStoreForIdentifier:v6 creatingIfNecessary:0];

  id v9 = [v8 safeObjectForKey:@"expirationAbsoluteTime" ofType:objc_opt_class()];
  [v9 doubleValue];
  if (a3) {
    *a3 = v10;
  }
  if (v9 && v10 <= CFAbsoluteTimeGetCurrent())
  {
  }
  else
  {
    char v11 = [v8 safeObjectForKey:@"defaultPNGName" ofType:objc_opt_class()];

    if (v11) {
      goto LABEL_15;
    }
  }
  BOOL v12 = [v8 safeObjectForKey:@"expirationAbsoluteTime" ofType:objc_opt_class()];
  [v12 doubleValue];
  if (a3) {
    *a3 = v13;
  }
  if (v12 && v13 <= CFAbsoluteTimeGetCurrent())
  {
    char v11 = 0;
  }
  else
  {
    char v11 = [v8 safeObjectForKey:@"defaultPNGName" ofType:objc_opt_class()];
  }

LABEL_15:
  return v11;
}

- (void)_setCurrentClassicMode:(int64_t)a3
{
  self->_currentClassicMode = a3;
}

- (BOOL)isAppleApplication
{
  return [(SBApplicationInfo *)self->_appInfo isAppleApplication];
}

- (void)setBadgeValue:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (!v4
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), id v4 = v10, (isKindOfClass & 1) != 0)
    || (objc_opt_class(), char v6 = objc_opt_isKindOfClass(), v4 = v10, (v6 & 1) != 0))
  {
    if ([v4 isEqual:&unk_1F3349368])
    {

      id v10 = 0;
    }
    int v7 = [(SBApplication *)self badgeValue];
    if (([v7 isEqual:v10] & 1) == 0)
    {
      dataStore = self->_dataStore;
      if (v10)
      {
        [(FBSApplicationDataStore *)dataStore setObject:v10 forKey:@"SBApplicationBadgeKey"];
        char v9 = 1;
      }
      else
      {
        [(FBSApplicationDataStore *)dataStore removeObjectForKey:@"SBApplicationBadgeKey"];
        char v9 = 2;
      }
      *((unsigned char *)self + 83) = *((unsigned char *)self + 83) & 0xF8 | v9;
      [(SBApplication *)self _noteIconDataSourceDidChange];
    }
  }
}

- (id)badgeValue
{
  if ((*((unsigned char *)self + 83) & 6) != 0)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [(FBSApplicationDataStore *)self->_dataStore safeObjectForKey:@"SBApplicationBadgeKey" ofType:objc_opt_class()];
    if (v2) {
      char v4 = 1;
    }
    else {
      char v4 = 2;
    }
    *((unsigned char *)self + 83) = *((unsigned char *)self + 83) & 0xF8 | v4;
  }
  return v2;
}

- (void)_noteIconDataSourceDidChange
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v3 = [(SBApplication *)self info];
  int v4 = [v3 isAppClip];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F43048] appClips];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __45__SBApplication__noteIconDataSourceDidChange__block_invoke;
    v25[3] = &unk_1E6AF78F8;
    v25[4] = self;
    char v6 = objc_msgSend(v5, "bs_filter:", v25);

    int v7 = +[SBIconController sharedInstanceIfExists];
    id v8 = [v7 model];

    if (v8)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v19 = v6;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        uint64_t v13 = *MEMORY[0x1E4FA6730];
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v15 = [*(id *)(*((void *)&v21 + 1) + 8 * i) identifier];
            long long v16 = [v8 bookmarkIconForWebClipIdentifier:v15];

            if (v16)
            {
              long long v17 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
              uint64_t v18 = [v16 bookmark];
              [v17 postNotificationName:v13 object:v18 userInfo:0];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v11);
      }

      char v6 = v19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    [v20 postNotificationName:*MEMORY[0x1E4FA6730] object:self userInfo:0];
  }
}

- (BOOL)_canLaunchInClassicMode:(int64_t)a3
{
  char v6 = self;
  [(SBApplication *)self _calculateSupportedTypesLazilyIfNecessary];
  if (-[SBApplication _bypassesClassicMode]((uint64_t)v6))
  {
    LOBYTE(v6) = a3 != -1;
    return (char)v6;
  }
  switch(a3)
  {
    case 0:
      uint64_t v18 = [(SBApplication *)v6 _supportedTypeForClassicModeNone];
      long long v17 = v6;
      goto LABEL_34;
    case 1:
      long long v17 = v6;
      uint64_t v18 = 1;
      goto LABEL_34;
    case 2:
      int v10 = __sb__runningInSpringBoard();
      char v8 = v10;
      if (v10)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 4;
      goto LABEL_114;
    case 3:
      int v22 = __sb__runningInSpringBoard();
      char v8 = v22;
      if (v22)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 8;
      goto LABEL_114;
    case 4:
      int v11 = __sb__runningInSpringBoard();
      char v8 = v11;
      if (v11)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 16;
      goto LABEL_114;
    case 5:
      int v23 = __sb__runningInSpringBoard();
      char v8 = v23;
      if (v23)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 32;
      goto LABEL_114;
    case 6:
      int v24 = __sb__runningInSpringBoard();
      char v8 = v24;
      if (v24)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 64;
      goto LABEL_114;
    case 7:
      int v25 = __sb__runningInSpringBoard();
      char v8 = v25;
      if (v25)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 128;
      goto LABEL_114;
    case 8:
      int v26 = __sb__runningInSpringBoard();
      char v8 = v26;
      if (v26)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 256;
      goto LABEL_114;
    case 9:
      int v12 = __sb__runningInSpringBoard();
      char v8 = v12;
      if (v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 1024;
      goto LABEL_114;
    case 10:
      int v27 = __sb__runningInSpringBoard();
      char v8 = v27;
      if (v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 2048;
      goto LABEL_114;
    case 11:
      int v13 = __sb__runningInSpringBoard();
      char v8 = v13;
      if (v13)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeLessThanSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 4096;
      goto LABEL_114;
    case 12:
      if (![(SBApplication *)v6 _supportsApplicationType:2]) {
        goto LABEL_24;
      }
      int v14 = __sb__runningInSpringBoard();
      char v15 = v14;
      if (v14)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      LODWORD(v6) = BSSizeEqualToSize() ^ 1;
      if (v15) {
        return (char)v6;
      }
      goto LABEL_118;
    case 13:
      int v28 = __sb__runningInSpringBoard();
      char v8 = v28;
      if (v28)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (BSSizeLessThanSize()) {
        goto LABEL_104;
      }
      goto LABEL_116;
    case 14:
      int v16 = __sb__runningInSpringBoard();
      char v8 = v16;
      if (v16)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeGreaterThanOrEqualToSize()) {
        goto LABEL_116;
      }
LABEL_104:
      BOOL v32 = v6;
      uint64_t v33 = 0x8000000;
      goto LABEL_114;
    case 15:
      if (!__sb__runningInSpringBoard())
      {
        double v34 = [MEMORY[0x1E4F42948] currentDevice];
        LOBYTE(v6) = [v34 userInterfaceIdiom] == 1
                  && [(SBApplication *)v6 _supportsApplicationType:0x20000];

        return (char)v6;
      }
      if (SBFEffectiveDeviceClass() != 2)
      {
LABEL_24:
        LOBYTE(v6) = 0;
        return (char)v6;
      }
      long long v17 = v6;
      uint64_t v18 = 0x20000;
LABEL_34:
      return [(SBApplication *)v17 _supportsApplicationType:v18];
    case 16:
    case 17:
      int v7 = __sb__runningInSpringBoard();
      char v8 = v7;
      if (v7)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (BSSizeEqualToSize()
        && [(SBApplication *)v6 _supportsApplicationType:0x10000])
      {
        LOBYTE(v6) = 1;
        if ((v8 & 1) == 0) {
          goto LABEL_118;
        }
        return (char)v6;
      }
      int v19 = __sb__runningInSpringBoard();
      char v20 = v19;
      if (v19)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v4 = [MEMORY[0x1E4F42D90] mainScreen];
        [v4 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (BSSizeLessThanSize())
      {
        LOBYTE(v6) = [(SBApplication *)v6 _supportsApplicationType:0x100000];
        if (v20) {
          goto LABEL_117;
        }
      }
      else
      {
        LOBYTE(v6) = 0;
        if (v20) {
          goto LABEL_117;
        }
      }

      if (v8) {
        return (char)v6;
      }
      goto LABEL_118;
    case 18:
      int v29 = __sb__runningInSpringBoard();
      char v8 = v29;
      if (v29)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeGreaterThanOrEqualToSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 0x2000000;
      goto LABEL_114;
    case 19:
    case 22:
      int v9 = __sb__runningInSpringBoard();
      char v8 = v9;
      if (v9)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeGreaterThanOrEqualToSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 0x1000000;
      goto LABEL_114;
    case 20:
      int v30 = __sb__runningInSpringBoard();
      char v8 = v30;
      if (v30)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (!BSSizeGreaterThanOrEqualToSize()) {
        goto LABEL_116;
      }
      BOOL v32 = v6;
      uint64_t v33 = 0x10000000;
      goto LABEL_114;
    case 21:
      int v31 = __sb__runningInSpringBoard();
      char v8 = v31;
      if (v31)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (BSSizeGreaterThanOrEqualToSize())
      {
        BOOL v32 = v6;
        uint64_t v33 = 0x40000000;
LABEL_114:
        LOBYTE(v6) = [(SBApplication *)v32 _supportsApplicationType:v33];
        if (v8) {
          return (char)v6;
        }
LABEL_118:

        return (char)v6;
      }
LABEL_116:
      LOBYTE(v6) = 0;
LABEL_117:
      if ((v8 & 1) == 0) {
        goto LABEL_118;
      }
      return (char)v6;
    default:
      goto LABEL_24;
  }
}

- (SBApplicationAppProtectionAssistant)appProtectionAssistant
{
  appProtectionAssistant = self->_appProtectionAssistant;
  if (!appProtectionAssistant)
  {
    int v4 = +[SBApplicationAppProtectionAssistant assistantForApplication:self];
    id v5 = self->_appProtectionAssistant;
    self->_appProtectionAssistant = v4;

    appProtectionAssistant = self->_appProtectionAssistant;
  }
  return appProtectionAssistant;
}

- (void)preHeatForUserLaunchIfNecessaryWithAbsoluteTime:(unint64_t)a3 andContinuousTime:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v26 = [(SBApplication *)self processState];
  if ([v26 isRunning])
  {
  }
  else
  {
    BOOL v5 = [(SBApplicationInfo *)self->_appInfo usesSplashBoard];

    if (v5)
    {
      char v6 = [MEMORY[0x1E4F42D90] mainScreen];
      int v7 = [MEMORY[0x1E4FA58C8] predicate];
      [v7 setContentTypeMask:6];
      [v6 _referenceBounds];
      objc_msgSend(v7, "setReferenceSize:", v8, v9);
      [v6 scale];
      objc_msgSend(v7, "setImageScale:");
      uint64_t v10 = [(id)SBApp statusBarOrientationForEmbeddedDisplay];
      if ([(SBApplicationInfo *)self->_appInfo supportsInterfaceOrientation:v10])
      {
        uint64_t v11 = XBInterfaceOrientationMaskForInterfaceOrientationPair();
      }
      else if ((unint64_t)(v10 - 1) >= 2)
      {
        uint64_t v11 = 2;
      }
      else
      {
        uint64_t v11 = 24;
      }
      [v7 setInterfaceOrientationMask:v11];
      int v12 = [(SBApplication *)self _snapshotManifestCreateIfNeeded:0];
      int v13 = [v12 defaultGroupIdentifier];
      int v14 = [v12 snapshotsForGroupID:v13 matchingPredicate:v7];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
LABEL_13:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          char v20 = *(void **)(*((void *)&v27 + 1) + 8 * v19);
          long long v21 = [v20 path];

          if (v21) {
            break;
          }
          if (v17 == ++v19)
          {
            uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
            if (v17) {
              goto LABEL_13;
            }
            goto LABEL_19;
          }
        }
        id v22 = v20;

        if (v22) {
          goto LABEL_24;
        }
      }
      else
      {
LABEL_19:
      }
      int v23 = SBLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        bundleIdentifier = self->_bundleIdentifier;
        *(_DWORD *)buf = 138412290;
        BOOL v32 = bundleIdentifier;
        _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "No default launch images found for %@, pre-warming SplashBoard under the expectation it will be required.", buf, 0xCu);
      }

      int v25 = [MEMORY[0x1E4FA58E0] sharedInstance];
      [v25 preheatServiceWithTimeout:2.0];

      id v22 = 0;
LABEL_24:
    }
  }
}

- (id)_snapshotsWithImageName:(id)a3 sceneHandle:(id)a4 referenceSize:(CGSize)a5 requireExactSize:(BOOL)a6 launchingScale:(double)a7 contentTypeMask:(unint64_t)a8 statusBarStateMask:(unint64_t)a9 launchingOrientation:(int64_t)a10 contentOverridesContext:(id)a11 userInterfaceStyle:(int64_t)a12 displayEdgeInfo:(id)a13
{
  BOOL v13 = a6;
  double height = a5.height;
  double width = a5.width;
  v106[2] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v22 = a11;
  id v23 = a13;
  if (v21)
  {
    if (!v13) {
      goto LABEL_8;
    }
  }
  else
  {
    char v81 = [MEMORY[0x1E4F28B00] currentHandler];
    [v81 handleFailureInMethod:a2 object:self file:@"SBApplication+DefaultImage.m" lineNumber:174 description:@"Scene ID argument is required for getting a snapshot image."];

    if (!v13) {
      goto LABEL_8;
    }
  }
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    int v82 = [MEMORY[0x1E4F28B00] currentHandler];
    [v82 handleFailureInMethod:a2 object:self file:@"SBApplication+DefaultImage.m" lineNumber:175 description:@"exact size match can't be zero"];
  }
LABEL_8:
  id v25 = [v21 sceneIdentifier];
  BOOL v103 = v22;
  id v26 = [(SBApplication *)self _defaultPNGNameUsingFallbacksWithSceneID:v25 contentOverridesContext:v22];
  uint64_t v27 = [(SBApplication *)self _normalizeSnapshotName:v26];

  if (v27) {
    [MEMORY[0x1E4F1CA70] orderedSetWithObject:v27];
  }
  else {
  long long v28 = [MEMORY[0x1E4F1CA70] orderedSet];
  }
  long long v29 = v28;
  if (v20) {
    [v28 addObject:v20];
  }
  long long v30 = [(SBApplication *)self _snapshotManifest];
  int v104 = [MEMORY[0x1E4FA58B0] fetchRequest];
  int v31 = [MEMORY[0x1E4FA58C8] predicate];
  int v98 = v21;
  if (v30)
  {
    char v95 = v29;
    uint64_t v94 = [v30 defaultGroupIdentifier];
    char v99 = (void *)MGCopyAnswer();
    if (v13) {
      objc_msgSend(v31, "setReferenceSize:", width, height);
    }
    id v90 = v20;
    [v31 setContentTypeMask:a8];
    [v31 setStatusBarStateMask:a9];
    [v31 setRequiredOSVersion:v99];
    BOOL v32 = [v21 application];
    uint64_t v33 = [v32 info];
    uint64_t v34 = objc_msgSend(v33, "xb_userInterfaceStyleForRequestedUserInterfaceStyle:", a12);

    uint64_t v85 = v34;
    [v31 setUserInterfaceStyle:v34];
    uint64_t v35 = [v23 safeAreaInsetsPortrait];
    int v88 = (void *)v35;
    id v89 = v23;
    if (!v35)
    {
      BOOL v91 = 0;
      char v86 = 1;
LABEL_27:
      [v104 setPredicate:v31];
      BOOL v54 = [v103 activationSettings];
      uint64_t v55 = [v21 effectiveStatusBarStyleRequestForActivation:v54];

      char v87 = (void *)v55;
      LODWORD(v55) = [(id)v55 isDoubleHeight] & (a9 >> 2);
      if (v55) {
        unint64_t v56 = 4;
      }
      else {
        unint64_t v56 = a9 & 0xFFFFFFFFFFFFFFFBLL;
      }
      int v57 = [v103 url];
      uint64_t v58 = [v57 scheme];

      char v93 = (void *)v58;
      if (v27)
      {
        int v59 = [(SBApplication *)self info];
        if ([v59 usesSplashBoard])
        {
        }
        else
        {

          if ((a8 & 4) != 0)
          {
            char v84 = v55;
            uint64_t v55 = [MEMORY[0x1E4FA58C8] predicate];
            [(id)v55 setName:v27];
            v106[0] = v25;
            v106[1] = v94;
            char v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
            char v61 = [v30 snapshotsForGroupIDs:v60 matchingPredicate:v55];
            uint64_t v83 = [v61 count];

            if (!v83) {
              [(SBApplication *)self _ingestDefaultPNGsInManifest:v30 withLaunchImageBaseName:v27];
            }

            uint64_t v58 = (uint64_t)v93;
            LOBYTE(v55) = v84;
          }
        }
      }
      char v49 = v30;
      char v62 = objc_opt_class();
      BOOL v63 = objc_msgSend(v62, "snapshotSortDescriptorsForNames:scheme:imageScale:referenceSize:userInterfaceStyle:statusBarStateMask:interfaceOrientationMask:requiredOSVersion:", v95, v58, a12, v56, XBInterfaceOrientationMaskForInterfaceOrientationPair(), v99, a7, width, height);
      [v104 setSortDescriptors:v63];
      char v64 = [(SBApplication *)self info];
      int v65 = [v64 usesSplashBoard];

      if ((a8 & 2) != 0 && v65)
      {
        char v66 = (void *)MEMORY[0x1E4FA58A0];
        BOOL v67 = [(SBApplication *)self info];
        uint64_t v68 = [v66 compatibilityInfoForAppInfo:v67];

        BOOL v97 = (void *)v68;
        if (a8)
        {
          int v70 = [v103 activationSettings];
          int v69 = [v98 isStatusBarHiddenForActivation:v70 forOrientation:a10];
        }
        else
        {
          int v69 = [v98 defaultStatusBarHiddenForOrientation:a10];
        }
        uint64_t v71 = 1;
        if (v55) {
          uint64_t v71 = 2;
        }
        if ((a9 & v69) != 0) {
          uint64_t v71 = 0;
        }
        uint64_t v102 = v71;
        id v72 = objc_alloc_init(MEMORY[0x1E4FA58E8]);
        BOOL v73 = [MEMORY[0x1E4F62490] sharedInstance];
        int v74 = [v73 sceneWithIdentifier:v25];
        char v75 = [v74 settings];

        int v76 = [v75 displayConfiguration];
        if ((v86 & 1) == 0) {
          [v72 setCustomSafeAreaInsets:v91];
        }
        if (v76)
        {
          [v72 setDisplayConfiguration:v76];
        }
        else
        {
          char v77 = [MEMORY[0x1E4F62420] mainConfiguration];
          [v72 setDisplayConfiguration:v77];
        }
        objc_msgSend(v72, "setGroupID:", v94, v83);
        objc_msgSend(v72, "setReferenceSize:", width, height);
        [v72 setStatusBarState:v102];
        [v72 setInterfaceOrientation:a10];
        [v72 setUrlSchemeName:v93];
        [v72 setLaunchInterfaceIdentifier:v27];
        [v72 setUserInterfaceStyle:v85];
        BOOL v78 = (void *)[objc_alloc(MEMORY[0x1E4FA58B8]) initWithApplicationCompatibilityInfo:v97 launchRequest:v72 timeout:2.0];
        [v104 setFallbackGenerationContext:v78];
      }
      int v50 = (void *)v27;
      char v51 = v94;
      v105[0] = v25;
      v105[1] = v94;
      BOOL v79 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v105, 2, v83);
      BOOL v53 = v104;
      BOOL v52 = [v49 snapshotsForGroupIDs:v79 fetchRequest:v104];

      id v23 = v89;
      id v20 = v90;
      long long v29 = v95;
      goto LABEL_53;
    }
    int v36 = (void *)v35;
    uint64_t v92 = v27;
    id v37 = v25;
    id v38 = objc_alloc(MEMORY[0x1E4FA58D8]);
    [v36 topInset];
    double v40 = v39;
    [v36 leftInset];
    double v42 = v41;
    [v36 bottomInset];
    double v44 = v43;
    [v36 rightInset];
    int v46 = (void *)[v38 initWithTop:v40 left:v42 bottom:v44 right:v45];
    char v47 = [(id)objc_opt_class() _deviceSafeAreaInsets];
    int v48 = [v47 isEqual:v46];

    if (v48)
    {
    }
    else if (v46)
    {
      BOOL v91 = v46;
      [v31 setCustomSafeAreaInsets:v46];
      char v86 = 0;
LABEL_26:
      id v25 = v37;
      uint64_t v27 = v92;
      goto LABEL_27;
    }
    BOOL v91 = 0;
    char v86 = 1;
    goto LABEL_26;
  }
  char v49 = 0;
  int v50 = (void *)v27;
  char v51 = SBLogCommon();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
    -[SBApplication(DefaultImage) _snapshotsWithImageName:sceneHandle:referenceSize:requireExactSize:launchingScale:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:](self, v51);
  }
  BOOL v52 = 0;
  BOOL v53 = v104;
LABEL_53:

  return v52;
}

- (id)_snapshotManifestCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = self;
  objc_sync_enter(v4);
  if (v3 && !v4->_synchronized_snapshotManifest && !v4->_uninstalled && v4->_appInfo)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FA58C0]) initWithApplicationInfo:v4->_appInfo];
    synchronized_snapshotManifest = v4->_synchronized_snapshotManifest;
    v4->_synchronized_snapshotManifest = (XBApplicationSnapshotManifest *)v5;

    [(XBApplicationSnapshotManifest *)v4->_synchronized_snapshotManifest setDelegate:v4];
  }
  int v7 = v4->_synchronized_snapshotManifest;
  objc_sync_exit(v4);

  return v7;
}

- (id)_normalizeSnapshotName:(id)a3
{
  int v4 = [MEMORY[0x1E4FA58A8] normalizeSnapshotName:a3];
  if (v4)
  {
    uint64_t v5 = [(SBApplication *)self info];
    int v6 = [v5 usesSplashBoard];

    if (v6)
    {
      int v7 = (void *)MEMORY[0x1E4FA58A0];
      double v8 = [(SBApplication *)self info];
      double v9 = [v7 compatibilityInfoForAppInfo:v8];

      uint64_t v10 = [v9 defaultLaunchInterface];
      uint64_t v11 = [v10 identifier];

      if (![v11 isEqualToString:v4])
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      double v9 = [(SBApplication *)self _defaultLaunchImageBaseName];
      if (![v9 isEqualToString:v4])
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v11 = v4;
    }
    int v4 = 0;
    goto LABEL_8;
  }
LABEL_10:
  return v4;
}

- (id)_defaultPNGNameUsingFallbacksWithSceneID:(id)a3 contentOverridesContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [a4 requestedLaunchIdentifier];
  if (v7
    && ([(SBApplication *)self info],
        double v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 prefersSavedSnapshots],
        v8,
        !v9))
  {
    uint64_t v11 = @"fallbacks for scene id";
  }
  else
  {
    uint64_t v10 = [(SBApplication *)self _defaultPNGNameFromSuspensionSettingsWithExpiration:0 sceneID:v6];

    if (!v10)
    {
      int v7 = 0;
      goto LABEL_10;
    }
    uint64_t v11 = @"suspension settings";
    int v7 = (void *)v10;
  }
  int v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    BOOL v13 = [(SBApplication *)self bundleIdentifier];
    int v15 = 138543874;
    uint64_t v16 = v13;
    __int16 v17 = 2114;
    uint64_t v18 = v7;
    __int16 v19 = 2114;
    id v20 = v11;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "[defaultImage] <%{public}@> default image name %{public}@ calculated from %{public}@", (uint8_t *)&v15, 0x20u);
  }
LABEL_10:

  return v7;
}

- (id)bestSnapshotWithImageName:(id)a3 sceneHandle:(id)a4 variantID:(id)a5 scale:(double)a6 referenceSize:(CGSize)a7 requireExactSize:(BOOL)a8 contentTypeMask:(unint64_t)a9 statusBarStateMask:(unint64_t)a10 launchingOrientation:(int64_t)a11 contentOverridesContext:(id)a12 userInterfaceStyle:(int64_t)a13 displayEdgeInfo:(id)a14
{
  BOOL v15 = a8;
  double height = a7.height;
  double width = a7.width;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    BOOL v32 = SBLogCommon();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      double v39 = [v23 sceneIdentifier];
      *(_DWORD *)buf = 138543618;
      id v51 = v22;
      __int16 v52 = 2114;
      BOOL v53 = v39;
      _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "A snapshot was requested with an empty reference size for name: <%{public}@> in scene <%{public}@>.", buf, 0x16u);
    }
    id v38 = 0;
  }
  else
  {
    BOOL v26 = v15;
    uint64_t v27 = -[SBApplication _snapshotsWithImageName:sceneHandle:referenceSize:requireExactSize:launchingScale:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:](self, "_snapshotsWithImageName:sceneHandle:referenceSize:requireExactSize:launchingScale:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:", v22, v23, v15, a9, a10, a11, width, height, a6, a12, a13, a14);
    long long v28 = +[SBAppSwitcherDomain rootSettings];
    [v28 snapshotAspectRatioAcceptanceThreshold];
    uint64_t v30 = v29;

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __231__SBApplication_DefaultImage__bestSnapshotWithImageName_sceneHandle_variantID_scale_referenceSize_requireExactSize_contentTypeMask_statusBarStateMask_launchingOrientation_contentOverridesContext_userInterfaceStyle_displayEdgeInfo___block_invoke;
    v47[3] = &__block_descriptor_57_e31_B16__0__XBApplicationSnapshot_8l;
    BOOL v48 = v26;
    *(double *)&v47[4] = width;
    *(double *)&v47[5] = height;
    v47[6] = v30;
    int v31 = (uint64_t (**)(void, void))MEMORY[0x1D948C7A0](v47);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    BOOL v32 = v27;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      id v42 = v22;
      uint64_t v35 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v32);
          }
          id v37 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (v24)
          {
            id v38 = [*(id *)(*((void *)&v43 + 1) + 8 * i) variantWithIdentifier:v24];
            if (v38 && (((uint64_t (**)(void, id))v31)[2](v31, v38) & 1) != 0) {
              goto LABEL_22;
            }
          }
          if (((uint64_t (**)(void, void *))v31)[2](v31, v37))
          {
            id v38 = v37;
            goto LABEL_22;
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v34) {
          continue;
        }
        break;
      }
      id v38 = 0;
LABEL_22:
      id v22 = v42;
    }
    else
    {
      id v38 = 0;
    }
  }
  return v38;
}

BOOL __231__SBApplication_DefaultImage__bestSnapshotWithImageName_sceneHandle_variantID_scale_referenceSize_requireExactSize_contentTypeMask_statusBarStateMask_launchingOrientation_contentOverridesContext_userInterfaceStyle_displayEdgeInfo___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 56);
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 isValid];

    return v6;
  }
  else
  {
    [v4 referenceSize];
    double v9 = v8;
    double v11 = v10;
    double v12 = *(double *)(a1 + 32);
    double v13 = *(double *)(a1 + 40);
    int v14 = [v5 isValid];

    return v14 && vabdd_f64(v9 / v11, v12 / v13) <= *(double *)(a1 + 48);
  }
}

- (id)_snapshotManifest
{
  return [(SBApplication *)self _snapshotManifestCreateIfNeeded:1];
}

+ (id)snapshotSortDescriptorsForNames:(id)a3 scheme:(id)a4 imageScale:(double)a5 referenceSize:(CGSize)a6 userInterfaceStyle:(int64_t)a7 statusBarStateMask:(unint64_t)a8 interfaceOrientationMask:(unint64_t)a9 requiredOSVersion:(id)a10
{
  double height = a6.height;
  double width = a6.width;
  id v19 = a10;
  id v20 = a4;
  id v21 = a3;
  id v37 = [a1 snapshotSortDescriptorForNames:v21];
  id v22 = [a1 snapshotSortDescriptorForScheme:v20];

  uint64_t v33 = [a1 snapshotSortDescriptorForInterfaceOrientationMask:a9];
  uint64_t v34 = [a1 snapshotSortDescriptorForStatusBarStateMask:a8];
  id v23 = [a1 snapshotSortDescriptorForImageScale:a5];
  uint64_t v35 = objc_msgSend(a1, "snapshotSortDescriptorForReferenceSize:", width, height);
  id v24 = [a1 snapshotSortDescriptorForContentTypeMask];
  int v36 = [a1 snapshotSortDescriptorForRequiredOSVersion:v19];

  id v25 = [a1 snapshotSortDescriptorPreferringProtectedContent];
  BOOL v32 = [a1 snapshotSortDescriptorForCreationDate];
  BOOL v26 = [a1 snapshotSortDescriptorForUIUserInterfaceStyle:a7];
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v28 = [v21 count];

  if (v20 != 0 && v28 == 0) {
    uint64_t v29 = v22;
  }
  else {
    uint64_t v29 = v37;
  }
  if (v20 != 0 && v28 == 0) {
    uint64_t v30 = v37;
  }
  else {
    uint64_t v30 = v22;
  }
  [v27 addObject:v29];
  [v27 addObject:v30];
  [v27 addObject:v33];
  [v27 addObject:v26];
  [v27 addObject:v34];
  [v27 addObject:v24];
  [v27 addObject:v23];
  [v27 addObject:v35];
  [v27 addObject:v25];
  [v27 addObject:v32];
  [v27 addObject:v36];

  return v27;
}

+ (id)snapshotSortDescriptorPreferringProtectedContent
{
  return (id)[MEMORY[0x1E4FA58D0] sortDescriptorWithKey:11 ascending:1 comparator:&__block_literal_global_143];
}

+ (id)snapshotSortDescriptorForUIUserInterfaceStyle:(int64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__SBApplication_SnapshotSorting__snapshotSortDescriptorForUIUserInterfaceStyle___block_invoke;
  v5[3] = &__block_descriptor_40_e31_q24__0__NSNumber_8__NSNumber_16l;
  v5[4] = a3;
  int v3 = [MEMORY[0x1E4FA58D0] sortDescriptorWithKey:12 ascending:1 comparator:v5];
  return v3;
}

+ (id)snapshotSortDescriptorForStatusBarStateMask:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__SBApplication_SnapshotSorting__snapshotSortDescriptorForStatusBarStateMask___block_invoke;
  v5[3] = &__block_descriptor_40_e53_q24__0__XBStatusBarSettings_8__XBStatusBarSettings_16l;
  v5[4] = a3;
  int v3 = [MEMORY[0x1E4FA58D0] sortDescriptorWithKey:8 ascending:1 comparator:v5];
  return v3;
}

+ (id)snapshotSortDescriptorForScheme:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FA58D0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__SBApplication_SnapshotSorting__snapshotSortDescriptorForScheme___block_invoke;
  v8[3] = &unk_1E6B00B30;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 sortDescriptorWithKey:2 ascending:1 comparator:v8];

  return v6;
}

+ (id)snapshotSortDescriptorForRequiredOSVersion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FA58D0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__SBApplication_SnapshotSorting__snapshotSortDescriptorForRequiredOSVersion___block_invoke;
  v8[3] = &unk_1E6B00B30;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 sortDescriptorWithKey:9 ascending:1 comparator:v8];

  return v6;
}

+ (id)snapshotSortDescriptorForReferenceSize:(CGSize)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__SBApplication_SnapshotSorting__snapshotSortDescriptorForReferenceSize___block_invoke;
  v5[3] = &__block_descriptor_48_e29_q24__0__NSValue_8__NSValue_16l;
  CGSize v6 = a3;
  id v3 = [MEMORY[0x1E4FA58D0] sortDescriptorWithKey:5 ascending:1 comparator:v5];
  return v3;
}

+ (id)snapshotSortDescriptorForNames:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FA58D0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__SBApplication_SnapshotSorting__snapshotSortDescriptorForNames___block_invoke;
  v8[3] = &unk_1E6B00B30;
  id v9 = v3;
  id v5 = v3;
  CGSize v6 = [v4 sortDescriptorWithKey:1 ascending:1 comparator:v8];

  return v6;
}

+ (id)snapshotSortDescriptorForInterfaceOrientationMask:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__SBApplication_SnapshotSorting__snapshotSortDescriptorForInterfaceOrientationMask___block_invoke;
  v5[3] = &__block_descriptor_40_e31_q24__0__NSNumber_8__NSNumber_16l;
  void v5[4] = a3;
  id v3 = [MEMORY[0x1E4FA58D0] sortDescriptorWithKey:4 ascending:1 comparator:v5];
  return v3;
}

+ (id)snapshotSortDescriptorForImageScale:(double)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SBApplication_SnapshotSorting__snapshotSortDescriptorForImageScale___block_invoke;
  v5[3] = &__block_descriptor_40_e31_q24__0__NSNumber_8__NSNumber_16l;
  *(double *)&void v5[4] = a3;
  id v3 = [MEMORY[0x1E4FA58D0] sortDescriptorWithKey:6 ascending:1 comparator:v5];
  return v3;
}

+ (id)snapshotSortDescriptorForCreationDate
{
  return (id)[MEMORY[0x1E4FA58D0] sortDescriptorWithKey:10 ascending:1 comparator:&__block_literal_global_11_1];
}

+ (id)snapshotSortDescriptorForContentTypeMask
{
  return (id)[MEMORY[0x1E4FA58D0] sortDescriptorWithKey:7 ascending:1 comparator:&__block_literal_global_8];
}

+ (id)_deviceSafeAreaInsets
{
  uint64_t v2 = (void *)_deviceSafeAreaInsets_deviceSafeAreaInsets;
  if (!_deviceSafeAreaInsets_deviceSafeAreaInsets)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
    id v4 = [v3 safeAreaInsetsPortrait];
    id v5 = objc_alloc(MEMORY[0x1E4FA58D8]);
    [v4 topInset];
    double v7 = v6;
    [v4 leftInset];
    double v9 = v8;
    [v4 bottomInset];
    double v11 = v10;
    [v4 rightInset];
    uint64_t v13 = [v5 initWithTop:v7 left:v9 bottom:v11 right:v12];
    int v14 = (void *)_deviceSafeAreaInsets_deviceSafeAreaInsets;
    _deviceSafeAreaInsets_deviceSafeAreaInsets = v13;

    uint64_t v2 = (void *)_deviceSafeAreaInsets_deviceSafeAreaInsets;
  }
  return v2;
}

- (void)_noteProcess:(id)a3 didChangeToState:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 isRunning]) {
    [(SBApplication *)self _updateProcess:v7 withState:v6];
  }
}

- (void)_processDidLaunch:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogWorkspace();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(SBApplication *)self bundleIdentifier];
    int v11 = 136315394;
    double v12 = "-[SBApplication _processDidLaunch:]";
    __int16 v13 = 2114;
    int v14 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "%s %{public}@", (uint8_t *)&v11, 0x16u);
  }
  id v7 = [v4 state];
  [(SBApplication *)self _updateProcess:v4 withState:v7];

  double v8 = [v4 executionContext];

  double v9 = [v8 environment];
  double v10 = [v9 objectForKey:@"CLASSIC"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self->_currentClassicMode = [v10 integerValue];
  }
}

- (void)_processWillLaunch:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBApplication.m", 839, @"Invalid parameter not satisfying: %@", @"process" object file lineNumber description];
  }
  id v6 = SBLogWorkspace();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(SBApplication *)self bundleIdentifier];
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[SBApplication _processWillLaunch:]";
    __int16 v16 = 2114;
    __int16 v17 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "%s %{public}@", buf, 0x16u);
  }
  double v8 = [v5 state];
  [(SBApplication *)self _updateProcess:v5 withState:v8];

  [(SBApplication *)self _setNewlyInstalled:0];
  [(SBApplication *)self _setRecentlyUpdated:0];
  id v9 = [(SBApplication *)self _prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:0];
  double v10 = [v5 executionContext];
  int v11 = [v10 environment];
  double v12 = [v11 objectForKey:@"CLASSIC_OVERRIDE"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self->_currentClassicMode = [v12 integerValue];
  }
}

- (void)_setRecentlyUpdated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(SBApplication *)self _isRecentlyUpdated] != a3)
  {
    dataStore = self->_dataStore;
    id v6 = [NSNumber numberWithBool:v3];
    [(FBSApplicationDataStore *)dataStore setObject:v6 forKey:@"SBApplicationRecentlyUpdated"];

    if (v3) {
      char v7 = 1;
    }
    else {
      char v7 = 2;
    }
    *((unsigned char *)self + 80) = *((unsigned char *)self + 80) & 0xF8 | v7;
    double v8 = SBLogCommon();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v9)
      {
        bundleIdentifier = self->_bundleIdentifier;
        int v13 = 138543362;
        int v14 = bundleIdentifier;
        int v11 = "%{public}@ is now recently updated.";
LABEL_10:
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v13, 0xCu);
      }
    }
    else if (v9)
    {
      double v12 = self->_bundleIdentifier;
      int v13 = 138543362;
      int v14 = v12;
      int v11 = "%{public}@ is no longer recently updated.";
      goto LABEL_10;
    }

    [(SBApplication *)self _updateRecentlyUpdatedTimer];
    [(SBApplication *)self _noteIconDataSourceDidChange];
  }
}

- (void)_setNewlyInstalled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBApplication *)self _isNewlyInstalled] != a3)
  {
    dataStore = self->_dataStore;
    id v6 = [NSNumber numberWithBool:v3];
    [(FBSApplicationDataStore *)dataStore setObject:v6 forKey:@"SBApplicationIsNewlyInstalled"];

    if (v3) {
      char v7 = 8;
    }
    else {
      char v7 = 16;
    }
    *((unsigned char *)self + 80) = *((unsigned char *)self + 80) & 0xC7 | v7;
    [(SBApplication *)self _noteIconDataSourceDidChange];
  }
}

- (id)_prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  initializationContext = v5->_initializationContext;
  if (!initializationContext)
  {
    char v7 = [[SBApplicationSupportServiceRequestContext alloc] initWithApplication:v5 launchDisplayConfiguration:v4];
    double v8 = v5->_initializationContext;
    v5->_initializationContext = v7;

    initializationContext = v5->_initializationContext;
  }
  BOOL v9 = initializationContext;
  objc_sync_exit(v5);

  [(SBApplicationSupportServiceRequestContext *)v9 applicationInitializationContextWithCompletion:&__block_literal_global_18];
  return v9;
}

- (BOOL)isSpotlight
{
  uint64_t v2 = [(SBApplication *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.Spotlight"];

  return v3;
}

- (BOOL)isPaperBoard
{
  uint64_t v2 = [(SBApplication *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.PaperBoard"];

  return v3;
}

- (id)_initializationRequestContext
{
  return [(SBApplication *)self _prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:0];
}

- (void)setShowsProgress:(BOOL)a3
{
  BOOL v5 = [(SBApplication *)self showsProgress];
  int showsProgressCount = self->_showsProgressCount;
  if (a3)
  {
    int v7 = 1;
  }
  else
  {
    if (showsProgressCount < 1) {
      goto LABEL_6;
    }
    int v7 = -1;
  }
  self->_int showsProgressCount = showsProgressCount + v7;
LABEL_6:
  if (v5 != [(SBApplication *)self showsProgress])
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"SBApplicationShowsProgressChangedNotification" object:self userInfo:0];
  }
}

- (BOOL)showsProgress
{
  return self->_showsProgressCount > 0;
}

- (NSString)displayName
{
  return [(SBApplicationInfo *)self->_appInfo displayName];
}

- (BOOL)isSameExecutableAsApplication:(id)a3
{
  id v4 = [a3 bundleIdentifier];
  if (v4)
  {
    BOOL v5 = [(SBApplication *)self bundleIdentifier];
    char v6 = [v5 isEqualToString:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)hasProminentlyIndicatedLocationUseWhileForeground
{
  return self->_hasProminentlyIndicatedLocationUseWhileForeground;
}

- (void)setNowRecordingApplication:(BOOL)a3
{
  if (self->_isNowRecordingApplication != a3)
  {
    self->_isNowRecordingApplication = a3;
    -[FBApplicationProcess setRecordingAudio:](self->_process, "setRecordingAudio:");
  }
}

- (unint64_t)supportedSizingPoliciesForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6
{
  int v10 = [a4 isExternal];
  char v11 = v10;
  if (a3 == 2)
  {
    if ([(SBApplication *)self alwaysMaximizedInChamois])
    {
      return 4;
    }
    else
    {
      if ([(SBApplication *)self supportsChamoisSceneResizing]) {
        return 5;
      }
      if ((v11 & 1) == 0
        && (BOOL v13 = [(SBApplication *)self classicAppFullScreen], a5 == a6)
        && v13)
      {
        return 5;
      }
      else
      {
        return 3;
      }
    }
  }
  else if (a3 == 1)
  {
    if (([(SBApplication *)self isMedusaCapable] & (v10 ^ 1)) != 0) {
      return 5;
    }
    else {
      return 4;
    }
  }
  else if (a3)
  {
    return 0;
  }
  else
  {
    return 4;
  }
}

- (int64_t)preferredSizingPolicyForSwitcherWindowManagementStyle:(unint64_t)a3 displayIdentity:(id)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6
{
  char v10 = [a4 isExternal];
  if (a3 < 2) {
    return 2;
  }
  if (a3 != 2) {
    return 0;
  }
  char v12 = v10;
  if ([(SBApplication *)self alwaysMaximizedInChamois]) {
    return 2;
  }
  if ([(SBApplication *)self supportsChamoisSceneResizing]) {
    return 0;
  }
  if ((v12 & 1) == 0)
  {
    BOOL v13 = [(SBApplication *)self classicAppFullScreen];
    if (a5 == a6 && v13) {
      return 2;
    }
  }
  return 1;
}

- (void)setDynamicApplicationShortcutItems:(id)a3
{
  id v4 = a3;
  id v6 = +[SBApplicationShortcutStoreManager sharedManager];
  BOOL v5 = [(SBApplication *)self bundleIdentifier];
  objc_msgSend(v6, "setApplicationShortcutItems:forBundleIdentifier:withVersion:", v4, v5, -[SBApplicationInfo dynamicApplicationShortcutItemsVersion](self->_appInfo, "dynamicApplicationShortcutItemsVersion"));
}

- (NSArray)dynamicApplicationShortcutItems
{
  char v3 = +[SBApplicationShortcutStoreManager sharedManager];
  id v4 = [(SBApplication *)self bundleIdentifier];
  BOOL v5 = objc_msgSend(v3, "applicationShortcutItemsForBundleIdentifier:withVersion:", v4, -[SBApplicationInfo dynamicApplicationShortcutItemsVersion](self->_appInfo, "dynamicApplicationShortcutItemsVersion"));

  return (NSArray *)v5;
}

uint64_t __84__SBApplication_SnapshotSorting__snapshotSortDescriptorForInterfaceOrientationMask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  unint64_t v7 = [v5 integerValue];

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = v8 & v6;
  unint64_t v10 = v8 & v7;
  unint64_t v11 = v8 & v6 | v8 & v7;
  if ((v6 & 2) != 0) {
    uint64_t v12 = -1;
  }
  else {
    uint64_t v12 = 1;
  }
  if ((unint64_t)(v6 & 2) >> 1 != ((v7 >> 1) & 1)) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  if (((v6 | v7) & 2) != 0) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if ((v8 & 2) != 0) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v14;
  }
  BOOL v16 = v9 == 0;
  int v17 = (v9 != 0) ^ (v10 != 0);
  if (v16) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = -1;
  }
  if (v17) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  if (v11) {
    return v19;
  }
  else {
    return v15;
  }
}

- (void)_setDataUsage:(int)a3
{
  if (self->_dataFlagsIsSet)
  {
    int v4 = *((unsigned __int8 *)self + 84);
    self->_dataFlagsIsSet = 1;
    *((unsigned char *)self + 84) = a3;
    if (v4 == a3) {
      return;
    }
  }
  else
  {
    self->_dataFlagsIsSet = 1;
    *((unsigned char *)self + 84) = a3;
  }
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = *MEMORY[0x1E4FA79F8];
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
  unint64_t v7 = [(SBApplication *)self bundleIdentifier];
  uint64_t v8 = [v6 dictionaryWithObject:v7 forKey:*MEMORY[0x1E4FA7B10]];
  [v9 postNotificationName:v5 object:self userInfo:v8];
}

- (BOOL)classicAppZoomedIn
{
  if (![(SBApplication *)self _classicAppScaledPhoneOnPad]
    || [(SBApplicationInfo *)self->_appInfo requiresHiDPI])
  {
    return 0;
  }
  int v4 = [(SBApplication *)self _dataStore];
  uint64_t v5 = [(SBApplication *)self _baseSceneIdentifier];
  uint64_t v6 = [v4 sceneStoreForIdentifier:v5 creatingIfNecessary:0];

  unint64_t v7 = [v6 safeObjectForKey:@"classicAppZoomedIn" ofType:objc_opt_class()];
  LOBYTE(v4) = [v7 BOOLValue];

  return (char)v4;
}

- (BOOL)classicAppRequiresHiDPI
{
  BOOL v3 = [(SBApplication *)self isClassic];
  if (v3)
  {
    appInfo = self->_appInfo;
    LOBYTE(v3) = [(SBApplicationInfo *)appInfo requiresHiDPI];
  }
  return v3;
}

- (BOOL)classicAppZoomedInOrRequiresHiDPI
{
  if ([(SBApplication *)self classicAppZoomedIn]) {
    return 1;
  }
  return [(SBApplication *)self classicAppRequiresHiDPI];
}

- (BOOL)classicAppFullScreen
{
  if (SBFEffectiveHomeButtonType() == 2) {
    return ![(SBApplication *)self classicAppNonFullScreenWithHomeAffordance];
  }
  if ([(SBApplication *)self classicAppScaled]
    && [(SBApplication *)self _supportsApplicationType:4])
  {
    int v4 = ![(SBApplication *)self _classicAppScaledPhoneOnPad];
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4 | [(SBApplication *)self _classicAppScaledPadOnPad];
}

- (BOOL)classicAppWithOwnSafeArea
{
  if (SBFEffectiveHomeButtonType() != 2) {
    return 0;
  }
  uint64_t v3 = [(SBApplication *)self _classicMode];
  return SBApplicationClassicModeWantsSafeAreaInsets(v3);
}

- (BOOL)includesStatusBarInClassicJailForInterfaceOrientation:(int64_t)a3
{
  LODWORD(v5) = [(SBApplication *)self isClassic];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if ([(SBApplication *)self _classicAppScaledPhoneOnPad])
      {
        LOBYTE(v5) = 0;
      }
      else if (SBFEffectiveHomeButtonType() == 2 {
             && ![(SBApplication *)self classicAppScaledWithAspectRatioCloseEnoughToBeTreatedAsFullScreen])
      }
      {
        LODWORD(v5) = [(SBApplication *)self classicAppWithOwnSafeArea];
        if (v5)
        {
          if (__sb__runningInSpringBoard())
          {
            __sb__mainScreenReferenceBounds();
            BSSizeRoundForScale();
            double v10 = v9;
            double v12 = v11;
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F42D90] mainScreen];
            [v13 _referenceBounds];
            BSSizeRoundForScale();
            double v10 = v14;
            double v12 = v15;
          }
          BOOL v16 = objc_opt_class();
          int v17 = [MEMORY[0x1E4F42D90] mainScreen];
          uint64_t v18 = [v17 displayConfiguration];
          objc_msgSend(v16, "_defaultLaunchingSizeForDisplayConfiguration:classicMode:", v18, -[SBApplication _classicMode](self, "_classicMode"));
          double v20 = v19;
          double v22 = v21;

          if (v20 == v10 && v22 == v12)
          {
            LOBYTE(v5) = [(SBApplication *)self classicAppFullScreen];
          }
          else if ((unint64_t)(a3 - 3) >= 2)
          {
            LOBYTE(v5) = v12 / v10 < v22 / v20;
          }
          else
          {
            LOBYTE(v5) = v12 / v10 > v22 / v20;
          }
        }
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      uint64_t v8 = SBFEffectiveHomeButtonType();
      int64_t v5 = [(SBApplication *)self _classicMode];
      if (v8 == 2)
      {
        LOBYTE(v5) = SBApplicationClassicModeExpectsRoundedCorners(v5);
      }
      else
      {
        LOBYTE(v5) = v5 != 1;
      }
    }
  }
  return v5;
}

- (CGSize)defaultLaunchingSizeForDisplayConfiguration:(id)a3
{
  id v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_defaultLaunchingSizeForDisplayConfiguration:classicMode:", v4, -[SBApplication _classicMode](self, "_classicMode"));
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)_setClassicAppZoomedIn:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBApplication *)self _classicAppScaledPhoneOnPad]
    && ![(SBApplicationInfo *)self->_appInfo requiresHiDPI])
  {
    double v5 = [(SBApplication *)self _dataStore];
    double v6 = [(SBApplication *)self _baseSceneIdentifier];
    id v8 = [v5 sceneStoreForIdentifier:v6 creatingIfNecessary:1];

    double v7 = [NSNumber numberWithBool:v3];
    [v8 setObject:v7 forKey:@"classicAppZoomedIn"];
  }
}

- (void)_recalculateApplicationSupportedTypes
{
  self->_calculatedSupportedTypes = 0;
  self->_supportedTypes &= 3uLL;
  [(SBApplication *)self _calculateSupportedTypesLazilyIfNecessary];
}

+ (int64_t)_bestAvailableClassicModeForHostingExtensionContainedInApplication:(BOOL)a3
{
  BOOL v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__SBApplication_Classic_Private___bestAvailableClassicModeForHostingExtensionContainedInApplication___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bestAvailableClassicModeForHostingExtensionContainedInApplication__onceToken != -1) {
    dispatch_once(&_bestAvailableClassicModeForHostingExtensionContainedInApplication__onceToken, block);
  }
  id v4 = &_bestAvailableClassicModeForHostingExtensionContainedInApplication__sLargestValidClassicModePad;
  if (!v3) {
    id v4 = &_bestAvailableClassicModeForHostingExtensionContainedInApplication__sLargestValidClassicModePhone;
  }
  return *v4;
}

void __101__SBApplication_Classic_Private___bestAvailableClassicModeForHostingExtensionContainedInApplication___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v1 = *MEMORY[0x1E4FA6E50];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 48);
  v27[1] = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 16);
  v27[2] = v2;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 64);
  long long v5 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 80);
  v27[3] = v3;
  v27[4] = v4;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 96);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 112);
  v27[5] = v5;
  v27[6] = v6;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 128);
  v27[7] = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 144);
  v27[8] = v7;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 160);
  v27[9] = v8;
  v27[10] = v9;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 256);
  long long v10 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 272);
  long long v12 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 224);
  v26[0] = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 208);
  v26[1] = v10;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 304);
  long long v13 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 320);
  v26[2] = v12;
  v26[3] = v13;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 336);
  long long v16 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 352);
  v26[4] = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 240);
  v26[5] = v15;
  long long v17 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 368);
  long long v18 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 384);
  v26[6] = v16;
  v26[7] = v17;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 400);
  v26[8] = v18;
  v26[9] = v19;
  long long v20 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 432);
  long long v21 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 448);
  v26[10] = v11;
  v26[11] = v20;
  v26[12] = v14;
  v26[13] = v21;
  v26[14] = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 464);
  v27[0] = v1;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __101__SBApplication_Classic_Private___bestAvailableClassicModeForHostingExtensionContainedInApplication___block_invoke_2;
  v25[3] = &__block_descriptor_40_e23_q24__0r__CGSize_dd_8Q16l;
  v25[4] = *(void *)(a1 + 32);
  double v22 = (uint64_t (**)(void, void, void))MEMORY[0x1D948C7A0](v25);
  id v23 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v24 = [v23 userInterfaceIdiom];

  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    _bestAvailableClassicModeForHostingExtensionContainedInApplication__sLargestValidClassicModePad = ((uint64_t (**)(void, _OWORD *, uint64_t))v22)[2](v22, v26, 15);
  }
  _bestAvailableClassicModeForHostingExtensionContainedInApplication__sLargestValidClassicModePhone = ((uint64_t (**)(void, _OWORD *, uint64_t))v22)[2](v22, v27, 11);
}

uint64_t __101__SBApplication_Classic_Private___bestAvailableClassicModeForHostingExtensionContainedInApplication___block_invoke_2(uint64_t a1, double *a2, uint64_t a3)
{
  int v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v8 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    long long v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v3 userInterfaceIdiom])
    {
      int v8 = 1;
      goto LABEL_9;
    }
  }
  int v8 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    BOOL v25 = 1;
    goto LABEL_17;
  }
LABEL_9:
  if (!__sb__runningInSpringBoard())
  {
    long long v9 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v9 userInterfaceIdiom] == 1)
    {
      BOOL v25 = SBFEffectiveHomeButtonType() == 2;

      goto LABEL_17;
    }

LABEL_16:
    BOOL v25 = 0;
LABEL_17:
    if ((v8 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (SBFEffectiveDeviceClass() != 2) {
    goto LABEL_16;
  }
  BOOL v25 = SBFEffectiveHomeButtonType() == 2;
  if (v8) {
LABEL_18:
  }

LABEL_19:
  if (a3)
  {
    double v10 = *MEMORY[0x1E4F1DB30];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
    long long v12 = a2 + 1;
    uint64_t v13 = -1;
    while (1)
    {
      double v15 = *(v12 - 1);
      uint64_t v14 = *(void *)v12;
      uint64_t v16 = objc_msgSend(*(id *)(a1 + 32), "_classicModeForLaunchingSize:", v15, *v12);
      if (v16 == -1) {
        goto LABEL_38;
      }
      uint64_t v17 = v16;
      int v18 = __sb__runningInSpringBoard();
      char v19 = v18;
      if (v18)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        long long v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v20 = BSSizeEqualToSize();
      if ((v19 & 1) == 0) {

      }
      if (v20) {
        return v17;
      }
      int v21 = __sb__runningInSpringBoard();
      char v22 = v21;
      if (v21)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        a2 = [MEMORY[0x1E4F42D90] mainScreen];
        [a2 _referenceBounds];
      }
      BSSizeRoundForScale();
      int v23 = BSSizeGreaterThanOrEqualToSize();
      if ((v22 & 1) == 0) {

      }
      if (!v23
        || (BSSizeGreaterThanOrEqualToSize() & 1) == 0
        && (!v25
         || !SBApplicationClassicModeExpectsRoundedCorners(v17)
         || SBApplicationClassicModeExpectsRoundedCorners(v13)))
      {
LABEL_38:
        uint64_t v17 = v13;
        uint64_t v14 = v11;
        double v15 = v10;
      }
      v12 += 2;
      double v10 = v15;
      uint64_t v11 = v14;
      uint64_t v13 = v17;
      if (!--a3) {
        return v17;
      }
    }
  }
  return -1;
}

- (void)_classicModeForHostingExtensionContainedInApplication:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([(id)objc_opt_class() KJHKJHw39rq9w87q903475q0983rskjd])
    {
      uint64_t v4 = -1;
    }
    else
    {
      long long v5 = objc_opt_class();
      long long v6 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v7 = [v6 userInterfaceIdiom];

      if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        uint64_t v8 = [a1 _classicAppScaledPhoneOnPad] ^ 1;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v4 = [v5 _bestAvailableClassicModeForHostingExtensionContainedInApplication:v8];
    }
    if ((-[SBApplication _bypassesClassicMode]((uint64_t)v3) & 1) != 0 || (unint64_t)(v4 + 1) <= 1)
    {
      a1 = (void *)[a1 _classicMode];
    }
    else
    {
      long long v9 = [MEMORY[0x1E4F42D90] mainScreen];
      double v10 = [v9 displayConfiguration];

      uint64_t v11 = [a1 _classicMode];
      [(id)objc_opt_class() _defaultLaunchingSizeForDisplayConfiguration:v10 classicMode:v11];
      [(id)objc_opt_class() _defaultLaunchingSizeForDisplayConfiguration:v10 classicMode:v4];
      if (BSSizeLessThanSize()) {
        a1 = (void *)v11;
      }
      else {
        a1 = (void *)v4;
      }
    }
  }

  return a1;
}

- (id)_classicModeForHostingExtensionContainedInThisApplicationInUnknownHostingHierarchy
{
  if (result)
  {
    long long v1 = result;
    if ([(id)objc_opt_class() KJHKJHw39rq9w87q903475q0983rskjd])
    {
      uint64_t v2 = -1;
    }
    else
    {
      id v3 = objc_opt_class();
      uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v5 = [v4 userInterfaceIdiom];

      uint64_t v2 = [v3 _bestAvailableClassicModeForHostingExtensionContainedInApplication:(v5 & 0xFFFFFFFFFFFFFFFBLL) == 1];
    }
    if (([v1[21] disablesClassicMode] & 1) != 0
      || ([v1[21] hasViewServicesEntitlement] & 1) != 0)
    {
      return 0;
    }
    else
    {
      char v6 = [v1 isSystemApplication];
      if ((unint64_t)(v2 - 1) >= 0xFFFFFFFFFFFFFFFELL) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = v2;
      }
      if (v6) {
        return 0;
      }
      else {
        return (id *)v7;
      }
    }
  }
  return result;
}

+ (unint64_t)_canonicalScreenTypeForClassicMode:(int64_t)a3
{
  unint64_t result = 0;
  switch(a3)
  {
    case -1:
      unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
      break;
    case 0:
      unint64_t result = SBHScreenTypeForCurrentDevice();
      break;
    case 3:
      unint64_t result = 1;
      break;
    case 4:
      unint64_t result = 2;
      break;
    case 5:
      unint64_t result = 4;
      break;
    case 6:
      unint64_t result = 3;
      break;
    case 7:
      unint64_t result = 11;
      break;
    case 8:
      unint64_t result = 21;
      break;
    case 9:
      unint64_t result = 5;
      break;
    case 10:
      unint64_t result = 13;
      break;
    case 11:
      unint64_t result = 23;
      break;
    case 12:
      unint64_t result = 29;
      break;
    case 13:
      unint64_t result = 32;
      break;
    case 14:
      unint64_t result = 33;
      break;
    case 15:
      unint64_t result = 41;
      break;
    case 16:
      unint64_t result = 36;
      break;
    case 17:
      unint64_t result = 38;
      break;
    case 18:
      unint64_t result = 43;
      break;
    case 19:
      unint64_t result = 39;
      break;
    case 20:
      unint64_t result = 40;
      break;
    case 21:
      unint64_t result = 45;
      break;
    case 22:
      unint64_t result = 42;
      break;
    default:
      return result;
  }
  return result;
}

+ (int64_t)_bestClassicModeForScreenType:(unint64_t)a3
{
  if (a3 > 0x2D) {
    return -1;
  }
  else {
    return qword_1D8FD00F0[a3];
  }
}

+ (unint64_t)_niceScreenTypeForClassicType:(unint64_t)a3 matchingAValidDisplayZoomModeOnScreenType:(unint64_t)a4
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  unint64_t v11 = a3;
  SBHGetScreenSpecification();
  SBHGetScreenSpecification();
  int HasHomeButton = SBHScreenTypeHasHomeButton();
  if (HasHomeButton == SBHScreenTypeHasHomeButton()) {
    SBHEnumerateScreenTypes();
  }
  unint64_t v6 = +[SBApplication _unobscuredScreenTypeForScreenType:]((uint64_t)a1, v9[3]);
  v9[3] = v6;
  _Block_object_dispose(&v8, 8);
  return v6;
}

uint64_t __106__SBApplication_Classic_Private___niceScreenTypeForClassicType_matchingAValidDisplayZoomModeOnScreenType___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = SBHGetScreenSpecification();
  if (!*(void *)(a1 + 64))
  {
    uint64_t result = BSSizeEqualToSize();
    if (result)
    {
      int v7 = *(unsigned __int8 *)(a1 + 120);
      uint64_t result = SBHScreenTypeHasHomeButton();
      if (v7 == result)
      {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
        *a3 = 1;
      }
    }
  }
  return result;
}

+ (unint64_t)_unobscuredScreenTypeForScreenType:(uint64_t)a1
{
  self;
  if (a2 >= 0x30)
  {
    id v3 = SBLogClassicMode();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[SBApplication _unobscuredScreenTypeForScreenType:](a2, v3);
    }

    int IsPad = SBHScreenTypeIsPad();
    int HasHomeButton = SBHScreenTypeHasHomeButton();
    uint64_t v6 = 3;
    if (!HasHomeButton) {
      uint64_t v6 = 1;
    }
    uint64_t v7 = 29;
    if (HasHomeButton) {
      uint64_t v7 = 40;
    }
    if (IsPad) {
      return v7;
    }
    else {
      return v6;
    }
  }
  return a2;
}

- (uint64_t)_screenTypeForClassicMode:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (!a1) {
    return v2;
  }
  if ((unint64_t)(a2 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v4 = +[SBPlatformController sharedInstance];
    int v5 = [v4 isRoundCornerPad];
    int v6 = [v4 isRoundCornerPhone];
    uint64_t v7 = [(id)v2 info];
    int v8 = [v7 isAzulLinked];

    if (v8 || !(v5 | v6))
    {
      uint64_t v13 = SBHScreenTypeForCurrentDevice();
      uint64_t v14 = [(id)objc_opt_class() _canonicalScreenTypeForClassicMode:a2];
      uint64_t v2 = [(id)objc_opt_class() _niceScreenTypeForClassicType:v14 matchingAValidDisplayZoomModeOnScreenType:v13];
    }
    else
    {
      BOOL v9 = SBApplicationClassicModeExpectsRoundedCorners(a2);
      BOOL v10 = SBApplicationClassicModeRepresentsPad(a2);
      int v11 = SBApplicationClassicModeRepresentsPhone(a2);
      if (v5)
      {
        if (v10 && v9)
        {
          uint64_t v2 = 40;
        }
        else if ((v11 & v9) != 0)
        {
          uint64_t v2 = 3;
        }
        else
        {
          uint64_t v2 = 29;
        }
      }
      else
      {
        if ((v11 & 1) == 0)
        {
          double v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:sel__screenTypeForClassicMode_ object:v2 file:@"SBApplication+Classic.m" lineNumber:823 description:@"Not valid to have non-phone classic modes on a phone"];
        }
        if (v9) {
          uint64_t v2 = 3;
        }
        else {
          uint64_t v2 = 1;
        }
      }
    }

    return v2;
  }
  return SBHScreenTypeForCurrentDevice();
}

- (void)_setDefaultClassicModeOverride:(int64_t)a3
{
  self->_defaultClassicModeOverride = a3;
}

- (uint64_t)_isNewEnoughToKnowAboutRoundPads
{
  if (result) {
    return [*(id *)(result + 168) isPeaceBLinked];
  }
  return result;
}

- (BOOL)_supportsApplicationType:(unint64_t)a3
{
  return (self->_supportedTypes & a3) != 0;
}

- (unint64_t)_supportedTypeForClassicModeNone
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      int v4 = __sb__runningInSpringBoard();
      char v5 = v4;
      if (v4)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v9 = BSSizeEqualToSize();
      if ((v5 & 1) == 0) {

      }
      if (v9) {
        return 0x2000;
      }
      int v13 = __sb__runningInSpringBoard();
      char v14 = v13;
      if (v13)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v17 = BSSizeEqualToSize();
      if ((v14 & 1) == 0) {

      }
      if (v17) {
        return 4096;
      }
      int v19 = __sb__runningInSpringBoard();
      char v20 = v19;
      if (v19)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v23 = BSSizeEqualToSize();
      if ((v20 & 1) == 0) {

      }
      if (v23) {
        return 2048;
      }
      int v27 = __sb__runningInSpringBoard();
      char v28 = v27;
      if (v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v31 = BSSizeEqualToSize();
      if ((v28 & 1) == 0) {

      }
      if (v31) {
        return 1024;
      }
      int v33 = __sb__runningInSpringBoard();
      char v34 = v33;
      if (v33)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v37 = BSSizeEqualToSize();
      if ((v34 & 1) == 0) {

      }
      if (v37) {
        return 512;
      }
      int v39 = __sb__runningInSpringBoard();
      char v40 = v39;
      if (v39)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v45 = BSSizeEqualToSize();
      if ((v40 & 1) == 0) {

      }
      if (v45) {
        return 256;
      }
      int v47 = __sb__runningInSpringBoard();
      char v48 = v47;
      if (v47)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v51 = BSSizeEqualToSize();
      if ((v48 & 1) == 0) {

      }
      if (v51) {
        return 128;
      }
      int v53 = __sb__runningInSpringBoard();
      char v54 = v53;
      if (v53)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v57 = BSSizeEqualToSize();
      if ((v54 & 1) == 0) {

      }
      if (v57) {
        return 64;
      }
      int v59 = __sb__runningInSpringBoard();
      char v60 = v59;
      if (v59)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v63 = BSSizeEqualToSize();
      if ((v60 & 1) == 0) {

      }
      if (v63) {
        return 32;
      }
      int v65 = __sb__runningInSpringBoard();
      char v66 = v65;
      if (v65)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v69 = BSSizeEqualToSize();
      if ((v66 & 1) == 0) {

      }
      if (v69) {
        return 16;
      }
      int v71 = __sb__runningInSpringBoard();
      char v72 = v71;
      if (v71)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v75 = BSSizeEqualToSize();
      if ((v72 & 1) == 0) {

      }
      if (v75) {
        return 8;
      }
      int v77 = __sb__runningInSpringBoard();
      char v78 = v77;
      if (v77)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v81 = BSSizeEqualToSize();
      if ((v78 & 1) == 0) {

      }
      if (v81) {
        return 4;
      }
      int v83 = __sb__runningInSpringBoard();
      char v84 = v83;
      if (v83)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      unsigned int v86 = BSSizeEqualToSize();
      if ((v84 & 1) == 0) {

      }
      return v86;
    }
  }
  else
  {
    int v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v2 = (void *)[v6 userInterfaceIdiom];

    if (v2 != (void *)1) {
      goto LABEL_3;
    }
  }
  int v7 = __sb__runningInSpringBoard();
  char v8 = v7;
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  uint64_t v11 = MEMORY[0x1E4FA6E50];
  char v12 = BSSizeEqualToSize();
  if ((v8 & 1) == 0) {

  }
  if (v12) {
    return 0x40000000;
  }
  int v15 = __sb__runningInSpringBoard();
  char v16 = v15;
  if (v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  char v18 = BSSizeEqualToSize();
  if ((v16 & 1) == 0) {

  }
  if (v18) {
    return 0xFFFFFFFF80000000;
  }
  int v21 = __sb__runningInSpringBoard();
  char v22 = v21;
  if (v21)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  uint64_t v24 = (void *)BSSizeEqualToSize();
  if ((v22 & 1) == 0) {

  }
  int v25 = __sb__runningInSpringBoard();
  char v26 = v25;
  if (v24)
  {
    if (v25)
    {
      if (SBFEffectiveDeviceClass() != 2 || SBFEffectiveHomeButtonType() != 2) {
        return 0x8000000;
      }
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v24 userInterfaceIdiom] != 1 || SBFEffectiveHomeButtonType() != 2)
      {
        unint64_t v10 = 0x8000000;
LABEL_93:

        return v10;
      }
    }
    int v29 = __sb__runningInSpringBoard();
    char v30 = v29;
    if (v29)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      id v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [v3 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v43 < *(double *)(v11 + 424)) {
      unint64_t v10 = 0x8000000;
    }
    else {
      unint64_t v10 = 0x10000000;
    }
    if ((v30 & 1) == 0) {

    }
    if ((v26 & 1) == 0) {
      goto LABEL_93;
    }
  }
  else
  {
    if (v25)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    char v32 = BSSizeEqualToSize();
    if ((v26 & 1) == 0) {

    }
    if (v32)
    {
      return 0x20000000;
    }
    else
    {
      int v35 = __sb__runningInSpringBoard();
      char v36 = v35;
      if (v35)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      char v38 = BSSizeEqualToSize();
      if ((v36 & 1) == 0) {

      }
      if (v38)
      {
        return 0x2000000;
      }
      else
      {
        int v41 = __sb__runningInSpringBoard();
        char v42 = v41;
        if (v41)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
          [v2 _referenceBounds];
        }
        BSSizeRoundForScale();
        char v46 = BSSizeEqualToSize();
        if ((v42 & 1) == 0) {

        }
        if (v46)
        {
          return 0x4000000;
        }
        else
        {
          int v49 = __sb__runningInSpringBoard();
          char v50 = v49;
          if (v49)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
            [v2 _referenceBounds];
          }
          BSSizeRoundForScale();
          char v52 = BSSizeEqualToSize();
          if ((v50 & 1) == 0) {

          }
          if (v52)
          {
            return 0x800000;
          }
          else
          {
            int v55 = __sb__runningInSpringBoard();
            char v56 = v55;
            if (v55)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
              [v2 _referenceBounds];
            }
            BSSizeRoundForScale();
            char v58 = BSSizeEqualToSize();
            if ((v56 & 1) == 0) {

            }
            if (v58)
            {
              return 0x400000;
            }
            else
            {
              int v61 = __sb__runningInSpringBoard();
              char v62 = v61;
              if (v61)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                [v2 _referenceBounds];
              }
              BSSizeRoundForScale();
              char v64 = BSSizeEqualToSize();
              if ((v62 & 1) == 0) {

              }
              if (v64)
              {
                return 0x100000;
              }
              else
              {
                int v67 = __sb__runningInSpringBoard();
                char v68 = v67;
                if (v67)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v2 _referenceBounds];
                }
                BSSizeRoundForScale();
                char v70 = BSSizeEqualToSize();
                if ((v68 & 1) == 0) {

                }
                if (v70)
                {
                  return 0x80000;
                }
                else
                {
                  int v73 = __sb__runningInSpringBoard();
                  char v74 = v73;
                  if (v73)
                  {
                    __sb__mainScreenReferenceBounds();
                  }
                  else
                  {
                    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                    [v2 _referenceBounds];
                  }
                  BSSizeRoundForScale();
                  char v76 = BSSizeEqualToSize();
                  if ((v74 & 1) == 0) {

                  }
                  if (v76)
                  {
                    return 0x40000;
                  }
                  else
                  {
                    int v79 = __sb__runningInSpringBoard();
                    char v80 = v79;
                    if (v79)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
                      [v2 _referenceBounds];
                    }
                    BSSizeRoundForScale();
                    int v82 = BSSizeEqualToSize();
                    if ((v80 & 1) == 0) {

                    }
                    if (v82)
                    {
                      if (__sb__runningInSpringBoard())
                      {
                        if (SBFEffectiveDeviceClass() == 2)
                        {
                          if (SBFEffectiveHomeButtonType() == 2) {
                            return 0x20000;
                          }
                          else {
                            return 2;
                          }
                        }
                        else
                        {
                          return 2;
                        }
                      }
                      else
                      {
                        uint64_t v85 = [MEMORY[0x1E4F42948] currentDevice];
                        if ([v85 userInterfaceIdiom] == 1)
                        {
                          if (SBFEffectiveHomeButtonType() == 2) {
                            unint64_t v10 = 0x20000;
                          }
                          else {
                            unint64_t v10 = 2;
                          }
                        }
                        else
                        {
                          unint64_t v10 = 2;
                        }
                      }
                    }
                    else
                    {
                      return 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v10;
}

- (BOOL)_isClassicViaOverride
{
  return (unint64_t)(self->_defaultClassicModeOverride - 1) < 0xFFFFFFFFFFFFFFFELL;
}

- (uint64_t)_isNewEnoughToKnowAbout2020Phones
{
  if (result)
  {
    uint64_t v1 = result;
    if ([*(id *)(result + 168) isAzulHWLinked])
    {
      return 1;
    }
    else
    {
      uint64_t result = [*(id *)(v1 + 168) isAzulLinked];
      if (result)
      {
        uint64_t v2 = *(void **)(v1 + 168);
        return [v2 isAppleApplication];
      }
    }
  }
  return result;
}

+ (CGSize)_defaultLaunchingSizeForClassicMode:(int64_t)a3
{
  switch(a3)
  {
    case -1:
    case 0:
      int v4 = (long long *)MEMORY[0x1E4F1DB30];
      goto LABEL_4;
    case 1:
      int v4 = (long long *)MEMORY[0x1E4FA6E50];
LABEL_4:
      long long v3 = *v4;
      break;
    case 2:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 16);
      break;
    case 3:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 32);
      break;
    case 4:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 48);
      break;
    case 5:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 64);
      break;
    case 6:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 80);
      break;
    case 7:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 96);
      break;
    case 8:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 144);
      break;
    case 9:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 112);
      break;
    case 10:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 128);
      break;
    case 11:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 160);
      break;
    case 12:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 208);
      break;
    case 13:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 240);
      break;
    case 14:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 256);
      break;
    case 15:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 288);
      break;
    case 16:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 320);
      break;
    case 17:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 352);
      break;
    case 18:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 384);
      break;
    case 19:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 368);
      break;
    case 20:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 416);
      break;
    case 21:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 448);
      break;
    case 22:
      long long v3 = *(_OWORD *)(MEMORY[0x1E4FA6E50] + 432);
      break;
    default:
      break;
  }
  double v5 = *((double *)&v3 + 1);
  result.double width = *(double *)&v3;
  result.double height = v5;
  return result;
}

+ (CGSize)_defaultLaunchingSizeForDisplayConfiguration:(id)a3 classicMode:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(a3, "bounds", v4, v5);
    double v6 = v8;
    double v7 = v9;
  }
  else
  {
    [a1 _defaultLaunchingSizeForClassicMode:a4];
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

+ (int64_t)_classicModeReplacingMoreSpaceWithEquivalentStandardCanvasForClassicMode:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0x16) {
    return 20;
  }
  else {
    return qword_1D8FD0260[a3 + 1];
  }
}

+ (CGSize)_standardCanvasSizeForClassicMode:(int64_t)a3
{
  int64_t v3 = a3;
  if (SBApplicationClassicModeRepresentsMoreSpace(a3)) {
    int64_t v3 = [a1 _classicModeReplacingMoreSpaceWithEquivalentStandardCanvasForClassicMode:v3];
  }
  [a1 _defaultLaunchingSizeForClassicMode:v3];
  result.double height = v6;
  result.double width = v5;
  return result;
}

+ (int64_t)_classicModeForLaunchingSize:(CGSize)a3
{
  int v4 = __sb__runningInSpringBoard();
  char v5 = v4;
  if (v4)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    int64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  char v6 = BSSizeEqualToSize();
  if ((v5 & 1) == 0) {

  }
  if (v6) {
    return 0;
  }
  double v8 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    goto LABEL_27;
  }
  if (BSSizeEqualToSize()) {
    return 12;
  }
  if (BSSizeEqualToSize()) {
    return 13;
  }
  if (BSSizeEqualToSize()) {
    return 16;
  }
  if (BSSizeEqualToSize()) {
    return 17;
  }
  if (BSSizeEqualToSize()) {
    return 18;
  }
  if (BSSizeEqualToSize()) {
    return 19;
  }
  if (BSSizeEqualToSize()) {
    return 14;
  }
  if (BSSizeEqualToSize()) {
    return 21;
  }
  if (BSSizeEqualToSize()) {
    return 22;
  }
LABEL_27:
  if (BSSizeEqualToSize()) {
    return 1;
  }
  if (BSSizeEqualToSize()) {
    return 2;
  }
  if (BSSizeEqualToSize()) {
    return 3;
  }
  if (BSSizeEqualToSize()) {
    return 4;
  }
  if (BSSizeEqualToSize()) {
    return 6;
  }
  if (BSSizeEqualToSize()) {
    return 7;
  }
  if (BSSizeEqualToSize()) {
    return 8;
  }
  if (BSSizeEqualToSize()) {
    return 9;
  }
  if (BSSizeEqualToSize()) {
    return 10;
  }
  if (BSSizeEqualToSize()) {
    return 11;
  }
  return -1;
}

+ (BOOL)KJHKJHw39rq9w87q903475q0983rskjd
{
  if (KJHKJHw39rq9w87q903475q0983rskjd_onceToken != -1) {
    dispatch_once(&KJHKJHw39rq9w87q903475q0983rskjd_onceToken, &__block_literal_global_3);
  }
  return KJHKJHw39rq9w87q903475q0983rskjd_sRelaxable;
}

void __67__SBApplication_Classic_Internal__KJHKJHw39rq9w87q903475q0983rskjd__block_invoke()
{
  id v1 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  if (os_variant_has_internal_content() & 1) != 0 || ([v1 isCarrierInstall]) {
    char v0 = 0;
  }
  else {
    char v0 = [v1 isDeveloperInstall] ^ 1;
  }
  KJHKJHw39rq9w87q903475q0983rskjd_sRelaxable = v0;
}

- (void)_calculateSupportedTypesForSplashBoard
{
  BOOL v3 = [(SBApplicationInfo *)self->_appInfo isMonarchLinked];
  BOOL v4 = [(SBApplicationInfo *)self->_appInfo isTigrisLinked];
  BOOL v25 = [(SBApplicationInfo *)self->_appInfo isPeaceLinked];
  BOOL v5 = [(SBApplicationInfo *)self->_appInfo isYukonLinked];
  BOOL v6 = [(SBApplicationInfo *)self->_appInfo isAzulLinked];
  int isNewEnoughToKnowAbout2020 = -[SBApplication _isNewEnoughToKnowAbout2020Phones]((uint64_t)self);
  BOOL v8 = [(SBApplicationInfo *)self->_appInfo isPeaceBLinked];
  BOOL v9 = [(SBApplicationInfo *)self->_appInfo isSkyLinked];
  BOOL v10 = [(SBApplicationInfo *)self->_appInfo isSydneyLinked];
  BOOL v26 = [(SBApplicationInfo *)self->_appInfo isCrystalLinked];
  if ([(SBApplication *)self _supportsApplicationType:2])
  {
    BOOL v11 = [(SBApplicationInfo *)self->_appInfo wantsFullScreen];
    if (v11) {
      BOOL v12 = v4;
    }
    else {
      BOOL v12 = v3;
    }
    if (v11) {
      BOOL v13 = v8;
    }
    else {
      BOOL v13 = v3;
    }
    if (v11) {
      BOOL v14 = v6;
    }
    else {
      BOOL v14 = v3;
    }
    if (v11) {
      BOOL v15 = v5;
    }
    else {
      BOOL v15 = v3;
    }
    if (v11) {
      BOOL v16 = v9;
    }
    else {
      BOOL v16 = v3;
    }
    if (v11) {
      BOOL v17 = v10;
    }
    else {
      BOOL v17 = v3;
    }
    uint64_t v18 = 2;
    if (v3) {
      uint64_t v18 = 134217730;
    }
    if (v12) {
      unint64_t v19 = self->_supportedTypes | v18 | 0x400000;
    }
    else {
      unint64_t v19 = self->_supportedTypes | v18;
    }
    if (v13) {
      v19 |= 0x10820000uLL;
    }
    if (v14) {
      v19 |= 0x100000uLL;
    }
    if (v15) {
      v19 |= 0x80000uLL;
    }
    if (v16) {
      v19 |= 0x10000uLL;
    }
    self->_unint64_t supportedTypes = v19;
    if (v17)
    {
      self->_unint64_t supportedTypes = v19 | 0x21200000;
      if (!v15) {
        goto LABEL_39;
      }
      uint64_t v20 = -417071104;
    }
    else
    {
      if (!v15) {
        goto LABEL_39;
      }
      uint64_t v20 = 1107558400;
    }
    self->_unint64_t supportedTypes = v19 | v20;
  }
LABEL_39:
  if ([(SBApplication *)self _supportsApplicationType:1])
  {
    uint64_t v21 = 29;
    if (v4) {
      uint64_t v21 = 93;
    }
    unint64_t v22 = self->_supportedTypes | v21;
    if (v25) {
      v22 |= 0x400uLL;
    }
    uint64_t v23 = 32;
    if (isNewEnoughToKnowAbout2020) {
      uint64_t v23 = 2208;
    }
    unint64_t v24 = v22 | v23;
    if (isNewEnoughToKnowAbout2020 | v6) {
      unint64_t v22 = v24;
    }
    self->_unint64_t supportedTypes = v22;
    if (v10 || v26)
    {
      if (v10) {
        v22 |= 0x1100uLL;
      }
      if (v26) {
        v22 |= 0x2200uLL;
      }
      self->_unint64_t supportedTypes = v22;
    }
  }
}

+ (BOOL)_displayZoomSizesOnThisDeviceNeedRedaction
{
  uint64_t v0 = self;
  unint64_t v1 = SBHScreenTypeForCurrentDevice();
  return SBHScreenTypeIsZoomed() && v1 != +[SBApplication _unobscuredScreenTypeForScreenType:](v0, v1);
}

- (void)flushSnapshotsForAllScenes
{
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  BOOL v3 = _os_activity_create(&dword_1D85BA000, "XBMigration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v3, &v5);

  BOOL v4 = [(SBApplication *)self _snapshotManifest];
  [v4 deleteSnapshotsUsingPredicateBuilder:&__block_literal_global_15];

  os_activity_scope_leave(&v5);
}

uint64_t __54__SBApplication_Snapshots__flushSnapshotsForAllScenes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentTypeMask:1];
}

- (void)flushSnapshotsForAllScenesIncludingAllLegacyImages
{
  *(void *)((char *)&v63[1] + 2) = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v2 = _os_activity_create(&dword_1D85BA000, "XBMigration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v2, &state);

  BOOL v3 = XBLogFileManifest();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(SBApplication *)self info];
    os_activity_scope_state_s v5 = [v4 bundleIdentifier];
    int buf = 138543362;
    int v61 = v5;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Start flushSnapshotsForAllScenesIncludingAllLegacyImages", (uint8_t *)&buf, 0xCu);
  }
  int v49 = [(SBApplication *)self _snapshotManifest];
  BOOL v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v52 = [v49 containerPath];
  double v7 = [(SBApplication *)self info];
  BOOL v8 = XBCachesPathForApplicationInfo();
  char v48 = [v8 stringByAppendingPathComponent:@"LaunchImages"];

  BOOL v9 = XBLogFileManifest();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = [(SBApplication *)self info];
    BOOL v11 = [v10 bundleIdentifier];
    int buf = 138543618;
    int v61 = v11;
    __int16 v62 = 2114;
    v63[0] = v48;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing legacy snapshot folder at %{public}@", (uint8_t *)&buf, 0x16u);
  }
  [v6 removeItemAtPath:v48 error:0];
  BOOL v12 = [(SBApplication *)self isSystemApplication];
  BOOL v13 = [(SBApplication *)self isInternalApplication];
  BOOL v14 = XBLogFileManifest();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v15 = [(SBApplication *)self info];
    BOOL v16 = [v15 bundleIdentifier];
    int buf = 138543874;
    int v61 = v16;
    __int16 v62 = 1024;
    LODWORD(v63[0]) = v12;
    WORD2(v63[0]) = 1024;
    *(_DWORD *)((char *)v63 + 6) = v13;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] we think we might have SplashBoard-generated images we want to keep. isSystemApplication: %d; isInter"
      "nalApplication: %d",
      (uint8_t *)&buf,
      0x18u);
  }
  if (v12 || v13)
  {
    BOOL v17 = [MEMORY[0x1E4FA58C8] predicate];
    [v17 setContentTypeMask:2];
    char v46 = v17;
    uint64_t v18 = [v49 defaultGroupIdentifier];
    int v47 = [v49 snapshotsForGroupID:v18 matchingPredicate:v46];

    if ([v47 count])
    {
      unint64_t v19 = [v6 subpathsOfDirectoryAtPath:v52 error:0];
      char v50 = objc_msgSend(v47, "bs_mapNoNulls:", &__block_literal_global_29);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v55 != v22) {
              objc_enumerationMutation(v20);
            }
            unint64_t v24 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            BOOL v25 = [v52 stringByAppendingPathExtension:v24];
            char v53 = 0;
            if ([v6 fileExistsAtPath:v25 isDirectory:&v53])
            {
              if (v53)
              {
                BOOL v26 = XBLogFileManifest();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  int v27 = [(SBApplication *)self info];
                  char v28 = [v27 bundleIdentifier];
                  int buf = 138543618;
                  int v61 = v28;
                  __int16 v62 = 2114;
                  v63[0] = v25;
                  _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_INFO, "[%{public}@] SKIP removing path because it's a directory: %{public}@", (uint8_t *)&buf, 0x16u);
                }
              }
              else
              {
                BOOL v26 = [v24 lastPathComponent];
                if ([v50 containsObject:v26])
                {
                  char v31 = XBLogFileManifest();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                  {
                    char v32 = [(SBApplication *)self info];
                    int v33 = [v32 bundleIdentifier];
                    int buf = 138543618;
                    int v61 = v33;
                    __int16 v62 = 2114;
                    v63[0] = v26;
                    _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_INFO, "[%{public}@] SKIP removing snapshot because it's in our filenamesForExclusion: %{public}@", (uint8_t *)&buf, 0x16u);
                  }
                }
                else
                {
                  char v34 = XBLogFileManifest();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    int v35 = [(SBApplication *)self info];
                    char v36 = [v35 bundleIdentifier];
                    int buf = 138543618;
                    int v61 = v36;
                    __int16 v62 = 2114;
                    v63[0] = v25;
                    _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing SplashBoard-generated images at: %{public}@", (uint8_t *)&buf, 0x16u);
                  }
                  [v6 removeItemAtPath:v25 error:0];
                }
              }
            }
            else
            {
              BOOL v26 = XBLogFileManifest();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                int v29 = [(SBApplication *)self info];
                char v30 = [v29 bundleIdentifier];
                int buf = 138543618;
                int v61 = v30;
                __int16 v62 = 2114;
                v63[0] = v25;
                _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_INFO, "[%{public}@] SKIP removing path because it doesn't exist: %{public}@", (uint8_t *)&buf, 0x16u);
              }
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v59 count:16];
        }
        while (v21);
      }

      goto LABEL_36;
    }
    char v37 = XBLogFileManifest();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      char v38 = [(SBApplication *)self info];
      int v39 = [v38 bundleIdentifier];
      int buf = 138543618;
      int v61 = v39;
      __int16 v62 = 2114;
      v63[0] = v46;
      _os_log_impl(&dword_1D85BA000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] nothing to keep after searching for snapshots we care about and finding nothing. predicate: %{public}@", (uint8_t *)&buf, 0x16u);
    }
  }
  char v40 = XBLogFileManifest();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = [(SBApplication *)self info];
    char v42 = [v41 bundleIdentifier];
    int buf = 138543618;
    int v61 = v42;
    __int16 v62 = 2114;
    v63[0] = v52;
    _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing all files in folder: %{public}@", (uint8_t *)&buf, 0x16u);
  }
  [v6 removeItemAtPath:v52 error:0];
LABEL_36:
  double v43 = XBLogFileManifest();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    long long v44 = [(SBApplication *)self info];
    char v45 = [v44 bundleIdentifier];
    int buf = 138543362;
    int v61 = v45;
    _os_log_impl(&dword_1D85BA000, v43, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished flushSnapshotsForAllScenesIncludingAllLegacyImages", (uint8_t *)&buf, 0xCu);
  }
  os_activity_scope_leave(&state);
}

uint64_t __78__SBApplication_Snapshots__flushSnapshotsForAllScenesIncludingAllLegacyImages__block_invoke(uint64_t a1, void *a2)
{
  return [a2 filename];
}

- (void)flushSnapshotsForSceneID:(id)a3
{
  id v4 = a3;
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1D85BA000, "XBMigration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v7);

  BOOL v6 = [(SBApplication *)self _snapshotManifest];
  [v6 deleteSnapshotsForGroupID:v4 predicateBuilder:&__block_literal_global_31];

  os_activity_scope_leave(&v7);
}

uint64_t __53__SBApplication_Snapshots__flushSnapshotsForSceneID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentTypeMask:1];
}

- (void)saveSnapshotForSceneHandle:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  BOOL v11 = _os_activity_create(&dword_1D85BA000, "XBCapture", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v11, &v12);

  -[SBApplication _xbactivity_saveSnapshotForSceneHandle:context:completion:](self, "_xbactivity_saveSnapshotForSceneHandle:context:completion:", v8, v9, v10, v12.opaque[0], v12.opaque[1]);
  os_activity_scope_leave(&v12);
}

- (void)saveSuspendSnapshot:(id)a3 forSceneHandle:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v39 = a4;
  if (!v6)
  {
    char v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"SBApplication+Snapshots.m", 167, @"Invalid parameter not satisfying: %@", @"sceneSnapshot" object file lineNumber description];
  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_state_s v7 = _os_activity_create(&dword_1D85BA000, "XBCapture", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  id v8 = [v39 sceneIfExists];
  id v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  id v10 = [v8 settings];
  uint64_t v11 = [v10 interfaceOrientation];

  os_activity_scope_state_s v12 = [v9 uiClientSettings];
  uint64_t v13 = objc_msgSend(v12, "sb_effectiveInterfaceOrientation");

  if (v11 != v13)
  {
    BOOL v14 = XBLogCapture();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v27 = [(SBApplication *)self bundleIdentifier];
      BSInterfaceOrientationDescription();
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      int v29 = BSInterfaceOrientationDescription();
      *(_DWORD *)int buf = 138543874;
      id v44 = v27;
      __int16 v45 = 2114;
      id v46 = v28;
      __int16 v47 = 2114;
      char v48 = v29;
      _os_log_error_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_ERROR, "<%{public}@> Suspend snapshot cancelled due to orientation mismatch; settings are: %{public}@ but client setting"
        "s are %{public}@.",
        buf,
        0x20u);
    }
  }
  else
  {
LABEL_5:
    BOOL v14 = [(SBApplication *)self _snapshotManifest];
    BOOL v15 = [v6 context];
    BOOL v16 = [v15 sceneID];
    [v14 deleteSnapshotsForGroupID:v16 predicateBuilder:&__block_literal_global_43];

    BOOL v17 = [v14 createSnapshotForSceneSnapshot:v6 withName:@"SBSuspendSnapshot"];
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
    [v17 setExpirationDate:v18];

    [v17 beginImageAccessUntilExpiration];
    unint64_t v19 = [MEMORY[0x1E4F62490] sharedInstance];
    id v20 = [v6 context];
    uint64_t v21 = [v20 sceneID];
    uint64_t v22 = [v19 sceneWithIdentifier:v21];

    uint64_t v23 = [v22 settings];
    unint64_t v24 = [v23 displayConfiguration];
    BOOL v25 = v24;
    if (v24)
    {
      id v26 = v24;
    }
    else
    {
      id v26 = [MEMORY[0x1E4F62420] mainConfiguration];
    }
    char v30 = v26;

    if (-[SBApplication isClassic](self, "isClassic") && [v30 isMainRootDisplay])
    {
      [(SBApplication *)self defaultLaunchingSizeForDisplayConfiguration:v30];
      objc_msgSend(v17, "setReferenceSize:");
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v31 = [v17 statusBarSettings];
      id v32 = v39;
      int v33 = objc_msgSend(v32, "statusBarEffectiveStyleRequestWithStyle:", _SBStatusBarStyleFromLegacyStyle(objc_msgSend(v31, "style")));
      if (v31 && ([v31 isHidden] & 1) == 0)
      {
        char v37 = (void *)[v31 mutableCopy];
        [v33 legibilityStyle];
        uint64_t v34 = _UIStatusBarStyleFromLegibilityStyle();
        if (v34 != [v31 style])
        {
          [v33 legibilityStyle];
          [v37 setStyle:_UIStatusBarStyleFromLegibilityStyle()];
        }
        [v17 setStatusBarSettings:v37];
      }
    }
    int v35 = [[SBSceneSnapshotDataProvider alloc] initWithSceneSnapshot:v6 scaleFactor:1.0];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __63__SBApplication_Snapshots__saveSuspendSnapshot_forSceneHandle___block_invoke_2;
    v40[3] = &unk_1E6AF4A98;
    v40[4] = self;
    id v41 = v6;
    [v14 generateImageForSnapshot:v17 dataProvider:v35 writeToFile:0 imageGeneratedHandler:v40 imageDataSavedHandler:0];
  }
  os_activity_scope_leave(&state);
}

void __63__SBApplication_Snapshots__saveSuspendSnapshot_forSceneHandle___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setContentTypeMask:1];
  [v2 setName:@"SBSuspendSnapshot"];
}

void __63__SBApplication_Snapshots__saveSuspendSnapshot_forSceneHandle___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __63__SBApplication_Snapshots__saveSuspendSnapshot_forSceneHandle___block_invoke_3;
    v3[3] = &unk_1E6AF5290;
    id v2 = *(void **)(a1 + 40);
    v3[4] = *(void *)(a1 + 32);
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }
}

void __63__SBApplication_Snapshots__saveSuspendSnapshot_forSceneHandle___block_invoke_3(uint64_t a1)
{
  unint64_t v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) context];
  id v2 = [v3 sceneID];
  [v1 _noteSnapshotDidUpdateForSceneIdentifier:v2];
}

- (void)createDownscaledVariantForSnapshot:(id)a3 sceneHandle:(id)a4 scaleFactor:(double)a5 didSaveImage:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  BOOL v14 = [v11 variantID];
  int v15 = [v14 isEqualToString:@"downscaled"];

  if (v15)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"SBApplication+Snapshots.m" lineNumber:233 description:@"Can't create a downscaled variant for already downscaled snapshot."];
  }
  BOOL v16 = [(SBApplication *)self _snapshotManifest];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __100__SBApplication_Snapshots__createDownscaledVariantForSnapshot_sceneHandle_scaleFactor_didSaveImage___block_invoke;
  v22[3] = &unk_1E6AF6260;
  id v23 = v11;
  id v24 = v12;
  double v27 = a5;
  id v25 = v16;
  id v26 = v13;
  id v17 = v13;
  id v18 = v16;
  id v19 = v12;
  id v20 = v11;
  [v18 beginSnapshotAccessTransaction:v22 completion:0];
}

void __100__SBApplication_Snapshots__createDownscaledVariantForSnapshot_sceneHandle_scaleFactor_didSaveImage___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [v2 referenceSize];
  SBRectWithSize();
  objc_msgSend(v2, "setContentFrame:");
  id v3 = [*(id *)(a1 + 32) variantWithIdentifier:@"downscaled"];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4)
    {
      os_activity_scope_state_s v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
  else
  {
    id v6 = objc_alloc_init(SBSnapshotDataProviderContext);
    -[XBSnapshotDataProviderContext setOpaque:](v6, "setOpaque:", [*(id *)(a1 + 32) isImageOpaque]);
    [*(id *)(a1 + 32) imageScale];
    -[XBSnapshotDataProviderContext setScale:](v6, "setScale:");
    os_activity_scope_state_s v7 = [*(id *)(a1 + 40) sceneIdentifier];
    [(SBSnapshotDataProviderContext *)v6 setSceneID:v7];

    id v8 = [*(id *)(a1 + 32) imageForInterfaceOrientation:0];
    uint64_t v9 = [*(id *)(a1 + 48) createVariantForSnapshot:*(void *)(a1 + 32) withIdentifier:@"downscaled"];
    id v10 = (void *)v9;
    if (v8 && v9)
    {
      id v11 = [[SBUIImageDataProvider alloc] initWithImage:v8 context:v6 scaleFactor:*(double *)(a1 + 64)];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __100__SBApplication_Snapshots__createDownscaledVariantForSnapshot_sceneHandle_scaleFactor_didSaveImage___block_invoke_2;
      v14[3] = &unk_1E6AF5A50;
      id v12 = *(void **)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      [v12 generateImageForSnapshot:v10 dataProvider:v11 writeToFile:1 imageGeneratedHandler:0 imageDataSavedHandler:v14];
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 56);
      if (v13) {
        (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
      }
    }
  }
}

uint64_t __100__SBApplication_Snapshots__createDownscaledVariantForSnapshot_sceneHandle_scaleFactor_didSaveImage___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteAllSnapshots
{
  id v3 = [(SBApplication *)self _snapshotManifest];
  v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke;
  v5[3] = &unk_1E6AF4AC0;
  void v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke_3;
  v4[3] = &unk_1E6AF4AC0;
  [v3 beginSnapshotAccessTransaction:v5 completion:v4];
}

void __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _snapshotManifest];
  [v1 deleteSnapshotsUsingPredicateBuilder:&__block_literal_global_57];
}

uint64_t __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setContentTypeMask:1];
}

void __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke_4;
  block[3] = &unk_1E6AF4AC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__SBApplication_Snapshots__deleteAllSnapshots__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteSnapshotDidUpdateForSceneIdentifier:0];
}

- (void)deleteSnapshotForContext:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1D85BA000, "XBInvalidate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  id v6 = [v4 sceneID];
  [v4 scale];
  if (!v6 || v7 == 0.0)
  {
    uint64_t v9 = XBLogFileManifest();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBApplication(Snapshots) deleteSnapshotForContext:]();
    }
  }
  else
  {
    id v8 = [(SBApplication *)self _snapshotManifest];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke;
    v12[3] = &unk_1E6AF5290;
    v12[4] = self;
    id v13 = v4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_3;
    v10[3] = &unk_1E6AF5290;
    v10[4] = self;
    id v11 = v6;
    [v8 beginSnapshotAccessTransaction:v12 completion:v10];
  }
  os_activity_scope_leave(&state);
}

void __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _snapshotManifest];
  id v3 = [*(id *)(a1 + 40) sceneID];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_2;
  v4[3] = &unk_1E6AF6288;
  id v5 = *(id *)(a1 + 40);
  [v2 deleteSnapshotsForGroupID:v3 predicateBuilder:v4];
}

void __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4FA58A8];
  id v4 = *(void **)(a1 + 32);
  id v9 = a2;
  id v5 = [v4 name];
  id v6 = [v3 normalizeSnapshotName:v5];
  [v9 setName:v6];

  [v9 setContentTypeMask:1];
  [*(id *)(a1 + 32) frame];
  objc_msgSend(v9, "setReferenceSize:", v7, v8);
  [*(id *)(a1 + 32) scale];
  objc_msgSend(v9, "setImageScale:");
}

void __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_4;
  v2[3] = &unk_1E6AF5290;
  id v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __53__SBApplication_Snapshots__deleteSnapshotForContext___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteSnapshotDidUpdateForSceneIdentifier:*(void *)(a1 + 40)];
}

- (void)manifest:(id)a3 didPurgeProtectedContentSnapshotsWithGroupIdentifiers:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__SBApplication_Snapshots__manifest_didPurgeProtectedContentSnapshotsWithGroupIdentifiers___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __91__SBApplication_Snapshots__manifest_didPurgeProtectedContentSnapshotsWithGroupIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteSnapshotDidUpdateForSceneIdentifiers:*(void *)(a1 + 40)];
}

- (void)_xbactivity_saveSnapshotForSceneHandle:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  id v11 = [v8 sceneIfExists];
  if (v11)
  {
    id v12 = [v8 sceneIdentifier];
    id v13 = [v9 name];
    [v9 scale];
    double v15 = v14;
    [v9 frame];
    if (!v12 || CGRectEqualToRect(*(CGRect *)&v16, *MEMORY[0x1E4F1DB28]))
    {
      id v20 = XBLogCapture();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:]();
      }
LABEL_6:

      if (v10) {
        v10[2](v10, 1);
      }
      goto LABEL_8;
    }
    if (!v9)
    {
      id v20 = XBLogCapture();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:]();
      }
      goto LABEL_6;
    }
    uint64_t v21 = [v9 sceneID];
    char v22 = [v12 isEqualToString:v21];

    if ((v22 & 1) == 0)
    {
      id v20 = XBLogCapture();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:].cold.6((uint64_t)v12, v9, v20);
      }
      goto LABEL_6;
    }
    uint64_t v23 = [v11 uiPresentationManager];
    id v24 = (void *)v23;
    if (!v23)
    {
      int v29 = XBLogCapture();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:]();
      }

      if (v10) {
        v10[2](v10, 4);
      }
      goto LABEL_55;
    }
    if (v15 <= 0.0)
    {
      char v30 = XBLogCapture();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:].cold.5();
      }

      if (v10) {
        v10[2](v10, 1);
      }
      goto LABEL_55;
    }
    char v111 = (void *)v23;
    BOOL v112 = [MEMORY[0x1E4F624A8] contextWithFBSContext:v9];
    id v25 = [v11 settings];
    id v26 = [v25 displayConfiguration];
    double v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = [MEMORY[0x1E4F62420] mainConfiguration];
    }
    int v109 = v28;

    char v31 = v112;
    id v32 = [v112 settings];
    int v110 = v32;
    if ([(SBApplication *)self isClassic])
    {
      int v33 = v32;
      char v34 = [v109 isMainRootDisplay];
      [v33 frame];
      if (v34)
      {
        [(SBApplication *)self defaultLaunchingSizeForDisplayConfiguration:v109];
        double v38 = v37;
        double v40 = v39;
        char v31 = v112;
        [v112 frame];
        [v109 bounds];
        double v42 = v41;
        double v44 = v43;
        BSRectWithSize();
        CGFloat v46 = v45;
        CGFloat v48 = v47;
        double v105 = v40;
        double v107 = v38;
        double v49 = (v42 - v38) * 0.5;
        double v50 = (v44 - v40) * 0.5;
        objc_msgSend(v112, "setFrame:", v49, v50);
        if ([(SBApplication *)self classicAppRequiresHiDPI])
        {
          UIRectGetCenter();
          v133.origin.x = v49;
          v133.origin.y = (v44 - v40) * 0.5;
          v133.size.double width = v46;
          v133.size.double height = v48;
          CGFloat v51 = round(CGRectGetWidth(v133) * 0.5);
          v134.origin.x = v49;
          v134.origin.y = v50;
          v134.size.double width = v51;
          v134.size.double height = v48;
          CGRectGetHeight(v134);
          UIRectCenteredAboutPoint();
          double v53 = v52;
          double v55 = v54;
          CGFloat v57 = v56;
          CGFloat v59 = v58;
        }
        else
        {
          CGFloat v59 = v48;
          CGFloat v57 = v46;
          double v55 = v50;
          double v53 = v49;
        }
        id v24 = v111;
        v135.origin.x = v49;
        v135.origin.y = v50;
        v135.size.double width = v46;
        v135.size.double height = v48;
        double v65 = v53 - CGRectGetMinX(v135);
        v136.origin.x = v49;
        v136.origin.y = v50;
        v136.size.double width = v46;
        v136.size.double height = v48;
        double v67 = v55 - CGRectGetMinY(v136);
        double v71 = v59;
        double v69 = v57;
        double v63 = v105;
        double v61 = v107;
LABEL_40:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v72 = [v8 isTranslucent] ^ 1;
        }
        else {
          uint64_t v72 = 1;
        }
        [v31 setOpaque:v72];
        int v73 = [v11 clientSettings];
        [v31 setClientSettings:v73];

        uint64_t v74 = [v11 createSnapshotWithContext:v31];
        int v104 = (void *)v74;
        if (!v74)
        {
          int v79 = XBLogCapture();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
            -[SBApplication(Snapshots) _xbactivity_saveSnapshotForSceneHandle:context:completion:].cold.4(self, (uint64_t)v31, v79);
          }

          char v80 = v110;
          if (v10) {
            v10[2](v10, 4);
          }
          goto LABEL_54;
        }
        char v75 = (void *)v74;
        [v110 interfaceOrientation];
        uint64_t v76 = XBInterfaceOrientationMaskForInterfaceOrientationPair();
        int v100 = [MEMORY[0x1E4F1C9C8] date];
        BOOL v108 = [(SBApplication *)self _snapshotManifest];
        int v77 = [MEMORY[0x1E4FA58C8] predicate];
        [v77 setContentTypeMask:1];
        objc_msgSend(v77, "setReferenceSize:", v61, v63);
        [v77 setInterfaceOrientationMask:v76];
        char v78 = [MEMORY[0x1E4FA58A8] normalizeSnapshotName:v13];
        [v77 setName:v78];

        int v106 = v77;
        [v77 setUserInterfaceStyle:XBGetUIUserInterfaceStyleForSceneSnapshot(v75)];
        uint64_t v102 = XBGetCustomSafeAreaInsetsForSceneSnapshot(v75);
        if (__sb__runningInSpringBoard())
        {
          if (SBFEffectiveDeviceClass() != 2) {
            goto LABEL_53;
          }
        }
        else
        {
          char v81 = [MEMORY[0x1E4F42948] currentDevice];
          uint64_t v82 = [v81 userInterfaceIdiom];

          if (v82 != 1)
          {
LABEL_53:
            BOOL v97 = [v108 snapshotsForGroupID:v12 matchingPredicate:v106];
            BOOL v103 = [v108 createSnapshotForSceneSnapshot:v75 withName:v13];
            objc_msgSend(v103, "setReferenceSize:", v61, v63);
            objc_msgSend(v103, "setContentFrame:", v65, v67, v69, v71);
            char v99 = [(SBApplication *)self _windowSceneFromApplicationSceneHandle:v8];
            int v83 = [v99 switcherController];
            [v83 scaleForDownscaledSnapshotGenerationForSceneHandle:v8];
            double v85 = v84;

            char v95 = [[SBSceneSnapshotDataProvider alloc] initWithSceneSnapshot:v75 scaleFactor:1.0];
            unsigned int v86 = [[SBSceneSnapshotDataProvider alloc] initWithSceneSnapshot:v75 scaleFactor:v85];
            BOOL v91 = [(SBSceneSnapshotDataProvider *)v95 fallbackSnapshotDataProvider];
            char v93 = [(SBSceneSnapshotDataProvider *)v86 fallbackSnapshotDataProvider];
            queue = dispatch_get_global_queue(21, 0);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke;
            block[3] = &unk_1E6AF6328;
            id v114 = v108;
            id v115 = v103;
            id v116 = v91;
            id v117 = v75;
            double v127 = v61;
            double v128 = v63;
            double v129 = v65;
            double v130 = v67;
            double v131 = v69;
            double v132 = v71;
            id v118 = v13;
            id v119 = v93;
            int v120 = v86;
            char v121 = v95;
            int v122 = self;
            id v123 = v97;
            id v124 = v12;
            id v125 = v100;
            char v126 = v10;
            id v90 = v100;
            id v101 = v97;
            int v98 = v95;
            BOOL v96 = v86;
            id v94 = v93;
            id v92 = v91;
            id v87 = v103;
            id v88 = v108;
            dispatch_async(queue, block);

            id v24 = v111;
            char v31 = v112;
            char v80 = v110;
LABEL_54:

LABEL_55:
LABEL_8:

            goto LABEL_11;
          }
        }
        [v106 setCustomSafeAreaInsets:v102];
        goto LABEL_53;
      }
      double v61 = v35;
      double v63 = v36;
      char v31 = v112;
    }
    else
    {
      [v32 frame];
      double v61 = v60;
      double v63 = v62;
    }
    [v31 frame];
    double v65 = v64;
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;
    id v24 = v111;
    goto LABEL_40;
  }
  if (v10) {
    v10[2](v10, 3);
  }
LABEL_11:
}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke(uint64_t a1)
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_2;
  v13[3] = &unk_1E6AF6300;
  id v2 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 152);
  long long v26 = *(_OWORD *)(a1 + 136);
  long long v27 = v3;
  long long v28 = *(_OWORD *)(a1 + 168);
  id v19 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 80);
  id v4 = *(id *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 96);
  id v6 = *(void **)(a1 + 104);
  id v21 = v4;
  uint64_t v22 = v5;
  id v23 = v6;
  id v24 = *(id *)(a1 + 112);
  id v25 = *(id *)(a1 + 128);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_62;
  v9[3] = &unk_1E6AF4E00;
  id v10 = *(id *)(a1 + 112);
  id v7 = *(id *)(a1 + 120);
  uint64_t v8 = *(void *)(a1 + 96);
  id v11 = v7;
  uint64_t v12 = v8;
  [v2 beginSnapshotAccessTransaction:v13 completion:v9];
}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_2(uint64_t a1)
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_3;
  v16[3] = &unk_1E6AF62B0;
  id v17 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  id v19 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 56);
  id v21 = *(id *)(a1 + 64);
  long long v2 = *(_OWORD *)(a1 + 144);
  long long v24 = *(_OWORD *)(a1 + 128);
  long long v25 = v2;
  long long v26 = *(_OWORD *)(a1 + 160);
  id v22 = *(id *)(a1 + 72);
  id v23 = *(id *)(a1 + 80);
  long long v3 = (void *)MEMORY[0x1D948C7A0](v16);
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_4;
  v10[3] = &unk_1E6AF62D8;
  uint64_t v7 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 96);
  uint64_t v8 = *(void **)(a1 + 104);
  id v14 = v3;
  v10[4] = v6;
  id v11 = v8;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 112);
  id v15 = *(id *)(a1 + 120);
  id v9 = v3;
  [v4 generateImageForSnapshot:v5 dataProvider:v7 writeToFile:1 imageGeneratedHandler:v10 imageDataSavedHandler:0];
}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasProtectedContent] && *(void *)(a1 + 40))
  {
    long long v2 = [*(id *)(a1 + 48) createSnapshotForSceneSnapshot:*(void *)(a1 + 56) withName:*(void *)(a1 + 64)];
    long long v3 = v2;
    if (v2)
    {
      uint64_t v5 = v2;
      objc_msgSend(v2, "setReferenceSize:", *(double *)(a1 + 88), *(double *)(a1 + 96));
      objc_msgSend(v5, "setContentFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
      [*(id *)(a1 + 48) generateImageForSnapshot:v5 dataProvider:*(void *)(a1 + 40) writeToFile:1 imageGeneratedHandler:0 imageDataSavedHandler:0];
      if (*(void *)(a1 + 72))
      {
        id v4 = [*(id *)(a1 + 48) createVariantForSnapshot:v5 withIdentifier:@"downscaled"];
        if (v4) {
          [*(id *)(a1 + 48) generateImageForSnapshot:v4 dataProvider:*(void *)(a1 + 72) writeToFile:1 imageGeneratedHandler:0 imageDataSavedHandler:0];
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
    if (!*(void *)(a1 + 80)) {
      return;
    }
    long long v3 = [*(id *)(a1 + 48) createVariantForSnapshot:*(void *)(a1 + 32) withIdentifier:@"downscaled"];
    if (v3)
    {
      uint64_t v5 = v3;
      [*(id *)(a1 + 48) generateImageForSnapshot:v3 dataProvider:*(void *)(a1 + 80) writeToFile:1 imageGeneratedHandler:0 imageDataSavedHandler:0];
LABEL_11:
      long long v3 = v5;
    }
  }
}

uint64_t __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v4 = XBLogFileManifest();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
      *(_DWORD *)int buf = 138543362;
      id v17 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] START liquidating the old, as snapshot generation succeeded", buf, 0xCu);
    }
    uint64_t v6 = XBLogFileManifest();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) bundleIdentifier];
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)int buf = 138543618;
      id v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] deleting old snapshots: %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 48) deleteSnapshots:*(void *)(a1 + 40)];
    id v9 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_61;
    v15[3] = &unk_1E6AF6288;
    v15[4] = *(void *)(a1 + 32);
    [v9 deleteSnapshotsForGroupID:v10 predicateBuilder:v15];
    id v11 = XBLogFileManifest();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 32) bundleIdentifier];
      *(_DWORD *)int buf = 138543362;
      id v17 = v12;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] STOP liquidating the old", buf, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    if (a2) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 4;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v14);
  }
  return result;
}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setName:@"SBSuspendSnapshot"];
  [v3 setContentTypeMask:1];
  id v4 = XBLogFileManifest();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] deleting old suspend snapshots using predicate: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_62(uint64_t a1)
{
  long long v2 = XBLogFileManifest();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_62_cold_1(a1, v2);
  }

  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_63;
  v3[3] = &unk_1E6AF5290;
  v3[4] = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_63(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteSnapshotDidUpdateForSceneIdentifier:*(void *)(a1 + 40)];
}

- (void)_noteSnapshotDidUpdateForSceneIdentifier:(id)a3
{
}

- (void)_noteSnapshotDidUpdateForSceneIdentifiers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        ++self->_appSnapshotSequenceID;
        -[SBApplication __noteSnapshotDidUpdate:forSceneIdentifier:](self, "__noteSnapshotDidUpdate:forSceneIdentifier:");
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)__noteSnapshotDidUpdate:(int64_t)a3 forSceneIdentifier:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1E4F28EB8];
  id v8 = a4;
  long long v9 = [v7 defaultCenter];
  if (a4)
  {
    v18[0] = @"SBApplicationSnapshotChangedSequenceUserInfoKey";
    long long v10 = [NSNumber numberWithInteger:a3];
    v18[1] = @"SBApplicationSnapshotChangedSceneIdentifierUserInfoKey";
    v19[0] = v10;
    v19[1] = v8;
    long long v11 = (void *)MEMORY[0x1E4F1C9E8];
    long long v12 = (void **)v19;
    id v13 = (__CFString **)v18;
    uint64_t v14 = 2;
  }
  else
  {
    id v16 = @"SBApplicationSnapshotChangedSequenceUserInfoKey";
    long long v10 = [NSNumber numberWithInteger:a3];
    id v17 = v10;
    long long v11 = (void *)MEMORY[0x1E4F1C9E8];
    long long v12 = &v17;
    id v13 = &v16;
    uint64_t v14 = 1;
  }
  id v15 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:v14];

  [v9 postNotificationName:@"SBApplicationSnapshotChangedNotification" object:self userInfo:v15];
}

- (CGRect)snapshotFrameForClassicInsideBounds:(CGRect)a3 forOrientation:(int64_t)a4 scaleFactor:(CGSize *)a5 inReferenceSpace:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v14 = 1.0;
  if (![(SBApplication *)self isClassic])
  {
    double v25 = 1.0;
    if (!a5) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  CGFloat v55 = y;
  CGFloat rect = height;
  BOOL v15 = [(SBApplication *)self classicAppScaled];
  id v16 = [MEMORY[0x1E4F62420] mainConfiguration];
  [(SBApplication *)self defaultLaunchingSizeForDisplayConfiguration:v16];
  BSRectWithSize();
  CGFloat v52 = v17;
  CGFloat v58 = v18;
  double v20 = v19;
  double v22 = v21;

  CGFloat v56 = width;
  if ([(SBApplication *)self classicAppPhoneAppRunningOnPad])
  {
    BOOL v23 = [(SBApplication *)self classicAppZoomedInOrRequiresHiDPI];
    double v24 = 1.0;
    double v25 = 1.0;
    if (v23)
    {
      double v24 = SBClassicUtilitiesScaleFactorForPhoneAppZoomedIn(a4, v20, v22);
      double v25 = v24;
    }
  }
  else
  {
    double v24 = 1.0;
    double v25 = 1.0;
    if (v15)
    {
      if ([(SBApplication *)self classicAppFullScreen]) {
        int v26 = ![(SBApplication *)self classicAppWithRoundedCorners];
      }
      else {
        int v26 = 1;
      }
      v59.origin.CGFloat x = x;
      v59.origin.CGFloat y = v55;
      v59.size.CGFloat width = width;
      v59.size.CGFloat height = rect;
      CGFloat v50 = x;
      double v27 = CGRectGetHeight(v59);
      v60.origin.CGFloat x = v52;
      v60.origin.CGFloat y = v58;
      v60.size.CGFloat width = v20;
      v60.size.CGFloat height = v22;
      double v53 = v27 / CGRectGetHeight(v60);
      CGFloat x = v50;
      v61.origin.CGFloat x = v50;
      v61.origin.CGFloat y = v55;
      v61.size.CGFloat width = width;
      v61.size.CGFloat height = rect;
      double v28 = CGRectGetWidth(v61);
      v62.origin.CGFloat x = v52;
      v62.origin.CGFloat y = v58;
      v62.size.CGFloat width = v20;
      v62.size.CGFloat height = v22;
      double v29 = CGRectGetWidth(v62);
      double v25 = v28 / v29;
      if (v26)
      {
        double v24 = v53;
        if (v25 <= v53) {
          double v24 = v28 / v29;
        }
        double v25 = v24;
      }
      else
      {
        double v24 = v53;
      }
    }
  }
  unint64_t v30 = a4 - 3;
  if (v6) {
    double v31 = v20;
  }
  else {
    double v31 = v22;
  }
  if (v6) {
    double v32 = v22;
  }
  else {
    double v32 = v20;
  }
  if (v30 >= 2) {
    CGFloat v33 = v20;
  }
  else {
    CGFloat v33 = v31;
  }
  if (v30 < 2) {
    double v22 = v32;
  }
  double v34 = v24;
  double v54 = v24;
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    v63.origin.CGFloat x = v52;
    v63.origin.CGFloat y = v58;
    v63.size.CGFloat width = v33;
    v63.size.CGFloat height = v22;
    CGFloat v35 = CGRectGetWidth(v63);
    v64.size.CGFloat height = v22;
    CGFloat v36 = round(v25 * v35);
    v64.origin.CGFloat x = v52;
    v64.origin.CGFloat y = v58;
    v64.size.CGFloat width = v36;
    CGFloat v48 = round(v34 * CGRectGetHeight(v64));
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = v55;
    v65.size.CGFloat width = v56;
    v65.size.CGFloat height = rect;
    double v51 = CGRectGetWidth(v65);
    v66.origin.CGFloat x = v52;
    v66.origin.CGFloat y = v58;
    v66.size.CGFloat width = v36;
    v66.size.CGFloat height = v48;
    double v49 = v51 - CGRectGetWidth(v66);
    v67.origin.CGFloat x = x;
    v67.origin.CGFloat y = v55;
    v67.size.CGFloat width = v56;
    v67.size.CGFloat height = rect;
    double v37 = CGRectGetHeight(v67);
    v68.origin.CGFloat x = v52;
    v68.origin.CGFloat y = v58;
    v68.size.CGFloat width = v36;
    v68.size.CGFloat height = v48;
    double v38 = CGRectGetHeight(v68);
    if (v49 > 1.0 || v49 <= 0.0)
    {
      double v39 = v37 - v38;
      if (v39 > 1.0 || v39 <= 0.0)
      {
        if ([(SBApplication *)self classicAppFullScreen]
          && [(SBApplication *)self classicAppWithRoundedCorners])
        {
          v71.origin.CGFloat x = x;
          v71.origin.CGFloat y = v55;
          v71.size.CGFloat width = v56;
          v71.size.CGFloat height = rect;
          CGRectGetWidth(v71);
          v72.origin.CGFloat x = x;
          v72.origin.CGFloat y = v55;
          v72.size.CGFloat width = v56;
          v72.size.CGFloat height = rect;
          CGRectGetHeight(v72);
        }
      }
      else
      {
        v70.origin.CGFloat x = x;
        v70.origin.CGFloat y = v55;
        v70.size.CGFloat width = v56;
        v70.size.CGFloat height = rect;
        CGRectGetHeight(v70);
      }
    }
    else
    {
      v69.origin.CGFloat x = x;
      v69.origin.CGFloat y = v55;
      v69.size.CGFloat width = v56;
      v69.size.CGFloat height = rect;
      CGRectGetWidth(v69);
    }
  }
  UIRectCenteredIntegralRect();
  CGFloat x = v40;
  CGFloat y = v41;
  CGFloat width = v42;
  CGFloat height = v43;
  CGFloat v14 = v54;
  if (a5)
  {
LABEL_38:
    a5->CGFloat width = v25;
    a5->CGFloat height = v14;
  }
LABEL_39:
  double v44 = x;
  double v45 = y;
  double v46 = width;
  double v47 = height;
  result.size.CGFloat height = v47;
  result.size.CGFloat width = v46;
  result.origin.CGFloat y = v45;
  result.origin.CGFloat x = v44;
  return result;
}

- (CGSize)snapshotSizeAdjustedForLegacyStatusBarBasedOnSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 contentFrame:(CGRect *)a5
{
  double height = a3.height;
  double width = a3.width;
  BSRectWithSize();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(SBApplication *)self info];
  int v19 = [v18 isStatusBarLegacy];

  if (!v19) {
    goto LABEL_20;
  }
  if ((unint64_t)(a4 - 1) <= 1)
  {
    double v20 = *MEMORY[0x1E4FA6180];
    if (width != *MEMORY[0x1E4FA6180]
      || (double v21 = *(double *)(MEMORY[0x1E4FA6180] + 8), height != v21 - *MEMORY[0x1E4F43D08]))
    {
      double v20 = *MEMORY[0x1E4F1DB30];
      double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if (width == *MEMORY[0x1E4FA6178])
      {
        double v20 = *MEMORY[0x1E4F1DB30];
        double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        if (height == *(double *)(MEMORY[0x1E4FA6178] + 8) - *MEMORY[0x1E4F43D08])
        {
          double v20 = *MEMORY[0x1E4FA6178];
          double v21 = *(double *)(MEMORY[0x1E4FA6178] + 8);
        }
      }
    }
    if (v20 != *MEMORY[0x1E4F1DB30] || v21 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      if (a4 == 1) {
        double v13 = v13 + *MEMORY[0x1E4F43D08];
      }
      goto LABEL_21;
    }
LABEL_20:
    double v21 = height;
    double v20 = width;
    double width = v15;
    double height = v17;
    goto LABEL_21;
  }
  if ((unint64_t)(a4 - 3) > 1) {
    goto LABEL_20;
  }
  double v21 = *(double *)(MEMORY[0x1E4FA6178] + 8);
  if (height != v21) {
    goto LABEL_20;
  }
  double v20 = *MEMORY[0x1E4FA6178];
  double v23 = *MEMORY[0x1E4F43D08];
  if (width != *MEMORY[0x1E4FA6178] - *MEMORY[0x1E4F43D08]) {
    goto LABEL_20;
  }
  if (a4 != 4) {
    double v23 = -0.0;
  }
  double v11 = v11 + v23;
LABEL_21:
  if (a5)
  {
    a5->origin.CGFloat x = v11;
    a5->origin.CGFloat y = v13;
    a5->size.double width = width;
    a5->size.double height = height;
  }
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (id)_windowSceneFromApplicationSceneHandle:(id)a3
{
  id v3 = (void *)SBApp;
  id v4 = a3;
  uint64_t v5 = [v3 windowSceneManager];
  BOOL v6 = [v4 displayIdentity];

  uint64_t v7 = [v5 windowSceneForDisplayIdentity:v6];

  return v7;
}

- (SBApplication)initWithApplicationInfo:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBApplication.m", 162, @"Invalid parameter not satisfying: %@", @"applicationInfo" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)SBApplication;
  uint64_t v7 = [(SBApplication *)&v15 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_appInfo, a3);
    uint64_t v9 = [v6 bundleIdentifier];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x1E4F628D8] storeForApplication:v8->_bundleIdentifier];
    dataStore = v8->_dataStore;
    v8->_dataStore = (FBSApplicationDataStore *)v11;

    v8->_appSnapshotSequenceID = 0;
    v8->_defaultClassicModeOverride = -1;
    v8->_currentClassicMode = -1;
    [(SBApplication *)v8 _updateRecentlyUpdatedTimer];
    v8->_applicationRestorationCheckState = 0;
    v8->_unint64_t supportedTypes = [(SBApplicationInfo *)v8->_appInfo supportedTypes];
    [(SBApplication *)v8 refreshLaunchImagesInSnapshotManifestIfNeeded];
  }

  return v8;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(SBApplicationWakeScheduler *)self->_legacyVOIPPeriodicWakeScheduler invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SBApplication;
  [(SBApplication *)&v4 dealloc];
}

- (NSString)description
{
  return (NSString *)[(SBApplication *)self descriptionWithMultilinePrefix:0];
}

- (NSString)iconIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)bundleURL
{
  return (NSURL *)[(SBApplicationInfo *)self->_appInfo bundleURL];
}

- (BOOL)isInternalApplication
{
  return [(SBApplicationInfo *)self->_appInfo isInternalApplication];
}

- (NSString)vendorName
{
  return [(SBApplicationInfo *)self->_appInfo vendorName];
}

- (BOOL)isAnyTerminationAssertionHeld
{
  return self->_launchWillBePrevented;
}

- (BOOL)isUninstallSupported
{
  unint64_t v3 = [(SBApplicationInfo *)self->_appInfo uninstallCapability];
  if (!v3 || v3 == 2 && !MGGetBoolAnswer()) {
    return 0;
  }
  objc_super v4 = [(SBApplication *)self bundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.mobileme.fmf1"])
  {
    uint64_t v5 = [MEMORY[0x1E4F74230] sharedConnection];
    BOOL v6 = [v5 effectiveBoolValueForSetting:*MEMORY[0x1E4F74010]] == 1;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)setUninstalled:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_uninstalled)
  {
    objc_sync_exit(obj);
    unint64_t v3 = obj;
  }
  else
  {
    obj->_BOOL uninstalled = 1;
    [(SBApplicationWakeScheduler *)obj->_legacyVOIPPeriodicWakeScheduler invalidate];
    synchronized_snapshotManifest = obj->_synchronized_snapshotManifest;
    obj->_synchronized_snapshotManifest = 0;

    objc_sync_exit(obj);
    objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
    uint64_t v5 = (SBApplication *)objc_claimAutoreleasedReturnValue();
    [(SBApplication *)v5 postNotificationName:*MEMORY[0x1E4FA6738] object:obj];
    unint64_t v3 = v5;
  }
}

- (SBApplicationWakeScheduler)legacyVOIPPeriodicWakeScheduler
{
  if (!self->_legacyVOIPPeriodicWakeScheduler
    && [(SBApplicationInfo *)self->_appInfo supportsLegacyVOIPBackgroundMode])
  {
    unint64_t v3 = +[SBApplicationWakeSchedulerFactory newLegacyVOIPPeriodicWakeSchedulerForApplication:self];
    legacyVOIPPeriodicWakeScheduler = self->_legacyVOIPPeriodicWakeScheduler;
    self->_legacyVOIPPeriodicWakeScheduler = v3;
  }
  uint64_t v5 = self->_legacyVOIPPeriodicWakeScheduler;
  return v5;
}

- (BOOL)wantsAutoLaunchForVOIP
{
  BOOL v3 = [(SBApplicationInfo *)self->_appInfo supportsLegacyVOIPBackgroundMode];
  if (v3)
  {
    objc_super v4 = [(FBSApplicationDataStore *)self->_dataStore safeObjectForKey:@"SBApplicationAutoLaunchForVoIP" ofType:objc_opt_class()];
    char v5 = [v4 BOOLValue];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setWantsAutoLaunchForVOIP:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(SBApplicationInfo *)self->_appInfo supportsLegacyVOIPBackgroundMode])
  {
    char v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      bundleIdentifier = self->_bundleIdentifier;
      int v9 = 138543618;
      double v10 = bundleIdentifier;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Application %{public}@ wants auto-launch for VoIP: %{BOOL}u", (uint8_t *)&v9, 0x12u);
    }

    dataStore = self->_dataStore;
    id v8 = [NSNumber numberWithBool:v3];
    [(FBSApplicationDataStore *)dataStore setObject:v8 forKey:@"SBApplicationAutoLaunchForVoIP"];
  }
}

- (void)setPlayingAudio:(BOOL)a3
{
  if (self->_isPlayingAudio != a3)
  {
    self->_isPlayingAudio = a3;
    -[FBApplicationProcess setNowPlayingWithAudio:](self->_process, "setNowPlayingWithAudio:");
  }
}

- (void)setConnectedToExternalAccessory:(BOOL)a3
{
  if (self->_isConnectedToExternalAccessory != a3)
  {
    self->_isConnectedToExternalAccessorCGFloat y = a3;
    -[FBApplicationProcess setConnectedToExternalAccessory:](self->_process, "setConnectedToExternalAccessory:");
  }
}

- (BOOL)usesEdgeNetwork
{
  return [(SBApplication *)self dataUsage] & 1;
}

- (BOOL)usesWiFiNetwork
{
  return ([(SBApplication *)self dataUsage] >> 1) & 1;
}

- (BOOL)suppressesControlCenter
{
  BOOL v3 = [MEMORY[0x1E4F74230] sharedConnection];
  if ([v3 isControlCenterAllowed])
  {
    objc_super v4 = [MEMORY[0x1E4F74230] sharedConnection];
    if ([v4 isControlCenterAllowedInApps]) {
      BOOL v5 = [(SBApplicationInfo *)self->_appInfo disallowsControlCenter];
    }
    else {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)suppressesCoverSheetGesture
{
  return [(SBApplicationInfo *)self->_appInfo disallowsNotificationCenter];
}

- (BOOL)supportsMultitaskingShelf
{
  if ([(SBApplication *)self isAppClip])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_super v4 = [(SBApplication *)self info];
    if ([v4 supportsMultiwindow])
    {
      BOOL v5 = [(SBApplication *)self bundleIdentifier];
      int v3 = [v5 isEqualToString:@"com.apple.InCallService"] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (SBDisplayItemLayoutAttributes)lastWindowLayoutAttributes
{
  int v3 = (SBDisplayItemLayoutAttributes *)self->_cachedLastWindowLayoutAttributesOrNSNull;
  if (!v3)
  {
    objc_super v4 = [(FBSApplicationDataStore *)self->_dataStore safeObjectForKey:@"SBApplicationLastWindowSizeKey" ofType:objc_opt_class()];
    if (v4
      && (BOOL v5 = [[SBDisplayItemLayoutAttributes alloc] initWithPlistRepresentation:v4]) != 0)
    {
      BOOL v6 = v5;
      int v3 = v6;
    }
    else
    {
      BOOL v6 = [MEMORY[0x1E4F1CA98] null];
      int v3 = 0;
    }
    id cachedLastWindowLayoutAttributesOrNSNull = self->_cachedLastWindowLayoutAttributesOrNSNull;
    self->_id cachedLastWindowLayoutAttributesOrNSNull = v6;
  }
  id v8 = [MEMORY[0x1E4F1CA98] null];
  if (BSEqualObjects()) {
    int v9 = 0;
  }
  else {
    int v9 = v3;
  }
  double v10 = v9;

  return v10;
}

- (void)setLastWindowLayoutAttributes:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = [v9 plistRepresentation];
    id cachedLastWindowLayoutAttributesOrNSNull = SBSafeCast(v5, v6);

    if (cachedLastWindowLayoutAttributesOrNSNull) {
      [(FBSApplicationDataStore *)self->_dataStore setObject:cachedLastWindowLayoutAttributesOrNSNull forKey:@"SBApplicationLastWindowSizeKey"];
    }
    objc_storeStrong(&self->_cachedLastWindowLayoutAttributesOrNSNull, a3);
  }
  else
  {
    [(FBSApplicationDataStore *)self->_dataStore removeObjectForKey:@"SBApplicationLastWindowSizeKey"];
    id v8 = [MEMORY[0x1E4F1CA98] null];
    id cachedLastWindowLayoutAttributesOrNSNull = self->_cachedLastWindowLayoutAttributesOrNSNull;
    self->_id cachedLastWindowLayoutAttributesOrNSNull = v8;
  }
}

- (void)setHasDisplayedLaunchAlert:(BOOL)a3 forType:(unint64_t)a4
{
  unint64_t displayedLaunchAlerts = self->_displayedLaunchAlerts;
  unint64_t v5 = displayedLaunchAlerts & ~a4;
  unint64_t v6 = displayedLaunchAlerts | a4;
  if (!a3) {
    unint64_t v6 = v5;
  }
  self->_unint64_t displayedLaunchAlerts = v6;
}

- (void)takeBackgroundActivityAttribution:(id)a3
{
  id v14 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[SBApplication takeBackgroundActivityAttribution:]"];
    [v12 handleFailureInFunction:v13 file:@"SBApplication.m" lineNumber:504 description:@"this call must be made on the main thread"];
  }
  id v4 = v14;
  if (!self->_backgroundActivityAttributions)
  {
    unint64_t v5 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:1];
    backgroundActivityAttributions = self->_backgroundActivityAttributions;
    self->_backgroundActivityAttributions = v5;

    id v4 = v14;
  }
  if (!self->_backgroundActivityAttributionsByIdentifier)
  {
    uint64_t v7 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:1];
    backgroundActivityAttributionsByIdentifier = self->_backgroundActivityAttributionsByIdentifier;
    self->_backgroundActivityAttributionsByIdentifier = v7;

    id v4 = v14;
  }
  if (![(NSHashTable *)self->_backgroundActivityAttributions containsObject:v4])
  {
    [(NSHashTable *)self->_backgroundActivityAttributions addObject:v14];
    id v9 = [v14 backgroundActivityIdentifier];
    uint64_t v10 = *MEMORY[0x1E4FA95C0];
    if ([v9 isEqualToString:*MEMORY[0x1E4FA95C0]])
    {
      __int16 v11 = [(NSMapTable *)self->_backgroundActivityAttributionsByIdentifier objectForKey:v10];
      if (![v11 count]) {
        [(id)SBApp addNowLocatingApp:self];
      }
    }
    if ((STUIBackgroundActivityIdentiferRepresentsStyleOverride() & 1) == 0) {
      [(id)SBApp addApp:self forBackgroundActivityWithIdentifier:v9];
    }
    SBAddBackgroundActivityAttributionByIdentifier(v14, self->_backgroundActivityAttributionsByIdentifier);
  }
}

- (void)releaseBackgroundActivityAttribution:(id)a3
{
  id v12 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v11 = [NSString stringWithUTF8String:"-[SBApplication releaseBackgroundActivityAttribution:]"];
    [v10 handleFailureInFunction:v11 file:@"SBApplication.m" lineNumber:533 description:@"this call must be made on the main thread"];
  }
  backgroundActivityAttributions = self->_backgroundActivityAttributions;
  if (backgroundActivityAttributions)
  {
    if ([(NSHashTable *)backgroundActivityAttributions containsObject:v12])
    {
      [(NSHashTable *)self->_backgroundActivityAttributions removeObject:v12];
      SBRemoveBackgroundActivityAttributionByIdentifier(v12, self->_backgroundActivityAttributionsByIdentifier);
      unint64_t v5 = [v12 backgroundActivityIdentifier];
      uint64_t v6 = *MEMORY[0x1E4FA95C0];
      if ([v5 isEqualToString:*MEMORY[0x1E4FA95C0]])
      {
        uint64_t v7 = [(NSMapTable *)self->_backgroundActivityAttributionsByIdentifier objectForKey:v6];
        if (![v7 count]) {
          [(id)SBApp removeNowLocatingApp:self];
        }
      }
      if ((STUIBackgroundActivityIdentiferRepresentsStyleOverride() & 1) == 0) {
        [(id)SBApp removeApp:self forBackgroundActivityWithIdentifier:v5];
      }
    }
    if (![(NSHashTable *)self->_backgroundActivityAttributions count])
    {
      id v8 = self->_backgroundActivityAttributions;
      self->_backgroundActivityAttributions = 0;
    }
    if (![(NSMapTable *)self->_backgroundActivityAttributionsByIdentifier count])
    {
      backgroundActivityAttributionsByIdentifier = self->_backgroundActivityAttributionsByIdentifier;
      self->_backgroundActivityAttributionsByIdentifier = 0;
    }
  }
}

- (BOOL)shouldReceiveSourceApplicationContextFromOriginatingApplication:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = self->_appInfo;
    if ([(SBApplicationInfo *)v5 isYukonLinked])
    {
      uint64_t v6 = SBWorkspaceApplicationForIdentifier(v4);
      uint64_t v7 = [v6 info];

      id v8 = [v7 teamIdentifier];
      id v9 = [(SBApplicationInfo *)v5 teamIdentifier];
      if ([(SBApplicationInfo *)v5 isSystemApplication]
        || [(SBApplicationInfo *)v5 alwaysReceivesOpenURLSource])
      {
        char v10 = 1;
      }
      else
      {
        char v10 = [v8 isEqualToString:v9];
      }
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)markNewlyInstalled
{
}

- (void)markRecentlyUpdated
{
}

- (void)clearNewlyInstalledAndRecentlyUpdatedStatus
{
  [(SBApplication *)self _setNewlyInstalled:0];
  [(SBApplication *)self _setRecentlyUpdated:0];
}

- (NSDate)nextWakeDate
{
  long long v2 = [(SBApplication *)self legacyVOIPPeriodicWakeScheduler];
  int v3 = [v2 scheduledDate];

  return (NSDate *)v3;
}

- (void)setNextWakeDate:(id)a3
{
  id v7 = a3;
  id v4 = [(SBApplication *)self info];
  int v5 = [v4 supportsLegacyVOIPBackgroundMode];

  if (v5)
  {
    uint64_t v6 = [(SBApplication *)self legacyVOIPPeriodicWakeScheduler];
    [v6 scheduleWakeForDate:v7];
  }
}

- (BOOL)usesBackgroundNetwork
{
  return ([(SBApplication *)self dataUsage] >> 3) & 1;
}

- (void)setUsesBackgroundNetwork:(BOOL)a3
{
  if (a3)
  {
    __int16 v4 = 1;
  }
  else
  {
    if (!*((_WORD *)self + 43)) {
      goto LABEL_6;
    }
    __int16 v4 = -1;
  }
  *((_WORD *)self + 43) += v4;
LABEL_6:
  int v5 = [(SBApplication *)self dataUsage];
  if ((v5 & 8) != (*((_WORD *)self + 43) != 0))
  {
    uint64_t v6 = v5 & 0xFFFFFFF7 | (8 * (*((_WORD *)self + 43) != 0));
    [(SBApplication *)self _setDataUsage:v6];
  }
}

- (id)_sceneIdentifierForStoredPersistenceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__2;
  double v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  int v5 = [(SBApplication *)self _dataStore];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SBApplication__sceneIdentifierForStoredPersistenceIdentifier___block_invoke;
  v9[3] = &unk_1E6AF7860;
  id v6 = v4;
  id v10 = v6;
  __int16 v11 = &v12;
  [v5 enumerateSceneStoresUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __64__SBApplication__sceneIdentifierForStoredPersistenceIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v8 = [a3 objectForKey:@"persistenceIdentifier"];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_clearSceneTitles
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SBApplication__clearSceneTitles__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_sync(MEMORY[0x1E4F14428], block);
}

void __34__SBApplication__clearSceneTitles__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = [*(id *)(a1 + 32) _dataStore];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__2;
  double v16 = __Block_byref_object_dispose__2;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__SBApplication__clearSceneTitles__block_invoke_2;
  v11[3] = &unk_1E6AF7888;
  v11[4] = &v12;
  [v1 enumerateSceneStoresUsingBlock:v11];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = (id)v13[5];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = objc_msgSend(v1, "sceneStoreForIdentifier:creatingIfNecessary:", *(void *)(*((void *)&v7 + 1) + 8 * v5), 1, (void)v7);
        [v6 removeObjectForKey:@"canvasTitle"];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v18 count:16];
    }
    while (v3);
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __34__SBApplication__clearSceneTitles__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

- (void)_setLaunchPrevented:(BOOL)a3
{
  self->_launchWillBePrevented = a3;
  [(SBApplication *)self _noteIconDataSourceDidChange];
}

- (int)_applicationRestorationCheckState
{
  return self->_applicationRestorationCheckState;
}

- (void)_setApplicationRestorationCheckState:(int)a3
{
  self->_applicationRestorationCheckState = a3;
}

- (void)setInfo:(id)a3
{
  id v6 = (SBApplicationInfo *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_appInfo == v6)
  {
    objc_sync_exit(v5);
  }
  else
  {
    objc_storeStrong((id *)&v5->_appInfo, a3);
    objc_sync_exit(v5);

    [(SBApplication *)v5 _noteIconDataSourceDidChange];
  }
}

- (void)_didExitWithContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SBLogWorkspace();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    long long v7 = [(SBApplication *)self bundleIdentifier];
    *(_DWORD *)int buf = 136315394;
    double v20 = "-[SBApplication _didExitWithContext:]";
    __int16 v21 = 2114;
    double v22 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "%s %{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_lastExitContext, a3);
  long long v8 = [MEMORY[0x1E4F28F80] processInfo];
  long long v9 = [v8 environment];
  long long v10 = [v9 objectForKey:@"SB_DISABLE_FAILED_LAUNCH_COUNTER"];

  if (([v5 exitReason] & 1) == 0 && !v10)
  {
    unint64_t v11 = self->_failedLaunchCount + 1;
    self->_failedLaunchCount = v11;
    dispatch_time_t v12 = dispatch_time(0, 20000000000);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __37__SBApplication__didExitWithContext___block_invoke;
    v18[3] = &unk_1E6AF4A70;
    v18[4] = self;
    v18[5] = v11;
    dispatch_after(v12, MEMORY[0x1E4F14428], v18);
  }
  self->_applicationRestorationCheckState = 0;
  self->_int showsProgressCount = 0;
  self->_currentClassicMode = -1;
  uint64_t v13 = self;
  objc_sync_enter(v13);
  initializationContext = v13->_initializationContext;
  v13->_initializationContext = 0;

  objc_sync_exit(v13);
  objc_super v15 = [(id)SBApp menuButtonInterceptApp];
  BOOL v16 = [(SBApplication *)v13 isSameExecutableAsApplication:v15];

  if (v16) {
    [(id)SBApp setMenuButtonInterceptApp:0 forever:0];
  }
  [(id)SBApp setAppRegisteredForVolumeEvents:v13 isActive:0];
  [(id)SBApp setAppRegisteredForLockButtonEvents:v13 isActive:0];
  *((_WORD *)v13 + 43) = 0;
  [(SBApplication *)v13 setUsesBackgroundNetwork:0];
  [(SBApplication *)v13 purgeCaches];
  [(SBApplication *)v13 _invalidateBackgroundActivityAttributions];
  [(SBApplication *)v13 _updateProcess:0 withState:0];
  [(SBApplication *)v13 setPlayingAudio:0];
  [(SBApplication *)v13 setNowRecordingApplication:0];
  [(SBApplication *)v13 setConnectedToExternalAccessory:0];
  if (v13->_launchWillBePrevented) {
    [(SBApplication *)v13 _noteIconDataSourceDidChange];
  }
  id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 postNotificationName:@"SBApplicationDidExitNotification" object:v13];
}

uint64_t __37__SBApplication__didExitWithContext___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(result + 40) == *(void *)(v1 + 152)) {
    *(void *)(v1 + 152) = 0;
  }
  return result;
}

+ (id)_appStateKeysToPrefetch
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SBApplicationAutoLaunchForVoIP";
  v4[1] = @"SBApplicationIsNewlyInstalled";
  v4[2] = @"SBApplicationRecentlyUpdated";
  v4[3] = @"SBApplicationRecentlyUpdatedTimerStartDate";
  void v4[4] = @"SBApplicationBadgeKey";
  void v4[5] = @"_SBScenes";
  v4[6] = *MEMORY[0x1E4FA5900];
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  return v2;
}

- (void)purgeCaches
{
  obj = self;
  objc_sync_enter(obj);
  [(XBApplicationSnapshotManifest *)obj->_synchronized_snapshotManifest purgeSnapshotsWithProtectedContent];
  objc_sync_exit(obj);
}

- (void)_updateRecentlyUpdatedTimer
{
  BOOL v3 = [(SBApplication *)self _isRecentlyUpdated];
  uint64_t v4 = [(FBSApplicationDataStore *)self->_dataStore safeObjectForKey:@"SBApplicationRecentlyUpdatedTimerStartDate" ofType:objc_opt_class()];
  id v13 = v4;
  if (v3)
  {
    if (v4)
    {
      [v4 timeIntervalSinceNow];
      if (v5 <= -172800.0) {
        [(SBApplication *)self _setRecentlyUpdated:0];
      }
    }
    else
    {
      long long v7 = +[SBLockScreenManager sharedInstanceIfExists];
      long long v8 = v7;
      if (v7 && ([v7 isUILocked] & 1) == 0)
      {
        dataStore = self->_dataStore;
        long long v10 = [MEMORY[0x1E4F1C9C8] date];
        [(FBSApplicationDataStore *)dataStore setObject:v10 forKey:@"SBApplicationRecentlyUpdatedTimerStartDate"];
      }
      unint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v12 = *MEMORY[0x1E4FA7A38];
      [v11 removeObserver:self name:*MEMORY[0x1E4FA7A38] object:0];
      [v11 addObserver:self selector:sel__lockStateDidChange_ name:v12 object:0];
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x1E4FA7A38] object:0];

    [(FBSApplicationDataStore *)self->_dataStore removeObjectForKey:@"SBApplicationRecentlyUpdatedTimerStartDate"];
  }
}

- (void)_lockStateDidChange:(id)a3
{
  id v6 = a3;
  if ([(SBApplication *)self _isRecentlyUpdated])
  {
    [(SBApplication *)self _updateRecentlyUpdatedTimer];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v5 = [v6 name];
    [v4 removeObserver:self name:v5 object:0];
  }
}

- (void)_invalidateBackgroundActivityAttributions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[SBApplication _invalidateBackgroundActivityAttributions]"];
    [v13 handleFailureInFunction:v14 file:@"SBApplication.m" lineNumber:1110 description:@"this call must be made on the main thread"];
  }
  backgroundActivityAttributions = self->_backgroundActivityAttributions;
  if (backgroundActivityAttributions)
  {
    uint64_t v4 = [(NSHashTable *)backgroundActivityAttributions allObjects];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__SBApplication__invalidateBackgroundActivityAttributions__block_invoke;
    void v19[3] = &unk_1E6AF78D0;
    v19[4] = self;
    double v5 = objc_msgSend(v4, "bs_filter:", v19);

    id v6 = +[SBBackgroundActivityAttributionManager sharedInstance];
    long long v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    [v6 invalidateBackgroundActivityAttributions:v7];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          -[SBApplication releaseBackgroundActivityAttribution:](self, "releaseBackgroundActivityAttribution:", *(void *)(*((void *)&v15 + 1) + 8 * v12++), (void)v15);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

uint64_t __58__SBApplication__invalidateBackgroundActivityAttributions__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 activityAttribution];
  uint64_t v4 = [v3 attributedEntity];
  double v5 = [v4 executableIdentity];

  if ([v5 hasAuditToken])
  {
    uint64_t v6 = 1;
  }
  else
  {
    long long v7 = [v5 bundleIdentifier];
    id v8 = [*(id *)(a1 + 32) bundleIdentifier];
    char v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v10 = [v5 bundlePath];
      uint64_t v11 = [*(id *)(a1 + 32) bundleURL];
      uint64_t v12 = [v11 path];
      int v13 = [v10 isEqualToString:v12];

      uint64_t v6 = v13 ^ 1u;
    }
  }

  return v6;
}

- (void)launchFromIcon:(id)a3 location:(id)a4 context:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  uint64_t v14 = [v13 activationSettings];
  long long v15 = [v13 actions];

  if (v14) {
    long long v16 = v14;
  }
  else {
    long long v16 = objc_alloc_init(SBActivationSettings);
  }
  long long v17 = v16;
  long long v18 = SBLogIcon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = [(SBApplication *)self bundleIdentifier];
    int v21 = 138412802;
    double v22 = v19;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "Launching application %@ from icon %@, location: %@", (uint8_t *)&v21, 0x20u);
  }
  double v20 = +[SBUIController sharedInstance];
  [v20 activateApplication:self fromIcon:v8 location:v9 activationSettings:v17 actions:v15];
}

- (void)uninstall
{
  id v3 = +[SBApplicationController sharedInstance];
  [v3 uninstallApplication:self];
}

- (id)icon:(id)a3 displayNameForObscuredDisabledLaunchForLocation:(id)a4
{
  double v5 = [(SBApplication *)self displayName];
  if ([(SBApplication *)self isCacheCleaningTerminationAssertionHeld])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"CLEANING_ICON_LABEL" value:&stru_1F3084718 table:@"SpringBoard"];

    double v5 = (void *)v7;
  }
  return v5;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  uint64_t v4 = [(SBApplicationInfo *)self->_appInfo bundleIdentifier];
  double v5 = SBHGetApplicationIconImage();

  return v5;
}

- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4
{
  uint64_t v4 = [(SBApplicationInfo *)self->_appInfo bundleIdentifier];
  double v5 = SBHGetApplicationIconImage();

  return v5;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  uint64_t v7 = a4;
  SBHIconServicesOptionsForImageOptions();
  id v8 = [(SBApplicationInfo *)self->_appInfo bundleIdentifier];
  id v9 = SBHGetApplicationIconImageWithTraitCollection();

  return v9;
}

- (BOOL)icon:(id)a3 canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(SBApplicationInfo *)self->_appInfo bundleIdentifier];
  v10[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  char v8 = SBHHasCachedIconImagesForApplications();

  return v8;
}

- (void)icon:(id)a3 prepareToMakeLayerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(SBApplicationInfo *)self->_appInfo bundleIdentifier];
  v8[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  SBHCacheIconImagesForApplications();
}

- (id)icon:(id)a3 layerWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  appInfo = self->_appInfo;
  uint64_t v7 = a4;
  char v8 = [(SBApplicationInfo *)appInfo bundleIdentifier];
  SBHIconServicesOptionsForImageOptions();
  id v9 = SBHGetApplicationIconLayerWithTraitCollection();

  return v9;
}

- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3
{
  return 1;
}

- (id)supportedGridSizeClassesForIcon:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FA6288], "gridSizeClassSetForDefaultGridSizeClass", a3);
}

- (BOOL)iconCompleteUninstall:(id)a3
{
  uint64_t v4 = +[SBApplicationController sharedInstance];
  [v4 uninstallApplication:self];

  return 1;
}

- (id)folderTitleOptionsForIcon:(id)a3
{
  id v3 = [(SBApplication *)self info];
  uint64_t v4 = [v3 folderNames];

  return v4;
}

- (id)folderFallbackTitleForIcon:(id)a3
{
  id v3 = [(SBApplication *)self info];
  uint64_t v4 = [v3 fallbackFolderName];
  if (!v4)
  {
    double v5 = [v3 folderNames];
    uint64_t v4 = [v5 firstObject];
  }
  return v4;
}

- (int64_t)dataOwnershipRoleAsDragDropTargetForIcon:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", a3);
  double v5 = [(SBApplication *)self bundleIdentifier];
  unint64_t v6 = [v4 dragDropTargetManagementStateForBundleID:v5];

  if (v6 > 3) {
    return 0;
  }
  else {
    return qword_1D8FD06D0[v6];
  }
}

- (id)iTunesCategoriesOrderedByRelevancyForIcon:(id)a3
{
  id v3 = [(SBApplication *)self info];
  uint64_t v4 = [v3 iTunesCategoriesOrderedByRelevancy];

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBApplication *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  double v5 = [(SBApplication *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SBApplication_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __55__SBApplication_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) processState];
  id v2 = (id)[v1 appendObject:v3 withName:@"processState" skipIfNil:1];
}

uint64_t __45__SBApplication__noteIconDataSourceDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 applicationBundleIdentifier];
  id v4 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (FBProcessExitContext)lastExitContext
{
  return self->_lastExitContext;
}

- (unint64_t)failedLaunchCount
{
  return self->_failedLaunchCount;
}

- (BOOL)isRestoringIcon
{
  return self->_isRestoringApplicationFromHiding;
}

- (void)setRestoringIcon:(BOOL)a3
{
  self->_isRestoringApplicationFromHiding = a3;
}

- (BOOL)hasShownDataPlanAlertSinceLock
{
  return self->_hasShownDataPlanAlertSinceLock;
}

- (void)setHasShownDataPlanAlertSinceLock:(BOOL)a3
{
  self->_hasShownDataPlanAlertSinceLock = a3;
}

- (unint64_t)failedAutoLaunchCountForVOIP
{
  return self->_failedAutoLaunchCountForVOIP;
}

- (void)setFailedAutoLaunchCountForVOIP:(unint64_t)a3
{
  self->_failedAutoLaunchCountForVOIP = a3;
}

- (BOOL)isPlayingAudio
{
  return self->_isPlayingAudio;
}

- (BOOL)isNowRecordingApplication
{
  return self->_isNowRecordingApplication;
}

- (BOOL)isConnectedToExternalAccessory
{
  return self->_isConnectedToExternalAccessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProtectionAssistant, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_legacyVOIPPeriodicWakeScheduler, 0);
  objc_storeStrong((id *)&self->_backgroundActivityAttributionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundActivityAttributions, 0);
  objc_storeStrong(&self->_cachedLastWindowLayoutAttributesOrNSNull, 0);
  objc_storeStrong((id *)&self->_initializationContext, 0);
  objc_storeStrong((id *)&self->_lastExitContext, 0);
  objc_storeStrong((id *)&self->_threadUnsafe_processState, 0);
  objc_storeStrong((id *)&self->_synchronized_snapshotManifest, 0);
  objc_storeStrong((id *)&self->_lazy_defaults, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

uint64_t __65__SBApplication_SnapshotSorting__snapshotSortDescriptorForNames___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _SBADIStringCompareWithSet(a2, a3, *(void **)(a1 + 32));
}

uint64_t __66__SBApplication_SnapshotSorting__snapshotSortDescriptorForScheme___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _SBADIStringCompare(a2, a3, *(void *)(a1 + 32));
}

+ (id)snapshotSortDescriptorForLaunchInterfaceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FA58D0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __85__SBApplication_SnapshotSorting__snapshotSortDescriptorForLaunchInterfaceIdentifier___block_invoke;
  v8[3] = &unk_1E6B00B30;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 sortDescriptorWithKey:3 ascending:1 comparator:v8];

  return v6;
}

uint64_t __85__SBApplication_SnapshotSorting__snapshotSortDescriptorForLaunchInterfaceIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _SBADIStringCompare(a2, a3, *(void *)(a1 + 32));
}

uint64_t __70__SBApplication_SnapshotSorting__snapshotSortDescriptorForImageScale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 doubleValue];
  [v5 doubleValue];
  int v6 = BSFloatEqualToFloat();
  int v7 = BSFloatEqualToFloat();
  if ((v6 & 1) != 0 || v7)
  {
    uint64_t v10 = -1;
    if (!v6) {
      uint64_t v10 = 1;
    }
    if (v6 != v7) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    if (BSFloatGreaterThanFloat() && BSFloatGreaterThanFloat())
    {
      char v8 = v4;
      id v9 = v5;
    }
    else
    {
      char v8 = v5;
      id v9 = v4;
    }
    uint64_t v11 = [v8 compare:v9];
  }

  return v11;
}

uint64_t __73__SBApplication_SnapshotSorting__snapshotSortDescriptorForReferenceSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 CGSizeValue];
  double v7 = v6;
  double v9 = v8;
  [v5 CGSizeValue];
  double v11 = v10;
  double v13 = v12;

  v16.n128_u64[0] = *(void *)(a1 + 32);
  double v14 = *(double *)(a1 + 40);
  v15.n128_f64[0] = vabdd_f64(v16.n128_f64[0], v7) + vabdd_f64(v14, v9);
  v16.n128_f64[0] = vabdd_f64(v16.n128_f64[0], v11) + vabdd_f64(v14, v13);
  return MEMORY[0x1F410C1A0](v15, v16);
}

uint64_t __82__SBApplication_SnapshotSorting__snapshotSortDescriptorPreferringProtectedContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 BOOLValue];
  int v6 = [v4 BOOLValue];

  uint64_t v7 = -1;
  if (!v5) {
    uint64_t v7 = 1;
  }
  if (v5 != v6) {
    return v7;
  }
  else {
    return 0;
  }
}

uint64_t __78__SBApplication_SnapshotSorting__snapshotSortDescriptorForStatusBarStateMask___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int v4 = XBStatusBarStateMaskMatchesSettings();
  int v5 = XBStatusBarStateMaskMatchesSettings();

  uint64_t v6 = -1;
  if (!v4) {
    uint64_t v6 = 1;
  }
  if (((v4 | v5) & (v4 ^ v5)) != 0) {
    return v6;
  }
  else {
    return 0;
  }
}

uint64_t __74__SBApplication_SnapshotSorting__snapshotSortDescriptorForContentTypeMask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __77__SBApplication_SnapshotSorting__snapshotSortDescriptorForRequiredOSVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    double v8 = *(void **)(a1 + 32);
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v9 = [v8 compare:v5 options:64];
    uint64_t v10 = [*(id *)(a1 + 32) compare:v7 options:64];
    if ((v9 == -1) != (v10 == -1))
    {
      if (v10 == -1) {
        uint64_t v11 = -1;
      }
      else {
        uint64_t v11 = 1;
      }
      goto LABEL_16;
    }
    if ((v10 & v9) == 0xFFFFFFFFFFFFFFFFLL)
    {
      double v13 = v5;
      id v14 = v7;
    }
    else
    {
LABEL_14:
      double v13 = v7;
      id v14 = v5;
    }
    uint64_t v11 = [v13 compare:v14 options:64];
    goto LABEL_16;
  }
  uint64_t v12 = -1;
  if (v5) {
    uint64_t v12 = 1;
  }
  if ((v5 == 0) != (v6 == 0)) {
    uint64_t v11 = v12;
  }
  else {
    uint64_t v11 = 0;
  }
LABEL_16:

  return v11;
}

uint64_t __71__SBApplication_SnapshotSorting__snapshotSortDescriptorForCreationDate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __80__SBApplication_SnapshotSorting__snapshotSortDescriptorForUIUserInterfaceStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = [v5 integerValue];

  uint64_t v8 = *(void *)(a1 + 32);
  if (!v8) {
    return 0;
  }
  BOOL v9 = v6 == v8 || v7 == v8;
  if (!v9) {
    return 0;
  }
  BOOL v9 = v6 == v8;
  int v10 = (v6 == v8) ^ (v7 == v8);
  uint64_t v11 = -1;
  if (!v9) {
    uint64_t v11 = 1;
  }
  if (v10) {
    return v11;
  }
  else {
    return 0;
  }
}

+ (id)snapshotSortDescriptorForCustomSafeAreaInsets:(id)a3
{
  id v3 = a3;
  int v4 = (void *)MEMORY[0x1E4FA58D0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __80__SBApplication_SnapshotSorting__snapshotSortDescriptorForCustomSafeAreaInsets___block_invoke;
  v8[3] = &unk_1E6B00BF8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 sortDescriptorWithKey:13 ascending:1 comparator:v8];

  return v6;
}

uint64_t __80__SBApplication_SnapshotSorting__snapshotSortDescriptorForCustomSafeAreaInsets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  if (v10
    && ((int v11 = [v8 isEqual:v10], v12 = objc_msgSend(v9, "isEqual:", v10), (v11 & 1) != 0) || v12))
  {
    uint64_t v14 = -1;
    if (!v11) {
      uint64_t v14 = 1;
    }
    if (v11 != v12) {
      uint64_t v13 = v14;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void __62__SBApplication_ChamoisCapabilities__alwaysMaximizedInChamois__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.purplebuddy";
  v2[1] = @"com.apple.PrintKit.Print-Center";
  v2[2] = @"com.apple.sidecar";
  v2[3] = @"com.apple.ContinuityCaptureShieldUI";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  uint64_t v1 = (void *)alwaysMaximizedInChamois_sAlwaysMaximizedBundleIDs;
  alwaysMaximizedInChamois_sAlwaysMaximizedBundleIDs = v0;
}

void __77__SBApplication_ChamoisCapabilities__restrictedToTheEmbeddedDisplayInChamois__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.purplebuddy";
  v2[1] = @"com.apple.PrintKit.Print-Center";
  v2[2] = @"com.apple.sidecar";
  v2[3] = @"com.apple.ContinuityCaptureShieldUI";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  uint64_t v1 = (void *)restrictedToTheEmbeddedDisplayInChamois_sRestrictedToEmbeddedBundleIDs;
  restrictedToTheEmbeddedDisplayInChamois_sRestrictedToEmbeddedBundleIDs = v0;
}

- (id)mostRecentSceneSnapshotsForSceneHandle:(id)a3 scale:(double)a4 launchingOrientation:(int64_t)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(SBApplication *)self _snapshotManifest];
  id v9 = [v7 sceneIdentifier];

  id v10 = [MEMORY[0x1E4FA58C8] predicate];
  [v10 setContentTypeMask:1];
  [v10 setImageScale:a4];
  [v10 setInterfaceOrientationMask:XBInterfaceOrientationMaskForInterfaceOrientationPair()];
  int v11 = [MEMORY[0x1E4FA58B0] fetchRequest];
  [v11 setPredicate:v10];
  int v12 = [(id)objc_opt_class() snapshotSortDescriptorForCreationDate];
  v17[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v11 setSortDescriptors:v13];

  uint64_t v14 = [v8 snapshotsForGroupID:v9 fetchRequest:v11];
  __n128 v15 = objc_msgSend(v14, "bs_filter:", &__block_literal_global_287);

  return v15;
}

uint64_t __97__SBApplication_DefaultImage__mostRecentSceneSnapshotsForSceneHandle_scale_launchingOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isExpired])
  {
    uint64_t v3 = 0;
  }
  else if ([v2 hasCachedImage])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 fileExists];
  }

  return v3;
}

- (id)imageForSnapshot:(id)a3 interfaceOrientation:(int64_t)a4
{
  return (id)[a3 imageForInterfaceOrientation:a4];
}

- (id)cachedImageForSnapshot:(id)a3 interfaceOrientation:(int64_t)a4
{
  return (id)[a3 cachedImageForInterfaceOrientation:a4];
}

- (id)_defaultLaunchImageBaseName
{
  id v2 = (void *)MEMORY[0x1E4FA58A8];
  uint64_t v3 = [(SBApplication *)self info];
  int v4 = [v3 launchImageFile];
  id v5 = [v2 normalizeSnapshotName:v4];
  id v6 = v5;
  if (!v5) {
    id v5 = @"Default";
  }
  id v7 = v5;

  return v7;
}

- (void)refreshLaunchImagesInSnapshotManifestIfNeeded
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBApplication *)self info];
  char v4 = [v3 usesSplashBoard];

  if ((v4 & 1) == 0)
  {
    id v5 = [(SBApplication *)self _dataStore];
    uint64_t v6 = [(SBApplication *)self _snapshotManifest];
    uint64_t v34 = *MEMORY[0x1E4FA7DE0];
    id v7 = [v5 safeObjectForKey:*MEMORY[0x1E4FA7DE0] ofType:objc_opt_class()];
    if (!v7)
    {
      [v5 removeObjectForKey:@"SBLastBundleSequenceNumberForLaunchImageIngestion"];
      [v5 removeObjectForKey:@"SBLastIngestorVersionForLaunchImageIngestion"];
    }
    uint64_t v33 = *MEMORY[0x1E4FA7DE8];
    uint64_t v8 = objc_msgSend(v7, "bs_safeStringForKey:");
    if (v8) {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    }
    else {
      uint64_t v9 = 0;
    }
    CGFloat v36 = (void *)v8;
    id v10 = [(SBApplication *)self info];
    uint64_t v11 = [v10 cacheGUID];

    CGFloat v35 = (void *)v9;
    if (v9) {
      int v12 = BSEqualObjects() ^ 1;
    }
    else {
      int v12 = 1;
    }
    uint64_t v32 = *MEMORY[0x1E4FA7DF8];
    uint64_t v13 = objc_msgSend(v7, "bs_safeStringForKey:");
    uint64_t v14 = [(SBApplication *)self info];
    __n128 v15 = [v14 installInstanceID];

    double v37 = (void *)v11;
    if (v13) {
      int v16 = [v15 isEqual:v13] ^ 1;
    }
    else {
      int v16 = 1;
    }
    uint64_t v17 = *MEMORY[0x1E4FA7DF0];
    long long v18 = objc_msgSend(v7, "bs_safeNumberForKey:", *MEMORY[0x1E4FA7DF0]);
    uint64_t v19 = [v18 integerValue];
    if (((v12 | v16) & 1) == 0 && v18 && v19 == 5)
    {
      double v20 = v5;
      int v21 = (void *)v6;
      __int16 v23 = v36;
      double v22 = v37;
    }
    else
    {
      id v24 = SBLogWorkspace();
      double v31 = v5;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        double v29 = [(SBApplication *)self bundleIdentifier];
        *(_DWORD *)int buf = 138545154;
        double v43 = v29;
        __int16 v44 = 2112;
        double v45 = v36;
        __int16 v46 = 2112;
        double v47 = v37;
        __int16 v48 = 2112;
        double v49 = v13;
        __int16 v50 = 2112;
        double v51 = v15;
        __int16 v52 = 2112;
        double v53 = v18;
        __int16 v54 = 2048;
        uint64_t v55 = 5;
        __int16 v56 = 2112;
        CGFloat v57 = v31;
        _os_log_error_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] savedCachedGUIDString=%@ currentCacheGUID=%@ savedInstallInstanceID=%@ currentInstallInstanceID=%@ savedIngestorVersionNSNumber=%@ currentIngestorVersion=%li dataStore=%@", buf, 0x52u);
      }
      __int16 v25 = XBLogFileManifest();
      int v21 = (void *)v6;
      __int16 v23 = v36;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        unint64_t v30 = [(SBApplication *)self bundleIdentifier];
        *(_DWORD *)int buf = 138545154;
        double v43 = v30;
        __int16 v44 = 2112;
        double v45 = v36;
        __int16 v46 = 2112;
        double v47 = v37;
        __int16 v48 = 2112;
        double v49 = v13;
        __int16 v50 = 2112;
        double v51 = v15;
        __int16 v52 = 2112;
        double v53 = v18;
        __int16 v54 = 2048;
        uint64_t v55 = 5;
        __int16 v56 = 2112;
        CGFloat v57 = v31;
        _os_log_error_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_ERROR, "[%{public}@] ID Mismatch. purging and reingesting. savedCachedGUIDString=%@ currentCacheGUID=%@ savedInstallInstanceID=%@ currentInstallInstanceID=%@ savedIngestorVersionNSNumber=%@ currentIngestorVersion=%li dataStore=%@", buf, 0x52u);
      }
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __94__SBApplication_DefaultImage_ManifestIngestion__refreshLaunchImagesInSnapshotManifestIfNeeded__block_invoke;
      v38[3] = &unk_1E6AF5290;
      v38[4] = self;
      id v39 = v21;
      [v39 beginSnapshotAccessTransaction:v38 completion:0];
      v40[0] = v33;
      double v22 = v37;
      id v26 = [v37 UUIDString];
      v41[0] = v26;
      v41[1] = v15;
      v40[1] = v32;
      v40[2] = v17;
      uint64_t v27 = [NSNumber numberWithInteger:5];
      v41[2] = v27;
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];

      double v20 = v31;
      [v31 setObject:v28 forKey:v34];

      id v7 = (void *)v28;
    }
  }
}

void __94__SBApplication_DefaultImage_ManifestIngestion__refreshLaunchImagesInSnapshotManifestIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _purgeStaticDefaultImagesInSnapshotManifest];
  id v2 = [*(id *)(a1 + 32) info];
  uint64_t v3 = [v2 launchImageInfo];

  char v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v3)
  {
    [v4 _ingestInfoPlistImagesInManifest:v5];
  }
  else
  {
    id v6 = [v4 _defaultLaunchImageBaseName];
    [v4 _ingestDefaultPNGsInManifest:v5 withLaunchImageBaseName:v6];
  }
}

- (void)_resetLaunchImageIngestionStatus
{
  uint64_t v3 = [(SBApplication *)self info];
  char v4 = [v3 usesSplashBoard];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = XBLogFileManifest();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBApplication(DefaultImage_ManifestIngestion) _resetLaunchImageIngestionStatus](self);
    }

    id v6 = [(SBApplication *)self _dataStore];
    [v6 setObject:MEMORY[0x1E4F1CC08] forKey:*MEMORY[0x1E4FA7DE0]];
  }
}

- (void)_purgeAndResetStaticDefaultImagesInSnapshotManifest
{
  uint64_t v3 = [(SBApplication *)self info];
  char v4 = [v3 usesSplashBoard];

  if ((v4 & 1) == 0)
  {
    [(SBApplication *)self _purgeStaticDefaultImagesInSnapshotManifest];
    [(SBApplication *)self _resetLaunchImageIngestionStatus];
  }
}

- (void)_reingestStaticDefaultImagesInSnapshotManifest
{
  uint64_t v3 = [(SBApplication *)self info];
  char v4 = [v3 usesSplashBoard];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = XBLogFileManifest();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBApplication(DefaultImage_ManifestIngestion) _resetLaunchImageIngestionStatus](self);
    }

    [(SBApplication *)self _resetLaunchImageIngestionStatus];
    [(SBApplication *)self refreshLaunchImagesInSnapshotManifestIfNeeded];
    [(SBApplication *)self _recalculateApplicationSupportedTypes];
  }
}

+ (void)_markAllManifestsForReingestion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = +[SBApplicationController sharedInstance];
  uint64_t v3 = [v2 allApplications];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) _resetLaunchImageIngestionStatus];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (void)_reingestStaticDefaultImagesForAllApps
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = +[SBApplicationController sharedInstance];
  uint64_t v3 = [v2 allApplications];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) _reingestStaticDefaultImagesInSnapshotManifest];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_purgeStaticDefaultImagesInSnapshotManifest
{
  id v3 = [(SBApplication *)self _snapshotManifest];
  id v2 = [v3 defaultGroupIdentifier];
  [v3 deleteSnapshotsForGroupID:v2 predicateBuilder:&__block_literal_global_65_1];
}

uint64_t __92__SBApplication_DefaultImage_ManifestIngestion___purgeStaticDefaultImagesInSnapshotManifest__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentTypeMask:4];
}

- (void)_ingestDefaultPNGsInManifest:(id)a3 withLaunchImageBaseName:(id)a4
{
  uint64_t v186 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v160 = a4;
  if (!v160)
  {
    CGRect v136 = [MEMORY[0x1E4F28B00] currentHandler];
    [v136 handleFailureInMethod:a2, self, @"SBApplication+DefaultImage.m", 505, @"Invalid parameter not satisfying: %@", @"launchImageBaseName != nil" object file lineNumber description];
  }
  char v152 = self;
  long long v8 = [(SBApplication *)self info];
  id v9 = objc_alloc(MEMORY[0x1E4F4F6D0]);
  long long v10 = [v8 bundleURL];
  long long v11 = (void *)[v9 initWithURL:v10];

  int v12 = [v7 defaultGroupIdentifier];
  uint64_t v13 = [v8 backgroundStyle];
  uint64_t v14 = [v8 statusBarHidden];
  uint64_t v15 = [v8 defaultStatusBarStyle];
  id v16 = objc_alloc_init(MEMORY[0x1E4FA58F0]);
  [v16 setHidden:v14];
  [v16 setStyle:v15];
  uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v18 = [v11 bundlePath];
  id v179 = 0;
  uint64_t v19 = [v17 contentsOfDirectoryAtPath:v18 error:&v179];
  id v20 = v179;
  if (!v20)
  {
    uint64_t v21 = v13;
    int v140 = v17;
    char v141 = v18;
    char v146 = v12;
    BOOL v142 = v8;
    int v148 = v7;
    BOOL v139 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(self BEGINSWITH %@) AND (pathExtension ==[c] 'png')", v160];
    double v22 = objc_msgSend(v19, "filteredArrayUsingPredicate:");
    __int16 v23 = NSString;
    id v24 = +[SBApplicationLaunchImageParameters validInfoPlistOrientationKeys];
    __int16 v25 = [v24 componentsJoinedByString:@"|"];
    uint64_t v26 = [v23 stringWithFormat:@"-(%@)", v25];

    id v178 = 0;
    int v159 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"@(\\d)x" options:0 error:&v178];
    id v27 = v178;
    id v177 = v27;
    char v158 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"~(ipad|iphone)" options:0 error:&v177];
    id v28 = v177;

    id v176 = v28;
    char v138 = (void *)v26;
    int v157 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v26 options:0 error:&v176];
    id v29 = v176;

    id v175 = v29;
    int v145 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"-(\\d{3,4})w" options:0 error:&v175];
    id v30 = v175;

    id v174 = v30;
    char v156 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"-(\\d{3,4})h" options:0 error:&v174];
    id v31 = v174;

    id v173 = v31;
    double v153 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"-([A-Za-z][A-Za-z\\-\\+0-9\\.]+)" options:0 error:&v173];
    id v137 = v173;

    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    id v32 = v22;
    uint64_t v168 = [v32 countByEnumeratingWithState:&v169 objects:v185 count:16];
    if (!v168) {
      goto LABEL_85;
    }
    uint64_t v167 = *(void *)v170;
    double v33 = *MEMORY[0x1E4F1DB30];
    double v34 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v35 = *MEMORY[0x1E4FA6180];
    double v143 = *(double *)(MEMORY[0x1E4FA6180] + 8);
    double v37 = *MEMORY[0x1E4FA6178];
    double v36 = *(double *)(MEMORY[0x1E4FA6178] + 8);
    BOOL v154 = v11;
    int v155 = v19;
    uint64_t v144 = v21;
    id v149 = v16;
    id v165 = v32;
    while (1)
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v170 != v167) {
          objc_enumerationMutation(v32);
        }
        id v39 = *(void **)(*((void *)&v169 + 1) + 8 * v38);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v40 = (void *)MEMORY[0x1D948C4D0]();
          double v41 = [v11 pathForResource:v39 ofType:0];
          BOOL v166 = [v41 pathExtension];
          if (objc_msgSend(MEMORY[0x1E4FA58A8], "isValidImageFileExtension:"))
          {
            double v164 = v40;
            double v42 = [v39 stringByDeletingPathExtension];
            double v43 = [v42 stringByReplacingOccurrencesOfString:v160 withString:&stru_1F3084718];

            __int16 v44 = objc_msgSend(v159, "firstMatchInString:options:range:", v43, 0, 0, -[NSObject length](v43, "length"));
            double v45 = v44;
            double v46 = 1.0;
            if (v44 && (unint64_t)[v44 numberOfRanges] >= 2)
            {
              uint64_t v47 = [v45 rangeAtIndex:1];
              double v49 = -[NSObject substringWithRange:](v43, "substringWithRange:", v47, v48);
              [v49 floatValue];
              double v46 = v50;

              uint64_t v51 = [v45 rangeAtIndex:0];
              uint64_t v53 = -[NSObject stringByReplacingCharactersInRange:withString:](v43, "stringByReplacingCharactersInRange:withString:", v51, v52, &stru_1F3084718);

              double v43 = v53;
            }
            __int16 v54 = objc_msgSend(v158, "firstMatchInString:options:range:", v43, 0, 0, -[NSObject length](v43, "length"));
            uint64_t v55 = v54;
            if (v54 && (unint64_t)[v54 numberOfRanges] >= 2)
            {
              uint64_t v56 = [v55 rangeAtIndex:1];
              uint64_t v58 = -[NSObject substringWithRange:](v43, "substringWithRange:", v56, v57);
              double v59 = v36;
              double v60 = v37;
              if (([v58 isEqualToString:@"ipad"] & 1) == 0)
              {
                int v61 = [v58 isEqualToString:@"iphone"];
                if (v61) {
                  double v59 = v143;
                }
                else {
                  double v59 = v34;
                }
                if (v61) {
                  double v60 = v35;
                }
                else {
                  double v60 = v33;
                }
              }
              uint64_t v62 = [v55 rangeAtIndex:0];
              uint64_t v64 = -[NSObject stringByReplacingCharactersInRange:withString:](v43, "stringByReplacingCharactersInRange:withString:", v62, v63, &stru_1F3084718);

              double v43 = v64;
            }
            else
            {
              double v59 = v34;
              double v60 = v33;
            }
            CGRect v69 = objc_msgSend(v157, "firstMatchInString:options:range:", v43, 0, 0, -[NSObject length](v43, "length"));
            CGRect v70 = v69;
            char v163 = v45;
            if (v69 && (unint64_t)[v69 numberOfRanges] >= 2)
            {
              uint64_t v71 = [v70 rangeAtIndex:1];
              int v73 = -[NSObject substringWithRange:](v43, "substringWithRange:", v71, v72);
              BOOL v150 = v39;
              uint64_t v74 = v41;
              char v75 = v11;
              id v76 = v16;
              uint64_t v77 = XBInterfaceOrientationForString();
              uint64_t v78 = [v70 rangeAtIndex:0];
              -[NSObject stringByReplacingCharactersInRange:withString:](v43, "stringByReplacingCharactersInRange:withString:", v78, v79, &stru_1F3084718);
              v81 = char v80 = v70;

              uint64_t v82 = v77;
              id v16 = v76;
              long long v11 = v75;
              double v41 = v74;
              id v39 = v150;
              double v43 = v81;
              CGRect v70 = v80;
            }
            else
            {
              uint64_t v82 = 1;
            }
            int v83 = objc_msgSend(v156, "firstMatchInString:options:range:", v43, 0, 0, -[NSObject length](v43, "length"));
            double v84 = v83;
            BOOL v161 = v70;
            int v162 = v55;
            if (!v83 || (unint64_t)[v83 numberOfRanges] < 2)
            {
              CGRect v66 = v43;
              goto LABEL_43;
            }
            id v85 = v16;
            uint64_t v86 = v82;
            uint64_t v87 = [v84 rangeAtIndex:1];
            id v89 = -[NSObject substringWithRange:](v43, "substringWithRange:", v87, v88);
            [v89 floatValue];
            double v59 = v90;

            uint64_t v91 = [v84 rangeAtIndex:0];
            CGRect v66 = -[NSObject stringByReplacingCharactersInRange:withString:](v43, "stringByReplacingCharactersInRange:withString:", v91, v92, &stru_1F3084718);

            char v93 = objc_msgSend(v145, "firstMatchInString:options:range:", v66, 0, 0, -[NSObject length](v66, "length"));
            id v94 = v93;
            if (v93 && (unint64_t)[v93 numberOfRanges] >= 2)
            {
              uint64_t v95 = [v94 rangeAtIndex:1];
              BOOL v97 = -[NSObject substringWithRange:](v66, "substringWithRange:", v95, v96);
              [v97 floatValue];
              double v60 = v98;

              uint64_t v99 = [v94 rangeAtIndex:0];
              uint64_t v101 = -[NSObject stringByReplacingCharactersInRange:withString:](v66, "stringByReplacingCharactersInRange:withString:", v99, v100, &stru_1F3084718);

              CGRect v66 = v101;
              goto LABEL_42;
            }
            if (BSFloatEqualToFloat())
            {
              double v60 = v35;
LABEL_42:

              uint64_t v82 = v86;
              id v16 = v85;
              long long v11 = v154;
LABEL_43:
              uint64_t v102 = objc_msgSend(v153, "firstMatchInString:options:range:", v66, 0, 0, -[NSObject length](v66, "length"));
              BOOL v103 = v102;
              if (v102 && (unint64_t)[v102 numberOfRanges] >= 2)
              {
                uint64_t v104 = v82;
                uint64_t v105 = [v103 rangeAtIndex:1];
                id v94 = -[NSObject substringWithRange:](v66, "substringWithRange:", v105, v106);
                if ([(SBApplication *)v152 isSystemApplication]
                  || ([v142 urlSchemes],
                      double v107 = objc_claimAutoreleasedReturnValue(),
                      char v108 = [v107 containsObject:v94],
                      v107,
                      (v108 & 1) != 0))
                {
                  uint64_t v109 = [v103 rangeAtIndex:0];
                  uint64_t v111 = -[NSObject stringByReplacingCharactersInRange:withString:](v66, "stringByReplacingCharactersInRange:withString:", v109, v110, &stru_1F3084718);

                  CGRect v66 = v111;
                  long long v11 = v154;
                  uint64_t v82 = v104;
                  id v16 = v149;
                  goto LABEL_49;
                }
                id v116 = XBLogFileManifest();
                if (!os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                {
LABEL_78:

                  long long v11 = v154;
                  id v16 = v149;
                  goto LABEL_79;
                }
                id v119 = [(SBApplication *)v152 bundleIdentifier];
                *(_DWORD *)int buf = 138543874;
                *(void *)&uint8_t buf[4] = v119;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v94;
                *(_WORD *)&buf[22] = 2114;
                *(void *)&buf[24] = v39;
                _os_log_error_impl(&dword_1D85BA000, v116, OS_LOG_TYPE_ERROR, "[legacy ingest] [%{public}@] Invalid scheme ('%{public}@') not declared in plist for %{public}@, skipping...", buf, 0x20u);
LABEL_61:

                goto LABEL_78;
              }
              id v94 = 0;
LABEL_49:
              if ([v66 length])
              {
                BOOL v112 = XBLogFileManifest();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                {
                  double v130 = [(SBApplication *)v152 bundleIdentifier];
                  *(_DWORD *)int buf = 138543874;
                  *(void *)&uint8_t buf[4] = v130;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v66;
                  *(_WORD *)&buf[22] = 2114;
                  *(void *)&buf[24] = v39;
                  _os_log_error_impl(&dword_1D85BA000, v112, OS_LOG_TYPE_ERROR, "[legacy ingest] [%{public}@] Extranenous content ('%{public}@') left over after processing permitted modifiers in %{public}@, skipping...", buf, 0x20u);

                  long long v11 = v154;
                }

LABEL_79:
                uint64_t v19 = v155;
                double v40 = v164;
LABEL_80:

                id v32 = v165;
                goto LABEL_81;
              }
              if (v60 == v33)
              {
                BOOL v113 = v146;
                if (v59 == v34)
                {
                  uint64_t v114 = v82;
                  id v115 = XBLogFileManifest();
                  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
                  {
                    double v131 = [(SBApplication *)v152 bundleIdentifier];
                    *(_DWORD *)int buf = 138543618;
                    *(void *)&uint8_t buf[4] = v131;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v39;
                    _os_log_debug_impl(&dword_1D85BA000, v115, OS_LOG_TYPE_DEBUG, "[legacy ingest] [%{public}@] Need to load the image to get size for %{public}@", buf, 0x16u);

                    BOOL v113 = v146;
                  }

                  id v116 = [MEMORY[0x1E4F42A80] imageWithContentsOfFile:v41];
                  [v116 size];
                  if (v117 == v33 && v118 == v34)
                  {
                    id v119 = XBLogFileManifest();
                    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                    {
                      CGRect v133 = [(SBApplication *)v152 bundleIdentifier];
                      *(_DWORD *)int buf = 138543618;
                      *(void *)&uint8_t buf[4] = v133;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v39;
                      _os_log_error_impl(&dword_1D85BA000, v119, OS_LOG_TYPE_ERROR, "[legacy ingest] [%{public}@] zero image size for %{public}@", buf, 0x16u);
                    }
                    goto LABEL_61;
                  }
                  if ((unint64_t)(v114 - 3) >= 2) {
                    double v59 = v118;
                  }
                  else {
                    double v59 = v117;
                  }
                  if ((unint64_t)(v114 - 3) >= 2) {
                    double v60 = v117;
                  }
                  else {
                    double v60 = v118;
                  }

                  uint64_t v82 = v114;
                }
              }
              else
              {
                BOOL v113 = v146;
              }
              uint64_t v151 = v82;
              long long v121 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
              *(_OWORD *)int buf = *MEMORY[0x1E4F1DB28];
              *(_OWORD *)&buf[16] = v121;
              -[SBApplication snapshotSizeAdjustedForLegacyStatusBarBasedOnSize:interfaceOrientation:contentFrame:](v152, "snapshotSizeAdjustedForLegacyStatusBarBasedOnSize:interfaceOrientation:contentFrame:", v82, buf, v60, v59);
              double v123 = v122;
              double v125 = v124;
              char v126 = [v148 createSnapshotWithGroupID:v113];
              double v127 = XBLogFileManifest();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
              {
                BOOL v147 = [(SBApplication *)v152 bundleIdentifier];
                *(_DWORD *)int v180 = 138543618;
                char v181 = v147;
                __int16 v182 = 2114;
                int v183 = v39;
                _os_log_debug_impl(&dword_1D85BA000, v127, OS_LOG_TYPE_DEBUG, "[legacy ingest] [%{public}@] going to save %{public}@", v180, 0x16u);
              }
              double v128 = [(SBApplication *)v152 _normalizeSnapshotName:v160];
              [v126 setName:v128];

              [v126 setScheme:v94];
              [v126 setContentType:2];
              [v126 setFullScreen:1];
              objc_msgSend(v126, "setReferenceSize:", v123, v125);
              objc_msgSend(v126, "setContentFrame:", *(double *)buf, *(double *)&buf[8], *(double *)&buf[16], *(double *)&buf[24]);
              [v126 setInterfaceOrientation:v151];
              id v16 = v149;
              [v126 setStatusBarSettings:v149];
              [v126 setBackgroundStyle:v144];
              id v129 = objc_alloc_init(MEMORY[0x1E4FA58F8]);
              [v129 setScale:v46];
              [v129 setOpaque:v144 == 0];
              [v148 saveSnapshot:v126 atPath:v41 withContext:v129];
            }
            else
            {
              BOOL v103 = XBLogFileManifest();
              if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
              {
                double v132 = [(SBApplication *)v152 bundleIdentifier];
                *(_DWORD *)int buf = 138543618;
                *(void *)&uint8_t buf[4] = v132;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v39;
                _os_log_error_impl(&dword_1D85BA000, v103, OS_LOG_TYPE_ERROR, "[legacy ingest] [%{public}@] Invalid size modifiers for %{public}@, skipping...", buf, 0x16u);
              }
              id v16 = v85;
            }
            long long v11 = v154;
            goto LABEL_79;
          }
          CGRect v66 = XBLogFileManifest();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            [(SBApplication *)v152 bundleIdentifier];
            v68 = CGRect v67 = v40;
            *(_DWORD *)int buf = 138543874;
            *(void *)&uint8_t buf[4] = v68;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v39;
            *(_WORD *)&buf[22] = 2114;
            *(void *)&buf[24] = v41;
            _os_log_error_impl(&dword_1D85BA000, v66, OS_LOG_TYPE_ERROR, "[legacy ingest] [%{public}@] Candidate: <%{public}@> references a path: <%{public}@> with an unsupported image file extension; skipping...",
              buf,
              0x20u);

            double v40 = v67;
          }
          goto LABEL_80;
        }
        CGRect v65 = XBLogFileManifest();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          int v120 = [(SBApplication *)v152 bundleIdentifier];
          *(_DWORD *)int buf = 138543618;
          *(void *)&uint8_t buf[4] = v120;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v39;
          _os_log_debug_impl(&dword_1D85BA000, v65, OS_LOG_TYPE_DEBUG, "[legacy ingest] [%{public}@] Candidate isn't a string: %{public}@, skipping...", buf, 0x16u);
        }
LABEL_81:
        ++v38;
      }
      while (v168 != v38);
      uint64_t v134 = [v32 countByEnumeratingWithState:&v169 objects:v185 count:16];
      uint64_t v168 = v134;
      if (!v134)
      {
LABEL_85:

        id v7 = v148;
        long long v8 = v142;
        uint64_t v17 = v140;
        long long v18 = v141;
        if (![v32 count])
        {
          CGRect v135 = XBLogFileManifest();
          if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG)) {
            -[SBApplication(DefaultImage_ManifestIngestion) _ingestDefaultPNGsInManifest:withLaunchImageBaseName:](v152);
          }

          long long v18 = v141;
        }

        int v12 = v146;
        id v20 = v137;
        break;
      }
    }
  }
}

- (void)_ingestInfoPlistImagesInManifest:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBApplication *)self info];
  uint64_t v6 = [v5 launchImageInfo];
  if ([v6 count])
  {
    uint64_t v51 = v4;
    uint64_t v48 = [v4 defaultGroupIdentifier];
    BOOL v7 = [(SBApplication *)self classicAppScaled];
    uint64_t v46 = [v5 backgroundStyle];
    long long v8 = [MEMORY[0x1E4F42D90] mainScreen];
    [v8 scale];
    double v10 = v9;

    double v58 = v10;
    id v11 = objc_alloc_init(MEMORY[0x1E4FA58F0]);
    objc_msgSend(v11, "setHidden:", objc_msgSend(v5, "statusBarHidden"));
    double v45 = v5;
    uint64_t v47 = v11;
    objc_msgSend(v11, "setStyle:", objc_msgSend(v5, "defaultStatusBarStyle"));
    id v12 = objc_alloc(MEMORY[0x1E4F4F6D0]);
    uint64_t v13 = self;
    uint64_t v14 = [(SBApplication *)self info];
    uint64_t v15 = [v14 bundleURL];
    uint64_t v53 = (void *)[v12 initWithURL:v15];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    __int16 v44 = v6;
    id v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (!v17) {
      goto LABEL_28;
    }
    uint64_t v18 = v17;
    unsigned int v52 = !v7;
    uint64_t v19 = *(void *)v55;
    double v20 = *MEMORY[0x1E4F1DB30];
    double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v49 = v13;
    id v50 = v16;
    while (1)
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v55 != v19) {
          objc_enumerationMutation(v16);
        }
        __int16 v23 = *(NSObject **)(*((void *)&v54 + 1) + 8 * v22);
        id v24 = (void *)MEMORY[0x1D948C4D0]();
        [v23 size];
        if (v25 == v20 && v26 == v21)
        {
          id v32 = XBLogFileManifest();
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            goto LABEL_26;
          }
          double v34 = [(SBApplication *)v13 bundleIdentifier];
          *(_DWORD *)int buf = 138543618;
          double v60 = v34;
          __int16 v61 = 2114;
          uint64_t v62 = v23;
          _os_log_error_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_ERROR, "[.plist ingest] [%{public}@] skipping parameters: %{public}@ because it specifies a zero size.", buf, 0x16u);
          goto LABEL_22;
        }
        double v28 = v25;
        double v29 = v26;
        id v30 = [v23 defaultPNGName];
        uint64_t v31 = [v23 extension];
        id v32 = -[SBApplication _preferredImagePathInBundle:baseResourceName:ofType:forMainScene:size:scale:outScale:](v13, "_preferredImagePathInBundle:baseResourceName:ofType:forMainScene:size:scale:outScale:", v53, v30, v31, v52, &v58, v28, v29, v58);

        objc_opt_class();
        LOBYTE(v31) = objc_opt_isKindOfClass();
        double v33 = XBLogFileManifest();
        double v34 = v33;
        if ((v31 & 1) == 0)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            double v41 = [(SBApplication *)v13 bundleIdentifier];
            *(_DWORD *)int buf = 138543874;
            double v60 = v41;
            __int16 v61 = 2114;
            uint64_t v62 = v32;
            __int16 v63 = 2114;
            uint64_t v64 = v23;
            _os_log_error_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_ERROR, "[.plist ingest] [%{public}@] Incorrect image path type (requires NSString) in ('%{public}@'), skipping...\n%{public}@", buf, 0x20u);
          }
LABEL_22:

          goto LABEL_26;
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          double v40 = [(SBApplication *)v13 bundleIdentifier];
          *(_DWORD *)int buf = 138543618;
          double v60 = v40;
          __int16 v61 = 2114;
          uint64_t v62 = v23;
          _os_log_debug_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] going to save %{public}@", buf, 0x16u);
        }
        double v35 = [v32 pathExtension];
        if ([MEMORY[0x1E4FA58A8] isValidImageFileExtension:v35])
        {
          double v36 = [v51 createSnapshotWithGroupID:v48];
          [v36 setContentType:2];
          [v36 setFullScreen:1];
          -[NSObject setReferenceSize:](v36, "setReferenceSize:", v28, v29);
          [v36 setInterfaceOrientation:[v23 interfaceOrientation]];
          double v37 = [v23 minOSVersionString];
          [v36 setRequiredOSVersion:v37];

          [v36 setStatusBarSettings:v47];
          [v36 setBackgroundStyle:v46];
          id v38 = objc_alloc_init(MEMORY[0x1E4FA58F8]);
          [v38 setScale:v58];
          [v38 setOpaque:v46 == 0];
          id v39 = XBLogFileManifest();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            double v42 = [(SBApplication *)v49 bundleIdentifier];
            *(_DWORD *)int buf = 138543618;
            double v60 = v42;
            __int16 v61 = 2114;
            uint64_t v62 = v36;
            _os_log_debug_impl(&dword_1D85BA000, v39, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] going to save snapshot: %{public}@", buf, 0x16u);
          }
          [v51 saveSnapshot:v36 atPath:v32 withContext:v38];

          uint64_t v13 = v49;
        }
        else
        {
          double v36 = XBLogFileManifest();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            double v43 = [(SBApplication *)v13 bundleIdentifier];
            *(_DWORD *)int buf = 138543618;
            double v60 = v43;
            __int16 v61 = 2114;
            uint64_t v62 = v32;
            _os_log_error_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_ERROR, "[.plist ingest] [%{public}@] references a path: <%{public}@> with an unsupported image file extension; skipping...",
              buf,
              0x16u);
          }
        }

        id v16 = v50;
LABEL_26:

        ++v22;
      }
      while (v18 != v22);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v54 objects:v65 count:16];
      if (!v18)
      {
LABEL_28:

        id v4 = v51;
        uint64_t v6 = v44;
        uint64_t v5 = v45;
        goto LABEL_31;
      }
    }
  }
  uint64_t v48 = XBLogFileManifest();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
    -[SBApplication(DefaultImage_ManifestIngestion) _ingestInfoPlistImagesInManifest:](self);
  }
LABEL_31:
}

- (id)_preferredImagePathInBundle:(id)a3 baseResourceName:(id)a4 ofType:(id)a5 forMainScene:(BOOL)a6 size:(CGSize)a7 scale:(double)a8 outScale:(double *)a9
{
  double height = a7.height;
  double width = a7.width;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  int v20 = __sb__runningInSpringBoard();
  char v21 = v20;
  if (v20)
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    {
LABEL_30:
      id v30 = SBFModifiedImageNameForName();
      uint64_t v31 = [(SBApplication *)self _preferredImagePathByScaleInBundle:v17 resourceName:v30 ofType:v19 scale:a9 outScale:a8];

      if (v31) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else
  {
    double v9 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v9 userInterfaceIdiom])
    {

      goto LABEL_30;
    }
  }
  int v22 = __sb__runningInSpringBoard();
  if (v22)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v23 = 0;
      int v35 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    double v34 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v34 userInterfaceIdiom] != 1)
    {
      int v23 = 0;
      int v35 = 1;
      goto LABEL_17;
    }
  }
  int v35 = v22 ^ 1;
  int v24 = __sb__runningInSpringBoard();
  if (v24)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v33 = [MEMORY[0x1E4F42D90] mainScreen];
    [v33 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    BOOL v29 = 1;
    if ((v24 & 1) == 0) {
      goto LABEL_21;
    }
LABEL_24:
    if (!v35) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  int v23 = v24 ^ 1;
LABEL_17:
  double v26 = [MEMORY[0x1E4F42D90] mainScreen];
  [v26 _referenceBounds];
  BOOL v29 = height != v28 || width != v27;

  if (!v23) {
    goto LABEL_24;
  }
LABEL_21:

  if (v35) {
LABEL_25:
  }

LABEL_26:
  if (v21)
  {
    if (v29) {
      goto LABEL_30;
    }
  }
  else
  {

    if (v29) {
      goto LABEL_30;
    }
  }
LABEL_31:
  uint64_t v31 = [(SBApplication *)self _preferredImagePathByScaleInBundle:v17 resourceName:v18 ofType:v19 scale:a9 outScale:a8];
LABEL_32:

  return v31;
}

- (id)_preferredImagePathByScaleInBundle:(id)a3 resourceName:(id)a4 ofType:(id)a5 scale:(double)a6 outScale:(double *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (uint64_t *)&_preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____suffixIndices1;
  if (a6 == 3.0) {
    uint64_t v14 = (uint64_t *)&_preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____suffixIndices3;
  }
  if (a6 == 2.0) {
    uint64_t v15 = (uint64_t *)&_preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____suffixIndices2;
  }
  else {
    uint64_t v15 = v14;
  }
  uint64_t v16 = *v15;
  if (*v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v17 = 0;
  }
  else
  {
    int v23 = a7;
    id v24 = v12;
    while (2)
    {
      ++v15;
      id v18 = _preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____suffixes[v16];
      id v19 = [v12 stringByAppendingString:v18];
      for (uint64_t i = 0; i != 3; ++i)
      {
        char v21 = objc_msgSend(v19, "stringByAppendingString:", _preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____deviceModifiers[i], v23);
        id v17 = [v11 pathForResource:v21 ofType:v13];

        if (v17)
        {
          if (v23) {
            *int v23 = _preferredImagePathByScaleInBundle_resourceName_ofType_scale_outScale____suffixScales[v16];
          }

          id v12 = v24;
          goto LABEL_17;
        }
      }

      id v17 = 0;
      uint64_t v16 = *v15;
      id v12 = v24;
      if (*v15 != 0x7FFFFFFFFFFFFFFFLL) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v17;
}

- (BOOL)isSpringBoard
{
  id v2 = [(SBApplication *)self bundleIdentifier];
  id v3 = FBSystemAppBundleID();
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)isMobilePhone
{
  id v2 = [(SBApplication *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.mobilephone"];

  return v3;
}

- (BOOL)isFaceTime
{
  id v2 = [(SBApplication *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.facetime"];

  return v3;
}

+ (void)_unobscuredScreenTypeForScreenType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v4 = SBHStringForScreenType();
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Unknown classic mode used: %@ (%ld)", (uint8_t *)&v5, 0x16u);
}

void __86__SBApplication_Snapshots___xbactivity_saveSnapshotForSceneHandle_context_completion___block_invoke_62_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  double v8 = -v4;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] Finished writing snapshots after %.2f sec", (uint8_t *)&v5, 0x16u);
}

@end