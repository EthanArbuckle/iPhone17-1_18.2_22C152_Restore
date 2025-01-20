@interface TLToneManager
+ (BOOL)_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath:(id)a3;
+ (BOOL)_migrateLegacyToneSettings;
+ (TLToneManager)sharedToneManager;
+ (id)_abbreviatedDescriptionOfMediaPlaybackArchive:(id)a3;
+ (id)_abbreviatedDescriptionOfToneIdentifierWithUnderlyingMediaPlaybackArchiveForLogging:(id)a3;
+ (id)_currentOverridePolicyPreferenceKeyForAlertType:(int64_t)a3;
+ (id)_defaultToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
+ (id)_defaultWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
+ (id)_systemWideTonePreferenceKeyForAlertType:(int64_t)a3;
+ (void)_migrateLegacyToneSettings;
- (BOOL)_ensureDirectoryExistsAtPath:(id)a3;
- (BOOL)_hasUnderlyingPlaybackArchiveForToneIdentifier:(id)a3;
- (BOOL)_importSyncedToneWithMetadata:(id)a3 fileName:(id)a4;
- (BOOL)_loadITunesRingtoneInfoPlistAtPath:(id)a3;
- (BOOL)_removeAllTones;
- (BOOL)_removeToneFromManifestAtPath:(id)a3 fileName:(id)a4;
- (BOOL)_removeToneWithIdentifier:(id)a3;
- (BOOL)_removeToneWithIdentifier:(id)a3 orSyncIdentifier:(id)a4;
- (BOOL)_removeToneWithSyncIdentifier:(id)a3;
- (BOOL)_removeTonesFromManifestAtPath:(id)a3 fileNames:(id)a4 shouldSkipReload:(BOOL)a5 alreadyLockedManifest:(BOOL)a6 removedEntries:(id *)a7;
- (BOOL)_setToneIdentifierUsingService:(id)a3 keyedByTopic:(id)a4 forPreferenceKey:(id)a5;
- (BOOL)_toneWithIdentifierIsAlarmWakeUp:(id)a3;
- (BOOL)_toneWithIdentifierIsDefaultRingtone:(id)a3;
- (BOOL)_toneWithIdentifierIsITunesRingtone:(id)a3;
- (BOOL)_toneWithIdentifierIsMediaPlaybackArchive:(id)a3;
- (BOOL)_toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:(id)a3;
- (BOOL)_toneWithIdentifierIsNonDefaultSystemRingtone:(id)a3;
- (BOOL)_toneWithIdentifierIsSystemTone:(id)a3;
- (BOOL)_toneWithIdentifierIsValid:(id)a3;
- (BOOL)_transferPurchasedToITunes:(id)a3;
- (BOOL)_wasAffectedByAccidentalToneDeletion;
- (BOOL)_watchPrefersSalientNotifications;
- (BOOL)hasSpecificDefaultToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
- (BOOL)toneWithIdentifierIsValid:(id)a3;
- (NSString)_deviceITunesRingtoneDirectory;
- (NSString)_deviceITunesRingtoneInformationPlist;
- (NSString)_iTunesRingtoneDirectory;
- (NSString)_iTunesRingtoneInformationPlist;
- (NSString)_rootDirectory;
- (NSString)_systemRingtoneDirectory;
- (TLToneManager)init;
- (TLToneManager)initWithITunesRingtonePlistAtPath:(id)a3;
- (double)_unduckTimeForToneIdentifier:(id)a3;
- (id)_addToneEntries:(id)a3 toManifestAtPath:(id)a4 mediaDirectory:(id)a5 shouldSkipReload:(BOOL)a6;
- (id)_addToneToManifestAtPath:(id)a3 metadata:(id)a4 fileName:(id)a5 mediaDirectory:(id)a6;
- (id)_alarmWakeUpRingtoneDirectory;
- (id)_aliasForToneIdentifier:(id)a3;
- (id)_allSyncedTones;
- (id)_baseDirectoryForAlertToneSoundFiles;
- (id)_currentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
- (id)_currentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4 allowsFallbackToDefaultPreferablyNonSilentToneForInvalidPersistedValue:(BOOL)a5;
- (id)_currentToneWatchAlertPolicyPreferenceKeyForAlertType:(int64_t)a3 topic:(id)a4;
- (id)_currentWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4 didFindPersistedWatchToneIdentifier:(BOOL *)a5;
- (id)_currentWatchToneIdentifierPreferenceKeyForAlertType:(int64_t)a3 topic:(id)a4;
- (id)_defaultPreferablyNonSilentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
- (id)_defaultRingtoneName;
- (id)_defaultRingtonePath;
- (id)_fileNameFromToneIdentifier:(id)a3 withPrefix:(id)a4;
- (id)_filePathForToneIdentifier:(id)a3 isValid:(BOOL *)a4;
- (id)_importPurchasedToneWithMetadata:(id)a3 fileName:(id)a4;
- (id)_installedTones;
- (id)_localizedNameOfToneWithIdentifier:(id)a3;
- (id)_nameForToneIdentifier:(id)a3 isValid:(BOOL *)a4;
- (id)_newServiceConnection;
- (id)_previewSoundForToneIdentifier:(id)a3;
- (id)_removeOrphanedPlistEntriesInManifestAtPath:(id)a3 mediaDirectory:(id)a4;
- (id)_soundForToneIdentifier:(id)a3;
- (id)_systemEmbeddedClassicSoundDirectory;
- (id)_systemEmbeddedEncoreInfinitumSoundDirectory;
- (id)_systemEmbeddedModernSoundDirectory;
- (id)_systemEmbeddedSoundDirectory;
- (id)_systemWatchSoundDirectory;
- (id)_toneForSyncIdentifier:(id)a3;
- (id)_toneIdentifierForDeemphasizingAlertWithType:(int64_t)a3 topic:(id)a4 regularToneIdentifier:(id)a5;
- (id)_toneIdentifierForFileAtPath:(id)a3 isValid:(BOOL *)a4;
- (id)_toneIdentifierWithUnderlyingPlaybackArchive:(id)a3;
- (id)_tonePreferencesFromService;
- (id)_toneWithIdentifier:(id)a3;
- (id)_tonesFromManifestPath:(id)a3 mediaDirectoryPath:(id)a4;
- (id)_underlyingPlaybackArchiveForToneIdentifier:(id)a3;
- (id)_unduckTimeNumberForToneIdentifier:(id)a3 fromResourceNamed:(id)a4;
- (id)currentToneIdentifierForAlertType:(int64_t)a3;
- (id)currentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
- (id)currentToneNameForAlertType:(int64_t)a3;
- (id)currentWatchToneIdentifierForAlertType:(int64_t)a3;
- (id)currentWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
- (id)defaultRingtoneIdentifier;
- (id)defaultToneIdentifierForAlertType:(int64_t)a3;
- (id)defaultToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
- (id)defaultWatchToneIdentifierForAlertType:(int64_t)a3;
- (id)defaultWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
- (id)filePathForToneIdentifier:(id)a3;
- (id)nameForToneIdentifier:(id)a3;
- (id)subtitleForToneIdentifier:(id)a3;
- (int)_lockManifestAtPath:(id)a3;
- (int64_t)_currentOverridePolicyForAlertType:(int64_t)a3;
- (int64_t)_currentOverridePolicyForAlertType:(int64_t)a3 didFindAlertOverridePolicy:(BOOL *)a4;
- (int64_t)_currentToneWatchAlertPolicyForAlertType:(int64_t)a3;
- (int64_t)_currentToneWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4;
- (int64_t)_currentToneWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4 didFindPersistedWatchAlertPolicy:(BOOL *)a5;
- (int64_t)_evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone:(BOOL)a3 returningFilePathsForFoundOrphans:(id *)a4 wasAffectedByAccidentalToneDeletion:(BOOL *)a5;
- (int64_t)_removeOrphanedManifestEntriesReturningFilePathsForFoundOrphans:(id *)a3;
- (unint64_t)_installedTonesSize;
- (unsigned)currentToneSoundIDForAlertType:(int64_t)a3;
- (unsigned)currentToneSoundIDForAlertType:(int64_t)a3 topic:(id)a4;
- (void)_didSetTonePreferenceSuccessfullyWithKey:(id)a3 inDomain:(id)a4 usingPreferencesOfKind:(unint64_t)a5;
- (void)_handleProtectionContentUnlockedEvent;
- (void)_handleTonePreferencesChangedNotificationForPreferencesKinds:(unint64_t)a3;
- (void)_handleWatchPrefersSalientNotificationDidChange;
- (void)_loadSystemTones;
- (void)_loadToneIdentifierAliasMap;
- (void)_performBlockInAccessQueue:(id)a3;
- (void)_registerDidRequestResetSyncPostAccidentalToneDeletion;
- (void)_reloadTones;
- (void)_reloadTonesAfterExternalChange;
- (void)_removeAllSyncedData;
- (void)_setCurrentOverridePolicy:(int64_t)a3 forAlertType:(int64_t)a4;
- (void)_setCurrentToneWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4;
- (void)_setCurrentToneWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4 topic:(id)a5;
- (void)_setWatchPrefersSalientNotifications:(BOOL)a3;
- (void)dealloc;
- (void)importTone:(id)a3 metadata:(id)a4 completionBlock:(id)a5;
- (void)removeImportedToneWithIdentifier:(id)a3;
- (void)setCurrentToneIdentifier:(id)a3 forAlertType:(int64_t)a4;
- (void)setCurrentToneIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5;
- (void)setCurrentWatchToneIdentifier:(id)a3 forAlertType:(int64_t)a4;
- (void)setCurrentWatchToneIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5;
@end

@implementation TLToneManager

- (id)defaultToneIdentifierForAlertType:(int64_t)a3
{
  return [(TLToneManager *)self defaultToneIdentifierForAlertType:a3 topic:0];
}

+ (TLToneManager)sharedToneManager
{
  if (sharedToneManager__TLToneManagerSharedInstanceOnceToken != -1) {
    dispatch_once(&sharedToneManager__TLToneManagerSharedInstanceOnceToken, &__block_literal_global);
  }
  v2 = (void *)sharedToneManager__TLToneManagerSharedInstance;

  return (TLToneManager *)v2;
}

- (id)defaultToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5 = a4;
  v6 = [(id)objc_opt_class() _defaultToneIdentifierForAlertType:a3 topic:v5];

  return v6;
}

+ (id)_defaultToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((unint64_t)(a3 - 1) > 0x1C)
  {
    v7 = 0;
  }
  else
  {
    v7 = _TLToneManagerDefaultIdentifiers[a3 - 1];
    if (![(__CFString *)v7 length])
    {
      v8 = @"<none>";

      v7 = v8;
    }
    switch(a3)
    {
      case 1:
        if ([v6 isEqualToString:@"TLAlertTopicIncomingCallFaceTimeGroupInvitation"])
        {
          v9 = @"texttone:FaceTime-Group-Invitation";
          goto LABEL_60;
        }
        if ([v6 isEqualToString:@"TLAlertTopicIncomingCallFaceTimeParticipantJoined"])
        {
          v9 = @"texttone:FaceTime-Participant-Joined";
          goto LABEL_60;
        }
        break;
      case 2:
        if ([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentHeart"])
        {
          v9 = @"texttone:Text-Message-Acknowledgment-Heart";
          goto LABEL_60;
        }
        if ([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentThumbsUp"])
        {
          v9 = @"texttone:Text-Message-Acknowledgment-Thumbs-Up";
          goto LABEL_60;
        }
        if ([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentThumbsDown"])
        {
          v9 = @"texttone:Text-Message-Acknowledgment-Thumbs-Down";
          goto LABEL_60;
        }
        if ([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentHaHa"])
        {
          v9 = @"texttone:Text-Message-Acknowledgment-HaHa";
          goto LABEL_60;
        }
        if ([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentExclamation"])
        {
          v9 = @"texttone:Text-Message-Acknowledgment-Exclamation";
          goto LABEL_60;
        }
        if ([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentQuestionMark"])
        {
          v9 = @"texttone:Text-Message-Acknowledgment-Question-Mark";
          goto LABEL_60;
        }
        break;
      case 4:
        if (_os_feature_enabled_impl())
        {
          v9 = @"texttone:Droplet";
          goto LABEL_60;
        }
        break;
      case 5:
        if (([v6 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.VIP"] & 1) != 0
          || ([v6 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.ThreadNotify"] & 1) != 0)
        {
          v9 = @"texttone:New Mail";
          goto LABEL_60;
        }
        break;
      case 9:
        if ([v6 isEqualToString:@"TLAlertTopicPhotosNotificationSharingPost"])
        {
          v9 = @"texttone:Photos Sharing Post";
          goto LABEL_60;
        }
        if ([v6 isEqualToString:@"TLAlertTopicPhotosNotificationMemory"])
        {
          v9 = @"texttone:Photos Memory";
          goto LABEL_60;
        }
        break;
      case 13:
        if ([v6 isEqualToString:@"TLAlertTopicAlarmGoToSleep"])
        {
          v9 = @"texttone:Go-To-Sleep";
          goto LABEL_60;
        }
        if (([v6 isEqualToString:@"TLAlertTopicAlarmWakeUp"] & 1) == 0) {
          goto LABEL_37;
        }
        v9 = @"alarmWakeUp:Early_Riser";
        goto LABEL_60;
      case 14:
LABEL_37:
        if ((_os_feature_enabled_impl() & 1) == 0) {
          break;
        }
        v9 = @"system:Radial";
        goto LABEL_60;
      case 16:
        if ([v6 isEqualToString:@"TLAlertTopicSystemNotificationBackgroundMicUsage"])
        {
          v9 = @"texttone:System Background Mic Usage";
          goto LABEL_60;
        }
        if ([v6 isEqualToString:@"TLAlertTopicSystemNotificationDoorbell"])
        {
          v9 = @"system:Doorbell";
          goto LABEL_60;
        }
        if ([v6 isEqualToString:@"TLAlertTopicSystemNotificationElevationAlert"])
        {
          v9 = @"texttone:Elevation Alert";
          goto LABEL_60;
        }
        if (([v6 isEqualToString:@"TLAlertTopicSystemNotificationHeadphoneAudioExposure"] & 1) == 0) {
          break;
        }
        v9 = @"texttone:Headphone-Audio-Exposure-Limit-Exceeded";
        goto LABEL_60;
      case 17:
        if ([v6 isEqualToString:@"TLAlertTopicAppNotificationCriticalAlert"])
        {
          v9 = @"texttone:App-Notification-Critical-Alert";
          goto LABEL_60;
        }
        if ([v6 isEqualToString:@"TLAlertTopicAppNotificationFirstParty"]) {
          break;
        }
LABEL_42:
        if ((_os_feature_enabled_impl() & 1) == 0) {
          break;
        }
        v9 = @"texttone:Rebound";
        goto LABEL_60;
      case 20:
        if (([v6 isEqualToString:@"TLAlertTopicPassbookNFCScanComplete"] & 1) == 0) {
          break;
        }
        v9 = @"texttone:Passbook-NFC-Scan-Complete";
        goto LABEL_60;
      case 22:
        if ([v6 isEqualToString:@"TLAlertTopicSOSCountdownTick"])
        {
          v9 = @"texttone:SOS-Countdown-Tick";
LABEL_60:

          v7 = v9;
          break;
        }
        if (([v6 isEqualToString:@"TLAlertTopicSOSDialStart"] & 1) != 0
          || ([v6 isEqualToString:@"TLAlertTopicSOSButtonChordingTimeout"] & 1) != 0
          || ([v6 isEqualToString:@"TLAlertTopicSOSCountdownPreannounce"] & 1) != 0)
        {
          v9 = @"<none>";
          goto LABEL_60;
        }
        break;
      case 25:
        if (([v6 isEqualToString:@"TLAlertTopicHealthUrgent"] & 1) == 0) {
          break;
        }
        v9 = @"texttone:Health-Urgent";
        goto LABEL_60;
      case 29:
        goto LABEL_42;
      default:
        break;
    }
  }
  v10 = TLLogToneManagement();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromTLAlertType(a3);
    int v13 = 138544130;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = v11;
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: +_defaultToneIdentifierForAlertType:(%{public}@) topic:(%{public}@). Returning: %{public}@.", (uint8_t *)&v13, 0x2Au);
  }

  return v7;
}

uint64_t __34__TLToneManager_sharedToneManager__block_invoke()
{
  sharedToneManager__TLToneManagerSharedInstance = objc_alloc_init(TLToneManager);

  return MEMORY[0x1F41817F8]();
}

- (TLToneManager)init
{
  return [(TLToneManager *)self initWithITunesRingtonePlistAtPath:0];
}

- (TLToneManager)initWithITunesRingtonePlistAtPath:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)TLToneManager;
  id v5 = [(TLToneManager *)&v32 init];
  if (v5)
  {
    _TLAlertTypeValidateConsistencyOfEnumeration();
    id v6 = [[TLAccessQueue alloc] initWithLabel:@"_TLToneManagerAccessQueue" appendUUIDToLabel:1];
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = v6;

    v5->_shouldUseServiceToAccessTonePreferences = 0;
    v8 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
    v9 = v8;
    if (v8)
    {
      CFPreferencesSynchronize(v8, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      CFRelease(v9);
    }
    if (+[TLPreferencesUtilities canAccessNanoRegistry])
    {
      NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass();
      if (NPSDomainAccessorClass)
      {
        id v11 = [NPSDomainAccessorClass alloc];
        v12 = +[TLPreferencesUtilities perWatchPreferencesDomain];
        int v13 = (void *)[v11 initWithDomain:v12];

        id v14 = TLLogToneManagement();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v34 = v5;
          __int16 v35 = 2114;
          v36 = v13;
          _os_log_impl(&dword_1DB936000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -init…: Instantiated domain accessor %{public}@.", buf, 0x16u);
        }

        id v15 = (id)[v13 synchronize];
        v16 = TLLogToneManagement();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v34 = v5;
          __int16 v35 = 2114;
          v36 = v13;
          _os_log_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: -init…: Synchronized domain accessor %{public}@.", buf, 0x16u);
        }
      }
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __51__TLToneManager_initWithITunesRingtonePlistAtPath___block_invoke;
    v29[3] = &unk_1E6C20CC0;
    __int16 v17 = v5;
    v30 = v17;
    id v18 = v4;
    id v31 = v18;
    [(TLToneManager *)v17 _performBlockInAccessQueue:v29];
    if (!v18)
    {
      objc_initWeak((id *)buf, v17);
      __int16 v19 = +[TLContentProtectionStateObserver sharedContentProtectionStateObserver];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __51__TLToneManager_initWithITunesRingtonePlistAtPath___block_invoke_2;
      v27[3] = &unk_1E6C20CE8;
      objc_copyWeak(&v28, (id *)buf);
      uint64_t v20 = [v19 performBlockAfterProtectedContentUnlocked:v27];
      contentProtectionStateObserverToken = v17->_contentProtectionStateObserverToken;
      v17->_contentProtectionStateObserverToken = (NSCopying *)v20;

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v17, (CFNotificationCallback)_TLToneManagerHandleTonePreferencesDidChangeNotification, @"_TLTonePreferencesDidChangeNotification", 0, (CFNotificationSuspensionBehavior)1028);
    v23 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v23, v17, (CFNotificationCallback)_TLToneManagerHandleWatchAlertPrefersSalientNotificationPreferenceDidChangeLocallyNotification, @"_TLAlertWatchPrefersSalientNotificationPreferenceDidChangeLocallyNotification", 0, (CFNotificationSuspensionBehavior)1028);
    v24 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v24, v17, (CFNotificationCallback)_TLToneManagerHandleWatchAlertPrefersSalientNotificationPreferenceDidChangeRemotelyNotification, @"_TLAlertWatchPrefersSalientNotificationPreferenceDidChangeRemotelyNotification", 0, (CFNotificationSuspensionBehavior)1028);
    v25 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v25, v17, (CFNotificationCallback)_TLToneManagerHandleDeviceRingtonesChangedNotification, @"com.apple.itunesstored.RingtoneAdded", 0, (CFNotificationSuspensionBehavior)1028);
  }
  return v5;
}

uint64_t __51__TLToneManager_initWithITunesRingtonePlistAtPath___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadITunesRingtoneInfoPlistAtPath:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _loadSystemTones];
  v2 = *(void **)(a1 + 32);

  return [v2 _loadToneIdentifierAliasMap];
}

void __51__TLToneManager_initWithITunesRingtonePlistAtPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleProtectionContentUnlockedEvent];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  v3 = self->_accessQueue;
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunesstored.RingtoneAdded", 0);
  id v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self, @"_TLTonePreferencesDidChangeNotification", 0);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v7, self, @"_TLAlertWatchPrefersSalientNotificationPreferenceDidChangeLocallyNotification", 0);
  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v8, self, @"_TLAlertWatchPrefersSalientNotificationPreferenceDidChangeRemotelyNotification", 0);
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __24__TLToneManager_dealloc__block_invoke;
  v11[3] = &unk_1E6C20D10;
  v11[4] = self;
  v11[5] = &v12;
  [(TLAccessQueue *)v3 performSynchronousBlock:v11];

  if (v13[5])
  {
    v9 = +[TLContentProtectionStateObserver sharedContentProtectionStateObserver];
    [v9 cancelBlockScheduledForProtectedContentUnlockedEventWithToken:v13[5]];
  }
  _Block_object_dispose(&v12, 8);

  v10.receiver = self;
  v10.super_class = (Class)TLToneManager;
  [(TLToneManager *)&v10 dealloc];
}

void __24__TLToneManager_dealloc__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(void **)(v12 + 80);
  *(void *)(v12 + 80) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 64);
  *(void *)(v14 + 64) = 0;
}

- (NSString)_rootDirectory
{
  return (NSString *)@"/var/mobile";
}

- (NSString)_deviceITunesRingtoneDirectory
{
  uint64_t v2 = [(TLToneManager *)self _rootDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"Media/Purchases"];

  return (NSString *)v3;
}

- (NSString)_deviceITunesRingtoneInformationPlist
{
  uint64_t v2 = [(TLToneManager *)self _rootDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"Media/Purchases/Ringtones.plist"];

  return (NSString *)v3;
}

- (NSString)_iTunesRingtoneDirectory
{
  uint64_t v2 = [(TLToneManager *)self _rootDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"Media/iTunes_Control/Ringtones"];

  return (NSString *)v3;
}

- (NSString)_iTunesRingtoneInformationPlist
{
  uint64_t v2 = [(TLToneManager *)self _rootDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"Media/iTunes_Control/iTunes/Ringtones.plist"];

  return (NSString *)v3;
}

- (NSString)_systemRingtoneDirectory
{
  uint64_t v2 = (void *)CPSystemRootDirectory();

  return (NSString *)[v2 stringByAppendingPathComponent:@"/Library/Ringtones"];
}

- (BOOL)_loadITunesRingtoneInfoPlistAtPath:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(TLToneManager *)self _iTunesRingtoneDirectory];
    id v6 = [(TLToneManager *)self _tonesFromManifestPath:v4 mediaDirectoryPath:v5];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = [(TLToneManager *)self _iTunesRingtoneInformationPlist];
    uint64_t v8 = [(TLToneManager *)self _iTunesRingtoneDirectory];
    id v5 = [(TLToneManager *)self _tonesFromManifestPath:v7 mediaDirectoryPath:v8];

    if (v5) {
      [v6 addObjectsFromArray:v5];
    }
    v9 = [(TLToneManager *)self _deviceITunesRingtoneInformationPlist];
    uint64_t v10 = [(TLToneManager *)self _deviceITunesRingtoneDirectory];
    id v11 = [(TLToneManager *)self _tonesFromManifestPath:v9 mediaDirectoryPath:v10];

    if (v11) {
      [v6 addObjectsFromArray:v11];
    }
  }
  uint64_t v12 = TLLogToneManagement();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v6 count];
    _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_load…: Loaded %lu tones.", buf, 0x16u);
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v15);
        }
        __int16 v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v20 = [v19 identifier];
        [v13 setObject:v19 forKey:v20];
        uint64_t v21 = [v19 syncIdentifier];
        if (v21) {
          [v14 setObject:v20 forKey:v21];
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v16);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v35 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __52__TLToneManager__loadITunesRingtoneInfoPlistAtPath___block_invoke;
  v26[3] = &unk_1E6C20D38;
  v26[4] = self;
  id v22 = v13;
  id v27 = v22;
  v29 = buf;
  id v23 = v14;
  id v28 = v23;
  [(TLToneManager *)self _performBlockInAccessQueue:v26];
  BOOL v24 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v24;
}

void __52__TLToneManager__loadITunesRingtoneInfoPlistAtPath___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 16) isEqualToDictionary:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  if (([*(id *)(*(void *)(a1 + 32) + 24) isEqualToDictionary:*(void *)(a1 + 48)] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 48) copy];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v5;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (id)_tonesFromManifestPath:(id)a3 mediaDirectoryPath:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v8 = [v7 fileExistsAtPath:v5];

  v9 = TLLogToneManagement();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543874;
      v53 = self;
      __int16 v54 = 2114;
      id v55 = v5;
      __int16 v56 = 2114;
      id v57 = v6;
      _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: _tonesFromManifestPath:(%{public}@) mediaDirectoryPath:(%{public}@): About to load tones.", buf, 0x20u);
    }

    v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
    v42 = uint64_t v51 = 0;
    id v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfURL:error:");
    id v12 = 0;
    id v13 = v12;
    if (!v11 || v12)
    {
      id v14 = TLLogToneManagement();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v53 = self;
        __int16 v54 = 2114;
        id v55 = v5;
        __int16 v56 = 2114;
        id v57 = v6;
        __int16 v58 = 2114;
        uint64_t v59 = (uint64_t)v13;
        _os_log_error_impl(&dword_1DB936000, v14, OS_LOG_TYPE_ERROR, "%{public}@: _tonesFromManifestPath:(%{public}@) mediaDirectoryPath:(%{public}@): Couldn't load manifest: %{public}@", buf, 0x2Au);
      }
    }
    id v15 = [v11 objectForKey:@"Ringtones"];
    uint64_t v39 = [v15 count];
    if (!v39)
    {
      uint64_t v16 = TLLogToneManagement();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v53 = self;
        __int16 v54 = 2114;
        id v55 = v5;
        __int16 v56 = 2114;
        id v57 = v6;
        __int16 v58 = 2114;
        uint64_t v59 = (uint64_t)v11;
        _os_log_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: _tonesFromManifestPath:(%{public}@) mediaDirectoryPath:(%{public}@): Couldn't find any tone entries in the manifest: %{public}@", buf, 0x2Au);
      }
    }
    v40 = v11;
    v41 = v13;
    id v43 = v5;
    [v15 allKeys];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [obj countByEnumeratingWithState:&v47 objects:v62 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v48;
      unint64_t v20 = 0x1E6C20000uLL;
      uint64_t v44 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v48 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          id v23 = [v6 stringByAppendingPathComponent:v22];
          id v24 = objc_alloc(*(Class *)(v20 + 2072));
          v25 = [v15 objectForKey:v22];
          v26 = (void *)[v24 initWithPropertyListRepresentation:v25 filePath:v23];

          id v27 = TLLogToneManagement();
          id v28 = v27;
          if (v26)
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              [v26 identifier];
              v29 = v9;
              long long v31 = v30 = v15;
              [v26 filePath];
              uint64_t v32 = v18;
              v34 = id v33 = v6;
              *(_DWORD *)buf = 138543874;
              v53 = self;
              __int16 v54 = 2114;
              id v55 = v31;
              __int16 v56 = 2114;
              id v57 = v34;
              _os_log_impl(&dword_1DB936000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: _tonesFromManifestPath: Appending tone with identifier %{public}@ and file path: %{public}@.", buf, 0x20u);

              id v6 = v33;
              uint64_t v18 = v32;

              id v15 = v30;
              v9 = v29;
              uint64_t v19 = v44;
              unint64_t v20 = 0x1E6C20000;
            }

            if (!v9) {
              v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v9 addObject:v26];
          }
          else
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v53 = self;
              __int16 v54 = 2114;
              id v55 = v23;
              _os_log_error_impl(&dword_1DB936000, v28, OS_LOG_TYPE_ERROR, "%{public}@: _tonesFromManifestPath: Skipping inclusion of tone for file path: %{public}@.", buf, 0x16u);
            }
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v47 objects:v62 count:16];
      }
      while (v18);
    }
    id v35 = [v9 copy];
    v36 = TLLogToneManagement();
    id v5 = v43;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [v35 count];
      *(_DWORD *)buf = 138544386;
      v53 = self;
      __int16 v54 = 2114;
      id v55 = v43;
      __int16 v56 = 2114;
      id v57 = v6;
      __int16 v58 = 2048;
      uint64_t v59 = v37;
      __int16 v60 = 2048;
      uint64_t v61 = v39;
      _os_log_impl(&dword_1DB936000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: _tonesFromManifestPath:(%{public}@) mediaDirectoryPath:(%{public}@): Loaded %lu tones from %lu entries in the manifest.", buf, 0x34u);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543874;
      v53 = self;
      __int16 v54 = 2114;
      id v55 = v5;
      __int16 v56 = 2114;
      id v57 = v6;
      _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: _tonesFromManifestPath:(%{public}@) mediaDirectoryPath:(%{public}@): Manifest file does not exist. Not loading any tones.", buf, 0x20u);
    }
    id v35 = 0;
  }

  return v35;
}

- (void)_reloadTonesAfterExternalChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__TLToneManager__reloadTonesAfterExternalChange__block_invoke;
  v2[3] = &unk_1E6C20D60;
  v2[4] = self;
  [(TLToneManager *)self _performBlockInAccessQueue:v2];
}

void __48__TLToneManager__reloadTonesAfterExternalChange__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _loadITunesRingtoneInfoPlistAtPath:0])
  {
    uint64_t v2 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__TLToneManager__reloadTonesAfterExternalChange__block_invoke_2;
    block[3] = &unk_1E6C20D60;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v2, block);
  }
}

void __48__TLToneManager__reloadTonesAfterExternalChange__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_TLToneManagerContentsChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)_reloadTones
{
  [(TLToneManager *)self _reloadTonesAfterExternalChange];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.itunesstored.RingtoneAdded", 0, 0, 1u);
}

- (id)_toneWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__TLToneManager__toneWithIdentifier___block_invoke;
  v8[3] = &unk_1E6C20D88;
  BOOL v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(TLToneManager *)self _performBlockInAccessQueue:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __37__TLToneManager__toneWithIdentifier___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKey:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (id)_installedTones
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__TLToneManager__installedTones__block_invoke;
  v4[3] = &unk_1E6C20D10;
  v4[4] = self;
  v4[5] = &v5;
  [(TLToneManager *)self _performBlockInAccessQueue:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __32__TLToneManager__installedTones__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)_installedTonesSize
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  memset(&v25, 0, 512);
  id v3 = [(TLToneManager *)self _deviceITunesRingtoneDirectory];
  int v4 = statfs((const char *)[v3 UTF8String], &v25);

  if (v4) {
    uint64_t v5 = 4095;
  }
  else {
    uint64_t v5 = v25.f_bsize - 1;
  }
  uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  [(TLToneManager *)self _installedTones];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = *MEMORY[0x1E4F28390];
    float v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        id v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) filePath];
        uint64_t v13 = [v19 attributesOfItemAtPath:v12 error:0];
        id v14 = [v13 objectForKey:v9];
        uint64_t v15 = [v14 longLongValue];

        float v10 = v10 + (float)((v15 + v5) & ~v5);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
    unint64_t v16 = (unint64_t)v10;
  }
  else
  {
    unint64_t v16 = 0;
  }

  return v16;
}

- (id)_addToneToManifestAtPath:(id)a3 metadata:(id)a4 fileName:(id)a5 mediaDirectory:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12) {
    goto LABEL_5;
  }
  id v14 = v11;
  if (!v14) {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v19 = v12;
  v20[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  unint64_t v16 = [(TLToneManager *)self _addToneEntries:v15 toManifestAtPath:v10 mediaDirectory:v13 shouldSkipReload:0];
  uint64_t v17 = [v16 objectForKey:v12];

  if (!v17) {
LABEL_5:
  }
    uint64_t v17 = [[TLToneImportResponse alloc] initWithStatusCode:2 toneIdentifier:0];

  return v17;
}

- (id)_addToneEntries:(id)a3 toManifestAtPath:(id)a4 mediaDirectory:(id)a5 shouldSkipReload:(BOOL)a6
{
  LODWORD(v50) = a6;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v8 = a4;
  id v68 = a5;
  id v69 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v53 = v8;
  uint64_t v9 = [v8 stringByDeletingLastPathComponent];
  [(TLToneManager *)self _ensureDirectoryExistsAtPath:v9];

  HIDWORD(v50) = [(TLToneManager *)self _lockManifestAtPath:v8];
  if (HIDWORD(v50) == -1)
  {
LABEL_50:
    uint64_t v44 = [[TLToneImportResponse alloc] initWithStatusCode:2 toneIdentifier:0];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v45 = v52;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v72 objects:v93 count:16];
    if (v46)
    {
      uint64_t v47 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v73 != v47) {
            objc_enumerationMutation(v45);
          }
          objc_msgSend(v69, "setObject:forKey:", v44, *(void *)(*((void *)&v72 + 1) + 8 * i), v50);
        }
        uint64_t v46 = [v45 countByEnumeratingWithState:&v72 objects:v93 count:16];
      }
      while (v46);
    }

    goto LABEL_58;
  }
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x3032000000;
  v90 = __Block_byref_object_copy_;
  v91 = __Block_byref_object_dispose_;
  id v92 = 0;
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke;
  v86[3] = &unk_1E6C20D10;
  v86[4] = self;
  v86[5] = &v87;
  [(TLToneManager *)self _performBlockInAccessQueue:v86];
  id v10 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:v8];
  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v51 = v10;
  objc_msgSend(v10, "objectForKey:", @"Ringtones", v50);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v51 setObject:v11 forKey:@"Ringtones"];
  }
  id v55 = [(TLToneManager *)self _deviceITunesRingtoneDirectory];
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v57 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v52;
  uint64_t v63 = v11;
  uint64_t v60 = [obj countByEnumeratingWithState:&v82 objects:v103 count:16];
  if (v60)
  {
    char v61 = 0;
    uint64_t v59 = *(void *)v83;
    do
    {
      for (uint64_t j = 0; j != v60; ++j)
      {
        if (*(void *)v83 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v82 + 1) + 8 * j);
        v70 = [obj objectForKey:v12];
        v65 = [v68 stringByAppendingPathComponent:v12];
        v67 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:");
        v66 = objc_msgSend(MEMORY[0x1E4F16330], "assetWithURL:");
        uint64_t v13 = [v66 hasProtectedContent];
        id v14 = (void *)[v70 mutableCopy];
        uint64_t v15 = [NSNumber numberWithBool:v13];
        [v14 setObject:v15 forKey:@"Protected Content"];

        unint64_t v16 = [TLITunesTone alloc];
        uint64_t v17 = [v68 stringByAppendingPathComponent:v12];
        uint64_t v18 = [(TLITunesTone *)v16 initWithPropertyListRepresentation:v14 filePath:v17];

        id v19 = [(TLITunesTone *)v18 identifier];
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v20 = (id)v88[5];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v78 objects:v102 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v79;
LABEL_13:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v79 != v22) {
              objc_enumerationMutation(v20);
            }
            id v24 = *(void **)(*((void *)&v78 + 1) + 8 * v23);
            if ([(TLITunesTone *)v18 isDuplicateOfTone:v24]) {
              break;
            }
            if (v21 == ++v23)
            {
              uint64_t v21 = [v20 countByEnumeratingWithState:&v78 objects:v102 count:16];
              if (v21) {
                goto LABEL_13;
              }
              goto LABEL_19;
            }
          }
          id v27 = [v24 filePath];
          if ([v57 fileExistsAtPath:v27])
          {
            uint64_t v26 = [v24 identifier];

            id v28 = TLLogToneManagement();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v95 = v29;
              __int16 v96 = 2114;
              v97 = v18;
              __int16 v98 = 2114;
              v99 = v24;
              id v30 = v29;
              _os_log_impl(&dword_1DB936000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping import of tone %{public}@ because it's a duplicate of the following existing tone: %{public}@.", buf, 0x20u);
            }
            uint64_t v31 = 1;
            goto LABEL_34;
          }
          __int16 v58 = [v27 lastPathComponent];
          uint64_t v32 = objc_msgSend(v63, "objectForKey:");
          v62 = (void *)[v32 mutableCopy];

          if (v62)
          {
            [v63 removeObjectForKey:v58];
            id v25 = v62;

            uint64_t v26 = [v24 identifier];

            if ([v27 hasPrefix:v55]) {
              [v54 addObject:v27];
            }
            id v33 = TLLogToneManagement();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v34 = objc_opt_class();
              *(_DWORD *)buf = 138544130;
              v95 = v34;
              __int16 v96 = 2114;
              v97 = v18;
              __int16 v98 = 2114;
              v99 = v24;
              __int16 v100 = 2114;
              v101 = v27;
              id v35 = v34;
              _os_log_impl(&dword_1DB936000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Connected newly imported tone %{public}@ to old duplicate's metadata %{public}@ because its asset is missing at %{public}@.", buf, 0x2Au);
            }
          }
          else
          {
            id v33 = TLLogToneManagement();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v36 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v95 = v36;
              __int16 v96 = 2114;
              v97 = v18;
              __int16 v98 = 2114;
              v99 = v24;
              id v37 = v36;
              _os_log_impl(&dword_1DB936000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Proceeding to import tone %{public}@ despite finding duplicate %{public}@ because they don't appear to be listed in the same manifest.", buf, 0x20u);
            }
            uint64_t v26 = v19;
            id v25 = v14;
          }
        }
        else
        {
LABEL_19:
          id v25 = v14;
          uint64_t v26 = v19;
        }

        [v63 setObject:v25 forKey:v12];
        uint64_t v31 = 0;
        char v61 = 1;
        id v14 = v25;
LABEL_34:
        v38 = [[TLToneImportResponse alloc] initWithStatusCode:v31 toneIdentifier:v26];
        [v69 setObject:v38 forKey:v12];
      }
      uint64_t v60 = [obj countByEnumeratingWithState:&v82 objects:v103 count:16];
    }
    while (v60);

    if ((v61 & 1) == 0)
    {
      char v40 = 0;
      goto LABEL_47;
    }
    id obj = [MEMORY[0x1E4F28F98] dataWithPropertyList:v51 format:200 options:0 error:0];
    char v39 = [obj writeToFile:v53 options:1 error:0];
    if (v39)
    {
      if ((v50 & 1) == 0) {
        [(TLToneManager *)self _reloadTones];
      }
    }
    else
    {
      v41 = TLLogToneManagement();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = objc_opt_class();
        -[TLToneManager _addToneEntries:toManifestAtPath:mediaDirectory:shouldSkipReload:](v42, (uint64_t)buf, v41);
      }

      [v69 removeAllObjects];
    }
    char v40 = v39 ^ 1;
  }
  else
  {
    char v40 = 0;
  }

LABEL_47:
  close(SHIDWORD(v50));
  if ([v54 count])
  {
    id v43 = (void *)[objc_alloc((Class)getSSDownloadFileManifestClass()) initWithManifestType:0];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke_279;
    v76[3] = &unk_1E6C20DB0;
    v76[4] = self;
    id v77 = v54;
    [v43 removeItemsWithAssetPaths:v77 completionBlock:v76];
  }
  _Block_object_dispose(&v87, 8);

  if (v40) {
    goto LABEL_50;
  }
LABEL_58:

  return v69;
}

uint64_t __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) allValues];

  return MEMORY[0x1F41817F8]();
}

void __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke_279(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = TLLogToneManagement();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      uint64_t v9 = *(void **)(a1 + 40);
      id v10 = v8;
      int v11 = 138543618;
      uint64_t v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = [v9 count];
      _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully removed %lu items from store download file manifest.", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke_279_cold_1(a1);
  }
}

- (BOOL)_removeToneWithIdentifier:(id)a3
{
  return [(TLToneManager *)self _removeToneWithIdentifier:a3 orSyncIdentifier:0];
}

- (BOOL)_removeToneWithIdentifier:(id)a3 orSyncIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(TLAccessQueue *)self->_accessQueue assertNotRunningInAccessQueue];
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke;
  v14[3] = &unk_1E6C20E00;
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  uint64_t v17 = self;
  uint64_t v18 = &v20;
  id v19 = &v24;
  [(TLToneManager *)self _performBlockInAccessQueue:v14];
  if (*((unsigned char *)v21 + 24))
  {
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"_TLToneManagerContentsChangedNotification" object:self];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.itunesstored.RingtoneAdded", 0, 0, 1u);
  }
  char v12 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    if (*(void *)(a1 + 40))
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 48) + 24), "objectForKey:");
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      id v3 = TLLogToneManagement();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = objc_opt_class();
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        uint64_t v51 = v4;
        __int16 v52 = 2114;
        uint64_t v53 = v5;
        __int16 v54 = 2114;
        uint64_t v55 = v6;
        __int16 v56 = 2114;
        id v57 = v2;
        id v7 = v4;
        _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeToneWithIdentifier:(%{public}@) orSyncIdentifier:(%{public}@): Resolved supplied sync identifier to tone identifier: %{public}@.", buf, 0x2Au);
      }
    }
    else
    {
      id v2 = 0;
    }
  }
  if ([v2 length])
  {
    id v8 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKey:v2];
    id v9 = v8;
    if (!v8)
    {
LABEL_26:

      goto LABEL_27;
    }
    id v10 = [v8 filePath];
    int v11 = [v10 lastPathComponent];
    char v12 = [*(id *)(a1 + 48) _deviceITunesRingtoneDirectory];
    char v13 = [v10 hasPrefix:v12];

    uint64_t v14 = *(void **)(a1 + 48);
    if (v13) {
      [v14 _deviceITunesRingtoneInformationPlist];
    }
    else {
    id v15 = [v14 _iTunesRingtoneInformationPlist];
    }
    id v16 = *(void **)(a1 + 48);
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v11, 0);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v16 _removeTonesFromManifestAtPath:v15 fileNames:v17 shouldSkipReload:1 alreadyLockedManifest:0 removedEntries:0];

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v49 = 0;
    char v19 = [v18 removeItemAtPath:v10 error:&v49];
    id v20 = v49;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v19;

    int v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    uint64_t v22 = TLLogToneManagement();
    char v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        uint64_t v51 = v24;
        __int16 v52 = 2114;
        uint64_t v53 = v25;
        __int16 v54 = 2114;
        uint64_t v55 = v26;
        __int16 v56 = 2114;
        id v57 = v10;
        id v27 = v24;
        _os_log_impl(&dword_1DB936000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeToneWithIdentifier:(%{public}@) orSyncIdentifier:(%{public}@): Successfully deleted tone at file path '%{public}@'.", buf, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      char v40 = objc_opt_class();
      uint64_t v42 = *(void *)(a1 + 32);
      uint64_t v43 = *(void *)(a1 + 40);
      id v44 = v40;
      v41 = objc_msgSend(v20, "tl_nonRedundantDescription");
      *(_DWORD *)buf = 138544386;
      uint64_t v51 = v40;
      __int16 v52 = 2114;
      uint64_t v53 = v42;
      __int16 v54 = 2114;
      uint64_t v55 = v43;
      __int16 v56 = 2114;
      id v57 = v10;
      __int16 v58 = 2114;
      uint64_t v59 = v41;
      _os_log_error_impl(&dword_1DB936000, v23, OS_LOG_TYPE_ERROR, "%{public}@: _removeToneWithIdentifier:(%{public}@) orSyncIdentifier:(%{public}@): Failed to delete tone at file path '%{public}@'; error = %{public}@.",
        buf,
        0x34u);
    }
    id v28 = [*(id *)(a1 + 48) _deviceITunesRingtoneDirectory];
    if ([v10 hasPrefix:v28])
    {
      v29 = [v10 lastPathComponent];
      char v30 = [v29 hasPrefix:@"import_"];

      if (v30)
      {
LABEL_22:
        uint64_t v31 = (void *)[*(id *)(*(void *)(a1 + 48) + 16) mutableCopy];
        [v31 removeObjectForKey:v2];
        uint64_t v32 = [v31 copy];
        uint64_t v33 = *(void *)(a1 + 48);
        v34 = *(void **)(v33 + 16);
        *(void *)(v33 + 16) = v32;

        id v35 = [v9 syncIdentifier];
        if (v35)
        {
          v36 = (void *)[*(id *)(*(void *)(a1 + 48) + 24) mutableCopy];
          [v36 removeObjectForKey:v35];
          uint64_t v37 = [v36 copy];
          uint64_t v38 = *(void *)(a1 + 48);
          char v39 = *(void **)(v38 + 24);
          *(void *)(v38 + 24) = v37;
        }
        goto LABEL_25;
      }
      id v28 = (void *)[objc_alloc((Class)getSSDownloadFileManifestClass()) initWithManifestType:0];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke_282;
      v45[3] = &unk_1E6C20DD8;
      v45[4] = *(void *)(a1 + 48);
      id v46 = *(id *)(a1 + 32);
      id v47 = *(id *)(a1 + 40);
      id v48 = v10;
      [v28 removeItemWithAssetPath:v48 completionBlock:v45];
    }
    goto LABEL_22;
  }
LABEL_27:
}

void __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke_282(void *a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = TLLogToneManagement();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      uint64_t v9 = a1[5];
      uint64_t v10 = a1[6];
      uint64_t v11 = a1[7];
      int v13 = 138544130;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      id v12 = v8;
      _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeToneWithIdentifier:(%{public}@) orSyncIdentifier:(%{public}@): Successfully removed item for tone at file path '%{public}@' from store download file manifest.", (uint8_t *)&v13, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke_282_cold_1();
  }
}

- (BOOL)_removeToneFromManifestAtPath:(id)a3 fileName:(id)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "setWithObjects:", a4, 0);
  LOBYTE(self) = [(TLToneManager *)self _removeTonesFromManifestAtPath:v7 fileNames:v8 shouldSkipReload:0 alreadyLockedManifest:0 removedEntries:0];

  return (char)self;
}

- (BOOL)_removeTonesFromManifestAtPath:(id)a3 fileNames:(id)a4 shouldSkipReload:(BOOL)a5 alreadyLockedManifest:(BOOL)a6 removedEntries:(id *)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = [v12 stringByDeletingLastPathComponent];
  [(TLToneManager *)self _ensureDirectoryExistsAtPath:v14];

  if (a6)
  {
    int v15 = -1;
  }
  else
  {
    int v15 = [(TLToneManager *)self _lockManifestAtPath:v12];
    if (v15 == -1)
    {
      id v22 = 0;
      char v27 = 0;
      if (!a7) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:v12];
  __int16 v17 = v16;
  if (v16)
  {
    BOOL v32 = a5;
    uint64_t v31 = self;
    int v34 = v15;
    BOOL v35 = a6;
    id v37 = v12;
    uint64_t v33 = v16;
    uint64_t v18 = [v16 objectForKey:@"Ringtones"];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v36 = v13;
    id v19 = v13;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      id v22 = 0;
      uint64_t v23 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          if (a7)
          {
            uint64_t v26 = [v18 objectForKey:*(void *)(*((void *)&v38 + 1) + 8 * i)];
            if (v26)
            {
              if (!v22) {
                id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
              [v22 setObject:v26 forKey:v25];
            }
          }
          [v18 removeObjectForKey:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v21);
    }
    else
    {
      id v22 = 0;
    }

    __int16 v17 = v33;
    id v28 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v33 format:200 options:0 error:0];
    id v12 = v37;
    char v27 = [v28 writeToFile:v37 options:1 error:0];
    if (v27)
    {
      if (!v32) {
        [(TLToneManager *)v31 _reloadTones];
      }
    }
    else
    {
      v29 = TLLogToneManagement();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[TLToneManager _removeTonesFromManifestAtPath:fileNames:shouldSkipReload:alreadyLockedManifest:removedEntries:]();
      }

      if (v22)
      {

        id v22 = 0;
      }
    }
    int v15 = v34;

    id v13 = v36;
    if (!v35) {
      goto LABEL_30;
    }
  }
  else
  {
    id v22 = 0;
    char v27 = 0;
    if (!a6) {
LABEL_30:
    }
      close(v15);
  }

  if (a7) {
LABEL_32:
  }
    *a7 = (id)[v22 copy];
LABEL_33:

  return v27;
}

- (int)_lockManifestAtPath:(id)a3
{
  id v3 = [a3 stringByDeletingLastPathComponent];
  int v4 = [v3 stringByAppendingPathComponent:@"com.apple.ToneLibrary.lock"];

  id v5 = v4;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 512, 438);
  if (v6 == -1)
  {
    uint64_t v16 = TLLogToneManagement();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[TLToneManager _lockManifestAtPath:](v16, v17, v18, v19, v20, v21, v22, v23);
    }

    goto LABEL_9;
  }
  int v7 = v6;
  fcntl(v6, 2, 1);
  if (flock(v7, 2) == -1)
  {
    id v8 = TLLogToneManagement();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TLToneManager _lockManifestAtPath:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    close(v7);
LABEL_9:
    int v7 = -1;
  }

  return v7;
}

- (BOOL)_removeAllTones
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__TLToneManager__removeAllTones__block_invoke;
  v4[3] = &unk_1E6C20E78;
  v4[4] = self;
  v4[5] = &v5;
  [(TLToneManager *)self _performBlockInAccessQueue:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__TLToneManager__removeAllTones__block_invoke(uint64_t a1)
{
  v45[2] = *MEMORY[0x1E4F143B8];
  char v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [*(id *)(a1 + 32) _deviceITunesRingtoneInformationPlist];
  v45[0] = v3;
  int v4 = [*(id *)(a1 + 32) _iTunesRingtoneInformationPlist];
  v45[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];

  int v6 = v5;
  uint64_t v7 = [v5 count];
  char v8 = malloc_type_malloc(4 * v7, 0x100004052888210uLL);
  if (!v7)
  {
    char v36 = 0;
    goto LABEL_10;
  }
  char v9 = 0;
  uint64_t v10 = 0;
  char v11 = 1;
  do
  {
    uint64_t v12 = [v6 objectAtIndex:v10];
    if ([v2 fileExistsAtPath:v12])
    {
      int v13 = [*(id *)(a1 + 32) _lockManifestAtPath:v12];
      v11 &= v13 != -1;
      char v9 = 1;
    }
    else
    {
      int v13 = -1;
    }
    v8[v10] = v13;

    ++v10;
  }
  while (v7 != v10);
  char v36 = v9;
  if (v11)
  {
LABEL_10:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v14 = [*(id *)(a1 + 32) _deviceITunesRingtoneDirectory];
    uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 16);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __32__TLToneManager__removeAllTones__block_invoke_2;
    v41[3] = &unk_1E6C20E50;
    id v42 = v2;
    id v43 = v14;
    long long v44 = *(_OWORD *)(a1 + 32);
    id v16 = v14;
    [v15 enumerateKeysAndObjectsUsingBlock:v41];

    if (!v7) {
      goto LABEL_25;
    }
  }
  uint64_t v17 = 0;
  long long v38 = v8;
  do
  {
    uint64_t v18 = [v6 objectAtIndex:v17];
    if ([v2 fileExistsAtPath:v18])
    {
      id v40 = 0;
      char v19 = [v2 removeItemAtPath:v18 error:&v40];
      id v20 = v40;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v19;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        printf("Removed tone manifest at path '%s'.\n", (const char *)[v18 UTF8String]);
      }
      else
      {
        uint64_t v21 = (FILE *)*MEMORY[0x1E4F143C8];
        uint64_t v22 = [v18 UTF8String];
        objc_msgSend(v20, "tl_nonRedundantDescription");
        id v23 = objc_claimAutoreleasedReturnValue();
        int v34 = (const char *)v22;
        char v8 = v38;
        fprintf(v21, "Failed to remove item at path '%s'. Error: %s.\n", v34, (const char *)[v23 UTF8String]);
      }
    }
    int v24 = v8[v17];
    if (v24 != -1) {
      close(v24);
    }
    uint64_t v25 = [v18 stringByDeletingLastPathComponent];
    uint64_t v26 = [v25 stringByAppendingPathComponent:@"com.apple.ToneLibrary.lock"];

    if ([v2 fileExistsAtPath:v26])
    {
      id v39 = 0;
      char v27 = [v2 removeItemAtPath:v26 error:&v39];
      id v28 = v39;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v27;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        printf("Removed tone manifest lock file at path '%s'.\n", (const char *)[v26 UTF8String]);
      }
      else
      {
        id v37 = (FILE *)*MEMORY[0x1E4F143C8];
        uint64_t v29 = [v26 UTF8String];
        objc_msgSend(v28, "tl_nonRedundantDescription");
        uint64_t v30 = a1;
        uint64_t v31 = v7;
        BOOL v32 = v6;
        id v33 = objc_claimAutoreleasedReturnValue();
        BOOL v35 = (const char *)v29;
        char v8 = v38;
        fprintf(v37, "Failed to remove item at path '%s'. Error: %s.\n", v35, (const char *)[v33 UTF8String]);

        int v6 = v32;
        uint64_t v7 = v31;
        a1 = v30;
      }
    }
    ++v17;
  }
  while (v7 != v17);
LABEL_25:
  free(v8);
  if ((v36 & 1) == 0) {
    puts("Nothing to remove.");
  }
  [*(id *)(a1 + 32) _reloadTones];
}

void __32__TLToneManager__removeAllTones__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 filePath];
  if (![*(id *)(a1 + 32) fileExistsAtPath:v5]) {
    goto LABEL_24;
  }
  if ([v5 hasPrefix:*(void *)(a1 + 40)])
  {
    int v6 = [v5 lastPathComponent];
    int v7 = [v6 hasPrefix:@"import_"];

    if (v7) {
      char v8 = "imported";
    }
    else {
      char v8 = "purchased";
    }
    int v9 = v7 ^ 1;
  }
  else
  {
    int v9 = 0;
    char v8 = "synced";
  }
  uint64_t v10 = *(void **)(a1 + 32);
  id v32 = 0;
  char v11 = [v10 removeItemAtPath:v5 error:&v32];
  id v12 = v32;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11;
  int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v14 = TLLogToneManagement();
  uint64_t v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      int v34 = v16;
      __int16 v35 = 2114;
      char v36 = v5;
      id v17 = v16;
      _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeAllTones: Successfully deleted tone at file path '%{public}@'.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = objc_opt_class();
    id v26 = v25;
    char v27 = objc_msgSend(v12, "tl_nonRedundantDescription");
    *(_DWORD *)buf = 138543874;
    int v34 = v25;
    __int16 v35 = 2114;
    char v36 = v5;
    __int16 v37 = 2114;
    long long v38 = v27;
    _os_log_error_impl(&dword_1DB936000, v15, OS_LOG_TYPE_ERROR, "%{public}@: _removeAllTones: Failed to delete tone at file path '%{public}@'; error = %{public}@.",
      buf,
      0x20u);
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v21 = (FILE *)*MEMORY[0x1E4F143C8];
    uint64_t v22 = (const char *)[v5 UTF8String];
    objc_msgSend(v12, "tl_nonRedundantDescription");
    id v19 = objc_claimAutoreleasedReturnValue();
    fprintf(v21, "Failed to remove item at path '%s'. Error: %s.\n", v22, (const char *)[v19 UTF8String]);
    goto LABEL_17;
  }
  if (v9)
  {
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    id v19 = (id)[objc_alloc((Class)getSSDownloadFileManifestClass()) initWithManifestType:0];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __32__TLToneManager__removeAllTones__block_invoke_292;
    v28[3] = &unk_1E6C20E28;
    uint64_t v31 = *(void *)(a1 + 56);
    id v29 = v5;
    dispatch_semaphore_t v30 = v18;
    id v20 = v18;
    [v19 removeItemWithAssetPath:v29 completionBlock:v28];
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);

LABEL_17:
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if ([v4 isRingtone]) {
      id v23 = "ringtone";
    }
    else {
      id v23 = "alert tone";
    }
    id v24 = [v4 name];
    printf("Removed %s %s with name '%s' at path '%s'.\n", v8, v23, (const char *)[v24 UTF8String], (const char *)objc_msgSend(v5, "UTF8String"));
  }
LABEL_24:
}

intptr_t __32__TLToneManager__removeAllTones__block_invoke_292(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v5 = (FILE *)*MEMORY[0x1E4F143C8];
    id v6 = *(id *)(a1 + 32);
    id v7 = a3;
    char v8 = (const char *)[v6 UTF8String];
    int v9 = objc_msgSend(v7, "tl_nonRedundantDescription");

    id v10 = v9;
    fprintf(v5, "Failed to remove item at path '%s' from store download manifest. Error: %s.\n", v8, (const char *)[v10 UTF8String]);
  }
  char v11 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v11);
}

- (id)_alarmWakeUpRingtoneDirectory
{
  char v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 resourcePath];
  id v4 = [v3 stringByAppendingPathComponent:@"AlarmWakeUpRingtones"];

  return v4;
}

- (id)_baseDirectoryForAlertToneSoundFiles
{
  return @"/System/Library/Audio/UISounds";
}

- (id)_systemEmbeddedSoundDirectory
{
  char v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 resourcePath];
  id v4 = [v3 stringByAppendingPathComponent:@"AlertTones"];

  return v4;
}

- (id)_systemEmbeddedClassicSoundDirectory
{
  char v2 = [(TLToneManager *)self _systemEmbeddedSoundDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"Classic"];

  return v3;
}

- (id)_systemEmbeddedModernSoundDirectory
{
  char v2 = [(TLToneManager *)self _systemEmbeddedSoundDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"Modern"];

  return v3;
}

- (id)_systemEmbeddedEncoreInfinitumSoundDirectory
{
  char v2 = [(TLToneManager *)self _systemEmbeddedSoundDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"EncoreInfinitum"];

  return v3;
}

- (id)_systemWatchSoundDirectory
{
  char v2 = [(TLToneManager *)self _baseDirectoryForAlertToneSoundFiles];
  id v3 = [v2 stringByAppendingPathComponent:@"nano"];

  return v3;
}

- (void)_loadSystemTones
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v31 = [(TLToneManager *)self _systemSoundDirectory];
  id v32 = self;
  uint64_t v3 = [(TLToneManager *)self _systemWatchSoundDirectory];
  v102 = @"<none>";
  int v103 = kSystemSoundID_NoneTone;
  int v104 = kSystemSoundID_NoneTone;
  v106[0] = 0;
  uint64_t v105 = 0;
  v106[1] = @"texttone:App Notification";
  v106[2] = 0x3F700000523;
  v106[3] = v31;
  v106[4] = @"sms-received1.caf";
  v106[5] = @"texttone:Text-Message-Alert-In-Conversation";
  v106[6] = 0x3EB00000515;
  v106[7] = v31;
  v106[8] = @"ReceivedMessage.caf";
  v106[9] = @"texttone:FaceTime-Group-Invitation";
  v106[10] = vdup_n_s32(0x4F1u);
  v106[11] = v3;
  v106[12] = @"MultiwayInvitation.caf";
  v106[13] = @"texttone:FaceTime-Participant-Joined";
  v106[14] = vdup_n_s32(0x4EFu);
  v106[15] = v3;
  v106[16] = @"MultiwayJoin.caf";
  v106[17] = @"texttone:Go-To-Sleep";
  v106[19] = v31;
  v106[20] = @"go_to_sleep_alert.caf";
  v106[18] = vdup_n_s32(0x486u);
  v106[21] = @"texttone:App-Notification-Critical-Alert";
  v106[22] = vdup_n_s32(0x48Du);
  v106[23] = v31;
  v106[24] = @"3rd_party_critical.caf";
  v106[25] = @"texttone:Passbook-NFC-Scan-Complete";
  v106[26] = vdup_n_s32(0x488u);
  v106[27] = v31;
  v106[28] = @"nfc_scan_complete.caf";
  v106[29] = @"texttone:Health";
  int v107 = kSystemSoundID_NoneTone;
  int v108 = 1262;
  id v109 = v31;
  v110 = @"health_notification.caf";
  v111 = @"texttone:Health-Urgent";
  int v112 = kSystemSoundID_NoneTone;
  int v113 = 1363;
  uint64_t v114 = v3;
  v115 = @"HealthNotificationUrgent.caf";
  v116 = @"texttone:Headphone-Audio-Exposure-Limit-Exceeded";
  int32x2_t v117 = vdup_n_s32(0x552u);
  dispatch_semaphore_t v30 = (void *)v3;
  uint64_t v118 = v3;
  v119 = @"HeadphoneAudioExposureLimitExceeded.caf";
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  for (uint64_t i = 0; i != 44; i += 4)
  {
    id v6 = &(&v102)[i];
    id v7 = (id)v106[i - 1];
    id v8 = (id)v106[i];
    int v9 = v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      id v12 = 0;
      char v11 = 0;
    }
    else
    {
      char v11 = [v7 stringByAppendingPathComponent:v8];
      id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:0];
    }
    int v13 = [[TLSystemTone alloc] initWithSoundFileURL:v12 actualSoundID:*((unsigned int *)v6 + 3) previewSoundID:*((unsigned int *)v6 + 2) requiresLongFormPlayback:0];
    if (v13) {
      [v4 setObject:v13 forKey:*v6];
    }
  }
  uint64_t v14 = [(TLToneManager *)v32 _systemEmbeddedSoundDirectory];
  uint64_t v15 = [(TLToneManager *)v32 _systemEmbeddedClassicSoundDirectory];
  id v16 = [(TLToneManager *)v32 _systemEmbeddedModernSoundDirectory];
  [(TLToneManager *)v32 _systemEmbeddedEncoreInfinitumSoundDirectory];
  uint64_t v17 = 0;
  v33[0] = @"texttone:Alert";
  v33[1] = v15;
  v33[2] = @"Alert.m4r";
  v33[3] = @"texttone:Anticipate";
  v33[4] = v15;
  v33[5] = @"Anticipate.m4r";
  v33[6] = @"texttone:Bell";
  v33[7] = v15;
  v33[8] = @"Bell.m4r";
  v33[9] = @"texttone:Bloom";
  v33[10] = v15;
  v33[11] = @"Bloom.m4r";
  v33[12] = @"texttone:Calypso";
  v33[13] = v15;
  v33[14] = @"Calypso.m4r";
  v33[15] = @"texttone:Chime";
  v33[16] = v15;
  v33[17] = @"Chime.m4r";
  v33[18] = @"texttone:Choo Choo";
  v33[19] = v15;
  v33[20] = @"Choo Choo.m4r";
  v33[21] = @"texttone:Descent";
  v33[22] = v15;
  v33[23] = @"Descent.m4r";
  v33[24] = @"texttone:New Mail";
  v33[25] = v15;
  v33[26] = @"Ding.m4r";
  v33[27] = @"texttone:Electronic";
  v33[28] = v15;
  v33[29] = @"Electronic.m4r";
  v33[30] = @"texttone:Fanfare";
  v33[31] = v15;
  v33[32] = @"Fanfare.m4r";
  v33[33] = @"texttone:Glass";
  v33[34] = v15;
  v33[35] = @"Glass.m4r";
  v33[36] = @"texttone:Horn";
  v33[37] = v15;
  v33[38] = @"Horn.m4r";
  v33[39] = @"texttone:Ladder";
  v33[40] = v15;
  v33[41] = @"Ladder.m4r";
  v33[42] = @"texttone:Minuet";
  v33[43] = v15;
  v33[44] = @"Minuet.m4r";
  v33[45] = @"texttone:News Flash";
  v33[46] = v15;
  v33[47] = @"News Flash.m4r";
  v33[48] = @"texttone:Noir";
  v33[49] = v15;
  v33[50] = @"Noir.m4r";
  v33[51] = @"texttone:Sherwood Forest";
  v33[52] = v15;
  v33[53] = @"Sherwood Forest.m4r";
  v33[54] = @"texttone:Spell";
  v33[55] = v15;
  v33[56] = @"Spell.m4r";
  v33[57] = @"texttone:Suspense";
  v33[58] = v15;
  v33[59] = @"Suspense.m4r";
  v33[60] = @"texttone:Sharing Post";
  v33[61] = v15;
  v33[62] = @"Swish.m4r";
  v33[63] = @"texttone:Sent Mail";
  v33[64] = v15;
  v33[65] = @"Swoosh.m4r";
  v33[66] = @"texttone:Telegraph";
  v33[67] = v15;
  v33[68] = @"Telegraph.m4r";
  v33[69] = @"texttone:Tiptoes";
  v33[70] = v15;
  v33[71] = @"Tiptoes.m4r";
  v33[72] = @"texttone:Tri-tone";
  v33[73] = v15;
  v33[74] = @"Tri-Tone.m4r";
  v33[75] = @"texttone:Sent Tweet";
  v33[76] = v15;
  v33[77] = @"Tweet.m4r";
  v33[78] = @"texttone:Typewriters";
  v33[79] = v15;
  v33[80] = @"Typewriters.m4r";
  v33[81] = @"texttone:Update";
  v33[82] = v15;
  v33[83] = @"Update.m4r";
  v33[84] = @"texttone:Note";
  v33[85] = v16;
  v33[86] = @"Note.m4r";
  v33[87] = @"texttone:Bamboo";
  v33[88] = v16;
  v33[89] = @"Bamboo.m4r";
  v33[90] = @"texttone:Complete";
  v33[91] = v16;
  v33[92] = @"Complete.m4r";
  v33[93] = @"texttone:Hello";
  v33[94] = v16;
  v33[95] = @"Hello.m4r";
  v33[96] = @"texttone:Popcorn";
  v33[97] = v16;
  v33[98] = @"Popcorn.m4r";
  v33[99] = @"texttone:Synth";
  v33[100] = v16;
  v33[101] = @"Synth.m4r";
  v33[102] = @"texttone:Aurora";
  v33[103] = v16;
  v33[104] = @"Aurora.m4r";
  v33[105] = @"texttone:Keys";
  v33[106] = v16;
  v33[107] = @"Keys.m4r";
  v33[108] = @"texttone:Circles";
  v33[109] = v16;
  v33[110] = @"Circles.m4r";
  v33[111] = @"texttone:Input";
  v33[112] = v16;
  v33[113] = @"Input.m4r";
  uint64_t v34 = v33[114] = @"texttone:Antic";
  __int16 v35 = @"Antic-EncoreInfinitum.caf";
  char v36 = @"texttone:Cheers";
  uint64_t v37 = v34;
  long long v38 = @"Cheers-EncoreInfinitum.caf";
  uint64_t v39 = @"texttone:Droplet";
  uint64_t v40 = v34;
  long long v41 = @"Droplet-EncoreInfinitum.caf";
  id v42 = @"texttone:Handoff";
  uint64_t v43 = v34;
  long long v44 = @"Handoff-EncoreInfinitum.caf";
  id v45 = @"texttone:Milestone";
  uint64_t v46 = v34;
  id v47 = @"Milestone-EncoreInfinitum.caf";
  id v48 = @"texttone:Passage";
  uint64_t v49 = v34;
  uint64_t v50 = @"Passage-EncoreInfinitum.caf";
  uint64_t v51 = @"texttone:Portal";
  uint64_t v52 = v34;
  uint64_t v53 = @"Portal-EncoreInfinitum.caf";
  __int16 v54 = @"texttone:Rattle";
  uint64_t v55 = v34;
  __int16 v56 = @"Rattle-EncoreInfinitum.caf";
  id v57 = @"texttone:Rebound";
  uint64_t v58 = v34;
  uint64_t v59 = @"Rebound-EncoreInfinitum.caf";
  uint64_t v60 = @"texttone:Slide";
  uint64_t v61 = v34;
  v62 = @"Slide-EncoreInfinitum.caf";
  uint64_t v63 = @"texttone:Welcome";
  id v29 = (void *)v34;
  uint64_t v64 = v34;
  v65 = @"Welcome-EncoreInfinitum.caf";
  v66 = @"texttone:Calendar Alert";
  v67 = v16;
  id v68 = @"Chord.m4r";
  id v69 = @"texttone:Air Drop Invitation";
  v70 = v16;
  v71 = @"Pulse.m4r";
  long long v72 = @"texttone:Photos Sharing Post";
  long long v73 = v14;
  long long v74 = @"PhotosSharingPostTone.caf";
  long long v75 = @"texttone:Photos Memory";
  v76 = v14;
  id v77 = @"PhotosMemoriesNotification.caf";
  long long v78 = @"texttone:System Background Mic Usage";
  long long v79 = v14;
  long long v80 = @"Background-Mic-Usage.wav";
  long long v81 = @"texttone:SOS-Countdown-Tick";
  long long v82 = v14;
  long long v83 = @"SOS-Countdown-Tick.caf";
  long long v84 = @"texttone:Text-Message-Acknowledgment-Heart";
  long long v85 = v14;
  v86 = @"Text-Message-Acknowledgement-Heart.caf";
  uint64_t v87 = @"texttone:Text-Message-Acknowledgment-Thumbs-Up";
  v88 = v14;
  uint64_t v89 = @"Text-Message-Acknowledgement-ThumbsUp.caf";
  v90 = @"texttone:Text-Message-Acknowledgment-Thumbs-Down";
  v91 = v14;
  id v92 = @"Text-Message-Acknowledgement-ThumbsDown.caf";
  v93 = @"texttone:Text-Message-Acknowledgment-HaHa";
  v94 = v14;
  v95 = @"Text-Message-Acknowledgement-HaHa.caf";
  __int16 v96 = @"texttone:Text-Message-Acknowledgment-Exclamation";
  v97 = v14;
  __int16 v98 = @"Text-Message-Acknowledgement-Exclamation.caf";
  v99 = @"texttone:Text-Message-Acknowledgment-Question-Mark";
  v101 = @"Text-Message-Acknowledgement-QuestionMark.caf";
  __int16 v100 = v14;
  do
  {
    id v18 = (id)v33[v17 + 1];
    id v19 = (id)v33[v17 + 2];
    id v20 = v19;
    if (v18) {
      BOOL v21 = v19 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21)
    {
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v23 = [v18 stringByAppendingPathComponent:v19];
      id v24 = (void *)v23;
      if (v23)
      {
        uint64_t v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v23 isDirectory:0];
      }
      else
      {
        uint64_t v22 = 0;
      }
    }
    uint64_t v25 = [TLSystemTone alloc];
    id v26 = [(TLSystemTone *)v25 initWithSoundFileURL:v22 actualSoundID:kSystemSoundID_InvalidTone previewSoundID:kSystemSoundID_InvalidTone requiresLongFormPlayback:0];
    if (v26) {
      [v4 setObject:v26 forKey:v33[v17]];
    }

    v17 += 3;
  }
  while (v17 != 183);
  uint64_t v27 = [v4 copy];
  systemTonesByIdentifier = v32->_systemTonesByIdentifier;
  v32->_systemTonesByIdentifier = (NSDictionary *)v27;
}

- (void)_loadToneIdentifierAliasMap
{
  self->_toneIdentifierAliasMap = (NSDictionary *)&unk_1F35FF6A8;
  MEMORY[0x1F41817F8]();
}

- (id)_aliasForToneIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__TLToneManager__aliasForToneIdentifier___block_invoke;
    v9[3] = &unk_1E6C20D88;
    char v11 = &v12;
    v9[4] = self;
    id v10 = v4;
    [(TLToneManager *)self _performBlockInAccessQueue:v9];

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __41__TLToneManager__aliasForToneIdentifier___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 40) copy];
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)_toneWithIdentifierIsDefaultRingtone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TLToneManager *)self defaultRingtoneIdentifier];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)_toneWithIdentifierIsNonDefaultSystemRingtone:(id)a3
{
  return [a3 hasPrefix:@"system:"];
}

- (BOOL)_toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:(id)a3
{
  id v4 = a3;
  BOOL v5 = ![(TLToneManager *)self _toneWithIdentifierIsSystemTone:v4]
    && [(TLToneManager *)self _toneWithIdentifierIsNonDefaultSystemRingtone:v4];

  return v5;
}

- (BOOL)_toneWithIdentifierIsITunesRingtone:(id)a3
{
  return [a3 hasPrefix:@"itunes:"];
}

- (BOOL)_toneWithIdentifierIsSystemTone:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  char v13 = [v4 hasPrefix:@"texttone:"];
  if (*((unsigned char *)v11 + 24))
  {
    BOOL v5 = 1;
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__TLToneManager__toneWithIdentifierIsSystemTone___block_invoke;
    v7[3] = &unk_1E6C20EA0;
    v7[4] = self;
    id v8 = v4;
    int v9 = &v10;
    [(TLToneManager *)self _performBlockInAccessQueue:v7];

    BOOL v5 = *((unsigned char *)v11 + 24) != 0;
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __49__TLToneManager__toneWithIdentifierIsSystemTone___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _aliasForToneIdentifier:*(void *)(a1 + 40)];
  char v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
}

- (BOOL)_toneWithIdentifierIsAlarmWakeUp:(id)a3
{
  return [a3 hasPrefix:@"alarmWakeUp:"];
}

- (BOOL)_toneWithIdentifierIsMediaPlaybackArchive:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"mediaPlaybackArchive:"])
  {
    BOOL v5 = 1;
  }
  else
  {
    char v6 = [(TLToneManager *)self _underlyingPlaybackArchiveForToneIdentifier:v4];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (id)_newServiceConnection
{
  char v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.tonelibraryd"];
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F360AFD8];
  [v2 setRemoteObjectInterface:v3];
  [v2 resume];

  return v2;
}

- (id)_tonePreferencesFromService
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  BOOL v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__TLToneManager__tonePreferencesFromService__block_invoke;
  v17[3] = &unk_1E6C20D10;
  v17[4] = self;
  v17[5] = &v18;
  [(TLToneManager *)self _performBlockInAccessQueue:v17];
  id v3 = (void *)v19[5];
  if (!v3)
  {
    id v4 = [(TLToneManager *)self _newServiceConnection];
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__TLToneManager__tonePreferencesFromService__block_invoke_2;
    v15[3] = &unk_1E6C20EC8;
    char v6 = v5;
    id v16 = v6;
    id v7 = [v4 remoteObjectProxyWithErrorHandler:v15];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__TLToneManager__tonePreferencesFromService__block_invoke_768;
    v12[3] = &unk_1E6C20EF0;
    uint64_t v14 = &v18;
    id v8 = v6;
    char v13 = v8;
    [v7 retrieveCurrentTonePreferencesWithCompletionHandler:v12];

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    [v4 invalidate];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__TLToneManager__tonePreferencesFromService__block_invoke_770;
    v11[3] = &unk_1E6C20E78;
    v11[4] = self;
    v11[5] = &v18;
    [(TLToneManager *)self _performBlockInAccessQueue:v11];

    id v3 = (void *)v19[5];
  }
  id v9 = v3;
  _Block_object_dispose(&v18, 8);

  return v9;
}

void __44__TLToneManager__tonePreferencesFromService__block_invoke(uint64_t a1)
{
}

void __44__TLToneManager__tonePreferencesFromService__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TLLogToneManagement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44__TLToneManager__tonePreferencesFromService__block_invoke_2_cold_1(v3);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__TLToneManager__tonePreferencesFromService__block_invoke_768(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else if (v7)
  {
    id v9 = TLLogToneManagement();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __44__TLToneManager__tonePreferencesFromService__block_invoke_768_cold_1(v8);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__TLToneManager__tonePreferencesFromService__block_invoke_770(uint64_t a1)
{
}

- (BOOL)_setToneIdentifierUsingService:(id)a3 keyedByTopic:(id)a4 forPreferenceKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v11 = [(TLToneManager *)self _newServiceConnection];
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke;
  v20[3] = &unk_1E6C20EC8;
  char v13 = v12;
  BOOL v21 = v13;
  uint64_t v14 = [v11 remoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_771;
  v17[3] = &unk_1E6C20F18;
  id v19 = &v22;
  uint64_t v15 = v13;
  uint64_t v18 = v15;
  [v14 setCurrentToneIdentifier:v8 keyedByTopic:v9 forPreferenceKey:v10 completionHandler:v17];

  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  [v11 invalidate];
  LOBYTE(v14) = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)v14;
}

void __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TLLogToneManagement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_cold_1(v3);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_771(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else if (v5)
  {
    id v7 = TLLogToneManagement();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_771_cold_1(v6);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)currentToneIdentifierForAlertType:(int64_t)a3
{
  return [(TLToneManager *)self currentToneIdentifierForAlertType:a3 topic:0];
}

- (void)setCurrentToneIdentifier:(id)a3 forAlertType:(int64_t)a4
{
}

+ (id)_systemWideTonePreferenceKeyForAlertType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x1C)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = _TLToneManagerSystemWideTonePreferenceKeys[a3 - 1];
  }
  return v4;
}

- (id)_currentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  return [(TLToneManager *)self _currentToneIdentifierForAlertType:a3 topic:a4 allowsFallbackToDefaultPreferablyNonSilentToneForInvalidPersistedValue:1];
}

- (id)_currentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4 allowsFallbackToDefaultPreferablyNonSilentToneForInvalidPersistedValue:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = TLLogToneManagement();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromTLAlertType(a3);
    *(_DWORD *)buf = 138544130;
    uint64_t v51 = self;
    __int16 v52 = 2114;
    uint64_t v53 = v10;
    __int16 v54 = 2114;
    uint64_t v55 = (uint64_t)v8;
    __int16 v56 = 1024;
    *(_DWORD *)id v57 = v5;
    _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) topic:(%{public}@) allowsFallbackToDefaultPreferablyNonSilentToneForInvalidPersistedValue:(%{BOOL}u).", buf, 0x26u);
  }
  uint64_t v11 = [v8 length];
  dispatch_semaphore_t v12 = [(id)objc_opt_class() _systemWideTonePreferenceKeyForAlertType:a3];
  char v13 = v12;
  if (v12 && v11)
  {
    uint64_t v14 = [(__CFString *)v12 stringByAppendingString:@"-per-account"];

    char v13 = (__CFString *)v14;
  }
  id v15 = 0;
  LODWORD(v16) = 0;
  if (![0 length] && v13)
  {
    if (self->_shouldUseServiceToAccessTonePreferences)
    {
      id v17 = [(TLToneManager *)self _tonePreferencesFromService];
      uint64_t v18 = [v17 objectForKey:v13];

      id v19 = TLLogToneManagement();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = NSStringFromTLAlertType(a3);
        *(_DWORD *)buf = 138544130;
        uint64_t v51 = self;
        __int16 v52 = 2114;
        uint64_t v53 = v20;
        __int16 v54 = 2114;
        uint64_t v55 = (uint64_t)v13;
        __int16 v56 = 2114;
        *(void *)id v57 = v18;
        _os_log_impl(&dword_1DB936000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Read Preferences value for key '%{public}@' from service: %{public}@.", buf, 0x2Au);
      }
      if (v11)
      {
        id v15 = [v18 objectForKey:v8];
        id v16 = TLLogToneManagement();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v21 = NSStringFromTLAlertType(a3);
          *(_DWORD *)buf = 138543874;
          uint64_t v51 = self;
          __int16 v52 = 2114;
          uint64_t v53 = v21;
          __int16 v54 = 2114;
          uint64_t v55 = (uint64_t)v15;
          uint64_t v22 = "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Per-topic: currentToneIdentifier = %{public}@.";
LABEL_23:
          _os_log_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEFAULT, v22, buf, 0x20u);
        }
      }
      else
      {
        id v15 = v18;
        id v16 = TLLogToneManagement();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v21 = NSStringFromTLAlertType(a3);
          *(_DWORD *)buf = 138543874;
          uint64_t v51 = self;
          __int16 v52 = 2114;
          uint64_t v53 = v21;
          __int16 v54 = 2114;
          uint64_t v55 = (uint64_t)v15;
          uint64_t v22 = "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. currentToneIdentifier = %{public}@.";
          goto LABEL_23;
        }
      }

      LODWORD(v16) = 0;
      goto LABEL_41;
    }
    id v23 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
    if (!v23)
    {
      LODWORD(v16) = 0;
      id v15 = 0;
      goto LABEL_41;
    }
    uint64_t v24 = v23;
    id v16 = CFPreferencesCopyAppValue(v13, v23);
    char v25 = TLLogToneManagement();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = NSStringFromTLAlertType(a3);
      *(_DWORD *)buf = 138544386;
      uint64_t v51 = self;
      __int16 v52 = 2114;
      uint64_t v53 = v26;
      __int16 v54 = 2114;
      uint64_t v55 = (uint64_t)v13;
      __int16 v56 = 2114;
      *(void *)id v57 = v24;
      *(_WORD *)&v57[8] = 2114;
      *(void *)&v57[10] = v16;
      _os_log_impl(&dword_1DB936000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Read Preferences value for key '%{public}@' from domain '%{public}@': %{public}@.", buf, 0x34u);
    }
    if (!v16)
    {
      id v15 = 0;
LABEL_40:
      CFRelease(v24);
      goto LABEL_41;
    }
    if (v11)
    {
      uint64_t v27 = [v16 objectForKey:v8];
      id v28 = TLLogToneManagement();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v29 = id v48 = v27;
        *(_DWORD *)buf = 138543874;
        uint64_t v51 = self;
        __int16 v52 = 2114;
        uint64_t v53 = v29;
        __int16 v54 = 2114;
        uint64_t v55 = (uint64_t)v48;
        dispatch_semaphore_t v30 = "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Per-topic: persistedToneIdentifier = %{public}@.";
LABEL_29:
        _os_log_impl(&dword_1DB936000, v28, OS_LOG_TYPE_DEFAULT, v30, buf, 0x20u);

        uint64_t v27 = v48;
      }
    }
    else
    {
      uint64_t v27 = v16;
      id v28 = TLLogToneManagement();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v29 = id v48 = v27;
        *(_DWORD *)buf = 138543874;
        uint64_t v51 = self;
        __int16 v52 = 2114;
        uint64_t v53 = v29;
        __int16 v54 = 2114;
        uint64_t v55 = (uint64_t)v48;
        dispatch_semaphore_t v30 = "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. persistedToneIdentifier = %{public}@.";
        goto LABEL_29;
      }
    }

    cf = v16;
    if ([v27 length])
    {
      uint64_t v49 = v27;
      BOOL v46 = [(TLToneManager *)self toneWithIdentifierIsValid:v27];
      if (v46)
      {
        id v15 = [NSString stringWithString:v27];
        id v31 = TLLogToneManagement();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = NSStringFromTLAlertType(a3);
          *(_DWORD *)buf = 138543874;
          uint64_t v51 = self;
          __int16 v52 = 2114;
          uint64_t v53 = v32;
          __int16 v54 = 2114;
          uint64_t v55 = (uint64_t)v15;
          _os_log_impl(&dword_1DB936000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. currentToneIdentifier = %{public}@.", buf, 0x20u);
        }
      }
      else
      {
        id v31 = TLLogToneManagement();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = NSStringFromTLAlertType(a3);
          *(_DWORD *)buf = 138543618;
          uint64_t v51 = self;
          __int16 v52 = 2114;
          uint64_t v53 = v33;
          _os_log_impl(&dword_1DB936000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. persistedToneIdentifierWasInvalid = YES.", buf, 0x16u);
        }
        id v15 = 0;
      }
      LODWORD(v16) = !v46;

      uint64_t v27 = v49;
    }
    else
    {
      LODWORD(v16) = 0;
      id v15 = 0;
    }
    CFRelease(cf);

    goto LABEL_40;
  }
LABEL_41:
  if ([v15 length] || !v11)
  {
    if (!v16) {
      goto LABEL_62;
    }
  }
  else
  {
    uint64_t v34 = [(TLToneManager *)self _currentToneIdentifierForAlertType:a3 topic:0];

    __int16 v35 = TLLogToneManagement();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      char v36 = NSStringFromTLAlertType(a3);
      *(_DWORD *)buf = 138543874;
      uint64_t v51 = self;
      __int16 v52 = 2114;
      uint64_t v53 = v36;
      __int16 v54 = 2114;
      uint64_t v55 = (uint64_t)v34;
      _os_log_impl(&dword_1DB936000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Falling back to current tone without topic. currentToneIdentifier = %{public}@.", buf, 0x20u);
    }
    if (!v16)
    {
      id v15 = v34;
      goto LABEL_62;
    }
    if ([v34 isEqualToString:@"<none>"])
    {

      uint64_t v37 = TLLogToneManagement();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        long long v38 = NSStringFromTLAlertType(a3);
        *(_DWORD *)buf = 138543874;
        uint64_t v51 = self;
        __int16 v52 = 2114;
        uint64_t v53 = v38;
        __int16 v54 = 2114;
        uint64_t v55 = 0;
        _os_log_impl(&dword_1DB936000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid, and fallback value is none. Ignoring fallback value. currentToneIdentifier = %{public}@.", buf, 0x20u);
      }
      id v15 = 0;
    }
    else
    {
      id v15 = v34;
    }
  }
  if (![v15 length])
  {
    if (v5)
    {
      uint64_t v39 = [(TLToneManager *)self _defaultPreferablyNonSilentToneIdentifierForAlertType:a3 topic:v8];

      uint64_t v40 = TLLogToneManagement();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        long long v41 = NSStringFromTLAlertType(a3);
        *(_DWORD *)buf = 138543874;
        uint64_t v51 = self;
        __int16 v52 = 2114;
        uint64_t v53 = v41;
        __int16 v54 = 2114;
        uint64_t v55 = v39;
        _os_log_impl(&dword_1DB936000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid; falling back to"
          " non-silent default tone. currentToneIdentifier = %{public}@.",
          buf,
          0x20u);
      }
    }
    else
    {
      uint64_t v40 = TLLogVibrationManagement();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = NSStringFromTLAlertType(a3);
        *(_DWORD *)buf = 138543874;
        uint64_t v51 = self;
        __int16 v52 = 2114;
        uint64_t v53 = v42;
        __int16 v54 = 2114;
        uint64_t v55 = (uint64_t)v15;
        _os_log_impl(&dword_1DB936000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid, but falling back to non-silent default tone is disallowed. currentToneIdentifier = %{public}@.", buf, 0x20u);
      }
      uint64_t v39 = (uint64_t)v15;
    }

    id v15 = (id)v39;
  }
LABEL_62:
  uint64_t v43 = TLLogToneManagement();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    long long v44 = NSStringFromTLAlertType(a3);
    *(_DWORD *)buf = 138544386;
    uint64_t v51 = self;
    __int16 v52 = 2114;
    uint64_t v53 = v44;
    __int16 v54 = 2114;
    uint64_t v55 = (uint64_t)v8;
    __int16 v56 = 1024;
    *(_DWORD *)id v57 = v5;
    *(_WORD *)&v57[4] = 2114;
    *(void *)&v57[6] = v15;
    _os_log_impl(&dword_1DB936000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) topic:(%{public}@) allowsFallbackToDefaultPreferablyNonSilentToneForInvalidPersistedValue:(%{BOOL}u). Returning: %{public}@.", buf, 0x30u);
  }

  return v15;
}

- (id)currentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a4;
  id v7 = TLLogToneManagement();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromTLAlertType(a3);
    int v28 = 138543874;
    id v29 = self;
    __int16 v30 = 2114;
    id v31 = v8;
    __int16 v32 = 2114;
    id v33 = v6;
    _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) topic:(%{public}@).", (uint8_t *)&v28, 0x20u);
  }
  if (+[TLAlert _currentOverridePolicyForType:a3] != 1) {
    goto LABEL_7;
  }
  id v9 = @"<none>";
  id v10 = TLLogToneManagement();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = NSStringFromTLAlertType(a3);
    int v28 = 138543874;
    id v29 = self;
    __int16 v30 = 2114;
    id v31 = v11;
    __int16 v32 = 2114;
    id v33 = v9;
    _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Falling back to none due to alert override policy. toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);
  }
  if (!v9)
  {
LABEL_7:
    if (v6)
    {
      if (a3 == 13)
      {
        if ([(__CFString *)v6 isEqualToString:@"TLAlertTopicAlarmGoToSleep"])
        {
          TLLogToneManagement();
          id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
          {
LABEL_29:

LABEL_30:
            id v9 = [(TLToneManager *)self defaultToneIdentifierForAlertType:a3 topic:v6];
            id v17 = TLLogToneManagement();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = NSStringFromTLAlertType(a3);
              int v28 = 138543874;
              id v29 = self;
              __int16 v30 = 2114;
              id v31 = v18;
              __int16 v32 = 2114;
              id v33 = v9;
              _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Falling back to default due missing setting in Preferences. toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);
            }
            goto LABEL_33;
          }
          char v13 = NSStringFromTLAlertType(0xDuLL);
          int v28 = 138543874;
          id v29 = self;
          __int16 v30 = 2114;
          id v31 = v13;
          __int16 v32 = 2114;
          id v33 = v6;
          _os_log_impl(&dword_1DB936000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Skipping Preferences lookup for topic %{public}@.", (uint8_t *)&v28, 0x20u);
LABEL_28:

          goto LABEL_29;
        }
      }
      else if (a3 == 2)
      {
        if ([(__CFString *)v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentHeart"] & 1) != 0|| ([(__CFString *)v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentThumbsUp"] & 1) != 0|| ([(__CFString *)v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentThumbsDown"] & 1) != 0|| ([(__CFString *)v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentHaHa"] & 1) != 0|| ([(__CFString *)v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentExclamation"])
        {
          int v12 = 1;
        }
        else
        {
          int v12 = [(__CFString *)v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentQuestionMark"];
        }
        goto LABEL_20;
      }
    }
    int v12 = 0;
LABEL_20:
    id v9 = [(TLToneManager *)self _currentToneIdentifierForAlertType:a3 topic:v6];
    uint64_t v14 = TLLogToneManagement();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = NSStringFromTLAlertType(a3);
      int v28 = 138543874;
      id v29 = self;
      __int16 v30 = 2114;
      id v31 = v15;
      __int16 v32 = 2114;
      id v33 = v9;
      _os_log_impl(&dword_1DB936000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Value from Preferences lookup method: toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);
    }
    if (!v12 || ([(__CFString *)v9 isEqualToString:@"<none>"] & 1) != 0)
    {
      if (v9) {
        goto LABEL_33;
      }
      goto LABEL_30;
    }
    char v13 = TLLogToneManagement();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = NSStringFromTLAlertType(a3);
      int v28 = 138543874;
      id v29 = self;
      __int16 v30 = 2114;
      id v31 = v16;
      __int16 v32 = 2114;
      id v33 = @"<none>";
      _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Value from Preferences lookup method was not %{public}@; ignoring it.",
        (uint8_t *)&v28,
        0x20u);
    }
    goto LABEL_28;
  }
LABEL_33:
  if (a3 == 18)
  {
    id v19 = [(TLToneManager *)self currentToneIdentifierForAlertType:2 topic:v6];

    uint64_t v22 = TLLogToneManagement();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = NSStringFromTLAlertType(0x12uLL);
      int v28 = 138543874;
      id v29 = self;
      __int16 v30 = 2114;
      id v31 = v23;
      __int16 v32 = 2114;
      id v33 = (__CFString *)v19;
      _os_log_impl(&dword_1DB936000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Detected alert type for emergency alert. Resolving to current tone identifier for text messages: toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);
    }
    uint64_t v20 = (__CFString *)v19;
    goto LABEL_48;
  }
  if (a3 == 3)
  {
    id v19 = [(TLToneManager *)self currentToneIdentifierForAlertType:2 topic:v6];
    if (![v19 isEqualToString:@"<none>"])
    {
      uint64_t v20 = v9;
      goto LABEL_48;
    }
    uint64_t v20 = @"<none>";

    BOOL v21 = TLLogToneManagement();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = NSStringFromTLAlertType(3uLL);
      int v28 = 138543874;
      id v29 = self;
      __int16 v30 = 2114;
      id v31 = v24;
      __int16 v32 = 2114;
      id v33 = v20;
      _os_log_impl(&dword_1DB936000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Detected alert type for text message in conversation. toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);
    }
    goto LABEL_46;
  }
  if (a3 == 2
    && [(__CFString *)v6 isEqualToString:@"TLAlertTopicTextMessageInConversation"]&& ([(__CFString *)v9 isEqualToString:@"<none>"] & 1) == 0)
  {

    id v19 = TLLogToneManagement();
    uint64_t v20 = @"texttone:Text-Message-Alert-In-Conversation";
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
LABEL_48:

      id v9 = v20;
      goto LABEL_49;
    }
    BOOL v21 = NSStringFromTLAlertType(2uLL);
    int v28 = 138543874;
    id v29 = self;
    __int16 v30 = 2114;
    id v31 = v21;
    __int16 v32 = 2114;
    id v33 = @"texttone:Text-Message-Alert-In-Conversation";
    _os_log_impl(&dword_1DB936000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Detected topic for text message in conversation. toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);
LABEL_46:

    goto LABEL_48;
  }
LABEL_49:
  char v25 = TLLogToneManagement();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = NSStringFromTLAlertType(a3);
    int v28 = 138544130;
    id v29 = self;
    __int16 v30 = 2114;
    id v31 = v26;
    __int16 v32 = 2114;
    id v33 = v6;
    __int16 v34 = 2114;
    __int16 v35 = v9;
    _os_log_impl(&dword_1DB936000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) topic:(%{public}@). Returning: %{public}@.", (uint8_t *)&v28, 0x2Au);
  }

  return v9;
}

- (void)setCurrentToneIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 length];
  uint64_t v11 = TLLogToneManagement();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      char v13 = NSStringFromTLAlertType(a4);
      *(_DWORD *)char v25 = 138543874;
      *(void *)&v25[4] = v8;
      *(_WORD *)&v25[12] = 2114;
      *(void *)&v25[14] = v13;
      *(_WORD *)&v25[22] = 2114;
      id v26 = v9;
      uint64_t v14 = "setCurrentToneIdentifier:@\"%{public}@\" forAlertType:%{public}@ topic:@\"%{public}@\"";
      id v15 = v11;
      uint32_t v16 = 32;
LABEL_6:
      _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, v14, v25, v16);
    }
  }
  else if (v12)
  {
    char v13 = NSStringFromTLAlertType(a4);
    *(_DWORD *)char v25 = 138543618;
    *(void *)&v25[4] = v8;
    *(_WORD *)&v25[12] = 2114;
    *(void *)&v25[14] = v13;
    uint64_t v14 = "setCurrentToneIdentifier:@\"%{public}@\" forAlertType:%{public}@";
    id v15 = v11;
    uint32_t v16 = 22;
    goto LABEL_6;
  }

  id v17 = [(id)objc_opt_class() _systemWideTonePreferenceKeyForAlertType:a4];
  uint64_t v18 = v17;
  if (v10 && v17)
  {
    uint64_t v19 = [(__CFString *)v17 stringByAppendingString:@"-per-account"];

    uint64_t v18 = (__CFString *)v19;
  }
  if (v18)
  {
    if (self->_shouldUseServiceToAccessTonePreferences)
    {
      if (![(TLToneManager *)self _setToneIdentifierUsingService:v8 keyedByTopic:v9 forPreferenceKey:v18])goto LABEL_32; {
    }
      }
    else
    {
      uint64_t v20 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
      if (!v20) {
        goto LABEL_32;
      }
      CFStringRef v21 = v20;
      if (v10)
      {
        uint64_t v22 = (void *)CFPreferencesCopyAppValue(v18, v20);
        if (v22)
        {
          id v23 = v22;
          id v24 = (id)[v22 mutableCopy];
          CFRelease(v23);
        }
        else if ([v8 length])
        {
          id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        else
        {
          id v24 = 0;
        }
        if (objc_msgSend(v8, "length", *(_OWORD *)v25, *(void *)&v25[16], v26))
        {
          [v24 setObject:v8 forKey:v9];
        }
        else
        {
          [v24 removeObjectForKey:v9];
          if (![v24 count])
          {

            id v24 = 0;
          }
        }
        CFPreferencesSetAppValue(v18, v24, v21);
      }
      else
      {
        CFPreferencesSetAppValue(v18, v8, v20);
      }
      CFRelease(v21);
    }
    [(TLToneManager *)self _didSetTonePreferenceSuccessfullyWithKey:v18 inDomain:+[TLPreferencesUtilities preferencesDomain] usingPreferencesOfKind:1];
    if ((!v8 || ([v8 isEqualToString:@"<none>"] & 1) == 0)
      && +[TLAlert _currentOverridePolicyForType:a4] == 1)
    {
      +[TLAlert _setCurrentOverridePolicy:0 forType:a4];
    }
  }
LABEL_32:
}

- (id)currentToneNameForAlertType:(int64_t)a3
{
  id v4 = [(TLToneManager *)self currentToneIdentifierForAlertType:a3];
  BOOL v5 = [(TLToneManager *)self nameForToneIdentifier:v4];

  return v5;
}

- (unsigned)currentToneSoundIDForAlertType:(int64_t)a3
{
  return [(TLToneManager *)self currentToneSoundIDForAlertType:a3 topic:0];
}

- (unsigned)currentToneSoundIDForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6 = a4;
  id v7 = [(TLToneManager *)self currentToneIdentifierForAlertType:a3 topic:v6];
  id v8 = [(TLToneManager *)self _soundForToneIdentifier:v7];
  if (!v8)
  {
    id v9 = [(TLToneManager *)self defaultToneIdentifierForAlertType:a3 topic:v6];
    id v8 = [(TLToneManager *)self _soundForToneIdentifier:v9];
  }
  unsigned int v10 = [v8 soundID];

  return v10;
}

+ (id)_defaultWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((unint64_t)(a3 - 1) > 0x1C)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = _TLToneManagerDefaultWatchIdentifiers[a3 - 1];
    if (![(__CFString *)v7 length])
    {
      id v8 = @"<none>";

      id v7 = v8;
    }
  }
  if (a3 == 28 || a3 == 1)
  {
    id v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    unsigned int v10 = [v9 objectForKey:*MEMORY[0x1E4F1C400]];

    uint64_t v11 = [v10 caseInsensitiveCompare:@"us"];
    if (a3 == 1)
    {
      if (([v6 isEqualToString:@"_TLAlertTopicIncomingCallDeemphasized"] & 1) == 0)
      {
LABEL_14:
        if (v11)
        {

          id v7 = @"texttone:Incoming-Call-Haptic-UK";
        }
        goto LABEL_16;
      }
    }
    else if (![v6 isEqualToString:@"_TLAlertTopicClassroomDeemphasized"])
    {
      goto LABEL_14;
    }

    if (v11) {
      id v7 = @"texttone:Incoming-Call-Haptic-Deemphasized-UK";
    }
    else {
      id v7 = @"texttone:Incoming-Call-Haptic-Deemphasized-US";
    }
LABEL_16:
  }
  BOOL v12 = +[TLCapabilitiesManager sharedCapabilitiesManager];
  int v13 = [v12 supportsNanoEncore];

  if (v13)
  {
    if (a3 == 1)
    {
      int v14 = [v6 isEqualToString:@"_TLAlertTopicIncomingCallDeemphasized"];

      if (v14) {
        id v7 = @"system:Pebbles-Deemphasized";
      }
      else {
        id v7 = @"system:Pebbles";
      }
LABEL_41:
      if ([v6 isEqualToString:@"TLAlertTopicIncomingCallFaceTimeGroupInvitation"])
      {
        id v15 = @"texttone:FaceTime-Group-Invitation";
      }
      else
      {
        if (([v6 isEqualToString:@"TLAlertTopicIncomingCallFaceTimeParticipantJoined"] & 1) == 0) {
          goto LABEL_108;
        }
        id v15 = @"texttone:FaceTime-Participant-Joined";
      }
      goto LABEL_107;
    }
    id v15 = @"texttone:Resonate";
    switch(a3)
    {
      case 2:

        id v7 = @"texttone:Resonate";
        goto LABEL_57;
      case 3:
      case 6:
      case 7:
      case 8:
      case 9:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 18:
        goto LABEL_40;
      case 4:
        break;
      case 5:

        id v7 = @"texttone:Resonate";
        goto LABEL_60;
      case 10:
      case 11:
        id v15 = @"texttone:Moment";
        break;
      case 17:

        id v7 = @"texttone:Globe";
LABEL_64:
        if ([v6 isEqualToString:@"TLAlertTopicAppNotificationCriticalAlert"])
        {
          id v15 = @"texttone:App-Notification-Critical-Alert";
          break;
        }
        if (([v6 isEqualToString:@"TLAlertTopicAppNotificationFirstParty"] & 1) == 0) {
          goto LABEL_108;
        }
        id v15 = @"texttone:App-Notification-First-Party-Haptic";
        break;
      case 19:
        goto LABEL_31;
      case 20:
        goto LABEL_25;
      default:
        if (a3 == 24) {
          goto LABEL_38;
        }
        goto LABEL_40;
    }
LABEL_107:

    id v7 = v15;
    goto LABEL_108;
  }
  switch(a3)
  {
    case 19:
LABEL_31:
      if ([v6 isEqualToString:@"TLAlertTopicActivityGoalAttained"])
      {
        id v15 = @"texttone:Activity-Goal-Attained-Haptic";
      }
      else if ([v6 isEqualToString:@"TLAlertTopicActivityGoalBehind"])
      {
        id v15 = @"texttone:Activity-Goal-Behind-Haptic";
      }
      else
      {
        if (([v6 isEqualToString:@"TLAlertTopicActivityFriendsGoalAttained"] & 1) == 0) {
          break;
        }
        id v15 = @"texttone:Activity-Friends-Goal-Attained-Haptic";
      }
      goto LABEL_107;
    case 24:
LABEL_38:
      if ([v6 isEqualToString:@"TLAlertTopicWalkieTalkieActiveStart"])
      {
        id v15 = @"texttone:Walkie-Talkie-Active-Start-Haptic";
      }
      else
      {
        if (([v6 isEqualToString:@"TLAlertTopicWalkieTalkieActiveEnd"] & 1) == 0) {
          break;
        }
        id v15 = @"texttone:Walkie-Talkie-Active-End-Haptic";
      }
      goto LABEL_107;
    case 20:
LABEL_25:
      if ([v6 isEqualToString:@"TLAlertTopicPassbookGeofence"])
      {

        id v7 = @"texttone:Passbook-Geofence-Haptic";
      }
      if ([v6 isEqualToString:@"TLAlertTopicPassbookNFCScanComplete"])
      {
        id v15 = @"texttone:Passbook-NFC-Scan-Complete";
        goto LABEL_107;
      }
      break;
    default:
LABEL_40:
      if (a3 == 1) {
        goto LABEL_41;
      }
      if (a3 > 12)
      {
        switch(a3)
        {
          case 13:
            if ([v6 isEqualToString:@"TLAlertTopicAlarmGoToSleep"])
            {
              uint32_t v16 = @"texttone:Go-To-Sleep";
            }
            else
            {
              if (![v6 isEqualToString:@"TLAlertTopicAlarmWakeUp"]) {
                goto LABEL_85;
              }
              uint32_t v16 = @"alarmWakeUp:Early_Riser";
            }

            id v7 = v16;
LABEL_85:
            if (([v6 isEqualToString:@"TLAlertTopicAlarmNightstand"] & 1) == 0) {
              goto LABEL_108;
            }
            id v15 = @"texttone:Alarm-Nightstand-Haptic";
            goto LABEL_107;
          case 16:
            if ([v6 isEqualToString:@"TLAlertTopicSystemNotificationBackgroundMicUsage"])
            {
              id v15 = @"texttone:System Background Mic Usage";
              goto LABEL_107;
            }
            if ([v6 isEqualToString:@"TLAlertTopicSystemNotificationDoorbell"])
            {
              id v15 = @"system:Doorbell";
              goto LABEL_107;
            }
            if ([v6 isEqualToString:@"TLAlertTopicSystemNotificationElevationAlert"])
            {
              id v15 = @"texttone:Elevation Alert";
              goto LABEL_107;
            }
            if (([v6 isEqualToString:@"TLAlertTopicSystemNotificationHeadphoneAudioExposure"] & 1) == 0) {
              goto LABEL_108;
            }
            id v15 = @"texttone:Headphone-Audio-Exposure-Limit-Exceeded";
            goto LABEL_107;
          case 17:
            goto LABEL_64;
          case 22:
            if ([v6 isEqualToString:@"TLAlertTopicSOSCountdownTick"])
            {
              id v15 = @"texttone:SOS-Countdown-Tick";
              goto LABEL_107;
            }
            if (![v6 isEqualToString:@"TLAlertTopicSOSDialStart"]
              && ![v6 isEqualToString:@"TLAlertTopicSOSButtonChordingTimeout"]
              && ![v6 isEqualToString:@"TLAlertTopicSOSCountdownPreannounce"])
            {
              goto LABEL_108;
            }
            id v15 = @"<none>";
            goto LABEL_107;
          case 25:
            if (([v6 isEqualToString:@"TLAlertTopicHealthUrgent"] & 1) == 0) {
              goto LABEL_108;
            }
            id v15 = @"texttone:Health-Urgent";
            goto LABEL_107;
          case 27:
            if ([v6 isEqualToString:@"TLAlertTopicHandwashingReminder"])
            {
              id v15 = @"texttone:Handwashing-Reminder";
              goto LABEL_107;
            }
            if ([v6 isEqualToString:@"TLAlertTopicHandwashingSessionStart"])
            {
              id v15 = @"texttone:Handwashing-Session-Start";
              goto LABEL_107;
            }
            if (![v6 isEqualToString:@"TLAlertTopicHandwashingSessionEnd"]) {
              goto LABEL_108;
            }
            id v15 = @"texttone:Handwashing-Session-End";
            break;
          default:
            goto LABEL_108;
        }
        goto LABEL_107;
      }
      if (a3 == 2)
      {
LABEL_57:
        if ([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentHeart"])
        {
          id v15 = @"texttone:Text-Message-Acknowledgment-Heart";
        }
        else if ([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentThumbsUp"])
        {
          id v15 = @"texttone:Text-Message-Acknowledgment-Thumbs-Up";
        }
        else if ([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentThumbsDown"])
        {
          id v15 = @"texttone:Text-Message-Acknowledgment-Thumbs-Down";
        }
        else if ([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentHaHa"])
        {
          id v15 = @"texttone:Text-Message-Acknowledgment-HaHa";
        }
        else if ([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentExclamation"])
        {
          id v15 = @"texttone:Text-Message-Acknowledgment-Exclamation";
        }
        else
        {
          if (([v6 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentQuestionMark"] & 1) == 0) {
            break;
          }
          id v15 = @"texttone:Text-Message-Acknowledgment-Question-Mark";
        }
        goto LABEL_107;
      }
      if (a3 != 5)
      {
        if (a3 != 9) {
          break;
        }
        if ([v6 isEqualToString:@"TLAlertTopicPhotosNotificationSharingPost"])
        {
          id v15 = @"texttone:Photos Sharing Post";
        }
        else
        {
          if (([v6 isEqualToString:@"TLAlertTopicPhotosNotificationMemory"] & 1) == 0) {
            break;
          }
          id v15 = @"texttone:Photos Memory";
        }
        goto LABEL_107;
      }
LABEL_60:
      if (([v6 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.VIP"] & 1) != 0
        || ([v6 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.ThreadNotify"] & 1) != 0)
      {
        id v15 = @"texttone:New-Mail-Haptic";
        goto LABEL_107;
      }
      break;
  }
LABEL_108:
  id v17 = TLLogToneManagement();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = NSStringFromTLAlertType(a3);
    int v20 = 138544130;
    id v21 = a1;
    __int16 v22 = 2114;
    id v23 = v18;
    __int16 v24 = 2114;
    id v25 = v6;
    __int16 v26 = 2114;
    uint64_t v27 = v7;
    _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: +_defaultWatchToneIdentifierForAlertType:(%{public}@) topic:(%{public}@). Returning: %{public}@.", (uint8_t *)&v20, 0x2Au);
  }

  return v7;
}

- (id)defaultWatchToneIdentifierForAlertType:(int64_t)a3
{
  return [(TLToneManager *)self defaultWatchToneIdentifierForAlertType:a3 topic:0];
}

- (id)defaultWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5 = a4;
  id v6 = [(id)objc_opt_class() _defaultWatchToneIdentifierForAlertType:a3 topic:v5];

  return v6;
}

- (id)defaultRingtoneIdentifier
{
  return [(TLToneManager *)self defaultToneIdentifierForAlertType:1];
}

- (id)_defaultRingtoneName
{
  char v2 = +[TLCapabilitiesManager sharedCapabilitiesManager];
  int v3 = [v2 wantsModernDefaultRingtone];

  if (!v3
    || (TLLocalizedString(@"RINGTONE_PICKER_DEFAULT_MODERN_RINGTONE_NAME"),
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = TLLocalizedString(@"RINGTONE_PICKER_DEFAULT_RINGTONE_NAME");
  }

  return v4;
}

- (id)_defaultRingtonePath
{
  int v3 = [(TLToneManager *)self defaultRingtoneIdentifier];
  id v4 = [(TLToneManager *)self filePathForToneIdentifier:v3];

  return v4;
}

- (id)_defaultPreferablyNonSilentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6 = [(TLToneManager *)self defaultToneIdentifierForAlertType:a3 topic:a4];
  int v7 = [v6 isEqualToString:@"<none>"];
  if (a3 == 5 && v7)
  {
    uint64_t v8 = [(TLToneManager *)self defaultToneIdentifierForAlertType:5 topic:@"com.apple.mobilemail.bulletin-subsection.VIP"];

    id v6 = (void *)v8;
  }

  return v6;
}

- (BOOL)hasSpecificDefaultToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6 = a4;
  if ([v6 length])
  {
    int v7 = [(TLToneManager *)self defaultToneIdentifierForAlertType:a3];
    uint64_t v8 = [(TLToneManager *)self defaultToneIdentifierForAlertType:a3 topic:v6];
    int v9 = [v8 isEqualToString:v7] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)_soundForToneIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  __int16 v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  id v5 = [(TLToneManager *)self _aliasForToneIdentifier:v4];
  if ([(TLToneManager *)self _toneWithIdentifierIsSystemTone:v5]
    || [v5 isEqualToString:@"<none>"])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__TLToneManager__soundForToneIdentifier___block_invoke;
    v15[3] = &unk_1E6C20EA0;
    void v15[4] = self;
    id v16 = v5;
    id v17 = &v18;
    [(TLToneManager *)self _performBlockInAccessQueue:v15];
  }
  else if ([(TLToneManager *)self _toneWithIdentifierIsITunesRingtone:v5] {
         || [(TLToneManager *)self _toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:v5]|| [(TLToneManager *)self _toneWithIdentifierIsDefaultRingtone:v5]|| [(TLToneManager *)self _toneWithIdentifierIsAlarmWakeUp:v5])
  }
  {
    if (_soundForToneIdentifier__sOnce != -1) {
      dispatch_once(&_soundForToneIdentifier__sOnce, &__block_literal_global_860);
    }
    if ([(TLToneManager *)self toneWithIdentifierIsValid:v5])
    {
      unsigned int v10 = _soundForToneIdentifier__sSoundCacheAccessQueue;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __41__TLToneManager__soundForToneIdentifier___block_invoke_3;
      v11[3] = &unk_1E6C20D88;
      int v14 = &v18;
      id v12 = v5;
      int v13 = self;
      dispatch_sync(v10, v11);
    }
  }
  id v6 = TLLogToneManagement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v19[5];
    *(_DWORD *)buf = 138543618;
    id v25 = v4;
    __int16 v26 = 2114;
    uint64_t v27 = v7;
    _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "_soundForToneIdentifier %{public}@ ==> %{public}@", buf, 0x16u);
  }

  id v8 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __41__TLToneManager__soundForToneIdentifier___block_invoke(void *a1)
{
  char v2 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 actualSound];
    uint64_t v4 = *(void *)(a1[6] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    char v2 = v6;
  }
}

uint64_t __41__TLToneManager__soundForToneIdentifier___block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_soundForToneIdentifier__sSoundCache;
  _soundForToneIdentifier__sSoundCache = (uint64_t)v0;

  _soundForToneIdentifier__sSoundCacheAccessQueue = (uint64_t)dispatch_queue_create("com.apple.ToneLibrary.TLToneManager.soundCacheAccessQueue", 0);

  return MEMORY[0x1F41817F8]();
}

void __41__TLToneManager__soundForToneIdentifier___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [(id)_soundForToneIdentifier__sSoundCache objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v13 = [*(id *)(a1 + 40) filePathForToneIdentifier:*(void *)(a1 + 32)];
    id v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:");
    uint64_t v6 = [*(id *)(a1 + 40) _toneWithIdentifierIsAlarmWakeUp:*(void *)(a1 + 32)];
    uint64_t v7 = [TLSystemSound alloc];
    uint64_t v8 = [(TLSystemSound *)v7 initWithSoundFileURL:v5 soundID:kSystemSoundID_InvalidTone requiresLongFormPlayback:v6];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    unsigned int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) soundID])
    {
      [(id)_soundForToneIdentifier__sSoundCache setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0;
    }
  }
}

- (id)filePathForToneIdentifier:(id)a3
{
  return [(TLToneManager *)self _filePathForToneIdentifier:a3 isValid:0];
}

- (id)_filePathForToneIdentifier:(id)a3 isValid:(BOOL *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__TLToneManager__filePathForToneIdentifier_isValid___block_invoke;
  v12[3] = &unk_1E6C20F40;
  id v7 = v6;
  id v13 = v7;
  int v14 = self;
  id v15 = &v23;
  id v16 = &v17;
  [(TLToneManager *)self _performBlockInAccessQueue:v12];
  if (a4) {
    *a4 = *((unsigned char *)v24 + 24);
  }
  uint64_t v8 = TLLogToneManagement();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v18[5];
    *(_DWORD *)buf = 138543618;
    id v28 = v7;
    __int16 v29 = 2114;
    uint64_t v30 = v9;
    _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "filePathForToneIdentifier: %{public}@ ==> %{public}@", buf, 0x16u);
  }

  id v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v10;
}

void __52__TLToneManager__filePathForToneIdentifier_isValid___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v2 = [*(id *)(a1 + 40) _aliasForToneIdentifier:*(void *)(a1 + 32)];
    if ([*(id *)(a1 + 40) _toneWithIdentifierIsDefaultRingtone:v2])
    {
      uint64_t v3 = +[TLCapabilitiesManager sharedCapabilitiesManager];
      int v4 = [v3 wantsModernDefaultRingtone];

      if (v4) {
        id v5 = @"Reflection";
      }
      else {
        id v5 = @"Opening";
      }
LABEL_9:
      uint64_t v9 = [*(id *)(a1 + 40) _systemRingtoneDirectory];
      if (_os_feature_enabled_impl())
      {
        id v10 = [(__CFString *)v5 stringByAppendingString:@"-EncoreInfinitum"];
        uint64_t v11 = [v9 stringByAppendingPathComponent:v10];
        id v6 = [v11 stringByAppendingPathExtension:@"m4r"];

        id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v13 = [v12 fileExistsAtPath:v6];

        if (v13)
        {

          if (v6)
          {
LABEL_18:

            goto LABEL_19;
          }
        }
        else
        {
        }
      }
      uint64_t v19 = [v9 stringByAppendingPathComponent:v5];
      id v6 = [v19 stringByAppendingPathExtension:@"m4r"];

      goto LABEL_18;
    }
    char v7 = [*(id *)(a1 + 40) _toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:v2];
    uint64_t v8 = *(void **)(a1 + 40);
    if (v7)
    {
      id v5 = [v8 _fileNameFromToneIdentifier:v2 withPrefix:@"system:"];
      goto LABEL_9;
    }
    int v14 = [v8 _toneWithIdentifierIsAlarmWakeUp:v2];
    id v15 = *(void **)(a1 + 40);
    if (v14)
    {
      id v16 = [v15 _fileNameFromToneIdentifier:v2 withPrefix:@"alarmWakeUp:"];
      uint64_t v17 = [*(id *)(a1 + 40) _alarmWakeUpRingtoneDirectory];
      uint64_t v18 = [v17 stringByAppendingPathComponent:v16];

      id v6 = [v18 stringByAppendingPathExtension:@"m4r"];

      if (!v6) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    int v24 = [v15 _toneWithIdentifierIsITunesRingtone:v2];
    uint64_t v25 = *(id **)(a1 + 40);
    if (v24)
    {
      id v5 = [v25[2] objectForKey:v2];
      uint64_t v26 = [(__CFString *)v5 filePath];
      id v6 = (id)v26;
      if (v26) {
        LOBYTE(v26) = [(id)objc_opt_class() _ensureTCCAccessPreflightAndCheckForFileExistenceAtPath:v26];
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v26;
    }
    else
    {
      if (![v25 _toneWithIdentifierIsSystemTone:v2])
      {
        id v6 = v2;
        if (!v6) {
          goto LABEL_21;
        }
LABEL_20:
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:
        uint64_t v20 = [*(id *)(a1 + 40) _defaultRingtonePath];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        id v6 = (id)v20;
        goto LABEL_22;
      }
      uint64_t v27 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:v2];
      id v5 = v27;
      if (v27
        && ([(__CFString *)v27 soundFileURL],
            id v28 = objc_claimAutoreleasedReturnValue(),
            [v28 path],
            id v6 = (id)objc_claimAutoreleasedReturnValue(),
            v28,
            v6))
      {
        __int16 v29 = [MEMORY[0x1E4F28CB8] defaultManager];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v29 fileExistsAtPath:v6];

        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {
          uint64_t v9 = TLLogToneManagement();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v30 = *(void *)(a1 + 40);
            int v31 = 138543618;
            uint64_t v32 = v30;
            __int16 v33 = 2114;
            id v34 = v6;
            _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: File DOES NOT exist at path %{public}@.", (uint8_t *)&v31, 0x16u);
          }
          goto LABEL_18;
        }
      }
      else
      {
        id v6 = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
    }
LABEL_19:

    if (!v6) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  id v6 = 0;
LABEL_23:
  uint64_t v21 = [v6 copy];
  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;
}

- (id)_previewSoundForToneIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = kSystemSoundID_InvalidTone;
  if ([(TLToneManager *)self _toneWithIdentifierIsSystemTone:v4]
    || [v4 isEqualToString:@"<none>"])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__TLToneManager__previewSoundForToneIdentifier___block_invoke;
    v15[3] = &unk_1E6C20F40;
    void v15[4] = self;
    id v16 = v4;
    uint64_t v17 = &v23;
    uint64_t v18 = &v19;
    [(TLToneManager *)self _performBlockInAccessQueue:v15];
  }
  else if ([(TLToneManager *)self _toneWithIdentifierIsITunesRingtone:v4] {
         || [(TLToneManager *)self _toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:v4]|| [(TLToneManager *)self _toneWithIdentifierIsDefaultRingtone:v4]|| [(TLToneManager *)self _toneWithIdentifierIsAlarmWakeUp:v4])
  }
  {
    id v5 = [(TLToneManager *)self filePathForToneIdentifier:v4];
    id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
    BOOL v7 = [(TLToneManager *)self _toneWithIdentifierIsAlarmWakeUp:v4];
    uint64_t v8 = [TLSystemSound alloc];
    uint64_t v9 = [(TLSystemSound *)v8 initWithSoundFileURL:v6 soundID:kSystemSoundID_InvalidTone requiresLongFormPlayback:v7];
    id v10 = (void *)v24[5];
    v24[5] = v9;

    int v11 = [(id)v24[5] soundID];
    *((_DWORD *)v20 + 6) = v11;
  }
  if (*((_DWORD *)v20 + 6) == kSystemSoundID_NoneTone)
  {
    id v12 = (void *)v24[5];
    v24[5] = 0;
  }
  id v13 = (id)v24[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __48__TLToneManager__previewSoundForToneIdentifier___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _aliasForToneIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKey:");
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 previewSound];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40) soundID];
  }
}

- (id)nameForToneIdentifier:(id)a3
{
  return [(TLToneManager *)self _nameForToneIdentifier:a3 isValid:0];
}

- (id)_nameForToneIdentifier:(id)a3 isValid:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__TLToneManager__nameForToneIdentifier_isValid___block_invoke;
  v10[3] = &unk_1E6C20F68;
  v10[4] = self;
  id v7 = v6;
  id v12 = &v14;
  id v13 = a4;
  id v11 = v7;
  [(TLToneManager *)self _performBlockInAccessQueue:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __48__TLToneManager__nameForToneIdentifier_isValid___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _aliasForToneIdentifier:*(void *)(a1 + 40)];
  if (([*(id *)(a1 + 32) _toneWithIdentifierIsSystemTone:v2] & 1) != 0
    || [v2 isEqualToString:@"<none>"])
  {
    if ([v2 isEqualToString:@"<none>"]) {
      TLLocalizedString(@"RINGTONE_PICKER_NONE");
    }
    else {
    uint64_t v3 = [*(id *)(a1 + 32) _localizedNameOfToneWithIdentifier:v2];
    }
    uint64_t v4 = (void *)v3;
    uint64_t v5 = *(BOOL **)(a1 + 56);
    if (v5) {
      *uint64_t v5 = v3 != 0;
    }
    goto LABEL_40;
  }
  if (![v2 length])
  {
    uint64_t v4 = 0;
    LOBYTE(v9) = 1;
    goto LABEL_38;
  }
  int v6 = [*(id *)(a1 + 32) _toneWithIdentifierIsDefaultRingtone:v2];
  id v7 = *(void **)(a1 + 32);
  if (v6) {
    goto LABEL_10;
  }
  int v10 = [v7 _toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:v2];
  id v11 = *(void **)(a1 + 32);
  if (v10)
  {
    uint64_t v12 = [v11 _localizedNameOfToneWithIdentifier:v2];
    if (!v12)
    {
      id v13 = *(void **)(a1 + 32);
      uint64_t v14 = @"system:";
LABEL_26:
      id v23 = [v13 _fileNameFromToneIdentifier:v2 withPrefix:v14];
      goto LABEL_27;
    }
    goto LABEL_19;
  }
  int v15 = [v11 _toneWithIdentifierIsAlarmWakeUp:v2];
  uint64_t v16 = *(void **)(a1 + 32);
  if (v15)
  {
    uint64_t v12 = [v16 _localizedNameOfToneWithIdentifier:v2];
    if (!v12)
    {
      id v13 = *(void **)(a1 + 32);
      uint64_t v14 = @"alarmWakeUp:";
      goto LABEL_26;
    }
LABEL_19:
    uint64_t v4 = (void *)v12;
    id v8 = 0;
    LOBYTE(v9) = 1;
    goto LABEL_37;
  }
  int v17 = [v16 _toneWithIdentifierIsITunesRingtone:v2];
  uint64_t v18 = *(id **)(a1 + 32);
  if (v17)
  {
    id v19 = [v18[2] objectForKey:v2];
    uint64_t v20 = [v19 filePath];
    uint64_t v4 = [v19 name];
    if (v4) {
      LODWORD(v9) = [(id)objc_opt_class() _ensureTCCAccessPreflightAndCheckForFileExistenceAtPath:v20];
    }
    else {
      LODWORD(v9) = 0;
    }
    uint64_t v26 = TLLogToneManagement();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)(a1 + 40);
      int v33 = 138544642;
      uint64_t v34 = v27;
      __int16 v35 = 2114;
      uint64_t v36 = v28;
      __int16 v37 = 2112;
      long long v38 = v19;
      __int16 v39 = 2112;
      uint64_t v40 = v4;
      __int16 v41 = 2114;
      id v42 = v20;
      __int16 v43 = 1024;
      int v44 = (int)v9;
      _os_log_impl(&dword_1DB936000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Checking validity of tone with identifier '%{public}@': %@. Name: '%@'. File path: '%{public}@'. Is valid? %{BOOL}u.", (uint8_t *)&v33, 0x3Au);
    }

LABEL_35:
    id v8 = 0;
    if (v4) {
      goto LABEL_37;
    }
LABEL_36:
    uint64_t v4 = [*(id *)(a1 + 32) _defaultRingtoneName];
    LOBYTE(v9) = 0;
    goto LABEL_37;
  }
  int v21 = [v18 _toneWithIdentifierIsMediaPlaybackArchive:v2];
  int v22 = *(void **)(a1 + 32);
  if (v21)
  {
    id v19 = [v22 _underlyingPlaybackArchiveForToneIdentifier:*(void *)(a1 + 40)];
    uint64_t v9 = [v19 displayProperties];
    uint64_t v4 = [v9 title];

    LOBYTE(v9) = v4 != 0;
    goto LABEL_35;
  }
  int v24 = [v22 _defaultRingtonePath];
  int v25 = [v2 isEqualToString:v24];

  if (v25)
  {
    id v7 = *(void **)(a1 + 32);
LABEL_10:
    uint64_t v4 = [v7 _defaultRingtoneName];
    id v8 = 0;
    goto LABEL_11;
  }
  id v23 = v2;
LABEL_27:
  id v8 = v23;
  if (!v23) {
    goto LABEL_36;
  }
  uint64_t v4 = [v23 lastPathComponent];
LABEL_11:
  LOBYTE(v9) = 1;
  if (!v4) {
    goto LABEL_36;
  }
LABEL_37:

LABEL_38:
  __int16 v29 = *(unsigned char **)(a1 + 56);
  if (v29) {
    unsigned char *v29 = (_BYTE)v9;
  }
LABEL_40:
  uint64_t v30 = [v4 copy];
  uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v32 = *(void **)(v31 + 40);
  *(void *)(v31 + 40) = v30;
}

- (id)subtitleForToneIdentifier:(id)a3
{
  uint64_t v3 = [(TLToneManager *)self _underlyingPlaybackArchiveForToneIdentifier:a3];
  uint64_t v4 = [v3 displayProperties];
  uint64_t v5 = [v4 subtitle];

  return v5;
}

- (id)_toneIdentifierForFileAtPath:(id)a3 isValid:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke;
  v15[3] = &unk_1E6C20EA0;
  id v7 = v6;
  id v16 = v7;
  int v17 = self;
  uint64_t v18 = &v19;
  [(TLToneManager *)self _performBlockInAccessQueue:v15];
  id v8 = v20;
  if (a4) {
    *a4 = v20[5] != 0;
  }
  uint64_t v9 = (void *)v8[5];
  if (!v9)
  {
    int v10 = [(TLToneManager *)self defaultRingtoneIdentifier];
    uint64_t v11 = [v10 copy];
    uint64_t v12 = (void *)v20[5];
    v20[5] = v11;

    uint64_t v9 = (void *)v20[5];
  }
  id v13 = v9;

  _Block_object_dispose(&v19, 8);

  return v13;
}

void __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke(uint64_t a1)
{
  uint64_t v40 = 0;
  __int16 v41 = &v40;
  uint64_t v42 = 0x3032000000;
  __int16 v43 = __Block_byref_object_copy_;
  int v44 = __Block_byref_object_dispose_;
  id v45 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) lastPathComponent];
  uint64_t v3 = [*(id *)(a1 + 32) stringByDeletingLastPathComponent];
  uint64_t v4 = [*(id *)(a1 + 40) _iTunesRingtoneDirectory];
  if (v4 && ([v3 isEqualToString:v4] & 1) != 0
    || ([*(id *)(a1 + 40) _deviceITunesRingtoneDirectory],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v3 isEqualToString:v5],
        v5,
        v6))
  {
    id v7 = *(void **)(*(void *)(a1 + 40) + 16);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke_2;
    v37[3] = &unk_1E6C20F90;
    id v38 = *(id *)(a1 + 32);
    __int16 v39 = &v40;
    [v7 enumerateKeysAndObjectsUsingBlock:v37];
    id v8 = v38;
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v9 = *(void **)(a1 + 32);
  int v10 = [*(id *)(a1 + 40) _defaultRingtonePath];
  LODWORD(v9) = [v9 isEqualToString:v10];

  uint64_t v11 = *(void **)(a1 + 40);
  if (v9)
  {
    uint64_t v12 = [v11 defaultRingtoneIdentifier];
    id v8 = (void *)v41[5];
    v41[5] = v12;
    goto LABEL_15;
  }
  id v13 = [v11 _systemRingtoneDirectory];
  int v14 = [v3 isEqualToString:v13];

  if (v14)
  {
    id v8 = [v2 stringByDeletingPathExtension];
    uint64_t v15 = [@"system:" stringByAppendingString:v8];
    id v16 = (void *)v41[5];
    v41[5] = v15;

    goto LABEL_15;
  }
  int v17 = [*(id *)(a1 + 40) _systemSoundDirectory];
  int v18 = [v3 isEqualToString:v17];

  if (v18) {
    goto LABEL_14;
  }
  uint64_t v19 = [*(id *)(a1 + 40) _systemEmbeddedSoundDirectory];
  char v20 = [v3 isEqualToString:v19];

  if (v20) {
    goto LABEL_14;
  }
  uint64_t v21 = [*(id *)(a1 + 40) _systemEmbeddedClassicSoundDirectory];
  char v22 = [v3 isEqualToString:v21];

  if (v22) {
    goto LABEL_14;
  }
  id v23 = [*(id *)(a1 + 40) _systemEmbeddedModernSoundDirectory];
  char v24 = [v3 isEqualToString:v23];

  if ((v24 & 1) != 0
    || ([*(id *)(a1 + 40) _systemWatchSoundDirectory],
        int v25 = objc_claimAutoreleasedReturnValue(),
        int v26 = [v3 isEqualToString:v25],
        v25,
        v26))
  {
LABEL_14:
    uint64_t v27 = *(void **)(*(void *)(a1 + 40) + 32);
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    int v33 = __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke_3;
    uint64_t v34 = &unk_1E6C20FB8;
    id v35 = *(id *)(a1 + 32);
    uint64_t v36 = &v40;
    [v27 enumerateKeysAndObjectsUsingBlock:&v31];
    id v8 = v35;
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v28 = objc_msgSend((id)v41[5], "copy", v31, v32, v33, v34);
  uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v30 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v28;

  _Block_object_dispose(&v40, 8);
}

void __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v8 = [a3 filePath];
  if ([v8 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v8 = [a3 soundFileURL];
  id v9 = [v8 path];

  if ([v9 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)_toneWithIdentifierIsValid:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  if ([v4 length])
  {
    uint64_t v5 = [(TLToneManager *)self _aliasForToneIdentifier:v4];
    if ([(TLToneManager *)self _toneWithIdentifierIsDefaultRingtone:v5])
    {
      *((unsigned char *)v30 + 24) = 1;
    }
    else if ([(TLToneManager *)self _toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:v5])
    {
      int v6 = [(TLToneManager *)self _fileNameFromToneIdentifier:v5 withPrefix:@"system:"];
      id v7 = [(TLToneManager *)self _systemRingtoneDirectory];
      id v8 = [v7 stringByAppendingPathComponent:v6];

      id v9 = [v8 stringByAppendingPathExtension:@"m4r"];

      id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v11 = [v10 fileExistsAtPath:v9];

      if (v11)
      {
        char v12 = 1;
      }
      else
      {
        uint64_t v18 = [v6 stringByAppendingString:@"-EncoreInfinitum"];

        uint64_t v19 = [(TLToneManager *)self _systemRingtoneDirectory];
        char v20 = [v19 stringByAppendingPathComponent:v18];

        id v9 = [v20 stringByAppendingPathExtension:@"m4r"];

        uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v12 = [v21 fileExistsAtPath:v9];

        int v6 = (void *)v18;
      }
      *((unsigned char *)v30 + 24) = v12;
    }
    else if ([(TLToneManager *)self _toneWithIdentifierIsAlarmWakeUp:v5])
    {
      id v13 = [(TLToneManager *)self _fileNameFromToneIdentifier:v5 withPrefix:@"alarmWakeUp:"];
      int v14 = [(TLToneManager *)self _alarmWakeUpRingtoneDirectory];
      uint64_t v15 = [v14 stringByAppendingPathComponent:v13];

      id v16 = [v15 stringByAppendingPathExtension:@"m4r"];

      int v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      LOBYTE(v14) = [v17 fileExistsAtPath:v16];

      *((unsigned char *)v30 + 24) = (_BYTE)v14;
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __44__TLToneManager__toneWithIdentifierIsValid___block_invoke;
      v26[3] = &unk_1E6C20D88;
      uint64_t v28 = &v29;
      v26[4] = self;
      id v27 = v5;
      [(TLToneManager *)self _performBlockInAccessQueue:v26];
    }
  }
  char v22 = TLLogToneManagement();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = *((unsigned __int8 *)v30 + 24);
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = self;
    __int16 v35 = 2114;
    id v36 = v4;
    __int16 v37 = 1024;
    int v38 = v23;
    _os_log_impl(&dword_1DB936000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Performed basic check for validity of tone with identifier '%{public}@': %{BOOL}u.", buf, 0x1Cu);
  }

  BOOL v24 = *((unsigned char *)v30 + 24) != 0;
  _Block_object_dispose(&v29, 8);

  return v24;
}

void __44__TLToneManager__toneWithIdentifierIsValid___block_invoke(void *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 4);
  uint64_t v3 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  if (v3)
  {
    uint64_t v5 = a1[6];
    id v4 = a1 + 6;
    *(unsigned char *)(*(void *)(v5 + 8) + 24) = 1;
  }
  else
  {
    int v6 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
    uint64_t v7 = a1[6];
    id v4 = a1 + 6;
    *(unsigned char *)(*(void *)(v7 + 8) + 24) = v6 != 0;
  }
  if (!*(unsigned char *)(*(void *)(*v4 + 8) + 24))
  {
    id v8 = TLLogToneManagement();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __44__TLToneManager__toneWithIdentifierIsValid___block_invoke_cold_2();
    }

    id v9 = TLLogToneManagement();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __44__TLToneManager__toneWithIdentifierIsValid___block_invoke_cold_1(v2);
    }
  }
}

- (BOOL)toneWithIdentifierIsValid:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__TLToneManager_toneWithIdentifierIsValid___block_invoke;
  v10[3] = &unk_1E6C20EA0;
  v10[4] = self;
  id v5 = v4;
  id v11 = v5;
  char v12 = &v13;
  [(TLToneManager *)self _performBlockInAccessQueue:v10];
  int v6 = TLLogToneManagement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *((unsigned __int8 *)v14 + 24);
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = self;
    __int16 v19 = 2114;
    id v20 = v5;
    __int16 v21 = 1024;
    int v22 = v7;
    _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -toneWithIdentifierIsValid:(%{public}@): Returning %{BOOL}u.", buf, 0x1Cu);
  }

  BOOL v8 = *((unsigned char *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __43__TLToneManager_toneWithIdentifierIsValid___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) _toneWithIdentifierIsValid:*(void *)(a1 + 40)];
  unsigned __int8 v3 = v2;
  unsigned __int8 v11 = v2;
  if (!v2) {
    goto LABEL_18;
  }
  for (unint64_t i = 0; ; ++i)
  {
    id v5 = _TLToneManagerDefaultIdentifiers[i];
    if ([(__CFString *)v5 length]) {
      break;
    }

    if (i >= 0x1C) {
      goto LABEL_10;
    }
LABEL_8:
    ;
  }
  char v6 = [*(id *)(a1 + 40) isEqualToString:v5];

  if (i <= 0x1B && (v6 & 1) == 0) {
    goto LABEL_8;
  }
  if (v6) {
    goto LABEL_18;
  }
LABEL_10:
  if (_TLToneManagerContentsChangedNotification_block_invoke__TLToneManagerAdditionalValidDefaultToneIdentifiersOnceToken != -1) {
    dispatch_once(&_TLToneManagerContentsChangedNotification_block_invoke__TLToneManagerAdditionalValidDefaultToneIdentifiersOnceToken, &__block_literal_global_871);
  }
  if (([(id)_TLToneManagerContentsChangedNotification_block_invoke__TLToneManagerAdditionalValidDefaultToneIdentifiers containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    int v7 = [*(id *)(a1 + 32) _nameForToneIdentifier:*(void *)(a1 + 40) isValid:&v11];
    BOOL v8 = TLLogToneManagement();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      int v17 = v7;
      __int16 v18 = 1024;
      int v19 = v11;
      _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -toneWithIdentifierIsValid:(%{public}@): Double checking that we have a valid name for this tone. Name: '%@', isValid: %{BOOL}u.", buf, 0x26u);
    }

    if (!v7) {
      unsigned __int8 v11 = 0;
    }

    unsigned __int8 v3 = v11;
  }
LABEL_18:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

void __43__TLToneManager_toneWithIdentifierIsValid___block_invoke_2()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v2 addObjectsFromArray:&unk_1F35FF6D0];
  if ([v2 count])
  {
    uint64_t v0 = [v2 copy];
    v1 = (void *)_TLToneManagerContentsChangedNotification_block_invoke__TLToneManagerAdditionalValidDefaultToneIdentifiers;
    _TLToneManagerContentsChangedNotification_block_invoke__TLToneManagerAdditionalValidDefaultToneIdentifiers = v0;
  }
}

- (id)_unduckTimeNumberForToneIdentifier:(id)a3 fromResourceNamed:(id)a4
{
  id v6 = a3;
  int v7 = (void *)MEMORY[0x1E4F28B50];
  id v8 = a4;
  uint64_t v9 = [v7 bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 URLForResource:v8 withExtension:@"plist"];

  if (v10)
  {
    unsigned __int8 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v10];
    char v12 = [(TLToneManager *)self _aliasForToneIdentifier:v6];
    uint64_t v13 = [v11 objectForKey:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (double)_unduckTimeForToneIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = @"ToneEarlyUnduckTimes";
  uint64_t v6 = [(TLToneManager *)self _unduckTimeNumberForToneIdentifier:v4 fromResourceNamed:@"ToneEarlyUnduckTimes"];
  if (v6)
  {
    int v7 = (void *)v6;
LABEL_3:
    [v7 doubleValue];
    double v9 = v8;

    goto LABEL_4;
  }
  double v9 = 0.0;
  if (_os_feature_enabled_impl())
  {
    id v5 = [@"ToneEarlyUnduckTimes" stringByAppendingString:@"-EncoreInfinitum"];
    int v7 = [(TLToneManager *)self _unduckTimeNumberForToneIdentifier:v4 fromResourceNamed:v5];
    if (v7) {
      goto LABEL_3;
    }
  }
LABEL_4:

  return v9;
}

- (id)_toneIdentifierForDeemphasizingAlertWithType:(int64_t)a3 topic:(id)a4 regularToneIdentifier:(id)a5
{
  return 0;
}

- (void)importTone:(id)a3 metadata:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__TLToneManager_importTone_metadata_completionBlock___block_invoke;
  v15[3] = &unk_1E6C20FE0;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __53__TLToneManager_importTone_metadata_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _deviceITunesRingtoneDirectory];
  [*(id *)(a1 + 32) _ensureDirectoryExistsAtPath:v2];
  unsigned __int8 v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];

  if (v4)
  {
    id v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v5 setObject:v4 forKey:@"GUID"];
    uint64_t v6 = [*(id *)(a1 + 40) objectForKey:@"File Extension"];
    if (v6) {
      int v7 = (__CFString *)v6;
    }
    else {
      int v7 = @"m4r";
    }
    id v8 = [NSString stringWithFormat:@"%@%@", @"import_", v4];
    id v9 = [v8 stringByAppendingPathExtension:v7];

    id v10 = [v2 stringByAppendingPathComponent:v9];
    id v11 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v18 = 0;
    if ([v11 createFileAtPath:v10 contents:*(void *)(a1 + 48) attributes:0])
    {
      id v12 = *(void **)(a1 + 32);
      id v13 = [v12 _deviceITunesRingtoneInformationPlist];
      [*(id *)(a1 + 32) _deviceITunesRingtoneDirectory];
      id v17 = v2;
      v15 = id v14 = v7;
      id v18 = [v12 _addToneToManifestAtPath:v13 metadata:v5 fileName:v9 mediaDirectory:v15];

      int v7 = v14;
      id v2 = v17;
    }
  }
  else
  {
    id v18 = 0;
  }
  if (*(void *)(a1 + 56))
  {
    if ([v18 statusCode])
    {
      id v16 = 0;
    }
    else
    {
      id v16 = [v18 toneIdentifier];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)removeImportedToneWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(TLToneManager *)self _toneWithIdentifier:v4];
    uint64_t v6 = [v5 filePath];
    int v7 = [v6 lastPathComponent];
    if (![v7 hasPrefix:@"import_"])
    {
LABEL_9:

      goto LABEL_10;
    }
    BOOL v8 = [(TLToneManager *)self _removeToneWithIdentifier:v4];
    id v9 = TLLogToneManagement();
    id v10 = v9;
    if (v8)
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:

        goto LABEL_9;
      }
      int v12 = 138543874;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = v6;
      id v11 = v13;
      _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: removeImportedToneWithIdentifier:(%{public}@): Successfully deleted tone at file path '%{public}@'.", (uint8_t *)&v12, 0x20u);
    }
    else
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      int v12 = 138543874;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = v6;
      id v11 = v13;
      _os_log_error_impl(&dword_1DB936000, v10, OS_LOG_TYPE_ERROR, "%{public}@: removeImportedToneWithIdentifier:(%{public}@): Failed to delete tone at file path '%{public}@'.", (uint8_t *)&v12, 0x20u);
    }

    goto LABEL_8;
  }
LABEL_10:
}

- (id)_importPurchasedToneWithMetadata:(id)a3 fileName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(TLToneManager *)self _deviceITunesRingtoneInformationPlist];
  id v9 = [(TLToneManager *)self _deviceITunesRingtoneDirectory];
  id v10 = [(TLToneManager *)self _addToneToManifestAtPath:v8 metadata:v7 fileName:v6 mediaDirectory:v9];

  return v10;
}

- (BOOL)_transferPurchasedToITunes:(id)a3
{
  return 0;
}

- (BOOL)_wasAffectedByAccidentalToneDeletion
{
  BOOL v3 = 0;
  [(TLToneManager *)self _evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone:0 returningFilePathsForFoundOrphans:0 wasAffectedByAccidentalToneDeletion:&v3];
  return v3;
}

- (id)_allSyncedTones
{
  id v2 = (void *)MEMORY[0x1E4F1CA60];
  BOOL v3 = [(TLToneManager *)self _iTunesRingtoneInformationPlist];
  id v4 = [v2 dictionaryWithContentsOfFile:v3];

  id v5 = [v4 objectForKey:@"Ringtones"];

  return v5;
}

- (id)_toneForSyncIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__TLToneManager__toneForSyncIdentifier___block_invoke;
  v8[3] = &unk_1E6C20EA0;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(TLToneManager *)self _performBlockInAccessQueue:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __40__TLToneManager__toneForSyncIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1[4] + 16) objectForKey:v2];
    uint64_t v4 = *(void *)(a1[6] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }

  return MEMORY[0x1F41817F8]();
}

- (BOOL)_importSyncedToneWithMetadata:(id)a3 fileName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(TLToneManager *)self _iTunesRingtoneInformationPlist];
  id v9 = [(TLToneManager *)self _iTunesRingtoneDirectory];
  id v10 = [(TLToneManager *)self _addToneToManifestAtPath:v8 metadata:v7 fileName:v6 mediaDirectory:v9];

  LOBYTE(v7) = [v10 statusCode] == 0;
  return (char)v7;
}

- (BOOL)_removeToneWithSyncIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(TLToneManager *)self _removeToneWithIdentifier:0 orSyncIdentifier:v4];
  id v6 = TLLogToneManagement();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = (id)objc_opt_class();
      __int16 v12 = 2114;
      id v13 = v4;
      id v8 = v11;
      _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeToneWithSyncIdentifier:(%{public}@): Successfully deleted tone.", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[TLToneManager _removeToneWithSyncIdentifier:]();
  }

  return v5;
}

- (void)_removeAllSyncedData
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(TLToneManager *)self _iTunesRingtoneDirectory];
  BOOL v5 = [(TLToneManager *)self _iTunesRingtoneInformationPlist];
  uint64_t v29 = self;
  int v6 = [(TLToneManager *)self _lockManifestAtPath:v5];
  if (v6 != -1)
  {
    int v26 = v6;
    int v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v5];
    BOOL v24 = [v25 objectForKey:@"Ringtones"];
    id v7 = [v24 allKeys];
    id v8 = (void *)[v7 copy];

    id v27 = v5;
    [v3 removeItemAtPath:v5 error:0];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v31 + 1) + 8 * v13)];
          id v30 = 0;
          int v15 = [v3 removeItemAtPath:v14 error:&v30];
          id v16 = v30;
          id v17 = TLLogToneManagement();
          uint64_t v18 = v17;
          if (v15)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              int v19 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              id v36 = v19;
              __int16 v37 = 2114;
              int v38 = v14;
              id v20 = v19;
              _os_log_impl(&dword_1DB936000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeAllSyncedData: Successfully deleted tone at file path '%{public}@'.", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            __int16 v21 = objc_opt_class();
            id v28 = v21;
            uint64_t v22 = objc_msgSend(v16, "tl_nonRedundantDescription");
            *(_DWORD *)buf = 138543874;
            id v36 = v21;
            __int16 v37 = 2114;
            int v38 = v14;
            __int16 v39 = 2114;
            uint64_t v40 = v22;
            uint64_t v23 = (void *)v22;
            _os_log_error_impl(&dword_1DB936000, v18, OS_LOG_TYPE_ERROR, "%{public}@: _removeAllSyncedData: Failed to delete tone at file path '%{public}@'; error = %{public}@.",
              buf,
              0x20u);
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v11);
    }

    close(v26);
    [(TLToneManager *)v29 _reloadTones];

    BOOL v5 = v27;
  }
}

- (id)_removeOrphanedPlistEntriesInManifestAtPath:(id)a3 mediaDirectory:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TLToneManager *)self _lockManifestAtPath:v6];
  if (v8 == -1)
  {
    id v14 = 0;
  }
  else
  {
    int v9 = v8;
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:v6];
    uint64_t v11 = v10;
    if (v10)
    {
      int v24 = v9;
      id v25 = v6;
      uint64_t v23 = v10;
      uint64_t v12 = [v10 objectForKey:@"Ringtones"];
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v15 = v12;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            __int16 v21 = [v7 stringByAppendingPathComponent:v20];
            if (([(id)objc_opt_class() _ensureTCCAccessPreflightAndCheckForFileExistenceAtPath:v21] & 1) == 0)
            {
              [v13 addObject:v20];
              [v14 addObject:v21];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v17);
      }

      id v6 = v25;
      if (![v13 count]
        || ![(TLToneManager *)self _removeTonesFromManifestAtPath:v25 fileNames:v13 shouldSkipReload:1 alreadyLockedManifest:1 removedEntries:0])
      {

        id v14 = 0;
      }
      int v9 = v24;
      uint64_t v11 = v23;
    }
    else
    {
      id v14 = 0;
    }
    close(v9);
  }

  return v14;
}

- (int64_t)_evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone:(BOOL)a3 returningFilePathsForFoundOrphans:(id *)a4 wasAffectedByAccidentalToneDeletion:(BOOL *)a5
{
  BOOL v7 = a3;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  int v9 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
  CFStringRef v10 = v9;
  if (v9)
  {
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    CFPreferencesSynchronize(v9, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    CFBooleanRef v13 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"was-affected-by-accidental-tone-deletion", v10);
    CFBooleanRef v14 = v13;
    if (v13)
    {
      CFTypeID v15 = CFGetTypeID(v13);
      CFTypeID TypeID = CFBooleanGetTypeID();
      BOOL v17 = v15 == TypeID;
      if (v15 == TypeID)
      {
        BOOL v19 = CFBooleanGetValue(v14) != 0;
      }
      else
      {
        BOOL v19 = 0;
        BOOL v7 = 1;
      }
      CFRelease(v14);
      if (!v7) {
        goto LABEL_23;
      }
    }
    else
    {
      BOOL v19 = 0;
      BOOL v17 = 0;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __158__TLToneManager__evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone_returningFilePathsForFoundOrphans_wasAffectedByAccidentalToneDeletion___block_invoke;
    v26[3] = &unk_1E6C20E78;
    v26[4] = self;
    void v26[5] = &v27;
    [(TLToneManager *)self _performBlockInAccessQueue:v26];
    if (v19)
    {
      BOOL v19 = 1;
      if (!v17) {
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v19 = [(id)v28[5] count] != 0;
      if (!v17)
      {
LABEL_15:
        uint64_t v20 = (const void *)*MEMORY[0x1E4F1CFD0];
        if (v19) {
          __int16 v21 = (const void *)*MEMORY[0x1E4F1CFD0];
        }
        else {
          __int16 v21 = (const void *)*MEMORY[0x1E4F1CFC8];
        }
        CFPreferencesSetAppValue(@"was-affected-by-accidental-tone-deletion", v21, v10);
        if (v19) {
          CFPreferencesSetAppValue(@"requires-reset-sync-post-accidental-tone-deletion", v20, v10);
        }
        CFPreferencesSynchronize(v10, v11, v12);
LABEL_21:
        if ([(id)v28[5] count])
        {
          int64_t v18 = 1;
          goto LABEL_29;
        }
LABEL_23:
        CFBooleanRef v22 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"requires-reset-sync-post-accidental-tone-deletion", v10);
        CFBooleanRef v23 = v22;
        if (v22)
        {
          CFTypeID v24 = CFGetTypeID(v22);
          int64_t v18 = v24 == CFBooleanGetTypeID() && CFBooleanGetValue(v23) != 0;
          CFRelease(v23);
        }
        else
        {
          int64_t v18 = 0;
        }
LABEL_29:
        CFRelease(v10);
        LOBYTE(v10) = v19;
        if (!a4) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }
    if (![(id)v28[5] count]) {
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  int64_t v18 = 0;
  if (a4) {
LABEL_30:
  }
    *a4 = (id)[(id)v28[5] copy];
LABEL_31:
  if (a5) {
    *a5 = (char)v10;
  }
  _Block_object_dispose(&v27, 8);

  return v18;
}

void __158__TLToneManager__evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone_returningFilePathsForFoundOrphans_wasAffectedByAccidentalToneDeletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 _deviceITunesRingtoneInformationPlist];
  id v4 = [*(id *)(a1 + 32) _deviceITunesRingtoneDirectory];
  id v8 = [v2 _removeOrphanedPlistEntriesInManifestAtPath:v3 mediaDirectory:v4];

  if ([v8 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (v8) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) unionSet:v8];
    }
    [*(id *)(a1 + 32) _reloadTones];
  }
}

- (int64_t)_removeOrphanedManifestEntriesReturningFilePathsForFoundOrphans:(id *)a3
{
  return [(TLToneManager *)self _evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone:1 returningFilePathsForFoundOrphans:a3 wasAffectedByAccidentalToneDeletion:0];
}

- (void)_registerDidRequestResetSyncPostAccidentalToneDeletion
{
  uint64_t v2 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
  if (v2)
  {
    CFStringRef v3 = v2;
    CFPreferencesSetAppValue(@"requires-reset-sync-post-accidental-tone-deletion", 0, v2);
    CFPreferencesSynchronize(v3, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    CFRelease(v3);
  }
}

+ (BOOL)_migrateLegacyToneSettings
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
  unint64_t v4 = 0;
  uint64_t v59 = @"PlaySentMailSound";
  uint64_t v60 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomainForDomain:@"com.apple.mobilemail"];
  v61[0] = 0;
  v62[0] = 6;
  v62[1] = @"PlayNewMailSound";
  CFStringRef v45 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomainForDomain:@"com.apple.mobilephone"];
  CFStringRef applicationID = v60;
  v62[2] = v60;
  int v63 = 0;
  uint64_t v64 = 5;
  v65 = @"calendar-alarm";
  v66 = v3;
  int v67 = 1;
  uint64_t v68 = 10;
  id v69 = @"VoicemailToneEnabled";
  CFStringRef v70 = v45;
  int v71 = 0;
  uint64_t v72 = 4;
  id v47 = a1;
  do
  {
    CFStringRef v6 = (&v59)[v4 / 8];
    CFStringRef v5 = *(&v59 + v4 / 8 + 1);
    int v7 = v61[v4 / 4];
    unint64_t v8 = v62[v4 / 8];
    int v9 = (void *)CFPreferencesCopyAppValue(v6, v5);
    if (!v9) {
      goto LABEL_20;
    }
    CFStringRef v10 = v9;
    if (v7)
    {
      if (v7 == 1 && ![v9 length])
      {
LABEL_8:
        CFStringRef v11 = [a1 _systemWideTonePreferenceKeyForAlertType:v8];
        if (!v11)
        {
          CFStringRef v12 = TLLogGeneral();
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

          if (v13)
          {
            CFBooleanRef v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Tones/TLToneManager.m"];
            CFTypeID v15 = TLLogGeneral();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v43 = [v14 lastPathComponent];
              int v44 = v3;
              uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
              *(_DWORD *)buf = 136381443;
              __int16 v52 = "+[TLToneManager _migrateLegacyToneSettings]";
              __int16 v53 = 2113;
              __int16 v54 = v43;
              __int16 v55 = 2049;
              uint64_t v56 = 3366;
              __int16 v57 = 2113;
              uint64_t v58 = v16;
              BOOL v17 = (void *)v16;
              _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

              CFStringRef v3 = v44;
            }
          }
          else
          {
            CFBooleanRef v14 = TLLogGeneral();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              +[TLToneManager _migrateLegacyToneSettings];
            }
          }

          int64_t v18 = TLLogGeneral();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            NSStringFromTLAlertType(v8);
            BOOL v19 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            __int16 v52 = v19;
            __int16 v53 = 2114;
            __int16 v54 = 0;
            _os_log_error_impl(&dword_1DB936000, v18, OS_LOG_TYPE_ERROR, "Unexpected value for preferences key associated to alertType %{public}@: %{public}@.", buf, 0x16u);
          }
          a1 = v47;
        }
        CFPreferencesSetAppValue(v11, @"<none>", v3);
        CFPreferencesSetAppValue(v6, 0, v5);
      }
    }
    else if (([v9 BOOLValue] & 1) == 0)
    {
      goto LABEL_8;
    }
    CFRelease(v10);
LABEL_20:
    v4 += 32;
  }
  while (v4 != 128);
  CFStringRef v20 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v21 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize(applicationID, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPreferencesSynchronize(v45, v20, v21);
  CFRelease(applicationID);
  CFRelease(v45);
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"sms-sound", v3, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    CFIndex v23 = AppIntegerValue;
    CFTypeID v24 = [a1 _defaultToneIdentifierForAlertType:2 topic:0];
    id v25 = @"texttone:Tri-tone";
    switch(v23)
    {
      case 0:
        id v25 = @"<none>";
        goto LABEL_29;
      case 1:
        goto LABEL_29;
      case 2:
        id v25 = @"texttone:Chime";
        goto LABEL_29;
      case 3:
        id v25 = @"texttone:Glass";
        goto LABEL_29;
      case 4:
        id v25 = @"texttone:Horn";
        goto LABEL_29;
      case 6:
        id v25 = @"texttone:Bell";
        goto LABEL_29;
      case 7:
        id v25 = @"texttone:Electronic";
LABEL_29:

        CFTypeID v24 = v25;
        break;
      default:
        break;
    }
    long long v26 = [v47 _systemWideTonePreferenceKeyForAlertType:2];
    if (!v26)
    {
      uint64_t v27 = v3;
      long long v28 = TLLogGeneral();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);

      if (v29)
      {
        id v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Tones/TLToneManager.m"];
        uint64_t v31 = TLLogGeneral();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [v30 lastPathComponent];
          long long v33 = [MEMORY[0x1E4F29060] callStackSymbols];
          *(_DWORD *)buf = 136381443;
          __int16 v52 = "+[TLToneManager _migrateLegacyToneSettings]";
          __int16 v53 = 2113;
          __int16 v54 = v32;
          __int16 v55 = 2049;
          uint64_t v56 = 3396;
          __int16 v57 = 2113;
          uint64_t v58 = (uint64_t)v33;
          _os_log_impl(&dword_1DB936000, v31, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
        }
      }
      else
      {
        id v30 = TLLogGeneral();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          +[TLToneManager _migrateLegacyToneSettings];
        }
      }
      CFStringRef v3 = v27;

      __int16 v41 = TLLogGeneral();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        +[TLToneManager _migrateLegacyToneSettings](v41);
      }
    }
    CFPreferencesSetAppValue(v26, v24, v3);
    CFPreferencesSetAppValue(@"sms-sound", 0, v3);
  }
  CFPreferencesSetAppValue(@"was-affected-by-accidental-tone-deletion", 0, v3);
  CFPreferencesSynchronize(v3, v20, v21);
  +[TLPreferencesUtilities migratePerTopicPreferencesInDomain:v3 withRegularPreferenceKeys:_TLToneManagerSystemWideTonePreferenceKeys regularPreferenceKeysCount:29 intoSinglePerTopicPreferenceWithSuffix:@"-per-account" usingPreferencesScope:0];
  CFRelease(v3);
  return 1;
}

- (id)_currentWatchToneIdentifierPreferenceKeyForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5 = a4;
  CFStringRef v6 = [(id)objc_opt_class() _systemWideTonePreferenceKeyForAlertType:a3];
  int v7 = [NSString stringWithFormat:@"%@%@", @"watch-", v6];

  uint64_t v8 = [v5 length];
  if (v8)
  {
    uint64_t v9 = [v7 stringByAppendingString:@"-per-account"];

    int v7 = (void *)v9;
  }

  return v7;
}

- (id)currentWatchToneIdentifierForAlertType:(int64_t)a3
{
  return [(TLToneManager *)self currentWatchToneIdentifierForAlertType:a3 topic:0];
}

- (void)setCurrentWatchToneIdentifier:(id)a3 forAlertType:(int64_t)a4
{
}

- (id)currentWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = TLLogToneManagement();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromTLAlertType(a3);
    int v15 = 138543874;
    uint64_t v16 = self;
    __int16 v17 = 2114;
    int64_t v18 = v8;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentWatchToneIdentifierForAlertType:(%{public}@) topic:(%{public}@).", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v9 = [(TLToneManager *)self _currentWatchToneIdentifierForAlertType:a3 topic:v6 didFindPersistedWatchToneIdentifier:0];
  CFStringRef v10 = TLLogToneManagement();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = NSStringFromTLAlertType(a3);
    int v15 = 138543874;
    uint64_t v16 = self;
    __int16 v17 = 2114;
    int64_t v18 = v11;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentWatchToneIdentifierForAlertType:(%{public}@) […]: Value from Preferences lookup method: toneIdentifier = %{public}@.", (uint8_t *)&v15, 0x20u);
  }
  if (!v9)
  {
    uint64_t v9 = [(TLToneManager *)self defaultWatchToneIdentifierForAlertType:a3 topic:v6];
    CFStringRef v12 = TLLogToneManagement();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = NSStringFromTLAlertType(a3);
      int v15 = 138543874;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      int64_t v18 = v13;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentWatchToneIdentifierForAlertType:(%{public}@) […]: Falling back to default due missing setting in Preferences. toneIdentifier = %{public}@.", (uint8_t *)&v15, 0x20u);
    }
  }

  return v9;
}

- (id)_currentWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4 didFindPersistedWatchToneIdentifier:(BOOL *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [v8 length];
  CFStringRef v10 = +[TLPreferencesUtilities perWatchPreferencesDomain];
  CFStringRef v11 = [(TLToneManager *)self _currentWatchToneIdentifierPreferenceKeyForAlertType:a3 topic:v8];
  if (!v11 || (NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass()) == 0)
  {
    char isKindOfClass = 0;
    id v20 = 0;
LABEL_18:
    if (v9)
    {
      uint64_t v23 = [(TLToneManager *)self _currentWatchToneIdentifierForAlertType:a3 topic:0 didFindPersistedWatchToneIdentifier:0];

      id v20 = (id)v23;
    }
    goto LABEL_20;
  }
  BOOL v13 = (void *)[[NPSDomainAccessorClass alloc] initWithDomain:v10];
  CFBooleanRef v14 = TLLogToneManagement();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = self;
    __int16 v28 = 2114;
    BOOL v29 = v13;
    _os_log_impl(&dword_1DB936000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentWatchToneIdentifier…: Instantiated domain accessor %{public}@.", buf, 0x16u);
  }

  int v15 = [v13 objectForKey:v11];
  uint64_t v16 = TLLogToneManagement();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    uint64_t v27 = self;
    __int16 v28 = 2114;
    BOOL v29 = v11;
    __int16 v30 = 2114;
    uint64_t v31 = v13;
    __int16 v32 = 2114;
    long long v33 = v15;
    _os_log_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentWatchToneIdentifier…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", buf, 0x2Au);
  }

  id v25 = a5;
  if (v9)
  {
    objc_opt_class();
    __int16 v17 = v10;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v15 objectForKey:v8];
    }
    else
    {
      uint64_t v18 = 0;
    }
    uint64_t v21 = v9;

    int v15 = (void *)v18;
  }
  else
  {
    __int16 v17 = v10;
    uint64_t v21 = 0;
  }
  CFBooleanRef v22 = v13;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v20 = v15;
  }
  else {
    id v20 = 0;
  }

  uint64_t v9 = v21;
  CFStringRef v10 = v17;
  a5 = v25;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_18;
  }
LABEL_20:
  if (a5) {
    *a5 = isKindOfClass & 1;
  }

  return v20;
}

- (void)setCurrentWatchToneIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  CFStringRef v10 = TLLogToneManagement();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = NSStringFromTLAlertType(a4);
    *(_DWORD *)buf = 138544130;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 2114;
    BOOL v29 = v11;
    __int16 v30 = 2114;
    id v31 = v9;
    _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -setCurrentWatchToneIdentifier:(%{public}@) forAlertType:(%{public}@) topic:(%{public}@)", buf, 0x2Au);
  }
  buf[0] = 0;
  CFStringRef v12 = [(TLToneManager *)self _currentWatchToneIdentifierForAlertType:a4 topic:v9 didFindPersistedWatchToneIdentifier:buf];
  BOOL v13 = v12;
  if (!buf[0]) {
    goto LABEL_11;
  }
  uint64_t v14 = v12;
  unint64_t v15 = (unint64_t)v8;
  id v16 = (id)v15;
  if (!(v15 | v14)) {
    goto LABEL_16;
  }
  if (!v15 || !v14)
  {

LABEL_11:
    uint64_t v14 = +[TLPreferencesUtilities perWatchPreferencesDomain];
    id v16 = [(TLToneManager *)self _currentWatchToneIdentifierPreferenceKeyForAlertType:a4 topic:v9];
    if (v16)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __66__TLToneManager_setCurrentWatchToneIdentifier_forAlertType_topic___block_invoke;
      v19[3] = &unk_1E6C21008;
      v19[4] = self;
      uint64_t v14 = (uint64_t)(id)v14;
      id v20 = (id)v14;
      id v21 = v9;
      id v16 = v16;
      id v22 = v16;
      id v23 = v8;
      [(TLToneManager *)self _performBlockInAccessQueue:v19];
    }
    else
    {
      uint64_t v18 = TLLogToneManagement();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[TLToneManager setCurrentWatchToneIdentifier:forAlertType:topic:]((uint64_t)self, a4);
      }
    }
    goto LABEL_16;
  }
  if (v14 != v15)
  {
    char v17 = [(id)v14 isEqualToString:v15];

    if (v17) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
LABEL_16:

LABEL_17:
}

void __66__TLToneManager_setCurrentWatchToneIdentifier_forAlertType_topic___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  if (v2)
  {
    CFStringRef v3 = v2;
LABEL_3:
    int v4 = 0;
    goto LABEL_8;
  }
  NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass();
  if (!NPSDomainAccessorClass)
  {
    CFStringRef v3 = 0;
    goto LABEL_3;
  }
  CFStringRef v3 = (void *)[[NPSDomainAccessorClass alloc] initWithDomain:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v3);
  id v6 = TLLogToneManagement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v23 = 138543618;
    uint64_t v24 = v7;
    __int16 v25 = 2114;
    __int16 v26 = v3;
    _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -setCurrentWatchToneIdentifier…: Instantiated domain accessor %{public}@ and set it to be the transient one.", (uint8_t *)&v23, 0x16u);
  }

  int v4 = 1;
LABEL_8:
  if ([*(id *)(a1 + 48) length])
  {
    id v8 = [v3 objectForKey:*(void *)(a1 + 56)];
    id v9 = TLLogToneManagement();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      CFStringRef v11 = *(void **)(a1 + 56);
      int v23 = 138544130;
      uint64_t v24 = v10;
      __int16 v25 = 2114;
      __int16 v26 = v11;
      __int16 v27 = 2114;
      __int16 v28 = v3;
      __int16 v29 = 2114;
      __int16 v30 = v8;
      _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -setCurrentWatchToneIdentifier…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", (uint8_t *)&v23, 0x2Au);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CFStringRef v12 = [v8 mutableCopy];
    }
    else {
      CFStringRef v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    BOOL v13 = v12;
    uint64_t v17 = *(void *)(a1 + 64);
    if (v17) {
      [v12 setObject:v17 forKey:*(void *)(a1 + 48)];
    }
    else {
      [v12 removeObjectForKey:*(void *)(a1 + 48)];
    }
    [v3 setObject:v13 forKey:*(void *)(a1 + 56)];
    uint64_t v18 = TLLogToneManagement();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = *(void **)(a1 + 56);
      int v23 = 138544130;
      uint64_t v24 = v19;
      __int16 v25 = 2114;
      __int16 v26 = v20;
      __int16 v27 = 2114;
      __int16 v28 = v3;
      __int16 v29 = 2114;
      __int16 v30 = v13;
      _os_log_impl(&dword_1DB936000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -setCurrentWatchToneIdentifier…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v23, 0x2Au);
    }
  }
  else
  {
    [v3 setObject:*(void *)(a1 + 64) forKey:*(void *)(a1 + 56)];
    BOOL v13 = TLLogToneManagement();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      unint64_t v15 = *(void **)(a1 + 56);
      id v16 = *(NSObject **)(a1 + 64);
      int v23 = 138544130;
      uint64_t v24 = v14;
      __int16 v25 = 2114;
      __int16 v26 = v15;
      __int16 v27 = 2114;
      __int16 v28 = v3;
      __int16 v29 = 2114;
      __int16 v30 = v16;
      _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -setCurrentWatchToneIdentifier…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v23, 0x2Au);
    }
  }

  [*(id *)(a1 + 32) _didSetTonePreferenceSuccessfullyWithKey:*(void *)(a1 + 56) inDomain:*(void *)(a1 + 40) usingPreferencesOfKind:2];
  if (v4)
  {
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = *(void **)(v21 + 64);
    *(void *)(v21 + 64) = 0;
  }
}

- (id)_currentToneWatchAlertPolicyPreferenceKeyForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5 = a4;
  id v6 = [(id)objc_opt_class() _systemWideTonePreferenceKeyForAlertType:a3];
  uint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@"sound-identifier" withString:@"sound"];

  id v8 = [v7 stringByAppendingString:@"-watch-alert-policy"];

  uint64_t v9 = [v5 length];
  if (v9)
  {
    uint64_t v10 = [v8 stringByAppendingString:@"-per-account"];

    id v8 = (void *)v10;
  }

  return v8;
}

- (int64_t)_currentToneWatchAlertPolicyForAlertType:(int64_t)a3
{
  return [(TLToneManager *)self _currentToneWatchAlertPolicyForAlertType:a3 topic:0];
}

- (int64_t)_currentToneWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4
{
  return [(TLToneManager *)self _currentToneWatchAlertPolicyForAlertType:a3 topic:a4 didFindPersistedWatchAlertPolicy:0];
}

- (int64_t)_currentToneWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4 didFindPersistedWatchAlertPolicy:(BOOL *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ((unint64_t)(a3 - 13) >= 2)
  {
    if (a3 == 17)
    {
      uint64_t v10 = +[TLCapabilitiesManager sharedCapabilitiesManager];
      int v11 = [v10 supportsNanoEncore];

      int64_t v9 = v11 ^ 1u;
    }
    else
    {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = 1;
  }
  uint64_t v12 = [v8 length];
  BOOL v13 = +[TLPreferencesUtilities perWatchPreferencesDomain];
  uint64_t v14 = [(TLToneManager *)self _currentToneWatchAlertPolicyPreferenceKeyForAlertType:a3 topic:v8];
  if (!v14 || (NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass()) == 0)
  {
    char isKindOfClass = 0;
LABEL_21:
    if (v12) {
      int64_t v9 = [(TLToneManager *)self _currentToneWatchAlertPolicyForAlertType:a3 topic:0 didFindPersistedWatchAlertPolicy:0];
    }
    goto LABEL_23;
  }
  int v23 = a5;
  id v16 = (void *)[[NPSDomainAccessorClass alloc] initWithDomain:v13];
  uint64_t v17 = TLLogToneManagement();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v25 = self;
    __int16 v26 = 2114;
    __int16 v27 = v16;
    _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneWatchAlertPolicy…: Instantiated domain accessor %{public}@.", buf, 0x16u);
  }

  uint64_t v18 = [v16 objectForKey:v14];
  uint64_t v19 = TLLogToneManagement();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    __int16 v25 = self;
    __int16 v26 = 2114;
    __int16 v27 = v14;
    __int16 v28 = 2114;
    __int16 v29 = v16;
    __int16 v30 = 2114;
    uint64_t v31 = v18;
    _os_log_impl(&dword_1DB936000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneWatchAlertPolicy…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", buf, 0x2Au);
  }

  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [v18 objectForKey:v8];
    }
    else
    {
      uint64_t v20 = 0;
    }

    uint64_t v18 = (void *)v20;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    int64_t v9 = TLWatchAlertPolicyFromString(v18);
  }

  a5 = v23;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_21;
  }
LABEL_23:
  if (a5) {
    *a5 = isKindOfClass & 1;
  }

  return v9;
}

- (void)_setCurrentToneWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4
{
}

- (void)_setCurrentToneWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4 topic:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int64_t v9 = TLLogToneManagement();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromTLWatchAlertPolicy(a3);
    int v11 = NSStringFromTLAlertType(a4);
    *(_DWORD *)buf = 138544130;
    uint64_t v24 = self;
    __int16 v25 = 2114;
    __int16 v26 = v10;
    __int16 v27 = 2114;
    __int16 v28 = v11;
    __int16 v29 = 2114;
    id v30 = v8;
    _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentToneWatchAlertPolicy:(%{public}@) forAlertType:(%{public}@) topic:(%{public}@)", buf, 0x2Au);
  }
  if (a3 == 3)
  {
    uint64_t v12 = [(TLToneManager *)self currentToneIdentifierForAlertType:a4 topic:v8];
    if ([v12 isEqualToString:@"<none>"]) {
      a3 = 2;
    }
    else {
      a3 = 1;
    }
  }
  buf[0] = 0;
  int64_t v13 = [(TLToneManager *)self _currentToneWatchAlertPolicyForAlertType:a4 topic:v8 didFindPersistedWatchAlertPolicy:buf];
  if (!buf[0] || v13 != a3)
  {
    uint64_t v14 = +[TLPreferencesUtilities perWatchPreferencesDomain];
    unint64_t v15 = [(TLToneManager *)self _currentToneWatchAlertPolicyPreferenceKeyForAlertType:a4 topic:v8];
    if (v15)
    {
      id v16 = NSStringFromTLWatchAlertPolicy(a3);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __68__TLToneManager__setCurrentToneWatchAlertPolicy_forAlertType_topic___block_invoke;
      v18[3] = &unk_1E6C21008;
      v18[4] = self;
      id v19 = v14;
      id v20 = v8;
      id v21 = v15;
      id v22 = v16;
      uint64_t v17 = v16;
      [(TLToneManager *)self _performBlockInAccessQueue:v18];
    }
    else
    {
      uint64_t v17 = TLLogToneManagement();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[TLToneManager _setCurrentToneWatchAlertPolicy:forAlertType:topic:](a4);
      }
    }
  }
}

void __68__TLToneManager__setCurrentToneWatchAlertPolicy_forAlertType_topic___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  if (v2)
  {
    CFStringRef v3 = v2;
LABEL_3:
    int v4 = 0;
    goto LABEL_8;
  }
  NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass();
  if (!NPSDomainAccessorClass)
  {
    CFStringRef v3 = 0;
    goto LABEL_3;
  }
  CFStringRef v3 = (void *)[[NPSDomainAccessorClass alloc] initWithDomain:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v3);
  id v6 = TLLogToneManagement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v22 = 138543618;
    uint64_t v23 = v7;
    __int16 v24 = 2114;
    __int16 v25 = v3;
    _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentToneWatchAlertPolicy…: Instantiated domain accessor %{public}@ and set it to be the transient one.", (uint8_t *)&v22, 0x16u);
  }

  int v4 = 1;
LABEL_8:
  if ([*(id *)(a1 + 48) length])
  {
    id v8 = [v3 objectForKey:*(void *)(a1 + 56)];
    int64_t v9 = TLLogToneManagement();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = *(void **)(a1 + 56);
      int v22 = 138544130;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      __int16 v25 = v11;
      __int16 v26 = 2114;
      __int16 v27 = v3;
      __int16 v28 = 2114;
      __int16 v29 = v8;
      _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentToneWatchAlertPolicy…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", (uint8_t *)&v22, 0x2Au);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = [v8 mutableCopy];
    }
    else {
      uint64_t v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    int64_t v13 = v12;
    [v12 setObject:*(void *)(a1 + 64) forKey:*(void *)(a1 + 48)];
    [v3 setObject:v13 forKey:*(void *)(a1 + 56)];
    uint64_t v17 = TLLogToneManagement();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      id v19 = *(void **)(a1 + 56);
      int v22 = 138544130;
      uint64_t v23 = v18;
      __int16 v24 = 2114;
      __int16 v25 = v19;
      __int16 v26 = 2114;
      __int16 v27 = v3;
      __int16 v28 = 2114;
      __int16 v29 = v13;
      _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentToneWatchAlertPolicy…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v22, 0x2Au);
    }
  }
  else
  {
    [v3 setObject:*(void *)(a1 + 64) forKey:*(void *)(a1 + 56)];
    int64_t v13 = TLLogToneManagement();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      unint64_t v15 = *(void **)(a1 + 56);
      id v16 = *(NSObject **)(a1 + 64);
      int v22 = 138544130;
      uint64_t v23 = v14;
      __int16 v24 = 2114;
      __int16 v25 = v15;
      __int16 v26 = 2114;
      __int16 v27 = v3;
      __int16 v28 = 2114;
      __int16 v29 = v16;
      _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentToneWatchAlertPolicy…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v22, 0x2Au);
    }
  }

  [*(id *)(a1 + 32) _didSetTonePreferenceSuccessfullyWithKey:*(void *)(a1 + 56) inDomain:*(void *)(a1 + 40) usingPreferencesOfKind:2];
  if (v4)
  {
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = *(void **)(v20 + 64);
    *(void *)(v20 + 64) = 0;
  }
}

- (BOOL)_watchPrefersSalientNotifications
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__TLToneManager__watchPrefersSalientNotifications__block_invoke;
  v4[3] = &unk_1E6C20E78;
  v4[4] = self;
  v4[5] = &v5;
  [(TLToneManager *)self _performBlockInAccessQueue:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __50__TLToneManager__watchPrefersSalientNotifications__block_invoke(uint64_t a1)
{
  *(void *)&v17[13] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 57))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(v2 + 56);
    CFStringRef v3 = TLLogToneManagement();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v14 = 138543618;
      uint64_t v15 = v4;
      __int16 v16 = 1024;
      *(_DWORD *)uint64_t v17 = v5;
      _os_log_impl(&dword_1DB936000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: _watchPrefersSalientNotifications: Returning %{BOOL}u from cache.", (uint8_t *)&v14, 0x12u);
    }
  }
  else
  {
    NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass();
    if (!NPSDomainAccessorClass) {
      return;
    }
    uint64_t v7 = NPSDomainAccessorClass;
    CFStringRef v3 = +[TLPreferencesUtilities perWatchPreferencesDomain];
    char v8 = (void *)[[v7 alloc] initWithDomain:v3];
    int64_t v9 = TLLogToneManagement();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      *(void *)uint64_t v17 = v8;
      _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_watchPrefersSalientNotifications: Instantiated domain accessor %{public}@.", (uint8_t *)&v14, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 BOOLForKey:@"watch-prefers-salient-notification"];
    *(unsigned char *)(*(void *)(a1 + 32) + 56) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    *(unsigned char *)(*(void *)(a1 + 32) + 57) = 1;
    int v11 = TLLogToneManagement();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v14 = 138543874;
      uint64_t v15 = v12;
      __int16 v16 = 1024;
      *(_DWORD *)uint64_t v17 = v13;
      v17[2] = 2114;
      *(void *)&v17[3] = v8;
      _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: _watchPrefersSalientNotifications: Read %{BOOL}u from %{public}@; caching this value, and returning it.",
        (uint8_t *)&v14,
        0x1Cu);
    }
  }
}

- (void)_setWatchPrefersSalientNotifications:(BOOL)a3
{
  int v5 = +[TLPreferencesUtilities perWatchPreferencesDomain];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__TLToneManager__setWatchPrefersSalientNotifications___block_invoke;
  v7[3] = &unk_1E6C21030;
  v7[4] = self;
  id v8 = v5;
  BOOL v9 = a3;
  id v6 = v5;
  [(TLToneManager *)self _performBlockInAccessQueue:v7];
}

void __54__TLToneManager__setWatchPrefersSalientNotifications___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  if (v2)
  {
    CFStringRef v3 = v2;
LABEL_3:
    int v4 = 0;
    goto LABEL_8;
  }
  NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass();
  if (!NPSDomainAccessorClass)
  {
    CFStringRef v3 = 0;
    goto LABEL_3;
  }
  CFStringRef v3 = (void *)[[NPSDomainAccessorClass alloc] initWithDomain:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v3);
  id v6 = TLLogToneManagement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v18 = 138543618;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    *(void *)id v21 = v3;
    _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setWatchPrefersSalientNotifications…: Instantiated domain accessor %{public}@ and set it to be the transient one.", (uint8_t *)&v18, 0x16u);
  }

  int v4 = 1;
LABEL_8:
  int v8 = [v3 BOOLForKey:@"watch-prefers-salient-notification"];
  BOOL v9 = TLLogToneManagement();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v18 = 138543874;
    uint64_t v19 = v10;
    __int16 v20 = 1024;
    *(_DWORD *)id v21 = v8;
    *(_WORD *)&v21[4] = 2114;
    *(void *)&v21[6] = v3;
    _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: _setWatchPrefersSalientNotifications…: Read didWatchAlreadyPreferSalientNotifications = %{BOOL}u from %{public}@.", (uint8_t *)&v18, 0x1Cu);
  }

  int v11 = *(unsigned __int8 *)(a1 + 48);
  if (v11 != v8)
  {
    [v3 setBool:v11 != 0 forKey:@"watch-prefers-salient-notification"];
    uint64_t v12 = TLLogToneManagement();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = *(unsigned __int8 *)(a1 + 48);
      int v18 = 138544130;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      *(void *)id v21 = @"watch-prefers-salient-notification";
      *(_WORD *)&v21[8] = 2114;
      *(void *)&v21[10] = v3;
      __int16 v22 = 1024;
      int v23 = v14;
      _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setWatchPrefersSalientNotifications…: Did set BOOLean value for key %{public}@ on %{public}@: %{BOOL}u.", (uint8_t *)&v18, 0x26u);
    }

    [*(id *)(a1 + 32) _didSetTonePreferenceSuccessfullyWithKey:@"watch-prefers-salient-notification" inDomain:*(void *)(a1 + 40) usingPreferencesOfKind:2];
  }
  if (v4)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    __int16 v16 = *(void **)(v15 + 64);
    *(void *)(v15 + 64) = 0;
  }
  if (*(unsigned __int8 *)(a1 + 48) != v8)
  {
    [*(id *)(a1 + 32) _handleWatchPrefersSalientNotificationDidChange];
    *(unsigned char *)(*(void *)(a1 + 32) + 58) = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"_TLAlertWatchPrefersSalientNotificationPreferenceDidChangeLocallyNotification", 0, 0, 1u);
  }
}

- (void)_handleWatchPrefersSalientNotificationDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__TLToneManager__handleWatchPrefersSalientNotificationDidChange__block_invoke;
  v2[3] = &unk_1E6C20D60;
  v2[4] = self;
  [(TLToneManager *)self _performBlockInAccessQueue:v2];
}

void __64__TLToneManager__handleWatchPrefersSalientNotificationDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 56);
  int v4 = *(unsigned __int8 *)(v2 + 57);
  *(unsigned char *)(v2 + 57) = 0;
  int v5 = [*(id *)(a1 + 32) _watchPrefersSalientNotifications];
  if (v4) {
    BOOL v6 = v3 == v5;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    int v8 = +[TLToneManager sharedToneManager];

    if (v7 == v8)
    {
      BOOL v9 = dispatch_get_global_queue(0, 0);
      dispatch_async(v9, &__block_literal_global_920);
    }
  }
}

void __64__TLToneManager__handleWatchPrefersSalientNotificationDidChange__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"_TLAlertWatchPrefersSalientToneAndVibrationDidChangeNotification" object:0];
}

+ (id)_currentOverridePolicyPreferenceKeyForAlertType:(int64_t)a3
{
  int v3 = [a1 _systemWideTonePreferenceKeyForAlertType:a3];
  int v4 = [v3 stringByReplacingOccurrencesOfString:@"-sound-identifier" withString:&stru_1F35F7550];

  int v5 = [v4 stringByAppendingString:@"-alert-override-policy"];

  return v5;
}

- (int64_t)_currentOverridePolicyForAlertType:(int64_t)a3
{
  return [(TLToneManager *)self _currentOverridePolicyForAlertType:a3 didFindAlertOverridePolicy:0];
}

- (int64_t)_currentOverridePolicyForAlertType:(int64_t)a3 didFindAlertOverridePolicy:(BOOL *)a4
{
  int v5 = [(id)objc_opt_class() _currentOverridePolicyPreferenceKeyForAlertType:a3];
  if (!v5
    || (BOOL v6 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain]) == 0)
  {
    BOOL v12 = 0;
    int64_t v14 = 0;
    if (!a4) {
      goto LABEL_9;
    }
LABEL_8:
    *a4 = v12;
    goto LABEL_9;
  }
  uint64_t v7 = v6;
  CFPropertyListRef v8 = CFPreferencesCopyAppValue(v5, v6);
  if (v8)
  {
    BOOL v9 = (void *)v8;
    CFTypeID v10 = CFGetTypeID(v8);
    CFTypeID TypeID = CFStringGetTypeID();
    BOOL v12 = v10 == TypeID;
    if (v10 == TypeID) {
      int64_t v14 = TLAlertOverridePolicyFromString(v9);
    }
    else {
      int64_t v14 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    BOOL v12 = 0;
    int64_t v14 = 0;
  }
  CFRelease(v7);
  if (a4) {
    goto LABEL_8;
  }
LABEL_9:

  return v14;
}

- (void)_setCurrentOverridePolicy:(int64_t)a3 forAlertType:(int64_t)a4
{
  char v14 = 0;
  int64_t v7 = [(TLToneManager *)self _currentOverridePolicyForAlertType:a4 didFindAlertOverridePolicy:&v14];
  if (v14) {
    BOOL v8 = v7 == a3;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    BOOL v9 = [(id)objc_opt_class() _currentOverridePolicyPreferenceKeyForAlertType:a4];
    if (v9)
    {
      CFTypeID v10 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
      if (v10)
      {
        CFStringRef v11 = v10;
        BOOL v12 = NSStringFromTLAlertOverridePolicy(a3);
        CFPreferencesSetAppValue(v9, v12, v11);
        CFRelease(v11);

        [(TLToneManager *)self _didSetTonePreferenceSuccessfullyWithKey:v9 inDomain:+[TLPreferencesUtilities preferencesDomain] usingPreferencesOfKind:1];
      }
    }
    else
    {
      uint64_t v13 = TLLogToneManagement();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[TLToneManager _setCurrentOverridePolicy:forAlertType:](a4);
      }
    }
  }
}

+ (id)_abbreviatedDescriptionOfToneIdentifierWithUnderlyingMediaPlaybackArchiveForLogging:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [@"mediaPlaybackArchive:" length];
  if ([v3 length] <= (unint64_t)(2 * v4))
  {
    id v6 = v3;
  }
  else
  {
    int v5 = [v3 substringToIndex:2 * v4];
    id v6 = [v5 stringByAppendingString:@"…"];
  }

  return v6;
}

+ (id)_abbreviatedDescriptionOfMediaPlaybackArchive:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28E78];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (objc_class *)objc_opt_class();
  int64_t v7 = NSStringFromClass(v6);
  BOOL v8 = (void *)[v5 initWithFormat:@"<%@: %p", v7, v4];

  BOOL v9 = [v4 displayProperties];

  uint64_t v10 = [v9 title];
  CFStringRef v11 = (void *)v10;
  if (v10) {
    [v8 appendFormat:@"; title = \"%@\"", v10];
  }
  uint64_t v12 = [v9 subtitle];
  uint64_t v13 = (void *)v12;
  if (v12) {
    [v8 appendFormat:@"; subtitle = \"%@\"", v12];
  }
  [v8 appendString:@">"];

  return v8;
}

- (id)_toneIdentifierWithUnderlyingPlaybackArchive:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _abbreviatedDescriptionOfMediaPlaybackArchive:v4];
  id v14 = 0;
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v14];

  id v7 = v14;
  if ([v6 length])
  {
    BOOL v8 = [v6 base64EncodedStringWithOptions:0];
    if ([v8 length])
    {
      BOOL v9 = [NSString stringWithFormat:@"%@%@", @"mediaPlaybackArchive:", v8];
      uint64_t v10 = [(id)objc_opt_class() _abbreviatedDescriptionOfToneIdentifierWithUnderlyingMediaPlaybackArchiveForLogging:v9];
      CFStringRef v11 = TLLogToneManagement();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        __int16 v16 = self;
        __int16 v17 = 2114;
        int v18 = v5;
        __int16 v19 = 2114;
        __int16 v20 = v10;
        _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: _toneIdentifierWithUnderlyingPlaybackArchive:(%{public}@): Returning \"%{public}@\".", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v10 = TLLogToneManagement();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[TLToneManager _toneIdentifierWithUnderlyingPlaybackArchive:]();
      }
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v8 = TLLogToneManagement();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(v7, "tl_nonRedundantDescription");
      *(_DWORD *)buf = 138543874;
      __int16 v16 = self;
      __int16 v17 = 2114;
      int v18 = v5;
      __int16 v19 = 2114;
      __int16 v20 = v13;
      _os_log_error_impl(&dword_1DB936000, v8, OS_LOG_TYPE_ERROR, "%{public}@: _toneIdentifierWithUnderlyingPlaybackArchive:(%{public}@): Failed to serialize playback archive with error: %{public}@.", buf, 0x20u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_underlyingPlaybackArchiveForToneIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _abbreviatedDescriptionOfToneIdentifierWithUnderlyingMediaPlaybackArchiveForLogging:v4];
  if ([v4 hasPrefix:@"mediaPlaybackArchive:"])
  {
    id v6 = [v4 substringFromIndex:objc_msgSend(@"mediaPlaybackArchive:", "length")];
  }
  else
  {
    id v6 = v4;
  }
  id v7 = v6;
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:1];
  if ([v8 length])
  {
    BOOL v9 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v18 = 0;
    __int16 v19 = &v18;
    uint64_t v20 = 0x2050000000;
    uint64_t v10 = (void *)getMPPlaybackArchiveClass_softClass;
    uint64_t v21 = getMPPlaybackArchiveClass_softClass;
    if (!getMPPlaybackArchiveClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMPPlaybackArchiveClass_block_invoke;
      int v23 = &unk_1E6C210C8;
      uint64_t v24 = &v18;
      __getMPPlaybackArchiveClass_block_invoke((uint64_t)buf);
      uint64_t v10 = (void *)v19[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v18, 8);
    id v17 = 0;
    uint64_t v12 = [v9 unarchivedObjectOfClass:v11 fromData:v8 error:&v17];
    uint64_t v13 = v17;
    if (v12)
    {
      id v14 = [(id)objc_opt_class() _abbreviatedDescriptionOfMediaPlaybackArchive:v12];
      uint64_t v15 = TLLogToneManagement();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2114;
        int v23 = v14;
        _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: _underlyingPlaybackArchiveForToneIdentifier:(%{public}@): Returning %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      id v14 = TLLogToneManagement();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[TLToneManager _underlyingPlaybackArchiveForToneIdentifier:]();
      }
    }
  }
  else
  {
    uint64_t v13 = TLLogToneManagement();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[TLToneManager _underlyingPlaybackArchiveForToneIdentifier:]();
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)_hasUnderlyingPlaybackArchiveForToneIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = ![(TLToneManager *)self _toneWithIdentifierIsDefaultRingtone:v4]
    && ![(TLToneManager *)self _toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:v4]&& ![(TLToneManager *)self _toneWithIdentifierIsITunesRingtone:v4]&& ![(TLToneManager *)self _toneWithIdentifierIsSystemTone:v4]&& ![(TLToneManager *)self _toneWithIdentifierIsAlarmWakeUp:v4]&& [(TLToneManager *)self _toneWithIdentifierIsMediaPlaybackArchive:v4];

  return v5;
}

- (void)_performBlockInAccessQueue:(id)a3
{
}

- (id)_fileNameFromToneIdentifier:(id)a3 withPrefix:(id)a4
{
  id v5 = a3;
  if ([v5 rangeOfString:a4] || (unint64_t v7 = v6, v6 >= objc_msgSend(v5, "length")))
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [v5 substringFromIndex:v7];
  }

  return v8;
}

- (id)_localizedNameOfToneWithIdentifier:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = +[TLCapabilitiesManager sharedCapabilitiesManager];
  if ([v4 wantsModernDefaultRingtone])
  {
    int v5 = [(__CFString *)v3 isEqualToString:@"system:Opening"];

    unint64_t v6 = v3;
    if (!v5) {
      goto LABEL_6;
    }
    unint64_t v6 = @"RINGTONE_PICKER_DEFAULT_RINGTONE_NAME";
    id v4 = v3;
  }
  else
  {
    unint64_t v6 = v3;
  }

LABEL_6:
  unint64_t v7 = TLLocalizedString(v6);
  if ([v7 isEqualToString:v6])
  {

    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_ensureDirectoryExistsAtPath:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v4 fileExistsAtPath:v3])
    {
      char v5 = 1;
    }
    else
    {
      id v9 = 0;
      char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
      id v6 = v9;
      if ((v5 & 1) == 0)
      {
        unint64_t v7 = TLLogToneManagement();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[TLToneManager _ensureDirectoryExistsAtPath:]();
        }
      }
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_didSetTonePreferenceSuccessfullyWithKey:(id)a3 inDomain:(id)a4 usingPreferencesOfKind:(unint64_t)a5
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = TLLogToneManagement();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v25 = v9;
    _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetTonePreferenceSuccessfullyWithKey:(%{public}@) inDomain:(%{public}@)…", buf, 0x20u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__TLToneManager__didSetTonePreferenceSuccessfullyWithKey_inDomain_usingPreferencesOfKind___block_invoke;
  v19[3] = &unk_1E6C21058;
  v19[4] = self;
  void v19[5] = a5;
  [(TLToneManager *)self _performBlockInAccessQueue:v19];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"_TLTonePreferencesDidChangeNotification", 0, 0, 1u);
  if (a5)
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2050000000;
    uint64_t v12 = (void *)getNPSManagerClass_softClass;
    uint64_t v23 = getNPSManagerClass_softClass;
    if (!getNPSManagerClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getNPSManagerClass_block_invoke;
      uint64_t v25 = &unk_1E6C210C8;
      v26[0] = &v20;
      __getNPSManagerClass_block_invoke((uint64_t)buf);
      uint64_t v12 = (void *)v21[3];
    }
    uint64_t v13 = v12;
    _Block_object_dispose(&v20, 8);
    if (v13)
    {
      id v14 = objc_alloc_init(v13);
      uint64_t v15 = TLLogToneManagement();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetTonePreferenceSuccessfully…: Instantiated preferences sync manager %{public}@.", buf, 0x16u);
      }

      __int16 v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v8, 0);
      if (a5)
      {
        [v14 synchronizeUserDefaultsDomain:v9 keys:v16];
        id v17 = TLLogToneManagement();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2114;
          uint64_t v25 = v14;
          LOWORD(v26[0]) = 2114;
          *(void *)((char *)v26 + 2) = v16;
          _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetTonePreferenceSuccessfully…: Did synchronize user defaults domain %{public}@ with %{public}@ for keys %{public}@.", buf, 0x2Au);
        }
      }
      if ((a5 & 2) != 0)
      {
        [v14 synchronizeNanoDomain:v9 keys:v16];
        uint64_t v18 = TLLogToneManagement();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2114;
          uint64_t v25 = v14;
          LOWORD(v26[0]) = 2114;
          *(void *)((char *)v26 + 2) = v16;
          _os_log_impl(&dword_1DB936000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetTonePreferenceSuccessfully…: Did synchronize nano domain %{public}@ with %{public}@ for keys %{public}@.", buf, 0x2Au);
        }
      }
    }
  }
}

uint64_t __90__TLToneManager__didSetTonePreferenceSuccessfullyWithKey_inDomain_usingPreferencesOfKind___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  uint64_t result = [*(id *)(a1 + 32) _handleTonePreferencesChangedNotificationForPreferencesKinds:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
  return result;
}

+ (BOOL)_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___TLToneManagerTCCPreflightOnceToken != -1) {
    dispatch_once(&_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___TLToneManagerTCCPreflightOnceToken, block);
  }
  char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if ((_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___TLToneManagerTCCAccessPreflightStatus + 1) > 3) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = off_1E6C21148[_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___TLToneManagerTCCAccessPreflightStatus
  }
                     + 1];
  id v8 = TLLogToneManagement();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v13 = a1;
      __int16 v14 = 2114;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: File exists at path %{public}@. TCCAccessPreflight status: %{public}@.", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    id v13 = a1;
    __int16 v14 = 2114;
    id v15 = v4;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_error_impl(&dword_1DB936000, v9, OS_LOG_TYPE_ERROR, "%{public}@: File DOES NOT exists at path %{public}@. TCCAccessPreflight status: %{public}@.", buf, 0x20u);
  }

  return v6;
}

void __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v2 = (id *)getkTCCServiceMediaLibrarySymbolLoc_ptr;
  id v17 = (void *)getkTCCServiceMediaLibrarySymbolLoc_ptr;
  if (!getkTCCServiceMediaLibrarySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkTCCServiceMediaLibrarySymbolLoc_block_invoke;
    __int16 v19 = &unk_1E6C210C8;
    uint64_t v20 = &v14;
    id v3 = (void *)TCCLibrary();
    id v4 = dlsym(v3, "kTCCServiceMediaLibrary");
    *(void *)(v20[1] + 24) = v4;
    getkTCCServiceMediaLibrarySymbolLoc_ptr = *(void *)(v20[1] + 24);
    uint64_t v2 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v2) {
    goto LABEL_19;
  }
  id v5 = *v2;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v6 = (uint64_t (*)(id, void))getTCCAccessPreflightSymbolLoc_ptr;
  id v17 = getTCCAccessPreflightSymbolLoc_ptr;
  if (!getTCCAccessPreflightSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getTCCAccessPreflightSymbolLoc_block_invoke;
    __int16 v19 = &unk_1E6C210C8;
    uint64_t v20 = &v14;
    unint64_t v7 = (void *)TCCLibrary();
    id v8 = dlsym(v7, "TCCAccessPreflight");
    *(void *)(v20[1] + 24) = v8;
    getTCCAccessPreflightSymbolLoc_ptr = *(_UNKNOWN **)(v20[1] + 24);
    int v6 = (uint64_t (*)(id, void))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v6)
  {
LABEL_19:
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    __break(1u);
  }
  int v9 = v6(v5, 0);
  if (v9 == 2)
  {
    int v10 = 0;
  }
  else
  {
    if (v9 != 1)
    {
      if (v9)
      {
        id v11 = 0;
        int v10 = -1;
      }
      else
      {
        int v10 = 1;
        id v11 = @"granted";
      }
      uint64_t v12 = TLLogToneManagement();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoked TCCAccessPreflight(kTCCServiceMediaLibrary, NULL). Got result: %{public}@.", buf, 0x16u);
      }
      goto LABEL_18;
    }
    int v10 = 2;
  }
  uint64_t v12 = TLLogToneManagement();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_3();
  }
LABEL_18:

  _ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___TLToneManagerTCCAccessPreflightStatus = v10;
}

- (void)_handleTonePreferencesChangedNotificationForPreferencesKinds:(unint64_t)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (self->_shouldIgnoreNextToneDidChangeNotification)
  {
    self->_shouldIgnoreNextToneDidChangeNotification = 0;
    id v4 = TLLogToneManagement();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1DB936000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Ignoring notification.", buf, 0xCu);
    }

    return;
  }
  if (!self->_shouldUseServiceToAccessTonePreferences)
  {
    char v8 = a3;
    int v9 = TLLogToneManagement();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…", buf, 0xCu);
    }

    if ((v8 & 1) != 0
      && (v10 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain], (id v11 = v10) != 0))
    {
      CFPreferencesSynchronize(v10, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      uint64_t v12 = TLLogToneManagement();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Synchronized CFPreferences domain %{public}@.", buf, 0x16u);
      }

      CFRelease(v11);
      char v13 = 1;
      if ((v8 & 2) == 0) {
        goto LABEL_30;
      }
    }
    else
    {
      char v13 = 0;
      if ((v8 & 2) == 0)
      {
LABEL_30:
        __int16 v27 = dispatch_get_global_queue(0, 0);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke_963;
        v28[3] = &unk_1E6C210A0;
        void v28[4] = self;
        char v29 = v13;
        dispatch_async(v27, v28);

        return;
      }
    }
    if (+[TLPreferencesUtilities canAccessNanoRegistry]
      && (NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass()) != 0)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v37 = __Block_byref_object_copy_;
      uint64_t v38 = __Block_byref_object_dispose_;
      id v39 = 0;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke_962;
      v30[3] = &unk_1E6C20D10;
      v30[4] = self;
      v30[5] = buf;
      [(TLToneManager *)self _performBlockInAccessQueue:v30];
      id v15 = *(void **)(*(void *)&buf[8] + 40);
      if (!v15)
      {
        id v16 = [NPSDomainAccessorClass alloc];
        id v17 = +[TLPreferencesUtilities perWatchPreferencesDomain];
        uint64_t v18 = [v16 initWithDomain:v17];
        __int16 v19 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v18;

        uint64_t v20 = TLLogToneManagement();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)uint64_t v32 = 138543618;
          long long v33 = self;
          __int16 v34 = 2114;
          uint64_t v35 = v21;
          _os_log_impl(&dword_1DB936000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Instantiated domain accessor %{public}@.", v32, 0x16u);
        }

        id v15 = *(void **)(*(void *)&buf[8] + 40);
      }
      id v22 = (id)[v15 synchronize];
      uint64_t v23 = TLLogToneManagement();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)uint64_t v32 = 138543618;
        long long v33 = self;
        __int16 v34 = 2114;
        uint64_t v35 = v24;
        _os_log_impl(&dword_1DB936000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Synchronized domain accessor %{public}@.", v32, 0x16u);
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v25 = TLLogToneManagement();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v26 = +[TLPreferencesUtilities canAccessNanoRegistry];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v26;
        _os_log_impl(&dword_1DB936000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Skipping synchronizing the domain accessor. canAccessNanoRegistry = %{BOOL}u.", buf, 0x12u);
      }
    }
    goto LABEL_30;
  }
  cachedTonePreferences = self->_cachedTonePreferences;
  self->_cachedTonePreferences = 0;

  int v6 = TLLogToneManagement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Clearing cached tone preferences.", buf, 0xCu);
  }

  unint64_t v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke;
  block[3] = &unk_1E6C20D60;
  block[4] = self;
  dispatch_async(v7, block);
}

void __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"TLTonePreferencesDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke_962(uint64_t a1)
{
}

void __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke_963(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"TLTonePreferencesDidChangeNotification" object:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 40)) {
    [v2 postNotificationName:@"_TLAlertOverridePolicyDidChangeNotification" object:0];
  }
}

- (void)_handleProtectionContentUnlockedEvent
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__TLToneManager__handleProtectionContentUnlockedEvent__block_invoke;
  v2[3] = &unk_1E6C20D60;
  v2[4] = self;
  [(TLToneManager *)self _performBlockInAccessQueue:v2];
}

uint64_t __54__TLToneManager__handleProtectionContentUnlockedEvent__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  id v2 = *(void **)(v1 + 48);
  if (v2)
  {
    uint64_t v3 = result;
    *(void *)(v1 + 48) = 0;

    id v4 = *(void **)(v3 + 32);
    return [v4 _reloadTonesAfterExternalChange];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTonePreferences, 0);
  objc_storeStrong((id *)&self->_transientNanoPreferencesDomainAccessor, 0);
  objc_storeStrong((id *)&self->_contentProtectionStateObserverToken, 0);
  objc_storeStrong((id *)&self->_toneIdentifierAliasMap, 0);
  objc_storeStrong((id *)&self->_systemTonesByIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifiersBySyncIdentifier, 0);
  objc_storeStrong((id *)&self->_tonesByIdentifier, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_addToneEntries:(NSObject *)a3 toManifestAtPath:mediaDirectory:shouldSkipReload:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v5 = a1;
  _os_log_error_impl(&dword_1DB936000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Could not update ringtones plist", (uint8_t *)a2, 0xCu);
}

void __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke_279_cold_1(uint64_t a1)
{
  id v2 = objc_opt_class();
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = v2;
  [v3 count];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x20u);
}

void __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke_282_cold_1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  id v1 = v0;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x34u);
}

- (void)_removeTonesFromManifestAtPath:fileNames:shouldSkipReload:alreadyLockedManifest:removedEntries:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  id v1 = v0;
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "%{public}@: Could not update ringtones plist", v4, v5, v6, v7, v8);
}

- (void)_lockManifestAtPath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_lockManifestAtPath:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__TLToneManager__tonePreferencesFromService__block_invoke_2_cold_1(void *a1)
{
  id v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Unexpected error while retrieving current tone preferences: %{public}@.", v4, v5, v6, v7, v8);
}

void __44__TLToneManager__tonePreferencesFromService__block_invoke_768_cold_1(void *a1)
{
  id v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Failed retrieving current tone preferences: %{public}@.", v4, v5, v6, v7, v8);
}

void __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_cold_1(void *a1)
{
  id v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Unexpected error trying to set a tone preference: %{public}@.", v4, v5, v6, v7, v8);
}

void __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_771_cold_1(void *a1)
{
  id v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Failed setting a tone preference: %{public}@.", v4, v5, v6, v7, v8);
}

void __44__TLToneManager__toneWithIdentifierIsValid___block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(*(void *)a1 + 16) count];
  uint64_t v7 = [*(id *)(*(void *)a1 + 16) allKeys];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x2Au);
}

void __44__TLToneManager__toneWithIdentifierIsValid___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1DB936000, v0, v1, "%{public}@: Tone with identifier '%{public}@' is neither in of the collections for system or iTunes tones.");
}

- (void)_removeToneWithSyncIdentifier:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_6(&dword_1DB936000, v1, v2, "%{public}@: _removeToneWithSyncIdentifier:(%{public}@): Failed to delete tone.", v3, v4, v5, v6, 2u);
}

+ (void)_migrateLegacyToneSettings
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DB936000, log, OS_LOG_TYPE_ERROR, "*** Assertion failure.", buf, 2u);
}

- (void)setCurrentWatchToneIdentifier:(uint64_t)a1 forAlertType:(unint64_t)a2 topic:.cold.1(uint64_t a1, unint64_t a2)
{
  uint8_t v8 = NSStringFromTLAlertType(a2);
  OUTLINED_FUNCTION_6(&dword_1DB936000, v2, v3, "%{public}@: -setCurrentWatchToneIdentifier…: Failed to update watch tone identifier for alert type %{public}@ because it is not settable.", v4, v5, v6, v7, 2u);
}

- (void)_setCurrentToneWatchAlertPolicy:(unint64_t)a1 forAlertType:topic:.cold.1(unint64_t a1)
{
  uint64_t v1 = NSStringFromTLAlertType(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Failed to update watch alert policy for alert type %{public}@ because it is not settable.", v4, v5, v6, v7, v8);
}

- (void)_setCurrentOverridePolicy:(unint64_t)a1 forAlertType:.cold.1(unint64_t a1)
{
  uint64_t v1 = NSStringFromTLAlertType(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Failed to update alert override policy for alert type %{public}@ because it is not settable.", v4, v5, v6, v7, v8);
}

- (void)_toneIdentifierWithUnderlyingPlaybackArchive:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DB936000, v0, v1, "%{public}@: _toneIdentifierWithUnderlyingPlaybackArchive:(%{public}@): Failed to encode serialized playback archive as a base 64 string.");
}

- (void)_underlyingPlaybackArchiveForToneIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DB936000, v0, v1, "%{public}@: _underlyingPlaybackArchiveForToneIdentifier:(%{public}@): Failed to decode base 64 encoded serialized playback archive.");
}

- (void)_underlyingPlaybackArchiveForToneIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DB936000, v0, v1, "%{public}@: _underlyingPlaybackArchiveForToneIdentifier:(%{public}@): Failed to deserialize the serialized playback archive.");
}

- (void)_ensureDirectoryExistsAtPath:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DB936000, v0, v1, "Failed to create directory at path: %{public}@. %{public}@.");
}

uint64_t __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_3(v0);
}

void __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_3()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  uint64_t v3 = v0;
  _os_log_fault_impl(&dword_1DB936000, v1, OS_LOG_TYPE_FAULT, "%{public}@: Invoked TCCAccessPreflight(kTCCServiceMediaLibrary, NULL). Got result: %{public}@.", v2, 0x16u);
}

@end