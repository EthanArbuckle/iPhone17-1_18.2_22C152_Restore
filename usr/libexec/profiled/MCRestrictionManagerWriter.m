@interface MCRestrictionManagerWriter
+ (BOOL)restrictionsAlreadyInstalledFromPayload:(id)a3;
+ (id)enforcedAppWhitelistRestrictions;
+ (id)sharedManager;
- (BOOL)memberQueueCheckPasscodeCompliesWithCurrentRestrictions;
- (BOOL)memberQueueCheckPasscodeCompliesWithProfileRestrictions;
- (BOOL)memberQueueIsPasscodeComplianceMandatoryWithOutLocalizedWarning:(id *)a3;
- (BOOL)memberQueueRecomputeEffectiveUserSettingsPasscode:(id)a3 credentialSet:(id)a4;
- (BOOL)memberQueueSetAllClientRestrictions:(id)a3 sender:(id)a4 outRestrictionsChanged:(BOOL *)a5 outEffectiveSettingsChanged:(BOOL *)a6 outError:(id *)a7;
- (BOOL)memberQueueSetParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 sender:(id)a9;
- (BOOL)memberQueueSetSystemClientRestrictions:(id)a3 userClientRestrictions:(id)a4 sender:(id)a5 outRestrictionsChanged:(BOOL *)a6 outEffectiveSettingsChanged:(BOOL *)a7 outError:(id *)a8;
- (BOOL)recomputeNagMetadata;
- (BOOL)recomputeNagMetadata:(BOOL *)a3;
- (BOOL)removeOrphanedClientRestrictions;
- (BOOL)setAllClientRestrictions:(id)a3 sender:(id)a4 outRestrictionsChanged:(BOOL *)a5 outEffectiveSettingsChanged:(BOOL *)a6 outRecomputedNag:(BOOL *)a7 outError:(id *)a8;
- (BOOL)setClientRestrictions:(id)a3 clientType:(id)a4 clientUUID:(id)a5 sender:(id)a6 localizedClientDescription:(id)a7 localizedWarning:(id)a8 outRestrictionsChanged:(BOOL *)a9 outEffectiveSettingsChanged:(BOOL *)a10 outRecomputedNag:(BOOL *)a11 outError:(id *)a12;
- (BOOL)setClientRestrictions:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 system:(BOOL)a6 clientType:(id)a7 clientUUID:(id)a8 sender:(id)a9 localizedClientDescription:(id)a10 localizedWarning:(id)a11 shouldRecomputeNag:(BOOL)a12 outRestrictionsChanged:(BOOL *)a13 outEffectiveSettingsChanged:(BOOL *)a14 outRecomputedNag:(BOOL *)a15 outError:(id *)a16;
- (BOOL)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 sender:(id)a9;
- (BOOL)setParametersForSettingsByType:(id)a3 sender:(id)a4;
- (BOOL)setSystemProfileRestrictions:(id)a3 userProfileRestrictions:(id)a4 sender:(id)a5 outRestrictionsChanged:(BOOL *)a6 outEffectiveSettingsChanged:(BOOL *)a7 outAppWhitelistSettingsChanged:(BOOL *)a8 outRecomputedNag:(BOOL *)a9 outError:(id *)a10;
- (NSDictionary)clientTypeLoaders;
- (NSMutableSet)memberQueueRecomputePasscodeComplianceForClientUUID;
- (NSNumber)memberQueuePasscodeCompliesWithProfileRestrictions;
- (NSNumber)memberQueuePasscodeCompliesWithRestrictions;
- (id)_init;
- (id)_liveClientUUIDsForClientType:(id)a3 outLoaderMissing:(BOOL *)a4;
- (id)_memberQueueNewUserSettingsWithParametersForSettingsByType:(id)a3 currentUserSettings:(id)a4;
- (id)orphanCheckExemptClientTypes;
- (id)orphanCheckUnexemptClientTypes;
- (id)orphanedClientUUIDsForClientRestrictionDictionary:(id)a3;
- (int)senderPID;
- (void)clearAllPasscodeComplianceCaches;
- (void)memberQueueCacheClientRestrictionPasscodeCompliance;
- (void)memberQueueClearAllPasscodeComplianceCaches;
- (void)memberQueueClearPasscodeHistoryIfNecessary;
- (void)memberQueueClearProfileRestrictionPasscodeComplianceCache;
- (void)memberQueueClearRestrictionPasscodeComplianceCache;
- (void)memberQueueCommitClientRestrictionsToDisk;
- (void)memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings:(id)a3;
- (void)memberQueueCommitRestrictionsToDisk;
- (void)memberQueueCommitUserSettingsToDisk;
- (void)memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:(id)a3 newSystemClientRestrictions:(id)a4;
- (void)notifyClientsToRecomputeCompliance;
- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3;
- (void)recomputeEffectiveUserSettingsPasscode:(id)a3;
- (void)recomputeUserRestrictionsAndEffectiveUserSettings;
- (void)removeBoolSetting:(id)a3 sender:(id)a4;
- (void)removeValueSetting:(id)a3 sender:(id)a4;
- (void)resetAllSettingsToDefaultsSender:(id)a3;
- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 sender:(id)a6;
- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 sender:(id)a5;
- (void)setIntersectionValues:(id)a3 forSetting:(id)a4 sender:(id)a5;
- (void)setMemberQueuePasscodeCompliesWithProfileRestrictions:(id)a3;
- (void)setMemberQueuePasscodeCompliesWithRestrictions:(id)a3;
- (void)setMemberQueueRecomputePasscodeComplianceForClientUUID:(id)a3;
- (void)setSenderPID:(int)a3;
- (void)setShowNagMessage;
- (void)setUnionValues:(id)a3 forSetting:(id)a4 sender:(id)a5;
- (void)setUserInfo:(id)a3 forClientUUID:(id)a4;
- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 sender:(id)a5;
- (void)setValue:(id)a3 forSetting:(id)a4 sender:(id)a5;
@end

@implementation MCRestrictionManagerWriter

+ (id)sharedManager
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MCRestrictionManagerWriter;
  v2 = [super sharedManager];

  return v2;
}

+ (id)enforcedAppWhitelistRestrictions
{
  if (qword_1001059F8 != -1) {
    dispatch_once(&qword_1001059F8, &stru_1000EC110);
  }
  v2 = (void *)qword_1001059F0;

  return v2;
}

- (id)_init
{
  v4.receiver = self;
  v4.super_class = (Class)MCRestrictionManagerWriter;
  v2 = [(MCRestrictionManagerWriter *)&v4 init];
  if (v2) {
    v2->_senderPID = getpid();
  }
  return v2;
}

- (void)memberQueueCommitRestrictionsToDisk
{
  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Committing restrictions.", v8, 2u);
  }
  objc_super v4 = [(MCRestrictionManagerWriter *)self memberQueueRestrictions];
  v5 = MCRestrictionsFilePath();
  [v4 MCWriteToBinaryFile:v5];

  v6 = [(MCRestrictionManagerWriter *)self memberQueueSettingsEvents];
  v7 = MCSettingsEventsFilePath();
  [v6 MCWriteToBinaryFile:v7];
}

- (BOOL)setSystemProfileRestrictions:(id)a3 userProfileRestrictions:(id)a4 sender:(id)a5 outRestrictionsChanged:(BOOL *)a6 outEffectiveSettingsChanged:(BOOL *)a7 outAppWhitelistSettingsChanged:(BOOL *)a8 outRecomputedNag:(BOOL *)a9 outError:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_100077CCC;
  v44 = sub_100077CDC;
  id v45 = 0;
  v19 = [(MCRestrictionManagerWriter *)self memberQueue];
  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  v29 = sub_100077CE4;
  v30 = &unk_1000EC138;
  v31 = self;
  id v20 = v16;
  id v32 = v20;
  id v21 = v17;
  id v33 = v21;
  id v22 = v18;
  v38 = a6;
  v39 = a7;
  id v34 = v22;
  v35 = &v46;
  v36 = &v40;
  v37 = a8;
  dispatch_sync(v19, &v27);

  BOOL v23 = [(MCRestrictionManagerWriter *)self recomputeNagMetadata];
  if (a9) {
    *a9 = v23;
  }
  int v24 = *((unsigned __int8 *)v47 + 24);
  if (a10 && !*((unsigned char *)v47 + 24))
  {
    *a10 = (id) v41[5];
    int v24 = *((unsigned __int8 *)v47 + 24);
  }
  BOOL v25 = v24 != 0;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v25;
}

- (void)memberQueueCommitClientRestrictionsToDisk
{
  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Committing client restrictions.", v10, 2u);
  }
  objc_super v4 = [(MCRestrictionManagerWriter *)self memberQueueSystemClientRestrictions];
  v5 = MCSystemClientRestrictionsFilePath();
  [v4 MCWriteToBinaryFile:v5];

  v6 = [(MCRestrictionManagerWriter *)self memberQueueUserClientRestrictions];
  v7 = MCUserClientRestrictionsFilePath();
  [v6 MCWriteToBinaryFile:v7];

  v8 = [(MCRestrictionManagerWriter *)self memberQueueSettingsEvents];
  v9 = MCSettingsEventsFilePath();
  [v8 MCWriteToBinaryFile:v9];
}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4
{
}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 sender:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Setting user info %{public}@ for client uuid %{public}@", buf, 0x16u);
  }
  if (v9)
  {
    v12 = [(MCRestrictionManagerWriter *)self memberQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000784B8;
    v13[3] = &unk_1000EC160;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    id v16 = v10;
    dispatch_sync(v12, v13);
  }
}

- (BOOL)memberQueueSetAllClientRestrictions:(id)a3 sender:(id)a4 outRestrictionsChanged:(BOOL *)a5 outEffectiveSettingsChanged:(BOOL *)a6 outError:(id *)a7
{
  id v12 = a4;
  id v13 = a3;
  id v14 = [(MCRestrictionManagerWriter *)self memberQueueUserClientRestrictions];
  LOBYTE(a7) = [(MCRestrictionManagerWriter *)self memberQueueSetSystemClientRestrictions:v13 userClientRestrictions:v14 sender:v12 outRestrictionsChanged:a5 outEffectiveSettingsChanged:a6 outError:a7];

  return (char)a7;
}

- (BOOL)memberQueueSetSystemClientRestrictions:(id)a3 userClientRestrictions:(id)a4 sender:(id)a5 outRestrictionsChanged:(BOOL *)a6 outEffectiveSettingsChanged:(BOOL *)a7 outError:(id *)a8
{
  id v41 = a3;
  id v12 = a4;
  id v13 = a5;
  BOOL v42 = 0;
  id v14 = [(MCRestrictionManagerWriter *)self memberQueueRestrictions];
  id v15 = [v14 copy];

  id v16 = [(MCRestrictionManagerWriter *)self memberQueueSystemClientRestrictions];
  id v40 = [v16 copy];

  id v17 = [(MCRestrictionManagerWriter *)self memberQueueRestrictions];
  id v18 = [(MCRestrictionManagerWriter *)self defaultRestrictions];
  __int16 v19 = [(MCRestrictionManagerWriter *)self memberQueueSystemProfileRestrictions];
  id v20 = [(MCRestrictionManagerWriter *)self memberQueueUserProfileRestrictions];
  v35 = a8;
  id v21 = v12;
  id v22 = v41;
  BOOL v23 = +[MCRestrictionManagerWriter restrictionsWithCurrentRestrictions:v17 defaultRestrictions:v18 systemProfileRestrictions:v19 userProfileRestrictions:v20 systemClientRestrictions:v41 userClientRestrictions:v12 outRestrictionsChanged:&v42 outError:v35];

  if (v23)
  {
    unsigned __int8 v24 = [(MCRestrictionManagerWriter *)self applyConfiguration:v41 toDomain:8 inNamespace:0 fromSender:v13];
    v37 = v21;
    unsigned int v25 = [(MCRestrictionManagerWriter *)self applyConfiguration:v21 toDomain:9 inNamespace:0 fromSender:v13];
    [(MCRestrictionManagerWriter *)self applyConfiguration:v23 toDomain:5 inNamespace:0 fromSender:v13];
    [(MCRestrictionManagerWriter *)self memberQueueCommitClientRestrictionsToDisk];
    [(MCRestrictionManagerWriter *)self memberQueueCommitRestrictionsToDisk];
    v26 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
    id v27 = [v26 MCDeepCopy];

    BOOL v36 = [(MCRestrictionManagerWriter *)self memberQueueRecomputeEffectiveUserSettingsPasscode:0 credentialSet:0];
    uint64_t v28 = +[MCHacks sharedHacks];
    v29 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
    [v28 _applyServerSideChangesWithOldRestrictions:v15 newRestrictions:v23 oldEffectiveUserSettings:v27 newEffectiveUserSettings:v29];

    if ((v24 & 1) != 0 || v25)
    {
      [(MCRestrictionManagerWriter *)self memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:v40 newSystemClientRestrictions:v41];
      MCSendClientTruthChangedNotification();
    }
    if (v42)
    {
      MCSendRestrictionChangedNotification();
      if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:v15 newRestrictions:v23])
      {
        [(MCRestrictionManagerWriter *)self memberQueueClearPasscodeHistoryIfNecessary];
        [(MCRestrictionManagerWriter *)self memberQueueClearRestrictionPasscodeComplianceCache];
        MCSendPasscodePolicyChangedNotification();
      }
      uint64_t v30 = MCFeatureNotificationRestrictedApps;
      v31 = +[MCRestrictionManager unionValuesForFeature:MCFeatureNotificationRestrictedApps withRestrictionsDictionary:v15];
      id v32 = +[MCRestrictionManager unionValuesForFeature:v30 withRestrictionsDictionary:v23];
      unsigned __int8 v33 = [v31 isEqualToArray:v32];

      if ((v33 & 1) == 0) {
        MCSendUserNotificationsSettingsChangedNotification();
      }
    }
    if (a6) {
      *a6 = v42;
    }
    id v22 = v41;
    if (v36) {
      MCSendEffectiveSettingsChangedNotification();
    }
    if (a7) {
      *a7 = v36;
    }

    id v21 = v37;
  }

  return v23 != 0;
}

- (BOOL)setAllClientRestrictions:(id)a3 sender:(id)a4 outRestrictionsChanged:(BOOL *)a5 outEffectiveSettingsChanged:(BOOL *)a6 outRecomputedNag:(BOOL *)a7 outError:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_100077CCC;
  v38 = sub_100077CDC;
  id v39 = 0;
  id v16 = [(MCRestrictionManagerWriter *)self memberQueue];
  BOOL v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  unsigned int v25 = sub_100078BDC;
  v26 = &unk_1000EC188;
  uint64_t v30 = &v40;
  id v27 = self;
  id v17 = v14;
  id v28 = v17;
  id v18 = v15;
  id v32 = a5;
  unsigned __int8 v33 = a6;
  id v29 = v18;
  v31 = &v34;
  dispatch_sync(v16, &v23);

  BOOL v19 = [(MCRestrictionManagerWriter *)self recomputeNagMetadata];
  if (a7) {
    *a7 = v19;
  }
  int v20 = *((unsigned __int8 *)v41 + 24);
  if (a8 && !*((unsigned char *)v41 + 24))
  {
    *a8 = (id) v35[5];
    int v20 = *((unsigned __int8 *)v41 + 24);
  }
  BOOL v21 = v20 != 0;

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v21;
}

- (BOOL)setClientRestrictions:(id)a3 clientType:(id)a4 clientUUID:(id)a5 sender:(id)a6 localizedClientDescription:(id)a7 localizedWarning:(id)a8 outRestrictionsChanged:(BOOL *)a9 outEffectiveSettingsChanged:(BOOL *)a10 outRecomputedNag:(BOOL *)a11 outError:(id *)a12
{
  LOBYTE(v13) = 1;
  return [(MCRestrictionManagerWriter *)self setClientRestrictions:a3 overrideRestrictions:0 appsAndOptions:0 system:1 clientType:a4 clientUUID:a5 sender:a6 localizedClientDescription:a7 localizedWarning:a8 shouldRecomputeNag:v13 outRestrictionsChanged:a9 outEffectiveSettingsChanged:a10 outRecomputedNag:a11 outError:a12];
}

- (BOOL)setClientRestrictions:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 system:(BOOL)a6 clientType:(id)a7 clientUUID:(id)a8 sender:(id)a9 localizedClientDescription:(id)a10 localizedWarning:(id)a11 shouldRecomputeNag:(BOOL)a12 outRestrictionsChanged:(BOOL *)a13 outEffectiveSettingsChanged:(BOOL *)a14 outRecomputedNag:(BOOL *)a15 outError:(id *)a16
{
  id v21 = a3;
  id v35 = a5;
  id v22 = a7;
  id v23 = a8;
  uint64_t v24 = v21;
  id v36 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v23;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Setting client truth %{public}@ for client %{public}@", buf, 0x16u);
  }
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v57 = sub_100077CCC;
  v58 = sub_100077CDC;
  id v59 = 0;
  if (v23)
  {
    id v28 = [(MCRestrictionManagerWriter *)self memberQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100079004;
    block[3] = &unk_1000EC1B0;
    BOOL v50 = a4;
    id v38 = v22;
    id v39 = self;
    id v40 = v23;
    id v41 = v21;
    id v42 = v25;
    uint64_t v46 = &v52;
    BOOL v51 = a6;
    id v43 = v26;
    id v44 = v35;
    uint64_t v48 = a13;
    char v49 = a14;
    id v45 = v36;
    v47 = buf;
    dispatch_block_t v29 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    dispatch_sync(v28, v29);

    if (a12)
    {
      BOOL v30 = [(MCRestrictionManagerWriter *)self recomputeNagMetadata];
      if (a15) {
        *a15 = v30;
      }
    }

    int v31 = *((unsigned __int8 *)v53 + 24);
  }
  else
  {
    int v31 = 0;
  }
  if (a16 && !v31)
  {
    *a16 = *(id *)(*(void *)&buf[8] + 40);
    int v31 = *((unsigned __int8 *)v53 + 24);
  }
  BOOL v32 = v31 != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v52, 8);
  return v32;
}

- (id)orphanCheckExemptClientTypes
{
  if (qword_100105A30 != -1) {
    dispatch_once(&qword_100105A30, &stru_1000EC240);
  }
  v2 = (void *)qword_100105A08;

  return v2;
}

- (id)orphanCheckUnexemptClientTypes
{
  if (qword_100105A30 != -1) {
    dispatch_once(&qword_100105A30, &stru_1000EC240);
  }
  v2 = [(id)qword_100105A00 allKeys];
  v3 = +[NSMutableSet setWithArray:v2];
  objc_super v4 = v3;
  if (qword_100105A08) {
    [v3 minusSet:];
  }
  id v5 = [v4 copy];

  return v5;
}

- (id)_liveClientUUIDsForClientType:(id)a3 outLoaderMissing:(BOOL *)a4
{
  id v5 = a3;
  if (qword_100105A30 != -1) {
    dispatch_once(&qword_100105A30, &stru_1000EC240);
  }
  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_100105A10, v5);
  v7 = CFDictionaryGetValue((CFDictionaryRef)qword_100105A18, v5);
  if (Value)
  {
    id v8 = ((void (*)(void *, const void *, id))[Value methodForSelector:v7])(Value, v7, v5);
    id v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Called plugin to get UUIDs", (uint8_t *)&v12, 2u);
    }
    if (a4) {
LABEL_7:
    }
      *a4 = Value == 0;
  }
  else
  {
    v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "No loader was found for client type %{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v8 = 0;
    if (a4) {
      goto LABEL_7;
    }
  }

  return v8;
}

- (void)notifyClientsToRecomputeCompliance
{
  if (qword_100105A30 != -1) {
    dispatch_once(&qword_100105A30, &stru_1000EC240);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_clientTypeLoaders;
  id v4 = [(NSDictionary *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(const void **)(*((void *)&v14 + 1) + 8 * i);
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_100105A10, v8);
        id v10 = CFDictionaryGetValue((CFDictionaryRef)qword_100105A20, v8);
        if (Value) {
          BOOL v11 = v10 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11)
        {
          ((void (*)(void *, const void *, const void *))[Value methodForSelector:v10])(Value, v10, v8);
          int v12 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)id v13 = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Called plugin to recompute compliance", v13, 2u);
          }
        }
      }
      id v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (id)orphanedClientUUIDsForClientRestrictionDictionary:(id)a3
{
  id v3 = a3;
  if (qword_100105A30 != -1) {
    dispatch_once(&qword_100105A30, &stru_1000EC240);
  }
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v51;
    uint64_t v9 = kMCClientRestrictionsType;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        int v12 = [v5 objectForKey:v11];
        id v13 = [v12 objectForKey:v9];

        if (v13)
        {
          id v14 = [v4 objectForKey:v13];
          if (!v14)
          {
            id v14 = objc_alloc_init((Class)NSMutableSet);
            [v4 setObject:v14 forKey:v13];
          }
          [v14 addObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v7);
  }

  id v15 = objc_alloc_init((Class)NSMutableSet);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v16 = v4;
  id v17 = [v16 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v17)
  {
    id v19 = v17;
    uint64_t v20 = *(void *)v47;
    *(void *)&long long v18 = 138412290;
    long long v39 = v18;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
        if (objc_msgSend((id)qword_100105A08, "containsObject:", v22, v39))
        {
          id v23 = [v16 objectForKey:v22];
          uint64_t v24 = [v23 allObjects];
          [v15 addObjectsFromArray:v24];

          continue;
        }
        char v45 = 0;
        id v25 = [(MCRestrictionManagerWriter *)self _liveClientUUIDsForClientType:v22 outLoaderMissing:&v45];
        id v26 = v25;
        if (v45)
        {
          id v27 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v56 = v22;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Loader for client type %{public}@ missing. All client restrictions will be removed.", buf, 0xCu);
          }
          goto LABEL_31;
        }
        if (v25)
        {
          id v28 = [v25 allObjects];
          [v15 addObjectsFromArray:v28];
LABEL_30:

          goto LABEL_31;
        }
        if ([(id)qword_100105A28 containsObject:v22])
        {
          dispatch_block_t v29 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v39;
            uint64_t v56 = v22;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Loader for client type %@ didn't return an answer. Preserving its client restrictions.", buf, 0xCu);
          }
          id v28 = [v16 objectForKey:v22];
          BOOL v30 = [v28 allObjects];
          [v15 addObjectsFromArray:v30];

          goto LABEL_30;
        }
LABEL_31:
      }
      id v19 = [v16 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v19);
  }

  id v31 = objc_alloc_init((Class)NSMutableSet);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v32 = v5;
  id v33 = [v32 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v42;
    do
    {
      for (k = 0; k != v34; k = (char *)k + 1)
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v41 + 1) + 8 * (void)k);
        if (([v15 containsObject:v37] & 1) == 0) {
          [v31 addObject:v37];
        }
      }
      id v34 = [v32 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v34);
  }

  return v31;
}

- (BOOL)removeOrphanedClientRestrictions
{
  id v3 = [(MCRestrictionManagerWriter *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079EB4;
  block[3] = &unk_1000EAC80;
  void block[4] = self;
  dispatch_sync(v3, block);

  return [(MCRestrictionManagerWriter *)self recomputeNagMetadata];
}

- (BOOL)recomputeNagMetadata
{
  return [(MCRestrictionManagerWriter *)self recomputeNagMetadata:0];
}

- (BOOL)recomputeNagMetadata:(BOOL *)a3
{
  id v5 = +[MCPasscodeManagerWriter sharedManager];
  unsigned __int8 v6 = [v5 isDeviceLocked];
  if ((v6 & 1) == 0)
  {
    id v7 = [(MCRestrictionManagerWriter *)self memberQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10007A1F4;
    v9[3] = &unk_1000EB368;
    v9[4] = self;
    v9[5] = a3;
    dispatch_sync(v7, v9);
  }
  return v6 ^ 1;
}

- (BOOL)memberQueueCheckPasscodeCompliesWithCurrentRestrictions
{
  id v3 = [(MCRestrictionManagerWriter *)self memberQueuePasscodeCompliesWithRestrictions];

  if (v3)
  {
    id v4 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Using cached passcode compliance with restrictions", buf, 2u);
    }
    id v5 = [(MCRestrictionManagerWriter *)self memberQueuePasscodeCompliesWithRestrictions];
    unsigned __int8 v6 = [v5 BOOLValue];

    id v7 = 0;
    if (v6)
    {
LABEL_5:
      BOOL v8 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = +[MCPasscodeManagerWriter sharedManager];
    id v10 = [(MCRestrictionManagerWriter *)self memberQueueRestrictions];
    id v16 = 0;
    id v11 = [v9 currentPasscodeCompliesWithPolicyFromRestrictions:v10 outError:&v16];
    id v7 = v16;

    int v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Caching passcode compliance with restrictions", buf, 2u);
    }
    id v13 = +[NSNumber numberWithBool:v11];
    [(MCRestrictionManagerWriter *)self setMemberQueuePasscodeCompliesWithRestrictions:v13];

    if (v11) {
      goto LABEL_5;
    }
  }
  id v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current passcode does not comply with restrictions. Error: %{public}@", buf, 0xCu);
  }
  BOOL v8 = 0;
LABEL_12:

  return v8;
}

- (BOOL)memberQueueCheckPasscodeCompliesWithProfileRestrictions
{
  id v3 = [(MCRestrictionManagerWriter *)self memberQueuePasscodeCompliesWithProfileRestrictions];

  if (v3)
  {
    id v4 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Using cached passcode compliance with profile restrictions", buf, 2u);
    }
    id v5 = [(MCRestrictionManagerWriter *)self memberQueuePasscodeCompliesWithProfileRestrictions];
    unsigned __int8 v6 = [v5 BOOLValue];

    id v7 = 0;
    if (v6)
    {
LABEL_5:
      BOOL v8 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = +[MCPasscodeManagerWriter sharedManager];
    id v10 = [(MCRestrictionManagerWriter *)self memberQueueCombinedSystemProfileRestrictions];
    id v16 = 0;
    id v11 = [v9 currentPasscodeCompliesWithPolicyFromRestrictions:v10 outError:&v16];
    id v7 = v16;

    int v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Caching passcode compliance with profile restrictions", buf, 2u);
    }
    id v13 = +[NSNumber numberWithBool:v11];
    [(MCRestrictionManagerWriter *)self setMemberQueuePasscodeCompliesWithProfileRestrictions:v13];

    if (v11) {
      goto LABEL_5;
    }
  }
  id v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current passcode does not comply with profile restrictions, so making change mandatory. Error: %{public}@", buf, 0xCu);
  }
  BOOL v8 = 0;
LABEL_12:

  return v8;
}

- (BOOL)memberQueueIsPasscodeComplianceMandatoryWithOutLocalizedWarning:(id *)a3
{
  if (![(MCRestrictionManagerWriter *)self memberQueueCheckPasscodeCompliesWithProfileRestrictions])return 1; {
  BOOL v30 = a3;
  }
  uint64_t v35 = +[NSMutableArray array];
  id v32 = self;
  [(MCRestrictionManagerWriter *)self memberQueueSystemClientRestrictions];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v37;
    uint64_t v9 = kMCClientRestrictionsType;
    uint64_t v10 = kMCClientRestrictionsCompliant;
    uint64_t v31 = kMCClientRestrictionsTruth;
    uint64_t v34 = kMCClientRestrictionsLocalizedClientDescription;
    uint64_t v33 = *(void *)v37;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        id v13 = [v5 objectForKey:v12];
        uint64_t v14 = [v13 objectForKey:v9];
        if (v14) {
          id v15 = (__CFString *)v14;
        }
        else {
          id v15 = @"Unknown";
        }
        id v16 = [v13 objectForKeyedSubscript:v10];
        if (!v16)
        {
          id v17 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            long long v41 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Client restriction passcode compliance for client of type “%{public}@” was not cached when it should be. Recalculating.", buf, 0xCu);
          }
          id v18 = [(MCRestrictionManagerWriter *)v32 memberQueueRecomputePasscodeComplianceForClientUUID];
          [v18 addObject:v12];

          id v19 = [v13 objectForKey:v31];
          if (v19)
          {
            uint64_t v20 = +[MCPasscodeManagerWriter sharedManager];
            uint64_t v21 = (uint64_t)[v20 currentPasscodeCompliesWithPolicyFromRestrictions:v19 outError:0];

            uint64_t v8 = v33;
          }
          else
          {
            uint64_t v21 = 1;
          }
          id v16 = +[NSNumber numberWithBool:v21];
        }
        if (([v16 BOOLValue] & 1) == 0)
        {
          uint64_t v22 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            long long v41 = v15;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Current passcode not compliant with client of type “%{public}@”", buf, 0xCu);
          }
          if (![(__CFString *)v15 isEqualToString:@"com.apple.eas.account"])
          {

            BOOL v27 = 1;
            id v26 = v5;
            id v25 = v35;
            goto LABEL_35;
          }
          id v23 = [v13 objectForKey:v34];
          if (v23)
          {
            [v35 addObject:v23];
          }
          else
          {
            uint64_t v24 = MCLocalizedString();
            [v35 addObject:v24];

            uint64_t v8 = v33;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v25 = v35;
  if ([v35 count])
  {
    dispatch_block_t v29 = [v35 objectAtIndexedSubscript:0];
    MCLocalizedFormatByDevice();
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    MCLocalizedStringByDevice();
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v30)
  {
    id v26 = v26;
    BOOL v27 = 0;
    id *v30 = v26;
  }
  else
  {
    BOOL v27 = 0;
  }
LABEL_35:

  return v27;
}

- (void)memberQueueMarkToClearPasscodeComplianceCacheWithOldSystemClientRestrictions:(id)a3 newSystemClientRestrictions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Checking if we need to clear client restriction passcode compliance caches", buf, 2u);
  }
  uint64_t v9 = [(MCRestrictionManagerWriter *)self memberQueueRecomputePasscodeComplianceForClientUUID];

  if (v9)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v31 = v7;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v40;
      uint64_t v36 = kMCClientRestrictionsType;
      uint64_t v33 = kMCClientRestrictionsCompliant;
      uint64_t v34 = kMCClientRestrictionsTruth;
      uint64_t v35 = self;
      uint64_t v37 = *(void *)v40;
      id v38 = v10;
      id v32 = v6;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          id v16 = [(MCRestrictionManagerWriter *)self memberQueueRecomputePasscodeComplianceForClientUUID];
          unsigned __int8 v17 = [v16 containsObject:v15];

          if ((v17 & 1) == 0)
          {
            id v18 = [v10 objectForKey:v15];
            uint64_t v19 = [v18 objectForKey:v36];
            if (v19) {
              uint64_t v20 = (__CFString *)v19;
            }
            else {
              uint64_t v20 = @"Unknown";
            }
            uint64_t v21 = [v6 objectForKey:v15];
            uint64_t v22 = v21;
            if (v21)
            {
              id v23 = [v21 objectForKeyedSubscript:v33];
              if (v23)
              {
                uint64_t v24 = [v18 objectForKey:v34];
                if (v24 || ![v23 BOOLValue])
                {
                  BOOL v27 = [v22 objectForKey:v34];
                  if (+[MCPasscodeManagerWriter didPasscodePolicyChangeWithOldRestrictions:v27 newRestrictions:v24])
                  {
                    id v28 = _MCLogObjects[0];
                    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      long long v44 = v20;
                      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Passcode policy changed for client of type “%{public}@”. Clearing passcode compliance cache.", buf, 0xCu);
                    }
                    dispatch_block_t v29 = [(MCRestrictionManagerWriter *)v35 memberQueueRecomputePasscodeComplianceForClientUUID];
                    [v29 addObject:v15];

                    id v6 = v32;
                  }
                }
                else
                {
                  id v25 = _MCLogObjects[0];
                  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    long long v44 = v20;
                    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Client of type “%{public}@” has no restrictions and was previously compliant. No need to clear passcode compliance cache.", buf, 0xCu);
                  }
                }
              }
              else
              {
                BOOL v30 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  long long v44 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Client of type “%{public}@” has no previous cached compliance; marking it to recalculate compliance.",
                    buf,
                    0xCu);
                }
                uint64_t v24 = [(MCRestrictionManagerWriter *)self memberQueueRecomputePasscodeComplianceForClientUUID];
                [v24 addObject:v15];
              }

              self = v35;
            }
            else
            {
              id v26 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                long long v44 = v20;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Client of type “%{public}@” is a new client; marking it to calculate compliance.",
                  buf,
                  0xCu);
              }
              id v23 = [(MCRestrictionManagerWriter *)self memberQueueRecomputePasscodeComplianceForClientUUID];
              [v23 addObject:v15];
            }

            uint64_t v13 = v37;
            id v10 = v38;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v12);
    }

    id v7 = v31;
  }
}

- (void)memberQueueCacheClientRestrictionPasscodeCompliance
{
  uint64_t v35 = +[MCPasscodeManagerWriter sharedManager];
  id v3 = [(MCRestrictionManagerWriter *)self memberQueueSystemClientRestrictions];
  id v4 = [v3 MCMutableDeepCopy];

  id v5 = [(MCRestrictionManagerWriter *)self memberQueueRecomputePasscodeComplianceForClientUUID];

  uint64_t v33 = self;
  if (!v5)
  {
    id v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Recomputing passcode compliance for all client restrictions", buf, 2u);
    }
    id v7 = [v4 allKeys:self];
    uint64_t v9 = objc_opt_new();
    [(MCRestrictionManagerWriter *)self setMemberQueueRecomputePasscodeComplianceForClientUUID:v9];
    goto LABEL_7;
  }
  id v6 = [(MCRestrictionManagerWriter *)self memberQueueRecomputePasscodeComplianceForClientUUID];
  id v7 = [v6 allObjects];

  os_log_t v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    *(_DWORD *)buf = 134217984;
    char v45 = (__CFString *)[v7 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Recomputing passcode compliance for %lu clients", buf, 0xCu);
LABEL_7:
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v11) {
    goto LABEL_31;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v40;
  uint64_t v38 = kMCClientRestrictionsType;
  uint64_t v37 = kMCClientRestrictionsTruth;
  uint64_t v14 = kMCClientRestrictionsCompliant;
  uint64_t v34 = kMCClientRestrictionsUserInfo;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v40 != v13) {
        objc_enumerationMutation(obj);
      }
      id v16 = [v4 objectForKey:*(void *)(*((void *)&v39 + 1) + 8 * i) v33];
      unsigned __int8 v17 = v16;
      if (v16)
      {
        uint64_t v18 = [v16 objectForKey:v38];
        if (v18) {
          uint64_t v19 = (__CFString *)v18;
        }
        else {
          uint64_t v19 = @"Unknown";
        }
        uint64_t v20 = [v17 objectForKey:v37];
        if (v20)
        {
          unsigned int v21 = [v35 currentPasscodeCompliesWithPolicyFromRestrictions:v20 outError:0];
          uint64_t v22 = _MCLogObjects[0];
          BOOL v23 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
          if (v21)
          {
            if (v23)
            {
              *(_DWORD *)buf = 138543362;
              char v45 = v19;
              uint64_t v24 = v22;
              id v25 = "Passcode complies with client restrictions from client of type “%{public}@”";
              goto LABEL_23;
            }
            goto LABEL_24;
          }
          if (v23)
          {
            *(_DWORD *)buf = 138543362;
            char v45 = v19;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Passcode does not comply with client restrictions from client of type “%{public}@”", buf, 0xCu);
          }
          id v28 = +[NSNumber numberWithBool:0];
          [v17 setObject:v28 forKey:v14];

          [v17 removeObjectForKey:v34];
        }
        else
        {
          os_log_t v26 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            char v45 = v19;
            uint64_t v24 = v26;
            id v25 = "Client of type “%{public}@” has no client restrictions. Marking as compliant.";
LABEL_23:
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
          }
LABEL_24:
          BOOL v27 = +[NSNumber numberWithBool:1];
          [v17 setObject:v27 forKey:v14];
        }
      }
    }
    id v12 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  }
  while (v12);
LABEL_31:

  dispatch_block_t v29 = v33;
  if ([(MCRestrictionManagerWriter *)v33 applyConfiguration:v4 toDomain:8 inNamespace:0 fromSender:@"MCRestrictionManagerWriter.memberQueueCacheClientRestrictionPasscodeCompliance"])
  {
    [(MCRestrictionManagerWriter *)v33 memberQueueCommitClientRestrictionsToDisk];
    MCSendClientTruthChangedNotification();
  }
  BOOL v30 = [(MCRestrictionManagerWriter *)v33 memberQueueRecomputePasscodeComplianceForClientUUID];
  id v31 = [v30 count];

  if (v31)
  {
    id v32 = [(MCRestrictionManagerWriter *)v29 memberQueueRecomputePasscodeComplianceForClientUUID];
    [v32 removeAllObjects];
  }
}

- (void)memberQueueClearRestrictionPasscodeComplianceCache
{
  id v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing restriction passcode compliance cache.", v4, 2u);
  }
  [(MCRestrictionManagerWriter *)self setMemberQueuePasscodeCompliesWithRestrictions:0];
}

- (void)memberQueueClearProfileRestrictionPasscodeComplianceCache
{
  id v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing profile restriction passcode compliance cache.", v4, 2u);
  }
  [(MCRestrictionManagerWriter *)self setMemberQueuePasscodeCompliesWithProfileRestrictions:0];
}

- (void)memberQueueClearAllPasscodeComplianceCaches
{
  id v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing all passcode compliance caches", v4, 2u);
  }
  [(MCRestrictionManagerWriter *)self setMemberQueuePasscodeCompliesWithRestrictions:0];
  [(MCRestrictionManagerWriter *)self setMemberQueuePasscodeCompliesWithProfileRestrictions:0];
  [(MCRestrictionManagerWriter *)self setMemberQueueRecomputePasscodeComplianceForClientUUID:0];
}

- (void)clearAllPasscodeComplianceCaches
{
  id v3 = [(MCRestrictionManagerWriter *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007B874;
  block[3] = &unk_1000EAC80;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)memberQueueClearPasscodeHistoryIfNecessary
{
  v2 = [(MCRestrictionManagerWriter *)self memberQueueRestrictions];
  id v3 = [v2 objectForKeyedSubscript:MCRestrictedValueKey];
  id v4 = [v3 objectForKeyedSubscript:MCFeaturePasscodeHistoryCount];
  id v6 = [v4 objectForKeyedSubscript:MCRestrictedValueValueKey];

  if (![v6 unsignedIntValue])
  {
    id v5 = +[MCPasscodeManagerWriter sharedManager];
    [v5 clearPasscodeHistory];
  }
}

- (void)setShowNagMessage
{
  v2 = [(MCRestrictionManagerWriter *)self memberQueue];
  dispatch_sync(v2, &stru_1000EC1D0);
}

- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManagerWriter *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007BAD4;
  block[3] = &unk_1000EAC80;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)memberQueueCommitUserSettingsToDisk
{
  id v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Committing user settings.", v14, 2u);
  }
  id v4 = [(MCRestrictionManagerWriter *)self memberQueueSystemUserSettings];
  id v5 = MCSystemUserSettingsFilePath();
  [v4 MCWriteToBinaryFile:v5];

  id v6 = [(MCRestrictionManagerWriter *)self memberQueueSystemNamespacedUserSettings];
  id v7 = MCSystemNamespacedUserSettingsFilePath();
  [v6 MCWriteToBinaryFile:v7];

  id v8 = [(MCRestrictionManagerWriter *)self memberQueueUserUserSettings];
  uint64_t v9 = MCUserUserSettingsFilePath();
  [v8 MCWriteToBinaryFile:v9];

  id v10 = [(MCRestrictionManagerWriter *)self memberQueueUserNamespacedUserSettings];
  id v11 = MCUserNamespacedUserSettingsFilePath();
  [v10 MCWriteToBinaryFile:v11];

  id v12 = [(MCRestrictionManagerWriter *)self memberQueueSettingsEvents];
  uint64_t v13 = MCSettingsEventsFilePath();
  [v12 MCWriteToBinaryFile:v13];

  MCSendSettingsChangedNotification();
}

- (void)memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings:(id)a3
{
  id v4 = a3;
  id v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Committing effective user settings.", v17, 2u);
  }
  id v6 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
  id v7 = MCEffectiveUserSettingsFilePath();
  [v6 MCWriteToBinaryFile:v7];

  id v8 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
  uint64_t v9 = +[MCRestrictionManagerWriter filterUserSettingsForPublicUse:v8];

  id v10 = MCPublicEffectiveUserSettingsFilePath();
  [v9 MCWriteToBinaryFile:v10];

  id v11 = [(MCRestrictionManagerWriter *)self memberQueueSettingsEvents];
  id v12 = MCSettingsEventsFilePath();
  [v11 MCWriteToBinaryFile:v12];

  uint64_t v13 = +[MCHacks sharedHacks];
  uint64_t v14 = [(MCRestrictionManagerWriter *)self memberQueueRestrictions];
  uint64_t v15 = [(MCRestrictionManagerWriter *)self memberQueueRestrictions];
  id v16 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
  [v13 _applyServerSideChangesWithOldRestrictions:v14 newRestrictions:v15 oldEffectiveUserSettings:v4 newEffectiveUserSettings:v16];

  MCSendEffectiveSettingsChangedNotification();
}

- (BOOL)memberQueueRecomputeEffectiveUserSettingsPasscode:(id)a3 credentialSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MCRestrictionManagerWriter *)self memberQueueSystemUserSettings];
  id v9 = [v8 MCMutableDeepCopy];

  id v10 = [(MCRestrictionManagerWriter *)self memberQueueUserUserSettings];
  [v9 MCDeepCopyEntriesFromDictionary:v10];

  id v11 = [(MCRestrictionManagerWriter *)self memberQueueRestrictions];
  id v12 = +[MCRestrictionManager newEffectiveSettingsByApplyingRestrictions:v11 toSettings:v9];

  uint64_t v13 = +[MCHacks sharedHacks];
  [v13 _applyHeuristicsToEffectiveUserSettings:v12];

  uint64_t v14 = +[MCHacks sharedHacks];
  [v14 _applyMandatorySettingsToEffectiveUserSettings:v12];

  uint64_t v15 = [(MCRestrictionManagerWriter *)self memberQueueRestrictions];
  unsigned int v16 = +[MCRestrictionManager appWhitelistStateWithSettingsDictionary:v12 restrictionsDictionary:v15];

  if (v16 <= 5 && ((1 << v16) & 0x34) != 0)
  {
    unsigned __int8 v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Applying additional restrictions because we are enforcing shared app whitelist behavior.", buf, 2u);
    }
    uint64_t v18 = +[MCRestrictionManagerWriter enforcedAppWhitelistRestrictions];
    id v19 = +[MCRestrictionManager newEffectiveSettingsByApplyingRestrictions:v18 toSettings:v12];

    id v12 = v19;
  }
  uint64_t v20 = +[MCServerSideHacks sharedHacks];
  [v20 applyEffectiveSettings:v12 toOtherSubsystemsPasscode:v7 credentialSet:v6];

  unsigned int v21 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
  unsigned __int8 v22 = [v21 isEqualToDictionary:v12];

  if ((v22 & 1) == 0)
  {
    unsigned __int8 v62 = v22;
    BOOL v23 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
    id v24 = [v23 copy];

    [(MCRestrictionManagerWriter *)self applyConfiguration:v12 toDomain:4 inNamespace:0 fromSender:@"MCRestrictionManagerWriter.RecomputeEffectiveUserSettings"];
    [(MCRestrictionManagerWriter *)self memberQueueCommitEffectiveUserSettingsToDiskOldEffectiveUserSettings:v24];
    if (+[MCRestrictionManager intersectedValuesForFeature:MCFeatureAllowedExternalIntelligenceWorkspaceIDs changedBetweenOldRestrictions:v24 andNewRestrictions:v12])MCSendExternalIntelligenceWorkspaceListChangedNotification(); {
    if ((+[MCRestrictionManager intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAppLockBundleIDs, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAppLockMultipleAppsAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureAppLockAccessWithoutPasscodeAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager,
    }
                          "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",
                          MCFeatureAppLockGrantSupervisorAccessForced,
                          v24,
                          v12) & 1) != 0
      || +[MCRestrictionManager BOOLSetting:MCFeatureAppLockLogoutAllowed valueChangedBetweenOldSettings:v24 andNewSettings:v12])
    {
      buf[0] = 0;
      id v25 = +[MCServerSideHacks sharedHacks];
      os_log_t v26 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
      [v25 recomputeAppOptionsEffectiveUserSettings:v26 outEffectiveChangeDetected:buf];

      if (buf[0])
      {
        MCSendAppWhitelistChangedNotification();
        BOOL v27 = +[MDMClient sharedClient];
        [v27 retryNotNowResponse];
      }
    }
    id v63 = v9;
    unsigned int v28 = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:v24];
    unsigned int v29 = v28 ^ +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:v12];
    if ((v29 & 1) != 0
      || (+[MCRestrictionManager intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureWebContentFilterAutoPermittedURLs, v24, v12) & 1) != 0|| (+[MCRestrictionManager intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "intersectedValuesSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureWebContentFilterWhitelistedURLs, v24, v12) & 1) != 0|| (+[MCRestrictionManager unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "unionValuesSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureWebContentFilterBlacklistedURLs, v24, v12) & 1) != 0|| +[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager,
                         "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",
                         MCFeatureWebContentFilterAutoForced,
                         v24,
                         v12))
    {
      buf[0] = 0;
      char v64 = 0;
      BOOL v30 = +[MCServerSideHacks sharedHacks];
      id v31 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
      [v30 recomputeWebContentFilterEffectiveUserSettings:v31 outEffectiveChangeDetected:buf outMechanismChangedDetected:&v64];

      if (v64) {
        MCSendWebContentFilterTypeChangedNotification();
      }
      if (buf[0]) {
        MCSendWebContentFilterChangedNotification();
      }
      if (v29) {
        MCSendWebContentFilterUIActiveChangedNotification();
      }
    }
    if ((+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeaturePredictiveKeyboardAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureKeyboardShortcutsAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureSpellCheckAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager,
                          "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:",
                          MCFeatureAutoCorrectionAllowed,
                          v24,
                          v12) & 1) != 0
      || (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureSmartPunctuationAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureDictationAllowed, v24, v12) & 1) != 0|| +[MCRestrictionManager BOOLSetting:MCFeatureContinuousPathKeyboardAllowed valueChangedBetweenOldSettings:v24 andNewSettings:v12])
    {
      MCSendKeyboardSettingsChangedNotification();
    }
    if ((+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureNewsAllowed, v24, v12) & 1) != 0|| (+[MCRestrictionManager BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:](MCRestrictionManager, "BOOLSetting:valueChangedBetweenOldSettings:andNewSettings:", MCFeatureNewsTodayAllowed, v24, v12) & 1) != 0|| +[MCRestrictionManager BOOLSetting:MCFeatureSpotlightNewsAllowed valueChangedBetweenOldSettings:v24 andNewSettings:v12])
    {
      MCSendNewsSettingsChangedNotification();
    }
    if (+[MCRestrictionManager BOOLSetting:MCFeaturePasscodeModificationAllowed valueChangedBetweenOldSettings:v24 andNewSettings:v12])MCSendAllowPasscodeModificationChangedNotification(); {
    if (+[MCRestrictionManager unionValuesSetting:MCFeatureRemovedSystemAppBundleIDs valueChangedBetweenOldSettings:v24 andNewSettings:v12])MCSendRemovedSystemAppsChangedNotification();
    }
    if (+[MCRestrictionManager BOOLSetting:MCFeatureHealthDataSubmissionAllowed valueChangedBetweenOldSettings:v24 andNewSettings:v12])MCSendAllowHealthDataSubmissionChangedNotification(); {
    uint64_t v32 = MCFeatureBookstoreEroticaAllowed;
    }
    uint64_t v33 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
    BOOL v61 = +[MCRestrictionManager BOOLSettingForFeature:v32 withUserSettingDictionary:v33] != 2;

    uint64_t v34 = MCFeatureExplicitContentAllowed;
    uint64_t v35 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
    BOOL v60 = +[MCRestrictionManager BOOLSettingForFeature:v34 withUserSettingDictionary:v35] != 2;

    uint64_t v36 = MCFeatureSpellCheckAllowed;
    uint64_t v37 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
    BOOL v38 = +[MCRestrictionManager BOOLSettingForFeature:v36 withUserSettingDictionary:v37] != 2;

    uint64_t v39 = MCFeatureAutoCorrectionAllowed;
    long long v40 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
    BOOL v41 = +[MCRestrictionManager BOOLSettingForFeature:v39 withUserSettingDictionary:v40] != 2;

    uint64_t v42 = MCFeatureMaximumAppsRating;
    long long v43 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
    long long v44 = +[MCRestrictionManager valueSettingForFeature:v42 withUserSettingDictionary:v43];

    uint64_t v45 = MCFeatureMaximumMoviesRating;
    long long v46 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
    long long v47 = +[MCRestrictionManager valueSettingForFeature:v45 withUserSettingDictionary:v46];

    uint64_t v48 = MCFeatureMaximumTVShowsRating;
    long long v49 = [(MCRestrictionManagerWriter *)self memberQueueEffectiveUserSettings];
    long long v50 = +[MCRestrictionManager valueSettingForFeature:v48 withUserSettingDictionary:v49];

    v66[0] = MCExplicitBooksAllowedThirdPartyQuery;
    long long v51 = +[NSNumber numberWithBool:v61];
    v67[0] = v51;
    v66[1] = MCExplicitMusicPodcastsAllowedThirdPartyQuery;
    long long v52 = +[NSNumber numberWithBool:v60];
    v67[1] = v52;
    v66[2] = MCSpellCheckAllowedThirdPartyQuery;
    long long v53 = +[NSNumber numberWithBool:v38];
    v67[2] = v53;
    v66[3] = MCAutoCorrectionAllowedThirdPartyQuery;
    uint64_t v54 = +[NSNumber numberWithBool:v41];
    v67[3] = v54;
    char v55 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:4];

    id v56 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v55];
    id v57 = objc_alloc_init((Class)NSMutableArray);
    v58 = v57;
    if (v44) {
      [v56 setObject:v44 forKey:MCMaximumAppsRatingThirdPartyQuery];
    }
    else {
      [v57 addObject:MCMaximumAppsRatingThirdPartyQuery];
    }
    if (v47) {
      [v56 setObject:v47 forKey:MCMaximumMoviesRatingThirdPartyQuery];
    }
    else {
      [v58 addObject:MCMaximumMoviesRatingThirdPartyQuery];
    }
    if (v50) {
      [v56 setObject:v50 forKey:MCMaximumTVShowsRatingThirdPartyQuery];
    }
    else {
      [v58 addObject:MCMaximumTVShowsRatingThirdPartyQuery];
    }
    +[MCManagedPreferencesManager updateGlobalManagedPreferencesByAddingPreferences:v56 removingPreferences:v58];

    id v9 = v63;
    unsigned __int8 v22 = v62;
  }

  return v22 ^ 1;
}

- (id)_memberQueueNewUserSettingsWithParametersForSettingsByType:(id)a3 currentUserSettings:(id)a4
{
  id v6 = a4;
  id v7 = [a3 MCMutableDeepCopy];
  id v8 = +[MCHacks sharedHacks];
  id v9 = [(MCRestrictionManagerWriter *)self memberQueueRestrictions];
  [v8 _applyImpliedSettingsToSettingsDictionary:v7 currentSettings:v6 restrictions:v9];

  uint64_t v36 = v6;
  id v10 = [v6 MCMutableDeepCopy];
  [v10 MCDeepCopyEntriesFromDictionary:v7];
  uint64_t v11 = MCIntersectionKey;
  id v12 = [v10 objectForKey:MCIntersectionKey];
  uint64_t v13 = [v7 objectForKey:v11];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v19 = [v13 objectForKey:v18];
        id v20 = [v19 mutableCopy];
        id v21 = [v18 copy];
        [v12 setObject:v20 forKey:v21];
      }
      id v15 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v15);
  }
  uint64_t v22 = MCUnionKey;
  id v34 = v10;
  BOOL v23 = [v10 objectForKey:MCUnionKey];
  uint64_t v35 = v7;
  id v24 = [v7 objectForKey:v22];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v24);
        }
        unsigned int v29 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        BOOL v30 = [v24 objectForKey:v29];
        id v31 = [v30 mutableCopy];
        id v32 = [v29 copy];
        [v23 setObject:v31 forKey:v32];
      }
      id v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v26);
  }

  return v34;
}

- (BOOL)memberQueueSetParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 sender:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (v12)
  {
    id v20 = [(MCRestrictionManagerWriter *)self memberQueueSystemUserSettings];
    if (v16)
    {
      id v36 = v15;
      id v21 = [(MCRestrictionManagerWriter *)self memberQueueSystemNamespacedUserSettings];
      uint64_t v22 = [v21 objectForKeyedSubscript:v16];
      BOOL v23 = v22;
      if (v22) {
        id v24 = v22;
      }
      else {
        id v24 = (id)objc_opt_new();
      }
      id v26 = v24;

      id v25 = [(MCRestrictionManagerWriter *)self _memberQueueNewUserSettingsWithParametersForSettingsByType:v36 currentUserSettings:v26];
      [(MCRestrictionManagerWriter *)self applyConfiguration:v25 toDomain:1 inNamespace:v16 fromSender:v19];
      id v20 = v26;
      id v15 = v36;
    }
    else
    {
      id v25 = [(MCRestrictionManagerWriter *)self _memberQueueNewUserSettingsWithParametersForSettingsByType:v15 currentUserSettings:v20];
      [(MCRestrictionManagerWriter *)self applyConfiguration:v25 toDomain:0 inNamespace:0 fromSender:v19];
    }
  }
  if (v11)
  {
    uint64_t v27 = [(MCRestrictionManagerWriter *)self memberQueueUserUserSettings];
    if (v16)
    {
      unsigned int v28 = [(MCRestrictionManagerWriter *)self memberQueueUserNamespacedUserSettings];
      unsigned int v29 = [v28 objectForKeyedSubscript:v16];
      BOOL v30 = v29;
      if (v29) {
        id v31 = v29;
      }
      else {
        id v31 = (id)objc_opt_new();
      }
      id v33 = v31;

      id v32 = [(MCRestrictionManagerWriter *)self _memberQueueNewUserSettingsWithParametersForSettingsByType:v15 currentUserSettings:v33];
      [(MCRestrictionManagerWriter *)self applyConfiguration:v32 toDomain:3 inNamespace:v16 fromSender:v19];
      uint64_t v27 = v33;
    }
    else
    {
      id v32 = [(MCRestrictionManagerWriter *)self _memberQueueNewUserSettingsWithParametersForSettingsByType:v15 currentUserSettings:v27];
      [(MCRestrictionManagerWriter *)self applyConfiguration:v32 toDomain:2 inNamespace:0 fromSender:v19];
    }
  }
  [(MCRestrictionManagerWriter *)self memberQueueCommitUserSettingsToDisk];
  BOOL v34 = [(MCRestrictionManagerWriter *)self memberQueueRecomputeEffectiveUserSettingsPasscode:v17 credentialSet:v18];

  return v34;
}

- (BOOL)setParametersForSettingsByType:(id)a3 sender:(id)a4
{
  return [(MCRestrictionManagerWriter *)self setParametersForSettingsByType:a3 configurationUUID:0 toSystem:1 user:0 passcode:0 credentialSet:0 sender:a4];
}

- (BOOL)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 sender:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  uint64_t v37 = 0;
  long long v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  id v20 = [(MCRestrictionManagerWriter *)self memberQueue];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10007CFE0;
  v28[3] = &unk_1000EC1F8;
  id v33 = v19;
  BOOL v34 = &v37;
  v28[4] = self;
  id v29 = v15;
  BOOL v35 = a5;
  BOOL v36 = a6;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v28);
  dispatch_sync(v20, v26);

  LOBYTE(v20) = *((unsigned char *)v38 + 24);
  _Block_object_dispose(&v37, 8);
  return (char)v20;
}

- (void)setBoolValue:(BOOL)a3 forSetting:(id)a4 sender:(id)a5
{
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 sender:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  BOOL v12 = +[NSMutableDictionary dictionary];
  uint64_t v13 = +[NSNumber numberWithBool:v8];
  [v12 setObject:v13 forKeyedSubscript:MCSettingParameterValueKey];

  if (v8)
  {
    id v14 = +[NSNumber numberWithBool:v7];
    [v12 setObject:v14 forKeyedSubscript:MCSettingParameterAskKey];
  }
  else
  {
    [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:MCSettingParameterAskKey];
  }
  id v18 = v12;
  uint64_t v19 = MCRestrictedBoolKey;
  id v17 = v10;
  id v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v20 = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  [(MCRestrictionManagerWriter *)self setParametersForSettingsByType:v16 sender:v11];
}

- (void)setValue:(id)a3 forSetting:(id)a4 sender:(id)a5
{
  uint64_t v18 = MCRestrictedValueKey;
  id v15 = a3;
  id v16 = a4;
  uint64_t v14 = MCRestrictedValueValueKey;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v17 = v11;
  BOOL v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  uint64_t v19 = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  [(MCRestrictionManagerWriter *)self setParametersForSettingsByType:v13 sender:v8];
}

- (void)setIntersectionValues:(id)a3 forSetting:(id)a4 sender:(id)a5
{
  if (a3)
  {
    uint64_t v24 = MCIntersectionKey;
    id v22 = a4;
    uint64_t v20 = MCSettingParameterValuesKey;
    id v9 = a5;
    id v10 = a4;
    id v11 = [a3 copy];
    id v21 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v23 = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v25 = v13;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  }
  else
  {
    uint64_t v18 = MCIntersectionKey;
    id v16 = a4;
    id v17 = &__NSDictionary0__struct;
    id v15 = a5;
    id v12 = a4;
    id v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v19 = v11;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  }

  [(MCRestrictionManagerWriter *)self setParametersForSettingsByType:v14 sender:a5];
}

- (void)setUnionValues:(id)a3 forSetting:(id)a4 sender:(id)a5
{
  if (a3)
  {
    uint64_t v24 = MCUnionKey;
    id v22 = a4;
    uint64_t v20 = MCSettingParameterValuesKey;
    id v9 = a5;
    id v10 = a4;
    id v11 = [a3 copy];
    id v21 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v23 = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v25 = v13;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  }
  else
  {
    uint64_t v18 = MCUnionKey;
    id v16 = a4;
    id v17 = &__NSDictionary0__struct;
    id v15 = a5;
    id v12 = a4;
    id v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v19 = v11;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  }

  [(MCRestrictionManagerWriter *)self setParametersForSettingsByType:v14 sender:a5];
}

- (void)removeBoolSetting:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MCRestrictionManagerWriter *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D750;
  block[3] = &unk_1000EC220;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeValueSetting:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MCRestrictionManagerWriter *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D908;
  block[3] = &unk_1000EC220;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)resetAllSettingsToDefaultsSender:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManagerWriter *)self memberQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007DA9C;
  v7[3] = &unk_1000EAD50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)recomputeEffectiveUserSettingsPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(MCRestrictionManagerWriter *)self memberQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007DBCC;
  v7[3] = &unk_1000EAD50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)recomputeUserRestrictionsAndEffectiveUserSettings
{
  id v3 = [(MCRestrictionManagerWriter *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007DC64;
  block[3] = &unk_1000EAC80;
  void block[4] = self;
  dispatch_sync(v3, block);
}

+ (BOOL)restrictionsAlreadyInstalledFromPayload:(id)a3
{
  char v9 = 0;
  id v4 = [a3 restrictions];
  id v5 = [a1 sharedManager];
  id v6 = [v5 currentRestrictions];
  id v7 = [a1 restrictionsAfterApplyingRestrictionsDictionary:v4 toRestrictionsDictionary:v6 outChangeDetected:&v9 outError:0];

  return v9 == 0;
}

- (int)senderPID
{
  return self->_senderPID;
}

- (void)setSenderPID:(int)a3
{
  self->_senderPID = a3;
}

- (NSDictionary)clientTypeLoaders
{
  return self->_clientTypeLoaders;
}

- (NSNumber)memberQueuePasscodeCompliesWithRestrictions
{
  return self->_memberQueuePasscodeCompliesWithRestrictions;
}

- (void)setMemberQueuePasscodeCompliesWithRestrictions:(id)a3
{
}

- (NSNumber)memberQueuePasscodeCompliesWithProfileRestrictions
{
  return self->_memberQueuePasscodeCompliesWithProfileRestrictions;
}

- (void)setMemberQueuePasscodeCompliesWithProfileRestrictions:(id)a3
{
}

- (NSMutableSet)memberQueueRecomputePasscodeComplianceForClientUUID
{
  return self->_memberQueueRecomputePasscodeComplianceForClientUUID;
}

- (void)setMemberQueueRecomputePasscodeComplianceForClientUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueRecomputePasscodeComplianceForClientUUID, 0);
  objc_storeStrong((id *)&self->_memberQueuePasscodeCompliesWithProfileRestrictions, 0);
  objc_storeStrong((id *)&self->_memberQueuePasscodeCompliesWithRestrictions, 0);

  objc_storeStrong((id *)&self->_clientTypeLoaders, 0);
}

@end