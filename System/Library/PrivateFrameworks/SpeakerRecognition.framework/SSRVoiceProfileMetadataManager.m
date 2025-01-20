@interface SSRVoiceProfileMetadataManager
+ (BOOL)isUtteranceImplicitlyTrained:(id)a3;
+ (id)_getBaseMetaDictionaryForUtterancePath:(id)a3;
+ (id)getUtteranceEnrollmentType:(id)a3;
+ (id)readVoiceTriggerRePromptMetadata:(id)a3;
+ (id)recordedTimeStampFromFileName:(id)a3;
+ (id)recordedTimeStampOfFile:(id)a3;
+ (void)_writeMetaDict:(id)a3 forUtterancePath:(id)a4;
+ (void)saveUtteranceMetadataForUtterance:(id)a3 enrollmentType:(id)a4 isHandheldEnrollment:(BOOL)a5 triggerSource:(id)a6 audioInput:(id)a7 otherBiometricResult:(unint64_t)a8 containsPayload:(BOOL)a9;
+ (void)saveVoiceTriggeRePromptMetadata:(id)a3;
@end

@implementation SSRVoiceProfileMetadataManager

+ (id)recordedTimeStampFromFileName:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 lastPathComponent];
    v6 = [v5 stringByDeletingPathExtension];

    id v7 = objc_alloc_init(MEMORY[0x263F08790]);
    v8 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [v7 setLocale:v8];

    [v7 setDateFormat:@"yyyyMMdd-HHmmss"];
    v9 = [v7 dateFromString:v6];
  }
  else
  {
    v10 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      v13 = "+[SSRVoiceProfileMetadataManager recordedTimeStampFromFileName:]";
      _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s ERR: filePath is nil!", (uint8_t *)&v12, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)recordedTimeStampOfFile:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 path];
  uint64_t v5 = [v4 stringByDeletingPathExtension];
  v6 = [(id)v5 stringByAppendingPathExtension:@"json"];

  id v7 = [MEMORY[0x263F08850] defaultManager];
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
        v11 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v21 = "+[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:]";
          __int16 v22 = 2114;
          id v23 = v3;
          __int16 v24 = 2114;
          id v25 = v10;
          _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s Json-Err reading metaVersionFile: %{public}@: err: %{public}@", buf, 0x20u);
        }
        int v12 = 0;
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
          int v12 = [v16 dateFromString:v15];
        }
        else
        {
          int v12 = 0;
        }
      }
    }
    else
    {
      uint64_t v14 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "+[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:]";
        __int16 v22 = 2114;
        id v23 = v6;
        _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s ERR: Unexpected. metaVersionFileData is empty while the file exists at: %{public}@", buf, 0x16u);
      }
      int v12 = 0;
    }
  }
  else
  {
    v13 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:]";
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@ is not present", buf, 0x16u);
    }
    int v12 = 0;
  }

  return v12;
}

+ (id)getUtteranceEnrollmentType:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 URLByDeletingPathExtension];
    v6 = [v5 URLByAppendingPathExtension:@"json"];

    id v7 = (void *)MEMORY[0x263EFF8F8];
    v8 = [v6 path];
    v9 = [v7 dataWithContentsOfFile:v8];

    if (!v9)
    {
      v15 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v23 = "+[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:]";
        __int16 v24 = 2114;
        id v25 = v4;
        _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s metaData is nil for %{public}@ - Bailing out", buf, 0x16u);
      }
      uint64_t v14 = 0;
      goto LABEL_21;
    }
    id v21 = 0;
    id v10 = [MEMORY[0x263F08900] JSONObjectWithData:v9 options:0 error:&v21];
    id v11 = v21;
    if (v11)
    {
      int v12 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v23 = "+[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:]";
        __int16 v24 = 2114;
        id v25 = v4;
        __int16 v26 = 2114;
        id v27 = v11;
        _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s ERR: read metafile %{public}@ failed with %{public}@ - Bailing out", buf, 0x20u);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = [v10 objectForKeyedSubscript:@"trainingType"];
        uint64_t v14 = v16;
        if (v16) {
          id v17 = v16;
        }

        goto LABEL_20;
      }
      v18 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v23 = "+[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:]";
        __int16 v24 = 2114;
        id v25 = v4;
        __int16 v26 = 2114;
        id v27 = v10;
        _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, "%s ERR: metaDict from file %{public}@ isnt a dictionary - %{public}@", buf, 0x20u);
      }
      id v19 = [MEMORY[0x263F38028] sharedInstance];
      [v19 submitVoiceIdIssueReport:*MEMORY[0x263F38138]];
    }
    uint64_t v14 = 0;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  v13 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "+[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:]";
    _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: uttMetaURL is nil - Bailing out", buf, 0xCu);
  }
  uint64_t v14 = 0;
LABEL_22:

  return v14;
}

+ (BOOL)isUtteranceImplicitlyTrained:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF8F8];
    v6 = [v3 path];
    id v7 = [v5 dataWithContentsOfFile:v6];

    if (v7)
    {
      id v17 = 0;
      v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v17];
      id v9 = v17;
      if (v9)
      {
        id v10 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          id v19 = "+[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:]";
          __int16 v20 = 2114;
          id v21 = v4;
          __int16 v22 = 2114;
          id v23 = v9;
          _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s ERR: read metafile %{public}@ failed with %{public}@ - defaulting to NO", buf, 0x20u);
        }
        char v11 = 0;
      }
      else
      {
        uint64_t v14 = [v8 objectForKeyedSubscript:@"trainingType"];
        v15 = v14;
        if (v14) {
          char v11 = [v14 isEqualToString:@"implicit"];
        }
        else {
          char v11 = 0;
        }
      }
    }
    else
    {
      v13 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v19 = "+[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:]";
        __int16 v20 = 2114;
        id v21 = v4;
        _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: metaData is nil, defaulting to NO for %{public}@", buf, 0x16u);
      }
      char v11 = 0;
    }
  }
  else
  {
    int v12 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "+[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:]";
      _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s ERR: uttMetaURL is nil, defaulting to NO", buf, 0xCu);
    }
    char v11 = 0;
  }

  return v11;
}

+ (void)_writeMetaDict:(id)a3 forUtterancePath:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
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
        id v9 = (void *)*MEMORY[0x263F38100];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
LABEL_13:

          goto LABEL_14;
        }
        id v10 = v9;
        char v11 = [v8 localizedDescription];
        *(_DWORD *)buf = 136315394;
        id v16 = "+[SSRVoiceProfileMetadataManager _writeMetaDict:forUtterancePath:]";
        __int16 v17 = 2114;
        v18 = v11;
        _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s ::: Error creating json Metadata: %{public}@", buf, 0x16u);
      }
      else
      {
        id v10 = [v6 stringByReplacingOccurrencesOfString:@".wav" withString:@".json"];
        [v7 writeToFile:v10 atomically:0];
      }

      goto LABEL_13;
    }
    int v12 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "+[SSRVoiceProfileMetadataManager _writeMetaDict:forUtterancePath:]";
      v13 = "%s ERR: uttMeta is nil - Bailing out";
      goto LABEL_10;
    }
  }
  else
  {
    int v12 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "+[SSRVoiceProfileMetadataManager _writeMetaDict:forUtterancePath:]";
      v13 = "%s ERR: uttPath is nil - Bailing out";
LABEL_10:
      _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
    }
  }
LABEL_14:
}

+ (id)_getBaseMetaDictionaryForUtterancePath:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x263F380D0], "deviceProductType", @"productType");
    v11[0] = v4;
    v10[1] = @"productVersion";
    id v5 = [MEMORY[0x263F380D0] deviceProductVersion];
    v11[1] = v5;
    v10[2] = @"buildVersion";
    id v6 = [MEMORY[0x263F380D0] deviceBuildVersion];
    v10[3] = @"utteranceWav";
    v11[2] = v6;
    v11[3] = v3;
    id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  }
  else
  {
    id v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "+[SSRVoiceProfileMetadataManager _getBaseMetaDictionaryForUtterancePath:]";
      _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s ERR: uttPath is nil - Bailing out", buf, 0xCu);
    }
    id v7 = (void *)MEMORY[0x263EFFA78];
  }

  return v7;
}

+ (void)saveUtteranceMetadataForUtterance:(id)a3 enrollmentType:(id)a4 isHandheldEnrollment:(BOOL)a5 triggerSource:(id)a6 audioInput:(id)a7 otherBiometricResult:(unint64_t)a8 containsPayload:(BOOL)a9
{
  BOOL v12 = a5;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = (__CFString *)a4;
  id v17 = a6;
  id v18 = a7;
  if (v15)
  {
    uint64_t v19 = (void *)MEMORY[0x263EFF9A0];
    __int16 v20 = [a1 _getBaseMetaDictionaryForUtterancePath:v15];
    id v21 = [v19 dictionaryWithDictionary:v20];

    if (v16) {
      __int16 v22 = v16;
    }
    else {
      __int16 v22 = @"explicit";
    }
    [v21 setObject:v22 forKeyedSubscript:@"trainingType"];
    if (v12) {
      id v23 = @"near-field";
    }
    else {
      id v23 = @"far-field";
    }
    [v21 setObject:v23 forKeyedSubscript:@"handheld"];
    uint64_t v24 = [NSNumber numberWithUnsignedInteger:a8];
    [v21 setObject:v24 forKeyedSubscript:@"otherSourceProfileMatch"];

    [v21 setObject:v17 forKeyedSubscript:@"triggerSource"];
    [v21 setObject:v18 forKeyedSubscript:@"audioInputSource"];
    id v25 = [MEMORY[0x263F380D0] timeStampWithSaltGrain];
    [v21 setObject:v25 forKeyedSubscript:@"grainedDate"];

    __int16 v26 = [NSNumber numberWithBool:a9];
    [v21 setObject:v26 forKeyedSubscript:@"containsPayload"];

    [a1 _writeMetaDict:v21 forUtterancePath:v15];
  }
  else
  {
    id v27 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v28 = 136315138;
      v29 = "+[SSRVoiceProfileMetadataManager saveUtteranceMetadataForUtterance:enrollmentType:isHandheldEnrollment:trigg"
            "erSource:audioInput:otherBiometricResult:containsPayload:]";
      _os_log_error_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_ERROR, "%s ERR: uttPath is nil -  Bailing out", (uint8_t *)&v28, 0xCu);
    }
  }
}

+ (id)readVoiceTriggerRePromptMetadata:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
  if (v4)
  {
    id v13 = 0;
    id v5 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v13];
    id v6 = v13;
    if (v6)
    {
      id v7 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v15 = "+[SSRVoiceProfileMetadataManager readVoiceTriggerRePromptMetadata:]";
        __int16 v16 = 2114;
        id v17 = v3;
        __int16 v18 = 2114;
        id v19 = v6;
        _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s Json-Err reading metaVersionDict: %{public}@: err: %{public}@", buf, 0x20u);
      }
      id v8 = 0;
    }
    else
    {
      id v8 = [v5 objectForKeyedSubscript:@"RePrompt_Date"];
      if (v8)
      {
        id v10 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          id v15 = "+[SSRVoiceProfileMetadataManager readVoiceTriggerRePromptMetadata:]";
          __int16 v16 = 2112;
          id v17 = v8;
          _os_log_debug_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEBUG, "%s RePrompted on %@", buf, 0x16u);
        }
        id v11 = v8;
      }
    }
  }
  else
  {
    id v9 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "+[SSRVoiceProfileMetadataManager readVoiceTriggerRePromptMetadata:]";
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Unexpected. metaVersionFileData is empty while the file exists at: %{public}@", buf, 0x16u);
    }
    id v8 = 0;
  }

  return v8;
}

+ (void)saveVoiceTriggeRePromptMetadata:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    id v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [v4 setLocale:v5];

    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    [v6 setObject:@"TRUE" forKeyedSubscript:@"RePrompt_Finished"];
    id v7 = [MEMORY[0x263EFF910] now];
    id v8 = [v4 stringFromDate:v7];
    [v6 setObject:v8 forKeyedSubscript:@"RePrompt_Date"];

    id v15 = 0;
    id v9 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:1 error:&v15];
    id v10 = v15;
    if (v10)
    {
      id v11 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        BOOL v12 = v11;
        id v13 = [v10 localizedDescription];
        *(_DWORD *)buf = 136315394;
        id v17 = "+[SSRVoiceProfileMetadataManager saveVoiceTriggeRePromptMetadata:]";
        __int16 v18 = 2114;
        id v19 = v13;
        _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s ::: Error creating json RePrompt Metadata: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      [v9 writeToFile:v3 atomically:0];
    }
  }
  else
  {
    uint64_t v14 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "+[SSRVoiceProfileMetadataManager saveVoiceTriggeRePromptMetadata:]";
      _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s ERR: path is nil - Bailing out", buf, 0xCu);
    }
  }
}

@end