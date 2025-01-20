@interface VTUtteranceMetadataManager
+ (BOOL)_audioDirectoryNeedsUpgrade:(id)a3;
+ (BOOL)isUtteranceImplicitlyTrained:(id)a3;
+ (id)_getBaseMetaDictionaryForUtterancePath:(id)a3;
+ (id)recordedTimeStampOfFile:(id)a3;
+ (void)_saveMetaVersionFileAtPath:(id)a3;
+ (void)_upgradeLocaleDirectoryIfNecessary:(id)a3;
+ (void)_upgradeUtteranceMeta:(id)a3;
+ (void)_writeMetaDict:(id)a3 forUtterancePath:(id)a4;
+ (void)saveMetaVersionFileAtSATAudioDirectory:(id)a3;
+ (void)saveUtteranceMetadataForUtterance:(id)a3 isExplicitEnrollment:(BOOL)a4 isHandheldEnrollment:(BOOL)a5 withBiometricResult:(unint64_t)a6;
+ (void)upgradeMetaFilesIfNecessaaryAtSATRoot:(id)a3;
@end

@implementation VTUtteranceMetadataManager

+ (id)recordedTimeStampOfFile:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 path];
  uint64_t v5 = [v4 stringByDeletingPathExtension];
  v6 = [(id)v5 stringByAppendingPathExtension:@"json"];

  v7 = [MEMORY[0x263F08850] defaultManager];
  LOBYTE(v5) = [v7 fileExistsAtPath:v6];

  if (v5)
  {
    v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
    if (v8)
    {
      id v19 = 0;
      v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v19];
      id v10 = v19;
      if (v10)
      {
        v11 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v21 = v3;
          __int16 v22 = 2114;
          id v23 = v10;
          _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "Json-Err reading metaVersionFile: %{public}@: err: %{public}@", buf, 0x16u);
        }
        v12 = 0;
      }
      else
      {
        v15 = [v9 objectForKeyedSubscript:@"grainedDate"];
        if (v15)
        {
          id v16 = objc_alloc_init(MEMORY[0x263F08790]);
          v17 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
          [v16 setLocale:v17];

          [v16 setDateFormat:@"yyyyMMdd"];
          v12 = [v16 dateFromString:v15];
        }
        else
        {
          v12 = 0;
        }
      }
    }
    else
    {
      v14 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v6;
        _os_log_impl(&dword_21844F000, v14, OS_LOG_TYPE_DEFAULT, "ERR: Unexpected. metaVersionFileData is empty while the file exists at: %{public}@", buf, 0xCu);
      }
      v12 = 0;
    }
  }
  else
  {
    v13 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v6;
      _os_log_impl(&dword_21844F000, v13, OS_LOG_TYPE_DEFAULT, "ERR: %{public}@ is not present", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

+ (BOOL)isUtteranceImplicitlyTrained:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = (__CFString *)a3;
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF8F8];
    v6 = [(__CFString *)v3 path];
    v7 = [v5 dataWithContentsOfFile:v6];

    if (v7)
    {
      id v18 = 0;
      v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v18];
      v9 = (__CFString *)v18;
      if (v9)
      {
        id v10 = VTLogContextFacilityVoiceTrigger;
        char v11 = 0;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v20 = v4;
          __int16 v21 = 2114;
          __int16 v22 = v9;
          _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "ERR: read metafile %{public}@ failed with %{public}@ - defaulting to NO", buf, 0x16u);
          char v11 = 0;
        }
      }
      else
      {
        v14 = [v8 objectForKeyedSubscript:@"trainingType"];
        v15 = v14;
        if (v14)
        {
          char v11 = [v14 isEqualToString:@"implicit"];
        }
        else
        {
          id v16 = VTLogContextFacilityVoiceTrigger;
          char v11 = 0;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v20 = @"trainingType";
            __int16 v21 = 2114;
            __int16 v22 = v4;
            _os_log_impl(&dword_21844F000, v16, OS_LOG_TYPE_DEFAULT, "ERR: missing %{public}@ key in %{public}@ - defaulting to NO", buf, 0x16u);
            char v11 = 0;
          }
        }
      }
    }
    else
    {
      v13 = VTLogContextFacilityVoiceTrigger;
      char v11 = 0;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v4;
        _os_log_impl(&dword_21844F000, v13, OS_LOG_TYPE_DEFAULT, "ERR: metaData is nil, defaulting to NO for %{public}@", buf, 0xCu);
        char v11 = 0;
      }
    }
  }
  else
  {
    v12 = VTLogContextFacilityVoiceTrigger;
    char v11 = 0;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "ERR: uttMetaURL is nil, defaulting to NO", buf, 2u);
      char v11 = 0;
    }
  }

  return v11;
}

+ (void)_upgradeUtteranceMeta:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
    if (v5)
    {
      id v25 = 0;
      v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:&v25];
      id v7 = v25;
      if (v7)
      {
        v8 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v27 = v7;
          _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "error reading meta-file: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        char v11 = [MEMORY[0x263EFF9A0] dictionary];
        v12 = [v4 path];
        uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"];

        uint64_t v24 = (void *)v13;
        [v11 setObject:v13 forKeyedSubscript:@"utteranceWav"];
        uint64_t v14 = [v6 objectForKeyedSubscript:@"productType"];
        if (!v14)
        {
          uint64_t v14 = +[VTUtilities deviceProductType];
        }
        uint64_t v23 = (void *)v14;
        [v11 setObject:v14 forKeyedSubscript:@"productType"];
        v15 = [v6 objectForKeyedSubscript:@"productVersion"];
        if (!v15)
        {
          v15 = +[VTUtilities deviceProductVersion];
        }
        [v11 setObject:v15 forKeyedSubscript:@"productVersion"];
        id v16 = [v6 objectForKeyedSubscript:@"trainingType"];
        v17 = v16;
        if (v16)
        {
          if ([v16 isEqualToString:@"explicit"]) {
            id v18 = @"explicit";
          }
          else {
            id v18 = @"implicit";
          }
          [v11 setObject:v18 forKeyedSubscript:@"trainingType"];
        }
        id v19 = [v6 objectForKeyedSubscript:@"handheld"];
        v20 = v19;
        if (v19)
        {
          if ([v19 isEqualToString:@"near-field"]) {
            __int16 v21 = @"near-field";
          }
          else {
            __int16 v21 = @"far-field";
          }
          [v11 setObject:v21 forKeyedSubscript:@"handheld"];
        }
        __int16 v22 = [v4 path];
        [a1 _writeMetaDict:v11 forUtterancePath:v22];
      }
    }
    else
    {
      id v10 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v4;
        _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "ERR: Unexpected. metaData is nil while the uttMetaPath exists at: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "ERR: uttMetaURL is nil", buf, 2u);
    }
  }
}

+ (BOOL)_audioDirectoryNeedsUpgrade:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [a3 URLByAppendingPathComponent:@"meta_version.json"];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3];
    if (v7)
    {
      id v15 = 0;
      v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v15];
      id v9 = v15;
      if (v9)
      {
        id v10 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v17 = v3;
          __int16 v18 = 2114;
          id v19 = v9;
          _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "Json-Err reading metaVersionFile: %{public}@: err: %{public}@", buf, 0x16u);
        }
        BOOL v11 = 1;
      }
      else
      {
        uint64_t v13 = [v8 objectForKeyedSubscript:@"meta_version"];
        BOOL v11 = (unint64_t)[v13 unsignedIntegerValue] < 4;
      }
    }
    else
    {
      v12 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v3;
        _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "ERR: Unexpected. metaVersionFileData is empty while the file exists at: %{public}@", buf, 0xCu);
      }
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

+ (void)_upgradeLocaleDirectoryIfNecessary:(id)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  id v3 = +[VTSpeakerIdUtilities getSATAudioDirectoryForType:1 forLanguageCode:a3];
  id v4 = [NSURL URLWithString:v3];
  if (+[VTUtteranceMetadataManager _audioDirectoryNeedsUpgrade:v4])
  {
    uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
    v45[0] = *MEMORY[0x263EFF750];
    int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
    id v39 = 0;
    v34 = v5;
    id v7 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v6 options:0 error:&v39];
    id v8 = v39;

    if (v8)
    {
      id v9 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v42 = v4;
        __int16 v43 = 2114;
        id v44 = v8;
        _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "Error reading contents of audioDir: %{public}@, err: %{public}@", buf, 0x16u);
      }
      goto LABEL_24;
    }
    v30 = 0;
    v31 = v4;
    v32 = v3;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v29 = v7;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (!v11)
    {
LABEL_23:

      id v4 = v31;
      uint64_t v28 = [v31 URLByAppendingPathComponent:@"meta_version.json"];
      +[VTUtteranceMetadataManager _saveMetaVersionFileAtPath:v28];

      id v3 = v32;
      id v7 = v29;
      id v8 = v30;
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v12 = v11;
    uint64_t v13 = @"meta_version.json";
    uint64_t v14 = *(void *)v36;
LABEL_8:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v36 != v14) {
        objc_enumerationMutation(v10);
      }
      v17 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
      __int16 v18 = objc_msgSend(v17, "absoluteString", v29, v30);
      id v19 = [v18 lastPathComponent];

      if (([v19 isEqualToString:@"enrollment_completed"] & 1) != 0
        || ([v19 isEqualToString:v13] & 1) != 0)
      {
        goto LABEL_11;
      }
      uint64_t v20 = v13;
      __int16 v21 = [v17 path];
      __int16 v22 = [v21 pathExtension];
      int v23 = [v22 isEqualToString:@"wav"];

      if (v23)
      {
        uint64_t v24 = [v21 stringByReplacingOccurrencesOfString:@".wav" withString:@".json"];
        if (([v34 fileExistsAtPath:v24] & 1) == 0)
        {
          id v27 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v42 = v21;
            _os_log_impl(&dword_21844F000, v27, OS_LOG_TYPE_DEFAULT, "Missing meta-file: Creating new Meta file for audio file: %{public}@", buf, 0xCu);
          }
          id v16 = [a1 _getBaseMetaDictionaryForUtterancePath:v21];
          [a1 _writeMetaDict:v16 forUtterancePath:v21];

          goto LABEL_10;
        }
      }
      id v25 = [v17 pathExtension];
      int v26 = [v25 isEqualToString:@"json"];

      if (v26) {
        +[VTUtteranceMetadataManager _upgradeUtteranceMeta:v17];
      }
LABEL_10:

      uint64_t v13 = v20;
LABEL_11:

      if (v12 == ++v15)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (!v12) {
          goto LABEL_23;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_25:
}

+ (void)_saveMetaVersionFileAtPath:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v11 = @"meta_version";
  v12[0] = &unk_26C9A8A08;
  id v4 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v8 = 0;
  uint64_t v5 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:0 error:&v8];
  id v6 = v8;
  if (v6)
  {
    id v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "ERROR creating meta-version json-data from dict: ERR: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    [v5 writeToURL:v3 atomically:0];
  }
}

+ (void)upgradeMetaFilesIfNecessaaryAtSATRoot:(id)a3
{
  v33[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = *MEMORY[0x263EFF6A8];
  v33[0] = *MEMORY[0x263EFF750];
  v33[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  id v27 = 0;
  id v7 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v6 options:0 error:&v27];
  id v8 = v27;

  if (!v8)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v7;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (!v10) {
      goto LABEL_18;
    }
    uint64_t v11 = v10;
    id v19 = v4;
    id v20 = v3;
    uint64_t v12 = *(void *)v24;
LABEL_7:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
      id v21 = 0;
      id v22 = 0;
      [v14 getResourceValue:&v22 forKey:v5 error:&v21];
      id v15 = v22;
      id v16 = v21;
      if (v16)
      {
        v17 = v16;
        __int16 v18 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v30 = v14;
          __int16 v31 = 2114;
          id v32 = v17;
          _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "Error determining if file is dir-entry: url=%{public}@, err=%{public}@", buf, 0x16u);
        }
      }
      else
      {
        if (![v15 BOOLValue]) {
          goto LABEL_9;
        }
        v17 = [v14 lastPathComponent];
        +[VTUtteranceMetadataManager _upgradeLocaleDirectoryIfNecessary:v17];
      }

LABEL_9:
      if (v11 == ++v13)
      {
        uint64_t v11 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (!v11)
        {
          id v4 = v19;
          id v3 = v20;
          goto LABEL_18;
        }
        goto LABEL_7;
      }
    }
  }
  id v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = v3;
    __int16 v31 = 2114;
    id v32 = v8;
    _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "Error reading contents of SAT root: %{public}@: err: %{public}@", buf, 0x16u);
  }
LABEL_18:
}

+ (void)saveMetaVersionFileAtSATAudioDirectory:(id)a3
{
  id v3 = [a3 URLByAppendingPathComponent:@"meta_version.json"];
  +[VTUtteranceMetadataManager _saveMetaVersionFileAtPath:v3];
}

+ (void)_writeMetaDict:(id)a3 forUtterancePath:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v5)
    {
      id v14 = 0;
      id v7 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:1 error:&v14];
      id v8 = v14;
      if (v8)
      {
        id v9 = (void *)VTLogContextFacilityVoiceTrigger;
        if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
LABEL_13:

          goto LABEL_14;
        }
        uint64_t v10 = v9;
        uint64_t v11 = [v8 localizedDescription];
        *(_DWORD *)buf = 138543362;
        id v16 = v11;
        _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "::: Error creating json Metadata: %{public}@", buf, 0xCu);
      }
      else
      {
        uint64_t v10 = [v6 stringByReplacingOccurrencesOfString:@".wav" withString:@".json"];
        [v7 writeToFile:v10 atomically:0];
      }

      goto LABEL_13;
    }
    uint64_t v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v13 = "ERR: called with nil uttMeta";
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v13 = "ERR: called with nil uttPath";
LABEL_10:
      _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
  }
LABEL_14:
}

+ (id)_getBaseMetaDictionaryForUtterancePath:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v10[0] = @"productType";
    id v4 = +[VTUtilities deviceProductType];
    v11[0] = v4;
    v10[1] = @"productVersion";
    id v5 = +[VTUtilities deviceProductVersion];
    v10[2] = @"utteranceWav";
    v11[1] = v5;
    v11[2] = v3;
    id v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  }
  else
  {
    id v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "ERR: called with nil uttPath", v9, 2u);
    }
    id v6 = (void *)MEMORY[0x263EFFA78];
  }

  return v6;
}

+ (void)saveUtteranceMetadataForUtterance:(id)a3 isExplicitEnrollment:(BOOL)a4 isHandheldEnrollment:(BOOL)a5 withBiometricResult:(unint64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v12 = [a1 _getBaseMetaDictionaryForUtterancePath:v10];
    uint64_t v13 = [v11 dictionaryWithDictionary:v12];

    if (v8) {
      id v14 = @"explicit";
    }
    else {
      id v14 = @"implicit";
    }
    [v13 setObject:v14 forKeyedSubscript:@"trainingType"];
    if (v7) {
      id v15 = @"near-field";
    }
    else {
      id v15 = @"far-field";
    }
    [v13 setObject:v15 forKeyedSubscript:@"handheld"];
    id v16 = +[VTSpeakerIdUtilities timeStampWithSaltGrain];
    [v13 setObject:v16 forKeyedSubscript:@"grainedDate"];

    uint64_t v17 = [NSNumber numberWithUnsignedInteger:a6];
    [v13 setObject:v17 forKeyedSubscript:@"otherSourceProfileMatch"];

    [a1 _writeMetaDict:v13 forUtterancePath:v10];
  }
  else
  {
    __int16 v18 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "ERR: called with nil uttPath", v19, 2u);
    }
  }
}

@end