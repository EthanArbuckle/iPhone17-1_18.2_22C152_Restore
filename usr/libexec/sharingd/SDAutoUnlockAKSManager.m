@interface SDAutoUnlockAKSManager
+ (BOOL)useKeychainForLTKSyncing;
+ (id)sharedManager;
- (BOOL)autoUnlockDisabledDueToManagement;
- (BOOL)cachedEscrowSecretExistsForDeviceID:(id)a3;
- (BOOL)cachedEscrowSecretIsValidForDeviceID:(id)a3;
- (BOOL)canCreateTokenSessionForDeviceID:(id)a3;
- (BOOL)deviceEnabledAsKey:(id)a3;
- (BOOL)deviceEnabledAsKeyForAnyDevice;
- (BOOL)deviceEnabledAsKeyForAnyIDSDevice;
- (BOOL)deviceEnabledAsKeyForAnyIDSMac;
- (BOOL)deviceEnabledAsKeyForAnyMac;
- (BOOL)deviceEnabledAsKeyForIDSDeviceID:(id)a3;
- (BOOL)deviceIsLocalDevice:(id)a3;
- (BOOL)disablePairingWithKeyDevice:(id)a3;
- (BOOL)encryptMessageData:(id)a3 deviceID:(id)a4 encryptedMessage:(id *)a5 authTag:(id *)a6 nonce:(id *)a7;
- (BOOL)escrowSecretExistsForDevice:(id)a3;
- (BOOL)hashMatchesAnyRemoteLTKForDeviceID:(id)a3 ltkHash:(id)a4 isPreferred:(BOOL *)a5;
- (BOOL)isMobileActivationErrorNetworkError:(id)a3;
- (BOOL)loadLocalAttestedLTKIfNecessary;
- (BOOL)loadLocalLTK;
- (BOOL)localDeviceEnabledAsKey;
- (BOOL)localDeviceEnabledAsKeyForMac;
- (BOOL)ltkExistsForKeyDevice:(id)a3;
- (BOOL)ltkExistsForKeyDevice:(id)a3 updateLTKs:(BOOL)a4;
- (BOOL)sessionKeyExistsForDeviceID:(id)a3;
- (BOOL)signLTK:(id)a3 ltkModDate:(id)a4 modernLTK:(id)a5 modernLTKModDate:(id)a6 deviceID:(id)a7;
- (BOOL)signLTK:(id)a3 modernLTK:(id)a4 forDeviceID:(id)a5;
- (BOOL)signLTKsForDeviceID:(id)a3;
- (BOOL)storeAttestedLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5;
- (BOOL)storeEscrowSecret:(id)a3 pairingID:(id)a4 deviceID:(id)a5 requiresUnlock:(BOOL)a6;
- (BOOL)storeKeychainItemWithAttributeDictionary:(id)a3 updateDictionary:(id)a4 addDictionary:(id)a5;
- (BOOL)storeLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5;
- (BOOL)storeLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5 modern:(BOOL)a6;
- (BOOL)storeRangingKey:(id)a3 forDeviceID:(id)a4;
- (BOOL)t208Machine;
- (BOOL)viewSyncing;
- (BOOL)wristDetectDisabled;
- (NSData)localAttestedLTK;
- (NSData)localLTK;
- (NSMutableArray)watchIDsMissingSessionKey;
- (NSMutableDictionary)activeAKSSessions;
- (NSMutableDictionary)cachedSessionKeys;
- (NSMutableDictionary)cachedSessions;
- (NSMutableDictionary)escrowSecretForDeviceID;
- (NSMutableDictionary)preferredRemoteLTKForDeviceID;
- (NSMutableDictionary)remoteLTKs;
- (NSMutableDictionary)watchIDsToPairingRecords;
- (NSString)altDSID;
- (NSString)companionIDStorageFilePath;
- (NSString)localDeviceID;
- (NSString)remoteLTKStorageFilePath;
- (NSString)state;
- (NSString)watchIDToCompanionIDStorageFilePath;
- (NSString)watchIDsToPairingRecordsStorageFilePath;
- (OS_dispatch_source)keybagAssertionTimer;
- (SDAutoUnlockAKSManager)init;
- (id)aksAuthSessionForDeviceID:(id)a3 attestation:(BOOL)a4 sessionType:(int64_t)a5 escrowSecret:(id)a6;
- (id)aksAuthSessionForDeviceID:(id)a3 originator:(BOOL)a4;
- (id)aksAuthSessionForDeviceID:(id)a3 originator:(BOOL)a4 usingEscrow:(BOOL)a5 attestation:(BOOL)a6 sessionType:(int64_t)a7;
- (id)aksAuthorizationSessionForDeviceID:(id)a3 attestation:(BOOL)a4 originator:(BOOL)a5 externalACMContext:(id)a6 sessionType:(int64_t)a7;
- (id)aksAuthorizationSessionForDeviceID:(id)a3 originator:(BOOL)a4 sessionType:(int64_t)a5;
- (id)aksPairingSessionForDeviceID:(id)a3 originator:(BOOL)a4 errorCode:(int64_t *)a5 requiresAttestation:(BOOL)a6 requiresEscrow:(BOOL)a7;
- (id)aksRegistrationSessionForDeviceID:(id)a3 originator:(BOOL)a4;
- (id)allKeychainDevices;
- (id)allPairedWatchDeviceIDs;
- (id)allRemoteLTKData;
- (id)anyLongTermKeyForDeviceID:(id)a3;
- (id)attestedDictionaryForDevice:(id)a3;
- (id)autoUnlockFolderPath;
- (id)baseDictionary;
- (id)baseLocalKeysDictionary;
- (id)baseLocalKeysDictionaryForDevice:(id)a3 type:(id)a4;
- (id)baseModernSyncedDictionary;
- (id)baseRangingDictionary;
- (id)baseRangingDictionaryForDevice:(id)a3;
- (id)baseSyncedDictionary;
- (id)companionIDForWatchID:(id)a3;
- (id)decryptMessage:(id)a3 authTag:(id)a4 nonce:(id)a5 bluetoothID:(id)a6 cachedDevices:(BOOL)a7 errorCode:(int64_t *)a8;
- (id)deriveKeyFromSharedSecret:(id)a3;
- (id)deviceIDsMissingSessionKey;
- (id)escrowSecretCreationDateForDeviceID:(id)a3;
- (id)escrowSecretForDevice:(id)a3;
- (id)keyPairingIDForDeviceID:(id)a3;
- (id)keybagAssertion;
- (id)keychainDataForQuery:(id)a3;
- (id)keychainDevices:(BOOL)a3;
- (id)loadCompanionIDs;
- (id)loadLegacyWatchIDToCompanionIDMapping;
- (id)longTermKeyForDevice:(id)a3 modern:(BOOL)a4;
- (id)longTermKeyIDForDeviceID:(id)a3;
- (id)ltkHashForLocalLTK;
- (id)ltkInfoForDeviceID:(id)a3;
- (id)ltkInfoForDeviceID:(id)a3 modern:(BOOL)a4;
- (id)ltkInfoForDeviceID:(id)a3 modern:(BOOL)a4 attested:(BOOL)a5;
- (id)ltksForRequest:(id)a3;
- (id)migrateLegacyCompanionIDs:(id)a3;
- (id)modernSignedDevices;
- (id)modernSyncedDictionaryForDevice:(id)a3;
- (id)modificationDataForDeviceID:(id)a3 modern:(BOOL)a4;
- (id)pairingIDForWatchID:(id)a3;
- (id)rangingKeyForDeviceID:(id)a3;
- (id)remoteLTKEntryForDeviceID:(id)a3;
- (id)remoteLTKForDeviceID:(id)a3;
- (id)remoteLTKHashForDeviceID:(id)a3 modern:(BOOL)a4;
- (id)remoteLTKList;
- (id)sessionKeyForDeviceID:(id)a3;
- (id)signedDevices;
- (id)syncedDictionaryForDevice:(id)a3;
- (int)ltkSyncStatusForDeviceID:(id)a3 hash:(id)a4 modern:(BOOL)a5;
- (int64_t)keyClassForDeviceID:(id)a3;
- (int64_t)ltkKeyClassWithAttestation:(BOOL)a3;
- (os_unfair_lock_s)cachedSessionKeysLock;
- (void)addDeviceIDMissingSessionKey:(id)a3;
- (void)addObservers;
- (void)addRemoteLTK:(id)a3 ltkHash:(id)a4 ltkModDate:(id)a5 modernLTK:(id)a6 modernLTKHash:(id)a7 modernLTKModeDate:(id)a8 deviceID:(id)a9;
- (void)appleAccountSignedIn:(id)a3;
- (void)appleAccountSignedOut:(id)a3;
- (void)checkLocalAttestedLTK;
- (void)checkLocalLTK;
- (void)checkPhoneRemoteLTKs;
- (void)checkRemoteLTKForDeviceID:(id)a3;
- (void)clearAllDeviceIDsMissingSessionKeys;
- (void)clearRemoteLTKs;
- (void)consoleUserChanged:(id)a3;
- (void)deleteAllEscrowSecrets;
- (void)deleteAllRangingKeys;
- (void)deleteEscrowSecretForAllDevices;
- (void)deleteEscrowSecretForDeviceID:(id)a3;
- (void)deleteEscrowSecretForPhones;
- (void)deleteLegacyCompanionIDs;
- (void)deleteLegacyWatchToCompanionIDs;
- (void)deleteLocalAttestedLTK;
- (void)deleteRangingKeyForDeviceID:(id)a3;
- (void)deleteRemoteLongTermKeyForDeviceID:(id)a3 modern:(BOOL)a4 tombstone:(BOOL)a5;
- (void)deviceFirstUnlocked:(id)a3;
- (void)disablePairingForAllKeyDevices;
- (void)disablePairingForAllLockPhones;
- (void)fetchLTKsFromCompanion:(BOOL)a3;
- (void)generateLocalAttestedLTKIfNeccessaryWithCompletion:(id)a3;
- (void)generateLocalLTKWithAttestation:(BOOL)a3;
- (void)generateLocalLTKWithAttestation:(BOOL)a3 forceDCRTRetrievalWithCompletion:(id)a4;
- (void)handleKeyBagLockStateChanged;
- (void)handleLTKRequest:(id)a3;
- (void)handleManagementChanged:(id)a3;
- (void)loadLocalUniqueIDIfNeeded;
- (void)loadRemoteLTKs;
- (void)loadRemoteLTKsIfNeeded;
- (void)loadWatchIDsToPairingRecords;
- (void)migrateLegacyWatchIDToCompanionIDs;
- (void)releaseKeybagAssertion;
- (void)reloadPairingRecordsIfNeeded;
- (void)removeAllRemoteLTKsOnSignOut;
- (void)removeCompanionIDForWatchID:(id)a3;
- (void)removeDeviceIDMissingSessionKey:(id)a3;
- (void)removePairingIDForWatchID:(id)a3;
- (void)removePairingRecordForWatchID:(id)a3;
- (void)removeRemoteLTKForDeviceID:(id)a3;
- (void)resignRemoteLTKForDeviceID:(id)a3;
- (void)restartKeybagAssertionTimer;
- (void)saveRemoteLTKs;
- (void)saveWatchIDsToPairingRecords;
- (void)screenLockUnlocked:(id)a3;
- (void)sendLTKResponseWithPayload:(id)a3 viewState:(id)a4 needsUnlock:(id)a5 currentlySyncing:(id)a6;
- (void)setActiveAKSSessions:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAutoUnlockDisabledDueToManagement:(BOOL)a3;
- (void)setCachedSessionKeys:(id)a3;
- (void)setCachedSessions:(id)a3;
- (void)setCompanionID:(id)a3 forWatchID:(id)a4;
- (void)setCompanionIDStorageFilePath:(id)a3;
- (void)setEscrowSecretForDeviceID:(id)a3;
- (void)setKeybagAssertion:(id)a3;
- (void)setKeybagAssertionTimer:(id)a3;
- (void)setLocalAttestedLTK:(id)a3;
- (void)setLocalDeviceID:(id)a3;
- (void)setLocalLTK:(id)a3;
- (void)setPairingID:(id)a3 forWatchID:(id)a4;
- (void)setPreferredRemoteLTKForDeviceID:(id)a3;
- (void)setRemoteLTKStorageFilePath:(id)a3;
- (void)setRemoteLTKs:(id)a3;
- (void)setState:(id)a3;
- (void)setT208Machine:(BOOL)a3;
- (void)setWatchIDToCompanionIDStorageFilePath:(id)a3;
- (void)setWatchIDsMissingSessionKey:(id)a3;
- (void)setWatchIDsToPairingRecords:(id)a3;
- (void)setWatchIDsToPairingRecordsStorageFilePath:(id)a3;
- (void)setWristDetectDisabled:(BOOL)a3;
- (void)signAndStoreRemoteLTK:(id)a3 forDeviceID:(id)a4;
- (void)start;
- (void)takeMobileKeybagAssertion;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
- (void)updateDynamicStoreEnabled;
- (void)updateLTKs;
- (void)updateLTKsForDeviceID:(id)a3 staleRemoteLTK:(BOOL)a4;
- (void)updateLocalLTK;
- (void)updateLocalLTKForSignout;
- (void)updatePreferredRemoteLTKForDeviceID:(id)a3;
- (void)updateRangingKeysIfNeccesary;
- (void)updateRemoteLTKs;
- (void)updateSessionKeys;
@end

@implementation SDAutoUnlockAKSManager

+ (id)sharedManager
{
  if (qword_100980040 != -1) {
    dispatch_once(&qword_100980040, &stru_1008CD9E0);
  }
  v2 = (void *)qword_100980038;

  return v2;
}

- (SDAutoUnlockAKSManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)SDAutoUnlockAKSManager;
  v2 = [(SDAutoUnlockAKSManager *)&v18 init];
  v3 = v2;
  if (v2)
  {
    v2->_cachedSessionKeysLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = IDSCopyLocalDeviceUniqueID();
    localDeviceID = v3->_localDeviceID;
    v3->_localDeviceID = (NSString *)v4;

    uint64_t v6 = objc_opt_new();
    cachedSessions = v3->_cachedSessions;
    v3->_cachedSessions = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    preferredRemoteLTKForDeviceID = v3->_preferredRemoteLTKForDeviceID;
    v3->_preferredRemoteLTKForDeviceID = (NSMutableDictionary *)v8;

    v3->_t208Machine = variable initialization expression of SDAirDropHashStoreCDB.destroyed();
    uint64_t v10 = objc_opt_new();
    activeAKSSessions = v3->_activeAKSSessions;
    v3->_activeAKSSessions = (NSMutableDictionary *)v10;

    v12 = +[SDAutoUnlockTransport sharedTransport];
    [v12 addClient:v3 forIdentifer:@"A70C5EAF-F24F-48A7-B834-F5297000C7A2"];

    [(SDAutoUnlockAKSManager *)v3 addObservers];
    v13 = auto_unlock_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v3->_localDeviceID;
      *(_DWORD *)buf = 138412290;
      CFStringRef v20 = (const __CFString *)v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Local Unique ID:%@", buf, 0xCu);
    }

    v15 = auto_unlock_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v16 = @"YES";
      if (!v3->_t208Machine) {
        CFStringRef v16 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Touch Bar:%@", buf, 0xCu);
    }
  }
  return v3;
}

- (void)start
{
  v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 deviceSupportsRanging];

  if (v4)
  {
    [(SDAutoUnlockAKSManager *)self loadWatchIDsToPairingRecords];
    [(SDAutoUnlockAKSManager *)self updateLTKs];
    v5 = +[SDStatusMonitor sharedMonitor];
    unsigned int v6 = [v5 deviceKeyBagUnlocked];

    if (v6) {
      [(SDAutoUnlockAKSManager *)self updateSessionKeys];
    }
    [(SDAutoUnlockAKSManager *)self updateDynamicStoreEnabled];
    v7 = +[SDStatusMonitor sharedMonitor];
    uint64_t v8 = [v7 myAltDSID];
    [(SDAutoUnlockAKSManager *)self setAltDSID:v8];

    v9 = auto_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(SDAutoUnlockAKSManager *)self altDSID];
      CFStringRef v11 = @"YES";
      if (!v10) {
        CFStringRef v11 = @"NO";
      }
      int v12 = 138412290;
      CFStringRef v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DSID: %@", (uint8_t *)&v12, 0xCu);
    }
    if (sub_1000D3140())
    {
      [(SDAutoUnlockAKSManager *)self setAutoUnlockDisabledDueToManagement:1];
      [(SDAutoUnlockAKSManager *)self handleRequiredStateDisabled];
    }
    [(SDAutoUnlockAKSManager *)self updateRangingKeysIfNeccesary];
  }
}

- (void)updateLTKs
{
  v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 deviceSupportsRanging];

  if (v4)
  {
    unsigned int v5 = [(SDAutoUnlockAKSManager *)self loadLocalAttestedLTKIfNecessary];
    [(SDAutoUnlockAKSManager *)self updateRemoteLTKs];
    [(SDAutoUnlockAKSManager *)self checkLocalLTK];
    if (v5)
    {
      [(SDAutoUnlockAKSManager *)self checkLocalAttestedLTK];
    }
  }
}

- (void)updateLocalLTK
{
  v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 deviceSupportsRanging];

  if (v4)
  {
    [(SDAutoUnlockAKSManager *)self loadLocalLTK];
    [(SDAutoUnlockAKSManager *)self loadLocalAttestedLTKIfNecessary];
  }
  else
  {
    unsigned int v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device does not support ranging, not loading localLTKs", v6, 2u);
    }
  }
}

- (NSString)state
{
  uint64_t v80 = 0;
  v3 = (objc_class *)objc_opt_class();
  v47 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v4 = 0;

  id v79 = v4;
  NSAppendPrintF();
  id v5 = v4;

  id v78 = v5;
  v48 = [(SDAutoUnlockAKSManager *)self localDeviceID];
  NSAppendPrintF();
  id v6 = v5;

  id v77 = v6;
  NSAppendPrintF();
  id v7 = v6;

  id v76 = v7;
  if ([(SDAutoUnlockAKSManager *)self viewSyncing]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  CFStringRef v49 = v8;
  NSAppendPrintF();
  id v9 = v76;

  id v75 = v9;
  uint64_t v10 = +[SDStatusMonitor sharedMonitor];
  if ([v10 deviceWasUnlockedOnce]) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  CFStringRef v50 = v11;
  NSAppendPrintF();
  id v12 = v75;

  id v74 = v12;
  CFStringRef v13 = [(SDAutoUnlockAKSManager *)self allKeychainDevices];
  v14 = [v13 allObjects];
  v51 = SFCompactStringFromCollection();
  NSAppendPrintF();
  id v15 = v12;

  id v73 = v15;
  v52 = [(SDAutoUnlockAKSManager *)self remoteLTKStorageFilePath];
  NSAppendPrintF();
  id v16 = v15;

  id v72 = v16;
  NSAppendPrintF();
  id v17 = v16;

  v59 = self;
  [(SDAutoUnlockAKSManager *)self remoteLTKList];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v61 = long long v71 = 0u;
  id obj = [v61 allKeys];
  id v18 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v69;
    do
    {
      v21 = 0;
      v22 = v17;
      do
      {
        if (*(void *)v69 != v20) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v21);
        v24 = [v61 objectForKeyedSubscript:v23, v53, v55, v57, v58];
        v25 = [v24 objectForKeyedSubscript:@"LTK Data"];
        if (!v25)
        {
          v25 = [v24 objectForKeyedSubscript:@"Attested LTK Data"];
        }
        v67 = v22;
        v26 = [v24 objectForKeyedSubscript:@"LTK ID"];
        uint64_t v27 = sub_10001D4C4(v25);
        v28 = sub_10001D9A8(v27);
        [v25 description];
        v58 = v57 = v28;
        v53 = v23;
        v55 = v26;
        NSAppendPrintF();
        id v17 = v22;

        v21 = (char *)v21 + 1;
        v22 = v17;
      }
      while (v19 != v21);
      id v19 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
    }
    while (v19);
  }

  id v66 = v17;
  NSAppendPrintF();
  id v29 = v17;

  v30 = objc_opt_new();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v31 = +[SDAutoUnlockTransport sharedTransport];
  v32 = [v31 devicesWithLTKs];
  v33 = [v32 allObjects];

  id v34 = [v33 countByEnumeratingWithState:&v62 objects:v81 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v63;
    v37 = v59;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v63 != v36) {
          objc_enumerationMutation(v33);
        }
        v39 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        v40 = [(SDAutoUnlockAKSManager *)v37 localDeviceID];
        unsigned __int8 v41 = [v39 isEqualToString:v40];

        if ((v41 & 1) == 0
          && [(SDAutoUnlockAKSManager *)v37 escrowSecretExistsForDevice:v39])
        {
          [v30 addObject:v39];
          v42 = [(SDAutoUnlockAKSManager *)v37 rangingKeyForDeviceID:v39];
          v56 = [v42 description];
          NSAppendPrintF();
          id v43 = v29;

          -[SDAutoUnlockAKSManager keyPairingIDForDeviceID:](v59, "keyPairingIDForDeviceID:", v39, v39, v56);
          v55 = v53 = v39;
          NSAppendPrintF();
          id v29 = v43;

          v37 = v59;
        }
      }
      id v35 = [v33 countByEnumeratingWithState:&v62 objects:v81 count:16];
    }
    while (v35);
  }

  v54 = SFCompactStringFromCollection();
  NSAppendPrintF();
  id v44 = v29;

  NSAppendPrintF();
  id v45 = v44;

  return (NSString *)v45;
}

- (BOOL)viewSyncing
{
  id v2 = objc_alloc_init(off_100967D60());
  id v7 = 0;
  unsigned __int8 v3 = [v2 isManateeAvailable:&v7];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    id v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100121618();
    }
  }
  return v3;
}

- (void)loadLocalUniqueIDIfNeeded
{
  unsigned __int8 v3 = [(SDAutoUnlockAKSManager *)self localDeviceID];

  if (!v3)
  {
    id v4 = (void *)IDSCopyLocalDeviceUniqueID();
    [(SDAutoUnlockAKSManager *)self setLocalDeviceID:v4];

    id v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SDAutoUnlockAKSManager *)self localDeviceID];
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reloading local unique ID: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)addObservers
{
  unsigned __int8 v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100121680();
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"appleAccountSignedIn:" name:@"com.apple.sharingd.AppleAccountSignIn" object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"appleAccountSignedOut:" name:@"com.apple.sharingd.AppleAccountSignOut" object:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"deviceFirstUnlocked:" name:@"com.apple.sharingd.KeyBagFirstUnlock" object:0];

  id v7 = +[MCProfileConnection sharedConnection];
  CFStringRef v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"handleManagementChanged:" name:MCEffectiveSettingsChangedNotification object:0];

  id location = 0;
  objc_initWeak(&location, self);
  int out_token = 0;
  id v9 = (const char *)[kMANotificationDCRTOOBPerformed UTF8String];
  id v10 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001144DC;
  handler[3] = &unk_1008CA370;
  objc_copyWeak(&v12, &location);
  notify_register_dispatch(v9, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)handleManagementChanged:(id)a3
{
  id v4 = SFMainQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001145E4;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)deviceFirstUnlocked:(id)a3
{
  id v8 = (id)objc_opt_new();
  [v8 setVersion:1];
  id v4 = +[SDAutoUnlockTransport sharedTransport];
  id v5 = [v8 data];
  uint64_t v6 = IDSDefaultPairedDevice;
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"A70C5EAF-F24F-48A7-B834-F5297000C7A2"];
  [v4 sendPayload:v5 toDevice:v6 type:308 sessionID:v7 queueOneID:0 timeout:0 errorHandler:&stru_1008CDA00];

  [(SDAutoUnlockAKSManager *)self updateRangingKeysIfNeccesary];
}

- (void)appleAccountSignedIn:(id)a3
{
  unsigned __int8 v3 = sharing_persistent_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AKS received Apple Account sign in", v4, 2u);
  }
}

- (void)appleAccountSignedOut:(id)a3
{
  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AKS received Apple Account sign out", v6, 2u);
  }

  [(SDAutoUnlockAKSManager *)self removeAllRemoteLTKsOnSignOut];
  id v5 = +[SDAutoUnlockTransport sharedTransport];
  [v5 resetAppleWatchExisted];
}

- (void)screenLockUnlocked:(id)a3
{
  id v4 = +[SDStatusMonitor sharedMonitor];
  if ([v4 deviceSupportsRanging])
  {
    [(SDAutoUnlockAKSManager *)self loadLocalUniqueIDIfNeeded];
    [(SDAutoUnlockAKSManager *)self loadLocalLTK];
    [(SDAutoUnlockAKSManager *)self loadLocalAttestedLTKIfNecessary];
    [(SDAutoUnlockAKSManager *)self updateRemoteLTKs];
    [(SDAutoUnlockAKSManager *)self checkLocalLTK];
    [(SDAutoUnlockAKSManager *)self checkLocalAttestedLTK];
    [(SDAutoUnlockAKSManager *)self checkRemoteLTKs];
    [(SDAutoUnlockAKSManager *)self updateSessionKeys];
  }
}

- (void)handleKeyBagLockStateChanged
{
  unsigned __int8 v3 = +[SDStatusMonitor sharedMonitor];
  if ([v3 deviceKeyBagUnlocked])
  {
    if ([v3 deviceSupportsRanging] && SFDeviceSupportsAutoUnlock())
    {
      [(SDAutoUnlockAKSManager *)self loadLocalUniqueIDIfNeeded];
      [(SDAutoUnlockAKSManager *)self loadLocalLTK];
      [(SDAutoUnlockAKSManager *)self loadLocalAttestedLTKIfNecessary];
      [(SDAutoUnlockAKSManager *)self updateRemoteLTKs];
      [(SDAutoUnlockAKSManager *)self checkLocalLTK];
      [(SDAutoUnlockAKSManager *)self checkLocalAttestedLTK];
      [(SDAutoUnlockAKSManager *)self checkRemoteLTKs];
      [(SDAutoUnlockAKSManager *)self updateDynamicStoreEnabled];
      [(SDAutoUnlockAKSManager *)self updateSessionKeys];
      [(SDAutoUnlockAKSManager *)self reloadPairingRecordsIfNeeded];
    }
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Auto Unlock dynamic store updated", v6, 2u);
    }

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"SDAutoUnlockAKSManagerDynamicStoreUpdatedAfterFirstUnlockNotification" object:0 userInfo:0];
  }
}

- (void)consoleUserChanged:(id)a3
{
  unsigned __int8 v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 currentConsoleUser];

  if (v4)
  {
    id v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = getuid();
      __int16 v8 = 1024;
      pid_t v9 = getpid();
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Current console user changed (uid: %d, pid: %d)", (uint8_t *)v7, 0xEu);
    }

    uint64_t v6 = +[SDAutoUnlockAKSManager sharedManager];
    [v6 updateDynamicStoreEnabled];
  }
}

- (id)aksPairingSessionForDeviceID:(id)a3 originator:(BOOL)a4 errorCode:(int64_t *)a5 requiresAttestation:(BOOL)a6 requiresEscrow:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  if (v8)
  {
    CFStringRef v13 = [(SDAutoUnlockAKSManager *)self localAttestedLTK];
  }
  else
  {
    CFStringRef v13 = [(SDAutoUnlockAKSManager *)self localLTK];
    [(SDAutoUnlockAKSManager *)self checkRemoteLTKForDeviceID:v12];
  }
  v14 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v12];
  if (v14 && v13)
  {
    if (v8) {
      uint64_t v15 = 4;
    }
    else {
      uint64_t v15 = 1;
    }
    if (v8 && v7)
    {
      id v16 = auto_unlock_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Using attested escrow pairing type", v27, 2u);
      }

      uint64_t v15 = 6;
    }
    id v17 = [[SDAutoUnlockAKSSession alloc] initWithLocalLTK:v13 remoteLTK:v14 sessionType:v15 originator:v10 deviceID:v12];
  }
  else
  {
    id v18 = auto_unlock_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned int v22 = [(SDAutoUnlockAKSManager *)self viewSyncing];
      CFStringRef v23 = @"NO";
      *(_DWORD *)uint64_t v27 = 138413827;
      *(void *)&v27[4] = v12;
      *(_WORD *)&v27[12] = 2112;
      if (v22) {
        CFStringRef v24 = @"YES";
      }
      else {
        CFStringRef v24 = @"NO";
      }
      *(void *)&v27[14] = v24;
      if (v8) {
        CFStringRef v25 = @"YES";
      }
      else {
        CFStringRef v25 = @"NO";
      }
      *(_WORD *)&v27[22] = 2112;
      if (v13) {
        CFStringRef v26 = @"YES";
      }
      else {
        CFStringRef v26 = @"NO";
      }
      CFStringRef v28 = v25;
      if (v14) {
        CFStringRef v23 = @"YES";
      }
      __int16 v29 = 2112;
      CFStringRef v30 = v26;
      __int16 v31 = 2113;
      v32 = v13;
      __int16 v33 = 2112;
      CFStringRef v34 = v23;
      __int16 v35 = 2113;
      uint64_t v36 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "AKS session missing keys (device: %@, syncing %@, attestation: %@, local exists %@, local LTK: %{private}@, remote exists %@, remote LTK: %{private}@)", v27, 0x48u);
    }

    id v17 = 0;
    if (a5)
    {
      if (v14)
      {
        if (v13) {
          int64_t v19 = 101;
        }
        else {
          int64_t v19 = 149;
        }
      }
      else
      {
        int64_t v19 = 148;
      }
      *a5 = v19;
    }
  }
  uint64_t v20 = [(SDAutoUnlockAKSManager *)self activeAKSSessions];
  [v20 setObject:v17 forKeyedSubscript:v12];

  return v17;
}

- (id)aksRegistrationSessionForDeviceID:(id)a3 originator:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(SDAutoUnlockAKSManager *)self localAttestedLTK];
  BOOL v8 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v6];
  if (v8 && v7)
  {
    pid_t v9 = [[SDAutoUnlockAKSSession alloc] initWithLocalLTK:v7 remoteLTK:v8 sessionType:5 originator:v4 deviceID:v6];
  }
  else
  {
    BOOL v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v13 = @"NO";
      *(_DWORD *)uint64_t v15 = 138413315;
      *(void *)&v15[4] = v6;
      if (v7) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      *(void *)&v15[14] = v14;
      *(_WORD *)&v15[12] = 2112;
      if (v8) {
        CFStringRef v13 = @"YES";
      }
      *(_WORD *)&v15[22] = 2113;
      id v16 = v7;
      __int16 v17 = 2112;
      CFStringRef v18 = v13;
      __int16 v19 = 2113;
      uint64_t v20 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "AKS session missing keys (device: %@, local exists %@, local LTK: %{private}@, remote exists %@, remote LTK: %{private}@)", v15, 0x34u);
    }

    pid_t v9 = 0;
  }
  CFStringRef v11 = [(SDAutoUnlockAKSManager *)self activeAKSSessions];
  [v11 setObject:v9 forKeyedSubscript:v6];

  return v9;
}

- (id)aksAuthSessionForDeviceID:(id)a3 originator:(BOOL)a4
{
  return [(SDAutoUnlockAKSManager *)self aksAuthSessionForDeviceID:a3 originator:a4 usingEscrow:0 attestation:0 sessionType:2];
}

- (id)aksAuthSessionForDeviceID:(id)a3 originator:(BOOL)a4 usingEscrow:(BOOL)a5 attestation:(BOOL)a6 sessionType:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = (__CFString *)a3;
  if (v8) {
    [(SDAutoUnlockAKSManager *)self localAttestedLTK];
  }
  else {
  CFStringRef v13 = [(SDAutoUnlockAKSManager *)self localLTK];
  }
  CFStringRef v14 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v12];
  if (v14 && v13)
  {
    if (v10)
    {
      if (v9)
      {
        uint64_t v15 = [(SDAutoUnlockAKSManager *)self escrowSecretForDevice:v12];
        id v16 = auto_unlock_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v17 = @"YES";
          if (!v15) {
            CFStringRef v17 = @"NO";
          }
          int v37 = 138412546;
          CFStringRef v38 = v17;
          __int16 v39 = 2112;
          CFStringRef v40 = v12;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Escrow secret (exists: %@, device ID: %@)", (uint8_t *)&v37, 0x16u);
        }

        CFStringRef v18 = auto_unlock_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_100121750();
        }

        if (v15)
        {
          __int16 v19 = [[SDAutoUnlockAKSSession alloc] initWithLocalLTK:v13 remoteLTK:v14 sessionType:a7 originator:1 deviceID:v12 escrowSecret:v15];
        }
        else
        {
          CFStringRef v28 = auto_unlock_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_10012171C();
          }

          __int16 v19 = 0;
        }

        goto LABEL_25;
      }
      v21 = [SDAutoUnlockAKSSession alloc];
      unsigned int v22 = v13;
      CFStringRef v23 = v14;
      int64_t v24 = a7;
      uint64_t v25 = 1;
      CFStringRef v26 = v12;
      BOOL v27 = 0;
    }
    else
    {
      v21 = [SDAutoUnlockAKSSession alloc];
      unsigned int v22 = v13;
      CFStringRef v23 = v14;
      int64_t v24 = a7;
      uint64_t v25 = 0;
      CFStringRef v26 = v12;
      BOOL v27 = v9;
    }
    __int16 v19 = [(SDAutoUnlockAKSSession *)v21 initWithLocalLTK:v22 remoteLTK:v23 sessionType:v24 originator:v25 deviceID:v26 usingEscrow:v27];
    goto LABEL_25;
  }
  uint64_t v20 = auto_unlock_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    unsigned int v30 = [(SDAutoUnlockAKSManager *)self viewSyncing];
    CFStringRef v31 = @"NO";
    int v37 = 138414339;
    CFStringRef v38 = v12;
    __int16 v39 = 2112;
    if (v30) {
      CFStringRef v32 = @"YES";
    }
    else {
      CFStringRef v32 = @"NO";
    }
    CFStringRef v40 = v32;
    if (v13) {
      CFStringRef v33 = @"YES";
    }
    else {
      CFStringRef v33 = @"NO";
    }
    __int16 v41 = 2112;
    if (v14) {
      CFStringRef v34 = @"YES";
    }
    else {
      CFStringRef v34 = @"NO";
    }
    CFStringRef v42 = v33;
    __int16 v43 = 2113;
    if (v10) {
      CFStringRef v35 = @"YES";
    }
    else {
      CFStringRef v35 = @"NO";
    }
    id v44 = v13;
    if (v9) {
      CFStringRef v36 = @"YES";
    }
    else {
      CFStringRef v36 = @"NO";
    }
    __int16 v45 = 2112;
    if (v8) {
      CFStringRef v31 = @"YES";
    }
    CFStringRef v46 = v34;
    __int16 v47 = 2113;
    v48 = v14;
    __int16 v49 = 2112;
    CFStringRef v50 = v35;
    __int16 v51 = 2112;
    CFStringRef v52 = v36;
    __int16 v53 = 2112;
    CFStringRef v54 = v31;
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "AKS session missing keys (device: %@, syncing %@, local exists %@, local LTK: %{private}@, remote exists %@, remote LTK: %{private}@, originator: %@, escrow: %@, attested: %@)", (uint8_t *)&v37, 0x5Cu);
  }

  __int16 v19 = 0;
LABEL_25:

  return v19;
}

- (id)aksAuthSessionForDeviceID:(id)a3 attestation:(BOOL)a4 sessionType:(int64_t)a5 escrowSecret:(id)a6
{
  BOOL v8 = a4;
  BOOL v10 = (__CFString *)a3;
  id v11 = a6;
  if (v8) {
    [(SDAutoUnlockAKSManager *)self localAttestedLTK];
  }
  else {
  id v12 = [(SDAutoUnlockAKSManager *)self localLTK];
  }
  CFStringRef v13 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v10];
  CFStringRef v14 = auto_unlock_log();
  uint64_t v15 = v14;
  if (v13 && v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v16 = @"YES";
      if (!v11) {
        CFStringRef v16 = @"NO";
      }
      int v26 = 138412546;
      CFStringRef v27 = v16;
      __int16 v28 = 2112;
      CFStringRef v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Escrow secret (exists: %@, device ID: %@)", (uint8_t *)&v26, 0x16u);
    }

    CFStringRef v17 = auto_unlock_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100121750();
    }

    if (v11)
    {
      CFStringRef v18 = [[SDAutoUnlockAKSSession alloc] initWithLocalLTK:v12 remoteLTK:v13 sessionType:a5 originator:1 deviceID:v10 escrowSecret:v11];
      goto LABEL_20;
    }
    __int16 v19 = auto_unlock_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10012171C();
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v21 = [(SDAutoUnlockAKSManager *)self viewSyncing];
      int v26 = 138414083;
      CFStringRef v22 = @"NO";
      CFStringRef v27 = v10;
      __int16 v28 = 2112;
      if (v21) {
        CFStringRef v23 = @"YES";
      }
      else {
        CFStringRef v23 = @"NO";
      }
      CFStringRef v29 = v23;
      if (v12) {
        CFStringRef v24 = @"YES";
      }
      else {
        CFStringRef v24 = @"NO";
      }
      __int16 v30 = 2112;
      if (v13) {
        CFStringRef v25 = @"YES";
      }
      else {
        CFStringRef v25 = @"NO";
      }
      CFStringRef v31 = v24;
      __int16 v32 = 2113;
      if (v8) {
        CFStringRef v22 = @"YES";
      }
      CFStringRef v33 = v12;
      __int16 v34 = 2112;
      CFStringRef v35 = v25;
      __int16 v36 = 2113;
      int v37 = v13;
      __int16 v38 = 2112;
      CFStringRef v39 = @"YES";
      __int16 v40 = 2112;
      CFStringRef v41 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "AKS session missing keys (device: %@, syncing %@, local exists %@, local LTK: %{private}@, remote exists %@, remote LTK: %{private}@, originator: %@, attested: %@)", (uint8_t *)&v26, 0x52u);
    }
  }
  CFStringRef v18 = 0;
LABEL_20:

  return v18;
}

- (id)aksAuthorizationSessionForDeviceID:(id)a3 originator:(BOOL)a4 sessionType:(int64_t)a5
{
  return [(SDAutoUnlockAKSManager *)self aksAuthorizationSessionForDeviceID:a3 attestation:0 originator:a4 externalACMContext:0 sessionType:a5];
}

- (id)aksAuthorizationSessionForDeviceID:(id)a3 attestation:(BOOL)a4 originator:(BOOL)a5 externalACMContext:(id)a6 sessionType:(int64_t)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  if (a4) {
    [(SDAutoUnlockAKSManager *)self localAttestedLTK];
  }
  else {
  CFStringRef v14 = [(SDAutoUnlockAKSManager *)self localLTK];
  }
  uint64_t v15 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v12];
  CFStringRef v16 = 0;
  if (!v15 || !v14) {
    goto LABEL_24;
  }
  if (!v9)
  {
    CFStringRef v16 = [[SDAutoUnlockAKSSession alloc] initWithLocalLTK:v14 remoteLTK:v15 sessionType:a7 originator:0 deviceID:v12 externalACMContext:v13];
    goto LABEL_24;
  }
  if (a7 != 3)
  {
    CFStringRef v17 = 0;
LABEL_20:
    CFStringRef v22 = [SDAutoUnlockAKSSession alloc];
    if (v13) {
      CFStringRef v23 = [(SDAutoUnlockAKSSession *)v22 initWithLocalLTK:v14 remoteLTK:v15 sessionType:a7 originator:1 deviceID:v12 externalACMContext:v13];
    }
    else {
      CFStringRef v23 = [(SDAutoUnlockAKSSession *)v22 initWithLocalLTK:v14 remoteLTK:v15 sessionType:a7 originator:1 deviceID:v12 escrowSecret:v17];
    }
    CFStringRef v16 = v23;

    goto LABEL_24;
  }
  CFStringRef v17 = [(SDAutoUnlockAKSManager *)self escrowSecretForDevice:v12];
  CFStringRef v18 = auto_unlock_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v19 = @"YES";
    if (!v17) {
      CFStringRef v19 = @"NO";
    }
    int v25 = 138412546;
    CFStringRef v26 = v19;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Escrow secret for authorization (exists: %@, device ID: %@)", (uint8_t *)&v25, 0x16u);
  }

  uint64_t v20 = auto_unlock_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100121750();
  }

  if (v17) {
    goto LABEL_20;
  }
  unsigned int v21 = auto_unlock_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1001217B8();
  }

  CFStringRef v16 = 0;
LABEL_24:

  return v16;
}

- (BOOL)canCreateTokenSessionForDeviceID:(id)a3
{
  unsigned __int8 v3 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:a3];
  BOOL v4 = v3;
  if (v3) {
    BOOL v5 = sub_10001D4C4(v3) == 3;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)encryptMessageData:(id)a3 deviceID:(id)a4 encryptedMessage:(id *)a5 authTag:(id *)a6 nonce:(id *)a7
{
  id v12 = a4;
  int v40 = 0;
  uint64_t v39 = 0;
  id v13 = [a3 mutableCopy];
  v38[0] = 0;
  v38[1] = 0;
  if (a5 && a6 && a7)
  {
    CFStringRef v14 = [(SDAutoUnlockAKSManager *)self sessionKeyForDeviceID:v12];
    if (v14)
    {
      uint64_t v15 = RandomBytes();
      if (v15)
      {
        uint64_t v16 = v15;
        CFStringRef v17 = auto_unlock_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1001218C4(v16, v17, v18, v19, v20, v21, v22, v23);
        }
      }
      else
      {
        CFStringRef v14 = v14;
        [v14 bytes];
        [v14 length];
        id v24 = v13;
        [v24 mutableBytes];
        id v25 = [v24 length];
        id v26 = v24;
        id v37 = [v26 mutableBytes];
        uint64_t v27 = CryptoAEADEncryptMessageOneShot();
        if (!v27)
        {
          *a5 = v26;
          +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v38, 16, v25, v37, v38, 16);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
          *a7 = +[NSData dataWithBytes:&v39 length:12];
          BOOL v35 = 1;
          goto LABEL_17;
        }
        uint64_t v28 = v27;
        CFStringRef v17 = auto_unlock_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100121854(v28, v17, v29, v30, v31, v32, v33, v34);
        }
      }
    }
    else
    {
      CFStringRef v17 = auto_unlock_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1001217EC();
      }
    }
  }
  else
  {
    CFStringRef v14 = auto_unlock_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100121934();
    }
  }
  BOOL v35 = 0;
LABEL_17:

  return v35;
}

- (id)decryptMessage:(id)a3 authTag:(id)a4 nonce:(id)a5 bluetoothID:(id)a6 cachedDevices:(BOOL)a7 errorCode:(int64_t *)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v61 = objc_opt_new();
  CFStringRef v17 = +[SDAutoUnlockTransport sharedTransport];
  uint64_t v18 = v17;
  BOOL v56 = v9;
  if (v9)
  {
    uint64_t v19 = [v17 cachedIDSDeviceIDsForBluetoothID:v16];

    uint64_t v20 = auto_unlock_log();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "Decrypting with cached device IDs";
  }
  else
  {
    uint64_t v19 = [v17 idsDeviceIDsForBluetoothID:v16];

    uint64_t v20 = auto_unlock_log();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "Decrypting without cached device IDs";
  }
  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
LABEL_7:

  if ((unint64_t)[v19 count] >= 2)
  {
    os_unfair_lock_lock(&self->_cachedSessionKeysLock);
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_100116168;
    v69[3] = &unk_1008CDA28;
    v69[4] = self;
    uint64_t v22 = [v19 sortedArrayUsingComparator:v69];

    os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
    uint64_t v19 = (void *)v22;
  }
  uint64_t v23 = auto_unlock_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v71 = v19;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Attempting to decrypt message with sorted device IDs %@", buf, 0xCu);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v19;
  id v63 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v63)
  {
    CFStringRef v54 = a8;
    id v55 = v16;
    uint64_t v24 = 0;
    uint64_t v62 = *(void *)v66;
    id v59 = v15;
    id v60 = v13;
    while (2)
    {
      for (i = 0; i != v63; i = (char *)i + 1)
      {
        if (*(void *)v66 != v62) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v27 = -[SDAutoUnlockAKSManager sessionKeyForDeviceID:](self, "sessionKeyForDeviceID:", v26, v50, v51, v52, v53);
        if (v27)
        {
          uint64_t v57 = v24;
          [v61 addObject:v26];
          id v28 = [objc_alloc((Class)NSMutableData) initWithLength:[v13 length]];
          id v29 = v27;
          [v29 bytes];
          [v29 length];
          id v30 = v15;
          [v30 bytes];
          [v30 length];
          id v31 = v13;
          [v31 bytes];
          id v32 = [v31 length];
          id v33 = v28;
          id v34 = [v33 mutableBytes];
          id v35 = v14;
          id v52 = [v35 bytes];
          id v53 = [v35 length];
          id v50 = v32;
          id v51 = v34;
          int v36 = CryptoAEADDecryptMessageOneShot();
          id v37 = auto_unlock_log();
          __int16 v38 = v37;
          if (!v36)
          {
            uint64_t v24 = v57;
            int v40 = v33;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              id v41 = [v33 length:v50, v51, v52, v53];
              *(_DWORD *)buf = 138412546;
              long long v71 = v26;
              __int16 v72 = 2048;
              id v73 = v41;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Decrypted message (deviceID: %@, length: %ld)", buf, 0x16u);
            }

            int v39 = 1;
            id v15 = v59;
            id v13 = v60;
            goto LABEL_27;
          }
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            long long v71 = v26;
            __int16 v72 = 2048;
            id v73 = (id)v36;
            _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Error decryption failure (device ID: %@, error %ld)", buf, 0x16u);
          }

          uint64_t v24 = 190;
          id v15 = v59;
          id v13 = v60;
        }
      }
      id v63 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v63) {
        continue;
      }
      break;
    }
    int v39 = 0;
    int v40 = 0;
LABEL_27:
    a8 = v54;
    id v16 = v55;
  }
  else
  {
    int v39 = 0;
    uint64_t v24 = 0;
    int v40 = 0;
  }

  CFStringRef v42 = auto_unlock_log();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v71 = v61;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Devices with session keys: %@", buf, 0xCu);
  }

  if ((v39 | !v56))
  {
    if ([obj count])
    {
      int64_t v43 = 191;
      if (v39) {
        int64_t v43 = v24;
      }
      if (!a8) {
        goto LABEL_37;
      }
    }
    else
    {
      __int16 v49 = auto_unlock_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_1001219A8(v16, v49);
      }

      int64_t v43 = 198;
      if (!a8) {
        goto LABEL_37;
      }
    }
    *a8 = v43;
LABEL_37:
    id v44 = v40;
    goto LABEL_41;
  }
  __int16 v45 = auto_unlock_log();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Failed to find key with cached devices, trying without cache", buf, 2u);
  }

  CFStringRef v46 = +[SDAutoUnlockTransport sharedTransport];
  [v46 logBluetoothIDCache];

  id v44 = [(SDAutoUnlockAKSManager *)self decryptMessage:v13 authTag:v14 nonce:v15 bluetoothID:v16 cachedDevices:0 errorCode:a8];
LABEL_41:
  __int16 v47 = v44;

  return v47;
}

- (void)addDeviceIDMissingSessionKey:(id)a3
{
  id v12 = a3;
  BOOL v4 = +[NSUserDefaults standardUserDefaults];
  BOOL v5 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];

  if (!v5) {
    id v6 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];
  }
  BOOL v7 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];
  unsigned __int8 v8 = [v7 containsObject:v12];

  if ((v8 & 1) == 0)
  {
    BOOL v9 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];
    [v9 addObject:v12];

    BOOL v10 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];
    [v4 setObject:v10 forKey:@"AutoUnlockDevicesMissingSessionKey"];

    [v4 synchronize];
    id v11 = +[SDAutoUnlockTransport sharedTransport];
    [v11 refreshAutoUnlockDeviceCache];
  }
}

- (void)removeDeviceIDMissingSessionKey:(id)a3
{
  id v4 = a3;
  id v10 = +[NSUserDefaults standardUserDefaults];
  BOOL v5 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];

  if (!v5) {
    id v6 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];
  }
  BOOL v7 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];
  [v7 removeObject:v4];

  unsigned __int8 v8 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];
  [v10 setObject:v8 forKey:@"AutoUnlockDevicesMissingSessionKey"];

  [v10 synchronize];
  BOOL v9 = +[SDAutoUnlockTransport sharedTransport];
  [v9 refreshAutoUnlockDeviceCache];
}

- (void)clearAllDeviceIDsMissingSessionKeys
{
  id v8 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];

  if (!v3) {
    id v4 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];
  }
  BOOL v5 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];
  [v5 removeAllObjects];

  id v6 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];
  [v8 setObject:v6 forKey:@"AutoUnlockDevicesMissingSessionKey"];

  [v8 synchronize];
  BOOL v7 = +[SDAutoUnlockTransport sharedTransport];
  [v7 refreshAutoUnlockDeviceCache];
}

- (id)deviceIDsMissingSessionKey
{
  unsigned __int8 v3 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];

  if (!v3)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    BOOL v5 = [v4 arrayForKey:@"AutoUnlockDevicesMissingSessionKey"];
    id v6 = [v5 mutableCopy];
    [(SDAutoUnlockAKSManager *)self setWatchIDsMissingSessionKey:v6];

    BOOL v7 = [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];

    if (!v7)
    {
      id v8 = objc_opt_new();
      [(SDAutoUnlockAKSManager *)self setWatchIDsMissingSessionKey:v8];
    }
  }

  return [(SDAutoUnlockAKSManager *)self watchIDsMissingSessionKey];
}

- (BOOL)loadLocalLTK
{
  if (SFDeviceClassCodeGet() == 7 || SFDeviceIsRealityDevice())
  {
    unsigned __int8 v3 = +[SDStatusMonitor sharedMonitor];
    unsigned int v4 = [v3 deviceWasUnlockedOnce];
  }
  else
  {
    unsigned int v4 = 1;
  }
  BOOL v5 = [(SDAutoUnlockAKSManager *)self localLTK];

  if (v5)
  {
    id v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      BOOL v7 = "Local LTK Exists";
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v34, 2u);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (!v4)
  {
    id v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      BOOL v7 = "Waiting for first unlock to load local LTK";
      goto LABEL_31;
    }
LABEL_32:
    BOOL v32 = 0;
    goto LABEL_33;
  }
  id v8 = [(SDAutoUnlockAKSManager *)self localDeviceID];

  if (!v8)
  {
    id v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100121A34(self, v6);
    }
    goto LABEL_32;
  }
  BOOL v9 = [(SDAutoUnlockAKSManager *)self localDeviceID];
  id v6 = [(SDAutoUnlockAKSManager *)self ltkInfoForDeviceID:v9 modern:1];

  id v10 = [v6 ltk];
  [(SDAutoUnlockAKSManager *)self setLocalLTK:v10];

  id v11 = [(SDAutoUnlockAKSManager *)self localLTK];

  if (!v11)
  {
    id v12 = [(SDAutoUnlockAKSManager *)self localDeviceID];
    id v13 = [(SDAutoUnlockAKSManager *)self ltkInfoForDeviceID:v12 modern:0];

    if (v13)
    {
      id v14 = auto_unlock_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Adding existing LTK to new syncing view", (uint8_t *)&v34, 2u);
      }

      id v15 = [(SDAutoUnlockAKSManager *)self localDeviceID];
      id v16 = +[SDStatusMonitor sharedMonitor];
      CFStringRef v17 = [v16 computerName];
      [(SDAutoUnlockAKSManager *)self storeLongTermKey:v13 forDeviceID:v15 name:v17];

      uint64_t v18 = [v13 ltk];
      [(SDAutoUnlockAKSManager *)self setLocalLTK:v18];

      uint64_t v19 = v13;
      id v6 = v19;
    }
  }
  uint64_t v20 = [(SDAutoUnlockAKSManager *)self localLTK];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    unsigned int v22 = [v6 version];

    if (v22 <= 1)
    {
      uint64_t v23 = auto_unlock_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Updating version for local LTK", (uint8_t *)&v34, 2u);
      }

      [v6 setVersion:2];
      uint64_t v24 = [(SDAutoUnlockAKSManager *)self localDeviceID];
      id v25 = +[SDStatusMonitor sharedMonitor];
      id v26 = [v25 computerName];
      [(SDAutoUnlockAKSManager *)self storeLongTermKey:v6 forDeviceID:v24 name:v26];
    }
  }
  uint64_t v27 = [(SDAutoUnlockAKSManager *)self localLTK];

  if (!v27) {
    [(SDAutoUnlockAKSManager *)self generateLocalLTKWithAttestation:0];
  }
  id v28 = auto_unlock_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = [(SDAutoUnlockAKSManager *)self localLTK];
    if (v29) {
      CFStringRef v30 = @"YES";
    }
    else {
      CFStringRef v30 = @"NO";
    }
    id v31 = [(SDAutoUnlockAKSManager *)self localLTK];
    int v34 = 138412547;
    CFStringRef v35 = v30;
    __int16 v36 = 2113;
    id v37 = v31;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Loaded local LTK: (%@), %{private}@", (uint8_t *)&v34, 0x16u);
  }
  BOOL v32 = 1;
LABEL_33:

  return v32;
}

- (BOOL)loadLocalAttestedLTKIfNecessary
{
  unsigned __int8 v3 = [(SDAutoUnlockAKSManager *)self localAttestedLTK];

  if (v3)
  {
    unsigned int v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Local attested LTK Exists", buf, 2u);
    }
LABEL_31:
    BOOL v9 = 0;
    goto LABEL_32;
  }
  BOOL v5 = [(SDAutoUnlockAKSManager *)self localDeviceID];

  if (!v5)
  {
    unsigned int v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100121AC0(self, v4);
    }
    goto LABEL_31;
  }
  id v6 = [(SDAutoUnlockAKSManager *)self localDeviceID];
  unsigned int v4 = [(SDAutoUnlockAKSManager *)self ltkInfoForDeviceID:v6 modern:1 attested:1];

  BOOL v7 = [v4 ltk];
  [(SDAutoUnlockAKSManager *)self setLocalAttestedLTK:v7];

  id v8 = [(SDAutoUnlockAKSManager *)self localAttestedLTK];

  BOOL v9 = v8 != 0;
  id v10 = auto_unlock_log();
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(SDAutoUnlockAKSManager *)self localAttestedLTK];
      if (v12) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      id v14 = [(SDAutoUnlockAKSManager *)self localAttestedLTK];
      *(_DWORD *)buf = 138412547;
      CFStringRef v35 = v13;
      __int16 v36 = 2113;
      id v37 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Loaded local attested LTK: (%@), %{private}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100121B4C(self, v11);
    }

    if (SFDeviceClassCodeGet() != 5) {
      goto LABEL_31;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = +[SDAutoUnlockTransport sharedTransport];
    id v16 = [v15 idsDevicesIDs];
    id v11 = [v16 allObjects];

    id v17 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v30;
LABEL_19:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v11);
        }
        uint64_t v21 = *(void **)(*((void *)&v29 + 1) + 8 * v20);
        unsigned int v22 = +[SDAutoUnlockTransport sharedTransport];
        id v23 = [v22 deviceTypeForDeviceID:v21];

        if (v23 == (id)2)
        {
          [(SDAutoUnlockAKSManager *)self loadRemoteLTKsIfNeeded];
          if ([(SDAutoUnlockAKSManager *)self deviceEnabledAsKeyForIDSDeviceID:v21])
          {
            break;
          }
        }
        if (v18 == (id)++v20)
        {
          id v18 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v18) {
            goto LABEL_19;
          }
          goto LABEL_11;
        }
      }
      uint64_t v24 = v21;

      if (!v24) {
        goto LABEL_31;
      }
      id v25 = auto_unlock_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v35 = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Found Enabled iPhone for MacUnlockPhone: %@", buf, 0xCu);
      }

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100116E6C;
      v27[3] = &unk_1008CDA50;
      v27[4] = self;
      id v28 = v24;
      id v11 = v24;
      [(SDAutoUnlockAKSManager *)self generateLocalAttestedLTKIfNeccessaryWithCompletion:v27];
    }
  }
LABEL_11:

LABEL_32:
  return v9;
}

- (void)generateLocalLTKWithAttestation:(BOOL)a3
{
}

- (void)generateLocalLTKWithAttestation:(BOOL)a3 forceDCRTRetrievalWithCompletion:(id)a4
{
  id v6 = a4;
  BOOL v7 = sharing_persistent_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Generating local LTK", buf, 2u);
  }

  id v8 = +[SDStatusMonitor sharedMonitor];
  unsigned int v9 = [v8 runningAsSetupUser];
  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    id v11 = [(SDAutoUnlockAKSManager *)self localDeviceID];
    BOOL v10 = v11 != 0;
  }
  if (SFDeviceClassCodeGet() == 7 || SFDeviceIsRealityDevice())
  {
    if (!v10
      || ([v8 deviceKeyBagUnlocked] & 1) == 0
      && ([v8 deviceKeyBagDisabled] & 1) == 0)
    {
      goto LABEL_11;
    }
LABEL_18:
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001172F0;
    v25[3] = &unk_1008CB6B0;
    v25[4] = self;
    BOOL v28 = a3;
    id v26 = v8;
    id v19 = v6;
    id v27 = v19;
    uint64_t v20 = objc_retainBlock(v25);
    uint64_t v21 = v20;
    if (v19)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1001175C8;
      v22[3] = &unk_1008CDA78;
      v22[4] = self;
      id v23 = v20;
      id v24 = v19;
      sub_10001E16C(v22);
    }
    else
    {
      ((void (*)(void *))v20[2])(v20);
    }

    goto LABEL_22;
  }
  if (v10) {
    goto LABEL_18;
  }
LABEL_11:
  id v12 = auto_unlock_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = [(SDAutoUnlockAKSManager *)self localDeviceID];
    unsigned int v14 = [v8 deviceKeyBagState];
    CFStringRef v15 = @"NO";
    *(_DWORD *)buf = 138412802;
    long long v32 = v13;
    if (v9) {
      CFStringRef v15 = @"YES";
    }
    __int16 v33 = 1024;
    unsigned int v34 = v14;
    __int16 v35 = 2112;
    CFStringRef v36 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to generate LTK (local device ID: %@, keybag state: %d, setup user: %@)", buf, 0x1Cu);
  }
  if (v6)
  {
    uint64_t v16 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    CFStringRef v30 = @"Unable to generate LTK";
    id v17 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v18 = +[NSError errorWithDomain:v16 code:149 userInfo:v17];

    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v18);
  }
LABEL_22:
}

- (BOOL)isMobileActivationErrorNetworkError:(id)a3
{
  return 0;
}

- (void)checkLocalLTK
{
  unsigned __int8 v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 deviceKeyBagUnlocked];

  if (v4)
  {
    BOOL v5 = [(SDAutoUnlockAKSManager *)self localDeviceID];

    if (v5)
    {
      id v6 = [(SDAutoUnlockAKSManager *)self localDeviceID];
      BOOL v7 = [(SDAutoUnlockAKSManager *)self ltkInfoForDeviceID:v6 modern:0];

      id v8 = [(SDAutoUnlockAKSManager *)self localDeviceID];
      unsigned int v9 = [(SDAutoUnlockAKSManager *)self ltkInfoForDeviceID:v8 modern:1];

      uint64_t v10 = [v7 ltk];
      uint64_t v11 = [v9 ltk];
      id v12 = auto_unlock_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Checking Local LTKs", v38, 2u);
      }

      if (!(v10 | v11))
      {
        unsigned int v14 = auto_unlock_log();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
LABEL_18:

LABEL_19:
          -[SDAutoUnlockAKSManager generateLocalLTKWithAttestation:](self, "generateLocalLTKWithAttestation:", 0, *(void *)v38);
LABEL_20:
          id v17 = 0;
LABEL_21:

          goto LABEL_22;
        }
        *(_WORD *)__int16 v38 = 0;
        id v18 = "Both LTKs missing, generating new LTK";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v18, v38, 2u);
        goto LABEL_18;
      }
      if (v10 && !v11)
      {
        int v13 = sub_10001D204((void *)v10, [(SDAutoUnlockAKSManager *)self ltkKeyClassWithAttestation:0], [(SDAutoUnlockAKSManager *)self t208Machine]);
        unsigned int v14 = auto_unlock_log();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_WORD *)__int16 v38 = 0;
            uint64_t v16 = "Modern LTK is missing: Storing legacy LTK";
LABEL_44:
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, v38, 2u);
            goto LABEL_45;
          }
          goto LABEL_45;
        }
        if (!v15) {
          goto LABEL_18;
        }
        *(_WORD *)__int16 v38 = 0;
        id v18 = "Modern LTK is missing: Legacy LTK is invalid, regenerating";
        goto LABEL_17;
      }
      if (v10 || !v11)
      {
        unsigned int v23 = [(id)v10 isEqualToData:v11];
        uint64_t v24 = [(SDAutoUnlockAKSManager *)self ltkKeyClassWithAttestation:0];
        int v25 = [(SDAutoUnlockAKSManager *)self t208Machine];
        if (v23)
        {
          int v26 = sub_10001D204((void *)v11, v24, v25);
          id v27 = auto_unlock_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v28 = @"NO";
            if (v26) {
              CFStringRef v28 = @"YES";
            }
            *(_DWORD *)__int16 v38 = 138412290;
            *(void *)&v38[4] = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "LTKs match (valid: %@)", v38, 0xCu);
          }

          if (v26) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }
        if (sub_10001D204((void *)v10, v24, v25))
        {
          unsigned int v14 = auto_unlock_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int16 v38 = 0;
            uint64_t v16 = "LTK Mismatch: Legacy LTK is valid, overwriting modern LTK";
            goto LABEL_44;
          }
LABEL_45:
          unsigned int v22 = v7;
          goto LABEL_46;
        }
        int v36 = sub_10001D204((void *)v11, [(SDAutoUnlockAKSManager *)self ltkKeyClassWithAttestation:0], [(SDAutoUnlockAKSManager *)self t208Machine]);
        unsigned int v14 = auto_unlock_log();
        BOOL v37 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (!v36)
        {
          if (!v37) {
            goto LABEL_18;
          }
          *(_WORD *)__int16 v38 = 0;
          id v18 = "LTK Mismatch: Modern LTK is invalid, regenerating";
          goto LABEL_17;
        }
        if (v37)
        {
          *(_WORD *)__int16 v38 = 0;
          uint64_t v21 = "LTK Mismatch: Modern LTK is valid, overwriting legacy LTK";
          goto LABEL_28;
        }
      }
      else
      {
        int v19 = sub_10001D204((void *)v11, [(SDAutoUnlockAKSManager *)self ltkKeyClassWithAttestation:0], [(SDAutoUnlockAKSManager *)self t208Machine]);
        unsigned int v14 = auto_unlock_log();
        BOOL v20 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (!v19)
        {
          if (!v20) {
            goto LABEL_18;
          }
          *(_WORD *)__int16 v38 = 0;
          id v18 = "Legacy LTK is missing: Modern LTK is invalid, regenerating";
          goto LABEL_17;
        }
        if (v20)
        {
          *(_WORD *)__int16 v38 = 0;
          uint64_t v21 = "Legacy LTK is missing: Storing modern LTK";
LABEL_28:
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v21, v38, 2u);
        }
      }
      unsigned int v22 = v9;
LABEL_46:

      id v17 = v22;
      if (v17)
      {
        NSErrorUserInfoKey v29 = [(SDAutoUnlockAKSManager *)self localDeviceID];
        CFStringRef v30 = +[SDStatusMonitor sharedMonitor];
        long long v31 = [v30 computerName];
        unsigned int v32 = [(SDAutoUnlockAKSManager *)self storeLongTermKey:v17 forDeviceID:v29 name:v31];

        if (v32)
        {
          __int16 v33 = auto_unlock_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v34 = [(SDAutoUnlockAKSManager *)self localDeviceID];
            *(_DWORD *)__int16 v38 = 138412546;
            *(void *)&v38[4] = v34;
            __int16 v39 = 2112;
            CFStringRef v40 = @"YES";
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Saved Local LTK after validation check (device ID: %@, saved: %@)", v38, 0x16u);
          }
          __int16 v35 = [v17 ltk];
          [(SDAutoUnlockAKSManager *)self setLocalLTK:v35];
        }
      }
      goto LABEL_21;
    }
    id v17 = auto_unlock_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100121BD8();
    }
  }
  else
  {
    id v17 = auto_unlock_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Device locked, not checking local LTK", v38, 2u);
    }
  }
LABEL_22:
}

- (void)checkLocalAttestedLTK
{
  unsigned __int8 v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 deviceKeyBagUnlocked];

  if (v4)
  {
    BOOL v5 = [(SDAutoUnlockAKSManager *)self localDeviceID];

    if (v5)
    {
      id v6 = [(SDAutoUnlockAKSManager *)self localDeviceID];
      BOOL v7 = [(SDAutoUnlockAKSManager *)self ltkInfoForDeviceID:v6 modern:0 attested:1];

      id v8 = [v7 ltk];
      if (v8)
      {
        if (sub_10001D204(v8, [(SDAutoUnlockAKSManager *)self ltkKeyClassWithAttestation:1], [(SDAutoUnlockAKSManager *)self t208Machine]))
        {
LABEL_15:

          goto LABEL_16;
        }
        unsigned int v9 = auto_unlock_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "LTK Mismatch: Attested LTK is invalid, deleting", buf, 2u);
        }

        [(SDAutoUnlockAKSManager *)self setLocalAttestedLTK:0];
        [(SDAutoUnlockAKSManager *)self deleteLocalAttestedLTK];
        [(SDAutoUnlockAKSManager *)self disablePairingForAllKeyDevices];
        [(SDAutoUnlockAKSManager *)self clearRemoteLTKs];
        uint64_t v10 = +[NSNotificationCenter defaultCenter];
        [v10 postNotificationName:@"SDAutoUnlockAKSManagerUnexpectedDisablementNotification" object:0];
      }
      else
      {
        uint64_t v10 = auto_unlock_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Local attested LTK missing", v13, 2u);
        }
      }

      goto LABEL_15;
    }
    BOOL v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100121BD8();
    }
  }
  else
  {
    BOOL v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device locked, not checking local LTK", v11, 2u);
    }
  }
LABEL_16:
}

- (id)ltkHashForLocalLTK
{
  unsigned __int8 v3 = [(SDAutoUnlockAKSManager *)self localLTK];

  if (v3)
  {
    unsigned int v4 = [(SDAutoUnlockAKSManager *)self localLTK];
    BOOL v5 = sub_1001B23AC(v4);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)updateLocalLTKForSignout
{
  unsigned __int8 v3 = sharing_persistent_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating local ltk for sign out", v9, 2u);
  }

  unsigned int v4 = [(SDAutoUnlockAKSManager *)self localDeviceID];
  BOOL v5 = [(SDAutoUnlockAKSManager *)self ltkInfoForDeviceID:v4];

  [v5 setSignout:1];
  id v6 = [(SDAutoUnlockAKSManager *)self localDeviceID];
  BOOL v7 = +[SDStatusMonitor sharedMonitor];
  id v8 = [v7 computerName];
  [(SDAutoUnlockAKSManager *)self storeLongTermKey:v5 forDeviceID:v6 name:v8];
}

- (int64_t)ltkKeyClassWithAttestation:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = SFDeviceClassCodeGet();
  if (v4 == 7)
  {
    BOOL v5 = auto_unlock_log();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      int64_t v8 = 1;
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    id v6 = "Using key class A for watch";
    BOOL v7 = buf;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    goto LABEL_5;
  }
  int v9 = v4;
  if (!SFDeviceIsRealityDevice())
  {
    BOOL v5 = auto_unlock_log();
    BOOL v10 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v9 == 5)
    {
      if (v3)
      {
        if (!v10) {
          goto LABEL_5;
        }
        __int16 v16 = 0;
        id v6 = "Using key class A for mac";
        BOOL v7 = (uint8_t *)&v16;
        goto LABEL_4;
      }
      if (v10)
      {
        *(_WORD *)BOOL v15 = 0;
        uint64_t v11 = "Using key class C for mac";
        int64_t v8 = 2;
        id v12 = v15;
        goto LABEL_18;
      }
    }
    else if (v10)
    {
      __int16 v14 = 0;
      uint64_t v11 = "Using key class C";
      int64_t v8 = 2;
      id v12 = (uint8_t *)&v14;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
      goto LABEL_20;
    }
    int64_t v8 = 2;
    goto LABEL_20;
  }
  BOOL v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Using key class D", v17, 2u);
  }
  int64_t v8 = 3;
LABEL_20:

  return v8;
}

- (int64_t)keyClassForDeviceID:(id)a3
{
  id v3 = a3;
  int v4 = +[SDAutoUnlockTransport sharedTransport];
  BOOL v5 = [v4 idsDeviceForUniqueID:v3];

  int v6 = SFDeviceClassCodeGet();
  if (v5)
  {
    int v7 = v6;
    int64_t v8 = +[SDAutoUnlockTransport sharedTransport];
    int64_t v9 = (int64_t)[v8 deviceTypeForDevice:v5];

    switch(v9)
    {
      case 2:
        break;
      case 3:
      case 5:
        int64_t v9 = 3;
        break;
      case 4:
        if (v7 == 1) {
          int64_t v9 = 1;
        }
        else {
          int64_t v9 = 2;
        }
        break;
      default:
        int64_t v9 = 1;
        break;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)deviceIsLocalDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SDAutoUnlockAKSManager *)self localDeviceID];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (int)ltkSyncStatusForDeviceID:(id)a3 hash:(id)a4 modern:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  int64_t v9 = [(SDAutoUnlockAKSManager *)self remoteLTKEntryForDeviceID:a3];
  BOOL v10 = v9;
  if (v5) {
    CFStringRef v11 = @"Modern LTK Data";
  }
  else {
    CFStringRef v11 = @"LTK Data";
  }
  if (v5) {
    CFStringRef v12 = @"Modern LTK Hash";
  }
  else {
    CFStringRef v12 = @"LTK Hash";
  }
  int v13 = [v9 objectForKeyedSubscript:v11];

  __int16 v14 = [v10 objectForKeyedSubscript:v12];
  unsigned __int8 v15 = [v8 isEqualToData:v14];

  if (v13 && (v15 & 1) != 0)
  {
    int v16 = 3;
  }
  else if (v8 && v13 && v14)
  {
    int v16 = 2;
  }
  else
  {
    char v17 = v15 ^ 1;
    if (v8) {
      BOOL v18 = v14 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    BOOL v19 = !v18 || v13 == 0;
    int v16 = !v19;
    if (!v19) {
      char v17 = 1;
    }
    if ((v17 & 1) == 0)
    {
      BOOL v20 = auto_unlock_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_100121C0C();
      }

      int v16 = 0;
    }
  }

  return v16;
}

- (void)generateLocalAttestedLTKIfNeccessaryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"forcelocalAttestedLTKRegeneration"];
  int v7 = [(SDAutoUnlockAKSManager *)self localAttestedLTK];

  id v8 = auto_unlock_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7 || (v6 & 1) != 0)
  {
    if (v9)
    {
      CFStringRef v11 = @"NO";
      if (v6) {
        CFStringRef v11 = @"YES";
      }
      int v12 = 138412290;
      CFStringRef v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Generating cached local attested LTK (forcedRegeneration: %@)", (uint8_t *)&v12, 0xCu);
    }

    [(SDAutoUnlockAKSManager *)self generateLocalLTKWithAttestation:1 forceDCRTRetrievalWithCompletion:v4];
  }
  else
  {
    if (v9)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Returning cached local attested LTK", (uint8_t *)&v12, 2u);
    }

    uint64_t v10 = [(SDAutoUnlockAKSManager *)self localAttestedLTK];
    v4[2](v4, v10, 0);

    id v4 = (void (**)(id, uint64_t, void))v10;
  }
}

- (void)updateLTKsForDeviceID:(id)a3 staleRemoteLTK:(BOOL)a4
{
  BOOL v5 = +[SDStatusMonitor sharedMonitor];
  unsigned int v6 = [v5 deviceSupportsRanging];

  if (v6)
  {
    int v7 = +[SDStatusMonitor sharedMonitor];
    unsigned int v8 = [v7 deviceWasUnlockedOnce];

    if (v8)
    {
      [(SDAutoUnlockAKSManager *)self loadRemoteLTKsIfNeeded];
    }
    else
    {
      BOOL v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not updating remote LTKs because device not first unlocked", v10, 2u);
      }
    }
  }
}

- (void)updateRemoteLTKs
{
}

- (void)checkRemoteLTKForDeviceID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SDAutoUnlockAKSManager *)self longTermKeyForDevice:v4 modern:0];
  unsigned int v6 = [(SDAutoUnlockAKSManager *)self longTermKeyForDevice:v4 modern:1];
  int v7 = [(SDAutoUnlockAKSManager *)self remoteLTKHashForDeviceID:v4 modern:0];
  unsigned int v8 = sub_1001B23AC(v5);
  BOOL v9 = v8;
  if (v8 && ([v8 isEqualToData:v7] & 1) == 0)
  {
    int v12 = auto_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Remote LTK needs resigning for pairing for hash", v13, 2u);
    }

    [(SDAutoUnlockAKSManager *)self signLTK:v5 modernLTK:v6 forDeviceID:v4];
  }
  else
  {
    uint64_t v10 = [(SDAutoUnlockAKSManager *)self remoteLTKHashForDeviceID:v4 modern:1];

    CFStringRef v11 = sub_1001B23AC(v6);

    if (v11)
    {
      if (([v11 isEqualToData:v10] & 1) == 0) {
        [(SDAutoUnlockAKSManager *)self signLTK:v5 modernLTK:v6 forDeviceID:v4];
      }
      int v7 = (void *)v10;
      BOOL v9 = v11;
    }
    else
    {
      BOOL v9 = 0;
      int v7 = (void *)v10;
    }
  }
}

- (void)checkPhoneRemoteLTKs
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = +[SDAutoUnlockTransport sharedTransport];
  id v4 = [v3 idsDevicesIDs];
  BOOL v5 = [v4 allObjects];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        CFStringRef v11 = +[SDAutoUnlockTransport sharedTransport];
        id v12 = [v11 deviceTypeForDeviceID:v10];

        if (v12 == (id)2
          && [(SDAutoUnlockAKSManager *)self deviceEnabledAsKeyForIDSDeviceID:v10])
        {
          [(SDAutoUnlockAKSManager *)self removeCorruptedRemoteLTKIfNecessaryForDeviceID:v10];
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)resignRemoteLTKForDeviceID:(id)a3
{
}

- (BOOL)signLTKsForDeviceID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SDAutoUnlockAKSManager *)self longTermKeyForDevice:v4 modern:0];
  id v6 = [(SDAutoUnlockAKSManager *)self longTermKeyForDevice:v4 modern:1];
  LOBYTE(self) = [(SDAutoUnlockAKSManager *)self signLTK:v5 modernLTK:v6 forDeviceID:v4];

  return (char)self;
}

- (BOOL)signLTK:(id)a3 modernLTK:(id)a4 forDeviceID:(id)a5
{
  return [(SDAutoUnlockAKSManager *)self signLTK:a3 ltkModDate:0 modernLTK:a4 modernLTKModDate:0 deviceID:a5];
}

- (BOOL)signLTK:(id)a3 ltkModDate:(id)a4 modernLTK:(id)a5 modernLTKModDate:(id)a6 deviceID:(id)a7
{
  unint64_t v12 = (unint64_t)a3;
  id v13 = a4;
  unint64_t v14 = (unint64_t)a5;
  id v15 = a6;
  long long v16 = (__CFString *)a7;
  char v17 = [(SDAutoUnlockAKSManager *)self localLTK];
  int64_t v18 = [(SDAutoUnlockAKSManager *)self keyClassForDeviceID:v16];
  if ((v18 | 2) != 2)
  {
    uint64_t v20 = v18;
    uint64_t v21 = auto_unlock_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v22 = @"YES";
      *(_DWORD *)buf = 138412802;
      CFStringRef v35 = v16;
      if (!v12) {
        CFStringRef v22 = @"NO";
      }
      __int16 v36 = 2112;
      CFStringRef v37 = v22;
      __int16 v38 = 1024;
      LODWORD(v39) = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Signing remote LTK (device: %@ LTK: %@, class: %d)", buf, 0x1Cu);
    }

    if (!(v12 | v14) || !v17)
    {
      int v25 = auto_unlock_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v30 = @"NO";
        *(_DWORD *)buf = 138413059;
        if (v12) {
          CFStringRef v31 = @"YES";
        }
        else {
          CFStringRef v31 = @"NO";
        }
        CFStringRef v35 = v31;
        __int16 v36 = 2113;
        CFStringRef v37 = (const __CFString *)v12;
        if (v17) {
          CFStringRef v30 = @"YES";
        }
        __int16 v38 = 2112;
        CFStringRef v39 = v30;
        __int16 v40 = 2113;
        id v41 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Missing signing info (remoteLTK exists %@, remoteLTK %{private}@, localLTK exists %@, localLTK %{private}@)", buf, 0x2Au);
      }
      BOOL v19 = 0;
      goto LABEL_26;
    }
    if (v12)
    {
      uint64_t v23 = sub_10001DEDC((void *)v12, v20, v17, 2);
      if (v23)
      {
        __int16 v33 = v23;
        uint64_t v23 = sub_1001B23AC((void *)v12);
        BOOL v24 = v23 != 0;
        goto LABEL_17;
      }
      __int16 v33 = 0;
    }
    else
    {
      __int16 v33 = 0;
      uint64_t v23 = 0;
    }
    BOOL v24 = 0;
LABEL_17:
    unsigned int v32 = (void *)v23;
    if (v14)
    {
      int v26 = sub_10001DEDC((void *)v14, v20, v17, 2);
      if (v26)
      {
        id v27 = sub_1001B23AC((void *)v14);
        if (v27) {
          goto LABEL_22;
        }
      }
      if (v24)
      {
LABEL_21:
        id v27 = 0;
LABEL_22:
        CFStringRef v28 = v32;
        [(SDAutoUnlockAKSManager *)self addRemoteLTK:v33 ltkHash:v32 ltkModDate:v13 modernLTK:v26 modernLTKHash:v27 modernLTKModeDate:v15 deviceID:v16];

        BOOL v19 = 1;
LABEL_25:

        int v25 = v33;
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      int v26 = 0;
      if (v24) {
        goto LABEL_21;
      }
    }
    BOOL v19 = 0;
    CFStringRef v28 = v32;
    goto LABEL_25;
  }
  BOOL v19 = 0;
LABEL_27:

  return v19;
}

- (id)allKeychainDevices
{
  return [(SDAutoUnlockAKSManager *)self keychainDevices:0];
}

- (id)keychainDevices:(BOOL)a3
{
  BOOL v3 = a3;
  CFTypeRef result = 0;
  BOOL v5 = objc_opt_new();
  if (v3) {
    [(SDAutoUnlockAKSManager *)self baseModernSyncedDictionary];
  }
  else {
  id v6 = [(SDAutoUnlockAKSManager *)self baseSyncedDictionary];
  }
  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
  [v6 setObject:kSecAttrSynchronizableAny forKeyedSubscript:kSecAttrSynchronizable];
  [v6 setObject:kSecMatchLimitAll forKeyedSubscript:kSecMatchLimit];
  if (!SecItemCopyMatching((CFDictionaryRef)v6, &result))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = (id)result;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v12 = [[*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKeyedSubscript:kSecAttrService];
          if (![(SDAutoUnlockAKSManager *)self deviceIsLocalDevice:v12]) {
            [v5 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
  }

  return v5;
}

- (id)modificationDataForDeviceID:(id)a3 modern:(BOOL)a4
{
  id v6 = a3;
  CFTypeRef result = 0;
  if (a4) {
    [(SDAutoUnlockAKSManager *)self modernSyncedDictionaryForDevice:v6];
  }
  else {
  id v7 = [(SDAutoUnlockAKSManager *)self syncedDictionaryForDevice:v6];
  }
  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v7];
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
  OSStatus v9 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (v9 == -25300)
  {
    unint64_t v12 = 0;
  }
  else
  {
    OSStatus v10 = v9;
    if (v9)
    {
      CFStringRef v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        OSStatus v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Query for attributtes status: %d", buf, 8u);
      }
      unint64_t v12 = 0;
    }
    else
    {
      CFStringRef v11 = result;
      unint64_t v12 = [(id)result objectForKeyedSubscript:kSecAttrModificationDate];
    }
  }

  return v12;
}

- (id)modernSignedDevices
{
  BOOL v3 = objc_opt_new();
  id v4 = [(SDAutoUnlockAKSManager *)self remoteLTKList];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100119258;
  v8[3] = &unk_1008CDAA0;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = +[NSSet setWithArray:v5];

  return v6;
}

- (id)signedDevices
{
  BOOL v3 = objc_opt_new();
  id v4 = [(SDAutoUnlockAKSManager *)self remoteLTKList];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001193B4;
  v8[3] = &unk_1008CDAA0;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = +[NSSet setWithArray:v5];

  return v6;
}

- (void)signAndStoreRemoteLTK:(id)a3 forDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v23 = 138412290;
    *(void *)&v23[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked to store remote LTK for %@", v23, 0xCu);
  }

  id v9 = [(SDAutoUnlockAKSManager *)self localAttestedLTK];
  uint64_t v10 = [(SDAutoUnlockAKSManager *)self ltkKeyClassWithAttestation:1];
  uint64_t v11 = [(SDAutoUnlockAKSManager *)self keyClassForDeviceID:v7];
  unint64_t v12 = auto_unlock_log();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v14 = @"YES";
      *(_DWORD *)uint64_t v23 = 138413058;
      *(_WORD *)&v23[12] = 2112;
      *(void *)&v23[4] = v7;
      if (!v6) {
        CFStringRef v14 = @"NO";
      }
      *(void *)&v23[14] = v14;
      __int16 v24 = 1024;
      *(_DWORD *)int v25 = v11;
      *(_WORD *)&v25[4] = 1024;
      *(_DWORD *)&v25[6] = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Signing remote LTK (device: %@ LTK: %@, class: %d) with localLTK (class: %d)", v23, 0x22u);
    }

    if (v6 && v9)
    {
      id v13 = sub_10001DEDC(v6, v11, v9, v10);
      if (v13)
      {
        long long v15 = [(SDAutoUnlockAKSManager *)self remoteLTKList];
        OSStatus v16 = [v15 mutableCopy];

        long long v17 = [v16 objectForKeyedSubscript:v7];

        if (v17)
        {
          int64_t v18 = auto_unlock_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v23 = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Overriding existing LTK", v23, 2u);
          }
        }
        CFStringRef v27 = @"Attested LTK Data";
        CFStringRef v28 = v13;
        BOOL v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1, *(_OWORD *)v23);
        [v16 setObject:v19 forKeyedSubscript:v7];

        uint64_t v20 = [(SDAutoUnlockAKSManager *)self remoteLTKs];
        [v20 setObject:v16 forKeyedSubscript:@"Remote LTKs"];

        [(SDAutoUnlockAKSManager *)self saveRemoteLTKs];
        [(SDAutoUnlockAKSManager *)self updatePreferredRemoteLTKForDeviceID:v7];
      }
      else
      {
        OSStatus v16 = auto_unlock_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100121CB4();
        }
      }
    }
    else
    {
      id v13 = auto_unlock_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v21 = @"NO";
        *(_DWORD *)uint64_t v23 = 138413059;
        if (v6) {
          CFStringRef v22 = @"YES";
        }
        else {
          CFStringRef v22 = @"NO";
        }
        *(void *)&v23[4] = v22;
        *(_WORD *)&v23[12] = 2113;
        *(void *)&v23[14] = v6;
        if (v9) {
          CFStringRef v21 = @"YES";
        }
        __int16 v24 = 2112;
        *(void *)int v25 = v21;
        *(_WORD *)&v25[8] = 2113;
        int v26 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Missing signing info (remoteLTK exists %@, remoteLTK %{private}@, localLTK exists %@, localLTK %{private}@)", v23, 0x2Au);
      }
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_100121C4C();
  }
}

- (id)allRemoteLTKData
{
  BOOL v3 = objc_opt_new();
  id v4 = [(SDAutoUnlockAKSManager *)self remoteLTKList];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100119894;
  v8[3] = &unk_1008CDAA0;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (id)remoteLTKForDeviceID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
    id v6 = [v5 objectForKeyedSubscript:v4];

    if (!v6)
    {
      [(SDAutoUnlockAKSManager *)self updatePreferredRemoteLTKForDeviceID:v4];
      id v7 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
      id v6 = [v7 objectForKeyedSubscript:v4];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)hashMatchesAnyRemoteLTKForDeviceID:(id)a3 ltkHash:(id)a4 isPreferred:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
  uint64_t v11 = [v10 objectForKeyedSubscript:v8];

  if (!v11)
  {
    [(SDAutoUnlockAKSManager *)self updatePreferredRemoteLTKForDeviceID:v8];
    unint64_t v12 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
    uint64_t v11 = [v12 objectForKeyedSubscript:v8];

    if (!v11)
    {
      BOOL v21 = 0;
      char v20 = 0;
      if (!a5) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  int v26 = a5;
  id v13 = [(SDAutoUnlockAKSManager *)self remoteLTKEntryForDeviceID:v8];
  CFStringRef v14 = [v13 objectForKeyedSubscript:@"LTK Data"];
  long long v15 = [v13 objectForKeyedSubscript:@"Modern LTK Data"];
  unsigned __int8 v16 = [v14 isEqualToData:v15];
  unsigned __int8 v17 = [v11 isEqualToData:v15];
  int64_t v18 = [(SDAutoUnlockAKSManager *)self remoteLTKHashForDeviceID:v8 modern:0];
  BOOL v19 = [(SDAutoUnlockAKSManager *)self remoteLTKHashForDeviceID:v8 modern:1];
  if ([v9 isEqualToData:v18])
  {
    char v20 = v16 | v17 ^ 1;
LABEL_7:
    BOOL v21 = 1;
    goto LABEL_16;
  }
  if ([v9 isEqualToData:v19])
  {
    char v20 = v16 | v17;
    goto LABEL_7;
  }
  CFStringRef v22 = auto_unlock_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v23 = @"nil";
    *(_DWORD *)buf = 138413058;
    if (v18) {
      CFStringRef v24 = v18;
    }
    else {
      CFStringRef v24 = @"nil";
    }
    id v28 = v8;
    __int16 v29 = 2112;
    if (v19) {
      CFStringRef v23 = v19;
    }
    id v30 = v9;
    __int16 v31 = 2112;
    CFStringRef v32 = v24;
    __int16 v33 = 2112;
    CFStringRef v34 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "LTK hashes do not match {\n\tdevice ID: %@, \n\trequestLTKHash: %@, \n\tlegacyRemoteLTKHash: %@, \n\tmodernRemoteLTKHash: %@\n}", buf, 0x2Au);
  }

  BOOL v21 = 0;
  char v20 = 0;
LABEL_16:

  a5 = v26;
  if (v26) {
LABEL_17:
  }
    *a5 = v20;
LABEL_18:

  return v21;
}

- (id)remoteLTKHashForDeviceID:(id)a3 modern:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SDAutoUnlockAKSManager *)self remoteLTKEntryForDeviceID:a3];
  id v6 = v5;
  if (v4) {
    CFStringRef v7 = @"Modern LTK Hash";
  }
  else {
    CFStringRef v7 = @"LTK Hash";
  }
  id v8 = [v5 objectForKeyedSubscript:v7];

  return v8;
}

- (id)remoteLTKEntryForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockAKSManager *)self remoteLTKList];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)remoteLTKList
{
  uint64_t v3 = [(SDAutoUnlockAKSManager *)self remoteLTKs];
  if (!v3) {
    goto LABEL_3;
  }
  id v4 = (void *)v3;
  id v5 = [(SDAutoUnlockAKSManager *)self remoteLTKs];
  id v6 = [v5 objectForKeyedSubscript:@"Remote LTKs"];

  if (!v6)
  {
LABEL_3:
    CFStringRef v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100121CE8(self);
    }
  }
  id v8 = [(SDAutoUnlockAKSManager *)self remoteLTKs];
  id v9 = [v8 objectForKeyedSubscript:@"Remote LTKs"];

  return v9;
}

- (void)updatePreferredRemoteLTKForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockAKSManager *)self remoteLTKEntryForDeviceID:v4];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"LTK Data"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"Modern LTK Data"];
  id v8 = [v5 objectForKeyedSubscript:@"Attested LTK Data"];
  if (v8)
  {
    id v9 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
    uint64_t v10 = v9;
    uint64_t v11 = v8;
LABEL_3:
    [v9 setObject:v11 forKeyedSubscript:v4];
LABEL_4:

    goto LABEL_5;
  }
  if (!(v6 | v7))
  {
    uint64_t v10 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
    [v10 removeObjectForKey:v4];
    goto LABEL_4;
  }
  if (v6 && !v7) {
    goto LABEL_14;
  }
  if (!v6 && v7)
  {
    id v9 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
    uint64_t v10 = v9;
    uint64_t v11 = (void *)v7;
    goto LABEL_3;
  }
  if ([(id)v6 isEqualToData:v7])
  {
LABEL_14:
    id v9 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
    uint64_t v10 = v9;
    uint64_t v11 = (void *)v6;
    goto LABEL_3;
  }
  unint64_t v12 = auto_unlock_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "LTK's are mismatched between keychain views (device ID: %@)", (uint8_t *)&v21, 0xCu);
  }

  id v13 = [v5 objectForKeyedSubscript:@"LTK Mod Date"];
  uint64_t v14 = [v5 objectForKeyedSubscript:@"Modern LTK Mod Date"];
  long long v15 = (void *)v14;
  if ((!v6 || !v13 || v14)
    && (v7 && v14 && !v13
     || v13
     && v14
     && (!v6 || ([v13 timeIntervalSinceDate:v14], v19 < 0.0))
     && v7
     && ([v15 timeIntervalSinceDate:v13], v20 >= 0.0)))
  {
    unsigned __int8 v16 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
    unsigned __int8 v17 = v16;
    uint64_t v18 = v7;
  }
  else
  {
    unsigned __int8 v16 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
    unsigned __int8 v17 = v16;
    uint64_t v18 = v6;
  }
  [v16 setObject:v18 forKeyedSubscript:v4];

LABEL_5:
}

- (void)fetchLTKsFromCompanion:(BOOL)a3
{
}

- (void)sendLTKResponseWithPayload:(id)a3 viewState:(id)a4 needsUnlock:(id)a5 currentlySyncing:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_opt_new();
  [v13 setVersion:2];
  if (v9) {
    [v13 setLtkData:v9];
  }
  if (v10) {
    [v13 setViewState:[v10 BOOLValue]];
  }
  if (v11) {
    [v13 setNeedsUnlock:[v11 BOOLValue]];
  }
  if (v12) {
    [v13 setCurrentlySyncing:[v12 BOOLValue]];
  }
  uint64_t v14 = auto_unlock_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending LTK Response %@", buf, 0xCu);
  }

  long long v15 = +[SDAutoUnlockTransport sharedTransport];
  unsigned __int8 v16 = [v13 data];
  uint64_t v17 = IDSDefaultPairedDevice;
  id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"A70C5EAF-F24F-48A7-B834-F5297000C7A2"];
  [v15 sendPayload:v16 toDevice:v17 type:202 sessionID:v18 queueOneID:@"com.apple.sharing.auto-unlock.watch-ltk-response" timeout:0 errorHandler:&stru_1008CDAC0];
}

- (void)handleLTKRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[SDStatusMonitor sharedMonitor];
  unsigned int v6 = [v5 deviceWasUnlockedOnce];

  uint64_t v7 = [[SDAutoUnlockLTKRequest alloc] initWithData:v4];
  if (v6)
  {
    if ([(SDAutoUnlockLTKRequest *)v7 hasLocalID] && [(SDAutoUnlockLTKRequest *)v7 hasLtk])
    {
      id v8 = [(SDAutoUnlockAKSManager *)self ltksForRequest:v7];
      id v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(__CFString *)v8 allKeys];
        *(_DWORD *)buf = 138412290;
        CFStringRef v40 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending LTKs for devices to Watch: %@", buf, 0xCu);
      }
      id v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        CFStringRef v40 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending LTKs to Watch: %{private}@", buf, 0xCu);
      }

      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10011A8E8;
      v36[3] = &unk_1008CDAE8;
      id v12 = v8;
      CFStringRef v37 = v12;
      __int16 v38 = self;
      id v13 = objc_retainBlock(v36);
      if ([(SDAutoUnlockLTKRequest *)v7 hasCheckViewState]
        && [(SDAutoUnlockLTKRequest *)v7 checkViewState])
      {
        unsigned __int8 v14 = [(SDAutoUnlockAKSManager *)self viewSyncing];
        long long v15 = auto_unlock_log();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "View syncing", buf, 2u);
          }

          ((void (*)(void *, void *, void *, void *))v13[2])(v13, &__kCFBooleanTrue, &__kCFBooleanFalse, &__kCFBooleanTrue);
        }
        else
        {
          if (v16)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Posting follow up", buf, 2u);
          }

          __int16 v31 = +[CDPFollowUpContext contextForStateRepair];
          [v31 setShouldNotify:1];
          [v31 setForce:1];
          id v32 = objc_alloc_init((Class)CDPFollowUpController);
          id v35 = 0;
          [v32 postFollowUpWithContext:v31 error:&v35];
          id v33 = v35;
          if (v33)
          {
            CFStringRef v34 = auto_unlock_log();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              sub_100121E1C();
            }
          }
          ((void (*)(void *, void *, void *, void *))v13[2])(v13, &__kCFBooleanFalse, &__kCFBooleanFalse, &__kCFBooleanFalse);
        }
      }
      else
      {
        double v19 = auto_unlock_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "View sync state not requested", buf, 2u);
        }

        ((void (*)(void *, void, void, void))v13[2])(v13, 0, 0, 0);
      }
      double v20 = +[SDAutoUnlockTransport sharedTransport];
      int v21 = [v20 activeDevice];

      id v22 = objc_opt_new();
      [v22 setVersion:2];
      CFStringRef v23 = [(SDAutoUnlockLTKRequest *)v7 ltk];
      [v22 setLtk:v23];

      if ([(SDAutoUnlockLTKRequest *)v7 hasLtkID])
      {
        CFStringRef v24 = [(SDAutoUnlockLTKRequest *)v7 ltkID];
        [v22 setLtkID:v24];
      }
      int v25 = [(SDAutoUnlockLTKRequest *)v7 localID];
      int v26 = [v21 name];
      unsigned int v27 = [(SDAutoUnlockAKSManager *)self storeLongTermKey:v22 forDeviceID:v25 name:v26];

      id v28 = auto_unlock_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v29 = @"NO";
        if (v27) {
          CFStringRef v29 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v40 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Stored Watch LTK %@", buf, 0xCu);
      }

      if (v27)
      {
        [(SDAutoUnlockAKSManager *)self updateRemoteLTKs];
      }
      else
      {
        id v30 = auto_unlock_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_100121DE8();
        }
      }
      goto LABEL_24;
    }
    id v18 = auto_unlock_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100121E84(v7);
    }
LABEL_23:

    goto LABEL_24;
  }
  if (![(SDAutoUnlockLTKRequest *)v7 hasCheckViewState]
    || ![(SDAutoUnlockLTKRequest *)v7 checkViewState])
  {
    id v18 = auto_unlock_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Companion not first unlocked, not sending LTKs", buf, 2u);
    }
    goto LABEL_23;
  }
  uint64_t v17 = auto_unlock_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Companion not first unlocked, responding with state", buf, 2u);
  }

  [(SDAutoUnlockAKSManager *)self sendLTKResponseWithPayload:0 viewState:0 needsUnlock:&__kCFBooleanTrue currentlySyncing:0];
LABEL_24:
}

- (id)ltksForRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10011ABE8;
  v26[3] = &unk_1008CDB10;
  v26[4] = self;
  id v6 = v4;
  id v27 = v6;
  id v7 = v5;
  id v28 = v7;
  id v8 = objc_retainBlock(v26);
  id v9 = [v6 remoteDeviceID];

  if (v9)
  {
    id v10 = [v6 remoteDeviceID];
    ((void (*)(void *, void *))v8[2])(v8, v10);
  }
  else
  {
    [(SDAutoUnlockAKSManager *)self allKeychainDevices];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v21 = long long v25 = 0u;
    id v11 = [v21 allObjects];
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          BOOL v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v17 = [v6 localID];
          unsigned __int8 v18 = [v16 isEqualToString:v17];

          if ((v18 & 1) == 0) {
            ((void (*)(void *, void *))v8[2])(v8, v16);
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v13);
    }

    id v10 = v21;
  }

  id v19 = [v7 copy];

  return v19;
}

- (void)takeMobileKeybagAssertion
{
  uint64_t v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Taking keybag assertion", (uint8_t *)&v6, 2u);
  }

  if (!self->_keybagAssertion)
  {
    v7[0] = @"MKBAssertionKey";
    v7[1] = @"MKBAssertionTimeout";
    v8[0] = @"RemoteProfile";
    v8[1] = &off_100902BC8;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2, 0);
    id v4 = (void *)MKBDeviceLockAssertion();
    id keybagAssertion = self->_keybagAssertion;
    self->_id keybagAssertion = v4;

    [(SDAutoUnlockAKSManager *)self restartKeybagAssertionTimer];
  }
}

- (void)releaseKeybagAssertion
{
  uint64_t v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing keybag assertion", v5, 2u);
  }

  id keybagAssertion = self->_keybagAssertion;
  self->_id keybagAssertion = 0;
}

- (void)restartKeybagAssertionTimer
{
  uint64_t v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting keybag assertion timer", buf, 2u);
  }

  id v4 = [(SDAutoUnlockAKSManager *)self keybagAssertionTimer];

  if (!v4)
  {
    id v5 = SFMainQueue();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10011B0CC;
    v10[3] = &unk_1008CA4B8;
    v10[4] = self;
    uint64_t v6 = sub_1001B1B10(0, v5, v10);
    [(SDAutoUnlockAKSManager *)self setKeybagAssertionTimer:v6];

    id v7 = [(SDAutoUnlockAKSManager *)self keybagAssertionTimer];
    dispatch_resume(v7);
  }
  id v8 = [(SDAutoUnlockAKSManager *)self keybagAssertionTimer];
  dispatch_time_t v9 = sub_1001B1AF8(55.0);
  sub_1001B1BC4(v8, v9);
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v7 != 308)
  {
    if (v7 == 202)
    {
      [(SDAutoUnlockAKSManager *)self handleLTKResponse:v11];
    }
    else if (v7 == 201)
    {
      [(SDAutoUnlockAKSManager *)self handleLTKRequest:v11];
    }
    else
    {
      id v13 = auto_unlock_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100121FB0();
      }
    }
  }
}

- (BOOL)localDeviceEnabledAsKey
{
  uint64_t v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 deviceWasUnlockedOnce];

  if (v4)
  {
    return [(SDAutoUnlockAKSManager *)self deviceEnabledAsKeyForAnyDevice];
  }
  else
  {
    return [(SDAutoUnlockAKSManager *)self deviceEnabledAsKeyForAnyIDSDevice];
  }
}

- (BOOL)localDeviceEnabledAsKeyForMac
{
  uint64_t v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 deviceWasUnlockedOnce];

  if (v4)
  {
    return [(SDAutoUnlockAKSManager *)self deviceEnabledAsKeyForAnyMac];
  }
  else
  {
    return [(SDAutoUnlockAKSManager *)self deviceEnabledAsKeyForAnyIDSMac];
  }
}

- (BOOL)deviceEnabledAsKeyForIDSDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = +[SDAutoUnlockTransport sharedTransport];
  id v6 = [v5 deviceTypeForDeviceID:v4];

  if ([(SDAutoUnlockAKSManager *)self escrowSecretExistsForDevice:v4])
  {
    int v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100121FE4();
    }
LABEL_8:

    LOBYTE(v7) = 1;
    goto LABEL_10;
  }
  if (v6 != (id)2)
  {
    LOBYTE(v7) = 0;
    goto LABEL_10;
  }
  int v7 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v4];

  if (v7)
  {
    int v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10012204C();
    }
    goto LABEL_8;
  }
LABEL_10:

  return (char)v7;
}

- (BOOL)deviceEnabledAsKeyForAnyIDSDevice
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = +[SDAutoUnlockTransport sharedTransport];
  id v4 = [v3 idsDevicesIDs];
  id v5 = [v4 allObjects];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [(SDAutoUnlockAKSManager *)self localDeviceID];
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0
          && [(SDAutoUnlockAKSManager *)self deviceEnabledAsKeyForIDSDeviceID:v10])
        {
          BOOL v13 = 1;
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)deviceEnabledAsKeyForAnyIDSMac
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = +[SDAutoUnlockTransport sharedTransport];
  id v4 = [v3 idsDevicesIDs];
  id v5 = [v4 allObjects];

  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [(SDAutoUnlockAKSManager *)self localDeviceID];
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0)
        {
          if ([(SDAutoUnlockAKSManager *)self escrowSecretExistsForDevice:v10])
          {
            BOOL v13 = +[SDAutoUnlockTransport sharedTransport];
            id v14 = [v13 deviceTypeForDeviceID:v10];

            if (v14 == (id)4)
            {
              long long v16 = auto_unlock_log();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
                sub_100121FE4();
              }

              BOOL v15 = 1;
              goto LABEL_15;
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (BOOL)deviceEnabledAsKeyForAnyDevice
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = +[SDAutoUnlockTransport sharedTransport];
  id v4 = [v3 devicesWithLTKs];
  id v5 = [v4 allObjects];

  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = [(SDAutoUnlockAKSManager *)self localDeviceID];
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0)
        {
          BOOL v13 = +[SDAutoUnlockTransport sharedTransport];
          id v14 = [v13 deviceTypeForDeviceID:v10];

          if ([(SDAutoUnlockAKSManager *)self escrowSecretExistsForDevice:v10])
          {
            long long v17 = auto_unlock_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              sub_100121FE4();
            }
            goto LABEL_17;
          }
          if (v14 == (id)2)
          {
            BOOL v15 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v10];

            if (v15)
            {
              long long v17 = auto_unlock_log();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
                sub_10012204C();
              }
LABEL_17:

              BOOL v16 = 1;
              goto LABEL_18;
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_18:

  return v16;
}

- (BOOL)deviceEnabledAsKeyForAnyMac
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = +[SDAutoUnlockTransport sharedTransport];
  id v4 = [v3 devicesWithLTKs];
  id v5 = [v4 allObjects];

  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [(SDAutoUnlockAKSManager *)self localDeviceID];
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0)
        {
          if ([(SDAutoUnlockAKSManager *)self escrowSecretExistsForDevice:v10])
          {
            BOOL v13 = +[SDAutoUnlockTransport sharedTransport];
            id v14 = [v13 deviceTypeForDeviceID:v10];

            if (v14 == (id)4)
            {
              BOOL v16 = auto_unlock_log();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
                sub_100121FE4();
              }

              BOOL v15 = 1;
              goto LABEL_15;
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (BOOL)deviceEnabledAsKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockAKSManager *)self rangingKeyForDeviceID:v4];

  id v6 = [(SDAutoUnlockAKSManager *)self companionIDForWatchID:v4];
  BOOL v7 = v6 != 0;

  unsigned int v8 = [(SDAutoUnlockAKSManager *)self viewSyncing];
  dispatch_time_t v9 = [(SDAutoUnlockAKSManager *)self localLTK];
  if (v5)
  {
    id v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100122150(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  long long v18 = +[SDAutoUnlockTransport sharedTransport];
  id v19 = [v18 deviceTypeForDeviceID:v4];

  int v20 = SFDeviceClassCodeGet();
  int v21 = v20;
  if (v20 == 8 || v20 == 1)
  {
    uint64_t v22 = [(SDAutoUnlockAKSManager *)self localAttestedLTK];

    BOOL v7 = 1;
    unsigned int v8 = 1;
    dispatch_time_t v9 = (void *)v22;
  }
  long long v23 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v4];
  long long v24 = v23;
  if (v21 == 5 && v19 == (id)7)
  {
    if (!v23) {
      goto LABEL_21;
    }
LABEL_15:
    *(_DWORD *)CFStringRef v40 = 0;
    uint64_t v25 = sub_10001E958(v9, v23, 0, 1, 0, 0, 0, 1, v40);
    if (*(_DWORD *)v40 == -536363002 || *(_DWORD *)v40 == -536870194)
    {
      if (v21 == 5)
      {
        int v26 = auto_unlock_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Attempting to fix remote LTK for check", buf, 2u);
        }

        [(SDAutoUnlockAKSManager *)self resignRemoteLTKForDeviceID:v4];
        id v27 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v4];

        uint64_t v25 = sub_10001E958(v9, v27, 0, 1, 0, 0, 0, 1, 0);
        long long v24 = v27;
      }
      else
      {
        id v30 = auto_unlock_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Local and remote LTKs don't match", buf, 2u);
        }
      }
    }
    if (v25 < 0) {
      goto LABEL_39;
    }
    int v29 = 1;
    goto LABEL_31;
  }
  if (!v23)
  {
LABEL_21:
    id v28 = auto_unlock_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_1001220E8();
    }

    long long v24 = 0;
    goto LABEL_39;
  }
  if (v21 == 7 && v19 == (id)5) {
    goto LABEL_15;
  }
  if (!sub_10001D4C4(v23))
  {
LABEL_39:
    CFStringRef v34 = auto_unlock_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100122080();
    }

    BOOL v32 = 0;
    goto LABEL_42;
  }
  int v29 = 0;
  LODWORD(v25) = -1;
LABEL_31:
  if (v5) {
    BOOL v31 = v7;
  }
  else {
    BOOL v31 = 0;
  }
  BOOL v32 = v31 & v8;
  if ((v31 & v8 & 1) == 0)
  {
    id v33 = auto_unlock_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v36 = @"NO";
      if (v5) {
        CFStringRef v37 = @"YES";
      }
      else {
        CFStringRef v37 = @"NO";
      }
      *(_DWORD *)CFStringRef v40 = 138413058;
      id v41 = v4;
      if (v7) {
        CFStringRef v38 = @"YES";
      }
      else {
        CFStringRef v38 = @"NO";
      }
      CFStringRef v43 = v37;
      __int16 v42 = 2112;
      __int16 v44 = 2112;
      if (v8) {
        CFStringRef v36 = @"YES";
      }
      CFStringRef v45 = v38;
      __int16 v46 = 2112;
      CFStringRef v47 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Device not enabled but can create session (device: %@, ranging key exists: %@, companion ID exists: %@, view syncing: %@)", v40, 0x2Au);
    }
  }
  if (v29) {
    sub_10001F53C(v25);
  }
LABEL_42:

  return v32;
}

- (void)deleteEscrowSecretForAllDevices
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = +[SDAutoUnlockTransport sharedTransport];
  id v4 = [v3 devicesWithLTKs];
  id v5 = [v4 allObjects];

  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      dispatch_time_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v9);
        uint64_t v11 = [(SDAutoUnlockAKSManager *)self localDeviceID];
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = +[SDAutoUnlockTransport sharedTransport];
          uint64_t v14 = [v13 autoUnlockDeviceForDeviceID:v10];

          uint64_t v15 = [(SDAutoUnlockAKSManager *)self keyPairingIDForDeviceID:v10];
          [(SDAutoUnlockAKSManager *)self deleteEscrowSecretForDeviceID:v10];
          [(SDAutoUnlockAKSManager *)self deleteRangingKeyForDeviceID:v10];
          if ([v14 type] == (id)2 || v15 != 0)
          {
            uint64_t v17 = +[SDAutoUnlockSessionManager sharedManager];
            [v17 sendDisableMessageToDeviceID:v10 pairingID:v15];
          }
        }
        dispatch_time_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  [(SDAutoUnlockAKSManager *)self deleteAllEscrowSecrets];
  [(SDAutoUnlockAKSManager *)self deleteAllRangingKeys];
  long long v18 = +[SDAutoUnlockSessionManager sharedManager];
  [v18 clearAllKeysWithTokens];

  [(SDAutoUnlockAKSManager *)self updateDynamicStoreEnabled];
}

- (void)deleteEscrowSecretForPhones
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = +[SDAutoUnlockTransport sharedTransport];
  id v4 = [v3 devicesWithLTKs];
  id v5 = [v4 allObjects];

  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v20;
    *(void *)&long long v7 = 138412290;
    long long v18 = v7;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v10);
        unsigned __int8 v12 = +[SDAutoUnlockTransport sharedTransport];
        uint64_t v13 = [v12 autoUnlockDeviceForDeviceID:v11];

        if ([v13 type] == (id)2)
        {
          uint64_t v14 = [(SDAutoUnlockAKSManager *)self localDeviceID];
          unsigned __int8 v15 = [v11 isEqualToString:v14];

          if ((v15 & 1) == 0)
          {
            uint64_t v16 = auto_unlock_log();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v18;
              long long v24 = v13;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Disabling feature for device: %@", buf, 0xCu);
            }

            [(SDAutoUnlockAKSManager *)self deleteEscrowSecretForDeviceID:v11];
            [(SDAutoUnlockAKSManager *)self deleteRangingKeyForDeviceID:v11];
            uint64_t v17 = +[SDAutoUnlockSessionManager sharedManager];
            [v17 sendDisableMessageToDeviceID:v11 pairingID:0];
          }
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void)disablePairingForAllKeyDevices
{
  uint64_t v3 = [(SDAutoUnlockAKSManager *)self allPairedWatchDeviceIDs];
  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disabling pairing for all keys %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = -[SDAutoUnlockAKSManager pairingIDForWatchID:](self, "pairingIDForWatchID:", v10, (void)v15);
        unsigned __int8 v12 = +[SDAutoUnlockSessionManager sharedManager];
        [v12 sendDisableMessageToDeviceID:v10 pairingID:v11];

        uint64_t v13 = [(SDAutoUnlockAKSManager *)self localDeviceID];
        unsigned __int8 v14 = [v10 isEqualToString:v13];

        if ((v14 & 1) == 0) {
          [(SDAutoUnlockAKSManager *)self disablePairingWithKeyDevice:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [(SDAutoUnlockAKSManager *)self deleteAllRangingKeys];
}

- (void)disablePairingForAllLockPhones
{
  uint64_t v3 = +[SDAutoUnlockTransport sharedTransport];
  id v4 = [v3 devicesWithLTKs];

  id v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Disabling pairing for all phones", buf, 2u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v10);
        unsigned __int8 v12 = +[SDAutoUnlockTransport sharedTransport];
        uint64_t v13 = [v12 idsDeviceForUniqueID:v11];

        unsigned __int8 v14 = +[SDAutoUnlockTransport sharedTransport];
        id v15 = [v14 deviceTypeForDevice:v13];

        if (v15 == (id)2)
        {
          long long v16 = [(SDAutoUnlockAKSManager *)self localDeviceID];
          unsigned __int8 v17 = [v11 isEqualToString:v16];

          if ((v17 & 1) == 0)
          {
            [(SDAutoUnlockAKSManager *)self disablePairingWithKeyDevice:v11];
            [(SDAutoUnlockAKSManager *)self removeRemoteLTKForDeviceID:v11];
          }
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)removeAllRemoteLTKsOnSignOut
{
  uint64_t v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing all remote LTKs on sign out", buf, 2u);
  }

  id v4 = [(SDAutoUnlockAKSManager *)self keychainDevices:0];
  id v5 = [(SDAutoUnlockAKSManager *)self keychainDevices:1];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SDAutoUnlockAKSManager *)self deleteRemoteLongTermKeyForDeviceID:*(void *)(*((void *)&v20 + 1) + 8 * (void)v10) modern:0 tombstone:0];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[SDAutoUnlockAKSManager deleteRemoteLongTermKeyForDeviceID:modern:tombstone:](self, "deleteRemoteLongTermKeyForDeviceID:modern:tombstone:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v15), 1, 0, (void)v16);
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v13);
  }

  [(SDAutoUnlockAKSManager *)self clearRemoteLTKs];
}

- (BOOL)ltkExistsForKeyDevice:(id)a3
{
  return [(SDAutoUnlockAKSManager *)self ltkExistsForKeyDevice:a3 updateLTKs:0];
}

- (BOOL)ltkExistsForKeyDevice:(id)a3 updateLTKs:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v6];

  if (v7) {
    LOBYTE(v8) = 1;
  }
  else {
    LOBYTE(v8) = v4;
  }
  if (v4 && !v7)
  {
    id v8 = [(SDAutoUnlockAKSManager *)self anyLongTermKeyForDeviceID:v6];

    if (v8)
    {
      id v8 = auto_unlock_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating remote LTK for %@", (uint8_t *)&v11, 0xCu);
      }

      [(SDAutoUnlockAKSManager *)self updateRemoteLTKs];
      uint64_t v9 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v6];
      LOBYTE(v8) = v9 != 0;
    }
  }

  return (char)v8;
}

- (BOOL)disablePairingWithKeyDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockAKSManager *)self remoteLTKForDeviceID:v4];
  if (v5)
  {
    id v6 = [(SDAutoUnlockAKSManager *)self localLTK];
    BOOL v7 = sub_10001EEF4(v6, v5);
  }
  else
  {
    BOOL v7 = 0;
  }
  [(SDAutoUnlockAKSManager *)self removePairingRecordForWatchID:v4];
  id v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing remote LTK for %@", (uint8_t *)&v10, 0xCu);
  }

  [(SDAutoUnlockAKSManager *)self removeRemoteLTKForDeviceID:v4];
  [(SDAutoUnlockAKSManager *)self deleteRangingKeyForDeviceID:v4];
  [(SDAutoUnlockAKSManager *)self updateDynamicStoreEnabled];

  return v7;
}

- (void)addRemoteLTK:(id)a3 ltkHash:(id)a4 ltkModDate:(id)a5 modernLTK:(id)a6 modernLTKHash:(id)a7 modernLTKModeDate:(id)a8 deviceID:(id)a9
{
  id v28 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  long long v21 = [(SDAutoUnlockAKSManager *)self remoteLTKList];
  id v22 = [v21 mutableCopy];

  long long v23 = [v22 objectForKeyedSubscript:v20];

  if (v23)
  {
    long long v24 = auto_unlock_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Overriding existing LTK", buf, 2u);
    }
  }
  uint64_t v25 = objc_opt_new();
  int v26 = v25;
  if (v28) {
    [v25 setObject:v28 forKeyedSubscript:@"LTK Data"];
  }
  if (v15) {
    [v26 setObject:v15 forKeyedSubscript:@"LTK Hash"];
  }
  if (v16) {
    [v26 setObject:v16 forKeyedSubscript:@"LTK Mod Date"];
  }
  if (v17) {
    [v26 setObject:v17 forKeyedSubscript:@"Modern LTK Data"];
  }
  if (v18) {
    [v26 setObject:v18 forKeyedSubscript:@"Modern LTK Hash"];
  }
  if (v19) {
    [v26 setObject:v19 forKeyedSubscript:@"Modern LTK Mod Date"];
  }
  [v22 setObject:v26 forKeyedSubscript:v20];
  id v27 = [(SDAutoUnlockAKSManager *)self remoteLTKs];
  [v27 setObject:v22 forKeyedSubscript:@"Remote LTKs"];

  [(SDAutoUnlockAKSManager *)self saveRemoteLTKs];
  [(SDAutoUnlockAKSManager *)self updatePreferredRemoteLTKForDeviceID:v20];
}

- (void)removeRemoteLTKForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockAKSManager *)self remoteLTKList];
  id v8 = [v5 mutableCopy];

  [v8 removeObjectForKey:v4];
  id v6 = [(SDAutoUnlockAKSManager *)self remoteLTKs];
  [v6 setObject:v8 forKeyedSubscript:@"Remote LTKs"];

  [(SDAutoUnlockAKSManager *)self saveRemoteLTKs];
  BOOL v7 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
  [v7 removeObjectForKey:v4];
}

- (void)clearRemoteLTKs
{
  uint64_t v3 = objc_opt_new();
  [(SDAutoUnlockAKSManager *)self setRemoteLTKs:v3];

  id v4 = objc_opt_new();
  id v5 = [(SDAutoUnlockAKSManager *)self remoteLTKs];
  [v5 setObject:v4 forKeyedSubscript:@"Remote LTKs"];

  [(SDAutoUnlockAKSManager *)self saveRemoteLTKs];
  id v6 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
  [v6 removeAllObjects];
}

- (void)saveRemoteLTKs
{
  uint64_t v3 = [(SDAutoUnlockAKSManager *)self remoteLTKStorageFilePath];
  if (v3)
  {
    id v4 = [(SDAutoUnlockAKSManager *)self remoteLTKs];
    id v13 = 0;
    id v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:&v13];
    id v6 = v13;

    if (v5)
    {
      if (SFDeviceIsRealityDevice()) {
        uint64_t v7 = 268435457;
      }
      else {
        uint64_t v7 = 1;
      }
      id v12 = v6;
      unsigned int v8 = [v5 writeToFile:v3 options:v7 error:&v12];
      id v9 = v12;

      int v10 = auto_unlock_log();
      id v11 = v10;
      if (v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_100122230(self);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        sub_1001222B4();
      }
    }
    else
    {
      id v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001221C8();
      }
      id v9 = v6;
    }
  }
}

- (void)loadRemoteLTKsIfNeeded
{
  uint64_t v3 = [(SDAutoUnlockAKSManager *)self remoteLTKs];

  if (!v3)
  {
    [(SDAutoUnlockAKSManager *)self loadRemoteLTKs];
  }
}

- (void)loadRemoteLTKs
{
  uint64_t v3 = [(SDAutoUnlockAKSManager *)self remoteLTKStorageFilePath];
  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3 isDirectory:0];

  if ((v5 & 1) == 0)
  {
    id v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating Remote LTK file", buf, 2u);
    }

    uint64_t v7 = objc_opt_new();
    [(SDAutoUnlockAKSManager *)self setRemoteLTKs:v7];

    unsigned int v8 = objc_opt_new();
    id v9 = [(SDAutoUnlockAKSManager *)self remoteLTKs];
    [v9 setObject:v8 forKeyedSubscript:@"Remote LTKs"];

    [(SDAutoUnlockAKSManager *)self saveRemoteLTKs];
  }
  if (v3)
  {
    id v24 = 0;
    id v10 = [objc_alloc((Class)NSData) initWithContentsOfFile:v3 options:0 error:&v24];
    id v11 = v24;
    id v12 = v11;
    if (v10)
    {
      id v23 = 0;
      id v13 = +[NSPropertyListSerialization propertyListWithData:v10 options:0 format:0 error:&v23];
      id v14 = v23;

      if (v13)
      {
        id v15 = [v13 mutableCopy];
        [(SDAutoUnlockAKSManager *)self setRemoteLTKs:v15];

        id v16 = [(SDAutoUnlockAKSManager *)self preferredRemoteLTKForDeviceID];
        [v16 removeAllObjects];

        id v17 = auto_unlock_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [(SDAutoUnlockAKSManager *)self remoteLTKList];
          id v19 = [v18 allKeys];
          id v20 = SFCompactStringFromCollection();
          *(_DWORD *)buf = 138412290;
          int v26 = v20;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Loaded remote LTKs: %@", buf, 0xCu);
        }
        long long v21 = auto_unlock_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [(SDAutoUnlockAKSManager *)self remoteLTKs];
          *(_DWORD *)buf = 138477827;
          int v26 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Remote LTK Data: %{private}@", buf, 0xCu);
        }
      }
      else
      {
        long long v21 = auto_unlock_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100122384();
        }
      }
    }
    else
    {
      if ([v11 code] == (id)-1100
        || [v12 code] == (id)260
        || [v12 code] == (id)4)
      {
        goto LABEL_22;
      }
      id v13 = auto_unlock_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10012231C();
      }
      id v14 = v12;
    }

    id v12 = v14;
LABEL_22:
  }
}

- (NSString)remoteLTKStorageFilePath
{
  remoteLTKStorageFilePath = self->_remoteLTKStorageFilePath;
  if (!remoteLTKStorageFilePath)
  {
    id v4 = [(SDAutoUnlockAKSManager *)self autoUnlockFolderPath];
    unsigned __int8 v5 = [v4 stringByAppendingPathComponent:@"ltk.plist"];
    id v6 = self->_remoteLTKStorageFilePath;
    self->_remoteLTKStorageFilePath = v5;

    remoteLTKStorageFilePath = self->_remoteLTKStorageFilePath;
  }

  return remoteLTKStorageFilePath;
}

- (void)reloadPairingRecordsIfNeeded
{
  uint64_t v3 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];

  if (!v3)
  {
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reloading pairing records", v5, 2u);
    }

    [(SDAutoUnlockAKSManager *)self loadWatchIDsToPairingRecords];
  }
}

- (id)allPairedWatchDeviceIDs
{
  id v2 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  uint64_t v3 = [v2 allKeys];

  return v3;
}

- (void)setCompanionID:(id)a3 forWatchID:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  uint64_t v7 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  unsigned int v8 = [v7 objectForKeyedSubscript:v13];
  if (v8)
  {
    id v9 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
    id v10 = [v9 objectForKeyedSubscript:v13];
    id v11 = [v10 mutableCopy];
  }
  else
  {
    id v11 = (id)objc_opt_new();
  }

  [v11 setObject:v6 forKeyedSubscript:@"Companion ID"];
  id v12 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  [v12 setObject:v11 forKeyedSubscript:v13];

  [(SDAutoUnlockAKSManager *)self saveWatchIDsToPairingRecords];
}

- (id)companionIDForWatchID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"Companion ID"];

  return v7;
}

- (void)removeCompanionIDForWatchID:(id)a3
{
  id v10 = a3;
  id v4 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  unsigned __int8 v5 = [v4 objectForKeyedSubscript:v10];
  if (v5)
  {
    id v6 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
    uint64_t v7 = [v6 objectForKeyedSubscript:v10];
    id v8 = [v7 mutableCopy];
  }
  else
  {
    id v8 = (id)objc_opt_new();
  }

  [v8 removeObjectForKey:@"Companion ID"];
  id v9 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  [v9 setObject:v8 forKeyedSubscript:v10];

  [(SDAutoUnlockAKSManager *)self saveWatchIDsToPairingRecords];
}

- (void)setPairingID:(id)a3 forWatchID:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  uint64_t v7 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  id v8 = [v7 objectForKeyedSubscript:v13];
  if (v8)
  {
    id v9 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
    id v10 = [v9 objectForKeyedSubscript:v13];
    id v11 = [v10 mutableCopy];
  }
  else
  {
    id v11 = (id)objc_opt_new();
  }

  [v11 setObject:v6 forKeyedSubscript:@"Pairing ID"];
  id v12 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  [v12 setObject:v11 forKeyedSubscript:v13];

  [(SDAutoUnlockAKSManager *)self saveWatchIDsToPairingRecords];
}

- (id)pairingIDForWatchID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"Pairing ID"];

  return v7;
}

- (void)removePairingIDForWatchID:(id)a3
{
  id v10 = a3;
  id v4 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  unsigned __int8 v5 = [v4 objectForKeyedSubscript:v10];
  if (v5)
  {
    id v6 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
    uint64_t v7 = [v6 objectForKeyedSubscript:v10];
    id v8 = [v7 mutableCopy];
  }
  else
  {
    id v8 = (id)objc_opt_new();
  }

  [v8 removeObjectForKey:@"Pairing ID"];
  id v9 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  [v9 setObject:v8 forKeyedSubscript:v10];

  [(SDAutoUnlockAKSManager *)self saveWatchIDsToPairingRecords];
}

- (void)removePairingRecordForWatchID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
  [v5 removeObjectForKey:v4];

  [(SDAutoUnlockAKSManager *)self saveWatchIDsToPairingRecords];
}

- (void)saveWatchIDsToPairingRecords
{
  uint64_t v3 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecordsStorageFilePath];
  if (v3)
  {
    id v4 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecords];
    id v12 = 0;
    unsigned __int8 v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:&v12];
    id v6 = v12;

    if (v5)
    {
      id v11 = v6;
      unsigned int v7 = [v5 writeToFile:v3 options:1 error:&v11];
      id v8 = v11;

      id v9 = auto_unlock_log();
      id v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_100122454(self);
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        sub_1001224D8();
      }
    }
    else
    {
      id v10 = auto_unlock_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001223EC();
      }
      id v8 = v6;
    }
  }
}

- (void)loadWatchIDsToPairingRecords
{
  uint64_t v3 = [(SDAutoUnlockAKSManager *)self watchIDsToPairingRecordsStorageFilePath];
  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1001227BC();
  }

  unsigned __int8 v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:v3 isDirectory:0];

  if ((v6 & 1) == 0)
  {
    unsigned int v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100122788();
    }

    id v8 = objc_opt_new();
    [(SDAutoUnlockAKSManager *)self setWatchIDsToPairingRecords:v8];

    [(SDAutoUnlockAKSManager *)self saveWatchIDsToPairingRecords];
  }
  if (v3)
  {
    id v23 = 0;
    id v9 = [objc_alloc((Class)NSData) initWithContentsOfFile:v3 options:0 error:&v23];
    id v10 = v23;
    id v11 = v10;
    if (v9)
    {
      id v22 = 0;
      id v12 = +[NSPropertyListSerialization propertyListWithData:v9 options:0 format:0 error:&v22];
      id v13 = v22;

      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = [v12 mutableCopy];
          [(SDAutoUnlockAKSManager *)self setWatchIDsToPairingRecords:v14];

          id v15 = auto_unlock_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_100122678(self);
          }
        }
        else
        {
          long long v21 = auto_unlock_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1001226FC((uint64_t)v12, v21);
          }

          id v15 = objc_opt_new();
          [(SDAutoUnlockAKSManager *)self setWatchIDsToPairingRecords:v15];
        }
      }
      else
      {
        id v16 = auto_unlock_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100122610();
        }

        id v15 = +[NSUserDefaults standardUserDefaults];
        unsigned int v17 = [v15 BOOLForKey:@"AutoUnlockErrorLoadingPairingRecords"];
        p_super = auto_unlock_log();
        BOOL v19 = os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR);
        if (v17)
        {
          if (v19) {
            sub_1001225A8();
          }

          id v20 = (NSMutableDictionary *)objc_opt_new();
          p_super = &self->_watchIDsToPairingRecords->super.super;
          self->_watchIDsToPairingRecords = v20;
        }
        else if (v19)
        {
          sub_1001225DC();
        }

        [v15 setBool:v17 ^ 1 forKey:@"AutoUnlockErrorLoadingPairingRecords"];
      }
    }
    else
    {
      if ([v10 code] == (id)-1100
        || [v11 code] == (id)260
        || [v11 code] == (id)4)
      {
        goto LABEL_34;
      }
      id v12 = auto_unlock_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100122540();
      }
      id v13 = v11;
    }

    id v11 = v13;
LABEL_34:

    goto LABEL_35;
  }
  id v11 = 0;
LABEL_35:
  [(SDAutoUnlockAKSManager *)self migrateLegacyWatchIDToCompanionIDs];
}

- (NSString)watchIDsToPairingRecordsStorageFilePath
{
  watchIDsToPairingRecordsStorageFilePath = self->_watchIDsToPairingRecordsStorageFilePath;
  if (!watchIDsToPairingRecordsStorageFilePath)
  {
    id v4 = [(SDAutoUnlockAKSManager *)self autoUnlockFolderPath];
    unsigned __int8 v5 = [v4 stringByAppendingPathComponent:@"pairing-records.plist"];
    unsigned __int8 v6 = self->_watchIDsToPairingRecordsStorageFilePath;
    self->_watchIDsToPairingRecordsStorageFilePath = v5;

    watchIDsToPairingRecordsStorageFilePath = self->_watchIDsToPairingRecordsStorageFilePath;
  }

  return watchIDsToPairingRecordsStorageFilePath;
}

- (void)migrateLegacyWatchIDToCompanionIDs
{
  uint64_t v3 = [(SDAutoUnlockAKSManager *)self loadLegacyWatchIDToCompanionIDMapping];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011E0F4;
  v4[3] = &unk_1008CDB38;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
  [(SDAutoUnlockAKSManager *)self saveWatchIDsToPairingRecords];
  [(SDAutoUnlockAKSManager *)self deleteLegacyWatchToCompanionIDs];
}

- (void)deleteLegacyWatchToCompanionIDs
{
  id v2 = [(SDAutoUnlockAKSManager *)self watchIDToCompanionIDStorageFilePath];
  uint64_t v3 = +[NSFileManager defaultManager];
  id v7 = 0;
  unsigned __int8 v4 = [v3 removeItemAtPath:v2 error:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0
    && [v5 code] != (id)-1100
    && [v5 code] != (id)260
    && [v5 code] != (id)4)
  {
    unsigned __int8 v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100122824();
    }
  }
}

- (id)loadLegacyWatchIDToCompanionIDMapping
{
  uint64_t v3 = [(SDAutoUnlockAKSManager *)self watchIDToCompanionIDStorageFilePath];
  if (!v3)
  {
    unsigned __int8 v6 = 0;
    id v9 = 0;
    goto LABEL_17;
  }
  id v14 = 0;
  id v4 = [objc_alloc((Class)NSData) initWithContentsOfFile:v3 options:0 error:&v14];
  id v5 = v14;
  unsigned __int8 v6 = v5;
  if (v4)
  {
    id v13 = 0;
    id v7 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v13];
    id v8 = v13;

    if (v7)
    {
      id v9 = [v7 mutableCopy];
      id v10 = auto_unlock_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_10012295C();
      }
    }
    else
    {
      id v10 = auto_unlock_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001228F4();
      }
      id v9 = 0;
    }

LABEL_15:
    unsigned __int8 v6 = v8;
    goto LABEL_16;
  }
  if ([v5 code] != (id)-1100
    && [v6 code] != (id)260
    && [v6 code] != (id)4)
  {
    id v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10012288C();
    }
    id v9 = 0;
    id v8 = v6;
    goto LABEL_15;
  }
  id v9 = 0;
LABEL_16:

LABEL_17:
  id v11 = [(SDAutoUnlockAKSManager *)self migrateLegacyCompanionIDs:v9];

  return v11;
}

- (NSString)watchIDToCompanionIDStorageFilePath
{
  watchIDToCompanionIDStorageFilePath = self->_watchIDToCompanionIDStorageFilePath;
  if (!watchIDToCompanionIDStorageFilePath)
  {
    id v4 = [(SDAutoUnlockAKSManager *)self autoUnlockFolderPath];
    id v5 = [v4 stringByAppendingPathComponent:@"watch-companion-mapping.plist"];
    unsigned __int8 v6 = self->_watchIDToCompanionIDStorageFilePath;
    self->_watchIDToCompanionIDStorageFilePath = v5;

    watchIDToCompanionIDStorageFilePath = self->_watchIDToCompanionIDStorageFilePath;
  }

  return watchIDToCompanionIDStorageFilePath;
}

- (id)migrateLegacyCompanionIDs:(id)a3
{
  if (a3) {
    id v4 = [a3 mutableCopy];
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  id v5 = v4;
  unsigned __int8 v6 = [(SDAutoUnlockAKSManager *)self loadCompanionIDs];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10011E5A0;
  v9[3] = &unk_1008CDB38;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  [(SDAutoUnlockAKSManager *)self deleteLegacyCompanionIDs];

  return v7;
}

- (void)deleteLegacyCompanionIDs
{
  id v2 = [(SDAutoUnlockAKSManager *)self companionIDStorageFilePath];
  uint64_t v3 = +[NSFileManager defaultManager];
  id v7 = 0;
  unsigned __int8 v4 = [v3 removeItemAtPath:v2 error:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0
    && [v5 code] != (id)-1100
    && [v5 code] != (id)260
    && [v5 code] != (id)4)
  {
    unsigned __int8 v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001229C4();
    }
  }
}

- (id)loadCompanionIDs
{
  id v2 = [(SDAutoUnlockAKSManager *)self companionIDStorageFilePath];
  if (!v2)
  {
    id v5 = 0;
    id v8 = 0;
    goto LABEL_17;
  }
  id v12 = 0;
  id v3 = [objc_alloc((Class)NSData) initWithContentsOfFile:v2 options:0 error:&v12];
  id v4 = v12;
  id v5 = v4;
  if (v3)
  {
    id v11 = 0;
    unsigned __int8 v6 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:&v11];
    id v7 = v11;

    if (v6)
    {
      id v8 = [v6 mutableCopy];
      id v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loaded companion IDs: %@", buf, 0xCu);
      }
    }
    else
    {
      id v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100122A94();
      }
      id v8 = 0;
    }

LABEL_15:
    id v5 = v7;
    goto LABEL_16;
  }
  if ([v4 code] != (id)-1100
    && [v5 code] != (id)260
    && [v5 code] != (id)4)
  {
    unsigned __int8 v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100122A2C();
    }
    id v8 = 0;
    id v7 = v5;
    goto LABEL_15;
  }
  id v8 = 0;
LABEL_16:

LABEL_17:

  return v8;
}

- (NSString)companionIDStorageFilePath
{
  companionIDStorageFilePath = self->_companionIDStorageFilePath;
  if (!companionIDStorageFilePath)
  {
    id v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    id v5 = [v4 firstObject];

    unsigned __int8 v6 = [v5 stringByAppendingPathComponent:@"Sharing"];
    id v7 = +[NSFileManager defaultManager];
    id v13 = 0;
    unsigned int v8 = [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v13];
    id v9 = v13;

    if (v8)
    {
      id v10 = [v6 stringByAppendingPathComponent:@"companion-paired-devices.plist"];
      id v11 = self->_companionIDStorageFilePath;
      self->_companionIDStorageFilePath = v10;
    }
    else
    {
      id v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100122AFC();
      }
    }

    companionIDStorageFilePath = self->_companionIDStorageFilePath;
  }

  return companionIDStorageFilePath;
}

- (id)autoUnlockFolderPath
{
  id v2 = sub_1001B2B24();
  id v3 = [v2 stringByAppendingPathComponent:@"AutoUnlock"];
  id v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    id v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100122B64();
    }
  }

  return v3;
}

+ (BOOL)useKeychainForLTKSyncing
{
  return 0;
}

- (BOOL)storeKeychainItemWithAttributeDictionary:(id)a3 updateDictionary:(id)a4 addDictionary:(id)a5
{
  CFDictionaryRef v7 = (const __CFDictionary *)a3;
  CFDictionaryRef v8 = (const __CFDictionary *)a4;
  CFDictionaryRef v9 = (const __CFDictionary *)a5;
  if (!SecItemAdd(v9, 0))
  {
    id v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      id v12 = "Added keychain item";
      id v13 = (uint8_t *)&v15;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
LABEL_12:
    BOOL v11 = 1;
    goto LABEL_13;
  }
  if (!SecItemUpdate(v7, v8))
  {
    id v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v12 = "Updated keychain item";
      id v13 = buf;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  SecItemDelete(v7);
  if (!SecItemAdd(v9, 0))
  {
    BOOL v11 = 1;
    goto LABEL_14;
  }
  id v10 = auto_unlock_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100122BCC();
  }
  BOOL v11 = 0;
LABEL_13:

LABEL_14:
  return v11;
}

- (id)escrowSecretForDevice:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(SDAutoUnlockAKSManager *)self baseLocalKeysDictionaryForDevice:v4 type:&off_100902BE0];
  id v6 = [(SDAutoUnlockAKSManager *)self keychainDataForQuery:v5];

  CFDictionaryRef v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loaded escrowSecret from keychain", buf, 2u);
  }

  if (v6)
  {
    CFDictionaryRef v8 = [[SDAutoUnlockEscrowSecretInfo alloc] initWithData:v6];
    CFDictionaryRef v9 = v8;
    if (v8 && [(SDAutoUnlockEscrowSecretInfo *)v8 hasSecret])
    {
      id v10 = [v9 secret];
      BOOL v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Using new secret", v20, 2u);
      }
    }
    else
    {
      BOOL v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100122C34(v9);
      }
      id v10 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  id v12 = [(SDAutoUnlockAKSManager *)self baseLocalKeysDictionaryForDevice:v4 type:0];
  id v10 = [(SDAutoUnlockAKSManager *)self keychainDataForQuery:v12];

  CFDictionaryRef v9 = auto_unlock_log();
  BOOL v13 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      *(_WORD *)BOOL v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrating escrow secret", v19, 2u);
    }

    CFDictionaryRef v9 = [(SDAutoUnlockAKSManager *)self baseLocalKeysDictionaryForDevice:v4 type:0];
    BOOL v11 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v9];
    [v11 setObject:&off_100902BE0 forKeyedSubscript:kSecAttrKeyType];
    [v11 setObject:kSecAttrAccessibleWhenUnlockedThisDeviceOnly forKeyedSubscript:kSecAttrAccessible];
    id v14 = objc_opt_new();
    [v14 setSecret:v10];
    __int16 v15 = [v14 data];
    [v11 setObject:v15 forKeyedSubscript:kSecValueData];

    SecItemDelete((CFDictionaryRef)v9);
    if (SecItemAdd((CFDictionaryRef)v11, 0))
    {
      id v16 = auto_unlock_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100122BCC();
      }
    }
    goto LABEL_19;
  }
  if (v13)
  {
    *(_WORD *)id v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No secret", v18, 2u);
  }
  id v10 = 0;
LABEL_20:

  return v10;
}

- (BOOL)cachedEscrowSecretExistsForDeviceID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(SDAutoUnlockAKSManager *)self escrowSecretForDeviceID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)cachedEscrowSecretIsValidForDeviceID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(SDAutoUnlockAKSManager *)self escrowSecretForDeviceID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    unsigned __int8 v7 = [v6 isValid];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)keyPairingIDForDeviceID:(id)a3
{
  id v4 = [(SDAutoUnlockAKSManager *)self baseLocalKeysDictionaryForDevice:a3 type:&off_100902BE0];
  unsigned __int8 v5 = [(SDAutoUnlockAKSManager *)self keychainDataForQuery:v4];

  if (v5)
  {
    id v6 = [[SDAutoUnlockEscrowSecretInfo alloc] initWithData:v5];
    unsigned __int8 v7 = [(SDAutoUnlockEscrowSecretInfo *)v6 pairingID];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)storeEscrowSecret:(id)a3 pairingID:(id)a4 deviceID:(id)a5 requiresUnlock:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(SDAutoUnlockAKSManager *)self baseLocalKeysDictionaryForDevice:a5 type:&off_100902BE0];
  BOOL v13 = objc_opt_new();
  id v14 = v13;
  __int16 v15 = &kSecAttrAccessibleAfterFirstUnlock;
  if (v6) {
    __int16 v15 = &kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
  }
  [v13 setObject:*v15 forKeyedSubscript:kSecAttrAccessible];
  id v16 = objc_opt_new();
  [v16 setSecret:v11];

  [v16 setPairingID:v10];
  unsigned int v17 = [v16 data];
  [v14 setObject:v17 forKeyedSubscript:kSecValueData];

  id v18 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v12];
  [v18 addEntriesFromDictionary:v14];
  BOOL v19 = [(SDAutoUnlockAKSManager *)self storeKeychainItemWithAttributeDictionary:v12 updateDictionary:v14 addDictionary:v18];

  return v19;
}

- (BOOL)escrowSecretExistsForDevice:(id)a3
{
  id v3 = [(SDAutoUnlockAKSManager *)self baseLocalKeysDictionaryForDevice:a3 type:0];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnPersistentRef];
  OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)v3, 0);
  OSStatus v5 = v4;
  if (v4 != -25308 && v4 != -25300 && v4)
  {
    BOOL v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100122CD8();
    }
  }
  if (v5) {
    BOOL v7 = v5 == -25308;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = v7;

  return v8;
}

- (id)escrowSecretCreationDateForDeviceID:(id)a3
{
  CFTypeRef result = 0;
  id v3 = [(SDAutoUnlockAKSManager *)self baseLocalKeysDictionaryForDevice:a3 type:0];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
  OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
  if (v4 == -25300)
  {
    BOOL v7 = 0;
  }
  else
  {
    OSStatus v5 = v4;
    if (v4)
    {
      BOOL v6 = auto_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        OSStatus v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Query for attributtes status: %d", buf, 8u);
      }
      BOOL v7 = 0;
    }
    else
    {
      BOOL v6 = result;
      BOOL v7 = [(id)result objectForKeyedSubscript:kSecAttrCreationDate];
    }
  }

  return v7;
}

- (void)deleteEscrowSecretForDeviceID:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = [(SDAutoUnlockAKSManager *)self baseLocalKeysDictionaryForDevice:v4 type:0];
  OSStatus v6 = SecItemDelete(v5);
  if (v6 != -25300)
  {
    if (v6)
    {
      BOOL v7 = auto_unlock_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100122D40();
      }
    }
    else
    {
      BOOL v7 = auto_unlock_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleted escrow secret for device %@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (void)deleteAllEscrowSecrets
{
  CFDictionaryRef v2 = [(SDAutoUnlockAKSManager *)self baseLocalKeysDictionary];
  OSStatus v3 = SecItemDelete(v2);
  if (v3 != -25300)
  {
    if (v3)
    {
      id v4 = auto_unlock_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100122DA8();
      }
    }
    else
    {
      id v4 = auto_unlock_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFDictionaryRef v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deleted all escrow secrets", v5, 2u);
      }
    }
  }
}

- (BOOL)storeLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = 0;
  if ([(SDAutoUnlockAKSManager *)self storeLongTermKey:v8 forDeviceID:v9 name:v10 modern:0])
  {
    BOOL v11 = [(SDAutoUnlockAKSManager *)self storeLongTermKey:v8 forDeviceID:v9 name:v10 modern:1];
  }

  return v11;
}

- (BOOL)storeLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5 modern:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6) {
    [(SDAutoUnlockAKSManager *)self modernSyncedDictionaryForDevice:v11];
  }
  else {
  BOOL v13 = [(SDAutoUnlockAKSManager *)self syncedDictionaryForDevice:v11];
  }
  id v14 = objc_opt_new();
  [v14 setObject:kSecAttrAccessibleAfterFirstUnlock forKeyedSubscript:kSecAttrAccessible];
  __int16 v15 = +[NSString stringWithFormat:@"%@: %@", @"Auto Unlock", v12];
  [v14 setObject:v15 forKeyedSubscript:kSecAttrLabel];

  id v16 = [v10 data];
  [v14 setObject:v16 forKeyedSubscript:kSecValueData];

  id v17 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v13];
  [v17 addEntriesFromDictionary:v14];
  id v18 = sharing_persistent_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v19 = @"YES";
    *(_DWORD *)buf = 138413571;
    if (!v10) {
      CFStringRef v19 = @"NO";
    }
    CFStringRef v23 = v19;
    __int16 v24 = 2113;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    int v29 = v13;
    __int16 v30 = 2113;
    BOOL v31 = v14;
    __int16 v32 = 2113;
    id v33 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Store LTK (ltkInfo exists: %@, ltkInfo: %{private}@, deviceID: %@ attributes: %@, update: %{private}@, add: %{private}@)", buf, 0x3Eu);
  }

  BOOL v20 = [(SDAutoUnlockAKSManager *)self storeKeychainItemWithAttributeDictionary:v13 updateDictionary:v14 addDictionary:v17];
  return v20;
}

- (BOOL)storeAttestedLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SDAutoUnlockAKSManager *)self attestedDictionaryForDevice:v9];
  id v12 = objc_opt_new();
  int IsRealityDevice = SFDeviceIsRealityDevice();
  id v14 = &kSecAttrAccessibleAfterFirstUnlock;
  if (IsRealityDevice) {
    id v14 = &kSecAttrAccessibleAlways;
  }
  [v12 setObject:*v14 forKeyedSubscript:kSecAttrAccessible];
  __int16 v15 = +[NSString stringWithFormat:@"%@: %@", @"Auto Unlock", v10];

  [v12 setObject:v15 forKeyedSubscript:kSecAttrLabel];
  id v16 = [v8 data];
  [v12 setObject:v16 forKeyedSubscript:kSecValueData];

  id v17 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v11];
  [v17 addEntriesFromDictionary:v12];
  id v18 = sharing_persistent_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v19 = @"YES";
    *(_DWORD *)buf = 138413571;
    if (!v8) {
      CFStringRef v19 = @"NO";
    }
    CFStringRef v23 = v19;
    __int16 v24 = 2113;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    int v29 = v11;
    __int16 v30 = 2113;
    BOOL v31 = v12;
    __int16 v32 = 2113;
    id v33 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Store attested LTK (ltkInfo exists: %@, ltkInfo: %{private}@, deviceID: %@ attributes: %@, update: %{private}@, add: %{private}@)", buf, 0x3Eu);
  }

  BOOL v20 = [(SDAutoUnlockAKSManager *)self storeKeychainItemWithAttributeDictionary:v11 updateDictionary:v12 addDictionary:v17];
  return v20;
}

- (void)deleteRemoteLongTermKeyForDeviceID:(id)a3 modern:(BOOL)a4 tombstone:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6) {
    [(SDAutoUnlockAKSManager *)self modernSyncedDictionaryForDevice:v8];
  }
  else {
  CFDictionaryRef v9 = [(SDAutoUnlockAKSManager *)self syncedDictionaryForDevice:v8];
  }
  CFDictionaryRef v10 = v9;
  if (!a5) {
    [(__CFDictionary *)v9 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecUseTombstones];
  }
  OSStatus v11 = SecItemDelete(v10);
  if (v11 != -25300)
  {
    int v12 = v11;
    if (v11)
    {
      BOOL v13 = auto_unlock_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100122E10((uint64_t)v10, v12, v13);
      }
    }
  }
}

- (id)anyLongTermKeyForDeviceID:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = [(SDAutoUnlockAKSManager *)self longTermKeyForDevice:v4 modern:1];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(SDAutoUnlockAKSManager *)self longTermKeyForDevice:v4 modern:0];
  }
  id v8 = v7;

  return v8;
}

- (id)longTermKeyForDevice:(id)a3 modern:(BOOL)a4
{
  id v4 = [(SDAutoUnlockAKSManager *)self ltkInfoForDeviceID:a3 modern:a4];
  CFDictionaryRef v5 = [v4 ltk];

  return v5;
}

- (id)longTermKeyIDForDeviceID:(id)a3
{
  OSStatus v3 = [(SDAutoUnlockAKSManager *)self ltkInfoForDeviceID:a3];
  if ([v3 hasLtkID])
  {
    id v4 = objc_alloc((Class)NSUUID);
    id v5 = [v3 ltkID];
    id v6 = [v4 initWithUUIDBytes:[v5 bytes]];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)ltkInfoForDeviceID:(id)a3
{
  return [(SDAutoUnlockAKSManager *)self ltkInfoForDeviceID:a3 modern:0];
}

- (id)ltkInfoForDeviceID:(id)a3 modern:(BOOL)a4
{
  return [(SDAutoUnlockAKSManager *)self ltkInfoForDeviceID:a3 modern:a4 attested:0];
}

- (id)ltkInfoForDeviceID:(id)a3 modern:(BOOL)a4 attested:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v5)
  {
    uint64_t v9 = [(SDAutoUnlockAKSManager *)self attestedDictionaryForDevice:v8];
  }
  else
  {
    if (v6) {
      [(SDAutoUnlockAKSManager *)self modernSyncedDictionaryForDevice:v8];
    }
    else {
    uint64_t v9 = [(SDAutoUnlockAKSManager *)self syncedDictionaryForDevice:v8];
    }
  }
  CFDictionaryRef v10 = (void *)v9;
  OSStatus v11 = [(SDAutoUnlockAKSManager *)self keychainDataForQuery:v9];
  if (v11) {
    int v12 = [[SDAutoUnlockLTKInfo alloc] initWithData:v11];
  }
  else {
    int v12 = 0;
  }

  return v12;
}

- (void)deleteLocalAttestedLTK
{
  OSStatus v3 = [(SDAutoUnlockAKSManager *)self localDeviceID];
  CFDictionaryRef v4 = [(SDAutoUnlockAKSManager *)self attestedDictionaryForDevice:v3];

  OSStatus v5 = SecItemDelete(v4);
  if (v5 != -25300)
  {
    if (v5)
    {
      BOOL v6 = auto_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100122E98();
      }
    }
    else
    {
      BOOL v6 = auto_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleted local attested LTK", v7, 2u);
      }
    }
  }
}

- (void)updateRangingKeysIfNeccesary
{
  OSStatus v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 deviceWasUnlockedOnce];

  if (v4)
  {
    CFTypeRef result = 0;
    OSStatus v5 = [(SDAutoUnlockAKSManager *)self baseRangingDictionary];
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
    [v5 setObject:kSecAttrSynchronizableAny forKeyedSubscript:kSecAttrSynchronizable];
    [v5 setObject:kSecMatchLimitAll forKeyedSubscript:kSecMatchLimit];
    if (!SecItemCopyMatching((CFDictionaryRef)v5, &result))
    {
      id v16 = v5;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      BOOL v6 = (id)result;
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v24 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            OSStatus v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            int v12 = [v11 objectForKeyedSubscript:kSecAttrIsInvisible];

            if (!v12)
            {
              BOOL v13 = [v11 objectForKeyedSubscript:kSecAttrService];
              if (v13)
              {
                id v14 = [(SDAutoUnlockAKSManager *)self rangingKeyForDeviceID:v13];
                if (v14)
                {
                  __int16 v15 = auto_unlock_log();
                  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    CFStringRef v23 = v13;
                    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating session key (device id: %@)", buf, 0xCu);
                  }

                  [(SDAutoUnlockAKSManager *)self storeRangingKey:v14 forDeviceID:v13];
                }
              }
            }
          }
          id v8 = [v6 countByEnumeratingWithState:&v17 objects:v24 count:16];
        }
        while (v8);
      }

      OSStatus v5 = v16;
    }
  }
}

- (void)updateSessionKeys
{
  OSStatus v3 = objc_opt_new();
  unsigned int v4 = +[SDAutoUnlockTransport sharedTransport];
  OSStatus v5 = [v4 enabledAutoUnlockDevicesUsingCache:0];
  BOOL v6 = [v5 allObjects];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      OSStatus v11 = 0;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v11) uniqueID];
        [v3 addObject:v12];

        OSStatus v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v9);
  }

  id v13 = v3;
  os_unfair_lock_t lock = &self->_cachedSessionKeysLock;
  os_unfair_lock_lock(&self->_cachedSessionKeysLock);
  id v14 = [(SDAutoUnlockAKSManager *)self cachedSessionKeys];

  if (!v14)
  {
    __int16 v15 = objc_opt_new();
    [(SDAutoUnlockAKSManager *)self setCachedSessionKeys:v15];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v16 = v13;
  id v17 = [v16 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      long long v20 = 0;
      do
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v20);
        id v22 = [(SDAutoUnlockAKSManager *)self cachedSessionKeys];
        CFStringRef v23 = [v22 objectForKeyedSubscript:v21];

        if (!v23)
        {
          __int16 v24 = [(SDAutoUnlockAKSManager *)self rangingKeyForDeviceID:v21];
          if (v24)
          {
            id v25 = [(SDAutoUnlockAKSManager *)self deriveKeyFromSharedSecret:v24];
            __int16 v26 = [(SDAutoUnlockAKSManager *)self cachedSessionKeys];
            [v26 setObject:v25 forKeyedSubscript:v21];
          }
        }
        long long v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v18);
  }

  id v27 = auto_unlock_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v28 = [(SDAutoUnlockAKSManager *)self cachedSessionKeys];
    int v29 = [v28 allKeys];
    *(_DWORD *)buf = 138412290;
    CFStringRef v40 = v29;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Cached session keys for devices %@", buf, 0xCu);
  }
  os_unfair_lock_unlock(lock);
}

- (id)deriveKeyFromSharedSecret:(id)a3
{
  if (a3)
  {
    memset(v6, 0, sizeof(v6));
    id v3 = a3;
    [v3 bytes];
    [v3 length];

    CryptoHKDF();
    unsigned int v4 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v6, 32, v6);
  }
  else
  {
    unsigned int v4 = 0;
  }

  return v4;
}

- (BOOL)sessionKeyExistsForDeviceID:(id)a3
{
  id v3 = [(SDAutoUnlockAKSManager *)self sessionKeyForDeviceID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)sessionKeyForDeviceID:(id)a3
{
  id v4 = a3;
  p_cachedSessionKeysLock = &self->_cachedSessionKeysLock;
  os_unfair_lock_lock(&self->_cachedSessionKeysLock);
  if (v4)
  {
    BOOL v6 = [(SDAutoUnlockAKSManager *)self cachedSessionKeys];
    id v7 = [v6 objectForKeyedSubscript:v4];

    if (!v7)
    {
      id v8 = [(SDAutoUnlockAKSManager *)self rangingKeyForDeviceID:v4];
      if (v8)
      {
        id v7 = [(SDAutoUnlockAKSManager *)self deriveKeyFromSharedSecret:v8];
        id v9 = [(SDAutoUnlockAKSManager *)self cachedSessionKeys];
        [v9 setObject:v7 forKeyedSubscript:v4];
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  else
  {
    uint64_t v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100122F00();
    }

    id v7 = 0;
  }
  os_unfair_lock_unlock(p_cachedSessionKeysLock);

  return v7;
}

- (id)rangingKeyForDeviceID:(id)a3
{
  id v4 = [(SDAutoUnlockAKSManager *)self baseRangingDictionaryForDevice:a3];
  OSStatus v5 = [(SDAutoUnlockAKSManager *)self keychainDataForQuery:v4];

  return v5;
}

- (BOOL)storeRangingKey:(id)a3 forDeviceID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SDAutoUnlockAKSManager *)self baseRangingDictionaryForDevice:v6];
  id v9 = objc_opt_new();
  [v9 setObject:v7 forKeyedSubscript:kSecValueData];

  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrIsInvisible];
  int IsRealityDevice = SFDeviceIsRealityDevice();
  OSStatus v11 = &kSecAttrAccessibleAfterFirstUnlock;
  if (IsRealityDevice) {
    OSStatus v11 = &kSecAttrAccessibleAlways;
  }
  [v9 setObject:*v11 forKeyedSubscript:kSecAttrAccessible];
  id v12 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v8];
  [v12 addEntriesFromDictionary:v9];
  id v13 = auto_unlock_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138413059;
    id v18 = v6;
    __int16 v19 = 2113;
    long long v20 = v8;
    __int16 v21 = 2113;
    id v22 = v9;
    __int16 v23 = 2113;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Storing Session Key (deviceID: %@ attributes: %{private}@, update: %{private}@, add: %{private}@)", (uint8_t *)&v17, 0x2Au);
  }

  BOOL v14 = [(SDAutoUnlockAKSManager *)self storeKeychainItemWithAttributeDictionary:v8 updateDictionary:v9 addDictionary:v12];
  if (v14)
  {
    os_unfair_lock_lock(&self->_cachedSessionKeysLock);
    __int16 v15 = [(SDAutoUnlockAKSManager *)self cachedSessionKeys];
    [v15 removeObjectForKey:v6];

    os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
    [(SDAutoUnlockAKSManager *)self removeDeviceIDMissingSessionKey:v6];
    [(SDAutoUnlockAKSManager *)self updateSessionKeys];
  }

  return v14;
}

- (void)deleteRangingKeyForDeviceID:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = [(SDAutoUnlockAKSManager *)self baseRangingDictionaryForDevice:v4];
  OSStatus v6 = SecItemDelete(v5);
  if (v6 != -25300)
  {
    if (v6)
    {
      id v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100122F34();
      }
    }
    else
    {
      id v7 = auto_unlock_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleting session key (device ID: %@)", (uint8_t *)&v10, 0xCu);
      }

      os_unfair_lock_lock(&self->_cachedSessionKeysLock);
      id v8 = [(SDAutoUnlockAKSManager *)self cachedSessionKeys];
      [v8 removeObjectForKey:v4];

      os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
      [(SDAutoUnlockAKSManager *)self removeDeviceIDMissingSessionKey:v4];
      [(SDAutoUnlockAKSManager *)self updateSessionKeys];
    }
  }
}

- (void)deleteAllRangingKeys
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deleting all ranging keys", buf, 2u);
  }

  id v4 = [(SDAutoUnlockAKSManager *)self baseDictionary];
  [v4 setObject:@"com.apple.continuity.auto-unlock.rangingkeys" forKeyedSubscript:kSecAttrAccount];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecUseDataProtectionKeychain];
  OSStatus v5 = SecItemDelete((CFDictionaryRef)v4);
  if (v5 != -25300)
  {
    if (v5)
    {
      id v8 = auto_unlock_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100122F9C();
      }
    }
    else
    {
      OSStatus v6 = auto_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleted all ranging keys", v9, 2u);
      }

      os_unfair_lock_lock(&self->_cachedSessionKeysLock);
      id v7 = [(SDAutoUnlockAKSManager *)self cachedSessionKeys];
      [v7 removeAllObjects];

      os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
      [(SDAutoUnlockAKSManager *)self clearAllDeviceIDsMissingSessionKeys];
    }
  }
}

- (id)keychainDataForQuery:(id)a3
{
  CFTypeRef result = 0;
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v3];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
  OSStatus v5 = SecItemCopyMatching((CFDictionaryRef)v4, &result);
  if (v5 != -25300)
  {
    OSStatus v6 = v5;
    if (!v5)
    {
      id v7 = (void *)result;
      goto LABEL_8;
    }
    id v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Query status: %d", buf, 8u);
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)baseRangingDictionaryForDevice:(id)a3
{
  id v4 = a3;
  OSStatus v5 = [(SDAutoUnlockAKSManager *)self baseRangingDictionary];
  [v5 setObject:v4 forKeyedSubscript:kSecAttrService];

  return v5;
}

- (id)baseRangingDictionary
{
  CFDictionaryRef v2 = [(SDAutoUnlockAKSManager *)self baseDictionary];
  [v2 setObject:@"com.apple.continuity.auto-unlock.rangingkeys" forKeyedSubscript:kSecAttrAccount];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecUseDataProtectionKeychain];

  return v2;
}

- (id)syncedDictionaryForDevice:(id)a3
{
  id v4 = a3;
  OSStatus v5 = [(SDAutoUnlockAKSManager *)self baseSyncedDictionary];
  [v5 setObject:v4 forKeyedSubscript:kSecAttrService];

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrIsInvisible];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];

  return v5;
}

- (id)baseSyncedDictionary
{
  CFDictionaryRef v2 = [(SDAutoUnlockAKSManager *)self baseDictionary];
  [v2 setObject:@"com.apple.continuity.auto-unlock.sync" forKeyedSubscript:kSecAttrAccount];

  return v2;
}

- (id)modernSyncedDictionaryForDevice:(id)a3
{
  id v4 = a3;
  OSStatus v5 = [(SDAutoUnlockAKSManager *)self baseModernSyncedDictionary];
  [v5 setObject:v4 forKeyedSubscript:kSecAttrService];

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrIsInvisible];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];

  return v5;
}

- (id)attestedDictionaryForDevice:(id)a3
{
  id v4 = a3;
  OSStatus v5 = [(SDAutoUnlockAKSManager *)self baseDictionary];
  [v5 setObject:@"com.apple.continuity.auto-unlock.attested" forKeyedSubscript:kSecAttrAccount];
  [v5 setObject:v4 forKeyedSubscript:kSecAttrService];

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrIsInvisible];

  return v5;
}

- (id)baseModernSyncedDictionary
{
  CFDictionaryRef v2 = [(SDAutoUnlockAKSManager *)self baseDictionary];
  [v2 setObject:@"com.apple.continuity.auto-unlock.sync" forKeyedSubscript:kSecAttrAccount];
  [v2 setObject:@"AutoUnlock" forKeyedSubscript:kSecAttrSyncViewHint];

  return v2;
}

- (id)baseLocalKeysDictionaryForDevice:(id)a3 type:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SDAutoUnlockAKSManager *)self baseLocalKeysDictionary];
  [v8 setObject:v7 forKeyedSubscript:kSecAttrService];

  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:kSecAttrKeyType];
  }

  return v8;
}

- (id)baseLocalKeysDictionary
{
  CFDictionaryRef v2 = [(SDAutoUnlockAKSManager *)self baseDictionary];
  [v2 setObject:@"com.apple.continuity.auto-unlock.localkeys" forKeyedSubscript:kSecAttrAccount];

  return v2;
}

- (id)baseDictionary
{
  CFDictionaryRef v2 = objc_opt_new();
  [v2 setObject:kSecClassGenericPassword forKeyedSubscript:kSecClass];
  [v2 setObject:@"com.apple.continuity.unlock" forKeyedSubscript:kSecAttrAccessGroup];

  return v2;
}

- (void)updateDynamicStoreEnabled
{
  id v3 = +[SDAutoUnlockTransport sharedTransport];
  id v6 = [v3 activeDevice];

  if (v6)
  {
    id v4 = [v6 uniqueIDOverride];
    uint64_t v5 = [(SDAutoUnlockAKSManager *)self deviceEnabledAsKey:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  sub_1000D2CD4(v5);
}

- (NSString)localDeviceID
{
  return self->_localDeviceID;
}

- (void)setLocalDeviceID:(id)a3
{
}

- (void)setState:(id)a3
{
}

- (BOOL)wristDetectDisabled
{
  return self->_wristDetectDisabled;
}

- (void)setWristDetectDisabled:(BOOL)a3
{
  self->_wristDetectDisabled = a3;
}

- (NSMutableDictionary)activeAKSSessions
{
  return self->_activeAKSSessions;
}

- (void)setActiveAKSSessions:(id)a3
{
}

- (NSData)localAttestedLTK
{
  return self->_localAttestedLTK;
}

- (void)setLocalAttestedLTK:(id)a3
{
}

- (BOOL)autoUnlockDisabledDueToManagement
{
  return self->_autoUnlockDisabledDueToManagement;
}

- (void)setAutoUnlockDisabledDueToManagement:(BOOL)a3
{
  self->_autoUnlockDisabledDueToManagement = a3;
}

- (BOOL)t208Machine
{
  return self->_t208Machine;
}

- (void)setT208Machine:(BOOL)a3
{
  self->_t208Machine = a3;
}

- (NSData)localLTK
{
  return self->_localLTK;
}

- (void)setLocalLTK:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (OS_dispatch_source)keybagAssertionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setKeybagAssertionTimer:(id)a3
{
}

- (NSMutableDictionary)remoteLTKs
{
  return self->_remoteLTKs;
}

- (void)setRemoteLTKs:(id)a3
{
}

- (NSMutableDictionary)cachedSessions
{
  return self->_cachedSessions;
}

- (void)setCachedSessions:(id)a3
{
}

- (NSMutableDictionary)cachedSessionKeys
{
  return self->_cachedSessionKeys;
}

- (void)setCachedSessionKeys:(id)a3
{
}

- (NSMutableDictionary)watchIDsToPairingRecords
{
  return self->_watchIDsToPairingRecords;
}

- (void)setWatchIDsToPairingRecords:(id)a3
{
}

- (NSMutableDictionary)preferredRemoteLTKForDeviceID
{
  return self->_preferredRemoteLTKForDeviceID;
}

- (void)setPreferredRemoteLTKForDeviceID:(id)a3
{
}

- (NSMutableDictionary)escrowSecretForDeviceID
{
  return self->_escrowSecretForDeviceID;
}

- (void)setEscrowSecretForDeviceID:(id)a3
{
}

- (NSMutableArray)watchIDsMissingSessionKey
{
  return self->_watchIDsMissingSessionKey;
}

- (void)setWatchIDsMissingSessionKey:(id)a3
{
}

- (void)setRemoteLTKStorageFilePath:(id)a3
{
}

- (void)setWatchIDsToPairingRecordsStorageFilePath:(id)a3
{
}

- (id)keybagAssertion
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setKeybagAssertion:(id)a3
{
}

- (void)setCompanionIDStorageFilePath:(id)a3
{
}

- (void)setWatchIDToCompanionIDStorageFilePath:(id)a3
{
}

- (os_unfair_lock_s)cachedSessionKeysLock
{
  return self->_cachedSessionKeysLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchIDToCompanionIDStorageFilePath, 0);
  objc_storeStrong((id *)&self->_companionIDStorageFilePath, 0);
  objc_storeStrong(&self->_keybagAssertion, 0);
  objc_storeStrong((id *)&self->_watchIDsToPairingRecordsStorageFilePath, 0);
  objc_storeStrong((id *)&self->_remoteLTKStorageFilePath, 0);
  objc_storeStrong((id *)&self->_watchIDsMissingSessionKey, 0);
  objc_storeStrong((id *)&self->_escrowSecretForDeviceID, 0);
  objc_storeStrong((id *)&self->_preferredRemoteLTKForDeviceID, 0);
  objc_storeStrong((id *)&self->_watchIDsToPairingRecords, 0);
  objc_storeStrong((id *)&self->_cachedSessionKeys, 0);
  objc_storeStrong((id *)&self->_cachedSessions, 0);
  objc_storeStrong((id *)&self->_remoteLTKs, 0);
  objc_storeStrong((id *)&self->_keybagAssertionTimer, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_localLTK, 0);
  objc_storeStrong((id *)&self->_localAttestedLTK, 0);
  objc_storeStrong((id *)&self->_activeAKSSessions, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_localDeviceID, 0);
}

@end