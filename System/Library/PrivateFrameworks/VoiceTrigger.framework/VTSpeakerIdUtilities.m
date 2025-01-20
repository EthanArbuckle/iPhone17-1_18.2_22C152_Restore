@interface VTSpeakerIdUtilities
+ (BOOL)deleteExistingSATModelForLanguageCode:(id)a3;
+ (id)_getAssetHashFromConfigPath:(id)a3;
+ (id)createSATDirectoriesForType:(unint64_t)a3 forLanguageCode:(id)a4;
+ (id)getExplicitEnrollmentUtterancesForType:(unint64_t)a3 forLanguageCode:(id)a4;
+ (id)getImplicitEnrollmentUtterancesPriorTo:(id)a3 forType:(unint64_t)a4 forLanguageCode:(id)a5;
+ (id)getProfileVersionFilePathForLanguageCode:(id)a3;
+ (id)getSATAudioDirectoryForType:(unint64_t)a3 forLanguageCode:(id)a4;
+ (id)getSATDirectoryForLanguageCode:(id)a3;
+ (id)getSATDirectoryForModelType:(unint64_t)a3 forLanguageCode:(id)a4;
+ (id)getSATModelDirectoryForType:(unint64_t)a3 forLanguageCode:(id)a4;
+ (id)getSortedEnrollmentUtterancesForType:(unint64_t)a3 forLanguageCode:(id)a4;
+ (id)getSortedImplicitEnrollmentUtterancesForType:(unint64_t)a3 forLanguageCode:(id)a4;
+ (id)getSpeakerModelPathForType:(unint64_t)a3 withLanguageCode:(id)a4 withConfigPath:(id)a5 createDirectory:(BOOL)a6;
+ (id)stringForVTSpIdType:(unint64_t)a3;
+ (id)timeStampWithSaltGrain;
@end

@implementation VTSpeakerIdUtilities

+ (BOOL)deleteExistingSATModelForLanguageCode:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[VTSpeakerIdUtilities getSATModelDirectoryForType:1 forLanguageCode:v3];
  if ([v4 isEqualToString:@"/tmp"])
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v4;
      v6 = "ERR: trying to remove %@ directory, bailing out";
LABEL_27:
      _os_log_error_impl(&dword_21844F000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
      BOOL v30 = 0;
      goto LABEL_25;
    }
LABEL_21:
    BOOL v30 = 0;
    goto LABEL_25;
  }
  if (!v4)
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v3;
      v6 = "ERR: satTDModelDirector is nil for LanguageCode %@";
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  unint64_t v7 = 0x263F08000uLL;
  v8 = [MEMORY[0x263F08850] defaultManager];
  int v9 = [v8 fileExistsAtPath:v4 isDirectory:0];

  if (v9)
  {
    v10 = [MEMORY[0x263F08850] defaultManager];
    id v40 = 0;
    v11 = [v10 contentsOfDirectoryAtPath:v4 error:&v40];
    id v12 = v40;

    if (!v12 && v11)
    {
      v32 = v11;
      id v33 = v3;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v37;
        p_superclass = VTFirstUnlockMonitor.superclass;
        do
        {
          uint64_t v18 = 0;
          uint64_t v34 = v15;
          do
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(v13);
            }
            if (*(void *)(*((void *)&v36 + 1) + 8 * v18))
            {
              v19 = objc_msgSend(v4, "stringByAppendingPathComponent:");
              v20 = [*(id *)(v7 + 2128) defaultManager];
              id v35 = 0;
              [v20 removeItemAtPath:v19 error:&v35];
              id v21 = v35;

              if (v21)
              {
                v22 = p_superclass[244];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  v23 = v22;
                  [v21 localizedDescription];
                  uint64_t v24 = v16;
                  id v25 = v13;
                  v26 = v4;
                  unint64_t v27 = v7;
                  v29 = v28 = p_superclass;
                  *(_DWORD *)buf = 138543618;
                  id v42 = v19;
                  __int16 v43 = 2114;
                  v44 = v29;
                  _os_log_impl(&dword_21844F000, v23, OS_LOG_TYPE_DEFAULT, "Couldn't delete invalidated speaker model at path %{public}@ %{public}@", buf, 0x16u);

                  p_superclass = v28;
                  unint64_t v7 = v27;
                  v4 = v26;
                  id v13 = v25;
                  uint64_t v16 = v24;
                  uint64_t v15 = v34;
                }
              }
            }
            ++v18;
          }
          while (v15 != v18);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v45 count:16];
        }
        while (v15);
      }

      v11 = v32;
      id v3 = v33;
      id v12 = 0;
    }
  }
  BOOL v30 = 1;
LABEL_25:

  return v30;
}

+ (id)timeStampWithSaltGrain
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  id v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd"];
  v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)arc4random_uniform(7u) * -86400.0];
  v5 = [v2 stringFromDate:v4];

  return v5;
}

+ (id)getSortedEnrollmentUtterancesForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  id v5 = a4;
  v6 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:a3 forLanguageCode:v5];
  unint64_t v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [v7 contentsOfDirectoryAtPath:v6 error:0];

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__603;
  uint64_t v24 = __Block_byref_object_dispose__604;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count") + 1);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __77__VTSpeakerIdUtilities_getSortedEnrollmentUtterancesForType_forLanguageCode___block_invoke;
  v17 = &unk_264325360;
  id v9 = v6;
  id v18 = v9;
  v19 = &v20;
  [v8 enumerateObjectsUsingBlock:&v14];
  v10 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"self ENDSWITH '.wav'", v14, v15, v16, v17);
  v11 = [(id)v21[5] filteredArrayUsingPredicate:v10];
  id v12 = [v11 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  _Block_object_dispose(&v20, 8);

  return v12;
}

void __77__VTSpeakerIdUtilities_getSortedEnrollmentUtterancesForType_forLanguageCode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
}

+ (id)getImplicitEnrollmentUtterancesPriorTo:(id)a3 forType:(unint64_t)a4 forLanguageCode:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    id v9 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:a4 forLanguageCode:v8];
    if (v9)
    {
      v10 = [MEMORY[0x263F08850] defaultManager];
      id v30 = 0;
      v11 = [v10 contentsOfDirectoryAtPath:v9 error:&v30];
      id v12 = v30;

      *(void *)buf = 0;
      id v25 = buf;
      uint64_t v26 = 0x3032000000;
      unint64_t v27 = __Block_byref_object_copy__603;
      v28 = __Block_byref_object_dispose__604;
      objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count") + 1);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __87__VTSpeakerIdUtilities_getImplicitEnrollmentUtterancesPriorTo_forType_forLanguageCode___block_invoke;
      v21[3] = &unk_264325360;
      id v22 = v9;
      v23 = buf;
      [v11 enumerateObjectsUsingBlock:v21];
      id v13 = (void *)MEMORY[0x263F08A98];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __87__VTSpeakerIdUtilities_getImplicitEnrollmentUtterancesPriorTo_forType_forLanguageCode___block_invoke_2;
      v19[3] = &unk_2643253C8;
      id v20 = v7;
      uint64_t v14 = [v13 predicateWithBlock:v19];
      uint64_t v15 = [*((id *)v25 + 5) filteredArrayUsingPredicate:v14];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v17 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21844F000, v17, OS_LOG_TYPE_ERROR, "ERR: satAudioDirectory is nil - Bailing out", buf, 2u);
      }
      id v12 = 0;
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v16 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21844F000, v16, OS_LOG_TYPE_ERROR, "ERR: date is nil - Bailing out", buf, 2u);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

void __87__VTSpeakerIdUtilities_getImplicitEnrollmentUtterancesPriorTo_forType_forLanguageCode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
}

uint64_t __87__VTSpeakerIdUtilities_getImplicitEnrollmentUtterancesPriorTo_forType_forLanguageCode___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 pathExtension];
  int v5 = [v4 isEqualToString:@"wav"];

  if (!v5) {
    goto LABEL_10;
  }
  v6 = [v3 stringByDeletingPathExtension];
  id v7 = [v6 stringByAppendingPathExtension:@"json"];

  id v8 = [NSURL URLWithString:v7];
  id v9 = +[VTUtteranceMetadataManager recordedTimeStampOfFile:v8];

  v10 = [NSURL URLWithString:v7];
  if (!+[VTUtteranceMetadataManager isUtteranceImplicitlyTrained:v10]|| !v9)
  {

    goto LABEL_9;
  }
  [v9 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v12 = v11;

  if (v12 >= 0.0)
  {
LABEL_9:

LABEL_10:
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  id v13 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    v17 = v7;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_21844F000, v13, OS_LOG_TYPE_DEFAULT, "Filtered %@ with enrolled date %@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

+ (id)getSortedImplicitEnrollmentUtterancesForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  id v5 = a4;
  v6 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:a3 forLanguageCode:v5];
  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v25 = 0;
  id v8 = [v7 contentsOfDirectoryAtPath:v6 error:&v25];
  id v9 = v25;

  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__603;
  v23 = __Block_byref_object_dispose__604;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count") + 1);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count") + 1);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __85__VTSpeakerIdUtilities_getSortedImplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke;
  v16[3] = &unk_264325360;
  id v11 = v6;
  id v17 = v11;
  __int16 v18 = &v19;
  [v8 enumerateObjectsUsingBlock:v16];
  double v12 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_45];
  id v13 = [(id)v20[5] filteredArrayUsingPredicate:v12];

  uint64_t v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_48];

  _Block_object_dispose(&v19, 8);

  return v14;
}

void __85__VTSpeakerIdUtilities_getSortedImplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
}

uint64_t __85__VTSpeakerIdUtilities_getSortedImplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [NSURL URLWithString:v4];
  id v7 = +[VTUtteranceMetadataManager recordedTimeStampOfFile:v6];

  id v8 = [NSURL URLWithString:v5];
  id v9 = +[VTUtteranceMetadataManager recordedTimeStampOfFile:v8];

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint64_t v13 = [v7 compare:v9];
LABEL_15:
    uint64_t v12 = v13;
    goto LABEL_16;
  }
  if (v7) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    uint64_t v12 = 1;
  }
  else
  {
    if (v7 || !v9)
    {
      uint64_t v13 = [v4 compare:v5 options:1];
      goto LABEL_15;
    }
    uint64_t v12 = -1;
  }
LABEL_16:

  return v12;
}

uint64_t __85__VTSpeakerIdUtilities_getSortedImplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 pathExtension];
  int v4 = [v3 isEqualToString:@"wav"];

  if (!v4) {
    goto LABEL_4;
  }
  uint64_t v5 = [v2 stringByDeletingPathExtension];
  v6 = [(id)v5 stringByAppendingPathExtension:@"json"];

  id v7 = [NSURL URLWithString:v6];
  LOBYTE(v5) = +[VTUtteranceMetadataManager isUtteranceImplicitlyTrained:v7];

  if (v5) {
    uint64_t v8 = 1;
  }
  else {
LABEL_4:
  }
    uint64_t v8 = 0;

  return v8;
}

+ (id)getExplicitEnrollmentUtterancesForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  id v5 = a4;
  v6 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:a3 forLanguageCode:v5];
  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v23 = 0;
  uint64_t v8 = [v7 contentsOfDirectoryAtPath:v6 error:&v23];
  id v9 = v23;

  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__603;
  uint64_t v21 = __Block_byref_object_dispose__604;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count") + 1);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__VTSpeakerIdUtilities_getExplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke;
  v14[3] = &unk_264325360;
  id v10 = v6;
  id v15 = v10;
  int v16 = &v17;
  [v8 enumerateObjectsUsingBlock:v14];
  BOOL v11 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_617];
  uint64_t v12 = [(id)v18[5] filteredArrayUsingPredicate:v11];

  _Block_object_dispose(&v17, 8);

  return v12;
}

void __79__VTSpeakerIdUtilities_getExplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
}

uint64_t __79__VTSpeakerIdUtilities_getExplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 pathExtension];
  int v4 = [v3 isEqualToString:@"wav"];

  if (!v4) {
    goto LABEL_3;
  }
  id v5 = [v2 stringByDeletingPathExtension];
  v6 = [v5 stringByAppendingPathExtension:@"json"];

  id v7 = [NSURL URLWithString:v6];
  LODWORD(v5) = +[VTUtteranceMetadataManager isUtteranceImplicitlyTrained:v7];

  if (!v5) {
    uint64_t v8 = 1;
  }
  else {
LABEL_3:
  }
    uint64_t v8 = 0;

  return v8;
}

+ (id)_getAssetHashFromConfigPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"com_apple_MobileAsset_VoiceTriggerAssets/"];
  uint64_t v6 = v5;
  uint64_t v7 = [v3 rangeOfString:@".asset"];
  id v9 = @"nohash";
  if (v6 && v8)
  {
    objc_msgSend(v3, "substringWithRange:", v4 + v6, v7 - (v4 + v6));
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)getProfileVersionFilePathForLanguageCode:(id)a3
{
  id v3 = +[VTSpeakerIdUtilities getSATDirectoryForLanguageCode:a3];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"enrollment_version.json"];

  return v4;
}

+ (id)getSpeakerModelPathForType:(unint64_t)a3 withLanguageCode:(id)a4 withConfigPath:(id)a5 createDirectory:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  if (v6) {
    id v11 = +[VTSpeakerIdUtilities createSATDirectoriesForType:a3 forLanguageCode:v9];
  }
  uint64_t v12 = +[VTSpeakerIdUtilities _getAssetHashFromConfigPath:v10];
  uint64_t v13 = +[VTSpeakerIdUtilities getSATModelDirectoryForType:a3 forLanguageCode:v9];
  uint64_t v14 = [v13 stringByAppendingPathComponent:v12];

  return v14;
}

+ (id)createSATDirectoriesForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:a3 forLanguageCode:v5];
  uint64_t v7 = +[VTSpeakerIdUtilities getSATModelDirectoryForType:a3 forLanguageCode:v5];

  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  char v9 = [v8 fileExistsAtPath:v6 isDirectory:0];

  id v10 = 0;
  if ((v9 & 1) == 0)
  {
    id v11 = [MEMORY[0x263F08850] defaultManager];
    id v26 = 0;
    char v12 = [v11 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v26];
    id v10 = v26;

    uint64_t v13 = VTLogContextFacilityVoiceTrigger;
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v6;
        _os_log_impl(&dword_21844F000, v13, OS_LOG_TYPE_DEFAULT, "Creating SAT audio directory at path %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = v13;
      id v22 = [v10 localizedDescription];
      *(_DWORD *)buf = 138543618;
      v28 = v6;
      __int16 v29 = 2114;
      id v30 = v22;
      _os_log_error_impl(&dword_21844F000, v21, OS_LOG_TYPE_ERROR, "Couldn't create SAT audio directory at path %{public}@ %{public}@", buf, 0x16u);
    }
  }
  uint64_t v14 = [MEMORY[0x263F08850] defaultManager];
  char v15 = [v14 fileExistsAtPath:v7 isDirectory:0];

  if (v15)
  {
    id v16 = v10;
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F08850] defaultManager];
    id v25 = v10;
    char v18 = [v17 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v16 = v25;

    uint64_t v19 = VTLogContextFacilityVoiceTrigger;
    if (v18)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v7;
        _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_DEFAULT, "Creating SAT model directory at path %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      id v23 = v19;
      id v24 = [v16 localizedDescription];
      *(_DWORD *)buf = 138543618;
      v28 = v7;
      __int16 v29 = 2114;
      id v30 = v24;
      _os_log_error_impl(&dword_21844F000, v23, OS_LOG_TYPE_ERROR, "Couldn't create SAT model directory at path %{public}@ %{public}@", buf, 0x16u);
    }
  }

  return v16;
}

+ (id)getSATAudioDirectoryForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = +[VTSpeakerIdUtilities getSATDirectoryForModelType:a3 forLanguageCode:a4];
  BOOL v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 stringByAppendingPathComponent:@"audio"];
  }
  else
  {
    uint64_t v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      unint64_t v11 = a3;
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "ERR: Invalid ModelType path for SpIdType %ld - Bailing out", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)getSATModelDirectoryForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = +[VTSpeakerIdUtilities getSATDirectoryForModelType:a3 forLanguageCode:a4];
  BOOL v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 stringByAppendingPathComponent:@"model"];
  }
  else
  {
    uint64_t v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      unint64_t v11 = a3;
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "ERR: Invalid ModelType path for SpIdType %ld - Bailing out", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)getSATDirectoryForModelType:(unint64_t)a3 forLanguageCode:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = +[VTSpeakerIdUtilities getSATDirectoryForLanguageCode:a4];
  uint64_t v6 = +[VTSpeakerIdUtilities stringForVTSpIdType:a3];
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    if (v6)
    {
      uint64_t v8 = [v5 stringByAppendingPathComponent:v6];
      goto LABEL_10;
    }
    uint64_t v13 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      unint64_t v16 = a3;
      int v10 = "ERR: Invalid SpIdType %ld - Bailing out";
      unint64_t v11 = v13;
      uint32_t v12 = 12;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      int v10 = "ERR: SAT Base Directory path is nil - Bailing out";
      unint64_t v11 = v9;
      uint32_t v12 = 2;
LABEL_8:
      _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    }
  }
  uint64_t v8 = 0;
LABEL_10:

  return v8;
}

+ (id)stringForVTSpIdType:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3 - 1 < 3) {
    return off_2643253E8[a3 - 1];
  }
  id v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "ERR: Unknown VTSpIdType:%lu", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

+ (id)getSATDirectoryForLanguageCode:(id)a3
{
  id v3 = (__CFString *)a3;
  uint64_t v4 = CPSharedResourcesDirectory();
  id v5 = [v4 stringByAppendingPathComponent:@"Library/VoiceTrigger/SAT"];
  int v6 = v5;
  if (v3) {
    unint64_t v7 = v3;
  }
  else {
    unint64_t v7 = @"xx_XX";
  }
  uint64_t v8 = [v5 stringByAppendingPathComponent:v7];

  return v8;
}

@end