@interface SSRVoiceProfileManager
+ (SSRVoiceProfileManager)sharedInstance;
+ (id)sharedInstanceWithEndpointId:(id)a3;
+ (void)clearVTEnableAfterProfileSyncFlag;
- (BOOL)_checkIfDownloadRequiredForProfileId:(id)a3;
- (BOOL)_isDirectory:(id)a3;
- (BOOL)_isLegacyEnrollmentMarkedWith:(id)a3 forLanguageCode:(id)a4;
- (BOOL)_isMarkedForVoiceProfileTrainingSyncForLanguage:(id)a3;
- (BOOL)_isRemoteVoiceTriggerAvailable;
- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3;
- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3 withBackupMetaBlob:(id)a4;
- (BOOL)isSATEnrolledForSiriProfileId:(id)a3 forLanguageCode:(id)a4;
- (BOOL)isSATEnrollmentMigratedForSiriProfileId:(id)a3 forLanguageCode:(id)a4;
- (BOOL)isSpeakerRecognitionAvailable;
- (BOOL)isVoiceTriggerRepromptRequired;
- (BOOL)triggerVoiceProfileDuplicatesCleanup;
- (NSString)lastRepromptedDate;
- (NSUUID)endpointUUID;
- (OS_dispatch_queue)queue;
- (SSRRemoteControlClient)remoteControlClient;
- (SSRVoiceProfileManager)init;
- (SSRVoiceProfileManager)initWithEndpointId:(id)a3;
- (SSRVoiceProfileManagerDelegate)delegate;
- (id)SSRBasePathForAppDomain:(id)a3;
- (id)SSRSpeakerProfilesBasePath;
- (id)_CSSATCachePath;
- (id)_CSSATCachePathForAppDomain:(id)a3;
- (id)_CSSATDownloadPath;
- (id)_CSSATLegacyUploadPath;
- (id)_CSSATUploadPathForSiriProfileId:(id)a3;
- (id)_copyVoiceProfileAtPath:(id)a3 toPath:(id)a4;
- (id)_createAndSetNewEnrollmentId;
- (id)_downloadAndEnrollVoiceProfileForProfileId:(id)a3 withDownloadTriggerBlock:(id)a4;
- (id)_enableVoiceTriggerIfLanguageMatches:(id)a3;
- (id)_enrollVoiceProfileForSiriProfileId:(id)a3 fromCacheDirectoryPath:(id)a4 withCategoryType:(unint64_t)a5;
- (id)_getUserVoiceProfileDownloadCacheDirectoryForProfileId:(id)a3 forDeviceCategory:(unint64_t)a4 forVoiceProfileVersion:(unint64_t)a5;
- (id)_getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:(id)a3;
- (id)_getVoiceProfilePathsToBeUploadedForSiriProfileId:(id)a3;
- (id)_getVoiceProfilesForSiriProfileId:(id)a3 withLanguageCode:(id)a4;
- (id)_prepareVoiceProfileWithSiriProfileId:(id)a3 withUploadBlock:(id)a4;
- (id)baseDir;
- (id)createEnrollmentId;
- (id)deleteUserVoiceProfile:(id)a3;
- (id)devicesWithVoiceProfileIniCloudForLanguage:(id)a3;
- (id)discardSiriEnrollmentForProfileId:(id)a3 forLanguageCode:(id)a4;
- (id)getAllContentsOfVoiceProfileStore;
- (id)getCacheDirectoryForAppDomain:(id)a3;
- (id)getCachedVoiceProfileAvailabilityMetaBlob;
- (id)getDonationIdsFromLanguageCode:(id)a3 error:(id *)a4;
- (id)getSATEnrollmentPath;
- (id)getUserVoiceProfileUpdateDirectory;
- (id)getUserVoiceProfileUploadPathWithEnrolledLanguageList:(id *)a3;
- (id)getVoiceProfileAnalyticsForAppDomain:(id)a3 withLocale:(id)a4;
- (id)markSATEnrollmentSuccessForVoiceProfile:(id)a3;
- (id)modelDirectoryPathForProfile:(id)a3;
- (id)newVoiceProfileWithLocale:(id)a3 withAppDomain:(id)a4;
- (id)provisionedVoiceProfilesForAppDomain:(id)a3 withLocale:(id)a4;
- (id)provisionedVoiceProfilesForLocale:(id)a3;
- (id)updateVoiceProfile:(id)a3 withUserName:(id)a4;
- (id)voiceProfileForId:(id)a3;
- (id)voiceTriggerRepromptFinished;
- (unint64_t)currentDeviceCategory;
- (void)_addUtterances:(id)a3 toProfile:(id)a4 withContext:(id)a5 doUtteranceDonation:(BOOL)a6 withCompletion:(id)a7;
- (void)_copyExplicitEnrollmentFilesFromPath:(id)a3 toPath:(id)a4 withCompletion:(id)a5;
- (void)_downloadVoiceProfileForProfileId:(id)a3 forDeviceCategory:(unint64_t)a4 withDownloadTriggerBlock:(id)a5 withCompletion:(id)a6;
- (void)_markVoiceProfileTrainingSyncForLanguage:(id)a3;
- (void)_writeEnrollmentSamplingMetaDataWithProfile:(id)a3;
- (void)addUtterances:(id)a3 toProfile:(id)a4 withContext:(id)a5 withCompletion:(id)a6;
- (void)applyContentsToVoiceProfileStore:(id)a3;
- (void)cleanupVoiceProfileModelFilesForLocale:(id)a3 withAsset:(id)a4;
- (void)deleteAllVoiceProfilesForAppDomain:(id)a3;
- (void)discardSiriEnrollmentForLanguageCode:(id)a3;
- (void)emitMetricEnrollmentId:(id)a3 isVoiceProfileiCloudSyncSuccess:(BOOL)a4 failureReasonIfAny:(id)a5 forLocale:(id)a6;
- (void)enableVoiceTriggerUponVoiceProfileSyncForLanguage:(id)a3;
- (void)importVoiceProfile:(id)a3 appDomain:(id)a4 withSharedUserId:(id)a5 withLocale:(id)a6 withAsset:(id)a7 doUtteranceDonation:(BOOL)a8 withCompletion:(id)a9;
- (void)importVoiceProfile:(id)a3 appDomain:(id)a4 withSharedUserId:(id)a5 withLocale:(id)a6 withAsset:(id)a7 withCompletion:(id)a8;
- (void)isImplicitTrainingRequiredForVoiceProfileId:(id)a3 locale:(id)a4 completion:(id)a5;
- (void)isVoiceProfileUploadedToiCloudForLanguageCode:(id)a3 withCompletionBlock:(id)a4;
- (void)isVoiceTriggerRepromptRequiredWithCompletion:(id)a3;
- (void)migrateTDVoiceProfilesToTDTI;
- (void)notifyImplicitTrainingUtteranceAvailable:(id)a3 forVoiceProfileId:(id)a4 withRecordDeviceInfo:(id)a5 withRecordCtxt:(id)a6 withVoiceTriggerCtxt:(id)a7 withOtherCtxt:(id)a8 assetToUse:(id)a9 withCompletion:(id)a10;
- (void)notifyUserVoiceProfileDownloadReadyForUser:(id)a3 getData:(id)a4 completion:(id)a5;
- (void)notifyUserVoiceProfileUpdateReady;
- (void)notifyUserVoiceProfileUploadComplete;
- (void)notifyUserVoiceProfileUploadCompleteForSiriProfileId:(id)a3 withError:(id)a4;
- (void)pruneImplicitUtterancesOfProfile:(id)a3 withAsset:(id)a4;
- (void)setCurrentDeviceCategory:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setLastRepromptedDate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteControlClient:(id)a3;
- (void)triggerInvalidSiriProfileCleanupFromPersonalDevicesForLanguage:(id)a3 appDomain:(id)a4;
- (void)triggerRetrainingVoiceProfile:(id)a3 withContext:(id)a4 withCompletion:(id)a5;
- (void)triggerVoiceProfileCleanupWithCompletion:(id)a3;
- (void)triggerVoiceProfileDownload;
- (void)triggerVoiceProfileMigrationWithCompletion:(id)a3;
- (void)uploadUserVoiceProfileForSiriProfileId:(id)a3 withUploadTrigger:(id)a4 completion:(id)a5;
- (void)voiceTriggerRepromptFinishedWithCompletion:(id)a3;
@end

@implementation SSRVoiceProfileManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastRepromptedDate, 0);
  objc_storeStrong((id *)&self->_remoteControlClient, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (SSRVoiceProfileManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRVoiceProfileManagerDelegate *)WeakRetained;
}

- (void)setLastRepromptedDate:(id)a3
{
}

- (NSString)lastRepromptedDate
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRemoteControlClient:(id)a3
{
}

- (SSRRemoteControlClient)remoteControlClient
{
  return self->_remoteControlClient;
}

- (void)setEndpointUUID:(id)a3
{
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setCurrentDeviceCategory:(unint64_t)a3
{
  self->_currentDeviceCategory = a3;
}

- (unint64_t)currentDeviceCategory
{
  return self->_currentDeviceCategory;
}

- (void)_writeEnrollmentSamplingMetaDataWithProfile:(id)a3
{
  id v3 = a3;
  v4 = [v3 getDonationIds];

  if (v4)
  {
    v5 = [v3 profileID];
    v6 = [v3 locale];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__SSRVoiceProfileManager__writeEnrollmentSamplingMetaDataWithProfile___block_invoke;
    v7[3] = &unk_264429FE8;
    id v8 = v3;
    +[SSREnrollmentSamplingMetaDataHelper writeMetaDataWithSamplingSelectionStatus:0 voiceProfileId:v5 locale:v6 completion:v7];
  }
}

void __70__SSRVoiceProfileManager__writeEnrollmentSamplingMetaDataWithProfile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    v7 = [v5 profileID];
    int v8 = 136315650;
    v9 = "-[SSRVoiceProfileManager _writeEnrollmentSamplingMetaDataWithProfile:]_block_invoke";
    __int16 v10 = 2112;
    v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s writing metadata for voiceProfile: %@ completion with error: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (id)getDonationIdsFromLanguageCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6789;
  v25 = __Block_byref_object_dispose__6790;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6789;
  v19 = __Block_byref_object_dispose__6790;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SSRVoiceProfileManager_getDonationIdsFromLanguageCode_error___block_invoke;
  block[3] = &unk_26442A100;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v15;
  uint64_t v14 = &v21;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __63__SSRVoiceProfileManager_getDonationIdsFromLanguageCode_error___block_invoke(void *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = +[SSRVoiceProfileStore sharedInstance];
  id v3 = [v2 userVoiceProfilesForLocale:a1[4]];

  if (v3 && [v3 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          __int16 v10 = [v9 appDomain];
          int v11 = [v10 isEqualToString:@"com.apple.siri"];

          if (v11)
          {
            uint64_t v15 = [v9 getDonationIds];
            uint64_t v16 = *(void *)(a1[6] + 8);
            uint64_t v17 = *(void **)(v16 + 40);
            *(void *)(v16 + 40) = v15;

            goto LABEL_14;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    if (!*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      v18 = [NSString stringWithFormat:@"voiceProfile with appDomain: %@ is not found", @"com.apple.siri"];
      v19 = (void *)MEMORY[0x263F087E8];
      v28 = @"reason";
      v29 = v18;
      id v20 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      uint64_t v21 = [v19 errorWithDomain:@"com.apple.speakerrecognition" code:731 userInfo:v20];
      uint64_t v22 = *(void *)(a1[5] + 8);
      uint64_t v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:731 userInfo:&unk_26CD45508];
    uint64_t v13 = *(void *)(a1[5] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SSRVoiceProfileManager_setDelegate___block_invoke;
  v7[3] = &unk_26442A138;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

id __38__SSRVoiceProfileManager_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (void)applyContentsToVoiceProfileStore:(id)a3
{
  id v3 = a3;
  id v4 = +[SSRVoiceProfileStorePrefs sharedStorePrefs];
  [v4 applyContentsToVoiceProfileStorePrefs:v3];
}

- (id)getAllContentsOfVoiceProfileStore
{
  v2 = +[SSRVoiceProfileStorePrefs sharedStorePrefs];
  id v3 = [v2 getAllContentsOfVoiceProfileStorePrefs];

  return v3;
}

- (void)importVoiceProfile:(id)a3 appDomain:(id)a4 withSharedUserId:(id)a5 withLocale:(id)a6 withAsset:(id)a7 withCompletion:(id)a8
{
}

- (void)importVoiceProfile:(id)a3 appDomain:(id)a4 withSharedUserId:(id)a5 withLocale:(id)a6 withAsset:(id)a7 doUtteranceDonation:(BOOL)a8 withCompletion:(id)a9
{
  BOOL v9 = a8;
  v66[2] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __128__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_doUtteranceDonation_withCompletion___block_invoke;
  v55[3] = &unk_26442A4B0;
  id v20 = v19;
  id v56 = v20;
  uint64_t v21 = (void (**)(void, void))MEMORY[0x21D4B2740](v55);
  if (v14 && v15 && v17)
  {
    id v22 = [[SSRVoiceProfile alloc] initNewVoiceProfileWithLocale:v17 withAppDomain:v15];
    [v22 setSharedSiriProfileId:v16];
    id v42 = v16;
    BOOL v40 = v9;
    id v44 = v18;
    if (v18)
    {
      v65[0] = @"SSRVoiceRetrainingVoiceProfile";
      v65[1] = @"SSRVoiceRetrainingAsset";
      v66[0] = v22;
      v66[1] = v18;
      uint64_t v23 = NSDictionary;
      long long v24 = (id *)v66;
      long long v25 = (__CFString **)v65;
      uint64_t v26 = 2;
    }
    else
    {
      v63 = @"SSRVoiceRetrainingVoiceProfile";
      id v64 = v22;
      uint64_t v23 = NSDictionary;
      long long v24 = &v64;
      long long v25 = &v63;
      uint64_t v26 = 1;
    }
    [v23 dictionaryWithObjects:v24 forKeys:v25 count:v26];
    v45 = id v54 = 0;
    v41 = [[SSRVoiceProfileRetrainingContext alloc] initWithVoiceRetrainingContext:v45 error:&v54];
    id v27 = v54;
    uint64_t v28 = +[SSRVoiceProfileManager sharedInstance];
    v29 = [MEMORY[0x263F08850] defaultManager];
    id v53 = v27;
    v46 = [v29 subpathsOfDirectoryAtPath:v14 error:&v53];
    id v30 = v53;

    uint64_t v31 = (os_log_t *)MEMORY[0x263F38100];
    v32 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v58 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:doUtteranceDonat"
            "ion:withCompletion:]";
      __int16 v59 = 2112;
      id v60 = v46;
      _os_log_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_DEFAULT, "%s fileList - %@", buf, 0x16u);
    }
    id v43 = v15;
    if (v30)
    {
      v33 = (void *)v28;
      v34 = *v31;
      if (os_log_type_enabled(*v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v58 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:doUtteranceDon"
              "ation:withCompletion:]";
        __int16 v59 = 2112;
        id v60 = v14;
        __int16 v61 = 2112;
        id v62 = v30;
        _os_log_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_DEFAULT, "%s ERR: Fetching contents of %@ failed with error - %@", buf, 0x20u);
      }
      ((void (**)(void, id))v21)[2](v21, v30);
      v35 = v41;
      id v16 = v42;
    }
    else
    {
      id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __128__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_doUtteranceDonation_withCompletion___block_invoke_330;
      v50[3] = &unk_264429FC0;
      id v51 = v14;
      id v37 = v36;
      id v52 = v37;
      [v46 enumerateObjectsUsingBlock:v50];
      v38 = *v31;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:doUtteranceDon"
              "ation:withCompletion:]";
        __int16 v59 = 2112;
        id v60 = v37;
        _os_log_impl(&dword_21C8A5000, v38, OS_LOG_TYPE_DEFAULT, "%s wavList - %@", buf, 0x16u);
      }
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __128__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_doUtteranceDonation_withCompletion___block_invoke_344;
      v47[3] = &unk_264429CF8;
      id v48 = v22;
      v49 = v21;
      v39 = (void *)v28;
      v33 = (void *)v28;
      v35 = v41;
      [v39 _addUtterances:v37 toProfile:v48 withContext:v41 doUtteranceDonation:v40 withCompletion:v47];

      id v16 = v42;
    }

    id v15 = v43;
    id v18 = v44;
  }
  else
  {
    id v22 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD454E0];
    ((void (**)(void, id))v21)[2](v21, v22);
  }
}

void __128__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_doUtteranceDonation_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    uint64_t v5 = (NSObject **)MEMORY[0x263F38100];
    id v6 = *MEMORY[0x263F38100];
    if (v3 && os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:doUtteranceDonati"
           "on:withCompletion:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, "%s ERR: %@", (uint8_t *)&v7, 0x16u);
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315138;
      id v8 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:doUtteranceDonati"
           "on:withCompletion:]_block_invoke";
      _os_log_fault_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_FAULT, "%s No completionBlock provided to importVoice Profile", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t __128__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_doUtteranceDonation_withCompletion___block_invoke_330(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v15 = v3;
    if ([v3 hasSuffix:@".wav"])
    {
      if ([*(id *)(a1 + 32) isAbsolutePath])
      {
        id v4 = *(id *)(a1 + 32);
      }
      else
      {
        uint64_t v5 = NSString;
        id v6 = [MEMORY[0x263F08850] defaultManager];
        int v7 = [v6 currentDirectoryPath];
        id v4 = [v5 stringWithFormat:@"%@/%@", v7, *(void *)(a1 + 32)];
      }
      uint64_t v8 = [NSString stringWithFormat:@"file://%@/%@", v4, v15];
      __int16 v9 = (void *)v8;
      id v10 = &stru_26CD357C0;
      if (v8) {
        id v10 = (__CFString *)v8;
      }
      uint64_t v11 = v10;

      uint64_t v12 = *(void **)(a1 + 40);
      uint64_t v13 = (void *)[objc_alloc(NSURL) initWithString:v11];

      [v12 addObject:v13];
    }
  }

  return MEMORY[0x270F9A758]();
}

void __128__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_doUtteranceDonation_withCompletion___block_invoke_344(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = v4;
    int v7 = [v5 profileID];
    int v8 = 136315650;
    __int16 v9 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:doUtteranceDonation"
         ":withCompletion:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Adding utterances to profileID: %@ finished with err: %@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_isLegacyEnrollmentMarkedWith:(id)a3 forLanguageCode:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v17 = *MEMORY[0x263F38100];
    BOOL v16 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    int v22 = 136315138;
    uint64_t v23 = "-[SSRVoiceProfileManager _isLegacyEnrollmentMarkedWith:forLanguageCode:]";
    _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Language Code is nil!", (uint8_t *)&v22, 0xCu);
LABEL_18:
    BOOL v16 = 0;
    goto LABEL_19;
  }
  int v8 = [(SSRVoiceProfileManager *)self SSRSpeakerProfilesBasePath];
  __int16 v9 = [v8 stringByAppendingPathComponent:v7];

  __int16 v10 = [MEMORY[0x263F08850] defaultManager];
  if (![v10 fileExistsAtPath:v9 isDirectory:0])
  {
    id v18 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315394;
      uint64_t v23 = "-[SSRVoiceProfileManager _isLegacyEnrollmentMarkedWith:forLanguageCode:]";
      __int16 v24 = 2112;
      long long v25 = v9;
      _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s SAT path doesnt exist - %@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_17;
  }
  uint64_t v11 = [v9 stringByAppendingPathComponent:v6];
  __int16 v12 = [v9 stringByAppendingPathComponent:@"td/audio"];
  if (![v10 fileExistsAtPath:v11 isDirectory:0])
  {
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  id v13 = [v10 contentsOfDirectoryAtPath:v12 error:0];
  uint64_t v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"self ENDSWITH '.wav'"];
  id v15 = [v13 filteredArrayUsingPredicate:v14];

  if (!v15 || ![v15 count])
  {
    id v19 = (NSObject **)MEMORY[0x263F38100];
    id v20 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315138;
      uint64_t v23 = "-[SSRVoiceProfileManager _isLegacyEnrollmentMarkedWith:forLanguageCode:]";
      _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, "%s No Audio file exists when enrollment marker is set, remove marker", (uint8_t *)&v22, 0xCu);
      id v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315394;
      uint64_t v23 = "-[SSRVoiceProfileManager _isLegacyEnrollmentMarkedWith:forLanguageCode:]";
      __int16 v24 = 2114;
      long long v25 = v13;
      _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, "%s Contents of audio dir - %{public}@", (uint8_t *)&v22, 0x16u);
    }
    [v10 removeItemAtPath:v11 error:0];

    goto LABEL_16;
  }

  BOOL v16 = 1;
LABEL_19:

  return v16;
}

- (id)_CSSATUploadPathForSiriProfileId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"Caches/VoiceTrigger/SATUpload"];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 stringByAppendingPathComponent:v4];

    id v6 = (void *)v7;
  }
  int v8 = [(SSRVoiceProfileManager *)self baseDir];
  __int16 v9 = [v8 stringByAppendingPathComponent:v6];

  return v9;
}

- (id)_CSSATCachePathForAppDomain:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"Caches/VoiceTrigger"];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 stringByAppendingPathComponent:v4];

    id v6 = (void *)v7;
  }
  int v8 = [(SSRVoiceProfileManager *)self baseDir];
  __int16 v9 = [v8 stringByAppendingPathComponent:v6];

  return v9;
}

- (id)_CSSATDownloadPath
{
  v2 = [(SSRVoiceProfileManager *)self baseDir];
  id v3 = [v2 stringByAppendingPathComponent:@"Caches/VoiceTrigger/SATUpdate"];

  return v3;
}

- (id)_CSSATCachePath
{
  return (id)[0 stringByAppendingPathComponent:@"Library/Caches/VoiceTrigger"];
}

- (void)deleteAllVoiceProfilesForAppDomain:(id)a3
{
  uint64_t v28 = self;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[SSRVoiceProfileStore sharedInstance];
  v29 = v3;
  uint64_t v5 = [v4 userVoiceProfilesForAppDomain:v3];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    __int16 v9 = (os_log_t *)MEMORY[0x263F38100];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        __int16 v12 = objc_msgSend(v4, "deleteUserVoiceProfile:", v11, v28);
        if (v12)
        {
          os_log_t v13 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = v13;
            id v15 = [v11 profileID];
            *(_DWORD *)buf = 136315650;
            id v37 = "-[SSRVoiceProfileManager deleteAllVoiceProfilesForAppDomain:]";
            __int16 v38 = 2114;
            v39 = v15;
            __int16 v40 = 2114;
            v41 = v12;
            _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete Voice Profile %{public}@ with error %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v7);
  }
  BOOL v16 = v28;
  id v17 = -[SSRVoiceProfileManager SSRBasePathForAppDomain:](v28, "SSRBasePathForAppDomain:", v29, v28);
  id v18 = [MEMORY[0x263F08850] defaultManager];
  if ([v18 fileExistsAtPath:v17 isDirectory:0])
  {
    id v31 = 0;
    [v18 removeItemAtPath:v17 error:&v31];
    id v19 = v31;
    if (v19)
    {
      id v20 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = v20;
        long long v25 = [v19 localizedDescription];
        *(_DWORD *)buf = 136315650;
        id v37 = "-[SSRVoiceProfileManager deleteAllVoiceProfilesForAppDomain:]";
        __int16 v38 = 2112;
        v39 = v17;
        __int16 v40 = 2112;
        v41 = v25;
        _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s Couldn't delete SAT directory at path %@ %@", buf, 0x20u);
      }
    }
  }
  uint64_t v21 = [(SSRVoiceProfileManager *)v16 _CSSATCachePath];
  if ([v18 fileExistsAtPath:v21 isDirectory:0])
  {
    id v30 = 0;
    [v18 removeItemAtPath:v21 error:&v30];
    id v22 = v30;
    if (v22)
    {
      uint64_t v23 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = v23;
        id v27 = [v22 localizedDescription];
        *(_DWORD *)buf = 136315650;
        id v37 = "-[SSRVoiceProfileManager deleteAllVoiceProfilesForAppDomain:]";
        __int16 v38 = 2112;
        v39 = v21;
        __int16 v40 = 2112;
        v41 = v27;
        _os_log_error_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_ERROR, "%s Couldn't delete SAT cache directory at path %@ %@", buf, 0x20u);
      }
    }
  }
}

- (id)deleteUserVoiceProfile:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    uint64_t v7 = [NSString stringWithFormat:@"ERR: Voice Profile passed is nil - Bailing out"];
    __int16 v9 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      os_log_t v13 = "-[SSRVoiceProfileManager deleteUserVoiceProfile:]";
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v12, 0x16u);
    }
    __int16 v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    v19[0] = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v5 = [v10 errorWithDomain:@"com.apple.speakerrecognition" code:731 userInfo:v8];
    goto LABEL_8;
  }
  id v4 = +[SSRVoiceProfileStore sharedInstance];
  uint64_t v5 = [v4 deleteUserVoiceProfile:v3];

  if (v5)
  {
    uint64_t v6 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = v6;
      uint64_t v8 = [v3 profileID];
      int v12 = 136315650;
      os_log_t v13 = "-[SSRVoiceProfileManager deleteUserVoiceProfile:]";
      __int16 v14 = 2114;
      id v15 = v8;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete Voice Profile %{public}@ with error %{public}@", (uint8_t *)&v12, 0x20u);
LABEL_8:
    }
  }

  return v5;
}

- (BOOL)_isRemoteVoiceTriggerAvailable
{
  return 0;
}

- (BOOL)isSATEnrollmentMigratedForSiriProfileId:(id)a3 forLanguageCode:(id)a4
{
  id v4 = +[SSRUtils getVoiceProfileForSiriProfileId:a3 forLanguageCode:a4];
  uint64_t v5 = v4;
  if (v4) {
    char v6 = [v4 isMarkedSATMigrated];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isSATEnrolledForSiriProfileId:(id)a3 forLanguageCode:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SSRVoiceProfileStorePrefs sharedStorePrefs];
  uint64_t v9 = [v8 getVoiceProfileStoreVersion];

  if (v9 == -1)
  {
    char v12 = [(SSRVoiceProfileManager *)self _isLegacyEnrollmentMarkedWith:@"enrollment_completed" forLanguageCode:v7];
  }
  else
  {
    __int16 v10 = +[SSRUtils getVoiceProfileForSiriProfileId:v6 forLanguageCode:v7];
    uint64_t v11 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      id v15 = "-[SSRVoiceProfileManager isSATEnrolledForSiriProfileId:forLanguageCode:]";
      __int16 v16 = 2114;
      id v17 = v7;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Profiles already migrated, check for enrollment on %{public}@ on profile %{public}@", (uint8_t *)&v14, 0x20u);
    }
    if (v10) {
      char v12 = [v10 isMarkedSATEnrolled];
    }
    else {
      char v12 = 0;
    }
  }
  return v12;
}

- (id)markSATEnrollmentSuccessForVoiceProfile:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[SSRVoiceProfileStore sharedInstance];
    if ([v4 markSATEnrollmentSuccess])
    {
      if (CSIsIOS() && (CSIsCommunalDevice() & 1) == 0)
      {
        id v6 = [v4 locale];
        [(SSRVoiceProfileManager *)self _markVoiceProfileTrainingSyncForLanguage:v6];
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v22 = __Block_byref_object_copy__6789;
      uint64_t v23 = __Block_byref_object_dispose__6790;
      id v24 = 0;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __66__SSRVoiceProfileManager_markSATEnrollmentSuccessForVoiceProfile___block_invoke;
      v18[3] = &unk_264429F98;
      uint64_t v20 = buf;
      v18[4] = self;
      id v19 = v4;
      [v5 addUserVoiceProfile:v19 withContext:0 withCompletion:v18];
      id v7 = *(id *)(*(void *)&buf[8] + 40);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v11 = NSString;
      char v12 = [v4 profileID];
      os_log_t v13 = [v11 stringWithFormat:@"ERR: Failed in marking Enrollment as Successful for profile %@", v12];

      int v14 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager markSATEnrollmentSuccessForVoiceProfile:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      id v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F08320];
      uint64_t v26 = v13;
      __int16 v16 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v7 = [v15 errorWithDomain:@"com.apple.speakerrecognition" code:723 userInfo:v16];
    }
  }
  else
  {
    uint64_t v5 = [NSString stringWithFormat:@"ERR: Voice Profile sent as nil - Bailing out"];
    uint64_t v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager markSATEnrollmentSuccessForVoiceProfile:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08320];
    v28[0] = v5;
    __int16 v10 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v7 = [v9 errorWithDomain:@"com.apple.speakerrecognition" code:731 userInfo:v10];
  }

  return v7;
}

void __66__SSRVoiceProfileManager_markSATEnrollmentSuccessForVoiceProfile___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (a2)
  {
    if (CSIsIOS())
    {
      id v7 = (os_log_t *)MEMORY[0x263F38100];
      uint64_t v8 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        os_log_t v13 = "-[SSRVoiceProfileManager markSATEnrollmentSuccessForVoiceProfile:]_block_invoke";
        _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s writing to enrollment sampling meta data", (uint8_t *)&v12, 0xCu);
      }
      [*(id *)(a1 + 32) _writeEnrollmentSamplingMetaDataWithProfile:*(void *)(a1 + 40)];
      uint64_t v9 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        os_log_t v13 = "-[SSRVoiceProfileManager markSATEnrollmentSuccessForVoiceProfile:]_block_invoke";
        _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Triggering profile sync check", (uint8_t *)&v12, 0xCu);
      }
      __int16 v10 = [MEMORY[0x263F087C8] defaultCenter];
      [v10 postNotificationName:@"com.apple.voicetrigger.voiceprofilesync" object:0];
    }
  }
  else
  {
    uint64_t v11 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      os_log_t v13 = "-[SSRVoiceProfileManager markSATEnrollmentSuccessForVoiceProfile:]_block_invoke";
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s ERR: Failed to add profile into the store with error %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  notify_post("com.apple.voicetrigger.PHSProfileModified");
}

- (void)triggerRetrainingVoiceProfile:(id)a3 withContext:(id)a4 withCompletion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  if (v7)
  {
    __int16 v10 = +[SSRVoiceProfileStore sharedInstance];
    uint64_t v11 = [v7 profileID];
    int v12 = [v10 userVoiceProfileForVoiceProfileID:v11];

    if (v12)
    {
      [v10 retrainVoiceProfile:v12 withContext:v8 withCompletion:v9];
    }
    else
    {
      uint64_t v16 = NSString;
      id v17 = [v7 profileID];
      __int16 v18 = [v16 stringWithFormat:@"ERR: Voice Profile not found for Id %@ - Bailing out", v17];

      id v19 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v28 = "-[SSRVoiceProfileManager triggerRetrainingVoiceProfile:withContext:withCompletion:]";
        __int16 v29 = 2114;
        id v30 = v18;
        _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F08320];
      id v24 = v18;
      uint64_t v21 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v22 = [v20 errorWithDomain:@"com.apple.speakerrecognition" code:731 userInfo:v21];
      v9[2](v9, v22);

      int v12 = 0;
    }
  }
  else
  {
    __int16 v10 = [NSString stringWithFormat:@"ERR: Voice Profile sent as nil - Bailing out"];
    os_log_t v13 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[SSRVoiceProfileManager triggerRetrainingVoiceProfile:withContext:withCompletion:]";
      __int16 v29 = 2114;
      id v30 = v10;
      _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    __int16 v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F08320];
    uint64_t v26 = v10;
    int v12 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v15 = [v14 errorWithDomain:@"com.apple.speakerrecognition" code:731 userInfo:v12];
    v9[2](v9, v15);
  }
}

- (void)triggerVoiceProfileDownload
{
  id v2 = [MEMORY[0x263F087C8] defaultCenter];
  [v2 postNotificationName:@"com.apple.voicetrigger.PHSProfileDownloadTrigger" object:0];
}

- (void)pruneImplicitUtterancesOfProfile:(id)a3 withAsset:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = objc_alloc_init(SSRVoiceProfilePruner);
  if (CSIsCommunalDevice()) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 1;
  }
  [(SSRVoiceProfilePruner *)v8 pruneVoiceProfile:v6 forSpIdType:v7 withAsset:v5];
}

- (void)cleanupVoiceProfileModelFilesForLocale:(id)a3 withAsset:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[SSRVoiceProfileStore sharedInstance];
  [v7 cleanupVoiceProfileModelFilesForLocale:v6 withAsset:v5];
}

- (void)triggerVoiceProfileCleanupWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[SSRVoiceProfileStore sharedInstance];
  [v4 cleanupVoiceProfileStore:v3];
}

- (BOOL)triggerVoiceProfileDuplicatesCleanup
{
  id v2 = +[SSRVoiceProfileStore sharedInstance];
  char v3 = [v2 cleanupDuplicatedProfiles];

  return v3;
}

- (void)triggerInvalidSiriProfileCleanupFromPersonalDevicesForLanguage:(id)a3 appDomain:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[SSRVoiceProfileStore sharedInstance];
  [v7 cleanupInvalidSiriProfilesFromPersonalDevicesForLanguage:v6 appDomain:v5];
}

- (void)migrateTDVoiceProfilesToTDTI
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = +[SSRVoiceProfileStore sharedInstance];
  char v3 = [MEMORY[0x263F380D0] getSiriLanguageWithFallback:0];
  id v4 = [v2 userVoiceProfilesForAppDomain:@"com.apple.siri" forLocale:v3];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = (os_log_t *)MEMORY[0x263F38100];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v11 copyTDAudioToTDTI];
        os_log_t v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v13 = v12;
          __int16 v14 = [v11 voiceProfileBasePath];
          *(_DWORD *)buf = 136315394;
          uint64_t v20 = "-[SSRVoiceProfileManager migrateTDVoiceProfilesToTDTI]";
          __int16 v21 = 2112;
          id v22 = v14;
          _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Triggering td profile migration for profile: %@", buf, 0x16u);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v7);
  }
}

- (void)triggerVoiceProfileMigrationWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[SSRVoiceProfileStore sharedInstance];
  [v4 migrateVoiceProfilesIfNeededWithCompletionBlock:v3];
}

- (void)voiceTriggerRepromptFinishedWithCompletion:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = (void (**)(id, void))a3;
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SSRVoiceProfileManager voiceTriggerRepromptFinishedWithCompletion:]";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Not-implemented", (uint8_t *)&v5, 0xCu);
  }
  v3[2](v3, 0);
}

- (id)voiceTriggerRepromptFinished
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F38100];
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SSRVoiceProfileManager voiceTriggerRepromptFinished]";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Running VoiceTriggerRePromptFinised...", (uint8_t *)&v10, 0xCu);
  }
  int v5 = self->_lastRepromptedDate;
  uint64_t v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[SSRVoiceProfileManager voiceTriggerRepromptFinished]";
    __int16 v12 = 2112;
    os_log_t v13 = v5;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Storing VoiceTriggerRePromptFinished on date %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v7 = [MEMORY[0x263F38068] sharedPreferences];
  [v7 voiceTriggerRePromptFinishedWithDate:v5];

  uint64_t v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SSRVoiceProfileManager voiceTriggerRepromptFinished]";
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Done VoiceTriggerRePromptFinised!", (uint8_t *)&v10, 0xCu);
  }

  return 0;
}

- (void)isVoiceTriggerRepromptRequiredWithCompletion:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequiredWithCompletion:]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s not-implemented. return false.", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)isVoiceTriggerRepromptRequired
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  [v2 systemUptime];
  double v4 = v3;

  int v5 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v6 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Checking if isVoiceTriggerRepromptRequired...", buf, 0xCu);
  }
  uint64_t v7 = [MEMORY[0x263F38068] sharedPreferences];
  int v8 = [v7 forceRePromptVoiceTrigger];

  uint64_t v9 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Checking if already reprompted...", buf, 0xCu);
  }
  int v10 = [MEMORY[0x263F38068] sharedPreferences];
  uint64_t v11 = [v10 dateWhenVoiceTriggerRePrompted];

  __int16 v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v13 = @"NO";
    if (v8) {
      os_log_t v13 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Force re-prompt preference config value %@", buf, 0x16u);
    __int16 v12 = *v5;
  }
  BOOL v14 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (!v14) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    long long v18 = "%s Not RePrompted before";
    id v19 = v12;
LABEL_17:
    _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
LABEL_18:
    uint64_t v20 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
      _os_log_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Setting up AFSettingsConnection...", buf, 0xCu);
    }
    id v51 = objc_alloc_init(MEMORY[0x263F285E0]);
    __int16 v21 = [MEMORY[0x263EFF910] date];
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    dispatch_time_t v23 = dispatch_time(0, 5000000000);
    uint64_t v63 = 0;
    id v64 = &v63;
    uint64_t v65 = 0x2020000000;
    char v66 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v74 = __Block_byref_object_copy__6789;
    v75 = __Block_byref_object_dispose__6790;
    id v76 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    id v60 = __Block_byref_object_copy__6789;
    __int16 v61 = __Block_byref_object_dispose__6790;
    id v62 = 0;
    uint64_t v24 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v67 = 136315138;
      v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
      _os_log_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_DEFAULT, "%s Fetching active account using AFSettingConnection...", v67, 0xCu);
    }
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __56__SSRVoiceProfileManager_isVoiceTriggerRepromptRequired__block_invoke;
    v52[3] = &unk_264429F70;
    id v54 = buf;
    v55 = &v57;
    id v56 = &v63;
    uint64_t v25 = v22;
    id v53 = v25;
    [v51 fetchActiveAccount:v52];
    double v26 = COERCE_DOUBLE(dispatch_semaphore_wait(v25, v23));
    uint64_t v27 = [MEMORY[0x263EFF910] date];
    uint64_t v28 = *v5;
    if (v26 == 0.0)
    {
      id v30 = v28;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        [v27 timeIntervalSinceDate:v21];
        *(_DWORD *)v67 = 136315394;
        v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
        __int16 v69 = 2050;
        double v70 = v31 * 1000.0;
        _os_log_impl(&dword_21C8A5000, v30, OS_LOG_TYPE_DEFAULT, "%s timeToRet(AFSettingsConnection:fetchActiveAccount:): %{public}fms", v67, 0x16u);
      }
    }
    else if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v67 = 136315650;
      v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
      __int16 v69 = 2050;
      double v70 = v26;
      __int16 v71 = 1026;
      LODWORD(v72) = 5000;
      _os_log_impl(&dword_21C8A5000, v28, OS_LOG_TYPE_DEFAULT, "%s Timedout waiting for AFSettingsConnection:fetchActiveAccount: %{public}ld, waitedFor: %{public}d, Returning false", v67, 0x1Cu);
    }
    long long v32 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)v64 + 24)) {
        *(double *)&long long v33 = COERCE_DOUBLE(@"YES");
      }
      else {
        *(double *)&long long v33 = COERCE_DOUBLE(@"NO");
      }
      *(_DWORD *)v67 = 136315394;
      v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
      __int16 v69 = 2112;
      double v70 = *(double *)&v33;
      _os_log_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_DEFAULT, "%s Result of isVoiceTriggerRepromptRequired is %@...", v67, 0x16u);
    }
    long long v34 = [MEMORY[0x263F08AB0] processInfo];
    [v34 systemUptime];
    double v36 = v35;

    id v37 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v67 = 136315394;
      v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
      __int16 v69 = 2050;
      double v70 = (v36 - v4) * 1000.0;
      _os_log_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_DEFAULT, "%s isVoiceTriggerRePrompt required check if re prompt is required took %{public}.3fms", v67, 0x16u);
    }
    __int16 v38 = [MEMORY[0x263F38068] sharedPreferences];
    int v39 = [v38 forceSetRePromptRequired];

    if (CSIsInternalBuild() & v39)
    {
      __int16 v40 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        if (*((unsigned char *)v64 + 24)) {
          *(double *)&v41 = COERCE_DOUBLE(@"YES");
        }
        else {
          *(double *)&v41 = COERCE_DOUBLE(@"NO");
        }
        *(_DWORD *)v67 = 136315394;
        v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
        __int16 v69 = 2112;
        double v70 = *(double *)&v41;
        _os_log_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_DEFAULT, "%s Forcing isRePromptRequired to YES overriding it's original value of: %@", v67, 0x16u);
      }
      *((unsigned char *)v64 + 24) = v39;
      if (v39) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v64 + 24))
    {
LABEL_45:
      id v42 = objc_alloc_init(MEMORY[0x263F08790]);
      uint64_t v43 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
      [v42 setLocale:v43];

      [v42 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
      id v44 = [MEMORY[0x263EFF910] now];
      v45 = [v42 stringFromDate:v44];

      v46 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        lastRepromptedDate = self->_lastRepromptedDate;
        *(_DWORD *)v67 = 136315650;
        v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
        __int16 v69 = 2112;
        double v70 = *(double *)&lastRepromptedDate;
        __int16 v71 = 2112;
        v72 = v45;
        _os_log_impl(&dword_21C8A5000, v46, OS_LOG_TYPE_DEFAULT, "%s RePrompted. Updating _lastRepromptedDate from %@ to %@", v67, 0x20u);
      }
      objc_storeStrong((id *)&self->_lastRepromptedDate, v45);
      id v48 = [MEMORY[0x263F380D8] sharedLogger];
      [v48 logRePromptFinishedWithSiriSpeechID:v58[5] withRePromptDate:self->_lastRepromptedDate withIsRePrompted:*((unsigned __int8 *)v64 + 24) withLocale:*(void *)(*(void *)&buf[8] + 40)];

      BOOL v29 = *((unsigned char *)v64 + 24) != 0;
      goto LABEL_50;
    }
    BOOL v29 = 0;
LABEL_50:

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v63, 8);
    goto LABEL_51;
  }
  if (v14)
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Already RePrompted on %@", buf, 0x16u);
  }
  int v15 = CSIsInternalBuild() & v8;
  long long v16 = *v5;
  BOOL v17 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
  if (v15 == 1)
  {
    if (!v17) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    long long v18 = "%s Force re-prompt enabled. Continuing with RePrompt..";
    id v19 = v16;
    goto LABEL_17;
  }
  if (v17)
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s RePrompt is not required. Return false.", buf, 0xCu);
  }
  BOOL v29 = 0;
LABEL_51:

  return v29;
}

void __56__SSRVoiceProfileManager_isVoiceTriggerRepromptRequired__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (os_log_t *)MEMORY[0x263F38100];
  int v8 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    int v10 = [v5 debugDescription];
    int v19 = 136315394;
    uint64_t v20 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]_block_invoke";
    __int16 v21 = 2112;
    dispatch_semaphore_t v22 = v10;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Active Assistant Account is %@", (uint8_t *)&v19, 0x16u);
  }
  uint64_t v11 = [v5 speechIdentifier];
  uint64_t v12 = [v5 localeIdentifier];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v11);
  int v15 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    uint64_t v20 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]_block_invoke";
    __int16 v21 = 2112;
    dispatch_semaphore_t v22 = v11;
    _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s speechIdentifier is %@", (uint8_t *)&v19, 0x16u);
  }
  long long v16 = +[VoiceTriggerRePromptUtil sharedInstance];
  int v17 = [v16 isRePromptableWithAssistantId:v11];

  if (v17)
  {
    long long v18 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      uint64_t v20 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]_block_invoke";
      _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s AssistantId required RePrompt", (uint8_t *)&v19, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getVoiceProfileAnalyticsForAppDomain:(id)a3 withLocale:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[SSRVoiceProfileStore sharedInstance];
  int v8 = [v7 userVoiceProfilesForAppDomain:v5 forLocale:v6];
  uint64_t v9 = v8;
  if (v8 && [v8 count])
  {
    int v10 = [MEMORY[0x263EFF980] array];
    uint64_t v11 = +[SSRAssetManager sharedManager];
    uint64_t v12 = 3;
    id v33 = v6;
    uint64_t v13 = [v11 installedAssetOfType:3 forLanguage:v6];

    id v14 = v13;
    if ((CSIsCommunalDevice() & 1) == 0)
    {
      if ((CSIsIOS() & 1) != 0 || CSIsAppleSiliconMac())
      {
        [v14 psrCombinationWeight];
        if (((v15 == 1.0) & [v14 useTDTIEnrollment]) != 0) {
          uint64_t v12 = 3;
        }
        else {
          uint64_t v12 = 1;
        }
      }
      else
      {
        uint64_t v12 = 1;
      }
    }
    long long v32 = v7;
    id v34 = v5;
    double v31 = v14;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v9;
    uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(obj);
          }
          __int16 v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          dispatch_semaphore_t v22 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v31);
          uint64_t v23 = [v21 profileID];
          [v22 setObject:v23 forKey:@"profileID"];

          uint64_t v24 = NSNumber;
          uint64_t v25 = [v21 getExplicitEnrollmentUtterancesForType:v12];
          double v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
          [v22 setObject:v26 forKey:@"numExplicitUtt"];

          uint64_t v27 = NSNumber;
          uint64_t v28 = [v21 getImplicitEnrollmentUtterancesForType:v12];
          BOOL v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
          [v22 setObject:v29 forKey:@"numImplicitUtt"];

          [v10 addObject:v22];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v18);
    }

    id v6 = v33;
    id v5 = v34;
    uint64_t v7 = v32;
  }
  else
  {
    long long v16 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v42 = "-[SSRVoiceProfileManager getVoiceProfileAnalyticsForAppDomain:withLocale:]";
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s voiceProfileArray is nil!", buf, 0xCu);
    }
    int v10 = 0;
  }

  return v10;
}

- (id)voiceProfileForId:(id)a3
{
  id v3 = a3;
  double v4 = +[SSRVoiceProfileStore sharedInstance];
  id v5 = [v4 userVoiceProfileForVoiceProfileID:v3];

  return v5;
}

- (id)provisionedVoiceProfilesForLocale:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = +[SSRVoiceProfileStore sharedInstance];
  id v5 = [v4 userVoiceProfilesForLocale:v3];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v5 && [v5 count])
  {
    uint64_t v19 = v4;
    id v20 = v3;
    uint64_t v18 = [MEMORY[0x263F380D0] deviceProductType];
    unint64_t v7 = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:");
    int v8 = [v5 sortedArrayUsingComparator:&__block_literal_global_281];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [[SSRVoiceProfileMetaContext alloc] initWithVoiceProfile:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          id v14 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v7];
          [(SSRVoiceProfileMetaContext *)v13 setProductCategory:v14];

          [(SSRVoiceProfileMetaContext *)v13 setVersion:&unk_26CD455C8];
          [v6 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }
    id v15 = v6;

    double v4 = v19;
    id v3 = v20;
  }
  else
  {
    long long v16 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v27 = "-[SSRVoiceProfileManager provisionedVoiceProfilesForLocale:]";
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s voiceProfileArray is nil!", buf, 0xCu);
    }
    id v15 = 0;
  }

  return v15;
}

uint64_t __60__SSRVoiceProfileManager_provisionedVoiceProfilesForLocale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 dateAdded];

  if (v6)
  {
    unint64_t v7 = [v5 dateAdded];

    if (v7)
    {
      int v8 = [v4 dateAdded];
      uint64_t v9 = [v5 dateAdded];
      uint64_t v10 = [v8 compare:v9];
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (id)provisionedVoiceProfilesForAppDomain:(id)a3 withLocale:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = +[SSRVoiceProfileStore sharedInstance];
  int v8 = [v7 userVoiceProfilesForAppDomain:v5 forLocale:v6];
  uint64_t v9 = v8;
  if (v8 && [v8 count])
  {
    uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_6835];
  }
  else
  {
    uint64_t v11 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      id v14 = "-[SSRVoiceProfileManager provisionedVoiceProfilesForAppDomain:withLocale:]";
      __int16 v15 = 2114;
      id v16 = v5;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s voiceProfileArray is nil for %{public}@ and %{public}@!", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __74__SSRVoiceProfileManager_provisionedVoiceProfilesForAppDomain_withLocale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 dateAdded];

  if (v6)
  {
    unint64_t v7 = [v5 dateAdded];

    if (v7)
    {
      int v8 = [v4 dateAdded];
      uint64_t v9 = [v5 dateAdded];
      uint64_t v10 = [v8 compare:v9];
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (id)_CSSATLegacyUploadPath
{
  id v2 = [(SSRVoiceProfileManager *)self baseDir];
  id v3 = [v2 stringByAppendingPathComponent:@"Caches/VoiceTrigger/SATLegacyUpload"];

  return v3;
}

- (BOOL)_isDirectory:(id)a3
{
  BOOL v7 = 0;
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  [v5 fileExistsAtPath:v4 isDirectory:&v7];

  return v7;
}

- (id)devicesWithVoiceProfileIniCloudForLanguage:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (NSObject **)MEMORY[0x263F38100];
  id v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager devicesWithVoiceProfileIniCloudForLanguage:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v3;
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s \nlanguageCode: %{public}@", buf, 0x16u);
  }
  id v6 = [MEMORY[0x263EFF910] date];
  id v7 = objc_alloc_init(MEMORY[0x263F285E0]);
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v30 = __Block_byref_object_copy__6789;
  double v31 = __Block_byref_object_dispose__6790;
  id v32 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __69__SSRVoiceProfileManager_devicesWithVoiceProfileIniCloudForLanguage___block_invoke;
  v19[3] = &unk_264429F10;
  id v10 = v3;
  id v20 = v10;
  long long v22 = buf;
  uint64_t v11 = v8;
  long long v21 = v11;
  [v7 getDevicesWithAvailablePHSAssetsForLanguage:v10 completion:v19];
  intptr_t v12 = dispatch_semaphore_wait(v11, v9);
  int v13 = [MEMORY[0x263EFF910] date];
  id v14 = *v4;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v23 = 136315650;
      long long v24 = "-[SSRVoiceProfileManager devicesWithVoiceProfileIniCloudForLanguage:]";
      __int16 v25 = 2050;
      double v26 = *(double *)&v12;
      __int16 v27 = 1026;
      int v28 = 5000;
      _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Timedout waiting for AFSettingsConnection:getDevicesWithAvailablePHSAssetsForLanguage: %{public}ld, waitedFor: %{public}d, Returning nil", v23, 0x1Cu);
    }
  }
  else
  {
    __int16 v15 = v14;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      [v13 timeIntervalSinceDate:v6];
      *(_DWORD *)long long v23 = 136315394;
      long long v24 = "-[SSRVoiceProfileManager devicesWithVoiceProfileIniCloudForLanguage:]";
      __int16 v25 = 2050;
      double v26 = v16 * 1000.0;
      _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s timeToRet(AFSettingsConnection:getDevicesWithAvailablePHSAssetsForLanguage:): %{public}fms", v23, 0x16u);
    }
  }
  id v17 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v17;
}

void __69__SSRVoiceProfileManager_devicesWithVoiceProfileIniCloudForLanguage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 136315650;
    id v10 = "-[SSRVoiceProfileManager devicesWithVoiceProfileIniCloudForLanguage:]_block_invoke";
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Devices with VoiceProfile in iCloud for language: %{public}@:%{public}@", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v8 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)enableVoiceTriggerUponVoiceProfileSyncForLanguage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = (char *)a3;
  id v4 = *MEMORY[0x263F38100];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[SSRVoiceProfileManager enableVoiceTriggerUponVoiceProfileSyncForLanguage:]";
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Will Enable VoiceTrigger after VoiceProfile sync for language: %{public}@", buf, 0x16u);
    }
    _CSNotBackedupPreferencesSetValueForKey();
    if (CSIsInternalBuild())
    {
      uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v6 = _CSNotBackedupPreferencesValueForKey();
      id v7 = v6;
      if (v6)
      {
        uint64_t v8 = [v6 mutableCopy];

        uint64_t v5 = (void *)v8;
      }
      int v9 = objc_msgSend(MEMORY[0x263F380D0], "deviceBuildVersion", @"buildVersion");
      v12[1] = @"timestamp";
      v13[0] = v9;
      id v10 = +[SSRUtils timeStampString];
      v13[1] = v10;
      __int16 v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

      [v5 setObject:v11 forKeyedSubscript:@"EnableVTUponVoiceProfileSync"];
      _CSNotBackedupPreferencesSetValueForKey();
    }
    CSNotBackedupInternalPreferencesSynchronize();
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[SSRVoiceProfileManager enableVoiceTriggerUponVoiceProfileSyncForLanguage:]";
    __int16 v16 = 2082;
    id v17 = "-[SSRVoiceProfileManager enableVoiceTriggerUponVoiceProfileSyncForLanguage:]";
    _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s ERR: %{public}s: Bailing out as language is nil!", buf, 0x16u);
  }
}

- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  uint64_t v5 = [(SSRVoiceProfileManager *)self createEnrollmentId];
  uint64_t v6 = [MEMORY[0x263F380D0] deviceProductType];
  if (!v6)
  {
    long long v39 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
LABEL_33:
      id v44 = @"Unknown device";
      v45 = self;
      v46 = v5;
      v47 = v4;
LABEL_34:
      [(SSRVoiceProfileManager *)v45 emitMetricEnrollmentId:v46 isVoiceProfileiCloudSyncSuccess:0 failureReasonIfAny:v44 forLocale:v47];
      BOOL v35 = 0;
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
    __int16 v60 = 2114;
    __int16 v61 = v4;
    __int16 v40 = "%s ERR: Unknown device. Returning false, language: %{public}@";
    v41 = v39;
    uint32_t v42 = 22;
LABEL_44:
    _os_log_error_impl(&dword_21C8A5000, v41, OS_LOG_TYPE_ERROR, v40, buf, v42);
    goto LABEL_33;
  }
  unint64_t v7 = 0x264428000uLL;
  unint64_t v8 = +[SSRUtils deviceCategoryForDeviceProductType:v6];
  if (!v8)
  {
    uint64_t v43 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
    __int16 v60 = 2114;
    __int16 v61 = v6;
    __int16 v62 = 2114;
    uint64_t v63 = v4;
    __int16 v40 = "%s ERR: Unknown device-category for device: %{public}@, languageCode: %{public}@";
    v41 = v43;
    uint32_t v42 = 32;
    goto LABEL_44;
  }
  int v9 = (os_log_t *)MEMORY[0x263F38100];
  id v10 = *MEMORY[0x263F38100];
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
      __int16 v60 = 2082;
      __int16 v61 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
      _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s ERR: %{public}s: Bailing out as language is nil!", buf, 0x16u);
    }
    id v44 = @"Unknown language";
    v45 = self;
    v46 = v5;
    v47 = 0;
    goto LABEL_34;
  }
  unint64_t v11 = v8;
  v50 = v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v10;
    __int16 v13 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v11];
    *(_DWORD *)buf = 136315650;
    uint64_t v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
    __int16 v60 = 2114;
    __int16 v61 = v6;
    __int16 v62 = 2114;
    uint64_t v63 = v13;
    _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Searching for synced-VoiceProfile for CurrDevice: %{public}@{%{public}@}", buf, 0x20u);
  }
  id v53 = v6;
  v49 = self;
  id v51 = v4;
  [(SSRVoiceProfileManager *)self devicesWithVoiceProfileIniCloudForLanguage:v4];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v55;
    id v52 = v14;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v55 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v20 = [*(id *)(v7 + 2112) deviceCategoryForDeviceProductType:v19];
        long long v21 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          long long v22 = *(void **)(v7 + 2112);
          long long v23 = v21;
          long long v24 = [v22 deviceCategoryStringRepresentationForCategoryType:v11];
          [*(id *)(v7 + 2112) deviceCategoryStringRepresentationForCategoryType:v20];
          uint64_t v25 = v16;
          unint64_t v26 = v11;
          uint64_t v27 = v17;
          v29 = unint64_t v28 = v7;
          *(_DWORD *)buf = 136316162;
          uint64_t v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
          __int16 v60 = 2114;
          __int16 v61 = v53;
          __int16 v62 = 2114;
          uint64_t v63 = v24;
          __int16 v64 = 2114;
          uint64_t v65 = v19;
          __int16 v66 = 2114;
          v67 = v29;
          _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s currDevice=[%{public}@ : {%{public}@}] ; syncedDevice=[%{public}@ : {%{public}@}]",
            buf,
            0x34u);

          unint64_t v7 = v28;
          uint64_t v17 = v27;
          unint64_t v11 = v26;
          uint64_t v16 = v25;

          id v14 = v52;
          int v9 = (os_log_t *)MEMORY[0x263F38100];

          long long v21 = *v9;
        }
        BOOL v31 = v11 == 4 && v20 == 2;
        BOOL v32 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v20 == v11 || v31)
        {
          if (v32)
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
            _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MATCH", buf, 0xCu);
          }
          BOOL v35 = 1;
          uint64_t v5 = v50;
          id v4 = v51;
          [(SSRVoiceProfileManager *)v49 emitMetricEnrollmentId:v50 isVoiceProfileiCloudSyncSuccess:1 failureReasonIfAny:@"not-applicable, no-failure" forLocale:v51];

          uint64_t v6 = (char *)v53;
          goto LABEL_38;
        }
        if (v32)
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
          _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MIS-MATCH", buf, 0xCu);
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v54 objects:v68 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  uint64_t v5 = v50;
  id v4 = v51;
  [(SSRVoiceProfileManager *)v49 emitMetricEnrollmentId:v50 isVoiceProfileiCloudSyncSuccess:0 failureReasonIfAny:@"Voice Profile Mismatch" forLocale:v51];
  os_log_t v34 = *v9;
  BOOL v35 = 0;
  uint64_t v6 = (char *)v53;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v36 = *(void **)(v7 + 2112);
    long long v37 = v34;
    long long v38 = [v36 deviceCategoryStringRepresentationForCategoryType:v11];
    *(_DWORD *)buf = 136315650;
    uint64_t v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
    __int16 v60 = 2114;
    __int16 v61 = v53;
    __int16 v62 = 2114;
    uint64_t v63 = v38;
    _os_log_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_DEFAULT, "%s CurrDevice: [%{public}@ : {%{public}@}] DOES NOT have VoiceProfile synced in iCloud", buf, 0x20u);

    BOOL v35 = 0;
  }
LABEL_38:

LABEL_39:
  return v35;
}

- (void)emitMetricEnrollmentId:(id)a3 isVoiceProfileiCloudSyncSuccess:(BOOL)a4 failureReasonIfAny:(id)a5 forLocale:(id)a6
{
  BOOL v8 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (os_log_t *)MEMORY[0x263F38100];
  __int16 v13 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = @"NO";
    *(_DWORD *)uint64_t v17 = 136315906;
    *(void *)&v17[4] = "-[SSRVoiceProfileManager emitMetricEnrollmentId:isVoiceProfileiCloudSyncSuccess:failureReasonIfAny:forLocale:]";
    if (v8) {
      id v14 = @"YES";
    }
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Emitting voice profile icloud sync metrics for enrollmentID %@, isSuccess %@, for reason %@...", v17, 0x2Au);
  }
  uint64_t v15 = objc_msgSend(MEMORY[0x263F380E8], "sharedLogger", *(_OWORD *)v17);
  [v15 logVoiceProfileICloudSyncFinishedForEnrollmentId:v9 isVoiceProfileiCloudSyncSuccess:v8 failureReasonIfAny:v10 forLocale:v11];

  uint64_t v16 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)&v17[4] = "-[SSRVoiceProfileManager emitMetricEnrollmentId:isVoiceProfileiCloudSyncSuccess:failureReasonIfAny:forLocale:]";
    _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Finished emitting voice profile icloud sync metrics.", v17, 0xCu);
  }
}

- (id)_createAndSetNewEnrollmentId
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF910] date];
  id v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = [v3 UUIDString];

  uint64_t v5 = [MEMORY[0x263F38068] sharedPreferences];
  [v5 setEnrollmentIdForVoiceProfileiCloudMetrics:v4 on:v2];

  uint64_t v6 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[SSRVoiceProfileManager _createAndSetNewEnrollmentId]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Returning enrollment ID %@...", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (id)createEnrollmentId
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F38100];
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    uint64_t v22 = "-[SSRVoiceProfileManager createEnrollmentId]";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Creating an enrollmentID...", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v5 = [MEMORY[0x263F38068] sharedPreferences];
  uint64_t v6 = [v5 dateWhenEnrollmentIdForVoiceProfileiCloudMetricsWasCreated];

  unint64_t v7 = [MEMORY[0x263F38068] sharedPreferences];
  int v8 = [v7 enrollmentIdForVoiceProfileiCloudMetrics];

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    __int16 v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      uint64_t v22 = "-[SSRVoiceProfileManager createEnrollmentId]";
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s No enrollmentId exists, create new one", (uint8_t *)&v21, 0xCu);
    }
    id v11 = [(SSRVoiceProfileManager *)self _createAndSetNewEnrollmentId];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263EFF910] date];
    id v13 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v13 setMonth:-6];
    id v14 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v15 = [v14 dateByAddingComponents:v13 toDate:v12 options:0];
    uint64_t v16 = [v6 compare:v15];
    uint64_t v17 = *v3;
    BOOL v18 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
    if (v16 == -1)
    {
      if (v18)
      {
        int v21 = 136315394;
        uint64_t v22 = "-[SSRVoiceProfileManager createEnrollmentId]";
        __int16 v23 = 2112;
        long long v24 = v6;
        _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s The date %@ is older than 6 months ago.", (uint8_t *)&v21, 0x16u);
      }
      id v19 = [(SSRVoiceProfileManager *)self _createAndSetNewEnrollmentId];
    }
    else
    {
      if (v18)
      {
        int v21 = 136315394;
        uint64_t v22 = "-[SSRVoiceProfileManager createEnrollmentId]";
        __int16 v23 = 2112;
        long long v24 = v6;
        _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s The date %@ is within 6 months. Reusing enrollment ID", (uint8_t *)&v21, 0x16u);
        uint64_t v17 = *v3;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315394;
        uint64_t v22 = "-[SSRVoiceProfileManager createEnrollmentId]";
        __int16 v23 = 2112;
        long long v24 = v8;
        _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Returning enrollment ID %@...", (uint8_t *)&v21, 0x16u);
      }
      id v19 = v8;
    }
    id v11 = v19;
  }

  return v11;
}

- (void)isVoiceProfileUploadedToiCloudForLanguageCode:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *, void))a4;
  unint64_t v7 = [MEMORY[0x263F380D0] deviceProductType];
  if (!v7)
  {
    id v11 = [NSString stringWithFormat:@"ERR: Unknown product type. Returning false, language: %@", v5];
    int v21 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]";
      __int16 v46 = 2114;
      id v47 = v11;
      _os_log_error_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    uint32_t v42 = @"reason";
    uint64_t v43 = v11;
    __int16 v23 = NSDictionary;
    long long v24 = &v43;
    uint64_t v25 = &v42;
    goto LABEL_18;
  }
  unint64_t v8 = +[SSRUtils deviceCategoryForDeviceProductType:v7];
  if (!v8)
  {
    id v11 = [NSString stringWithFormat:@"ERR: Unknown device-category for device: %@, languageCode: %@", v7, v5];
    unint64_t v26 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]";
      __int16 v46 = 2114;
      id v47 = v11;
      _os_log_error_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    __int16 v40 = @"reason";
    v41 = v11;
    __int16 v23 = NSDictionary;
    long long v24 = &v41;
    uint64_t v25 = &v40;
LABEL_18:
    id v19 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:1];
    __int16 v20 = [v22 errorWithDomain:@"com.apple.speakerrecognition" code:711 userInfo:v19];
    v6[2](v6, v20, 0);
    goto LABEL_19;
  }
  unint64_t v9 = v8;
  __int16 v10 = +[SSRUtils getVoiceProfileForSiriProfileId:0 forLanguageCode:v5];
  id v11 = v10;
  if (!v10)
  {
LABEL_9:
    uint64_t v17 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]";
      __int16 v46 = 2114;
      id v47 = v5;
      _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Querying VoiceProfile upload state on %{public}@", buf, 0x16u);
    }
    id v18 = objc_alloc_init(MEMORY[0x263F285E0]);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __92__SSRVoiceProfileManager_isVoiceProfileUploadedToiCloudForLanguageCode_withCompletionBlock___block_invoke;
    v30[3] = &unk_264429EE8;
    id v31 = v18;
    id v32 = 0;
    BOOL v35 = v6;
    id v33 = v7;
    unint64_t v36 = v9;
    id v34 = v5;
    BOOL v37 = v11 != 0;
    id v19 = v18;
    [v19 getDevicesWithAvailablePHSAssetsOnDeviceCheck:v30];

    __int16 v20 = v31;
    goto LABEL_19;
  }
  uint64_t v12 = [v10 getExplicitEnrollmentUtterancesForType:1];
  uint64_t v13 = [v12 count];

  id v14 = [v11 getExplicitEnrollmentUtterancesForType:3];
  uint64_t v15 = [v14 count];

  if ([v11 isMarkedSATEnrolled] && (unint64_t)(v15 + v13) >= 3)
  {
    uint64_t v16 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]";
      __int16 v46 = 2114;
      id v47 = v5;
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Triggering VoiceProfile upload for %{public}@", buf, 0x16u);
    }
    notify_post("com.apple.voicetrigger.PHSProfileModified");
    goto LABEL_9;
  }
  id v19 = [NSString stringWithFormat:@"ERR: Improper VoiceProfile detected: %@, languageCode: %@", v7, v5];
  uint64_t v27 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]";
    __int16 v46 = 2114;
    id v47 = v19;
    _os_log_error_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
  unint64_t v28 = (void *)MEMORY[0x263F087E8];
  long long v38 = @"reason";
  id v39 = v19;
  __int16 v20 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  BOOL v29 = [v28 errorWithDomain:@"com.apple.speakerrecognition" code:711 userInfo:v20];
  v6[2](v6, v29, 0);

LABEL_19:
}

void __92__SSRVoiceProfileManager_isVoiceProfileUploadedToiCloudForLanguageCode_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  unint64_t v8 = (os_log_t *)MEMORY[0x263F38100];
  unint64_t v9 = *MEMORY[0x263F38100];
  __int16 v10 = *MEMORY[0x263F38100];
  if (!v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 72);
      id v14 = v9;
      uint64_t v15 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v13];
      *(_DWORD *)buf = 136315906;
      __int16 v62 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
      __int16 v63 = 2114;
      uint64_t v64 = v12;
      __int16 v65 = 2114;
      __int16 v66 = v15;
      __int16 v67 = 2114;
      id v68 = v5;
      _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Looking VoiceProfile for CurrDevice: %{public}@{%{public}@} in devices %{public}@", buf, 0x2Au);
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v16 = v5;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v57 objects:v72 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      id v43 = v7;
      id v44 = 0;
      id v45 = v5;
      char v46 = 0;
      uint64_t v19 = *(void *)v58;
      uint64_t v47 = *(void *)v58;
      id v48 = v16;
      do
      {
        uint64_t v20 = 0;
        uint64_t v49 = v18;
        do
        {
          if (*(void *)v58 != v19)
          {
            uint64_t v21 = v20;
            objc_enumerationMutation(v16);
            uint64_t v20 = v21;
          }
          uint64_t v50 = v20;
          uint64_t v22 = *(void **)(*((void *)&v57 + 1) + 8 * v20);
          if (objc_msgSend(v22, "isEqualToString:", *(void *)(a1 + 56), v43, v44, v45))
          {
            __int16 v23 = [v16 objectForKeyedSubscript:v22];
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id obj = v23;
            uint64_t v24 = [obj countByEnumeratingWithState:&v53 objects:v71 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v54;
              while (2)
              {
                uint64_t v27 = 0;
                uint64_t v51 = v25;
                do
                {
                  if (*(void *)v54 != v26) {
                    objc_enumerationMutation(obj);
                  }
                  unint64_t v28 = *(void **)(*((void *)&v53 + 1) + 8 * v27);
                  unint64_t v29 = +[SSRUtils deviceCategoryForDeviceProductType:v28];
                  os_log_t v30 = *v8;
                  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v31 = *(void *)(a1 + 48);
                    uint64_t v32 = a1;
                    uint64_t v33 = *(void *)(a1 + 72);
                    id v34 = v30;
                    BOOL v35 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v33];
                    unint64_t v36 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v29];
                    *(_DWORD *)buf = 136316162;
                    __int16 v62 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
                    __int16 v63 = 2114;
                    uint64_t v64 = v31;
                    __int16 v65 = 2114;
                    __int16 v66 = v35;
                    __int16 v67 = 2114;
                    id v68 = v28;
                    __int16 v69 = 2114;
                    double v70 = v36;
                    _os_log_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_DEFAULT, "%s currDevice=[%{public}@ : {%{public}@}] ; syncedDevice=[%{public}@ : {%{public}@}]",
                      buf,
                      0x34u);

                    a1 = v32;
                    unint64_t v8 = (os_log_t *)MEMORY[0x263F38100];

                    uint64_t v25 = v51;
                  }
                  uint64_t v37 = *(void *)(a1 + 72);
                  if (v29 == v37)
                  {
                    long long v38 = *v8;
LABEL_31:
                    uint64_t v19 = v47;
                    id v16 = v48;
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      __int16 v62 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
                      _os_log_impl(&dword_21C8A5000, v38, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MATCH", buf, 0xCu);
                    }
                    char v46 = 1;
                    goto LABEL_34;
                  }
                  long long v38 = *v8;
                  if (v29 == 2 && v37 == 4) {
                    goto LABEL_31;
                  }
                  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    __int16 v62 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
                    _os_log_impl(&dword_21C8A5000, v38, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MIS-MATCH", buf, 0xCu);
                  }
                  ++v27;
                }
                while (v25 != v27);
                uint64_t v25 = [obj countByEnumeratingWithState:&v53 objects:v71 count:16];
                if (v25) {
                  continue;
                }
                break;
              }
              uint64_t v19 = v47;
              id v16 = v48;
LABEL_34:
              uint64_t v18 = v49;
            }
          }
          uint64_t v20 = v50 + 1;
        }
        while (v50 + 1 != v18);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v57 objects:v72 count:16];
      }
      while (v18);

      id v6 = v44;
      id v5 = v45;
      id v7 = v43;
      if (v46) {
        goto LABEL_44;
      }
    }
    else
    {
    }
    if (*(unsigned char *)(a1 + 80))
    {
      __int16 v40 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136315394;
        __int16 v62 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
        __int16 v63 = 2114;
        uint64_t v64 = v41;
        _os_log_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile available locally for %{public}@, not uploaded yet", buf, 0x16u);
      }
    }
LABEL_44:
    id v11 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_45;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v42 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    __int16 v62 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
    __int16 v63 = 2114;
    uint64_t v64 = v42;
    _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Fetching cached devices resulted in error %{public}@", buf, 0x16u);
  }
  id v11 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_45:
  v11();
}

- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3 withBackupMetaBlob:(id)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v5 = (char *)a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F380D0] deviceProductType];
  unint64_t v8 = (char *)v7;
  unint64_t v9 = (os_log_t *)MEMORY[0x263F38100];
  if (!v6)
  {
    id v16 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
      __int16 v69 = 2114;
      double v70 = v5;
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_INFO, "%s metaBlob is nil. Returning false, language: %{public}@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  if (v7)
  {
    unint64_t v10 = +[SSRUtils deviceCategoryForDeviceProductType:v7];
    if (v10)
    {
      if (v5)
      {
        unint64_t v11 = v10;
        id v66 = 0;
        uint64_t v12 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v66];
        uint64_t v13 = (char *)v66;
        id v14 = *v9;
        if (v13)
        {
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
            __int16 v69 = 2114;
            double v70 = v13;
            _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s ERR: Failed to deserialize metaBlob with error %{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v23 = v14;
            uint64_t v24 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v11];
            *(_DWORD *)buf = 136315906;
            id v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
            __int16 v69 = 2114;
            double v70 = v8;
            __int16 v71 = 2114;
            v72 = v24;
            __int16 v73 = 2114;
            v74 = v12;
            _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Looking VoiceProfile for CurrDevice: %{public}@{%{public}@} in metablob %{public}@", buf, 0x2Au);
          }
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v25 = v12;
          uint64_t v54 = [v25 countByEnumeratingWithState:&v62 objects:v78 count:16];
          if (v54)
          {
            uint64_t v55 = *(void *)v63;
            id v52 = v6;
            long long v53 = v5;
            long long v56 = v8;
            uint64_t v51 = v25;
            uint64_t v49 = v12;
            do
            {
              for (uint64_t i = 0; i != v54; ++i)
              {
                if (*(void *)v63 != v55) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v27 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                if (objc_msgSend(v27, "isEqualToString:", v5, v49))
                {
                  uint64_t v50 = i;
                  unint64_t v28 = [v25 objectForKeyedSubscript:v27];
                  long long v58 = 0u;
                  long long v59 = 0u;
                  long long v60 = 0u;
                  long long v61 = 0u;
                  id obj = v28;
                  uint64_t v29 = [obj countByEnumeratingWithState:&v58 objects:v77 count:16];
                  unint64_t v30 = 0x264428000uLL;
                  if (v29)
                  {
                    uint64_t v31 = v29;
                    uint64_t v32 = *(void *)v59;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v31; ++j)
                      {
                        if (*(void *)v59 != v32) {
                          objc_enumerationMutation(obj);
                        }
                        id v34 = *(void **)(*((void *)&v58 + 1) + 8 * j);
                        uint64_t v35 = [*(id *)(v30 + 2112) deviceCategoryForDeviceProductType:v34];
                        unint64_t v36 = *v9;
                        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                        {
                          uint64_t v37 = v9;
                          long long v38 = *(void **)(v30 + 2112);
                          id v39 = v36;
                          __int16 v40 = [v38 deviceCategoryStringRepresentationForCategoryType:v11];
                          uint64_t v41 = [*(id *)(v30 + 2112) deviceCategoryStringRepresentationForCategoryType:v35];
                          *(_DWORD *)buf = 136316162;
                          id v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
                          __int16 v69 = 2114;
                          double v70 = v56;
                          __int16 v71 = 2114;
                          v72 = v40;
                          __int16 v73 = 2114;
                          v74 = v34;
                          __int16 v75 = 2114;
                          id v76 = v41;
                          _os_log_impl(&dword_21C8A5000, v39, OS_LOG_TYPE_DEFAULT, "%s currDevice=[%{public}@ : {%{public}@}] ; syncedDevice=[%{public}@ : {%{public}@}]",
                            buf,
                            0x34u);

                          unint64_t v30 = 0x264428000;
                          unint64_t v36 = *v37;
                        }
                        BOOL v43 = v11 == 4 && v35 == 2;
                        BOOL v44 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
                        if (v35 == v11 || v43)
                        {
                          if (v44)
                          {
                            *(_DWORD *)buf = 136315138;
                            id v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
                            _os_log_impl(&dword_21C8A5000, v36, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MATCH", buf, 0xCu);
                          }

                          BOOL v15 = 1;
                          id v6 = v52;
                          id v5 = v53;
                          unint64_t v8 = (char *)v56;
                          uint64_t v13 = 0;
                          uint64_t v12 = v49;
                          goto LABEL_59;
                        }
                        if (v44)
                        {
                          *(_DWORD *)buf = 136315138;
                          id v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
                          _os_log_impl(&dword_21C8A5000, v36, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MIS-MATCH", buf, 0xCu);
                        }
                        unint64_t v9 = (os_log_t *)MEMORY[0x263F38100];
                      }
                      uint64_t v31 = [obj countByEnumeratingWithState:&v58 objects:v77 count:16];
                      if (v31) {
                        continue;
                      }
                      break;
                    }
                  }

                  id v6 = v52;
                  id v5 = v53;
                  unint64_t v8 = (char *)v56;
                  id v25 = v51;
                  uint64_t v13 = 0;
                  uint64_t i = v50;
                }
              }
              uint64_t v54 = [v25 countByEnumeratingWithState:&v62 objects:v78 count:16];
              uint64_t v12 = v49;
            }
            while (v54);
          }

          os_log_t v46 = *v9;
          BOOL v15 = 0;
          if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_59;
          }
          uint64_t v47 = v46;
          id v48 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v11];
          *(_DWORD *)buf = 136315650;
          id v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
          __int16 v69 = 2114;
          double v70 = v8;
          __int16 v71 = 2114;
          v72 = v48;
          _os_log_impl(&dword_21C8A5000, v47, OS_LOG_TYPE_DEFAULT, "%s CurrDevice: [%{public}@ : {%{public}@}] DOES NOT have VoiceProfile synced in iCloud", buf, 0x20u);
        }
        BOOL v15 = 0;
LABEL_59:

        goto LABEL_20;
      }
      os_log_t v17 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
        __int16 v69 = 2082;
        double v70 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
        uint64_t v18 = "%s ERR: %{public}s: Bailing out as language is nil!";
        goto LABEL_17;
      }
    }
    else
    {
      os_log_t v19 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
        __int16 v69 = 2114;
        double v70 = v8;
        __int16 v71 = 2114;
        v72 = v5;
        uint64_t v18 = "%s ERR: Unknown device-category for device: %{public}@, languageCode: %{public}@";
        uint64_t v20 = v19;
        uint32_t v21 = 32;
LABEL_18:
        _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, v18, buf, v21);
      }
    }
  }
  else
  {
    os_log_t v17 = (os_log_t)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
      __int16 v69 = 2114;
      double v70 = v5;
      uint64_t v18 = "%s ERR: Unknown device. Returning false, language: %{public}@";
LABEL_17:
      uint64_t v20 = v17;
      uint32_t v21 = 22;
      goto LABEL_18;
    }
  }
LABEL_19:
  uint64_t v13 = 0;
  BOOL v15 = 0;
LABEL_20:

  return v15;
}

- (id)getCachedVoiceProfileAvailabilityMetaBlob
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__6789;
  uint64_t v32 = __Block_byref_object_dispose__6790;
  id v33 = 0;
  id v2 = [MEMORY[0x263F380D0] deviceProductType];
  if (!v2)
  {
    unint64_t v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]";
      id v5 = "%s ERR: Unknown device - returning nil";
      id v6 = v8;
      uint32_t v7 = 12;
      goto LABEL_8;
    }
LABEL_11:
    id v10 = 0;
    goto LABEL_15;
  }
  unint64_t v3 = +[SSRUtils deviceCategoryForDeviceProductType:v2];
  if (v3 == 1)
  {
    unint64_t v9 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]";
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s NonAOP device-category - returning nil", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (!v3)
  {
    id v4 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]";
      __int16 v36 = 2114;
      intptr_t v37 = (intptr_t)v2;
      id v5 = "%s ERR: Unknown device-category for device: %{public}@";
      id v6 = v4;
      uint32_t v7 = 22;
LABEL_8:
      _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  id v11 = objc_alloc_init(MEMORY[0x263F285E0]);
  dispatch_time_t v12 = dispatch_time(0, 100000000);
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  id v14 = [MEMORY[0x263EFF910] date];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __67__SSRVoiceProfileManager_getCachedVoiceProfileAvailabilityMetaBlob__block_invoke;
  id v25 = &unk_264429EC0;
  BOOL v15 = v13;
  uint64_t v26 = v15;
  uint64_t v27 = &v28;
  [v11 getDevicesWithAvailablePHSAssetsOnDeviceCheck:&v22];
  intptr_t v16 = dispatch_semaphore_wait(v15, v12);
  os_log_t v17 = objc_msgSend(MEMORY[0x263EFF910], "date", v22, v23, v24, v25);
  [v17 timeIntervalSinceDate:v14];
  double v19 = v18;
  uint64_t v20 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]";
    __int16 v36 = 2048;
    intptr_t v37 = v16;
    __int16 v38 = 2048;
    double v39 = v19 * 1000.0;
    _os_log_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEFAULT, "%s CachedVoiceProfileFetch: Done Waiting with timedOut=%ld, waitTimeMs: %fms", buf, 0x20u);
  }
  id v10 = (id)v29[5];

LABEL_15:
  _Block_object_dispose(&v28, 8);

  return v10;
}

void __67__SSRVoiceProfileManager_getCachedVoiceProfileAvailabilityMetaBlob__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint32_t v7 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]_block_invoke";
      __int16 v36 = 2114;
      id v37 = v6;
      _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Fetching cached devices resulted in error %{public}@", buf, 0x16u);
    }
    goto LABEL_26;
  }
  if (!v5)
  {
    uint64_t v26 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]_block_invoke";
      _os_log_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_DEFAULT, "%s Devices with voice profile is nil!", buf, 0xCu);
    }
    goto LABEL_26;
  }
  uint64_t v28 = a1;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v27 = v5;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    dispatch_semaphore_t v13 = (os_log_t *)MEMORY[0x263F38100];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        intptr_t v16 = +[SSRUtils getVoiceProfileForSiriProfileId:0 forLanguageCode:v15];
        if ([v16 isMarkedSATEnrolled])
        {
          os_log_t v17 = [v9 objectForKeyedSubscript:v15];
          [v8 setObject:v17 forKeyedSubscript:v15];
        }
        else
        {
          double v18 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]_block_invoke";
            __int16 v36 = 2114;
            id v37 = v15;
            _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Skipping %{public}@ not locally present", buf, 0x16u);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v11);
  }

  a1 = v28;
  if (!v8 || ![v8 count])
  {
LABEL_23:

    id v6 = 0;
    id v5 = v27;
LABEL_26:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_27;
  }
  double v19 = (void *)MEMORY[0x263F08900];
  uint64_t v20 = (void *)[v8 copy];
  id v29 = 0;
  uint32_t v21 = [v19 dataWithJSONObject:v20 options:0 error:&v29];
  id v22 = v29;

  uint64_t v23 = *MEMORY[0x263F38100];
  if (v21 && !v22)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]_block_invoke";
      __int16 v36 = 2114;
      id v37 = v9;
      _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Cached devices with VoiceProfile in iCloud: %{public}@", buf, 0x16u);
    }
    uint64_t v24 = *(void *)(*(void *)(v28 + 40) + 8);
    id v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v21;

    goto LABEL_23;
  }
  id v6 = 0;
  id v5 = v27;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]_block_invoke";
    __int16 v36 = 2112;
    id v37 = v21;
    __int16 v38 = 2112;
    id v39 = v22;
    _os_log_error_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_ERROR, "%s ERR: error creating profilesJsonData: %@, err: %@", buf, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v28 + 32));

LABEL_27:
}

- (BOOL)_isMarkedForVoiceProfileTrainingSyncForLanguage:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    _CSNotBackedupPreferencesValueForKey();
    id v4 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v4) {
      goto LABEL_7;
    }
    id v5 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = "-[SSRVoiceProfileManager _isMarkedForVoiceProfileTrainingSyncForLanguage:]";
      __int16 v11 = 2114;
      uint64_t v12 = v4;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile training sync language: %{public}@, VoiceProfile language: %{public}@", (uint8_t *)&v9, 0x20u);
    }
    if ([v3 isEqualToString:v4])
    {
      _CSNotBackedupPreferencesSetValueForKey();
      CSNotBackedupInternalPreferencesSynchronize();
      BOOL v6 = 1;
    }
    else
    {
LABEL_7:
      BOOL v6 = 0;
    }
  }
  else
  {
    uint32_t v7 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[SSRVoiceProfileManager _isMarkedForVoiceProfileTrainingSyncForLanguage:]";
      __int16 v11 = 2082;
      uint64_t v12 = "-[SSRVoiceProfileManager _isMarkedForVoiceProfileTrainingSyncForLanguage:]";
      _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s ERR: %{public}s: Bailing out as language is nil!", (uint8_t *)&v9, 0x16u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_markVoiceProfileTrainingSyncForLanguage:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = (char *)a3;
  id v4 = *MEMORY[0x263F38100];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      BOOL v6 = "-[SSRVoiceProfileManager _markVoiceProfileTrainingSyncForLanguage:]";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Setting VoiceProfile Training Sync for language: %{public}@", (uint8_t *)&v5, 0x16u);
    }
    _CSNotBackedupPreferencesSetValueForKey();
    CSNotBackedupInternalPreferencesSynchronize();
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[SSRVoiceProfileManager _markVoiceProfileTrainingSyncForLanguage:]";
    __int16 v7 = 2082;
    id v8 = "-[SSRVoiceProfileManager _markVoiceProfileTrainingSyncForLanguage:]";
    _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s ERR: %{public}s: Bailing out as language is nil!", (uint8_t *)&v5, 0x16u);
  }
}

- (id)_prepareVoiceProfileWithSiriProfileId:(id)a3 withUploadBlock:(id)a4
{
  v94[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  __int16 v69 = (void (**)(id, void *, void *))a4;
  __int16 v71 = self;
  __int16 v7 = [(SSRVoiceProfileManager *)self _CSSATUploadPathForSiriProfileId:v6];
  id v8 = [MEMORY[0x263F08850] defaultManager];
  if ([v8 fileExistsAtPath:v7])
  {
    id v77 = 0;
    char v9 = [v8 removeItemAtPath:v7 error:&v77];
    id v10 = v77;
    id v11 = v10;
    if ((v9 & 1) == 0)
    {
      uint64_t v12 = NSString;
      __int16 v13 = [v10 localizedDescription];
      id v14 = [v12 stringWithFormat:@"Cannot delete existing SATUpload Diretory : %@", v13];

      uint64_t v15 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
        __int16 v84 = 2114;
        v85 = v14;
        _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      intptr_t v16 = (void *)MEMORY[0x263F087E8];
      v93 = @"reason";
      v94[0] = v14;
      os_log_t v17 = [NSDictionary dictionaryWithObjects:v94 forKeys:&v93 count:1];
      double v18 = v16;
      uint64_t v19 = 708;
LABEL_37:
      os_log_t v46 = [v18 errorWithDomain:@"com.apple.speakerrecognition" code:v19 userInfo:v17];
      goto LABEL_44;
    }
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v20 = v11;
  id v76 = v11;
  char v21 = [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v76];
  id v11 = v76;

  if ((v21 & 1) == 0)
  {
    uint64_t v47 = NSString;
    id v48 = [v11 localizedDescription];
    id v14 = [v47 stringWithFormat:@"Cannot create SAT Upload Directory : %@", v48];

    uint64_t v49 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
      __int16 v84 = 2114;
      v85 = v14;
      _os_log_error_impl(&dword_21C8A5000, v49, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    uint64_t v50 = (void *)MEMORY[0x263F087E8];
    v91 = @"reason";
    v92 = v14;
    os_log_t v17 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    double v18 = v50;
    uint64_t v19 = 709;
    goto LABEL_37;
  }
  [(SSRVoiceProfileManager *)v71 _getVoiceProfilePathsToBeUploadedForSiriProfileId:v6];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [v22 countByEnumeratingWithState:&v72 objects:v90 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    long long v65 = v8;
    id v66 = v6;
    uint64_t v70 = *(void *)v73;
    id v67 = v22;
    id v68 = v7;
    while (2)
    {
      uint64_t v25 = 0;
      uint64_t v26 = v11;
      do
      {
        if (*(void *)v73 != v70) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v72 + 1) + 8 * v25);
        uint64_t v28 = [v22 objectForKeyedSubscript:v27];
        id v29 = [v28 languageCode];
        long long v30 = [v7 stringByAppendingPathComponent:v29];

        id v11 = [(SSRVoiceProfileManager *)v71 _copyVoiceProfileAtPath:v27 toPath:v30];
        long long v31 = *MEMORY[0x263F38100];
        long long v32 = *MEMORY[0x263F38100];
        if (v11)
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
            __int16 v84 = 2112;
            v85 = v27;
            __int16 v86 = 2112;
            v87 = v30;
            __int16 v88 = 2114;
            id v89 = v11;
            _os_log_error_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_ERROR, "%s Cannot copy voice profile from %@ to %@ with error %{public}@", buf, 0x2Au);
          }
          id v33 = +[SSRUtils removeItemAtPath:v30];
        }
        else
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
            __int16 v84 = 2112;
            v85 = v27;
            _os_log_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_DEFAULT, "%s Triggering upload of voice profile %@", buf, 0x16u);
          }
          uint64_t v34 = v69[2](v69, v28, v30);
          if (v34)
          {
            uint64_t v35 = (void *)v34;
            uint64_t v51 = NSString;
            id v52 = [v28 languageCode];
            long long v53 = [v35 localizedDescription];
            __int16 v36 = [v51 stringWithFormat:@"Failed to upload %@ with error %@ - Bailing out", v52, v53];

            uint64_t v54 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
              __int16 v84 = 2114;
              v85 = v36;
              _os_log_error_impl(&dword_21C8A5000, v54, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
            }
            uint64_t v55 = (void *)MEMORY[0x263F087E8];
            v80 = @"reason";
            v81 = v36;
            long long v56 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
            os_log_t v46 = [v55 errorWithDomain:@"com.apple.speakerrecognition" code:717 userInfo:v56];
            goto LABEL_41;
          }
          uint64_t v35 = [v27 stringByAppendingPathComponent:@"enrollment_version.json"];
          __int16 v36 = +[SSRUtils getVoiceProfileIdentityFromVersionFilePath:v35];
          id v37 = (void *)*MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            __int16 v38 = v37;
            id v39 = [v28 productCategory];
            *(_DWORD *)buf = 136315906;
            v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
            __int16 v84 = 2114;
            v85 = v36;
            __int16 v86 = 2112;
            v87 = v30;
            __int16 v88 = 2114;
            id v89 = v39;
            _os_log_impl(&dword_21C8A5000, v38, OS_LOG_TYPE_DEFAULT, "%s Upload of voice profile with identifier %{public}@ at %@ with category %{public}@ completed successfully", buf, 0x2Au);
          }
          if (CSIsIOS())
          {
            if ((CSIsCommunalDevice() & 1) == 0)
            {
              uint64_t v40 = [v28 languageCode];
              BOOL v41 = [(SSRVoiceProfileManager *)v71 _isMarkedForVoiceProfileTrainingSyncForLanguage:v40];

              if (v41)
              {
                uint64_t v42 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:5];
                [v28 setProductCategory:v42];

                BOOL v43 = *MEMORY[0x263F38100];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
                  __int16 v84 = 2112;
                  v85 = v27;
                  _os_log_impl(&dword_21C8A5000, v43, OS_LOG_TYPE_DEFAULT, "%s Triggering upload of explicit voice profile %@", buf, 0x16u);
                }
                uint64_t v44 = v69[2](v69, v28, v30);
                if (v44)
                {
                  long long v56 = (void *)v44;
                  long long v58 = NSString;
                  long long v59 = [v28 languageCode];
                  long long v60 = [v56 localizedDescription];
                  long long v61 = [v58 stringWithFormat:@"Failed to upload %@ with error %@ - Bailing out", v59, v60];

                  long long v62 = *MEMORY[0x263F38100];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
                    __int16 v84 = 2114;
                    v85 = v61;
                    _os_log_error_impl(&dword_21C8A5000, v62, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
                  }
                  long long v63 = (void *)MEMORY[0x263F087E8];
                  v78 = @"reason";
                  uint64_t v79 = v61;
                  long long v64 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
                  os_log_t v46 = [v63 errorWithDomain:@"com.apple.speakerrecognition" code:717 userInfo:v64];

LABEL_41:
                  id v8 = v65;
                  id v6 = v66;

                  id v11 = 0;
                  os_log_t v17 = v67;
                  __int16 v7 = v68;
                  goto LABEL_43;
                }
                id v45 = *MEMORY[0x263F38100];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
                  __int16 v84 = 2112;
                  v85 = v30;
                  _os_log_impl(&dword_21C8A5000, v45, OS_LOG_TYPE_DEFAULT, "%s Upload of explicit voice profile at %@ completed successfully", buf, 0x16u);
                }
              }
            }
          }

          id v22 = v67;
          __int16 v7 = v68;
        }

        ++v25;
        uint64_t v26 = v11;
      }
      while (v24 != v25);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v72 objects:v90 count:16];
      if (v24) {
        continue;
      }
      break;
    }
    os_log_t v17 = v22;
    os_log_t v46 = 0;
    id v14 = v17;
    id v8 = v65;
    id v6 = v66;
  }
  else
  {
    os_log_t v17 = v22;
    os_log_t v46 = 0;
LABEL_43:
    id v14 = v17;
  }
LABEL_44:

  return v46;
}

- (id)_copyVoiceProfileAtPath:(id)a3 toPath:(id)a4
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v53 = a4;
  uint64_t v49 = v5;
  id v6 = [NSURL fileURLWithPath:v5];
  __int16 v7 = +[SSRUtils getContentsOfDirectory:v6];

  uint64_t v50 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v73 = 0;
  long long v74 = &v73;
  uint64_t v75 = 0x3032000000;
  id v76 = __Block_byref_object_copy__6789;
  id v77 = __Block_byref_object_dispose__6790;
  id v78 = 0;
  uint64_t v69 = 0;
  uint64_t v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  uint64_t v65 = 0;
  id v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v61 objects:v89 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v62;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v62 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v61 + 1) + 8 * v10);
        uint64_t v12 = [v11 lastPathComponent];
        __int16 v13 = [v11 path];
        id v14 = [v13 lastPathComponent];
        uint64_t v15 = [v53 stringByAppendingPathComponent:v14];

        intptr_t v16 = +[SSRUtils stringForCSSpIdType:1];
        if ([v12 isEqualToString:v16])
        {

LABEL_9:
          uint64_t v19 = [v11 path];
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __57__SSRVoiceProfileManager__copyVoiceProfileAtPath_toPath___block_invoke;
          v56[3] = &unk_264429E90;
          long long v58 = &v73;
          id v20 = v12;
          id v57 = v20;
          long long v59 = &v69;
          long long v60 = &v65;
          [(SSRVoiceProfileManager *)self _copyExplicitEnrollmentFilesFromPath:v19 toPath:v15 withCompletion:v56];

          if (v74[5])
          {
            uint64_t v34 = (id)*MEMORY[0x263F38100];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              id v45 = [v11 path];
              uint64_t v46 = v74[5];
              *(_DWORD *)buf = 136315906;
              v80 = "-[SSRVoiceProfileManager _copyVoiceProfileAtPath:toPath:]";
              __int16 v81 = 2114;
              *(void *)v82 = v45;
              *(_WORD *)&v82[8] = 2114;
              *(void *)v83 = v15;
              *(_WORD *)&v83[8] = 2114;
              v84[0] = v46;
              _os_log_error_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_ERROR, "%s ERR: Failed to copy from %{public}@ to %{public}@ with error %{public}@", buf, 0x2Au);
            }
            id v33 = (id)v74[5];
            char v21 = v57;
            uint64_t v12 = v20;
LABEL_38:

            goto LABEL_39;
          }
          char v21 = v57;
LABEL_11:

          goto LABEL_12;
        }
        os_log_t v17 = +[SSRUtils stringForCSSpIdType:3];
        int v18 = [v12 isEqualToString:v17];

        if (v18) {
          goto LABEL_9;
        }
        if (([v12 isEqualToString:@"meta_version.json"] & 1) != 0
          || [v12 isEqualToString:@"enrollment_version.json"])
        {
          char v21 = [v15 stringByDeletingLastPathComponent];
          id v22 = (id *)(v74 + 5);
          id v55 = (id)v74[5];
          char v23 = [v50 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v55];
          objc_storeStrong(v22, v55);
          if ((v23 & 1) == 0)
          {
            BOOL v43 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
            {
              uint64_t v48 = v74[5];
              *(_DWORD *)buf = 136315650;
              v80 = "-[SSRVoiceProfileManager _copyVoiceProfileAtPath:toPath:]";
              __int16 v81 = 2114;
              *(void *)v82 = v21;
              *(_WORD *)&v82[8] = 2114;
              *(void *)v83 = v48;
              _os_log_error_impl(&dword_21C8A5000, v43, OS_LOG_TYPE_ERROR, "%s Cannot create %{public}@ with error %{public}@ - Skipping language", buf, 0x20u);
            }
            id v33 = (id)v74[5];
            goto LABEL_38;
          }
          uint64_t v24 = (id *)(v74 + 5);
          id v54 = (id)v74[5];
          int v25 = [v50 copyItemAtPath:v13 toPath:v15 error:&v54];
          objc_storeStrong(v24, v54);
          uint64_t v26 = v74;
          if (!v25 || v74[5])
          {
            id v37 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
            {
              uint64_t v47 = v26[5];
              *(_DWORD *)buf = 136315906;
              v80 = "-[SSRVoiceProfileManager _copyVoiceProfileAtPath:toPath:]";
              __int16 v81 = 2114;
              *(void *)v82 = v13;
              *(_WORD *)&v82[8] = 2114;
              *(void *)v83 = v15;
              *(_WORD *)&v83[8] = 2114;
              v84[0] = v47;
              _os_log_error_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_ERROR, "%s ERR: Cannot copy file %{public}@ to %{public}@ with error %{public}@", buf, 0x2Au);
              uint64_t v26 = v74;
            }
            __int16 v38 = NSString;
            id v39 = [(id)v26[5] localizedDescription];
            uint64_t v40 = [v38 stringWithFormat:@"Failed to copy to SATUpload Diretory : %@", v39];

            BOOL v41 = (void *)MEMORY[0x263F087E8];
            v87 = @"reason";
            __int16 v88 = v40;
            uint64_t v42 = [NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
            id v33 = [v41 errorWithDomain:@"com.apple.speakerrecognition" code:721 userInfo:v42];

            goto LABEL_38;
          }
          goto LABEL_11;
        }
LABEL_12:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v27 = [obj countByEnumeratingWithState:&v61 objects:v89 count:16];
      uint64_t v8 = v27;
    }
    while (v27);
  }

  unint64_t v28 = v70[3];
  if (v28 > 2 || (unint64_t)v66[3] > 2)
  {
    uint64_t v35 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = v66[3];
      *(_DWORD *)buf = 136316162;
      v80 = "-[SSRVoiceProfileManager _copyVoiceProfileAtPath:toPath:]";
      __int16 v81 = 1026;
      *(_DWORD *)v82 = v28;
      *(_WORD *)&v82[4] = 1026;
      *(_DWORD *)&v82[6] = v36;
      *(_WORD *)v83 = 2112;
      *(void *)&v83[2] = v49;
      LOWORD(v84[0]) = 2112;
      *(void *)((char *)v84 + 2) = v53;
      _os_log_impl(&dword_21C8A5000, v35, OS_LOG_TYPE_DEFAULT, "%s Successfully copied {%{public}d,%{public}d} utterances from %@ to %@", buf, 0x2Cu);
    }
    id v33 = 0;
  }
  else
  {
    id v29 = [NSString stringWithFormat:@"ERR: Number of training utterances copied from %@ to %@ is too less %ld", v49, v53, v28];
    long long v30 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v80 = "-[SSRVoiceProfileManager _copyVoiceProfileAtPath:toPath:]";
      __int16 v81 = 2114;
      *(void *)v82 = v29;
      _os_log_error_impl(&dword_21C8A5000, v30, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    long long v31 = (void *)MEMORY[0x263F087E8];
    v85 = @"reason";
    __int16 v86 = v29;
    long long v32 = [NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
    id v33 = [v31 errorWithDomain:@"com.apple.speakerrecognition" code:733 userInfo:v32];
  }
LABEL_39:
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  return v33;
}

void __57__SSRVoiceProfileManager__copyVoiceProfileAtPath_toPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = *(void **)(a1 + 32);
  __int16 v7 = +[SSRUtils stringForCSSpIdType:1];
  LODWORD(v6) = [v6 isEqualToString:v7];

  uint64_t v8 = 56;
  if (v6) {
    uint64_t v8 = 48;
  }
  *(void *)(*(void *)(*(void *)(a1 + v8) + 8) + 24) = a3;
}

- (void)_copyExplicitEnrollmentFilesFromPath:(id)a3 toPath:(id)a4 withCompletion:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id, void))a5;
  [MEMORY[0x263F08850] defaultManager];
  v47 = id v57 = 0;
  uint64_t v49 = v9;
  LOBYTE(a5) = [v47 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v57];
  id v51 = v57;
  if (a5)
  {
    uint64_t v44 = v10;
    id v11 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v12 = [v11 enumeratorAtPath:v8];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v68 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v50 = 0;
      uint64_t v16 = *(void *)v54;
      id v45 = v13;
      id v46 = v8;
LABEL_4:
      uint64_t v17 = 0;
      uint64_t v48 = v15;
      while (1)
      {
        if (*(void *)v54 != v16) {
          objc_enumerationMutation(v13);
        }
        int v18 = *(void **)(*((void *)&v53 + 1) + 8 * v17);
        uint64_t v19 = [v8 stringByAppendingPathComponent:v18];
        BOOL v20 = [(SSRVoiceProfileManager *)self _isDirectory:v19];

        if (v20) {
          goto LABEL_23;
        }
        uint64_t v21 = v16;
        id v22 = self;
        char v23 = [v18 pathExtension];
        if ([v18 containsString:@"audiocache"])
        {
          uint64_t v24 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            long long v61 = "-[SSRVoiceProfileManager _copyExplicitEnrollmentFilesFromPath:toPath:withCompletion:]";
            __int16 v62 = 2112;
            id v63 = v18;
            _os_log_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_DEFAULT, "%s Skipping audiocache file %@", buf, 0x16u);
          }
          goto LABEL_22;
        }
        if (([v23 isEqualToString:@"wav"] & 1) != 0
          || [v23 isEqualToString:@"json"])
        {
          break;
        }
LABEL_22:

        self = v22;
        uint64_t v16 = v21;
LABEL_23:
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v68 count:16];
          if (v15) {
            goto LABEL_4;
          }
          goto LABEL_33;
        }
      }
      id v25 = v13;
      uint64_t v26 = [v8 stringByAppendingPathComponent:v18];
      uint64_t v27 = [v49 stringByAppendingPathComponent:v18];
      unint64_t v28 = [v18 lastPathComponent];
      char v29 = [v28 isEqualToString:@"enrollment_version.json"];

      if ((v29 & 1) == 0)
      {
        long long v30 = [NSURL fileURLWithPath:v26];
        long long v31 = +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:v30];

        if (v31 && ([v31 isEqualToString:@"implicit"] & 1) != 0)
        {

          id v13 = v25;
          id v8 = v46;
LABEL_21:
          uint64_t v15 = v48;
          goto LABEL_22;
        }
      }
      unsigned int v32 = [v23 isEqualToString:@"wav"];
      id v33 = [v27 stringByDeletingLastPathComponent];
      +[SSRUtils createDirectoryIfDoesNotExist:v33];

      id v52 = 0;
      LODWORD(v33) = [v47 copyItemAtPath:v26 toPath:v27 error:&v52];
      id v34 = v52;
      if (!v33 || v34)
      {
        id v51 = v34;
        id v37 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          long long v61 = "-[SSRVoiceProfileManager _copyExplicitEnrollmentFilesFromPath:toPath:withCompletion:]";
          __int16 v62 = 2114;
          id v63 = v26;
          __int16 v64 = 2114;
          id v65 = v27;
          __int16 v66 = 2114;
          id v67 = v51;
          _os_log_error_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_ERROR, "%s Cannot copy file %{public}@ to %{public}@ with error %{public}@", buf, 0x2Au);
        }
        __int16 v38 = NSString;
        id v39 = [v51 localizedDescription];
        uint64_t v40 = [v38 stringWithFormat:@"Failed to copy to SATUpload Diretory : %@", v39];

        BOOL v41 = (void *)MEMORY[0x263F087E8];
        long long v58 = @"reason";
        long long v59 = v40;
        uint64_t v42 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        BOOL v43 = [v41 errorWithDomain:@"com.apple.speakerrecognition" code:721 userInfo:v42];
        uint64_t v10 = v44;
        v44[2](v44, v43, 0);

        id v13 = v45;
        id v8 = v46;
        goto LABEL_34;
      }
      v50 += v32;

      id v51 = 0;
      id v13 = v45;
      id v8 = v46;
      goto LABEL_21;
    }
    uint64_t v50 = 0;
LABEL_33:

    uint64_t v10 = v44;
    v44[2](v44, 0, v50);
LABEL_34:

    uint64_t v36 = v51;
  }
  else
  {
    uint64_t v35 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      long long v61 = "-[SSRVoiceProfileManager _copyExplicitEnrollmentFilesFromPath:toPath:withCompletion:]";
      __int16 v62 = 2114;
      id v63 = v9;
      __int16 v64 = 2114;
      id v65 = v51;
      _os_log_error_impl(&dword_21C8A5000, v35, OS_LOG_TYPE_ERROR, "%s Cannot create %{public}@ with error %{public}@ - Skipping language", buf, 0x20u);
    }
    uint64_t v36 = v51;
    v10[2](v10, v51, 0);
  }
}

- (id)_getVoiceProfilePathsToBeUploadedForSiriProfileId:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = AFPreferencesSupportedLanguages();
  int v6 = CSIsCommunalDevice();
  if (v3 || !v6)
  {
    id v29 = v3;
    id v9 = +[SSRUtils getVoiceProfilesForSiriProfileId:v3];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (!v10) {
      goto LABEL_26;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    id v13 = (os_log_t *)MEMORY[0x263F38100];
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (v5)
        {
          uint64_t v16 = [*(id *)(*((void *)&v31 + 1) + 8 * i) locale];
          char v17 = [v5 containsObject:v16];

          if ((v17 & 1) == 0)
          {
            os_log_t v21 = *v13;
            if (!os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT)) {
              continue;
            }
            int v18 = v21;
            BOOL v20 = [v15 locale];
            *(_DWORD *)buf = 136315650;
            uint64_t v36 = "-[SSRVoiceProfileManager _getVoiceProfilePathsToBeUploadedForSiriProfileId:]";
            __int16 v37 = 2114;
            __int16 v38 = v20;
            __int16 v39 = 2114;
            uint64_t v40 = v5;
            p_super = &v18->super;
            char v23 = "%s Unsupported languagecode %{public}@ in %{public}@ - Skipping";
            uint32_t v24 = 32;
LABEL_20:
            _os_log_impl(&dword_21C8A5000, p_super, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
            goto LABEL_23;
          }
        }
        if (![v15 voiceProfileVersion])
        {
          os_log_t v25 = *v13;
          if (!os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT)) {
            continue;
          }
          int v18 = v25;
          BOOL v20 = [v15 locale];
          *(_DWORD *)buf = 136315906;
          uint64_t v36 = "-[SSRVoiceProfileManager _getVoiceProfilePathsToBeUploadedForSiriProfileId:]";
          __int16 v37 = 2114;
          __int16 v38 = v20;
          __int16 v39 = 2048;
          uint64_t v40 = 0;
          __int16 v41 = 2048;
          uint64_t v42 = 1;
          p_super = &v18->super;
          char v23 = "%s Skipping uploading %{public}@ legacy version (%lu) of voice profile, current version %lu";
          uint32_t v24 = 42;
          goto LABEL_20;
        }
        if ([v15 isMarkedSATEnrolled])
        {
          int v18 = [[SSRVoiceProfileMetaContext alloc] initWithVoiceProfile:v15];
          uint64_t v19 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:self->_currentDeviceCategory];
          [(SSRVoiceProfileMetaContext *)v18 setProductCategory:v19];

          [(SSRVoiceProfileMetaContext *)v18 setVersion:&unk_26CD455C8];
          BOOL v20 = [v15 voiceProfileBasePath];
          [v4 setObject:v18 forKey:v20];
        }
        else
        {
          os_log_t v26 = *v13;
          if (!os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT)) {
            continue;
          }
          int v18 = v26;
          BOOL v20 = [v15 locale];
          uint64_t v27 = [v15 profileID];
          *(_DWORD *)buf = 136315650;
          uint64_t v36 = "-[SSRVoiceProfileManager _getVoiceProfilePathsToBeUploadedForSiriProfileId:]";
          __int16 v37 = 2114;
          __int16 v38 = v20;
          __int16 v39 = 2112;
          uint64_t v40 = v27;
          _os_log_impl(&dword_21C8A5000, &v18->super, OS_LOG_TYPE_DEFAULT, "%s Skipping uploading %{public}@ voice profile for profileId %@", buf, 0x20u);
        }
LABEL_23:
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (!v11)
      {
LABEL_26:
        id v8 = v4;

        id v3 = v29;
        goto LABEL_27;
      }
    }
  }
  __int16 v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v36 = "-[SSRVoiceProfileManager _getVoiceProfilePathsToBeUploadedForSiriProfileId:]";
    _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s ERR: siriProfileId is nil - Bailing out", buf, 0xCu);
  }
  id v8 = 0;
LABEL_27:

  return v8;
}

- (void)notifyUserVoiceProfileUploadComplete
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SSRVoiceProfileManager_notifyUserVoiceProfileUploadComplete__block_invoke;
  block[3] = &unk_26442A618;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __62__SSRVoiceProfileManager_notifyUserVoiceProfileUploadComplete__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [*(id *)(a1 + 32) _CSSATLegacyUploadPath];
  if ([v2 fileExistsAtPath:v3])
  {
    id v9 = 0;
    char v4 = [v2 removeItemAtPath:v3 error:&v9];
    id v5 = v9;
    if ((v4 & 1) == 0)
    {
      int v6 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        __int16 v7 = v6;
        id v8 = [v5 localizedDescription];
        *(_DWORD *)buf = 136315394;
        uint64_t v11 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUploadComplete]_block_invoke";
        __int16 v12 = 2114;
        id v13 = v8;
        _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s Cannot delete existing SATUpload Diretory : %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v5 = 0;
  }
}

- (id)getUserVoiceProfileUploadPathWithEnrolledLanguageList:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (CSIsCommunalDevice())
  {
    char v4 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]";
      _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s Legacy upload API called on Horseman - Bailing out", (uint8_t *)&buf, 0xCu);
    }
    id v5 = 0;
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__6789;
    __int16 v12 = __Block_byref_object_dispose__6790;
    id v13 = [(SSRVoiceProfileManager *)self _CSSATLegacyUploadPath];
    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __80__SSRVoiceProfileManager_getUserVoiceProfileUploadPathWithEnrolledLanguageList___block_invoke;
    v8[3] = &unk_26442A648;
    v8[4] = self;
    v8[5] = &buf;
    dispatch_sync(queue, v8);
    id v5 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);
  }

  return v5;
}

void __80__SSRVoiceProfileManager_getUserVoiceProfileUploadPathWithEnrolledLanguageList___block_invoke(uint64_t a1)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  unint64_t v2 = 0x263F08000uLL;
  id v3 = [MEMORY[0x263F08850] defaultManager];
  if ([v3 fileExistsAtPath:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)])
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v76 = 0;
    char v5 = [v3 removeItemAtPath:v4 error:&v76];
    id v6 = v76;
    if ((v5 & 1) == 0)
    {
      __int16 v7 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        id v8 = v7;
        id v9 = [v6 localizedDescription];
        *(_DWORD *)long long buf = 136315394;
        uint64_t v79 = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]_block_invoke";
        __int16 v80 = 2114;
        uint64_t v81 = (uint64_t)v9;
        uint64_t v10 = "%s Cannot delete existing SATUpload Diretory : %{public}@";
LABEL_51:
        _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);

        goto LABEL_40;
      }
      goto LABEL_40;
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v11 = v6;
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v75 = v6;
  char v13 = [v3 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v75];
  id v6 = v75;

  if ((v13 & 1) == 0)
  {
    BOOL v43 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      id v8 = v43;
      id v9 = [v6 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v79 = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]_block_invoke";
      __int16 v80 = 2114;
      uint64_t v81 = (uint64_t)v9;
      uint64_t v10 = "%s Cannot create SAT Upload Directory : %{public}@";
      goto LABEL_51;
    }
LABEL_40:
    uint64_t v44 = *(void *)(*(void *)(a1 + 40) + 8);
    id v14 = *(id *)(v44 + 40);
    *(void *)(v44 + 40) = 0;
    goto LABEL_49;
  }
  [*(id *)(a1 + 32) _getVoiceProfilePathsToBeUploadedForSiriProfileId:0];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v56 = [v14 countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v56)
  {
    uint64_t v57 = *(void *)v72;
    *(void *)&long long v15 = 136315650;
    long long v53 = v15;
    __int16 v62 = v3;
    id v54 = v14;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v72 != v57) {
          objc_enumerationMutation(v14);
        }
        uint64_t v59 = v16;
        char v17 = *(void **)(*((void *)&v71 + 1) + 8 * v16);
        int v18 = objc_msgSend(v14, "objectForKeyedSubscript:", v17, v53);
        uint64_t v19 = [v18 languageCode];

        id v20 = v17;
        uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingPathComponent:v19];
        long long v60 = v20;
        id v22 = [v20 stringByAppendingPathComponent:@"td"];
        uint64_t v23 = [*(id *)(v2 + 2128) defaultManager];
        uint32_t v24 = [(id)v23 enumeratorAtPath:v22];

        id v70 = v6;
        id v63 = (void *)v21;
        LOBYTE(v23) = [v62 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v70];
        id v25 = v70;

        long long v58 = v24;
        if (v23)
        {
          long long v55 = v19;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id obj = v24;
          uint64_t v26 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v67;
            while (2)
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v67 != v28) {
                  objc_enumerationMutation(obj);
                }
                long long v30 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                uint64_t v31 = a1;
                long long v32 = *(void **)(a1 + 32);
                long long v33 = [v22 stringByAppendingPathComponent:v30];
                LODWORD(v32) = [v32 _isDirectory:v33];

                if (v32)
                {
                  long long v34 = [v63 stringByAppendingPathComponent:v30];
                  id v65 = v25;
                  char v35 = [v62 createDirectoryAtPath:v34 withIntermediateDirectories:1 attributes:0 error:&v65];
                  id v6 = v65;

                  if ((v35 & 1) == 0)
                  {
                    id v45 = (void *)*MEMORY[0x263F38100];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                    {
                      id v51 = v45;
                      id v52 = [v63 stringByAppendingPathComponent:v30];
                      *(_DWORD *)long long buf = 136315394;
                      uint64_t v79 = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]_block_invoke";
                      __int16 v80 = 2114;
                      uint64_t v81 = (uint64_t)v52;
                      _os_log_error_impl(&dword_21C8A5000, v51, OS_LOG_TYPE_ERROR, "%s Cannot create directory(%{public}@)", buf, 0x16u);
                    }
                    uint64_t v46 = *(void *)(*(void *)(v31 + 40) + 8);
                    uint64_t v36 = *(void **)(v46 + 40);
                    *(void *)(v46 + 40) = 0;
LABEL_47:
                    id v3 = v62;
                    id v14 = v54;

                    goto LABEL_48;
                  }
                  id v25 = v6;
                }
                else
                {
                  uint64_t v36 = [v30 pathExtension];
                  if (([v36 isEqualToString:@"wav"] & 1) != 0
                    || [v36 isEqualToString:@"json"])
                  {
                    __int16 v37 = [v22 stringByAppendingPathComponent:v30];
                    __int16 v38 = [v63 stringByAppendingPathComponent:v30];

                    id v64 = 0;
                    int v39 = [v62 copyItemAtPath:v37 toPath:v38 error:&v64];
                    id v40 = v64;
                    if (v39) {
                      BOOL v41 = v40 == 0;
                    }
                    else {
                      BOOL v41 = 0;
                    }
                    if (!v41)
                    {
                      id v6 = v40;
                      uint64_t v47 = *MEMORY[0x263F38100];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)long long buf = v53;
                        uint64_t v79 = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]_block_invoke";
                        __int16 v80 = 2114;
                        uint64_t v81 = (uint64_t)v37;
                        __int16 v82 = 2114;
                        id v83 = v38;
                        _os_log_error_impl(&dword_21C8A5000, v47, OS_LOG_TYPE_ERROR, "%s Cannot copy file: %{public}@ to %{public}@", buf, 0x20u);
                      }
                      uint64_t v49 = *(void *)(*(void *)(v31 + 40) + 8);
                      uint64_t v50 = *(void **)(v49 + 40);
                      *(void *)(v49 + 40) = 0;

                      goto LABEL_47;
                    }

                    id v25 = 0;
                  }
                }
                a1 = v31;
              }
              uint64_t v27 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }

          id v6 = v25;
          id v14 = v54;
          uint64_t v19 = v55;
        }
        else
        {
          uint64_t v42 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v53;
            uint64_t v79 = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]_block_invoke";
            __int16 v80 = 2114;
            uint64_t v81 = v21;
            __int16 v82 = 2114;
            id v83 = v25;
            _os_log_error_impl(&dword_21C8A5000, v42, OS_LOG_TYPE_ERROR, "%s Cannot create %{public}@ with error %{public}@ - Skipping language", buf, 0x20u);
          }
          id v6 = v25;
        }
        unint64_t v2 = 0x263F08000;

        uint64_t v16 = v59 + 1;
      }
      while (v59 + 1 != v56);
      uint64_t v56 = [v14 countByEnumeratingWithState:&v71 objects:v84 count:16];
      id v3 = v62;
    }
    while (v56);
  }
LABEL_48:

LABEL_49:
}

- (void)uploadUserVoiceProfileForSiriProfileId:(id)a3 withUploadTrigger:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __94__SSRVoiceProfileManager_uploadUserVoiceProfileForSiriProfileId_withUploadTrigger_completion___block_invoke;
  v15[3] = &unk_264429E68;
  id v16 = v8;
  char v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __94__SSRVoiceProfileManager_uploadUserVoiceProfileForSiriProfileId_withUploadTrigger_completion___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v2 = (os_log_t *)MEMORY[0x263F38100];
  id v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = @"Primary User";
    if (*(void *)(a1 + 32)) {
      uint64_t v4 = *(__CFString **)(a1 + 32);
    }
    *(_DWORD *)long long buf = 136315394;
    uint64_t v26 = "-[SSRVoiceProfileManager uploadUserVoiceProfileForSiriProfileId:withUploadTrigger:completion:]_block_invoke";
    __int16 v27 = 2112;
    uint64_t v28 = v4;
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Upload trigger of voice profile of %@ ", buf, 0x16u);
  }
  if (!*(void *)(*(void *)(a1 + 40) + 8))
  {
    id v9 = NSString;
    id v10 = [MEMORY[0x263F380D0] deviceProductType];
    __int16 v7 = [v9 stringWithFormat:@"Unknown device category for device type %@ - Bailing out", v10];

    uint64_t v11 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v26 = "-[SSRVoiceProfileManager uploadUserVoiceProfileForSiriProfileId:withUploadTrigger:completion:]_block_invoke";
      __int16 v27 = 2114;
      uint64_t v28 = v7;
      _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = @"reason";
      uint32_t v24 = v7;
      id v14 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      long long v15 = [v13 errorWithDomain:@"com.apple.speakerrecognition" code:711 userInfo:v14];
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);
    }
    goto LABEL_15;
  }
  if (CSIsIOS() & 1) != 0 || (CSIsOSX())
  {
    uint64_t v6 = *(void *)(a1 + 32);
    char v5 = *(void **)(a1 + 40);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __94__SSRVoiceProfileManager_uploadUserVoiceProfileForSiriProfileId_withUploadTrigger_completion___block_invoke_214;
    v21[3] = &unk_264429E40;
    id v22 = *(id *)(a1 + 56);
    __int16 v7 = [v5 _prepareVoiceProfileWithSiriProfileId:v6 withUploadBlock:v21];
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, __CFString *))(v8 + 16))(v8, v7);
    }

LABEL_15:
    return;
  }
  os_log_t v16 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
  {
    id v18 = (void *)MEMORY[0x263F380D0];
    id v19 = v16;
    id v20 = [v18 deviceProductType];
    *(_DWORD *)long long buf = 136315394;
    uint64_t v26 = "-[SSRVoiceProfileManager uploadUserVoiceProfileForSiriProfileId:withUploadTrigger:completion:]_block_invoke";
    __int16 v27 = 2114;
    uint64_t v28 = v20;
    _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s Upload not supported on %{public}@", buf, 0x16u);
  }
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17) {
    (*(void (**)(uint64_t, void))(v17 + 16))(v17, 0);
  }
}

uint64_t __94__SSRVoiceProfileManager_uploadUserVoiceProfileForSiriProfileId_withUploadTrigger_completion___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyUserVoiceProfileUploadCompleteForSiriProfileId:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__SSRVoiceProfileManager_notifyUserVoiceProfileUploadCompleteForSiriProfileId_withError___block_invoke;
  block[3] = &unk_26442A310;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __89__SSRVoiceProfileManager_notifyUserVoiceProfileUploadCompleteForSiriProfileId_withError___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [*(id *)(a1 + 32) _CSSATUploadPathForSiriProfileId:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 48);
  char v5 = (os_log_t *)MEMORY[0x263F38100];
  id v6 = *MEMORY[0x263F38100];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v7) {
      goto LABEL_11;
    }
    uint64_t v8 = *(__CFString **)(a1 + 40);
    if (!v8) {
      uint64_t v8 = @"Primary User";
    }
    *(_DWORD *)long long buf = 136315650;
    id v20 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUploadCompleteForSiriProfileId:withError:]_block_invoke";
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2114;
    uint64_t v24 = v4;
    id v9 = "%s Upload of Voice Profile for %@ completed with error %{public}@";
    id v10 = v6;
    uint32_t v11 = 32;
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    id v12 = @"Primary User";
    if (*(void *)(a1 + 40)) {
      id v12 = *(__CFString **)(a1 + 40);
    }
    *(_DWORD *)long long buf = 136315394;
    id v20 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUploadCompleteForSiriProfileId:withError:]_block_invoke";
    __int16 v21 = 2112;
    id v22 = v12;
    id v9 = "%s Upload of Voice Profile for %@ completed successfully";
    id v10 = v6;
    uint32_t v11 = 22;
  }
  _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_11:
  if ([v2 fileExistsAtPath:v3])
  {
    id v18 = 0;
    char v13 = [v2 removeItemAtPath:v3 error:&v18];
    id v14 = v18;
    if ((v13 & 1) == 0)
    {
      os_log_t v15 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        os_log_t v16 = v15;
        uint64_t v17 = [v14 localizedDescription];
        *(_DWORD *)long long buf = 136315394;
        id v20 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUploadCompleteForSiriProfileId:withError:]_block_invoke";
        __int16 v21 = 2114;
        id v22 = v17;
        _os_log_error_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete existing SATUpload diretory : %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v14 = 0;
  }
}

- (id)_getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3) {
    goto LABEL_8;
  }
  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3 isDirectory:0];

  id v6 = 0;
  if (!v5) {
    goto LABEL_6;
  }
  BOOL v7 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v8 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v21 = "-[SSRVoiceProfileManager _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:]";
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s PHS update directory already exists, remove before we move forward", buf, 0xCu);
  }
  id v9 = [MEMORY[0x263F08850] defaultManager];
  id v19 = 0;
  char v10 = [v9 removeItemAtPath:v3 error:&v19];
  id v6 = v19;

  if ((v10 & 1) == 0)
  {
    os_log_t v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v21 = "-[SSRVoiceProfileManager _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:]";
      os_log_t v16 = "%s Failed to delete PHS update directory";
      goto LABEL_17;
    }
  }
  else
  {
LABEL_6:
    uint32_t v11 = v6;
    id v12 = [MEMORY[0x263F08850] defaultManager];
    id v18 = v6;
    char v13 = [v12 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v6 = v18;

    if (v13)
    {

LABEL_8:
      id v14 = v3;
      goto LABEL_13;
    }
    os_log_t v15 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v21 = "-[SSRVoiceProfileManager _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:]";
      os_log_t v16 = "%s Failed to create PHS update directory";
LABEL_17:
      _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
    }
  }

  id v14 = 0;
LABEL_13:

  return v14;
}

- (id)_getUserVoiceProfileDownloadCacheDirectoryForProfileId:(id)a3 forDeviceCategory:(unint64_t)a4 forVoiceProfileVersion:(unint64_t)a5
{
  id v8 = a3;
  if (a4 == 3)
  {
    id v9 = [(SSRVoiceProfileManager *)self baseDir];
    char v10 = v9;
    if (a5) {
      uint32_t v11 = @"Caches/VoiceTrigger/SATUpdateNewerZone";
    }
    else {
      uint32_t v11 = @"Caches/VoiceTrigger/SATUpdate";
    }
    os_log_t v15 = [v9 stringByAppendingPathComponent:v11];
  }
  else
  {
    id v12 = [(SSRVoiceProfileManager *)self baseDir];
    char v13 = [v12 stringByAppendingPathComponent:@"Caches/VoiceTrigger/SATUpdate"];

    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"_%d_%d", a4, a5);
    os_log_t v15 = [v13 stringByAppendingString:v14];

    if (!v8) {
      goto LABEL_9;
    }
    char v10 = [NSString stringWithFormat:@"_%@", v8];
    uint64_t v16 = [v15 stringByAppendingString:v10];

    os_log_t v15 = (void *)v16;
  }

LABEL_9:
  uint64_t v17 = [(SSRVoiceProfileManager *)self _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:v15];

  return v17;
}

- (id)_enableVoiceTriggerIfLanguageMatches:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _CSNotBackedupPreferencesValueForKey();
  id v6 = (void *)MEMORY[0x263F380D0];
  BOOL v7 = [(NSUUID *)self->_endpointUUID UUIDString];
  id v8 = [v6 getSiriLanguageWithEndpointId:v7 fallbackLanguage:0];

  id v9 = (os_log_t *)MEMORY[0x263F38100];
  char v10 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 136315906;
    long long v30 = "-[SSRVoiceProfileManager _enableVoiceTriggerIfLanguageMatches:]";
    __int16 v31 = 2114;
    double v32 = *(double *)&v4;
    __int16 v33 = 2114;
    long long v34 = v5;
    __int16 v35 = 2114;
    uint64_t v36 = v8;
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s language: %{public}@, enableVTAfterSyncLanguage: %{public}@, currSiriLanguage: %{public}@", (uint8_t *)&v29, 0x2Au);
  }
  if (v5 && v8)
  {
    int v11 = [v4 isEqualToString:v8];
    id v12 = *v9;
    if (v11)
    {
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 136315650;
        long long v30 = "-[SSRVoiceProfileManager _enableVoiceTriggerIfLanguageMatches:]";
        __int16 v31 = 2114;
        double v32 = *(double *)&v8;
        __int16 v33 = 2114;
        long long v34 = v5;
        _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Enabling VoiceTrigger Upon VoiceProfile sync for language: %{public}@ and enrolled language: %{public}@", (uint8_t *)&v29, 0x20u);
      }
      _CSNotBackedupPreferencesSetValueForKey();
      CSNotBackedupInternalPreferencesSynchronize();
      char v13 = [MEMORY[0x263F85AF0] sharedPreferences];
      [v13 setVoiceTriggerEnabled:1];

      if ([MEMORY[0x263F380D0] supportRemoteDarwinVoiceTrigger])
      {
        id v14 = [MEMORY[0x263F85AF0] sharedPreferences];
        [v14 setVoiceTriggerEnabled:1 sender:self deviceType:3 endpointId:0];
      }
      if (CSIsInternalBuild())
      {
        os_log_t v15 = _CSNotBackedupPreferencesValueForKey();
        uint64_t v16 = v15;
        if (v15)
        {
          uint64_t v17 = [v15 objectForKeyedSubscript:@"EnableVTUponVoiceProfileSync"];

          if (v17)
          {
            id v18 = [v16 objectForKeyedSubscript:@"EnableVTUponVoiceProfileSync"];
            id v19 = [v18 objectForKeyedSubscript:@"timestamp"];
            id v20 = objc_alloc_init(MEMORY[0x263F08790]);
            __int16 v21 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
            [v20 setLocale:v21];

            [v20 setDateFormat:@"yyyyMMdd-HH:mm:ss"];
            uint64_t v22 = [v20 dateFromString:v19];
            __int16 v23 = [MEMORY[0x263EFF910] date];
            [v23 timeIntervalSinceDate:v22];
            double v25 = v24;
            if (v24 > 604800.0)
            {
              uint64_t v26 = *v9;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                int v29 = 136315394;
                long long v30 = "-[SSRVoiceProfileManager _enableVoiceTriggerIfLanguageMatches:]";
                __int16 v31 = 2048;
                double v32 = v25;
                _os_log_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_DEFAULT, "%s Triggering ABC logging since VoiceProfile download took %f secs", (uint8_t *)&v29, 0x16u);
              }
              __int16 v27 = [MEMORY[0x263F38028] sharedInstance];
              [v27 submitVoiceTriggerIssueReport:*MEMORY[0x263F38140]];
            }
          }
        }
      }
      goto LABEL_22;
    }
  }
  else
  {
    id v12 = *v9;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 136315394;
    long long v30 = "-[SSRVoiceProfileManager _enableVoiceTriggerIfLanguageMatches:]";
    __int16 v31 = 2114;
    double v32 = *(double *)&v4;
    _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Not enabling VoiceTrigger Upon VoiceProfile sync for language: %{public}@", (uint8_t *)&v29, 0x16u);
  }
LABEL_22:

  return 0;
}

- (id)_enrollVoiceProfileForSiriProfileId:(id)a3 fromCacheDirectoryPath:(id)a4 withCategoryType:(unint64_t)a5
{
  v147[1] = *MEMORY[0x263EF8340];
  v107 = (__CFString *)a3;
  id v104 = a4;
  v108 = self;
  uint64_t v7 = [(SSRVoiceProfileManager *)self SSRSpeakerProfilesBasePath];
  v101 = (void *)v7;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x3032000000;
  v124 = __Block_byref_object_copy__6789;
  v125 = __Block_byref_object_dispose__6790;
  id v126 = 0;
  if (!v104 || !v7)
  {
    uint64_t v17 = [NSString stringWithFormat:@"SourcePath (%@) or DestinationPath (%@) is nil - Bailing out", v104, v7];
    id v18 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
      __int16 v139 = 2114;
      v140 = v17;
      _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    id v19 = (void *)MEMORY[0x263F087E8];
    v127 = @"reason";
    v128 = v17;
    id v20 = [NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
    id v100 = [v19 errorWithDomain:@"com.apple.speakerrecognition" code:722 userInfo:v20];

    goto LABEL_12;
  }
  +[SSRUtils createDirectoryIfDoesNotExist:v7];
  id v8 = [MEMORY[0x263F08850] defaultManager];
  id v9 = (id *)(v122 + 5);
  id obj = (id)v122[5];
  v95 = [v8 contentsOfDirectoryAtPath:v104 error:&obj];
  objc_storeStrong(v9, obj);

  v109 = AFPreferencesSupportedLanguages();
  char v10 = (void *)v122[5];
  int v11 = v108;
  if (v10)
  {
    id v12 = NSString;
    char v13 = [v10 localizedDescription];
    v103 = [v12 stringWithFormat:@"Failed to get contents of %@ with error %@", v104, v13];

    id v14 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
      __int16 v139 = 2114;
      v140 = v103;
      _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    os_log_t v15 = (void *)MEMORY[0x263F087E8];
    v146 = @"reason";
    v147[0] = v103;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v147 forKeys:&v146 count:1];
    id v100 = [v15 errorWithDomain:@"com.apple.speakerrecognition" code:722 userInfo:v16];
    goto LABEL_7;
  }
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  v103 = v95;
  uint64_t v22 = [(SSRVoiceProfileRetrainingContext *)v103 countByEnumeratingWithState:&v116 objects:v145 count:16];
  if (!v22)
  {
    char log = 0;
    goto LABEL_96;
  }
  char log = 0;
  uint64_t v105 = *(void *)v117;
  __int16 v23 = @"Primary User";
  if (v107) {
    __int16 v23 = v107;
  }
  uint64_t v90 = v23;
  unint64_t v24 = 0x264428000uLL;
  do
  {
    uint64_t v106 = v22;
    for (uint64_t i = 0; i != v106; ++i)
    {
      if (*(void *)v117 != v105) {
        objc_enumerationMutation(v103);
      }
      uint64_t v26 = *(SSRVoiceProfileRetrainingContext **)(*((void *)&v116 + 1) + 8 * i);
      if (v109 && ([v109 containsObject:*(void *)(*((void *)&v116 + 1) + 8 * i)] & 1) == 0)
      {
        uint64_t v44 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315650;
          v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
          __int16 v139 = 2114;
          v140 = v26;
          __int16 v141 = 2114;
          double v142 = *(double *)&v109;
          _os_log_impl(&dword_21C8A5000, v44, OS_LOG_TYPE_DEFAULT, "%s Language %{public}@ not supported in %{public}@ - Skipping", buf, 0x20u);
        }
        goto LABEL_71;
      }
      __int16 v27 = [v104 stringByAppendingPathComponent:v26];
      uint64_t v28 = (void *)MEMORY[0x263F380D0];
      int v29 = [(NSUUID *)v11->_endpointUUID UUIDString];
      long long v30 = [v28 getSiriLanguageWithEndpointId:v29 fallbackLanguage:0];

      __int16 v31 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        endpointUUID = v108->_endpointUUID;
        *(_DWORD *)long long buf = 136315650;
        v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
        __int16 v139 = 2112;
        v140 = (SSRVoiceProfileRetrainingContext *)endpointUUID;
        __int16 v141 = 2112;
        double v142 = *(double *)&v30;
        _os_log_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_DEFAULT, "%s endPointId:%@, currentLanguageCode:%@", buf, 0x20u);
      }
      int v33 = CSIsCommunalDevice();
      if (v30) {
        int v34 = v33;
      }
      else {
        int v34 = 0;
      }
      if (v34 == 1)
      {
        if ([(SSRVoiceProfileRetrainingContext *)v26 isEqualToString:v30])
        {
          if (+[SSRUtils isSpeakerRecognitionSupportedInLocale:v30])
          {
            goto LABEL_32;
          }
          long long v69 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315650;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            __int16 v139 = 2114;
            v140 = (SSRVoiceProfileRetrainingContext *)v107;
            __int16 v141 = 2114;
            double v142 = *(double *)&v30;
            uint64_t v46 = v69;
            uint64_t v47 = "%s Skipping profile download for %{public}@ - voiceId not supported in %{public}@";
            uint32_t v48 = 32;
LABEL_61:
            _os_log_impl(&dword_21C8A5000, v46, OS_LOG_TYPE_DEFAULT, v47, buf, v48);
          }
        }
        else
        {
          id v45 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315906;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            __int16 v139 = 2114;
            v140 = (SSRVoiceProfileRetrainingContext *)v107;
            __int16 v141 = 2114;
            double v142 = *(double *)&v26;
            __int16 v143 = 2114;
            v144 = v30;
            uint64_t v46 = v45;
            uint64_t v47 = "%s Skipping profile download for %{public}@ - %{public}@ not matching current %{public}@";
            uint32_t v48 = 42;
            goto LABEL_61;
          }
        }

        goto LABEL_71;
      }
LABEL_32:
      id v35 = +[SSRUtils getVoiceProfileForSiriProfileId:v107 forLanguageCode:v26];
      if (v35)
      {
        if (CSIsCommunalDevice())
        {
          uint64_t v36 = [*(id *)(v24 + 2248) sharedInstance];
          char v37 = [v36 checkIfVoiceProfile:v35 needsUpdatedWith:v27 withCategory:a5];

          if ((v37 & 1) == 0)
          {
            __int16 v38 = [NSString stringWithFormat:@"Skipping profile Update for %@ in %@", v107, v26];
            int v39 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315394;
              v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
              __int16 v139 = 2114;
              v140 = v38;
              _os_log_impl(&dword_21C8A5000, v39, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
            }
            id v40 = (void *)MEMORY[0x263F087E8];
            v135 = @"reason";
            v136 = v38;
            BOOL v41 = [NSDictionary dictionaryWithObjects:&v136 forKeys:&v135 count:1];
            uint64_t v42 = [v40 errorWithDomain:@"com.apple.speakerrecognition" code:748 userInfo:v41];
            BOOL v43 = (void *)v122[5];
            v122[5] = v42;

            char log = 1;
LABEL_45:

LABEL_71:
            int v11 = v108;
            continue;
          }
        }
        else if ([v35 isMarkedSATEnrolled])
        {
          uint64_t v49 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315394;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            __int16 v139 = 2114;
            v140 = v26;
            _os_log_impl(&dword_21C8A5000, v49, OS_LOG_TYPE_DEFAULT, "%s Skipping language [%{public}@] since we already have enrollment data for this language", buf, 0x16u);
          }
          goto LABEL_45;
        }
      }
      uint64_t v50 = (void *)MEMORY[0x21D4B2500]();
      id v51 = [*(id *)(v24 + 2248) sharedInstance];
      id v52 = v51;
      if (v35)
      {
        id v53 = (id)[v51 deleteUserVoiceProfile:v35];
      }
      else
      {
        id v35 = [[SSRVoiceProfile alloc] initNewVoiceProfileWithLocale:v26 withAppDomain:@"com.apple.siri"];
        [v35 setSharedSiriProfileId:v107];
      }
      id v54 = [NSURL fileURLWithPath:v27];
      uint64_t v55 = [v35 importVoiceProfileAtPath:v54];
      uint64_t v56 = (void *)v122[5];
      v122[5] = v55;

      if (v122[5])
      {
        uint64_t v57 = NSString;
        long long v58 = [v35 locale];
        uint64_t v59 = [v57 stringWithFormat:@"ERR: Failed to import profile %@ for %@", v58, v107];

        long long v60 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
          goto LABEL_66;
        }
        goto LABEL_67;
      }
      if (([v35 markSATEnrollmentSuccess] & 1) == 0)
      {
        id v70 = NSString;
        long long v71 = [v35 locale];
        uint64_t v59 = [v70 stringWithFormat:@"ERR: Migrated language %@ for %@ but failed to mark SAT enrollment", v71, v107];

        long long v60 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
LABEL_66:
          *(_DWORD *)long long buf = 136315394;
          v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
          __int16 v139 = 2114;
          v140 = v59;
          _os_log_error_impl(&dword_21C8A5000, v60, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
        }
LABEL_67:
        int v68 = 5;
        goto LABEL_68;
      }
      if (([v35 markSATEnrollmentMigrated] & 1) == 0)
      {
        long long v72 = NSString;
        long long v73 = [v35 locale];
        uint64_t v59 = [v72 stringWithFormat:@"ERR: Failed to mark migrated for %@ in language %@", v107, v73];

        long long v60 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
          goto LABEL_66;
        }
        goto LABEL_67;
      }
      if (CSIsCommunalDevice())
      {
        v133[0] = @"SSRVoiceRetrainingVoiceProfile";
        v133[1] = @"SSRVoiceRetrainingSpIdType";
        v134[0] = v35;
        v134[1] = &unk_26CD455E0;
        v99 = [NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:2];
        long long v61 = [SSRVoiceProfileRetrainingContext alloc];
        __int16 v62 = (id *)(v122 + 5);
        id v115 = (id)v122[5];
        uint64_t v59 = [(SSRVoiceProfileRetrainingContext *)v61 initWithVoiceRetrainingContext:v99 error:&v115];
        objc_storeStrong(v62, v115);
        if (v122[5])
        {
          id v63 = NSString;
          id v64 = [v35 profileID];
          v98 = [v63 stringWithFormat:@"Failed to init retrainCtxt for profileID %@ with error %@", v64, v122[5]];

          id v65 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            __int16 v139 = 2112;
            v140 = v98;
            _os_log_error_impl(&dword_21C8A5000, v65, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
          }
          long long v66 = (void *)MEMORY[0x263F087E8];
          v131 = @"reason";
          v132 = v98;
          long long v67 = [NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
          id v100 = [v66 errorWithDomain:@"com.apple.speakerrecognition" code:756 userInfo:v67];
          int v68 = 1;
          goto LABEL_85;
        }
      }
      else
      {
        uint64_t v59 = 0;
      }
      v94 = v50;
      v99 = [MEMORY[0x263EFF910] date];
      id v74 = objc_alloc_init(MEMORY[0x263F38030]);
      [v74 enter];
      id v75 = +[SSRVoiceProfileStore sharedInstance];
      v110[0] = MEMORY[0x263EF8330];
      v110[1] = 3221225472;
      v110[2] = __102__SSRVoiceProfileManager__enrollVoiceProfileForSiriProfileId_fromCacheDirectoryPath_withCategoryType___block_invoke;
      v110[3] = &unk_264429DC8;
      v114 = &v121;
      id v76 = v35;
      v111 = v76;
      v112 = v26;
      v98 = (SSRVoiceProfileRetrainingContext *)v74;
      v113 = v98;
      os_log_t v91 = v76;
      [v75 addUserVoiceProfile:v76 withContext:v59 withCompletion:v110];

      unint64_t v24 = 0x264428000;
      uint64_t v50 = v94;
      uint64_t v77 = [(SSRVoiceProfileRetrainingContext *)v98 waitWithTimeout:dispatch_time(0, 10000000000)];
      v93 = [MEMORY[0x263EFF910] date];
      [v93 timeIntervalSinceDate:v99];
      double v79 = v78 * 1000.0;
      if (v77)
      {
        __int16 v80 = NSString;
        uint64_t v81 = [v91 siriProfileId];
        __int16 v82 = [v80 stringWithFormat:@"userAddition timedout for siriProfileId %@ after %fms", v81, *(void *)&v79];

        id v83 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
          __int16 v139 = 2112;
          v140 = v82;
          _os_log_error_impl(&dword_21C8A5000, v83, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
        }
      }
      else
      {
        __int16 v84 = (void *)v122[5];
        if (!v84)
        {
          uint64_t v85 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315650;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            __int16 v139 = 2114;
            v140 = (SSRVoiceProfileRetrainingContext *)v90;
            __int16 v141 = 2048;
            double v142 = v79;
            _os_log_impl(&dword_21C8A5000, v85, OS_LOG_TYPE_DEFAULT, "%s Successfully added %{public}@ in %.2fms", buf, 0x20u);
            uint64_t v85 = *MEMORY[0x263F38100];
          }
          loga = v85;
          if (os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v86 = [v91 locale];
            *(_DWORD *)long long buf = 136315650;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            __int16 v139 = 2114;
            v140 = (SSRVoiceProfileRetrainingContext *)v107;
            __int16 v141 = 2114;
            double v142 = *(double *)&v86;
            _os_log_impl(&dword_21C8A5000, loga, OS_LOG_TYPE_DEFAULT, "%s Sucessfully enrolled %{public}@ for language %{public}@", buf, 0x20u);
          }
          if (v108->_currentDeviceCategory - 1 <= 2) {
            id v87 = [(SSRVoiceProfileManager *)v108 _enableVoiceTriggerIfLanguageMatches:v26];
          }
          int v68 = 0;
          char log = 1;
          goto LABEL_84;
        }
        v92 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315906;
          v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
          __int16 v139 = 2114;
          v140 = (SSRVoiceProfileRetrainingContext *)v107;
          __int16 v141 = 2114;
          double v142 = *(double *)&v26;
          __int16 v143 = 2114;
          v144 = v84;
          _os_log_error_impl(&dword_21C8A5000, v92, OS_LOG_TYPE_ERROR, "%s ERR: Failed migrating Voice profile with ID %{public}@ for language %{public}@ with error %{public}@", buf, 0x2Au);
        }
      }
      int v68 = 5;
LABEL_84:

      long long v67 = v111;
LABEL_85:

LABEL_68:

      if (v68 == 5) {
        goto LABEL_71;
      }
      int v11 = v108;
      if (v68) {
        goto LABEL_8;
      }
    }
    uint64_t v22 = [(SSRVoiceProfileRetrainingContext *)v103 countByEnumeratingWithState:&v116 objects:v145 count:16];
  }
  while (v22);
LABEL_96:

  if (log & 1 | ((CSIsCommunalDevice() & 1) == 0) || v122[5])
  {

    id v100 = (id)v122[5];
    goto LABEL_12;
  }
  v103 = [NSString stringWithFormat:@"Failed to enroll user - %@", v107];
  __int16 v88 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
    __int16 v139 = 2114;
    v140 = v103;
    _os_log_error_impl(&dword_21C8A5000, v88, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
  id v89 = (void *)MEMORY[0x263F087E8];
  v129 = @"reason";
  v130 = v103;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
  id v100 = [v89 errorWithDomain:@"com.apple.speakerrecognition" code:747 userInfo:v16];
LABEL_7:

LABEL_8:
LABEL_12:
  _Block_object_dispose(&v121, 8);

  return v100;
}

void __102__SSRVoiceProfileManager__enrollVoiceProfileForSiriProfileId_fromCacheDirectoryPath_withCategoryType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  id v6 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = [v7 profileID];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v12 = 136315906;
    char v13 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]_block_invoke";
    __int16 v14 = 2114;
    os_log_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Adding voiceprofile for %{public}@ in language %{public}@ completed with error %{public}@", (uint8_t *)&v12, 0x2Au);
  }
  [*(id *)(a1 + 48) leave];
}

- (void)_downloadVoiceProfileForProfileId:(id)a3 forDeviceCategory:(unint64_t)a4 withDownloadTriggerBlock:(id)a5 withCompletion:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v36 = a5;
  uint64_t v10 = (void (**)(id, void *, void))a6;
  uint64_t v11 = (void *)MEMORY[0x263F380D0];
  endpointUUID = self->_endpointUUID;
  id v13 = a3;
  __int16 v14 = [(NSUUID *)endpointUUID UUIDString];
  os_log_t v15 = [v11 getSiriLanguageWithEndpointId:v14 fallbackLanguage:0];

  __int16 v16 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v17 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = self->_endpointUUID;
    *(_DWORD *)long long buf = 136315650;
    uint64_t v42 = "-[SSRVoiceProfileManager _downloadVoiceProfileForProfileId:forDeviceCategory:withDownloadTriggerBlock:withCompletion:]";
    __int16 v43 = 2112;
    uint64_t v44 = v18;
    __int16 v45 = 2112;
    uint64_t v46 = v15;
    _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s endPointId:%@, currentLanguageCode:%@", buf, 0x20u);
  }
  uint64_t v19 = [SSRVoiceProfileMetaContext alloc];
  if (CSIsCommunalDevice()) {
    uint64_t v20 = v15;
  }
  else {
    uint64_t v20 = 0;
  }
  __int16 v21 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:a4];
  uint64_t v22 = [(SSRVoiceProfileMetaContext *)v19 initWithSharedSiriId:v13 languageCode:v20 productCategory:v21 version:&unk_26CD455C8];

  __int16 v23 = [(SSRVoiceProfileManager *)self _getUserVoiceProfileDownloadCacheDirectoryForProfileId:v13 forDeviceCategory:a4 forVoiceProfileVersion:1];

  if (!v23)
  {
    __int16 v27 = [NSString stringWithFormat:@"SAT download path is nil - Bailing out"];
    int v33 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v42 = "-[SSRVoiceProfileManager _downloadVoiceProfileForProfileId:forDeviceCategory:withDownloadTriggerBlock:withCompletion:]";
      __int16 v43 = 2114;
      uint64_t v44 = v27;
      _os_log_error_impl(&dword_21C8A5000, v33, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    int v34 = (void *)MEMORY[0x263F087E8];
    int v39 = @"reason";
    id v40 = v27;
    id v35 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    uint64_t v28 = [v34 errorWithDomain:@"com.apple.speakerrecognition" code:718 userInfo:v35];

    double v25 = v36;
    if (v10) {
      v10[2](v10, v28, 0);
    }
    goto LABEL_17;
  }
  id v24 = +[SSRUtils removeItemAtPath:v23];
  double v25 = v36;
  uint64_t v26 = (*((void (**)(id, SSRVoiceProfileMetaContext *, void *))v36 + 2))(v36, v22, v23);
  if (v26)
  {
    __int16 v27 = (NSUUID *)v26;
    uint64_t v28 = [NSString stringWithFormat:@"Download for %@ failed with %@", v22, v26];
    int v29 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v42 = "-[SSRVoiceProfileManager _downloadVoiceProfileForProfileId:forDeviceCategory:withDownloadTriggerBlock:withCompletion:]";
      __int16 v43 = 2114;
      uint64_t v44 = v28;
      _os_log_error_impl(&dword_21C8A5000, v29, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    long long v30 = (void *)MEMORY[0x263F087E8];
    char v37 = @"reason";
    __int16 v38 = v28;
    __int16 v31 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    double v32 = [v30 errorWithDomain:@"com.apple.speakerrecognition" code:712 userInfo:v31];

    if (v10) {
      v10[2](v10, v32, 0);
    }

LABEL_17:
    goto LABEL_21;
  }
  if (v10) {
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v23);
  }
  __int16 v27 = 0;
LABEL_21:
}

- (id)_downloadAndEnrollVoiceProfileForProfileId:(id)a3 withDownloadTriggerBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __94__SSRVoiceProfileManager__downloadAndEnrollVoiceProfileForProfileId_withDownloadTriggerBlock___block_invoke;
  v21[3] = &unk_264429E18;
  void v21[4] = self;
  id v8 = v6;
  id v22 = v8;
  id v9 = v7;
  id v23 = v9;
  uint64_t v10 = MEMORY[0x21D4B2740](v21);
  uint64_t v11 = (void (**)(void, void))v10;
  unint64_t currentDeviceCategory = self->_currentDeviceCategory;
  if (currentDeviceCategory == 2)
  {
    uint64_t v18 = (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 5);
    if (!v18)
    {
      uint64_t v17 = 0;
      goto LABEL_16;
    }
    os_log_t v15 = (void *)v18;
    uint64_t v17 = v11[2](v11, self->_currentDeviceCategory);
    goto LABEL_15;
  }
  if (currentDeviceCategory == 4)
  {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 5);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13
      && (v11[2](v11, 2),
          __int16 v14 = objc_claimAutoreleasedReturnValue(),
          v13,
          (id v13 = v14) != 0))
    {
      os_log_t v15 = v11[2](v11, 1);

      if (v15)
      {
        id v13 = v13;
        __int16 v16 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315650;
          double v25 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]";
          __int16 v26 = 2112;
          id v27 = v8;
          __int16 v28 = 2114;
          id v29 = v13;
          _os_log_error_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_ERROR, "%s Failed to enroll siriProfileId %@ with %{public}@", buf, 0x20u);
        }
        uint64_t v17 = v13;
        goto LABEL_14;
      }
    }
    else
    {
      os_log_t v15 = 0;
    }
    uint64_t v17 = 0;
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  uint64_t v17 = (*(void (**)(uint64_t))(v10 + 16))(v10);
LABEL_16:
  id v19 = v17;

  return v19;
}

id __94__SSRVoiceProfileManager__downloadAndEnrollVoiceProfileForProfileId_withDownloadTriggerBlock___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  os_log_t v15 = __Block_byref_object_copy__6789;
  __int16 v16 = __Block_byref_object_dispose__6790;
  id v17 = 0;
  id v4 = (void *)a1[4];
  id v3 = (void *)a1[5];
  uint64_t v5 = a1[6];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __94__SSRVoiceProfileManager__downloadAndEnrollVoiceProfileForProfileId_withDownloadTriggerBlock___block_invoke_2;
  v8[3] = &unk_264429DF0;
  uint64_t v10 = &v12;
  uint64_t v11 = a2;
  v8[4] = v4;
  id v9 = v3;
  [v4 _downloadVoiceProfileForProfileId:v9 forDeviceCategory:a2 withDownloadTriggerBlock:v5 withCompletion:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v6;
}

void __94__SSRVoiceProfileManager__downloadAndEnrollVoiceProfileForProfileId_withDownloadTriggerBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = *(void *)(a1 + 56);
      char v37 = v7;
      __int16 v38 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v36];
      *(_DWORD *)long long buf = 136315650;
      uint64_t v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke_2";
      __int16 v48 = 2114;
      id v49 = v5;
      __int16 v50 = 2114;
      id v51 = v38;
      _os_log_error_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_ERROR, "%s Failed to download voice profile with error %{public}@ and category %{public}@ ", buf, 0x20u);
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = v5;
    id v10 = *(id *)(v8 + 40);
    *(void *)(v8 + 40) = v9;
    goto LABEL_23;
  }
  uint64_t v11 = [*(id *)(a1 + 32) _enrollVoiceProfileForSiriProfileId:*(void *)(a1 + 40) fromCacheDirectoryPath:v6 withCategoryType:*(void *)(a1 + 56)];
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v14)
  {
    __int16 v16 = (os_log_t *)MEMORY[0x263F38100];
    id v17 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 56);
      uint64_t v20 = v17;
      __int16 v21 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v19];
      *(_DWORD *)long long buf = 136315650;
      uint64_t v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke";
      __int16 v48 = 2112;
      id v49 = v18;
      __int16 v50 = 2114;
      id v51 = v21;
      _os_log_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Successfully enrolled voice profile %@ with %{public}@ profile", buf, 0x20u);
    }
    if (!CSIsIOS()) {
      goto LABEL_20;
    }
    id v22 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke";
      _os_log_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_DEFAULT, "%s Triggering profile sync check", buf, 0xCu);
    }
    id v23 = [MEMORY[0x263F087C8] defaultCenter];
    [v23 postNotificationName:@"com.apple.voicetrigger.voiceprofilesync" object:0];
    goto LABEL_14;
  }
  os_log_t v15 = [v14 domain];
  if (v15 == @"com.apple.speakerrecognition")
  {
    uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) code];

    if (v24 == 748)
    {
      double v25 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = *(void **)(a1 + 40);
        uint64_t v27 = *(void *)(a1 + 56);
        __int16 v28 = v25;
        id v29 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v27];
        *(_DWORD *)long long buf = 136315650;
        uint64_t v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke";
        __int16 v48 = 2112;
        id v49 = v26;
        __int16 v50 = 2114;
        id v51 = v29;
        _os_log_impl(&dword_21C8A5000, v28, OS_LOG_TYPE_DEFAULT, "%s Skipped enrolling voice profile %@ with %{public}@ profile", buf, 0x20u);
      }
      uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
      __int16 v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = 0;

      goto LABEL_20;
    }
  }
  else
  {
  }
  double v32 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v39 = *(void **)(a1 + 40);
    uint64_t v40 = *(void *)(a1 + 56);
    id v23 = v32;
    BOOL v41 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v40];
    *(_DWORD *)long long buf = 136315650;
    uint64_t v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke";
    __int16 v48 = 2112;
    id v49 = v39;
    __int16 v50 = 2114;
    id v51 = v41;
    _os_log_error_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_ERROR, "%s ERR: Failed in enrolling Voice profile %@ with category %{public}@ profile", buf, 0x20u);

LABEL_14:
  }
LABEL_20:
  int v33 = [MEMORY[0x263F08850] defaultManager];
  id v45 = 0;
  char v34 = [v33 removeItemAtPath:v6 error:&v45];
  id v10 = v45;

  if ((v34 & 1) == 0)
  {
    id v35 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      __int16 v43 = v35;
      uint64_t v44 = [v42 localizedDescription];
      *(_DWORD *)long long buf = 136315650;
      uint64_t v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke";
      __int16 v48 = 2114;
      id v49 = v6;
      __int16 v50 = 2114;
      id v51 = v44;
      _os_log_error_impl(&dword_21C8A5000, v43, OS_LOG_TYPE_ERROR, "%s Failed to remove update path [%{public}@] upon migration completion, error: %{public}@", buf, 0x20u);
    }
  }
LABEL_23:
}

- (BOOL)_checkIfDownloadRequiredForProfileId:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (CSIsIOS() & 1) != 0 || (CSIsCommunalDevice() & 1) != 0 || (CSIsOSX())
  {
    int v5 = CSIsCommunalDevice();
    if (v4 || !v5)
    {
      if ((CSIsCommunalDevice() & 1) == 0)
      {
        id v9 = (void *)MEMORY[0x263F380D0];
        id v10 = [(NSUUID *)self->_endpointUUID UUIDString];
        uint64_t v11 = [v9 getSiriLanguageWithEndpointId:v10 fallbackLanguage:0];

        uint64_t v12 = +[SSRUtils getVoiceProfileForSiriProfileId:v4 forLanguageCode:v11];
        if ([v12 isMarkedSATEnrolled])
        {
          id v13 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 136315394;
            __int16 v16 = "-[SSRVoiceProfileManager _checkIfDownloadRequiredForProfileId:]";
            __int16 v17 = 2114;
            uint64_t v18 = v11;
            _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Skipping download for language [%{public}@] since we already have enrollment data for this language", (uint8_t *)&v15, 0x16u);
          }

          goto LABEL_16;
        }
      }
      BOOL v7 = 1;
      goto LABEL_19;
    }
    id v6 = *MEMORY[0x263F38100];
    BOOL v7 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      __int16 v16 = "-[SSRVoiceProfileManager _checkIfDownloadRequiredForProfileId:]";
      uint64_t v8 = "%s Skipping download for tvOS when shared id is nil";
LABEL_15:
      _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);
LABEL_16:
      BOOL v7 = 0;
    }
  }
  else
  {
    id v6 = *MEMORY[0x263F38100];
    BOOL v7 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      __int16 v16 = "-[SSRVoiceProfileManager _checkIfDownloadRequiredForProfileId:]";
      uint64_t v8 = "%s Skipping download for unsupported OS";
      goto LABEL_15;
    }
  }
LABEL_19:

  return v7;
}

- (void)notifyUserVoiceProfileUpdateReady
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SSRVoiceProfileManager_notifyUserVoiceProfileUpdateReady__block_invoke;
  block[3] = &unk_26442A618;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __59__SSRVoiceProfileManager_notifyUserVoiceProfileUpdateReady__block_invoke(uint64_t a1)
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  uint64_t v105 = 0;
  uint64_t v106 = &v105;
  uint64_t v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__6789;
  v109 = __Block_byref_object_dispose__6790;
  id v110 = 0;
  uint64_t v85 = [*(id *)(a1 + 32) _CSSATDownloadPath];
  uint64_t v2 = [*(id *)(a1 + 32) SSRSpeakerProfilesBasePath];
  uint64_t v3 = v2;
  char v104 = 0;
  long long v73 = (void *)v2;
  if (v85 && v2)
  {
    uint64_t v78 = a1;
    +[SSRUtils createDirectoryIfDoesNotExist:v2];
    id v4 = [MEMORY[0x263F08850] defaultManager];
    int v5 = (id *)(v106 + 5);
    id obj = (id)v106[5];
    id v6 = [v4 contentsOfDirectoryAtPath:v85 error:&obj];
    objc_storeStrong(v5, obj);

    BOOL v7 = v106;
    if (v106[5])
    {
      uint64_t v8 = (id)*MEMORY[0x263F38100];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [(id)v7[5] localizedDescription];
        *(_DWORD *)long long buf = 136315394;
        v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
        __int16 v113 = 2114;
        v114 = v9;
        _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_INFO, "%s Failed to get device hash list %{public}@", buf, 0x16u);
      }
LABEL_84:

      goto LABEL_85;
    }
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v75 = v6;
    uint64_t v77 = [v75 countByEnumeratingWithState:&v99 objects:v120 count:16];
    if (!v77) {
      goto LABEL_80;
    }
    uint64_t v76 = *(void *)v100;
    uint64_t v74 = *MEMORY[0x263F38148];
LABEL_9:
    uint64_t v79 = 0;
    while (1)
    {
      if (*(void *)v100 != v76) {
        objc_enumerationMutation(v75);
      }
      __int16 v86 = *(void **)(*((void *)&v99 + 1) + 8 * v79);
      id v10 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
        __int16 v113 = 2114;
        v114 = v86;
        _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Processing sync data from device hash: %{public}@", buf, 0x16u);
      }
      uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v12 = [v85 stringByAppendingPathComponent:v86];
      id v13 = (id *)(v106 + 5);
      id v98 = (id)v106[5];
      uint64_t v14 = [v11 contentsOfDirectoryAtPath:v12 error:&v98];
      objc_storeStrong(v13, v98);

      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v84 = v14;
      uint64_t v15 = [v84 countByEnumeratingWithState:&v94 objects:v119 count:16];
      if (v15) {
        break;
      }
LABEL_78:

      if (++v79 == v77)
      {
        uint64_t v77 = [v75 countByEnumeratingWithState:&v99 objects:v120 count:16];
        if (!v77)
        {
LABEL_80:

          goto LABEL_81;
        }
        goto LABEL_9;
      }
    }
    uint64_t v87 = *(void *)v95;
LABEL_16:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v95 != v87) {
        objc_enumerationMutation(v84);
      }
      __int16 v17 = *(void **)(*((void *)&v94 + 1) + 8 * v16);
      uint64_t v18 = +[SSRUtils getVoiceProfileForSiriProfileId:0 forLanguageCode:v17];
      id v19 = v18;
      if (v18 && [v18 isMarkedSATEnrolled])
      {
        uint64_t v20 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
          __int16 v113 = 2114;
          v114 = v17;
          _os_log_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Skipping language [%{public}@] since we already have enrollment data for this language", buf, 0x16u);
        }
        goto LABEL_58;
      }
      __int16 v21 = [v85 stringByAppendingPathComponent:v86];
      id v22 = [v21 stringByAppendingPathComponent:v17];

      id v23 = [NSURL fileURLWithPath:v22];
      double v24 = [v23 URLByAppendingPathComponent:@"audio"];

      char v104 = 0;
      double v25 = [MEMORY[0x263F08850] defaultManager];
      __int16 v26 = [*(id *)&v24 path];
      char v27 = [v25 fileExistsAtPath:v26 isDirectory:&v104];
      if (v104) {
        char v28 = v27;
      }
      else {
        char v28 = 0;
      }

      if (v28)
      {
        if (+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:v22])
        {
          id v29 = +[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:*(void *)&v24];
          uint64_t v30 = +[SSRVoiceProfileStore sharedInstance];
          __int16 v31 = v30;
          if (v19) {
            id v32 = (id)[v30 deleteUserVoiceProfile:v19];
          }
          else {
            id v19 = [[SSRVoiceProfile alloc] initNewVoiceProfileWithLocale:v17 withAppDomain:@"com.apple.siri"];
          }
          uint64_t v38 = [v19 addUtterances:v29 spIdType:1];
          int v39 = (void *)v106[5];
          v106[5] = v38;

          if (v106[5])
          {
            uint64_t v40 = (id)*MEMORY[0x263F38100];
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              double v55 = [v19 profileID];
              uint64_t v56 = [(id)v106[5] localizedDescription];
              *(_DWORD *)long long buf = 136315906;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              __int16 v113 = 2114;
              v114 = v29;
              __int16 v115 = 2114;
              double v116 = v55;
              __int16 v117 = 2114;
              long long v118 = v56;
              _os_log_error_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_ERROR, "%s Error to copy profile from %{public}@ to %{public}@, error: %{public}@", buf, 0x2Au);
            }
            goto LABEL_56;
          }
          if ([v19 markSATEnrollmentSuccess])
          {
            id v83 = [MEMORY[0x263EFF910] date];
            id v41 = objc_alloc_init(MEMORY[0x263F38030]);
            [v41 enter];
            v89[0] = MEMORY[0x263EF8330];
            v89[1] = 3221225472;
            v89[2] = __59__SSRVoiceProfileManager_notifyUserVoiceProfileUpdateReady__block_invoke_141;
            v89[3] = &unk_264429DC8;
            v93 = &v105;
            id v42 = v19;
            id v90 = v42;
            os_log_t v91 = v17;
            id v43 = v41;
            id v92 = v43;
            [v31 addUserVoiceProfile:v42 withContext:0 withCompletion:v89];
            uint64_t v81 = v43;
            uint64_t v44 = objc_msgSend(v43, "waitWithTimeout:", dispatch_time(0, 10000000000));
            __int16 v82 = [MEMORY[0x263EFF910] date];
            [v82 timeIntervalSinceDate:v83];
            double v46 = v45 * 1000.0;
            if (v44)
            {
              uint64_t v47 = objc_msgSend(NSString, "stringWithFormat:", @"userAddition timedout after %fms", v45 * 1000.0, v73);
              __int16 v48 = *MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 136315394;
                v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
                __int16 v113 = 2112;
                v114 = v47;
                _os_log_error_impl(&dword_21C8A5000, v48, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
              }

LABEL_55:
LABEL_56:

              goto LABEL_57;
            }
            double v52 = *((double *)v106 + 5);
            id v53 = *MEMORY[0x263F38100];
            if (v52 != 0.0)
            {
              id v54 = *MEMORY[0x263F38100];
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 136315650;
                v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
                __int16 v113 = 2114;
                v114 = v17;
                __int16 v115 = 2114;
                double v116 = v52;
                _os_log_error_impl(&dword_21C8A5000, v54, OS_LOG_TYPE_ERROR, "%s ERR: Failed migrating Voice profile for language %{public}@ with error %{public}@", buf, 0x20u);
              }
              goto LABEL_55;
            }
            uint64_t v57 = v53;
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              long long v58 = [v42 locale];
              *(_DWORD *)long long buf = 136315650;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              __int16 v113 = 2114;
              v114 = v58;
              __int16 v115 = 2048;
              double v116 = v46;
              _os_log_impl(&dword_21C8A5000, v57, OS_LOG_TYPE_DEFAULT, "%s Successfully added %{public}@ in %.2fms", buf, 0x20u);
            }
            _CSNotBackedupPreferencesValueForKey();
            double v80 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            uint64_t v59 = (void *)MEMORY[0x263F380D0];
            long long v60 = [*(id *)(*(void *)(v78 + 32) + 24) UUIDString];
            long long v61 = [v59 getSiriLanguageWithEndpointId:v60 fallbackLanguage:0];

            __int16 v62 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315906;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              __int16 v113 = 2114;
              v114 = v17;
              __int16 v115 = 2114;
              double v116 = v80;
              __int16 v117 = 2114;
              long long v118 = v61;
              _os_log_impl(&dword_21C8A5000, v62, OS_LOG_TYPE_DEFAULT, "%s language: %{public}@, enableVTAfterSyncLanguage: %{public}@, currSiriLanguage: %{public}@", buf, 0x2Au);
            }
            if (v80 == 0.0 || !v61)
            {
              id v64 = *MEMORY[0x263F38100];
            }
            else
            {
              int v63 = [v17 isEqualToString:v61];
              id v64 = *MEMORY[0x263F38100];
              if (v63)
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 136315650;
                  v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
                  __int16 v113 = 2114;
                  v114 = v61;
                  __int16 v115 = 2114;
                  double v116 = v80;
                  _os_log_impl(&dword_21C8A5000, v64, OS_LOG_TYPE_DEFAULT, "%s Enabling VoiceTrigger Upon VoiceProfile sync for language: %{public}@ and enrolled language: %{public}@", buf, 0x20u);
                }
                _CSNotBackedupPreferencesSetValueForKey();
                CSNotBackedupInternalPreferencesSynchronize();
                id v65 = [MEMORY[0x263F85AF0] sharedPreferences];
                [v65 setVoiceTriggerEnabled:1];

                if (CSIsInternalBuild())
                {
                  long long v66 = [MEMORY[0x263F38028] sharedInstance];
                  [v66 submitVoiceTriggerIssueReport:v74];
                }
                goto LABEL_74;
              }
            }
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315394;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              __int16 v113 = 2114;
              v114 = v17;
              _os_log_impl(&dword_21C8A5000, v64, OS_LOG_TYPE_DEFAULT, "%s Not enabling VoiceTrigger Upon VoiceProfile sync for language: %{public}@", buf, 0x16u);
            }
LABEL_74:
            long long v67 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315394;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              __int16 v113 = 2114;
              v114 = v17;
              _os_log_impl(&dword_21C8A5000, v67, OS_LOG_TYPE_DEFAULT, "%s Sucessfully migrated language %{public}@", buf, 0x16u);
            }
          }
          else
          {
            id v49 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 136315394;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              __int16 v113 = 2114;
              v114 = v17;
              _os_log_error_impl(&dword_21C8A5000, v49, OS_LOG_TYPE_ERROR, "%s Migrated language %{public}@ but failed to mark SAT enrollment", buf, 0x16u);
            }
          }
          int v50 = [v19 markSATEnrollmentMigrated];
          id v51 = *MEMORY[0x263F38100];
          if (v50)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315394;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              __int16 v113 = 2114;
              v114 = v17;
              _os_log_impl(&dword_21C8A5000, v51, OS_LOG_TYPE_DEFAULT, "%s Sucessfully marked as migrated for language : %{public}@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
            __int16 v113 = 2114;
            v114 = v17;
            _os_log_error_impl(&dword_21C8A5000, v51, OS_LOG_TYPE_ERROR, "%s Failed to mark migrated for language : %{public}@", buf, 0x16u);
          }
          goto LABEL_56;
        }
        char v37 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
          __int16 v113 = 2114;
          v114 = v17;
          char v34 = v37;
          id v35 = "%s Skipping language [%{public}@] as voice profile not compatible";
          uint32_t v36 = 22;
          goto LABEL_34;
        }
      }
      else
      {
        int v33 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315650;
          v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
          __int16 v113 = 2114;
          v114 = v17;
          __int16 v115 = 2114;
          double v116 = v24;
          char v34 = v33;
          id v35 = "%s Skipping language [%{public}@] as file path doesnt exist - %{public}@";
          uint32_t v36 = 32;
LABEL_34:
          _os_log_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, v36);
        }
      }
LABEL_57:

LABEL_58:
      if (v15 == ++v16)
      {
        uint64_t v68 = [v84 countByEnumeratingWithState:&v94 objects:v119 count:16];
        uint64_t v15 = v68;
        if (!v68) {
          goto LABEL_78;
        }
        goto LABEL_16;
      }
    }
  }
LABEL_81:
  long long v69 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v3);
  id v70 = (id *)(v106 + 5);
  id v88 = (id)v106[5];
  char v71 = [v69 removeItemAtPath:v85 error:&v88];
  objc_storeStrong(v70, v88);

  if ((v71 & 1) == 0)
  {
    id v6 = (id)*MEMORY[0x263F38100];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v72 = [(id)v106[5] localizedDescription];
      *(_DWORD *)long long buf = 136315650;
      v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
      __int16 v113 = 2114;
      v114 = v85;
      __int16 v115 = 2114;
      double v116 = v72;
      _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, "%s Failed to remove update path [%{public}@] upon migration completion, error: %{public}@", buf, 0x20u);
    }
    goto LABEL_84;
  }
LABEL_85:

  _Block_object_dispose(&v105, 8);
}

void __59__SSRVoiceProfileManager_notifyUserVoiceProfileUpdateReady__block_invoke_141(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  id v6 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = *(void **)(a1 + 32);
    uint64_t v8 = v6;
    id v9 = [v7 profileID];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v12 = 136315906;
    id v13 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Adding voiceprofile for %{public}@ in language %{public}@ completed with error %{public}@", (uint8_t *)&v12, 0x2Au);
  }
  [*(id *)(a1 + 48) leave];
}

- (void)notifyUserVoiceProfileDownloadReadyForUser:(id)a3 getData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__6789;
  void v21[4] = __Block_byref_object_dispose__6790;
  id v22 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__SSRVoiceProfileManager_notifyUserVoiceProfileDownloadReadyForUser_getData_completion___block_invoke;
  block[3] = &unk_264429DA0;
  id v18 = v9;
  id v19 = v10;
  id v16 = v8;
  uint64_t v17 = self;
  uint64_t v20 = v21;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, block);

  _Block_object_dispose(v21, 8);
}

void __88__SSRVoiceProfileManager_notifyUserVoiceProfileDownloadReadyForUser_getData_completion___block_invoke(uint64_t a1)
{
  v38[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"Primary User";
    if (*(void *)(a1 + 32)) {
      id v4 = *(__CFString **)(a1 + 32);
    }
    *(_DWORD *)long long buf = 136315394;
    uint64_t v30 = "-[SSRVoiceProfileManager notifyUserVoiceProfileDownloadReadyForUser:getData:completion:]_block_invoke";
    __int16 v31 = 2112;
    id v32 = v4;
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Enrolling voice profile of %@ ", buf, 0x16u);
  }
  if (!*(void *)(a1 + 48))
  {
    id v13 = [NSString stringWithFormat:@"Missing downloadTriggerBlock - Bailing out"];
    id v14 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v30 = "-[SSRVoiceProfileManager notifyUserVoiceProfileDownloadReadyForUser:getData:completion:]_block_invoke";
      __int16 v31 = 2114;
      id v32 = v13;
      _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    uint64_t v15 = *(void *)(a1 + 56);
    if (!v15) {
      goto LABEL_22;
    }
    id v16 = (void *)MEMORY[0x263F087E8];
    char v37 = @"reason";
    v38[0] = v13;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v18 = v16;
    uint64_t v19 = 713;
    goto LABEL_21;
  }
  id v5 = *(void **)(a1 + 40);
  if (!v5[1])
  {
    uint64_t v20 = NSString;
    __int16 v21 = [MEMORY[0x263F380D0] deviceProductType];
    id v13 = [v20 stringWithFormat:@"Unknown device category for device type %@ - Bailing out", v21];

    id v22 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v30 = "-[SSRVoiceProfileManager notifyUserVoiceProfileDownloadReadyForUser:getData:completion:]_block_invoke";
      __int16 v31 = 2114;
      id v32 = v13;
      _os_log_error_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    uint64_t v15 = *(void *)(a1 + 56);
    if (!v15) {
      goto LABEL_22;
    }
    id v23 = (void *)MEMORY[0x263F087E8];
    id v35 = @"reason";
    uint32_t v36 = v13;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v18 = v23;
    uint64_t v19 = 711;
LABEL_21:
    double v24 = [v18 errorWithDomain:@"com.apple.speakerrecognition" code:v19 userInfo:v17];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v24);

LABEL_22:
    return;
  }
  if (([v5 _checkIfDownloadRequiredForProfileId:*(void *)(a1 + 32)] & 1) == 0)
  {
    double v25 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = *(__CFString **)(a1 + 32);
      *(_DWORD *)long long buf = 136315394;
      uint64_t v30 = "-[SSRVoiceProfileManager notifyUserVoiceProfileDownloadReadyForUser:getData:completion:]_block_invoke";
      __int16 v31 = 2114;
      id v32 = v26;
      _os_log_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_DEFAULT, "%s Skipping download for voice profile: %{public}@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  uint64_t v6 = [*(id *)(a1 + 40) _downloadAndEnrollVoiceProfileForProfileId:*(void *)(a1 + 32) withDownloadTriggerBlock:*(void *)(a1 + 48)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (!v9)
  {
LABEL_25:
    uint64_t v27 = *(void *)(a1 + 56);
    if (!v27) {
      return;
    }
    id v12 = *(void (**)(void))(v27 + 16);
    goto LABEL_27;
  }
  id v10 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
  {
    char v28 = *(__CFString **)(a1 + 32);
    *(_DWORD *)long long buf = 136315650;
    uint64_t v30 = "-[SSRVoiceProfileManager notifyUserVoiceProfileDownloadReadyForUser:getData:completion:]_block_invoke";
    __int16 v31 = 2112;
    id v32 = v28;
    __int16 v33 = 2112;
    uint64_t v34 = v9;
    _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s Failed enrolling %@ with error %@", buf, 0x20u);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11)
  {
    id v12 = *(void (**)(void))(v11 + 16);
LABEL_27:
    v12();
  }
}

- (id)getCacheDirectoryForAppDomain:(id)a3
{
  id v4 = [(SSRVoiceProfileManager *)self _CSSATCachePathForAppDomain:a3];
  id v5 = [(SSRVoiceProfileManager *)self _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:v4];

  return v5;
}

- (id)getUserVoiceProfileUpdateDirectory
{
  uint64_t v3 = [(SSRVoiceProfileManager *)self _CSSATDownloadPath];
  id v4 = [(SSRVoiceProfileManager *)self _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:v3];

  return v4;
}

- (void)notifyImplicitTrainingUtteranceAvailable:(id)a3 forVoiceProfileId:(id)a4 withRecordDeviceInfo:(id)a5 withRecordCtxt:(id)a6 withVoiceTriggerCtxt:(id)a7 withOtherCtxt:(id)a8 assetToUse:(id)a9 withCompletion:(id)a10
{
  v163[1] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v106 = a5;
  id v107 = a6;
  id v105 = a7;
  id v104 = a8;
  id v103 = a9;
  id v18 = a10;
  char v143 = 0;
  v141[0] = 0;
  v141[1] = v141;
  v141[2] = 0x3032000000;
  v141[3] = __Block_byref_object_copy__6789;
  v141[4] = __Block_byref_object_dispose__6790;
  id v142 = (id)[objc_alloc(MEMORY[0x263F38098]) initWithDescription:@"ImplicitTraining"];
  v137[0] = MEMORY[0x263EF8330];
  v137[1] = 3221225472;
  v137[2] = __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke;
  v137[3] = &unk_264429CD0;
  uint64_t v19 = (__CFString *)v17;
  v138 = v19;
  v140 = v141;
  id v20 = v18;
  id v139 = v20;
  __int16 v21 = (void (**)(void, void))MEMORY[0x21D4B2740](v137);
  id v22 = (os_log_t *)MEMORY[0x263F38100];
  id v23 = (id)*MEMORY[0x263F38100];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    if (v19) {
      double v24 = v19;
    }
    else {
      double v24 = @"primary";
    }
    double v25 = [v106 route];
    int v26 = [v107 type];
    *(_DWORD *)long long buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordD"
                         "eviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v24;
    *(_WORD *)&buf[22] = 2114;
    v159 = v25;
    LOWORD(v160) = 1024;
    *(_DWORD *)((char *)&v160 + 2) = v26;
    _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Received implicit utterance for %{public}@ from %{public}@ with context %d", buf, 0x26u);
  }
  uint64_t v27 = [MEMORY[0x263F38068] sharedPreferences];
  int v28 = [v27 shouldDisableImplicitTraining];

  if (!v28)
  {
    if (!v16)
    {
      os_log_t v36 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      id v35 = "%s ERR: FilePath is nil - Bailing out";
      char v37 = v36;
      uint32_t v38 = 12;
LABEL_32:
      _os_log_error_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_ERROR, v35, buf, v38);
      goto LABEL_18;
    }
    __int16 v31 = [MEMORY[0x263F08850] defaultManager];
    id v32 = [v16 path];
    char v33 = [v31 fileExistsAtPath:v32 isDirectory:&v143];

    if ((v33 & 1) == 0)
    {
      os_log_t v34 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      id v35 = "%s ERR: Training utterance doesnt exist at %@ - Bailing out";
LABEL_31:
      char v37 = v34;
      uint32_t v38 = 22;
      goto LABEL_32;
    }
    if (v143)
    {
      os_log_t v34 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      id v35 = "%s ERR: Training utterance is marked as directory at %@ - Bailing out";
      goto LABEL_31;
    }
    if (!v105)
    {
      id v29 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      uint64_t v30 = "%s VoiceTriggerEventInfo is nil - Bailing out";
      goto LABEL_9;
    }
    uint64_t v39 = *MEMORY[0x263F381A0];
    uint64_t v40 = [v105 objectForKeyedSubscript:*MEMORY[0x263F381A0]];
    BOOL v41 = v40 == 0;

    if (v41)
    {
      id v29 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      uint64_t v30 = "%s kVTEILanguageCode is nil - Bailing out";
      goto LABEL_9;
    }
    long long v102 = [v105 objectForKeyedSubscript:v39];
    id v42 = [v105 objectForKeyedSubscript:*MEMORY[0x263F38218]];
    BOOL v43 = v42 == 0;

    if (v43)
    {
      uint64_t v47 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      __int16 v48 = "%s ERR: trigger score not found in VTEI - Bailing out";
    }
    else
    {
      uint64_t v44 = [v105 objectForKeyedSubscript:*MEMORY[0x263F381A8]];
      int v45 = [v44 isEqualToString:@"Siri"];

      if (v45)
      {
        double v46 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withR"
                               "ecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
          _os_log_impl(&dword_21C8A5000, v46, OS_LOG_TYPE_DEFAULT, "%s kVTEITriggeredPhrase is JS - Bailing out", buf, 0xCu);
        }
        goto LABEL_48;
      }
      uint64_t v49 = *MEMORY[0x263F381E8];
      int v50 = [v105 objectForKeyedSubscript:*MEMORY[0x263F381E8]];
      BOOL v51 = v50 == 0;

      if (v51)
      {
        int v53 = 0;
      }
      else
      {
        double v52 = [v105 objectForKeyedSubscript:v49];
        int v53 = [v52 BOOLValue];
      }
      if ((CSIsCommunalDevice() | v53))
      {
        if ([v107 type] == 21)
        {
          queue = self->_queue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_99;
          block[3] = &unk_264429D20;
          id v129 = v106;
          v130 = self;
          id v131 = v16;
          v132 = v19;
          id v133 = v105;
          id v134 = v102;
          id v135 = v104;
          v136 = v21;
          dispatch_async(queue, block);

          double v55 = v129;
LABEL_99:

          goto LABEL_49;
        }
        if ([v107 type] == 6)
        {
          if (v103)
          {
            id v56 = v103;
            uint64_t v57 = *v22;
            if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315394;
              *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:w"
                                   "ithRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v56;
              _os_log_impl(&dword_21C8A5000, v57, OS_LOG_TYPE_DEFAULT, "%s Using asset %{public}@ provided by caller", buf, 0x16u);
            }
          }
          else
          {
            long long v58 = +[SSRAssetManager sharedManager];
            uint64_t v59 = [v58 installedAssetOfType:3 forLanguage:v102];

            id v56 = (id)v59;
            if (!v59)
            {
              uint64_t v68 = [NSString stringWithFormat:@"Failed to get asset for locale %@", v102];
              long long v69 = *v22;
              if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 136315394;
                *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId"
                                     ":withRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:"
                                     "withCompletion:]";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v68;
                _os_log_error_impl(&dword_21C8A5000, v69, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
              }
              id v70 = (void *)MEMORY[0x263F087E8];
              v162 = @"reason";
              v163[0] = v68;
              uint64_t v71 = [NSDictionary dictionaryWithObjects:v163 forKeys:&v162 count:1];
              double v72 = [v70 errorWithDomain:@"com.apple.speakerrecognition" code:802 userInfo:v71];
              ((void (**)(void, void *))v21)[2](v21, v72);
              long long v100 = (__CFString *)v68;
              long long v99 = (void *)v71;
              double v55 = 0;

              goto LABEL_98;
            }
          }
          double v55 = v56;
          if (([v56 satImplicitTrainingEnabled] & 1) == 0)
          {
            os_log_t v62 = *v22;
            if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315394;
              *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:w"
                                   "ithRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v102;
              long long v61 = "%s Implicit training not enabled for %{public}@";
              int v63 = v62;
              uint32_t v64 = 22;
LABEL_63:
              _os_log_impl(&dword_21C8A5000, v63, OS_LOG_TYPE_DEFAULT, v61, buf, v64);
              goto LABEL_64;
            }
            goto LABEL_64;
          }
          if (CSIsCommunalDevice())
          {
            if (!v19)
            {
              os_log_t v60 = *v22;
              if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 136315138;
                *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId"
                                     ":withRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:"
                                     "withCompletion:]";
                long long v61 = "%s sharedSiriId is nil - Bailing out";
LABEL_62:
                int v63 = v60;
                uint32_t v64 = 12;
                goto LABEL_63;
              }
              goto LABEL_64;
            }
          }
          else if ([MEMORY[0x263F380D0] isIOSDeviceSupportingBargeIn])
          {
            id v65 = [v105 objectForKeyedSubscript:*MEMORY[0x263F381B8]];
            int v66 = [v65 isEqualToString:*MEMORY[0x263F38198]];

            if (v66)
            {
              os_log_t v60 = *v22;
              if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 136315138;
                *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId"
                                     ":withRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:"
                                     "withCompletion:]";
                long long v61 = "%s Rejecting barge-in utterance from adding to voice profile";
                goto LABEL_62;
              }
LABEL_64:
              v21[2](v21, 0);
              goto LABEL_99;
            }
          }
          if (v106)
          {
            long long v67 = [v106 route];
            if (v67)
            {
              long long v100 = [v106 route];
            }
            else
            {
              long long v100 = @"unknown";
            }
          }
          else
          {
            long long v100 = @"unknown";
          }
          long long v73 = NSString;
          uint64_t v74 = (uint64_t)v107;
          if (v107) {
            uint64_t v74 = [v107 type];
          }
          long long v99 = objc_msgSend(v73, "stringWithFormat:", @"%lld", v74);
          long long v101 = +[SSRVoiceProfileStore sharedInstance];
          id v75 = +[SSRUtils getVoiceProfileForSiriProfileId:v19 forLanguageCode:v102];
          *(void *)long long buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v159 = __Block_byref_object_copy__6789;
          v160 = __Block_byref_object_dispose__6790;
          id v161 = 0;
          id v98 = v75;
          if (!v75)
          {
            long long v96 = [NSString stringWithFormat:@"ERR: Voice Profile not found for %@ - Bailing out", v19];
            uint64_t v81 = *v22;
            if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v150 = 136315394;
              *(void *)&v150[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:"
                                    "withRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
              *(_WORD *)&v150[12] = 2114;
              *(void *)&v150[14] = v96;
              _os_log_error_impl(&dword_21C8A5000, v81, OS_LOG_TYPE_ERROR, "%s %{public}@", v150, 0x16u);
            }
            __int16 v82 = (void *)MEMORY[0x263F087E8];
            uint64_t v156 = *MEMORY[0x263F08320];
            v157 = v96;
            id v83 = [NSDictionary dictionaryWithObjects:&v157 forKeys:&v156 count:1];
            id v84 = [v82 errorWithDomain:@"com.apple.speakerrecognition" code:731 userInfo:v83];
            ((void (**)(void, void *))v21)[2](v21, v84);

            goto LABEL_97;
          }
          uint64_t v76 = [v75 locale];
          char v77 = [v76 isEqualToString:v102];

          if ((v77 & 1) == 0)
          {
            uint64_t v85 = NSString;
            __int16 v86 = [v98 locale];
            long long v97 = [v85 stringWithFormat:@"ERR: Voice Profile locale %@ not matching with %@ - Bailing out", v86, v102];

            uint64_t v87 = *v22;
            if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v150 = 136315394;
              *(void *)&v150[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:"
                                    "withRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
              *(_WORD *)&v150[12] = 2114;
              *(void *)&v150[14] = v97;
              _os_log_error_impl(&dword_21C8A5000, v87, OS_LOG_TYPE_ERROR, "%s %{public}@", v150, 0x16u);
            }
            id v88 = (void *)MEMORY[0x263F087E8];
            uint64_t v154 = *MEMORY[0x263F08320];
            v155 = v97;
            id v89 = [NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];
            id v90 = [v88 errorWithDomain:@"com.apple.speakerrecognition" code:732 userInfo:v89];
            ((void (**)(void, void *))v21)[2](v21, v90);

            goto LABEL_97;
          }
          uint64_t v78 = [v104 objectForKeyedSubscript:@"shouldRecordPayload"];
          unsigned int v95 = [v78 BOOLValue];

          *(void *)v150 = 0;
          *(void *)&v150[8] = v150;
          *(void *)&v150[16] = 0x3032000000;
          v151 = __Block_byref_object_copy__6789;
          v152 = __Block_byref_object_dispose__6790;
          id v153 = v16;
          v126[0] = 0;
          v126[1] = v126;
          v126[2] = 0x3032000000;
          v126[3] = __Block_byref_object_copy__6789;
          v126[4] = __Block_byref_object_dispose__6790;
          id v127 = 0;
          uint64_t v120 = 0;
          uint64_t v121 = &v120;
          uint64_t v122 = 0x3032000000;
          uint64_t v123 = __Block_byref_object_copy__6789;
          v124 = __Block_byref_object_dispose__6790;
          id v79 = v153;
          id v125 = v79;
          if (CSIsCommunalDevice())
          {
            if ((v95 & 1) == 0)
            {
              double v80 = *v22;
              if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v144 = 136315394;
                v145 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDev"
                       "iceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
                __int16 v146 = 2114;
                id v147 = v79;
                _os_log_impl(&dword_21C8A5000, v80, OS_LOG_TYPE_DEFAULT, "%s Privacy disallowed implicit utterance %{public}@ - skipping", v144, 0x16u);
              }
              v21[2](v21, 0);
              goto LABEL_96;
            }
          }
          else
          {
            v118[0] = MEMORY[0x263EF8330];
            v118[1] = 3221225472;
            v118[2] = __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_120;
            v118[3] = &unk_264429D50;
            v119[1] = buf;
            v119[2] = &v120;
            v119[3] = v150;
            v119[4] = v126;
            v119[0] = v98;
            +[SSRUtils segmentVoiceTriggerFromAudioFile:v79 withVTEventInfo:v105 withStorePayloadPortion:v95 withCompletion:v118];
            uint64_t v91 = *(void *)(*(void *)&buf[8] + 40);
            if (v91)
            {
              id v92 = v119;
              v93 = *v22;
              if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v144 = 136315650;
                v145 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDev"
                       "iceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
                __int16 v146 = 2114;
                id v147 = v79;
                __int16 v148 = 2114;
                uint64_t v149 = v91;
                _os_log_error_impl(&dword_21C8A5000, v93, OS_LOG_TYPE_ERROR, "%s ERR: Failed to segment %{public}@ with %{public}@ - Bailing out", v144, 0x20u);
                uint64_t v91 = *(void *)(*(void *)&buf[8] + 40);
              }
              v21[2](v21, v91);
              goto LABEL_95;
            }
          }
          uint64_t v94 = v121[5];
          v108[0] = MEMORY[0x263EF8330];
          v108[1] = 3221225472;
          v108[2] = __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_123;
          v108[3] = &unk_264429D78;
          __int16 v115 = buf;
          id v109 = v105;
          id v110 = v79;
          double v116 = v150;
          id v111 = v99;
          v112 = v100;
          id v113 = v98;
          __int16 v117 = v126;
          v114 = v21;
          [v101 addImplicitUtterance:v94 toVoiceProfile:v113 withAsset:v55 withTriggerSource:v111 withAudioInput:v112 withCompletion:v108];

          id v92 = &v109;
LABEL_95:

LABEL_96:
          _Block_object_dispose(&v120, 8);

          _Block_object_dispose(v126, 8);
          _Block_object_dispose(v150, 8);

LABEL_97:
          _Block_object_dispose(buf, 8);

LABEL_98:
          goto LABEL_99;
        }
LABEL_48:
        v21[2](v21, 0);
LABEL_49:

        goto LABEL_19;
      }
      uint64_t v47 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      __int16 v48 = "%s ERR: SAT did not trigger!!! - Bailing out";
    }
    _os_log_error_impl(&dword_21C8A5000, v47, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);
    goto LABEL_48;
  }
  id v29 = *v22;
  if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordD"
                         "eviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
    uint64_t v30 = "%s Implicit training has been disabled -- Bailing out";
LABEL_9:
    _os_log_impl(&dword_21C8A5000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
  }
LABEL_18:
  v21[2](v21, 0);
LABEL_19:

  _Block_object_dispose(v141, 8);
}

void __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F38100];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      id v5 = (__CFString *)a1[4];
      if (!v5) {
        id v5 = @"primary";
      }
      int v10 = 136315650;
      uint64_t v11 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v5;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s ERR: Finished implicit training for %@ with error %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"primary";
    if (a1[4]) {
      uint64_t v6 = (__CFString *)a1[4];
    }
    int v10 = 136315394;
    uint64_t v11 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:withR"
          "ecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Finished implicit training for %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  uint64_t v9 = a1[5];
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

void __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_99(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) remoteDeviceUID];
  id v3 = [v2 UUIDString];

  id v4 = [[SSRRemoteControlClient alloc] initWithRemoteDeviceUUID:v3];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;

  if ([*(id *)(*(void *)(a1 + 40) + 32) waitingForConnection:0 error:3.0])
  {
    uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 32);
    id v8 = [*(id *)(a1 + 48) path];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 80);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_2;
    v15[3] = &unk_264429CF8;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 88);
    [v7 addImplicitTrainingUtteranceToRemoteFilePath:v8 forVoiceProfileId:v9 withVoiceTriggerCtxt:v10 locale:v11 withOtherCtxt:v12 completion:v15];
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 88);
    __int16 v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1001 userInfo:&unk_26CD454B8];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
}

void __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_120(uint64_t a1, void *a2, void *a3, void *a4)
{
  v22[2] = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) && CSIsOSX())
  {
    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) lastPathComponent];
    uint64_t v12 = [*(id *)(a1 + 32) voiceProfileImplicitCacheDirPath];
    +[SSRUtils createDirectoryIfDoesNotExist:v12];
    uint64_t v13 = NSURL;
    v22[0] = v12;
    v22[1] = v11;
    __int16 v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    uint64_t v15 = [v13 fileURLWithPathComponents:v14];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    id v18 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) path];
    uint64_t v19 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) path];
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v20 + 40);
    +[SSRUtils encryptFileAt:v18 andSaveTo:v19 error:&obj];
    objc_storeStrong((id *)(v20 + 40), obj);
  }
}

void __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_123(uint64_t a1, void *a2)
{
  v52[1] = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a2);
  if (v4)
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) code];
    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    if (v5 == 757)
    {
      *(void *)(v6 + 40) = 0;

      id v8 = *MEMORY[0x263F38100];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)long long buf = 136315138;
      double v46 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
      id v9 = "%s Voice Profile is full - Ignoring";
LABEL_10:
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      goto LABEL_22;
    }
    if ([v7 code] == 735)
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = 0;

      id v8 = *MEMORY[0x263F38100];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)long long buf = 136315138;
      double v46 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
      id v9 = "%s Implicit Policy not satisfied - Ignoring";
      goto LABEL_10;
    }
    uint64_t v20 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      *(_DWORD *)long long buf = 136315650;
      double v46 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
      __int16 v47 = 2114;
      uint64_t v48 = v21;
      __int16 v49 = 2114;
      uint64_t v50 = v22;
      _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, "%s ERR: Failed to process implicit utterance %{public}@ with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F38208]];
    uint64_t v11 = [v10 unsignedLongLongValue];

    uint64_t v12 = +[SSRBiometricMatch sharedInstance];
    uint64_t v13 = [v12 getLastBiometricMatchForVoiceTriggerTimeStamp:v11];

    uint64_t v14 = *MEMORY[0x263F38180];
    uint64_t v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F38180]];
    if (v15)
    {
      uint64_t v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
      uint64_t v17 = [v16 BOOLValue];
    }
    else
    {
      uint64_t v17 = 0;
    }

    id v23 = (os_log_t *)MEMORY[0x263F38100];
    double v24 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 136315394;
      double v46 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
      __int16 v47 = 2114;
      uint64_t v48 = v25;
      _os_log_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_DEFAULT, "%s Processed implicit utterance %{public}@ successfully", buf, 0x16u);
    }
    if ((CSIsCommunalDevice() & 1) == 0)
    {
      int v26 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) path];
      LOBYTE(v43) = 0;
      +[SSRVoiceProfileMetadataManager saveUtteranceMetadataForUtterance:v26 enrollmentType:@"implicit" isHandheldEnrollment:v17 triggerSource:*(void *)(a1 + 48) audioInput:*(void *)(a1 + 56) otherBiometricResult:v13 containsPayload:v43];

      uint64_t v27 = *(void **)(a1 + 64);
      v52[0] = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      int v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:1];
      id v29 = (id)[v27 addUtterances:v28 spIdType:1];

      uint64_t v30 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      if (v30)
      {
        __int16 v31 = [v30 path];
        LOBYTE(v44) = 1;
        +[SSRVoiceProfileMetadataManager saveUtteranceMetadataForUtterance:v31 enrollmentType:@"implicit" isHandheldEnrollment:v17 triggerSource:*(void *)(a1 + 48) audioInput:*(void *)(a1 + 56) otherBiometricResult:v13 containsPayload:v44];

        id v32 = *(void **)(a1 + 64);
        uint64_t v51 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
        char v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
        id v34 = (id)[v32 addUtterances:v33 spIdType:3];
      }
      id v35 = *v23;
      if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        double v46 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:w"
              "ithRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
        _os_log_impl(&dword_21C8A5000, v35, OS_LOG_TYPE_DEFAULT, "%s Generate profile change notification", buf, 0xCu);
      }
      notify_post("com.apple.voicetrigger.PHSProfileModified");
    }
  }
LABEL_22:
  os_log_t v36 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (v36)
  {
    char v37 = [v36 path];
    +[SSRUtils removeItemAtPath:v37];
  }
  uint32_t v38 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  if (v38)
  {
    uint64_t v39 = [v38 path];
    +[SSRUtils removeItemAtPath:v39];
  }
  if (CSIsOSX())
  {
    uint64_t v40 = [*(id *)(a1 + 64) voiceProfileImplicitCacheDirPath];
    id v41 = +[SSRUtils removeItemAtPath:v40];

    id v42 = [MEMORY[0x263F087C8] defaultCenter];
    [v42 postNotificationName:@"com.apple.voicetrigger.speakermodelUpdated" object:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = v4;
      id v8 = [v3 localizedDescription];
      int v9 = 136315394;
      id v10 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke_2";
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s Failed to add implicit training utterance to remote, error: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = [v5 path];
    +[SSRUtils removeItemAtPath:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isImplicitTrainingRequiredForVoiceProfileId:(id)a3 locale:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __88__SSRVoiceProfileManager_isImplicitTrainingRequiredForVoiceProfileId_locale_completion___block_invoke;
  v23[3] = &unk_264429CA8;
  id v10 = v7;
  id v24 = v10;
  id v11 = v8;
  id v25 = v11;
  id v12 = v9;
  id v26 = v12;
  uint64_t v13 = (void (**)(void, void, void))MEMORY[0x21D4B2740](v23);
  uint64_t v14 = +[SSRAssetManager sharedManager];
  uint64_t v15 = [v14 installedAssetOfType:3 forLanguage:v11];

  uint64_t v16 = +[SSRVoiceProfileStore sharedInstance];
  uint64_t v17 = +[SSRUtils getVoiceProfileForSiriProfileId:v10 forLanguageCode:v11];
  if (v15
    && [v15 satImplicitTrainingEnabled]
    && v16
    && v17
    && ([v17 locale],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 isEqualToString:v11],
        v18,
        v19))
  {
    [v16 isImplicitTrainingRequiredToVoiceProfile:v17 withAsset:v15 completion:v13];
  }
  else
  {
    uint64_t v20 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = v20;
      uint64_t v22 = [v17 locale];
      *(_DWORD *)long long buf = 136316162;
      int v28 = "-[SSRVoiceProfileManager isImplicitTrainingRequiredForVoiceProfileId:locale:completion:]";
      __int16 v29 = 2114;
      uint64_t v30 = v15;
      __int16 v31 = 2114;
      id v32 = v16;
      __int16 v33 = 2114;
      id v34 = v17;
      __int16 v35 = 2114;
      os_log_t v36 = v22;
      _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s Implicit training not needed since: asset(%{public}@), profileStore(%{public}@), profile(%{public}@), profile locale(%{public}@)", buf, 0x34u);
    }
    v13[2](v13, 0, 0);
  }
}

void __88__SSRVoiceProfileManager_isImplicitTrainingRequiredForVoiceProfileId_locale_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    if (a2) {
      id v7 = @"YES";
    }
    int v11 = 136315906;
    id v12 = "-[SSRVoiceProfileManager isImplicitTrainingRequiredForVoiceProfileId:locale:completion:]_block_invoke";
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v7;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s isImplicitTraining required for profileId %{public}@, locale(%{public}@) ? %{public}@", (uint8_t *)&v11, 0x2Au);
  }
  uint64_t v10 = a1[6];
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

- (void)_addUtterances:(id)a3 toProfile:(id)a4 withContext:(id)a5 doUtteranceDonation:(BOOL)a6 withCompletion:(id)a7
{
  BOOL v8 = a6;
  v60[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  __int16 v15 = (void (**)(id, void *))a7;
  uint64_t v16 = +[SSRVoiceProfileStore sharedInstance];
  uint64_t v45 = 0;
  double v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__6789;
  __int16 v49 = __Block_byref_object_dispose__6790;
  id v50 = 0;
  if (!v13)
  {
    id v23 = [NSString stringWithFormat:@"ERR: profile is nil - Bailing out"];
    int v28 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager _addUtterances:toProfile:withContext:doUtteranceDonation:withCompletion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      _os_log_error_impl(&dword_21C8A5000, v28, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      if (!v15) {
        goto LABEL_15;
      }
    }
    else if (!v15)
    {
      goto LABEL_15;
    }
    __int16 v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v59 = @"reason";
    v60[0] = v23;
    uint64_t v30 = [NSDictionary dictionaryWithObjects:v60 forKeys:&v59 count:1];
    __int16 v31 = [v29 errorWithDomain:@"com.apple.speakerrecognition" code:713 userInfo:v30];
    v15[2](v15, v31);

    goto LABEL_15;
  }
  if (!v14)
  {
    id v23 = [NSString stringWithFormat:@"ERR: Context is nil - Bailing out"];
    id v32 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager _addUtterances:toProfile:withContext:doUtteranceDonation:withCompletion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      _os_log_error_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      if (!v15) {
        goto LABEL_15;
      }
    }
    else if (!v15)
    {
      goto LABEL_15;
    }
    __int16 v33 = (void *)MEMORY[0x263F087E8];
    uint64_t v57 = @"reason";
    long long v58 = v23;
    id v34 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    __int16 v35 = [v33 errorWithDomain:@"com.apple.speakerrecognition" code:713 userInfo:v34];
    v15[2](v15, v35);

    goto LABEL_15;
  }
  uint64_t v17 = objc_msgSend(v13, "addUtterances:spIdType:", v12, objc_msgSend(v14, "spIdType"));
  uint64_t v18 = (void *)v46[5];
  v46[5] = v17;

  uint64_t v19 = v46;
  if (v46[5])
  {
    uint64_t v20 = NSString;
    uint64_t v21 = [v13 profileID];
    uint64_t v22 = [(id)v46[5] localizedDescription];
    id v23 = [v20 stringWithFormat:@"ERR: Failed to copy %@ to %@, error: %@", v12, v21, v22];

    id v24 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileManager _addUtterances:toProfile:withContext:doUtteranceDonation:withCompletion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      if (!v15) {
        goto LABEL_15;
      }
      goto LABEL_6;
    }
    if (v15)
    {
LABEL_6:
      id v25 = (void *)MEMORY[0x263F087E8];
      double v55 = @"reason";
      id v56 = v23;
      id v26 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      uint64_t v27 = [v25 errorWithDomain:@"com.apple.speakerrecognition" code:721 userInfo:v26];
      v15[2](v15, v27);
    }
LABEL_15:

    goto LABEL_24;
  }
  if (!v8)
  {
    os_log_t v36 = 0;
LABEL_23:
    v19[5] = 0;

    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __98__SSRVoiceProfileManager__addUtterances_toProfile_withContext_doUtteranceDonation_withCompletion___block_invoke_3;
    v37[3] = &unk_264429C80;
    id v41 = &v45;
    uint64_t v40 = v15;
    id v38 = v13;
    uint64_t v39 = self;
    [v16 addUserVoiceProfile:v38 withContext:v14 withCompletion:v37];

    goto LABEL_24;
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  double v52 = __Block_byref_object_copy__6789;
  int v53 = __Block_byref_object_dispose__6790;
  id v54 = 0;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __98__SSRVoiceProfileManager__addUtterances_toProfile_withContext_doUtteranceDonation_withCompletion___block_invoke;
  v42[3] = &unk_264429C58;
  uint64_t v44 = buf;
  id v43 = v13;
  [v12 enumerateObjectsUsingBlock:v42];
  if (!*(void *)(*(void *)&buf[8] + 40))
  {

    _Block_object_dispose(buf, 8);
    uint64_t v19 = v46;
    os_log_t v36 = (void *)v46[5];
    goto LABEL_23;
  }
  if (v15) {
    ((void (*)(void (**)(id, void *)))v15[2])(v15);
  }

  _Block_object_dispose(buf, 8);
LABEL_24:
  _Block_object_dispose(&v45, 8);
}

void __98__SSRVoiceProfileManager__addUtterances_toProfile_withContext_doUtteranceDonation_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v29[1] = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263EFF990];
  id v8 = a2;
  uint64_t v9 = [v7 data];
  [MEMORY[0x263F38038] lpcmInt16ASBD];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  id v23 = __98__SSRVoiceProfileManager__addUtterances_toProfile_withContext_doUtteranceDonation_withCompletion___block_invoke_2;
  id v24 = &unk_264429C30;
  uint64_t v26 = *(void *)(a1 + 40);
  id v10 = v9;
  id v25 = v10;
  +[SSRUtils streamAudioFromFileUrl:v8 audioStreamBasicDescriptor:v27 samplesPerStreamChunk:640 audioDataAvailableHandler:&v21];

  if (v10)
  {
    int v11 = objc_msgSend(MEMORY[0x263F08C38], "UUID", v21, v22, v23, v24);
    id v12 = +[SSRVoiceProfileComposer sharedTrainer];
    id v13 = (void *)[v10 copy];
    id v14 = [*(id *)(a1 + 32) locale];
    __int16 v15 = [v12 donateAndLogEnrollmentUtterance:v13 locale:v14 utteranceId:a3 mhUUID:v11 phId:0];

    if (v15)
    {
      [*(id *)(a1 + 32) addDonationId:v15];
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08320];
      v29[0] = @"canot get donationId, please check if opt-in setting is turned on or donation entitlement is added";
      uint64_t v17 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      uint64_t v18 = [v16 errorWithDomain:@"com.apple.speakerrecognition" code:0 userInfo:v17];
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

void __98__SSRVoiceProfileManager__addUtterances_toProfile_withContext_doUtteranceDonation_withCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) appDomain];
    char v8 = [v7 isEqualToString:@"com.apple.siri"];

    if (v8)
    {
      if ([*(id *)(a1 + 32) markSATEnrollmentSuccess])
      {
        if (CSIsIOS() && (CSIsCommunalDevice() & 1) == 0)
        {
          uint64_t v9 = *(void **)(a1 + 40);
          id v10 = [*(id *)(a1 + 32) locale];
          [v9 _markVoiceProfileTrainingSyncForLanguage:v10];
        }
        uint64_t v11 = *(void *)(a1 + 48);
        if (v11) {
          (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
        }
        notify_post("com.apple.voicetrigger.PHSProfileModified");
      }
      else
      {
        id v14 = NSString;
        __int16 v15 = [*(id *)(a1 + 32) profileID];
        uint64_t v16 = [v14 stringWithFormat:@"ERR: Failed in marking Enrollment as Successful for profile %@", v15];

        uint64_t v17 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          id v25 = "-[SSRVoiceProfileManager _addUtterances:toProfile:withContext:doUtteranceDonation:withCompletion:]_block_invoke";
          __int16 v26 = 2114;
          id v27 = v16;
          _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
        }
        uint64_t v18 = *(void *)(a1 + 48);
        if (v18)
        {
          uint64_t v19 = (void *)MEMORY[0x263F087E8];
          uint64_t v22 = *MEMORY[0x263F08320];
          id v23 = v16;
          uint64_t v20 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          uint64_t v21 = [v19 errorWithDomain:@"com.apple.speakerrecognition" code:723 userInfo:v20];
          (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v21);
        }
      }
      goto LABEL_19;
    }
  }
  else
  {
    id v12 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v25 = "-[SSRVoiceProfileManager _addUtterances:toProfile:withContext:doUtteranceDonation:withCompletion:]_block_invoke_3";
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s ERR: Failed to add profile into the store with error %{public}@", buf, 0x16u);
    }
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, void))(v13 + 16))(v13, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
LABEL_19:
}

void __98__SSRVoiceProfileManager__addUtterances_toProfile_withContext_doUtteranceDonation_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  else
  {
    char v8 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a2 + 16) length:*(unsigned int *)(a2 + 12)];
    if (v8)
    {
      [*(id *)(a1 + 32) appendData:v8];
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F08320];
      v15[0] = @"dataChunk being nil";
      id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      uint64_t v11 = [v9 errorWithDomain:@"com.apple.speakerrecognition" code:0 userInfo:v10];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
  }
}

- (void)addUtterances:(id)a3 toProfile:(id)a4 withContext:(id)a5 withCompletion:(id)a6
{
}

- (id)updateVoiceProfile:(id)a3 withUserName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[SSRVoiceProfileStore sharedInstance];
  char v8 = [v7 updateVoiceProfile:v6 withUserName:v5];

  return v8;
}

- (id)newVoiceProfileWithLocale:(id)a3 withAppDomain:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SSRVoiceProfile alloc] initNewVoiceProfileWithLocale:v6 withAppDomain:v5];

  return v7;
}

- (id)_getVoiceProfilesForSiriProfileId:(id)a3 withLanguageCode:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(SSRVoiceProfileManager *)self provisionedVoiceProfilesForAppDomain:@"com.apple.siri" withLocale:a4];
  if ([v7 count])
  {
    if (CSIsCommunalDevice())
    {
      char v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v23 = v7;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v10) {
        goto LABEL_14;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      while (1)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          __int16 v15 = [v14 siriProfileId];
          if ([v15 isEqualToString:v6])
          {
          }
          else
          {
            uint64_t v16 = [v14 profileID];
            int v17 = [v16 isEqualToString:v6];

            if (!v17) {
              continue;
            }
          }
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (!v11)
        {
LABEL_14:

          if ([v8 count]) {
            uint64_t v18 = v8;
          }
          else {
            uint64_t v18 = 0;
          }
          id v19 = v18;

          id v7 = v23;
          goto LABEL_25;
        }
      }
    }
    if ((unint64_t)[v7 count] >= 2)
    {
      uint64_t v21 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v30 = "-[SSRVoiceProfileManager _getVoiceProfilesForSiriProfileId:withLanguageCode:]";
        __int16 v31 = 2114;
        id v32 = v7;
        _os_log_error_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_ERROR, "%s ERR: More than one Siri Voice Profiles - %{public}@", buf, 0x16u);
      }
    }
    id v19 = v7;
  }
  else
  {
    uint64_t v20 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v30 = "-[SSRVoiceProfileManager _getVoiceProfilesForSiriProfileId:withLanguageCode:]";
      _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, "%s ERR: No configured Siri Profiles", buf, 0xCu);
    }
    id v19 = 0;
  }
LABEL_25:

  return v19;
}

- (id)discardSiriEnrollmentForProfileId:(id)a3 forLanguageCode:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(SSRVoiceProfileManager *)self _getVoiceProfilesForSiriProfileId:v6 withLanguageCode:v7];
  id v9 = v8;
  uint64_t v21 = v7;
  uint64_t v22 = v6;
  if (!v8)
  {
    id v19 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      __int16 v29 = "-[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:]";
      __int16 v30 = 2114;
      id v31 = v6;
      __int16 v32 = 2114;
      id v33 = v7;
      _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s ERR: Profile not available for %{public}@ & %{public}@ - Bailing out", buf, 0x20u);
    }
    goto LABEL_15;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v7, v6);
  if (!v10)
  {
LABEL_15:
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v24;
  uint64_t v14 = (os_log_t *)MEMORY[0x263F38100];
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v16 = v12;
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v9);
      }
      int v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      uint64_t v12 = [(SSRVoiceProfileManager *)self deleteUserVoiceProfile:v17];

      if (v12)
      {
        uint64_t v18 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315650;
          __int16 v29 = "-[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:]";
          __int16 v30 = 2114;
          id v31 = v17;
          __int16 v32 = 2114;
          id v33 = v12;
          _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete %{public}@ with error %{public}@", buf, 0x20u);
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v11);
LABEL_16:

  return v12;
}

- (void)discardSiriEnrollmentForLanguageCode:(id)a3
{
  id v3 = [(SSRVoiceProfileManager *)self discardSiriEnrollmentForProfileId:0 forLanguageCode:a3];
}

- (id)modelDirectoryPathForProfile:(id)a3
{
  return (id)[a3 voiceProfileModelFilePathForRecognizerType:2 spIdType:1];
}

- (id)SSRBasePathForAppDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(SSRVoiceProfileManager *)self baseDir];
  id v6 = [v5 stringByAppendingPathComponent:@"VoiceTrigger/SAT"];
  id v7 = [v6 stringByAppendingPathComponent:v4];

  return v7;
}

- (id)SSRSpeakerProfilesBasePath
{
  uint64_t v2 = [(SSRVoiceProfileManager *)self baseDir];
  id v3 = [v2 stringByAppendingPathComponent:@"VoiceTrigger/SAT"];

  return v3;
}

- (id)baseDir
{
  if ([MEMORY[0x263F380D0] isDarwinOS])
  {
    uint64_t v2 = [@"/var/mobile" stringByAppendingPathComponent:@"Library"];
  }
  else
  {
    id v3 = CPSharedResourcesDirectory();
    uint64_t v2 = [v3 stringByAppendingPathComponent:@"Library"];
  }

  return v2;
}

- (BOOL)isSpeakerRecognitionAvailable
{
  return 1;
}

- (id)getSATEnrollmentPath
{
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(SSRVoiceProfileManager *)self SSRSpeakerProfilesBasePath];
  int v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

  id v6 = 0;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x263EFF8C0];
    char v8 = [(SSRVoiceProfileManager *)self SSRSpeakerProfilesBasePath];
    id v6 = objc_msgSend(v7, "arrayWithObjects:", v8, 0);
  }

  return v6;
}

- (SSRVoiceProfileManager)initWithEndpointId:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SSRVoiceProfileManager;
  int v5 = [(SSRVoiceProfileManager *)&v13 init];
  if (v5)
  {
    id v6 = [MEMORY[0x263F380D0] deviceProductType];
    v5->_unint64_t currentDeviceCategory = +[SSRUtils deviceCategoryForDeviceProductType:v6];

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cs.profileManager", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [v4 copy];
    endpointUUID = v5->_endpointUUID;
    v5->_endpointUUID = (NSUUID *)v9;

    lastRepromptedDate = v5->_lastRepromptedDate;
    v5->_lastRepromptedDate = (NSString *)@"<unset>";
  }
  return v5;
}

- (SSRVoiceProfileManager)init
{
  return [(SSRVoiceProfileManager *)self initWithEndpointId:0];
}

+ (void)clearVTEnableAfterProfileSyncFlag
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "+[SSRVoiceProfileManager clearVTEnableAfterProfileSyncFlag]";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Clearing the VT enable flag upon profile sync", (uint8_t *)&v3, 0xCu);
  }
  _CSNotBackedupPreferencesSetValueForKey();
  CSNotBackedupInternalPreferencesSynchronize();
}

+ (id)sharedInstanceWithEndpointId:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3
    && sharedInstanceWithEndpointId__sharedVoiceProfileManager
    && ([(id)sharedInstanceWithEndpointId__sharedVoiceProfileManager endpointUUID],
        id v4 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        v4 != v3))
  {
    uint64_t v5 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      char v8 = (void *)sharedInstanceWithEndpointId__sharedVoiceProfileManager;
      uint64_t v9 = v5;
      uint64_t v10 = [v8 endpointUUID];
      *(_DWORD *)long long buf = 136315650;
      uint64_t v14 = "+[SSRVoiceProfileManager sharedInstanceWithEndpointId:]";
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s sharedVoiceProfileManager already instantiated with a different endpointUUID. existing-endpointUUID:%@ requested-endpointUUID:%@", buf, 0x20u);
    }
    id v6 = 0;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__SSRVoiceProfileManager_sharedInstanceWithEndpointId___block_invoke;
    block[3] = &unk_26442A618;
    id v12 = v3;
    if (sharedInstanceWithEndpointId__onceToken != -1) {
      dispatch_once(&sharedInstanceWithEndpointId__onceToken, block);
    }
    id v6 = (id)sharedInstanceWithEndpointId__sharedVoiceProfileManager;
  }

  return v6;
}

uint64_t __55__SSRVoiceProfileManager_sharedInstanceWithEndpointId___block_invoke(uint64_t a1)
{
  SSRLogInitIfNeeded();
  sharedInstanceWithEndpointId__sharedVoiceProfileManager = [[SSRVoiceProfileManager alloc] initWithEndpointId:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

+ (SSRVoiceProfileManager)sharedInstance
{
  return (SSRVoiceProfileManager *)+[SSRVoiceProfileManager sharedInstanceWithEndpointId:0];
}

@end