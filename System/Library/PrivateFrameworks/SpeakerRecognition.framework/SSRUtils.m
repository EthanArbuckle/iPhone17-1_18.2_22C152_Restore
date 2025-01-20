@interface SSRUtils
+ (BOOL)encryptFileAt:(id)a3 andSaveTo:(id)a4 error:(id *)a5;
+ (BOOL)isCurrentDeviceCompatibleWithNewerVoiceProfileAt:(id)a3;
+ (BOOL)isCurrentDeviceCompatibleWithVoiceProfileAt:(id)a3;
+ (BOOL)isMphVTUIKeywordDetectorSupportedPlatform;
+ (BOOL)isSpeakerRecognitionSupportedInLocale:(id)a3;
+ (BOOL)ssrAudioLogsCountWithinPrivacyLimit;
+ (id)_getUtterancesFromDirectory:(id)a3;
+ (id)combineScoreFromPSR:(id)a3 fromSAT:(id)a4 withCombinedWt:(float)a5;
+ (id)concatenateDonationId:(id)a3 triggerPhraseId:(unint64_t)a4;
+ (id)convertSchemaTypeWithLocale:(id)a3;
+ (id)convertToUtteranceDataWithDonationString:(id)a3;
+ (id)createAVAudioPCMBufferWithNSData:(id)a3 audioFormat:(unint64_t)a4 sampleRate:(float)a5 numOfChannel:(unsigned int)a6 isInterleaved:(BOOL)a7;
+ (id)deviceCategoryStringRepresentationForCategoryType:(unint64_t)a3;
+ (id)generateEnrollmentId;
+ (id)getContentsOfDirectory:(id)a3;
+ (id)getEnrollmentUtterancesFromDirectory:(id)a3;
+ (id)getExplicitEnrollmentUtterancesFromDirectory:(id)a3;
+ (id)getExplicitMarkedEnrollmentUtterancesFromDirectory:(id)a3;
+ (id)getImplicitEnrollmentUtterancesFromDirectory:(id)a3;
+ (id)getImplicitUtteranceCacheDirectory;
+ (id)getVoiceProfileForSiriProfileId:(id)a3 forLanguageCode:(id)a4;
+ (id)getVoiceProfileIdentityFromVersionFilePath:(id)a3;
+ (id)getVoiceProfilesForSiriProfileId:(id)a3;
+ (id)moveContentsOfSrcDirectory:(id)a3 toDestDirectory:(id)a4;
+ (id)psrConfigFileNameForCSSpIdType:(unint64_t)a3;
+ (id)readJsonFileAtPath:(id)a3;
+ (id)removeItemAtPath:(id)a3;
+ (id)satConfigFileNameForCSSpIdType:(unint64_t)a3;
+ (id)satConfigFileNameForCSSpIdType:(unint64_t)a3 forModelType:(unint64_t)a4 forAssetType:(unint64_t)a5;
+ (id)spIdVoiceProfileImportRootDir;
+ (id)spidAudioTrainUtterancesDir;
+ (id)ssrAudioLogsDir;
+ (id)stringForCSSpIdType:(unint64_t)a3;
+ (id)stringForInvocationStyle:(unint64_t)a3;
+ (id)stringForSpeakerRecognizerType:(unint64_t)a3;
+ (id)stringForVoiceProfileRetrainerType:(unint64_t)a3;
+ (id)timeStampString;
+ (int)convertToSchemaEnumWithPhId:(unint64_t)a3;
+ (int64_t)getNumberOfAudioFilesInDirectory:(id)a3;
+ (unint64_t)convertToEnrollmentTriggerPhraseWithPhId:(unint64_t)a3;
+ (unint64_t)deviceCategoryForDeviceProductType:(id)a3;
+ (unint64_t)deviceCategoryFromString:(id)a3;
+ (unint64_t)explicitSpIdTypeForSpId:(unint64_t)a3;
+ (unint64_t)getVoiceProfileProductCategoryFromVersionFilePath:(id)a3;
+ (unint64_t)spIdTypeForString:(id)a3;
+ (void)cleanupOrphanedVoiceIdGradingFiles;
+ (void)createDirectoryIfDoesNotExist:(id)a3;
+ (void)dumpFilesInDirectory:(id)a3;
+ (void)getEnrollmentUtterancesCountFromDirectory:(id)a3 withCountBlock:(id)a4;
+ (void)getHomeUserIdForVoiceProfile:(id)a3 withCompletion:(id)a4;
+ (void)logSpeakerRecognitionGradingMetadataAtFilepath:(id)a3 withScoreInfo:(id)a4;
+ (void)segmentVoiceTriggerFromAudioFile:(id)a3 withVTEventInfo:(id)a4 withStorePayloadPortion:(BOOL)a5 withCompletion:(id)a6;
+ (void)streamAudioFromFileUrl:(id)a3 audioStreamBasicDescriptor:(AudioStreamBasicDescription *)a4 samplesPerStreamChunk:(unint64_t)a5 audioDataAvailableHandler:(id)a6;
@end

@implementation SSRUtils

+ (unint64_t)convertToEnrollmentTriggerPhraseWithPhId:(unint64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

+ (int)convertToSchemaEnumWithPhId:(unint64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

+ (id)convertSchemaTypeWithLocale:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F6ED68]);
  if (v3)
  {
    unsigned int v5 = [MEMORY[0x263F6EF18] convertLanguageCodeToSchemaLocale:v3];
    if (v5 <= 0x3E)
    {
      uint64_t v6 = dword_21C940F34[v5];
      [v4 setCountryCode:dword_21C940E38[v5]];
      [v4 setLanguageCode:v6];
    }
  }

  return v4;
}

+ (id)convertToUtteranceDataWithDonationString:(id)a3
{
  return (id)[a3 componentsSeparatedByString:@"-TriggerPhrase-"];
}

+ (id)concatenateDonationId:(id)a3 triggerPhraseId:(unint64_t)a4
{
  unsigned int v5 = NSString;
  id v6 = a3;
  v7 = objc_msgSend(v5, "stringWithFormat:", @"%lu", a4);
  v8 = [v6 stringByAppendingFormat:@"%@%@", @"-TriggerPhrase-", v7];

  return v8;
}

+ (id)createAVAudioPCMBufferWithNSData:(id)a3 audioFormat:(unint64_t)a4 sampleRate:(float)a5 numOfChannel:(unsigned int)a6 isInterleaved:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  v11 = (objc_class *)MEMORY[0x263EF9388];
  id v12 = a3;
  v13 = (void *)[[v11 alloc] initWithCommonFormat:a4 sampleRate:v8 channels:v7 interleaved:a5];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x263EF93B0]), "initWithPCMFormat:frameCapacity:", v13, objc_msgSend(v12, "length") >> 1);
  v15 = *(void **)([v14 mutableAudioBufferList] + 16);
  id v16 = v12;
  memcpy(v15, (const void *)[v16 bytes], objc_msgSend(v16, "length"));
  LODWORD(v15) = [v16 length];
  *(_DWORD *)([v14 mutableAudioBufferList] + 12) = v15;
  LODWORD(v15) = [v16 length];

  [v14 setFrameLength:v15 >> 1];

  return v14;
}

+ (id)generateEnrollmentId
{
  v2 = [MEMORY[0x263F08C38] UUID];
  id v3 = [v2 UUIDString];

  return v3;
}

+ (id)timeStampString
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  id v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HH:mm:ss"];
  id v4 = [MEMORY[0x263EFF910] date];
  unsigned int v5 = [v2 stringFromDate:v4];

  return v5;
}

+ (BOOL)isMphVTUIKeywordDetectorSupportedPlatform
{
  if (CSIsIOS()) {
    return 1;
  }

  return CSIsAppleSiliconMac();
}

+ (id)combineScoreFromPSR:(id)a3 fromSAT:(id)a4 withCombinedWt:(float)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v10 = v9;
  if (v7 && !v8)
  {
    [v9 addEntriesFromDictionary:v7];
    v11 = @"spIdKnownUserPSRScores";
    id v12 = v7;
LABEL_7:
    v13 = [v12 objectForKeyedSubscript:v11];
    [v10 setObject:v13 forKeyedSubscript:@"spIdKnownUserScores"];

    goto LABEL_8;
  }
  if (!v7 && v8)
  {
    [v9 addEntriesFromDictionary:v8];
    v11 = @"spIdKnownUserSATScores";
    id v12 = v8;
    goto LABEL_7;
  }
  if (v7 && v8)
  {
    [v9 addEntriesFromDictionary:v8];
    v37 = v10;
    [v10 addEntriesFromDictionary:v7];
    v15 = [v7 objectForKeyedSubscript:@"spIdKnownUserPSRScores"];
    id v36 = v8;
    id v16 = [v8 objectForKeyedSubscript:@"spIdKnownUserSATScores"];
    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v39;
      v22 = (os_log_t *)MEMORY[0x263F38100];
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          v25 = [v16 objectForKeyedSubscript:v24];

          if (v25)
          {
            v26 = [v16 objectForKeyedSubscript:v24];
            [v26 floatValue];
            float v28 = v27;

            v29 = [v18 objectForKeyedSubscript:v24];
            [v29 floatValue];
            float v31 = v30;

            *(float *)&double v32 = (float)(v31 * a5) + (float)((float)(1.0 - a5) * v28);
            v33 = [NSNumber numberWithFloat:v32];
            [v17 setObject:v33 forKey:v24];
          }
          else
          {
            v34 = *v22;
            if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v43 = "+[SSRUtils combineScoreFromPSR:fromSAT:withCombinedWt:]";
              __int16 v44 = 2114;
              uint64_t v45 = v24;
              __int16 v46 = 2114;
              v47 = v16;
              _os_log_error_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_ERROR, "%s ERR: Scores for profileId %{public}@ not present in %{public}@ - Skipping", buf, 0x20u);
            }
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v48 count:16];
      }
      while (v20);
    }

    v35 = (void *)[v17 copy];
    v10 = v37;
    [v37 setObject:v35 forKeyedSubscript:@"spIdKnownUserScores"];

    id v8 = v36;
  }
LABEL_8:

  return v10;
}

+ (BOOL)encryptFileAt:(id)a3 andSaveTo:(id)a4 error:(id *)a5
{
  return 0;
}

+ (id)moveContentsOfSrcDirectory:(id)a3 toDestDirectory:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = 0x263F08000uLL;
  id v8 = [MEMORY[0x263F08850] defaultManager];
  id v40 = 0;
  id v9 = [v8 contentsOfDirectoryAtPath:v5 error:&v40];
  id v10 = v40;

  if (v10)
  {
    v11 = NSString;
    id v12 = [v10 localizedDescription];
    id obj = [v11 stringWithFormat:@"Failed to get contents of %@ with error %@", v5, v12];

    v13 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "+[SSRUtils moveContentsOfSrcDirectory:toDestDirectory:]";
      __int16 v44 = 2114;
      id v45 = obj;
      _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    id v14 = v10;
    v15 = v14;
  }
  else
  {
    +[SSRUtils createDirectoryIfDoesNotExist:v6];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v9;
    uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v34 = v6;
      double v32 = v9;
      id v14 = 0;
      uint64_t v18 = *(void *)v37;
      do
      {
        uint64_t v19 = 0;
        uint64_t v20 = v14;
        do
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v36 + 1) + 8 * v19);
          id v22 = v5;
          v23 = [v5 stringByAppendingPathComponent:v21];
          uint64_t v24 = [v34 stringByAppendingPathComponent:v21];
          unint64_t v25 = v7;
          v26 = [*(id *)(v7 + 2128) defaultManager];
          id v35 = v20;
          [v26 moveItemAtPath:v23 toPath:v24 error:&v35];
          id v14 = v35;

          if (v14)
          {
            float v27 = NSString;
            float v28 = [v14 localizedDescription];
            v29 = [v27 stringWithFormat:@"Failed to move %@ to %@ with error %@", v23, v24, v28];

            float v30 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v43 = "+[SSRUtils moveContentsOfSrcDirectory:toDestDirectory:]";
              __int16 v44 = 2114;
              id v45 = v29;
              _os_log_error_impl(&dword_21C8A5000, v30, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
            }
          }
          ++v19;
          uint64_t v20 = v14;
          unint64_t v7 = v25;
          id v5 = v22;
        }
        while (v17 != v19);
        uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v17);
      v15 = 0;
      id v9 = v32;
      id v6 = v34;
    }
    else
    {
      id v14 = 0;
      v15 = 0;
    }
  }

  return v15;
}

+ (id)removeItemAtPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v12 = 0;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v12];

  if (v5)
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    id v11 = 0;
    char v7 = [v6 removeItemAtPath:v3 error:&v11];
    id v8 = v11;

    if ((v7 & 1) == 0)
    {
      id v9 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v14 = "+[SSRUtils removeItemAtPath:]";
        __int16 v15 = 2114;
        id v16 = v3;
        __int16 v17 = 2114;
        id v18 = v8;
        _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete %{public}@ with error %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_getUtterancesFromDirectory:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    v20[0] = *MEMORY[0x263EFF750];
    int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    id v13 = 0;
    id v6 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v5 options:0 error:&v13];
    id v7 = v13;

    if (v7)
    {
      id v8 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v15 = "+[SSRUtils _getUtterancesFromDirectory:]";
        __int16 v16 = 2114;
        id v17 = v3;
        __int16 v18 = 2114;
        id v19 = v7;
        _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s ERR: Fetching contents of %{public}@ failed with error - %{public}@", buf, 0x20u);
      }
    }
    id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"self.absoluteString ENDSWITH '.wav'"];
    id v10 = [v6 filteredArrayUsingPredicate:v9];
  }
  else
  {
    id v11 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v15 = "+[SSRUtils _getUtterancesFromDirectory:]";
      _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s satAudioDirectory is nil - Bailing out", buf, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

+ (id)getImplicitEnrollmentUtterancesFromDirectory:(id)a3
{
  id v3 = [a1 _getUtterancesFromDirectory:a3];
  id v4 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_393];
  int v5 = [v3 filteredArrayUsingPredicate:v4];
  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_396];

  return v6;
}

uint64_t __57__SSRUtils_getImplicitEnrollmentUtterancesFromDirectory___block_invoke_394(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = +[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:v4];
  uint64_t v7 = +[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:v5];
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v6) {
      BOOL v10 = v7 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      uint64_t v14 = 1;
    }
    else
    {
      if (v6) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = v7 == 0;
      }
      if (v11)
      {
        char v12 = [v4 absoluteString];
        id v13 = [v5 absoluteString];
        uint64_t v14 = [v12 compare:v13 options:1];
      }
      else
      {
        uint64_t v14 = -1;
      }
    }
  }
  else
  {
    uint64_t v14 = [v6 compare:v7];
  }

  return v14;
}

uint64_t __57__SSRUtils_getImplicitEnrollmentUtterancesFromDirectory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [a2 URLByDeletingPathExtension];
  id v3 = [v2 URLByAppendingPathExtension:@"json"];

  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if ((v6 & 1) == 0)
  {
    id v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      BOOL v11 = "+[SSRUtils getImplicitEnrollmentUtterancesFromDirectory:]_block_invoke";
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s metaVersionFile %{public}@ doesnt exist - Skipping", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_6;
  }
  if (!+[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:v3])
  {
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = 1;
LABEL_7:

  return v7;
}

+ (void)getEnrollmentUtterancesCountFromDirectory:(id)a3 withCountBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  id v8 = [a1 _getUtterancesFromDirectory:v6];
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__SSRUtils_getEnrollmentUtterancesCountFromDirectory_withCountBlock___block_invoke;
  v9[3] = &unk_264429750;
  v9[4] = &v10;
  v9[5] = &v14;
  [v8 enumerateObjectsUsingBlock:v9];
  if (v7) {
    v7[2](v7, v15[3], v11[3]);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

void __69__SSRUtils_getEnrollmentUtterancesCountFromDirectory_withCountBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:a2];
  int v3 = [v5 isEqualToString:@"implicit"];
  uint64_t v4 = 40;
  if (v3) {
    uint64_t v4 = 32;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + v4) + 8) + 24);
}

+ (id)getExplicitMarkedEnrollmentUtterancesFromDirectory:(id)a3
{
  int v3 = [a1 _getUtterancesFromDirectory:a3];
  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_391];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

uint64_t __63__SSRUtils_getExplicitMarkedEnrollmentUtterancesFromDirectory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [a2 URLByDeletingPathExtension];
  int v3 = [v2 URLByAppendingPathExtension:@"json"];

  uint64_t v4 = +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:v3];
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [v3 path];
  char v7 = [v5 fileExistsAtPath:v6];

  if ((v7 & 1) == 0)
  {
    BOOL v9 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      BOOL v11 = [v3 lastPathComponent];
      int v13 = 136315394;
      uint64_t v14 = "+[SSRUtils getExplicitMarkedEnrollmentUtterancesFromDirectory:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s metaVersionFile %{public}@ doesnt exist - Skipping", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_6;
  }
  if (([v4 isEqualToString:@"explicit"] & 1) == 0)
  {
LABEL_6:
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  uint64_t v8 = 1;
LABEL_7:

  return v8;
}

+ (id)getExplicitEnrollmentUtterancesFromDirectory:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 _getUtterancesFromDirectory:v4];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  float v31 = __Block_byref_object_copy__4887;
  double v32 = __Block_byref_object_dispose__4888;
  id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (CSIsCommunalDevice())
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__4887;
    unint64_t v25 = __Block_byref_object_dispose__4888;
    id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    __int16 v18 = __Block_byref_object_copy__4887;
    id v19 = __Block_byref_object_dispose__4888;
    id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_2;
    v14[3] = &unk_264429750;
    v14[4] = &v21;
    v14[5] = &v15;
    [v5 enumerateObjectsUsingBlock:v14];
    [(id)v29[5] addObjectsFromArray:v16[5]];
    if ([(id)v22[5] count] && (unint64_t)objc_msgSend((id)v29[5], "count") <= 4)
    {
      id v6 = (id)*MEMORY[0x263F38100];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = [(id)v22[5] count];
        *(_DWORD *)buf = 136315394;
        id v35 = "+[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:]";
        __int16 v36 = 1026;
        int v37 = v7;
        _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Found %{public}d ambiguous explicit utterances", buf, 0x12u);
      }

      uint64_t v8 = [(id)v22[5] sortedArrayUsingComparator:&__block_literal_global_388];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_2_389;
      v13[3] = &unk_264429728;
      v13[4] = &v28;
      [v8 enumerateObjectsUsingBlock:v13];
    }
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v9 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_378];
    uint64_t v10 = [v5 filteredArrayUsingPredicate:v9];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_383;
    v27[3] = &unk_264429728;
    v27[4] = &v28;
    [v10 enumerateObjectsUsingBlock:v27];
  }
  id v11 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v11;
}

void __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_383(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:](SSRVoiceProfileMetadataManager, "getUtteranceEnrollmentType:");
  id v4 = v3;
  if (v3 && ([v3 isEqualToString:@"explicit"] & 1) != 0) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) insertObject:v5 atIndex:0];
  }
  else {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
  }
}

void __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:](SSRVoiceProfileMetadataManager, "getUtteranceEnrollmentType:");
  id v4 = v3;
  if (v3)
  {
    if (![v3 isEqualToString:@"explicit"]) {
      goto LABEL_6;
    }
    uint64_t v5 = a1 + 40;
  }
  else
  {
    uint64_t v5 = a1 + 32;
  }
  [*(id *)(*(void *)(*(void *)v5 + 8) + 40) addObject:v6];
LABEL_6:
}

void __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_2_389(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] > 4)
  {
    id v6 = v7;
    if (a4) {
      *a4 = 1;
    }
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
    id v6 = v7;
  }
}

uint64_t __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_385(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = +[SSRVoiceProfileMetadataManager recordedTimeStampFromFileName:v4];
  uint64_t v7 = +[SSRVoiceProfileMetadataManager recordedTimeStampFromFileName:v5];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v6) {
      BOOL v10 = v7 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      uint64_t v14 = -1;
    }
    else
    {
      if (v6) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = v7 == 0;
      }
      if (v11)
      {
        uint64_t v12 = [v4 absoluteString];
        int v13 = [v5 absoluteString];
        uint64_t v14 = [v12 compare:v13 options:1];
      }
      else
      {
        uint64_t v14 = 1;
      }
    }
  }
  else
  {
    uint64_t v14 = [v6 compare:v7];
  }

  return v14;
}

uint64_t __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [a2 URLByDeletingPathExtension];
  int v3 = [v2 URLByAppendingPathExtension:@"json"];

  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    uint64_t v7 = +[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:v3] ^ 1;
  }
  else
  {
    uint64_t v8 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = v8;
      BOOL v10 = [v3 lastPathComponent];
      int v12 = 136315394;
      int v13 = "+[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:]_block_invoke";
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s metaVersionFile %{public}@ doesnt exist", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v7 = 1;
  }

  return v7;
}

+ (id)getEnrollmentUtterancesFromDirectory:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [a1 getExplicitEnrollmentUtterancesFromDirectory:v4];
    char v6 = [a1 getImplicitEnrollmentUtterancesFromDirectory:v4];
    uint64_t v7 = [v5 arrayByAddingObjectsFromArray:v6];
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      BOOL v11 = "+[SSRUtils getEnrollmentUtterancesFromDirectory:]";
      _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s satAudioDirectory is nil - Bailing out", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

+ (void)segmentVoiceTriggerFromAudioFile:(id)a3 withVTEventInfo:(id)a4 withStorePayloadPortion:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  v93[1] = *MEMORY[0x263EF8340];
  id v49 = a3;
  id v47 = a4;
  id v9 = a6;
  int v10 = [MEMORY[0x263F08C38] UUID];
  BOOL v11 = [v10 UUIDString];
  v48 = [v11 stringByAppendingString:@".wav"];

  uint64_t v12 = [MEMORY[0x263F08C38] UUID];
  int v13 = [v12 UUIDString];
  uint64_t v46 = [v13 stringByAppendingString:@".wav"];

  __int16 v14 = [v49 URLByDeletingLastPathComponent];
  uint64_t v15 = [v14 path];

  uint64_t v16 = [v15 stringByAppendingPathComponent:v48];
  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x263F380B0]);
    __int16 v18 = [NSURL URLWithString:v16];
    [MEMORY[0x263F38038] lpcmInt16ASBD];
    [MEMORY[0x263F38038] lpcmInt16ASBD];
    uint64_t v19 = [v17 initWithURL:v18 inputFormat:v81 outputFormat:v80];

    if (v7)
    {
      id v20 = [v15 stringByAppendingPathComponent:v46];
      id v21 = objc_alloc(MEMORY[0x263F380B0]);
      id v22 = [NSURL URLWithString:v20];
      [MEMORY[0x263F38038] lpcmInt16ASBD];
      [MEMORY[0x263F38038] lpcmInt16ASBD];
      uint64_t v23 = [v21 initWithURL:v22 inputFormat:v79 outputFormat:v78];
    }
    else
    {
      uint64_t v23 = 0;
      id v20 = 0;
    }
    if (v19 | v23)
    {
      *(void *)v88 = 0;
      *(void *)&v88[8] = v88;
      *(void *)&v88[16] = 0x2020000000;
      uint64_t v89 = 0xFFFFFFFFLL;
      v77[0] = 0;
      v77[1] = v77;
      v77[2] = 0x2020000000;
      v77[3] = 0xFFFFFFFFLL;
      v76[0] = 0;
      v76[1] = v76;
      v76[2] = 0x2020000000;
      v76[3] = 0xFFFFFFFFLL;
      v75[0] = 0;
      v75[1] = v75;
      v75[2] = 0x2020000000;
      v75[3] = 0;
      v74[0] = 0;
      v74[1] = v74;
      v74[2] = 0x2020000000;
      v74[3] = 0;
      v73[0] = 0;
      v73[1] = v73;
      v73[2] = 0x2020000000;
      v73[3] = 0;
      v72[0] = 0;
      v72[1] = v72;
      v72[2] = 0x2020000000;
      v72[3] = 0;
      v71[0] = 0;
      v71[1] = v71;
      v71[2] = 0x2020000000;
      v71[3] = 0;
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x2020000000;
      uint64_t v70 = 0;
      uint64_t v28 = *MEMORY[0x263F381F8];
      v29 = [v47 objectForKeyedSubscript:*MEMORY[0x263F381F8]];

      if (v29)
      {
        uint64_t v30 = [v47 objectForKeyedSubscript:v28];
        uint64_t v31 = [v30 integerValue];
        v68[3] = v31;

        double v32 = (id)*MEMORY[0x263F38100];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v44 = v68[3];
          id v33 = [v47 objectForKeyedSubscript:v28];
          uint64_t v34 = [v33 integerValue];
          [MEMORY[0x263F38018] inputRecordingSampleRate];
          *(_DWORD *)buf = 136315650;
          v83 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]";
          __int16 v84 = 2048;
          uint64_t v85 = v44;
          __int16 v86 = 2048;
          double v87 = (float)((float)v34 / v35);
          _os_log_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_DEFAULT, "%s Setting payloadstartSample %lu for trigger duration of %fsecs", buf, 0x20u);
        }
      }
      else
      {
        [MEMORY[0x263F38018] inputRecordingSampleRate];
        id v40 = v68;
        v68[3] = vcvtd_n_u64_f64(v39, 2uLL);
        double v32 = (id)*MEMORY[0x263F38100];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v45 = v40[3];
          long long v41 = [v47 objectForKeyedSubscript:v28];
          uint64_t v42 = [v41 integerValue];
          [MEMORY[0x263F38018] inputRecordingSampleRate];
          *(_DWORD *)buf = 136315650;
          v83 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]";
          __int16 v84 = 2048;
          uint64_t v85 = v45;
          __int16 v86 = 2048;
          double v87 = (float)((float)v42 / v43);
          _os_log_error_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_ERROR, "%s ERR: Setting max payloadstartSample %lu for trigger duration of %fsecs", buf, 0x20u);
        }
      }

      [MEMORY[0x263F38038] lpcmInt16ASBD];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __100__SSRUtils_segmentVoiceTriggerFromAudioFile_withVTEventInfo_withStorePayloadPortion_withCompletion___block_invoke;
      v50[3] = &unk_2644296E0;
      id v51 = v49;
      id v56 = v9;
      id v52 = v16;
      id v20 = v20;
      id v53 = v20;
      v57 = v88;
      v58 = v74;
      v59 = v77;
      v60 = v73;
      v61 = v76;
      v62 = v72;
      v63 = v75;
      v64 = v71;
      id v26 = (id)v19;
      id v54 = v26;
      id v27 = (id)v23;
      id v55 = v27;
      v65 = &v67;
      +[SSRUtils streamAudioFromFileUrl:v51 audioStreamBasicDescriptor:v66 samplesPerStreamChunk:640 audioDataAvailableHandler:v50];

      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(v71, 8);
      _Block_object_dispose(v72, 8);
      _Block_object_dispose(v73, 8);
      _Block_object_dispose(v74, 8);
      _Block_object_dispose(v75, 8);
      _Block_object_dispose(v76, 8);
      _Block_object_dispose(v77, 8);
      _Block_object_dispose(v88, 8);
    }
    else
    {
      id v26 = [NSString stringWithFormat:@"ERR: Failed initializing loggers at %@ and %@", v16, v20];
      __int16 v36 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v88 = 136315394;
        *(void *)&v88[4] = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]";
        *(_WORD *)&v88[12] = 2114;
        *(void *)&v88[14] = v26;
        _os_log_error_impl(&dword_21C8A5000, v36, OS_LOG_TYPE_ERROR, "%s %{public}@", v88, 0x16u);
        if (!v9) {
          goto LABEL_19;
        }
      }
      else if (!v9)
      {
LABEL_19:

        goto LABEL_20;
      }
      int v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v90 = *MEMORY[0x263F08320];
      id v91 = v26;
      id v27 = [NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
      uint64_t v38 = [v37 errorWithDomain:@"com.apple.speakerrecognition" code:744 userInfo:v27];
      (*((void (**)(id, void *, void, void))v9 + 2))(v9, v38, 0, 0);
    }
LABEL_18:

    goto LABEL_19;
  }
  id v20 = [NSString stringWithFormat:@"ERR: Audio path is nil - Bailing out"];
  uint64_t v24 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v88 = 136315394;
    *(void *)&v88[4] = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]";
    *(_WORD *)&v88[12] = 2114;
    *(void *)&v88[14] = v20;
    _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s %{public}@", v88, 0x16u);
    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    unint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v92 = *MEMORY[0x263F08320];
    v93[0] = v20;
    id v26 = [NSDictionary dictionaryWithObjects:v93 forKeys:&v92 count:1];
    id v27 = [v25 errorWithDomain:@"com.apple.speakerrecognition" code:715 userInfo:v26];
    (*((void (**)(id, id, void, void))v9 + 2))(v9, v27, 0, 0);
    goto LABEL_18;
  }
LABEL_20:
}

void __100__SSRUtils_segmentVoiceTriggerFromAudioFile_withVTEventInfo_withStorePayloadPortion_withCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v59[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (os_log_t *)MEMORY[0x263F38100];
    id v9 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v49 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]_block_invoke";
      __int16 v50 = 2112;
      id v51 = v10;
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Failed to read file: %@", buf, 0x16u);
    }
    id v11 = [NSString stringWithFormat:@"ERR: Failed to read file: %@", *(void *)(a1 + 32)];
    uint64_t v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v49 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]_block_invoke";
      __int16 v50 = 2112;
      id v51 = v11;
      _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    if (*(void *)(a1 + 72))
    {
      int v13 = +[SSRUtils removeItemAtPath:*(void *)(a1 + 40)];

      if (!v13)
      {
        __int16 v14 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 136315394;
          id v49 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]_block_invoke";
          __int16 v50 = 2114;
          id v51 = v15;
          _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Deleted file %{public}@", buf, 0x16u);
        }
      }
      uint64_t v16 = +[SSRUtils removeItemAtPath:*(void *)(a1 + 48)];

      if (!v16)
      {
        id v17 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v18 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 136315394;
          id v49 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]_block_invoke";
          __int16 v50 = 2114;
          id v51 = v18;
          _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Deleted file %{public}@", buf, 0x16u);
        }
      }
      uint64_t v19 = *(void *)(a1 + 72);
      id v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v58 = *MEMORY[0x263F08320];
      v59[0] = v11;
      id v21 = [NSDictionary dictionaryWithObjects:v59 forKeys:&v58 count:1];
      id v22 = [v20 errorWithDomain:@"com.apple.speakerrecognition" code:716 userInfo:v21];
      (*(void (**)(uint64_t, void *, void, void))(v19 + 16))(v19, v22, 0, 0);
    }
    goto LABEL_32;
  }
  if (!a3)
  {
    id v11 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a2 + 16) length:*(unsigned int *)(a2 + 12)];
    unint64_t v40 = [v11 length];
    [MEMORY[0x263F38038] lpcmInt16ASBD];
    unint64_t v41 = v40 / v47;
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) += v41;
    if (*(void *)(a1 + 56))
    {
      uint64_t v42 = *(void *)(*(void *)(a1 + 104) + 8);
      unint64_t v43 = *(void *)(v42 + 24);
      if (v43 < *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24))
      {
        *(void *)(v42 + 24) = v43 + v41;
        objc_msgSend(*(id *)(a1 + 56), "addSamples:numSamples:", objc_msgSend(v11, "bytes"), v41);
      }
    }
    if (*(void *)(a1 + 64)
      && (double v44 = (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 120) + 8) + 24),
          [MEMORY[0x263F38018] inputRecordingSampleRate],
          v45 * 4.0 > v44))
    {
      *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) += v41;
      uint64_t v46 = *(void **)(a1 + 64);
      id v11 = v11;
      objc_msgSend(v46, "addSamples:numSamples:", objc_msgSend(v11, "bytes"), v41);
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) += v41;
    }
    goto LABEL_32;
  }
  float v23 = (float)*(unint64_t *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = (unint64_t)(float)((float)(v23 / v24) * 1000.0);
  float v25 = (float)*(unint64_t *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = (unint64_t)(float)((float)(v25 / v26) * 1000.0);
  float v27 = (float)*(unint64_t *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = (unint64_t)(float)((float)(v27 / v28) * 1000.0);
  float v29 = (float)*(unint64_t *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = (unint64_t)(float)((float)(v29 / v30) * 1000.0);
  uint64_t v31 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    double v32 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
    uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
    uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24);
    *(_DWORD *)buf = 136316162;
    id v49 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]_block_invoke";
    __int16 v50 = 2048;
    id v51 = v32;
    __int16 v52 = 2048;
    uint64_t v53 = v33;
    __int16 v54 = 2048;
    uint64_t v55 = v34;
    __int16 v56 = 2048;
    uint64_t v57 = v35;
    _os_log_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_DEFAULT, "%s EOF: utteranceLength: %lums, tdlength: %lums tdtiLength: %lums tdtiDiscardedLength: %lums", buf, 0x34u);
  }
  __int16 v36 = *(void **)(a1 + 56);
  if (v36) {
    [v36 endAudio];
  }
  int v37 = *(void **)(a1 + 64);
  if (v37) {
    [v37 endAudio];
  }
  uint64_t v38 = *(void *)(a1 + 72);
  if (v38)
  {
    id v11 = [NSURL fileURLWithPath:*(void *)(a1 + 40)];
    if (*(void *)(a1 + 48))
    {
      float v39 = objc_msgSend(NSURL, "fileURLWithPath:");
      (*(void (**)(uint64_t, void, id, void *))(v38 + 16))(v38, 0, v11, v39);
    }
    else
    {
      (*(void (**)(uint64_t, void, id, void))(v38 + 16))(v38, 0, v11, 0);
    }
LABEL_32:
  }
}

+ (void)logSpeakerRecognitionGradingMetadataAtFilepath:(id)a3 withScoreInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      id v17 = 0;
      uint64_t v8 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:1 error:&v17];
      id v9 = v17;
      if (v9)
      {
        int v10 = *MEMORY[0x263F37FA0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
        {
LABEL_16:

          goto LABEL_17;
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "+[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:]";
        __int16 v20 = 2112;
        id v21 = v9;
        id v11 = "%s Error creating uttMetaJsonData: %@";
        uint64_t v12 = v10;
        uint32_t v13 = 22;
      }
      else
      {
        if (v8)
        {
          [v8 writeToFile:v5 atomically:0];
          goto LABEL_16;
        }
        uint64_t v16 = *MEMORY[0x263F37FA0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v19 = "+[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:]";
        id v11 = "%s Failed to create UttMeta...";
        uint64_t v12 = v16;
        uint32_t v13 = 12;
      }
      _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      goto LABEL_16;
    }
    __int16 v14 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "+[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:]";
      uint64_t v15 = "%s scoreCard is nil!";
      goto LABEL_11;
    }
  }
  else
  {
    __int16 v14 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "+[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:]";
      uint64_t v15 = "%s uttMetaPath is nil!";
LABEL_11:
      _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    }
  }
LABEL_17:
}

+ (id)getVoiceProfileForSiriProfileId:(id)a3 forLanguageCode:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SSRVoiceProfileStore sharedInstance];
  uint64_t v8 = [v7 userVoiceProfilesForAppDomain:@"com.apple.siri" forLocale:v6];
  if (!v5 && ((CSIsIOS() & 1) != 0 || CSIsOSX()) && [v8 count])
  {
    if ((unint64_t)[v8 count] >= 2)
    {
      uint64_t v19 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        float v27 = "+[SSRUtils getVoiceProfileForSiriProfileId:forLanguageCode:]";
        _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s ERR: Seeing more than one voice profiles for Siri App Domain", buf, 0xCu);
      }
    }
    id v17 = [v8 objectAtIndexedSubscript:0];
  }
  else
  {
    id v20 = v6;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          if (v5)
          {
            __int16 v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            uint64_t v15 = [v14 siriProfileId];
            char v16 = [v15 isEqualToString:v5];

            if (v16)
            {
              id v17 = v14;

              goto LABEL_13;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v17 = 0;
LABEL_13:
    id v6 = v20;
  }

  return v17;
}

+ (id)getVoiceProfilesForSiriProfileId:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[SSRVoiceProfileStore sharedInstance];
  id v5 = [v4 userVoiceProfilesForAppDomain:@"com.apple.siri"];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (CSIsIOS())
  {
    if (!v3)
    {
LABEL_6:
      id v8 = v5;
      goto LABEL_20;
    }
  }
  else
  {
    char v7 = CSIsOSX();
    if (!v3 && (v7 & 1) != 0) {
      goto LABEL_6;
    }
  }
  __int16 v18 = v4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v15 = [v14 siriProfileId];
        int v16 = [v15 isEqualToString:v3];

        if (v16) {
          [v6 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  if ([v6 count]) {
    id v8 = (id)[v6 copy];
  }
  else {
    id v8 = 0;
  }
  id v4 = v18;
LABEL_20:

  return v8;
}

+ (void)getHomeUserIdForVoiceProfile:(id)a3 withCompletion:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  __int16 v36 = __Block_byref_object_copy__4887;
  int v37 = __Block_byref_object_dispose__4888;
  id v38 = 0;
  id v7 = objc_alloc_init(MEMORY[0x263F38030]);
  id v8 = objc_alloc_init(MEMORY[0x263F28560]);
  id v9 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v10 = (id)*MEMORY[0x263F38100];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v5 siriProfileId];
    *(_DWORD *)buf = 136315394;
    uint64_t v42 = "+[SSRUtils getHomeUserIdForVoiceProfile:withCompletion:]";
    __int16 v43 = 2114;
    double v44 = v11;
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Fetching homeUserId for siriProfileId %{public}@", buf, 0x16u);
  }
  [v7 enter];
  uint64_t v12 = [v5 siriProfileId];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  float v26 = __56__SSRUtils_getHomeUserIdForVoiceProfile_withCompletion___block_invoke;
  float v27 = &unk_2644296B8;
  id v13 = v8;
  id v28 = v13;
  double v32 = &v33;
  id v14 = v5;
  id v29 = v14;
  id v15 = v7;
  id v30 = v15;
  id v16 = v6;
  id v31 = v16;
  [v13 getHomeUserIdForSharedUserId:v12 completion:&v24];

  if (objc_msgSend(v15, "waitWithTimeout:", dispatch_time(0, 100000000)))
  {
    id v17 = NSString;
    __int16 v18 = [v14 siriProfileId];
    long long v19 = [v17 stringWithFormat:@"homeUserId query for siriProfileId %@ timedout !", v18, v24, v25, v26, v27, v28, v29, v30];

    long long v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    unint64_t v40 = v19;
    long long v21 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    long long v22 = [v20 errorWithDomain:@"com.apple.speakerrecognition" code:749 userInfo:v21];

    long long v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v42 = "+[SSRUtils getHomeUserIdForVoiceProfile:withCompletion:]";
      __int16 v43 = 2112;
      double v44 = v19;
      _os_log_error_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
      if (!v16) {
        goto LABEL_7;
      }
    }
    else if (!v16)
    {
LABEL_7:

      goto LABEL_8;
    }
    (*((void (**)(id, uint64_t, void *))v16 + 2))(v16, v34[5], v22);
    goto LABEL_7;
  }
LABEL_8:

  _Block_object_dispose(&v33, 8);
}

void __56__SSRUtils_getHomeUserIdForVoiceProfile_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = *(id *)(a1 + 32);
  if (v7)
  {
    id v9 = (void *)*MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v11 = v9;
    uint64_t v12 = [v10 siriProfileId];
    int v17 = 136315651;
    __int16 v18 = "+[SSRUtils getHomeUserIdForVoiceProfile:withCompletion:]_block_invoke";
    __int16 v19 = 2114;
    long long v20 = v12;
    __int16 v21 = 2113;
    id v22 = v7;
    _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s ERR: Home User Id erred %{public}@ for Siri Profile Id %{private}@", (uint8_t *)&v17, 0x20u);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    id v13 = (void *)*MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v14 = *(void **)(a1 + 40);
    uint64_t v11 = v13;
    uint64_t v12 = [v14 siriProfileId];
    id v15 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    int v17 = 136315650;
    __int16 v18 = "+[SSRUtils getHomeUserIdForVoiceProfile:withCompletion:]_block_invoke";
    __int16 v19 = 2114;
    long long v20 = v12;
    __int16 v21 = 2114;
    id v22 = v15;
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s siriProfileId %{public}@ maps to homeUserId %{public}@", (uint8_t *)&v17, 0x20u);
  }

LABEL_7:
  [*(id *)(a1 + 48) leave];
  uint64_t v16 = *(void *)(a1 + 56);
  if (v16) {
    (*(void (**)(uint64_t, void, id))(v16 + 16))(v16, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v7);
  }
}

+ (id)getContentsOfDirectory:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  v22[0] = *MEMORY[0x263EFF750];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  id v15 = 0;
  id v6 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v5 options:0 error:&v15];
  id v7 = v15;

  if (v7)
  {
    id v8 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
LABEL_3:
      id v9 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315650;
    int v17 = "+[SSRUtils getContentsOfDirectory:]";
    __int16 v18 = 2112;
    id v19 = v3;
    __int16 v20 = 2112;
    id v21 = v7;
    uint64_t v12 = "%s Error reading directory at %@: err: %@";
    id v13 = v8;
    uint32_t v14 = 32;
LABEL_12:
    _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_3;
  }
  if (![v6 count])
  {
    uint64_t v11 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_DWORD *)buf = 136315394;
    int v17 = "+[SSRUtils getContentsOfDirectory:]";
    __int16 v18 = 2112;
    id v19 = v3;
    uint64_t v12 = "%s %@ is empty";
    id v13 = v11;
    uint32_t v14 = 22;
    goto LABEL_12;
  }
  id v9 = v6;
LABEL_6:

  return v9;
}

+ (void)dumpFilesInDirectory:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    uint64_t v16 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    float v26 = "+[SSRUtils dumpFilesInDirectory:]";
    int v17 = "%s ERR: Directory is nil - Bailing out";
    __int16 v18 = v16;
    uint32_t v19 = 12;
LABEL_18:
    _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_16;
  }
  id v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    __int16 v20 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315394;
    float v26 = "+[SSRUtils dumpFilesInDirectory:]";
    __int16 v27 = 2114;
    id v28 = v3;
    int v17 = "%s ERR: %{public}@ doesnt exist - Bailing out";
    __int16 v18 = v20;
    uint32_t v19 = 22;
    goto LABEL_18;
  }
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v6 enumeratorAtPath:v3];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    uint64_t v12 = (os_log_t *)MEMORY[0x263F38100];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint32_t v14 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          *(_DWORD *)buf = 136315650;
          float v26 = "+[SSRUtils dumpFilesInDirectory:]";
          __int16 v27 = 2114;
          id v28 = v3;
          __int16 v29 = 2114;
          uint64_t v30 = v15;
          _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Dump content of %{public}@ - %{public}@", buf, 0x20u);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v10);
  }

LABEL_16:
}

+ (int64_t)getNumberOfAudioFilesInDirectory:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v11 = 0;
  char v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v11];
  id v6 = v11;

  if (v6)
  {
    id v7 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v17 = "+[SSRUtils getNumberOfAudioFilesInDirectory:]";
      __int16 v18 = 2114;
      id v19 = v3;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s ERR: fetching contents of %{public}@ failed with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__SSRUtils_getNumberOfAudioFilesInDirectory___block_invoke;
    v10[3] = &unk_264429690;
    v10[4] = &v12;
    [v5 enumerateObjectsUsingBlock:v10];
  }
  int64_t v8 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v8;
}

void __45__SSRUtils_getNumberOfAudioFilesInDirectory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 pathExtension];
  int v4 = [v3 isEqualToString:@"wav"];

  if (v4) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

+ (id)getImplicitUtteranceCacheDirectory
{
  id v2 = +[SSRVoiceProfileManager sharedInstance];
  id v3 = [v2 baseDir];
  int v4 = [v3 stringByAppendingPathComponent:@"Caches/VoiceTrigger/ImplicitUtterences"];

  return v4;
}

+ (BOOL)isCurrentDeviceCompatibleWithVoiceProfileAt:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [MEMORY[0x263F380D0] deviceProductType];
  if (v4)
  {
    unint64_t v5 = +[SSRUtils deviceCategoryForDeviceProductType:v4];
    char v61 = 0;
    id v6 = [MEMORY[0x263F08850] defaultManager];
    id v7 = [v3 stringByAppendingPathComponent:@"audio"];
    if ([v6 fileExistsAtPath:v7 isDirectory:&v61]) {
      BOOL v8 = v61 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      uint64_t v12 = [NSURL URLWithString:v7];
      if (!v12)
      {
        id v19 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
          __int16 v64 = 2114;
          v65 = v7;
          _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s Malformed audio-dir URL for string <%{public}@>:url", buf, 0x16u);
        }
        goto LABEL_19;
      }
      id v13 = (void *)v12;
      id v60 = 0;
      uint64_t v14 = [v6 contentsOfDirectoryAtURL:v12 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 error:&v60];
      id v15 = v60;
      if (v15)
      {
        uint64_t v16 = v15;
        int v17 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
          __int16 v64 = 2114;
          v65 = v16;
          _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s ERR: reading contents of audioDir: %{public}@", buf, 0x16u);
        }
        LOBYTE(v10) = 0;
        int v18 = 1;
      }
      else
      {
        uint64_t v53 = [MEMORY[0x263F08A98] predicateWithFormat:@"pathExtension='json'"];
        uint64_t v10 = objc_msgSend(v14, "filteredArrayUsingPredicate:");
        __int16 v52 = (void *)v10;
        if ([(id)v10 count])
        {
          v48 = v14;
          id v49 = v13;
          __int16 v50 = v7;
          id v51 = v6;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id obj = (id)v10;
          uint64_t v20 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            unint64_t v46 = v5;
            id v47 = v3;
            uint64_t v16 = 0;
            uint64_t v22 = *(void *)v57;
            uint64_t v10 = MEMORY[0x263F38100];
            while (2)
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v57 != v22) {
                  objc_enumerationMutation(obj);
                }
                long long v24 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                uint64_t v25 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v24];
                if (v25)
                {
                  float v26 = (void *)v25;
                  id v55 = v16;
                  __int16 v27 = [MEMORY[0x263F08900] JSONObjectWithData:v25 options:0 error:&v55];
                  id v28 = v55;

                  if (v28)
                  {
                    __int16 v29 = *(NSObject **)v10;
                    if (os_log_type_enabled(*(os_log_t *)v10, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                      __int16 v64 = 2114;
                      v65 = v24;
                      _os_log_impl(&dword_21C8A5000, v29, OS_LOG_TYPE_DEFAULT, "%s Error reading metaDict at path: %{public}@", buf, 0x16u);
                    }

                    uint64_t v16 = v28;
                  }
                  else
                  {
                    id v31 = [v27 objectForKeyedSubscript:@"productType"];
                    uint64_t v32 = *(NSObject **)v10;
                    if (os_log_type_enabled(*(os_log_t *)v10, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                      __int16 v64 = 2114;
                      v65 = v31;
                      _os_log_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_DEFAULT, "%s metaProductType: %{public}@", buf, 0x16u);
                    }
                    if (v31)
                    {
                      unint64_t v35 = +[SSRUtils deviceCategoryForDeviceProductType:v31];
                      __int16 v36 = *(NSObject **)v10;
                      if (os_log_type_enabled(*(os_log_t *)v10, OS_LOG_TYPE_DEFAULT))
                      {
                        int v37 = v36;
                        unint64_t v38 = v46;
                        uint64_t v39 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v46];
                        unint64_t v40 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v35];
                        *(_DWORD *)buf = 136316162;
                        v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                        __int16 v64 = 2114;
                        v65 = v4;
                        __int16 v66 = 2114;
                        uint64_t v67 = (uint64_t)v39;
                        __int16 v68 = 2114;
                        uint64_t v69 = v31;
                        __int16 v70 = 2114;
                        v71 = v40;
                        _os_log_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_DEFAULT, "%s vtprofile: currDevice=[%{public}@:%{public}@] ; vpDirDevice=[%{public}@:%{public}@]",
                          buf,
                          0x34u);

                        __int16 v36 = *(NSObject **)v10;
                      }
                      else
                      {
                        unint64_t v38 = v46;
                      }
                      BOOL v41 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
                      LOBYTE(v10) = v38 == v35;
                      if (v38 == v35)
                      {
                        id v3 = v47;
                        if (v41)
                        {
                          *(_DWORD *)buf = 136315138;
                          v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                          uint64_t v42 = "%s VoiceProfile MATCH";
                          goto LABEL_54;
                        }
                      }
                      else
                      {
                        id v3 = v47;
                        if (v41)
                        {
                          *(_DWORD *)buf = 136315138;
                          v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                          uint64_t v42 = "%s VoiceProfile MIS-MATCH";
LABEL_54:
                          _os_log_impl(&dword_21C8A5000, v36, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
                        }
                      }

                      uint64_t v16 = 0;
                      int v18 = 1;
                      goto LABEL_56;
                    }
                    uint64_t v33 = *(NSObject **)v10;
                    if (os_log_type_enabled(*(os_log_t *)v10, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                      _os_log_impl(&dword_21C8A5000, v33, OS_LOG_TYPE_DEFAULT, "%s Could not find productType in VT-Meta file, trying next one", buf, 0xCu);
                    }

                    uint64_t v16 = 0;
                  }
                }
                else
                {
                  uint64_t v30 = *(NSObject **)v10;
                  if (os_log_type_enabled(*(os_log_t *)v10, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                    __int16 v64 = 2114;
                    v65 = v24;
                    _os_log_impl(&dword_21C8A5000, v30, OS_LOG_TYPE_DEFAULT, "%s Unexpected: empty JSON data for file: %{public}@", buf, 0x16u);
                  }
                }
              }
              uint64_t v21 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
              if (v21) {
                continue;
              }
              break;
            }
            int v18 = 0;
            id v3 = v47;
          }
          else
          {
            uint64_t v16 = 0;
            int v18 = 0;
          }
LABEL_56:

          id v7 = v50;
          id v6 = v51;
          uint64_t v14 = v48;
          id v13 = v49;
        }
        else
        {
          uint64_t v34 = (void *)*MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            double v44 = v34;
            uint64_t v45 = [(id)v10 count];
            *(_DWORD *)buf = 136315650;
            v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
            __int16 v64 = 2114;
            v65 = v13;
            __int16 v66 = 2050;
            uint64_t v67 = v45;
            _os_log_error_impl(&dword_21C8A5000, v44, OS_LOG_TYPE_ERROR, "%s No jsonFiles found in %{public}@: jsonFiles.count=%{public}lu", buf, 0x20u);
          }
          uint64_t v16 = 0;
          LOBYTE(v10) = 0;
          int v18 = 1;
        }
      }
      if (v18) {
        goto LABEL_59;
      }
    }
    uint64_t v9 = *MEMORY[0x263F38100];
    LOBYTE(v10) = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
LABEL_59:

      goto LABEL_60;
    }
    *(_DWORD *)buf = 136315394;
    v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
    __int16 v64 = 2114;
    v65 = v4;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s No compatible VT profile found for CurrDevice: %{public}@", buf, 0x16u);
LABEL_19:
    LOBYTE(v10) = 0;
    goto LABEL_59;
  }
  id v11 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
    __int16 v64 = 2114;
    v65 = 0;
    _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s ERR: Unknown device. returning false: %{public}@", buf, 0x16u);
  }
  LOBYTE(v10) = 0;
LABEL_60:

  return v10 & 1;
}

+ (BOOL)isCurrentDeviceCompatibleWithNewerVoiceProfileAt:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F380D0];
  id v4 = a3;
  unint64_t v5 = [v3 deviceProductType];
  id v6 = [v4 stringByAppendingPathComponent:@"enrollment_version.json"];

  if (!v5)
  {
    uint64_t v10 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v21 = 136315394;
    uint64_t v22 = "+[SSRUtils isCurrentDeviceCompatibleWithNewerVoiceProfileAt:]";
    __int16 v23 = 2114;
    long long v24 = 0;
    id v11 = "%s ERR: Unknown device. returning false: %{public}@";
    uint64_t v12 = v10;
    uint32_t v13 = 22;
LABEL_9:
    _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v21, v13);
    goto LABEL_12;
  }
  if (!v6)
  {
    uint64_t v14 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v21 = 136315138;
    uint64_t v22 = "+[SSRUtils isCurrentDeviceCompatibleWithNewerVoiceProfileAt:]";
    id v11 = "%s ERR: satLanguagePath is nil. returning false";
    uint64_t v12 = v14;
    uint32_t v13 = 12;
    goto LABEL_9;
  }
  unint64_t v7 = +[SSRUtils deviceCategoryForDeviceProductType:v5];
  unint64_t v8 = +[SSRUtils getVoiceProfileProductCategoryFromVersionFilePath:v6];
  if (v7 != v8)
  {
    unint64_t v15 = v8;
    uint64_t v16 = (void *)*MEMORY[0x263F38100];
    BOOL v9 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    int v17 = v16;
    int v18 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v7];
    id v19 = +[SSRUtils deviceCategoryStringRepresentationForCategoryType:v15];
    int v21 = 136315650;
    uint64_t v22 = "+[SSRUtils isCurrentDeviceCompatibleWithNewerVoiceProfileAt:]";
    __int16 v23 = 2112;
    long long v24 = v18;
    __int16 v25 = 2112;
    float v26 = v19;
    _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Voice Profile Mismatch - CurrentDeviceCategory %@ VoiceProfileCategory %@", (uint8_t *)&v21, 0x20u);

LABEL_12:
    BOOL v9 = 0;
    goto LABEL_13;
  }
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

+ (unint64_t)deviceCategoryFromString:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 caseInsensitiveCompare:@"kCSDeviceCategory_Unknown"])
  {
    if (![v3 caseInsensitiveCompare:@"kCSDeviceCategory_iOS_NonAop"])
    {
      unint64_t v5 = 1;
      goto LABEL_15;
    }
    if (![v3 caseInsensitiveCompare:@"kCSDeviceCategory_iOS_Aop"])
    {
      unint64_t v5 = 2;
      goto LABEL_15;
    }
    if (![v3 caseInsensitiveCompare:@"kCSDeviceCategory_macOS"])
    {
      unint64_t v5 = 3;
      goto LABEL_15;
    }
    if (![v3 caseInsensitiveCompare:@"kCSDeviceCategory_AudioAccessory"])
    {
      unint64_t v5 = 4;
      goto LABEL_15;
    }
    if (![v3 caseInsensitiveCompare:@"kCSDeviceCategory_iOS_Aop_Explicit"])
    {
      unint64_t v5 = 5;
      goto LABEL_15;
    }
    id v4 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      unint64_t v8 = "+[SSRUtils deviceCategoryFromString:]";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s %@ didn't match to any device category name. Returning unknown", (uint8_t *)&v7, 0x16u);
    }
  }
  unint64_t v5 = 0;
LABEL_15:

  return v5;
}

+ (unint64_t)deviceCategoryForDeviceProductType:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (deviceCategoryForDeviceProductType__onceToken == -1)
  {
    if (!v3) {
      goto LABEL_16;
    }
  }
  else
  {
    dispatch_once(&deviceCategoryForDeviceProductType__onceToken, &__block_literal_global_229);
    if (!v4) {
      goto LABEL_16;
    }
  }
  if (([(id)deviceCategoryForDeviceProductType__nonAopDeviceSet containsObject:v4] & 1) == 0
    && ([v4 containsString:@"iPod"] & 1) == 0)
  {
    if ([v4 containsString:@"Mac"])
    {
      unint64_t v5 = 3;
      goto LABEL_17;
    }
    if (([v4 containsString:@"iPad"] & 1) != 0
      || ([v4 containsString:@"iPhone"] & 1) != 0)
    {
      unint64_t v5 = 2;
      goto LABEL_17;
    }
    if (([v4 containsString:@"Accessory"] & 1) != 0
      || ([v4 containsString:@"AppleTV"] & 1) != 0)
    {
      unint64_t v5 = 4;
      goto LABEL_17;
    }
    id v6 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      __int16 v9 = "+[SSRUtils deviceCategoryForDeviceProductType:]";
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Unknown Device category for deviceProduceType: %@", (uint8_t *)&v8, 0x16u);
    }
LABEL_16:
    unint64_t v5 = 0;
    goto LABEL_17;
  }
  unint64_t v5 = 1;
LABEL_17:

  return v5;
}

uint64_t __47__SSRUtils_deviceCategoryForDeviceProductType___block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"iPad3,4", @"iPad3,5", @"iPad3,6", @"iPad4,1", @"iPad4,2", @"iPad4,3", @"iPad4,4", @"iPad4,5", @"iPad4,6", @"iPad4,7", @"iPad4,8", @"iPad4,9", @"iPad5,1", @"iPad5,2", @"iPad5,3", @"iPad5,4", @"iPad6,7",
    @"iPad6,8",
    @"iPad6,11",
    @"iPad6,12",
    @"iPhone5,1",
    @"iPhone5,2",
    @"iPhone5,3",
    @"iPhone5,4",
    @"iPhone6,1",
    @"iPhone6,2",
    @"iPhone7,1",
    @"iPhone7,2",
  deviceCategoryForDeviceProductType__nonAopDeviceSet = 0);

  return MEMORY[0x270F9A758]();
}

+ (id)deviceCategoryStringRepresentationForCategoryType:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"kCSDeviceCategory_Unknown";
  }
  else {
    return off_2644297F8[a3 - 1];
  }
}

+ (id)getVoiceProfileIdentityFromVersionFilePath:(id)a3
{
  id v3 = +[SSRUtils readJsonFileAtPath:a3];
  id v4 = [v3 objectForKeyedSubscript:@"VoiceProfileIdentifier"];

  return v4;
}

+ (unint64_t)getVoiceProfileProductCategoryFromVersionFilePath:(id)a3
{
  id v3 = +[SSRUtils readJsonFileAtPath:a3];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 objectForKeyedSubscript:@"VoiceProfileCategoryType"];

    if (v5)
    {
      id v6 = [v4 objectForKeyedSubscript:@"VoiceProfileCategoryType"];
      unint64_t v5 = (int)[v6 intValue];
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

+ (id)readJsonFileAtPath:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  unint64_t v5 = v4;
  char v20 = 0;
  if (!v3)
  {
    int v8 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "+[SSRUtils readJsonFileAtPath:]";
      int v7 = "%s ERR: filePath passed as nil - Bailing out";
      __int16 v9 = v8;
      uint32_t v10 = 12;
LABEL_11:
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, v7, buf, v10);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (![v4 fileExistsAtPath:v3 isDirectory:&v20])
  {
    id v6 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "+[SSRUtils readJsonFileAtPath:]";
      __int16 v23 = 2112;
      id v24 = v3;
      int v7 = "%s ERR: file do not exist - %@";
      goto LABEL_10;
    }
LABEL_12:
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  if (v20)
  {
    id v6 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "+[SSRUtils readJsonFileAtPath:]";
      __int16 v23 = 2112;
      id v24 = v3;
      int v7 = "%s ERR: %@ is a directory";
LABEL_10:
      __int16 v9 = v6;
      uint32_t v10 = 22;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
  if (!v13)
  {
    int v17 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "+[SSRUtils readJsonFileAtPath:]";
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s Unable to read data from file: %@", buf, 0x16u);
    }
    goto LABEL_12;
  }
  uint64_t v14 = (void *)v13;
  id v19 = 0;
  uint64_t v11 = [MEMORY[0x263F08900] JSONObjectWithData:v13 options:0 error:&v19];
  id v15 = v19;
  uint64_t v16 = v15;
  if (!v11 || v15)
  {
    int v18 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = "+[SSRUtils readJsonFileAtPath:]";
      __int16 v23 = 2112;
      id v24 = v3;
      __int16 v25 = 2112;
      float v26 = v16;
      _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s ERR: Could not read existing %@ file: err: %@", buf, 0x20u);
    }

    goto LABEL_12;
  }

LABEL_13:

  return v11;
}

+ (BOOL)isSpeakerRecognitionSupportedInLocale:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[SSRAssetManager sharedManager];
  unint64_t v5 = [v4 installedAssetOfType:3 forLanguage:v3];

  id v6 = [MEMORY[0x263F08850] defaultManager];
  int v7 = +[SSRUtils satConfigFileNameForCSSpIdType:forModelType:forAssetType:](SSRUtils, "satConfigFileNameForCSSpIdType:forModelType:forAssetType:", 3, 1, [v5 assetProvider]);
  int v8 = [v5 resourcePath];
  __int16 v9 = [v8 stringByAppendingPathComponent:v7];

  char v10 = [v6 fileExistsAtPath:v9];
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      uint64_t v14 = "+[SSRUtils isSpeakerRecognitionSupportedInLocale:]";
      __int16 v15 = 2114;
      id v16 = v3;
      _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s VoiceId not supported in language %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v10;
}

+ (void)streamAudioFromFileUrl:(id)a3 audioStreamBasicDescriptor:(AudioStreamBasicDescription *)a4 samplesPerStreamChunk:(unint64_t)a5 audioDataAvailableHandler:(id)a6
{
  v35[1] = *MEMORY[0x263EF8340];
  CFURLRef v9 = (const __CFURL *)a3;
  char v10 = a6;
  UInt32 v11 = a4->mBitsPerChannel * a5 * a4->mChannelsPerFrame;
  id v12 = [MEMORY[0x263EFF990] dataWithCapacity:a4->mBitsPerChannel * a5 * a4->mChannelsPerFrame];
  AudioFileID outAudioFile = 0;
  *(void *)&ioData.mNumberBuffers = 1;
  ioData.mBuffers[0].mNumberChannels = 1;
  ioData.mBuffers[0].mDataByteSize = v11;
  ioData.mBuffers[0].mData = (void *)[v12 mutableBytes];
  ExtAudioFileRef outExtAudioFile = 0;
  if (AudioFileOpenURL(v9, kAudioFileReadPermission, 0, &outAudioFile))
  {
    NSLog(&cfstr_Audiofileopenu.isa, v9);
    int v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    uint64_t v14 = [NSString stringWithFormat:@"AudioFileOpenURL failed: %@", v9];
    v35[0] = v14;
    __int16 v15 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v16 = [v13 errorWithDomain:@"EARTests" code:1001 userInfo:v15];

    uint64_t v17 = (void (*)(void *, AudioBufferList *, uint64_t, void *))v10[2];
    AudioBufferList v28 = ioData;
    v17(v10, &v28, 1, v16);
  }
  else if (ExtAudioFileWrapAudioFileID(outAudioFile, 0, &outExtAudioFile))
  {
    NSLog(&cfstr_Extaudiofilewr.isa, v9);
    int v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    id v19 = [NSString stringWithFormat:@"ExtAudioFileWrapAudioFileID failed: %@", v9];
    uint64_t v33 = v19;
    char v20 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    int v21 = [v18 errorWithDomain:@"EARTests" code:1002 userInfo:v20];

    AudioFileClose(outAudioFile);
    uint64_t v22 = (void (*)(void *, AudioBufferList *, uint64_t, void *))v10[2];
    AudioBufferList v28 = ioData;
    v22(v10, &v28, 1, v21);
  }
  else
  {
    ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, a4);
    for (uint64_t i = 0; ; i += ioData.mBuffers[0].mDataByteSize)
    {
      UInt32 ioNumberFrames = a5;
      uint64_t v24 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
      if (v24)
      {
        NSLog(&cfstr_ErrorReadingAu.isa, v24);
        goto LABEL_11;
      }
      if (!ioNumberFrames) {
        break;
      }
      __int16 v25 = (void (*)(void *, AudioBufferList *, void, void))v10[2];
      AudioBufferList v28 = ioData;
      v25(v10, &v28, 0, 0);
    }
    NSLog(&cfstr_EofNumBytesRea.isa, i);
LABEL_11:
    float v26 = (void (*)(void *, AudioBufferList *, uint64_t, void))v10[2];
    AudioBufferList v28 = ioData;
    v26(v10, &v28, 1, 0);
    ExtAudioFileDispose(outExtAudioFile);
    AudioFileClose(outAudioFile);
  }
}

+ (id)spidAudioTrainUtterancesDir
{
  id v2 = NSURL;
  id v3 = NSTemporaryDirectory();
  id v4 = [v2 fileURLWithPath:v3];

  unint64_t v5 = [v4 URLByAppendingPathComponent:@"VoiceProfileCache"];
  id v6 = [v5 path];
  +[SSRUtils createDirectoryIfDoesNotExist:v6];

  int v7 = [v5 path];

  return v7;
}

+ (void)cleanupOrphanedVoiceIdGradingFiles
{
  v37[1] = *MEMORY[0x263EF8340];
  id v2 = [a1 ssrAudioLogsDir];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [NSURL fileURLWithPath:v2];
  v37[0] = *MEMORY[0x263EFF750];
  unint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
  id v29 = 0;
  id v6 = [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v5 options:0 error:&v29];
  id v7 = v29;

  if (v7)
  {
    int v8 = [v7 domain];
    if ([v8 isEqual:*MEMORY[0x263F07F70]])
    {
      uint64_t v9 = [v7 code];

      if (v9 == 260) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    int v21 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v32 = "+[SSRUtils cleanupOrphanedVoiceIdGradingFiles]";
      __int16 v33 = 2114;
      uint64_t v34 = v2;
      __int16 v35 = 2114;
      id v36 = v7;
      _os_log_error_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_ERROR, "%s ERR: reading contents of gradingDir: %{public}@ with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    __int16 v23 = v3;
    uint64_t v24 = v2;
    char v10 = [MEMORY[0x263EFF9A0] dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v22 = v6;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v17 = [v16 absoluteString];
          int v18 = [v17 lastPathComponent];
          id v19 = [v18 stringByDeletingPathExtension];

          char v20 = [v10 objectForKeyedSubscript:v19];

          if (v20) {
            [v10 removeObjectForKey:v19];
          }
          else {
            [v10 setObject:v16 forKeyedSubscript:v19];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v13);
    }

    [v10 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4926];
    id v3 = v23;
    id v2 = v24;
    id v6 = v22;
  }
LABEL_19:
}

void __46__SSRUtils_cleanupOrphanedVoiceIdGradingFiles__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "+[SSRUtils cleanupOrphanedVoiceIdGradingFiles]_block_invoke";
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_INFO, "%s Deleting orphaned grading file %{public}@", (uint8_t *)&v7, 0x16u);
  }
  unint64_t v5 = [v3 path];
  id v6 = +[SSRUtils removeItemAtPath:v5];
}

+ (BOOL)ssrAudioLogsCountWithinPrivacyLimit
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = +[SSRUtils ssrAudioLogsDir];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v14 = 0;
  id v4 = [v3 contentsOfDirectoryAtPath:v2 error:&v14];
  id v5 = v14;

  if (v4)
  {
    id v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"self ENDSWITH '.wav'"];
    int v7 = [v4 filteredArrayUsingPredicate:v6];

    unint64_t v8 = [v7 count];
    BOOL v9 = v8 < 0x65;
    if (v8 >= 0x65)
    {
      id v10 = (void *)*MEMORY[0x263F37FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = v10;
        uint64_t v12 = [v7 count];
        *(_DWORD *)buf = 136315650;
        id v16 = "+[SSRUtils ssrAudioLogsCountWithinPrivacyLimit]";
        __int16 v17 = 2048;
        uint64_t v18 = v12;
        __int16 v19 = 1024;
        int v20 = 100;
        _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Exceeded privacy limit for grading utterances : %ld (%d)", buf, 0x1Cu);
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)ssrAudioLogsDir
{
  id v2 = NSHomeDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"Library/Logs/CrashReporter/ssr"];

  return v3;
}

+ (void)createDirectoryIfDoesNotExist:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = v4;
  char v18 = 0;
  if (v3)
  {
    int v6 = [v4 fileExistsAtPath:v3 isDirectory:&v18];
    if (v6) {
      BOOL v7 = v18 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (v18) {
        int v8 = 0;
      }
      else {
        int v8 = v6;
      }
      BOOL v9 = (os_log_t *)MEMORY[0x263F37FA0];
      if (v8 == 1)
      {
        id v10 = *MEMORY[0x263F37FA0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          int v20 = "+[SSRUtils createDirectoryIfDoesNotExist:]";
          __int16 v21 = 2112;
          id v22 = v3;
          _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Direntry with same name exists, this will be removed: %@", buf, 0x16u);
        }
        [v5 removeItemAtPath:v3 error:0];
      }
      uint64_t v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v20 = "+[SSRUtils createDirectoryIfDoesNotExist:]";
        __int16 v21 = 2112;
        id v22 = v3;
        _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Creating Directory : %@", buf, 0x16u);
      }
      id v17 = 0;
      [v5 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v17];
      id v12 = v17;
      if (v12)
      {
        uint64_t v13 = *v9;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = v13;
          __int16 v15 = [v12 localizedDescription];
          *(_DWORD *)buf = 136315394;
          int v20 = "+[SSRUtils createDirectoryIfDoesNotExist:]";
          __int16 v21 = 2112;
          id v22 = v15;
          _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Creating Directory failed : %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    id v16 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v20 = "+[SSRUtils createDirectoryIfDoesNotExist:]";
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s path is nil - Bailing out", buf, 0xCu);
    }
  }
}

+ (id)spIdVoiceProfileImportRootDir
{
  id v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [v2 URLsForDirectory:9 inDomains:1];
  id v4 = [v3 lastObject];

  id v5 = [v4 path];
  int v6 = [v5 stringByAppendingPathComponent:@"spid-imported"];

  return v6;
}

+ (id)satConfigFileNameForCSSpIdType:(unint64_t)a3 forModelType:(unint64_t)a4 forAssetType:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (CSIsCommunalDevice())
  {
    if (a3 - 1 >= 5)
    {
      BOOL v9 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        uint64_t v13 = "+[SSRUtils satConfigFileNameForCSSpIdType:forModelType:forAssetType:]";
        __int16 v14 = 2048;
        unint64_t v15 = a3;
        id v10 = "%s ERR: Unknown CSSpIdType: %lu";
LABEL_16:
        _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x16u);
      }
LABEL_11:
      BOOL v7 = 0;
    }
    else
    {
      BOOL v7 = off_2644297D0[a3 - 1];
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
        int v8 = @"config.txt";
        if (a4 == 1) {
          int v8 = @"config_sr_sat.txt";
        }
        BOOL v7 = v8;
        break;
      default:
        BOOL v9 = *MEMORY[0x263F38100];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        int v12 = 136315394;
        uint64_t v13 = "+[SSRUtils satConfigFileNameForCSSpIdType:forModelType:forAssetType:]";
        __int16 v14 = 2048;
        unint64_t v15 = a3;
        id v10 = "%s Unknown CSSpIdType: %lu";
        goto LABEL_16;
    }
  }

  return v7;
}

+ (id)psrConfigFileNameForCSSpIdType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 1uLL:
    case 5uLL:
      int v4 = CSIsCommunalDevice();
      id v5 = @"config_sr_sat.txt";
      int v6 = @"config_td_spid.txt";
      goto LABEL_4;
    case 3uLL:
    case 4uLL:
      int v4 = CSIsCommunalDevice();
      id v5 = @"config_sr_sat.txt";
      int v6 = @"config_tdti_spid.txt";
LABEL_4:
      if (v4) {
        id v5 = v6;
      }
      BOOL v7 = v5;
      break;
    default:
      BOOL v9 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        uint64_t v11 = "+[SSRUtils psrConfigFileNameForCSSpIdType:]";
        __int16 v12 = 2048;
        unint64_t v13 = a3;
        _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Unknown CSSpIdType: %lu", (uint8_t *)&v10, 0x16u);
      }
      BOOL v7 = 0;
      break;
  }

  return v7;
}

+ (id)satConfigFileNameForCSSpIdType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3 == 5)
  {
    int v6 = CSIsCommunalDevice();
    id v5 = @"config_sr_sat.txt";
    if (v6) {
      id v5 = @"config_td_spid.txt";
    }
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    int v4 = CSIsCommunalDevice();
    id v5 = @"config.txt";
    if (v4) {
      id v5 = 0;
    }
LABEL_8:
    BOOL v7 = v5;
    goto LABEL_12;
  }
  int v8 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315394;
    uint64_t v11 = "+[SSRUtils satConfigFileNameForCSSpIdType:]";
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s ERR: Unknown CSSpIdType: %lu", (uint8_t *)&v10, 0x16u);
  }
  BOOL v7 = 0;
LABEL_12:

  return v7;
}

+ (id)stringForVoiceProfileRetrainerType:(unint64_t)a3
{
  if (a3 == 1)
  {
    int v4 = @"SAT";
  }
  else if (a3 == 2)
  {
    int v4 = @"PSR";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown VoiceProfileRetrainerType: %lu", a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)stringForSpeakerRecognizerType:(unint64_t)a3
{
  if (a3 == 2)
  {
    int v4 = @"SAT";
  }
  else if (a3 == 1)
  {
    int v4 = @"PSR";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown SpeakerRecognizerType: %lu", a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (unint64_t)spIdTypeForString:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isEqualToString:@"td"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"ti"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"tdti"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"tdtiexplicit"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"tdexplicit"])
  {
    unint64_t v4 = 5;
  }
  else
  {
    id v5 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      int v8 = "+[SSRUtils spIdTypeForString:]";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Unknown CSSpIdType string: %@", (uint8_t *)&v7, 0x16u);
    }
    unint64_t v4 = 0;
  }

  return v4;
}

+ (unint64_t)explicitSpIdTypeForSpId:(unint64_t)a3
{
  if (a3 - 3 < 2) {
    return 4;
  }
  else {
    return 5;
  }
}

+ (id)stringForCSSpIdType:(unint64_t)a3
{
  if (a3 - 1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown CSSpIdType: %lu", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_2644297A8[a3 - 1];
  }

  return v3;
}

+ (id)stringForInvocationStyle:(unint64_t)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown InvocationStyle: %lu", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_264429790[a3];
  }

  return v3;
}

@end