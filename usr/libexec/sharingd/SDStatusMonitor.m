@interface SDStatusMonitor
+ (BOOL)b332PairingEnabled;
+ (BOOL)b389ShowLogsInUI;
+ (BOOL)enableAirDropHUDScene;
+ (BOOL)enableOOBPCredentialLogging;
+ (BOOL)enableShareSheetVectorSlots;
+ (BOOL)isBuddyCompleted;
+ (SDStatusMonitor)sharedMonitor;
+ (double)b332BTAddressRotationDelay;
+ (double)b389MultiDiscoveryDebounce;
+ (double)b389MultiDiscoveryInstructionsDelay;
+ (float)airDropProgressUIMaxPercentage;
+ (int64_t)mrQLProgressUpdateFreqMsec;
+ (int64_t)shareSheetMaxSuggestions;
- (BOOL)_isEveryoneModeExpired;
- (BOOL)_multipleUsersLoggedIn;
- (BOOL)airDropPublished;
- (BOOL)airplaneModeEnabled;
- (BOOL)allEnabled;
- (BOOL)altDSIDNeedsFixing;
- (BOOL)alwaysAutoAccept;
- (BOOL)alwaysSendPayload;
- (BOOL)asynchronousProxyLoadingEnabled;
- (BOOL)backlightOn;
- (BOOL)bluetoothEnabled;
- (BOOL)bluetoothEnabledIncludingRestricted;
- (BOOL)bonjourEnabled;
- (BOOL)browseAllInterfaces;
- (BOOL)bypassLTKeyAbort;
- (BOOL)carplayConnected;
- (BOOL)coalesceMe;
- (BOOL)computerToComputer;
- (BOOL)connectedEnabled;
- (BOOL)contactIdentifierIsBlocked:(id)a3;
- (BOOL)contactIsBlocked:(id)a3;
- (BOOL)contactsContainsShortHashes:(id)a3;
- (BOOL)controlCenterVisible;
- (BOOL)currentConsoleUser;
- (BOOL)deviceInBiolockout;
- (BOOL)deviceIsInClassD;
- (BOOL)deviceKeyBagDisabled;
- (BOOL)deviceKeyBagLocked;
- (BOOL)deviceKeyBagLocking;
- (BOOL)deviceKeyBagUnlocked;
- (BOOL)deviceKeyBagUnlockedAndScreenOn;
- (BOOL)deviceRequiresNewRanging;
- (BOOL)deviceSupportsRanging;
- (BOOL)deviceUIUnlocked;
- (BOOL)deviceWasUnlockedOnce;
- (BOOL)disableAutoAccept;
- (BOOL)disableAutoAcceptForPhotosAssetBundles;
- (BOOL)disableCompression;
- (BOOL)disableContinuityTLS;
- (BOOL)disableExtractMediaFromBundles;
- (BOOL)disablePeopleSuggestions;
- (BOOL)disablePictureQuery;
- (BOOL)disablePipelining;
- (BOOL)disableQuarantine;
- (BOOL)disableRotation;
- (BOOL)disableTLS;
- (BOOL)disableTransformingPhotosAssetBundlesToFolders;
- (BOOL)dockHasDownloadsFolder;
- (BOOL)eduModeEnabled;
- (BOOL)enableAirDropAdvertising;
- (BOOL)enableAirDropReceiving;
- (BOOL)enableAllRecents;
- (BOOL)enableBugs;
- (BOOL)enableContinuity;
- (BOOL)enableDVZip;
- (BOOL)enableDebugMode;
- (BOOL)enableDemoMode;
- (BOOL)enableHotspotFallback;
- (BOOL)enablePKZip;
- (BOOL)enablePKZipCompression;
- (BOOL)enableStrangers;
- (BOOL)enableStreamDebugging;
- (BOOL)enableWebloc;
- (BOOL)enableXML;
- (BOOL)familyHotspotEnabled;
- (BOOL)finderAirDropEnabled;
- (BOOL)forceAWDL;
- (BOOL)forceP2P;
- (BOOL)handoffVisible;
- (BOOL)iCloudSharedPhotoLibraryEnabled;
- (BOOL)ignoreIconDiskCache;
- (BOOL)internetSharingEnabled;
- (BOOL)isAirDropAllowed;
- (BOOL)isAirDropReady;
- (BOOL)isCarKitSessionWireless:(id)a3;
- (BOOL)isClarityBoardEnabled;
- (BOOL)isEmail:(id)a3;
- (BOOL)isLocalDeviceMeDevice;
- (BOOL)isMirroringActive;
- (BOOL)isMulticastAdvertisementsDisabled;
- (BOOL)isScreenOnForBacklightState:(int64_t)a3;
- (BOOL)isTourModeEnabled;
- (BOOL)isUsing2GHzWifi;
- (BOOL)isWifiPersonalHotspot;
- (BOOL)lostModeEnabled;
- (BOOL)lowPowerModeEnabled;
- (BOOL)lteConnectionShows4G;
- (BOOL)multipleUsersLoggedIn;
- (BOOL)myAppleIDIsManaged;
- (BOOL)personalHotspotAllowed;
- (BOOL)registerAllInterfaces;
- (BOOL)runningAsSetupUser;
- (BOOL)screenOn;
- (BOOL)screenStateSupportsAirDrop;
- (BOOL)showMeInWormhole;
- (BOOL)showThisComputer;
- (BOOL)signedIntoPrimaryiCloudAccount;
- (BOOL)simStateReady;
- (BOOL)sleepModeOn;
- (BOOL)smartCoverIsClosed;
- (BOOL)smbConfiguration:(__SCPreferences *)a3 netBiosName:(id *)a4 workgroup:(id *)a5;
- (BOOL)supportsFitnessPlusPairing;
- (BOOL)supportsXcodePairing;
- (BOOL)testDiskFull;
- (BOOL)verifyAndParseValidationRecordData:(id)a3 intoDictionary:(id *)a4;
- (BOOL)wifiUserPowerPreference;
- (BOOL)wirelessAccessPoint;
- (BOOL)wirelessCarPlay;
- (BOOL)wirelessCritical;
- (BOOL)wirelessEnabled;
- (CNContact)meCard;
- (NSArray)awdlPeerList;
- (NSArray)myAppleIDEmailAddresses;
- (NSArray)myAppleIDPhoneNumbers;
- (NSData)bluetoothAddress;
- (NSData)myMediumHashes;
- (NSData)myShortHashesForAirDrop;
- (NSDate)lastDarkWakeDate;
- (NSDate)lastDeviceUnlockDate;
- (NSDictionary)awdlInfo;
- (NSDictionary)awdlState;
- (NSDictionary)myAppleIDValidationRecord;
- (NSSet)effectiveBlockedAppBundleIDs;
- (NSString)bonjourName;
- (NSString)computerName;
- (NSString)consoleUser;
- (NSString)description;
- (NSString)deviceInformation;
- (NSString)discoverableMode;
- (NSString)localHostName;
- (NSString)modelCode;
- (NSString)modelName;
- (NSString)myAccountAppleID;
- (NSString)myAltDSID;
- (NSString)myAppleID;
- (NSString)myAppleIDCommonName;
- (NSString)myAppleIDEmailHash;
- (NSString)myAppleIDPhoneHash;
- (NSString)myEmail;
- (NSString)myGivenName;
- (NSString)myName;
- (NSString)myPrimaryEmail;
- (NSString)netbiosName;
- (NSString)nextAirDropID;
- (NSString)someComputerName;
- (NSString)workgroup;
- (SDAirDropServer)finderServer;
- (SDStatusMonitor)init;
- (SFPowerSource)localPowerSource;
- (__SecCertificate)_copyMyAppleIDCertificate;
- (__SecCertificate)_copyMyAppleIDIntermediateCertificate;
- (__SecCertificate)copyCertificateForRealName:(id)a3;
- (__SecCertificate)copyMyAppleIDCertificate;
- (__SecCertificate)copyMyAppleIDIntermediateCertificate;
- (__SecIdentity)_copyMyAppleIDSecIdentity;
- (__SecIdentity)copyMyAppleIDSecIdentity;
- (__WiFiManagerClient)wifiManager;
- (double)_currentEveryoneModeExpiryInterval;
- (double)_everyoneModeExpiryInterval;
- (id)_everyoneModeExpiryDate;
- (id)_myAppleID;
- (id)addAdditionalInformationToMeCard:(id)a3;
- (id)awdlDevice;
- (id)awdlInfoForPeerWithServiceName:(id)a3;
- (id)awdlNetwork;
- (id)awdlStateInfo;
- (id)commonNameForCertificate:(__SecCertificate *)a3;
- (id)contactIdentifierForMediumHashes:(id)a3;
- (id)contactWithContactIdentifier:(id)a3;
- (id)contactWithPreferredIdentifierForContacts:(id)a3;
- (id)contactsForEmailHash:(id)a3 phoneHash:(id)a4;
- (id)contactsWithPhoneNumberOrEmail:(id)a3 keys:(id)a4;
- (id)createHostNameKey:(id)a3;
- (id)defaultDiscoverableMode;
- (id)defaultWiFiDevice;
- (id)emailAddressesForAppleID:(id)a3;
- (id)emailOrPhoneForEmailHash:(id)a3 phoneHash:(id)a4;
- (id)emailsForContact:(id)a3;
- (id)instantMessageEmailsForContact:(id)a3;
- (id)mountPointsForServer:(id)a3;
- (id)newDiscoverableMode;
- (id)odiskMountPointsForServer:(id)a3;
- (id)phoneNumbersForAppleID:(id)a3;
- (id)phoneNumbersForContact:(id)a3;
- (id)reconciledDiscoverableMode;
- (id)serverNameForHost:(id)a3;
- (id)stringForWatchWristState:(int64_t)a3;
- (id)systemMonitor;
- (id)unifiedAppleIDInfo;
- (id)verifiedIdentityForAppleID:(id)a3;
- (id)wifiSSIDForSSIDHash:(id)a3;
- (int)minPersonImageSize;
- (int)pairedWatchLockState;
- (int)sidebarMaxCount;
- (int)workgroupThreshold;
- (int64_t)appleIDAccountState;
- (int64_t)autoHotspotState;
- (int64_t)deviceKeyBagState;
- (int64_t)discoverableLevel;
- (int64_t)familyHotspotStateForAltDSID:(id)a3;
- (int64_t)mediaAccessControlSetting;
- (int64_t)pairedWatchWristState;
- (int64_t)signalStrength;
- (int64_t)watchWristState;
- (unint64_t)ultraWideBandState;
- (unsigned)networkType;
- (unsigned)systemUIFlags;
- (unsigned)wifiPasswordSharingAvailability;
- (void)_cancelCheckForEveryoneModeExpiry;
- (void)_checkEveryoneModeExpiry;
- (void)_expireEveryoneModeAndOnlySetDefault:(BOOL)a3;
- (void)_scheduleCheckForEveryoneModeExpiry;
- (void)_updateEveryoneModeExpiryDateOnChange:(id)a3;
- (void)activate;
- (void)activateSystemMonitor;
- (void)addPreventExitForLocaleReason:(id)a3;
- (void)addServerName:(id)a3 forHostName:(id)a4;
- (void)airDropTransactionBegin:(BOOL)a3;
- (void)airDropTransactionEnd:(BOOL)a3;
- (void)airplaneModeChanged;
- (void)appleIDAccountInfoChanged:(id)a3;
- (void)backlight:(id)a3 activatingWithEvent:(id)a4;
- (void)backlight:(id)a3 deactivatingWithEvent:(id)a4;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6;
- (void)bluetoothActivatedWithError:(id)a3;
- (void)bluetoothAddressChanged;
- (void)bluetoothDidSetPowerStateWithError:(id)a3;
- (void)bluetoothMonitorInvalidated;
- (void)bluetoothStateChanged;
- (void)cacheCertificate:(__SecCertificate *)a3 forRealName:(id)a4;
- (void)cacheIdentity:(id)a3;
- (void)carplayMonitorDiedNotification:(id)a3;
- (void)carplayStatusNotification:(id)a3;
- (void)cellularDataEnabled:(BOOL *)a3 airplaneMode:(BOOL *)a4;
- (void)clearComputerName;
- (void)clearConsoleUser;
- (void)clearLocalHostName;
- (void)clearMonitorCache;
- (void)clearMyAppleIDInfo;
- (void)clearMyIconAndHash;
- (void)clearWirelessState;
- (void)contactStoreDidChange:(id)a3;
- (void)d2dEncryptionAvailableWithCompletionHandler:(id)a3;
- (void)d2dEncryptionChanged;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)fetchDataStatusWithContext:(id)a3;
- (void)fetchLTEShows4GWithContext:(id)a3;
- (void)fetchSIMStatusWithContext:(id)a3;
- (void)fetchSignalStrengthWithContext:(id)a3;
- (void)fetchSubscriptionContextWithCompletion:(id)a3;
- (void)fixAltDSIDIfNeeded;
- (void)forceAWDLDeviceRefresh:(__WiFiDeviceClient *)a3;
- (void)handleAWDLState:(id)a3;
- (void)handleAppleAccountSignIn;
- (void)handleAppleAccountSignOut;
- (void)handleCarKitSessionStateChanged:(id)a3;
- (void)handleDynamicStoreCallback:(__SCDynamicStore *)a3 changedKeys:(__CFArray *)a4;
- (void)handleMISStateChanged:(id)a3;
- (void)handleNameMonitorCallBack:(const char *)a3 flags:(unsigned int)a4 error:(int)a5;
- (void)handleRapportStatusChanged;
- (void)handleSleepWakeCallBack:(unsigned int)a3 messageArguement:(void *)a4;
- (void)handleWiFiPasswordSharingChanged;
- (void)installAirplaneModeMonitor;
- (void)installAppleIDAccountInfoMonitor;
- (void)installAppleIDUsernameMonitor;
- (void)installBacklightMonitor;
- (void)installBacklightServicesMonitor;
- (void)installBluetoothMonitor;
- (void)installBonjourNameMonitor;
- (void)installCarPlayStatusMonitor;
- (void)installContactsMonitor;
- (void)installCoreTelephonyMonitor;
- (void)installD2DEncryptionMonitor;
- (void)installDynamicStoreCallBack;
- (void)installKeyBagUnlockMonitor;
- (void)installLocaleChangeMonitor;
- (void)installMISMonitor;
- (void)installManagedConfigurationMonitor;
- (void)installMirroringMonitor;
- (void)installSSIDCacheMonitor;
- (void)installSleepWakeCallBack;
- (void)installSmartCoverStatusMonitor;
- (void)installSpringBoardStateMonitor;
- (void)installSystemUIMonitor;
- (void)installUILockStatusMonitor;
- (void)installUltraWideBandStateMonitor;
- (void)installWiFiPasswordSharingMonitor;
- (void)installWifiInterfaceMonitor;
- (void)installWirelessCarPlayMonitor;
- (void)installWirelessMonitor;
- (void)logAirDropTransactionForClientServer:(BOOL)a3 beginEnd:(BOOL)a4 count:(int)a5;
- (void)logWiFiPowerState;
- (void)managedConfigurationSettingsChanged:(id)a3;
- (void)meCardChanged:(id)a3;
- (void)postNotification:(id)a3;
- (void)postNotification:(id)a3 userInfo:(id)a4;
- (void)pushDateForPreventExitForLocaleReason:(id)a3 expirationDate:(id)a4;
- (void)reloadSMBConfInfo;
- (void)removePreventExitForLocaleReason:(id)a3;
- (void)removeServerName:(id)a3;
- (void)resetMeCardWithReason:(id)a3;
- (void)restartBonjourNameMonitor;
- (void)retryInstallBluetoothMonitor;
- (void)screenOnStateChangedTo:(BOOL)a3;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setAirDropPublished:(BOOL)a3;
- (void)setAirplaneModeEnabled:(BOOL)a3;
- (void)setBluetoothEnabled:(BOOL)a3;
- (void)setDiscoverableMode:(id)a3;
- (void)setFinderServer:(id)a3;
- (void)setNextAirDropID:(id)a3;
- (void)setODiskMountPoints:(id)a3;
- (void)setServerMountPoints:(id)a3;
- (void)setWirelessEnabled:(BOOL)a3;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)subscriptionInfoDidChange;
- (void)uninstallBonjourNameMonitor;
- (void)uninstallCarPlayStatusMonitor;
- (void)updateAWDLStateInfo;
- (void)updateAirDropAllowed;
- (void)updateAutoHotspotState;
- (void)updateBlacklistedAppBundleIDs;
- (void)updateDataStatus:(id)a3;
- (void)updateDiscoverableMode;
- (void)updateFamilyHotspotState;
- (void)updateLTEShows4G:(BOOL)a3;
- (void)updateLocalPowerSource:(id)a3;
- (void)updateMediaAccessControlSetting:(BOOL)a3;
- (void)updatePairedWatchLockState:(int)a3;
- (void)updatePairedWatchWristState:(int64_t)a3;
- (void)updatePersonalHotspotAllowed;
- (void)updateSIMStatus:(id)a3;
- (void)updateSignalStrength:(id)a3;
- (void)updateWatchWristState:(int64_t)a3;
- (void)updateWifiState:(int64_t)a3;
- (void)updateWirelessCritical:(BOOL)a3;
- (void)updateWirelessDevice;
@end

@implementation SDStatusMonitor

- (BOOL)screenOn
{
  pthread_mutex_lock(&stru_100969508);
  screenOn = self->_screenOn;
  if (!screenOn)
  {
    v4 = [(objc_class *)off_100969560() sharedBacklight];
    id v5 = [v4 backlightState];

    v6 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self isScreenOnForBacklightState:v5]];
    v7 = self->_screenOn;
    self->_screenOn = v6;

    screenOn = self->_screenOn;
  }
  unsigned __int8 v8 = [(NSNumber *)screenOn BOOLValue];
  pthread_mutex_unlock(&stru_100969508);
  return v8;
}

- (BOOL)isClarityBoardEnabled
{
  v2 = +[CLFSystemShellSwitcher sharedSystemShellSwitcher];
  unsigned __int8 v3 = [v2 isClarityBoardEnabled];

  return v3;
}

- (unsigned)systemUIFlags
{
  LODWORD(self) = self->_systemUIFlags;
  pthread_mutex_unlock(&stru_100969508);
  return self;
}

- (BOOL)lowPowerModeEnabled
{
  return 0;
}

- (BOOL)isAirDropAllowed
{
  airDropAllowed = self->_airDropAllowed;
  if (!airDropAllowed)
  {
    v4 = +[MCProfileConnection sharedConnection];
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isAirDropAllowed]);
    id v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_airDropAllowed;
    self->_airDropAllowed = v5;

    airDropAllowed = self->_airDropAllowed;
  }

  return [(NSNumber *)airDropAllowed BOOLValue];
}

- (void)activate
{
  if (!self->_activateStarted)
  {
    self->_activateStarted = 1;
    [(SDStatusMonitor *)self installSleepStateMonitor];
    [(SDStatusMonitor *)self installManagedConfigurationMonitor];
    [(SDStatusMonitor *)self installFinderSidebarPrefsMonitor];
    [(SDStatusMonitor *)self installWirelessCarPlayMonitor];
    [(SDStatusMonitor *)self installSMBPreferencesMonitor];
    [(SDStatusMonitor *)self installCarPlayStatusMonitor];
    [(SDStatusMonitor *)self installDynamicStoreCallBack];
    [(SDStatusMonitor *)self installLocaleChangeMonitor];
    [(SDStatusMonitor *)self installSpringBoardStateMonitor];
    [(SDStatusMonitor *)self installBacklightServicesMonitor];
    [(SDStatusMonitor *)self installSystemUIMonitor];
    [(SDStatusMonitor *)self installMirroringMonitor];
    [(SDStatusMonitor *)self installDisplaySleepMonitor];
    [(SDStatusMonitor *)self installDisplayConfigurationMonitor];
    [(SDStatusMonitor *)self installClamshellStateChangeMonitor];
    [(SDStatusMonitor *)self installSmartCoverStatusMonitor];
    [(SDStatusMonitor *)self installBonjourNameMonitor];
    if (MKBDeviceUnlockedSinceBoot() == 1)
    {
      self->_deviceWasUnlockedOnce = 1;
      unsigned __int8 v3 = daemon_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device has already been unlocked", v4, 2u);
      }

      [(SDStatusMonitor *)self installContactsMonitor];
    }
    [(SDStatusMonitor *)self installKeyBagUnlockMonitor];
    [(SDStatusMonitor *)self installUserPictureMonitor];
    [(SDStatusMonitor *)self installUILockStatusMonitor];
    [(SDStatusMonitor *)self installSleepWakeCallBack];
    [(SDStatusMonitor *)self installBluetoothMonitor];
    [(SDStatusMonitor *)self installD2DEncryptionMonitor];
    [(SDStatusMonitor *)self installWirelessMonitor];
    [(SDStatusMonitor *)self installAppleIDAccountInfoMonitor];
    [(SDStatusMonitor *)self installAppleIDUsernameMonitor];
    [(SDStatusMonitor *)self installVolumesMonitor];
    [(SDStatusMonitor *)self installBacklightMonitor];
    [(SDStatusMonitor *)self installSleepNotification];
    [(SDStatusMonitor *)self installWiFiPasswordSharingMonitor];
    [(SDStatusMonitor *)self installWifiInterfaceMonitor];
    [(SDStatusMonitor *)self installSSIDCacheMonitor];
    [(SDStatusMonitor *)self installWristStateMonitor];
    [(SDStatusMonitor *)self installMISMonitor];
    [(SDStatusMonitor *)self installCoreTelephonyMonitor];
    [(SDStatusMonitor *)self installAirplaneModeMonitor];
    [(SDStatusMonitor *)self installUltraWideBandStateMonitor];
    [(SDStatusMonitor *)self installAirPlayPreferencesMonitor];
    [(SDStatusMonitor *)self installLowPowerModeMonitor];
    [(SDStatusMonitor *)self installSystemStateInterfaces];
    self->_multipleUsersLoggedIn = [(SDStatusMonitor *)self _multipleUsersLoggedIn];
    [(SDStatusMonitor *)self activateSystemMonitor];
  }
}

+ (SDStatusMonitor)sharedMonitor
{
  if (qword_1009803A8 != -1) {
    dispatch_once(&qword_1009803A8, &stru_1008D0878);
  }
  [(id)qword_1009803B0 activate];
  v2 = (void *)qword_1009803B0;

  return (SDStatusMonitor *)v2;
}

- (SDStatusMonitor)init
{
  v33.receiver = self;
  v33.super_class = (Class)SDStatusMonitor;
  v2 = [(SDStatusMonitor *)&v33 init];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    myAppleID = v2->_myAppleID;
    v2->_myAppleID = 0;

    myAppleIDCommonName = v3->_myAppleIDCommonName;
    v3->_myAppleIDCommonName = 0;

    workgroup = v3->_workgroup;
    v3->_workgroup = 0;

    localHostName = v3->_localHostName;
    v3->_localHostName = 0;

    consoleUser = v3->_consoleUser;
    v3->_consoleUser = 0;

    computerName = v3->_computerName;
    v3->_computerName = 0;

    bonjourName = v3->_bonjourName;
    v3->_bonjourName = 0;

    netbiosName = v3->_netbiosName;
    v3->_netbiosName = 0;

    myEmailHashes = v3->_myEmailHashes;
    v3->_myEmailHashes = 0;

    myPhoneHashes = v3->_myPhoneHashes;
    v3->_myPhoneHashes = 0;

    serverNames = v3->_serverNames;
    v3->_serverNames = 0;

    identities = v3->_identities;
    v3->_identities = 0;

    mountPoints = v3->_mountPoints;
    v3->_mountPoints = 0;

    deviceUIUnlocked = v3->_deviceUIUnlocked;
    v3->_deviceUIUnlocked = 0;

    deviceKeyBagState = v3->_deviceKeyBagState;
    v3->_deviceKeyBagState = 0;

    currentDiscoverableMode = v3->_currentDiscoverableMode;
    v3->_currentDiscoverableMode = 0;

    deviceSupportsWAPI = v3->_deviceSupportsWAPI;
    v3->_deviceSupportsWAPI = 0;

    deviceInformation = v3->_deviceInformation;
    v3->_deviceInformation = 0;

    awdlState = v3->_awdlState;
    v3->_awdlState = 0;

    preventLocaleRestart = v3->_preventLocaleRestart;
    v3->_preventLocaleRestart = 0;

    screenOn = v3->_screenOn;
    v3->_screenOn = 0;

    systemMonitor = v3->__systemMonitor;
    v3->__systemMonitor = 0;

    backlightOn = v3->_backlightOn;
    v3->_backlightOn = 0;

    objc_storeWeak((id *)&v3->_finderServer, 0);
    handoffVisible = v3->_handoffVisible;
    v3->_handoffVisible = 0;

    odisksMountPoints = v3->_odisksMountPoints;
    v3->_odisksMountPoints = 0;

    v3->_dynamicStoreSource = 0;
    v3->_smbPreferences = 0;
    v3->_notifyPortRef = 0;
    v3->_nameMonitor = 0;
    v3->_rootPort = 0;
    v3->_myAppleIDCertificate = 0;
    v3->_myAppleIDSecIdentity = 0;
    v3->_myAppleIDIntermediateCertificate = 0;
    v3->_wifiDevice = 0;
    v3->_wifiManager = 0;
    v3->_awdlDevice = 0;
    *(_WORD *)&v3->_wifiDeviceAttachmentRegistered = 0;
    *(void *)&v3->_airDropCount = 0xFFFFFFFF00000000;
    v3->_airPlayPrefsToken = -1;
    v3->_notifierObject = 0;
    v3->_consoleUserID = -1;
    v3->_uiLockStatusToken = 0;
    v3->_keyBagUnlockToken = 0;
    v3->_backlightLevelToken = 0;
    v3->_airDropPublished = 0;
    v3->_deviceIsHighPriority = 0;
    v3->_deviceWasUnlockedOnce = 0;
    v3->_finderAirDropEnabled = 0;
    v3->_screenBlankedToken = -1;
    v3->_pairedWatchWristState = 0;
    radiosPreferences = v3->_radiosPreferences;
    v3->_radiosPreferences = 0;

    CFStringRef v34 = @"ExtendedDeviceLockState";
    v35 = &__kCFBooleanTrue;
    uint64_t v30 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    mkbOptions = v3->_mkbOptions;
    v3->_mkbOptions = (NSDictionary *)v30;

    v3->_sleepModeOn = 0;
    v3->_mediaAccessControlSetting = 0;
  }
  return v3;
}

- (id)systemMonitor
{
  systemMonitor = self->__systemMonitor;
  if (!systemMonitor)
  {
    v4 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    id v5 = self->__systemMonitor;
    self->__systemMonitor = v4;

    [(CUSystemMonitor *)self->__systemMonitor setDispatchQueue:&_dispatch_main_q];
    systemMonitor = self->__systemMonitor;
  }

  return systemMonitor;
}

- (void)activateSystemMonitor
{
  id v2 = [(SDStatusMonitor *)self systemMonitor];
  [v2 activateWithCompletion:0];
}

- (void)clearMonitorCache
{
  unsigned __int8 v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "clearMonitorCache", v16, 2u);
  }

  bonjourName = self->_bonjourName;
  self->_bonjourName = 0;

  computerName = self->_computerName;
  self->_computerName = 0;

  consoleUser = self->_consoleUser;
  self->_consoleUser = 0;

  localHostName = self->_localHostName;
  self->_localHostName = 0;

  netbiosName = self->_netbiosName;
  self->_netbiosName = 0;

  screenOn = self->_screenOn;
  self->_screenOn = 0;

  backlightOn = self->_backlightOn;
  self->_backlightOn = 0;

  workgroup = self->_workgroup;
  self->_workgroup = 0;

  myAppleIDCertificate = self->_myAppleIDCertificate;
  if (myAppleIDCertificate)
  {
    CFRelease(myAppleIDCertificate);
    self->_myAppleIDCertificate = 0;
  }
  myAppleIDIntermediateCertificate = self->_myAppleIDIntermediateCertificate;
  if (myAppleIDIntermediateCertificate)
  {
    CFRelease(myAppleIDIntermediateCertificate);
    self->_myAppleIDIntermediateCertificate = 0;
  }
  myAppleIDSecIdentity = self->_myAppleIDSecIdentity;
  if (myAppleIDSecIdentity)
  {
    CFRelease(myAppleIDSecIdentity);
    self->_myAppleIDSecIdentity = 0;
  }
  v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDStatusMonitor clearMonitorCache]");
  [(SDStatusMonitor *)self resetMeCardWithReason:v15];
}

- (NSString)description
{
  NSAppendPrintF();
  id v16 = 0;
  currentDiscoverableMode = self->_currentDiscoverableMode;
  NSAppendPrintF();
  id v3 = v16;

  if ([(SDStatusMonitor *)self isAirDropAvailable]) {
    v4 = "yes";
  }
  else {
    v4 = "no";
  }
  v13 = v4;
  NSAppendPrintF();
  id v5 = v3;

  if ([(SDStatusMonitor *)self isAirDropAllowed]) {
    v6 = "yes";
  }
  else {
    v6 = "no";
  }
  v14 = v6;
  NSAppendPrintF();
  id v7 = v5;

  if ([(SDStatusMonitor *)self enableAirDropAdvertising]) {
    unsigned __int8 v8 = "yes";
  }
  else {
    unsigned __int8 v8 = "no";
  }
  v15 = v8;
  NSAppendPrintF();
  id v9 = v7;

  [(SDStatusMonitor *)self enableAirDropReceiving];
  NSAppendPrintF();
  id v10 = v9;

  return (NSString *)v10;
}

- (void)addServerName:(id)a3 forHostName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  pthread_mutex_lock(&stru_100969508);
  if (!self->_serverNames)
  {
    id v7 = (NSMutableDictionary *)objc_opt_new();
    serverNames = self->_serverNames;
    self->_serverNames = v7;
  }
  id v9 = [(SDStatusMonitor *)self createHostNameKey:v6];
  if (v9) {
    [(NSMutableDictionary *)self->_serverNames setValue:v10 forKey:v9];
  }
  pthread_mutex_unlock(&stru_100969508);
}

- (void)airDropTransactionBegin:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&stru_100969508);
  [(SDStatusMonitor *)self logAirDropTransactionForClientServer:v3 beginEnd:1 count:self->_airDropCount];

  pthread_mutex_unlock(&stru_100969508);
}

- (void)airDropTransactionEnd:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&stru_100969508);
  --self->_airDropCount;
  -[SDStatusMonitor logAirDropTransactionForClientServer:beginEnd:count:](self, "logAirDropTransactionForClientServer:beginEnd:count:", v3, 0);

  pthread_mutex_unlock(&stru_100969508);
}

- (id)createHostNameKey:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 length];
  id v5 = [v3 lowercaseString];

  id v6 = [v5 mutableCopy];
  if ([v6 hasSuffix:@"."]) {
    [v6 deleteCharactersInRange:v4 - 1, 1];
  }

  return v6;
}

- (id)defaultDiscoverableMode
{
  id v2 = kSFOperationDiscoverableModeContactsOnly;

  return v2;
}

- (int64_t)discoverableLevel
{
  id v2 = [(SDStatusMonitor *)self discoverableMode];
  if (CFEqual(v2, kSFOperationDiscoverableModeEveryone)) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = CFEqual(v2, kSFOperationDiscoverableModeContactsOnly) != 0;
  }

  return v3;
}

- (NSString)discoverableMode
{
  currentDiscoverableMode = self->_currentDiscoverableMode;
  if (!currentDiscoverableMode)
  {
    [(SDStatusMonitor *)self updateDiscoverableMode];
    currentDiscoverableMode = self->_currentDiscoverableMode;
  }
  v4 = currentDiscoverableMode;

  return v4;
}

- (BOOL)isAirDropReady
{
  unsigned int v3 = [(SDStatusMonitor *)self wirelessEnabled];
  unsigned int v4 = [(SDStatusMonitor *)self wirelessCarPlay];
  unsigned int v5 = [(SDStatusMonitor *)self bluetoothEnabledIncludingRestricted];
  unsigned int v6 = [(SDStatusMonitor *)self enableAirDropReceiving];
  int IsVirtualMachine = SFDeviceIsVirtualMachine();
  unsigned int v8 = [(SDStatusMonitor *)self isClarityBoardEnabled];
  unsigned int v9 = [(SDStatusMonitor *)self isMulticastAdvertisementsDisabled];
  int v10 = v6 & v5 & v3 ^ 1 | v4 | v8 | v9;
  if (v10 == 1)
  {
    unsigned int v11 = v9;
    v12 = airdrop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67110400;
      v14[1] = v3;
      __int16 v15 = 1024;
      unsigned int v16 = v5;
      __int16 v17 = 1024;
      unsigned int v18 = v4;
      __int16 v19 = 1024;
      unsigned int v20 = v6;
      __int16 v21 = 1024;
      int v22 = IsVirtualMachine;
      __int16 v23 = 1024;
      unsigned int v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AirDrop not ready: wifi=%d, bluetooth=%d, carplay=%d, receivingEnabled=%d, isVirtualMachine=%d isMulticastAdvertisementsDisabled=%d", (uint8_t *)v14, 0x26u);
    }
  }
  return v10 ^ 1;
}

- (id)mountPointsForServer:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100969508);
  unsigned int v5 = [(NSDictionary *)self->_mountPoints objectForKeyedSubscript:v4];

  id v6 = [v5 copy];
  pthread_mutex_unlock(&stru_100969508);

  return v6;
}

- (id)newDiscoverableMode
{
  if ([(SDStatusMonitor *)self isAirDropAllowed])
  {
    if ([(SDStatusMonitor *)self isAirDropReady])
    {
      unsigned int v3 = [(SDStatusMonitor *)self reconciledDiscoverableMode];
      if (![v3 isEqual:kSFOperationDiscoverableModeContactsOnly]) {
        return v3;
      }
      unint64_t v4 = [(SDStatusMonitor *)self appleIDAccountState];
      unsigned int v5 = [(SDStatusMonitor *)self eduModeEnabled];
      unsigned int v6 = v5;
      if (v4 == 1 && !v5) {
        return v3;
      }
      int v10 = airdrop_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if (v4 > 0xE) {
          CFStringRef v11 = @"?";
        }
        else {
          CFStringRef v11 = (const __CFString *)*((void *)&off_1008D0B80 + v4);
        }
        int v13 = 138412546;
        CFStringRef v14 = v11;
        __int16 v15 = 1024;
        unsigned int v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Discoverable mode off: appleIDAccountState=%@ eduModeEnabled=%d", (uint8_t *)&v13, 0x12u);
      }

      id v12 = kSFOperationDiscoverableModeOff;
      return v12;
    }
    unsigned int v8 = (void **)&kSFOperationDiscoverableModeOff;
  }
  else
  {
    unsigned int v8 = (void **)&kSFOperationDiscoverableModeDisabled;
  }
  unsigned int v9 = *v8;

  return v9;
}

- (id)odiskMountPointsForServer:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100969508);
  unsigned int v5 = [(NSDictionary *)self->_odisksMountPoints objectForKeyedSubscript:v4];

  id v6 = [v5 copy];
  pthread_mutex_unlock(&stru_100969508);

  return v6;
}

- (id)reconciledDiscoverableMode
{
  unsigned int v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = [v3 objectForKey:kSFOperationDiscoverableModeKey];
  if (v4)
  {
    unsigned int v5 = (void *)v4;
    CFStringRef v6 = @"User Defaults";
  }
  else
  {
    unsigned int v5 = [(SDStatusMonitor *)self defaultDiscoverableMode];
    CFStringRef v6 = @"Default";
  }
  id v7 = airdrop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    int v10 = v5;
    __int16 v11 = 2112;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Reconciled discoverable mode: %@ (%@)", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (void)removeServerName:(id)a3
{
  id v5 = a3;
  pthread_mutex_lock(&stru_100969508);
  if (self->_serverNames)
  {
    uint64_t v4 = [(SDStatusMonitor *)self createHostNameKey:v5];
    if (v4) {
      [(NSMutableDictionary *)self->_serverNames removeObjectForKey:v4];
    }
  }
  pthread_mutex_unlock(&stru_100969508);
}

- (id)serverNameForHost:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100969508);
  if (self->_serverNames)
  {
    id v5 = [(SDStatusMonitor *)self createHostNameKey:v4];
    if (v5)
    {
      CFStringRef v6 = [(NSMutableDictionary *)self->_serverNames objectForKeyedSubscript:v5];
    }
    else
    {
      CFStringRef v6 = 0;
    }
  }
  else
  {
    CFStringRef v6 = 0;
  }
  pthread_mutex_unlock(&stru_100969508);

  return v6;
}

- (void)setODiskMountPoints:(id)a3
{
  id v5 = a3;
  pthread_mutex_lock(&stru_100969508);
  if (sub_1000D9194(self->_odisksMountPoints, v5))
  {
    objc_storeStrong((id *)&self->_odisksMountPoints, a3);
    pthread_mutex_unlock(&stru_100969508);
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.ODiskMountPointsChanged"];
  }
  else
  {
    pthread_mutex_unlock(&stru_100969508);
  }
}

- (void)setDiscoverableMode:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100969508);
  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setObject:v4 forKey:kSFOperationDiscoverableModeKey];

  [v5 synchronize];
  pthread_mutex_unlock(&stru_100969508);
  [(SDStatusMonitor *)self updateDiscoverableMode];
}

- (void)setServerMountPoints:(id)a3
{
  id v5 = a3;
  pthread_mutex_lock(&stru_100969508);
  if (sub_1000D9194(self->_mountPoints, v5))
  {
    objc_storeStrong((id *)&self->_mountPoints, a3);
    pthread_mutex_unlock(&stru_100969508);
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.MountPointsChanged"];
  }
  else
  {
    pthread_mutex_unlock(&stru_100969508);
  }
}

- (void)updateDiscoverableMode
{
  [(SDStatusMonitor *)self _checkEveryoneModeExpiry];
  id v3 = [(SDStatusMonitor *)self newDiscoverableMode];
  pthread_mutex_lock(&stru_100969508);
  id v4 = self->_currentDiscoverableMode;
  unsigned __int8 v5 = [v3 isEqual:v4];
  objc_storeStrong((id *)&self->_currentDiscoverableMode, v3);
  pthread_mutex_unlock(&stru_100969508);
  if ((v5 & 1) == 0 && v4) {
    [(SDStatusMonitor *)self _updateEveryoneModeExpiryDateOnChange:v3];
  }
  if ((v5 & 1) == 0)
  {
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.DiscoverableModeChanged"];
    if (self->_airDropModeNotifyToken != -1)
    {
      if ([v3 isEqual:kSFOperationDiscoverableModeOff])
      {
        uint64_t v6 = 1;
      }
      else if ([v3 isEqual:kSFOperationDiscoverableModeContactsOnly])
      {
        uint64_t v6 = 2;
      }
      else if ([v3 isEqual:kSFOperationDiscoverableModeEveryone])
      {
        uint64_t v6 = 3;
      }
      else
      {
        uint64_t v6 = [v3 isEqual:kSFOperationDiscoverableModeDisabled];
      }
      notify_set_state(self->_airDropModeNotifyToken, v6);
      notify_post("com.apple.sharing.airdrop-mode-changed");
    }
    id v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      int v9 = v4;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Discoverable mode changed from %@ to %@, posting notification", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (int64_t)appleIDAccountState
{
  id v3 = [(SDStatusMonitor *)self myAppleID];

  if (v3)
  {
    id v4 = +[SDAppleIDAgent sharedAgent];
    unsigned __int8 v5 = [(SDStatusMonitor *)self myAppleID];
    uint64_t v6 = [v4 accountStatusForAppleID:v5];

    id v7 = [v6 objectForKeyedSubscript:@"AccountState"];
    unint64_t v8 = CFGetInt64();
  }
  else
  {
    unint64_t v8 = 13;
  }
  int v9 = airdrop_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v8 > 0xE) {
      CFStringRef v10 = @"?";
    }
    else {
      CFStringRef v10 = (const __CFString *)*((void *)&off_1008D0B80 + v8);
    }
    int v12 = 138412290;
    CFStringRef v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Apple ID account state: %@", (uint8_t *)&v12, 0xCu);
  }

  return v8;
}

- (BOOL)verifyAndParseValidationRecordData:(id)a3 intoDictionary:(id *)a4
{
  id v5 = a3;
  mach_absolute_time();
  uint64_t v6 = SFAppleIDParseValidationRecordDataSync();

  if (v6)
  {
    id v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      mach_absolute_time();
      int v9 = 134217984;
      uint64_t v10 = UpTicksToMilliseconds();
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Verified validation record data (%ld ms)\n", (uint8_t *)&v9, 0xCu);
    }

    if (a4) {
      *a4 = v6;
    }
  }

  return v6 != 0;
}

- (void)cacheCertificate:(__SecCertificate *)a3 forRealName:(id)a4
{
  id v9 = a4;
  pthread_mutex_lock(&stru_100969508);
  if (!self->_certificates)
  {
    uint64_t v6 = (NSMutableDictionary *)objc_opt_new();
    certificates = self->_certificates;
    self->_certificates = v6;
  }
  unint64_t v8 = [v9 lowercaseString];
  if (v8) {
    [(NSMutableDictionary *)self->_certificates setValue:a3 forKey:v8];
  }
  pthread_mutex_unlock(&stru_100969508);
}

- (void)cacheIdentity:(id)a3
{
  id v8 = a3;
  pthread_mutex_lock(&stru_100969508);
  if (!self->_identities)
  {
    id v4 = (NSMutableDictionary *)objc_opt_new();
    identities = self->_identities;
    self->_identities = v4;
  }
  uint64_t v6 = [v8 emailOrPhone];
  id v7 = [v6 lowercaseString];

  if (v7) {
    [(NSMutableDictionary *)self->_identities setValue:v8 forKey:v7];
  }
  pthread_mutex_unlock(&stru_100969508);
}

- (void)clearMyAppleIDInfo
{
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clear my Apple ID called", v12, 2u);
  }

  pthread_mutex_lock(&stru_100969508);
  myAppleID = self->_myAppleID;
  self->_myAppleID = 0;

  myAppleIDCommonName = self->_myAppleIDCommonName;
  self->_myAppleIDCommonName = 0;

  myEmailHashes = self->_myEmailHashes;
  self->_myEmailHashes = 0;

  myPhoneHashes = self->_myPhoneHashes;
  self->_myPhoneHashes = 0;

  myAppleIDCertificate = self->_myAppleIDCertificate;
  if (myAppleIDCertificate)
  {
    CFRelease(myAppleIDCertificate);
    self->_myAppleIDCertificate = 0;
  }
  myAppleIDIntermediateCertificate = self->_myAppleIDIntermediateCertificate;
  if (myAppleIDIntermediateCertificate)
  {
    CFRelease(myAppleIDIntermediateCertificate);
    self->_myAppleIDIntermediateCertificate = 0;
  }
  myAppleIDSecIdentity = self->_myAppleIDSecIdentity;
  if (myAppleIDSecIdentity)
  {
    CFRelease(myAppleIDSecIdentity);
    self->_myAppleIDSecIdentity = 0;
  }
  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDStatusMonitor clearMyAppleIDInfo]");
  [(SDStatusMonitor *)self resetMeCardWithReason:v11];

  pthread_mutex_unlock(&stru_100969508);
}

- (id)commonNameForCertificate:(__SecCertificate *)a3
{
  CFArrayRef v3 = (const __CFArray *)SecCertificateCopyCommonNames();
  if (v3)
  {
    CFArrayRef v4 = v3;
    if (CFArrayGetCount(v3))
    {
      id v5 = CFArrayGetValueAtIndex(v4, 0);
    }
    else
    {
      id v7 = daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001F4C2C();
      }

      id v5 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v6 = daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001F4BF8();
    }

    id v5 = 0;
  }

  return v5;
}

- (__SecCertificate)copyCertificateForRealName:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100969508);
  id v5 = [v4 lowercaseString];

  id v6 = [(NSMutableDictionary *)self->_certificates objectForKeyedSubscript:v5];

  pthread_mutex_unlock(&stru_100969508);
  return (__SecCertificate *)v6;
}

- (__SecCertificate)copyMyAppleIDCertificate
{
  pthread_mutex_lock(&stru_100969508);
  CFArrayRef v3 = [(SDStatusMonitor *)self _copyMyAppleIDCertificate];
  pthread_mutex_unlock(&stru_100969508);
  return v3;
}

- (__SecCertificate)_copyMyAppleIDCertificate
{
  if (!self->_myAppleIDCertificate)
  {
    CFArrayRef v3 = +[SDAppleIDAgent sharedAgent];
    id v4 = [v3 myAccount];

    if (v4)
    {
      id v5 = [v4 identity];
      self->_myAppleIDCertificate = (__SecCertificate *)[v5 copyCertificate];
    }
  }
  result = self->_myAppleIDIntermediateCertificate;
  if (result)
  {
    CFRetain(result);
    return self->_myAppleIDIntermediateCertificate;
  }
  return result;
}

- (__SecCertificate)copyMyAppleIDIntermediateCertificate
{
  return [(SDStatusMonitor *)self _copyMyAppleIDIntermediateCertificate];
}

- (__SecCertificate)_copyMyAppleIDIntermediateCertificate
{
  pthread_mutex_lock(&stru_100969508);
  myAppleIDIntermediateCertificate = self->_myAppleIDIntermediateCertificate;
  pthread_mutex_unlock(&stru_100969508);
  if (!myAppleIDIntermediateCertificate)
  {
    id v4 = +[SDAppleIDAgent sharedAgent];
    id v5 = [v4 myAccount];

    if (v5)
    {
      id v6 = [v5 identity];
      id v7 = (__SecCertificate *)[v6 copyIntermediateCertificate];

      pthread_mutex_lock(&stru_100969508);
      self->_myAppleIDIntermediateCertificate = v7;
      pthread_mutex_unlock(&stru_100969508);
    }
  }
  pthread_mutex_lock(&stru_100969508);
  id v8 = self->_myAppleIDIntermediateCertificate;
  if (v8)
  {
    CFRetain(v8);
    id v9 = self->_myAppleIDIntermediateCertificate;
  }
  else
  {
    id v9 = 0;
  }
  pthread_mutex_unlock(&stru_100969508);
  return v9;
}

- (__SecIdentity)copyMyAppleIDSecIdentity
{
  pthread_mutex_lock(&stru_100969508);
  CFArrayRef v3 = [(SDStatusMonitor *)self _copyMyAppleIDSecIdentity];
  pthread_mutex_unlock(&stru_100969508);
  return v3;
}

- (__SecIdentity)_copyMyAppleIDSecIdentity
{
  result = self->_myAppleIDSecIdentity;
  if (result) {
    goto LABEL_5;
  }
  id v4 = [(SDStatusMonitor *)self _myAppleID];
  if (v4)
  {
    id v5 = +[SDAppleIDAgent sharedAgent];
    self->_myAppleIDSecIdentity = (__SecIdentity *)[v5 copyIdentityForAppleID:v4];
  }
  result = self->_myAppleIDSecIdentity;
  if (result)
  {
LABEL_5:
    CFRetain(result);
    return self->_myAppleIDSecIdentity;
  }
  return result;
}

- (id)emailAddressesForAppleID:(id)a3
{
  id v3 = a3;
  id v4 = +[SDAppleIDAgent sharedAgent];
  id v5 = [v4 accountForAppleID:v3];

  id v6 = [v5 contactInfo];
  id v7 = [v6 validatedEmailAddresses];

  return v7;
}

- (void)fixAltDSIDIfNeeded
{
  if ([(SDStatusMonitor *)self altDSIDNeedsFixing])
  {
    id v3 = objc_alloc_init((Class)ACAccountStore);
    id v4 = sub_1001B22F4(v3);
    if (v4)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1001E68CC;
      v7[3] = &unk_1008D08A0;
      id v8 = v3;
      id v9 = v4;
      uint64_t v10 = self;
      [v8 aa_updatePropertiesForAppleAccount:v9 completion:v7];

      id v5 = v8;
    }
    else
    {
      id v5 = tethering_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No primary account, not fixing appleID", v6, 2u);
      }
    }
  }
}

- (void)handleAppleAccountSignIn
{
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Apple Account signed in", v4, 2u);
  }

  [(SDStatusMonitor *)self clearMyAppleIDInfo];
  [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.AppleAccountSignIn"];
}

- (void)handleAppleAccountSignOut
{
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Apple Account signed out", v4, 2u);
  }

  [(SDStatusMonitor *)self clearMyAppleIDInfo];
  [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.AppleAccountSignOut"];
}

- (id)phoneNumbersForAppleID:(id)a3
{
  id v3 = a3;
  id v4 = +[SDAppleIDAgent sharedAgent];
  id v5 = [v4 accountForAppleID:v3];

  id v6 = [v5 contactInfo];
  id v7 = [v6 validatedPhoneNumbers];

  return v7;
}

- (id)unifiedAppleIDInfo
{
  id v3 = [(SDStatusMonitor *)self copyMyAppleIDSecIdentity];
  if (v3)
  {
    id v4 = v3;
    id v5 = [(SDStatusMonitor *)self myAppleIDEmailAddresses];
    uint64_t v30 = [(SDStatusMonitor *)self myAppleIDPhoneNumbers];
    if (-[NSObject count](v5, "count") || [v30 count])
    {
      id v6 = objc_opt_new();
      id v7 = objc_opt_new();
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v37;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v37 != v11) {
              objc_enumerationMutation(v8);
            }
            CFStringRef v13 = sub_1001B3C88(*(void **)(*((void *)&v36 + 1) + 8 * i), 1);
            if (([v6 containsObject:v13] & 1) == 0) {
              [v6 addObject:v13];
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v10);
      }

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = v30;
      id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v33;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(v14);
            }
            __int16 v19 = sub_1001B3D7C(*(void **)(*((void *)&v32 + 1) + 8 * (void)j));
            if (v19 && ([v7 containsObject:v19] & 1) == 0) {
              [v7 addObject:v19];
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v16);
      }

      unint64_t v20 = (unint64_t)[v6 count];
      unint64_t v21 = (unint64_t)[v7 count];
      if (v20 | v21)
      {
        unint64_t v22 = v21;
        __int16 v23 = objc_opt_new();
        if (v20 <= v22) {
          unint64_t v24 = v22;
        }
        else {
          unint64_t v24 = v20;
        }
        if (v24)
        {
          for (unint64_t k = 0; k != v24; ++k)
          {
            if (k < v20)
            {
              v26 = [v6 objectAtIndexedSubscript:k];
              [v23 addObject:v26];
            }
            if (k < v22)
            {
              v27 = [v7 objectAtIndexedSubscript:k];
              [v23 addObject:v27];
            }
          }
        }
      }
      else
      {
        v28 = daemon_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No normalized emails or phone numbers", buf, 2u);
        }

        __int16 v23 = 0;
      }
    }
    else
    {
      id v6 = daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No emails or phone numbers", buf, 2u);
      }
      __int16 v23 = 0;
    }

    CFRelease(v4);
  }
  else
  {
    id v5 = daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No Apple ID certificate", buf, 2u);
    }
    __int16 v23 = 0;
  }

  return v23;
}

- (id)verifiedIdentityForAppleID:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100969508);
  id v5 = [v4 lowercaseString];

  id v6 = [(NSMutableDictionary *)self->_identities objectForKeyedSubscript:v5];
  pthread_mutex_unlock(&stru_100969508);

  return v6;
}

- (id)awdlDevice
{
  awdlDevice = self->_awdlDevice;
  if (!awdlDevice)
  {
    [(SDStatusMonitor *)self updateWirelessDevice];
    awdlDevice = self->_awdlDevice;
  }

  return awdlDevice;
}

- (id)awdlInfoForPeerWithServiceName:(id)a3
{
  id v4 = a3;
  [(SDStatusMonitor *)self awdlPeerList];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          int v12 = [v11 objectForKeyedSubscript:@"STATION_AWDL_SERVICES"];
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v13 = v12;
          id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v20;
            while (2)
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v20 != v16) {
                  objc_enumerationMutation(v13);
                }
                if ([*(id *)(*((void *)&v19 + 1) + 8 * (void)j) containsString:v4])
                {

                  goto LABEL_21;
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      id v11 = 0;
    }
    while (v7);
  }
  else
  {
    id v11 = 0;
  }
LABEL_21:

  return v11;
}

- (id)awdlNetwork
{
  id v16 = 0;
  if (self->_wifiDevice && !WiFiDeviceClientCopyHostedNetworks())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v16;
    id v4 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v9 = WiFiNetworkGetProperty();
          id v10 = v9;
          if (v9 && objc_msgSend(v9, "intValue", (void)v12) == 4)
          {
            id v2 = v8;

            goto LABEL_15;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    id v2 = 0;
LABEL_15:
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (NSDictionary)awdlState
{
  pthread_mutex_lock(&stru_100969508);
  id v3 = [(NSDictionary *)self->_awdlState copy];
  pthread_mutex_unlock(&stru_100969508);

  return (NSDictionary *)v3;
}

- (id)addAdditionalInformationToMeCard:(id)a3
{
  id v4 = [a3 mutableCopy];
  id v5 = [(SDStatusMonitor *)self _myAppleID];
  if (v5)
  {
    uint64_t v6 = +[SDAppleIDAgent sharedAgent];
    id v7 = [v6 accountForAppleID:v5];

    if (v7)
    {
      uint64_t v8 = [v4 givenName];
      id v9 = [v8 length];

      if (!v9)
      {
        id v10 = [v7 contactInfo];
        id v11 = [v10 firstName];
        [v4 setGivenName:v11];
      }
      v50 = v5;
      long long v12 = [v4 familyName];
      id v13 = [v12 length];

      if (!v13)
      {
        long long v14 = [v7 contactInfo];
        long long v15 = [v14 lastName];
        [v4 setFamilyName:v15];
      }
      v52 = v4;
      id v16 = [v4 phoneNumbers];
      uint64_t v17 = +[NSMutableArray arrayWithArray:v16];

      v51 = v7;
      unsigned int v18 = [v7 contactInfo];
      long long v19 = [v18 validatedPhoneNumbers];

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v20 = v19;
      id v21 = [v20 countByEnumeratingWithState:&v57 objects:v70 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v58;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v58 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v57 + 1) + 8 * i);
            id v26 = objc_alloc((Class)CNLabeledValue);
            v27 = +[CNPhoneNumber phoneNumberWithStringValue:v25];
            id v28 = [v26 initWithLabel:&stru_1008E7020 value:v27];

            [v17 addObject:v28];
          }
          id v22 = [v20 countByEnumeratingWithState:&v57 objects:v70 count:16];
        }
        while (v22);
      }

      [v52 setPhoneNumbers:v17];
      v29 = [v52 emailAddresses];
      uint64_t v30 = +[NSMutableArray arrayWithArray:v29];

      v31 = [v7 contactInfo];
      long long v32 = [v31 validatedEmailAddresses];

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v33 = v32;
      id v34 = [v33 countByEnumeratingWithState:&v53 objects:v69 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v54;
        do
        {
          for (j = 0; j != v35; j = (char *)j + 1)
          {
            if (*(void *)v54 != v36) {
              objc_enumerationMutation(v33);
            }
            id v38 = [objc_alloc((Class)CNLabeledValue) initWithLabel:&stru_1008E7020 value:*(void *)(*((void *)&v53 + 1) + 8 * (void)j)];
            [v30 addObject:v38];
          }
          id v35 = [v33 countByEnumeratingWithState:&v53 objects:v69 count:16];
        }
        while (v35);
      }

      id v4 = v52;
      [v52 setEmailAddresses:v30];
      long long v39 = daemon_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = [v52 givenName];
        v41 = [v52 familyName];
        v42 = [v20 componentsJoinedByString:@","];
        v43 = [v33 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138413059;
        v62 = v40;
        __int16 v63 = 2112;
        v64 = v41;
        __int16 v65 = 2113;
        v66 = v42;
        __int16 v67 = 2113;
        v68 = v43;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Enhanced meCard: fn=%@,ln=%@,pnums=[%{private}@],emails=[%{private}@]", buf, 0x2Au);

        id v4 = v52;
      }

      id v44 = v4;
      id v5 = v50;
      id v7 = v51;
    }
    else
    {
      v47 = daemon_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_1001F4D80((uint64_t)v5, v47);
      }

      id v48 = v4;
    }
  }
  else
  {
    v45 = daemon_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_1001F4D4C();
    }

    id v46 = v4;
  }

  return v4;
}

- (void)clearMyIconAndHash
{
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clear my icon and hash requested", v5, 2u);
  }

  pthread_mutex_lock(&stru_100969508);
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDStatusMonitor clearMyIconAndHash]");
  [(SDStatusMonitor *)self resetMeCardWithReason:v4];

  pthread_mutex_unlock(&stru_100969508);
}

- (id)contactsForEmailHash:(id)a3 phoneHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  if (v6)
  {
    id v9 = [(SDAirDropContactHashManager *)self->_contactHashManager contactsForCombinedHash:v6];
    [v8 unionSet:v9];
  }
  if (v7)
  {
    id v10 = [(SDAirDropContactHashManager *)self->_contactHashManager contactsForCombinedHash:v7];
    [v8 unionSet:v10];
  }
  id v11 = +[NSSet setWithSet:v8];

  return v11;
}

- (id)contactIdentifierForMediumHashes:(id)a3
{
  return [(SDAirDropContactHashManager *)self->_contactHashManager contactIdentifierForMediumHashes:a3];
}

- (BOOL)contactIdentifierIsBlocked:(id)a3
{
  v11[0] = CNContactPhoneNumbersKey;
  v11[1] = CNContactEmailAddressesKey;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:v11 count:2];
  contactStore = self->_contactStore;
  uint64_t v10 = 0;
  id v7 = [(CNContactStore *)contactStore unifiedContactWithIdentifier:v4 keysToFetch:v5 error:&v10];

  if (v7) {
    BOOL v8 = [(SDStatusMonitor *)self contactIsBlocked:v7];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)contactIsBlocked:(id)a3
{
  id v3 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = [v3 emailAddresses];
  id v5 = [v4 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v10 = [(objc_class *)off_100969548() sharedPrivacyManager];
        id v11 = [v9 value];
        unsigned int v12 = [v10 isIncomingCommunicationBlockedForEmailAddress:v11];

        if (v12)
        {
          id v13 = airdrop_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            long long v24 = [v9 value];
            *(_DWORD *)buf = 141558275;
            uint64_t v40 = 1752392040;
            __int16 v41 = 2113;
            v42 = v24;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Incoming communications blocked for email address %{private, mask.hash}@", buf, 0x16u);
          }
LABEL_23:

          LOBYTE(v13) = 1;
          goto LABEL_24;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = [v3 phoneNumbers];
  id v13 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v13)
  {
    id v28 = v3;
    uint64_t v29 = *(void *)v31;
    while (2)
    {
      for (j = 0; j != v13; j = ((char *)j + 1))
      {
        if (*(void *)v31 != v29) {
          objc_enumerationMutation(v4);
        }
        long long v15 = v4;
        id v16 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
        uint64_t v17 = [(objc_class *)off_100969548() sharedPrivacyManager];
        Class v18 = off_100969550();
        long long v19 = [v16 value];
        id v20 = [v19 stringValue];
        id v21 = off_100969770();
        id v22 = [(objc_class *)v18 phoneNumberWithDigits:v20 countryCode:v21];
        unsigned int v23 = [v17 isIncomingCommunicationBlockedForPhoneNumber:v22];

        if (v23)
        {
          id v13 = airdrop_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = [v16 value];
            id v26 = [v25 stringValue];
            *(_DWORD *)buf = 141558275;
            uint64_t v40 = 1752392040;
            __int16 v41 = 2113;
            v42 = v26;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Incoming communications blocked for phone number %{private, mask.hash}@", buf, 0x16u);
          }
          id v3 = v28;
          id v4 = v15;
          goto LABEL_23;
        }
        id v4 = v15;
      }
      id v13 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    id v3 = v28;
  }
LABEL_24:

  return (char)v13;
}

- (BOOL)contactsContainsShortHashes:(id)a3
{
  return [(SDAirDropContactHashManager *)self->_contactHashManager contactsContainsShortHashes:a3];
}

- (id)contactWithPreferredIdentifierForContacts:(id)a3
{
  id v4 = a3;
  id v5 = [v4 anyObject];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    id obj = v6;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unsigned int v12 = [(SDStatusMonitor *)self meCard];
        id v13 = [v12 identifier];
        long long v14 = [v11 identifier];
        unsigned __int8 v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          id v20 = [(SDStatusMonitor *)self meCard];
          id v6 = obj;

          goto LABEL_13;
        }
        id v16 = [v5 identifier];
        uint64_t v17 = [v11 identifier];
        id v18 = [v16 compare:v17];

        if (v18 == (id)1)
        {
          id v19 = v11;

          id v5 = v19;
        }
      }
      id v6 = obj;
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v5 = v5;
  id v20 = v5;
LABEL_13:

  return v20;
}

- (BOOL)isEmail:(id)a3
{
  return [a3 containsString:@"@"];
}

- (id)contactsWithPhoneNumberOrEmail:(id)a3 keys:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(SDStatusMonitor *)self isEmail:v7])
  {
    id v8 = +[CNContact predicateForContactsMatchingEmailAddress:v7];
  }
  else
  {
    uint64_t v9 = +[CNPhoneNumber phoneNumberWithStringValue:v7];

    id v8 = +[CNContact predicateForContactsMatchingPhoneNumber:v9];
    id v7 = (id)v9;
  }

  uint64_t v10 = [(CNContactStore *)self->_contactStore unifiedContactsMatchingPredicate:v8 keysToFetch:v6 error:0];

  id v11 = +[NSSet setWithArray:v10];

  return v11;
}

- (id)contactWithContactIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SDStatusMonitor *)self meCard];
  id v6 = [v5 identifier];
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    id v8 = [(SDStatusMonitor *)self meCard];
  }
  else
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    long long v24 = sub_1001E852C;
    long long v25 = sub_1001E853C;
    id v26 = 0;
    id v9 = objc_alloc((Class)CNContactFetchRequest);
    uint64_t v10 = +[SDAirDropContactHashManager GeneralContactKeysToFetch];
    id v11 = [v9 initWithKeysToFetch:v10];

    id v27 = v4;
    unsigned int v12 = +[NSArray arrayWithObjects:&v27 count:1];
    id v13 = +[CNContact predicateForContactsWithIdentifiers:v12];
    [v11 setPredicate:v13];

    contactStore = self->_contactStore;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001E8544;
    v19[3] = &unk_1008D08C8;
    v19[4] = &v21;
    id v20 = 0;
    unsigned __int8 v15 = [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v11 error:&v20 usingBlock:v19];
    id v16 = v20;
    if ((v15 & 1) == 0)
    {
      uint64_t v17 = airdrop_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1001F4E0C();
      }
    }
    id v8 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }

  return v8;
}

- (id)emailsForContact:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v3 emailAddresses];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) value];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)emailOrPhoneForEmailHash:(id)a3 phoneHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    id v9 = [(SDAirDropContactHashManager *)self->_contactHashManager emailOrPhoneForCombinedHash:v6];
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    id v9 = 0;
    if (!v7) {
      goto LABEL_7;
    }
  }
  if (!v9)
  {
    id v9 = [(SDAirDropContactHashManager *)self->_contactHashManager emailOrPhoneForCombinedHash:v8];
  }
LABEL_7:

  return v9;
}

- (id)instantMessageEmailsForContact:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v3 instantMessageAddresses];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) value];
        id v11 = [v10 username];
        [v11 rangeOfString:@"@"];
        if (v12) {
          [v4 addObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (CNContact)meCard
{
  meCard = self->___meCard;
  if (!meCard)
  {
    contactStore = self->_contactStore;
    id v5 = +[SDAirDropContactHashManager GeneralContactKeysToFetch];
    id v17 = 0;
    id v6 = [(CNContactStore *)contactStore _crossPlatformUnifiedMeContactWithKeysToFetch:v5 error:&v17];
    id v7 = v17;

    uint64_t v8 = +[NSNull null];
    unsigned __int8 v9 = [v6 isEqual:v8];

    if ((v9 & 1) != 0 || !v6)
    {
      uint64_t v10 = airdrop_log();
      id v11 = v10;
      if (v7)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1001F4EF0();
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        sub_1001F4EBC();
      }

      uint64_t v12 = objc_opt_new();
      id v6 = (void *)v12;
    }
    long long v13 = airdrop_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1001F4E88();
    }

    long long v14 = [(SDStatusMonitor *)self addAdditionalInformationToMeCard:v6];
    long long v15 = self->___meCard;
    self->___meCard = v14;

    [(SDAirDropContactHashManager *)self->_contactHashManager setMeCard:self->___meCard];
    meCard = self->___meCard;
  }

  return meCard;
}

- (void)resetMeCardWithReason:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001E8AD8;
  v5[3] = &unk_1008CA640;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (id)phoneNumbersForContact:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v3 phoneNumbers];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) value];
        id v11 = [v10 stringValue];
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (int64_t)autoHotspotState
{
  personalHotspotAutoState = self->_personalHotspotAutoState;
  if (!personalHotspotAutoState)
  {
    unsigned int AutoInstantHotspotMode = WiFiManagerClientGetAutoInstantHotspotMode();
    if (AutoInstantHotspotMode <= 2) {
      uint64_t v5 = AutoInstantHotspotMode;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = +[NSNumber numberWithUnsignedInt:v5];
    id v7 = self->_personalHotspotAutoState;
    self->_personalHotspotAutoState = v6;

    personalHotspotAutoState = self->_personalHotspotAutoState;
  }

  return [(NSNumber *)personalHotspotAutoState integerValue];
}

- (void)updateAutoHotspotState
{
  unint64_t v3 = [(NSNumber *)self->_personalHotspotAutoState integerValue];
  unsigned int AutoInstantHotspotMode = WiFiManagerClientGetAutoInstantHotspotMode();
  if (AutoInstantHotspotMode <= 2) {
    uint64_t v5 = AutoInstantHotspotMode;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = +[NSNumber numberWithUnsignedInt:v5];
  personalHotspotAutoState = self->_personalHotspotAutoState;
  self->_personalHotspotAutoState = v6;

  if (v3 != [(NSNumber *)self->_personalHotspotAutoState integerValue])
  {
    uint64_t v8 = daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v3 > 2) {
        unsigned __int8 v9 = "?";
      }
      else {
        unsigned __int8 v9 = off_1008D0BF8[v3];
      }
      unint64_t v10 = [(NSNumber *)self->_personalHotspotAutoState integerValue];
      if (v10 > 2) {
        id v11 = "?";
      }
      else {
        id v11 = off_1008D0BF8[v10];
      }
      int v12 = 136315394;
      long long v13 = v9;
      __int16 v14 = 2080;
      long long v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Auto Hotspot state changed %s -> %s", (uint8_t *)&v12, 0x16u);
    }

    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.HotspotAutoStateChanged"];
  }
}

- (void)cellularDataEnabled:(BOOL *)a3 airplaneMode:(BOOL *)a4
{
  if (_CTServerConnectionGetCellularDataSettings())
  {
    id v6 = daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001F4F58();
    }
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
}

- (BOOL)lteConnectionShows4G
{
  LOBYTE(self) = self->_coreTelephonyLTEShows4G;
  pthread_mutex_unlock(&stru_100969508);
  return (char)self;
}

- (int64_t)familyHotspotStateForAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_personalHotspotFamilyStates)
  {
    [(SDStatusMonitor *)self updateFamilyHotspotState];
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    int64_t v7 = -1;
    goto LABEL_6;
  }
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  id v6 = [(NSMutableDictionary *)self->_personalHotspotFamilyStates objectForKeyedSubscript:v5];
  int64_t v7 = (int64_t)[v6 integerValue];

LABEL_6:
  return v7;
}

- (void)updateFamilyHotspotState
{
  personalHotspotFamilyStates = self->_personalHotspotFamilyStates;
  if (!personalHotspotFamilyStates)
  {
    id v4 = (NSMutableDictionary *)objc_opt_new();
    uint64_t v5 = self->_personalHotspotFamilyStates;
    self->_personalHotspotFamilyStates = v4;
  }
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v6 = [objc_alloc((Class)NSMutableString) initWithString:@"Family Hotspot State: "];
  int64_t v7 = (void *)WiFiManagerClientCopyFamilyHotspotPreferences();
  unsigned int v8 = [v7 count];
  unsigned __int8 v9 = daemon_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v34) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Family hotspot entries: %d", buf, 8u);
  }

  if (!v8) {
    *((unsigned char *)v26 + 24) = 1;
  }
  long long v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1001E92FC;
  id v18 = &unk_1008D08F0;
  BOOL v24 = personalHotspotFamilyStates == 0;
  id v10 = v6;
  id v19 = v10;
  id v11 = v7;
  id v20 = v11;
  uint64_t v21 = self;
  id v22 = &v29;
  uint64_t v23 = &v25;
  [v11 enumerateObjectsUsingBlock:&v15];
  BOOL personalHotspotFamilyEnabled = self->_personalHotspotFamilyEnabled;
  self->_BOOL personalHotspotFamilyEnabled = *((unsigned char *)v26 + 24) ^ 1;
  if (!personalHotspotFamilyStates)
  {
    long long v13 = daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)v26 + 24)) {
        CFStringRef v14 = @"Disabled";
      }
      else {
        CFStringRef v14 = &stru_1008E7020;
      }
      *(_DWORD *)buf = 138412546;
      id v34 = v10;
      __int16 v35 = 2112;
      CFStringRef v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@%@", buf, 0x16u);
    }
  }
  if (*((unsigned char *)v30 + 24) || personalHotspotFamilyEnabled != self->_personalHotspotFamilyEnabled) {
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.HotspotFamilyStateChanged", v15, v16, v17, v18, v19];
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

- (BOOL)familyHotspotEnabled
{
  if (!self->_personalHotspotFamilyStates) {
    [(SDStatusMonitor *)self updateFamilyHotspotState];
  }
  return self->_personalHotspotFamilyEnabled;
}

- (unsigned)networkType
{
  pthread_mutex_lock(&stru_100969508);
  unsigned int v3 = [(CTDataStatus *)self->_coreTelephonyDataStatus indicator];
  unsigned int v4 = [(CTDataStatus *)self->_coreTelephonyDataStatus indicatorOverride];
  unsigned int v5 = [(CTDataStatus *)self->_coreTelephonyDataStatus radioTechnology];
  pthread_mutex_unlock(&stru_100969508);
  unsigned __int8 v6 = 0;
  switch(v3)
  {
    case 1u:
      if (v5 - 3 < 3) {
        unsigned __int8 v6 = 1;
      }
      else {
        unsigned __int8 v6 = 2;
      }
      break;
    case 2u:
      unsigned __int8 v6 = 3;
      break;
    case 3u:
    case 4u:
    case 5u:
      if (v4 == 7) {
        unsigned __int8 v6 = 6;
      }
      else {
        unsigned __int8 v6 = 4;
      }
      break;
    case 7u:
      if ([(SDStatusMonitor *)self lteConnectionShows4G]) {
        unsigned __int8 v6 = 6;
      }
      else {
        unsigned __int8 v6 = 7;
      }
      break;
    case 8u:
      unsigned __int8 v6 = 8;
      break;
    default:
      return v6;
  }
  return v6;
}

- (BOOL)personalHotspotAllowed
{
  personalHotspotAllowed = self->_personalHotspotAllowed;
  if (!personalHotspotAllowed)
  {
    unsigned int v4 = +[MCProfileConnection sharedConnection];
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isPersonalHotspotModificationAllowed]);
    unsigned int v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v6 = self->_personalHotspotAllowed;
    self->_personalHotspotAllowed = v5;

    personalHotspotAllowed = self->_personalHotspotAllowed;
  }

  return [(NSNumber *)personalHotspotAllowed BOOLValue];
}

- (void)updatePersonalHotspotAllowed
{
  unsigned int v3 = [(NSNumber *)self->_personalHotspotAllowed BOOLValue];
  unsigned int v4 = +[MCProfileConnection sharedConnection];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isPersonalHotspotModificationAllowed]);
  unsigned int v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  personalHotspotAllowed = self->_personalHotspotAllowed;
  self->_personalHotspotAllowed = v5;

  if (v3 != [(NSNumber *)self->_personalHotspotAllowed BOOLValue])
  {
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.PersonalHotspotAllowedChanged"];
  }
}

- (int64_t)signalStrength
{
  if (![(SDStatusMonitor *)self networkType]) {
    return 0;
  }
  pthread_mutex_lock(&stru_100969508);
  int64_t v3 = [(NSNumber *)self->_coreTelephonySignalStrength integerValue];
  pthread_mutex_unlock(&stru_100969508);
  return v3;
}

- (BOOL)simStateReady
{
  LOBYTE(self) = [(NSString *)self->_coreTelephonySIMStatus isEqualToString:kCTSIMSupportSIMStatusReady];
  pthread_mutex_unlock(&stru_100969508);
  return (char)self;
}

- (void)addPreventExitForLocaleReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self;
  objc_sync_enter(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E9968;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  unsigned __int8 v9 = v5;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_sync_exit(v5);
}

- (void)pushDateForPreventExitForLocaleReason:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = self;
    objc_sync_enter(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001E9AF8;
    block[3] = &unk_1008CAF18;
    id v10 = v6;
    id v11 = v8;
    id v12 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_sync_exit(v8);
  }
}

- (void)removePreventExitForLocaleReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self;
  objc_sync_enter(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E9C64;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  unsigned __int8 v9 = v5;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_sync_exit(v5);
}

- (void)postNotification:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:v6 object:0 userInfo:v5];
}

- (void)postNotification:(id)a3
{
}

- (BOOL)_multipleUsersLoggedIn
{
  return 0;
}

- (__WiFiManagerClient)wifiManager
{
  return self->_wifiManager;
}

- (id)defaultWiFiDevice
{
  wifiDevice = self->_wifiDevice;
  if (!wifiDevice)
  {
    [(SDStatusMonitor *)self updateWirelessDevice];
    wifiDevice = self->_wifiDevice;
  }

  return wifiDevice;
}

- (unsigned)wifiPasswordSharingAvailability
{
  int64_t v3 = [(SDStatusMonitor *)self copyMyAppleIDSecIdentity];
  if (v3)
  {
    CFRelease(v3);
    int v4 = 0;
  }
  else
  {
    int v4 = 4;
  }
  id v5 = +[MCProfileConnection sharedConnection];
  unsigned int v6 = [v5 isPasswordProximityAutoFillRequestingAllowed];

  if (v6) {
    int v7 = v4;
  }
  else {
    int v7 = v4 | 0x40;
  }
  if ([(SDStatusMonitor *)self bluetoothEnabled]) {
    int v8 = v7;
  }
  else {
    int v8 = v7 | 2;
  }
  unsigned __int8 v9 = [(SDStatusMonitor *)self myAppleID];

  if (v9) {
    unsigned int v10 = v8;
  }
  else {
    unsigned int v10 = v8 | 0x20;
  }
  uint64_t v11 = [(SDStatusMonitor *)self myAppleIDValidationRecord];
  if (!v11) {
    goto LABEL_15;
  }
  id v12 = (void *)v11;
  long long v13 = [(SDStatusMonitor *)self myAppleIDValidationRecord];
  CFStringRef v14 = [v13 objectForKeyedSubscript:@"AppleIDAccountValidationRecordData"];

  if (!v14) {
LABEL_15:
  }
    v10 |= 8u;
  long long v15 = daemon_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109120;
    v17[1] = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PWS availability: %ud\n", (uint8_t *)v17, 8u);
  }

  return v10;
}

- (id)wifiSSIDForSSIDHash:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100969508);
  ssidHashes = self->_ssidHashes;
  if (!ssidHashes)
  {
    unsigned int v6 = daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Generating SSID hashes", (uint8_t *)&v28, 2u);
    }

    int v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    int v8 = self->_ssidHashes;
    self->_ssidHashes = v7;

    if (self->_wifiManager)
    {
      CFArrayRef v9 = (const __CFArray *)WiFiManagerClientCopyNetworks();
      if (v9)
      {
        CFArrayRef v10 = v9;
        CFIndex Count = CFArrayGetCount(v9);
        if (Count >= 1)
        {
          CFIndex v12 = Count;
          for (CFIndex i = 0; i != v12; ++i)
          {
            CFArrayGetValueAtIndex(v10, i);
            if (WiFiNetworkGetShareMode() == 3)
            {
              WiFiNetworkGetSSID();
              id v14 = objc_claimAutoreleasedReturnValue();
              long long v15 = (const char *)[v14 UTF8String];
              if (v15)
              {
                uint64_t v16 = v15;
                long long v28 = 0u;
                long long v29 = 0u;
                CC_LONG v17 = strlen(v15);
                CC_SHA256(v16, v17, (unsigned __int8 *)&v28);
                id v18 = [objc_alloc((Class)NSData) initWithBytes:&v28 length:3];
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_ssidHashes, "setObject:forKeyedSubscript:", v14, v18, v28, v29);
              }
            }
          }
        }
        CFRelease(v10);
      }
    }
    id v19 = +[SDHotspotAgent sharedAgent];
    if ([v19 isTetheringInUse])
    {
      id v20 = [v19 hotspotName];
      uint64_t v21 = (const char *)[v20 UTF8String];
      id v22 = daemon_log();
      uint64_t v23 = v22;
      if (v21)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v28) = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Tethering active, adding to ssid cache.", (uint8_t *)&v28, 2u);
        }

        long long v28 = 0u;
        long long v29 = 0u;
        CC_LONG v24 = strlen(v21);
        CC_SHA256(v21, v24, (unsigned __int8 *)&v28);
        id v25 = [objc_alloc((Class)NSData) initWithBytes:&v28 length:3];
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_ssidHashes, "setObject:forKeyedSubscript:", v20, v25, v28, v29);
      }
      else
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_1001F4FD4();
        }
      }
    }

    ssidHashes = self->_ssidHashes;
  }
  id v26 = [(NSMutableDictionary *)ssidHashes objectForKeyedSubscript:v4];
  pthread_mutex_unlock(&stru_100969508);

  return v26;
}

- (BOOL)airDropPublished
{
  return self->_airDropPublished;
}

- (void)setAirDropPublished:(BOOL)a3
{
  self->_airDropPublished = a3;
  if (a3) {
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.AirDropPublished"];
  }
}

- (NSString)nextAirDropID
{
  return self->_nextAirDropID;
}

- (void)setNextAirDropID:(id)a3
{
}

- (BOOL)bluetoothEnabledIncludingRestricted
{
  if (SFDeviceIsVirtualMachine()) {
    return 1;
  }
  bluetoothController = self->_bluetoothController;
  if (bluetoothController)
  {
    if ([(CBController *)bluetoothController bluetoothState] == (id)5) {
      return 1;
    }
    return [(CBController *)self->_bluetoothController bluetoothState] == (id)10;
  }
  else
  {
    return _SFIsBluetoothEnabled();
  }
}

- (BOOL)bluetoothEnabled
{
  if (SFDeviceIsVirtualMachine()) {
    return 1;
  }
  bluetoothController = self->_bluetoothController;
  if (bluetoothController) {
    return [(CBController *)bluetoothController bluetoothState] == (id)5;
  }

  return _SFIsBluetoothEnabled();
}

- (void)setBluetoothEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&stru_100969508);
  if (v3) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 4;
  }
  id location = 0;
  objc_initWeak(&location, self);
  bluetoothController = self->_bluetoothController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001EA450;
  v7[3] = &unk_1008CE8C0;
  objc_copyWeak(&v8, &location);
  [(CBController *)bluetoothController setPowerState:v5 completion:v7];
  pthread_mutex_unlock(&stru_100969508);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (SDAirDropServer)finderServer
{
  pthread_mutex_lock(&stru_100969508);
  id to = 0;
  objc_copyWeak(&to, (id *)&self->_finderServer);
  pthread_mutex_unlock(&stru_100969508);
  id v3 = objc_loadWeakRetained(&to);
  objc_destroyWeak(&to);

  return (SDAirDropServer *)v3;
}

- (void)setFinderServer:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100969508);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_finderServer);

  objc_storeWeak((id *)&self->_finderServer, v4);
  pthread_mutex_unlock(&stru_100969508);
  if (WeakRetained != v4)
  {
    [(SDStatusMonitor *)self updateDiscoverableMode];
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.FinderAirDropChanged"];
  }
}

- (BOOL)wirelessEnabled
{
  LOBYTE(self) = self->_wirelessEnabled;
  pthread_mutex_unlock(&stru_100969508);
  return (char)self;
}

- (void)setWirelessEnabled:(BOOL)a3
{
  pthread_mutex_lock(&stru_100969508);
  if (self->_wifiManager)
  {
    WiFiManagerClientSetPower();
  }
  else
  {
    id v4 = daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1001F5008();
    }
  }
  pthread_mutex_unlock(&stru_100969508);
}

- (BOOL)airplaneModeEnabled
{
  return [(RadiosPreferences *)self->_radiosPreferences airplaneMode];
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&stru_100969508);
  [(RadiosPreferences *)self->_radiosPreferences setAirplaneMode:v3];

  pthread_mutex_unlock(&stru_100969508);
}

- (BOOL)isMulticastAdvertisementsDisabled
{
  return sub_1000D9060(@"NoMulticastAdvertisements", 0) != 0;
}

+ (float)airDropProgressUIMaxPercentage
{
  return (float)(int)sub_1001B3E88(@"AirDropProgressUIMaxPercentage", 40) / 100.0;
}

- (NSDictionary)awdlInfo
{
  BOOL v3 = [(SDStatusMonitor *)self awdlState];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SDStatusMonitor *)self awdlStateInfo];
  }
  unsigned int v6 = v5;

  int v7 = [v6 objectForKeyedSubscript:@"AWDL_INFO"];

  return (NSDictionary *)v7;
}

- (NSArray)awdlPeerList
{
  BOOL v3 = [(SDStatusMonitor *)self awdlState];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SDStatusMonitor *)self awdlStateInfo];
  }
  unsigned int v6 = v5;

  int v7 = [v6 objectForKeyedSubscript:@"LINK_CHANGED_PEER_LIST"];

  return (NSArray *)v7;
}

- (id)awdlStateInfo
{
  id v2 = [(SDStatusMonitor *)self awdlDevice];

  if (v2)
  {
    if (WiFiDeviceClientCopyInterfaceStateInfo())
    {
      BOOL v3 = daemon_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_1001F50A4();
      }
    }
    else
    {
      BOOL v3 = daemon_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_1001F5070();
      }
    }
  }
  else
  {
    BOOL v3 = daemon_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1001F503C();
    }
  }

  return 0;
}

- (NSData)bluetoothAddress
{
  id v2 = [(SDStatusMonitor *)self systemMonitor];
  BOOL v3 = [v2 bluetoothAddressData];

  return (NSData *)v3;
}

- (NSString)bonjourName
{
  pthread_mutex_lock(&stru_100969508);
  bonjourName = self->_bonjourName;
  if (bonjourName)
  {
    id v4 = bonjourName;
  }
  else
  {
    id v5 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
    id v4 = (NSString *)[(__CFString *)v5 copy];
  }
  pthread_mutex_unlock(&stru_100969508);

  return v4;
}

- (NSString)computerName
{
  pthread_mutex_lock(&stru_100969508);
  computerName = self->_computerName;
  if (!computerName)
  {
    id v4 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
    id v5 = (NSString *)[(__CFString *)v4 copy];
    unsigned int v6 = self->_computerName;
    self->_computerName = v5;

    computerName = self->_computerName;
  }
  int v7 = computerName;
  pthread_mutex_unlock(&stru_100969508);

  return v7;
}

- (void)clearComputerName
{
  pthread_mutex_lock(&stru_100969508);
  computerName = self->_computerName;
  self->_computerName = 0;

  pthread_mutex_unlock(&stru_100969508);
}

- (NSString)consoleUser
{
  pthread_mutex_lock(&stru_100969508);
  BOOL v3 = self->_consoleUser;
  pthread_mutex_unlock(&stru_100969508);

  return v3;
}

- (void)clearConsoleUser
{
  pthread_mutex_lock(&stru_100969508);
  consoleUser = self->_consoleUser;
  self->_consoleUser = 0;

  self->_consoleUserID = -1;

  pthread_mutex_unlock(&stru_100969508);
}

- (NSString)deviceInformation
{
  BOOL v3 = &NSCalendarIdentifierGregorian_ptr;
  if (!self->_deviceInformation)
  {
    v34[0] = @"BuildVersion";
    v34[1] = @"IsSimulator";
    v34[2] = @"marketing-name";
    v34[3] = @"ProductName";
    v34[4] = @"ProductType";
    v34[5] = @"ProductVersion";
    v34[6] = @"ReleaseType";
    +[NSArray arrayWithObjects:v34 count:7];
    id v4 = (void *)MGCopyMultipleAnswers();
    id v5 = [v4 objectForKeyedSubscript:@"IsSimulator"];
    unsigned int v6 = [v5 BOOLValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"ReleaseType"];
    id v8 = (void *)v7;
    CFArrayRef v9 = @"Production";
    if (v7) {
      CFArrayRef v9 = (__CFString *)v7;
    }
    CFArrayRef v10 = v9;
    char v32 = v10;

    uint64_t v11 = @"Simulator";
    if (!v6) {
      uint64_t v11 = v10;
    }
    CFIndex v12 = v11;
    uint64_t v31 = [v4 objectForKeyedSubscript:@"marketing-name"];
    long long v13 = [v4 objectForKeyedSubscript:@"ProductType"];
    id v14 = +[NSString stringWithFormat:@"%@ (%@)", v31, v13];
    long long v15 = [v4 objectForKeyedSubscript:@"ProductName"];
    uint64_t v16 = [v4 objectForKeyedSubscript:@"ProductVersion"];
    CC_LONG v17 = [v4 objectForKeyedSubscript:@"BuildVersion"];
    id v18 = +[NSString stringWithFormat:@"%@ %@ (%@)", v15, v16, v17];
    id v19 = +[NSString stringWithFormat:@"%@: %@, %@, ", v12, v14, v18];

    deviceInformation = self->_deviceInformation;
    self->_deviceInformation = v19;

    BOOL v3 = &NSCalendarIdentifierGregorian_ptr;
  }
  v33[0] = @"BatteryCurrentCapacity";
  v33[1] = @"BatteryIsCharging";
  +[NSArray arrayWithObjects:v33 count:2];
  uint64_t v21 = (void *)MGCopyMultipleAnswers();
  id v22 = [v21 objectForKeyedSubscript:@"BatteryIsCharging"];
  unsigned int v23 = [v22 BOOLValue];

  CC_LONG v24 = @"not charging";
  if (v23) {
    CC_LONG v24 = @"charging";
  }
  id v25 = v24;
  id v26 = [v21 objectForKeyedSubscript:@"BatteryCurrentCapacity"];
  id v27 = [v26 integerValue];

  long long v28 = [(NSCalendarIdentifier *)(id)v3[225] stringWithFormat:@"%d%% (%@)", v27, v25];

  long long v29 = [(NSString *)self->_deviceInformation stringByAppendingString:v28];

  return (NSString *)v29;
}

- (int64_t)deviceKeyBagState
{
  deviceKeyBagState = self->_deviceKeyBagState;
  if (!deviceKeyBagState)
  {
    id v4 = +[NSNumber numberWithInt:MKBGetDeviceLockState()];
    id v5 = self->_deviceKeyBagState;
    self->_deviceKeyBagState = v4;

    deviceKeyBagState = self->_deviceKeyBagState;
  }

  return [(NSNumber *)deviceKeyBagState integerValue];
}

- (NSString)localHostName
{
  pthread_mutex_lock(&stru_100969508);
  localHostName = self->_localHostName;
  if (!localHostName)
  {
    id v4 = (__CFString *)SCDynamicStoreCopyLocalHostName(0);
    id v5 = self->_localHostName;
    self->_localHostName = &v4->isa;

    localHostName = self->_localHostName;
  }
  unsigned int v6 = localHostName;
  pthread_mutex_unlock(&stru_100969508);

  return v6;
}

- (void)clearLocalHostName
{
  pthread_mutex_lock(&stru_100969508);
  localHostName = self->_localHostName;
  self->_localHostName = 0;

  pthread_mutex_unlock(&stru_100969508);
}

+ (double)b332BTAddressRotationDelay
{
  return (double)(int)sub_1001B3E88(@"B332BTAddressRotationDelayMsec", 100) / 1000.0;
}

+ (double)b389MultiDiscoveryDebounce
{
  return (double)(int)sub_1001B3E88(@"B389MultiDiscoveryDebounceKeyMsec", 1000) / 1000.0;
}

+ (double)b389MultiDiscoveryInstructionsDelay
{
  return (double)(int)sub_1001B3E88(@"B389MultiDiscoveryInstructionsDelayKeyMsec", 6000) / 1000.0;
}

- (int)minPersonImageSize
{
  return sub_1001B3E88(@"MinPersonImageSize", 32);
}

- (NSString)modelCode
{
  memset(v7, 0, sizeof(v7));
  size_t v5 = 256;
  *(void *)unsigned int v6 = 0x100000006;
  if (sysctl(v6, 2u, v7, &v5, 0, 0))
  {
    id v2 = daemon_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1001F510C(v2);
    }

    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = +[NSString stringWithUTF8String:v7];
  }

  return (NSString *)v3;
}

- (NSString)modelName
{
  pthread_mutex_lock(&stru_100969508);
  id v2 = (__CFString *)MGCopyAnswer();
  unsigned int v3 = [(__CFString *)v2 isEqualToString:@"iPod"];
  id v4 = @"iPod touch";
  if (!v3) {
    id v4 = v2;
  }
  size_t v5 = v4;
  if (v5) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = @"iOS";
  }
  pthread_mutex_unlock(&stru_100969508);

  return (NSString *)v6;
}

- (NSString)myAccountAppleID
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  unsigned int v3 = sub_1001B22F4(v2);
  id v4 = [v3 username];

  return (NSString *)v4;
}

+ (int64_t)mrQLProgressUpdateFreqMsec
{
  return (int)sub_1001B3E88(@"MRQLProgFreqMsec", 200);
}

- (NSString)myAltDSID
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  unsigned int v3 = sub_1001B22F4(v2);
  id v4 = [v3 aa_altDSID];

  return (NSString *)v4;
}

- (NSString)myAppleID
{
  pthread_mutex_lock(&stru_100969508);
  unsigned int v3 = [(SDStatusMonitor *)self _myAppleID];
  pthread_mutex_unlock(&stru_100969508);

  return (NSString *)v3;
}

- (id)_myAppleID
{
  myAppleID = self->_myAppleID;
  if (!myAppleID)
  {
    id v4 = objc_alloc_init((Class)ACAccountStore);
    size_t v5 = sub_1001B22F4(v4);
    unsigned int v6 = [v5 username];
    uint64_t v7 = self->_myAppleID;
    self->_myAppleID = v6;

    myAppleID = self->_myAppleID;
  }

  return myAppleID;
}

- (NSString)myAppleIDCommonName
{
  pthread_mutex_lock(&stru_100969508);
  if (!self->_myAppleIDCommonName)
  {
    unsigned int v3 = [(SDStatusMonitor *)self _copyMyAppleIDSecIdentity];
    if (v3)
    {
      id v4 = v3;
      SecCertificateRef certificateRef = 0;
      if (SecIdentityCopyCertificate(v3, &certificateRef))
      {
        size_t v5 = daemon_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1001F519C();
        }
      }
      else
      {
        unsigned int v6 = [(SDStatusMonitor *)self commonNameForCertificate:certificateRef];
        myAppleIDCommonName = self->_myAppleIDCommonName;
        self->_myAppleIDCommonName = v6;

        CFRelease(certificateRef);
      }
      CFRelease(v4);
    }
  }
  id v8 = self->_myAppleIDCommonName;
  pthread_mutex_unlock(&stru_100969508);

  return v8;
}

- (NSArray)myAppleIDEmailAddresses
{
  pthread_mutex_lock(&stru_100969508);
  unsigned int v3 = [(SDStatusMonitor *)self _myAppleID];
  id v4 = [(SDStatusMonitor *)self emailAddressesForAppleID:v3];

  pthread_mutex_unlock(&stru_100969508);

  return (NSArray *)v4;
}

- (NSString)myAppleIDEmailHash
{
  pthread_mutex_lock(&stru_100969508);
  if (!self->_myEmailHashes)
  {
    unsigned int v3 = [(SDStatusMonitor *)self _myAppleID];
    CFArrayRef v4 = [(SDStatusMonitor *)self emailAddressesForAppleID:v3];

    if (v4)
    {
      Mutable = (NSMutableString *)CFStringCreateMutable(0, 0);
      myEmailHashes = self->_myEmailHashes;
      self->_myEmailHashes = Mutable;

      CFIndex Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        CFIndex v8 = 0;
        if (Count >= 8) {
          uint64_t v9 = 8;
        }
        else {
          uint64_t v9 = Count;
        }
        do
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(v4, v8);
          sub_1001B3C88(ValueAtIndex, 0);
          CFStringRef v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          CFIndex v12 = (__CFString *)v11;
          if (v11)
          {
            uint64_t v13 = sub_1001B2548(v11);
            if (v13)
            {
              id v14 = (const void *)v13;
              [(NSMutableString *)self->_myEmailHashes appendString:v13];
              if (v9 - 1 != v8) {
                [(NSMutableString *)self->_myEmailHashes appendString:@","];
              }
              CFRelease(v14);
            }
          }

          ++v8;
        }
        while (v9 != v8);
      }
      CFRelease(v4);
    }
  }
  long long v15 = self->_myEmailHashes;
  pthread_mutex_unlock(&stru_100969508);

  return (NSString *)v15;
}

- (NSString)myAppleIDPhoneHash
{
  pthread_mutex_lock(&stru_100969508);
  if (!self->_myPhoneHashes)
  {
    unsigned int v3 = [(SDStatusMonitor *)self _myAppleID];
    CFArrayRef v4 = [(SDStatusMonitor *)self phoneNumbersForAppleID:v3];

    if (v4)
    {
      Mutable = (NSMutableString *)CFStringCreateMutable(0, 0);
      myPhoneHashes = self->_myPhoneHashes;
      self->_myPhoneHashes = Mutable;

      CFIndex Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        CFIndex v8 = 0;
        if (Count >= 8) {
          uint64_t v9 = 8;
        }
        else {
          uint64_t v9 = Count;
        }
        do
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(v4, v8);
          CFStringRef v11 = (const __CFString *)sub_1001B3D7C(ValueAtIndex);
          if (v11)
          {
            uint64_t v12 = sub_1001B2548(v11);
            if (v12)
            {
              uint64_t v13 = (const void *)v12;
              [(NSMutableString *)self->_myPhoneHashes appendString:v12];
              if (v9 - 1 != v8) {
                [(NSMutableString *)self->_myPhoneHashes appendString:@","];
              }
              CFRelease(v13);
            }
          }
          ++v8;
        }
        while (v9 != v8);
      }
      CFRelease(v4);
    }
  }
  id v14 = self->_myPhoneHashes;
  pthread_mutex_unlock(&stru_100969508);

  return (NSString *)v14;
}

- (NSArray)myAppleIDPhoneNumbers
{
  pthread_mutex_lock(&stru_100969508);
  unsigned int v3 = [(SDStatusMonitor *)self _myAppleID];
  uint64_t v4 = [(SDStatusMonitor *)self phoneNumbersForAppleID:v3];

  pthread_mutex_unlock(&stru_100969508);
  if (v4) {
    size_t v5 = (void *)v4;
  }
  else {
    size_t v5 = &__NSArray0__struct;
  }

  return (NSArray *)v5;
}

- (NSDictionary)myAppleIDValidationRecord
{
  id v2 = [(SDStatusMonitor *)self myAppleID];
  if (v2)
  {
    unsigned int v3 = +[SDAppleIDAgent sharedAgent];
    uint64_t v4 = [v3 validationRecordInfoForAppleID:v2];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSString)myEmail
{
  pthread_mutex_lock(&stru_100969508);
  unsigned int v3 = [(SDStatusMonitor *)self meCard];
  uint64_t v4 = [v3 emailAddresses];
  size_t v5 = [v4 firstObject];
  unsigned int v6 = [v5 value];

  pthread_mutex_unlock(&stru_100969508);

  return (NSString *)v6;
}

- (NSString)myName
{
  pthread_mutex_lock(&stru_100969508);
  unsigned int v3 = [(SDStatusMonitor *)self meCard];
  uint64_t v4 = +[CNContactFormatter stringFromContact:v3 style:0];

  pthread_mutex_unlock(&stru_100969508);

  return (NSString *)v4;
}

- (NSString)myGivenName
{
  pthread_mutex_lock(&stru_100969508);
  unsigned int v3 = [(SDStatusMonitor *)self meCard];
  uint64_t v4 = [v3 givenName];

  pthread_mutex_unlock(&stru_100969508);

  return (NSString *)v4;
}

- (NSString)myPrimaryEmail
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  unsigned int v3 = sub_1001B22F4(v2);
  uint64_t v4 = [v3 aa_primaryEmail];

  return (NSString *)v4;
}

- (NSData)myMediumHashes
{
  id v2 = [(SDStatusMonitor *)self unifiedAppleIDInfo];
  unsigned int v3 = +[SDAirDropContactHashManager obfuscatedMediumHashDataForStrings:v2];

  return (NSData *)v3;
}

- (NSData)myShortHashesForAirDrop
{
  id v2 = [(SDStatusMonitor *)self unifiedAppleIDInfo];
  unsigned int v3 = +[SDAirDropContactHashManager btleAdvertisementDataForStrings:v2];

  return (NSData *)v3;
}

- (NSString)netbiosName
{
  pthread_mutex_lock(&stru_100969508);
  p_netbiosName = &self->_netbiosName;
  if (self->_netbiosName)
  {
    id v4 = 0;
  }
  else
  {
    smbPreferences = self->_smbPreferences;
    id v7 = 0;
    [(SDStatusMonitor *)self smbConfiguration:smbPreferences netBiosName:&v7 workgroup:0];
    id v4 = v7;
  }
  objc_storeStrong((id *)p_netbiosName, v4);
  pthread_mutex_unlock(&stru_100969508);

  return (NSString *)v4;
}

- (int)sidebarMaxCount
{
  return sub_1001B3E88(@"SidebarMaxCount", 7);
}

+ (int64_t)shareSheetMaxSuggestions
{
  return (int)sub_1001B3E88(@"ShareSheetMaxSuggestions", 12);
}

- (NSString)someComputerName
{
  unsigned int v3 = [(SDStatusMonitor *)self computerName];
  if (!v3)
  {
    unsigned int v3 = [(SDStatusMonitor *)self modelName];
  }

  return (NSString *)v3;
}

- (NSString)workgroup
{
  pthread_mutex_lock(&stru_100969508);
  p_workgroup = &self->_workgroup;
  if (self->_workgroup)
  {
    id v4 = 0;
  }
  else
  {
    smbPreferences = self->_smbPreferences;
    id v7 = 0;
    [(SDStatusMonitor *)self smbConfiguration:smbPreferences netBiosName:0 workgroup:&v7];
    id v4 = v7;
  }
  objc_storeStrong((id *)p_workgroup, v4);
  pthread_mutex_unlock(&stru_100969508);

  return (NSString *)v4;
}

- (int)workgroupThreshold
{
  return sub_1001B3E88(@"WorkgroupThreshold", 6);
}

- (void)updateAirDropAllowed
{
  unsigned int v3 = [(NSNumber *)self->_airDropAllowed BOOLValue];
  id v4 = +[MCProfileConnection sharedConnection];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isAirDropAllowed]);
  size_t v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  airDropAllowed = self->_airDropAllowed;
  self->_airDropAllowed = v5;

  if (v3 != [(NSNumber *)self->_airDropAllowed BOOLValue])
  {
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.AirDropAllowedChanged"];
  }
}

- (BOOL)isTourModeEnabled
{
  return 0;
}

- (BOOL)iCloudSharedPhotoLibraryEnabled
{
  int iCloudSharedPhotoLibraryEnabled = self->_iCloudSharedPhotoLibraryEnabled;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PhotosSharedLibrarySyncingIsActive", @"com.apple.mobileslideshow", 0);
  int v5 = AppBooleanValue != 0;
  if (iCloudSharedPhotoLibraryEnabled == v5)
  {
    LOBYTE(v5) = self->_iCloudSharedPhotoLibraryEnabled;
  }
  else
  {
    int v6 = AppBooleanValue;
    id v7 = daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"YES";
      if (iCloudSharedPhotoLibraryEnabled) {
        CFStringRef v9 = @"YES";
      }
      else {
        CFStringRef v9 = @"NO";
      }
      if (!v6) {
        CFStringRef v8 = @"NO";
      }
      int v11 = 138412546;
      CFStringRef v12 = v9;
      __int16 v13 = 2112;
      CFStringRef v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "iCloud Shared Photo Library enabled: %@ -> %@", (uint8_t *)&v11, 0x16u);
    }

    self->_int iCloudSharedPhotoLibraryEnabled = v5;
  }
  return v5;
}

- (BOOL)isLocalDeviceMeDevice
{
  id v2 = [(SDStatusMonitor *)self systemMonitor];
  unsigned __int8 v3 = [v2 meDeviceIsMe];

  return v3;
}

- (BOOL)allEnabled
{
  return 1;
}

- (BOOL)altDSIDNeedsFixing
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  unsigned __int8 v3 = sub_1001B22F4(v2);
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 aa_altDSID];
    if (v5)
    {
      int v6 = [v4 aa_primaryEmail];
      unsigned int v7 = [v5 isEqualToString:v6];

      if (v7)
      {
        CFStringRef v8 = tethering_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1001F5238();
        }
      }
      else
      {
        CFArrayRef v10 = [v4 username];
        unsigned int v11 = [v5 isEqualToString:v10];

        if (!v11)
        {
          BOOL v9 = 0;
          goto LABEL_13;
        }
        CFStringRef v8 = tethering_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1001F526C();
        }
      }
    }
    else
    {
      CFStringRef v8 = tethering_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001F5204();
      }
    }

    BOOL v9 = 1;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)alwaysAutoAccept
{
  return sub_1000D9060(@"AlwaysAutoAccept", 0) != 0;
}

- (BOOL)alwaysSendPayload
{
  return sub_1000D9060(@"AlwaysSendPayload", 0) != 0;
}

+ (BOOL)b332PairingEnabled
{
  return sub_1000D9060(@"B332PairingEnabled", 1) != 0;
}

+ (BOOL)b389ShowLogsInUI
{
  return sub_1000D9060(@"B389ShowLogsInUI", 0) != 0;
}

- (BOOL)backlightOn
{
  backlightOn = self->_backlightOn;
  if (!backlightOn)
  {
    uint64_t state64 = 0;
    notify_get_state(self->_backlightLevelToken, &state64);
    +[NSNumber numberWithInt:state64 != 0];
    id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    int v5 = self->_backlightOn;
    self->_backlightOn = v4;

    backlightOn = self->_backlightOn;
  }
  return [(NSNumber *)backlightOn BOOLValue];
}

- (BOOL)bonjourEnabled
{
  return 1;
}

- (BOOL)browseAllInterfaces
{
  return sub_1000D8FC8() != 0;
}

+ (BOOL)isBuddyCompleted
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SetupDone", @"com.apple.purplebuddy", 0);
  return (AppBooleanValue | CFPreferencesGetAppBooleanValue(@"ForceNoBuddy", @"com.apple.purplebuddy", 0)) != 0;
}

- (BOOL)bypassLTKeyAbort
{
  int v2 = sub_1000D9060(@"BypassLTKeyAbort", 0);
  if (v2) {
    LOBYTE(v2) = IsAppleInternalBuild() != 0;
  }
  return v2;
}

- (BOOL)carplayConnected
{
  return self->_carplayConnected;
}

- (BOOL)coalesceMe
{
  return sub_1000D9060(@"CoalesceMe", 0) != 0;
}

- (BOOL)connectedEnabled
{
  return 1;
}

- (BOOL)currentConsoleUser
{
  return 1;
}

- (BOOL)deviceInBiolockout
{
  +[BKDeviceManager availableDevices];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (!v3) {
    goto LABEL_23;
  }
  uint64_t v5 = *(void *)v24;
  *(void *)&long long v4 = 138412290;
  long long v18 = v4;
  while (2)
  {
    for (CFIndex i = 0; i != v3; CFIndex i = (char *)i + 1)
    {
      if (*(void *)v24 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
      id v22 = 0;
      CFStringRef v8 = +[BKDevice deviceWithDescriptor:error:](BKDevice, "deviceWithDescriptor:error:", v7, &v22, v18);
      id v9 = v22;
      id v21 = v9;
      CFArrayRef v10 = [v8 identitiesWithError:&v21];
      id v11 = v21;

      if (v11 || !v10)
      {
        CFStringRef v12 = daemon_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          id v28 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error getting device identities. Error: %@", buf, 0xCu);
        }
      }
      uint64_t v20 = 0;
      if (![v10 count]) {
        goto LABEL_16;
      }
      uint64_t v13 = getuid();
      id v19 = v11;
      unsigned int v14 = [v8 extendedBioLockoutState:&v20 forUser:v13 error:&v19];
      id v15 = v19;

      if (!v14)
      {
        id v11 = v15;
LABEL_16:
        uint64_t v16 = daemon_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v28 = v8;
          __int16 v29 = 2112;
          id v30 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Got error getting lockout state for device: %@ with error: %@", buf, 0x16u);
        }

        goto LABEL_19;
      }
      if ((v20 & 4) != 0)
      {

        LOBYTE(v3) = 1;
        goto LABEL_23;
      }
      id v11 = v15;
LABEL_19:
    }
    id v3 = [v2 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v3) {
      continue;
    }
    break;
  }
LABEL_23:

  return (char)v3;
}

- (BOOL)deviceIsInClassD
{
  id v2 = [(SDStatusMonitor *)self systemMonitor];
  char v3 = [v2 firstUnlocked] ^ 1;

  return v3;
}

- (BOOL)deviceKeyBagDisabled
{
  return (id)[(SDStatusMonitor *)self deviceKeyBagState] == (id)3;
}

- (BOOL)deviceKeyBagLocked
{
  int64_t v3 = [(SDStatusMonitor *)self deviceKeyBagState];
  char v4 = v3 + 8;
  if (unint64_t)(v3 + 8) < 0x10 && ((0xFF01u >> v4))
  {
    return (0x76FFu >> v4) & 1;
  }
  else
  {
    uint64_t v5 = daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      int64_t v9 = [(SDStatusMonitor *)self deviceKeyBagState];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unknown keybag state: %ld File a radar against Sharing | all", (uint8_t *)&v8, 0xCu);
    }

    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)deviceKeyBagLocking
{
  return (id)[(SDStatusMonitor *)self deviceKeyBagState] == (id)2;
}

- (BOOL)deviceKeyBagUnlocked
{
  int64_t v3 = [(SDStatusMonitor *)self deviceKeyBagState];
  char v4 = v3 + 8;
  if (unint64_t)(v3 + 8) < 0x10 && ((0xFF01u >> v4))
  {
    return (0x8900u >> v4) & 1;
  }
  else
  {
    uint64_t v5 = daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      int64_t v9 = [(SDStatusMonitor *)self deviceKeyBagState];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unknown keybag state: %ld File a radar against Sharing | all", (uint8_t *)&v8, 0xCu);
    }

    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)deviceKeyBagUnlockedAndScreenOn
{
  BOOL v3 = [(SDStatusMonitor *)self deviceKeyBagUnlocked];
  if (v3)
  {
    LOBYTE(v3) = [(SDStatusMonitor *)self screenOn];
  }
  return v3;
}

- (BOOL)deviceRequiresNewRanging
{
  return 0;
}

- (BOOL)deviceSupportsRanging
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)WiFiDeviceClientCopyProperty();
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (CFIndex i = 0; i != v4; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "integerValue", (void)v11) == (id)58)
        {
          LODWORD(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v9 = @"NO";
    wifiDevice = self->_wifiDevice;
    *(_DWORD *)buf = 138412802;
    if (v4) {
      CFStringRef v9 = @"YES";
    }
    CFStringRef v16 = v9;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = wifiDevice;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Device supports ranging %@, capabilities: %@, wifiDevice: %@", buf, 0x20u);
  }

  return (char)v4;
}

- (BOOL)deviceUIUnlocked
{
  deviceUIUnlocked = self->_deviceUIUnlocked;
  if (!deviceUIUnlocked)
  {
    SBSSpringBoardServerPort();
    if (SBGetScreenLockStatus())
    {
      p_super = daemon_log();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_1001F52A0();
      }
    }
    else
    {
      uint64_t v5 = +[NSNumber numberWithInt:1];
      p_super = &self->_deviceUIUnlocked->super.super;
      self->_deviceUIUnlocked = v5;
    }

    deviceUIUnlocked = self->_deviceUIUnlocked;
  }
  return [(NSNumber *)deviceUIUnlocked BOOLValue];
}

- (BOOL)deviceWasUnlockedOnce
{
  return self->_deviceWasUnlockedOnce;
}

- (BOOL)disableAutoAccept
{
  return sub_1000D9060(@"DisableAutoAccept", 0) != 0;
}

- (BOOL)disableAutoAcceptForPhotosAssetBundles
{
  return sub_1000D9060(@"DisableAutoAcceptForPhotosAssetBundles", 1) != 0;
}

- (BOOL)disableCompression
{
  return sub_1000D9060(@"DisableCompression", 0) != 0;
}

- (BOOL)disableContinuityTLS
{
  return sub_1000D9060(@"DisableContinuityTLS", 0) != 0;
}

- (BOOL)disablePeopleSuggestions
{
  return sub_1000D9060(@"DisablePeopleSuggestions", 0) != 0;
}

- (BOOL)disablePictureQuery
{
  return sub_1000D9060(@"DisablePictureQuery", 0) != 0;
}

- (BOOL)disablePipelining
{
  return sub_1000D9060(@"DisablePipelining", 0) != 0;
}

- (BOOL)disableQuarantine
{
  return sub_1000D9060(@"DisableQuarantine", 0) != 0;
}

- (BOOL)disableExtractMediaFromBundles
{
  return sub_1000D9060(@"DisableExtractMediaFromBundles", 0) != 0;
}

- (BOOL)disableTransformingPhotosAssetBundlesToFolders
{
  return sub_1000D9060(@"DisableTransformingPhotosAssetBundlesToFolders", 0) != 0;
}

- (BOOL)disableRotation
{
  return sub_1000D9060(@"DisableRotation", 0) != 0;
}

- (BOOL)disableTLS
{
  return variable initialization expression of SDAirDropHashStoreCDB.destroyed() != 0;
}

- (BOOL)dockHasDownloadsFolder
{
  return 0;
}

- (BOOL)eduModeEnabled
{
  if (qword_1009803C0 != -1) {
    dispatch_once(&qword_1009803C0, &stru_1008D0910);
  }
  return byte_1009803B8;
}

- (BOOL)enableAirDropAdvertising
{
  if (sub_1000D9060(@"DisableAirDropAdvertising", 0)) {
    return 0;
  }

  return [(SDStatusMonitor *)self isAirDropAvailable];
}

- (BOOL)enableAirDropReceiving
{
  int v3 = SFIsDeviceAudioAccessory();
  int v4 = sub_1000D9060(@"EnableAirDropReceiving", v3 ^ 1u);
  if (v4)
  {
    LOBYTE(v4) = [(SDStatusMonitor *)self isAirDropAvailable];
  }
  return v4;
}

- (BOOL)enableAllRecents
{
  return sub_1000D9060(@"EnableAllRecents", 0) != 0;
}

- (BOOL)enableBugs
{
  return sub_1000D9060(@"EnableBugs", 0) != 0;
}

- (BOOL)enableContinuity
{
  if (sub_1000D9060(@"DisableContinuity", 0)) {
    return 0;
  }

  return [(SDStatusMonitor *)self deviceSupportsContinuity];
}

- (BOOL)enableDebugMode
{
  return sub_1000D9060(@"EnableDebugMode", 0) != 0;
}

- (BOOL)enableDemoMode
{
  return sub_1000D9050() != 0;
}

- (BOOL)enableDVZip
{
  return sub_1000D9060(@"EnableDVZip", 1) != 0;
}

- (BOOL)enableHotspotFallback
{
  return sub_1000D9060(@"EnableHotspotFallback", 0) != 0;
}

+ (BOOL)enableOOBPCredentialLogging
{
  int v2 = IsAppleInternalBuild();
  if (v2) {
    LOBYTE(v2) = sub_1000D9060(@"EnableOOBPCredentialLogging", 0) != 0;
  }
  return v2;
}

- (BOOL)enablePKZip
{
  return sub_1000D9060(@"EnablePKZip", 0) != 0;
}

- (BOOL)enablePKZipCompression
{
  return sub_1000D9060(@"EnablePKZipCompression", 0) != 0;
}

- (BOOL)enableStrangers
{
  return sub_1000D9060(@"pdStrangers", 0) != 0;
}

- (BOOL)enableStreamDebugging
{
  return sub_1000D9060(@"EnableStreamDebugging", 0) != 0;
}

+ (BOOL)enableShareSheetVectorSlots
{
  return sub_1000D9060(@"kEnableShareSheetVectorSlots", 0) != 0;
}

+ (BOOL)enableAirDropHUDScene
{
  return sub_1000D9060(@"kEnableAirDropHUDScene", 0) != 0;
}

- (BOOL)enableWebloc
{
  return sub_1000D9060(@"EnableWebloc", 0) != 0;
}

- (BOOL)enableXML
{
  return sub_1000D9060(@"EnableXML", 0) != 0;
}

- (BOOL)finderAirDropEnabled
{
  int v2 = [(SDStatusMonitor *)self finderServer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)forceAWDL
{
  return sub_1000D9060(@"ForceAWDL", 0) != 0;
}

- (BOOL)forceP2P
{
  return sub_1000D9060(@"ForceP2P", 0) != 0;
}

- (BOOL)handoffVisible
{
  pthread_mutex_lock(&stru_100969508);
  handoffVisible = self->_handoffVisible;
  if (!handoffVisible)
  {
    +[NSNumber numberWithBool:SBSEventObserverGetValueForState() != 0];
    int v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_handoffVisible;
    self->_handoffVisible = v4;

    handoffVisible = self->_handoffVisible;
  }
  unsigned __int8 v6 = [(NSNumber *)handoffVisible BOOLValue];
  pthread_mutex_unlock(&stru_100969508);
  return v6;
}

- (BOOL)ignoreIconDiskCache
{
  return sub_1000D9060(@"IgnoreIconDiskCache", 0) != 0;
}

- (BOOL)lostModeEnabled
{
  if (SFLostMode()) {
    return 1;
  }

  return _SFManagedLostMode();
}

- (BOOL)internetSharingEnabled
{
  return 0;
}

- (BOOL)myAppleIDIsManaged
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  BOOL v3 = sub_1001B22F4(v2);
  unsigned __int8 v4 = [v3 aa_isManagedAppleID];

  return v4;
}

- (BOOL)registerAllInterfaces
{
  return sub_1000D9060(@"RegisterAllInterfaces", 0) != 0;
}

- (BOOL)runningAsSetupUser
{
  return 0;
}

- (BOOL)showMeInWormhole
{
  return sub_1000D9060(@"ShowMeInWormhole", 0) != 0;
}

- (BOOL)showThisComputer
{
  return sub_1000D9060(@"ShowThisComputer", 0) != 0;
}

- (BOOL)signedIntoPrimaryiCloudAccount
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  BOOL v3 = sub_1001B22F4(v2);
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)sleepModeOn
{
  return self->_sleepModeOn;
}

- (BOOL)smartCoverIsClosed
{
  return [(SDSmartCoverMonitor *)self->_smartCoverMonitor smartCoverIsClosed];
}

- (BOOL)supportsFitnessPlusPairing
{
  int DeviceClass = GestaltGetDeviceClass();
  return DeviceClass == 6 || DeviceClass == 1;
}

- (BOOL)supportsXcodePairing
{
  unsigned int DeviceClass = GestaltGetDeviceClass();
  return (DeviceClass < 7) & (0x5Au >> DeviceClass);
}

- (BOOL)testDiskFull
{
  return sub_1000D9060(@"TestDiskFull", 0) != 0;
}

- (BOOL)wifiUserPowerPreference
{
  return 0;
}

- (BOOL)wirelessCarPlay
{
  pthread_mutex_lock(&stru_100969508);
  carKitSessionStatus = self->_carKitSessionStatus;
  if (!carKitSessionStatus)
  {
    BOOL v4 = (CARSessionStatus *)objc_alloc_init((Class)CARSessionStatus);
    uint64_t v5 = self->_carKitSessionStatus;
    self->_carKitSessionStatus = v4;

    carKitSessionStatus = self->_carKitSessionStatus;
  }
  unsigned __int8 v6 = [(CARSessionStatus *)carKitSessionStatus currentSession];
  pthread_mutex_unlock(&stru_100969508);
  if (v6) {
    BOOL v7 = [(SDStatusMonitor *)self isCarKitSessionWireless:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)asynchronousProxyLoadingEnabled
{
  return sub_1000D9060(@"EnableAsynchronousProxyLoading", 0) != 0;
}

- (void)logAirDropTransactionForClientServer:(BOOL)a3 beginEnd:(BOOL)a4 count:(int)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  int v8 = airdrop_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"server";
    if (v7) {
      CFStringRef v9 = @"client";
    }
    int v11 = 138412802;
    CFStringRef v12 = v9;
    if (v6) {
      CFStringRef v10 = @"begin";
    }
    else {
      CFStringRef v10 = @"end";
    }
    __int16 v13 = 2112;
    CFStringRef v14 = v10;
    __int16 v15 = 1024;
    int v16 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AirDrop %@ transaction %@ (%d)", (uint8_t *)&v11, 0x1Cu);
  }
}

- (void)updateMediaAccessControlSetting:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.airplay"];
  unsigned int v5 = [v8 BOOLForKey:@"accessControlLevel"];
  unsigned int v6 = [v8 BOOLForKey:@"p2pAllow"];
  int64_t v7 = 3;
  if (!v5) {
    int64_t v7 = 1;
  }
  if (!v6) {
    int64_t v7 = 2;
  }
  if (self->_mediaAccessControlSetting != v7)
  {
    self->_mediaAccessControlSetting = v7;
    if (v3) {
      [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.MediaAccessControlSettingChanged"];
    }
  }
}

- (int64_t)mediaAccessControlSetting
{
  return self->_mediaAccessControlSetting;
}

- (void)installAppleIDUsernameMonitor
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)AKAppleIDEmailsDidChangeNotification;

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1001ED71C, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)appleIDAccountInfoChanged:(id)a3
{
  CFStringRef v4 = daemon_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Apple ID account info changed.", v5, 2u);
  }

  [(SDStatusMonitor *)self clearMyAppleIDInfo];
  [(SDStatusMonitor *)self updateDiscoverableMode];
  [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.AppleIDAccountInfoChanged"];
}

- (void)installAppleIDAccountInfoMonitor
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"appleIDAccountInfoChanged:" name:SFAppleIDIdentityDidChangeNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"appleIDAccountInfoChanged:" name:SFAppleIDValidationRecordDidChangeNotification object:0];
}

- (void)forceAWDLDeviceRefresh:(__WiFiDeviceClient *)a3
{
  id v4 = daemon_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting awdlDevice to nil", v5, 2u);
  }

  self->_awdlDevice = 0;
}

- (void)updateWirelessCritical:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updateWirelessCritical inCriticalState=%@", (uint8_t *)&v7, 0xCu);
  }

  self->_wirelessCritical = v3;
  [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.WirelessCriticalChanged"];
}

- (void)handleAWDLState:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDStatusMonitor *)self awdlState];
  CFStringRef v6 = [v5 objectForKeyedSubscript:@"AWDL_INFO"];

  int v7 = [v4 objectForKeyedSubscript:@"AWDL_INFO"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    int v11 = auto_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      uint64_t v13 = objc_opt_class();
      __int16 v14 = 2112;
      uint64_t v15 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AWDL Info isn't a dictionary (stored info class %@, new info class %@)", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    if (([v6 isEqualToDictionary:v7] & 1) == 0)
    {
      CFStringRef v8 = auto_unlock_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        uint64_t v13 = (uint64_t)v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AWDL Info updated %@", (uint8_t *)&v12, 0xCu);
      }
    }
    pthread_mutex_lock(&stru_100969508);
    CFStringRef v9 = (NSDictionary *)[v4 copy];
    awdlState = self->_awdlState;
    self->_awdlState = v9;

    pthread_mutex_unlock(&stru_100969508);
  }
}

- (void)updateAWDLStateInfo
{
  if (![(SDStatusMonitor *)self wirelessEnabled])
  {
    [(SDStatusMonitor *)self handleAWDLState:0];
  }
}

- (void)installWirelessMonitor
{
  if (!self->_wifiDevice)
  {
    if (self->_wifiManager || (BOOL v3 = (__WiFiManagerClient *)WiFiManagerClientCreate(), (self->_wifiManager = v3) != 0))
    {
      [(SDStatusMonitor *)self updateWirelessDevice];
    }
    else
    {
      id v4 = daemon_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1001F5308();
      }
    }
  }
}

- (void)updateWirelessDevice
{
  pthread_mutex_lock(&stru_100969508);
  if (self->_wifiDevice)
  {
    awdlDevice = self->_awdlDevice;
    pthread_mutex_unlock(&stru_100969508);
    if (awdlDevice) {
      goto LABEL_35;
    }
  }
  else
  {
    pthread_mutex_unlock(&stru_100969508);
  }
  pthread_mutex_lock(&stru_100969508);
  BOOL wifiDeviceAttachmentRegistered = self->_wifiDeviceAttachmentRegistered;
  self->_BOOL wifiDeviceAttachmentRegistered = 1;
  pthread_mutex_unlock(&stru_100969508);
  if (!wifiDeviceAttachmentRegistered)
  {
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    WiFiManagerClientRegisterVirtInterfaceChangeCallback();
  }
  CFArrayRef v5 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (v5)
  {
    CFArrayRef v6 = v5;
    if (CFArrayGetCount(v5))
    {
      CFArrayRef v26 = v6;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      int v7 = (id)WiFiManagerClientCopyInterfaces();
      id v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v28;
        do
        {
          for (CFIndex i = 0; i != v9; CFIndex i = (char *)i + 1)
          {
            if (*(void *)v28 != v10) {
              objc_enumerationMutation(v7);
            }
            int v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            pthread_mutex_lock(&stru_100969508);
            wifiDevice = self->_wifiDevice;
            pthread_mutex_unlock(&stru_100969508);
            if (!wifiDevice)
            {
              if (WiFiDeviceClientGetInterfaceRoleIndex())
              {
                __int16 v14 = 0;
              }
              else
              {
                pthread_mutex_lock(&stru_100969508);
                __int16 v14 = v12;
                self->_wifiDevice = v14;
                pthread_mutex_unlock(&stru_100969508);
                WiFiDeviceClientRegisterPowerCallback();
              }
              uint64_t v15 = daemon_log();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                char v32 = v14;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Wi-Fi device %@", buf, 0xCu);
              }
            }
            pthread_mutex_lock(&stru_100969508);
            int v16 = self->_awdlDevice;
            pthread_mutex_unlock(&stru_100969508);
            if (!v16 && WiFiDeviceClientIsInterfaceAWDL())
            {
              pthread_mutex_lock(&stru_100969508);
              __int16 v17 = v12;
              self->_awdlDevice = v17;
              pthread_mutex_unlock(&stru_100969508);
              WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback();
              WiFiDeviceClientCopyInterfaceStateInfo();
              [(SDStatusMonitor *)self handleAWDLState:0];
              id v18 = daemon_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                char v32 = v17;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "AWDL device %@", buf, 0xCu);
              }
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v9);
      }

      CFArrayRef v6 = v26;
    }
    else
    {
      int v7 = daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001F53A4();
      }
    }

    CFRelease(v6);
  }
  else
  {
    __int16 v19 = daemon_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1001F5370();
    }
  }
LABEL_35:
  pthread_mutex_lock(&stru_100969508);
  uint64_t v20 = self->_wifiDevice;
  BOOL v21 = self->_wifiDeviceAttachmentRegistered;
  BOOL wifiScheduledOnRunLoop = self->_wifiScheduledOnRunLoop;
  pthread_mutex_unlock(&stru_100969508);
  if (!v20)
  {
    if (wifiScheduledOnRunLoop) {
      return;
    }
    long long v25 = daemon_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "SDStatusMonitor: WiFi device monitor started", buf, 2u);
    }

    goto LABEL_50;
  }
  if (v21)
  {
    long long v23 = daemon_log();
    long long v24 = v23;
    if (wifiScheduledOnRunLoop)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SDStatusMonitor: WiFi device attached", buf, 2u);
      }

      [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.WiFiDeviceAttached"];
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_1001F533C();
      }
    }
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    WiFiDeviceClientRegisterHostApStateChangedCallback();
    WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback();
    pthread_mutex_lock(&stru_100969508);
    self->_BOOL wifiDeviceAttachmentRegistered = 0;
    pthread_mutex_unlock(&stru_100969508);
  }
  if (!wifiScheduledOnRunLoop)
  {
LABEL_50:
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
    pthread_mutex_lock(&stru_100969508);
    self->_BOOL wifiScheduledOnRunLoop = 1;
    pthread_mutex_unlock(&stru_100969508);
  }
}

- (void)installWifiInterfaceMonitor
{
  if (!self->_wifiInterfaceMonitor)
  {
    BOOL v3 = dispatch_queue_create("com.apple.sharing.cwfinterface.queue", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001EE6D0;
    block[3] = &unk_1008CA4B8;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

- (void)updateWifiState:(int64_t)a3
{
  if (self->_wifiInterfaceMonitor)
  {
    pthread_mutex_lock(&stru_100969508);
    CFArrayRef v5 = self->_wifiInterfaceMonitor;
    pthread_mutex_unlock(&stru_100969508);
    CFArrayRef v6 = [(CWFInterface *)v5 channel];
    if (v6)
    {
      int v7 = [(CWFInterface *)v5 channel];
      unsigned int v8 = [v7 is2GHz];
    }
    else
    {
      unsigned int v8 = 0;
    }

    id v9 = [(CWFInterface *)v5 currentKnownNetworkProfile];
    unsigned int v10 = [v9 isPersonalHotspot];

    unsigned int v11 = [(CWFInterface *)v5 powerOn];
    pthread_mutex_lock(&stru_100969508);
    self->_isUsing2GHzWifCFIndex i = v8;
    self->_isWifiPersonalHotspot = v10;
    pthread_mutex_unlock(&stru_100969508);
    int v12 = daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"NO";
      if (v11) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      if (v8) {
        CFStringRef v15 = @"YES";
      }
      else {
        CFStringRef v15 = @"NO";
      }
      int v20 = 138412802;
      *(void *)BOOL v21 = v14;
      *(_WORD *)&v21[8] = 2112;
      CFStringRef v22 = v15;
      if (v10) {
        CFStringRef v13 = @"YES";
      }
      __int16 v23 = 2112;
      CFStringRef v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "WifiState: wirelessEnabled: %@ - isUsing2GHz: %@ - isWifiPersonalHotspot: %@\n", (uint8_t *)&v20, 0x20u);
    }

    if (a3 == 8)
    {
      unsigned int v16 = ([(CWFInterface *)v5 opMode] >> 3) & 1;
      unsigned int v17 = ([(CWFInterface *)v5 opMode] >> 1) & 1;
      pthread_mutex_lock(&stru_100969508);
      self->_wirelessAccessPoint = v16;
      self->_computerToComputer = v17;
      pthread_mutex_unlock(&stru_100969508);
      id v18 = daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 67109376;
        *(_DWORD *)BOOL v21 = v16;
        *(_WORD *)&v21[4] = 1024;
        *(_DWORD *)&v21[6] = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "WifiModeChange: wirelessAccessPoint: %d computerToComputer: %d", (uint8_t *)&v20, 0xEu);
      }
    }
    pthread_mutex_lock(&stru_100969508);
    if (self->_wirelessEnabled == v11)
    {
      pthread_mutex_unlock(&stru_100969508);
    }
    else
    {
      self->_wirelessEnabled = v11;
      __int16 v19 = daemon_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 67109120;
        *(_DWORD *)BOOL v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "WifiPowerChange: wirelessEnabled: %d", (uint8_t *)&v20, 8u);
      }

      pthread_mutex_unlock(&stru_100969508);
      [(SDStatusMonitor *)self updateDiscoverableMode];
      [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.WirelessPowerChanged"];
    }
  }
}

- (void)installBacklightMonitor
{
  if (!self->_backlightLevelToken)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001EEDBC;
    handler[3] = &unk_1008CACA8;
    handler[4] = self;
    notify_register_dispatch("com.apple.backboardd.backlight.changed", &self->_backlightLevelToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  }
}

- (void)installAirplaneModeMonitor
{
  BOOL v3 = (RadiosPreferences *)objc_alloc_init((Class)RadiosPreferences);
  radiosPreferences = self->_radiosPreferences;
  self->_radiosPreferences = v3;

  CFArrayRef v5 = self->_radiosPreferences;

  [(RadiosPreferences *)v5 setDelegate:self];
}

- (void)airplaneModeChanged
{
}

- (void)d2dEncryptionAvailableWithCompletionHandler:(id)a3
{
}

- (void)d2dEncryptionChanged
{
  id v2 = daemon_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Device to device encryption status changed", v3, 2u);
  }
}

- (void)installD2DEncryptionMonitor
{
  id location = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  BOOL v3 = [(SDStatusMonitor *)self systemMonitor];
  [v3 setManateeChangedHandler:&v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)bluetoothAddressChanged
{
  id v2 = daemon_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Bluetooth address changed", v3, 2u);
  }
}

- (void)installBluetoothMonitor
{
  if (!self->_bluetoothController)
  {
    BOOL v3 = (CBController *)objc_alloc_init((Class)CBController);
    bluetoothController = self->_bluetoothController;
    self->_bluetoothController = v3;

    id location = 0;
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001EF2EC;
    v13[3] = &unk_1008CA3B0;
    objc_copyWeak(&v14, &location);
    [(CBController *)self->_bluetoothController setBluetoothStateChangedHandler:v13];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_1001EF32C;
    v11[3] = &unk_1008CA3B0;
    objc_copyWeak(&v12, &location);
    [(CBController *)self->_bluetoothController setInvalidationHandler:v11];
    id v5 = self->_bluetoothController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001EF36C;
    v9[3] = &unk_1008CE8C0;
    objc_copyWeak(&v10, &location);
    [(CBController *)v5 activateWithCompletion:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  id location = 0;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001EF3C8;
  v7[3] = &unk_1008CA3B0;
  objc_copyWeak(&v8, &location);
  CFArrayRef v6 = [(SDStatusMonitor *)self systemMonitor];
  [v6 setBluetoothAddressChangedHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)bluetoothStateChanged
{
  BOOL v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = (unint64_t)[(CBController *)self->_bluetoothController bluetoothState];
    if (v4 > 0xA) {
      id v5 = "?";
    }
    else {
      id v5 = off_1008D0C10[v4];
    }
    int v6 = 136315138;
    int v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bluetooth state changed %s", (uint8_t *)&v6, 0xCu);
  }

  [(SDStatusMonitor *)self updateDiscoverableMode];
  [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.BluetoothPowerChanged"];
}

- (void)bluetoothActivatedWithError:(id)a3
{
  id v4 = a3;
  id v5 = daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth controller failed to activate - error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth controller activated", (uint8_t *)&v7, 2u);
    }

    [(SDStatusMonitor *)self bluetoothStateChanged];
  }
}

- (void)bluetoothDidSetPowerStateWithError:(id)a3
{
  id v3 = a3;
  id v4 = daemon_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      BOOL v6 = "Bluetooth controller failed to set power state - error: %@";
      int v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    BOOL v6 = "Bluetooth controller set power state";
    int v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

- (void)bluetoothMonitorInvalidated
{
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bluetooth controller invalidated, retry in 5 seconds", v5, 2u);
  }

  bluetoothController = self->_bluetoothController;
  self->_bluetoothController = 0;

  [(SDStatusMonitor *)self retryInstallBluetoothMonitor];
}

- (void)retryInstallBluetoothMonitor
{
  id location = 0;
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001EF804;
  v3[3] = &unk_1008CA3B0;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)installBonjourNameMonitor
{
  if (!self->_nameMonitor)
  {
    p_nameMonitor = &self->_nameMonitor;
    if (DNSServiceRegister(&self->_nameMonitor, 0, 0xFFFFFFFF, 0, "_whats-my-name._tcp.", "local.", 0, 0, 0, 0, (DNSServiceRegisterReply)sub_1001EF92C, self))
    {
      id v3 = daemon_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_1001F54A8();
      }
    }
    else
    {
      if (!DNSServiceSetDispatchQueue(*p_nameMonitor, (dispatch_queue_t)&_dispatch_main_q)) {
        return;
      }
      id v3 = daemon_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_1001F5440();
      }
    }
  }
}

- (void)uninstallBonjourNameMonitor
{
  nameMonitor = self->_nameMonitor;
  if (nameMonitor)
  {
    DNSServiceRefDeallocate(nameMonitor);
    self->_nameMonitor = 0;
  }
}

- (void)restartBonjourNameMonitor
{
  pthread_mutex_lock(&stru_100969508);
  [(SDStatusMonitor *)self uninstallBonjourNameMonitor];
  [(SDStatusMonitor *)self installBonjourNameMonitor];

  pthread_mutex_unlock(&stru_100969508);
}

- (void)carplayMonitorDiedNotification:(id)a3
{
  id v4 = daemon_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarPlay server crashed", v5, 2u);
  }

  [(SDStatusMonitor *)self uninstallCarPlayStatusMonitor];
  [(SDStatusMonitor *)self installCarPlayStatusMonitor];
  [(SDStatusMonitor *)self carplayStatusNotification:0];
}

- (void)carplayStatusNotification:(id)a3
{
  id v4 = [(objc_class *)off_100969568() sharedAVSystemController];
  BOOL v5 = off_100969570();
  BOOL v6 = [v4 attributeForKey:v5];
  unsigned int v7 = [v6 BOOLValue];

  uint32_t v8 = daemon_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = "on";
    if (self->_carplayConnected) {
      id v10 = "on";
    }
    else {
      id v10 = "off";
    }
    if (!v7) {
      int v9 = "off";
    }
    int v11 = 136315394;
    id v12 = v10;
    __int16 v13 = 2080;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CarPlay status changed: %s -> %s", (uint8_t *)&v11, 0x16u);
  }

  self->_carplayConnected = v7;
  [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.CarPlayStatusChanged"];
}

- (void)installCarPlayStatusMonitor
{
  id v3 = [(objc_class *)off_100969568() sharedAVSystemController];
  id v4 = off_100969578();
  v13[0] = v4;
  BOOL v5 = off_100969580();
  v13[1] = v5;
  BOOL v6 = +[NSArray arrayWithObjects:v13 count:2];

  unsigned int v7 = off_100969588();
  [v3 setAttribute:v6 forKey:v7 error:0];

  uint32_t v8 = +[NSNotificationCenter defaultCenter];
  int v9 = off_100969578();
  [v8 addObserver:self selector:"carplayMonitorDiedNotification:" name:v9 object:0];

  id v10 = off_100969580();
  [v8 addObserver:self selector:"carplayStatusNotification:" name:v10 object:0];

  int v11 = off_100969570();
  id v12 = [v3 attributeForKey:v11];
  self->_carplayConnected = [v12 BOOLValue];
}

- (void)installWirelessCarPlayMonitor
{
  pthread_mutex_lock(&stru_100969508);
  carKitSessionStatus = self->_carKitSessionStatus;
  if (!carKitSessionStatus)
  {
    id v4 = (CARSessionStatus *)objc_alloc_init((Class)CARSessionStatus);
    BOOL v5 = self->_carKitSessionStatus;
    self->_carKitSessionStatus = v4;

    carKitSessionStatus = self->_carKitSessionStatus;
  }
  [(CARSessionStatus *)carKitSessionStatus setSessionObserver:self];

  pthread_mutex_unlock(&stru_100969508);
}

- (BOOL)isCarKitSessionWireless:(id)a3
{
  id v3 = [a3 configuration];
  BOOL v4 = [v3 transportType] == (id)3;

  return v4;
}

- (void)handleCarKitSessionStateChanged:(id)a3
{
  if ([(SDStatusMonitor *)self isCarKitSessionWireless:a3])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001EFE94;
    block[3] = &unk_1008CA4B8;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)sessionDidConnect:(id)a3
{
  [(SDStatusMonitor *)self handleCarKitSessionStateChanged:a3];
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CarPlay session connected.", v4, 2u);
  }
}

- (void)sessionDidDisconnect:(id)a3
{
  [(SDStatusMonitor *)self handleCarKitSessionStateChanged:a3];
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CarPlay session disconnected.", v4, 2u);
  }
}

- (void)uninstallCarPlayStatusMonitor
{
  id v5 = +[NSNotificationCenter defaultCenter];
  id v3 = off_100969578();
  [v5 removeObserver:self name:v3 object:0];

  BOOL v4 = off_100969580();
  [v5 removeObserver:self name:v4 object:0];

  self->_carplayConnected = 0;
}

- (void)installSmartCoverStatusMonitor
{
  id v3 = objc_alloc_init(SDSmartCoverMonitor);
  smartCoverMonitor = self->_smartCoverMonitor;
  self->_smartCoverMonitor = v3;
}

- (void)contactStoreDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F0158;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)meCardChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F0254;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)installContactsMonitor
{
  id v3 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
  contactStore = self->_contactStore;
  self->_contactStore = v3;

  id v5 = +[SDAirDropContactHashManager shared];
  contactHashManager = self->_contactHashManager;
  self->_contactHashManager = v5;

  unsigned int v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDStatusMonitor installContactsMonitor]");
  [(SDStatusMonitor *)self resetMeCardWithReason:v7];

  uint32_t v8 = +[NSNotificationCenter defaultCenter];
  int v9 = +[SDAirDropContactHashManager kStatusContactsHashesChanged];
  [v8 addObserver:self selector:"contactStoreDidChange:" name:v9 object:0];

  id v11 = +[NSNotificationCenter defaultCenter];
  id v10 = +[SDAirDropContactHashManager kStatusMeCardChanged];
  [v11 addObserver:self selector:"meCardChanged:" name:v10 object:0];
}

- (void)installCoreTelephonyMonitor
{
  self->_coreTelephonyServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  id v3 = objc_alloc((Class)CoreTelephonyClient);
  BOOL v4 = CUMainQueue();
  id v5 = (CoreTelephonyClient *)[v3 initWithQueue:v4];
  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = v5;

  [(CoreTelephonyClient *)self->_coreTelephonyClient setDelegate:self];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001F0508;
  v7[3] = &unk_1008D0960;
  void v7[4] = self;
  [(SDStatusMonitor *)self fetchSubscriptionContextWithCompletion:v7];
}

- (void)fetchSubscriptionContextWithCompletion:(id)a3
{
  id v4 = a3;
  coreTelephonyClient = self->_coreTelephonyClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001F0620;
  v7[3] = &unk_1008D0988;
  id v8 = v4;
  id v6 = v4;
  [(CoreTelephonyClient *)coreTelephonyClient getPreferredDataSubscriptionContext:v7];
}

- (void)fetchLTEShows4GWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
  coreTelephonyClient = self->_coreTelephonyClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001F07F8;
  v7[3] = &unk_1008D09B0;
  void v7[4] = self;
  [(CoreTelephonyClient *)coreTelephonyClient copyCarrierBundleValueWithDefault:v4 key:@"DataIndicatorOverrideForLTE" bundleType:v5 completion:v7];
}

- (void)fetchSIMStatusWithContext:(id)a3
{
  coreTelephonyClient = self->_coreTelephonyClient;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001F0924;
  v4[3] = &unk_1008D09D8;
  v4[4] = self;
  [(CoreTelephonyClient *)coreTelephonyClient getSIMStatus:a3 completion:v4];
}

- (void)fetchDataStatusWithContext:(id)a3
{
  coreTelephonyClient = self->_coreTelephonyClient;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001F0A10;
  v4[3] = &unk_1008D0A00;
  v4[4] = self;
  [(CoreTelephonyClient *)coreTelephonyClient getDataStatus:a3 completion:v4];
}

- (void)fetchSignalStrengthWithContext:(id)a3
{
  coreTelephonyClient = self->_coreTelephonyClient;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001F0AFC;
  v4[3] = &unk_1008D0A28;
  v4[4] = self;
  [(CoreTelephonyClient *)coreTelephonyClient getSignalStrengthInfo:a3 completion:v4];
}

- (void)updateLTEShows4G:(BOOL)a3
{
  BOOL v3 = a3;
  pthread_mutex_lock(&stru_100969508);
  if (self->_coreTelephonyLTEShows4G != v3)
  {
    id v5 = daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating LTE shows 4G %@", (uint8_t *)&v7, 0xCu);
    }

    self->_coreTelephonyLTEShows4G = v3;
  }
  pthread_mutex_unlock(&stru_100969508);
}

- (void)updateSIMStatus:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100969508);
  if ([(NSString *)self->_coreTelephonySIMStatus isEqualToString:v4])
  {
    unsigned int v5 = 0;
  }
  else
  {
    uint64_t v6 = kCTSIMSupportSIMStatusReady;
    if ([(NSString *)self->_coreTelephonySIMStatus isEqualToString:kCTSIMSupportSIMStatusReady]) {
      unsigned int v5 = 1;
    }
    else {
      unsigned int v5 = [v4 isEqualToString:v6];
    }
  }
  if (![(NSString *)self->_coreTelephonySIMStatus isEqualToString:v4])
  {
    int v7 = daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating SIM status %@", (uint8_t *)&v9, 0xCu);
    }
  }
  coreTelephonySIMStatus = self->_coreTelephonySIMStatus;
  self->_coreTelephonySIMStatus = (NSString *)v4;

  pthread_mutex_unlock(&stru_100969508);
  if (v5) {
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.SIMStateChanged"];
  }
}

- (void)updateDataStatus:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100969508);
  if ([v4 isEqual:self->_coreTelephonyDataStatus])
  {
    pthread_mutex_unlock(&stru_100969508);
  }
  else
  {
    unsigned int v5 = daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating data status %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = (CTDataStatus *)[v4 copy];
    coreTelephonyDataStatus = self->_coreTelephonyDataStatus;
    self->_coreTelephonyDataStatus = v6;

    pthread_mutex_unlock(&stru_100969508);
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.SIMDataChanged"];
  }
}

- (void)updateSignalStrength:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&stru_100969508);
  unsigned int v5 = [v4 displayBars];
  if ([(NSNumber *)self->_coreTelephonySignalStrength isEqualToNumber:v5])
  {
    pthread_mutex_unlock(&stru_100969508);
  }
  else
  {
    uint64_t v6 = daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      id v10 = [v5 integerValue];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating signal strength %ld bars", (uint8_t *)&v9, 0xCu);
    }

    int v7 = [v4 displayBars];
    coreTelephonySignalStrength = self->_coreTelephonySignalStrength;
    self->_coreTelephonySignalStrength = v7;

    pthread_mutex_unlock(&stru_100969508);
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.SignalStrengthChanged"];
  }
}

- (void)subscriptionInfoDidChange
{
  BOOL v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CoreTelephony subscription info changed", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001F10B4;
  v4[3] = &unk_1008D0960;
  v4[4] = self;
  [(SDStatusMonitor *)self fetchSubscriptionContextWithCompletion:v4];
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001F11A0;
  v4[3] = &unk_1008D0960;
  v4[4] = self;
  -[SDStatusMonitor fetchSubscriptionContextWithCompletion:](self, "fetchSubscriptionContextWithCompletion:", v4, a4);
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001F1220;
  v4[3] = &unk_1008D0960;
  v4[4] = self;
  -[SDStatusMonitor fetchSubscriptionContextWithCompletion:](self, "fetchSubscriptionContextWithCompletion:", v4, a4);
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001F12A0;
  v4[3] = &unk_1008D0960;
  v4[4] = self;
  -[SDStatusMonitor fetchSubscriptionContextWithCompletion:](self, "fetchSubscriptionContextWithCompletion:", v4, a4);
}

- (void)handleDynamicStoreCallback:(__SCDynamicStore *)a3 changedKeys:(__CFArray *)a4
{
  CFStringRef cf2 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, @"awdl0", kSCEntNetLink);
  CFStringRef v6 = SCDynamicStoreKeyCreate(0, @"%@/%@/%@", kSCDynamicStoreDomainState, kSCCompNetwork, @"MulticastDNS");
  CFStringRef ComputerName = SCDynamicStoreKeyCreateComputerName(0);
  CFStringRef HostNames = SCDynamicStoreKeyCreateHostNames(0);
  CFIndex Count = CFArrayGetCount(a4);
  if (Count < 1) {
    goto LABEL_21;
  }
  CFIndex v10 = Count;
  uint64_t v16 = 0;
  char v11 = 0;
  char v12 = 0;
  for (CFIndex i = 0; i != v10; ++i)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a4, i);
    if (CFEqual(ValueAtIndex, ComputerName))
    {
      [(SDStatusMonitor *)self clearComputerName];
      char v11 = 1;
    }
    else if (CFEqual(ValueAtIndex, HostNames))
    {
      [(SDStatusMonitor *)self clearLocalHostName];
      char v12 = 1;
    }
    else if (CFEqual(ValueAtIndex, v6))
    {
      BYTE4(v16) = 1;
    }
    else if (CFEqual(ValueAtIndex, cf2))
    {
      LOBYTE(v16) = 1;
    }
    else
    {
      CFStringRef v15 = daemon_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v19 = a4;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "SDStatusMonitor: Unknown keys changed (%@)", buf, 0xCu);
      }
    }
  }
  if ((v16 & 0x100000000) != 0)
  {
    [(SDStatusMonitor *)self restartBonjourNameMonitor];
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.MulticastDNSChanged"];
  }
  if ((v16 & 1) == 0)
  {
    if ((v12 & 1) == 0) {
      goto LABEL_19;
    }
LABEL_23:
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.LocalHostNameChanged"];
    if ((v11 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.AirDropLinkStateChanged"];
  if (v12) {
    goto LABEL_23;
  }
LABEL_19:
  if (v11) {
LABEL_20:
  }
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.ComputerNameChanged"];
LABEL_21:
  CFRelease(ComputerName);
  CFRelease(HostNames);
  CFRelease(v6);
  CFRelease(cf2);
}

- (void)installDynamicStoreCallBack
{
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = self;
  SCDynamicStoreRef v3 = SCDynamicStoreCreate(0, @"com.apple.sharingd", (SCDynamicStoreCallBack)sub_1001F177C, &context);
  if (v3)
  {
    id v4 = v3;
    CFStringRef HostNames = SCDynamicStoreKeyCreateHostNames(0);
    CFStringRef ComputerName = SCDynamicStoreKeyCreateComputerName(0);
    CFStringRef v7 = SCDynamicStoreKeyCreate(0, @"%@/%@/%@", kSCDynamicStoreDomainState, kSCCompNetwork, @"MulticastDNS");
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, @"awdl0", kSCEntNetLink);
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, HostNames);
    CFArrayAppendValue(Mutable, ComputerName);
    CFArrayAppendValue(Mutable, v7);
    CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
    if (SCDynamicStoreSetNotificationKeys(v4, Mutable, 0))
    {
      RunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v4, 0);
      self->_dynamicStoreSource = RunLoopSource;
      if (RunLoopSource)
      {
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, self->_dynamicStoreSource, kCFRunLoopDefaultMode);
LABEL_13:
        CFRelease(HostNames);
        CFRelease(ComputerName);
        CFRelease(v7);
        CFRelease(NetworkInterfaceEntity);
        CFRelease(Mutable);
        CFRelease(v4);
        return;
      }
      __int16 v13 = daemon_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001F5810();
      }
    }
    else
    {
      __int16 v13 = daemon_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001F5794();
      }
    }

    goto LABEL_13;
  }
  char v12 = daemon_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1001F5718();
  }
}

- (void)installKeyBagUnlockMonitor
{
  if (!self->_keyBagUnlockToken)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001F1824;
    handler[3] = &unk_1008CACA8;
    handler[4] = self;
    notify_register_dispatch(kMobileKeyBagLockStatusNotifyToken, &self->_keyBagUnlockToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  }
}

- (void)installLocaleChangeMonitor
{
  SCDynamicStoreRef v3 = [[SDDeferrableOperation alloc] initWithIdentifier:@"preventExitForLocaleChange" queue:&_dispatch_main_q operation:&stru_1008D0A68];
  preventLocaleRestart = self->_preventLocaleRestart;
  self->_preventLocaleRestart = v3;

  LocalCenter = CFNotificationCenterGetLocalCenter();

  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_1001F19E8, kCFLocaleCurrentLocaleDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)installManagedConfigurationMonitor
{
  SCDynamicStoreRef v3 = +[MCProfileConnection sharedConnection];
  [v3 addObserver:self];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"managedConfigurationSettingsChanged:" name:MCEffectiveSettingsChangedNotification object:0];

  [(SDStatusMonitor *)self managedConfigurationSettingsChanged:0];
}

- (void)managedConfigurationSettingsChanged:(id)a3
{
  [(SDStatusMonitor *)self updateAirDropAllowed];
  [(SDStatusMonitor *)self updatePersonalHotspotAllowed];

  [(SDStatusMonitor *)self updateBlacklistedAppBundleIDs];
}

- (void)updateBlacklistedAppBundleIDs
{
  SCDynamicStoreRef v3 = +[MCProfileConnection sharedConnection];
  id v4 = [v3 effectiveBlockedAppBundleIDs];

  effectiveBlockedAppBundleIDs = self->_effectiveBlockedAppBundleIDs;
  int v8 = v4;
  CFStringRef v6 = effectiveBlockedAppBundleIDs;
  if (v8 == v6)
  {

    goto LABEL_8;
  }
  if ((v8 == 0) == (v6 != 0))
  {

    goto LABEL_7;
  }
  unsigned __int8 v7 = [(NSSet *)v8 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_effectiveBlockedAppBundleIDs, v4);
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.BlacklistedAppsChanged"];
  }
LABEL_8:
}

- (void)handleNameMonitorCallBack:(const char *)a3 flags:(unsigned int)a4 error:(int)a5
{
  char v6 = a4;
  pthread_mutex_lock(&stru_100969508);
  if (a5)
  {
    int v9 = daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001F588C();
    }

    DNSServiceRefDeallocate(self->_nameMonitor);
    self->_nameMonitor = 0;
  }
  else if ((v6 & 2) != 0)
  {
    CFIndex v10 = (__CFString *)CFStringCreateWithCString(0, a3, 0x8000100u);
    if (sub_1000D9194(self->_bonjourName, v10))
    {
      char v11 = (NSString *)[(__CFString *)v10 copy];
      bonjourName = self->_bonjourName;
      self->_bonjourName = v11;
    }
    else
    {
      CFRelease(v10);
    }
  }
  pthread_mutex_unlock(&stru_100969508);
}

- (int64_t)pairedWatchWristState
{
  dispatch_time_t v2 = +[SDPairedDeviceAgent sharedAgent];
  id v3 = [v2 wristState];

  return (int64_t)v3;
}

- (void)updatePairedWatchWristState:(int64_t)a3
{
  unsigned int v5 = daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [(SDStatusMonitor *)self stringForWatchWristState:a3];
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Paired watch wrist state changed: %@", (uint8_t *)&v7, 0xCu);
  }
  [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.PairedWatchWristStateChanged"];
}

- (int)pairedWatchLockState
{
  dispatch_time_t v2 = +[SDPairedDeviceAgent sharedAgent];
  int v3 = [v2 lockState];

  return v3;
}

- (void)updatePairedWatchLockState:(int)a3
{
  unsigned int v5 = daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Paired watch wrist lock changed: %d", (uint8_t *)v6, 8u);
  }

  [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.PairedWatchLockStateChanged"];
}

- (void)installMISMonitor
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleMISStateChanged:" name:@"com.apple.sharingd.HotspotMISStateChanged" object:0];
}

- (void)handleMISStateChanged:(id)a3
{
  id v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating discoverable mode for personal hotspot change", v5, 2u);
  }

  [(SDStatusMonitor *)self updateDiscoverableMode];
}

- (void)updateLocalPowerSource:(id)a3
{
  id v4 = CUMainQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F211C;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (SFPowerSource)localPowerSource
{
  dispatch_time_t v2 = +[SDPairedDeviceAgent sharedAgent];
  id v3 = [v2 powerSource];

  return (SFPowerSource *)v3;
}

- (void)handleSleepWakeCallBack:(unsigned int)a3 messageArguement:(void *)a4
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
      int v7 = daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device can sleep", buf, 2u);
      }

      goto LABEL_8;
    case 1u:
      int v8 = daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device will sleep", v14, 2u);
      }

      [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.SystemWillSleep"];
LABEL_8:
      IOAllowPowerChange(self->_rootPort, (intptr_t)a4);
      return;
    case 2u:
      int v9 = daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device will not sleep", v12, 2u);
      }

      CFStringRef v10 = @"com.apple.sharingd.SystemWillNotSleep";
      goto LABEL_15;
    case 9u:
      char v11 = daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Device has powered on", v13, 2u);
      }

      CFStringRef v10 = @"com.apple.sharingd.SystemHasPoweredOn";
LABEL_15:
      [(SDStatusMonitor *)self postNotification:v10];
      break;
    default:
      return;
  }
}

- (void)installSleepWakeCallBack
{
  int DeviceClass = GestaltGetDeviceClass();
  if (self->_notifyPortRef) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = DeviceClass == 4;
  }
  if (!v4)
  {
    p_notifyPortRef = &self->_notifyPortRef;
    io_connect_t v6 = IORegisterForSystemPower(self, &self->_notifyPortRef, (IOServiceInterestCallback)j__objc_msgSend_handleSleepWakeCallBack_messageArguement_, &self->_notifierObject);
    self->_rootPort = v6;
    if (v6)
    {
      Main = CFRunLoopGetMain();
      RunLoopSource = IONotificationPortGetRunLoopSource(*p_notifyPortRef);
      CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
    }
    else
    {
      int v9 = daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1001F58F4();
      }
    }
  }
}

- (void)reloadSMBConfInfo
{
  pthread_mutex_lock(&stru_100969508);
  smbPreferences = self->_smbPreferences;
  id v11 = 0;
  id v12 = 0;
  unsigned __int8 v4 = [(SDStatusMonitor *)self smbConfiguration:smbPreferences netBiosName:&v12 workgroup:&v11];
  id v5 = v12;
  id v6 = v12;
  id v7 = v11;
  id v8 = v11;
  if (v4)
  {
    BOOL v9 = sub_1000D9194(self->_netbiosName, v6);
    if (v9) {
      objc_storeStrong((id *)&self->_netbiosName, v5);
    }
    if (sub_1000D9194(self->_workgroup, v8))
    {
      objc_storeStrong((id *)&self->_workgroup, v7);
      pthread_mutex_unlock(&stru_100969508);
      if (v9) {
        [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.NetbiosNameChanged"];
      }
      CFStringRef v10 = @"com.apple.sharingd.WorkgroupChanged";
      goto LABEL_11;
    }
    pthread_mutex_unlock(&stru_100969508);
    if (v9)
    {
      CFStringRef v10 = @"com.apple.sharingd.NetbiosNameChanged";
LABEL_11:
      [(SDStatusMonitor *)self postNotification:v10];
    }
  }
  else
  {
    pthread_mutex_unlock(&stru_100969508);
  }
}

- (BOOL)smbConfiguration:(__SCPreferences *)a3 netBiosName:(id *)a4 workgroup:(id *)a5
{
  return 0;
}

- (void)installSpringBoardStateMonitor
{
}

- (void)installBacklightServicesMonitor
{
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Installing backlight services monitor", v5, 2u);
  }

  unsigned __int8 v4 = [(objc_class *)off_100969560() sharedBacklight];
  [v4 addObserver:self];
}

- (void)backlight:(id)a3 activatingWithEvent:(id)a4
{
  id v5 = daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1001F599C();
  }

  [(SDStatusMonitor *)self screenOnStateChangedTo:1];
}

- (void)backlight:(id)a3 deactivatingWithEvent:(id)a4
{
  id v5 = daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1001F59D0();
  }

  [(SDStatusMonitor *)self screenOnStateChangedTo:0];
}

- (void)screenOnStateChangedTo:(BOOL)a3
{
  BOOL v3 = a3;
  if (!CFPrefs_GetInt64())
  {
    pthread_mutex_lock(&stru_100969508);
    screenOn = self->_screenOn;
    if (screenOn)
    {
      unsigned int v6 = [(NSNumber *)screenOn BOOLValue];
      id v7 = +[NSNumber numberWithBool:v3];
      id v8 = self->_screenOn;
      self->_screenOn = v7;

      pthread_mutex_unlock(&stru_100969508);
      if (v6 == v3) {
        return;
      }
    }
    else
    {
      BOOL v9 = +[NSNumber numberWithBool:v3];
      CFStringRef v10 = self->_screenOn;
      self->_screenOn = v9;

      pthread_mutex_unlock(&stru_100969508);
    }
    id v11 = daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [(NSNumber *)self->_screenOn BOOLValue];
      CFStringRef v13 = @"Off";
      if (v12) {
        CFStringRef v13 = @"On";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Screen state changed to %@", buf, 0xCu);
    }

    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.ScreenStateChanged"];
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  id v8 = daemon_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1001F5A04(self, a4, v8);
  }

  if (CFPrefs_GetInt64())
  {
    pthread_mutex_lock(&stru_100969508);
    BOOL v9 = [(SDStatusMonitor *)self isScreenOnForBacklightState:a4];
    screenOn = self->_screenOn;
    if (screenOn)
    {
      unsigned int v11 = [(NSNumber *)screenOn BOOLValue];
      unsigned int v12 = +[NSNumber numberWithBool:v9];
      CFStringRef v13 = self->_screenOn;
      self->_screenOn = v12;

      pthread_mutex_unlock(&stru_100969508);
      if (v9 == v11) {
        return;
      }
    }
    else
    {
      id v14 = +[NSNumber numberWithBool:v9];
      CFStringRef v15 = self->_screenOn;
      self->_screenOn = v14;

      pthread_mutex_unlock(&stru_100969508);
    }
    uint64_t v16 = daemon_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = [(NSNumber *)self->_screenOn BOOLValue];
      CFStringRef v18 = @"Off";
      if (v17) {
        CFStringRef v18 = @"On";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Screen state changed to %@", buf, 0xCu);
    }

    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.ScreenStateChanged"];
  }
}

- (BOOL)isScreenOnForBacklightState:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
  {
    uint64_t v9 = v3;
    uint64_t v10 = v4;
    unsigned int v6 = daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unknown backlight state, please file a radar to Sharing | all", v8, 2u);
    }

    LOBYTE(v5) = 1;
  }
  else
  {
    return (0xCu >> (a3 & 0xF)) & 1;
  }
  return v5;
}

- (void)installSystemUIMonitor
{
  if (!self->_systemUIMonitor)
  {
    v8[0] = FBSDisplayLayoutElementControlCenterIdentifier;
    v8[1] = FBSDisplayLayoutElementLockScreenIdentifier;
    v9[0] = &off_100902E38;
    v9[1] = &off_100902E50;
    v8[2] = FBSDisplayLayoutElementNotificationCenterIdentifier;
    v8[3] = FBSDisplayLayoutElementSiriIdentifier;
    v9[2] = &off_100902E68;
    v9[3] = &off_100902E80;
    v8[4] = SBSDisplayLayoutElementHomeScreenIdentifier;
    v8[5] = SBSDisplayLayoutElementAppSwitcherIdentifier;
    void v9[4] = &off_100902E98;
    v9[5] = &off_100902EB0;
    v8[6] = SBSDisplayLayoutElementSpotlightIdentifier;
    v8[7] = SBSDisplayLayoutElementNowPlayingIdentifier;
    v9[6] = &off_100902EC8;
    v9[7] = &off_100902EE0;
    v8[8] = SBSDisplayLayoutElementCarPlayOEMIdentifier;
    v8[9] = SBSDisplayLayoutElementLoginIdentifier;
    v9[8] = &off_100902EF8;
    v9[9] = &off_100902F10;
    v8[10] = SBSDisplayLayoutElementPasscodeIdentifier;
    v8[11] = SBSDisplayLayoutElementTodayViewIdentifier;
    v9[10] = &off_100902F28;
    v9[11] = &off_100902F40;
    v8[12] = SBSDisplayLayoutElementLockScreenNavigationIdentifier;
    v8[13] = @"SBVoiceControlAlert";
    v9[12] = &off_100902F58;
    v9[13] = &off_100902F70;
    v8[14] = @"com.apple.SharingViewService";
    v8[15] = @"com.apple.camera";
    v9[14] = &off_100902F88;
    v9[15] = &off_100902FA0;
    uint8_t v8[16] = @"com.apple.InCallService";
    v8[17] = @"com.apple.CoreAuthUI";
    v9[16] = &off_100902FB8;
    v9[17] = &off_100902FD0;
    v8[18] = @"com.apple.purplebuddy";
    v8[19] = @"SBSpotlightAlert";
    v9[18] = &off_100902FE8;
    v9[19] = &off_100902EC8;
    uint64_t v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:20];
    uint64_t v4 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
    [v4 setNeedsUserInteractivePriority:1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000B0B4;
    v7[3] = &unk_1008D0AB8;
    void v7[4] = v3;
    void v7[5] = self;
    [v4 setTransitionHandler:v7];
    BOOL v5 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v4];
    systemUIMonitor = self->_systemUIMonitor;
    self->_systemUIMonitor = v5;
  }
}

- (void)installMirroringMonitor
{
  uint64_t v3 = +[FBSDisplayLayoutMonitorConfiguration configurationForContinuityDisplay];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1001F3060;
  v6[3] = &unk_1008D0AE0;
  v6[4] = self;
  [v3 setTransitionHandler:v6];
  uint64_t v4 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v3];
  mirroringMonitor = self->_mirroringMonitor;
  self->_mirroringMonitor = v4;
}

- (void)installUILockStatusMonitor
{
  if (!self->_uiLockStatusToken)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001F320C;
    handler[3] = &unk_1008CACA8;
    handler[4] = self;
    notify_register_dispatch(kSBSLockStateNotifyKey, &self->_uiLockStatusToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  }
}

- (void)installUltraWideBandStateMonitor
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleRapportStatusChanged" name:@"com.apple.sharingd.RapportStatusChanged" object:0];
}

- (void)handleRapportStatusChanged
{
}

- (unint64_t)ultraWideBandState
{
  dispatch_time_t v2 = +[SDRapportBrowser sharedRapportBrowser];
  id v3 = [v2 ultraWideBandState];

  return (unint64_t)v3;
}

- (void)updateWatchWristState:(int64_t)a3
{
  int64_t watchWristState = self->_watchWristState;
  self->_int64_t watchWristState = a3;
  if (watchWristState != a3)
  {
    unsigned int v6 = daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(SDStatusMonitor *)self stringForWatchWristState:a3];
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Watch wrist state changed: %@", (uint8_t *)&v8, 0xCu);
    }
    [(SDStatusMonitor *)self postNotification:@"com.apple.sharingd.WristStateChanged"];
  }
}

- (int64_t)watchWristState
{
  return self->_watchWristState;
}

- (id)stringForWatchWristState:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unexpected";
  }
  else {
    return *(&off_1008D0C68 + a3);
  }
}

- (void)handleWiFiPasswordSharingChanged
{
  dispatch_time_t v2 = (const char *)[SFPasswordSharingAvailabilityNotification UTF8String];

  notify_post(v2);
}

- (void)installWiFiPasswordSharingMonitor
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleWiFiPasswordSharingChanged" name:@"com.apple.sharingd.BluetoothPowerChanged" object:0];

  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleWiFiPasswordSharingChanged" name:@"com.apple.sharingd.AppleIDChanged" object:0];

  BOOL v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleWiFiPasswordSharingChanged" name:@"com.apple.sharingd.AppleAccountSignIn" object:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"handleWiFiPasswordSharingChanged" name:@"com.apple.sharingd.AppleAccountSignOut" object:0];
}

- (void)installSSIDCacheMonitor
{
  id v3 = SCPreferencesCreateWithAuthorization(0, @"com.apple.sharingd", @"com.apple.wifi.plist", 0);
  if (v3)
  {
    uint64_t v4 = v3;
    v9.version = 0;
    memset(&v9.retain, 0, 24);
    v9.info = self;
    int v5 = SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_1001F37B8, &v9);
    SCPreferencesSetDispatchQueue(v4, (dispatch_queue_t)&_dispatch_main_q);
    id v6 = daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = "yes";
      if (!v5) {
        id v7 = "no";
      }
      *(_DWORD *)buf = 136315138;
      unsigned int v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SSID cache monitor successfully installed: %s", buf, 0xCu);
    }

    CFRelease(v4);
  }
  else
  {
    int v8 = daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001F5B14();
    }
  }
}

- (void)clearWirelessState
{
  pthread_mutex_lock(&stru_100969508);
  deviceSupportsWAPI = self->_deviceSupportsWAPI;
  self->_deviceSupportsWAPI = 0;

  pthread_mutex_unlock(&stru_100969508);
}

- (void)logWiFiPowerState
{
  id v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(SDStatusMonitor *)self wirelessEnabled];
    int v5 = "off";
    if (v4) {
      int v5 = "on";
    }
    int v6 = 136315138;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Wi-Fi power is now %s", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)_isEveryoneModeExpired
{
  dispatch_time_t v2 = [(SDStatusMonitor *)self _everyoneModeExpiryDate];
  if (v2)
  {
    id v3 = +[NSDate now];
    unsigned int v4 = [v3 laterDate:v2];
    unsigned __int8 v5 = [v4 isEqualToDate:v3];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (id)_everyoneModeExpiryDate
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 objectForKey:@"EveryoneModeUpdateTime"];

  if (!v4)
  {
    unsigned __int8 v5 = daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Everyone mode updated date not present", buf, 2u);
    }
    goto LABEL_8;
  }
  unsigned __int8 v5 = +[NSDate dateWithTimeIntervalSinceNow:1209600.0];
  int v6 = [v4 laterDate:v5];
  unsigned int v7 = [v6 isEqualToDate:v4];

  if (v7)
  {
    int v8 = daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Everyone mode updated date too far in future", v11, 2u);
    }

LABEL_8:
    SCPreferencesContext v9 = 0;
    goto LABEL_10;
  }
  [(SDStatusMonitor *)self _everyoneModeExpiryInterval];
  SCPreferencesContext v9 = [v4 dateByAddingTimeInterval:x0];
LABEL_10:

  return v9;
}

- (void)_checkEveryoneModeExpiry
{
  if (SFDeviceTimeLimitEveryoneMode() && !self->_currentDiscoverableMode)
  {
    id v3 = daemon_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking initial everyone mode expiry", v4, 2u);
    }

    if ([(SDStatusMonitor *)self _isEveryoneModeExpired]) {
      [(SDStatusMonitor *)self _expireEveryoneModeAndOnlySetDefault:1];
    }
    else {
      [(SDStatusMonitor *)self _scheduleCheckForEveryoneModeExpiry];
    }
  }
}

- (void)_expireEveryoneModeAndOnlySetDefault:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = +[NSUserDefaults standardUserDefaults];
  uint64_t v6 = kSFOperationDiscoverableModeKey;
  unsigned int v7 = [v5 objectForKey:kSFOperationDiscoverableModeKey];

  unsigned int v8 = [v7 isEqual:kSFOperationDiscoverableModeEveryone];
  SCPreferencesContext v9 = (void *)kSFOperationDiscoverableModeContactsOnly;
  if (!v8) {
    SCPreferencesContext v9 = v7;
  }
  id v10 = v9;
  unsigned int v11 = daemon_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Everyone mode expired - setting to %@", (uint8_t *)&v13, 0xCu);
  }

  if (v3)
  {
    pthread_mutex_lock(&stru_100969508);
    unsigned int v12 = +[NSUserDefaults standardUserDefaults];
    [v12 setObject:v10 forKey:v6];
    [v12 synchronize];
    pthread_mutex_unlock(&stru_100969508);
  }
  else
  {
    [(SDStatusMonitor *)self setDiscoverableMode:v10];
  }
  [(SDStatusMonitor *)self _cancelCheckForEveryoneModeExpiry];
}

- (void)_updateEveryoneModeExpiryDateOnChange:(id)a3
{
  id v4 = a3;
  if (SFDeviceTimeLimitEveryoneMode())
  {
    if ([v4 isEqual:kSFOperationDiscoverableModeEveryone])
    {
      pthread_mutex_lock(&stru_100969508);
      unsigned __int8 v5 = +[NSDate now];
      uint64_t v6 = +[NSUserDefaults standardUserDefaults];
      [v6 setObject:v5 forKey:@"EveryoneModeUpdateTime"];
      [v6 synchronize];
      pthread_mutex_unlock(&stru_100969508);
      unsigned int v7 = daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        SCPreferencesContext v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating everyone mode updated date %@", (uint8_t *)&v8, 0xCu);
      }

      [(SDStatusMonitor *)self _scheduleCheckForEveryoneModeExpiry];
    }
    else
    {
      [(SDStatusMonitor *)self _cancelCheckForEveryoneModeExpiry];
    }
  }
}

- (void)_scheduleCheckForEveryoneModeExpiry
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:kSFOperationDiscoverableModeKey];

  if (!self->_airDropEveryoneModeExpiryTimer
    && [v4 isEqual:kSFOperationDiscoverableModeEveryone])
  {
    pthread_mutex_lock(&stru_100969508);
    unsigned __int8 v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    airDropEveryoneModeExpiryTimer = self->_airDropEveryoneModeExpiryTimer;
    self->_airDropEveryoneModeExpiryTimer = v5;

    unsigned int v7 = self->_airDropEveryoneModeExpiryTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001F40C8;
    handler[3] = &unk_1008CA4B8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    [(SDStatusMonitor *)self _currentEveryoneModeExpiryInterval];
    double v9 = v8;
    id v10 = daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = +[NSNumber numberWithDouble:v9];
      *(_DWORD *)buf = 138412290;
      id v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Scheduling everyone mode expiry handler for interval %@", buf, 0xCu);
    }
    SFDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_airDropEveryoneModeExpiryTimer);
    pthread_mutex_unlock(&stru_100969508);
  }
}

- (void)_cancelCheckForEveryoneModeExpiry
{
  if (self->_airDropEveryoneModeExpiryTimer)
  {
    pthread_mutex_lock(&stru_100969508);
    BOOL v3 = daemon_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling scheduled everyone mode expiry handler", buf, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_airDropEveryoneModeExpiryTimer);
    airDropEveryoneModeExpiryTimer = self->_airDropEveryoneModeExpiryTimer;
    self->_airDropEveryoneModeExpiryTimer = 0;

    pthread_mutex_unlock(&stru_100969508);
  }
  else
  {
    unsigned __int8 v5 = daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Everyone mode expiry handler already cancelled", v6, 2u);
    }
  }
}

- (double)_everyoneModeExpiryInterval
{
  if (!IsAppleInternalBuild()) {
    return 600.0;
  }
  dispatch_time_t v2 = +[NSUserDefaults standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"EveryoneModeExpiryTimeInterval"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 600.0;
  }

  return v5;
}

- (double)_currentEveryoneModeExpiryInterval
{
  dispatch_time_t v2 = [(SDStatusMonitor *)self _everyoneModeExpiryDate];
  BOOL v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    double v5 = fmax(v4, 0.0);
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (NSDate)lastDeviceUnlockDate
{
  return (NSDate *)objc_getProperty(self, a2, 704, 1);
}

- (NSDate)lastDarkWakeDate
{
  return (NSDate *)objc_getProperty(self, a2, 712, 1);
}

- (NSSet)effectiveBlockedAppBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 720, 1);
}

- (BOOL)computerToComputer
{
  return self->_computerToComputer;
}

- (BOOL)controlCenterVisible
{
  return self->_controlCenterVisible;
}

- (BOOL)multipleUsersLoggedIn
{
  return self->_multipleUsersLoggedIn;
}

- (BOOL)wirelessAccessPoint
{
  return self->_wirelessAccessPoint;
}

- (BOOL)wirelessCritical
{
  return self->_wirelessCritical;
}

- (BOOL)isWifiPersonalHotspot
{
  return self->_isWifiPersonalHotspot;
}

- (BOOL)isUsing2GHzWifi
{
  return self->_isUsing2GHzWifi;
}

- (BOOL)isMirroringActive
{
  return self->_isMirroringActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveBlockedAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_lastDarkWakeDate, 0);
  objc_storeStrong((id *)&self->_lastDeviceUnlockDate, 0);
  objc_storeStrong((id *)&self->___meCard, 0);
  objc_storeStrong((id *)&self->_wifiInterfaceMonitor, 0);
  objc_storeStrong((id *)&self->_mkbOptions, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_mirroringMonitor, 0);
  objc_storeStrong((id *)&self->_systemUIMonitor, 0);
  objc_storeStrong((id *)&self->_coreTelephonySignalStrength, 0);
  objc_storeStrong((id *)&self->_coreTelephonySIMStatus, 0);
  objc_storeStrong((id *)&self->_coreTelephonyDataStatus, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_carKitSessionStatus, 0);
  objc_storeStrong((id *)&self->_bluetoothController, 0);
  objc_storeStrong((id *)&self->_smartCoverMonitor, 0);
  objc_storeStrong((id *)&self->_preventLocaleRestart, 0);
  objc_storeStrong((id *)&self->_workgroup, 0);
  objc_storeStrong((id *)&self->__systemMonitor, 0);
  objc_storeStrong((id *)&self->_ssidHashes, 0);
  objc_storeStrong((id *)&self->_serverNames, 0);
  objc_storeStrong((id *)&self->_screenOn, 0);
  objc_storeStrong((id *)&self->_personalHotspotAllowed, 0);
  objc_storeStrong((id *)&self->_personalHotspotFamilyStates, 0);
  objc_storeStrong((id *)&self->_personalHotspotAutoState, 0);
  objc_storeStrong((id *)&self->_odisksMountPoints, 0);
  objc_storeStrong((id *)&self->_netbiosName, 0);
  objc_storeStrong((id *)&self->_myPhoneHashes, 0);
  objc_storeStrong((id *)&self->_myEmailHashes, 0);
  objc_storeStrong((id *)&self->_myAppleIDCommonName, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_mountPoints, 0);
  objc_storeStrong((id *)&self->_localHostName, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_handoffVisible, 0);
  objc_destroyWeak((id *)&self->_finderServer);
  objc_storeStrong((id *)&self->_deviceUIUnlocked, 0);
  objc_storeStrong((id *)&self->_deviceSupportsWAPI, 0);
  objc_storeStrong((id *)&self->_deviceKeyBagState, 0);
  objc_storeStrong((id *)&self->_deviceInformation, 0);
  objc_storeStrong((id *)&self->_currentDiscoverableMode, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactHashManager, 0);
  objc_storeStrong((id *)&self->_consoleUser, 0);
  objc_storeStrong((id *)&self->_computerName, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_bonjourName, 0);
  objc_storeStrong((id *)&self->_backlightOn, 0);
  objc_storeStrong((id *)&self->_awdlState, 0);
  objc_storeStrong((id *)&self->_nextAirDropID, 0);
  objc_storeStrong((id *)&self->_airDropEveryoneModeExpiryTimer, 0);

  objc_storeStrong((id *)&self->_airDropAllowed, 0);
}

- (BOOL)screenStateSupportsAirDrop
{
  dispatch_time_t v2 = self;
  if ([(SDStatusMonitor *)v2 screenOn]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [(SDStatusMonitor *)v2 isMirroringActive];
  }

  return v3;
}

@end