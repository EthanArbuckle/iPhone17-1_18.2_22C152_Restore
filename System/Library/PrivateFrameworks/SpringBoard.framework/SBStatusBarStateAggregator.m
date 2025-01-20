@interface SBStatusBarStateAggregator
+ (int)_thermalColorForLevel:(int64_t)a3;
- (BOOL)_isInAirplaneMode;
- (BOOL)_setItem:(int)a3 enabled:(BOOL)a4;
- (BOOL)_setItem:(int)a3 enabled:(BOOL)a4 inList:(BOOL *)a5 itemPostState:(unint64_t *)a6;
- (BOOL)_shouldShowEmergencyOnlyStatusForInfo:(id)a3;
- (BOOL)_shouldShowPersonName;
- (BOOL)_systemApertureElementIsVisibleForStatusBarItem:(int)a3;
- (NSArray)systemApertureVisibleElementIdentifiers;
- (SAInvalidatable)systemApertureChargingElementAssertion;
- (SBStatusBarStateAggregator)initWithMainDisplayWindowScene:(id)a3;
- (SBStatusBarStateAggregator)initWithMainDisplayWindowScene:(id)a3 registerForNotifications:(BOOL)a4;
- (SBSystemStatusBatteryDataProvider)batteryDataProvider;
- (SBSystemStatusStatusBarOverridesArchiver)statusBarOverridesObserver;
- (SBSystemStatusStatusItemsDataProvider)statusItemsDataProvider;
- (SBSystemStatusWifiDataProvider)wifiDataProvider;
- (SBUserSessionController)_userSessionController;
- (SBWindowScene)mainDisplayWindowScene;
- (STBatteryStatusDomain)batteryDomain;
- (STCallingStatusDomain)callingDomain;
- (STFocusStatusDomain)focusDomain;
- (STPlaygroundsStatusDomain)playgroundsDomain;
- (STStatusItemsStatusDomain)statusItemsDomain;
- (STStewieStatusDomain)stewieDomain;
- (STTelephonyStatusDomain)telephonyDomain;
- (STTelephonyStatusDomainDataProvider)telephonyDataProvider;
- (STVoiceControlStatusDomain)voiceControlDomain;
- (STWifiStatusDomain)wifiDomain;
- (const)_statusBarData;
- (id)_activeAudioRecordingAttributionsForSensorActivityAttributions:(id)a3;
- (id)_backgroundActivityDescriptorsForCallDescriptors:(id)a3;
- (id)_locationAttributionsForSensorActivityAttributions:(id)a3 includeRecent:(BOOL)a4;
- (id)_systemApertureElementIdentifiersForStatusBarItem:(int)a3;
- (id)_telephonyManager;
- (int)_statusBarBatteryStateForSystemStatusChargingState:(unint64_t)a3;
- (unint64_t)batteryChargingState;
- (void)_invalidateSystemApertureChargingElementAssertionForReason:(id)a3;
- (void)_noteAirplaneModeChanged;
- (void)_notifyItemChanged:(int)a3;
- (void)_notifyNonItemDataChanged;
- (void)_postItem:(int)a3 withState:(unint64_t)a4 inList:(unint64_t *)a5;
- (void)_registerForNotifications;
- (void)_removePlaygroundsBackgroundActivityAssertion;
- (void)_removeSatelliteSOSBackgroundActivityAssertion;
- (void)_removeTetheringBackgroundActivityAssertion;
- (void)_requestActions:(int)a3;
- (void)_resetTimeItemFormatter;
- (void)_restartTimeItemTimer;
- (void)_setUserSessionController:(id)a3;
- (void)_stopTimeItemTimer;
- (void)_temporarilyOverrideLocationItemForProminentIndication;
- (void)_tickRefCount:(int64_t *)a3 up:(BOOL)a4 withTransitionBlock:(id)a5;
- (void)_updateActiveAudioRecordingBackgroundActivityAssertionsForActiveSensorActivityAttributions:(id)a3;
- (void)_updateActivityItem;
- (void)_updateAirplaneMode;
- (void)_updateAirplayItem;
- (void)_updateAlarmItem;
- (void)_updateBackgroundActivityAssertionsForSystemStatusDomain:(unint64_t)a3 andData:(id)a4;
- (void)_updateBatteryItems;
- (void)_updateBluetoothBatteryItem;
- (void)_updateBluetoothHeadphonesItem;
- (void)_updateBluetoothItem;
- (void)_updateCallForwardingItem;
- (void)_updateCallForwardingItem:(int)a3 withInfo:(id)a4;
- (void)_updateCallToActionItem;
- (void)_updateCallingBackgroundActivityAssertionsForCallDescriptors:(id)a3;
- (void)_updateCarPlayItem;
- (void)_updateDataNetworkItem;
- (void)_updateDataNetworkItem:(int)a3 withData:(id)a4 primary:(BOOL)a5 dataNetworkTypeGetter:(id)a6 dataNetworkTypeSetter:(id)a7;
- (void)_updateDisplayWarningItem;
- (void)_updateLiquidDetectionItem;
- (void)_updateLocationItem;
- (void)_updateLocationItemForLocationAttributions:(id)a3;
- (void)_updateLockItem;
- (void)_updateOverrideDate;
- (void)_updatePersonNameItem;
- (void)_updateQuietModeItem;
- (void)_updateRingerItem;
- (void)_updateRotationLockItem;
- (void)_updateSecondaryCallForwardingItem;
- (void)_updateSecondaryDataNetworkItem;
- (void)_updateSecondaryServiceItem;
- (void)_updateSecondarySignalStrengthItem;
- (void)_updateSensorActivityItem;
- (void)_updateServiceItem;
- (void)_updateServiceItem:(int)a3 withData:(id)a4 SIMInfo:(id)a5 otherSIMInfo:(id)a6 serviceStringGetter:(id)a7 serviceStringSetter:(id)a8 serviceCrossfadeStringGetter:(id)a9 serviceCrossfadeStringSetter:(id)a10 serviceContentTypeGetter:(id)a11 serviceContentTypeSetter:(id)a12 serviceBadgeStringGetter:(id)a13 serviceBadgeStringSetter:(id)a14;
- (void)_updateSignalStrengthItem;
- (void)_updateSignalStrengthItem:(int)a3 withData:(id)a4 SIMInfo:(id)a5 barsGetter:(id)a6 barsSetter:(id)a7;
- (void)_updateStateAtomicallyWithoutAnimationUsingBlock:(id)a3;
- (void)_updateStatusBarForSystemStatusDomainName:(unint64_t)a3 data:(id)a4;
- (void)_updateStatusBarItemsForSystemStatusDomain:(unint64_t)a3 andData:(id)a4;
- (void)_updateStatusBarItemsWithRelatedSystemApertureElements;
- (void)_updateStewieItem;
- (void)_updateStudentItem;
- (void)_updateTTYItem;
- (void)_updateTetheringState;
- (void)_updateThermalColorItem;
- (void)_updateTimeItems;
- (void)_updateTimeItemsWithDate:(id)a3;
- (void)_updateVPNItem;
- (void)_updateVoiceControlItem;
- (void)activityDidChangeForSensorActivityDataProvider:(id)a3;
- (void)addPostingObserver:(id)a3;
- (void)beginCoalescentBlock;
- (void)cache:(id)a3 didUpdateActiveAudioRoute:(id)a4;
- (void)cache:(id)a3 didUpdatePickableRoutes:(id)a4;
- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)endCoalescentBlock;
- (void)removePostingObserver:(id)a3;
- (void)setAlarmEnabled:(BOOL)a3;
- (void)setBatteryChargingState:(unint64_t)a3;
- (void)setBatteryDomain:(id)a3;
- (void)setCallingDomain:(id)a3;
- (void)setFocusDomain:(id)a3;
- (void)setPlaygroundsDomain:(id)a3;
- (void)setShouldShowBluetoothHeadphoneGlyph:(BOOL)a3 andShouldShowBluetoothHeadphoneBatteryPercent:(BOOL)a4;
- (void)setShowsActivityIndicatorEverywhere:(BOOL)a3;
- (void)setShowsActivityIndicatorOnHomeScreen:(BOOL)a3;
- (void)setShowsOverridesForRecording:(BOOL)a3;
- (void)setShowsSyncActivityIndicator:(BOOL)a3;
- (void)setStatusItemsDomain:(id)a3;
- (void)setStewieDomain:(id)a3;
- (void)setSystemApertureChargingElementAssertion:(id)a3;
- (void)setSystemApertureVisibleElementIdentifiers:(id)a3;
- (void)setTelephonyDomain:(id)a3;
- (void)setUserNameOverride:(id)a3;
- (void)setVoiceControlDomain:(id)a3;
- (void)setWifiDomain:(id)a3;
- (void)systemApertureLayoutDidChange:(id)a3;
- (void)updateStatusBarItem:(int)a3;
@end

@implementation SBStatusBarStateAggregator

uint64_t __93__SBStatusBarStateAggregator__activeAudioRecordingAttributionsForSensorActivityAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 sensor] == 1) {
    uint64_t v3 = [v2 usedRecently] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __95__SBStatusBarStateAggregator__locationAttributionsForSensorActivityAttributions_includeRecent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v5 = [v3 sensor];
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 0;
  }
  uint64_t v7 = v6;
  if (v4) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v5 == 2;
  }
  if (v8) {
    uint64_t v7 = [v3 usedRecently] ^ 1;
  }

  return v7;
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateBatteryItems
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBStatusBarStateAggregator *)self batteryDomain];
  int v4 = [v3 data];

  uint64_t v5 = [v4 chargingState];
  [(SBStatusBarStateAggregator *)self setBatteryChargingState:v5];
  if (self->_showsRecordingOverrides) {
    int v6 = 100;
  }
  else {
    int v6 = [v4 percentCharge];
  }
  uint64_t v7 = [(SBStatusBarStateAggregator *)self _statusBarBatteryStateForSystemStatusChargingState:v5];
  uint64_t v8 = [v4 chargingDescriptionType];
  int v9 = [v4 isBatterySaverModeActive];
  if (v6 <= 0)
  {
    v10 = SBLogStatusBarish();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = SBStatusBarBatteryStateDebugName(v7);
      int v25 = 138543618;
      v26 = v11;
      __int16 v27 = 1024;
      int v28 = v6;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "battery info changed to unpresentable (%{public}@ %i), resetting to capacity 1", (uint8_t *)&v25, 0x12u);
    }
    int v6 = 1;
  }
  uint64_t v12 = [v4 chargingDescription];
  v13 = (void *)v12;
  v14 = &stru_1F3084718;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  v15 = v14;

  if (self->_showsRecordingOverrides)
  {
    uint64_t v16 = [MEMORY[0x1E4F4F9C8] localizedBatteryDetailTextForBatteryLevel:100.0];

    v15 = (__CFString *)v16;
  }
  if (os_variant_has_internal_content()
    && ([(SBStatusBarDefaults *)self->_statusBarDefaults showBatteryLevel] & 1) != 0)
  {
    uint64_t v17 = 1;
  }
  else
  {
    v18 = [MEMORY[0x1E4F4F7D0] sharedInstance];
    uint64_t v17 = [v18 hasGasGauge];

    if (v17) {
      uint64_t v17 = [(SBStatusBarDefaults *)self->_statusBarDefaults showBatteryPercentage];
    }
  }
  char v19 = [(__CFString *)v15 isEqualToString:self->_batteryDetailString];
  if ((v19 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_batteryDetailString, v15);
    [(NSString *)self->_batteryDetailString getCString:self->_data.batteryDetailString maxLength:150 encoding:4];
  }
  if (v6 == self->_data.batteryCapacity
    && v7 == self->_data.batteryState
    && ((v9 ^ ((*((unsigned char *)&self->_data + 2536) & 1) == 0)) & 1) != 0)
  {
    [(SBStatusBarStateAggregator *)self _setItem:12 enabled:1];
    [(SBStatusBarStateAggregator *)self _setItem:13 enabled:v17];
    [(SBStatusBarStateAggregator *)self _setItem:14 enabled:v8 == 2];
    if (v19) {
      goto LABEL_28;
    }
  }
  else
  {
    self->_data.batteryCapacity = v6;
    self->_data.batteryState = v7;
    *((unsigned char *)&self->_data + 2536) = *((unsigned char *)&self->_data + 2536) & 0xFE | v9;
    [(SBStatusBarStateAggregator *)self _setItem:12 enabled:1];
    [(SBStatusBarStateAggregator *)self _setItem:13 enabled:v17];
    [(SBStatusBarStateAggregator *)self _setItem:14 enabled:v8 == 2];
  }
  v20 = SBLogStatusBarish();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = SBStatusBarBatteryStateDebugName(v7);
    batteryDetailString = self->_batteryDetailString;
    int v25 = 138544130;
    v26 = v21;
    __int16 v27 = 1024;
    int v28 = v6;
    __int16 v29 = 2114;
    v30 = batteryDetailString;
    __int16 v31 = 1024;
    int v32 = v9;
    _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "battery info changed to (%{public}@ %i) with detail='%{public}@', low power mode='%i'", (uint8_t *)&v25, 0x22u);
  }
  [(SBStatusBarStateAggregator *)self _notifyItemChanged:12];
  [(SBStatusBarStateAggregator *)self _notifyItemChanged:13];
  [(SBStatusBarStateAggregator *)self _notifyItemChanged:14];
LABEL_28:
  if (self->_showsRecordingOverrides)
  {
    self->_data.batteryState = 0;
    v23 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v24 = [v23 userInterfaceIdiom];

    if ((v24 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      [(SBStatusBarStateAggregator *)self _setItem:13 enabled:0];
    }
  }
}

- (void)_updateLocationItem
{
  id v3 = [(id)SBApp sensorActivityDataProvider];
  id v5 = [v3 activeAndRecentSensorActivityAttributions];

  int v4 = [(SBStatusBarStateAggregator *)self _locationAttributionsForSensorActivityAttributions:v5 includeRecent:0];
  [(SBStatusBarStateAggregator *)self _updateLocationItemForLocationAttributions:v4];
}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend((id)SBApp, "sensorActivityDataProvider", a3);
  id v5 = [v4 activeSensorActivityAttributions];

  v23 = self;
  int v6 = [(SBStatusBarStateAggregator *)self _locationAttributionsForSensorActivityAttributions:v5 includeRecent:0];
  uint64_t v7 = +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController];
  uint64_t v8 = [v7 layoutStatePrimaryElement];
  int v9 = [v8 workspaceEntity];
  v10 = [v9 applicationSceneEntity];
  v11 = [v10 sceneHandle];
  uint64_t v12 = [v11 application];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
        char v19 = +[SBApplicationController sharedInstance];
        v20 = [v18 bundleIdentifier];
        v21 = [v19 applicationWithBundleIdentifier:v20];

        if ([v12 isSameExecutableAsApplication:v21]
          && ([v21 hasProminentlyIndicatedLocationUseWhileForeground] & 1) == 0)
        {
          [v21 setHasProminentlyIndicatedLocationUseWhileForeground:1];
          v22 = v23;
          [(SBStatusBarStateAggregator *)v23 _temporarilyOverrideLocationItemForProminentIndication];

          goto LABEL_12;
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  v22 = v23;
  [(SBStatusBarStateAggregator *)v23 _updateLocationItem];
LABEL_12:
  [(SBStatusBarStateAggregator *)v22 _updateActiveAudioRecordingBackgroundActivityAssertionsForActiveSensorActivityAttributions:v5];
}

- (id)_locationAttributionsForSensorActivityAttributions:(id)a3 includeRecent:(BOOL)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __95__SBStatusBarStateAggregator__locationAttributionsForSensorActivityAttributions_includeRecent___block_invoke;
  v6[3] = &__block_descriptor_33_e37_B16__0__SBSensorActivityAttribution_8l;
  BOOL v7 = a4;
  int v4 = objc_msgSend(a3, "bs_filter:", v6);
  return v4;
}

- (void)_updateLocationItemForLocationAttributions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 count];
  char v5 = *((unsigned char *)&self->_data + 2529);
  char v6 = v5 & 0xE7;
  if (self->_prominentLocationOverride) {
    char v6 = v5 & 0xE7 | 0x10;
  }
  if (v4) {
    BOOL prominentLocationOverride = 1;
  }
  else {
    BOOL prominentLocationOverride = self->_prominentLocationOverride;
  }
  *((unsigned char *)&self->_data + 2529) = v6;
  char v8 = v6 ^ v5;
  BOOL v9 = [(SBStatusBarStateAggregator *)self _setItem:21 enabled:prominentLocationOverride];
  int v10 = (v8 & 0x18) != 0 || v9;
  if (prominentLocationOverride && v10 != 0)
  {
    [(SBStatusBarStateAggregator *)self _notifyItemChanged:21];
    if ((v8 & 0x18) != 0)
    {
      uint64_t v12 = SBLogStatusBarish();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = (*((unsigned __int8 *)&self->_data + 2529) >> 3) & 3;
        v14[0] = 67109120;
        v14[1] = v13;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "locationType changed to %i", (uint8_t *)v14, 8u);
      }
    }
  }
}

- (void)_updateActivityItem
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBStatusBarStateAggregator *)self _telephonyManager];
  int64_t syncActivityIndicatorCount = self->_syncActivityIndicatorCount;
  if (syncActivityIndicatorCount > 0)
  {
    char v5 = 0;
    uint64_t v6 = 1;
    goto LABEL_14;
  }
  BOOL v7 = [(SBStatusBarStateAggregator *)self telephonyDomain];
  char v8 = [v7 data];
  BOOL v9 = [v8 primarySIMInfo];
  uint64_t v10 = [v9 dataNetworkType];

  if (v10
    || ([v3 hasNonCellularNetworkConnection] & 1) != 0
    || (BKSDisplayServicesDisplayIsTethered() & 1) != 0
    || ([(SBStatusBarStateAggregator *)self _userSessionController],
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v11 isLoginSession],
        v11,
        v6))
  {
    uint64_t v12 = +[SBWorkspace mainWorkspace];
    int v13 = [v12 transientOverlayPresentationManager];

    uint64_t v14 = +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController];
    uint64_t v15 = [v14 layoutStatePrimaryElement];
    uint64_t v16 = [v15 workspaceEntity];
    uint64_t v17 = [v16 applicationSceneEntity];
    v18 = [v17 sceneHandle];

    if (v18 && ([v13 hasActivePresentation] & 1) == 0)
    {
      char v19 = [v18 application];
      char v5 = [v19 bundleIdentifier];
    }
    else
    {
      char v5 = 0;
    }
    if (self->_activityIndicatorEverywhereCount <= 0
      && (![v13 hasActivePresentation]
       || ([v13 prefersStatusBarActivityItemVisible] & 1) == 0))
    {
      if (v18 && ([v13 hasActivePresentation] & 1) == 0)
      {
        v30 = [v18 application];
        uint64_t v31 = [v30 showsProgress];
        goto LABEL_40;
      }
      if (!self->_showsActivityIndicatorOnHomeScreen)
      {
        v30 = +[SBApplicationPlaceholderController sharedInstance];
        uint64_t v31 = [v30 isUsingNetwork];
LABEL_40:
        uint64_t v6 = v31;

        goto LABEL_13;
      }
    }
    uint64_t v6 = 1;
LABEL_13:

    goto LABEL_14;
  }
  char v5 = 0;
LABEL_14:
  BOOL v20 = [(SBStatusBarStateAggregator *)self _setItem:32 enabled:v6];
  int v21 = [v3 isUsingSlowDataConnection];
  if (syncActivityIndicatorCount < 1) {
    int v22 = v21;
  }
  else {
    int v22 = 0;
  }
  if (v5) {
    v23 = v5;
  }
  else {
    v23 = &stru_1F3084718;
  }
  long long v24 = v23;

  char v25 = *((unsigned char *)&self->_data + 2272);
  if (v22 != ((v25 & 2) == 0) && syncActivityIndicatorCount > 0 != ((v25 & 4) == 0))
  {
    if ([(__CFString *)v24 isEqualToString:self->_activityDisplayIdentifier]) {
      goto LABEL_28;
    }
    char v25 = *((unsigned char *)&self->_data + 2272);
  }
  if (v22) {
    char v26 = 2;
  }
  else {
    char v26 = 0;
  }
  *((unsigned char *)&self->_data + 2272) = v26 | (4 * (syncActivityIndicatorCount > 0)) | v25 & 0xF9;
  objc_storeStrong((id *)&self->_activityDisplayIdentifier, v23);
  [(NSString *)self->_activityDisplayIdentifier getCString:self->_data.activityDisplayId maxLength:256 encoding:4];
  [(SBStatusBarStateAggregator *)self _notifyItemChanged:32];
  BOOL v20 = 1;
LABEL_28:
  if ((v6 & v20) == 1)
  {
    long long v27 = SBLogStatusBarish();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v28 = *((unsigned __int8 *)&self->_data + 2272);
      activityDisplayIdentifier = self->_activityDisplayIdentifier;
      v32[0] = 67109634;
      v32[1] = (v28 >> 1) & 1;
      __int16 v33 = 1024;
      int v34 = (v28 >> 2) & 1;
      __int16 v35 = 2114;
      v36 = activityDisplayIdentifier;
      _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "activity info changed to slow=%i sync=%i identifier=%{public}@", (uint8_t *)v32, 0x18u);
    }
  }
}

- (BOOL)_setItem:(int)a3 enabled:(BOOL)a4
{
  return [(SBStatusBarStateAggregator *)self _setItem:*(void *)&a3 enabled:a4 inList:&self->_data itemPostState:self->_itemPostState];
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained beginCoalescentBlock];
  v3[2](v3, WeakRetained);

  [WeakRetained endCoalescentBlock];
}

- (void)_postItem:(int)a3 withState:(unint64_t)a4 inList:(unint64_t *)a5
{
  if (a3 <= 0x2D && a5)
  {
    [(SBStatusBarStateAggregator *)self beginCoalescentBlock];
    a5[a3] |= a4;
    [(SBStatusBarStateAggregator *)self endCoalescentBlock];
  }
}

- (void)beginCoalescentBlock
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_notifyingPostObservers)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBStatusBarStateAggregator.m", 318, @"calls to %s are not allowed from within observer notifications", "-[SBStatusBarStateAggregator beginCoalescentBlock]");
  }
  unint64_t coalescentBlockDepth = self->_coalescentBlockDepth;
  self->_unint64_t coalescentBlockDepth = coalescentBlockDepth + 1;
  if (!coalescentBlockDepth)
  {
    memcpy(&self->_atomicUpdateData, &self->_data, sizeof(self->_atomicUpdateData));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    char v5 = self->_postObservers;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          [*(id *)(*((void *)&v11 + 1) + 8 * v9++) statusBarStateAggregatorDidStartPost:self];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)_setItem:(int)a3 enabled:(BOOL)a4 inList:(BOOL *)a5 itemPostState:(unint64_t *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 > 0x2D) {
    return 0;
  }
  int v6 = a4;
  uint64_t v7 = *(void *)&a3;
  int v8 = a5[a3];
  a5[a3] = a4;
  -[SBStatusBarStateAggregator _postItem:withState:inList:](self, "_postItem:withState:inList:");
  uint64_t v9 = SBLogStatusBarish();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  BOOL v11 = v8 == v6;
  BOOL v12 = v8 != v6;
  if (v11)
  {
    if (v10)
    {
      uint64_t v15 = SBStatusBarItemDebugName(v7);
      uint64_t v16 = (void *)v15;
      uint64_t v17 = @"dis";
      if (v6) {
        uint64_t v17 = @"en";
      }
      int v19 = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      int v22 = v17;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ is unchanged, still %@abled", (uint8_t *)&v19, 0x16u);
    }
  }
  else if (v10)
  {
    if (v6) {
      long long v13 = @"en";
    }
    else {
      long long v13 = @"dis";
    }
    SBStatusBarItemDebugName(v7);
    long long v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v19 = 138412546;
    uint64_t v20 = (uint64_t)v13;
    __int16 v21 = 2114;
    int v22 = v14;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%@abling %{public}@", (uint8_t *)&v19, 0x16u);
  }
  return v12;
}

- (void)endCoalescentBlock
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  p_notifyingPostObservers = &self->_notifyingPostObservers;
  p_performingAtomicUpdate = &self->_performingAtomicUpdate;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (*p_notifyingPostObservers)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBStatusBarStateAggregator.m", 331, @"calls to %s are not allowed from within observer notifications", "-[SBStatusBarStateAggregator endCoalescentBlock]");
  }
  unint64_t coalescentBlockDepth = self->_coalescentBlockDepth;
  if (!coalescentBlockDepth)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBStatusBarStateAggregator.m", 332, @"unbalanced call to %s", "-[SBStatusBarStateAggregator endCoalescentBlock]");

    unint64_t coalescentBlockDepth = self->_coalescentBlockDepth;
  }
  unint64_t v7 = coalescentBlockDepth - 1;
  self->_unint64_t coalescentBlockDepth = v7;
  if (*p_performingAtomicUpdate)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    int v8 = self->_postObservers;
    uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v59 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v13 statusBarStateAggregatorDidRequestImmediateUpdates:self];
          }
        }
        uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v10);
    }

    BOOL *p_notifyingPostObservers = 1;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v14 = self->_postObservers;
    uint64_t v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v55 != v17) {
            objc_enumerationMutation(v14);
          }
          int v19 = *(void **)(*((void *)&v54 + 1) + 8 * j);
          for (uint64_t k = 538; k != 584; ++k)
          {
            if (*((void *)&self->super.isa + k)) {
              [v19 statusBarStateAggregator:self didVisitItem:(k - 538) withUpdates:(~*((unsigned char *)&self->super.isa + 8 * k) & 3) == 0 toData:&self->_atomicUpdateData];
            }
          }
          [v19 statusBarStateAggregatorDidFinishPost:self withData:&self->_atomicUpdateData actions:0];
        }
        uint64_t v16 = [(NSHashTable *)v14 countByEnumeratingWithState:&v54 objects:v65 count:16];
      }
      while (v16);
    }

    *(_OWORD *)&self->_atomicUpdateItemPostState[44] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[42] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[40] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[38] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[36] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[34] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[32] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[30] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[28] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[26] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[24] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[22] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[20] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[18] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[16] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[14] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[12] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[10] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[8] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[6] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[4] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[2] = 0u;
    *(_OWORD *)self->_atomicUpdateItemPostState = 0u;
    BOOL *p_notifyingPostObservers = 0;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    __int16 v21 = self->_postObservers;
    uint64_t v22 = [(NSHashTable *)v21 countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v51;
      do
      {
        for (uint64_t m = 0; m != v23; ++m)
        {
          if (*(void *)v51 != v24) {
            objc_enumerationMutation(v21);
          }
          char v26 = *(void **)(*((void *)&v50 + 1) + 8 * m);
          if (objc_opt_respondsToSelector()) {
            [v26 statusBarStateAggregatorDidStopRequestingImmediateUpdates:self];
          }
        }
        uint64_t v23 = [(NSHashTable *)v21 countByEnumeratingWithState:&v50 objects:v64 count:16];
      }
      while (v23);
    }

    if (self->_coalescentBlockDepth)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v27 = self->_postObservers;
      uint64_t v28 = [(NSHashTable *)v27 countByEnumeratingWithState:&v46 objects:v63 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v47;
        do
        {
          for (uint64_t n = 0; n != v29; ++n)
          {
            if (*(void *)v47 != v30) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v46 + 1) + 8 * n) statusBarStateAggregatorDidStartPost:self];
          }
          uint64_t v29 = [(NSHashTable *)v27 countByEnumeratingWithState:&v46 objects:v63 count:16];
        }
        while (v29);
      }
    }
  }
  else if (!v7)
  {
    BOOL *p_notifyingPostObservers = 1;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    int v32 = self->_postObservers;
    uint64_t v33 = [(NSHashTable *)v32 countByEnumeratingWithState:&v42 objects:v62 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v43;
      do
      {
        for (iuint64_t i = 0; ii != v34; ++ii)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void **)(*((void *)&v42 + 1) + 8 * ii);
          for (juint64_t j = 5; jj != 51; ++jj)
          {
            if (*((void *)&self->super.isa + jj)) {
              [v37 statusBarStateAggregator:self didVisitItem:(jj - 5) withUpdates:(~*((unsigned char *)&self->super.isa + 8 * jj) & 3) == 0 toData:&self->_data];
            }
          }
          if (self->_nonItemDataChanged) {
            [v37 statusBarStateAggregator:self didUpdateNonItemData:&self->_data];
          }
          [v37 statusBarStateAggregatorDidFinishPost:self withData:&self->_data actions:self->_actions];
        }
        uint64_t v34 = [(NSHashTable *)v32 countByEnumeratingWithState:&v42 objects:v62 count:16];
      }
      while (v34);
    }

    *(_OWORD *)self->_itemPostState = 0u;
    itemPostState = self->_itemPostState;
    *((_DWORD *)itemPostState + 1064) = 0;
    BOOL *p_notifyingPostObservers = 0;
    *((_OWORD *)itemPostState + 1) = 0u;
    *((_OWORD *)itemPostState + 2) = 0u;
    *((_OWORD *)itemPostState + 3) = 0u;
    *((_OWORD *)itemPostState + 4) = 0u;
    *((_OWORD *)itemPostState + 5) = 0u;
    *((_OWORD *)itemPostState + 6) = 0u;
    *((_OWORD *)itemPostState + 7) = 0u;
    *((_OWORD *)itemPostState + 8) = 0u;
    *((_OWORD *)itemPostState + 9) = 0u;
    *((_OWORD *)itemPostState + 10) = 0u;
    *((_OWORD *)itemPostState + 11) = 0u;
    *((_OWORD *)itemPostState + 12) = 0u;
    *((_OWORD *)itemPostState + 13) = 0u;
    *((_OWORD *)itemPostState + 14) = 0u;
    *((_OWORD *)itemPostState + 15) = 0u;
    *((_OWORD *)itemPostState + 16) = 0u;
    *((_OWORD *)itemPostState + 17) = 0u;
    *((_OWORD *)itemPostState + 18) = 0u;
    *((_OWORD *)itemPostState + 19) = 0u;
    *((_OWORD *)itemPostState + 20) = 0u;
    *((_OWORD *)itemPostState + 21) = 0u;
    *((_OWORD *)itemPostState + 22) = 0u;
    *((unsigned char *)itemPostState + 368) = 0;
  }
}

- (void)updateStatusBarItem:(int)a3
{
  [(SBStatusBarStateAggregator *)self beginCoalescentBlock];
  switch(a3)
  {
    case 0:
    case 1:
      [(SBStatusBarStateAggregator *)self _updateTimeItems];
      break;
    case 2:
      [(SBStatusBarStateAggregator *)self _updateQuietModeItem];
      break;
    case 3:
      [(SBStatusBarStateAggregator *)self _updateAirplaneMode];
      break;
    case 4:
      [(SBStatusBarStateAggregator *)self _updateSignalStrengthItem];
      break;
    case 5:
      [(SBStatusBarStateAggregator *)self _updateSecondarySignalStrengthItem];
      break;
    case 6:
      [(SBStatusBarStateAggregator *)self _updateServiceItem];
      break;
    case 7:
      [(SBStatusBarStateAggregator *)self _updateSecondaryServiceItem];
      break;
    case 8:
      [(SBStatusBarStateAggregator *)self _updatePersonNameItem];
      break;
    case 9:
      [(SBStatusBarStateAggregator *)self _updateDataNetworkItem];
      break;
    case 10:
      [(SBStatusBarStateAggregator *)self _updateSecondaryDataNetworkItem];
      break;
    case 12:
    case 13:
    case 14:
      [(SBStatusBarStateAggregator *)self _updateBatteryItems];
      break;
    case 15:
      [(SBStatusBarStateAggregator *)self _updateBluetoothBatteryItem];
      break;
    case 16:
      [(SBStatusBarStateAggregator *)self _updateBluetoothItem];
      break;
    case 17:
      [(SBStatusBarStateAggregator *)self _updateTTYItem];
      break;
    case 18:
      [(SBStatusBarStateAggregator *)self _updateAlarmItem];
      break;
    case 19:
    case 23:
    case 25:
    case 34:
    case 36:
    case 40:
      break;
    case 21:
      [(SBStatusBarStateAggregator *)self _updateLocationItem];
      break;
    case 22:
      [(SBStatusBarStateAggregator *)self _updateRotationLockItem];
      break;
    case 24:
      [(SBStatusBarStateAggregator *)self _updateAirplayItem];
      break;
    case 26:
      [(SBStatusBarStateAggregator *)self _updateCarPlayItem];
      break;
    case 28:
      [(SBStatusBarStateAggregator *)self _updateSensorActivityItem];
      break;
    case 29:
      [(SBStatusBarStateAggregator *)self _updateVPNItem];
      break;
    case 30:
      [(SBStatusBarStateAggregator *)self _updateCallForwardingItem];
      break;
    case 31:
      [(SBStatusBarStateAggregator *)self _updateSecondaryCallForwardingItem];
      break;
    case 32:
      [(SBStatusBarStateAggregator *)self _updateActivityItem];
      break;
    case 33:
      [(SBStatusBarStateAggregator *)self _updateThermalColorItem];
      break;
    case 41:
      [(SBStatusBarStateAggregator *)self _updateVoiceControlItem];
      break;
    case 42:
      [(SBStatusBarStateAggregator *)self _updateBluetoothHeadphonesItem];
      break;
    case 44:
      [(SBStatusBarStateAggregator *)self _updateDisplayWarningItem];
      break;
    case 45:
      [(SBStatusBarStateAggregator *)self _updateStewieItem];
      break;
    default:
      char v5 = SBLogStatusBarish();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[SBStatusBarStateAggregator updateStatusBarItem:](a3, v5);
      }

      break;
  }
  [(SBStatusBarStateAggregator *)self endCoalescentBlock];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_37(uint64_t a1, void *a2)
{
  return [a2 updateStatusBarItem:32];
}

- (STTelephonyStatusDomain)telephonyDomain
{
  return self->_telephonyDomain;
}

- (id)_telephonyManager
{
  return +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:0];
}

- (void)_notifyItemChanged:(int)a3
{
}

- (void)_updateActiveAudioRecordingBackgroundActivityAssertionsForActiveSensorActivityAttributions:(id)a3
{
  uint64_t v4 = (void *)SBApp;
  id v5 = a3;
  id v9 = [v4 audioRecordingManager];
  int v6 = [(SBStatusBarStateAggregator *)self _activeAudioRecordingAttributionsForSensorActivityAttributions:v5];

  unint64_t v7 = [(STCallingStatusDomain *)self->_callingDomain data];
  int v8 = [v7 callDescriptors];

  [v9 setNowRecordingAppForActiveAudioRecordingAttributions:v6 callDescriptors:v8];
}

- (id)_activeAudioRecordingAttributionsForSensorActivityAttributions:(id)a3
{
  return (id)objc_msgSend(a3, "bs_filter:", &__block_literal_global_258_0);
}

- (void)_temporarilyOverrideLocationItemForProminentIndication
{
  [(NSTimer *)self->_prominentLocationTimer invalidate];
  prominentLocationTimer = self->_prominentLocationTimer;
  self->_prominentLocationTimer = 0;

  self->_BOOL prominentLocationOverride = 1;
  [(SBStatusBarStateAggregator *)self _updateLocationItem];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__SBStatusBarStateAggregator__temporarilyOverrideLocationItemForProminentIndication__block_invoke;
  v6[3] = &unk_1E6B08C90;
  void v6[4] = self;
  uint64_t v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v6 block:4.0];
  id v5 = self->_prominentLocationTimer;
  self->_prominentLocationTimer = v4;
}

- (void)_restartTimeItemTimer
{
  [(SBStatusBarStateAggregator *)self beginCoalescentBlock];
  [(SBStatusBarStateAggregator *)self _updateTimeItems];
  [(SBStatusBarStateAggregator *)self endCoalescentBlock];
  if (!self->_dateTimeProviderToken)
  {
    objc_initWeak(&location, self);
    dateTimeProvider = self->_dateTimeProvider;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__SBStatusBarStateAggregator__restartTimeItemTimer__block_invoke;
    v5[3] = &unk_1E6B0D590;
    v5[4] = self;
    objc_copyWeak(&v6, &location);
    id v4 = (id)[(SBFOverridableDateProvider *)dateTimeProvider observeMinuteUpdatesWithHandler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_updateTimeItems
{
  id v3 = [(SBFOverridableDateProvider *)self->_dateTimeProvider date];
  [(SBStatusBarStateAggregator *)self _updateTimeItemsWithDate:v3];
}

- (void)_stopTimeItemTimer
{
  if (self->_dateTimeProviderToken)
  {
    -[SBFOverridableDateProvider removeMinuteUpdateHandler:](self->_dateTimeProvider, "removeMinuteUpdateHandler:");
    dateTimeProviderTokeuint64_t n = self->_dateTimeProviderToken;
    self->_dateTimeProviderTokeuint64_t n = 0;
  }
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_12(uint64_t a1)
{
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 _updateBatteryItems];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setBatteryChargingState:(unint64_t)a3
{
  unint64_t batteryChargingState = self->_batteryChargingState;
  if (batteryChargingState != a3)
  {
    if (a3 - 1 >= 2)
    {
      if (!a3) {
        [(SBStatusBarStateAggregator *)self _invalidateSystemApertureChargingElementAssertionForReason:@"Charging ended"];
      }
      goto LABEL_17;
    }
    uint64_t v6 = SBFEffectiveArtworkSubtype();
    if (v6 > 2795)
    {
      if (v6 != 2868 && v6 != 2796) {
        goto LABEL_17;
      }
    }
    else if (v6 != 2556 && v6 != 2622)
    {
LABEL_17:
      self->_unint64_t batteryChargingState = a3;
      return;
    }
    if (!batteryChargingState)
    {
      unint64_t v7 = +[SBLockScreenManager sharedInstance];
      int v8 = [v7 isUILocked];

      id v9 = +[SBUIController sharedInstance];
      int v10 = [v9 isConnectedToWirelessInternalCharger];

      uint64_t v11 = +[SBUIController sharedInstance];
      int v12 = [v11 isConnectedToWirelessInternalChargingAccessory];

      if (!v8 || ((v10 | v12) & 1) == 0)
      {
        long long v13 = [(SBStatusBarStateAggregator *)self batteryDomain];
        long long v14 = [v13 data];

        double v15 = 1.0;
        if (!self->_showsRecordingOverrides) {
          double v15 = (double)(int)[v14 percentCharge] / 100.0;
        }
        uint64_t v16 = objc_alloc_init(SBChargingSystemApertureElementProvider);
        uint64_t v17 = [(SBChargingSystemApertureElementProvider *)v16 powerElementWithBatteryCapacity:v15];
        v18 = [(id)SBApp systemApertureControllerForMainDisplay];
        int v19 = [v18 registerElement:v17];
        systemApertureChargingElementAssertiouint64_t n = self->_systemApertureChargingElementAssertion;
        self->_systemApertureChargingElementAssertiouint64_t n = v19;
      }
    }
    goto LABEL_17;
  }
}

- (STBatteryStatusDomain)batteryDomain
{
  return self->_batteryDomain;
}

- (int)_statusBarBatteryStateForSystemStatusChargingState:(unint64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

- (SBStatusBarStateAggregator)initWithMainDisplayWindowScene:(id)a3
{
  return [(SBStatusBarStateAggregator *)self initWithMainDisplayWindowScene:a3 registerForNotifications:1];
}

- (SBStatusBarStateAggregator)initWithMainDisplayWindowScene:(id)a3 registerForNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v53.receiver = self;
  v53.super_class = (Class)SBStatusBarStateAggregator;
  int v8 = [(SBStatusBarStateAggregator *)&v53 init];
  id v9 = v8;
  if (v8)
  {
    p_cachedShowRSSI = &v8->_cachedShowRSSI;
    objc_storeWeak((id *)&v8->_mainDisplayWindowScene, v7);
    uint64_t v11 = +[SBDefaults localDefaults];
    uint64_t v12 = [v11 statusBarDefaults];
    statusBarDefaults = v9->_statusBarDefaults;
    v9->_statusBarDefaults = (SBStatusBarDefaults *)v12;

    BOOL *p_cachedShowRSSI = [(SBStatusBarDefaults *)v9->_statusBarDefaults showRSSI];
    v9->_cachedShowThermalWarning = [(SBStatusBarDefaults *)v9->_statusBarDefaults showThermalWarning];
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    postObservers = v9->_postObservers;
    v9->_postObservers = (NSHashTable *)v14;

    *((unsigned char *)&v9->_data + 2536) = *((unsigned char *)&v9->_data + 2536) & 0xFD | (2
                                                                          * ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1));
    id v16 = objc_alloc(MEMORY[0x1E4FA5FB0]);
    uint64_t v17 = [MEMORY[0x1E4FA7CE0] sharedInstance];
    uint64_t v18 = [v16 initWithDateProvider:v17];
    dateTimeProvider = v9->_dateTimeProvider;
    v9->_dateTimeProvider = (SBFOverridableDateProvider *)v18;

    uint64_t v20 = [(id)SBApp systemStatusServer];
    if (!v20)
    {
      long long v52 = [MEMORY[0x1E4F28B00] currentHandler];
      [v52 handleFailureInMethod:a2 object:v9 file:@"SBStatusBarStateAggregator.m" lineNumber:246 description:@"SBStatusBarStateAggregator is being created before the system status server"];
    }
    __int16 v21 = objc_alloc_init(SBSystemStatusBatteryDataProvider);
    batteryDataProvider = v9->_batteryDataProvider;
    v9->_batteryDataProvider = v21;

    uint64_t v23 = [[SBSystemStatusStatusItemsDataProvider alloc] initWithMainDisplayWindowScene:v7];
    statusItemsDataProvider = v9->_statusItemsDataProvider;
    v9->_statusItemsDataProvider = v23;

    id v25 = objc_alloc(MEMORY[0x1E4FA9950]);
    char v26 = [(id)SBApp telephonyStateProvider];
    uint64_t v27 = [v25 initWithServerHandle:v20 stateProvider:v26];
    telephonyDataProvider = v9->_telephonyDataProvider;
    v9->_telephonyDataProvider = (STTelephonyStatusDomainDataProvider *)v27;

    uint64_t v29 = objc_alloc_init(SBSystemStatusWifiDataProvider);
    wifiDataProvider = v9->_wifiDataProvider;
    v9->_wifiDataProvider = v29;

    uint64_t v31 = objc_alloc_init(SBSystemStatusStatusBarOverridesArchiver);
    statusBarOverridesObserver = v9->_statusBarOverridesObserver;
    v9->_statusBarOverridesObserver = v31;

    uint64_t v33 = [objc_alloc(MEMORY[0x1E4FA9350]) initWithServerHandle:v20];
    batteryDomaiuint64_t n = v9->_batteryDomain;
    v9->_batteryDomaiuint64_t n = (STBatteryStatusDomain *)v33;

    uint64_t v35 = [objc_alloc(MEMORY[0x1E4FA9368]) initWithServerHandle:v20];
    callingDomaiuint64_t n = v9->_callingDomain;
    v9->_callingDomaiuint64_t n = (STCallingStatusDomain *)v35;

    uint64_t v37 = [objc_alloc(MEMORY[0x1E4FA9398]) initWithServerHandle:v20];
    focusDomaiuint64_t n = v9->_focusDomain;
    v9->_focusDomaiuint64_t n = (STFocusStatusDomain *)v37;

    uint64_t v39 = [objc_alloc(MEMORY[0x1E4FA9430]) initWithServerHandle:v20];
    playgroundsDomaiuint64_t n = v9->_playgroundsDomain;
    v9->_playgroundsDomaiuint64_t n = (STPlaygroundsStatusDomain *)v39;

    uint64_t v41 = [objc_alloc(MEMORY[0x1E4FA9518]) initWithServerHandle:v20];
    statusItemsDomaiuint64_t n = v9->_statusItemsDomain;
    v9->_statusItemsDomaiuint64_t n = (STStatusItemsStatusDomain *)v41;

    uint64_t v43 = [objc_alloc(MEMORY[0x1E4FA9538]) initWithServerHandle:v20];
    stewieDomaiuint64_t n = v9->_stewieDomain;
    v9->_stewieDomaiuint64_t n = (STStewieStatusDomain *)v43;

    uint64_t v45 = [objc_alloc(MEMORY[0x1E4FA9558]) initWithServerHandle:v20];
    telephonyDomaiuint64_t n = v9->_telephonyDomain;
    v9->_telephonyDomaiuint64_t n = (STTelephonyStatusDomain *)v45;

    uint64_t v47 = [objc_alloc(MEMORY[0x1E4FA9568]) initWithServerHandle:v20];
    voiceControlDomaiuint64_t n = v9->_voiceControlDomain;
    v9->_voiceControlDomaiuint64_t n = (STVoiceControlStatusDomain *)v47;

    uint64_t v49 = [objc_alloc(MEMORY[0x1E4FA9570]) initWithServerHandle:v20];
    wifiDomaiuint64_t n = v9->_wifiDomain;
    v9->_wifiDomaiuint64_t n = (STWifiStatusDomain *)v49;

    if (v4) {
      [(SBStatusBarStateAggregator *)v9 _registerForNotifications];
    }
  }
  return v9;
}

- (void)dealloc
{
  id v3 = [(id)SBApp sensorActivityDataProvider];
  [v3 removeObserver:self];

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  [(SBSystemStatusBatteryDataProvider *)self->_batteryDataProvider invalidate];
  [(SBSystemStatusStatusItemsDataProvider *)self->_statusItemsDataProvider invalidate];
  [(STTelephonyStatusDomainDataProvider *)self->_telephonyDataProvider invalidate];
  [(SBSystemStatusWifiDataProvider *)self->_wifiDataProvider invalidate];
  [(STBatteryStatusDomain *)self->_batteryDomain invalidate];
  [(STCallingStatusDomain *)self->_callingDomain invalidate];
  [(STFocusStatusDomain *)self->_focusDomain invalidate];
  [(STPlaygroundsStatusDomain *)self->_playgroundsDomain invalidate];
  [(STStatusItemsStatusDomain *)self->_statusItemsDomain invalidate];
  [(STStewieStatusDomain *)self->_stewieDomain invalidate];
  [(STTelephonyStatusDomain *)self->_telephonyDomain invalidate];
  [(STVoiceControlStatusDomain *)self->_voiceControlDomain invalidate];
  [(STWifiStatusDomain *)self->_wifiDomain invalidate];
  [(SBStatusBarStateAggregator *)self _stopTimeItemTimer];
  [(SBStatusBarStateAggregator *)self _removeTetheringBackgroundActivityAssertion];
  v5.receiver = self;
  v5.super_class = (Class)SBStatusBarStateAggregator;
  [(SBStatusBarStateAggregator *)&v5 dealloc];
}

- (const)_statusBarData
{
  return (const $6C45178016D353444451090973A2A97F *)&self->_data;
}

- (SBUserSessionController)_userSessionController
{
  override_userSessionController = self->_override_userSessionController;
  if (override_userSessionController)
  {
    id v3 = override_userSessionController;
  }
  else
  {
    id v3 = [(id)SBApp userSessionController];
  }
  return v3;
}

- (void)_updateStateAtomicallyWithoutAnimationUsingBlock:(id)a3
{
  id v5 = a3;
  p_performingAtomicUpdate = &self->_performingAtomicUpdate;
  if (self->_performingAtomicUpdate)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    int v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"SBStatusBarStateAggregator.m", 408, @"%@ must not be called reentrantly", v8 object file lineNumber description];
  }
  BOOL *p_performingAtomicUpdate = 1;
  [(SBStatusBarStateAggregator *)self beginCoalescentBlock];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke;
  v11[3] = &unk_1E6AF5558;
  v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke_2;
  v10[3] = &unk_1E6B0D228;
  v10[4] = self;
  (*((void (**)(id, $D1AFE4C712074D7A4DFED30A4D6E293D *, void *, void *))v5 + 2))(v5, &self->_atomicUpdateData, v11, v10);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke_4;
  v9[3] = &unk_1E6B0D228;
  v9[4] = self;
  (*((void (**)(id, $D1AFE4C712074D7A4DFED30A4D6E293D *, void *, void *))v5 + 2))(v5, &self->_data, &__block_literal_global_384, v9);
  [(SBStatusBarStateAggregator *)self endCoalescentBlock];
  BOOL *p_performingAtomicUpdate = 0;
}

uint64_t __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _postItem:a2 withState:3 inList:*(void *)(a1 + 32) + 4304];
}

uint64_t __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _setItem:a2 enabled:a3 inList:*(void *)(a1 + 32) + 4672 itemPostState:*(void *)(a1 + 32) + 4304];
}

uint64_t __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _setItem:a2 enabled:a3 inList:*(void *)(a1 + 32) + 416 itemPostState:0];
}

- (void)_tickRefCount:(int64_t *)a3 up:(BOOL)a4 withTransitionBlock:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  int64_t v8 = *a3;
  if (v5)
  {
    *a3 = v8 + 1;
    if (v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v9 = v8 == 1;
  BOOL v10 = v8 < 1;
  int64_t v11 = v8 - 1;
  if (!v10)
  {
    *a3 = v11;
    if (v9)
    {
LABEL_7:
      id v12 = v7;
      (*((void (**)(id, BOOL))v7 + 2))(v7, v5);
      id v7 = v12;
    }
  }
LABEL_8:
}

- (void)setShowsOverridesForRecording:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v5 = SBLogStatusBarish();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v8 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "set showing overrides for recording: %{public}d", buf, 8u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SBStatusBarStateAggregator_setShowsOverridesForRecording___block_invoke;
  v6[3] = &unk_1E6AF5350;
  void v6[4] = self;
  [(SBStatusBarStateAggregator *)self _tickRefCount:&self->_showsRecordingOverrides up:v3 withTransitionBlock:v6];
}

uint64_t __60__SBStatusBarStateAggregator_setShowsOverridesForRecording___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginCoalescentBlock];
  [*(id *)(a1 + 32) _updateOverrideDate];
  [*(id *)(a1 + 32) _updateAirplayItem];
  [*(id *)(a1 + 32) _updateSignalStrengthItem];
  [*(id *)(a1 + 32) _updateServiceItem];
  [*(id *)(a1 + 32) _updateDataNetworkItem];
  [*(id *)(a1 + 32) _updateSecondarySignalStrengthItem];
  [*(id *)(a1 + 32) _updateSecondaryServiceItem];
  [*(id *)(a1 + 32) _updateSecondaryDataNetworkItem];
  [*(id *)(a1 + 32) _updateBatteryItems];
  id v2 = *(void **)(a1 + 32);
  return [v2 endCoalescentBlock];
}

- (void)setShouldShowBluetoothHeadphoneGlyph:(BOOL)a3 andShouldShowBluetoothHeadphoneBatteryPercent:(BOOL)a4
{
  if (self->_shouldShowBluetoothHeadphoneGlyph != a3 || self->_shouldShowBluetoothHeadphoneBatteryPercent != a4)
  {
    self->_shouldShowBluetoothHeadphoneGlyph = a3;
    self->_shouldShowBluetoothHeadphoneBatteryPercent = a4;
    [(SBStatusBarStateAggregator *)self _updateBluetoothBatteryItem];
  }
}

- (void)setAlarmEnabled:(BOOL)a3
{
  [(SBSystemStatusStatusItemsDataProvider *)self->_statusItemsDataProvider setAlarmEnabled:a3];
  [(SBStatusBarStateAggregator *)self updateStatusBarItem:18];
}

- (void)setShowsActivityIndicatorOnHomeScreen:(BOOL)a3
{
  self->_showsActivityIndicatorOnHomeScreeuint64_t n = a3;
  [(SBStatusBarStateAggregator *)self updateStatusBarItem:32];
}

- (void)setShowsActivityIndicatorEverywhere:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__SBStatusBarStateAggregator_setShowsActivityIndicatorEverywhere___block_invoke;
  v3[3] = &unk_1E6AF5350;
  v3[4] = self;
  [(SBStatusBarStateAggregator *)self _tickRefCount:&self->_activityIndicatorEverywhereCount up:a3 withTransitionBlock:v3];
}

uint64_t __66__SBStatusBarStateAggregator_setShowsActivityIndicatorEverywhere___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStatusBarItem:32];
}

- (void)setShowsSyncActivityIndicator:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__SBStatusBarStateAggregator_setShowsSyncActivityIndicator___block_invoke;
  v3[3] = &unk_1E6AF5350;
  v3[4] = self;
  [(SBStatusBarStateAggregator *)self _tickRefCount:&self->_syncActivityIndicatorCount up:a3 withTransitionBlock:v3];
}

uint64_t __60__SBStatusBarStateAggregator_setShowsSyncActivityIndicator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStatusBarItem:32];
}

- (void)setUserNameOverride:(id)a3
{
  BOOL v4 = (NSString *)[a3 copy];
  overridePersonName = self->_overridePersonName;
  self->_overridePersonName = v4;

  [(SBStatusBarStateAggregator *)self updateStatusBarItem:8];
}

- (void)addPostingObserver:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_notifyingPostObservers)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBStatusBarStateAggregator.m", 520, @"calls to %s are not allowed from within observer notifications", "-[SBStatusBarStateAggregator addPostingObserver:]");

    id v5 = v9;
  }
  if (![(NSHashTable *)self->_postObservers containsObject:v5])
  {
    [(NSHashTable *)self->_postObservers addObject:v9];
    if (self->_hasPostedOnce)
    {
      [v9 statusBarStateAggregatorDidStartPost:self];
      for (uint64_t i = 0; i != 46; ++i)
        [v9 statusBarStateAggregator:self didVisitItem:i withUpdates:1 toData:&self->_data];
      [v9 statusBarStateAggregator:self didUpdateNonItemData:&self->_data];
      if (!self->_coalescentBlockDepth) {
        [v9 statusBarStateAggregatorDidFinishPost:self withData:&self->_data actions:self->_actions];
      }
    }
    else
    {
      if (self->_coalescentBlockDepth) {
        [v9 statusBarStateAggregatorDidStartPost:self];
      }
      [(SBStatusBarStateAggregator *)self beginCoalescentBlock];
      [(SBStatusBarStateAggregator *)self _resetTimeItemFormatter];
      for (uint64_t j = 0; j != 46; ++j)
      {
        [(SBStatusBarStateAggregator *)self updateStatusBarItem:j];
        [(SBStatusBarStateAggregator *)self _notifyItemChanged:j];
      }
      [(SBStatusBarStateAggregator *)self _updateTetheringState];
      self->_hasPostedOnce = 1;
      [(SBStatusBarStateAggregator *)self endCoalescentBlock];
    }
  }
}

- (void)removePostingObserver:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (self->_notifyingPostObservers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBStatusBarStateAggregator.m", 558, @"calls to %s are not allowed from within observer notifications", "-[SBStatusBarStateAggregator removePostingObserver:]");

    id v5 = v7;
  }
  [(NSHashTable *)self->_postObservers removeObject:v5];
}

- (void)_registerForNotifications
{
  v212[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  BOOL v4 = [MEMORY[0x1E4F28F08] mainQueue];
  objc_initWeak(&location, self);
  v205[0] = MEMORY[0x1E4F143A8];
  v205[1] = 3221225472;
  v205[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke;
  v205[3] = &unk_1E6B0D250;
  objc_copyWeak(&v206, &location);
  id v5 = (void *)MEMORY[0x1D948C7A0](v205);
  v203[0] = MEMORY[0x1E4F143A8];
  v203[1] = 3221225472;
  v203[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_2;
  v203[3] = &unk_1E6AFFF68;
  id v6 = v5;
  id v204 = v6;
  id v7 = (id)[v3 addObserverForName:@"SBBootCompleteNotification" object:0 queue:v4 usingBlock:v203];
  v201[0] = MEMORY[0x1E4F143A8];
  v201[1] = 3221225472;
  v201[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_4;
  v201[3] = &unk_1E6AFFF68;
  id v8 = v6;
  id v202 = v8;
  id v9 = (id)[v3 addObserverForName:@"SBSignificantTimeChangedNotification" object:0 queue:v4 usingBlock:v201];
  v199[0] = MEMORY[0x1E4F143A8];
  v199[1] = 3221225472;
  v199[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_6;
  v199[3] = &unk_1E6AFFF68;
  id v10 = v8;
  id v200 = v10;
  id v11 = (id)[v3 addObserverForName:@"SBCurrentLocaleDidChangeNotification" object:0 queue:v4 usingBlock:v199];
  [v3 addObserver:self selector:sel__restartTimeItemTimer name:@"SBWorkspaceDidWakeFromSleepNotification" object:0];
  [v3 addObserver:self selector:sel_systemApertureLayoutDidChange_ name:@"SBSystemApertureLayoutDidChangeNotification" object:0];
  v198[0] = MEMORY[0x1E4F143A8];
  v198[1] = 3221225472;
  v198[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_8;
  v198[3] = &unk_1E6AF4AC0;
  v198[4] = self;
  blocuint64_t k = (dispatch_block_t)MEMORY[0x1D948C7A0](v198);
  statusBarDefaults = self->_statusBarDefaults;
  long long v13 = [NSString stringWithUTF8String:"showOverridesForRecording"];
  uint64_t v14 = MEMORY[0x1E4F14428];
  id v15 = MEMORY[0x1E4F14428];
  id v16 = (id)[(SBStatusBarDefaults *)statusBarDefaults observeDefault:v13 onQueue:v14 withBlock:block];

  uint64_t v17 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], block);

  v197[0] = MEMORY[0x1E4F143A8];
  v197[1] = 3221225472;
  v197[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_9;
  v197[3] = &unk_1E6B0D298;
  v197[4] = self;
  uint64_t v18 = (void *)MEMORY[0x1D948C7A0](v197);
  v195[0] = MEMORY[0x1E4F143A8];
  v195[1] = 3221225472;
  v195[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_10;
  v195[3] = &unk_1E6AF5300;
  id v19 = v10;
  id v196 = v19;
  uint64_t v20 = (void *)MEMORY[0x1D948C7A0](v195);
  __int16 v21 = [(SBStatusBarStateAggregator *)self batteryDomain];
  v193[0] = MEMORY[0x1E4F143A8];
  v193[1] = 3221225472;
  v193[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_12;
  v193[3] = &unk_1E6B0D2C0;
  dispatch_block_t v125 = v20;
  id v194 = v125;
  [v21 observeDataWithBlock:v193];

  uint64_t v22 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v125);

  uint64_t v23 = self->_statusBarDefaults;
  uint64_t v24 = [NSString stringWithUTF8String:"showBatteryPercentage"];
  v212[0] = v24;
  id v25 = [NSString stringWithUTF8String:"showBatteryLevel"];
  v212[1] = v25;
  char v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v212 count:2];
  v191[0] = MEMORY[0x1E4F143A8];
  v191[1] = 3221225472;
  v191[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_13;
  v191[3] = &unk_1E6AF5300;
  id v27 = v19;
  id v192 = v27;
  id v28 = (id)[(SBStatusBarDefaults *)v23 observeDefaults:v26 onQueue:MEMORY[0x1E4F14428] withBlock:v191];

  v190[0] = MEMORY[0x1E4F143A8];
  v190[1] = 3221225472;
  v190[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_15;
  v190[3] = &unk_1E6B0D2E8;
  v190[4] = self;
  uint64_t v29 = (void *)MEMORY[0x1D948C7A0](v190);
  uint64_t v30 = [(SBStatusBarStateAggregator *)self callingDomain];
  v188[0] = MEMORY[0x1E4F143A8];
  v188[1] = 3221225472;
  v188[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_16;
  v188[3] = &unk_1E6B0D310;
  id v31 = v29;
  id v189 = v31;
  [v30 observeDataWithBlock:v188];

  v185[0] = MEMORY[0x1E4F143A8];
  v185[1] = 3221225472;
  v185[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_18;
  v185[3] = &unk_1E6AF8068;
  objc_copyWeak(&v187, &location);
  id v120 = v31;
  id v186 = v120;
  int v32 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v185);

  v183[0] = MEMORY[0x1E4F143A8];
  v183[1] = 3221225472;
  v183[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_19;
  v183[3] = &unk_1E6AF6828;
  v183[4] = self;
  id v33 = v27;
  id v184 = v33;
  uint64_t v34 = (void *)MEMORY[0x1D948C7A0](v183);
  uint64_t v35 = [(SBStatusBarStateAggregator *)self wifiDomain];
  v181[0] = MEMORY[0x1E4F143A8];
  v181[1] = 3221225472;
  v181[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_2_85;
  v181[3] = &unk_1E6B0D338;
  dispatch_block_t v124 = v34;
  id v182 = v124;
  [v35 observeDataWithBlock:v181];

  v36 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v124);

  v179[0] = MEMORY[0x1E4F143A8];
  v179[1] = 3221225472;
  v179[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_3_87;
  v179[3] = &unk_1E6AF5300;
  id v37 = v33;
  id v180 = v37;
  v38 = (void *)MEMORY[0x1D948C7A0](v179);
  uint64_t v39 = [(SBStatusBarStateAggregator *)self focusDomain];
  v177[0] = MEMORY[0x1E4F143A8];
  v177[1] = 3221225472;
  v177[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_5_91;
  v177[3] = &unk_1E6B0D360;
  dispatch_block_t v123 = v38;
  id v178 = v123;
  [v39 observeDataWithBlock:v177];

  v40 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v123);

  uint64_t v41 = [(id)SBApp sensorActivityDataProvider];
  [v41 addObserver:self];
  v175[0] = MEMORY[0x1E4F143A8];
  v175[1] = 3221225472;
  v175[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_6_93;
  v175[3] = &unk_1E6AF5290;
  v175[4] = self;
  id v119 = v41;
  id v176 = v119;
  long long v42 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v175);

  uint64_t v43 = [(SBStatusBarStateAggregator *)self playgroundsDomain];
  v173[0] = MEMORY[0x1E4F143A8];
  v173[1] = 3221225472;
  v173[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_7_94;
  v173[3] = &unk_1E6B0D388;
  id v44 = v18;
  id v174 = v44;
  [v43 observeDataWithBlock:v173];

  v170[0] = MEMORY[0x1E4F143A8];
  v170[1] = 3221225472;
  v170[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_9_97;
  v170[3] = &unk_1E6AF8068;
  objc_copyWeak(&v172, &location);
  id v45 = v44;
  id v171 = v45;
  long long v46 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v170);

  uint64_t v47 = [(SBStatusBarStateAggregator *)self statusItemsDomain];
  v168[0] = MEMORY[0x1E4F143A8];
  v168[1] = 3221225472;
  v168[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_10_98;
  v168[3] = &unk_1E6B0D3B0;
  id v48 = v45;
  id v169 = v48;
  [v47 observeDataWithBlock:v168];

  v165[0] = MEMORY[0x1E4F143A8];
  v165[1] = 3221225472;
  v165[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_12_101;
  v165[3] = &unk_1E6AF8068;
  objc_copyWeak(&v167, &location);
  id v49 = v48;
  id v166 = v49;
  long long v50 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v165);

  long long v51 = [(SBStatusBarStateAggregator *)self stewieDomain];
  v163[0] = MEMORY[0x1E4F143A8];
  v163[1] = 3221225472;
  v163[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_13_102;
  v163[3] = &unk_1E6B0D3D8;
  id v52 = v49;
  id v164 = v52;
  [v51 observeDataWithBlock:v163];

  v160[0] = MEMORY[0x1E4F143A8];
  v160[1] = 3221225472;
  v160[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_15_105;
  v160[3] = &unk_1E6AF8068;
  objc_copyWeak(&v162, &location);
  id v118 = v52;
  id v161 = v118;
  objc_super v53 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v160);

  v158[0] = MEMORY[0x1E4F143A8];
  v158[1] = 3221225472;
  v158[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_16_106;
  v158[3] = &unk_1E6AF5300;
  id v54 = v37;
  id v159 = v54;
  long long v55 = (void *)MEMORY[0x1D948C7A0](v158);
  long long v56 = [(SBStatusBarStateAggregator *)self telephonyDomain];
  v156[0] = MEMORY[0x1E4F143A8];
  v156[1] = 3221225472;
  v156[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_18_110;
  v156[3] = &unk_1E6B0D400;
  dispatch_block_t v122 = v55;
  id v157 = v122;
  [v56 observeDataWithBlock:v156];

  long long v57 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v122);

  v154[0] = MEMORY[0x1E4F143A8];
  v154[1] = 3221225472;
  v154[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_19_112;
  v154[3] = &unk_1E6AF5300;
  id v58 = v54;
  id v155 = v58;
  long long v59 = (void *)MEMORY[0x1D948C7A0](v154);
  long long v60 = [(SBStatusBarStateAggregator *)self voiceControlDomain];
  v152[0] = MEMORY[0x1E4F143A8];
  v152[1] = 3221225472;
  v152[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_21;
  v152[3] = &unk_1E6B0D428;
  dispatch_block_t v121 = v59;
  id v153 = v121;
  [v60 observeDataWithBlock:v152];

  long long v61 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v121);

  v62 = self->_statusBarDefaults;
  v63 = [NSString stringWithUTF8String:"showRSSI"];
  v211 = v63;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v211 count:1];
  v150[0] = MEMORY[0x1E4F143A8];
  v150[1] = 3221225472;
  v150[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_22;
  v150[3] = &unk_1E6AF6828;
  v150[4] = self;
  id v65 = v58;
  id v151 = v65;
  id v66 = (id)[(SBStatusBarDefaults *)v62 observeDefaults:v64 onQueue:MEMORY[0x1E4F14428] withBlock:v150];

  uint64_t v67 = self->_statusBarDefaults;
  v68 = [NSString stringWithUTF8String:"showThermalWarning"];
  v210 = v68;
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v210 count:1];
  v148[0] = MEMORY[0x1E4F143A8];
  v148[1] = 3221225472;
  v148[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_24;
  v148[3] = &unk_1E6AF6828;
  v148[4] = self;
  id v70 = v65;
  id v149 = v70;
  id v71 = (id)[(SBStatusBarDefaults *)v67 observeDefaults:v69 onQueue:MEMORY[0x1E4F14428] withBlock:v148];

  id v72 = +[SBAirplaneModeController sharedInstance];
  [v3 addObserver:self selector:sel_beginCoalescentBlock name:*MEMORY[0x1E4FA79F0] object:0];
  [v3 addObserver:self selector:sel__noteAirplaneModeChanged name:*MEMORY[0x1E4FA79E0] object:0];
  [v3 addObserver:self selector:sel_endCoalescentBlock name:*MEMORY[0x1E4FA79E8] object:0];
  v73 = [MEMORY[0x1E4F50B70] sharedInstance];
  uint64_t v74 = *MEMORY[0x1E4F50B08];
  v146[0] = MEMORY[0x1E4F143A8];
  v146[1] = 3221225472;
  v146[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_26;
  v146[3] = &unk_1E6AFFF68;
  id v75 = v70;
  id v147 = v75;
  id v76 = (id)[v3 addObserverForName:v74 object:0 queue:v4 usingBlock:v146];
  uint64_t v77 = *MEMORY[0x1E4F50B18];
  v144[0] = MEMORY[0x1E4F143A8];
  v144[1] = 3221225472;
  v144[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_28;
  v144[3] = &unk_1E6AFFF68;
  id v78 = v75;
  id v145 = v78;
  id v79 = (id)[v3 addObserverForName:v77 object:0 queue:v4 usingBlock:v144];
  v80 = [v73 connectedDevices];
  if ([v80 count])
  {
    v81 = (NSMutableArray *)[v80 mutableCopy];
    connectedClassicBluetoothDevices = self->_connectedClassicBluetoothDevices;
    self->_connectedClassicBluetoothDevices = v81;
  }
  id v83 = objc_alloc(MEMORY[0x1E4F1BD18]);
  uint64_t v84 = *MEMORY[0x1E4F1BC90];
  v208[0] = *MEMORY[0x1E4F1BC48];
  v208[1] = v84;
  v209[0] = MEMORY[0x1E4F1CC38];
  v209[1] = MEMORY[0x1E4F1CC38];
  v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v209 forKeys:v208 count:2];
  v86 = (CBCentralManager *)[v83 initWithDelegate:self queue:MEMORY[0x1E4F14428] options:v85];
  coreBluetoothManager = self->_coreBluetoothManager;
  self->_coreBluetoothManager = v86;

  uint64_t v88 = *MEMORY[0x1E4F50AD0];
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_30;
  v142[3] = &unk_1E6AFFF68;
  id v89 = v78;
  id v143 = v89;
  id v90 = (id)[v3 addObserverForName:v88 object:0 queue:v4 usingBlock:v142];
  v91 = SBBluetoothConnectionChangedNotification;
  v140[0] = MEMORY[0x1E4F143A8];
  v140[1] = 3221225472;
  v140[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_32;
  v140[3] = &unk_1E6AFFF68;
  id v92 = v89;
  id v141 = v92;
  id v93 = (id)[v3 addObserverForName:v91 object:0 queue:v4 usingBlock:v140];
  v94 = +[SBAVSystemControllerCache sharedInstance];
  [v94 addObserver:self];

  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_34;
  v138[3] = &unk_1E6AFFF68;
  id v95 = v92;
  id v139 = v95;
  v96 = (void *)MEMORY[0x1D948C7A0](v138);
  id v97 = (id)[v3 addObserverForName:SBBluetoothBatteryAvailabilityChangedNotification object:0 queue:v4 usingBlock:v96];
  id v98 = (id)[v3 addObserverForName:SBBluetoothBatteryLevelChangedNotification object:0 queue:v4 usingBlock:v96];
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_36;
  v136[3] = &unk_1E6AFFF68;
  id v99 = v95;
  id v137 = v99;
  v100 = (void *)MEMORY[0x1D948C7A0](v136);
  id v101 = (id)[v3 addObserverForName:@"SBApplicationShowsProgressChangedNotification" object:0 queue:v4 usingBlock:v100];
  id v102 = (id)[v3 addObserverForName:@"SBApplicationPlaceholdersNetworkUsageDidChangeNotification" object:0 queue:v4 usingBlock:v100];
  id v103 = (id)[v3 addObserverForName:@"SBFrontmostDisplayChangedNotification" object:0 queue:v4 usingBlock:v100];
  uint64_t v104 = *MEMORY[0x1E4FA7A80];
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_38;
  v134[3] = &unk_1E6AFFF68;
  id v105 = v99;
  id v135 = v105;
  id v106 = (id)[v3 addObserverForName:v104 object:0 queue:v4 usingBlock:v134];
  uint64_t v107 = *MEMORY[0x1E4FA6140];
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_40;
  v132[3] = &unk_1E6AFFF68;
  id v108 = v105;
  id v133 = v108;
  id v109 = (id)[v3 addObserverForName:v107 object:0 queue:v4 usingBlock:v132];
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_42;
  v130[3] = &unk_1E6AFFF68;
  id v110 = v108;
  id v131 = v110;
  id v111 = (id)[v3 addObserverForName:@"SBThermalControllerStateDidChange" object:0 queue:v4 usingBlock:v130];
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_44;
  v128[3] = &unk_1E6AFFF68;
  id v112 = v110;
  id v129 = v112;
  id v113 = (id)[v3 addObserverForName:@"SBRingerChangedNotification" object:0 queue:v4 usingBlock:v128];
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_46;
  v127[3] = &unk_1E6AF4AC0;
  v127[4] = self;
  v114 = (void *)MEMORY[0x1D948C7A0](v127);
  v115 = self->_statusBarDefaults;
  v116 = [NSString stringWithUTF8String:"showRingerState"];
  id v117 = (id)[(SBStatusBarDefaults *)v115 observeDefault:v116 onQueue:MEMORY[0x1E4F14428] withBlock:v114];

  objc_destroyWeak(&v162);
  objc_destroyWeak(&v167);

  objc_destroyWeak(&v172);
  objc_destroyWeak(&v187);

  objc_destroyWeak(&v206);
  objc_destroyWeak(&location);
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _updatePersonNameItem];
  [v2 _updateLockItem];
  [v2 _updateRingerItem];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 _resetTimeItemFormatter];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 _resetTimeItemFormatter];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) showOverridesForRecording];
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setShowsOverridesForRecording:v2];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateStatusBarForSystemStatusDomainName:a2 data:a3];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_14(uint64_t a1, void *a2)
{
  [a2 updateStatusBarItem:13];
  id v2 = +[SBBluetoothController sharedInstance];
  [v2 updateBattery];
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_15(uint64_t a1, void *a2)
{
  id v5 = [a2 callDescriptors];
  [*(id *)(a1 + 32) _updateCallingBackgroundActivityAssertionsForCallDescriptors:v5];
  BOOL v3 = [(id)SBApp sensorActivityDataProvider];
  BOOL v4 = [v3 activeSensorActivityAttributions];

  [*(id *)(a1 + 32) _updateActiveAudioRecordingBackgroundActivityAssertionsForActiveSensorActivityAttributions:v4];
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_17;
  v6[3] = &unk_1E6AF5A78;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained callingDomain];
  id v3 = [v2 data];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_19(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogStatusBarish();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) wifiDomain];
    id v4 = [v3 data];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "STWifiStatusDomainData update: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_82(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 updateStatusBarItem:9];
  [v2 updateStatusBarItem:10];
  [v2 updateStatusBarItem:32];
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_2_85(uint64_t a1)
{
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_3_87(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_4_88(uint64_t a1, void *a2)
{
  return [a2 updateStatusBarItem:2];
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_5_91(uint64_t a1)
{
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_6_93(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidChangeForSensorActivityDataProvider:*(void *)(a1 + 40)];
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_7_94(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_8_95;
  v6[3] = &unk_1E6AF5A78;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_8_95(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 7, *(void *)(a1 + 32));
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_9_97(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained playgroundsDomain];
  id v3 = [v2 data];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_10_98(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_11_99;
  v6[3] = &unk_1E6AF5A78;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_11_99(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 14, *(void *)(a1 + 32));
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_12_101(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained statusItemsDomain];
  id v3 = [v2 data];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_13_102(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_14_103;
  v6[3] = &unk_1E6AF5A78;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_14_103(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 8, *(void *)(a1 + 32));
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_15_105(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained stewieDomain];
  id v3 = [v2 data];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_16_106(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_17_107(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 updateStatusBarItem:4];
  [v2 updateStatusBarItem:5];
  [v2 updateStatusBarItem:6];
  [v2 updateStatusBarItem:7];
  [v2 updateStatusBarItem:9];
  [v2 updateStatusBarItem:10];
  [v2 updateStatusBarItem:32];
  [v2 updateStatusBarItem:30];
  [v2 updateStatusBarItem:31];
  [v2 updateStatusBarItem:45];
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_18_110(uint64_t a1)
{
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_19_112(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_20(uint64_t a1, void *a2)
{
  return [a2 updateStatusBarItem:41];
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_21(uint64_t a1)
{
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_22(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8697) = [*(id *)(*(void *)(a1 + 32) + 8) showRSSI];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 updateStatusBarItem:9];
  [v2 updateStatusBarItem:10];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_24(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8698) = [*(id *)(*(void *)(a1 + 32) + 8) showThermalWarning];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_25(uint64_t a1, void *a2)
{
  return [a2 updateStatusBarItem:33];
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_27;
  v7[3] = &unk_1E6B0D450;
  id v8 = v3;
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v7);
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_27(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) object];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7 && ([v11[1092] containsObject:v7] & 1) == 0)
  {
    id v8 = v11[1092];
    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      id v10 = v11[1092];
      v11[1092] = (id)v9;

      id v8 = v11[1092];
    }
    [v8 addObject:v7];
    [v11 updateStatusBarItem:16];
  }
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_29;
  v7[3] = &unk_1E6B0D450;
  id v8 = v3;
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v7);
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v9 = a2;
  id v3 = [*(id *)(a1 + 32) object];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7 && [v9[1092] containsObject:v7])
  {
    [v9[1092] removeObject:v7];
    if (![v9[1092] count])
    {
      id v8 = v9[1092];
      v9[1092] = 0;
    }
    [v9 updateStatusBarItem:16];
  }
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_31(uint64_t a1, void *a2)
{
  return [a2 updateStatusBarItem:42];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_33(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 updateStatusBarItem:9];
  [v2 updateStatusBarItem:10];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_35(uint64_t a1, void *a2)
{
  return [a2 updateStatusBarItem:15];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_39(uint64_t a1, void *a2)
{
  return [a2 _updateTetheringState];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_41(uint64_t a1, void *a2)
{
  return [a2 _updateLockItem];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_43(uint64_t a1, void *a2)
{
  return [a2 _updateThermalColorItem];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_45(uint64_t a1, void *a2)
{
  return [a2 _updateRingerItem];
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_46(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRingerItem];
}

- (void)_updateLockItem
{
  id v3 = [(id)SBApp authenticationController];
  uint64_t v4 = [v3 isAuthenticated] ^ 1;

  [(SBStatusBarStateAggregator *)self _setItem:39 enabled:v4];
}

- (void)_updateTimeItemsWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDateFormatter *)self->_timeItemDateFormatter stringFromDate:v4];
  id v6 = [(NSDateFormatter *)self->_dateItemDateFormatter stringFromDate:v4];
  [(SBStatusBarStateAggregator *)self _setItem:0 enabled:1];
  [(SBStatusBarStateAggregator *)self _setItem:1 enabled:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__SBStatusBarStateAggregator__updateTimeItemsWithDate___block_invoke;
  v10[3] = &unk_1E6B0D478;
  v10[4] = self;
  id v7 = (void (**)(void, void, void, void))MEMORY[0x1D948C7A0](v10);
  if (([v5 isEqualToString:self->_timeItemTimeString] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeItemTimeString, v5);
    id v8 = [(NSDateFormatter *)self->_shortTimeItemDateFormatter stringFromDate:v4];
    shortTimeItemTimeString = self->_shortTimeItemTimeString;
    self->_shortTimeItemTimeString = v8;

    ((void (**)(void, NSString *, char *, void))v7)[2](v7, self->_timeItemTimeString, self->_data.timeString, 0);
    ((void (**)(void, NSString *, char *, void))v7)[2](v7, self->_shortTimeItemTimeString, self->_data.shortTimeString, 0);
  }
  if (([v6 isEqualToString:self->_dateItemTimeString] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dateItemTimeString, v6);
    ((void (**)(void, NSString *, char *, uint64_t))v7)[2](v7, self->_dateItemTimeString, self->_data.dateString, 1);
  }
}

double __55__SBStatusBarStateAggregator__updateTimeItemsWithDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  int v6 = [a2 getCString:a3 maxLength:64 encoding:4];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6)
  {
    [(id)v7 _notifyItemChanged:a4];
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)(v7 + 494) = 0u;
    *(_OWORD *)(v7 + 510) = 0u;
    *(_OWORD *)(v7 + 462) = 0u;
    *(_OWORD *)(v7 + 478) = 0u;
  }
  return result;
}

- (BOOL)_isInAirplaneMode
{
  id v2 = +[SBAirplaneModeController sharedInstance];
  char v3 = [v2 isInAirplaneMode];

  return v3;
}

- (void)_updateAirplaneMode
{
  char v3 = [(STStatusItemsStatusDomain *)self->_statusItemsDomain data];
  id v4 = [v3 activeStatusItems];
  uint64_t v5 = [v4 containsObject:*MEMORY[0x1E4FA98C8]];

  [(SBStatusBarStateAggregator *)self _setItem:3 enabled:v5];
}

- (void)_updateSignalStrengthItem
{
  char v3 = [(SBStatusBarStateAggregator *)self telephonyDomain];
  id v4 = [v3 data];

  uint64_t v5 = [v4 primarySIMInfo];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SBStatusBarStateAggregator__updateSignalStrengthItem__block_invoke;
  v7[3] = &unk_1E6B0D4A0;
  void v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SBStatusBarStateAggregator__updateSignalStrengthItem__block_invoke_2;
  v6[3] = &unk_1E6AF5558;
  void v6[4] = self;
  [(SBStatusBarStateAggregator *)self _updateSignalStrengthItem:4 withData:v4 SIMInfo:v5 barsGetter:v7 barsSetter:v6];
}

uint64_t __55__SBStatusBarStateAggregator__updateSignalStrengthItem__block_invoke(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 856);
}

uint64_t __55__SBStatusBarStateAggregator__updateSignalStrengthItem__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(result + 32) + 856) = a2;
  return result;
}

- (void)_updateSecondarySignalStrengthItem
{
  char v3 = [(SBStatusBarStateAggregator *)self telephonyDomain];
  id v4 = [v3 data];

  uint64_t v5 = [v4 secondarySIMInfo];
  *((unsigned char *)&self->_data + 3160) = *((unsigned char *)&self->_data + 3160) & 0xFB | (4 * (v5 != 0));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SBStatusBarStateAggregator__updateSecondarySignalStrengthItem__block_invoke;
  v7[3] = &unk_1E6B0D4A0;
  void v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SBStatusBarStateAggregator__updateSecondarySignalStrengthItem__block_invoke_2;
  v6[3] = &unk_1E6AF5558;
  void v6[4] = self;
  [(SBStatusBarStateAggregator *)self _updateSignalStrengthItem:5 withData:v4 SIMInfo:v5 barsGetter:v7 barsSetter:v6];
}

uint64_t __64__SBStatusBarStateAggregator__updateSecondarySignalStrengthItem__block_invoke(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 860);
}

uint64_t __64__SBStatusBarStateAggregator__updateSecondarySignalStrengthItem__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(result + 32) + 860) = a2;
  return result;
}

- (void)_updateSignalStrengthItem:(int)a3 withData:(id)a4 SIMInfo:(id)a5 barsGetter:(id)a6 barsSetter:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (unsigned int (**)(void))a6;
  id v15 = (void (**)(id, uint64_t))a7;
  id v16 = [(SBStatusBarStateAggregator *)self _telephonyManager];
  int v17 = [v16 containsCellularRadio];
  if (self->_showsRecordingOverrides && v17)
  {
    [(SBStatusBarStateAggregator *)self _setItem:v10 enabled:v10 == 4];
    if (v14[2](v14) != 4)
    {
      v15[2](v15, 4);
LABEL_22:
      [(SBStatusBarStateAggregator *)self _notifyItemChanged:v10];
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  int v18 = [v12 isCellularRadioCapabilityEnabled];
  uint64_t v19 = [v13 cellularServiceState];
  if (v13 && v18 && v19 == 2 && ![(SBStatusBarStateAggregator *)self _isInAirplaneMode])
  {
    [(SBStatusBarStateAggregator *)self _setItem:v10 enabled:1];
    uint64_t v21 = [v13 signalStrengthBars];
  }
  else
  {
    uint64_t v20 = [v12 isRadioModuleDead];
    [(SBStatusBarStateAggregator *)self _setItem:v10 enabled:v20];
    if ((v20 & 1) == 0) {
      goto LABEL_23;
    }
    uint64_t v21 = [v13 signalStrengthBars];
    if (!v13)
    {
      uint64_t v22 = SBLogStatusBarish();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Status bar data manager: reporting 0 signal strength bars because we have no SIM info.", buf, 2u);
      }
      goto LABEL_17;
    }
  }
  if (v21) {
    goto LABEL_18;
  }
  uint64_t v22 = SBLogStatusBarish();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Status bar data manager: telephony domain reports 0 signal strength bars", buf, 2u);
    uint64_t v21 = 0;
  }
LABEL_17:

LABEL_18:
  unsigned int v23 = v14[2](v14);
  if (v23 != v21)
  {
    unsigned int v24 = v23;
    v15[2](v15, v21);
    id v25 = SBLogStatusBarish();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      char v26 = SBStatusBarItemDebugName(v10);
      *(_DWORD *)buf = 138543874;
      id v28 = v26;
      __int16 v29 = 1026;
      unsigned int v30 = v24;
      __int16 v31 = 1026;
      int v32 = v21;
      _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ changing from '%{public}d' to '%{public}d'", buf, 0x18u);
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (void)_updateServiceItem
{
  char v3 = [(SBStatusBarStateAggregator *)self telephonyDomain];
  id v4 = [v3 data];

  uint64_t v5 = [v4 primarySIMInfo];
  int v6 = [v4 secondarySIMInfo];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _DWORD v14[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke;
  v14[3] = &unk_1E6AFD560;
  v14[4] = self;
  v12[4] = self;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_2;
  v13[3] = &unk_1E6B01D80;
  v13[4] = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_3;
  v12[3] = &unk_1E6AFD560;
  v10[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_4;
  v11[3] = &unk_1E6B01D80;
  v11[4] = self;
  v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_5;
  v10[3] = &unk_1E6B0D4A0;
  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_6;
  v9[3] = &unk_1E6AF5558;
  void v7[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_7;
  v8[3] = &unk_1E6AFD560;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_8;
  v7[3] = &unk_1E6B01D80;
  [(SBStatusBarStateAggregator *)self _updateServiceItem:6 withData:v4 SIMInfo:v5 otherSIMInfo:v6 serviceStringGetter:v14 serviceStringSetter:v13 serviceCrossfadeStringGetter:v12 serviceCrossfadeStringSetter:v11 serviceContentTypeGetter:v10 serviceContentTypeSetter:v9 serviceBadgeStringGetter:v8 serviceBadgeStringSetter:v7];
}

id __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8640);
}

void __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8640), a2);
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8640) getCString:*(void *)(a1 + 32) + 864 maxLength:100 encoding:4];
}

id __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8648);
}

void __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8648), a2);
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8648) getCString:*(void *)(a1 + 32) + 1064 maxLength:100 encoding:4];
}

uint64_t __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_5(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 2488);
}

uint64_t __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_6(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(result + 32) + 2488) = a2;
  return result;
}

id __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_7(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8672);
}

void __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8672), a2);
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8672) getCString:*(void *)(a1 + 32) + 3577 maxLength:100 encoding:4];
}

- (void)_updateSecondaryServiceItem
{
  char v3 = [(SBStatusBarStateAggregator *)self telephonyDomain];
  id v4 = [v3 data];

  uint64_t v5 = [v4 secondarySIMInfo];
  char v6 = *((unsigned char *)&self->_data + 3160);
  *((unsigned char *)&self->_data + 3160) = v6 & 0xFB | (4 * (v5 != 0));
  if (self->_showsRecordingOverrides)
  {
    *((unsigned char *)&self->_data + 3160) = v6 & 0xFB;
  }
  else
  {
    uint64_t v7 = [v4 primarySIMInfo];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke;
    v15[3] = &unk_1E6AFD560;
    v15[4] = self;
    v13[4] = self;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    _DWORD v14[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_2;
    v14[3] = &unk_1E6B01D80;
    v14[4] = self;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_3;
    v13[3] = &unk_1E6AFD560;
    v11[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_4;
    v12[3] = &unk_1E6B01D80;
    v12[4] = self;
    v10[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_5;
    v11[3] = &unk_1E6B0D4A0;
    v9[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_6;
    v10[3] = &unk_1E6AF5558;
    v8[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_7;
    v9[3] = &unk_1E6AFD560;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_8;
    v8[3] = &unk_1E6B01D80;
    [(SBStatusBarStateAggregator *)self _updateServiceItem:7 withData:v4 SIMInfo:v5 otherSIMInfo:v7 serviceStringGetter:v15 serviceStringSetter:v14 serviceCrossfadeStringGetter:v13 serviceCrossfadeStringSetter:v12 serviceContentTypeGetter:v11 serviceContentTypeSetter:v10 serviceBadgeStringGetter:v9 serviceBadgeStringSetter:v8];
  }
}

id __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8656);
}

void __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8656), a2);
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8656) getCString:*(void *)(a1 + 32) + 964 maxLength:100 encoding:4];
}

id __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8664);
}

void __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8664), a2);
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8664) getCString:*(void *)(a1 + 32) + 1164 maxLength:100 encoding:4];
}

uint64_t __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_5(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 2492);
}

uint64_t __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_6(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(result + 32) + 2492) = a2;
  return result;
}

id __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_7(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8680);
}

void __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8680), a2);
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8680) getCString:*(void *)(a1 + 32) + 3677 maxLength:100 encoding:4];
}

- (void)_updateServiceItem:(int)a3 withData:(id)a4 SIMInfo:(id)a5 otherSIMInfo:(id)a6 serviceStringGetter:(id)a7 serviceStringSetter:(id)a8 serviceCrossfadeStringGetter:(id)a9 serviceCrossfadeStringSetter:(id)a10 serviceContentTypeGetter:(id)a11 serviceContentTypeSetter:(id)a12 serviceBadgeStringGetter:(id)a13 serviceBadgeStringSetter:(id)a14
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v79 = a4;
  id v18 = a5;
  id v83 = a6;
  uint64_t v19 = (void (**)(void))a7;
  uint64_t v20 = (void (**)(id, __CFString *))a8;
  id v80 = a9;
  uint64_t v21 = (void (**)(id, void *))a10;
  uint64_t v22 = (unsigned int (**)(void))a11;
  unsigned int v23 = (void (**)(id, uint64_t))a12;
  v82 = (void (**)(void))a13;
  v81 = (void (**)(id, void))a14;
  if (self->_showsRecordingOverrides)
  {
    [(SBStatusBarStateAggregator *)self _setItem:a3 enabled:1];
    v20[2](v20, &stru_1F3084718);
    v23[2](v23, 4);
    unsigned int v24 = v79;
    id v25 = v83;
    char v26 = v18;
LABEL_6:
    id v27 = v19;
    id v28 = v80;
    goto LABEL_7;
  }
  char v26 = v18;
  if (!v18 || self->_suppressCellServiceForAirplaneModeTransition)
  {
    [(SBStatusBarStateAggregator *)self _setItem:a3 enabled:0];
    unsigned int v24 = v79;
    id v25 = v83;
    goto LABEL_6;
  }
  unsigned int v24 = v79;
  id v25 = v83;
  id v27 = v19;
  if ([(SBStatusBarStateAggregator *)self _isInAirplaneMode])
  {
    uint64_t v29 = [v26 isRegisteredWithoutCellular];
    [(SBStatusBarStateAggregator *)self _setItem:a3 enabled:v29];
    id v28 = v80;
    if ((v29 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    [(SBStatusBarStateAggregator *)self _setItem:a3 enabled:1];
  }
  char v72 = [v79 isCellularRadioCapabilityEnabled];
  id v65 = v20;
  if ((v72 & 1) != 0 || [v26 isRegisteredWithoutCellular])
  {
    id v75 = [v26 serviceDescription];
  }
  else
  {
    uint64_t v30 = MGCopyAnswer();
    if (v30) {
      __int16 v31 = (__CFString *)v30;
    }
    else {
      __int16 v31 = 0;
    }
    id v75 = v31;
  }
  BOOL v77 = [(SBStatusBarStateAggregator *)self _shouldShowEmergencyOnlyStatusForInfo:v26];
  uint64_t v32 = [v26 serviceState];
  int v33 = [v79 isInactiveSOSEnabled];
  if ([v26 isBootstrap])
  {
    v73 = 0;
    if (((v77 | v33) & ((v32 & 0xFFFFFFFFFFFFFFFELL) == 2)) != 0) {
      char v34 = 2;
    }
    else {
      char v34 = 0;
    }
    *((unsigned char *)&self->_data + 3160) = *((unsigned char *)&self->_data + 3160) & 0xFC | v77 | v33 | v34;
    int v35 = 7;
    goto LABEL_29;
  }
  char v67 = v33;
  if (v72)
  {
    uint64_t v36 = v32;
    if (v32 == 2)
    {
      unsigned int v70 = 0;
      v73 = 0;
      id v37 = self;
      uint64_t v20 = v65;
      char v38 = v67;
      if (v77) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
    id v37 = self;
    if (v77)
    {
      *((unsigned char *)&self->_data + 3160) |= 1u;
      uint64_t v39 = [v26 secondaryServiceDescription];
      uint64_t v36 = v32;
      v73 = (__CFString *)v39;
      BOOL v40 = v77;
    }
    else
    {
      BOOL v40 = 0;
      v73 = 0;
    }
    if (v36 == 1)
    {
      unsigned int v70 = 5;
    }
    else
    {
      if ([v79 isUsingStewieConnection])
      {
        unsigned int v70 = 0;
      }
      else
      {
        if ([v79 isRadioModuleDead]) {
          int v41 = 6;
        }
        else {
          int v41 = 1;
        }
        unsigned int v70 = v41;
      }
      uint64_t v36 = v32;
      BOOL v40 = v77;
    }
    if (v40)
    {
      uint64_t v20 = v65;
    }
    else
    {
      BOOL v42 = [(SBStatusBarStateAggregator *)self _shouldShowEmergencyOnlyStatusForInfo:v83];
      uint64_t v36 = v32;
      uint64_t v20 = v65;
      char v38 = v67;
      if (!v42) {
LABEL_45:
      }
        *((unsigned char *)&v37->_data + 3160) = *((unsigned char *)&v37->_data + 3160) & 0xFE | v38;
    }
LABEL_46:
    if ((*((unsigned char *)&v37->_data + 3160) & ((v36 & 0xFFFFFFFFFFFFFFFELL) == 2)) != 0) {
      char v43 = 2;
    }
    else {
      char v43 = 0;
    }
    *((unsigned char *)&v37->_data + 3160) = v43 | *((unsigned char *)&v37->_data + 3160) & 0xFD;
    goto LABEL_50;
  }
  v73 = 0;
  *((unsigned char *)&self->_data + 3160) &= 0xFCu;
  int v35 = 2;
LABEL_29:
  unsigned int v70 = v35;
  uint64_t v20 = v65;
LABEL_50:
  id v44 = SBLogStatusBarish();
  id v28 = v80;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v45 = *((unsigned __int8 *)&self->_data + 3160);
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v87 = v45 & 1;
    *(_WORD *)&v87[4] = 1026;
    *(_DWORD *)&v87[6] = (v45 >> 1) & 1;
    _os_log_impl(&dword_1D85BA000, v44, OS_LOG_TYPE_DEFAULT, "shouldShowEmergencyOnlyStatus: %{public}i, emergencyOnly: %{public}i", buf, 0xEu);
  }

  long long v46 = @"secondary ";
  if (a3 != 7) {
    long long v46 = &stru_1F3084718;
  }
  id v78 = v46;
  if (v70 != v22[2](v22))
  {
    uint64_t v47 = SBLogStatusBarish();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int serviceContentType = self->_data.serviceContentType;
      *(_DWORD *)buf = 138543874;
      *(void *)v87 = v78;
      *(_WORD *)&v87[8] = 1024;
      *(_DWORD *)uint64_t v88 = serviceContentType;
      *(_WORD *)&v88[4] = 1024;
      *(_DWORD *)&v88[6] = v70;
      _os_log_impl(&dword_1D85BA000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@serviceContent changing from %i to %i", buf, 0x18u);
    }

    v23[2](v23, v70);
    [(SBStatusBarStateAggregator *)self _notifyItemChanged:a3];
  }
  id v49 = &stru_1F3084718;
  if (v75) {
    id v49 = v75;
  }
  long long v50 = v49;

  v27[2](v27);
  id v71 = v76 = v50;
  char v51 = -[__CFString isEqualToString:](v50, "isEqualToString:");
  id v25 = v83;
  if ((v51 & 1) == 0)
  {
    id v52 = SBLogStatusBarish();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v68 = SBStatusBarItemDebugName(a3);
      *(_DWORD *)buf = 138543874;
      *(void *)v87 = v68;
      *(_WORD *)&v87[8] = 2114;
      *(void *)uint64_t v88 = v71;
      *(_WORD *)&v88[8] = 2114;
      id v89 = v76;
      _os_log_impl(&dword_1D85BA000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ changing from '%{public}@' to '%{public}@'", buf, 0x20u);
    }
    v20[2](v20, v76);
    [(SBStatusBarStateAggregator *)self _notifyItemChanged:a3];
    [(SBStatusBarStateAggregator *)self _requestActions:1];
  }
  objc_super v53 = &stru_1F3084718;
  if (v73) {
    objc_super v53 = v73;
  }
  id v54 = v53;

  uint64_t v55 = (*((void (**)(id))v80 + 2))(v80);
  uint64_t v74 = v54;
  long long v56 = v54;
  unsigned int v24 = v79;
  v69 = (void *)v55;
  if ((-[__CFString isEqualToString:](v56, "isEqualToString:") & 1) == 0)
  {
    long long v57 = SBLogStatusBarish();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)v87 = v78;
      *(_WORD *)&v87[8] = 2114;
      *(void *)uint64_t v88 = v69;
      *(_WORD *)&v88[8] = 2114;
      id v89 = v74;
      _os_log_impl(&dword_1D85BA000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@serviceCrossfade changing from '%{public}@' to '%{public}@'", buf, 0x20u);
    }

    v21[2](v21, v74);
    [(SBStatusBarStateAggregator *)self _notifyItemChanged:a3];
    [(SBStatusBarStateAggregator *)self _requestActions:8];
  }
  v64 = v21;
  id v58 = &stru_1F3084718;
  if (v83)
  {
    uint64_t v59 = [v26 shortLabel];
    long long v60 = (void *)v59;
    if (v59) {
      long long v61 = (__CFString *)v59;
    }
    else {
      long long v61 = &stru_1F3084718;
    }
    id v58 = v61;
  }
  v62 = v82[2]();
  if ((-[__CFString isEqualToString:](v58, "isEqualToString:") & 1) == 0)
  {
    id v66 = v58;
    v63 = SBLogStatusBarish();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)v87 = v78;
      *(_WORD *)&v87[8] = 2114;
      *(void *)uint64_t v88 = v62;
      *(_WORD *)&v88[8] = 2114;
      id v89 = v66;
      _os_log_impl(&dword_1D85BA000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@serviceBadgeString changing from '%{public}@' to '%{public}@'", buf, 0x20u);
    }

    id v58 = v66;
    ((void (**)(id, __CFString *))v81)[2](v81, v66);
    [(SBStatusBarStateAggregator *)self _notifyItemChanged:a3];
  }

  uint64_t v21 = v64;
LABEL_7:
}

- (void)_updateDataNetworkItem
{
  char v3 = [(SBStatusBarStateAggregator *)self telephonyDomain];
  id v4 = [v3 data];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SBStatusBarStateAggregator__updateDataNetworkItem__block_invoke;
  v6[3] = &unk_1E6B0D4A0;
  void v6[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SBStatusBarStateAggregator__updateDataNetworkItem__block_invoke_2;
  v5[3] = &unk_1E6AF5558;
  v5[4] = self;
  [(SBStatusBarStateAggregator *)self _updateDataNetworkItem:9 withData:v4 primary:1 dataNetworkTypeGetter:v6 dataNetworkTypeSetter:v5];
}

uint64_t __52__SBStatusBarStateAggregator__updateDataNetworkItem__block_invoke(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 2512);
}

uint64_t __52__SBStatusBarStateAggregator__updateDataNetworkItem__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(result + 32) + 2512) = a2;
  return result;
}

- (void)_updateSecondaryDataNetworkItem
{
  char v3 = [(SBStatusBarStateAggregator *)self telephonyDomain];
  id v4 = [v3 data];

  uint64_t v5 = [v4 secondarySIMInfo];
  *((unsigned char *)&self->_data + 3160) = *((unsigned char *)&self->_data + 3160) & 0xFB | (4 * (v5 != 0));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SBStatusBarStateAggregator__updateSecondaryDataNetworkItem__block_invoke;
  v7[3] = &unk_1E6B0D4A0;
  void v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBStatusBarStateAggregator__updateSecondaryDataNetworkItem__block_invoke_2;
  v6[3] = &unk_1E6AF5558;
  void v6[4] = self;
  [(SBStatusBarStateAggregator *)self _updateDataNetworkItem:10 withData:v4 primary:0 dataNetworkTypeGetter:v7 dataNetworkTypeSetter:v6];
}

uint64_t __61__SBStatusBarStateAggregator__updateSecondaryDataNetworkItem__block_invoke(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 2516);
}

uint64_t __61__SBStatusBarStateAggregator__updateSecondaryDataNetworkItem__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(result + 32) + 2516) = a2;
  return result;
}

- (void)_updateDataNetworkItem:(int)a3 withData:(id)a4 primary:(BOOL)a5 dataNetworkTypeGetter:(id)a6 dataNetworkTypeSetter:(id)a7
{
  unsigned int v8 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v40 = a7;
  id v12 = (uint64_t (**)(id))((char *)a6 + 16);
  id v11 = (uint64_t (*)(id))*((void *)a6 + 2);
  id v13 = a6;
  id v14 = a4;
  uint64_t v15 = v11(v13);
  BOOL cachedShowRSSI = self->_cachedShowRSSI;
  int v17 = [v14 primarySIMInfo];
  id v18 = [v14 secondarySIMInfo];

  if (v8) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v18;
  }
  id v20 = v19;
  int v41 = v20;
  if (self->_showsRecordingOverrides)
  {
    BOOL v21 = 0;
    int v39 = 0;
    int v22 = 1;
    uint64_t v15 = 5;
    int v38 = 3;
  }
  else
  {
    unsigned int v23 = v20;
    if (([v17 isProvidingDataConnection] & 1) != 0
      || [v18 isProvidingDataConnection])
    {
      unsigned int v8 = [v23 isProvidingDataConnection];
    }
    unsigned int v24 = +[SBBluetoothController sharedInstance];
    int v25 = [v24 tetheringConnected];

    if (v25)
    {
      int v39 = 0;
      int v38 = 0;
      BOOL v21 = cachedShowRSSI;
      int v22 = 1;
      uint64_t v15 = 6;
    }
    else
    {
      char v26 = [(SBStatusBarStateAggregator *)self wifiDomain];
      id v27 = [v26 data];

      if ([v27 isWifiActive])
      {
        if ([v27 isAssociatedToIOSHotspot]) {
          uint64_t v15 = 6;
        }
        else {
          uint64_t v15 = 5;
        }
        int v38 = [v27 signalStrengthBars];
        id v28 = +[SBWiFiManager sharedInstance];
        int v39 = [v28 signalStrengthRSSI];

        int v22 = 1;
      }
      else
      {
        unsigned int v8 = [v41 isProvidingDataConnection];
        if (v41)
        {
          int v39 = 0;
          int v38 = 0;
          int v22 = 1;
          uint64_t v15 = 7;
          switch([v41 dataNetworkType])
          {
            case 1:
              break;
            case 2:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 0;
              break;
            case 3:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 1;
              break;
            case 4:
            case 5:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 2;
              break;
            case 6:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 3;
              break;
            case 7:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 4;
              break;
            case 8:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 9;
              break;
            case 9:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 10;
              break;
            case 10:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 8;
              break;
            case 11:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 11;
              break;
            case 12:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 12;
              break;
            case 13:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 13;
              break;
            case 14:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 14;
              break;
            case 15:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 15;
              break;
            case 16:
              int v39 = 0;
              int v38 = 0;
              uint64_t v15 = 16;
              break;
            default:
              goto LABEL_19;
          }
        }
        else
        {
LABEL_19:
          int v39 = 0;
          int v38 = 0;
          int v22 = 0;
        }
      }

      BOOL v21 = cachedShowRSSI;
    }
  }
  uint64_t v29 = v22 & v8;
  BOOL v30 = [(SBStatusBarStateAggregator *)self _setItem:a3 enabled:v29];
  int v31 = (*v12)(v13);

  if (v15 == v31)
  {
    uint64_t v32 = v40;
    if (!v8) {
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v32 = v40;
    (*((void (**)(id, uint64_t))v40 + 2))(v40, v15);
    if (v29) {
      [(SBStatusBarStateAggregator *)self _notifyItemChanged:a3];
    }
    BOOL v30 = 1;
    if (!v8) {
      goto LABEL_39;
    }
  }
  if (v38 != self->_data.wifiSignalStrengthBars)
  {
    self->_data.wifiSignalStrengthBars = v38;
    if (v29) {
      [(SBStatusBarStateAggregator *)self _notifyItemChanged:a3];
    }
  }
  if (v39 != self->_data.wifiSignalStrengthRaw)
  {
    self->_data.wifiSignalStrengthRaw = v39;
    if ((v21 & v29) == 1) {
      [(SBStatusBarStateAggregator *)self _notifyItemChanged:a3];
    }
  }
  char v33 = *((unsigned char *)&self->_data + 2529);
  if (((v21 ^ ((v33 & 4) == 0)) & 1) == 0)
  {
    if (v21) {
      char v34 = 4;
    }
    else {
      char v34 = 0;
    }
    *((unsigned char *)&self->_data + 2529) = v33 & 0xFB | v34;
    if (!v29) {
      goto LABEL_43;
    }
    [(SBStatusBarStateAggregator *)self _notifyItemChanged:a3];
  }
LABEL_39:
  if ((v29 & v30) == 1)
  {
    int v35 = SBLogStatusBarish();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = SBStatusBarItemDebugName(a3);
      id v37 = SBStatusBarDataNetworkDebugName(v15);
      *(_DWORD *)buf = 138543618;
      id v44 = v36;
      __int16 v45 = 2114;
      long long v46 = v37;
      _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ changed to %{public}@", buf, 0x16u);
    }
  }
LABEL_43:
}

- (void)_updateLiquidDetectionItem
{
  char v3 = [(STStatusItemsStatusDomain *)self->_statusItemsDomain data];
  id v4 = [v3 activeStatusItems];
  uint64_t v5 = [v4 containsObject:*MEMORY[0x1E4FA98E8]];

  [(SBStatusBarStateAggregator *)self _setItem:40 enabled:v5];
}

- (void)_updateStewieItem
{
  uint64_t v2 = [(SBStatusBarStateAggregator *)self telephonyDomain];
  char v3 = [(id)v2 data];

  LOBYTE(v2) = [v3 isUsingStewieForSOS];
  unsigned int v4 = [v3 isUsingStewieConnection];
  if (v2) {
    [MEMORY[0x1E4FA94B8] entryWithConnectionStatus:v4];
  }
  else {
  uint64_t v5 = [MEMORY[0x1E4FA94B8] disabledEntry];
  }
  char v6 = [MEMORY[0x1E4FA9968] sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__SBStatusBarStateAggregator__updateStewieItem__block_invoke;
  v8[3] = &unk_1E6B0D4C8;
  id v9 = v5;
  id v7 = v5;
  [v6 updateWithData:v8];
}

uint64_t __47__SBStatusBarStateAggregator__updateStewieItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dataByReplacingEntry:*(void *)(a1 + 32) forKey:*MEMORY[0x1E4FA97C0]];
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 state];
  if (v4 == 10 || v4 == 5)
  {
    unsigned int v8 = [v9 retrieveConnectedPeripheralsWithServices:0 allowAll:1];
    if ([v8 count])
    {
      char v6 = (NSMutableArray *)[v8 mutableCopy];
      connectedLEBluetoothDevices = self->_connectedLEBluetoothDevices;
      self->_connectedLEBluetoothDevices = v6;
    }
  }
  else
  {
    unsigned int v8 = self->_connectedLEBluetoothDevices;
    self->_connectedLEBluetoothDevices = 0;
  }

  [(SBStatusBarStateAggregator *)self updateStatusBarItem:16];
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  id v11 = a4;
  int v5 = [v11 isConnectedToSystem];
  int v6 = [(NSMutableArray *)self->_connectedLEBluetoothDevices containsObject:v11];
  if (v5)
  {
    if (v6) {
      goto LABEL_10;
    }
    connectedLEBluetoothDevices = self->_connectedLEBluetoothDevices;
    if (!connectedLEBluetoothDevices)
    {
      unsigned int v8 = [MEMORY[0x1E4F1CA48] array];
      id v9 = self->_connectedLEBluetoothDevices;
      self->_connectedLEBluetoothDevices = v8;

      connectedLEBluetoothDevices = self->_connectedLEBluetoothDevices;
    }
    [(NSMutableArray *)connectedLEBluetoothDevices addObject:v11];
  }
  else
  {
    if (!v6) {
      goto LABEL_10;
    }
    [(NSMutableArray *)self->_connectedLEBluetoothDevices removeObject:v11];
    if (![(NSMutableArray *)self->_connectedLEBluetoothDevices count])
    {
      uint64_t v10 = self->_connectedLEBluetoothDevices;
      self->_connectedLEBluetoothDevices = 0;
    }
  }
  [(SBStatusBarStateAggregator *)self updateStatusBarItem:16];
LABEL_10:
}

- (void)_updateBluetoothItem
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (MGGetBoolAnswer()
    && (uint64_t v3 = [(NSMutableArray *)self->_connectedClassicBluetoothDevices count],
        v3 + [(NSMutableArray *)self->_connectedLEBluetoothDevices count]))
  {
    BOOL v5 = [(SBStatusBarStateAggregator *)self _setItem:16 enabled:1];
    if (*((unsigned char *)&self->_data + 2529))
    {
      if (!v5) {
        return;
      }
    }
    else
    {
      *((unsigned char *)&self->_data + 2529) |= 1u;
      [(SBStatusBarStateAggregator *)self _notifyItemChanged:16];
      [(SBStatusBarStateAggregator *)self _requestActions:2];
    }
  }
  else
  {
    BOOL v4 = [(SBStatusBarStateAggregator *)self _setItem:16 enabled:0];
    *((unsigned char *)&self->_data + 2529) &= ~1u;
    if (!v4) {
      return;
    }
  }
  int v6 = SBLogStatusBarish();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *((unsigned char *)&self->_data + 2529) & 1;
    v8[0] = 67109120;
    v8[1] = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "bluetoothConnected changed to %i", (uint8_t *)v8, 8u);
  }
}

- (void)_updateBluetoothHeadphonesItem
{
  uint64_t v3 = +[SBAVSystemControllerCache sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke;
  v4[3] = &unk_1E6AF8F58;
  v4[4] = self;
  [v3 fetchPickableRoutesWithCompletion:v4];
}

void __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  BOOL v4 = objc_msgSend(v3, "bs_map:", &__block_literal_global_177_0);
  BOOL v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke_3;
  block[3] = &unk_1E6AF4E00;
  id v9 = v3;
  id v10 = v4;
  uint64_t v11 = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, block);
}

id __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBBluetoothController sharedInstance];
  BOOL v4 = [v3 deviceForAudioRoute:v2];

  return v4;
}

void __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke_3(uint64_t a1)
{
  if (![*(id *)(a1 + 32) count])
  {
LABEL_28:
    char v21 = 0;
    BOOL v22 = 0;
    goto LABEL_29;
  }
  uint64_t v2 = 0;
  id v3 = (void *)MEMORY[0x1E4F74E10];
  BOOL v4 = (void *)MEMORY[0x1E4F74C38];
  while (1)
  {
    BOOL v5 = [*(id *)(a1 + 32) objectAtIndex:v2];
    id v6 = [v5 objectForKey:*v3];
    char v7 = [v6 isEqualToString:*v4];

    unsigned int v8 = [v5 objectForKey:*MEMORY[0x1E4F74DE8]];
    int v9 = [v8 BOOLValue];

    id v10 = [v5 objectForKey:*MEMORY[0x1E4F74D90]];
    int v11 = [v10 BOOLValue];

    id v12 = [v5 objectForKey:*MEMORY[0x1E4F74D50]];
    int v13 = [v12 BOOLValue];

    if ((v7 & 1) == 0 && (v9 & 1) == 0 && (v11 & 1) == 0 && !v13) {
      goto LABEL_27;
    }
    id v14 = [*(id *)(a1 + 40) objectAtIndex:v2];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
LABEL_26:

LABEL_27:
    if (++v2 >= (unint64_t)[*(id *)(a1 + 32) count]) {
      goto LABEL_28;
    }
  }
  uint64_t v15 = [v5 objectForKey:*MEMORY[0x1E4F74E18]];
  if (!v15) {
    goto LABEL_25;
  }
  id v16 = [v14 address];

  if (!v16) {
    goto LABEL_25;
  }
  int v17 = [v14 address];
  int v18 = [v15 hasPrefix:v17];

  if ([v14 isAppleAudioDevice] && objc_msgSend(v14, "inEarDetectEnabled"))
  {
    int v28 = 3;
    int v29 = 0;
    [v14 inEarStatusPrimary:&v29 secondary:&v28];
    if (v29) {
      BOOL v19 = v28 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    int v20 = v19;
  }
  else
  {
    int v20 = 1;
  }
  if ([v14 type] == 20)
  {
    if ((v18 & v20) == 1) {
      goto LABEL_30;
    }
    goto LABEL_25;
  }
  if [v14 type] != 16 || ((v18 ^ 1) & 1) != 0 || ((v20 ^ 1))
  {
LABEL_25:

    id v3 = (void *)MEMORY[0x1E4F74E10];
    BOOL v4 = (void *)MEMORY[0x1E4F74C38];
    goto LABEL_26;
  }
LABEL_30:
  char v21 = [v14 isAppleAudioDevice] ^ 1;
  if ((v13 ^ 1 | v9 | v11))
  {
    BOOL v22 = 1;
  }
  else
  {
    unsigned int v23 = [MEMORY[0x1E4F165C8] sharedSystemAudioContext];
    unsigned int v24 = [v23 predictedOutputDevice];

    BOOL v22 = v24 != 0;
  }

LABEL_29:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke_4;
  block[3] = &unk_1E6AF7EB8;
  void block[4] = *(void *)(a1 + 48);
  BOOL v26 = v22;
  char v27 = v21;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldShowBluetoothHeadphoneGlyph:*(unsigned __int8 *)(a1 + 40) andShouldShowBluetoothHeadphoneBatteryPercent:*(unsigned __int8 *)(a1 + 41)];
  uint64_t v2 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v3 = v2[8760];
  return [v2 _setItem:42 enabled:v3];
}

- (void)_updateBluetoothBatteryItem
{
  if (MGGetBoolAnswer())
  {
    uint64_t v3 = +[SBBluetoothController sharedInstance];
    if ([v3 canReportBatteryLevel] && self->_shouldShowBluetoothHeadphoneBatteryPercent)
    {
      int v4 = [v3 batteryLevel];

      [(SBStatusBarStateAggregator *)self _setItem:15 enabled:1];
      if (v4 != self->_data.bluetoothBatteryCapacity)
      {
        self->_data.bluetoothBatteryCapacity = v4;
        [(SBStatusBarStateAggregator *)self _notifyItemChanged:15];
      }
      return;
    }
  }
  [(SBStatusBarStateAggregator *)self _setItem:15 enabled:0];
}

- (void)_updateTTYItem
{
  uint64_t v3 = [(STStatusItemsStatusDomain *)self->_statusItemsDomain data];
  int v4 = [v3 activeStatusItems];
  uint64_t v5 = [v4 containsObject:*MEMORY[0x1E4FA9900]];

  [(SBStatusBarStateAggregator *)self _setItem:17 enabled:v5];
}

- (void)_updateAlarmItem
{
  uint64_t v3 = [(STStatusItemsStatusDomain *)self->_statusItemsDomain data];
  int v4 = [v3 activeStatusItems];
  uint64_t v5 = [v4 containsObject:*MEMORY[0x1E4FA98D0]];

  [(SBStatusBarStateAggregator *)self _setItem:18 enabled:v5];
}

- (void)_updateVPNItem
{
  uint64_t v3 = [(STStatusItemsStatusDomain *)self->_statusItemsDomain data];
  int v4 = [v3 activeStatusItems];
  uint64_t v5 = [v4 containsObject:*MEMORY[0x1E4FA9908]];

  [(SBStatusBarStateAggregator *)self _setItem:29 enabled:v5];
}

- (void)_updateStudentItem
{
  uint64_t v3 = [(STStatusItemsStatusDomain *)self->_statusItemsDomain data];
  int v4 = [v3 activeStatusItems];
  uint64_t v5 = [v4 containsObject:*MEMORY[0x1E4FA98F8]];

  [(SBStatusBarStateAggregator *)self _setItem:27 enabled:v5];
}

- (void)_updateCallForwardingItem
{
  uint64_t v3 = [(SBStatusBarStateAggregator *)self telephonyDomain];
  int v4 = [v3 data];
  id v5 = [v4 primarySIMInfo];

  [(SBStatusBarStateAggregator *)self _updateCallForwardingItem:30 withInfo:v5];
}

- (void)_updateSecondaryCallForwardingItem
{
  uint64_t v3 = [(SBStatusBarStateAggregator *)self telephonyDomain];
  int v4 = [v3 data];
  id v5 = [v4 secondarySIMInfo];

  [(SBStatusBarStateAggregator *)self _updateCallForwardingItem:31 withInfo:v5];
}

- (void)_updateCallForwardingItem:(int)a3 withInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = [a4 isCallForwardingEnabled];
  [(SBStatusBarStateAggregator *)self _setItem:v4 enabled:v6];
}

- (void)_updateVoiceControlItem
{
  uint64_t v3 = [(SBStatusBarStateAggregator *)self voiceControlDomain];
  id v8 = [v3 data];

  uint64_t v4 = [v8 isVoiceControlActive];
  [(SBStatusBarStateAggregator *)self _setItem:41 enabled:v4];
  if (v4)
  {
    uint64_t v5 = [v8 listeningState];
    int v6 = 2 * (v5 == 2);
    if (v5 == 1) {
      int v6 = 1;
    }
    unsigned int v7 = *((unsigned __int8 *)&self->_data + 2529);
    if (v6 != ((v7 >> 5) & 3))
    {
      *((unsigned char *)&self->_data + 2529) = v7 & 0x9F | (32 * v6);
      [(SBStatusBarStateAggregator *)self _notifyItemChanged:41];
    }
  }
}

- (void)_updateRotationLockItem
{
  uint64_t v3 = [(STStatusItemsStatusDomain *)self->_statusItemsDomain data];
  uint64_t v4 = [v3 activeStatusItems];
  uint64_t v5 = [v4 containsObject:*MEMORY[0x1E4FA98F0]];

  [(SBStatusBarStateAggregator *)self _setItem:22 enabled:v5];
}

- (void)_updateQuietModeItem
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(SBStatusBarStateAggregator *)self _systemApertureElementIsVisibleForStatusBarItem:2])
  {
    [(SBStatusBarStateAggregator *)self _setItem:2 enabled:0];
  }
  else
  {
    BOOL v3 = self->_data.itemIsEnabled[2];
    long long v4 = *(_OWORD *)&self->_data.quietModeImage[208];
    v26[12] = *(_OWORD *)&self->_data.quietModeImage[192];
    v26[13] = v4;
    long long v5 = *(_OWORD *)&self->_data.quietModeImage[240];
    v26[14] = *(_OWORD *)&self->_data.quietModeImage[224];
    v26[15] = v5;
    long long v6 = *(_OWORD *)&self->_data.quietModeImage[144];
    v26[8] = *(_OWORD *)&self->_data.quietModeImage[128];
    v26[9] = v6;
    long long v7 = *(_OWORD *)&self->_data.quietModeImage[176];
    v26[10] = *(_OWORD *)&self->_data.quietModeImage[160];
    v26[11] = v7;
    long long v8 = *(_OWORD *)&self->_data.quietModeImage[80];
    v26[4] = *(_OWORD *)&self->_data.quietModeImage[64];
    v26[5] = v8;
    long long v9 = *(_OWORD *)&self->_data.quietModeImage[112];
    v26[6] = *(_OWORD *)&self->_data.quietModeImage[96];
    v26[7] = v9;
    long long v10 = *(_OWORD *)&self->_data.quietModeImage[16];
    v26[0] = *(_OWORD *)self->_data.quietModeImage;
    v26[1] = v10;
    long long v11 = *(_OWORD *)&self->_data.quietModeImage[48];
    v26[2] = *(_OWORD *)&self->_data.quietModeImage[32];
    v26[3] = v11;
    long long v12 = *(_OWORD *)&self->_data.quietModeName[208];
    __s1[12] = *(_OWORD *)&self->_data.quietModeName[192];
    __s1[13] = v12;
    long long v13 = *(_OWORD *)&self->_data.quietModeName[240];
    __s1[14] = *(_OWORD *)&self->_data.quietModeName[224];
    __s1[15] = v13;
    long long v14 = *(_OWORD *)&self->_data.quietModeName[144];
    __s1[8] = *(_OWORD *)&self->_data.quietModeName[128];
    __s1[9] = v14;
    long long v15 = *(_OWORD *)&self->_data.quietModeName[176];
    __s1[10] = *(_OWORD *)&self->_data.quietModeName[160];
    __s1[11] = v15;
    long long v16 = *(_OWORD *)&self->_data.quietModeName[80];
    __s1[4] = *(_OWORD *)&self->_data.quietModeName[64];
    __s1[5] = v16;
    long long v17 = *(_OWORD *)&self->_data.quietModeName[112];
    __s1[6] = *(_OWORD *)&self->_data.quietModeName[96];
    __s1[7] = v17;
    long long v18 = *(_OWORD *)&self->_data.quietModeName[16];
    __s1[0] = *(_OWORD *)self->_data.quietModeName;
    __s1[1] = v18;
    long long v19 = *(_OWORD *)&self->_data.quietModeName[48];
    __s1[2] = *(_OWORD *)&self->_data.quietModeName[32];
    __s1[3] = v19;
    id v24 = [(SBStatusBarStateAggregator *)self focusDomain];
    int v20 = [v24 data];
    char v21 = [v20 modeSymbol];
    [v21 getCString:self->_data.quietModeImage maxLength:256 encoding:4];
    BOOL v22 = [v20 modeName];
    [v22 getCString:self->_data.quietModeName maxLength:256 encoding:4];
    if (v3 != (v21 != 0)
      || (int v23 = memcmp(__s1, self->_data.quietModeName, 0x100uLL),
          memcmp(v26, self->_data.quietModeImage, 0x100uLL) | v23))
    {
      [(SBStatusBarStateAggregator *)self _requestActions:16];
    }
    [(SBStatusBarStateAggregator *)self _setItem:2 enabled:v21 != 0];
  }
}

- (void)_updateAirplayItem
{
  if (self->_showsRecordingOverrides)
  {
    uint64_t v3 = 0;
  }
  else
  {
    long long v4 = [(STStatusItemsStatusDomain *)self->_statusItemsDomain data];
    long long v5 = [v4 activeStatusItems];
    uint64_t v3 = [v5 containsObject:*MEMORY[0x1E4FA98C0]];
  }
  [(SBStatusBarStateAggregator *)self _setItem:24 enabled:v3];
}

- (void)_updateThermalColorItem
{
  if (os_variant_has_internal_content() && self->_cachedShowThermalWarning)
  {
    uint64_t v3 = +[SBThermalController sharedInstance];
    int v4 = objc_msgSend((id)objc_opt_class(), "_thermalColorForLevel:", objc_msgSend(v3, "level"));
    BOOL v5 = v4 != 0;
    if (v4) {
      int v6 = [v3 isInSunlight];
    }
    else {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
    int v4 = 0;
    BOOL v5 = 0;
  }
  [(SBStatusBarStateAggregator *)self _setItem:33 enabled:v5];
  char v7 = *((unsigned char *)&self->_data + 2272);
  if (self->_data.thermalColor != v4 || v6 != (v7 & 1))
  {
    self->_data.thermalColor = v4;
    *((unsigned char *)&self->_data + 2272) = v7 & 0xFE | v6;
    [(SBStatusBarStateAggregator *)self _notifyItemChanged:33];
  }
}

- (void)_updateDisplayWarningItem
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(STStatusItemsStatusDomain *)self->_statusItemsDomain data];
  int v4 = [v3 activeStatusItems];
  uint64_t v5 = [v4 containsObject:*MEMORY[0x1E4FA98E0]];

  int v6 = SBLogStatusBarish();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = @"disabled";
    if (v5) {
      char v7 = @"enabled";
    }
    int v8 = 138543362;
    long long v9 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Display reference mode warning %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [(SBStatusBarStateAggregator *)self _setItem:44 enabled:v5];
}

- (void)_updateCarPlayItem
{
  uint64_t v3 = [(STStatusItemsStatusDomain *)self->_statusItemsDomain data];
  int v4 = [v3 activeStatusItems];
  uint64_t v5 = [v4 containsObject:*MEMORY[0x1E4FA98D8]];

  [(SBStatusBarStateAggregator *)self _setItem:26 enabled:v5];
}

- (void)_updateSensorActivityItem
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = objc_msgSend((id)SBApp, "windowSceneManager", 0);
  int v4 = [v3 connectedWindowScenes];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    LOBYTE(v7) = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) recordingIndicatorManager];
        long long v11 = v10;
        if (v7) {
          uint64_t v7 = 1;
        }
        else {
          uint64_t v7 = [v10 isIndicatorVisibleAtStatusBarLocation];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  [(SBStatusBarStateAggregator *)self _setItem:28 enabled:v7];
}

- (void)_updatePersonNameItem
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(SBStatusBarStateAggregator *)self _shouldShowPersonName])
  {
    overridePersonName = self->_overridePersonName;
    if (overridePersonName)
    {
      int v4 = overridePersonName;
    }
    else
    {
      uint64_t v5 = [(SBStatusBarStateAggregator *)self _userSessionController];
      uint64_t v6 = [v5 user];
      int v4 = [v6 displayName];
    }
  }
  else
  {
    int v4 = 0;
  }
  if (![(NSString *)self->_personName isEqualToString:v4])
  {
    uint64_t v7 = SBLogStatusBarish();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      personName = self->_personName;
      int v12 = 138543618;
      long long v13 = personName;
      __int16 v14 = 2114;
      long long v15 = v4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "personName changing from '%{public}@' to '%{public}@'", (uint8_t *)&v12, 0x16u);
    }

    long long v9 = self->_personName;
    self->_personName = v4;
    uint64_t v10 = v4;

    [(SBStatusBarStateAggregator *)self beginCoalescentBlock];
    [(SBStatusBarStateAggregator *)self _setItem:8 enabled:[(NSString *)self->_personName length] != 0];
    long long v11 = &stru_1F3084718;
    if (v10) {
      long long v11 = v10;
    }
    int v4 = v11;

    [(NSString *)v4 getCString:self->_data.personName maxLength:100 encoding:4];
    [(SBStatusBarStateAggregator *)self _notifyItemChanged:8];
    [(SBStatusBarStateAggregator *)self _updateServiceItem];
    [(SBStatusBarStateAggregator *)self _updateSecondaryServiceItem];
    [(SBStatusBarStateAggregator *)self endCoalescentBlock];
  }
}

- (void)_updateCallToActionItem
{
  uint64_t v3 = [(STStatusItemsStatusDomain *)self->_statusItemsDomain data];
  int v4 = [v3 attributions];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __53__SBStatusBarStateAggregator__updateCallToActionItem__block_invoke;
  v22[3] = &unk_1E6B0D4F0;
  id v5 = v3;
  id v23 = v5;
  uint64_t v6 = objc_msgSend(v4, "bs_firstObjectPassingTest:", v22);

  uint64_t v7 = [v6 statusItemIdentifier];
  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v8 = (NSString *)[v7 copy];
    callToActionIdentifier = self->_callToActionIdentifier;
    self->_callToActionIdentifier = v8;

    if (self->_callToActionIdentifier)
    {
      uint64_t v10 = [v5 visualDescriptorForStatusItemWithIdentifier:v7];
      long long v11 = (void *)MEMORY[0x1E4FA9490];
      int v12 = [v10 systemImageName];
      long long v13 = [v11 entryWithImageNamed:v12];
    }
    else
    {
      long long v13 = [MEMORY[0x1E4FA9490] disabledEntry];
    }
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    long long v19 = __53__SBStatusBarStateAggregator__updateCallToActionItem__block_invoke_2;
    int v20 = &unk_1E6B0D4C8;
    id v21 = v13;
    id v14 = v13;
    long long v15 = (void *)MEMORY[0x1D948C7A0](&v17);
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4FA9968], "sharedInstance", v17, v18, v19, v20);
    [v16 updateWithData:v15];
  }
}

uint64_t __53__SBStatusBarStateAggregator__updateCallToActionItem__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 statusItemIdentifier];
  int v4 = [*(id *)(a1 + 32) visualDescriptorForStatusItemWithIdentifier:v3];
  uint64_t v5 = [v4 isCallToAction];

  return v5;
}

uint64_t __53__SBStatusBarStateAggregator__updateCallToActionItem__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dataByReplacingEntry:*(void *)(a1 + 32) forKey:*MEMORY[0x1E4FA9748]];
}

- (void)_updateRingerItem
{
  uint64_t v3 = [(id)SBApp ringerControl];
  uint64_t v4 = -[SBRingerControl isRingerMuted]((uint64_t)v3);

  if ([(SBStatusBarDefaults *)self->_statusBarDefaults showRingerState]) {
    [MEMORY[0x1E4FA9468] entryWithBoolValue:v4];
  }
  else {
  uint64_t v5 = [MEMORY[0x1E4FA9468] disabledEntry];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SBStatusBarStateAggregator__updateRingerItem__block_invoke;
  v9[3] = &unk_1E6B0D4C8;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = (void *)MEMORY[0x1D948C7A0](v9);
  uint64_t v8 = [MEMORY[0x1E4FA9968] sharedInstance];
  [v8 updateWithData:v7];
}

uint64_t __47__SBStatusBarStateAggregator__updateRingerItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dataByReplacingEntry:*(void *)(a1 + 32) forKey:*MEMORY[0x1E4FA97B0]];
}

- (void)_updateStatusBarForSystemStatusDomainName:(unint64_t)a3 data:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0xEuLL:
      [(SBStatusBarStateAggregator *)self _updateStatusBarItemsForSystemStatusDomain:14 andData:v6];
      break;
    case 8uLL:
      uint64_t v7 = self;
      uint64_t v8 = 8;
      goto LABEL_7;
    case 7uLL:
      uint64_t v7 = self;
      uint64_t v8 = 7;
LABEL_7:
      [(SBStatusBarStateAggregator *)v7 _updateBackgroundActivityAssertionsForSystemStatusDomain:v8 andData:v6];
      break;
    default:
      long long v9 = SBLogStatusBarish();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[SBStatusBarStateAggregator _updateStatusBarForSystemStatusDomainName:data:](v9);
      }

      break;
  }
}

- (void)_updateBackgroundActivityAssertionsForSystemStatusDomain:(unint64_t)a3 andData:(id)a4
{
  id v6 = a4;
  if (a3 == 8)
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v6;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        int v12 = v11;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    id v13 = v12;

    if (![v13 isStewieActive])
    {
      [(SBStatusBarStateAggregator *)self _removeSatelliteSOSBackgroundActivityAssertion];
      goto LABEL_22;
    }
    if (!self->_satelliteSOSBackgroundActivityAssertion)
    {
      uint64_t v18 = [MEMORY[0x1E4FA6A18] assertionWithBackgroundActivityIdentifier:*MEMORY[0x1E4FA9670] forPID:getpid() exclusive:0 showsWhenForeground:0];
      satelliteSOSBackgroundActivityAssertiouint64_t n = self->_satelliteSOSBackgroundActivityAssertion;
      self->_satelliteSOSBackgroundActivityAssertiouint64_t n = v18;

      objc_initWeak(&location, self);
      int v20 = self->_satelliteSOSBackgroundActivityAssertion;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_202;
      v21[3] = &unk_1E6AF4B10;
      uint64_t v17 = &v22;
      objc_copyWeak(&v22, &location);
      [(SBSBackgroundActivityAssertion *)v20 acquireWithHandler:&__block_literal_global_201_0 invalidationHandler:v21];
      goto LABEL_20;
    }
LABEL_22:

    goto LABEL_23;
  }
  if (a3 == 7)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        long long v9 = v8;
      }
      else {
        long long v9 = 0;
      }
    }
    else
    {
      long long v9 = 0;
    }
    id v13 = v9;

    if ([v13 isPlaygroundsActive])
    {
      if (!self->_playgroundsBackgroundActivityAssertion)
      {
        id v14 = [MEMORY[0x1E4FA6A18] assertionWithBackgroundActivityIdentifier:*MEMORY[0x1E4FA9660] forPID:getpid() exclusive:0 showsWhenForeground:0];
        playgroundsBackgroundActivityAssertiouint64_t n = self->_playgroundsBackgroundActivityAssertion;
        self->_playgroundsBackgroundActivityAssertiouint64_t n = v14;

        objc_initWeak(&location, self);
        uint64_t v16 = self->_playgroundsBackgroundActivityAssertion;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_198;
        v23[3] = &unk_1E6AF4B10;
        uint64_t v17 = &v24;
        objc_copyWeak(&v24, &location);
        [(SBSBackgroundActivityAssertion *)v16 acquireWithHandler:&__block_literal_global_197 invalidationHandler:v23];
LABEL_20:
        objc_destroyWeak(v17);
        objc_destroyWeak(&location);
        goto LABEL_22;
      }
    }
    else
    {
      [(SBStatusBarStateAggregator *)self _removePlaygroundsBackgroundActivityAssertion];
    }
    goto LABEL_22;
  }
LABEL_23:
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = SBLogStatusBarish();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_cold_1(v2);
    }
  }
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_198(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_2;
  block[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removePlaygroundsBackgroundActivityAssertion];
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = SBLogStatusBarish();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_3_cold_1(v2);
    }
  }
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_202(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_2_203;
  block[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_2_203(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeSatelliteSOSBackgroundActivityAssertion];
}

- (void)_updateStatusBarItemsForSystemStatusDomain:(unint64_t)a3 andData:(id)a4
{
  if (a3 == 14)
  {
    [(SBStatusBarStateAggregator *)self _updateAirplaneMode];
    [(SBStatusBarStateAggregator *)self _updateAirplayItem];
    [(SBStatusBarStateAggregator *)self _updateAlarmItem];
    [(SBStatusBarStateAggregator *)self _updateCarPlayItem];
    [(SBStatusBarStateAggregator *)self _updateDisplayWarningItem];
    [(SBStatusBarStateAggregator *)self _updateRotationLockItem];
    [(SBStatusBarStateAggregator *)self _updateStudentItem];
    [(SBStatusBarStateAggregator *)self _updateTTYItem];
    [(SBStatusBarStateAggregator *)self _updateVPNItem];
    [(SBStatusBarStateAggregator *)self _updateCallToActionItem];
  }
  else
  {
    id v6 = SBLogStatusBarish();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBStatusBarStateAggregator _updateStatusBarItemsForSystemStatusDomain:andData:](a3, v6);
    }
  }
}

- (void)_removePlaygroundsBackgroundActivityAssertion
{
  playgroundsBackgroundActivityAssertiouint64_t n = self->_playgroundsBackgroundActivityAssertion;
  if (playgroundsBackgroundActivityAssertion)
  {
    [(SBSBackgroundActivityAssertion *)playgroundsBackgroundActivityAssertion invalidate];
    uint64_t v4 = self->_playgroundsBackgroundActivityAssertion;
    self->_playgroundsBackgroundActivityAssertiouint64_t n = 0;
  }
}

- (void)_removeSatelliteSOSBackgroundActivityAssertion
{
  satelliteSOSBackgroundActivityAssertiouint64_t n = self->_satelliteSOSBackgroundActivityAssertion;
  if (satelliteSOSBackgroundActivityAssertion)
  {
    [(SBSBackgroundActivityAssertion *)satelliteSOSBackgroundActivityAssertion invalidate];
    uint64_t v4 = self->_satelliteSOSBackgroundActivityAssertion;
    self->_satelliteSOSBackgroundActivityAssertiouint64_t n = 0;
  }
}

- (void)_removeTetheringBackgroundActivityAssertion
{
  tetheringBackgroundActivityAssertiouint64_t n = self->_tetheringBackgroundActivityAssertion;
  if (tetheringBackgroundActivityAssertion)
  {
    [(SBSBackgroundActivityAssertion *)tetheringBackgroundActivityAssertion invalidate];
    uint64_t v4 = self->_tetheringBackgroundActivityAssertion;
    self->_tetheringBackgroundActivityAssertiouint64_t n = 0;
  }
}

- (void)_updateTetheringState
{
  uint64_t v3 = [(SBStatusBarStateAggregator *)self _telephonyManager];
  if ([v3 isNetworkTethering])
  {
    uint64_t v4 = [v3 numberOfNetworkTetheredDevices];
    uint64_t v5 = (void *)SBApp;
    if (v4 == 1)
    {
      id v6 = [NSNumber numberWithInt:1];
      uint64_t v7 = [v5 formattedDecimalStringForNumber:v6];

      id v8 = NSString;
      long long v9 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v10 = v9;
      id v11 = @"INTERNET_TETHERING_SINGLE_HOST";
    }
    else
    {
      id v13 = [NSNumber numberWithInt:v4];
      uint64_t v7 = [v5 formattedDecimalStringForNumber:v13];

      id v8 = NSString;
      long long v9 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v10 = v9;
      id v11 = @"INTERNET_TETHERING_MULTIPLE_HOSTS";
    }
    id v14 = [v9 localizedStringForKey:v11 value:&stru_1F3084718 table:@"SpringBoard"];
    objc_msgSend(v8, "stringWithFormat:", v14, v7);
    int v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!self->_tetheringBackgroundActivityAssertion)
    {
      long long v15 = [MEMORY[0x1E4FA6A18] assertionWithBackgroundActivityIdentifier:*MEMORY[0x1E4FA96B8] forPID:getpid() exclusive:1 showsWhenForeground:1];
      tetheringBackgroundActivityAssertiouint64_t n = self->_tetheringBackgroundActivityAssertion;
      self->_tetheringBackgroundActivityAssertiouint64_t n = v15;

      objc_initWeak(&location, self);
      uint64_t v17 = self->_tetheringBackgroundActivityAssertion;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__SBStatusBarStateAggregator__updateTetheringState__block_invoke_217;
      v18[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v19, &location);
      [(SBSBackgroundActivityAssertion *)v17 acquireWithHandler:&__block_literal_global_216_0 invalidationHandler:v18];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(SBStatusBarStateAggregator *)self _removeTetheringBackgroundActivityAssertion];
    LODWORD(v4) = 0;
    int v12 = &stru_1F3084718;
  }
  [(SBSBackgroundActivityAssertion *)self->_tetheringBackgroundActivityAssertion setStatusString:v12];
  if (self->_data.tetheringConnectionCount != v4)
  {
    self->_data.tetheringConnectionCount = v4;
    [(SBStatusBarStateAggregator *)self _notifyNonItemDataChanged];
  }
}

void __51__SBStatusBarStateAggregator__updateTetheringState__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = SBLogStatusBarish();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Failed to acquire tethering status bar style override", v3, 2u);
    }
  }
}

void __51__SBStatusBarStateAggregator__updateTetheringState__block_invoke_217(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SBStatusBarStateAggregator__updateTetheringState__block_invoke_2;
  block[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __51__SBStatusBarStateAggregator__updateTetheringState__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeTetheringBackgroundActivityAssertion];
}

- (id)_backgroundActivityDescriptorsForCallDescriptors:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v40 = [MEMORY[0x1E4F1CA80] set];
  }
  else
  {
    id v40 = 0;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v39 = *(void *)v42;
    id v6 = (void *)*MEMORY[0x1E4FA9620];
    uint64_t v27 = (void *)*MEMORY[0x1E4FA96A8];
    uint64_t v32 = (void *)*MEMORY[0x1E4FA9698];
    int v35 = (void *)*MEMORY[0x1E4FA96A0];
    id v37 = (void *)*MEMORY[0x1E4FA9618];
    uint64_t v36 = (void *)*MEMORY[0x1E4FA9598];
    int v31 = (void *)*MEMORY[0x1E4FA9628];
    BOOL v30 = (void *)*MEMORY[0x1E4FA96C0];
    char v34 = (void *)*MEMORY[0x1E4FA96C8];
    int v28 = (void *)*MEMORY[0x1E4FA95D8];
    int v29 = (void *)*MEMORY[0x1E4FA95C8];
    char v33 = (void *)*MEMORY[0x1E4FA95D0];
LABEL_6:
    uint64_t v7 = 0;
    while (2)
    {
      if (*(void *)v42 != v39) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v41 + 1) + 8 * v7);
      uint64_t v9 = objc_msgSend(v8, "callState", v27);
      uint64_t v10 = [v8 callState];
      uint64_t v11 = [v8 callState];
      uint64_t v12 = [v8 callState];
      uint64_t v13 = [v8 callState];
      id v14 = v6;
      switch([v8 callType])
      {
        case 0:
          if (v9 == 1)
          {
            long long v15 = v33;
            goto LABEL_35;
          }
          if (v10 == 3)
          {
            long long v15 = v29;
            goto LABEL_35;
          }
          if (v12 == 4)
          {
            long long v15 = v28;
            goto LABEL_35;
          }
          uint64_t v16 = v14;
          uint64_t v18 = @"com.apple.systemstatus.background-activity.CallRecording";
          if (v13 == 6) {
            goto LABEL_36;
          }
          goto LABEL_37;
        case 1:
          if (v9 == 1)
          {
            long long v15 = v34;
          }
          else if (v10 == 3)
          {
            long long v15 = v30;
          }
          else
          {
            long long v15 = v31;
          }
          goto LABEL_35;
        case 2:
          if (v9 == 1)
          {
            long long v15 = v35;
          }
          else
          {
            unint64_t v19 = [v8 copresenceActivityType];
            if (v19 > 5) {
              goto LABEL_37;
            }
            if (v19 == 3) {
              long long v15 = v27;
            }
            else {
              long long v15 = v32;
            }
          }
LABEL_35:
          uint64_t v18 = v15;
          uint64_t v16 = v14;
LABEL_36:

          id v14 = v18;
LABEL_37:
          uint64_t v20 = getpid();
          id v21 = [v8 callProviderAttribution];

          if (v21)
          {
            *(_OWORD *)buf = 0u;
            long long v46 = 0u;
            id v22 = [v8 callProviderAttribution];
            id v23 = v22;
            if (v22)
            {
              [v22 auditToken];
            }
            else
            {
              *(_OWORD *)buf = 0u;
              long long v46 = 0u;
            }

            uint64_t v20 = BSPIDForAuditToken();
          }
          id v24 = [[SBStatusBarBackgroundActivityDescriptor alloc] initWithBackgroundActivityIdentifier:v14 pid:v20];
          [v40 addObject:v24];

          if (v5 != ++v7) {
            continue;
          }
          uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
          if (!v5) {
            goto LABEL_44;
          }
          goto LABEL_6;
        case 3:
          long long v15 = v37;
          if (v11 != 2) {
            long long v15 = v36;
          }
          goto LABEL_35;
        default:
          uint64_t v16 = SBLogStatusBarish();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = [v8 callType];
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v17;
            _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[Call Type] Unhandled enum value: %lu", buf, 0xCu);
          }
          uint64_t v18 = v14;
          goto LABEL_36;
      }
    }
  }
LABEL_44:

  int v25 = (void *)[v40 copy];
  return v25;
}

- (void)_updateCallingBackgroundActivityAssertionsForCallDescriptors:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SBStatusBarStateAggregator *)self _backgroundActivityDescriptorsForCallDescriptors:a3];
  uint64_t v5 = [(NSMutableDictionary *)self->_callingBackgroundActivityAssertionsByDescriptor allKeys];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke;
  v25[3] = &unk_1E6B0D540;
  v25[4] = self;
  id v6 = v4;
  id v26 = v6;
  uint64_t v7 = objc_msgSend(v5, "bs_compactMap:", v25);

  if ([v6 count] && !self->_callingBackgroundActivityAssertionsByDescriptor)
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    id v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    callingBackgroundActivityAssertionsByDescriptor = self->_callingBackgroundActivityAssertionsByDescriptor;
    self->_callingBackgroundActivityAssertionsByDescriptor = v8;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_3;
  v24[3] = &unk_1E6B0D568;
  v24[4] = self;
  unint64_t v19 = v6;
  [v6 enumerateObjectsUsingBlock:v24];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v16 = [(NSMutableDictionary *)self->_callingBackgroundActivityAssertionsByDescriptor objectForKeyedSubscript:v15];
        uint64_t v17 = SBLogStatusBarish();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          int v28 = v16;
          _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "invalidating %{public}@", buf, 0xCu);
        }

        [v16 invalidate];
        [(NSMutableDictionary *)self->_callingBackgroundActivityAssertionsByDescriptor setObject:0 forKeyedSubscript:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v12);
  }

  if (![(NSMutableDictionary *)self->_callingBackgroundActivityAssertionsByDescriptor count])
  {
    uint64_t v18 = self->_callingBackgroundActivityAssertionsByDescriptor;
    self->_callingBackgroundActivityAssertionsByDescriptor = 0;
  }
}

id __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 8776);
  id v4 = a2;
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_2;
  v11[3] = &unk_1E6B0D518;
  id v12 = v5;
  id v7 = v5;
  if (objc_msgSend(v6, "bs_containsObjectPassingTest:", v11)) {
    id v8 = 0;
  }
  else {
    id v8 = v4;
  }
  id v9 = v8;

  return v9;
}

uint64_t __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) pid];
  if (v4 == [v3 pid])
  {
    uint64_t v5 = [*(id *)(a1 + 32) backgroundActivityIdentifiers];
    id v6 = [v3 backgroundActivityIdentifier];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(*(void *)(a1 + 32) + 8776) objectForKeyedSubscript:v3];

  if (!v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FA6A18];
    id v6 = [v3 backgroundActivityIdentifier];
    uint64_t v7 = objc_msgSend(v5, "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:", v6, objc_msgSend(v3, "pid"), 0, 1);

    [*(id *)(*(void *)(a1 + 32) + 8776) setObject:v7 forKeyedSubscript:v3];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_4;
    v17[3] = &unk_1E6AF5860;
    id v18 = v7;
    id v8 = v3;
    uint64_t v9 = *(void *)(a1 + 32);
    id v19 = v8;
    uint64_t v20 = v9;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_226;
    v13[3] = &unk_1E6AF4E00;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 32);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v18;
    id v12 = v18;
    [v12 acquireWithHandler:v17 invalidationHandler:v13];
  }
}

void __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_4(void *a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = SBLogStatusBarish();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "acquired %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_4_cold_1((uint64_t)a1);
    }

    uint64_t v7 = [*(id *)(a1[6] + 8776) objectForKeyedSubscript:a1[5]];
    id v8 = (void *)a1[4];

    if (v7 == v8) {
      [*(id *)(a1[6] + 8776) setObject:0 forKeyedSubscript:a1[5]];
    }
  }
}

void __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_226(void *a1)
{
  id v2 = SBLogStatusBarish();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_226_cold_1((uint64_t)a1);
  }

  id v3 = [*(id *)(a1[5] + 8776) objectForKeyedSubscript:a1[4]];
  int v4 = (void *)a1[6];

  if (v3 == v4) {
    [*(id *)(a1[5] + 8776) setObject:0 forKeyedSubscript:a1[4]];
  }
}

- (void)_updateStatusBarItemsWithRelatedSystemApertureElements
{
}

- (id)_systemApertureElementIdentifiersForStatusBarItem:(int)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    uint64_t v3 = *MEMORY[0x1E4FA7F08];
    v6[0] = *MEMORY[0x1E4FA7F00];
    v6[1] = v3;
    int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (BOOL)_systemApertureElementIsVisibleForStatusBarItem:(int)a3
{
  int v4 = [(SBStatusBarStateAggregator *)self _systemApertureElementIdentifiersForStatusBarItem:*(void *)&a3];
  uint64_t v5 = [(SBStatusBarStateAggregator *)self systemApertureVisibleElementIdentifiers];
  uint64_t v6 = [v5 firstObjectCommonWithArray:v4];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)_invalidateSystemApertureChargingElementAssertionForReason:(id)a3
{
  [(SAInvalidatable *)self->_systemApertureChargingElementAssertion invalidateWithReason:a3];
  systemApertureChargingElementAssertiouint64_t n = self->_systemApertureChargingElementAssertion;
  self->_systemApertureChargingElementAssertiouint64_t n = 0;
}

- (void)_notifyNonItemDataChanged
{
  [(SBStatusBarStateAggregator *)self beginCoalescentBlock];
  self->_nonItemDataChanged = 1;
  [(SBStatusBarStateAggregator *)self endCoalescentBlock];
}

- (void)_requestActions:(int)a3
{
  if ((a3 & ~self->_actions) != 0)
  {
    [(SBStatusBarStateAggregator *)self beginCoalescentBlock];
    self->_actions |= a3;
    [(SBStatusBarStateAggregator *)self endCoalescentBlock];
  }
}

uint64_t __51__SBStatusBarStateAggregator__restartTimeItemTimer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 beginCoalescentBlock];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateTimeItemsWithDate:v4];

  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 endCoalescentBlock];
}

- (void)_resetTimeItemFormatter
{
  id v19 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v3 = [(NSDateFormatter *)self->_timeItemDateFormatter locale];

  if (v19 == v3)
  {
    timeItemDateFormatter = self->_timeItemDateFormatter;
    id v18 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    [(NSDateFormatter *)timeItemDateFormatter setTimeZone:v18];

    [(SBStatusBarStateAggregator *)self _updateOverrideDate];
  }
  else
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v5 = self->_timeItemDateFormatter;
    self->_timeItemDateFormatter = v4;

    [(NSDateFormatter *)self->_timeItemDateFormatter setLocale:v19];
    [(NSDateFormatter *)self->_timeItemDateFormatter setDateStyle:0];
    [(NSDateFormatter *)self->_timeItemDateFormatter setTimeStyle:1];
    uint64_t v6 = [MEMORY[0x1E4F4F708] formatterForDateAsTimeNoAMPMWithLocale:v19];
    shortTimeItemDateFormatter = self->_shortTimeItemDateFormatter;
    self->_shortTimeItemDateFormatter = v6;

    id v8 = (NSDateFormatter *)[(NSDateFormatter *)self->_timeItemDateFormatter copy];
    dateItemDateFormatter = self->_dateItemDateFormatter;
    self->_dateItemDateFormatter = v8;

    [(NSDateFormatter *)self->_dateItemDateFormatter setFormattingContext:2];
    uint64_t v10 = (void *)MEMORY[0x1E4F28C10];
    uint64_t v11 = [MEMORY[0x1E4F28B50] mainBundle];
    id v12 = [v11 localizedStringForKey:@"STATUS_BAR_DATE_FORMAT_STRING" value:&stru_1F3084718 table:@"SpringBoard"];
    uint64_t v13 = [v10 dateFormatFromTemplate:v12 options:0 locale:v19];

    id v14 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v15 = [v14 localizedStringForKey:@"STATUS_BAR_DATE_FORMAT_SEPARATOR_TO_STRIP" value:&stru_1F3084718 table:@"SpringBoard"];

    if ([v15 length])
    {
      uint64_t v16 = [v13 stringByReplacingOccurrencesOfString:v15 withString:&stru_1F3084718];

      uint64_t v13 = (void *)v16;
    }
    [(NSDateFormatter *)self->_dateItemDateFormatter setDateFormat:v13];
  }
  [(SBStatusBarStateAggregator *)self _restartTimeItemTimer];
}

- (void)_updateOverrideDate
{
  if (self->_showsRecordingOverrides)
  {
    id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1168335660.0];
    id v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    double v4 = 1168335660.0 - (double)[v3 secondsFromGMTForDate:v2];

    id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v4];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v5 = [MEMORY[0x1E4FA5EE8] sharedInstance];
  [v5 setOverrideDate:v6];
}

- (BOOL)_shouldShowPersonName
{
  id v3 = [(SBStatusBarStateAggregator *)self _userSessionController];
  double v4 = v3;
  if (self->_overridePersonName)
  {
    BOOL v5 = 1;
  }
  else if ([v3 isMultiUserSupported])
  {
    id v6 = [v4 user];

    int v7 = [v4 isLoginSession] ^ 1;
    if (v6) {
      BOOL v5 = v7;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_noteAirplaneModeChanged
{
  id v3 = [(SBStatusBarStateAggregator *)self _telephonyManager];

  if (v3)
  {
    BOOL v4 = [(SBStatusBarStateAggregator *)self _isInAirplaneMode];
    [(SBStatusBarStateAggregator *)self beginCoalescentBlock];
    [(SBStatusBarStateAggregator *)self _setItem:3 enabled:v4];
    [(SBStatusBarStateAggregator *)self _requestActions:4];
    if (v4)
    {
      [(SBStatusBarStateAggregator *)self _setItem:6 enabled:0];
      [(SBStatusBarStateAggregator *)self _setItem:7 enabled:0];
      unint64_t v5 = self->_airplaneTransitionToken + 1;
      self->_airplaneTransitionTokeuint64_t n = v5;
      self->_suppressCellServiceForAirplaneModeTransitiouint64_t n = 1;
      dispatch_time_t v6 = dispatch_time(0, 5000000000);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __54__SBStatusBarStateAggregator__noteAirplaneModeChanged__block_invoke;
      v7[3] = &unk_1E6AF4A70;
      void v7[4] = self;
      void v7[5] = v5;
      dispatch_after(v6, MEMORY[0x1E4F14428], v7);
    }
    else
    {
      ++self->_airplaneTransitionToken;
      self->_suppressCellServiceForAirplaneModeTransitiouint64_t n = 0;
      [(SBStatusBarStateAggregator *)self updateStatusBarItem:6];
      [(SBStatusBarStateAggregator *)self updateStatusBarItem:7];
    }
    [(SBStatusBarStateAggregator *)self endCoalescentBlock];
  }
}

uint64_t __54__SBStatusBarStateAggregator__noteAirplaneModeChanged__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(result + 40) == *(void *)(v1 + 8688))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 8696) = 0;
    [*(id *)(result + 32) updateStatusBarItem:6];
    id v3 = *(void **)(v2 + 32);
    return [v3 updateStatusBarItem:7];
  }
  return result;
}

- (BOOL)_shouldShowEmergencyOnlyStatusForInfo:(id)a3
{
  return [a3 serviceState] == 3;
}

+ (int)_thermalColorForLevel:(int64_t)a3
{
  if ((unint64_t)(a3 + 2) > 5) {
    return 0;
  }
  else {
    return dword_1D8FD3368[a3 + 2];
  }
}

uint64_t __84__SBStatusBarStateAggregator__temporarilyOverrideLocationItemForProminentIndication__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8763) = 0;
  return [*(id *)(a1 + 32) _updateLocationItem];
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v5 = [a3 userInfo];
  BOOL v4 = [v5 objectForKey:@"SBSystemApertureVisibleElementIdentifiers"];
  [(SBStatusBarStateAggregator *)self setSystemApertureVisibleElementIdentifiers:v4];
  [(SBStatusBarStateAggregator *)self _updateStatusBarItemsWithRelatedSystemApertureElements];
}

- (void)cache:(id)a3 didUpdateActiveAudioRoute:(id)a4
{
}

- (void)cache:(id)a3 didUpdatePickableRoutes:(id)a4
{
}

- (void)_setUserSessionController:(id)a3
{
}

- (SBWindowScene)mainDisplayWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainDisplayWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (SBSystemStatusBatteryDataProvider)batteryDataProvider
{
  return self->_batteryDataProvider;
}

- (SBSystemStatusStatusItemsDataProvider)statusItemsDataProvider
{
  return self->_statusItemsDataProvider;
}

- (STTelephonyStatusDomainDataProvider)telephonyDataProvider
{
  return self->_telephonyDataProvider;
}

- (SBSystemStatusWifiDataProvider)wifiDataProvider
{
  return self->_wifiDataProvider;
}

- (SBSystemStatusStatusBarOverridesArchiver)statusBarOverridesObserver
{
  return self->_statusBarOverridesObserver;
}

- (void)setBatteryDomain:(id)a3
{
}

- (STCallingStatusDomain)callingDomain
{
  return self->_callingDomain;
}

- (void)setCallingDomain:(id)a3
{
}

- (STFocusStatusDomain)focusDomain
{
  return self->_focusDomain;
}

- (void)setFocusDomain:(id)a3
{
}

- (STPlaygroundsStatusDomain)playgroundsDomain
{
  return self->_playgroundsDomain;
}

- (void)setPlaygroundsDomain:(id)a3
{
}

- (STStatusItemsStatusDomain)statusItemsDomain
{
  return self->_statusItemsDomain;
}

- (void)setStatusItemsDomain:(id)a3
{
}

- (STStewieStatusDomain)stewieDomain
{
  return self->_stewieDomain;
}

- (void)setStewieDomain:(id)a3
{
}

- (void)setTelephonyDomain:(id)a3
{
}

- (STVoiceControlStatusDomain)voiceControlDomain
{
  return self->_voiceControlDomain;
}

- (void)setVoiceControlDomain:(id)a3
{
}

- (STWifiStatusDomain)wifiDomain
{
  return self->_wifiDomain;
}

- (void)setWifiDomain:(id)a3
{
}

- (NSArray)systemApertureVisibleElementIdentifiers
{
  return self->_systemApertureVisibleElementIdentifiers;
}

- (void)setSystemApertureVisibleElementIdentifiers:(id)a3
{
}

- (SAInvalidatable)systemApertureChargingElementAssertion
{
  return self->_systemApertureChargingElementAssertion;
}

- (void)setSystemApertureChargingElementAssertion:(id)a3
{
}

- (unint64_t)batteryChargingState
{
  return self->_batteryChargingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemApertureChargingElementAssertion, 0);
  objc_storeStrong((id *)&self->_systemApertureVisibleElementIdentifiers, 0);
  objc_storeStrong((id *)&self->_wifiDomain, 0);
  objc_storeStrong((id *)&self->_voiceControlDomain, 0);
  objc_storeStrong((id *)&self->_telephonyDomain, 0);
  objc_storeStrong((id *)&self->_stewieDomain, 0);
  objc_storeStrong((id *)&self->_statusItemsDomain, 0);
  objc_storeStrong((id *)&self->_playgroundsDomain, 0);
  objc_storeStrong((id *)&self->_focusDomain, 0);
  objc_storeStrong((id *)&self->_callingDomain, 0);
  objc_storeStrong((id *)&self->_batteryDomain, 0);
  objc_storeStrong((id *)&self->_statusBarOverridesObserver, 0);
  objc_storeStrong((id *)&self->_wifiDataProvider, 0);
  objc_storeStrong((id *)&self->_telephonyDataProvider, 0);
  objc_storeStrong((id *)&self->_statusItemsDataProvider, 0);
  objc_storeStrong((id *)&self->_batteryDataProvider, 0);
  objc_destroyWeak((id *)&self->_mainDisplayWindowScene);
  objc_storeStrong((id *)&self->_callToActionIdentifier, 0);
  objc_storeStrong((id *)&self->_overridePersonName, 0);
  objc_storeStrong((id *)&self->_personName, 0);
  objc_storeStrong((id *)&self->_lazy_userSessionController, 0);
  objc_storeStrong((id *)&self->_tetheringBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_satelliteSOSBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_playgroundsBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_mediaBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_callingBackgroundActivityAssertionsByDescriptor, 0);
  objc_storeStrong((id *)&self->_prominentLocationTimer, 0);
  objc_storeStrong((id *)&self->_coreBluetoothManager, 0);
  objc_storeStrong((id *)&self->_connectedLEBluetoothDevices, 0);
  objc_storeStrong((id *)&self->_connectedClassicBluetoothDevices, 0);
  objc_storeStrong((id *)&self->_batteryDetailString, 0);
  objc_storeStrong((id *)&self->_activityDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryServiceBadgeString, 0);
  objc_storeStrong((id *)&self->_serviceBadgeString, 0);
  objc_storeStrong((id *)&self->_secondaryServiceCrossfadeString, 0);
  objc_storeStrong((id *)&self->_secondaryServiceString, 0);
  objc_storeStrong((id *)&self->_serviceCrossfadeString, 0);
  objc_storeStrong((id *)&self->_serviceString, 0);
  objc_storeStrong((id *)&self->_dateItemTimeString, 0);
  objc_storeStrong((id *)&self->_shortTimeItemTimeString, 0);
  objc_storeStrong((id *)&self->_timeItemTimeString, 0);
  objc_storeStrong((id *)&self->_dateItemDateFormatter, 0);
  objc_storeStrong((id *)&self->_shortTimeItemDateFormatter, 0);
  objc_storeStrong((id *)&self->_timeItemDateFormatter, 0);
  objc_storeStrong(&self->_dateTimeProviderToken, 0);
  objc_storeStrong((id *)&self->_dateTimeProvider, 0);
  objc_storeStrong((id *)&self->_postObservers, 0);
  objc_storeStrong((id *)&self->_override_userSessionController, 0);
  objc_storeStrong((id *)&self->_statusBarDefaults, 0);
}

- (void)_updateStatusBarForSystemStatusDomainName:(os_log_t)log data:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "[SBStatusBarStateAggregator] Cannot update status bar for unknown or invalid SystemStatus domain.", v1, 2u);
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Failed to acquire playgrounds status bar style override", v1, 2u);
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Failed to acquire stewie status bar style override", v1, 2u);
}

- (void)_updateStatusBarItemsForSystemStatusDomain:(uint64_t)a1 andData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = STSystemStatusDescriptionForDomain();
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Don't know how to update items for %@", (uint8_t *)&v4, 0xCu);
}

void __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_4_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) backgroundActivityIdentifier];
  uint64_t v2 = STBackgroundActivityIdentifierDescription();
  OUTLINED_FUNCTION_0_23(&dword_1D85BA000, v3, v4, "failed to acquire calling background activity assertion for identifier: %{public}@", v5, v6, v7, v8, 2u);
}

void __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_226_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) backgroundActivityIdentifier];
  uint64_t v2 = STBackgroundActivityIdentifierDescription();
  OUTLINED_FUNCTION_0_23(&dword_1D85BA000, v3, v4, "calling background activity assertion unexpectedly invalidated for identifier: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)updateStatusBarItem:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "*** [SBStatusBarStateAggregator] cannot update unknown status bar item (%i)", (uint8_t *)v2, 8u);
}

@end