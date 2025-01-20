@interface SOSUtilities
+ (BOOL)BOOLOverrideForDefaultsKey:(id)a3 defaultValue:(BOOL)a4;
+ (BOOL)_hasAccessibilityConflict;
+ (BOOL)_isCarryDevice;
+ (BOOL)_isInternalDevice;
+ (BOOL)_potentialForAccessibilityConflict;
+ (BOOL)_synchronizeSOSPrefs;
+ (BOOL)activeDeviceHasMandrake;
+ (BOOL)activeDeviceSupportsMandrake;
+ (BOOL)activeDeviceSupportsNewton;
+ (BOOL)activeDeviceSupportsNewtonWorkoutsOnly;
+ (BOOL)autoCallRequiresSIM;
+ (BOOL)canTriggerSOSWithSideButton;
+ (BOOL)defaultToWorkoutsOnlyForEligibility:(unint64_t)a3;
+ (BOOL)deviceHasHomeButton;
+ (BOOL)deviceHasSlot;
+ (BOOL)hasActiveSIMForClient:(id)a3;
+ (BOOL)hasEmergencyContacts;
+ (BOOL)hasMultiPressResetLogicRun;
+ (BOOL)hasNewtonTriggersEmergencySOSWorkoutsSetting;
+ (BOOL)isActivePairedDeviceTinker;
+ (BOOL)isAllowedToMessageSOSContacts;
+ (BOOL)isAutomaticCallCountdownEnabled;
+ (BOOL)isCallWithSideButtonPressesEnabled;
+ (BOOL)isCallWithVolumeLockHoldEnabled;
+ (BOOL)isDeviceD2xOrNewer;
+ (BOOL)isDeviceWatchUsePairedDevice:(BOOL)a3;
+ (BOOL)isIndiaSKU;
+ (BOOL)isKappaDetectionSupportedOnActiveWatch;
+ (BOOL)isKappaDetectionSupportedOnCurrentDevice;
+ (BOOL)isKappaUnmasked;
+ (BOOL)isKappaVisible;
+ (BOOL)isMessagesAppInstalled;
+ (BOOL)isMountStateTrackingEnabled;
+ (BOOL)isSOSMessagesUrgentAlertingAvailable;
+ (BOOL)isSOSMessagesUrgentAlertingEnabled;
+ (BOOL)isSmallScreen;
+ (BOOL)isStewieVisible;
+ (BOOL)kappaTriggersEmergencySOS;
+ (BOOL)kappaTriggersEmergencySOSTinker;
+ (BOOL)longPressTriggersEmergencySOS;
+ (BOOL)longPressTriggersMandrake;
+ (BOOL)newtonAlwaysOnRequiresConfirmationForEligibility:(unint64_t)a3;
+ (BOOL)newtonTriggersEmergencySOS;
+ (BOOL)newtonTriggersEmergencySOSWorkouts;
+ (BOOL)setShouldPlayAudioDuringCountdown:(BOOL)a3;
+ (BOOL)shouldAllowSOSStatusReset;
+ (BOOL)shouldBlockNonEmergencyCalls;
+ (BOOL)shouldForceDisableAutoCallForClient:(id)a3;
+ (BOOL)shouldPlayAudioDuringCountdown;
+ (BOOL)shouldShowCrashDetectionThirdPartySettingsForPairedDevice:(BOOL)a3;
+ (BOOL)shouldSilenceSOSFlow;
+ (BOOL)shouldSkipNewtonCall;
+ (BOOL)sosMessagesUrgentAlertingBypassesMute;
+ (BOOL)supportsSOSWithSideButtonSelectableNumberOfClicks;
+ (NSNumber)newtonTriggersEmergencySOSNumber;
+ (NSString)accidentalCallFeedbackAssistantLegalText;
+ (NSString)accidentalCallNotificationBody;
+ (NSString)accidentalCallNotificationTitle;
+ (NSString)autoCallFooterDescription;
+ (NSString)autoCallTitleDescription;
+ (NSString)automaticDialingSectionDescription;
+ (NSString)callWithHoldFooterDescription;
+ (NSString)callWithHoldTitleDescription;
+ (NSString)callWithPressesFooterDescription;
+ (NSString)callWithPressesTitleDescription;
+ (NSString)callWithSideButtonFooterDescription;
+ (NSString)callWithSideButtonTitleDescription;
+ (NSString)countdownSoundFooterDescription;
+ (NSString)countdownSoundTitleDescription;
+ (NSString)crashDetectionFeedbackAssistantLegalText;
+ (NSString)crashDetectionFooterLinkDescription;
+ (NSString)crashDetectionPhoneFooterDesription;
+ (NSString)crashDetectionPhoneWatchFooterDescription;
+ (NSString)crashDetectionSwitchDescription;
+ (NSString)crashDetectionThirdPartyAlertTitle;
+ (NSString)crashDetectionThirdPartyAppWithAccessDescription;
+ (NSString)crashDetectionThirdPartyCellTitle;
+ (NSString)crashDetectionThirdPartyDescription;
+ (NSString)crashDetectionThirdPartyFooterDescriptionPhone;
+ (NSString)crashDetectionThirdPartyFooterDescriptionWatch;
+ (NSString)crashDetectionThirdPartyNavigationTitle;
+ (NSString)crashDetectionThirdPartyShareDisableDescription;
+ (NSString)crashDetectionTitleDescription;
+ (NSString)crashDetectionWatchFooterDescription;
+ (NSString)crashDetectionWristDetectionWarningDescription;
+ (NSString)emergencyContactsEditDescription;
+ (NSString)emergencyContactsFooterDescription;
+ (NSString)emergencyContactsFooterLinkTitle;
+ (NSString)emergencyContactsSectionDescription;
+ (NSString)fallDetectionAlwaysOnTitleDescription;
+ (NSString)fallDetectionFooterDescription;
+ (NSString)fallDetectionOnlyDuringWorkoutsTitleDescription;
+ (NSString)fallDetectionTitleDescription;
+ (NSString)fivePressesSelectionTitleDescription;
+ (NSString)getKappaThirdPartyDisplayNameForApp;
+ (NSString)holdSideButtonFooterDescription;
+ (NSString)holdSideButtonTitleDescription;
+ (NSString)phoneTriggerAnimationFooterDescription;
+ (NSString)pressSelectionGroupTitleDescription;
+ (NSString)settingsResetFollowUpBody;
+ (NSString)settingsResetFollowUpClearActionTitle;
+ (NSString)settingsResetFollowUpRedirectActionTitle;
+ (NSString)settingsResetFollowUpTitle;
+ (NSString)stewieDemoButtonTitle;
+ (NSString)stewieDemoCellText;
+ (NSString)stewieFooterDescription;
+ (NSString)stewieFooterLinkTitle;
+ (NSString)stewieGroupTitle;
+ (NSString)threePressesSelectionTitleDescription;
+ (NSString)watchTriggerAnimationFooterDescription;
+ (NSURL)crashDetectionFooterLinkURL;
+ (SABundleManagerApp)getKappaThirdPartyApp;
+ (SOSStatus)currentDeviceSOSStatus;
+ (SOSStatus)mostRecentSOSStatus;
+ (SOSStatus)pairedDeviceSOSStatus;
+ (UIImage)stewieGroupAsset;
+ (__CFBundle)getKappaThirdPartyActiveAppBundle;
+ (double)clawReleaseToCallSupport;
+ (double)getShortSOSNotificationDisplayTimestamp;
+ (double)mountProbabilityThreshold;
+ (id)_SOSDomainAccessor;
+ (id)_overrideForDefaultsKey:(id)a3 expectedClass:(Class)a4 defaultValue:(id)a5;
+ (id)_sosPrefsValueForKey:(id)a3;
+ (id)_userFriendsDomainAccessor;
+ (id)_userSOSDefaults;
+ (id)activeDevice;
+ (id)crashDetectionThirdPartyBundleId;
+ (id)crashDetectionThirdPartyStopSharingDescriptionPhoneWithAppName:(id)a3;
+ (id)crashDetectionThirdPartyStopSharingDescriptionWatchWithAppName:(id)a3;
+ (id)fetchSOSStatusWithKey:(id)a3;
+ (id)getAssetViewForWatchWithCrownOrientationOnRightSide:(BOOL)a3 layoutLeftToRight:(BOOL)a4 tintColor:(id)a5;
+ (id)numberOverrideForDefaultsKey:(id)a3 defaultValue:(id)a4;
+ (id)phoneAssetName;
+ (id)sosLocationBundle;
+ (id)stringOverrideForDefaultsKey:(id)a3 defaultValue:(id)a4;
+ (id)thirdPartySettingsSpecifiersWithTarget:(id)a3 displayName:(id)a4 forPairedDevice:(BOOL)a5 disableAction:(SEL)a6;
+ (id)thirdPartySettingsSpecifiersWithTarget:(id)a3 forApp:(id)a4 disableAction:(SEL)a5;
+ (id)watchAssetNameWithCrownOrientationOnRightSide:(BOOL)a3 layoutLeftToRight:(BOOL)a4;
+ (int64_t)SOSFlowStateForString:(id)a3;
+ (int64_t)SOSProgressionForString:(id)a3;
+ (int64_t)SOSResolutionForString:(id)a3;
+ (int64_t)SOSSelectableTriggerMechanismCapability;
+ (int64_t)SOSTriggerClickCount;
+ (int64_t)SOSTriggerMechanismForClickCount:(int64_t)a3;
+ (int64_t)SOSTriggerMechanismForString:(id)a3;
+ (int64_t)currentSOSTriggerMechanism;
+ (int64_t)defaultSOSTriggerMechanism;
+ (int64_t)getSettingsResetFollowUpState;
+ (int64_t)mostRecentlyUsedSOSTriggerMechanism;
+ (void)_setKappaTriggersEmergencySOS:(BOOL)a3;
+ (void)_setKappaTriggersEmergencySOSTinker:(BOOL)a3;
+ (void)_setSOSPrefsValue:(id)a3 forKey:(id)a4;
+ (void)activeDeviceHasMandrake;
+ (void)getAssetViewForPhoneWithCompletion:(id)a3;
+ (void)openEmergencyContactsFooterLinkOnViewController:(id)a3;
+ (void)presentConfirmationOnViewController:(id)a3 title:(id)a4 message:(id)a5 cancelTitle:(id)a6 cancelHandler:(id)a7 confirmTitle:(id)a8 confirmHandler:(id)a9;
+ (void)presentStewieDemoUnavailableAlertOnViewController:(id)a3 reason:(int64_t)a4;
+ (void)presentStewieLearnMoreLinkOnViewController:(id)a3;
+ (void)setAllowedToMessageSOSContacts:(BOOL)a3;
+ (void)setAutomaticCallCountdownEnabled:(BOOL)a3;
+ (void)setCallWithSideButtonPresses:(BOOL)a3 presentErrorAlertOnViewController:(id)a4 completion:(id)a5;
+ (void)setCallWithSideButtonPressesEnabled:(BOOL)a3;
+ (void)setCallWithVolumeLockHoldEnabled:(BOOL)a3;
+ (void)setCurrentDeviceSOSStatus:(id)a3;
+ (void)setCurrentSOSTriggerMechanism:(int64_t)a3;
+ (void)setHasMultiPressResetLogicRun:(BOOL)a3;
+ (void)setKappaThirdPartyActive:(BOOL)a3 forApp:(id)a4 forPairedDevice:(BOOL)a5 presentConfirmationOnViewController:(id)a6 completion:(id)a7;
+ (void)setKappaThirdPartyActiveApp:(BOOL)a3 presentConfirmationOnViewController:(id)a4 completion:(id)a5;
+ (void)setKappaTriggersEmergencySOS:(BOOL)a3 confirmationDelegate:(id)a4 completion:(id)a5;
+ (void)setKappaTriggersEmergencySOS:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 confirmationDelegate:(id)a5 completion:(id)a6;
+ (void)setLongPressTriggersEmergencySOS:(BOOL)a3;
+ (void)setLongPressTriggersMandrake:(BOOL)a3;
+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3;
+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 doesNewtonRequireConfirmation:(BOOL)a5 presentConfirmationOnViewController:(id)a6 completion:(id)a7;
+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 newtonEligibility:(unint64_t)a5 confirmationDelegate:(id)a6 completion:(id)a7;
+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3 newtonTriggersEmergencySOSWorkoutsOnly:(BOOL)a4;
+ (void)setNewtonTriggersEmergencySOSNumber:(id)a3;
+ (void)setNewtonTriggersEmergencySOSWorkouts:(BOOL)a3;
+ (void)setNewtonTriggersEmergencySOSWorkoutsOnly:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 newtonEligibility:(unint64_t)a5 confirmationDelegate:(id)a6 completion:(id)a7;
+ (void)setNumberOfSideButtonPresses:(int64_t)a3;
+ (void)setPairedDeviceSOSStatus:(id)a3;
+ (void)setPlayAudioDuringCountdown:(BOOL)a3;
+ (void)setSOSMessagesUrgentAlertingBypassesMute:(BOOL)a3;
+ (void)setSOSMessagesUrgentAlertingEnabled:(BOOL)a3;
+ (void)setSOSStatus:(id)a3 withKey:(id)a4;
+ (void)setSettingsResetFollowUpState:(int64_t)a3;
+ (void)setShortSOSNotificationDisplayTimestamp;
+ (void)thirdPartySettingsSpecifiersForRemoteDeviceWithTarget:(id)a3 forApp:(id)a4 disableAction:(SEL)a5 withCompletion:(id)a6;
@end

@implementation SOSUtilities

+ (id)_userSOSDefaults
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.SOS"];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.SOS"];
  }

  return v5;
}

+ (BOOL)activeDeviceSupportsNewtonWorkoutsOnly
{
  int v3 = [a1 activeDeviceSupportsNewton];
  if (v3)
  {
    int v4 = [a1 activeDevice];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"98409C1B-D02D-400B-9F63-33784EFEDA85"];
    char v6 = [v4 supportsCapability:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

+ (BOOL)activeDeviceSupportsNewton
{
  v2 = [a1 activeDevice];
  int v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"96B0DD78-1F0E-4F92-875F-DD6374FCCB10"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

+ (id)activeDevice
{
  v2 = [MEMORY[0x1E4F79EF0] sharedInstance];
  int v3 = [MEMORY[0x1E4F79EF0] activeDeviceSelectorBlock];
  char v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  v5 = [v4 firstObject];

  char v6 = [v5 valueForProperty:*MEMORY[0x1E4F79DA8]];
  if ([v6 BOOLValue]) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }
  id v8 = v7;

  return v8;
}

+ (BOOL)kappaTriggersEmergencySOS
{
  v2 = [a1 _sosPrefsValueForKey:@"SOSKappaTriggersEmergencySOSKey"];
  int v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CC38];
  }
  if ([v2 BOOLValue]) {
    char v4 = _os_feature_enabled_impl();
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)_sosPrefsValueForKey:(id)a3
{
  int v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.SOS", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);

  return v3;
}

+ (NSString)getKappaThirdPartyDisplayNameForApp
{
  v2 = [a1 getKappaThirdPartyApp];
  int v3 = [v2 getLocalizedName];

  return (NSString *)v3;
}

+ (SABundleManagerApp)getKappaThirdPartyApp
{
  v2 = [getSABundleManagerClass() crashDetectionManager];
  int v3 = [v2 approvedApps];
  char v4 = [v3 firstObject];

  return (SABundleManagerApp *)v4;
}

+ (BOOL)isKappaDetectionSupportedOnCurrentDevice
{
  if (isKappaDetectionSupportedOnCurrentDevice_onceToken != -1) {
    dispatch_once(&isKappaDetectionSupportedOnCurrentDevice_onceToken, &__block_literal_global_912);
  }
  return isKappaDetectionSupportedOnCurrentDevice___kappaDetectionAvailable;
}

+ (id)_SOSDomainAccessor
{
  id v3 = objc_alloc(MEMORY[0x1E4F79CD8]);
  char v4 = [a1 activeDevice];
  v5 = (void *)[v3 initWithDomain:@"com.apple.SOS" pairedDevice:v4];

  return v5;
}

+ (id)_userFriendsDomainAccessor
{
  id v3 = objc_alloc(MEMORY[0x1E4F79CD8]);
  char v4 = [a1 activeDevice];
  v5 = (void *)[v3 initWithDomain:@"com.apple.mobilephone" pairedDevice:v4];

  return v5;
}

+ (void)_setSOSPrefsValue:(id)a3 forKey:(id)a4
{
}

+ (BOOL)_synchronizeSOSPrefs
{
  return CFPreferencesSynchronize(@"com.apple.SOS", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]) != 0;
}

+ (NSString)automaticDialingSectionDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"WATCH_AUTO_DIAL_HEADER" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)holdSideButtonTitleDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"WATCH_LONG_PRESS_TRIGGERS_SOS_LABEL" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)holdSideButtonFooterDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"WATCH_PRESS_AND_HOLD_FOOTER" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (BOOL)longPressTriggersEmergencySOS
{
  v2 = [a1 _userFriendsDomainAccessor];
  uint64_t v3 = [v2 objectForKey:@"SOSLongPressTriggersEmergencySOSKey"];
  if (v3) {
    char v4 = (void *)v3;
  }
  else {
    char v4 = (void *)MEMORY[0x1E4F1CC38];
  }
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (void)setLongPressTriggersEmergencySOS:(BOOL)a3
{
  BOOL v3 = a3;
  +[SOSCoreAnalyticsReporter reportSOSLongPressTriggersEmergencySOS:](SOSCoreAnalyticsReporter, "reportSOSLongPressTriggersEmergencySOS:");
  char v5 = [a1 _userFriendsDomainAccessor];
  char v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"SOSLongPressTriggersEmergencySOSKey"];

  v7 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SOSUtilities_setLongPressTriggersEmergencySOS___block_invoke;
  block[3] = &unk_1E6064200;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __49__SOSUtilities_setLongPressTriggersEmergencySOS___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) synchronize];
  id v3 = (id)objc_opt_new();
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"SOSLongPressTriggersEmergencySOSKey"];
  [v3 synchronizeNanoDomain:@"com.apple.mobilephone" keys:v2];
}

+ (NSString)fallDetectionTitleDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SOS_FALL_DETECTION_TITLE" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)fallDetectionAlwaysOnTitleDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SOS_NEWTON_MODE_ALWAYS_ON" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)fallDetectionOnlyDuringWorkoutsTitleDescription
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SOS_NEWTON_MODE_WORKOUTS_ONLY" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)fallDetectionFooterDescription
{
  if ([a1 activeDeviceSupportsNewtonWorkoutsOnly])
  {
    if (+[SOSUtilities newtonTriggersEmergencySOS])
    {
      if (+[SOSUtilities newtonTriggersEmergencySOSWorkouts])
      {
        v2 = @"SOS_NEWTON_FOOTER_ENABLED_WORKOUTS_ONLY";
      }
      else
      {
        v2 = @"SOS_NEWTON_FOOTER_ENABLED_ALWAYS";
      }
    }
    else
    {
      v2 = @"SOS_NEWTON_FOOTER_DISABLED";
    }
  }
  else
  {
    v2 = @"SOS_NEWTON_FOOTER";
  }
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = [v3 localizedStringForKey:v2 value:&stru_1F0C40F10 table:0];

  return (NSString *)v4;
}

+ (NSNumber)newtonTriggersEmergencySOSNumber
{
  v2 = [a1 _SOSDomainAccessor];
  id v3 = [v2 objectForKey:@"SOSNewtonTriggersEmergencySOSKey"];

  return (NSNumber *)v3;
}

+ (void)setNewtonTriggersEmergencySOSNumber:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v12 = [v4 BOOLValue];
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "newton status change: %d", buf, 8u);
  }

  char v6 = [a1 _SOSDomainAccessor];
  v7 = [v6 objectForKey:@"SOSNewtonTriggersEmergencySOSKey"];
  if (([v7 isEqual:v4] & 1) == 0)
  {
    +[SOSCoreAnalyticsReporter reportSOSAutomaticNewtonEnabled:](SOSCoreAnalyticsReporter, "reportSOSAutomaticNewtonEnabled:", [v4 BOOLValue]);
    [v6 setObject:v4 forKey:@"SOSNewtonTriggersEmergencySOSKey"];
    id v8 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SOSUtilities_setNewtonTriggersEmergencySOSNumber___block_invoke;
    block[3] = &unk_1E6064200;
    id v10 = v6;
    dispatch_async(v8, block);
  }
}

void __52__SOSUtilities_setNewtonTriggersEmergencySOSNumber___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) synchronize];
  v2 = objc_opt_new();
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"SOSNewtonTriggersEmergencySOSKey"];
  [v2 synchronizeNanoDomain:@"com.apple.SOS" keys:v3];

  id v4 = MEMORY[0x1E4F14428];

  dispatch_async(v4, &__block_literal_global_1);
}

void __52__SOSUtilities_setNewtonTriggersEmergencySOSNumber___block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SOSNewtonStateChangedNotification", 0, 0, 1u);
}

+ (BOOL)shouldSkipNewtonCall
{
  v2 = +[SOSUtilities _userSOSDefaults];
  char v3 = [v2 BOOLForKey:@"SkipNewtonCall"];

  return v3;
}

+ (BOOL)shouldAllowSOSStatusReset
{
  v2 = +[SOSUtilities _sosPrefsValueForKey:@"AllowSOSStatusReset"];
  char v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (int64_t)SOSTriggerMechanismForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SOSTriggerMechanismNone"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"SOSTriggerMechanismThreeClicks"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"SOSTriggerMechanismFiveClicks"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"SOSTriggerMechanismVolumeLockHold"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"SOSTriggerMechanismButtonTrigger"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"SOSTriggerMechanismNewton"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"SOSTriggerMechanismCinnamon"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"SOSTriggerMechanismKappa"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"SOSTriggerMechanismMandrake"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"SOSTriggerMechanismUnknown"])
  {
    int64_t v4 = 9;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)SOSProgressionForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SOSProgressionUnknown"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"SOSProgressionSOSTriggered"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"SOSProgressionThirdParty"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"SOSProgressionFlowStateUpdate"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)SOSResolutionForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SOSResolutionNone"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"SOSResolutionSystemCompleted"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"SOSResolutionUserCompleted"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"SOSResolutionUserDismissed"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"SOSResolutionUserDisabled"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)SOSFlowStateForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SOSFlowStateNone"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateUserCheckIn"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateCallCountdown"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateCallUserInitiated"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateCallAutoInitiated"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateContactCountdown"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateCancelled"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateDone"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateVoiceLoopTester"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateMedicalID"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateUnresponsiveResting"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateStewieResting"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateMotionCancelled"])
  {
    int64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateSliderView"])
  {
    int64_t v4 = 13;
  }
  else if ([v3 isEqualToString:@"SOSFlowStateTriggered"])
  {
    int64_t v4 = 14;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)newtonTriggersEmergencySOSWorkouts
{
  v2 = [a1 _SOSDomainAccessor];
  id v3 = [v2 objectForKey:@"SOSNewtonWorkoutTriggersEmergencySOSKey"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)hasNewtonTriggersEmergencySOSWorkoutsSetting
{
  v2 = [a1 _SOSDomainAccessor];
  id v3 = [v2 objectForKey:@"SOSNewtonWorkoutTriggersEmergencySOSKey"];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (void)setNewtonTriggersEmergencySOSWorkouts:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "newton workouts status change: %d", buf, 8u);
  }

  char v6 = [a1 _SOSDomainAccessor];
  v7 = [v6 objectForKey:@"SOSNewtonWorkoutTriggersEmergencySOSKey"];
  if ([v7 BOOLValue] != v3)
  {
    id v8 = [NSNumber numberWithBool:v3];
    [v6 setObject:v8 forKey:@"SOSNewtonWorkoutTriggersEmergencySOSKey"];

    v9 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SOSUtilities_setNewtonTriggersEmergencySOSWorkouts___block_invoke;
    block[3] = &unk_1E6064200;
    id v11 = v6;
    dispatch_async(v9, block);
  }
}

void __54__SOSUtilities_setNewtonTriggersEmergencySOSWorkouts___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) synchronize];
  v2 = objc_opt_new();
  BOOL v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"SOSNewtonWorkoutTriggersEmergencySOSKey"];
  [v2 synchronizeNanoDomain:@"com.apple.SOS" keys:v3];

  BOOL v4 = MEMORY[0x1E4F14428];

  dispatch_async(v4, &__block_literal_global_568);
}

void __54__SOSUtilities_setNewtonTriggersEmergencySOSWorkouts___block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SOSNewtonStateChangedNotification", 0, 0, 1u);
}

+ (BOOL)newtonTriggersEmergencySOS
{
  uint64_t v2 = [a1 newtonTriggersEmergencySOSNumber];
  BOOL v3 = (void *)v2;
  BOOL v4 = (void *)MEMORY[0x1E4F1CC28];
  if (v2) {
    BOOL v4 = (void *)v2;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [a1 setNewtonTriggersEmergencySOSNumber:v4];
}

+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 doesNewtonRequireConfirmation:(BOOL)a5 presentConfirmationOnViewController:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v10 = a3;
  id v12 = a6;
  id v13 = a7;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke;
  v40[3] = &unk_1E6064250;
  BOOL v44 = v10;
  BOOL v45 = a4;
  id v43 = a1;
  id v14 = v13;
  id v42 = v14;
  id v15 = v12;
  id v41 = v15;
  uint64_t v16 = MEMORY[0x1B3EC08A0](v40);
  v17 = (void *)v16;
  if (v10 && v8)
  {
    id UIAlertControllerClass = getUIAlertControllerClass();
    v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_TITLE" value:&stru_1F0C40F10 table:0];
    v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_DETAIL" value:&stru_1F0C40F10 table:0];
    v23 = [UIAlertControllerClass alertControllerWithTitle:v20 message:v22 preferredStyle:1];

    id UIAlertActionClass = getUIAlertActionClass();
    v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_CANCEL" value:&stru_1F0C40F10 table:0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_3;
    v37[3] = &unk_1E6064278;
    id v39 = a1;
    id v38 = v14;
    v27 = [UIAlertActionClass actionWithTitle:v26 style:1 handler:v37];
    [v23 addAction:v27];

    id v28 = getUIAlertActionClass();
    v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_OK" value:&stru_1F0C40F10 table:0];
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_4;
    v35 = &unk_1E60642A0;
    id v36 = v17;
    v31 = [v28 actionWithTitle:v30 style:0 handler:&v32];
    objc_msgSend(v23, "addAction:", v31, v32, v33, v34, v35);

    [v15 presentViewController:v23 animated:1 completion:0];
  }
  else
  {
    (*(void (**)(uint64_t))(v16 + 16))(v16);
  }
}

void __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 57))
  {
    id UIAlertControllerClass = getUIAlertControllerClass();
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"SOS_WRIST_DETECTION_OFF_TITLE" value:&stru_1F0C40F10 table:0];
    char v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"SOS_WRIST_DETECTION_OFF_DETAIL" value:&stru_1F0C40F10 table:0];
    BOOL v8 = [UIAlertControllerClass alertControllerWithTitle:v5 message:v7 preferredStyle:1];

    id UIAlertActionClass = getUIAlertActionClass();
    BOOL v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"SOS_WRIST_DETECTION_OK" value:&stru_1F0C40F10 table:0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_2;
    v15[3] = &unk_1E6064228;
    char v17 = *(unsigned char *)(a1 + 56);
    long long v14 = *(_OWORD *)(a1 + 40);
    id v12 = (id)v14;
    long long v16 = v14;
    id v13 = [UIAlertActionClass actionWithTitle:v11 style:0 handler:v15];
    [v8 addAction:v13];

    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    [*(id *)(a1 + 48) setNewtonTriggersEmergencySOS:*(unsigned __int8 *)(a1 + 56) != 0];
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
}

uint64_t __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 40) setNewtonTriggersEmergencySOS:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 40) setNewtonTriggersEmergencySOS:0];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __147__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_doesNewtonRequireConfirmation_presentConfirmationOnViewController_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)presentConfirmationOnViewController:(id)a3 title:(id)a4 message:(id)a5 cancelTitle:(id)a6 cancelHandler:(id)a7 confirmTitle:(id)a8 confirmHandler:(id)a9
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a5;
  v21 = sos_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v15;
    _os_log_impl(&dword_1B3A94000, v21, OS_LOG_TYPE_DEFAULT, "Presenting confirmation with title: %@", buf, 0xCu);
  }

  v22 = [getUIAlertControllerClass() alertControllerWithTitle:v15 message:v20 preferredStyle:1];

  if ([v16 length])
  {
    id UIAlertActionClass = getUIAlertActionClass();
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __120__SOSUtilities_presentConfirmationOnViewController_title_message_cancelTitle_cancelHandler_confirmTitle_confirmHandler___block_invoke;
    v32[3] = &unk_1E60642A0;
    id v33 = v17;
    v24 = [UIAlertActionClass actionWithTitle:v16 style:1 handler:v32];
    [v22 addAction:v24];
  }
  if ([v18 length])
  {
    id v25 = getUIAlertActionClass();
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __120__SOSUtilities_presentConfirmationOnViewController_title_message_cancelTitle_cancelHandler_confirmTitle_confirmHandler___block_invoke_2;
    v30 = &unk_1E60642A0;
    id v31 = v19;
    v26 = [v25 actionWithTitle:v18 style:0 handler:&v27];
    objc_msgSend(v22, "addAction:", v26, v27, v28, v29, v30);
  }
  [v14 presentViewController:v22 animated:1 completion:0];
}

uint64_t __120__SOSUtilities_presentConfirmationOnViewController_title_message_cancelTitle_cancelHandler_confirmTitle_confirmHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __120__SOSUtilities_presentConfirmationOnViewController_title_message_cancelTitle_cancelHandler_confirmTitle_confirmHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (BOOL)newtonAlwaysOnRequiresConfirmationForEligibility:(unint64_t)a3
{
  return a3 != 0;
}

+ (BOOL)defaultToWorkoutsOnlyForEligibility:(unint64_t)a3
{
  return a3 == 4;
}

+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3 newtonTriggersEmergencySOSWorkoutsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v7 = sos_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = v5;
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "setNewtonTriggersEmergencySOS:%d newtonTriggersEmergencySOSWorkoutsOnly:%d", (uint8_t *)v8, 0xEu);
  }

  [a1 setNewtonTriggersEmergencySOS:v5];
  if (v5 && v4) {
    [a1 setNewtonTriggersEmergencySOSWorkouts:1];
  }
}

+ (void)setNewtonTriggersEmergencySOS:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 newtonEligibility:(unint64_t)a5 confirmationDelegate:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  id v14 = sos_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)BOOL v45 = v10;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v9;
    *(_WORD *)v46 = 2048;
    *(void *)&v46[2] = a5;
    __int16 v47 = 2112;
    id v48 = v12;
    _os_log_impl(&dword_1B3A94000, v14, OS_LOG_TYPE_DEFAULT, "setNewtonTriggersEmergencySOS:%d isWristDetectionEnabled:%d newtonEligibility:%zd confirmationDelegate:%@", buf, 0x22u);
  }

  int v15 = [a1 newtonTriggersEmergencySOSWorkouts];
  id v16 = sos_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)BOOL v45 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmation"
                     "Delegate:completion:]";
    *(_WORD *)&v45[8] = 1024;
    *(_DWORD *)v46 = v15;
    _os_log_impl(&dword_1B3A94000, v16, OS_LOG_TYPE_DEFAULT, "%s - newtonTriggersEmergencySOSWorkoutsOnly:%d", buf, 0x12u);
  }

  if (([a1 hasNewtonTriggersEmergencySOSWorkoutsSetting] & 1) == 0
    && [a1 activeDeviceSupportsNewtonWorkoutsOnly])
  {
    int v15 = [a1 defaultToWorkoutsOnlyForEligibility:a5];
    id v17 = sos_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)BOOL v45 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmati"
                       "onDelegate:completion:]";
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)v46 = v15;
      _os_log_impl(&dword_1B3A94000, v17, OS_LOG_TYPE_DEFAULT, "%s - !hasNewtonTriggersEmergencySOSWorkoutsSetting, set default newtonTriggersEmergencySOSWorkoutsOnly:%d", buf, 0x12u);
    }
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke;
  v37[3] = &unk_1E60642F0;
  BOOL v41 = v10;
  BOOL v42 = v9;
  id v18 = v12;
  id v38 = v18;
  id v40 = a1;
  char v43 = v15;
  id v19 = v13;
  id v39 = v19;
  id v20 = (void (**)(void))MEMORY[0x1B3EC08A0](v37);
  if (v10 && (v15 & 1) == 0 && [a1 newtonAlwaysOnRequiresConfirmationForEligibility:a5])
  {
    v21 = sos_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)BOOL v45 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmati"
                       "onDelegate:completion:]";
      _os_log_impl(&dword_1B3A94000, v21, OS_LOG_TYPE_DEFAULT, "%s - presenting eligibility-related confirmation", buf, 0xCu);
    }

    v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v29 = [v30 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_TITLE" value:&stru_1F0C40F10 table:0];
    v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_DETAIL" value:&stru_1F0C40F10 table:0];
    v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v25 = [v24 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_CANCEL" value:&stru_1F0C40F10 table:0];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_592;
    v33[3] = &unk_1E6064318;
    id v35 = a1;
    char v36 = 0;
    id v34 = v19;
    v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v27 = [v26 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_OK" value:&stru_1F0C40F10 table:0];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_593;
    v31[3] = &unk_1E6064340;
    uint64_t v32 = v20;
    [v18 presentConfirmationWithTitle:v29 message:v23 cancelTitle:v25 cancelHandler:v33 confirmTitle:v27 confirmHandler:v31];
  }
  else
  {
    uint64_t v28 = sos_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)BOOL v45 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmati"
                       "onDelegate:completion:]";
      _os_log_impl(&dword_1B3A94000, v28, OS_LOG_TYPE_DEFAULT, "%s - no eligibility confirmation needed", buf, 0xCu);
    }

    v20[2](v20);
  }
}

void __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 57))
  {
    BOOL v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmationDelegate:"
            "completion:]_block_invoke";
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s - presenting wrist detection notification", buf, 0xCu);
    }

    BOOL v4 = *(void **)(a1 + 32);
    BOOL v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v6 = [v5 localizedStringForKey:@"SOS_WRIST_DETECTION_OFF_TITLE" value:&stru_1F0C40F10 table:0];
    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v8 = [v7 localizedStringForKey:@"SOS_WRIST_DETECTION_OFF_DETAIL" value:&stru_1F0C40F10 table:0];
    BOOL v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v10 = [v9 localizedStringForKey:@"SOS_WRIST_DETECTION_OK" value:&stru_1F0C40F10 table:0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_591;
    v13[3] = &unk_1E60642C8;
    char v15 = *(unsigned char *)(a1 + 56);
    char v16 = *(unsigned char *)(a1 + 58);
    long long v12 = *(_OWORD *)(a1 + 40);
    id v11 = (id)v12;
    long long v14 = v12;
    [v4 presentConfirmationWithTitle:v6 message:v8 cancelTitle:0 cancelHandler:0 confirmTitle:v10 confirmHandler:v13];
  }
  else
  {
    uint64_t v2 = sos_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmationDelegate:"
            "completion:]_block_invoke";
      _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "%s - no wrist detection notification needed", buf, 0xCu);
    }

    [*(id *)(a1 + 48) setNewtonTriggersEmergencySOS:*(unsigned __int8 *)(a1 + 56) newtonTriggersEmergencySOSWorkoutsOnly:*(unsigned __int8 *)(a1 + 58)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_591(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmationDelegate:com"
         "pletion:]_block_invoke";
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "%s - ack'd", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 40) setNewtonTriggersEmergencySOS:*(unsigned __int8 *)(a1 + 48) newtonTriggersEmergencySOSWorkoutsOnly:*(unsigned __int8 *)(a1 + 49)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_592(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmationDelegate:com"
         "pletion:]_block_invoke";
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "%s - canceled", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 40) setNewtonTriggersEmergencySOS:0 newtonTriggersEmergencySOSWorkoutsOnly:*(unsigned __int8 *)(a1 + 48)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __120__SOSUtilities_setNewtonTriggersEmergencySOS_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_593(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "+[SOSUtilities setNewtonTriggersEmergencySOS:isWristDetectionEnabled:newtonEligibility:confirmationDelegate:com"
         "pletion:]_block_invoke";
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "%s - confirmed", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)setNewtonTriggersEmergencySOSWorkoutsOnly:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 newtonEligibility:(unint64_t)a5 confirmationDelegate:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = (void (**)(id, uint64_t))a7;
  long long v14 = sos_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)uint64_t v32 = v10;
    *(_WORD *)&void v32[4] = 1024;
    *(_DWORD *)&v32[6] = v9;
    __int16 v33 = 2048;
    unint64_t v34 = a5;
    __int16 v35 = 2112;
    id v36 = v12;
    _os_log_impl(&dword_1B3A94000, v14, OS_LOG_TYPE_DEFAULT, "setNewtonTriggersEmergencySOSWorkoutsOnly:%d isWristDetectionEnabled:%d newtonEligibility:%zd confirmationDelegate:%@", buf, 0x22u);
  }

  if (v10 || ![a1 newtonAlwaysOnRequiresConfirmationForEligibility:a5])
  {
    v21 = sos_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v32 = "+[SOSUtilities setNewtonTriggersEmergencySOSWorkoutsOnly:isWristDetectionEnabled:newtonEligibilit"
                       "y:confirmationDelegate:completion:]";
      _os_log_impl(&dword_1B3A94000, v21, OS_LOG_TYPE_DEFAULT, "%s - no eligibility confirmation needed", buf, 0xCu);
    }

    [a1 setNewtonTriggersEmergencySOSWorkouts:v10];
    v13[2](v13, 1);
  }
  else
  {
    char v15 = sos_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v32 = "+[SOSUtilities setNewtonTriggersEmergencySOSWorkoutsOnly:isWristDetectionEnabled:newtonEligibilit"
                       "y:confirmationDelegate:completion:]";
      _os_log_impl(&dword_1B3A94000, v15, OS_LOG_TYPE_DEFAULT, "%s - presenting eligibility-related confirmation", buf, 0xCu);
    }

    v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v22 = [v24 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_TITLE" value:&stru_1F0C40F10 table:0];
    v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v16 = [v23 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_DETAIL" value:&stru_1F0C40F10 table:0];
    id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v18 = [v17 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_CANCEL" value:&stru_1F0C40F10 table:0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __132__SOSUtilities_setNewtonTriggersEmergencySOSWorkoutsOnly_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke;
    v29[3] = &unk_1E6064340;
    v30 = v13;
    uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v20 = [v19 localizedStringForKey:@"SOS_MODE_NEWTON_CONFIRM_OK" value:&stru_1F0C40F10 table:0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __132__SOSUtilities_setNewtonTriggersEmergencySOSWorkoutsOnly_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_594;
    v25[3] = &unk_1E6064318;
    id v27 = a1;
    BOOL v28 = v10;
    v26 = v30;
    [v12 presentConfirmationWithTitle:v22 message:v16 cancelTitle:v18 cancelHandler:v29 confirmTitle:v20 confirmHandler:v25];
  }
}

uint64_t __132__SOSUtilities_setNewtonTriggersEmergencySOSWorkoutsOnly_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "+[SOSUtilities setNewtonTriggersEmergencySOSWorkoutsOnly:isWristDetectionEnabled:newtonEligibility:confirmation"
         "Delegate:completion:]_block_invoke";
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "%s - canceled", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __132__SOSUtilities_setNewtonTriggersEmergencySOSWorkoutsOnly_isWristDetectionEnabled_newtonEligibility_confirmationDelegate_completion___block_invoke_594(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "+[SOSUtilities setNewtonTriggersEmergencySOSWorkoutsOnly:isWristDetectionEnabled:newtonEligibility:confirmation"
         "Delegate:completion:]_block_invoke";
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "%s - confirmed", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 40) setNewtonTriggersEmergencySOSWorkouts:*(unsigned __int8 *)(a1 + 48)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)isSmallScreen
{
  if (isSmallScreen_onceToken != -1) {
    dispatch_once(&isSmallScreen_onceToken, &__block_literal_global_596);
  }
  return isSmallScreen_isSmallScreen;
}

void __29__SOSUtilities_isSmallScreen__block_invoke()
{
  id v6 = [getUIScreenClass() mainScreen];
  [v6 nativeBounds];
  double v1 = v0;
  [v6 scale];
  double v3 = v2;
  int v4 = [v6 traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (!v5 && v1 / v3 == 568.0) {
    isSmallScreen_isSmallScreen = 1;
  }
}

+ (id)phoneAssetName
{
  BOOL v3 = +[SOSUtilities canTriggerSOSWithVolumeLockHold];
  int v4 = NSString;
  if (v3)
  {
    uint64_t v5 = [getUIScreenClass() mainScreen];
    [v5 scale];
    v7 = objc_msgSend(v4, "stringWithFormat:", @"home_hold@%dx", (int)v6);

    if (+[SOSUtilities deviceHasHomeButton]) {
      goto LABEL_12;
    }
    BOOL v8 = NSString;
    if ([a1 deviceHasSlot]) {
      BOOL v9 = @"slot_";
    }
    else {
      BOOL v9 = &stru_1F0C40F10;
    }
    BOOL v10 = [getUIScreenClass() mainScreen];
    [v10 scale];
    uint64_t v12 = [v8 stringWithFormat:@"%@homeless_hold@%dx", v9, (int)v11];

    v7 = (void *)v12;
  }
  else
  {
    if ([a1 isSmallScreen]) {
      id v13 = @"top_";
    }
    else {
      id v13 = &stru_1F0C40F10;
    }
    uint64_t v14 = [a1 SOSTriggerClickCount];
    BOOL v10 = [getUIScreenClass() mainScreen];
    [v10 scale];
    v7 = [v4 stringWithFormat:@"home_%@%ld@%dx", v13, v14, (int)v15];
  }

LABEL_12:

  return v7;
}

+ (void)getAssetViewForPhoneWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 phoneAssetName];
  double v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "Loading SOSTriggerAnimation asset %@", (uint8_t *)&buf, 0xCu);
  }

  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v8 = [v7 URLForResource:v5 withExtension:@"caar"];

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2050000000;
  BOOL v9 = (void *)get_UICAPackageViewClass_softClass;
  uint64_t v20 = get_UICAPackageViewClass_softClass;
  if (!get_UICAPackageViewClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v22 = __get_UICAPackageViewClass_block_invoke;
    v23 = &unk_1E60640A0;
    v24 = &v17;
    __get_UICAPackageViewClass_block_invoke((uint64_t)&buf);
    BOOL v9 = (void *)v18[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v17, 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__SOSUtilities_getAssetViewForPhoneWithCompletion___block_invoke;
  v13[3] = &unk_1E6064368;
  id v15 = v4;
  id v16 = a1;
  id v14 = v5;
  id v11 = v4;
  id v12 = v5;
  [v10 loadPackageViewWithContentsOfURL:v8 publishedObjectViewClassMap:0 completion:v13];
}

void __51__SOSUtilities_getAssetViewForPhoneWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id UIImageClass = getUIImageClass();
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = [UIImageClass imageNamed:v9 inBundle:v10 withConfiguration:0];
    id v12 = [v11 imageWithRenderingMode:2];

    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    id v13 = (void *)getUIImageViewClass_softClass;
    uint64_t v25 = getUIImageViewClass_softClass;
    if (!getUIImageViewClass_softClass)
    {
      *(void *)&v20.a = MEMORY[0x1E4F143A8];
      *(void *)&v20.b = 3221225472;
      *(void *)&v20.c = __getUIImageViewClass_block_invoke;
      *(void *)&v20.d = &unk_1E60640A0;
      *(void *)&v20.tx = &v22;
      __getUIImageViewClass_block_invoke((uint64_t)&v20);
      id v13 = (void *)v23[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v22, 8);
    id v7 = (id)[[v14 alloc] initWithImage:v12];
  }
  id v15 = [getUIScreenClass() mainScreen];
  [v15 scale];
  float v17 = 1.0 / v16;

  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v20.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v20.c = v18;
  *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v21, &v20, v17, v17);
  CGAffineTransform v19 = v21;
  [v7 setTransform:&v19];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (NSString)phoneTriggerAnimationFooterDescription
{
  if ([a1 canTriggerSOSWithVolumeLockHold])
  {
    int v3 = [a1 autoCallRequiresSIM];
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (v3) {
      id v5 = @"PHONE_TRIGGER_ANIMATION_VOLUME_LOCK_HOLD_FOOTER_REQUIRE_SIM";
    }
    else {
      id v5 = @"PHONE_TRIGGER_ANIMATION_VOLUME_LOCK_HOLD_FOOTER";
    }
  }
  else
  {
    int64_t v6 = +[SOSUtilities SOSSelectableTriggerMechanismCapability];
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (v6 == 2) {
      id v5 = @"PHONE_TRIGGER_ANIMATION_INDIA_CLICKS_FOOTER";
    }
    else {
      id v5 = @"PHONE_TRIGGER_ANIMATION_FIVE_CLICKS_FOOTER";
    }
  }
  id v7 = [v4 localizedStringForKey:v5 value:&stru_1F0C40F10 table:0];

  return (NSString *)v7;
}

+ (id)watchAssetNameWithCrownOrientationOnRightSide:(BOOL)a3 layoutLeftToRight:(BOOL)a4
{
  id v4 = @"crownLeft";
  if (a3) {
    id v4 = @"crownRight";
  }
  id v5 = @"RTL";
  if (a4) {
    id v5 = @"LTR";
  }
  return (id)[NSString stringWithFormat:@"%@_%@_%@", @"watch", v4, v5];
}

+ (id)getAssetViewForWatchWithCrownOrientationOnRightSide:(BOOL)a3 layoutLeftToRight:(BOOL)a4 tintColor:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = [a1 watchAssetNameWithCrownOrientationOnRightSide:v6 layoutLeftToRight:v5];
  id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = [getUIImageClass() imageNamed:v9 inBundle:v10 withConfiguration:0];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v12 = (void *)getSOSUIAnimatingSpriteImageViewClass_softClass;
  uint64_t v26 = getSOSUIAnimatingSpriteImageViewClass_softClass;
  if (!getSOSUIAnimatingSpriteImageViewClass_softClass)
  {
    *(void *)&v21.a = MEMORY[0x1E4F143A8];
    *(void *)&v21.b = 3221225472;
    *(void *)&v21.c = __getSOSUIAnimatingSpriteImageViewClass_block_invoke;
    *(void *)&v21.d = &unk_1E60640A0;
    *(void *)&v21.tx = &v23;
    __getSOSUIAnimatingSpriteImageViewClass_block_invoke((uint64_t)&v21);
    id v12 = (void *)v24[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v23, 8);
  id v14 = objc_msgSend([v13 alloc], "initWithFrame:", 0.0, 0.0, 320.0, 320.0);
  id v15 = [getUIScreenClass() mainScreen];
  [v15 scale];
  float v17 = 1.0 / v16;

  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v21.c = v18;
  *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v22, &v21, v17, v17);
  CGAffineTransform v20 = v22;
  [v14 setTransform:&v20];
  [v14 setTintColor:v8];
  [v14 setSpriteFrameCount:350];
  [v14 setSpriteColumnCount:18];
  [v14 setSpriteImage:v11];
  [v14 startAnimating];

  return v14;
}

+ (NSString)watchTriggerAnimationFooterDescription
{
  double v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v3 = [v2 localizedStringForKey:@"WATCH_TRIGGER_ANIMATION_FOOTER" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (int64_t)mostRecentlyUsedSOSTriggerMechanism
{
  double v2 = +[SOSUtilities mostRecentSOSStatus];
  int v3 = v2;
  if (v2) {
    int64_t v4 = [v2 trigger];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)autoCallRequiresSIM
{
  return [a1 isIndiaSKU] ^ 1;
}

+ (BOOL)isIndiaSKU
{
  double v2 = (void *)MGCopyAnswer();
  char v3 = [v2 isEqualToString:@"HN"];

  return v3;
}

+ (BOOL)supportsSOSWithSideButtonSelectableNumberOfClicks
{
  return (unint64_t)(+[SOSUtilities SOSSelectableTriggerMechanismCapability]- 2) < 3;
}

+ (BOOL)canTriggerSOSWithSideButton
{
  uint64_t v3 = [a1 currentSOSTriggerMechanism];
  if (v3 != 1) {
    LOBYTE(v3) = [a1 currentSOSTriggerMechanism] == 2;
  }
  return v3;
}

+ (int64_t)SOSTriggerClickCount
{
  uint64_t v2 = [a1 currentSOSTriggerMechanism];
  int64_t v3 = 5;
  if (v2 != 2) {
    int64_t v3 = 0;
  }
  if (v2 == 1) {
    return 3;
  }
  else {
    return v3;
  }
}

+ (NSString)callWithSideButtonTitleDescription
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int64_t v3 = [v2 localizedStringForKey:@"CALL_WITH_SIDE_BUTTON" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)callWithSideButtonFooterDescription
{
  if ([a1 SOSSelectableTriggerMechanismCapability] == 4)
  {
    int64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int64_t v4 = v3;
    BOOL v5 = @"ALSO_WORKS_THREE_CLICKS_FOOTER";
LABEL_5:
    BOOL v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:0];

    goto LABEL_7;
  }
  if ([a1 SOSSelectableTriggerMechanismCapability] == 3)
  {
    int64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int64_t v4 = v3;
    BOOL v5 = @"ALSO_WORKS_FIVE_CLICKS_FOOTER";
    goto LABEL_5;
  }
  BOOL v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

+ (BOOL)_potentialForAccessibilityConflict
{
  if ([a1 deviceHasHomeButton]) {
    return 0;
  }

  return [a1 mustAllowThreeClickTrigger];
}

+ (BOOL)_hasAccessibilityConflict
{
  uint64_t v2 = (void *)_AXSTripleClickCopyOptions();
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (void)setCallWithSideButtonPresses:(BOOL)a3 presentErrorAlertOnViewController:(id)a4 completion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  if (!a3)
  {
    [a1 setCallWithSideButtonPressesEnabled:0];
    if ([a1 _potentialForAccessibilityConflict])
    {
      id v25 = a1;
      uint64_t v26 = 3;
LABEL_9:
      [v25 setCurrentSOSTriggerMechanism:v26];
    }
LABEL_10:
    v9[2](v9, 1);
    goto LABEL_11;
  }
  if (![a1 _potentialForAccessibilityConflict]
    || ![a1 _hasAccessibilityConflict])
  {
    [a1 setCallWithSideButtonPressesEnabled:1];
    if ([a1 _potentialForAccessibilityConflict])
    {
      id v25 = a1;
      uint64_t v26 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id UIAlertControllerClass = getUIAlertControllerClass();
  id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"TURN_OFF_ACCESSIBILITY_TITLE" value:&stru_1F0C40F10 table:0];
  id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"TURN_OFF_ACCESSIBILITY_MESSAGE" value:&stru_1F0C40F10 table:0];
  id v15 = [UIAlertControllerClass alertControllerWithTitle:v12 message:v14 preferredStyle:1];

  id UIAlertActionClass = getUIAlertActionClass();
  float v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  long long v18 = [v17 localizedStringForKey:@"TURN_OFF_ACCESSIBILITY_CANCEL" value:&stru_1F0C40F10 table:0];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __90__SOSUtilities_setCallWithSideButtonPresses_presentErrorAlertOnViewController_completion___block_invoke;
  v34[3] = &unk_1E60642A0;
  CGAffineTransform v19 = v9;
  __int16 v35 = v19;
  CGAffineTransform v20 = [UIAlertActionClass actionWithTitle:v18 style:1 handler:v34];
  [v15 addAction:v20];

  id v21 = getUIAlertActionClass();
  CGAffineTransform v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v23 = [v22 localizedStringForKey:@"TURN_OFF_ACCESSIBILITY_CONTINUE" value:&stru_1F0C40F10 table:0];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __90__SOSUtilities_setCallWithSideButtonPresses_presentErrorAlertOnViewController_completion___block_invoke_2;
  v30 = &unk_1E6064228;
  id v32 = a1;
  BOOL v33 = a3;
  id v31 = v19;
  uint64_t v24 = [v21 actionWithTitle:v23 style:0 handler:&v27];
  objc_msgSend(v15, "addAction:", v24, v27, v28, v29, v30);

  [v8 presentViewController:v15 animated:1 completion:0];
LABEL_11:
}

uint64_t __90__SOSUtilities_setCallWithSideButtonPresses_presentErrorAlertOnViewController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__SOSUtilities_setCallWithSideButtonPresses_presentErrorAlertOnViewController_completion___block_invoke_2(uint64_t a1)
{
  _AXSSetTripleClickOptions();
  [*(id *)(a1 + 40) setCallWithSideButtonPressesEnabled:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 40) setCurrentSOSTriggerMechanism:1];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

+ (void)setNumberOfSideButtonPresses:(int64_t)a3
{
  if ([a1 mustAllowThreeClickTrigger]
    && ![a1 isDeviceD2xOrNewer])
  {
    if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
    {
      [a1 setCurrentSOSTriggerMechanism:a3];
    }
    else
    {
      BOOL v6 = sos_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[SOSUtilities setNumberOfSideButtonPresses:](a3, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  else
  {
    BOOL v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SOSUtilities setNumberOfSideButtonPresses:](v5);
    }
  }
}

+ (int64_t)currentSOSTriggerMechanism
{
  BOOL v3 = [a1 _sosPrefsValueForKey:@"SOSTriggerMechanismKey"];
  int64_t v4 = [v3 integerValue];

  switch(v4)
  {
    case 0:
      goto LABEL_9;
    case 1:
      if ([a1 mustAllowThreeClickTrigger]) {
        return 1;
      }
      int64_t v7 = 2;
      goto LABEL_22;
    case 2:
      if ([a1 mustAllowThreeClickTrigger])
      {
        int v5 = [a1 isDeviceD2xOrNewer];
        goto LABEL_18;
      }
      return 2;
    case 3:
      if (([a1 isDeviceD2xOrNewer] & 1) == 0)
      {
LABEL_9:
        if ([a1 mustAllowThreeClickTrigger])
        {
          Boolean keyExistsAndHasValidFormat = 0;
          CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"SBNumberOfPressesToTriggerSOS", @"com.apple.springboard", &keyExistsAndHasValidFormat);
          if (keyExistsAndHasValidFormat)
          {
            int64_t v7 = [a1 SOSTriggerMechanismForClickCount:AppIntegerValue];
            if ([a1 isDeviceD2xOrNewer])
            {
              uint64_t v8 = [a1 _sosPrefsValueForKey:@"SOSTriggerMechanismD2xKey"];
              uint64_t v9 = [v8 integerValue];

              if (!v9)
              {
                [a1 _setSOSPrefsValue:&unk_1F0C4A9A8 forKey:@"SOSTriggerMechanismD2xKey"];
                if ([a1 mustAllowThreeClickTrigger])
                {
                  if (v7 == 2)
                  {
                    int64_t v7 = 1;
                    goto LABEL_21;
                  }
                }
              }
            }
            if (v7) {
              goto LABEL_21;
            }
          }
        }
        int64_t v7 = [a1 defaultSOSTriggerMechanism];
        goto LABEL_21;
      }
      if ([a1 _potentialForAccessibilityConflict]) {
        return 3;
      }
      int v5 = [a1 mustAllowThreeClickTrigger];
LABEL_18:
      if (v5) {
        int64_t v7 = 1;
      }
      else {
        int64_t v7 = 2;
      }
LABEL_21:
      if (v4 != v7)
      {
LABEL_22:
        [a1 setCurrentSOSTriggerMechanism:v7];
        return v7;
      }
      return v4;
    default:
      return v4;
  }
}

+ (void)setCurrentSOSTriggerMechanism:(int64_t)a3
{
  int64_t v4 = [NSNumber numberWithInteger:a3];
  [a1 _setSOSPrefsValue:v4 forKey:@"SOSTriggerMechanismKey"];

  +[SOSManager notifySOSTriggerMechanismChanged];
}

+ (int64_t)SOSTriggerMechanismForClickCount:(int64_t)a3
{
  if (a3 == 3) {
    return 1;
  }
  else {
    return 2 * (a3 == 5);
  }
}

+ (int64_t)defaultSOSTriggerMechanism
{
  if ([a1 mustAllowThreeClickTrigger]) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (BOOL)deviceHasSlot
{
  if (deviceHasSlot_onceToken != -1) {
    dispatch_once(&deviceHasSlot_onceToken, &__block_literal_global_686);
  }
  return deviceHasSlot___supportsDynamicIsland;
}

uint64_t __29__SOSUtilities_deviceHasSlot__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  deviceHasSlot___supportsDynamicIsland = result;
  return result;
}

+ (BOOL)isDeviceD2xOrNewer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v15 = 414393924;
  long long v14 = xmmword_1B3AD0DD8;
  int v13 = -996295886;
  long long v12 = xmmword_1B3AD0DEC;
  int v11 = 897736383;
  long long v10 = xmmword_1B3AD0E00;
  int v9 = -453987047;
  long long v8 = xmmword_1B3AD0E14;
  int v7 = -121925081;
  long long v6 = xmmword_1B3AD0E28;
  int v5 = -1431778695;
  long long v4 = xmmword_1B3AD0E3C;
  if (MGIsDeviceOneOfType()) {
    return 1;
  }
  else {
    return objc_msgSend(a1, "deviceHasHomeButton", &v12, &v10, &v8, &v6, &v4, 0) ^ 1;
  }
}

+ (BOOL)deviceHasHomeButton
{
  if (deviceHasHomeButton_onceToken != -1) {
    dispatch_once(&deviceHasHomeButton_onceToken, &__block_literal_global_696);
  }
  return deviceHasHomeButton_deviceHasHomeButton;
}

uint64_t __35__SOSUtilities_deviceHasHomeButton__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  deviceHasHomeButton_deviceHasHomeButton = result != 2;
  return result;
}

+ (int64_t)SOSSelectableTriggerMechanismCapability
{
  int v3 = [a1 mustAllowThreeClickTrigger];
  int v4 = [a1 isDeviceD2xOrNewer];
  int64_t v5 = 1;
  if (v3) {
    int64_t v5 = 2;
  }
  int64_t v6 = 3;
  if (v3) {
    int64_t v6 = 4;
  }
  if (v4) {
    return v6;
  }
  else {
    return v5;
  }
}

+ (BOOL)shouldForceDisableAutoCallForClient:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.InCallService"];
  char v6 = [v5 BOOLForKey:@"shouldDisableSOSAutoCall"];

  if (v6)
  {
    LOBYTE(v7) = 1;
  }
  else if ([a1 autoCallRequiresSIM])
  {
    int v7 = [a1 hasActiveSIMForClient:v4] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)hasActiveSIMForClient:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v36 = 0;
  id v4 = [v3 getSubscriptionInfoWithError:&v36];
  id v5 = v36;
  char v6 = v5;
  if (v4)
  {

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    char v6 = [v4 subscriptions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (!v7)
    {
      BOOL v24 = 0;
      goto LABEL_38;
    }
    uint64_t v8 = v7;
    uint64_t v27 = v4;
    int v9 = 0;
    uint64_t v10 = *(void *)v33;
    v29 = (void *)*MEMORY[0x1E4F241F0];
    id v28 = v3;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v31 = v9;
        int v13 = [v3 getSIMStatus:v12 error:&v31];
        long long v14 = v31;

        if (v14)
        {
          int v15 = sos_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v38 = v12;
            _os_log_error_impl(&dword_1B3A94000, v15, OS_LOG_TYPE_ERROR, "Error retrieving SIM status for context: %@", buf, 0xCu);
          }
          int v9 = v14;
        }
        else if ([v29 isEqualToString:v13])
        {
          int v15 = sos_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            id v38 = v12;
            _os_log_impl(&dword_1B3A94000, v15, OS_LOG_TYPE_DEFAULT, "kCTSIMSupportSIMStatusNotInserted for context: %@", buf, 0xCu);
          }
          int v9 = 0;
        }
        else
        {
          id v30 = 0;
          int v15 = [v3 getSimLabel:v12 error:&v30];
          uint64_t v16 = v30;
          int v9 = v16;
          if (v15) {
            BOOL v17 = v16 == 0;
          }
          else {
            BOOL v17 = 0;
          }
          if (v17)
          {
            CGAffineTransform v19 = v6;
            CGAffineTransform v20 = [v15 unique_id];
            char v21 = [v20 isEqualToString:@"00000000-0000-0000-0000-000000000000"];

            long long v18 = sos_default_log();
            BOOL v22 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
            if ((v21 & 1) == 0)
            {
              if (v22)
              {
                id v25 = [v15 unique_id];
                *(_DWORD *)long long buf = 138412546;
                id v38 = v25;
                __int16 v39 = 2112;
                id v40 = v12;
                _os_log_impl(&dword_1B3A94000, v18, OS_LOG_TYPE_DEFAULT, "Successfully retrieved SIM label %@ for context: %@", buf, 0x16u);
              }
              BOOL v24 = 1;
              id v4 = v27;
              char v6 = v19;
              id v3 = v28;
              goto LABEL_36;
            }
            if (v22)
            {
              uint64_t v23 = [v15 unique_id];
              *(_DWORD *)long long buf = 138412546;
              id v38 = v23;
              __int16 v39 = 2112;
              id v40 = v12;
              _os_log_impl(&dword_1B3A94000, v18, OS_LOG_TYPE_DEFAULT, "retrieved SIM label %@ for context: %@", buf, 0x16u);
            }
            char v6 = v19;
            id v3 = v28;
          }
          else
          {
            long long v18 = sos_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v38 = v12;
              _os_log_error_impl(&dword_1B3A94000, v18, OS_LOG_TYPE_ERROR, "Error retrieving SIM label for context: %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    BOOL v24 = 0;
    int v13 = v9;
    id v4 = v27;
  }
  else
  {
    if (!v5)
    {
      BOOL v24 = 0;
      goto LABEL_39;
    }
    int v13 = sos_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[SOSUtilities hasActiveSIMForClient:]((uint64_t)v6, v13);
    }
    BOOL v24 = 0;
  }
LABEL_36:

LABEL_38:
LABEL_39:

  return v24;
}

+ (BOOL)hasEmergencyContacts
{
  uint64_t v2 = objc_alloc_init(SOSContactsManager);
  BOOL v3 = [(SOSContactsManager *)v2 SOSContactsExist];

  return v3;
}

+ (NSString)emergencyContactsSectionDescription
{
  if ([a1 hasEmergencyContacts])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v3 = [v2 localizedStringForKey:@"EMERGENCY_CONTACTS" value:&stru_1F0C40F10 table:0];
  }
  else
  {
    BOOL v3 = &stru_1F0C40F10;
  }

  return (NSString *)v3;
}

+ (NSString)emergencyContactsEditDescription
{
  int v2 = [a1 hasEmergencyContacts];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = v3;
  if (v2) {
    id v5 = @"OPEN_HEALTH_HAS_EMERGENCY_CONTACTS";
  }
  else {
    id v5 = @"OPEN_HEALTH_NO_EMERGENCY_CONTACTS";
  }
  char v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:0];

  return (NSString *)v6;
}

+ (NSString)emergencyContactsFooterDescription
{
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"SOS_PRIVACY_EMERGENCY_CONTACTS" value:&stru_1F0C40F10 table:0];

  id v5 = NSString;
  char v6 = [a1 emergencyContactsFooterLinkTitle];
  uint64_t v7 = objc_msgSend(v5, "stringWithFormat:", v4, v6);

  return (NSString *)v7;
}

+ (NSString)emergencyContactsFooterLinkTitle
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"SOS_PRIVACY_LINK" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (void)openEmergencyContactsFooterLinkOnViewController:(id)a3
{
  id v3 = a3;
  id v4 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.emergencysos"];
  [v4 setPresentingViewController:v3];

  [v4 present];
}

+ (NSString)callWithHoldTitleDescription
{
  [a1 clawReleaseToCallSupport];
  double v3 = v2;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3 <= 1.0) {
    char v6 = @"CALL_WITH_HOLD";
  }
  else {
    char v6 = @"CALL_WITH_HOLD_AND_RELEASE";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1F0C40F10 table:0];

  return (NSString *)v7;
}

+ (NSString)callWithHoldFooterDescription
{
  [a1 clawReleaseToCallSupport];
  double v3 = v2;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3 <= 1.0) {
    char v6 = @"CALL_WITH_HOLD_FOOTER";
  }
  else {
    char v6 = @"CALL_WITH_HOLD_AND_RELESE_FOOTER";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1F0C40F10 table:0];

  return (NSString *)v7;
}

+ (BOOL)isCallWithVolumeLockHoldEnabled
{
  double v3 = [a1 _sosPrefsValueForKey:@"SOSCallWithVolumeLockHoldKey"];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 BOOLValue];
  }
  else if ([a1 isDeviceD2xOrNewer])
  {
    char v6 = [a1 _sosPrefsValueForKey:@"SOSAutomaticCallCountdownEnabledKey"];
    if (v6)
    {
      uint64_t v7 = [a1 _sosPrefsValueForKey:@"SOSAutoCallD2xKey"];
      uint64_t v8 = [v7 integerValue];

      if (v8
        || ([a1 _setSOSPrefsValue:&unk_1F0C4A9A8 forKey:@"SOSAutoCallD2xKey"],
            ([a1 mustAllowThreeClickTrigger] & 1) != 0)
        || ([v6 BOOLValue] & 1) != 0)
      {
        char v5 = [v6 BOOLValue];
      }
      else
      {
        char v5 = 1;
        [a1 setCallWithVolumeLockHoldEnabled:1];
      }
    }
    else
    {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (void)setCallWithVolumeLockHoldEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  +[SOSCoreAnalyticsReporter reportSOSAutomaticCallCountdownEnabled:](SOSCoreAnalyticsReporter, "reportSOSAutomaticCallCountdownEnabled:");
  id v5 = [NSNumber numberWithBool:v3];
  [a1 _setSOSPrefsValue:v5 forKey:@"SOSCallWithVolumeLockHoldKey"];
}

+ (double)clawReleaseToCallSupport
{
  double v2 = [a1 _sosPrefsValueForKey:@"SOSClawReleaseToCallSupportKey"];
  BOOL v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 2.0;
  }

  return v5;
}

+ (NSString)pressSelectionGroupTitleDescription
{
  double v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"NUMBER_OF_CLICKS" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)threePressesSelectionTitleDescription
{
  double v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"THREE_CLICKS" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)fivePressesSelectionTitleDescription
{
  double v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"FIVE_CLICKS" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)callWithPressesTitleDescription
{
  if ([a1 currentSOSTriggerMechanism] == 1
    || [a1 mustAllowThreeClickTrigger]
    && [a1 isDeviceD2xOrNewer])
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v4 = v3;
    double v5 = @"CALL_WITH_THREE_PRESSES";
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v4 = v3;
    double v5 = @"CALL_WITH_FIVE_PRESSES";
  }
  char v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:0];

  return (NSString *)v6;
}

+ (NSString)callWithPressesFooterDescription
{
  if ([a1 currentSOSTriggerMechanism] == 1
    || [a1 mustAllowThreeClickTrigger]
    && [a1 isDeviceD2xOrNewer])
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v4 = v3;
    double v5 = @"CALL_WITH_THREE_PRESSES_FOOTER";
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v4 = v3;
    double v5 = @"CALL_WITH_FIVE_PRESSES_FOOTER";
  }
  char v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:0];

  return (NSString *)v6;
}

+ (BOOL)isCallWithSideButtonPressesEnabled
{
  int v3 = [a1 mustAllowThreeClickTrigger];
  double v4 = [a1 _sosPrefsValueForKey:@"SOSCallWithSideButtonPressesKey"];
  double v5 = [a1 _sosPrefsValueForKey:@"SOSAutomaticCallCountdownEnabledKey"];
  if (![a1 _potentialForAccessibilityConflict]
    || ![a1 _hasAccessibilityConflict])
  {
    if (v4)
    {
      char v6 = v4;
    }
    else
    {
      if (!v5) {
        goto LABEL_9;
      }
      char v6 = v5;
    }
    int v3 = [v6 BOOLValue];
    goto LABEL_9;
  }
  [a1 setCallWithSideButtonPressesEnabled:0];
  int v3 = 0;
LABEL_9:
  if ([a1 isDeviceD2xOrNewer]
    && ([a1 mustAllowThreeClickTrigger] & 1) == 0
    && ([a1 hasMultiPressResetLogicRun] & 1) == 0)
  {
    [a1 setHasMultiPressResetLogicRun:1];
    if (v3)
    {
      [a1 setCallWithSideButtonPressesEnabled:0];
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = 4;
    }
    [a1 setSettingsResetFollowUpState:v7];
    LOBYTE(v3) = 0;
  }

  return v3;
}

+ (void)setCallWithSideButtonPressesEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [a1 _setSOSPrefsValue:v4 forKey:@"SOSCallWithSideButtonPressesKey"];
}

+ (NSString)autoCallTitleDescription
{
  double v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v3 = [v2 localizedStringForKey:@"AUTO_CALL" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)autoCallFooterDescription
{
  int v2 = [a1 autoCallRequiresSIM];
  int v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = v3;
  if (v2) {
    double v5 = @"AUTO_CALL_FOOTER_REQUIRE_SIM";
  }
  else {
    double v5 = @"AUTO_CALL_FOOTER";
  }
  char v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:0];

  return (NSString *)v6;
}

+ (BOOL)isAutomaticCallCountdownEnabled
{
  if ([a1 isDeviceD2xOrNewer])
  {
    return [a1 isCallWithVolumeLockHoldEnabled];
  }
  else
  {
    return [a1 isCallWithSideButtonPressesEnabled];
  }
}

+ (void)setAutomaticCallCountdownEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([a1 isDeviceD2xOrNewer]) {
    [a1 setCallWithVolumeLockHoldEnabled:v3];
  }
  else {
    [a1 setCallWithSideButtonPressesEnabled:v3];
  }
  id v5 = [NSNumber numberWithBool:v3];
  [a1 _setSOSPrefsValue:v5 forKey:@"SOSAutomaticCallCountdownEnabledKey"];
}

+ (NSString)countdownSoundTitleDescription
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"ALARM_SOUND" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)countdownSoundFooterDescription
{
  [a1 clawReleaseToCallSupport];
  if (v3 == 0.0)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = v4;
    char v6 = @"ALARM_SOUND_FOOTER";
  }
  else if ([a1 currentSOSTriggerMechanism] == 1 {
         || [a1 mustAllowThreeClickTrigger]
  }
         && [a1 isDeviceD2xOrNewer])
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = v4;
    char v6 = @"ALARM_SOUND_RELEASE_TO_CALL_THREE_PRESSES_FOOTER";
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = v4;
    char v6 = @"ALARM_SOUND_RELEASE_TO_CALL_FIVE_PRESSES_FOOTER";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1F0C40F10 table:0];

  return (NSString *)v7;
}

+ (BOOL)shouldPlayAudioDuringCountdown
{
  if ([a1 shouldSilenceSOSFlow])
  {
    double v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSUtilities,SOS flow is silenced so audio during countdown is off", v8, 2u);
    }

    return 0;
  }
  else
  {
    uint64_t v5 = [a1 _sosPrefsValueForKey:@"SOSPlayAudioDuringCountdownKey"];
    if (v5) {
      char v6 = (void *)v5;
    }
    else {
      char v6 = (void *)MEMORY[0x1E4F1CC38];
    }
    char v7 = [v6 BOOLValue];

    return v7;
  }
}

+ (BOOL)setShouldPlayAudioDuringCountdown:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [a1 shouldSilenceSOSFlow];
  if (v5)
  {
    char v6 = sos_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SOSUtilities setShouldPlayAudioDuringCountdown:](v6);
    }
  }
  else
  {
    [a1 setPlayAudioDuringCountdown:v3];
  }
  return v5 ^ 1;
}

+ (void)setPlayAudioDuringCountdown:(BOOL)a3
{
  BOOL v3 = a3;
  +[SOSCoreAnalyticsReporter reportSOSShouldPlayAudioDuringCountdown:](SOSCoreAnalyticsReporter, "reportSOSShouldPlayAudioDuringCountdown:");
  id v5 = [NSNumber numberWithBool:v3];
  [a1 _setSOSPrefsValue:v5 forKey:@"SOSPlayAudioDuringCountdownKey"];
}

+ (NSString)accidentalCallNotificationTitle
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"ACCIDENTAL_SOS_NOTIF_TITLE" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)accidentalCallNotificationBody
{
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateStyle:0];
  [v4 setTimeStyle:1];
  id v5 = [v4 stringFromDate:v3];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v6 setLocalizedDateFormatFromTemplate:@"j"];
  char v7 = [v6 stringFromDate:v3];
  uint64_t v8 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  uint64_t v9 = [v8 invertedSet];

  uint64_t v10 = [v7 componentsSeparatedByCharactersInSet:v9];
  int v11 = [v10 componentsJoinedByString:&stru_1F0C40F10];

  id v12 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  int v13 = [v12 numberFromString:v11];

  uint64_t v14 = [a1 mostRecentlyUsedSOSTriggerMechanism];
  id v30 = v7;
  id v31 = (void *)v9;
  int v15 = v5;
  if (v14 == 1)
  {
    int v20 = [v13 intValue];
    BOOL v17 = NSString;
    long long v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (v20 == 1) {
      CGAffineTransform v19 = @"ACCIDENTAL_SOS_NOTIF_BODY_THREE_PRESSES_WITH_TIME_%@_SINGULAR";
    }
    else {
      CGAffineTransform v19 = @"ACCIDENTAL_SOS_NOTIF_BODY_THREE_PRESSES_WITH_TIME_%@_PLURAL";
    }
  }
  else
  {
    if (v14 != 2)
    {
      int v21 = [v13 intValue];
      +[SOSUtilities clawReleaseToCallSupport];
      double v23 = v22;
      v29 = NSString;
      BOOL v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v18 = v24;
      if (v21 == 1)
      {
        if (v23 == 0.0) {
          id v25 = @"ACCIDENTAL_SOS_NOTIF_BODY_CLAW_WITH_TIME_%@_SINGULAR";
        }
        else {
          id v25 = @"ACCIDENTAL_SOS_NOTIF_BODY_CLAW_RELEASE_WITH_TIME_%@_SINGULAR";
        }
      }
      else if (v23 == 0.0)
      {
        id v25 = @"ACCIDENTAL_SOS_NOTIF_BODY_CLAW_WITH_TIME_%@_PLURAL";
      }
      else
      {
        id v25 = @"ACCIDENTAL_SOS_NOTIF_BODY_CLAW_RELEASE_WITH_TIME_%@_PLURAL";
      }
      uint64_t v26 = [v24 localizedStringForKey:v25 value:&stru_1F0C40F10 table:0];
      objc_msgSend(v29, "stringWithFormat:", v26, v5);
      goto LABEL_18;
    }
    int v16 = [v13 intValue];
    BOOL v17 = NSString;
    long long v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (v16 == 1) {
      CGAffineTransform v19 = @"ACCIDENTAL_SOS_NOTIF_BODY_FIVE_PRESSES_WITH_TIME_%@_SINGULAR";
    }
    else {
      CGAffineTransform v19 = @"ACCIDENTAL_SOS_NOTIF_BODY_FIVE_PRESSES_WITH_TIME_%@_PLURAL";
    }
  }
  uint64_t v26 = [v18 localizedStringForKey:v19 value:&stru_1F0C40F10 table:0];
  id v5 = v15;
  objc_msgSend(v17, "stringWithFormat:", v26, v15);
  uint64_t v27 = LABEL_18:;

  return (NSString *)v27;
}

+ (void)setShortSOSNotificationDisplayTimestamp
{
  id v3 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  [a1 _setSOSPrefsValue:v3 forKey:@"SOSNotificationDisplayedTimestampKey"];
}

+ (double)getShortSOSNotificationDisplayTimestamp
{
  int v2 = [a1 _sosPrefsValueForKey:@"SOSNotificationDisplayedTimestampKey"];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

+ (NSString)accidentalCallFeedbackAssistantLegalText
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"ACCIDENTAL_SOS_FEEDBACK_ASSISTANT_LEGAL_TEXT" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)crashDetectionFeedbackAssistantLegalText
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"CRASHDETECTION_FEEDBACK_ASSISTANT_LEGAL_TEXT" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (BOOL)hasMultiPressResetLogicRun
{
  id v3 = [a1 _sosPrefsValueForKey:@"SOSMultiPressResetKey"];
  double v4 = v3;
  if (v3)
  {
    char v5 = [v3 BOOLValue];
  }
  else
  {
    [a1 setHasMultiPressResetLogicRun:0];
    char v5 = 0;
  }

  return v5;
}

+ (void)setHasMultiPressResetLogicRun:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [a1 _setSOSPrefsValue:v4 forKey:@"SOSMultiPressResetKey"];
}

+ (int64_t)getSettingsResetFollowUpState
{
  id v3 = [a1 _sosPrefsValueForKey:@"SOSSettingsResetFollowUpStateKey"];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = (int)[v3 intValue];
  }
  else if ([a1 hasMultiPressResetLogicRun])
  {
    int64_t v5 = 4;
    [a1 setSettingsResetFollowUpState:4];
  }
  else
  {
    [a1 setSettingsResetFollowUpState:0];
    int64_t v5 = 0;
  }

  return v5;
}

+ (void)setSettingsResetFollowUpState:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSUtilities,setting FollowUp state to %ld", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [NSNumber numberWithInteger:a3];
  [a1 _setSOSPrefsValue:v6 forKey:@"SOSSettingsResetFollowUpStateKey"];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SOSSettingsResetFollowUpStateChangedNotification", 0, 0, 1u);
}

+ (NSString)settingsResetFollowUpTitle
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SOS_SETTINGS_RESET_FOLLOW_UP_TITLE" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)settingsResetFollowUpBody
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SOS_SETTINGS_RESET_FOLLOW_UP_BODY" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)settingsResetFollowUpRedirectActionTitle
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SOS_SETTINGS_RESET_FOLLOW_UP_REDIRECT_ACTION_TITLE" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (NSString)settingsResetFollowUpClearActionTitle
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SOS_SETTINGS_RESET_FOLLOW_UP_CLEAR_TITLE" value:&stru_1F0C40F10 table:0];

  return (NSString *)v3;
}

+ (BOOL)isAllowedToMessageSOSContacts
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _sosPrefsValueForKey:@"SOSAllowedToMessageSOSContactsKey"];
  if (v3) {
    id v4 = (void *)v3;
  }
  else {
    id v4 = (void *)MEMORY[0x1E4F1CC28];
  }
  if ([a1 isActivePairedDeviceTinker])
  {
    int64_t v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "This is Tinker config, allowing to message SOS contacts", (uint8_t *)v10, 2u);
    }

    id v4 = (void *)MEMORY[0x1E4F1CC38];
  }
  id v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v4 BOOLValue];
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "isAllowedToMessageSOSContacts: %d", (uint8_t *)v10, 8u);
  }

  char v8 = [v4 BOOLValue];
  return v8;
}

+ (void)setAllowedToMessageSOSContacts:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "setAllowedToMessageSOSContacts: %d", (uint8_t *)v9, 8u);
  }

  if ([a1 isActivePairedDeviceTinker])
  {
    id v6 = sos_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "Tinker config, ignoring setAllowedToMessageSOSContacts", (uint8_t *)v9, 2u);
    }
  }
  else
  {
    int v7 = [NSNumber numberWithBool:v3];
    [a1 _setSOSPrefsValue:v7 forKey:@"SOSAllowedToMessageSOSContactsKey"];

    [a1 _synchronizeSOSPrefs];
    id v6 = objc_opt_new();
    char v8 = [MEMORY[0x1E4F1CAD0] setWithObject:@"SOSAllowedToMessageSOSContactsKey"];
    [v6 synchronizeUserDefaultsDomain:@"com.apple.SOS" keys:v8];
  }
}

+ (BOOL)shouldSilenceSOSFlow
{
  if (![(id)objc_opt_class() _isInternalDevice]) {
    return 0;
  }
  BOOL v3 = [a1 _sosPrefsValueForKey:@"SOSSilenceSOSFlowKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)isActivePairedDeviceTinker
{
  int v2 = [a1 activeDevice];
  BOOL v3 = [v2 valueForProperty:*MEMORY[0x1E4F79DA0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (NSString)stewieGroupTitle
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"STEWIE_ANIMATION_GROUP" value:&stru_1F0C40F10 table:@"Localizable-stewie"];

  return (NSString *)v3;
}

+ (UIImage)stewieGroupAsset
{
  id UIImageClass = getUIImageClass();
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = [UIImageClass imageNamed:@"stewie-diagram" inBundle:v3 withConfiguration:0];

  return (UIImage *)v4;
}

+ (NSString)stewieDemoCellText
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"STEWIE_DEMO_CELL_TEXT" value:&stru_1F0C40F10 table:@"Localizable-stewie"];

  return (NSString *)v3;
}

+ (NSString)stewieDemoButtonTitle
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"STEWIE_DEMO_BUTTON_TITLE" value:&stru_1F0C40F10 table:@"Localizable-stewie"];

  return (NSString *)v3;
}

+ (NSString)stewieFooterDescription
{
  BOOL v3 = NSString;
  char v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int64_t v5 = [v4 localizedStringForKey:@"STEWIE_FOOTNOTE_DESCRIPTION_%@" value:&stru_1F0C40F10 table:@"Localizable-stewie"];
  id v6 = [a1 stewieFooterLinkTitle];
  int v7 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v6);

  return (NSString *)v7;
}

+ (NSString)stewieFooterLinkTitle
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"STEWIE_FOOTNOTE_LINK" value:&stru_1F0C40F10 table:@"Localizable-stewie"];

  return (NSString *)v3;
}

+ (BOOL)isStewieVisible
{
  return _os_feature_enabled_impl();
}

+ (void)presentStewieDemoUnavailableAlertOnViewController:(id)a3 reason:(int64_t)a4
{
  int64_t v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a3;
  int v7 = [v5 bundleForClass:objc_opt_class()];
  id v17 = [v7 localizedStringForKey:@"STEWIE_DEMO_ERROR_ALERT_TITLE" value:&stru_1F0C40F10 table:@"Localizable-stewie"];

  switch(a4)
  {
    case 0:
    case 1:
    case 2:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      char v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int64_t v9 = v8;
      uint64_t v10 = @"STEWIE_DEMO_GENERIC_ERROR_ALERT_DESCRIPTION";
      goto LABEL_3;
    case 3:
      char v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int64_t v9 = v8;
      uint64_t v10 = @"STEWIE_DEMO_NETWORK_ERROR_ALERT_DESCRIPTION";
      goto LABEL_3;
    case 4:
      char v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int64_t v9 = v8;
      uint64_t v10 = @"STEWIE_DEMO_REGION_ERROR_ALERT_DESCRIPTION";
      goto LABEL_3;
    case 5:
      char v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int64_t v9 = v8;
      uint64_t v10 = @"STEWIE_DEMO_AIRPLANE_MODE_ERROR_ALERT_DESCRIPTION";
LABEL_3:
      uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_1F0C40F10 table:@"Localizable-stewie"];

      break;
    default:
      uint64_t v11 = 0;
      break;
  }
  id v12 = [getUIAlertControllerClass() alertControllerWithTitle:v17 message:v11 preferredStyle:1];
  id UIAlertActionClass = getUIAlertActionClass();
  uint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v15 = [v14 localizedStringForKey:@"STEWIE_DEMO_ERROR_ALERT_OK" value:&stru_1F0C40F10 table:@"Localizable-stewie"];
  int v16 = [UIAlertActionClass actionWithTitle:v15 style:1 handler:&__block_literal_global_875];
  [v12 addAction:v16];

  [v6 presentViewController:v12 animated:1 completion:0];
}

+ (void)presentStewieLearnMoreLinkOnViewController:(id)a3
{
  id v3 = a3;
  id v4 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.safetyFeatures"];
  [v4 setPresentingViewController:v3];

  [v4 present];
}

+ (BOOL)isKappaVisible
{
  return _os_feature_enabled_impl();
}

+ (BOOL)kappaTriggersEmergencySOSTinker
{
  int v2 = [a1 _SOSDomainAccessor];
  id v3 = [v2 objectForKey:@"SOSKappaTriggersEmergencySOSKeyTinker"];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (void *)MEMORY[0x1E4F1CC38];
  }
  if ([v4 BOOLValue]) {
    char v5 = _os_feature_enabled_impl();
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (void)_setKappaTriggersEmergencySOS:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 kappaTriggersEmergencySOS];
  id v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v11 = v5;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "kappa status change: %d", buf, 8u);
  }

  if (v5 == v3)
  {
    char v8 = sos_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "new kappa status same as the current store kappa status: returning", buf, 2u);
    }
  }
  else
  {
    int v7 = [NSNumber numberWithBool:v3];
    [a1 _setSOSPrefsValue:v7 forKey:@"SOSKappaTriggersEmergencySOSKey"];

    char v8 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__SOSUtilities__setKappaTriggersEmergencySOS___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = a1;
    dispatch_async(v8, block);
  }
}

void __46__SOSUtilities__setKappaTriggersEmergencySOS___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _synchronizeSOSPrefs];
  double v1 = objc_opt_new();
  int v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"SOSKappaTriggersEmergencySOSKey"];
  [v1 synchronizeUserDefaultsDomain:@"com.apple.SOS" keys:v2];

  BOOL v3 = MEMORY[0x1E4F14428];

  dispatch_async(v3, &__block_literal_global_882);
}

void __46__SOSUtilities__setKappaTriggersEmergencySOS___block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SOSKappaStateChangedNotification", 0, 0, 1u);
}

+ (void)_setKappaTriggersEmergencySOSTinker:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 kappaTriggersEmergencySOSTinker];
  id v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v12 = v5;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "kappa status change: %d", buf, 8u);
  }

  if (v5 == v3)
  {
    int64_t v9 = sos_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "new kappa status same as the current store kappa status: returning", buf, 2u);
    }
  }
  else
  {
    int v7 = [a1 _SOSDomainAccessor];
    char v8 = [NSNumber numberWithBool:v3];
    [v7 setObject:v8 forKey:@"SOSKappaTriggersEmergencySOSKeyTinker"];

    int64_t v9 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SOSUtilities__setKappaTriggersEmergencySOSTinker___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = a1;
    dispatch_async(v9, block);
  }
}

void __52__SOSUtilities__setKappaTriggersEmergencySOSTinker___block_invoke(uint64_t a1)
{
  double v1 = [*(id *)(a1 + 32) _SOSDomainAccessor];
  id v2 = (id)[v1 synchronize];

  BOOL v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:@"SOSKappaTriggersEmergencySOSKeyTinker"];
  [v3 synchronizeNanoDomain:@"com.apple.SOS" keys:v4];

  int v5 = MEMORY[0x1E4F14428];

  dispatch_async(v5, &__block_literal_global_884);
}

void __52__SOSUtilities__setKappaTriggersEmergencySOSTinker___block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SOSKappaStateChangedNotification", 0, 0, 1u);
}

+ (void)setKappaTriggersEmergencySOS:(BOOL)a3 isWristDetectionEnabled:(BOOL)a4 confirmationDelegate:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  int v11 = (void (**)(id, uint64_t))a6;
  int v12 = sos_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)long long v33 = v8;
    *(_WORD *)&void v33[4] = 1024;
    *(_DWORD *)&v33[6] = v7;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "setKappaTriggersEmergencySOS:%d isWristDetectionEnabled:%d confirmationDelegate:%@", buf, 0x18u);
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke;
  v31[3] = &__block_descriptor_40_e8_v12__0B8l;
  void v31[4] = a1;
  uint64_t v13 = (void (**)(void, void))MEMORY[0x1B3EC08A0](v31);
  uint64_t v14 = sos_default_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v15)
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)long long v33 = "+[SOSUtilities setKappaTriggersEmergencySOS:isWristDetectionEnabled:confirmationDelegate:completion:]";
      _os_log_impl(&dword_1B3A94000, v14, OS_LOG_TYPE_DEFAULT, "%s - no confirmation needed", buf, 0xCu);
    }

    v13[2](v13, 1);
    v11[2](v11, 1);
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)long long v33 = "+[SOSUtilities setKappaTriggersEmergencySOS:isWristDetectionEnabled:confirmationDelegate:completion:]";
      _os_log_impl(&dword_1B3A94000, v14, OS_LOG_TYPE_DEFAULT, "%s - presenting 'are you sure?' confirmation", buf, 0xCu);
    }

    int v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v23 = [v16 localizedStringForKey:@"SOS_KAPPA_CONFIRM_TITLE" value:&stru_1F0C40F10 table:@"Localizable-kappa"];

    id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v22 = [v17 localizedStringForKey:@"SOS_KAPPA_CONFIRM_DETAIL_WATCH" value:&stru_1F0C40F10 table:@"Localizable-kappa"];

    long long v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    CGAffineTransform v19 = [v18 localizedStringForKey:@"SOS_KAPPA_CONFIRM_CANCEL" value:&stru_1F0C40F10 table:@"Localizable-kappa"];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke_899;
    v28[3] = &unk_1E60643D0;
    v29 = v13;
    id v30 = v11;
    int v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v21 = [v20 localizedStringForKey:@"SOS_KAPPA_CONFIRM_OK" value:&stru_1F0C40F10 table:@"Localizable-kappa"];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke_903;
    v24[3] = &unk_1E60643F8;
    id v25 = v29;
    char v27 = 0;
    uint64_t v26 = v30;
    [v10 presentConfirmationWithTitle:v23 message:v22 cancelTitle:v19 cancelHandler:v28 confirmTitle:v21 confirmHandler:v24];
  }
}

uint64_t __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = [*(id *)(a1 + 32) isActivePairedDeviceTinker];
  int v5 = *(void **)(a1 + 32);
  if (v4)
  {
    return [v5 _setKappaTriggersEmergencySOSTinker:a2];
  }
  else
  {
    return [v5 _setKappaTriggersEmergencySOS:a2];
  }
}

uint64_t __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke_899(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "+[SOSUtilities setKappaTriggersEmergencySOS:isWristDetectionEnabled:confirmationDelegate:completion:]_block_invoke";
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "%s - canceled", (uint8_t *)&v4, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __101__SOSUtilities_setKappaTriggersEmergencySOS_isWristDetectionEnabled_confirmationDelegate_completion___block_invoke_903(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "+[SOSUtilities setKappaTriggersEmergencySOS:isWristDetectionEnabled:confirmationDelegate:completion:]_block_invoke";
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "%s - confirmed", (uint8_t *)&v4, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)setKappaTriggersEmergencySOS:(BOOL)a3 confirmationDelegate:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = sos_default_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v11)
    {
      *(_DWORD *)long long buf = 136315138;
      v29 = "+[SOSUtilities setKappaTriggersEmergencySOS:confirmationDelegate:completion:]";
      _os_log_impl(&dword_1B3A94000, v10, OS_LOG_TYPE_DEFAULT, "%s - presenting 'are you sure?' confirmation", buf, 0xCu);
    }

    int v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v21 = [v12 localizedStringForKey:@"SOS_KAPPA_CONFIRM_TITLE" value:&stru_1F0C40F10 table:@"Localizable-kappa"];

    if ([a1 isKappaDetectionSupportedOnPhone]
      && [a1 isKappaDetectionSupportedOnActiveWatch])
    {
      uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v14 = v13;
      BOOL v15 = @"SOS_KAPPA_CONFIRM_DETAIL_BOTH";
    }
    else if (objc_msgSend(a1, "isKappaDetectionSupportedOnPhone", v21))
    {
      uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v14 = v13;
      BOOL v15 = @"SOS_KAPPA_CONFIRM_DETAIL_PHONE";
    }
    else
    {
      if (![a1 isKappaDetectionSupportedOnActiveWatch])
      {
        int v16 = &stru_1F0C40F10;
        goto LABEL_15;
      }
      uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v14 = v13;
      BOOL v15 = @"SOS_KAPPA_CONFIRM_DETAIL_WATCH";
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1F0C40F10, @"Localizable-kappa", v21);
    int v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v18 = [v17 localizedStringForKey:@"SOS_KAPPA_CONFIRM_CANCEL" value:&stru_1F0C40F10 table:@"Localizable-kappa"];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __77__SOSUtilities_setKappaTriggersEmergencySOS_confirmationDelegate_completion___block_invoke;
    v25[3] = &unk_1E6064420;
    id v27 = a1;
    id v26 = v9;
    CGAffineTransform v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v20 = [v19 localizedStringForKey:@"SOS_KAPPA_CONFIRM_OK" value:&stru_1F0C40F10 table:@"Localizable-kappa"];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__SOSUtilities_setKappaTriggersEmergencySOS_confirmationDelegate_completion___block_invoke_910;
    v22[3] = &unk_1E6064420;
    id v24 = a1;
    id v23 = v26;
    [v8 presentConfirmationWithTitle:v21 message:v16 cancelTitle:v18 cancelHandler:v25 confirmTitle:v20 confirmHandler:v22];

    goto LABEL_16;
  }
  if (v11)
  {
    *(_DWORD *)long long buf = 136315138;
    v29 = "+[SOSUtilities setKappaTriggersEmergencySOS:confirmationDelegate:completion:]";
    _os_log_impl(&dword_1B3A94000, v10, OS_LOG_TYPE_DEFAULT, "%s - no confirmation needed", buf, 0xCu);
  }

  [a1 _setKappaTriggersEmergencySOS:1];
  (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
LABEL_16:
}

uint64_t __77__SOSUtilities_setKappaTriggersEmergencySOS_confirmationDelegate_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "+[SOSUtilities setKappaTriggersEmergencySOS:confirmationDelegate:completion:]_block_invoke";
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "%s - canceled", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 40) _setKappaTriggersEmergencySOS:1];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__SOSUtilities_setKappaTriggersEmergencySOS_confirmationDelegate_completion___block_invoke_910(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "+[SOSUtilities setKappaTriggersEmergencySOS:confirmationDelegate:completion:]_block_invoke";
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "%s - confirmed", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 40) _setKappaTriggersEmergencySOS:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)isKappaUnmasked
{
  return 1;
}

void __56__SOSUtilities_isKappaDetectionSupportedOnCurrentDevice__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((MGGetBoolAnswer() & 1) != 0 || (int v0 = _os_feature_enabled_impl()) != 0)
  {
    LOBYTE(v0) = +[SOSUtilities isKappaVisible];
    int v1 = 1;
  }
  else
  {
    int v1 = 0;
  }
  isKappaDetectionSupportedOnCurrentDevice___kappaDetectionAvailable = v0;
  id v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109632;
    v3[1] = v1;
    __int16 v4 = 1024;
    BOOL v5 = +[SOSUtilities isKappaVisible];
    __int16 v6 = 1024;
    int v7 = isKappaDetectionSupportedOnCurrentDevice___kappaDetectionAvailable;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "_kappaDetectionAvailableOnCurrentDevice: deviceSupportsKappa:%{BOOL}d / isKappaVisible:%{BOOL}d => kappaDetectionAvailable:%{BOOL}d", (uint8_t *)v3, 0x14u);
  }
}

+ (BOOL)isKappaDetectionSupportedOnActiveWatch
{
  id v2 = [a1 activeDevice];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"891D0E88-9AB8-420F-8FB5-92A1D4C58DAE"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

+ (NSString)crashDetectionPhoneFooterDesription
{
  int v2 = [a1 isKappaUnmasked];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = v3;
  if (v2) {
    BOOL v5 = @"SOS_KAPPA_FOOTER_PHONE";
  }
  else {
    BOOL v5 = @"SOS_KAPPA_FOOTER_PHONE_MASKED";
  }
  __int16 v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v6;
}

+ (NSString)crashDetectionPhoneWatchFooterDescription
{
  int v2 = [a1 isKappaUnmasked];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = v3;
  if (v2) {
    BOOL v5 = @"SOS_KAPPA_FOOTER_BOTH";
  }
  else {
    BOOL v5 = @"SOS_KAPPA_FOOTER_BOTH_MASKED";
  }
  __int16 v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v6;
}

+ (NSString)crashDetectionTitleDescription
{
  if ([a1 isKappaUnmasked])
  {
    int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v3 = [v2 localizedStringForKey:@"SOS_KAPPA_TITLE" value:&stru_1F0C40F10 table:@"Localizable-kappa"];
  }
  else
  {
    BOOL v3 = @"Kappa";
  }

  return (NSString *)v3;
}

+ (NSString)crashDetectionSwitchDescription
{
  int v2 = [a1 isKappaUnmasked];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = v3;
  if (v2) {
    BOOL v5 = @"SOS_KAPPA_CELL_TITLE";
  }
  else {
    BOOL v5 = @"SOS_KAPPA_CELL_TITLE_MASKED";
  }
  __int16 v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v6;
}

+ (NSString)crashDetectionWatchFooterDescription
{
  int v2 = [a1 isKappaUnmasked];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = v3;
  if (v2) {
    BOOL v5 = @"SOS_KAPPA_FOOTER_WATCH";
  }
  else {
    BOOL v5 = @"SOS_KAPPA_FOOTER_WATCH_MASKED";
  }
  __int16 v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v6;
}

+ (NSString)crashDetectionFooterLinkDescription
{
  int v2 = [a1 isKappaUnmasked];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = v3;
  if (v2) {
    BOOL v5 = @"SOS_KAPPA_FOOTER_LINK";
  }
  else {
    BOOL v5 = @"SOS_KAPPA_FOOTER_LINK_MASKED";
  }
  __int16 v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v6;
}

+ (NSURL)crashDetectionFooterLinkURL
{
  return 0;
}

+ (NSString)crashDetectionWristDetectionWarningDescription
{
  return (NSString *)&stru_1F0C40F10;
}

+ (NSString)crashDetectionThirdPartyDescription
{
  int v2 = [a1 isKappaUnmasked];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = v3;
  if (v2) {
    BOOL v5 = @"SOS_KAPPA_THIRD_PARTY_CELL_TITLE";
  }
  else {
    BOOL v5 = @"SOS_KAPPA_THIRD_PARTY_CELL_TITLE_MASKED";
  }
  __int16 v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v6;
}

+ (NSString)crashDetectionThirdPartyCellTitle
{
  int v2 = [a1 isKappaUnmasked];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = v3;
  if (v2) {
    BOOL v5 = @"SOS_KAPPA_THIRD_PARTY_CELL_TITLE";
  }
  else {
    BOOL v5 = @"SOS_KAPPA_THIRD_PARTY_CELL_TITLE_MASKED";
  }
  __int16 v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v6;
}

+ (NSString)crashDetectionThirdPartyNavigationTitle
{
  int v2 = [a1 isKappaUnmasked];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = v3;
  if (v2) {
    BOOL v5 = @"SOS_KAPPA_THIRD_PARTY_NAVIGATION_TITLE";
  }
  else {
    BOOL v5 = @"SOS_KAPPA_THIRD_PARTY_CELL_TITLE_MASKED";
  }
  __int16 v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v6;
}

+ (NSString)crashDetectionThirdPartyAlertTitle
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"SOS_KAPPA_THIRD_PARTY_ALERT_TITLE" value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v3;
}

+ (NSString)crashDetectionThirdPartyFooterDescriptionPhone
{
  int v2 = [a1 isKappaUnmasked];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = v3;
  if (v2) {
    BOOL v5 = @"SOS_KAPPA_THIRD_PARTY_FOOTER_PHONE";
  }
  else {
    BOOL v5 = @"SOS_KAPPA_THIRD_PARTY_FOOTER_PHONE_MASKED";
  }
  __int16 v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v6;
}

+ (NSString)crashDetectionThirdPartyFooterDescriptionWatch
{
  int v2 = [a1 isKappaUnmasked];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v4 = v3;
  if (v2) {
    BOOL v5 = @"SOS_KAPPA_THIRD_PARTY_FOOTER_WATCH";
  }
  else {
    BOOL v5 = @"SOS_KAPPA_THIRD_PARTY_FOOTER_WATCH_MASKED";
  }
  __int16 v6 = [v3 localizedStringForKey:v5 value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v6;
}

+ (NSString)crashDetectionThirdPartyShareDisableDescription
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"SOS_KAPPA_THIRD_PARTY_SHARE_DISABLE" value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v3;
}

+ (NSString)crashDetectionThirdPartyAppWithAccessDescription
{
  int v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"SOS_KAPPA_THIRD_PARTY_APP_WITH_ACCESS" value:&stru_1F0C40F10 table:@"Localizable-kappa"];

  return (NSString *)v3;
}

+ (id)crashDetectionThirdPartyStopSharingDescriptionPhoneWithAppName:(id)a3
{
  id v4 = a3;
  int v5 = [a1 isKappaUnmasked];
  __int16 v6 = NSString;
  int v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = v7;
  if (v5) {
    id v9 = @"KAPPA_THIRD_PARTY_STOP_SHARING_TITLE_PHONE";
  }
  else {
    id v9 = @"KAPPA_THIRD_PARTY_STOP_SHARING_TITLE_PHONE_MASKED";
  }
  id v10 = [v7 localizedStringForKey:v9 value:&stru_1F0C40F10 table:@"Localizable-kappa"];
  BOOL v11 = objc_msgSend(v6, "stringWithFormat:", v10, v4);

  return v11;
}

+ (id)crashDetectionThirdPartyStopSharingDescriptionWatchWithAppName:(id)a3
{
  id v4 = a3;
  int v5 = [a1 isKappaUnmasked];
  __int16 v6 = NSString;
  int v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = v7;
  if (v5) {
    id v9 = @"KAPPA_THIRD_PARTY_STOP_SHARING_TITLE_WATCH";
  }
  else {
    id v9 = @"KAPPA_THIRD_PARTY_STOP_SHARING_TITLE_WATCH_MASKED";
  }
  id v10 = [v7 localizedStringForKey:v9 value:&stru_1F0C40F10 table:@"Localizable-kappa"];
  BOOL v11 = objc_msgSend(v6, "stringWithFormat:", v10, v4);

  return v11;
}

+ (id)crashDetectionThirdPartyBundleId
{
  int v2 = [getSABundleManagerClass() crashDetectionManager];
  BOOL v3 = [v2 approvedApps];
  id v4 = [v3 firstObject];
  int v5 = [v4 bundleId];

  return v5;
}

+ (BOOL)shouldShowCrashDetectionThirdPartySettingsForPairedDevice:(BOOL)a3
{
  if (![a1 isDeviceWatchUsePairedDevice:a3])
  {
    int v12 = [a1 getKappaThirdPartyApp];
    id v4 = v12;
    if (v12)
    {
      BOOL v11 = [v12 deviceType] == 0;
      goto LABEL_12;
    }
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_12;
  }
  id v4 = [a1 crashDetectionThirdPartyBundleId];
  if (!v4) {
    goto LABEL_11;
  }
  int v5 = [MEMORY[0x1E4F79EF0] sharedInstance];
  __int16 v6 = [v5 getActivePairedDevice];

  int v7 = [getACXDeviceConnectionClass() sharedDeviceConnection];
  id v14 = 0;
  char v8 = [v7 getApplicationIsInstalled:0 withBundleID:v4 onPairedDevice:v6 error:&v14];
  id v9 = v14;

  if (v9)
  {
    id v10 = sos_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SOSUtilities shouldShowCrashDetectionThirdPartySettingsForPairedDevice:]();
    }
  }
  if ((v8 & 1) == 0) {
    goto LABEL_11;
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

+ (void)thirdPartySettingsSpecifiersForRemoteDeviceWithTarget:(id)a3 forApp:(id)a4 disableAction:(SEL)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__SOSUtilities_thirdPartySettingsSpecifiersForRemoteDeviceWithTarget_forApp_disableAction_withCompletion___block_invoke;
  v14[3] = &unk_1E6064448;
  id v15 = v10;
  id v16 = v11;
  id v17 = a1;
  SEL v18 = a5;
  id v12 = v10;
  id v13 = v11;
  [a4 getLocalizedNameForPairedDeviceWithCompletion:v14];
}

void __106__SOSUtilities_thirdPartySettingsSpecifiersForRemoteDeviceWithTarget_forApp_disableAction_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) thirdPartySettingsSpecifiersWithTarget:*(void *)(a1 + 32) displayName:a2 forPairedDevice:1 disableAction:*(void *)(a1 + 56)];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

+ (id)thirdPartySettingsSpecifiersWithTarget:(id)a3 forApp:(id)a4 disableAction:(SEL)a5
{
  id v8 = a3;
  id v9 = [a4 getLocalizedName];
  id v10 = [a1 thirdPartySettingsSpecifiersWithTarget:v8 displayName:v9 forPairedDevice:0 disableAction:a5];

  return v10;
}

+ (id)thirdPartySettingsSpecifiersWithTarget:(id)a3 displayName:(id)a4 forPairedDevice:(BOOL)a5 disableAction:(SEL)a6
{
  BOOL v7 = a5;
  id v30 = a3;
  id v10 = a4;
  id v11 = objc_opt_new();
  id v12 = [getPSSpecifierClass() groupSpecifierWithID:@"SHARE_CRASH_EVENT_GROUP"];
  if ([a1 isDeviceWatchUsePairedDevice:v7]) {
    +[SOSUtilities crashDetectionThirdPartyFooterDescriptionWatch];
  }
  else {
  id v13 = +[SOSUtilities crashDetectionThirdPartyFooterDescriptionPhone];
  }
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  id v14 = (void *)getPSFooterTextGroupKeySymbolLoc_ptr;
  uint64_t v34 = getPSFooterTextGroupKeySymbolLoc_ptr;
  if (!getPSFooterTextGroupKeySymbolLoc_ptr)
  {
    id v15 = (void *)PreferencesLibrary();
    v32[3] = (uint64_t)dlsym(v15, "PSFooterTextGroupKey");
    getPSFooterTextGroupKeySymbolLoc_ptr = v32[3];
    id v14 = (void *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v14)
  {
    +[SOSUtilities thirdPartySettingsSpecifiersWithTarget:displayName:forPairedDevice:disableAction:]();
LABEL_17:
    +[SOSUtilities thirdPartySettingsSpecifiersWithTarget:displayName:forPairedDevice:disableAction:]();
    goto LABEL_18;
  }
  [v12 setProperty:v13 forKey:*v14];

  [v11 addObject:v12];
  id PSSpecifierClass = getPSSpecifierClass();
  id v17 = +[SOSUtilities crashDetectionThirdPartyAppWithAccessDescription];
  SEL v18 = [PSSpecifierClass groupSpecifierWithID:@"SHARE_CRASH_APP_WITH_ACCESS_GROUP" name:v17];

  [v11 addObject:v18];
  CGAffineTransform v19 = [getPSSpecifierClass() preferenceSpecifierNamed:v10 target:a1 set:0 get:0 detail:0 cell:3 edit:0];
  objc_msgSend(v11, "ps_addSpecifier:toGroup:", v19, v18);
  int v20 = [getPSSpecifierClass() groupSpecifierWithID:@"SOS_KAPPA_THIRD_PARTY_APP_DISABLE_GROUP"];
  objc_msgSend(v11, "ps_addGroup:afterGroup:", v20, v18);
  id v21 = getPSSpecifierClass();
  double v22 = +[SOSUtilities crashDetectionThirdPartyShareDisableDescription];
  id v23 = [v21 deleteButtonSpecifierWithName:v22 target:v30 action:a6];

  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  id v24 = (void *)getPSAllowMultilineTitleKeySymbolLoc_ptr;
  uint64_t v34 = getPSAllowMultilineTitleKeySymbolLoc_ptr;
  if (!getPSAllowMultilineTitleKeySymbolLoc_ptr)
  {
    id v25 = (void *)PreferencesLibrary();
    v32[3] = (uint64_t)dlsym(v25, "PSAllowMultilineTitleKey");
    getPSAllowMultilineTitleKeySymbolLoc_ptr = v32[3];
    id v24 = (void *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v24) {
    goto LABEL_17;
  }
  [v23 setProperty:MEMORY[0x1E4F1CC38] forKey:*v24];
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  id v26 = (void *)getPSAlignmentKeySymbolLoc_ptr;
  uint64_t v34 = getPSAlignmentKeySymbolLoc_ptr;
  if (!getPSAlignmentKeySymbolLoc_ptr)
  {
    id v27 = (void *)PreferencesLibrary();
    v32[3] = (uint64_t)dlsym(v27, "PSAlignmentKey");
    getPSAlignmentKeySymbolLoc_ptr = v32[3];
    id v26 = (void *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v26)
  {
LABEL_18:
    v29 = (_Unwind_Exception *)+[SOSUtilities thirdPartySettingsSpecifiersWithTarget:displayName:forPairedDevice:disableAction:]();
    _Block_object_dispose(&v31, 8);
    _Unwind_Resume(v29);
  }
  [v23 setProperty:&unk_1F0C4A9A8 forKey:*v26];
  objc_msgSend(v11, "ps_addSpecifier:toGroup:", v23, v20);

  return v11;
}

+ (__CFBundle)getKappaThirdPartyActiveAppBundle
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)TCCAccessCopyInformation();
  if (v2)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v20;
      id v8 = (void *)MEMORY[0x1E4FA99D8];
      id v9 = (void *)MEMORY[0x1E4FA99E8];
      *(void *)&long long v5 = 138412546;
      long long v18 = v5;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        id v12 = objc_msgSend(v11, "objectForKeyedSubscript:", *v8, v18, (void)v19);

        id v13 = CFBundleGetIdentifier((CFBundleRef)v12);
        id v14 = [v11 objectForKeyedSubscript:*v9];
        int v15 = [v14 BOOLValue];

        id v16 = sos_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = v18;
          id v24 = v13;
          __int16 v25 = 1024;
          int v26 = v15;
          _os_log_impl(&dword_1B3A94000, v16, OS_LOG_TYPE_DEFAULT, "KappaThirdParty,getKappaThirdPartyActiveAppBundle, bundleID:%@, grant status: %d", buf, 0x12u);
        }

        if (!v12) {
          LOBYTE(v15) = 0;
        }

        if (v15) {
          break;
        }
        if (v6 == ++v10)
        {
          uint64_t v6 = [v3 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      id v12 = 0;
    }
  }
  else
  {
    id v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "KappaThirdParty,getKappaThirdPartyActiveAppBundle, No element registered for the service. Return nil app name", buf, 2u);
    }
    id v12 = 0;
  }

  return (__CFBundle *)v12;
}

+ (void)setKappaThirdPartyActiveApp:(BOOL)a3 presentConfirmationOnViewController:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 getKappaThirdPartyApp];
  [a1 setKappaThirdPartyActive:v6 forApp:v10 forPairedDevice:0 presentConfirmationOnViewController:v9 completion:v8];
}

+ (void)setKappaThirdPartyActive:(BOOL)a3 forApp:(id)a4 forPairedDevice:(BOOL)a5 presentConfirmationOnViewController:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = (void (**)(id, void))a7;
  if (v10)
  {
    int v15 = sos_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3A94000, v15, OS_LOG_TYPE_DEFAULT, "KappaThirdParty,setKappaThirdPartyActiveApp,the request is invalid", buf, 2u);
    }

    v14[2](v14, 0);
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke;
    v19[3] = &unk_1E6064498;
    id v23 = a1;
    BOOL v24 = v9;
    id v20 = v13;
    long long v22 = v14;
    id v16 = v12;
    id v21 = v16;
    id v17 = (void (**)(void, void))MEMORY[0x1B3EC08A0](v19);
    if (v9)
    {
      [v16 getLocalizedNameForPairedDeviceWithCompletion:v17];
    }
    else
    {
      long long v18 = [v16 getLocalizedName];
      ((void (**)(void, void *))v17)[2](v17, v18);
    }
  }
}

void __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 56);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  id v5 = a2;
  if ([v3 isDeviceWatchUsePairedDevice:v4]) {
    +[SOSUtilities crashDetectionThirdPartyStopSharingDescriptionWatchWithAppName:v5];
  }
  else {
  BOOL v6 = +[SOSUtilities crashDetectionThirdPartyStopSharingDescriptionPhoneWithAppName:v5];
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = +[SOSUtilities crashDetectionThirdPartyAlertTitle];
  BOOL v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v10 = [v9 localizedStringForKey:@"KAPPA_THIRD_PARTY_STOP_SHARING_CANCEL" value:&stru_1F0C40F10 table:@"Localizable-kappa"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke_2;
  v16[3] = &unk_1E6064340;
  id v17 = *(id *)(a1 + 48);
  id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"KAPPA_THIRD_PARTY_STOP_SHARING_CONTINUE" value:&stru_1F0C40F10 table:@"Localizable-kappa"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke_1015;
  v13[3] = &unk_1E6064470;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  +[SOSUtilities presentConfirmationOnViewController:v7 title:v8 message:v6 cancelTitle:v10 cancelHandler:v16 confirmTitle:v12 confirmHandler:v13];
}

uint64_t __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "KappaThirdParty,setKappaThirdPartyActiveApp,No Selected on confirmation alert", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __111__SOSUtilities_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion___block_invoke_1015(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v10 = 0;
  SEL v2 = NSSelectorFromString(&cfstr_SetaccessForbu.isa);
  getSAAuthorizationClass();
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)MEMORY[0x1E4F1CA18];
    uint64_t v4 = [getSAAuthorizationClass() methodSignatureForSelector:v2];
    id v5 = [v3 invocationWithMethodSignature:v4];

    [v5 setSelector:v2];
    [v5 setTarget:getSAAuthorizationClass()];
    char v9 = 0;
    *(void *)long long buf = [*(id *)(a1 + 32) bundleId];
    [v5 setArgument:&v9 atIndex:2];
    [v5 setArgument:buf atIndex:3];
    [v5 invoke];
    [v5 getReturnValue:&v10];
  }
  else
  {
    BOOL v6 = [*(id *)(a1 + 32) bundleId];
    BOOL v10 = TCCAccessSetForBundleId() != 0;
  }
  uint64_t v7 = sos_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "KappaThirdParty,setKappaThirdPartyActiveApp,revoking the right to receive kappa data completed with status:%d", buf, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)isDeviceWatchUsePairedDevice:(BOOL)a3
{
  return a3;
}

+ (BOOL)activeDeviceSupportsMandrake
{
  SEL v2 = [a1 activeDevice];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4B46048D-CD7A-4E74-B615-D9376CBCBBFF"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

+ (BOOL)activeDeviceHasMandrake
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a1 activeDeviceSupportsMandrake])
  {
    buf[0] = 0;
    id v3 = [getACXDeviceConnectionClass() sharedDeviceConnection];
    char v4 = [a1 activeDevice];
    id v11 = 0;
    int v5 = [v3 getApplicationIsInstalled:buf withBundleID:@"com.apple.Mandrake" onPairedDevice:v4 error:&v11];
    id v6 = v11;

    if (!v5 || v6)
    {
      id v8 = sos_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[SOSUtilities activeDeviceHasMandrake]();
      }

      BOOL v7 = 0;
    }
    else
    {
      BOOL v7 = buf[0] != 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  char v9 = sos_mandrake_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    BOOL v13 = v7;
    _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "activeDeviceHasMandrake:%{BOOL}d", buf, 8u);
  }

  return v7;
}

+ (BOOL)longPressTriggersMandrake
{
  SEL v2 = [a1 _SOSDomainAccessor];
  id v3 = [v2 objectForKey:@"SOSLongPressTriggersMandrakeKey"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

+ (void)setLongPressTriggersMandrake:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [a1 _SOSDomainAccessor];
  int v5 = [NSNumber numberWithBool:v3];
  [v4 setObject:v5 forKey:@"SOSLongPressTriggersMandrakeKey"];

  id v6 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SOSUtilities_setLongPressTriggersMandrake___block_invoke;
  block[3] = &unk_1E6064200;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

void __45__SOSUtilities_setLongPressTriggersMandrake___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) synchronize];
  SEL v2 = objc_opt_new();
  BOOL v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"SOSLongPressTriggersMandrakeKey"];
  [v2 synchronizeNanoDomain:@"com.apple.SOS" keys:v3];

  char v4 = MEMORY[0x1E4F14428];

  dispatch_async(v4, &__block_literal_global_1027);
}

void __45__SOSUtilities_setLongPressTriggersMandrake___block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SOSMandrakeStateChangedNotification", 0, 0, 1u);
}

+ (BOOL)isSOSMessagesUrgentAlertingAvailable
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSOSMessagesUrgentAlertingEnabled
{
  if (![a1 isSOSMessagesUrgentAlertingAvailable]) {
    return 0;
  }
  BOOL v3 = [a1 _sosPrefsValueForKey:@"SOSMessagesUrgentAlertingEnabledKey"];
  char v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

+ (void)setSOSMessagesUrgentAlertingEnabled:(BOOL)a3
{
  char v4 = [NSNumber numberWithBool:a3];
  [a1 _setSOSPrefsValue:v4 forKey:@"SOSMessagesUrgentAlertingEnabledKey"];

  char v5 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SOSUtilities_setSOSMessagesUrgentAlertingEnabled___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_async(v5, block);
}

void __52__SOSUtilities_setSOSMessagesUrgentAlertingEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _synchronizeSOSPrefs];
  id v1 = objc_opt_new();
  SEL v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"SOSMessagesUrgentAlertingEnabledKey"];
  [v1 synchronizeUserDefaultsDomain:@"com.apple.SOS" keys:v2];

  BOOL v3 = MEMORY[0x1E4F14428];

  dispatch_async(v3, &__block_literal_global_1031);
}

void __52__SOSUtilities_setSOSMessagesUrgentAlertingEnabled___block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SOSMessagesUrgentAlertingStateChangedNotification", 0, 0, 1u);
}

+ (BOOL)sosMessagesUrgentAlertingBypassesMute
{
  if (![a1 isSOSMessagesUrgentAlertingAvailable]) {
    return 0;
  }
  BOOL v3 = [a1 _sosPrefsValueForKey:@"SOSMessagesUrgentAlertingBypassesMuteKey"];
  char v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

+ (void)setSOSMessagesUrgentAlertingBypassesMute:(BOOL)a3
{
  char v4 = [NSNumber numberWithBool:a3];
  [a1 _setSOSPrefsValue:v4 forKey:@"SOSMessagesUrgentAlertingBypassesMuteKey"];

  char v5 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SOSUtilities_setSOSMessagesUrgentAlertingBypassesMute___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_async(v5, block);
}

void __57__SOSUtilities_setSOSMessagesUrgentAlertingBypassesMute___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _synchronizeSOSPrefs];
  id v1 = objc_opt_new();
  SEL v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"SOSMessagesUrgentAlertingBypassesMuteKey"];
  [v1 synchronizeUserDefaultsDomain:@"com.apple.SOS" keys:v2];

  BOOL v3 = MEMORY[0x1E4F14428];

  dispatch_async(v3, &__block_literal_global_1033);
}

void __57__SOSUtilities_setSOSMessagesUrgentAlertingBypassesMute___block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SOSMessagesUrgentAlertingStateChangedNotification", 0, 0, 1u);
}

+ (id)sosLocationBundle
{
  if (sosLocationBundle_onceToken != -1) {
    dispatch_once(&sosLocationBundle_onceToken, &__block_literal_global_1035);
  }
  SEL v2 = (void *)sosLocationBundle___bundle;

  return v2;
}

void __33__SOSUtilities_sosLocationBundle__block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v1 = [v0 URLsForDirectory:5 inDomains:8];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v6), "URLByAppendingPathComponent:", @"LocationBundles", (void)v12);
      id v8 = [v7 URLByAppendingPathComponent:@"Emergency SOS.bundle"];
      uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithURL:v8];
      BOOL v10 = (void *)sosLocationBundle___bundle;
      sosLocationBundle___bundle = v9;

      uint64_t v11 = sosLocationBundle___bundle;
      if (v11) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (SOSStatus)currentDeviceSOSStatus
{
  return (SOSStatus *)+[SOSUtilities fetchSOSStatusWithKey:@"SOSMostRecentSOSStatusKey"];
}

+ (void)setCurrentDeviceSOSStatus:(id)a3
{
}

+ (SOSStatus)pairedDeviceSOSStatus
{
  return (SOSStatus *)+[SOSUtilities fetchSOSStatusWithKey:@"SOSMostRecentPairedSOSStatusKey"];
}

+ (void)setPairedDeviceSOSStatus:(id)a3
{
}

+ (SOSStatus)mostRecentSOSStatus
{
  id v2 = +[SOSUtilities currentDeviceSOSStatus];
  uint64_t v3 = +[SOSUtilities pairedDeviceSOSStatus];
  uint64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = [v2 timeOfDetection];

    uint64_t v4 = v3;
    if (v5)
    {
      uint64_t v4 = v2;
      if (v3)
      {
        uint64_t v6 = [v3 timeOfDetection];

        uint64_t v4 = v2;
        if (v6)
        {
          id v7 = [v2 timeOfDetection];
          [v7 timeIntervalSince1970];
          double v9 = v8;
          BOOL v10 = [v3 timeOfDetection];
          [v10 timeIntervalSince1970];
          double v12 = v11;

          if (v9 >= v12) {
            uint64_t v4 = v2;
          }
          else {
            uint64_t v4 = v3;
          }
        }
      }
    }
  }
  id v13 = v4;

  return (SOSStatus *)v13;
}

+ (BOOL)shouldBlockNonEmergencyCalls
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = +[SOSUtilities mostRecentSOSStatus];
  uint64_t v3 = v2;
  if (v2 && [v2 shouldBlockNonEmergencyCalls])
  {
    uint64_t v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      double v8 = v3;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSUtilities,should block non-emergency calls due to %@", (uint8_t *)&v7, 0xCu);
    }

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)fetchSOSStatusWithKey:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [a1 _sosPrefsValueForKey:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    uint64_t v9 = (void *)[v7 initWithArray:v8];
    id v17 = 0;
    BOOL v10 = [v6 unarchivedObjectOfClasses:v9 fromData:v5 error:&v17];
    double v11 = v17;

    if (v10)
    {
      char v12 = [v10 isValid];
      id v13 = sos_default_log();
      long long v14 = v13;
      if ((v12 & 1) == 0)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          +[SOSUtilities fetchSOSStatusWithKey:].cold.4();
        }

        [a1 _setSOSPrefsValue:0 forKey:v4];
        id v15 = 0;
        goto LABEL_15;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        +[SOSUtilities fetchSOSStatusWithKey:]();
      }
    }
    else
    {
      long long v14 = sos_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[SOSUtilities fetchSOSStatusWithKey:]();
      }
    }

    id v15 = v10;
LABEL_15:

    goto LABEL_16;
  }
  double v11 = sos_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[SOSUtilities fetchSOSStatusWithKey:](v11);
  }
  id v15 = 0;
LABEL_16:

  return v15;
}

+ (void)setSOSStatus:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v14 = 0;
  double v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v14];
  id v9 = v14;
  BOOL v10 = sos_default_log();
  double v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[SOSUtilities setSOSStatus:withKey:]();
    }

    [a1 _setSOSPrefsValue:v8 forKey:v7];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SOSUtilities setSOSStatus:withKey:]();
    }
  }
  char v12 = dispatch_get_global_queue(2, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__SOSUtilities_setSOSStatus_withKey___block_invoke;
  v13[3] = &__block_descriptor_40_e5_v8__0l;
  void v13[4] = a1;
  dispatch_async(v12, v13);
}

uint64_t __37__SOSUtilities_setSOSStatus_withKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _synchronizeSOSPrefs];
}

+ (BOOL)_isInternalDevice
{
  return MEMORY[0x1F40CD650]("com.apple.SOS", a2);
}

+ (BOOL)isMessagesAppInstalled
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  char v3 = [v2 applicationIsInstalled:@"com.apple.MobileSMS"];

  return v3;
}

+ (BOOL)_isCarryDevice
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"ExperimentGroup", @"com.apple.da");
  char v3 = [v2 isEqualToString:@"walkabout"];

  return v3;
}

+ (id)_overrideForDefaultsKey:(id)a3 expectedClass:(Class)a4 defaultValue:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (![a1 _isInternalDevice]) {
    goto LABEL_9;
  }
  id v9 = +[SOSUtilities _sosPrefsValueForKey:v7];
  BOOL v10 = sos_config_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_debug_impl(&dword_1B3A94000, v10, OS_LOG_TYPE_DEBUG, "#debugOverride - _overrideForDefaultsKey:%{public}@ (default %{public}@, testing %{public}@)", (uint8_t *)&v13, 0x20u);
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_9:
    id v9 = v8;
    goto LABEL_10;
  }
  double v11 = sos_config_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, "#debugOverride - _overrideForDefaultsKey:%{public}@ (%{public}@ => %{public}@)", (uint8_t *)&v13, 0x20u);
  }

LABEL_10:

  return v9;
}

+ (id)numberOverrideForDefaultsKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _overrideForDefaultsKey:v7 expectedClass:objc_opt_class() defaultValue:v6];

  return v8;
}

+ (BOOL)BOOLOverrideForDefaultsKey:(id)a3 defaultValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithBool:v4];
  id v9 = [a1 numberOverrideForDefaultsKey:v7 defaultValue:v8];

  LOBYTE(v6) = [v9 BOOLValue];
  return (char)v6;
}

+ (id)stringOverrideForDefaultsKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _overrideForDefaultsKey:v7 expectedClass:objc_opt_class() defaultValue:v6];

  return v8;
}

+ (BOOL)isMountStateTrackingEnabled
{
  id v2 = [a1 _sosPrefsValueForKey:@"SOSMountStateTrackingKey"];
  char v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (double)mountProbabilityThreshold
{
  id v2 = [a1 _sosPrefsValueForKey:@"SOSMountProbabilityThresholdKey"];
  char v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.75;
  }

  return v5;
}

+ (void)setNumberOfSideButtonPresses:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "SOSUtilities,setting number of presses not supported", v1, 2u);
}

+ (void)setNumberOfSideButtonPresses:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)hasActiveSIMForClient:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "Error retrieving subscription info: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)setShouldPlayAudioDuringCountdown:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "SOSUtilities,attempted to set shouldPlayAudioDuringCountdown when SOS flow is silenced", v1, 2u);
}

+ (void)shouldShowCrashDetectionThirdPartySettingsForPairedDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

+ (uint64_t)thirdPartySettingsSpecifiersWithTarget:displayName:forPairedDevice:disableAction:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return +[SOSUtilities activeDeviceHasMandrake](v0);
}

+ (void)activeDeviceHasMandrake
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

+ (void)fetchSOSStatusWithKey:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  os_log_type_t v2 = "+[SOSUtilities fetchSOSStatusWithKey:]";
  _os_log_debug_impl(&dword_1B3A94000, log, OS_LOG_TYPE_DEBUG, "%s - no SOS status found", (uint8_t *)&v1, 0xCu);
}

+ (void)fetchSOSStatusWithKey:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1B3A94000, v0, OS_LOG_TYPE_ERROR, "%s - Unable to decode currentDeviceSOSStatus, error: %@", (uint8_t *)v1, 0x16u);
}

+ (void)fetchSOSStatusWithKey:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1B3A94000, v0, OS_LOG_TYPE_DEBUG, "%s - loaded SOS status, sosStatus: %@", (uint8_t *)v1, 0x16u);
}

+ (void)fetchSOSStatusWithKey:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1B3A94000, v0, OS_LOG_TYPE_ERROR, "%s - SOSStatus is invalid: %@", (uint8_t *)v1, 0x16u);
}

+ (void)setSOSStatus:withKey:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

+ (void)setSOSStatus:withKey:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1B3A94000, v0, OS_LOG_TYPE_DEBUG, "%s - saving SOS status, sosStatus: %@", (uint8_t *)v1, 0x16u);
}

@end