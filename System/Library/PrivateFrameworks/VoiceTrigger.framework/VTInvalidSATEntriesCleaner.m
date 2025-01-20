@interface VTInvalidSATEntriesCleaner
+ (id)cleanupInvalidSATEntriesAtSATRoot:(id)a3 payloadUtteranceLifeTimeInDays:(int64_t)a4 dryRun:(BOOL)a5;
+ (id)cleanupOrphanedMetafilesAtURL:(id)a3 dryRun:(BOOL)a4;
+ (id)cleanupOrphanedMetafilesForLanguage:(id)a3 payloadUtteranceLifeTimeInDays:(int64_t)a4 dryRun:(BOOL)a5;
+ (id)cleanupPayloadUtterancesExceedingLifeTimeInDays:(int64_t)a3 forType:(unint64_t)a4 forLanguageCode:(id)a5 dryRun:(BOOL)a6;
@end

@implementation VTInvalidSATEntriesCleaner

+ (id)cleanupPayloadUtterancesExceedingLifeTimeInDays:(int64_t)a3 forType:(unint64_t)a4 forLanguageCode:(id)a5 dryRun:(BOOL)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a5;
  v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)a3 * -86400.0];
  v11 = VTLogContextFacilityVoiceTrigger;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      __int16 v18 = 2114;
      id v19 = v9;
      __int16 v20 = 1024;
      int v21 = a4;
      _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "Checking payload utterances prior to %{public}@ for language %{public}@ and modelType %d", buf, 0x1Cu);
    }
    v12 = +[VTSpeakerIdUtilities getImplicitEnrollmentUtterancesPriorTo:v10 forType:a4 forLanguageCode:v9];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __109__VTInvalidSATEntriesCleaner_cleanupPayloadUtterancesExceedingLifeTimeInDays_forType_forLanguageCode_dryRun___block_invoke;
    v14[3] = &__block_descriptor_33_e25_v32__0__NSString_8Q16_B24l;
    BOOL v15 = a6;
    [v12 enumerateObjectsUsingBlock:v14];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21844F000, v11, OS_LOG_TYPE_ERROR, "ERR: obsoleteCutOffDate is nil - Bailing out", buf, 2u);
    }
    v12 = 0;
  }

  return v12;
}

void __109__VTInvalidSATEntriesCleaner_cleanupPayloadUtterancesExceedingLifeTimeInDays_forType_forLanguageCode_dryRun___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 32))
  {
    v4 = [MEMORY[0x263F08850] defaultManager];
    id v13 = 0;
    [v4 removeItemAtPath:v3 error:&v13];
    id v5 = v13;

    v6 = VTLogContextFacilityVoiceTrigger;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v15 = v3;
        __int16 v16 = 2114;
        id v17 = v5;
        _os_log_error_impl(&dword_21844F000, v6, OS_LOG_TYPE_ERROR, "ERR: Failed deleting %{public}@ with error %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v3;
      _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "Deleted lifetimeexpired SAT entry %{public}@", buf, 0xCu);
    }

    v7 = [v3 stringByDeletingPathExtension];
    v8 = [v7 stringByAppendingPathExtension:@"json"];

    id v9 = [MEMORY[0x263F08850] defaultManager];
    id v12 = 0;
    [v9 removeItemAtPath:v8 error:&v12];
    id v10 = v12;

    v11 = VTLogContextFacilityVoiceTrigger;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v15 = v8;
        __int16 v16 = 2114;
        id v17 = v10;
        _os_log_error_impl(&dword_21844F000, v11, OS_LOG_TYPE_ERROR, "ERR: Failed deleting %{public}@ with error %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "Deleted lifetimeexpired metafile %{public}@", buf, 0xCu);
    }
  }
}

+ (id)cleanupOrphanedMetafilesAtURL:(id)a3 dryRun:(BOOL)a4
{
  v62[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F08850] defaultManager];
  v62[0] = *MEMORY[0x263EFF750];
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:1];
  id v54 = 0;
  v41 = v6;
  v8 = [v6 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v7 options:0 error:&v54];
  id v9 = v54;

  if (v9)
  {
    id v10 = [NSString stringWithFormat:@"Error reading contents of audioDir: %@, err: %@", v5, v9];
    v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v56 = v10;
      _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    id v61 = v10;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
    goto LABEL_39;
  }
  BOOL v42 = a4;
  id v40 = v5;
  id v13 = [MEMORY[0x263EFF9A0] dictionary];
  v44 = [@"meta_version.json" stringByDeletingPathExtension];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v39 = v8;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        __int16 v20 = [v19 absoluteString];
        int v21 = [v20 lastPathComponent];
        uint64_t v22 = [v21 stringByDeletingPathExtension];

        if ([v22 compare:@"enrollment_completed"]
          && ([v22 isEqualToString:v44] & 1) == 0)
        {
          v23 = [v13 objectForKeyedSubscript:v22];

          if (v23) {
            [v13 removeObjectForKey:v22];
          }
          else {
            [v13 setObject:v19 forKeyedSubscript:v22];
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v16);
  }

  id v12 = [MEMORY[0x263EFF980] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v10 = v13;
  uint64_t v24 = [v10 countByEnumeratingWithState:&v46 objects:v59 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    v43 = 0;
    uint64_t v26 = *(void *)v47;
    while (1)
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v47 != v26) {
          objc_enumerationMutation(v10);
        }
        v29 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        v30 = [v10 objectForKeyedSubscript:v29];
        v31 = [v30 pathExtension];
        uint64_t v32 = [v31 compare:@"json"];

        v33 = VTLogContextFacilityVoiceTrigger;
        BOOL v34 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
        if (v32)
        {
          if (v34)
          {
            *(_DWORD *)buf = 138543362;
            id v56 = v30;
            _os_log_impl(&dword_21844F000, v33, OS_LOG_TYPE_DEFAULT, "Found non-meta file: %{public}@", buf, 0xCu);
          }
          v28 = [NSString stringWithFormat:@"Found non meta-file: %@", v30];
LABEL_22:
          [v12 addObject:v28];

          goto LABEL_23;
        }
        if (v34)
        {
          *(_DWORD *)buf = 138543618;
          id v56 = v29;
          __int16 v57 = 2114;
          id v58 = v30;
          _os_log_impl(&dword_21844F000, v33, OS_LOG_TYPE_DEFAULT, "Deleting invalid SAT entry: %{public}@ : <%{public}@>", buf, 0x16u);
        }
        v35 = [v30 absoluteString];
        [v12 addObject:v35];

        if (!v42)
        {
          id v45 = v43;
          [v41 removeItemAtURL:v30 error:&v45];
          id v36 = v45;

          if (v36)
          {
            v37 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v56 = v30;
              __int16 v57 = 2114;
              id v58 = v36;
              _os_log_impl(&dword_21844F000, v37, OS_LOG_TYPE_DEFAULT, "Error deleting entry: %{public}@:%{public}@", buf, 0x16u);
            }
            v28 = [NSString stringWithFormat:@"Error deleting entry: %@:%@", v30, v36];
            v43 = v36;
            goto LABEL_22;
          }
          v43 = 0;
        }
LABEL_23:
      }
      uint64_t v25 = [v10 countByEnumeratingWithState:&v46 objects:v59 count:16];
      if (!v25) {
        goto LABEL_38;
      }
    }
  }
  v43 = 0;
LABEL_38:

  v8 = v39;
  id v5 = v40;
  id v9 = v43;
LABEL_39:

  return v12;
}

+ (id)cleanupOrphanedMetafilesForLanguage:(id)a3 payloadUtteranceLifeTimeInDays:(int64_t)a4 dryRun:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [MEMORY[0x263EFF980] array];
  id v10 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v8;
    _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "Processing lang_dir: %{public}@", buf, 0xCu);
  }
  uint64_t v25 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:1 forLanguageCode:v8];
  v11 = objc_msgSend(NSURL, "URLWithString:");
  uint64_t v12 = [a1 cleanupOrphanedMetafilesAtURL:v11 dryRun:v5];

  if (v12) {
    [v9 addObjectsFromArray:v12];
  }
  uint64_t v24 = (void *)v12;
  v23 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:3 forLanguageCode:v8];
  id v13 = objc_msgSend(NSURL, "URLWithString:");
  id v14 = [a1 cleanupOrphanedMetafilesAtURL:v13 dryRun:v5];

  if (v14) {
    [v9 addObjectsFromArray:v14];
  }
  int64_t v15 = a4;
  uint64_t v16 = [a1 cleanupPayloadUtterancesExceedingLifeTimeInDays:a4 forType:3 forLanguageCode:v8 dryRun:v5];
  if (v16) {
    [v9 addObjectsFromArray:v16];
  }
  uint64_t v17 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:2 forLanguageCode:v8];
  uint64_t v18 = [NSURL URLWithString:v17];
  id v19 = [a1 cleanupOrphanedMetafilesAtURL:v18 dryRun:v5];

  if (v19) {
    [v9 addObjectsFromArray:v19];
  }
  __int16 v20 = [a1 cleanupPayloadUtterancesExceedingLifeTimeInDays:v15 forType:2 forLanguageCode:v8 dryRun:v5];
  if (v20) {
    [v9 addObjectsFromArray:v20];
  }
  int v21 = (void *)[v9 copy];

  return v21;
}

+ (id)cleanupInvalidSATEntriesAtSATRoot:(id)a3 payloadUtteranceLifeTimeInDays:(int64_t)a4 dryRun:(BOOL)a5
{
  BOOL v5 = a5;
  v48[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v9 = *MEMORY[0x263EFF6A8];
  v48[0] = *MEMORY[0x263EFF750];
  v48[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
  id v42 = 0;
  uint64_t v32 = v8;
  v11 = [v8 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:v10 options:0 error:&v42];
  id v12 = v42;

  if (v12)
  {
    id v13 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v45 = v7;
      __int16 v46 = 2114;
      id v47 = v12;
      _os_log_impl(&dword_21844F000, v13, OS_LOG_TYPE_DEFAULT, "Error reading contents of SAT root: %{public}@: err: %{public}@", buf, 0x16u);
    }
    id v14 = 0;
    goto LABEL_32;
  }
  int64_t v33 = a4;
  id v31 = v7;
  id v14 = [MEMORY[0x263EFF980] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v30 = v11;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    BOOL v34 = v5;
    id v12 = 0;
    uint64_t v18 = *(void *)v39;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        __int16 v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v36 = 0;
        id v37 = 0;
        [v20 getResourceValue:&v37 forKey:v9 error:&v36];
        id v21 = v37;
        id v22 = v36;

        if (v22)
        {
          v23 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v45 = v20;
            __int16 v46 = 2114;
            id v47 = v22;
            _os_log_impl(&dword_21844F000, v23, OS_LOG_TYPE_DEFAULT, "Error determining if file is dir-entry: url=%{public}@, err=%{public}@", buf, 0x16u);
          }
          uint64_t v24 = [NSString stringWithFormat:@"Error determining if file is a dir: url: %@, err: %@", v20, v22];
          [v14 addObject:v24];

LABEL_17:
          id v12 = 0;
LABEL_18:

          goto LABEL_10;
        }
        if ([v21 BOOLValue])
        {
          uint64_t v25 = [v20 lastPathComponent];
          id v22 = +[VTInvalidSATEntriesCleaner cleanupOrphanedMetafilesForLanguage:v25 payloadUtteranceLifeTimeInDays:v33 dryRun:v34];

          if (v22) {
            [v14 addObjectsFromArray:v22];
          }
          goto LABEL_17;
        }
        uint64_t v26 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v45 = v20;
          _os_log_impl(&dword_21844F000, v26, OS_LOG_TYPE_DEFAULT, "Deleting invalid SAT file-entry: %{public}@", buf, 0xCu);
        }
        id v27 = [v20 absoluteString];
        [v14 addObject:v27];

        if (v34)
        {
          id v12 = 0;
          goto LABEL_10;
        }
        id v35 = 0;
        [v32 removeItemAtURL:v20 error:&v35];
        id v12 = v35;
        if (v12)
        {
          uint64_t v28 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v45 = v20;
            __int16 v46 = 2114;
            id v47 = v12;
            _os_log_impl(&dword_21844F000, v28, OS_LOG_TYPE_DEFAULT, "Error deleting invalid SAT file-entry=%{public}@, err=%{public}@", buf, 0x16u);
          }
          id v22 = [NSString stringWithFormat:@"Error deleting invalid SAT file-entry: url: %@, err: %@", v20, v12];
          [v14 addObject:v22];
          goto LABEL_18;
        }
LABEL_10:
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (!v17) {
        goto LABEL_31;
      }
    }
  }
  id v12 = 0;
LABEL_31:

  v11 = v30;
  id v7 = v31;
LABEL_32:

  return v14;
}

@end