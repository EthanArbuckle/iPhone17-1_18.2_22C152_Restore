@interface SSRVoiceProfileStoreCleaner
- (id)_cleanupAppDomain:(id)a3;
- (id)_cleanupContentsOfSatFolder:(id)a3;
- (id)_cleanupImplicitUtteranceCacheForProfile:(id)a3;
- (id)_cleanupInvalidAudioFiles:(id)a3;
- (id)_cleanupOrphanedMetafilesAtURL:(id)a3;
- (id)_cleanupOrphanedMetafilesForProfile:(id)a3 payloadUtteranceLifeTimeInDays:(int64_t)a4;
- (id)_cleanupPayloadUtterancesFromProfile:(id)a3 forModelType:(unint64_t)a4 exceedingLifeTimeInDays:(int64_t)a5;
- (id)_cleanuplanguageCodePath:(id)a3 forAppDomain:(id)a4;
- (id)cleanupProfileStore;
- (id)deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:(id)a3 appDomain:(id)a4;
- (id)filterDuplicatedSiriProfilesFrom:(id)a3;
- (id)filterInvalidSiriProfilesFrom:(id)a3;
- (void)_cleanupModelFilesAtDir:(id)a3 forAssetArray:(id)a4;
- (void)cleanupInvalidModelsForProfile:(id)a3 withAssetArray:(id)a4;
@end

@implementation SSRVoiceProfileStoreCleaner

- (void)_cleanupModelFilesAtDir:(id)a3 forAssetArray:(id)a4
{
  v62[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [v5 path];
  int v9 = [v7 fileExistsAtPath:v8];

  if (!v9) {
    goto LABEL_35;
  }
  v62[0] = *MEMORY[0x263EFF750];
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:1];
  id v53 = 0;
  v11 = [v7 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v10 options:0 error:&v53];
  id v12 = v53;

  if (!v12)
  {
    id v40 = v5;
    v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v39 = v6;
    id v17 = v6;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v49 + 1) + 8 * i) hashFromResourcePath];
          [v15 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v61 count:16];
      }
      while (v19);
    }
    v41 = v7;

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v38 = v11;
    obuint64_t j = v11;
    uint64_t v23 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
    if (!v23)
    {
      v43 = 0;
      goto LABEL_33;
    }
    uint64_t v24 = v23;
    v43 = 0;
    uint64_t v25 = *(void *)v46;
    unint64_t v26 = 0x263F38000uLL;
    while (1)
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        v29 = [v28 absoluteString];
        v30 = [v29 lastPathComponent];

        if ([*(id *)(v26 + 208) isExclaveHardware])
        {
          uint64_t v31 = v25;
          unint64_t v32 = v26;
          v33 = [v28 URLByDeletingPathExtension];
          v34 = [v33 absoluteString];
          v35 = [v34 lastPathComponent];

          if ([v15 containsObject:v30])
          {
            unint64_t v26 = v32;
            uint64_t v25 = v31;
            goto LABEL_29;
          }
          if (v35)
          {
            unint64_t v26 = v32;
            uint64_t v25 = v31;
            if ([v15 containsObject:v35]) {
              goto LABEL_29;
            }
          }
          else
          {
            unint64_t v26 = v32;
            uint64_t v25 = v31;
          }
        }
        else
        {
          v35 = 0;
          if ([v15 containsObject:v30]) {
            goto LABEL_29;
          }
        }
        id v44 = v43;
        [v41 removeItemAtURL:v28 error:&v44];
        id v36 = v44;

        v37 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v55 = "-[SSRVoiceProfileStoreCleaner _cleanupModelFilesAtDir:forAssetArray:]";
          __int16 v56 = 2114;
          v57 = v30;
          __int16 v58 = 2114;
          id v59 = v36;
          _os_log_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_DEFAULT, "%s Deleting model file %{public}@ with err %{public}@", buf, 0x20u);
        }
        v43 = v36;
LABEL_29:
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
      if (!v24)
      {
LABEL_33:

        id v6 = v39;
        id v5 = v40;
        v7 = v41;
        v11 = v38;
        id v12 = v43;
        goto LABEL_34;
      }
    }
  }
  v13 = NSString;
  v14 = [v12 localizedDescription];
  v15 = [v13 stringWithFormat:@"Error reading contents of modelDir: %@, err: %@", v5, v14];

  v16 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v55 = "-[SSRVoiceProfileStoreCleaner _cleanupModelFilesAtDir:forAssetArray:]";
    __int16 v56 = 2114;
    v57 = v15;
    _os_log_error_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
LABEL_34:

LABEL_35:
}

- (void)cleanupInvalidModelsForProfile:(id)a3 withAssetArray:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  for (uint64_t i = 1; i != 6; ++i)
  {
    v8 = [v12 voiceProfileModelDirForSpidType:i recognizerType:2];
    int v9 = [v12 voiceProfileModelDirForSpidType:i recognizerType:1];
    v10 = [NSURL URLWithString:v8];
    [(SSRVoiceProfileStoreCleaner *)self _cleanupModelFilesAtDir:v10 forAssetArray:v6];

    v11 = [NSURL URLWithString:v9];
    [(SSRVoiceProfileStoreCleaner *)self _cleanupModelFilesAtDir:v11 forAssetArray:v6];
  }
}

- (id)_cleanupPayloadUtterancesFromProfile:(id)a3 forModelType:(unint64_t)a4 exceedingLifeTimeInDays:(int64_t)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)a5 * -86400.0];
  int v9 = (os_log_t *)MEMORY[0x263F38100];
  v10 = *MEMORY[0x263F38100];
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      id v12 = [v7 profileID];
      int v19 = 136315906;
      uint64_t v20 = "-[SSRVoiceProfileStoreCleaner _cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:]";
      __int16 v21 = 2114;
      v22 = v8;
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      __int16 v25 = 1024;
      int v26 = a4;
      _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Checking payload utterances prior to %{public}@ for profile %{public}@ and modelType %d", (uint8_t *)&v19, 0x26u);
    }
    v13 = [v7 getImplicitEnrollmentUtterancesPriorTo:v8 forType:a4];
    [v13 enumerateObjectsUsingBlock:&__block_literal_global_51];
    v14 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315138;
      uint64_t v20 = "-[SSRVoiceProfileStoreCleaner _cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:]";
      _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s ObsoleteCutOffDate is nil - Bailing out", (uint8_t *)&v19, 0xCu);
    }
    v13 = [NSString stringWithFormat:@"obsoleteCutOffDate is nil - Bailing out"];
    v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      uint64_t v20 = "-[SSRVoiceProfileStoreCleaner _cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:]";
      __int16 v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", (uint8_t *)&v19, 0x16u);
    }
    v16 = (void *)MEMORY[0x263F087E8];
    v27 = @"reason";
    v28[0] = v13;
    id v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v14 = [v16 errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:v17];
  }

  return v14;
}

void __105__SSRVoiceProfileStoreCleaner__cleanupPayloadUtterancesFromProfile_forModelType_exceedingLifeTimeInDays___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = [v2 URLByDeletingPathExtension];
  v4 = [v3 URLByAppendingPathExtension:@"json"];

  id v5 = (os_log_t *)MEMORY[0x263F38100];
  id v6 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    v13 = "-[SSRVoiceProfileStoreCleaner _cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:]_block_invoke";
    __int16 v14 = 2114;
    id v15 = v2;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Deleting lifetimeexpired SAT entry %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v7 = [v2 path];
  id v8 = +[SSRUtils removeItemAtPath:v7];

  int v9 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    v13 = "-[SSRVoiceProfileStoreCleaner _cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:]_block_invoke";
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Deleted lifetimeexpired metafile %{public}@", (uint8_t *)&v12, 0x16u);
  }
  v10 = [v4 path];
  id v11 = +[SSRUtils removeItemAtPath:v10];
}

- (id)_cleanupOrphanedMetafilesAtURL:(id)a3
{
  v71[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v4 path];
  char v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    v71[0] = *MEMORY[0x263EFF750];
    int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:1];
    id v62 = 0;
    v10 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v9 options:0 error:&v62];
    id v11 = v62;

    if (v11)
    {
      int v12 = NSString;
      v13 = [v11 localizedDescription];
      id v14 = [v12 stringWithFormat:@"Failed reading contents of audioDir: %@, err: %@", v4, v13];

      id v15 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v64 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:]";
        __int16 v65 = 2114;
        id v66 = v14;
        _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      id v16 = v11;
    }
    else
    {
      long long v49 = self;
      long long v51 = v5;
      id v52 = v4;
      uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
      id v53 = [@"meta_version.json" stringByDeletingPathExtension];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v50 = v10;
      id v19 = v10;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v59 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            __int16 v25 = [v24 absoluteString];
            int v26 = [v25 lastPathComponent];
            v27 = [v26 stringByDeletingPathExtension];

            if ([v27 compare:@"enrollment_completed"]
              && ([v27 isEqualToString:v53] & 1) == 0)
            {
              v28 = [v18 objectForKeyedSubscript:v27];

              if (v28) {
                [v18 removeObjectForKey:v27];
              }
              else {
                [v18 setObject:v24 forKeyedSubscript:v27];
              }
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v58 objects:v70 count:16];
        }
        while (v21);
      }

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v14 = v18;
      uint64_t v29 = [v14 countByEnumeratingWithState:&v54 objects:v69 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v55 != v31) {
              objc_enumerationMutation(v14);
            }
            v33 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            v34 = [v14 objectForKeyedSubscript:v33];
            v35 = [v34 pathExtension];
            uint64_t v36 = [v35 compare:@"json"];

            v37 = *MEMORY[0x263F38100];
            BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT);
            if (v36)
            {
              if (v38)
              {
                *(_DWORD *)buf = 136315394;
                v64 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:]";
                __int16 v65 = 2114;
                id v66 = v34;
                _os_log_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_DEFAULT, "%s Found non-meta file: %{public}@", buf, 0x16u);
              }
            }
            else
            {
              if (v38)
              {
                *(_DWORD *)buf = 136315650;
                v64 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:]";
                __int16 v65 = 2114;
                id v66 = v33;
                __int16 v67 = 2114;
                v68[0] = v34;
                _os_log_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid SAT entry: %{public}@ : <%{public}@>", buf, 0x20u);
              }
              id v39 = [v34 path];
              id v40 = +[SSRUtils removeItemAtPath:v39];
            }
          }
          uint64_t v30 = [v14 countByEnumeratingWithState:&v54 objects:v69 count:16];
        }
        while (v30);
      }

      id v4 = v52;
      v41 = [(SSRVoiceProfileStoreCleaner *)v49 _cleanupInvalidAudioFiles:v52];
      v42 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        v43 = v42;
        id v44 = +[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:v52];
        int v45 = [v44 count];
        long long v46 = +[SSRUtils getImplicitEnrollmentUtterancesFromDirectory:v52];
        int v47 = [v46 count];
        *(_DWORD *)buf = 136315906;
        v64 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:]";
        __int16 v65 = 2114;
        id v66 = v52;
        __int16 v67 = 1026;
        LODWORD(v68[0]) = v45;
        WORD2(v68[0]) = 1026;
        *(_DWORD *)((char *)v68 + 6) = v47;
        _os_log_impl(&dword_21C8A5000, v43, OS_LOG_TYPE_DEFAULT, "%s Processed %{public}@ with %{public}d explicit and %{public}d implicit utterances", buf, 0x22u);
      }
      id v16 = v41;

      v10 = v50;
      id v5 = v51;
    }
  }
  else
  {
    id v17 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v64 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:]";
      __int16 v65 = 2114;
      id v66 = v4;
      _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s File path doesnt exist - %{public}@", buf, 0x16u);
    }
    id v16 = 0;
  }

  return v16;
}

- (id)_cleanupInvalidAudioFiles:(id)a3
{
  v63[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  char v53 = 0;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [v3 path];
  char v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    v63[0] = *MEMORY[0x263EFF750];
    char v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:1];
    id v52 = 0;
    int v9 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v8 options:0 error:&v52];
    id v10 = v52;

    if (v10)
    {
      id v11 = NSString;
      int v12 = [v10 localizedDescription];
      v13 = [v11 stringWithFormat:@"Failed reading contents of audioDir: %@, err: %@", v3, v12];

      id v14 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v55 = "-[SSRVoiceProfileStoreCleaner _cleanupInvalidAudioFiles:]";
        __int16 v56 = 2114;
        id v57 = v13;
        _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      id v15 = v10;
    }
    else
    {
      v43 = v9;
      id v44 = v3;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      obuint64_t j = v9;
      uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        id v19 = 0;
        uint64_t v20 = *(void *)v49;
        do
        {
          uint64_t v21 = 0;
          uint64_t v45 = v18;
          do
          {
            if (*(void *)v49 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void **)(*((void *)&v48 + 1) + 8 * v21);
            __int16 v23 = [v22 pathExtension];
            int v24 = [v23 isEqualToString:@"wav"];

            if (v24)
            {
              __int16 v25 = [v22 path];
              id v47 = v19;
              int v26 = v4;
              v27 = [v4 attributesOfItemAtPath:v25 error:&v47];
              id v28 = v47;

              unint64_t v29 = [v27 fileSize];
              if (v28 || !v29)
              {
                v41 = *MEMORY[0x263F38100];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315906;
                  long long v55 = "-[SSRVoiceProfileStoreCleaner _cleanupInvalidAudioFiles:]";
                  __int16 v56 = 2114;
                  id v57 = v22;
                  __int16 v58 = 2114;
                  id v59 = v28;
                  __int16 v60 = 2050;
                  unint64_t v61 = v29;
                  _os_log_error_impl(&dword_21C8A5000, v41, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get atrributes of file %{public}@, err %{public}@, size %{public}llu", buf, 0x2Au);
                }
                id v19 = v28;
              }
              else
              {
                uint64_t v30 = [v22 URLByDeletingPathExtension];
                uint64_t v31 = [v30 URLByAppendingPathExtension:@"json"];

                unint64_t v32 = [v31 path];
                int v33 = [v26 fileExistsAtPath:v32 isDirectory:&v53];

                v34 = @"n/a";
                if (v33)
                {
                  v34 = +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:v31];
                }
                char v35 = [(__CFString *)v34 isEqualToString:@"explicit"];
                if (!(v29 >> 13) && (v35 & 1) == 0)
                {
                  uint64_t v36 = [v22 path];
                  id v37 = +[SSRUtils removeItemAtPath:v36];

                  BOOL v38 = [v31 path];
                  id v39 = +[SSRUtils removeItemAtPath:v38];

                  id v40 = *MEMORY[0x263F38100];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    long long v55 = "-[SSRVoiceProfileStoreCleaner _cleanupInvalidAudioFiles:]";
                    __int16 v56 = 2114;
                    id v57 = v22;
                    __int16 v58 = 2114;
                    id v59 = v31;
                    _os_log_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid SAT entry: %{public}@ %{public}@", buf, 0x20u);
                  }
                }

                id v19 = 0;
              }
              id v4 = v26;
              uint64_t v18 = v45;
            }
            ++v21;
          }
          while (v18 != v21);
          uint64_t v18 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
        }
        while (v18);
      }
      else
      {
        id v19 = 0;
      }

      id v15 = v19;
      int v9 = v43;
      id v3 = v44;
    }
  }
  else
  {
    id v16 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v55 = "-[SSRVoiceProfileStoreCleaner _cleanupInvalidAudioFiles:]";
      __int16 v56 = 2114;
      id v57 = v3;
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s File path doesnt exist - %{public}@", buf, 0x16u);
    }
    id v15 = 0;
  }

  return v15;
}

- (id)_cleanupContentsOfSatFolder:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  unint64_t v3 = 0x264428000uLL;
  id v4 = [NSURL fileURLWithPath:a3];
  id v5 = +[SSRUtils getContentsOfDirectory:v4];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v30;
    *(void *)&long long v8 = 136315394;
    long long v26 = v8;
    uint64_t v27 = *(void *)v30;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "lastPathComponent", v26);
        id v14 = [*(id *)(v3 + 2112) stringForCSSpIdType:1];
        if ([v13 isEqualToString:v14]) {
          goto LABEL_11;
        }
        id v15 = [*(id *)(v3 + 2112) stringForCSSpIdType:3];
        if ([v13 isEqualToString:v15]) {
          goto LABEL_10;
        }
        id v16 = [*(id *)(v3 + 2112) stringForCSSpIdType:4];
        if ([v13 isEqualToString:v16])
        {

LABEL_10:
LABEL_11:

          goto LABEL_12;
        }
        [*(id *)(v3 + 2112) stringForCSSpIdType:5];
        uint64_t v17 = v9;
        id v18 = v6;
        v20 = unint64_t v19 = v3;
        char v28 = [v13 isEqualToString:v20];

        unint64_t v3 = v19;
        id v6 = v18;
        uint64_t v9 = v17;
        uint64_t v10 = v27;

        if ((v28 & 1) == 0
          && ([v13 containsString:@"enrollment_version.json"] & 1) == 0
          && ([v13 containsString:@"meta_version.json"] & 1) == 0
          && ([v13 containsString:@"enrollment_completed"] & 1) == 0
          && ([v13 containsString:@"enrollment_migrated"] & 1) == 0)
        {
          uint64_t v21 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v34 = "-[SSRVoiceProfileStoreCleaner _cleanupContentsOfSatFolder:]";
            __int16 v35 = 2114;
            uint64_t v36 = v12;
            _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid SAT entry: %{public}@", buf, 0x16u);
          }
          uint64_t v22 = *(void **)(v3 + 2112);
          id v14 = [v12 path];
          id v23 = (id)[v22 removeItemAtPath:v14];
          uint64_t v10 = v27;
          goto LABEL_11;
        }
LABEL_12:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v24 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
      uint64_t v9 = v24;
    }
    while (v24);
  }

  return 0;
}

- (id)_cleanupOrphanedMetafilesForProfile:(id)a3 payloadUtteranceLifeTimeInDays:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 voiceProfileIdentity];
  int v8 = [v6 voiceProfileVersion];
  uint64_t v9 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v10 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    int v12 = [v6 profileID];
    int v29 = 136315906;
    long long v30 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesForProfile:payloadUtteranceLifeTimeInDays:]";
    __int16 v31 = 2114;
    long long v32 = v12;
    __int16 v33 = 1026;
    int v34 = v8;
    __int16 v35 = 2114;
    uint64_t v36 = v7;
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Processing profile %{public}@ with version %{public}d and identity %{public}@", (uint8_t *)&v29, 0x26u);
  }
  if ([v6 voiceProfileVersion])
  {
    v13 = [v6 voiceProfileBasePath];
    id v14 = [(SSRVoiceProfileStoreCleaner *)self _cleanupContentsOfSatFolder:v13];

    if (v14) {
      id v15 = v14;
    }
    id v16 = [v6 voiceProfileAudioDirPathForSpidType:1];
    uint64_t v17 = [NSURL URLWithString:v16];
    id v18 = [(SSRVoiceProfileStoreCleaner *)self _cleanupOrphanedMetafilesAtURL:v17];

    if (v18)
    {
      id v19 = v18;

      id v14 = v19;
    }
    uint64_t v20 = [v6 voiceProfileAudioDirPathForSpidType:3];
    uint64_t v21 = [NSURL URLWithString:v20];
    uint64_t v22 = [(SSRVoiceProfileStoreCleaner *)self _cleanupOrphanedMetafilesAtURL:v21];

    if (v22)
    {
      id v23 = v22;

      id v14 = v23;
    }
    uint64_t v24 = [(SSRVoiceProfileStoreCleaner *)self _cleanupPayloadUtterancesFromProfile:v6 forModelType:3 exceedingLifeTimeInDays:a4];

    if (v24)
    {
      id v25 = v24;

      id v14 = v25;
    }
    id v26 = v14;
  }
  else
  {
    uint64_t v27 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315138;
      long long v30 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesForProfile:payloadUtteranceLifeTimeInDays:]";
      _os_log_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_DEFAULT, "%s Found legacy voice profile - Skipping", (uint8_t *)&v29, 0xCu);
    }
    id v26 = 0;
  }

  return v26;
}

- (id)_cleanupImplicitUtteranceCacheForProfile:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v3 = [a3 voiceProfileImplicitCacheDirPath];
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[SSRVoiceProfileStoreCleaner _cleanupImplicitUtteranceCacheForProfile:]";
    __int16 v9 = 2114;
    uint64_t v10 = v3;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Removing Implicit utterance cache directory at %{public}@", (uint8_t *)&v7, 0x16u);
  }
  id v5 = +[SSRUtils removeItemAtPath:v3];

  return v5;
}

- (id)_cleanuplanguageCodePath:(id)a3 forAppDomain:(id)a4
{
  v65[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v9 = *MEMORY[0x263EFF6A8];
  v65[0] = *MEMORY[0x263EFF750];
  v65[1] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:2];
  id v55 = 0;
  uint64_t v11 = [v8 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:v10 options:0 error:&v55];
  id v12 = v55;

  if (!v12)
  {
    id v47 = self;
    id v45 = v7;
    id v46 = v6;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v44 = v11;
    obuint64_t j = v11;
    uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (!v16)
    {
      id v12 = 0;
      goto LABEL_33;
    }
    uint64_t v17 = v16;
    uint64_t v18 = v9;
    id v12 = 0;
    uint64_t v19 = *(void *)v52;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v52 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v22 = (void *)*MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          id v23 = v22;
          uint64_t v24 = [v21 lastPathComponent];
          *(_DWORD *)buf = 136315394;
          __int16 v58 = "-[SSRVoiceProfileStoreCleaner _cleanuplanguageCodePath:forAppDomain:]";
          __int16 v59 = 2114;
          id v60 = v24;
          _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Processing profile - %{public}@", buf, 0x16u);
        }
        id v49 = 0;
        id v50 = 0;
        [v21 getResourceValue:&v50 forKey:v18 error:&v49];
        id v25 = v50;
        id v26 = v49;
        if (v26)
        {
          uint64_t v27 = v26;
          char v28 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v58 = "-[SSRVoiceProfileStoreCleaner _cleanuplanguageCodePath:forAppDomain:]";
            __int16 v59 = 2114;
            id v60 = v21;
            __int16 v61 = 2114;
            id v62 = v27;
            _os_log_error_impl(&dword_21C8A5000, v28, OS_LOG_TYPE_ERROR, "%s ERR: Failed determining if file is dir-entry url=%{public}@ with %{public}@", buf, 0x20u);
          }
          id v29 = v27;

          id v12 = v29;
        }
        else
        {
          if (v25)
          {
            id v29 = [v21 lastPathComponent];
            long long v30 = +[SSRVoiceProfileManager sharedInstance];
            __int16 v31 = [v30 voiceProfileForId:v29];

            if (v31)
            {
              long long v32 = v47;
              __int16 v33 = [(SSRVoiceProfileStoreCleaner *)v47 _cleanupOrphanedMetafilesForProfile:v31 payloadUtteranceLifeTimeInDays:180];
              int v34 = v33;
              if (v33)
              {
                id v35 = v33;

                id v12 = v35;
                long long v32 = v47;
              }
              uint64_t v36 = [(SSRVoiceProfileStoreCleaner *)v32 _cleanupImplicitUtteranceCacheForProfile:v31];

              if (v36)
              {
                id v37 = v36;

                id v12 = v37;
                goto LABEL_27;
              }
            }
            else
            {
              id v40 = *MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                __int16 v58 = "-[SSRVoiceProfileStoreCleaner _cleanuplanguageCodePath:forAppDomain:]";
                __int16 v59 = 2114;
                id v60 = v21;
                _os_log_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid profile %{public}@", buf, 0x16u);
              }
              id v37 = [v21 path];
              id v41 = +[SSRUtils removeItemAtPath:v37];
LABEL_27:
            }
            goto LABEL_29;
          }
          uint64_t v38 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v58 = "-[SSRVoiceProfileStoreCleaner _cleanuplanguageCodePath:forAppDomain:]";
            __int16 v59 = 2114;
            id v60 = v21;
            _os_log_impl(&dword_21C8A5000, v38, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid file %{public}@", buf, 0x16u);
          }
          id v29 = [v21 path];
          id v39 = +[SSRUtils removeItemAtPath:v29];
        }
LABEL_29:
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (!v17)
      {
LABEL_33:

        id v7 = v45;
        id v6 = v46;
        uint64_t v11 = v44;
        goto LABEL_34;
      }
    }
  }
  v13 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    id v14 = v13;
    id v15 = [v12 localizedDescription];
    *(_DWORD *)buf = 136315906;
    __int16 v58 = "-[SSRVoiceProfileStoreCleaner _cleanuplanguageCodePath:forAppDomain:]";
    __int16 v59 = 2114;
    id v60 = v7;
    __int16 v61 = 2114;
    id v62 = v6;
    __int16 v63 = 2114;
    v64 = v15;
    _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s ERR: Failed reading AppDomain %{public}@ at %{public}@ with %{public}@", buf, 0x2Au);
  }
LABEL_34:
  id v42 = v12;

  return v42;
}

- (id)_cleanupAppDomain:(id)a3
{
  v60[2] = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v4 = +[SSRVoiceProfileManager sharedInstance];
  id v5 = [v4 SSRBasePathForAppDomain:@"com.apple.siri"];

  id v42 = AFPreferencesSupportedLanguages();
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [NSURL fileURLWithPath:v5];
  uint64_t v8 = *MEMORY[0x263EFF6A8];
  v60[0] = *MEMORY[0x263EFF750];
  v60[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
  id v50 = 0;
  uint64_t v10 = [v6 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:v9 options:0 error:&v50];
  id v11 = v50;

  if (!v11)
  {
    uint64_t v38 = v10;
    id v39 = v5;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = v10;
    uint64_t v15 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (!v15)
    {
      id v11 = 0;
      goto LABEL_36;
    }
    uint64_t v16 = v15;
    id v40 = self;
    id v11 = 0;
    uint64_t v17 = *(void *)v47;
    while (1)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
        uint64_t v20 = (void *)*MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = v20;
          uint64_t v22 = [v19 lastPathComponent];
          *(_DWORD *)buf = 136315394;
          long long v53 = "-[SSRVoiceProfileStoreCleaner _cleanupAppDomain:]";
          __int16 v54 = 2114;
          id v55 = v22;
          _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s Processing locale - %{public}@", buf, 0x16u);
        }
        id v44 = 0;
        id v45 = 0;
        objc_msgSend(v19, "getResourceValue:forKey:error:", &v45, v8, &v44, v38, v39);
        id v23 = v45;
        id v24 = v44;
        if (v24)
        {
          id v25 = v24;
          id v26 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            long long v53 = "-[SSRVoiceProfileStoreCleaner _cleanupAppDomain:]";
            __int16 v54 = 2114;
            id v55 = v19;
            __int16 v56 = 2114;
            id v57 = v25;
            _os_log_error_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_ERROR, "%s ERR: Failed determining if file is dir-entry url=%{public}@ with %{public}@", buf, 0x20u);
          }
          id v27 = v25;

          id v11 = v27;
        }
        else
        {
          if (v23)
          {
            id v27 = [v19 lastPathComponent];
            char v28 = [MEMORY[0x263F380D0] getSiriLanguageWithFallback:0];
            if (v42
              && [v42 count]
              && v28
              && ([v27 isEqualToString:v28] & 1) == 0
              && ([v42 containsObject:v27] & 1) == 0)
            {
              __int16 v33 = *MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                long long v53 = "-[SSRVoiceProfileStoreCleaner _cleanupAppDomain:]";
                __int16 v54 = 2114;
                id v55 = v19;
                __int16 v56 = 2114;
                id v57 = v42;
                __int16 v58 = 2114;
                __int16 v59 = v28;
                _os_log_impl(&dword_21C8A5000, v33, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid locale %{public}@ not supported in set %{public}@ and current language %{public}@", buf, 0x2Au);
              }
              id v30 = [v19 path];
              id v34 = +[SSRUtils removeItemAtPath:v30];
LABEL_23:
            }
            else
            {
              id v29 = [(SSRVoiceProfileStoreCleaner *)v40 _cleanuplanguageCodePath:v19 forAppDomain:v41];
              if (v29)
              {
                id v30 = v29;

                id v11 = v30;
                goto LABEL_23;
              }
            }

            goto LABEL_28;
          }
          __int16 v31 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            long long v53 = "-[SSRVoiceProfileStoreCleaner _cleanupAppDomain:]";
            __int16 v54 = 2114;
            id v55 = v19;
            _os_log_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid file %{public}@", buf, 0x16u);
          }
          id v27 = [v19 path];
          id v32 = +[SSRUtils removeItemAtPath:v27];
        }
LABEL_28:

        ++v18;
      }
      while (v16 != v18);
      uint64_t v35 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      uint64_t v16 = v35;
      if (!v35)
      {
LABEL_36:

        uint64_t v10 = v38;
        id v5 = v39;
        goto LABEL_37;
      }
    }
  }
  id v12 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    id v14 = [v11 localizedDescription];
    *(_DWORD *)buf = 136315906;
    long long v53 = "-[SSRVoiceProfileStoreCleaner _cleanupAppDomain:]";
    __int16 v54 = 2114;
    id v55 = v41;
    __int16 v56 = 2114;
    id v57 = v5;
    __int16 v58 = 2114;
    __int16 v59 = v14;
    _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed reading AppDomain %{public}@ at %{public}@ with %{public}@", buf, 0x2Au);
  }
LABEL_37:
  id v36 = v11;

  return v36;
}

- (id)deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:(id)a3 appDomain:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (CSIsCommunalDevice())
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = +[SSRVoiceProfileStore sharedInstance];
    uint64_t v9 = [v8 userVoiceProfilesForAppDomain:v6 forLocale:v5];
    if ((unint64_t)[v9 count] < 2)
    {
      id v7 = 0;
    }
    else
    {
      id v26 = v6;
      id v27 = v5;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v25 = v9;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        id v7 = 0;
        v13 = (os_log_t *)MEMORY[0x263F38100];
        uint64_t v14 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v17 = [v16 getEnrollmentUtterancesForModelType:1];
            uint64_t v18 = v17;
            if (!v17 || ![v17 count])
            {
              uint64_t v19 = *v13;
              if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                __int16 v33 = "-[SSRVoiceProfileStoreCleaner deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:appDomain:]";
                __int16 v34 = 2114;
                uint64_t v35 = v16;
                _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s Found profile %{public}@ with no enrollment utts", buf, 0x16u);
              }
              uint64_t v20 = [v8 deleteUserVoiceProfile:v16];

              os_log_t v21 = *v13;
              if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v22 = v21;
                id v23 = [v20 localizedDescription];
                *(_DWORD *)buf = 136315394;
                __int16 v33 = "-[SSRVoiceProfileStoreCleaner deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:appDomain:]";
                __int16 v34 = 2114;
                uint64_t v35 = v23;
                _os_log_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_DEFAULT, "%s Deleted voiceprofile with error %{public}@", buf, 0x16u);
              }
              id v7 = v20;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v12);
      }
      else
      {
        id v7 = 0;
      }

      id v6 = v26;
      id v5 = v27;
      uint64_t v9 = v25;
    }
  }

  return v7;
}

- (id)cleanupProfileStore
{
  v61[2] = *MEMORY[0x263EF8340];
  id v2 = +[SSRVoiceProfileManager sharedInstance];
  uint64_t v38 = [v2 provisionedVoiceProfilesForAppDomain:0 withLocale:0];

  unint64_t v3 = +[SSRVoiceProfileManager sharedInstance];
  id v39 = [v3 SSRSpeakerProfilesBasePath];

  id v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v39];

  if ((v5 & 1) == 0)
  {
    v13 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v39;
      _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s File path doesnt exist - %{public}@", buf, 0x16u);
    }
    id v12 = 0;
    goto LABEL_38;
  }
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [NSURL fileURLWithPath:v39];
  uint64_t v8 = *MEMORY[0x263EFF6A8];
  v61[0] = *MEMORY[0x263EFF750];
  v61[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
  id v49 = 0;
  uint64_t v37 = [v6 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:v9 options:0 error:&v49];
  id v10 = v49;

  if (!v10)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v58 = __Block_byref_object_copy__3950;
    __int16 v59 = __Block_byref_object_dispose__3951;
    id v60 = (id)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:5];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __50__SSRVoiceProfileStoreCleaner_cleanupProfileStore__block_invoke;
    v48[3] = &unk_264429460;
    v48[4] = buf;
    [v38 enumerateObjectsUsingBlock:v48];
    uint64_t v14 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void **)(*(void *)&buf[8] + 40);
      *(_DWORD *)id v50 = 136315394;
      long long v51 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
      __int16 v52 = 2114;
      long long v53 = v15;
      _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s App domains in use - %{public}@", v50, 0x16u);
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v16 = v37;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (!v17)
    {
      id v41 = 0;
      goto LABEL_36;
    }
    id v41 = 0;
    uint64_t v18 = *(void *)v45;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v42 = 0;
        id v43 = 0;
        [v20 getResourceValue:&v43 forKey:v8 error:&v42];
        id v21 = v43;
        id v22 = v42;
        if (v22)
        {
          id v23 = v22;
          id v24 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v50 = 136315650;
            long long v51 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
            __int16 v52 = 2114;
            long long v53 = v20;
            __int16 v54 = 2114;
            id v55 = v23;
            _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s ERR: Failed determining if file is dir-entry url=%{public}@ with %{public}@", v50, 0x20u);
          }
        }
        else if (v21)
        {
          id v23 = [v20 lastPathComponent];
          char v25 = [*(id *)(*(void *)&buf[8] + 40) containsObject:v23];
          id v26 = *MEMORY[0x263F38100];
          BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT);
          if ((v25 & 1) == 0)
          {
            if (v27)
            {
              id v32 = *(void **)(*(void *)&buf[8] + 40);
              *(_DWORD *)id v50 = 136315650;
              long long v51 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
              __int16 v52 = 2114;
              long long v53 = v20;
              __int16 v54 = 2114;
              id v55 = v32;
              _os_log_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid domain %{public}@ not part of domains %{public}@", v50, 0x20u);
            }
            id v29 = [v20 path];
            id v33 = +[SSRUtils removeItemAtPath:v29];
            goto LABEL_31;
          }
          if (v27)
          {
            *(_DWORD *)id v50 = 136315394;
            long long v51 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
            __int16 v52 = 2114;
            long long v53 = v23;
            _os_log_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_DEFAULT, "%s Processing domain - %{public}@", v50, 0x16u);
          }
          long long v28 = [(SSRVoiceProfileStoreCleaner *)self _cleanupAppDomain:v23];
          if (v28)
          {
            id v29 = v28;

            id v41 = v29;
LABEL_31:
          }
        }
        else
        {
          long long v30 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v50 = 136315394;
            long long v51 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
            __int16 v52 = 2114;
            long long v53 = v20;
            _os_log_impl(&dword_21C8A5000, v30, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid file %{public}@", v50, 0x16u);
          }
          id v23 = [v20 path];
          id v31 = +[SSRUtils removeItemAtPath:v23];
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (!v17)
      {
LABEL_36:

        id v12 = v41;
        _Block_object_dispose(buf, 8);

        goto LABEL_37;
      }
    }
  }
  uint64_t v11 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    uint64_t v35 = v11;
    id v36 = [v10 localizedDescription];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v39;
    *(_WORD *)&buf[22] = 2114;
    __int16 v58 = v36;
    _os_log_error_impl(&dword_21C8A5000, v35, OS_LOG_TYPE_ERROR, "%s ERR: Failed reading contents of SAT root %{public}@ with %{public}@", buf, 0x20u);
  }
  id v12 = v10;
LABEL_37:

LABEL_38:

  return v12;
}

void __50__SSRVoiceProfileStoreCleaner_cleanupProfileStore__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 appDomain];

  if (v4)
  {
    char v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = [v3 appDomain];

    [v5 addObject:v8];
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"ERR: Failed to get appdomain for profile %@", v3];

    id v7 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]_block_invoke";
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
  }
}

- (id)filterInvalidSiriProfilesFrom:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v17 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_4];
  uint64_t v18 = v3;
  id v4 = objc_msgSend(v3, "filteredArrayUsingPredicate:");
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = v4;
  obuint64_t j = [v4 reverseObjectEnumerator];
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    uint64_t v9 = (os_log_t *)MEMORY[0x263F38100];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          BOOL v27 = "-[SSRVoiceProfileStoreCleaner filterInvalidSiriProfilesFrom:]";
          __int16 v28 = 2114;
          uint64_t v29 = v11;
          _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Processing onboarded Siri user: %{public}@", buf, 0x16u);
        }
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __61__SSRVoiceProfileStoreCleaner_filterInvalidSiriProfilesFrom___block_invoke_6;
        v20[3] = &unk_264429438;
        v20[4] = v11;
        id v21 = v5;
        +[SSRUtils getHomeUserIdForVoiceProfile:v11 withCompletion:v20];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v7);
  }

  if ([v5 count]) {
    uint64_t v13 = v5;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  return v14;
}

void __61__SSRVoiceProfileStoreCleaner_filterInvalidSiriProfilesFrom___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!a2)
  {
    uint64_t v7 = [v5 domain];
    if ([v7 isEqualToString:@"kAFAssistantErrorDomain"])
    {
      if ([v6 code] == 6001)
      {
      }
      else
      {
        uint64_t v8 = [v6 code];

        if (v8 != 6002) {
          goto LABEL_10;
        }
      }
      uint64_t v9 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 136315394;
        id v12 = "-[SSRVoiceProfileStoreCleaner filterInvalidSiriProfilesFrom:]_block_invoke";
        __int16 v13 = 2114;
        uint64_t v14 = v10;
        _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Detected invalid user: %{public}@", (uint8_t *)&v11, 0x16u);
      }
      [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
    }
    else
    {
    }
  }
LABEL_10:
}

uint64_t __61__SSRVoiceProfileStoreCleaner_filterInvalidSiriProfilesFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 appDomain];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.siri"];

  return v3;
}

- (id)filterDuplicatedSiriProfilesFrom:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v3 = a3;
  __int16 v52 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_3971];
  long long v53 = v3;
  id v4 = objc_msgSend(v3, "filteredArrayUsingPredicate:");
  id v54 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obuint64_t j = v4;
  uint64_t v56 = [obj countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (!v56) {
    goto LABEL_47;
  }
  id v5 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v55 = *(void *)v69;
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v69 != v55) {
        objc_enumerationMutation(obj);
      }
      uint64_t v58 = v6;
      uint64_t v7 = *(void **)(*((void *)&v68 + 1) + 8 * v6);
      uint64_t v8 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v73 = "-[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:]";
        __int16 v74 = 2114;
        *(void *)v75 = v7;
        _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Processing onboarded Siri user: %{public}@", buf, 0x16u);
      }
      id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v9 = obj;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v64 objects:v79 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v65 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            uint64_t v15 = [v7 locale];
            id v16 = [v14 locale];
            int v17 = [v15 isEqualToString:v16];

            if ((CSIsCommunalDevice() & 1) == 0)
            {
              if ((v17 & 1) == 0) {
                continue;
              }
LABEL_17:
              [v59 addObject:v14];
              continue;
            }
            uint64_t v18 = [v7 siriProfileId];
            uint64_t v19 = [v14 siriProfileId];
            int v20 = [v18 isEqualToString:v19];

            if ((v17 & v20) == 1) {
              goto LABEL_17;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v64 objects:v79 count:16];
        }
        while (v11);
      }

      unint64_t v21 = [v59 count];
      id v5 = (os_log_t *)MEMORY[0x263F38100];
      if (v21 >= 2)
      {
        long long v22 = (void *)*MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          long long v23 = v22;
          int v24 = [v59 count];
          *(_DWORD *)buf = 136315650;
          v73 = "-[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:]";
          __int16 v74 = 1026;
          *(_DWORD *)v75 = v24;
          *(_WORD *)&v75[4] = 2114;
          *(void *)&v75[6] = v59;
          _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Detected matching %{public}d users: %{public}@", buf, 0x1Cu);
        }
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v25 = v59;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v60 objects:v78 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v61;
LABEL_25:
          uint64_t v29 = 0;
          while (1)
          {
            if (*(void *)v61 != v28) {
              objc_enumerationMutation(v25);
            }
            long long v30 = *(void **)(*((void *)&v60 + 1) + 8 * v29);
            if ([v30 isMarkedSATEnrolled])
            {
              uint64_t v31 = [v30 getExplicitEnrollmentUtterancesForType:1];
              unint64_t v32 = [v31 count];

              if (v32 > 3) {
                break;
              }
            }
            if (v27 == ++v29)
            {
              uint64_t v27 = [v25 countByEnumeratingWithState:&v60 objects:v78 count:16];
              if (v27) {
                goto LABEL_25;
              }
              goto LABEL_32;
            }
          }
          id v33 = v30;

          if (v33) {
            goto LABEL_38;
          }
        }
        else
        {
LABEL_32:
        }
        id v33 = [v25 objectAtIndexedSubscript:0];
        os_log_t v34 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = v34;
          id v36 = [v7 locale];
          uint64_t v37 = [v7 siriProfileId];
          uint64_t v38 = (void *)v37;
          *(_DWORD *)buf = 136315906;
          id v39 = @"Primary";
          if (v37) {
            id v39 = (__CFString *)v37;
          }
          v73 = "-[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:]";
          __int16 v74 = 2114;
          *(void *)v75 = v36;
          *(_WORD *)&v75[8] = 2114;
          *(void *)&v75[10] = v39;
          __int16 v76 = 2114;
          id v77 = v33;
          _os_log_impl(&dword_21C8A5000, v35, OS_LOG_TYPE_DEFAULT, "%s Valid profile not found %{public}@ and %{public}@ - defaulting to %{public}@", buf, 0x2Au);
        }
LABEL_38:
        id v40 = [v33 profileID];
        id v41 = [v7 profileID];
        char v42 = [v40 isEqualToString:v41];

        os_log_t v43 = *v5;
        BOOL v44 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
        if (v42)
        {
          if (v44)
          {
            long long v45 = v43;
            long long v46 = [v7 profileID];
            *(_DWORD *)buf = 136315394;
            v73 = "-[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:]";
            __int16 v74 = 2114;
            *(void *)v75 = v46;
            _os_log_impl(&dword_21C8A5000, v45, OS_LOG_TYPE_DEFAULT, "%s Skipping retaining user %{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (v44)
          {
            long long v47 = v43;
            long long v48 = [v7 profileID];
            *(_DWORD *)buf = 136315394;
            v73 = "-[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:]";
            __int16 v74 = 2114;
            *(void *)v75 = v48;
            _os_log_impl(&dword_21C8A5000, v47, OS_LOG_TYPE_DEFAULT, "%s Adding invalid user for deletion - %{public}@", buf, 0x16u);
          }
          [v54 addObject:v7];
        }
      }
      uint64_t v6 = v58 + 1;
    }
    while (v58 + 1 != v56);
    uint64_t v56 = [v9 countByEnumeratingWithState:&v68 objects:v80 count:16];
  }
  while (v56);
LABEL_47:

  if ([v54 count]) {
    id v49 = v54;
  }
  else {
    id v49 = 0;
  }
  id v50 = v49;

  return v50;
}

uint64_t __64__SSRVoiceProfileStoreCleaner_filterDuplicatedSiriProfilesFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 appDomain];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.siri"];

  return v3;
}

@end