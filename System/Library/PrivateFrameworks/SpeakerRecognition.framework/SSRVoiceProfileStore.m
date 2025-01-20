@interface SSRVoiceProfileStore
+ (id)sharedInstance;
- (BOOL)_checkIfRetrainingRequiredForProfile:(id)a3;
- (BOOL)checkIfVoiceProfile:(id)a3 needsUpdatedWith:(id)a4 withCategory:(unint64_t)a5;
- (BOOL)cleanupDuplicatedProfiles;
- (BOOL)evaluateImplicitAdditionPolicyWithScores:(id)a3 forProfile:(id)a4 withImplicitThreshold:(float)a5 withDeltaThreshold:(float)a6;
- (OS_dispatch_queue)queue;
- (SSRVoiceProfileStorePrefs)storePrefs;
- (id)_deleteUserVoiceProfile:(id)a3;
- (id)_enrolledVoiceProfiles;
- (id)_getTopScoringProfileIdFromScores:(id)a3;
- (id)_retrainVoiceProfile:(id)a3 withContext:(id)a4;
- (id)_retrainVoiceProfile:(id)a3 withContext:(id)a4 withUtterances:(id)a5;
- (id)copyAudioFiles:(id)a3 toProfile:(id)a4 forModelType:(unint64_t)a5;
- (id)deleteUserVoiceProfile:(id)a3;
- (id)initStore;
- (id)loadCurrentVoiceProfiles;
- (id)updateVoiceProfile:(id)a3 withUserName:(id)a4;
- (id)updateVoiceProfile:(id)a3 withUserName:(id)a4 withBasePathExclave:(id)a5;
- (id)userVoiceProfileForVoiceProfileID:(id)a3;
- (id)userVoiceProfilesForAppDomain:(id)a3;
- (id)userVoiceProfilesForAppDomain:(id)a3 forLocale:(id)a4;
- (id)userVoiceProfilesForLocale:(id)a3;
- (void)_logVoiceProfileConfusionWithCleanup:(BOOL)a3;
- (void)_retrainLiveOnOnboardedProfilesForLanguage:(id)a3 withForceRetrain:(BOOL)a4 withCompletion:(id)a5;
- (void)_saveTrainedUsers:(id)a3;
- (void)_synchronizeSiriVoiceProfilesWithAssistant;
- (void)_updateTrainedUsersWithAction:(unint64_t)a3 UserVoiceProfile:(id)a4;
- (void)addImplicitUtterance:(id)a3 toVoiceProfile:(id)a4 withAsset:(id)a5 withTriggerSource:(id)a6 withAudioInput:(id)a7 withCompletion:(id)a8;
- (void)addUserVoiceProfile:(id)a3 withContext:(id)a4 withCompletion:(id)a5;
- (void)cleanupInvalidSiriProfilesFromPersonalDevicesForLanguage:(id)a3 appDomain:(id)a4;
- (void)cleanupVoiceProfileModelFilesForLocale:(id)a3 withAsset:(id)a4;
- (void)cleanupVoiceProfileStore:(id)a3;
- (void)isImplicitTrainingRequiredToVoiceProfile:(id)a3 withAsset:(id)a4 completion:(id)a5;
- (void)logVoiceProfileConfusionWithCleanup:(BOOL)a3;
- (void)migrateVoiceProfilesIfNeededWithCompletionBlock:(id)a3;
- (void)retrainVoiceProfile:(id)a3 withContext:(id)a4 withCompletion:(id)a5;
- (void)saveVoiceProfiles:(id)a3 completion:(id)a4;
- (void)setQueue:(id)a3;
- (void)setStorePrefs:(id)a3;
@end

@implementation SSRVoiceProfileStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePrefs, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setStorePrefs:(id)a3
{
}

- (SSRVoiceProfileStorePrefs)storePrefs
{
  return self->_storePrefs;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)copyAudioFiles:(id)a3 toProfile:(id)a4 forModelType:(unint64_t)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = [a4 voiceProfileAudioDirPathForSpidType:a5];
  v33 = [NSURL fileURLWithPath:v8];
  +[SSRUtils createDirectoryIfDoesNotExist:v8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v7;
  v10 = (void *)[v9 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (!v10)
  {
    id v20 = v9;
    goto LABEL_19;
  }
  v31 = v8;
  id obj = v9;
  uint64_t v11 = *(void *)v37;
  v12 = v33;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      v15 = [v14 URLByDeletingPathExtension];
      v16 = [v15 URLByAppendingPathExtension:@"json"];

      v17 = [v16 lastPathComponent];
      v18 = [v12 URLByAppendingPathComponent:v17];

      v19 = [MEMORY[0x263F08850] defaultManager];
      id v35 = 0;
      [v19 copyItemAtURL:v16 toURL:v18 error:&v35];
      id v20 = v35;

      if (v20)
      {
        v22 = [NSString stringWithFormat:@"Failed to copy %@ to %@ with error %@", v16, v18, v20];
        v24 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[SSRVoiceProfileStore copyAudioFiles:toProfile:forModelType:]";
          __int16 v46 = 2112;
          v47 = v22;
          _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
        }
        v25 = (void *)MEMORY[0x263F087E8];
        v42 = @"reason";
        v43 = v22;
        v26 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        v10 = [v25 errorWithDomain:@"com.apple.speakerrecognition" code:721 userInfo:v26];
        goto LABEL_18;
      }
      v21 = [v14 lastPathComponent];
      v22 = [v12 URLByAppendingPathComponent:v21];

      v23 = [MEMORY[0x263F08850] defaultManager];
      id v34 = 0;
      [v23 copyItemAtURL:v14 toURL:v22 error:&v34];
      id v20 = v34;

      if (v20)
      {
        v26 = [NSString stringWithFormat:@"Failed to copy %@ to %@ with error %@", v14, v22, v20];
        v27 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[SSRVoiceProfileStore copyAudioFiles:toProfile:forModelType:]";
          __int16 v46 = 2112;
          v47 = v26;
          _os_log_error_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
        }
        v28 = (void *)MEMORY[0x263F087E8];
        v40 = @"reason";
        v41 = v26;
        v29 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        v10 = [v28 errorWithDomain:@"com.apple.speakerrecognition" code:721 userInfo:v29];

LABEL_18:
        v8 = v31;
        id v9 = obj;

        goto LABEL_19;
      }

      v12 = v33;
    }
    id v9 = obj;
    v10 = (void *)[obj countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v10) {
      continue;
    }
    break;
  }
  id v20 = obj;
  v8 = v31;
LABEL_19:

  return v10;
}

- (id)_retrainVoiceProfile:(id)a3 withContext:(id)a4 withUtterances:(id)a5
{
  v70[1] = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__7928;
  v57 = __Block_byref_object_dispose__7929;
  id v58 = 0;
  v40 = v7;
  uint64_t v41 = [v7 spIdType];
  id v9 = [v42 appDomain];
  if ([v9 isEqualToString:@"com.apple.siri"])
  {
    if (!v8)
    {

LABEL_29:
      long long v39 = [NSString stringWithFormat:@"Too less (%d) audio files in %@ ", objc_msgSend(v8, "count"), v8];
      id v35 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]";
        __int16 v60 = 2112;
        v61 = v39;
        _os_log_error_impl(&dword_21C8A5000, v35, OS_LOG_TYPE_ERROR, "%s ERR: %@", location, 0x16u);
      }
      long long v36 = [MEMORY[0x263F38028] sharedInstance];
      [v36 submitVoiceIdIssueReport:*MEMORY[0x263F38130]];

      long long v37 = (void *)MEMORY[0x263F087E8];
      v69 = @"reason";
      v70[0] = v39;
      v28 = [NSDictionary dictionaryWithObjects:v70 forKeys:&v69 count:1];
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", @"com.apple.speakerrecognition", 728);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    BOOL v10 = (unint64_t)[v8 count] < 3;

    if (v10) {
      goto LABEL_29;
    }
  }
  else
  {
  }
  long long v39 = objc_alloc_init(SSRVoiceProfileRetrainerFactory);
  uint64_t v11 = [(SSRVoiceProfileRetrainerFactory *)v39 voiceRetrainersWithContext:v40];
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    uint64_t v14 = [v11 count];
    v12 = v13;
    if (v14)
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v66 count:16];
      if (!v16) {
        goto LABEL_24;
      }
      uint64_t v17 = *(void *)v50;
      while (1)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if ([v19 needsRetrainingWithAudioFiles:v8])
          {
            if ([v19 resetModelForRetraining])
            {
              objc_initWeak((id *)location, v19);
              v43[0] = MEMORY[0x263EF8330];
              v43[1] = 3221225472;
              v43[2] = __72__SSRVoiceProfileStore__retrainVoiceProfile_withContext_withUtterances___block_invoke;
              v43[3] = &unk_26442A568;
              v47 = &v53;
              objc_copyWeak(&v48, (id *)location);
              id v44 = v42;
              v45 = v19;
              id v46 = v40;
              [v19 addUtterances:v8 withPolicy:0 withCompletion:v43];

              objc_destroyWeak(&v48);
              objc_destroyWeak((id *)location);
              continue;
            }
            id v20 = (id)*MEMORY[0x263F38100];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v24 = [v42 profileID];
              id v25 = +[SSRUtils stringForCSSpIdType:v41];
              v26 = +[SSRUtils stringForVoiceProfileRetrainerType:](SSRUtils, "stringForVoiceProfileRetrainerType:", [v19 retrainerType]);
              *(_DWORD *)location = 136315906;
              *(void *)&location[4] = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]";
              __int16 v60 = 2114;
              v61 = v24;
              __int16 v62 = 2114;
              id v63 = v25;
              __int16 v64 = 2114;
              v65 = v26;
              _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, "%s ERR: Failed resetting for %{public}@ - for {%{public}@, %{public}@}", location, 0x2Au);
            }
          }
          else
          {
            id v20 = (id)*MEMORY[0x263F38100];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = [v42 profileID];
              id v22 = +[SSRUtils stringForCSSpIdType:v41];
              v23 = +[SSRUtils stringForVoiceProfileRetrainerType:](SSRUtils, "stringForVoiceProfileRetrainerType:", [v19 retrainerType]);
              *(_DWORD *)location = 136315906;
              *(void *)&location[4] = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]";
              __int16 v60 = 2114;
              v61 = v21;
              __int16 v62 = 2114;
              id v63 = v22;
              __int16 v64 = 2114;
              v65 = v23;
              _os_log_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Skipping retraining for %{public}@ - for {%{public}@, %{public}@}", location, 0x2Au);
            }
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v66 count:16];
        if (!v16)
        {
LABEL_24:

          id v27 = (id)v54[5];
          v28 = v15;
          goto LABEL_32;
        }
      }
    }
  }
  v28 = v12;
  v29 = NSString;
  v30 = [v42 profileID];
  v31 = [v29 stringWithFormat:@"Failed to init retrainers for profileID %@ with ctxt %@", v30, v40];

  v32 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 136315394;
    *(void *)&location[4] = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]";
    __int16 v60 = 2112;
    v61 = v31;
    _os_log_error_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_ERROR, "%s ERR: %@", location, 0x16u);
  }
  v33 = (void *)MEMORY[0x263F087E8];
  v67 = @"reason";
  v68 = v31;
  id v34 = [NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  id v27 = [v33 errorWithDomain:@"com.apple.speakerrecognition" code:756 userInfo:v34];

LABEL_32:
  _Block_object_dispose(&v53, 8);

  return v27;
}

void __72__SSRVoiceProfileStore__retrainVoiceProfile_withContext_withUtterances___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v12 = WeakRetained;
  uint64_t v56 = a1;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v52 = v8;
    uint64_t v53 = v10;
    uint64_t v55 = WeakRetained;
    v21 = [WeakRetained modelFilePath];
    v57 = [v21 URLByDeletingLastPathComponent];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v51 = v9;
    id obj = v9;
    uint64_t v22 = [obj countByEnumeratingWithState:&v63 objects:v82 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v64;
      id v25 = (os_log_t *)MEMORY[0x263F38100];
      uint64_t v54 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v64 != v24) {
            objc_enumerationMutation(obj);
          }
          os_log_t v27 = *v25;
          if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
          {
            v28 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            v29 = v27;
            v30 = [v28 lastPathComponent];
            v31 = [*(id *)(v56 + 32) profileID];
            v32 = +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", [*(id *)(v56 + 48) spIdType]);
            v33 = [v55 modelFilePath];
            id v34 = [v33 lastPathComponent];
            id v35 = [v57 lastPathComponent];
            long long v36 = [obj objectForKeyedSubscript:v28];
            *(_DWORD *)buf = 136316674;
            v69 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]_block_invoke";
            __int16 v70 = 2114;
            v71 = v30;
            __int16 v72 = 2114;
            v73 = v31;
            __int16 v74 = 2114;
            v75 = v32;
            __int16 v76 = 2114;
            v77 = v34;
            __int16 v78 = 2114;
            v79 = v35;
            __int16 v80 = 2114;
            v81 = v36;
            _os_log_impl(&dword_21C8A5000, v29, OS_LOG_TYPE_DEFAULT, "%s Added utterance %{public}@ to {%{public}@, %{public}@, %{public}@, %{public}@} with score %{public}@", buf, 0x48u);

            uint64_t v24 = v54;
            id v25 = (os_log_t *)MEMORY[0x263F38100];
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v63 objects:v82 count:16];
      }
      while (v23);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v37 = v53;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v60;
      uint64_t v41 = (os_log_t *)MEMORY[0x263F38100];
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v60 != v40) {
            objc_enumerationMutation(v37);
          }
          os_log_t v43 = *v41;
          if (os_log_type_enabled(*v41, OS_LOG_TYPE_ERROR))
          {
            id v44 = *(void **)(*((void *)&v59 + 1) + 8 * v42);
            v45 = v43;
            id v46 = [v37 objectForKeyedSubscript:v44];
            *(_DWORD *)buf = 136315650;
            v69 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]_block_invoke";
            __int16 v70 = 2114;
            v71 = v44;
            __int16 v72 = 2114;
            v73 = v46;
            _os_log_error_impl(&dword_21C8A5000, v45, OS_LOG_TYPE_ERROR, "%s Rejected utterance %{public}@ with error %{public}@", buf, 0x20u);
          }
          ++v42;
        }
        while (v39 != v42);
        uint64_t v39 = [v37 countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v39);
    }

    id v9 = v51;
    id v8 = v52;
    id v10 = v53;
    v12 = v55;
    goto LABEL_26;
  }
  v13 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v14 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    v47 = *(void **)(v56 + 32);
    id v48 = v14;
    long long v49 = [v47 profileID];
    long long v50 = *(void **)(*(void *)(*(void *)(v56 + 56) + 8) + 40);
    *(_DWORD *)buf = 136315650;
    v69 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]_block_invoke";
    __int16 v70 = 2114;
    v71 = v49;
    __int16 v72 = 2114;
    v73 = v50;
    _os_log_error_impl(&dword_21C8A5000, v48, OS_LOG_TYPE_ERROR, "%s ERR: Failed in retraining %{public}@ with error %{public}@", buf, 0x20u);
  }
  id v15 = [*(id *)(v56 + 40) modelFilePath];
  uint64_t v16 = [v15 path];
  uint64_t v17 = +[SSRUtils removeItemAtPath:v16];

  v57 = (void *)v17;
  if (v17)
  {
    os_log_t v18 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      id v20 = [v12 modelFilePath];
      *(_DWORD *)buf = 136315394;
      v69 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]_block_invoke";
      __int16 v70 = 2114;
      v71 = v20;
      _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete the model at %{public}@", buf, 0x16u);
    }
LABEL_26:
  }
}

- (id)_retrainVoiceProfile:(id)a3 withContext:(id)a4
{
  v109[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 appDomain];
  int v9 = [v8 isEqualToString:@"com.apple.siri"];

  id v10 = (os_log_t *)MEMORY[0x263F38100];
  if (!v6)
  {
    id v12 = [NSString stringWithFormat:@"VoiceProfile is nil - Bailing out"];
    os_log_t v18 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
      __int16 v98 = 2112;
      uint64_t v99 = (uint64_t)v12;
      _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
    }
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    v108 = @"reason";
    v109[0] = v12;
    id v15 = NSDictionary;
    uint64_t v16 = (id *)v109;
    uint64_t v17 = &v108;
    goto LABEL_13;
  }
  if (!v7)
  {
    id v12 = [NSString stringWithFormat:@"context is nil - Bailing out"];
    v19 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
      __int16 v98 = 2112;
      uint64_t v99 = (uint64_t)v12;
      _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
    }
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    v106 = @"reason";
    id v107 = v12;
    id v15 = NSDictionary;
    uint64_t v16 = &v107;
    uint64_t v17 = &v106;
    goto LABEL_13;
  }
  uint64_t v11 = [v7 spIdType];
  if ((unint64_t)(v11 - 6) <= 0xFFFFFFFFFFFFFFFALL)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid spIdType %d - Bailing out", v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
      __int16 v98 = 2112;
      uint64_t v99 = (uint64_t)v12;
      _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
    }
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    v104 = @"reason";
    id v105 = v12;
    id v15 = NSDictionary;
    uint64_t v16 = &v105;
    uint64_t v17 = &v104;
LABEL_13:
    id v20 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    v21 = [v14 errorWithDomain:@"com.apple.speakerrecognition" code:730 userInfo:v20];
    goto LABEL_14;
  }
  int v84 = v9;
  v88 = self;
  unint64_t v23 = +[SSRUtils explicitSpIdTypeForSpId:v11];
  id v20 = [v6 getEnrollmentUtterancesForModelType:v11];
  unint64_t v81 = v23;
  uint64_t v24 = [v6 getEnrollmentUtterancesForModelType:v23];
  uint64_t v25 = [v20 mutableCopy];
  v26 = NSString;
  os_log_t v27 = [v6 profileID];
  v28 = [v26 stringWithFormat:@"SSRVoiceProfileStore retrainer - %@", v27];

  id v29 = v28;
  [v29 UTF8String];
  uint64_t v30 = os_transaction_create();
  v31 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
    __int16 v98 = 2048;
    uint64_t v99 = v30;
    __int16 v100 = 2114;
    id v101 = v29;
    _os_log_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_DEFAULT, "%s Creating OS Transaction %p for %{public}@", buf, 0x20u);
  }
  v32 = (void *)MEMORY[0x21D4B2500]();
  v86 = (void *)v30;
  id v87 = v29;
  if ([v7 filterToVoiceTriggerUtterances])
  {
    v89 = (void *)v25;
    v33 = +[SSRAssetManager sharedManager];
    id v34 = [v6 locale];
    id v35 = [v33 installedAssetOfType:0 forLanguage:v34];

    if (!v35)
    {
      os_log_t v43 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        __int16 v76 = v43;
        v77 = [v6 locale];
        *(_DWORD *)buf = 136315394;
        v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
        __int16 v98 = 2114;
        uint64_t v99 = (uint64_t)v77;
        _os_log_error_impl(&dword_21C8A5000, v76, OS_LOG_TYPE_ERROR, "%s ERR: ignoring filtering option as VTAssets not found on %{public}@", buf, 0x16u);
      }
      uint64_t v25 = (uint64_t)v89;
      goto LABEL_32;
    }
    long long v36 = [MEMORY[0x263EFFA08] setWithArray:v20];
    id v37 = (void *)[v36 mutableCopy];

    if ([v37 count] && objc_msgSend(v24, "count"))
    {
      uint64_t v38 = [MEMORY[0x263EFFA08] setWithArray:v24];
      [v37 minusSet:v38];

      if ([v37 count])
      {
        uint64_t v39 = [v37 allObjects];
        uint64_t v40 = [v6 locale];
        contexta = +[SSRTriggerPhraseDetector filterVTAudioFiles:v39 withLocale:v40 withAsset:v35];

        uint64_t v41 = (void *)[v24 mutableCopy];
        [v41 addObjectsFromArray:contexta];

        uint64_t v25 = (uint64_t)v41;
LABEL_28:

LABEL_32:
        goto LABEL_33;
      }
      v73 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
        _os_log_impl(&dword_21C8A5000, v73, OS_LOG_TYPE_DEFAULT, "%s No Implicit audio - ignoring filterToVoiceTriggerUtterances", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v42 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
        __int16 v98 = 2114;
        uint64_t v99 = (uint64_t)v37;
        __int16 v100 = 2114;
        id v101 = v24;
        _os_log_error_impl(&dword_21C8A5000, v42, OS_LOG_TYPE_ERROR, "%s ERR: ignoring filtering option as %{public}@ or %{public}@ is nil", buf, 0x20u);
      }
    }
    uint64_t v25 = (uint64_t)v89;
    goto LABEL_28;
  }
LABEL_33:
  context = (void *)MEMORY[0x21D4B2500]();
  id v44 = [MEMORY[0x263EFF910] date];
  v90 = (void *)v25;
  v45 = [(SSRVoiceProfileStore *)v88 _retrainVoiceProfile:v6 withContext:v7 withUtterances:v25];
  id v46 = [MEMORY[0x263EFF910] date];
  [v46 timeIntervalSinceDate:v44];
  double v48 = v47;
  long long v49 = [v7 logAggregator];
  [v49 setRetrainingWaitTime:v48];

  if (v45)
  {
    uint64_t v50 = [v45 code];
    [v7 logAggregator];
    v52 = id v51 = v24;
    [v52 setVoiceProfileRetrainingFailureReasonCode:v50];

    uint64_t v24 = v51;
    uint64_t v53 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      __int16 v74 = v53;
      uint64_t v24 = v51;
      v75 = +[SSRUtils stringForCSSpIdType:v11];
      *(_DWORD *)buf = 136315906;
      v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
      __int16 v98 = 2114;
      uint64_t v99 = (uint64_t)v75;
      __int16 v100 = 2114;
      id v101 = v6;
      __int16 v102 = 2114;
      v103 = v45;
      _os_log_error_impl(&dword_21C8A5000, v74, OS_LOG_TYPE_ERROR, "%s ERR: Failed training %{public}@ of %{public}@ with error %{public}@", buf, 0x2Au);
    }
  }
  uint64_t v54 = [v7 logAggregator];
  [v54 pushAnalytics];

  uint64_t v55 = (void *)MEMORY[0x21D4B2500]();
  if (!v84)
  {
    v68 = v90;
LABEL_48:

    __int16 v72 = *MEMORY[0x263F38100];
    v69 = v87;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
      __int16 v98 = 2114;
      uint64_t v99 = (uint64_t)v87;
      _os_log_impl(&dword_21C8A5000, v72, OS_LOG_TYPE_DEFAULT, "%s Releasing OS Transaction %{public}@", buf, 0x16u);
    }
    id v12 = v45;
    v21 = v12;
    goto LABEL_51;
  }
  v85 = v24;
  v95[0] = v6;
  v94[0] = @"SSRVoiceRetrainingVoiceProfile";
  v94[1] = @"SSRVoiceRetrainingSpIdType";
  uint64_t v56 = [NSNumber numberWithUnsignedInteger:v81];
  v95[1] = v56;
  v94[2] = @"SSRVoiceRetrainingAsset";
  v57 = [v7 asset];
  v95[2] = v57;
  id v58 = [NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:3];

  id v91 = v45;
  long long v59 = [[SSRVoiceProfileRetrainingContext alloc] initWithVoiceRetrainingContext:v58 error:&v91];
  id v12 = v91;

  if (!v12)
  {
    __int16 v70 = [(SSRVoiceProfileStore *)v88 _retrainVoiceProfile:v6 withContext:v59 withUtterances:v85];
    v68 = v90;
    if (v70)
    {
      v71 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        __int16 v78 = v71;
        v79 = +[SSRUtils stringForCSSpIdType:v81];
        __int16 v80 = [v6 siriProfileId];
        *(_DWORD *)buf = 136315906;
        v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
        __int16 v98 = 2114;
        uint64_t v99 = (uint64_t)v79;
        __int16 v100 = 2114;
        id v101 = v70;
        __int16 v102 = 2114;
        v103 = v80;
        _os_log_error_impl(&dword_21C8A5000, v78, OS_LOG_TYPE_ERROR, "%s Failed to create %{public}@ model with error %{public}@ for profile %{public}@", buf, 0x2Au);

        v68 = v90;
      }
    }

    v45 = 0;
    uint64_t v24 = v85;
    goto LABEL_48;
  }
  long long v60 = NSString;
  long long v61 = [v6 profileID];
  long long v62 = [v60 stringWithFormat:@"Failed to init retrainCtxt for profileID %@ with error %@", v61, v12];

  long long v63 = (os_log_t *)MEMORY[0x263F38100];
  long long v64 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
    __int16 v98 = 2112;
    uint64_t v99 = (uint64_t)v62;
    _os_log_error_impl(&dword_21C8A5000, v64, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
  }

  long long v65 = *v63;
  if (os_log_type_enabled(*v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
    __int16 v98 = 2114;
    uint64_t v99 = (uint64_t)v87;
    _os_log_impl(&dword_21C8A5000, v65, OS_LOG_TYPE_DEFAULT, "%s Releasing OS Transaction %{public}@", buf, 0x16u);
  }
  long long v66 = (void *)MEMORY[0x263F087E8];
  v92 = @"reason";
  v93 = v62;
  v67 = [NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
  v21 = [v66 errorWithDomain:@"com.apple.speakerrecognition" code:756 userInfo:v67];

  uint64_t v24 = v85;
  v68 = v90;
  v69 = v87;
LABEL_51:

LABEL_14:

  return v21;
}

- (void)_retrainLiveOnOnboardedProfilesForLanguage:(id)a3 withForceRetrain:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v46 = a4;
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  double v48 = self;
  int v9 = [(SSRVoiceProfileStore *)self userVoiceProfilesForAppDomain:@"com.apple.siridebug" forLocale:v7];
  id v10 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v57 = "-[SSRVoiceProfileStore _retrainLiveOnOnboardedProfilesForLanguage:withForceRetrain:withCompletion:]";
    __int16 v58 = 2114;
    id v59 = v7;
    __int16 v60 = 1024;
    LODWORD(v61) = v46;
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Retraining for locale %{public}@ with force %d", buf, 0x1Cu);
  }
  uint64_t v42 = v7;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v9;
  id v44 = (void (**)(void, void))v8;
  uint64_t v47 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
  id v11 = 0;
  if (v47)
  {
    uint64_t v50 = 0;
    uint64_t v45 = *(void *)v53;
    do
    {
      uint64_t v12 = 0;
      v13 = v11;
      do
      {
        if (*(void *)v53 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v52 + 1) + 8 * v12);
        id v15 = [MEMORY[0x263EFF910] date];
        v66[0] = @"SSRVoiceRetrainingVoiceProfile";
        v66[1] = @"SSRVoiceRetrainingFilterToVoiceTriggerUtterances";
        v67[0] = v14;
        v67[1] = MEMORY[0x263EFFA88];
        v66[2] = @"SSRVoiceRetrainingForce";
        uint64_t v16 = [NSNumber numberWithBool:v46];
        v67[2] = v16;
        uint64_t v17 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];

        os_log_t v18 = [SSRVoiceProfileRetrainingContext alloc];
        id v51 = v13;
        v19 = [(SSRVoiceProfileRetrainingContext *)v18 initWithVoiceRetrainingContext:v17 error:&v51];
        id v11 = v51;

        if (v11)
        {
          id v20 = NSString;
          v21 = [v14 profileID];
          long long v49 = [v20 stringWithFormat:@"Failed to init retrainCtxt for profileID %@ with error %@", v21, v11];

          uint64_t v22 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v57 = "-[SSRVoiceProfileStore _retrainLiveOnOnboardedProfilesForLanguage:withForceRetrain:withCompletion:]";
            __int16 v58 = 2112;
            id v59 = v49;
            _os_log_error_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
          }
          if (v44)
          {
            unint64_t v23 = (void *)MEMORY[0x263F087E8];
            long long v64 = @"reason";
            long long v65 = v49;
            uint64_t v24 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
            uint64_t v25 = [v23 errorWithDomain:@"com.apple.speakerrecognition" code:756 userInfo:v24];
            ((void (**)(void, void *))v44)[2](v44, v25);
          }
          v26 = [(SSRVoiceProfileStore *)v48 _retrainVoiceProfile:v14 withContext:v19];

          os_log_t v27 = [MEMORY[0x263EFF910] date];
          [v27 timeIntervalSinceDate:v15];
          double v29 = v28 * 1000.0;
          uint64_t v30 = (void *)*MEMORY[0x263F38100];
          v31 = *MEMORY[0x263F38100];
          if (v26)
          {
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v32 = v30;
              v33 = [v14 profileID];
              *(_DWORD *)buf = 136315906;
              v57 = "-[SSRVoiceProfileStore _retrainLiveOnOnboardedProfilesForLanguage:withForceRetrain:withCompletion:]";
              __int16 v58 = 2114;
              id v59 = v33;
              __int16 v60 = 2114;
              double v61 = *(double *)&v26;
              __int16 v62 = 2050;
              double v63 = v29;
              _os_log_error_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_ERROR, "%s ERR: Retraining failed for %{public}@ with error %{public}@ in %{public}fms", buf, 0x2Au);
            }
          }
          else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            id v34 = v30;
            id v35 = [v14 profileID];
            *(_DWORD *)buf = 136315650;
            v57 = "-[SSRVoiceProfileStore _retrainLiveOnOnboardedProfilesForLanguage:withForceRetrain:withCompletion:]";
            __int16 v58 = 2114;
            id v59 = v35;
            __int16 v60 = 2050;
            double v61 = v29;
            _os_log_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_DEFAULT, "%s Retraining successfully finished for %{public}@ in %{public}fms", buf, 0x20u);
          }
        }
        else
        {
          v26 = v50;
        }
        uint64_t v50 = [(SSRVoiceProfileStore *)v48 _retrainVoiceProfile:v14 withContext:v19];

        long long v36 = [MEMORY[0x263EFF910] date];
        [v36 timeIntervalSinceDate:v15];
        double v38 = v37;
        uint64_t v39 = (void *)*MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = v39;
          uint64_t v41 = [v14 profileID];
          *(_DWORD *)buf = 136315906;
          v57 = "-[SSRVoiceProfileStore _retrainLiveOnOnboardedProfilesForLanguage:withForceRetrain:withCompletion:]";
          __int16 v58 = 2112;
          id v59 = v41;
          __int16 v60 = 2112;
          double v61 = *(double *)&v50;
          __int16 v62 = 2048;
          double v63 = v38 * 1000.0;
          _os_log_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_DEFAULT, "%s Retraining finished for %@ with error %@ in %fms", buf, 0x2Au);
        }
        ++v12;
        v13 = v11;
      }
      while (v47 != v12);
      uint64_t v47 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
    }
    while (v47);
  }
  else
  {
    uint64_t v50 = 0;
  }

  if (v44) {
    ((void (**)(void, void *))v44)[2](v44, v50);
  }
}

- (id)updateVoiceProfile:(id)a3 withUserName:(id)a4 withBasePathExclave:(id)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 profileID];
  uint64_t v12 = [(SSRVoiceProfileStore *)self userVoiceProfileForVoiceProfileID:v11];

  if (v12)
  {
    if (v10)
    {
      [v12 setUserName:v9];
      [v12 updateVoiceProfilePathExclave:v10];
      v13 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        id v15 = [v8 profileID];
        *(_DWORD *)buf = 136315650;
        uint64_t v25 = "-[SSRVoiceProfileStore updateVoiceProfile:withUserName:withBasePathExclave:]";
        __int16 v26 = 2114;
        os_log_t v27 = v15;
        __int16 v28 = 2114;
        id v29 = v10;
        _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Updating profile %{public}@ with basePath %{public}@", buf, 0x20u);
      }
      [(SSRVoiceProfileStore *)self _updateTrainedUsersWithAction:2 UserVoiceProfile:v12];
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:758 userInfo:&unk_26CD45558];
    }
  }
  else
  {
    uint64_t v17 = NSString;
    os_log_t v18 = [v8 profileID];
    v19 = [v17 stringWithFormat:@"Voice Profile not found for profileId: %@ - Bailing out", v18];

    id v20 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[SSRVoiceProfileStore updateVoiceProfile:withUserName:withBasePathExclave:]";
      __int16 v26 = 2114;
      os_log_t v27 = v19;
      _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = @"reason";
    v31[0] = v19;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v16 = [v21 errorWithDomain:@"com.apple.speakerrecognition" code:731 userInfo:v22];
  }

  return v16;
}

- (id)updateVoiceProfile:(id)a3 withUserName:(id)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 profileID];
  id v9 = [(SSRVoiceProfileStore *)self userVoiceProfileForVoiceProfileID:v8];

  if (v9)
  {
    [v9 setUserName:v7];
    id v10 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      uint64_t v12 = [v6 profileID];
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = "-[SSRVoiceProfileStore updateVoiceProfile:withUserName:]";
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Updating profile %{public}@ with userName %{public}@", buf, 0x20u);
    }
    [(SSRVoiceProfileStore *)self _updateTrainedUsersWithAction:2 UserVoiceProfile:v9];
    v13 = 0;
  }
  else
  {
    uint64_t v14 = NSString;
    id v15 = [v6 profileID];
    uint64_t v16 = [v14 stringWithFormat:@"Voice Profile not found for profileId: %@ - Bailing out", v15];

    uint64_t v17 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[SSRVoiceProfileStore updateVoiceProfile:withUserName:]";
      __int16 v23 = 2114;
      uint64_t v24 = v16;
      _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    os_log_t v18 = (void *)MEMORY[0x263F087E8];
    os_log_t v27 = @"reason";
    v28[0] = v16;
    v19 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v13 = [v18 errorWithDomain:@"com.apple.speakerrecognition" code:731 userInfo:v19];
  }

  return v13;
}

- (void)_saveTrainedUsers:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "dictionaryRepresentation", (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(SSRVoiceProfileStorePrefs *)self->_storePrefs setVoiceProfileStoreVersion:1];
  [(SSRVoiceProfileStorePrefs *)self->_storePrefs saveKnownUserVoiceProfiles:v5];
}

- (void)_updateTrainedUsersWithAction:(unint64_t)a3 UserVoiceProfile:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(SSRVoiceProfileStore *)self _enrolledVoiceProfiles];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__SSRVoiceProfileStore__updateTrainedUsersWithAction_UserVoiceProfile___block_invoke;
  v17[3] = &unk_26442A538;
  id v8 = v6;
  id v18 = v8;
  v19 = &v25;
  id v20 = &v21;
  [v7 enumerateObjectsUsingBlock:v17];
  if (a3 - 1 < 2)
  {
    if (*((unsigned char *)v26 + 24))
    {
      uint64_t v9 = [v7 objectAtIndex:v22[3]];
      uint64_t v10 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v30 = "-[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:]";
        __int16 v31 = 2112;
        unint64_t v32 = (unint64_t)v8;
        __int16 v33 = 2112;
        id v34 = v9;
        _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Updating User Voice Profile to %@ from %@", buf, 0x20u);
      }
      [v7 removeObjectAtIndex:v22[3]];
      [v7 addObject:v8];
    }
    else
    {
      uint64_t v16 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v30 = "-[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:]";
        __int16 v31 = 2112;
        unint64_t v32 = (unint64_t)v8;
        _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Adding User Voice Profile %@", buf, 0x16u);
      }
      [v7 addObject:v8];
    }
LABEL_16:
    [(SSRVoiceProfileStore *)self _saveTrainedUsers:v7];
    goto LABEL_17;
  }
  if (!a3)
  {
    id v11 = *MEMORY[0x263F38100];
    long long v12 = *MEMORY[0x263F38100];
    if (*((unsigned char *)v26 + 24))
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v30 = "-[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:]";
        __int16 v31 = 2112;
        unint64_t v32 = (unint64_t)v8;
        _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Deleting User Voice Profile %@", buf, 0x16u);
      }
      [v7 removeObjectAtIndex:v22[3]];
      goto LABEL_16;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v30 = "-[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:]";
    __int16 v31 = 2112;
    unint64_t v32 = (unint64_t)v8;
    long long v14 = "%s User Voice Profile not found %@ - Bailing out";
    long long v15 = v11;
LABEL_20:
    _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
    goto LABEL_17;
  }
  long long v13 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v30 = "-[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:]";
    __int16 v31 = 2048;
    unint64_t v32 = a3;
    long long v14 = "%s ERR: UserVoiceProfile Action undefined %ld - Bailing out";
    long long v15 = v13;
    goto LABEL_20;
  }
LABEL_17:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

void __71__SSRVoiceProfileStore__updateTrainedUsersWithAction_UserVoiceProfile___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 profileID];
  id v8 = [*(id *)(a1 + 32) profileID];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
}

- (id)_enrolledVoiceProfiles
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  id v4 = [(SSRVoiceProfileStorePrefs *)self->_storePrefs loadKnownUserVoiceProfiles];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    id v8 = (os_log_t *)MEMORY[0x263F38100];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [[SSRVoiceProfile alloc] initWithDictionary:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (v10)
        {
          [v3 addObject:v10];
        }
        else
        {
          id v11 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            id v18 = "-[SSRVoiceProfileStore _enrolledVoiceProfiles]";
            _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s voiceProfile is nil!", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)retrainVoiceProfile:(id)a3 withContext:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__SSRVoiceProfileStore_retrainVoiceProfile_withContext_withCompletion___block_invoke;
  v15[3] = &unk_26442A488;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __71__SSRVoiceProfileStore_retrainVoiceProfile_withContext_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = (os_log_t *)MEMORY[0x263F38100];
  v3 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = v3;
    uint64_t v6 = [v4 profileID];
    uint64_t v7 = [*(id *)(a1 + 32) locale];
    int v32 = 136315650;
    __int16 v33 = "-[SSRVoiceProfileStore retrainVoiceProfile:withContext:withCompletion:]_block_invoke";
    __int16 v34 = 2114;
    uint64_t v35 = v6;
    __int16 v36 = 2114;
    double v37 = *(double *)&v7;
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Retraining %{public}@ for locale %{public}@", (uint8_t *)&v32, 0x20u);
  }
  if (CSIsCommunalDevice())
  {
    id v8 = [*(id *)(a1 + 32) appDomain];
    if ([v8 isEqualToString:@"com.apple.siri"])
    {
      char v9 = [*(id *)(a1 + 32) profileLocallyAvailable];

      if ((v9 & 1) == 0)
      {
        os_log_t v10 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = *(void **)(a1 + 32);
          id v12 = v10;
          id v13 = [v11 profileID];
          int v32 = 136315394;
          __int16 v33 = "-[SSRVoiceProfileStore retrainVoiceProfile:withContext:withCompletion:]_block_invoke";
          __int16 v34 = 2114;
          uint64_t v35 = v13;
          _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Needs retraining %{public}@ - Triggering voice profiles download", (uint8_t *)&v32, 0x16u);
        }
        id v14 = [MEMORY[0x263F087C8] defaultCenter];
        [v14 postNotificationName:@"com.apple.voicetrigger.PHSProfileDownloadTrigger" object:0];

        uint64_t v15 = *(void *)(a1 + 56);
        if (v15) {
          (*(void (**)(uint64_t, void))(v15 + 16))(v15, 0);
        }
        return;
      }
    }
    else
    {
    }
  }
  id v16 = [MEMORY[0x263EFF910] date];
  uint64_t v17 = [*(id *)(a1 + 40) _retrainVoiceProfile:*(void *)(a1 + 32) withContext:*(void *)(a1 + 48)];
  id v18 = [MEMORY[0x263EFF910] date];
  [v18 timeIntervalSinceDate:v16];
  double v20 = v19 * 1000.0;
  uint64_t v21 = *v2;
  if (v17)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void **)(a1 + 32);
      uint64_t v23 = v21;
      uint64_t v24 = [v22 profileID];
      int v32 = 136315906;
      __int16 v33 = "-[SSRVoiceProfileStore retrainVoiceProfile:withContext:withCompletion:]_block_invoke";
      __int16 v34 = 2114;
      uint64_t v35 = v24;
      __int16 v36 = 2114;
      double v37 = *(double *)&v17;
      __int16 v38 = 2050;
      double v39 = v20;
      _os_log_error_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_ERROR, "%s ERR: Retraining failed for %{public}@ with error %{public}@ in %{public}fms", (uint8_t *)&v32, 0x2Au);
LABEL_16:
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = *(void **)(a1 + 32);
    uint64_t v23 = v21;
    uint64_t v24 = [v25 profileID];
    int v32 = 136315650;
    __int16 v33 = "-[SSRVoiceProfileStore retrainVoiceProfile:withContext:withCompletion:]_block_invoke";
    __int16 v34 = 2114;
    uint64_t v35 = v24;
    __int16 v36 = 2050;
    double v37 = v20;
    _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Retraining successfully finished for %{public}@ in %{public}fms", (uint8_t *)&v32, 0x20u);
    goto LABEL_16;
  }
  if ([MEMORY[0x263F380D0] isExclaveHardware])
  {
    uint64_t v27 = *(void **)(a1 + 32);
    id v26 = *(void **)(a1 + 40);
    char v28 = [v27 userName];
    id v29 = [*(id *)(a1 + 32) voiceProfilePathExclave];
    id v30 = (id)[v26 updateVoiceProfile:v27 withUserName:v28 withBasePathExclave:v29];
  }
  uint64_t v31 = *(void *)(a1 + 56);
  if (v31) {
    (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v17);
  }
}

- (BOOL)_checkIfRetrainingRequiredForProfile:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__SSRVoiceProfileStore__checkIfRetrainingRequiredForProfile___block_invoke;
  v8[3] = &unk_26442A510;
  id v9 = v3;
  id v4 = v3;
  uint64_t v5 = (uint64_t (**)(void, void))MEMORY[0x21D4B2740](v8);
  if (v5[2](v5, 3)) {
    char v6 = 1;
  }
  else {
    char v6 = v5[2](v5, 4);
  }

  return v6;
}

uint64_t __61__SSRVoiceProfileStore__checkIfRetrainingRequiredForProfile___block_invoke(uint64_t a1, uint64_t a2)
{
  v46[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x21D4B2500]();
  uint64_t v5 = *(void *)(a1 + 32);
  v45[0] = @"SSRVoiceRetrainingVoiceProfile";
  v45[1] = @"SSRVoiceRetrainingSpIdType";
  v46[0] = v5;
  char v6 = [NSNumber numberWithUnsignedInteger:a2];
  v46[1] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];

  id v37 = 0;
  id v8 = [[SSRVoiceProfileRetrainingContext alloc] initWithVoiceRetrainingContext:v7 error:&v37];
  id v9 = v37;
  if (v9)
  {
    os_log_t v10 = NSString;
    id v11 = [*(id *)(a1 + 32) profileID];
    id v12 = [v10 stringWithFormat:@"Failed to init retrainCtxt for profileID %@ with error %@", v11, v9];

    id v13 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v39 = "-[SSRVoiceProfileStore _checkIfRetrainingRequiredForProfile:]_block_invoke";
      __int16 v40 = 2112;
      uint64_t v41 = v12;
      _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
    }
    unsigned int v14 = 0;
    int v15 = 1;
  }
  else
  {
    id v12 = objc_alloc_init(SSRVoiceProfileRetrainerFactory);
    id v16 = [(SSRVoiceProfileRetrainerFactory *)v12 voiceRetrainersWithContext:v8];
    uint64_t v17 = v16;
    if (v16 && [v16 count])
    {
      int v32 = v4;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v18 = v17;
      uint64_t v19 = [(SSRVoiceProfileRetrainerFactory *)v18 countByEnumeratingWithState:&v33 objects:v44 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v31 = v17;
        uint64_t v21 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v18);
            }
            if ([*(id *)(*((void *)&v33 + 1) + 8 * i) needsRetrainingWithAudioFiles:0])
            {
              id v26 = (void *)*MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v27 = v26;
                char v28 = +[SSRUtils stringForCSSpIdType:a2];
                id v29 = [*(id *)(a1 + 32) profileID];
                *(_DWORD *)buf = 136315650;
                double v39 = "-[SSRVoiceProfileStore _checkIfRetrainingRequiredForProfile:]_block_invoke";
                __int16 v40 = 2114;
                uint64_t v41 = v28;
                __int16 v42 = 2114;
                os_log_t v43 = v29;
                _os_log_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_DEFAULT, "%s Needs Retraining %{public}@ model update for profile %{public}@ ", buf, 0x20u);
              }
              int v15 = 1;
              unsigned int v14 = 1;
              goto LABEL_22;
            }
          }
          uint64_t v20 = [(SSRVoiceProfileRetrainerFactory *)v18 countByEnumeratingWithState:&v33 objects:v44 count:16];
          unsigned int v14 = 1;
          if (v20) {
            continue;
          }
          break;
        }
        int v15 = 0;
LABEL_22:
        uint64_t v17 = v31;
        id v4 = v32;
      }
      else
      {
        int v15 = 0;
        unsigned int v14 = 1;
      }
    }
    else
    {
      uint64_t v23 = NSString;
      uint64_t v24 = [*(id *)(a1 + 32) profileID];
      id v18 = [v23 stringWithFormat:@"Failed to init retrainers for profileID %@ with ctxt %@", v24, v8];

      uint64_t v25 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        double v39 = "-[SSRVoiceProfileStore _checkIfRetrainingRequiredForProfile:]_block_invoke";
        __int16 v40 = 2112;
        uint64_t v41 = v18;
        _os_log_error_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
      }
      unsigned int v14 = 0;
      int v15 = 1;
    }
  }
  if (v15) {
    return v14;
  }
  else {
    return 0;
  }
}

- (BOOL)checkIfVoiceProfile:(id)a3 needsUpdatedWith:(id)a4 withCategory:(unint64_t)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 voiceProfileIdentity];
  os_log_t v10 = [v8 stringByAppendingPathComponent:@"enrollment_version.json"];

  id v11 = +[SSRUtils getVoiceProfileIdentityFromVersionFilePath:v10];
  id v12 = (os_log_t *)MEMORY[0x263F38100];
  if (a5 == 5)
  {
    id v13 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = v13;
      int v27 = 136316418;
      char v28 = "-[SSRVoiceProfileStore checkIfVoiceProfile:needsUpdatedWith:withCategory:]";
      __int16 v29 = 1024;
      *(_DWORD *)id v30 = [v7 profileLocallyAvailable];
      *(_WORD *)&v30[4] = 2048;
      *(void *)&v30[6] = 5;
      *(_WORD *)&v30[14] = 2112;
      *(void *)&v30[16] = v9;
      *(_WORD *)&v30[24] = 2112;
      *(void *)&v30[26] = v10;
      __int16 v31 = 2112;
      int v32 = v11;
      _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s %d, %lu, %@,%@, %@", (uint8_t *)&v27, 0x3Au);
    }
    if (v11 && (!v9 || ([v11 isEqualToString:v9] & 1) == 0))
    {
      os_log_t v23 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = v23;
        uint64_t v25 = [v7 profileID];
        int v27 = 136316162;
        char v28 = "-[SSRVoiceProfileStore checkIfVoiceProfile:needsUpdatedWith:withCategory:]";
        __int16 v29 = 2114;
        *(void *)id v30 = v25;
        *(_WORD *)&v30[8] = 2114;
        *(void *)&v30[10] = v9;
        *(_WORD *)&v30[18] = 2114;
        *(void *)&v30[20] = v11;
        *(_WORD *)&v30[28] = 1026;
        *(_DWORD *)&v30[30] = 5;
        _os_log_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_DEFAULT, "%s Needs Retraining Profile %{public}@ - existing {%{public}@} downloaded {%{public}@, %{public}d}", (uint8_t *)&v27, 0x30u);
      }
      goto LABEL_15;
    }
  }
  char v15 = [v7 profileLocallyAvailable];
  os_log_t v16 = *v12;
  BOOL v17 = os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT);
  if ((v15 & 1) == 0)
  {
    if (v17)
    {
      uint64_t v21 = v16;
      uint64_t v22 = [v7 profileID];
      int v27 = 136316162;
      char v28 = "-[SSRVoiceProfileStore checkIfVoiceProfile:needsUpdatedWith:withCategory:]";
      __int16 v29 = 2114;
      *(void *)id v30 = v22;
      *(_WORD *)&v30[8] = 2114;
      *(void *)&v30[10] = v9;
      *(_WORD *)&v30[18] = 2114;
      *(void *)&v30[20] = v11;
      *(_WORD *)&v30[28] = 1026;
      *(_DWORD *)&v30[30] = a5;
      _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s Needs Retraining storage for Profile %{public}@ - existing {%{public}@} downloaded {%{public}@, %{public}d}", (uint8_t *)&v27, 0x30u);
    }
LABEL_15:
    BOOL v20 = 1;
    goto LABEL_16;
  }
  if (v17)
  {
    id v18 = v16;
    uint64_t v19 = [v7 profileID];
    int v27 = 136316162;
    char v28 = "-[SSRVoiceProfileStore checkIfVoiceProfile:needsUpdatedWith:withCategory:]";
    __int16 v29 = 2114;
    *(void *)id v30 = v19;
    *(_WORD *)&v30[8] = 2114;
    *(void *)&v30[10] = v9;
    *(_WORD *)&v30[18] = 2114;
    *(void *)&v30[20] = v11;
    *(_WORD *)&v30[28] = 1026;
    *(_DWORD *)&v30[30] = a5;
    _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Skipping Profile %{public}@ - existing {%{public}@} downloaded {%{public}@, %{public}d}", (uint8_t *)&v27, 0x30u);
  }
  BOOL v20 = 0;
LABEL_16:

  return v20;
}

- (id)_deleteUserVoiceProfile:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (os_log_t *)MEMORY[0x263F38100];
    char v6 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v38 = "-[SSRVoiceProfileStore _deleteUserVoiceProfile:]";
      __int16 v39 = 2114;
      id v40 = v4;
      _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Deleting VoiceProfile %{public}@", buf, 0x16u);
    }
    id v7 = [v4 voiceProfileBasePath];

    if (v7)
    {
      id v8 = [MEMORY[0x263F08850] defaultManager];
      id v9 = [v4 voiceProfileBasePath];
      id v30 = 0;
      [v8 removeItemAtPath:v9 error:&v30];
      id v10 = v30;

      if (!v10)
      {
        BOOL v17 = 0;
LABEL_17:
        [(SSRVoiceProfileStore *)self _updateTrainedUsersWithAction:0 UserVoiceProfile:v4];
        id v26 = [v4 getDonationIds];

        if (v26)
        {
          int v27 = [MEMORY[0x263F087C8] defaultCenter];
          [v27 postNotificationName:@"com.apple.voiceprofile.rpicleanup" object:0];

          char v28 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            __int16 v38 = "-[SSRVoiceProfileStore _deleteUserVoiceProfile:]";
            _os_log_impl(&dword_21C8A5000, v28, OS_LOG_TYPE_DEFAULT, "%s Send notification for RPI cleanup", buf, 0xCu);
          }
        }
        id v23 = v17;
        goto LABEL_21;
      }
      id v11 = NSString;
      id v12 = [v4 voiceProfileBasePath];
      id v13 = [v11 stringWithFormat:@"Deleting profile data at %@ failed with error %@", v12, v10];

      unsigned int v14 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v38 = "-[SSRVoiceProfileStore _deleteUserVoiceProfile:]";
        __int16 v39 = 2112;
        id v40 = v13;
        _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s Err: %@", buf, 0x16u);
      }
      char v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = @"reason";
      long long v34 = v13;
      os_log_t v16 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      BOOL v17 = [v15 errorWithDomain:@"com.apple.speakerrecognition" code:706 userInfo:v16];
    }
    else
    {
      id v13 = [NSString stringWithFormat:@"Profile path is nil!"];
      uint64_t v24 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v38 = "-[SSRVoiceProfileStore _deleteUserVoiceProfile:]";
        __int16 v39 = 2114;
        id v40 = v13;
        _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      uint64_t v25 = (void *)MEMORY[0x263F087E8];
      __int16 v31 = @"reason";
      int v32 = v13;
      os_log_t v16 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      BOOL v17 = [v25 errorWithDomain:@"com.apple.speakerrecognition" code:725 userInfo:v16];
    }

    goto LABEL_17;
  }
  id v18 = [NSString stringWithFormat:@"Profile is nil!"];
  uint64_t v19 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v38 = "-[SSRVoiceProfileStore _deleteUserVoiceProfile:]";
    __int16 v39 = 2114;
    id v40 = v18;
    _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
  }
  BOOL v20 = (void *)MEMORY[0x263F087E8];
  long long v35 = @"reason";
  long long v36 = v18;
  uint64_t v21 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  uint64_t v22 = [v20 errorWithDomain:@"com.apple.speakerrecognition" code:724 userInfo:v21];

  id v23 = v22;
LABEL_21:

  return v23;
}

- (void)saveVoiceProfiles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__87;
  BOOL v20 = __Block_byref_object_dispose__88;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__SSRVoiceProfileStore_saveVoiceProfiles_completion___block_invoke;
  v14[3] = &unk_26442A4B0;
  id v8 = v7;
  id v15 = v8;
  id v21 = (id)MEMORY[0x21D4B2740](v14);
  if (v6)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__SSRVoiceProfileStore_saveVoiceProfiles_completion___block_invoke_93;
    v11[3] = &unk_26442A4D8;
    v11[4] = self;
    id v12 = v6;
    id v13 = &v16;
    dispatch_async(queue, v11);
  }
  else
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1251 userInfo:&unk_26CD45530];
    (*(void (**)(void))(v17[5] + 16))();
  }
  _Block_object_dispose(&v16, 8);
}

void __53__SSRVoiceProfileStore_saveVoiceProfiles_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    id v6 = [v3 localizedDescription];
    int v8 = 136315394;
    id v9 = "-[SSRVoiceProfileStore saveVoiceProfiles:completion:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s saveVoiceProfiles with error: %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

uint64_t __53__SSRVoiceProfileStore_saveVoiceProfiles_completion___block_invoke_93(uint64_t a1)
{
  [*(id *)(a1 + 32) _saveTrainedUsers:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16);

  return v2();
}

- (id)loadCurrentVoiceProfiles
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__7928;
  __int16 v10 = __Block_byref_object_dispose__7929;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SSRVoiceProfileStore_loadCurrentVoiceProfiles__block_invoke;
  v5[3] = &unk_26442A648;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __48__SSRVoiceProfileStore_loadCurrentVoiceProfiles__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _enrolledVoiceProfiles];

  return MEMORY[0x270F9A758]();
}

- (id)deleteUserVoiceProfile:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__7928;
  uint64_t v16 = __Block_byref_object_dispose__7929;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SSRVoiceProfileStore_deleteUserVoiceProfile___block_invoke;
  block[3] = &unk_26442A4D8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __47__SSRVoiceProfileStore_deleteUserVoiceProfile___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _deleteUserVoiceProfile:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (void)addUserVoiceProfile:(id)a3 withContext:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__SSRVoiceProfileStore_addUserVoiceProfile_withContext_withCompletion___block_invoke;
  v15[3] = &unk_26442A488;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __71__SSRVoiceProfileStore_addUserVoiceProfile_withContext_withCompletion___block_invoke(uint64_t a1)
{
  v37[1] = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32))
  {
    double v7 = [NSString stringWithFormat:@"Profile is nil!"];
    id v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v31 = "-[SSRVoiceProfileStore addUserVoiceProfile:withContext:withCompletion:]_block_invoke";
      __int16 v32 = 2114;
      double v33 = v7;
      _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    id v9 = (void *)MEMORY[0x263F087E8];
    long long v36 = @"reason";
    *(double *)id v37 = v7;
    id v10 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    id v11 = [v9 errorWithDomain:@"com.apple.speakerrecognition" code:726 userInfo:v10];

    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v11);
    }

    goto LABEL_31;
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateTrainedUsersWithAction:UserVoiceProfile:", 1);
  if (*(void *)(a1 + 48))
  {
    id v29 = [MEMORY[0x263F380D0] getSiriLanguageWithFallback:0];
    if (v29)
    {
      v2 = [*(id *)(a1 + 32) locale];
      char v3 = [v29 isEqualToString:v2];

      if ((v3 & 1) == 0)
      {
        id v13 = (void *)*MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          id v14 = *(void **)(a1 + 32);
          id v15 = v13;
          double v16 = [v14 locale];
          *(_DWORD *)buf = 136315650;
          __int16 v31 = "-[SSRVoiceProfileStore addUserVoiceProfile:withContext:withCompletion:]_block_invoke";
          __int16 v32 = 2114;
          double v33 = v16;
          __int16 v34 = 2114;
          id v35 = v29;
          _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Skipping retraining for language %{public}@, current %{public}@", buf, 0x20u);
        }
        uint64_t v17 = *(void *)(a1 + 56);
        if (v17) {
          (*(void (**)(uint64_t, uint64_t, void))(v17 + 16))(v17, 1, 0);
        }

        return;
      }
    }
    uint64_t v4 = [*(id *)(a1 + 40) _retrainVoiceProfile:*(void *)(a1 + 32) withContext:*(void *)(a1 + 48)];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v6 = *(void *)(a1 + 56);
      if (v6) {
        (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v5);
      }

      return;
    }
  }
  uint64_t v18 = *(void *)(a1 + 56);
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, void))(v18 + 16))(v18, 1, 0);
  }
  if (*(void *)(a1 + 48))
  {
    id v19 = [*(id *)(a1 + 32) appDomain];
    int v20 = [v19 isEqual:@"com.apple.siri"];

    if (v20)
    {
      id v21 = [SSRPitchExtractor alloc];
      uint64_t v22 = [*(id *)(a1 + 48) asset];
      double v7 = COERCE_DOUBLE((uint64_t)[(SSRPitchExtractor *)v21 initWithAsset:v22]);

      if (v7 != 0.0)
      {
        id v23 = objc_msgSend(*(id *)(a1 + 32), "getExplicitEnrollmentUtterancesForType:", objc_msgSend(*(id *)(a1 + 48), "spIdType"));
        [*(id *)&v7 getPitchForUtteranceAudioFiles:v23];
        float v25 = v24;
        id v26 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v31 = "-[SSRVoiceProfileStore addUserVoiceProfile:withContext:withCompletion:]_block_invoke";
          __int16 v32 = 2050;
          double v33 = v25;
          _os_log_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_DEFAULT, "%s Detected mean pitch for explicit utterances = %{public}f Hz", buf, 0x16u);
        }
        *(float *)&double v27 = v25;
        char v28 = [NSNumber numberWithFloat:v27];
        [*(id *)(a1 + 32) setProfilePitch:v28];

        [*(id *)(a1 + 40) _updateTrainedUsersWithAction:2 UserVoiceProfile:*(void *)(a1 + 32)];
      }
      [*(id *)(a1 + 40) _logVoiceProfileConfusionWithCleanup:CSIsCommunalDevice()];
LABEL_31:
    }
  }
}

- (id)_getTopScoringProfileIdFromScores:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__7928;
  id v13 = __Block_byref_object_dispose__7929;
  id v14 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__7928;
  v7[4] = __Block_byref_object_dispose__7929;
  id v8 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__SSRVoiceProfileStore__getTopScoringProfileIdFromScores___block_invoke;
  v6[3] = &unk_26442A460;
  v6[4] = v7;
  v6[5] = &v9;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);

  return v4;
}

void __58__SSRVoiceProfileStore__getTopScoringProfileIdFromScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  double v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v8 + 40))
  {
    if (objc_msgSend(v6, "compare:") != 1) {
      goto LABEL_5;
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v8 + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
LABEL_5:
}

- (BOOL)evaluateImplicitAdditionPolicyWithScores:(id)a3 forProfile:(id)a4 withImplicitThreshold:(float)a5 withDeltaThreshold:(float)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  double v10 = COERCE_DOUBLE(a3);
  id v11 = a4;
  uint64_t v12 = (void *)MEMORY[0x263EFF9A0];
  id v13 = [*(id *)&v10 objectForKeyedSubscript:@"spIdKnownUserScores"];
  id v14 = [v12 dictionaryWithDictionary:v13];

  id v15 = [(SSRVoiceProfileStore *)self _getTopScoringProfileIdFromScores:v14];
  if (v15)
  {
    double v16 = [v14 objectForKeyedSubscript:v15];
    [v16 floatValue];
    float v18 = v17;

    [v14 removeObjectForKey:v15];
    double v19 = [(SSRVoiceProfileStore *)self _getTopScoringProfileIdFromScores:v14];
    if (v19 == 0.0)
    {
      float v22 = 0.0;
    }
    else
    {
      int v20 = [v14 objectForKeyedSubscript:*(void *)&v19];
      [v20 floatValue];
      float v22 = v21;
    }
    float v25 = [v11 profileID];
    char v26 = [v15 isEqualToString:v25];

    double v27 = (void *)*MEMORY[0x263F38100];
    char v28 = *MEMORY[0x263F38100];
    if ((v26 & 1) == 0)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        long long v36 = v27;
        double v37 = [v11 profileID];
        int v38 = 136316418;
        __int16 v39 = "-[SSRVoiceProfileStore evaluateImplicitAdditionPolicyWithScores:forProfile:withImplicitThreshold:withDeltaThreshold:]";
        __int16 v40 = 2050;
        double v41 = v18;
        __int16 v42 = 2114;
        os_log_t v43 = v15;
        __int16 v44 = 2050;
        double v45 = v22;
        __int16 v46 = 2114;
        double v47 = v19;
        __int16 v48 = 2114;
        double v49 = v37;
        _os_log_error_impl(&dword_21C8A5000, v36, OS_LOG_TYPE_ERROR, "%s ERR: Utterance scored %{public}f (%{public}@) with next top score %{public}f (%{public}@) for profileId %{public}@", (uint8_t *)&v38, 0x3Eu);
      }
      BOOL v24 = 0;
      goto LABEL_21;
    }
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v19 == 0.0)
    {
      if (!v29) {
        goto LABEL_18;
      }
      id v30 = v27;
      __int16 v31 = [v11 profileID];
      int v38 = 136316162;
      __int16 v39 = "-[SSRVoiceProfileStore evaluateImplicitAdditionPolicyWithScores:forProfile:withImplicitThreshold:withDeltaThreshold:]";
      __int16 v40 = 2050;
      double v41 = v18;
      __int16 v42 = 2114;
      os_log_t v43 = v31;
      __int16 v44 = 2050;
      double v45 = a5;
      __int16 v46 = 2050;
      double v47 = a6;
      __int16 v32 = "%s Utterance scored %{public}f for %{public}@ and thresholds (%{public}f, %{public}f)";
      double v33 = v30;
      uint32_t v34 = 52;
    }
    else
    {
      if (!v29) {
        goto LABEL_18;
      }
      id v30 = v27;
      __int16 v31 = [v11 profileID];
      int v38 = 136316674;
      __int16 v39 = "-[SSRVoiceProfileStore evaluateImplicitAdditionPolicyWithScores:forProfile:withImplicitThreshold:withDeltaThreshold:]";
      __int16 v40 = 2050;
      double v41 = v18;
      __int16 v42 = 2114;
      os_log_t v43 = v31;
      __int16 v44 = 2050;
      double v45 = v22;
      __int16 v46 = 2114;
      double v47 = v19;
      __int16 v48 = 2050;
      double v49 = a5;
      __int16 v50 = 2050;
      double v51 = a6;
      __int16 v32 = "%s Utterance scored %{public}f (%{public}@) with next top score %{public}f (%{public}@) and thresholds (%{pu"
            "blic}f, %{public}f)";
      double v33 = v30;
      uint32_t v34 = 72;
    }
    _os_log_impl(&dword_21C8A5000, v33, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v38, v34);

LABEL_18:
    BOOL v24 = (float)(v18 - v22) > a6 && v18 > a5;
LABEL_21:

    goto LABEL_22;
  }
  id v23 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v38 = 136315394;
    __int16 v39 = "-[SSRVoiceProfileStore evaluateImplicitAdditionPolicyWithScores:forProfile:withImplicitThreshold:withDeltaThreshold:]";
    __int16 v40 = 2114;
    double v41 = v10;
    _os_log_error_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get top scorer in %{public}@ - Bailing out", (uint8_t *)&v38, 0x16u);
  }
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (void)_logVoiceProfileConfusionWithCleanup:(BOOL)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F380D0] getSiriLanguageWithFallback:0];
  if (v4)
  {
    uint64_t v5 = +[SSRAssetManager sharedManager];
    id v6 = [v5 installedAssetOfType:3 forLanguage:v4];

    double v7 = [(SSRVoiceProfileStore *)self userVoiceProfilesForAppDomain:@"com.apple.siri" forLocale:v4];
    uint64_t v8 = v7;
    if (v6)
    {
      double v27 = self;
      BOOL v24 = v7;
      float v25 = v4;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v9 = v7;
      uint64_t v29 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v29)
      {
        uint64_t v26 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v38 != v26) {
              objc_enumerationMutation(v9);
            }
            uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            uint64_t v12 = (void *)MEMORY[0x21D4B2500]();
            CSIsIOS();
            v41[0] = @"SSRVoiceRetrainingVoiceProfile";
            v41[1] = @"SSRVoiceRetrainingCompareVoiceProfiles";
            v42[0] = v11;
            v42[1] = v9;
            v41[2] = @"SSRVoiceRetrainingCompareVoiceProfilesSpIdType";
            id v13 = [NSNumber numberWithUnsignedInteger:4];
            v42[2] = v13;
            v42[3] = v6;
            v41[3] = @"SSRVoiceRetrainingAsset";
            v41[4] = @"SSRVoiceRetrainingSpIdType";
            id v14 = [NSNumber numberWithUnsignedInteger:3];
            v42[4] = v14;
            id v15 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:5];

            double v16 = [SSRVoiceProfileRetrainingContext alloc];
            id v36 = 0;
            float v17 = [(SSRVoiceProfileRetrainingContext *)v16 initWithVoiceRetrainingContext:v15 error:&v36];
            id v18 = v36;
            double v19 = objc_alloc_init(SSRVoiceProfileRetrainerFactory);
            int v20 = [(SSRVoiceProfileRetrainerFactory *)v19 voiceRetrainersWithContext:v17];
            v30[0] = MEMORY[0x263EF8330];
            v30[1] = 3221225472;
            v30[2] = __61__SSRVoiceProfileStore__logVoiceProfileConfusionWithCleanup___block_invoke;
            v30[3] = &unk_26442A430;
            BOOL v35 = a3;
            __int16 v31 = v17;
            __int16 v32 = v27;
            uint64_t v33 = v11;
            id v34 = v6;
            float v21 = v17;
            [v20 enumerateObjectsUsingBlock:v30];
          }
          uint64_t v29 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
        }
        while (v29);
      }

      uint64_t v8 = v24;
      id v4 = v25;
    }
    else
    {
      id v23 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        double v45 = "-[SSRVoiceProfileStore _logVoiceProfileConfusionWithCleanup:]";
        _os_log_error_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_ERROR, "%s assetForLocale is nil - Bail out", buf, 0xCu);
      }
    }
  }
  else
  {
    float v22 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      double v45 = "-[SSRVoiceProfileStore _logVoiceProfileConfusionWithCleanup:]";
      _os_log_error_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_ERROR, "%s Locale is nil - Bail out", buf, 0xCu);
    }
  }
}

void __61__SSRVoiceProfileStore__logVoiceProfileConfusionWithCleanup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __61__SSRVoiceProfileStore__logVoiceProfileConfusionWithCleanup___block_invoke_2;
  id v14 = &unk_26442A408;
  id v4 = v3;
  id v15 = v4;
  id v16 = *(id *)(a1 + 32);
  char v19 = *(unsigned char *)(a1 + 64);
  long long v17 = *(_OWORD *)(a1 + 40);
  id v18 = *(id *)(a1 + 56);
  uint64_t v5 = [v4 purgeConfusionInformationWithPolicy:&v11];
  id v6 = (void *)v5;
  if (*(unsigned char *)(a1 + 64))
  {
    if (v5)
    {
      double v7 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void **)(a1 + 48);
        id v9 = v7;
        double v10 = objc_msgSend(v8, "profileID", v11, v12, v13, v14, v15, v16, v17);
        *(_DWORD *)buf = 136315650;
        float v21 = "-[SSRVoiceProfileStore _logVoiceProfileConfusionWithCleanup:]_block_invoke";
        __int16 v22 = 2114;
        id v23 = v10;
        __int16 v24 = 2114;
        float v25 = v6;
        _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed purging profile %{public}@ with error - %{public}@", buf, 0x20u);
      }
    }
  }
}

uint64_t __61__SSRVoiceProfileStore__logVoiceProfileConfusionWithCleanup___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 retrainerType] == 2) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  if ([*(id *)(a1 + 32) retrainerType] == 1) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  [*(id *)(a1 + 40) combinationWeight];
  double v7 = +[SSRUtils combineScoreFromPSR:fromSAT:withCombinedWt:](SSRUtils, "combineScoreFromPSR:fromSAT:withCombinedWt:", v5, v6);

  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    [*(id *)(a1 + 64) satImplicitProfileThreshold];
    int v11 = v10;
    [*(id *)(a1 + 64) satImplicitProfileDeltaThreshold];
    LODWORD(v13) = v12;
    LODWORD(v14) = v11;
    uint64_t v15 = [v8 evaluateImplicitAdditionPolicyWithScores:v7 forProfile:v9 withImplicitThreshold:v14 withDeltaThreshold:v13];
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

- (void)logVoiceProfileConfusionWithCleanup:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__SSRVoiceProfileStore_logVoiceProfileConfusionWithCleanup___block_invoke;
  v4[3] = &unk_26442A3E0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __60__SSRVoiceProfileStore_logVoiceProfileConfusionWithCleanup___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logVoiceProfileConfusionWithCleanup:*(unsigned __int8 *)(a1 + 40)];
}

- (void)addImplicitUtterance:(id)a3 toVoiceProfile:(id)a4 withAsset:(id)a5 withTriggerSource:(id)a6 withAudioInput:(id)a7 withCompletion:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke;
  block[3] = &unk_26442A3B8;
  id v22 = v14;
  id v23 = self;
  id v25 = v12;
  id v26 = v15;
  id v24 = v13;
  id v17 = v12;
  id v18 = v15;
  id v19 = v13;
  id v20 = v14;
  dispatch_async(queue, block);
}

void __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke(uint64_t a1)
{
  v157[6] = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  if (CSIsCommunalDevice())
  {

    v90 = (id *)(a1 + 48);
LABEL_9:
    double v7 = *(void **)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 48) appDomain];
    uint64_t v9 = [*(id *)(a1 + 48) locale];
    int v10 = [v7 userVoiceProfilesForAppDomain:v8 forLocale:v9];

    uint64_t v11 = *(void *)(a1 + 48);
    v156[0] = @"SSRVoiceRetrainingVoiceProfile";
    v156[1] = @"SSRVoiceRetrainingCompareVoiceProfiles";
    v157[0] = v11;
    v157[1] = v10;
    v156[2] = @"SSRVoiceRetrainingFilterToVoiceTriggerUtterances";
    v156[3] = @"SSRVoiceRetrainingAsset";
    uint64_t v12 = *(void *)(a1 + 32);
    v157[2] = MEMORY[0x263EFFA88];
    v157[3] = v12;
    v156[4] = @"SSRVoiceRetrainingSpIdType";
    v156[5] = @"SSRVoiceRetrainingCompareVoiceProfilesSpIdType";
    v157[4] = &unk_26CD45610;
    v157[5] = &unk_26CD45628;
    v97 = [NSDictionary dictionaryWithObjects:v157 forKeys:v156 count:6];

    goto LABEL_12;
  }
  if (CSIsIOS() & 1) != 0 || (CSIsAppleSiliconMac())
  {
    [v2 psrCombinationWeight];
    float v4 = v3;
    int v5 = [v2 useTDTIEnrollment];

    v90 = (id *)(a1 + 48);
    if (v4 == 1.0 && v5 != 0) {
      goto LABEL_9;
    }
  }
  else
  {

    v90 = (id *)(a1 + 48);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  v154[0] = @"SSRVoiceRetrainingVoiceProfile";
  v154[1] = @"SSRVoiceRetrainingFilterToVoiceTriggerUtterances";
  v155[0] = v13;
  v155[1] = MEMORY[0x263EFFA88];
  uint64_t v14 = *(void *)(a1 + 32);
  v154[2] = @"SSRVoiceRetrainingAsset";
  v154[3] = @"SSRVoiceRetrainingSpIdType";
  v155[2] = v14;
  v155[3] = &unk_26CD45640;
  v97 = [NSDictionary dictionaryWithObjects:v155 forKeys:v154 count:4];
LABEL_12:
  id v131 = 0;
  v93 = [[SSRVoiceProfileRetrainingContext alloc] initWithVoiceRetrainingContext:v97 error:&v131];
  id v95 = v131;
  if (!v95)
  {
    v96 = objc_alloc_init(SSRVoiceProfileRetrainerFactory);
    float v21 = [(SSRVoiceProfileRetrainerFactory *)v96 voiceRetrainersWithContext:v93];
    id v99 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v94 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v20 = v21;
    uint64_t v22 = [v20 countByEnumeratingWithState:&v127 objects:v151 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v128;
      id v24 = (os_log_t *)MEMORY[0x263F37FA8];
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v128 != v23) {
            objc_enumerationMutation(v20);
          }
          id v26 = *(void **)(*((void *)&v127 + 1) + 8 * i);
          if ([v26 retrainerType] == 1
            && ([*(id *)(a1 + 32) psrCombinationWeight], fabsf(v27 + -1.0) <= 0.00000011921))
          {
            char v28 = *v24;
            if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSourc"
                                   "e:withAudioInput:withCompletion:]_block_invoke";
              _os_log_impl(&dword_21C8A5000, v28, OS_LOG_TYPE_DEFAULT, "%s Skip SAT retrainer since combination weight is 1", buf, 0xCu);
            }
          }
          else if ([v26 implicitTrainingRequired])
          {
            [v99 addObject:v26];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v127 objects:v151 count:16];
      }
      while (v22);
    }

    if ([v99 count])
    {
      uint64_t v29 = (void *)MEMORY[0x21D4B2500]();
      uint64_t v148 = *(void *)(a1 + 56);
      id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v148 count:1];
      __int16 v31 = [*(id *)(a1 + 48) locale];
      __int16 v32 = +[SSRTriggerPhraseDetector filterVTAudioFiles:v30 withLocale:v31 withAsset:*(void *)(a1 + 32)];

      if (v32 && [v32 count])
      {

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v143 = __Block_byref_object_copy__7928;
        v144 = __Block_byref_object_dispose__7929;
        id v145 = 0;
        v123[0] = MEMORY[0x263EF8330];
        v123[1] = 3221225472;
        v123[2] = __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke_66;
        v123[3] = &unk_26442A368;
        id v124 = *(id *)(a1 + 56);
        id v125 = *(id *)(a1 + 48);
        v126 = buf;
        v92 = (void *)MEMORY[0x21D4B2740](v123);
        uint64_t v117 = 0;
        v118 = &v117;
        uint64_t v119 = 0x3032000000;
        v120 = __Block_byref_object_copy__7928;
        v121 = __Block_byref_object_dispose__7929;
        id v122 = 0;
        v112[0] = MEMORY[0x263EF8330];
        v112[1] = 3221225472;
        v112[2] = __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke_71;
        v112[3] = &unk_26442A390;
        v116 = &v117;
        id v113 = *(id *)(a1 + 56);
        id v114 = *(id *)(a1 + 48);
        id v115 = 0;
        __int16 v98 = (void *)MEMORY[0x21D4B2740](v112);
        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        id v33 = v99;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v108 objects:v141 count:16];
        if (v34)
        {
          id v91 = 0;
          BOOL v35 = 0;
          uint64_t v36 = *(void *)v109;
LABEL_35:
          uint64_t v37 = 0;
          while (1)
          {
            if (*(void *)v109 != v36) {
              objc_enumerationMutation(v33);
            }
            long long v38 = *(void **)(*((void *)&v108 + 1) + 8 * v37);
            uint64_t v140 = *(void *)(a1 + 56);
            long long v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v140 count:1];
            [v38 addUtterances:v39 withPolicy:v92 withCompletion:v98];

            if (v118[5]) {
              break;
            }
            [v94 addObject:v38];
            uint64_t v40 = [v38 retrainerType];
            double v41 = *(void **)(*(void *)&buf[8] + 40);
            if (v40 == 2)
            {
              uint64_t v42 = [v41 copy];
              os_log_t v43 = v91;
              id v91 = (void *)v42;
            }
            else
            {
              uint64_t v44 = [v41 copy];
              os_log_t v43 = v35;
              BOOL v35 = (void *)v44;
            }

            if (v34 == ++v37)
            {
              uint64_t v34 = [v33 countByEnumeratingWithState:&v108 objects:v141 count:16];
              if (v34) {
                goto LABEL_35;
              }
              break;
            }
          }
        }
        else
        {
          id v91 = 0;
          BOOL v35 = 0;
        }

        uint64_t v62 = [v33 count];
        if (v62 == [v94 count])
        {
          [(SSRVoiceProfileRetrainingContext *)v93 combinationWeight];
          double v63 = +[SSRUtils combineScoreFromPSR:fromSAT:withCombinedWt:](SSRUtils, "combineScoreFromPSR:fromSAT:withCombinedWt:", v91, v35);
          long long v65 = *(void **)(a1 + 40);
          uint64_t v64 = *(void *)(a1 + 48);
          [*(id *)(a1 + 32) satImplicitProfileThreshold];
          int v67 = v66;
          [*(id *)(a1 + 32) satImplicitProfileDeltaThreshold];
          LODWORD(v69) = v68;
          LODWORD(v70) = v67;
          if ([v65 evaluateImplicitAdditionPolicyWithScores:v63 forProfile:v64 withImplicitThreshold:v70 withDeltaThreshold:v69])
          {
            uint64_t v71 = *(void *)(a1 + 64);
            if (v71) {
              (*(void (**)(uint64_t, void))(v71 + 16))(v71, 0);
            }
          }
          else
          {
            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            id v77 = v33;
            uint64_t v78 = [v77 countByEnumeratingWithState:&v100 objects:v138 count:16];
            if (v78)
            {
              uint64_t v79 = *(void *)v101;
              do
              {
                for (uint64_t j = 0; j != v78; ++j)
                {
                  if (*(void *)v101 != v79) {
                    objc_enumerationMutation(v77);
                  }
                  [*(id *)(*((void *)&v100 + 1) + 8 * j) purgeLastSpeakerEmbedding];
                }
                uint64_t v78 = [v77 countByEnumeratingWithState:&v100 objects:v138 count:16];
              }
              while (v78);
            }

            unint64_t v81 = NSString;
            v82 = [*(id *)(a1 + 56) lastPathComponent];
            uint64_t v83 = [*v90 profileID];
            int v84 = [v81 stringWithFormat:@"Utterance %@ in profile %@ not satisfied the implicit policy", v82, v83];

            v85 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v134 = 136315394;
              v135 = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudioInp"
                     "ut:withCompletion:]_block_invoke";
              __int16 v136 = 2114;
              v137 = v84;
              _os_log_impl(&dword_21C8A5000, v85, OS_LOG_TYPE_DEFAULT, "%s %{public}@", v134, 0x16u);
            }
            uint64_t v86 = *(void *)(a1 + 64);
            if (v86)
            {
              id v87 = (void *)MEMORY[0x263F087E8];
              v132 = @"reason";
              v133 = v84;
              v88 = [NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
              v89 = [v87 errorWithDomain:@"com.apple.speakerrecognition" code:735 userInfo:v88];
              (*(void (**)(uint64_t, void *))(v86 + 16))(v86, v89);
            }
          }
        }
        else
        {
          long long v106 = 0u;
          long long v107 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          id v72 = v94;
          uint64_t v73 = [v72 countByEnumeratingWithState:&v104 objects:v139 count:16];
          if (v73)
          {
            uint64_t v74 = *(void *)v105;
            do
            {
              for (uint64_t k = 0; k != v73; ++k)
              {
                if (*(void *)v105 != v74) {
                  objc_enumerationMutation(v72);
                }
                [*(id *)(*((void *)&v104 + 1) + 8 * k) purgeLastSpeakerEmbedding];
              }
              uint64_t v73 = [v72 countByEnumeratingWithState:&v104 objects:v139 count:16];
            }
            while (v73);
          }

          uint64_t v76 = *(void *)(a1 + 64);
          if (v76) {
            (*(void (**)(uint64_t, uint64_t))(v76 + 16))(v76, v118[5]);
          }
        }

        _Block_object_dispose(&v117, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        double v45 = NSString;
        uint64_t v46 = [*(id *)(a1 + 56) lastPathComponent];
        double v47 = [*(id *)(a1 + 48) profileID];
        __int16 v48 = [v45 stringWithFormat:@"Utterance %@ in profile %@ not satisfied the implicit VT policy", v46, v47];

        double v49 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:wi"
                               "thAudioInput:withCompletion:]_block_invoke";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v48;
          _os_log_impl(&dword_21C8A5000, v49, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
        uint64_t v50 = *(void *)(a1 + 64);
        if (v50)
        {
          double v51 = (void *)MEMORY[0x263F087E8];
          v146 = @"reason";
          v147 = v48;
          uint64_t v52 = [NSDictionary dictionaryWithObjects:&v147 forKeys:&v146 count:1];
          long long v53 = [v51 errorWithDomain:@"com.apple.speakerrecognition" code:750 userInfo:v52];
          (*(void (**)(uint64_t, void *))(v50 + 16))(v50, v53);
        }
      }
    }
    else
    {
      long long v54 = NSString;
      long long v55 = [*v90 profileID];
      uint64_t v56 = [v54 stringWithFormat:@"Profile %@ is full - Ignoring", v55];

      v57 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:with"
                             "AudioInput:withCompletion:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v56;
        _os_log_impl(&dword_21C8A5000, v57, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
      }
      uint64_t v58 = *(void *)(a1 + 64);
      if (v58)
      {
        id v59 = (void *)MEMORY[0x263F087E8];
        v149 = @"reason";
        v150 = v56;
        __int16 v60 = [NSDictionary dictionaryWithObjects:&v150 forKeys:&v149 count:1];
        double v61 = [v59 errorWithDomain:@"com.apple.speakerrecognition" code:757 userInfo:v60];
        (*(void (**)(uint64_t, void *))(v58 + 16))(v58, v61);
      }
    }

    goto LABEL_84;
  }
  id v15 = NSString;
  id v16 = [*v90 profileID];
  v96 = [v15 stringWithFormat:@"Failed to init retrainCtxt for profileID %@ with error %@", v16, v95];

  id v17 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudi"
                         "oInput:withCompletion:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v96;
    _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
  }
  uint64_t v18 = *(void *)(a1 + 64);
  if (v18)
  {
    id v19 = (void *)MEMORY[0x263F087E8];
    v152 = @"reason";
    v153 = v96;
    id v20 = [NSDictionary dictionaryWithObjects:&v153 forKeys:&v152 count:1];
    id v99 = [v19 errorWithDomain:@"com.apple.speakerrecognition" code:756 userInfo:v20];
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v99);
LABEL_84:
  }
}

id __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke_66(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    id v6 = 0;
  }
  else
  {
    double v7 = NSString;
    uint64_t v8 = [*(id *)(a1 + 32) lastPathComponent];
    uint64_t v9 = [*(id *)(a1 + 40) profileID];
    int v10 = [v7 stringWithFormat:@"Rejecting Implicit utterance %@ for profile %@", v8, v9];

    uint64_t v11 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudioInput:withCo"
            "mpletion:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    id v15 = @"reason";
    id v16 = v10;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v6 = [v12 errorWithDomain:@"com.apple.speakerrecognition" code:735 userInfo:v13];
  }

  return v6;
}

void __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    double v7 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(NSObject **)(a1 + 32);
      uint64_t v8 = *(void **)(a1 + 40);
      int v10 = v7;
      uint64_t v11 = [v8 profileID];
      uint64_t v12 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315906;
      char v28 = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudioInput:withCo"
            "mpletion:]_block_invoke";
      __int16 v29 = 2114;
      id v30 = v9;
      __int16 v31 = 2114;
      __int16 v32 = v11;
      __int16 v33 = 2114;
      uint64_t v34 = v12;
      _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Failed in adding %{public}@ to %{public}@ with error %{public}@", buf, 0x2Au);
LABEL_7:

LABEL_11:
    }
  }
  else
  {
    if (![a3 count])
    {
      id v16 = NSString;
      id v17 = [*(id *)(a1 + 32) lastPathComponent];
      uint64_t v18 = [*(id *)(a1 + 40) profileID];
      int v10 = [v16 stringWithFormat:@"Utterance %@ rejected for profile %@", v17, v18];

      __int16 v19 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        char v28 = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudioInput:with"
              "Completion:]_block_invoke";
        __int16 v29 = 2114;
        id v30 = v10;
        _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
      }
      id v20 = (void *)MEMORY[0x263F087E8];
      id v25 = @"reason";
      id v26 = v10;
      uint64_t v21 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v22 = [v20 errorWithDomain:@"com.apple.speakerrecognition" code:735 userInfo:v21];
      uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
      id v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      goto LABEL_11;
    }
    uint64_t v13 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void **)(a1 + 32);
      int v10 = v13;
      uint64_t v11 = [v14 lastPathComponent];
      id v15 = [*(id *)(a1 + 40) profileID];
      *(_DWORD *)buf = 136315650;
      char v28 = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudioInput:withCo"
            "mpletion:]_block_invoke";
      __int16 v29 = 2114;
      id v30 = v11;
      __int16 v31 = 2114;
      __int16 v32 = v15;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Added Implicit SAT vector from %{public}@ to profile %{public}@", buf, 0x20u);

      goto LABEL_7;
    }
  }
}

- (void)isImplicitTrainingRequiredToVoiceProfile:(id)a3 withAsset:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __86__SSRVoiceProfileStore_isImplicitTrainingRequiredToVoiceProfile_withAsset_completion___block_invoke;
  v15[3] = &unk_26442A488;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

void __86__SSRVoiceProfileStore_isImplicitTrainingRequiredToVoiceProfile_withAsset_completion___block_invoke(uint64_t a1)
{
  v44[6] = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  if (CSIsCommunalDevice())
  {

    float v3 = (id *)(a1 + 48);
LABEL_9:
    id v8 = *(void **)(a1 + 40);
    id v9 = [*(id *)(a1 + 48) appDomain];
    id v10 = [*(id *)(a1 + 48) locale];
    uint64_t v11 = [v8 userVoiceProfilesForAppDomain:v9 forLocale:v10];

    uint64_t v12 = *(void *)(a1 + 48);
    v43[0] = @"SSRVoiceRetrainingVoiceProfile";
    v43[1] = @"SSRVoiceRetrainingCompareVoiceProfiles";
    v44[0] = v12;
    v44[1] = v11;
    v43[2] = @"SSRVoiceRetrainingFilterToVoiceTriggerUtterances";
    v43[3] = @"SSRVoiceRetrainingAsset";
    uint64_t v13 = *(void *)(a1 + 32);
    v44[2] = MEMORY[0x263EFFA88];
    v44[3] = v13;
    void v43[4] = @"SSRVoiceRetrainingSpIdType";
    v43[5] = @"SSRVoiceRetrainingCompareVoiceProfilesSpIdType";
    v44[4] = &unk_26CD45610;
    v44[5] = &unk_26CD45628;
    id v14 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:6];

    goto LABEL_12;
  }
  if (CSIsIOS() & 1) != 0 || (CSIsAppleSiliconMac())
  {
    [v2 psrCombinationWeight];
    float v5 = v4;
    int v6 = [v2 useTDTIEnrollment];

    float v3 = (id *)(a1 + 48);
    if (v5 == 1.0 && v6 != 0) {
      goto LABEL_9;
    }
  }
  else
  {

    float v3 = (id *)(a1 + 48);
  }
  uint64_t v15 = *(void *)(a1 + 48);
  v41[0] = @"SSRVoiceRetrainingVoiceProfile";
  v41[1] = @"SSRVoiceRetrainingFilterToVoiceTriggerUtterances";
  v42[0] = v15;
  v42[1] = MEMORY[0x263EFFA88];
  uint64_t v16 = *(void *)(a1 + 32);
  v41[2] = @"SSRVoiceRetrainingAsset";
  v41[3] = @"SSRVoiceRetrainingSpIdType";
  v42[2] = v16;
  v42[3] = &unk_26CD45640;
  id v14 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
LABEL_12:
  id v35 = 0;
  id v17 = [[SSRVoiceProfileRetrainingContext alloc] initWithVoiceRetrainingContext:v14 error:&v35];
  id v18 = v35;
  if (v18)
  {
    id v19 = NSString;
    id v20 = [*v3 profileID];
    uint64_t v21 = [v19 stringWithFormat:@"Failed to init retrainCtxt for profileID %@ with error %@", v20, v18];

    uint64_t v22 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v38 = "-[SSRVoiceProfileStore isImplicitTrainingRequiredToVoiceProfile:withAsset:completion:]_block_invoke";
      __int16 v39 = 2112;
      uint64_t v40 = v21;
      _os_log_error_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
    }
    uint64_t v23 = *(void *)(a1 + 56);
    if (v23) {
      (*(void (**)(uint64_t, void, id))(v23 + 16))(v23, 0, v18);
    }
  }
  else
  {
    uint64_t v21 = objc_alloc_init(SSRVoiceProfileRetrainerFactory);
    [(SSRVoiceProfileRetrainerFactory *)v21 voiceRetrainersWithContext:v17];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          if ([*(id *)(*((void *)&v31 + 1) + 8 * i) implicitTrainingRequired])
          {
            uint64_t v30 = *(void *)(a1 + 56);
            if (v30) {
              (*(void (**)(uint64_t, uint64_t, void))(v30 + 16))(v30, 1, 0);
            }

            goto LABEL_30;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    uint64_t v29 = *(void *)(a1 + 56);
    if (v29) {
      (*(void (**)(uint64_t, void, void))(v29 + 16))(v29, 0, 0);
    }
LABEL_30:
  }
}

- (void)_synchronizeSiriVoiceProfilesWithAssistant
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SSRVoiceProfileStore__synchronizeSiriVoiceProfilesWithAssistant__block_invoke;
  block[3] = &unk_26442A618;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __66__SSRVoiceProfileStore__synchronizeSiriVoiceProfilesWithAssistant__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = (os_log_t *)MEMORY[0x263F38100];
  float v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = "-[SSRVoiceProfileStore _synchronizeSiriVoiceProfilesWithAssistant]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Synchronize voiceprofiles with Assistant...", buf, 0xCu);
  }
  float v4 = objc_alloc_init(SSRVoiceProfileStoreCleaner);
  float v5 = [*(id *)(a1 + 32) _enrolledVoiceProfiles];
  int v6 = [(SSRVoiceProfileStoreCleaner *)v4 filterInvalidSiriProfilesFrom:v5];

  if ([v6 count])
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __66__SSRVoiceProfileStore__synchronizeSiriVoiceProfilesWithAssistant__block_invoke_47;
    v23[3] = &unk_26442A2C0;
    v23[4] = *(void *)(a1 + 32);
    [v6 enumerateObjectsUsingBlock:v23];
    double v7 = [MEMORY[0x263F38028] sharedInstance];
    [v7 submitVoiceIdIssueReport:*MEMORY[0x263F38128]];
  }
  notify_post("com.apple.siri.corespeech.voiceprofilelist.change");
  if ([v6 count])
  {
    id v8 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v26 = "-[SSRVoiceProfileStore _synchronizeSiriVoiceProfilesWithAssistant]_block_invoke";
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Missing user models - Triggering voice profiles download", buf, 0xCu);
    }
    id v9 = [MEMORY[0x263F087C8] defaultCenter];
    [v9 postNotificationName:@"com.apple.voicetrigger.PHSProfileDownloadTrigger" object:0];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = objc_msgSend(*(id *)(a1 + 32), "_enrolledVoiceProfiles", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v15 = [v14 appDomain];
          int v16 = [v15 isEqualToString:@"com.apple.siri"];

          if (v16 && ([v14 profileLocallyAvailable] & 1) == 0)
          {
            id v17 = *v2;
            if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v26 = "-[SSRVoiceProfileStore _synchronizeSiriVoiceProfilesWithAssistant]_block_invoke";
              _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Needs retraining - Triggering voice profiles download", buf, 0xCu);
            }
            id v18 = [MEMORY[0x263F087C8] defaultCenter];
            [v18 postNotificationName:@"com.apple.voicetrigger.PHSProfileDownloadTrigger" object:0];

            goto LABEL_22;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
LABEL_22:
}

void __66__SSRVoiceProfileStore__synchronizeSiriVoiceProfilesWithAssistant__block_invoke_47(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = (id)[*(id *)(a1 + 32) _deleteUserVoiceProfile:v5];
  double v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315650;
    id v9 = "-[SSRVoiceProfileStore _synchronizeSiriVoiceProfilesWithAssistant]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Deleted stale voiceprofile(%lu): %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)cleanupVoiceProfileModelFilesForLocale:(id)a3 withAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__SSRVoiceProfileStore_cleanupVoiceProfileModelFilesForLocale_withAsset___block_invoke;
  block[3] = &unk_26442A310;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __73__SSRVoiceProfileStore_cleanupVoiceProfileModelFilesForLocale_withAsset___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(SSRVoiceProfileStoreCleaner);
  float v3 = +[SSRAssetManager sharedManager];
  uint64_t v4 = [v3 allInstalledAssetsOfType:3 forLanguage:*(void *)(a1 + 32)];

  int v16 = (void *)v4;
  id v5 = [MEMORY[0x263EFF980] arrayWithArray:v4];
  id v6 = v5;
  if (*(void *)(a1 + 40) && v5) {
    objc_msgSend(v5, "addObject:");
  }
  id v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[SSRVoiceProfileStore cleanupVoiceProfileModelFilesForLocale:withAsset:]_block_invoke";
    __int16 v24 = 2114;
    uint64_t v25 = v6;
    _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Cleanup model files with assets %{public}@", buf, 0x16u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v8 = [*(id *)(a1 + 48) _enrolledVoiceProfiles];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = [v13 locale];
        int v15 = [v14 isEqualToString:*(void *)(a1 + 32)];

        if (v15) {
          [(SSRVoiceProfileStoreCleaner *)v2 cleanupInvalidModelsForProfile:v13 withAssetArray:v6];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)cleanupVoiceProfileStore:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke;
  v7[3] = &unk_26442A298;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(SSRVoiceProfileStoreCleaner);
  float v3 = [(SSRVoiceProfileStoreCleaner *)v2 cleanupProfileStore];
  id v4 = [*(id *)(a1 + 32) _enrolledVoiceProfiles];
  id v5 = [(SSRVoiceProfileStoreCleaner *)v2 filterDuplicatedSiriProfilesFrom:v4];

  if ([v5 count])
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke_2;
    v18[3] = &unk_26442A2C0;
    v18[4] = *(void *)(a1 + 32);
    [v5 enumerateObjectsUsingBlock:v18];
    id v6 = [MEMORY[0x263F38028] sharedInstance];
    [v6 submitVoiceIdIssueReport:*MEMORY[0x263F38128]];

    id v7 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v20 = "-[SSRVoiceProfileStore cleanupVoiceProfileStore:]_block_invoke";
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Triggering voice profiles download", buf, 0xCu);
    }
    id v8 = [MEMORY[0x263F087C8] defaultCenter];
    [v8 postNotificationName:@"com.apple.voicetrigger.PHSProfileDownloadTrigger" object:0];
  }
  uint64_t v9 = [MEMORY[0x263F380D0] getSiriLanguageWithFallback:0];
  id v10 = [(SSRVoiceProfileStoreCleaner *)v2 deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:v9 appDomain:@"com.apple.siri"];

  if (CSIsCommunalDevice())
  {
    dispatch_time_t v11 = dispatch_time(0, 120000000000);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(NSObject **)(v12 + 8);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke_37;
    v17[3] = &unk_26442A618;
    void v17[4] = v12;
    dispatch_after(v11, v13, v17);
  }
  if ((CSIsCommunalDevice() & 1) != 0
    || CSIsIOS()
    && ([MEMORY[0x263F38068] sharedPreferences],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 voiceTriggerEnabled],
        v14,
        v15))
  {
    [*(id *)(a1 + 32) _logVoiceProfileConfusionWithCleanup:0];
  }
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v3);
  }
}

void __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = (id)[*(id *)(a1 + 32) _deleteUserVoiceProfile:v5];
  id v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[SSRVoiceProfileStore cleanupVoiceProfileStore:]_block_invoke_2";
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Deleted duplicated voiceprofile(%lu): %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

void __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke_37(uint64_t a1)
{
  [*(id *)(a1 + 32) _synchronizeSiriVoiceProfilesWithAssistant];
  if (CSIsInternalBuild())
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = [MEMORY[0x263F380D0] getSiriLanguageWithFallback:@"en-US"];
    [v2 _retrainLiveOnOnboardedProfilesForLanguage:v3 withForceRetrain:1 withCompletion:&__block_literal_global_44];
  }
}

void __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke_2_41(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F38100];
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[SSRVoiceProfileStore cleanupVoiceProfileStore:]_block_invoke_2";
      __int16 v6 = 2114;
      id v7 = v2;
      _os_log_error_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_ERROR, "%s ERR: Failed retraining LiveOn onboarded users with error %{public}@", (uint8_t *)&v4, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SSRVoiceProfileStore cleanupVoiceProfileStore:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Successfully retrained LiveOn onboarded users", (uint8_t *)&v4, 0xCu);
  }
}

- (void)cleanupInvalidSiriProfilesFromPersonalDevicesForLanguage:(id)a3 appDomain:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = objc_alloc_init(SSRVoiceProfileStoreCleaner);
  __int16 v6 = [MEMORY[0x263F380D0] getSiriLanguageWithFallback:0];
  id v7 = [(SSRVoiceProfileStoreCleaner *)v5 deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:v6 appDomain:v4];

  uint64_t v8 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    __int16 v10 = [v7 localizedDescription];
    int v11 = 136315394;
    __int16 v12 = "-[SSRVoiceProfileStore cleanupInvalidSiriProfilesFromPersonalDevicesForLanguage:appDomain:]";
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Deleted invalid Siri profile with err: %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (BOOL)cleanupDuplicatedProfiles
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (CSIsIOS())
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__SSRVoiceProfileStore_cleanupDuplicatedProfiles__block_invoke;
    v6[3] = &unk_26442A648;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(queue, v6);
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__SSRVoiceProfileStore_cleanupDuplicatedProfiles__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = (os_log_t *)MEMORY[0x263F38100];
  id v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v13 = "-[SSRVoiceProfileStore cleanupDuplicatedProfiles]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Triggered cleanup duplicated profiles", buf, 0xCu);
  }
  char v4 = objc_alloc_init(SSRVoiceProfileStoreCleaner);
  id v5 = [*(id *)(a1 + 32) _enrolledVoiceProfiles];
  __int16 v6 = [(SSRVoiceProfileStoreCleaner *)v4 filterDuplicatedSiriProfilesFrom:v5];

  if ([v6 count])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__SSRVoiceProfileStore_cleanupDuplicatedProfiles__block_invoke_32;
    v11[3] = &unk_26442A2C0;
    v11[4] = *(void *)(a1 + 32);
    [v6 enumerateObjectsUsingBlock:v11];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v7 = [MEMORY[0x263F38028] sharedInstance];
    [v7 submitVoiceIdIssueReport:*MEMORY[0x263F38128]];
  }
  os_log_t v8 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    int v10 = [v6 count];
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[SSRVoiceProfileStore cleanupDuplicatedProfiles]_block_invoke";
    __int16 v14 = 1026;
    int v15 = v10;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Found %{public}d duplicated profiles", buf, 0x12u);
  }
}

void __49__SSRVoiceProfileStore_cleanupDuplicatedProfiles__block_invoke_32(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = (id)[*(id *)(a1 + 32) _deleteUserVoiceProfile:v5];
  uint64_t v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[SSRVoiceProfileStore cleanupDuplicatedProfiles]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Deleted duplicated voiceprofile(%lu): %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)migrateVoiceProfilesIfNeededWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__SSRVoiceProfileStore_migrateVoiceProfilesIfNeededWithCompletionBlock___block_invoke;
  v7[3] = &unk_26442A298;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __72__SSRVoiceProfileStore_migrateVoiceProfilesIfNeededWithCompletionBlock___block_invoke(uint64_t a1)
{
  v180[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 16) getVoiceProfileStoreVersion];
  id v2 = *MEMORY[0x263F38100];
  BOOL v3 = os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT);
  if (v1 == -1)
  {
    if (v3)
    {
      *(_DWORD *)buf = 136315138;
      v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
      _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Migration of voice profile is triggered...", buf, 0xCu);
    }
    unint64_t v5 = 0x264428000uLL;
    v138 = +[SSRVoiceProfileManager sharedInstance];
    id v6 = [v138 SSRSpeakerProfilesBasePath];
    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    if (([v7 fileExistsAtPath:v6] & 1) == 0)
    {
      long long v20 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
        __int16 v171 = 2112;
        id v172 = v6;
        _os_log_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Sat directory doesnt exist %@", buf, 0x16u);
      }
      uint64_t v21 = *(void *)(a1 + 40);
      if (v21) {
        (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
      }
      __int16 v10 = 0;
      goto LABEL_120;
    }
    id v164 = 0;
    id v8 = [v7 contentsOfDirectoryAtPath:v6 error:&v164];
    id v9 = v164;
    if (v9)
    {
      __int16 v10 = v9;
      uint64_t v11 = v8;
      __int16 v12 = NSString;
      id v13 = [v9 localizedDescription];
      uint64_t v14 = [v12 stringWithFormat:@"Failed to get contents of %@ with error %@", v6, v13];

      int v15 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
        __int16 v171 = 2114;
        id v172 = v14;
        _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      uint64_t v16 = *(void *)(a1 + 40);
      if (!v16)
      {
        id v8 = v11;
LABEL_119:

LABEL_120:
        return;
      }
      id v145 = v10;
      long long v17 = (void *)MEMORY[0x263F087E8];
      v179 = @"reason";
      v180[0] = v14;
      long long v18 = [NSDictionary dictionaryWithObjects:v180 forKeys:&v179 count:1];
      long long v19 = [v17 errorWithDomain:@"com.apple.speakerrecognition" code:722 userInfo:v18];
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v19);

      goto LABEL_66;
    }
    long long v22 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
      __int16 v171 = 2114;
      id v172 = v8;
      _os_log_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_DEFAULT, "%s Migrating voice profiles in languages - %{public}@", buf, 0x16u);
    }
    id v135 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = AFPreferencesSupportedLanguages();
    long long v128 = v8;
    long long v129 = v7;
    if (v18)
    {
      long long v162 = 0u;
      long long v163 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      id v23 = v8;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v160 objects:v178 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v161;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v161 != v26) {
              objc_enumerationMutation(v23);
            }
            char v28 = *(void **)(*((void *)&v160 + 1) + 8 * i);
            if ([v18 containsObject:v28])
            {
              [v135 addObject:v28];
            }
            else
            {
              uint64_t v29 = v18;
              uint64_t v30 = *MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                __int16 v171 = 2114;
                id v172 = v28;
                __int16 v173 = 2114;
                id v174 = v29;
                _os_log_impl(&dword_21C8A5000, v30, OS_LOG_TYPE_DEFAULT, "%s Language %{public}@ not supported in %{public}@ - Deleting", buf, 0x20u);
              }
              long long v31 = [v6 stringByAppendingPathComponent:v28];
              id v32 = +[SSRUtils removeItemAtPath:v31];

              long long v18 = v29;
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v160 objects:v178 count:16];
        }
        while (v25);
      }

      id v8 = v128;
      uint64_t v7 = v129;
      unint64_t v5 = 0x264428000uLL;
    }
    if (!v135)
    {
      uint64_t v11 = v8;
      long long v55 = [NSString stringWithFormat:@"Filtered languages is nil - %@", v8];
      uint64_t v56 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
        __int16 v171 = 2114;
        id v172 = v55;
        _os_log_error_impl(&dword_21C8A5000, v56, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      uint64_t v57 = *(void *)(a1 + 40);
      if (v57) {
        (*(void (**)(uint64_t, void))(v57 + 16))(v57, 0);
      }

      uint64_t v14 = 0;
      id v145 = 0;
LABEL_66:
      id v8 = v11;
LABEL_118:

      __int16 v10 = v145;
      goto LABEL_119;
    }
    long long v33 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
      __int16 v171 = 2114;
      id v172 = v135;
      _os_log_impl(&dword_21C8A5000, v33, OS_LOG_TYPE_DEFAULT, "%s Migrating voice profiles in languages - %{public}@", buf, 0x16u);
    }
    if ((CSIsIOS() & 1) != 0 || CSIsMac())
    {
      v126 = v18;
      v137 = v6;
      long long v158 = 0u;
      long long v159 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      id obj = v135;
      uint64_t v34 = [obj countByEnumeratingWithState:&v156 objects:v177 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        id v145 = 0;
        uint64_t v36 = *(void *)v157;
        unint64_t v37 = 0x264428000uLL;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v157 != v36) {
              objc_enumerationMutation(obj);
            }
            __int16 v39 = *(void **)(*((void *)&v156 + 1) + 8 * j);
            uint64_t v40 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
              __int16 v171 = 2114;
              id v172 = v39;
              _os_log_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_DEFAULT, "%s Voice profile migration for language - %{public}@", buf, 0x16u);
            }
            double v41 = [v137 stringByAppendingPathComponent:v39];
            uint64_t v42 = (void *)[v138 newVoiceProfileWithLocale:v39 withAppDomain:@"com.apple.siri"];
            os_log_t v43 = v42;
            if (v42)
            {
              uint64_t v44 = *(void **)(v37 + 2112);
              double v45 = [v42 voiceProfileBasePath];
              uint64_t v46 = [v44 moveContentsOfSrcDirectory:v41 toDestDirectory:v45];

              if (v46)
              {
                double v47 = (void *)*MEMORY[0x263F38100];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                {
                  long long v53 = v47;
                  long long v54 = [v43 voiceProfileBasePath];
                  *(_DWORD *)buf = 136315906;
                  v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                  __int16 v171 = 2114;
                  id v172 = v41;
                  __int16 v173 = 2114;
                  id v174 = v54;
                  __int16 v175 = 2114;
                  uint64_t v176 = v46;
                  _os_log_error_impl(&dword_21C8A5000, v53, OS_LOG_TYPE_ERROR, "%s Moving contents from %{public}@ to %{public}@ failed with error %{public}@", buf, 0x2Au);
                }
                id v145 = (void *)v46;
                unint64_t v37 = 0x264428000;
              }
              else
              {
                [*(id *)(a1 + 32) _updateTrainedUsersWithAction:1 UserVoiceProfile:v43];
                id v49 = (id)[*(id *)(v37 + 2112) removeItemAtPath:v41];
                uint64_t v50 = (void *)*MEMORY[0x263F38100];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                {
                  double v51 = v50;
                  uint64_t v52 = [v43 profileID];
                  *(_DWORD *)buf = 136315650;
                  v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                  __int16 v171 = 2114;
                  id v172 = v52;
                  __int16 v173 = 2114;
                  id v174 = v39;
                  _os_log_impl(&dword_21C8A5000, v51, OS_LOG_TYPE_DEFAULT, "%s Completed migrating voiceprofile for %{public}@ in language %{public}@", buf, 0x20u);

                  unint64_t v37 = 0x264428000;
                }
                id v145 = 0;
              }
            }
            else
            {
              __int16 v48 = *MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                __int16 v171 = 2114;
                id v172 = v39;
                _os_log_error_impl(&dword_21C8A5000, v48, OS_LOG_TYPE_ERROR, "%s voice profile created is nil!!! - Skipping %{public}@", buf, 0x16u);
              }
            }
          }
          uint64_t v35 = [obj countByEnumeratingWithState:&v156 objects:v177 count:16];
        }
        while (v35);
        goto LABEL_114;
      }
    }
    else
    {
      if (!CSIsCommunalDevice())
      {
        id v145 = 0;
        goto LABEL_115;
      }
      v126 = v18;
      v137 = v6;
      long long v154 = 0u;
      long long v155 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      id v127 = v135;
      uint64_t v131 = [v127 countByEnumeratingWithState:&v152 objects:v168 count:16];
      if (v131)
      {
        id v145 = 0;
        uint64_t v130 = *(void *)v153;
        uint64_t v58 = @"UserVoiceProfileOnboardType";
        while (2)
        {
          uint64_t v59 = 0;
          __int16 v60 = (os_log_t *)MEMORY[0x263F38100];
          do
          {
            double v61 = v60;
            if (*(void *)v153 != v130) {
              objc_enumerationMutation(v127);
            }
            uint64_t v62 = *(void **)(*((void *)&v152 + 1) + 8 * v59);
            double v63 = [*(id *)(v5 + 2160) sharedInstance];
            uint64_t v64 = [v63 SSRSpeakerProfilesBasePath];
            v142 = v62;
            long long v65 = [v64 stringByAppendingPathComponent:v62];

            v134 = v65;
            int v66 = [v65 stringByAppendingPathComponent:@"spid"];
            int v67 = [v66 stringByAppendingPathComponent:@"trained_users.json"];

            char v151 = 0;
            int v68 = [MEMORY[0x263F08850] defaultManager];
            LODWORD(v64) = [v68 fileExistsAtPath:v67 isDirectory:&v151];

            uint64_t v69 = [MEMORY[0x263EFF8C0] array];
            double v70 = (void *)v69;
            if (v64) {
              BOOL v71 = v151 == 0;
            }
            else {
              BOOL v71 = 0;
            }
            if (v71)
            {
              uint64_t v73 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v67];
              id v150 = 0;
              id v72 = [MEMORY[0x263F08900] JSONObjectWithData:v73 options:0 error:&v150];
              id v74 = v150;

              if (v72) {
                BOOL v75 = v74 == 0;
              }
              else {
                BOOL v75 = 0;
              }
              __int16 v60 = v61;
              if (!v75)
              {
                v116 = *v61;
                if (os_log_type_enabled(*v61, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                  __int16 v171 = 2112;
                  id v172 = v67;
                  __int16 v173 = 2112;
                  id v174 = v74;
                  _os_log_impl(&dword_21C8A5000, v116, OS_LOG_TYPE_DEFAULT, "%s Could not read existing %@ file: err: %@", buf, 0x20u);
                }
                v118 = NSString;
                uint64_t v119 = [v74 localizedDescription];
                v120 = [v118 stringWithFormat:@"Could not read existing %@ file: err: %@", v67, v119];

                v121 = *MEMORY[0x263F38100];
                uint64_t v14 = v127;
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                  __int16 v171 = 2114;
                  id v172 = v120;
                  _os_log_error_impl(&dword_21C8A5000, v121, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
                }
                uint64_t v122 = *(void *)(a1 + 40);
                if (v122)
                {
                  v123 = (void *)MEMORY[0x263F087E8];
                  v166 = @"reason";
                  v167 = v120;
                  id v124 = [NSDictionary dictionaryWithObjects:&v167 forKeys:&v166 count:1];
                  id v125 = [v123 errorWithDomain:@"com.apple.speakerrecognition" code:722 userInfo:v124];
                  (*(void (**)(uint64_t, void *))(v122 + 16))(v122, v125);

                  uint64_t v14 = v127;
                }

                id v6 = v137;
                id v8 = v128;
                uint64_t v7 = v129;
                long long v18 = v126;
                goto LABEL_118;
              }
            }
            else
            {
              id v72 = (void *)v69;
              __int16 v60 = v61;
            }
            uint64_t v132 = v59;
            uint64_t v76 = *v60;
            if (os_log_type_enabled(*v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
              __int16 v171 = 2114;
              id v172 = v142;
              _os_log_impl(&dword_21C8A5000, v76, OS_LOG_TYPE_DEFAULT, "%s Voice profile migration for language - %{public}@", buf, 0x16u);
            }
            v133 = v67;
            id v77 = +[SSRUtils removeItemAtPath:v67];
            uint64_t v78 = [*(id *)(v5 + 2160) sharedInstance];
            uint64_t v79 = [v78 SSRBasePathForAppDomain:@"com.apple.siri"];

            uint64_t v140 = (void *)v79;
            +[SSRUtils createDirectoryIfDoesNotExist:v79];
            long long v148 = 0u;
            long long v149 = 0u;
            long long v146 = 0u;
            long long v147 = 0u;
            id obja = v72;
            uint64_t v80 = [obja countByEnumeratingWithState:&v146 objects:v165 count:16];
            if (v80)
            {
              uint64_t v81 = v80;
              uint64_t v82 = *(void *)v147;
              uint64_t v139 = *(void *)v147;
              do
              {
                uint64_t v83 = 0;
                uint64_t v141 = v81;
                do
                {
                  if (*(void *)v147 != v82) {
                    objc_enumerationMutation(obja);
                  }
                  int v84 = *(void **)(*((void *)&v146 + 1) + 8 * v83);
                  uint64_t v85 = [v84 objectForKeyedSubscript:v58];
                  if (v85
                    && (uint64_t v86 = (void *)v85,
                        [v84 objectForKeyedSubscript:v58],
                        id v87 = objc_claimAutoreleasedReturnValue(),
                        uint64_t v88 = [v87 unsignedIntegerValue],
                        v87,
                        v86,
                        v88 == 1))
                  {
                    id v89 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                    v90 = [v84 objectForKeyedSubscript:@"UserVoiceProfileID"];
                    [v89 setObject:v90 forKeyedSubscript:@"UserVoiceProfileID"];

                    id v91 = [v84 objectForKeyedSubscript:@"UserSharedSiriID"];
                    [v89 setObject:v91 forKeyedSubscript:@"UserSharedSiriID"];

                    v92 = [v84 objectForKeyedSubscript:@"UserVoiceProfileDateTrained"];
                    [v89 setObject:v92 forKeyedSubscript:@"UserVoiceProfileDateTrained"];

                    v93 = [v84 objectForKeyedSubscript:@"UserVoiceProfileExpSatVecCount"];
                    [v89 setObject:v93 forKeyedSubscript:@"UserVoiceProfileExpSatVecCount"];

                    [v89 setObject:v142 forKeyedSubscript:@"UserVoiceProfileLocale"];
                    [v89 setObject:@"com.apple.siri" forKeyedSubscript:@"UserVoiceProfileAppDomain"];
                    id v94 = [v140 stringByAppendingPathComponent:v142];
                    id v95 = [v84 objectForKeyedSubscript:@"UserVoiceProfileID"];
                    v96 = [v94 stringByAppendingPathComponent:v95];
                    [v89 setObject:v96 forKeyedSubscript:@"UserVoiceProfilePath"];

                    v97 = [[SSRVoiceProfile alloc] initWithDictionary:v89];
                    if (v97)
                    {
                      __int16 v98 = v58;
                      id v99 = [v84 objectForKeyedSubscript:@"UserVoiceProfilePath"];
                      long long v100 = [(SSRVoiceProfile *)v97 voiceProfileBasePath];
                      uint64_t v101 = +[SSRUtils moveContentsOfSrcDirectory:v99 toDestDirectory:v100];

                      if (v101)
                      {
                        __int16 v60 = (os_log_t *)MEMORY[0x263F38100];
                        long long v102 = (void *)*MEMORY[0x263F38100];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                        {
                          long long v111 = v102;
                          v112 = [v84 objectForKeyedSubscript:@"UserVoiceProfilePath"];
                          id v113 = [(SSRVoiceProfile *)v97 voiceProfileBasePath];
                          *(_DWORD *)buf = 136315906;
                          v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                          __int16 v171 = 2114;
                          id v172 = v112;
                          __int16 v173 = 2114;
                          id v174 = v113;
                          __int16 v175 = 2114;
                          uint64_t v176 = v101;
                          _os_log_error_impl(&dword_21C8A5000, v111, OS_LOG_TYPE_ERROR, "%s Moving contents from %{public}@ to %{public}@ failed with error %{public}@", buf, 0x2Au);

                          __int16 v60 = (os_log_t *)MEMORY[0x263F38100];
                        }
                        id v145 = (void *)v101;
                      }
                      else
                      {
                        [*(id *)(a1 + 32) _updateTrainedUsersWithAction:1 UserVoiceProfile:v97];
                        __int16 v60 = (os_log_t *)MEMORY[0x263F38100];
                        long long v108 = (void *)*MEMORY[0x263F38100];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                        {
                          long long v109 = v108;
                          long long v110 = [(SSRVoiceProfile *)v97 profileID];
                          *(_DWORD *)buf = 136315650;
                          v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                          __int16 v171 = 2114;
                          id v172 = v110;
                          __int16 v173 = 2114;
                          id v174 = v142;
                          _os_log_impl(&dword_21C8A5000, v109, OS_LOG_TYPE_DEFAULT, "%s Completed migrating voiceprofile for %{public}@ in language %{public}@", buf, 0x20u);
                        }
                        id v145 = 0;
                      }
                      uint64_t v58 = v98;
                      uint64_t v82 = v139;
                      uint64_t v81 = v141;
                    }
                    else
                    {
                      long long v107 = *v60;
                      uint64_t v81 = v141;
                      if (os_log_type_enabled(*v60, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315394;
                        v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                        __int16 v171 = 2114;
                        id v172 = v89;
                        _os_log_error_impl(&dword_21C8A5000, v107, OS_LOG_TYPE_ERROR, "%s voice profile created is nil!!! - Skipping %{public}@", buf, 0x16u);
                      }
                      uint64_t v82 = v139;
                    }
                  }
                  else
                  {
                    os_log_t v103 = *v60;
                    if (os_log_type_enabled(*v60, OS_LOG_TYPE_DEFAULT))
                    {
                      long long v104 = v103;
                      long long v105 = [v84 objectForKeyedSubscript:@"UserVoiceProfileID"];
                      long long v106 = [v84 objectForKeyedSubscript:v58];
                      *(_DWORD *)buf = 136315650;
                      v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                      __int16 v171 = 2114;
                      id v172 = v105;
                      __int16 v173 = 2114;
                      id v174 = v106;
                      _os_log_impl(&dword_21C8A5000, v104, OS_LOG_TYPE_DEFAULT, "%s Skipped migrating non-siri landed profile - %{public}@, %{public}@", buf, 0x20u);
                    }
                  }
                  ++v83;
                }
                while (v81 != v83);
                uint64_t v81 = [obja countByEnumeratingWithState:&v146 objects:v165 count:16];
              }
              while (v81);
            }

            id v114 = +[SSRUtils removeItemAtPath:v134];
            uint64_t v59 = v132 + 1;
            unint64_t v5 = 0x264428000;
          }
          while (v132 + 1 != v131);
          uint64_t v131 = [v127 countByEnumeratingWithState:&v152 objects:v168 count:16];
          if (v131) {
            continue;
          }
          goto LABEL_114;
        }
      }
    }
    id v145 = 0;
LABEL_114:

    id v6 = v137;
    id v8 = v128;
    uint64_t v7 = v129;
    long long v18 = v126;
LABEL_115:
    uint64_t v115 = *(void *)(a1 + 40);
    if (v115) {
      (*(void (**)(uint64_t, void *))(v115 + 16))(v115, v145);
    }
    uint64_t v14 = v135;
    goto LABEL_118;
  }
  if (v3)
  {
    *(_DWORD *)buf = 136315138;
    v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Profiles already migrated - Bailing out", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (id)userVoiceProfileForVoiceProfileID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unint64_t v5 = [(SSRVoiceProfileStore *)self _enrolledVoiceProfiles];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          __int16 v10 = [v9 profileID];
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)userVoiceProfilesForLocale:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = [(SSRVoiceProfileStore *)self _enrolledVoiceProfiles];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          __int16 v12 = [v11 locale];
          int v13 = [v12 isEqualToString:v4];

          if (v13) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    if ([v5 count]) {
      long long v14 = v5;
    }
    else {
      long long v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    long long v16 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v24 = "-[SSRVoiceProfileStore userVoiceProfilesForLocale:]";
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s ERR: locale passed as nil", buf, 0xCu);
    }
    id v15 = 0;
  }

  return v15;
}

- (id)userVoiceProfilesForAppDomain:(id)a3 forLocale:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = [(SSRVoiceProfileStore *)self _enrolledVoiceProfiles];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v10) {
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if (v7)
      {
        id v4 = [*(id *)(*((void *)&v21 + 1) + 8 * i) appDomain];
        if (([v4 isEqualToString:v7] & 1) == 0)
        {

          continue;
        }
        if (!v8)
        {

LABEL_16:
          [v20 addObject:v14];
          continue;
        }
      }
      else if (!v8)
      {
        goto LABEL_16;
      }
      id v15 = [v14 locale];
      int v16 = [v15 isEqualToString:v8];

      if (!v7)
      {
        if (!v16) {
          continue;
        }
        goto LABEL_16;
      }

      if (v16) {
        goto LABEL_16;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v11);
LABEL_19:

  if ([v20 count]) {
    long long v17 = v20;
  }
  else {
    long long v17 = 0;
  }
  id v18 = v17;

  return v18;
}

- (id)userVoiceProfilesForAppDomain:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = [(SSRVoiceProfileStore *)self _enrolledVoiceProfiles];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = [v11 appDomain];
          int v13 = [v12 isEqualToString:v4];

          if (v13) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    if ([v5 count]) {
      long long v14 = v5;
    }
    else {
      long long v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    int v16 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v24 = "-[SSRVoiceProfileStore userVoiceProfilesForAppDomain:]";
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s ERR: appDomain passed as nil", buf, 0xCu);
    }
    id v15 = 0;
  }

  return v15;
}

- (id)initStore
{
  v8.receiver = self;
  v8.super_class = (Class)SSRVoiceProfileStore;
  id v2 = [(SSRVoiceProfileStore *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[SSRVoiceProfileStorePrefs sharedStorePrefs];
    storePrefs = v2->_storePrefs;
    v2->_storePrefs = (SSRVoiceProfileStorePrefs *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.corespeech.voiceprofilestore", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8086 != -1) {
    dispatch_once(&sharedInstance_onceToken_8086, &__block_literal_global_8087);
  }
  id v2 = (void *)sharedInstance_userStore;

  return v2;
}

uint64_t __38__SSRVoiceProfileStore_sharedInstance__block_invoke()
{
  if (CSIsInternalBuild()) {
    +[SSRUtils cleanupOrphanedVoiceIdGradingFiles];
  }
  sharedInstance_userStore = [[SSRVoiceProfileStore alloc] initStore];

  return MEMORY[0x270F9A758]();
}

@end