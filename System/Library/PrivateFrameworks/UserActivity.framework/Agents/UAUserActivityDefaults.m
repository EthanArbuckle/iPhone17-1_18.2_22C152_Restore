@interface UAUserActivityDefaults
+ (id)sharedDefaults;
- (BOOL)BOOLValueForKey:(id)a3 default:(BOOL)a4;
- (BOOL)activityAdvertisingAllowed;
- (BOOL)activityBTLESharingEnabled;
- (BOOL)activityContinuationAllowed;
- (BOOL)activityReceivingAllowed;
- (BOOL)clipboardSharingEnabled;
- (BOOL)debugCrossoverAllActivities;
- (BOOL)debugEnablePinging;
- (BOOL)debugEnablePrefetch;
- (BOOL)debugForceNewPayloadEncoder;
- (BOOL)debugForceOldPayloadEncoder;
- (BOOL)debugIgnoreAppsUsedForDevelopment;
- (BOOL)debugReadvertiseImmediately;
- (BOOL)dontSendActivityTitle;
- (BOOL)enableAutomaticRendevousPairing;
- (BOOL)enableHandoffInPowerSaverMode;
- (BOOL)enableNetworkControlListener;
- (BOOL)enableSharingFramework;
- (BOOL)ignoreLostDevice;
- (BOOL)isBatterySaverModeEnabled;
- (BOOL)localPasteboardRefection;
- (BOOL)loggingAdvertiserEnabled;
- (BOOL)multiHandoffEnabled;
- (BOOL)shouldIgnoreBluetoothDisabled;
- (NSUserDefaults)userDefaults;
- (UAUserActivityDefaults)init;
- (double)activePayloadUpdateInterval;
- (double)advertisedItemWhichIsWebBrowserIntervalToRememberEarlierActivities;
- (double)bestAppSuggestionSupressionIntervalForUnchangingItem;
- (double)cornerActionItemAdditionalTimeToLiveAfterValidIntervalExpires;
- (double)cornerActionItemMaximumTimeForBTLEItemToLive;
- (double)cornerActionItemSupressionInterval;
- (double)cornerActionItemTimeout;
- (double)debugAdditionalPayloadReceiveTimeInterval;
- (double)debugValidatePayloadFetchTimeInterval;
- (double)debugValidateRetryPayloadFetchFailureInterval;
- (double)deviceLockDelayBeforeRemovingHandoffAdvertisement;
- (double)deviceLockDelayBeforeRemovingPasteboardAdvertisement;
- (double)handoffPayloadRequestTimout;
- (double)intervalToAskClientWithUnsynchronizedDocumentsToUpdate;
- (double)lastActiveItemRemovalDelay;
- (double)localPasteboardAvalibilityClearedTimeout;
- (double)localPasteboardAvalibilityTimeout;
- (double)maximumAdvertisementsTimeInterval;
- (double)maximumTimeoutAfterAdvertisingEndsThatActivityCanBeResumed;
- (double)maximumTimeoutToWaitForClientProcessToUpdateActivityInformation;
- (double)minimumIntervalBetweenAdvertisements;
- (double)minimumTimeForAnAdvertisementToLive;
- (double)minimumTimeToLiveAfterRemovingAdvertisement;
- (double)pasteboardHideUIDelay;
- (double)pasteboardPasteRequestTimeout;
- (double)pasteboardShowUIDelay;
- (double)pasteboardStreamWatchdogTimeout;
- (double)pasteboardTypeRequestTimeout;
- (double)pasteboardUIMinimumDurration;
- (double)pasteboardUITimeRemainingDelay;
- (double)payloadFetchResponseDelay;
- (double)receivedBTLEItemTimeToLiveAfterDeviceLostIfPayloadIsQueued;
- (double)recentlyEligibleItemInterval;
- (double)remotePasteboardAvailableTimeout;
- (double)screenDimDelayBeforeRemovingAdvertisements;
- (double)screenDimDelayBeforeRemovingPasteboardAdvertisement;
- (double)screenSaverDelayBeforeRemovingPasteboardAdvertisement;
- (double)screenSaverDelayToRemovingAdvertisements;
- (double)systemIdleDelayBeforeRemovingAdvertisements;
- (double)timeIntervalForKey:(id)a3 default:(double)a4;
- (double)userIdleInterval;
- (double)userIdleRemovalDelay;
- (id)cornerActionItemDefaults;
- (id)defaults:(BOOL)a3;
- (id)rendevousPairingType;
- (id)statusString;
- (int)networkControlListenerPort;
- (int64_t)activityPayloadWarningSizeInBytes;
- (int64_t)debugUserActivityTimeOffset;
- (int64_t)debugValidateSampleResponseMaximumActivityPayloadSizeInBytes;
- (int64_t)debugValidateSampleResponseMinimumActivityPayloadSizeInBytes;
- (int64_t)integerValueForKey:(id)a3 default:(int64_t)a4;
- (int64_t)maximumActivityPayloadSizeInBytes;
- (int64_t)maximumAdvertisementsPerTimeInterval;
- (int64_t)pasteboardEmbeddedPayloadSizeLimitInBytes;
- (void)setDefault:(id)a3 value:(id)a4;
- (void)setEnableSharingFramework:(BOOL)a3;
- (void)setLocalPasteboardReflection:(BOOL)a3;
@end

@implementation UAUserActivityDefaults

- (BOOL)activityAdvertisingAllowed
{
  if (!byte_1000E67F4)
  {
    int v3 = MKBDeviceUnlockedSinceBoot();
    byte_1000E67F4 = v3 != 0;
    if (!v3) {
      return 0;
    }
  }
  if (![(UAUserActivityDefaults *)self BOOLValueForKey:@"ActivityAdvertisingAllowed" default:1]|| ![(UAUserActivityDefaults *)self BOOLValueForKey:@"EnableHandoffInPowerSaverMode" default:1]&& [(UAUserActivityDefaults *)self isBatterySaverModeEnabled])
  {
    return 0;
  }
  v5 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v4 = [v5 isActivityContinuationAllowed];

  return v4;
}

- (double)timeIntervalForKey:(id)a3 default:(double)a4
{
  id v6 = a3;
  v7 = [(UAUserActivityDefaults *)self userDefaults];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    v9 = [(UAUserActivityDefaults *)self userDefaults];
    [v9 doubleForKey:v6];
    a4 = v10;
  }
  return a4;
}

+ (id)sharedDefaults
{
  if (qword_1000E67E0 != -1) {
    dispatch_once(&qword_1000E67E0, &stru_1000C59E0);
  }
  v2 = (void *)qword_1000E67D8;

  return v2;
}

- (BOOL)debugEnablePinging
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGEnablePinging"];

  return v3;
}

- (BOOL)BOOLValueForKey:(id)a3 default:(BOOL)a4
{
  id v6 = a3;
  v7 = [(UAUserActivityDefaults *)self userDefaults];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    v9 = [(UAUserActivityDefaults *)self userDefaults];
    a4 = [v9 BOOLForKey:v6];
  }
  return a4;
}

- (BOOL)debugCrossoverAllActivities
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGCrossoverAllActivities"];

  return v3;
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (double)lastActiveItemRemovalDelay
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"LastActiveItemRemovalDelay" default:0.0];
  return result;
}

- (UAUserActivityDefaults)init
{
  v8.receiver = self;
  v8.super_class = (Class)UAUserActivityDefaults;
  v2 = [(UAUserActivityDefaults *)&v8 init];
  if (v2)
  {
    unsigned __int8 v3 = (NSUserDefaults *)objc_alloc_init((Class)NSUserDefaults);
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v3;

    v5 = v2->_userDefaults;
    id v6 = [(UAUserActivityDefaults *)v2 cornerActionItemDefaults];
    [(NSUserDefaults *)v5 registerDefaults:v6];
  }
  return v2;
}

- (id)cornerActionItemDefaults
{
  return &off_1000CC860;
}

- (int64_t)integerValueForKey:(id)a3 default:(int64_t)a4
{
  id v6 = a3;
  v7 = [(UAUserActivityDefaults *)self userDefaults];
  objc_super v8 = [v7 objectForKey:v6];

  if (v8)
  {
    v9 = [(UAUserActivityDefaults *)self userDefaults];
    a4 = (int64_t)[v9 integerForKey:v6];
  }
  return a4;
}

- (BOOL)isBatterySaverModeEnabled
{
  if (qword_1000E67E8 != -1) {
    dispatch_once(&qword_1000E67E8, &stru_1000C5A00);
  }
  BOOL result = dword_1000E67F0;
  if (dword_1000E67F0)
  {
    uint64_t state64 = 0;
    if (notify_get_state(dword_1000E67F0, &state64)) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = state64 == 0;
    }
    return !v3;
  }
  return result;
}

- (BOOL)activityReceivingAllowed
{
  if (!byte_1000E67F4)
  {
    int v3 = MKBDeviceUnlockedSinceBoot();
    byte_1000E67F4 = v3 != 0;
    if (!v3) {
      return 0;
    }
  }
  if (![(UAUserActivityDefaults *)self BOOLValueForKey:@"ActivityReceivingAllowed" default:1]|| ![(UAUserActivityDefaults *)self BOOLValueForKey:@"EnableHandoffInPowerSaverMode" default:1]&& [(UAUserActivityDefaults *)self isBatterySaverModeEnabled])
  {
    return 0;
  }
  v5 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v4 = [v5 isActivityContinuationAllowed];

  return v4;
}

- (BOOL)activityContinuationAllowed
{
  if (![(UAUserActivityDefaults *)self activityAdvertisingAllowed]
    || ![(UAUserActivityDefaults *)self activityReceivingAllowed])
  {
    return 0;
  }
  int v3 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v4 = [v3 isActivityContinuationAllowed];

  return v4;
}

- (BOOL)clipboardSharingEnabled
{
  BOOL v3 = [(UAUserActivityDefaults *)self BOOLValueForKey:@"ClipboardSharingEnabled" default:1];
  if (v3)
  {
    LOBYTE(v3) = [(UAUserActivityDefaults *)self activityContinuationAllowed];
  }
  return v3;
}

- (BOOL)multiHandoffEnabled
{
  return [(UAUserActivityDefaults *)self BOOLValueForKey:@"MultiHandoffEnabled" default:0];
}

- (BOOL)enableHandoffInPowerSaverMode
{
  return [(UAUserActivityDefaults *)self BOOLValueForKey:@"EnableHandoffInPowerSaverMode" default:1];
}

- (BOOL)activityBTLESharingEnabled
{
  return [(UAUserActivityDefaults *)self BOOLValueForKey:@"ActivityBTLESharingEnabled" default:1];
}

- (BOOL)loggingAdvertiserEnabled
{
  return [(UAUserActivityDefaults *)self BOOLValueForKey:@"LoggingAdvertiserEnabled" default:1];
}

- (double)userIdleInterval
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"UserIdleInterval" default:120.0];
  return result;
}

- (double)userIdleRemovalDelay
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"UserIdleRemoveDelay" default:1.0];
  return result;
}

- (double)deviceLockDelayBeforeRemovingHandoffAdvertisement
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"DeviceLockAdvertisementDelay" default:8.0];
  return result;
}

- (double)deviceLockDelayBeforeRemovingPasteboardAdvertisement
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"DeviceLockPasteboardAdvertisementDelay" default:10.0];
  return result;
}

- (double)minimumTimeForAnAdvertisementToLive
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"MinimumTimeForAnAdvertisementToLive" default:3.0];
  return result;
}

- (double)minimumTimeToLiveAfterRemovingAdvertisement
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"MinimumTimeToLiveAfterRemovingAdvertisement" default:3.0];
  return result;
}

- (double)recentlyEligibleItemInterval
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"RecentlyEligibleItemInterval" default:3.0];
  return result;
}

- (double)screenSaverDelayToRemovingAdvertisements
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"ScreenSaverRemovalDelay" default:3.0];
  return result;
}

- (double)screenSaverDelayBeforeRemovingPasteboardAdvertisement
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"ScreenSaverPasteboardAdvertisementDelay" default:10.0];
  return result;
}

- (double)screenDimDelayBeforeRemovingAdvertisements
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"ScreenDimRemovalDelay" default:10.0];
  return result;
}

- (double)screenDimDelayBeforeRemovingPasteboardAdvertisement
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"ScreenDimPasteboardAdvertisementDelay" default:10.0];
  return result;
}

- (double)systemIdleDelayBeforeRemovingAdvertisements
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"SystemIdleRemovalDelay" default:3.0];
  return result;
}

- (double)maximumTimeoutAfterAdvertisingEndsThatActivityCanBeResumed
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"MaximumTimeoutAfterAdvertisingEndsThatActivityCanBeResumed" default:10.0];
  return result;
}

- (double)cornerActionItemSupressionInterval
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"CornerItemSupressionInternal" default:4.0];
  return result;
}

- (double)bestAppSuggestionSupressionIntervalForUnchangingItem
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"BestAppSuggestionSupressionIntervalForUnchangingItem" default:15.0];
  return result;
}

- (double)advertisedItemWhichIsWebBrowserIntervalToRememberEarlierActivities
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"AdvertisedItemWhichIsWebBrowserIntervalToRememberEarlierActivities" default:8.0];
  return result;
}

- (double)intervalToAskClientWithUnsynchronizedDocumentsToUpdate
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"IntervalToAskClientWithUnsynchronizedDocumentsToUpdate" default:5.0];
  return result;
}

- (double)cornerActionItemTimeout
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"CornerItemTimeout" default:600.0];
  return result;
}

- (double)cornerActionItemAdditionalTimeToLiveAfterValidIntervalExpires
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"UACornerActionItemAdditionalTimeToLiveAfterValidIntervalExpires" default:15.0];
  return result;
}

- (double)cornerActionItemMaximumTimeForBTLEItemToLive
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"UACornerActionItemMaximumTimeForBTLEItemToLive" default:600.0];
  return result;
}

- (double)receivedBTLEItemTimeToLiveAfterDeviceLostIfPayloadIsQueued
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"UAReceivedBTLEItemTimeToLiveAfterDeviceLostIfPayloadIsQueued" default:30.0];
  return result;
}

- (double)activePayloadUpdateInterval
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"ActivePayloadUpdateInterval" default:15.0];
  return result;
}

- (double)maximumTimeoutToWaitForClientProcessToUpdateActivityInformation
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"MaximumTimeoutToWaitForClientProcessToUpdateActivityInformation" default:1.0];
  return result;
}

- (int64_t)maximumActivityPayloadSizeInBytes
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  id v3 = [v2 integerForKey:@"MaximumActivityPayloadSizeInBytes"];

  return (int64_t)v3;
}

- (BOOL)enableNetworkControlListener
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"EnableNetworkControlListener"];

  return v3;
}

- (BOOL)enableAutomaticRendevousPairing
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"EnableAutomaticRendevousPairing"];

  return v3;
}

- (id)rendevousPairingType
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 stringForKey:@"RendevousPairingType"];

  return v3;
}

- (int)networkControlListenerPort
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  int v3 = [v2 integerForKey:@"NetworkControlListenerPort"];

  return v3;
}

- (int64_t)activityPayloadWarningSizeInBytes
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  id v3 = [v2 integerForKey:@"ActivityPayloadWarningSizeInBytes"];

  return (int64_t)v3;
}

- (double)minimumIntervalBetweenAdvertisements
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"MinimumIntervalBetweenAdvertisements" default:0.5];
  return result;
}

- (int64_t)maximumAdvertisementsPerTimeInterval
{
  return [(UAUserActivityDefaults *)self integerValueForKey:@"MaximumAdvertisementsPerTimeInterval" default:5];
}

- (double)maximumAdvertisementsTimeInterval
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"MaximumAdvertisementsTimeInterval" default:10.0];
  return result;
}

- (double)debugValidatePayloadFetchTimeInterval
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"DEBUGValidatePayloadFetchTimeInterval" default:0.0];
  return result;
}

- (double)debugAdditionalPayloadReceiveTimeInterval
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"DEBUGAdditionalPayloadReceiveTimeInterval" default:0.0];
  return result;
}

- (double)debugValidateRetryPayloadFetchFailureInterval
{
  [(UAUserActivityDefaults *)self timeIntervalForKey:@"DEBUGValidateRetryPayloadFetchFailureInterval" default:0.0];
  return result;
}

- (int64_t)debugValidateSampleResponseMinimumActivityPayloadSizeInBytes
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  id v3 = [v2 integerForKey:@"DEBUGValidateSampleResponseMinimumActivityPayloadSizeInBytes"];

  return (int64_t)v3;
}

- (int64_t)debugValidateSampleResponseMaximumActivityPayloadSizeInBytes
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  id v3 = [v2 integerForKey:@"DEBUGValidateSampleResponseMaximumActivityPayloadSizeInBytes"];

  return (int64_t)v3;
}

- (int64_t)debugUserActivityTimeOffset
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  id v3 = [v2 integerForKey:@"DEBUGUserActivityTimeOffset"];

  return (int64_t)v3;
}

- (BOOL)debugForceNewPayloadEncoder
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGForceNewPayloadEncoder"];

  return v3;
}

- (BOOL)debugForceOldPayloadEncoder
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGForceOldPayloadEncoder"];

  return v3;
}

- (BOOL)dontSendActivityTitle
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGDontSendActivityTitle"];

  return v3;
}

- (BOOL)debugReadvertiseImmediately
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGReadvertiseImmediately"];

  return v3;
}

- (BOOL)debugEnablePrefetch
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGEnablePrefetch"];

  return v3;
}

- (BOOL)debugIgnoreAppsUsedForDevelopment
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGIgnoreAppsUsedForDevelopment"];

  return v3;
}

- (BOOL)enableSharingFramework
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"EnableSharingFramework"];

  return v3;
}

- (void)setEnableSharingFramework:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UAUserActivityDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"EnableSharingFramework"];
}

- (double)localPasteboardAvalibilityTimeout
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  double v3 = (double)(uint64_t)[v2 integerForKey:@"UASharedPboardLocalAdvertisementTime"];

  return v3;
}

- (double)localPasteboardAvalibilityClearedTimeout
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  double v3 = (double)(uint64_t)[v2 integerForKey:@"UASharedPboardLocalClearedAdvertisementTime"];

  return v3;
}

- (double)remotePasteboardAvailableTimeout
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  double v3 = (double)(uint64_t)[v2 integerForKey:@"UASharedPboardRemoteAvailableTimeout"];

  return v3;
}

- (BOOL)localPasteboardRefection
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"UASharedPboardLocalReflection"];

  return v3;
}

- (void)setLocalPasteboardReflection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UAUserActivityDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"UASharedPboardLocalReflection"];
}

- (int64_t)pasteboardEmbeddedPayloadSizeLimitInBytes
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  id v3 = [v2 integerForKey:@"UASharedPboardEmbeddedPayloadSizeLimitInBytes"];

  return (int64_t)v3;
}

- (double)pasteboardUITimeRemainingDelay
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  [v2 doubleForKey:@"TimeRemainingDelay"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardShowUIDelay
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  [v2 doubleForKey:@"UASharedPboardShowUIDelayInSec"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardUIMinimumDurration
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  [v2 doubleForKey:@"UASharedPboardUIMinimumDurrationInSec"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardHideUIDelay
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  [v2 doubleForKey:@"UASharedPboardHideUIDelayInSec"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardTypeRequestTimeout
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  [v2 doubleForKey:@"TypeRequestTimeout"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardPasteRequestTimeout
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  [v2 doubleForKey:@"PasteRequestTimeout"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardStreamWatchdogTimeout
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  [v2 doubleForKey:@"PasteboardStreamWatchdogTimeout"];
  double v4 = v3;

  return v4;
}

- (double)handoffPayloadRequestTimout
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  [v2 doubleForKey:@"HandoffRequestTimeout"];
  double v4 = v3;

  return v4;
}

- (double)payloadFetchResponseDelay
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  [v2 doubleForKey:@"PayloadFetchResponseDelay"];
  double v4 = v3;

  return v4;
}

- (BOOL)shouldIgnoreBluetoothDisabled
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IgnoreBluetoothDisabled"];

  return v3;
}

- (BOOL)ignoreLostDevice
{
  v2 = [(UAUserActivityDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IgnoreLostDevice"];

  return v3;
}

- (id)statusString
{
  v22 = +[NSMutableString string];
  v27 = [(NSUserDefaults *)self->_userDefaults dictionaryRepresentation];
  id v24 = objc_alloc_init((Class)NSMutableString);
  id v23 = objc_alloc_init((Class)NSMutableString);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v2 = [(UAUserActivityDefaults *)self cornerActionItemDefaults];
  unsigned __int8 v3 = [v2 allKeys];
  double v4 = [v3 sortedArrayUsingSelector:"compare:"];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v26 = *(void *)v30;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        objc_super v8 = [v27 valueForKey:v7];
        v9 = [(UAUserActivityDefaults *)self cornerActionItemDefaults];
        double v10 = [v9 valueForKey:v7];
        unsigned __int8 v11 = [v8 isEqual:v10];

        v12 = [v8 description];
        sub_100063FF0(v12);
        if (v11) {
          v13 = {;
        }
          [v23 appendFormat:@" %@=%@", v7, v13];
        }
        else {
          v13 = {;
        }
          v14 = [(UAUserActivityDefaults *)self cornerActionItemDefaults];
          v15 = [v14 valueForKey:v7];
          v16 = [v15 description];
          v17 = sub_100063FF0(v16);
          [v24 appendFormat:@" %@=%@ (%@)", v7, v13, v17];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v5);
  }

  v18 = +[NSBundle mainBundle];
  v19 = [v18 bundleIdentifier];
  [v22 appendFormat:@"\nDefaults: (domain=%@) %@\n", v19, v24];

  id v20 = [v22 copy];

  return v20;
}

- (id)defaults:(BOOL)a3
{
  id v20 = +[NSMutableDictionary dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v4 = [(UAUserActivityDefaults *)self cornerActionItemDefaults];
  id v5 = [v4 allKeys];

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if (a3) {
          goto LABEL_8;
        }
        double v10 = [(UAUserActivityDefaults *)self cornerActionItemDefaults];
        unsigned __int8 v11 = [v10 objectForKey:v9];
        v12 = [(UAUserActivityDefaults *)self userDefaults];
        v13 = [v12 valueForKey:v9];
        unsigned __int8 v14 = [v11 isEqual:v13];

        if ((v14 & 1) == 0)
        {
LABEL_8:
          v15 = [(UAUserActivityDefaults *)self userDefaults];
          v16 = [v15 valueForKey:v9];
          [v20 setValue:v16 forKey:v9];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  id v17 = [v20 copy];

  return v17;
}

- (void)setDefault:(id)a3 value:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    uint64_t v7 = [(UAUserActivityDefaults *)self userDefaults];
    [v7 setObject:v6 forKey:v8];
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v7 = [(UAUserActivityDefaults *)self userDefaults];
    [v7 removeObjectForKey:v8];
  }

LABEL_7:
}

- (void).cxx_destruct
{
}

@end