@interface SSREnrollmentSamplingMetaDataHelper
+ (id)_convertToMetaDataDict:(id)a3;
+ (id)_getMetaDataForLocale:(id)a3 error:(id *)a4;
+ (id)_getMetaDataForLocale:(id)a3 metaDataDict:(id)a4 error:(id *)a5;
+ (id)_getVoiceProfileAndUpdateMetaDataWithLocale:(id)a3 error:(id *)a4;
+ (id)_getVoiceProfileWithEnrollmentId:(id)a3 error:(id *)a4;
+ (id)_getVoiceProfileWithLocale:(id)a3 error:(id *)a4;
+ (id)_loadMetaDataDict;
+ (id)_writeMetaData:(id)a3 locale:(id)a4;
+ (id)getDonationDataWithEnrollmentId:(id)a3 error:(id *)a4;
+ (id)getDonationIdsWithEnrollmentId:(id)a3 error:(id *)a4;
+ (id)getEnrollmentDateWithLocale:(id)a3 error:(id *)a4;
+ (id)getEnrollmentIdWithLocale:(id)a3 error:(id *)a4;
+ (unint64_t)getEnrollmentSelectionStatusWithLocale:(id)a3 error:(id *)a4;
+ (void)_writeMetaData:(id)a3 locale:(id)a4 completion:(id)a5;
+ (void)_writeMetaDataDict:(id)a3;
+ (void)markFinishStatusForAllWithCompletion:(id)a3;
+ (void)removeAllSamplingMetaData;
+ (void)removeMetaDataWithVoiceProfileId:(id)a3 completion:(id)a4;
+ (void)updateSelectionStatus:(unint64_t)a3 languageCode:(id)a4 completion:(id)a5;
+ (void)writeMetaDataWithSamplingSelectionStatus:(unint64_t)a3 voiceProfileId:(id)a4 locale:(id)a5 completion:(id)a6;
@end

@implementation SSREnrollmentSamplingMetaDataHelper

+ (void)_writeMetaData:(id)a3 locale:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__SSREnrollmentSamplingMetaDataHelper__writeMetaData_locale_completion___block_invoke;
  v13[3] = &unk_26442A4B0;
  id v14 = v7;
  id v8 = v7;
  id v9 = a4;
  id v10 = a3;
  v11 = (void (**)(void, void))MEMORY[0x21D4B2740](v13);
  v12 = +[SSREnrollmentSamplingMetaDataHelper _writeMetaData:v10 locale:v9];

  ((void (**)(void, void *))v11)[2](v11, v12);
}

void __72__SSREnrollmentSamplingMetaDataHelper__writeMetaData_locale_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "+[SSREnrollmentSamplingMetaDataHelper _writeMetaData:locale:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s writeMetaData result error : %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

+ (id)_writeMetaData:(id)a3 locale:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = +[SSREnrollmentSamplingMetaDataHelper _loadMetaDataDict];
    __int16 v8 = v7;
    if (v7)
    {
      id v9 = [v7 objectForKey:v6];

      if (v9)
      {
        uint64_t v10 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315394;
          id v14 = "+[SSREnrollmentSamplingMetaDataHelper _writeMetaData:locale:]";
          __int16 v15 = 2112;
          id v16 = v6;
          _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s locale already exists: %@, overwriting metaData", (uint8_t *)&v13, 0x16u);
        }
      }
      [v8 setObject:v5 forKeyedSubscript:v6];
      +[SSREnrollmentSamplingMetaDataHelper _writeMetaDataDict:v8];
      v11 = 0;
    }
    else
    {
      v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1255 userInfo:&unk_26CD45490];
    }
  }
  else
  {
    v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD45468];
  }

  return v11;
}

+ (void)_writeMetaDataDict:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__SSREnrollmentSamplingMetaDataHelper__writeMetaDataDict___block_invoke;
  v8[3] = &unk_264429A60;
  id v9 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  id v7 = +[SSRVoiceProfileStorePrefs sharedStorePrefs];
  [v7 saveEnrollmentSamplingMetaDataDict:v6];
}

void __58__SSREnrollmentSamplingMetaDataHelper__writeMetaDataDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 dictionaryRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

+ (id)_convertToMetaDataDict:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = v4;
  if (v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__SSREnrollmentSamplingMetaDataHelper__convertToMetaDataDict___block_invoke;
    v7[3] = &unk_264429A38;
    id v8 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v7];
  }

  return v5;
}

void __62__SSREnrollmentSamplingMetaDataHelper__convertToMetaDataDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [[SSREnrollmentSamplingMetaData alloc] initWithDictionary:v6];
  if (v7)
  {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
  }
  else
  {
    id v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      uint64_t v10 = "+[SSREnrollmentSamplingMetaDataHelper _convertToMetaDataDict:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s cannot load metadata for key: %@ with obj: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

+ (id)_loadMetaDataDict
{
  v2 = +[SSRVoiceProfileStorePrefs sharedStorePrefs];
  id v3 = [v2 loadEnrollmentSamplingMetaDataDict];

  if (!v3) {
    id v3 = objc_alloc_init(NSDictionary);
  }
  id v4 = +[SSREnrollmentSamplingMetaDataHelper _convertToMetaDataDict:v3];

  return v4;
}

+ (id)_getMetaDataForLocale:(id)a3 metaDataDict:(id)a4 error:(id *)a5
{
  v32[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (!v8)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Sampling meta data is not loaded"];
    uint64_t v10 = (void *)v21;
    if (!a5) {
      goto LABEL_16;
    }
    v22 = (void *)MEMORY[0x263F087E8];
    v31 = @"reason";
    v32[0] = v21;
    v18 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v19 = v22;
    uint64_t v20 = 1255;
    goto LABEL_15;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v8 allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v15 isEqualToString:v7])
        {
          a5 = [v9 objectForKeyedSubscript:v15];
          goto LABEL_16;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = [NSString stringWithFormat:@"not found for locale: %@", v7];
  uint64_t v10 = (void *)v16;
  if (a5)
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    v28 = @"reason";
    uint64_t v29 = v16;
    v18 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v19 = v17;
    uint64_t v20 = 1254;
LABEL_15:
    *a5 = [v19 errorWithDomain:@"com.apple.speakerrecognition" code:v20 userInfo:v18];

    a5 = 0;
  }
LABEL_16:

  return a5;
}

+ (id)_getMetaDataForLocale:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[SSREnrollmentSamplingMetaDataHelper _loadMetaDataDict];
  id v7 = +[SSREnrollmentSamplingMetaDataHelper _getMetaDataForLocale:v5 metaDataDict:v6 error:a4];

  return v7;
}

+ (id)_getVoiceProfileWithLocale:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SSRVoiceProfileStore sharedInstance];
  id v7 = [v6 loadCurrentVoiceProfiles];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v31 = a4;
    char v11 = 0;
    char v12 = 0;
    uint64_t v13 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v16 = [v15 locale];
        int v17 = [v16 isEqualToString:v5];

        if (v17)
        {
          id v32 = 0;
          char v18 = [v15 isValidForRPIWithError:&v32];
          id v19 = v32;
          uint64_t v20 = v19;
          if (v18)
          {
            id v26 = v15;

            id v27 = v8;
            goto LABEL_24;
          }
          if (!v19)
          {
            if ([0 code] == 1264) {
              [0 code];
            }
            else {
              char v11 = 1;
            }
          }

          char v12 = 1;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    a4 = v31;
    if (v12)
    {
      if (v11)
      {
        uint64_t v21 = [NSString stringWithFormat:@"locale: %@ is found with right domain but donationIds are nil", v5];
        v22 = (void *)MEMORY[0x263F087E8];
        v37 = @"reason";
        v38 = v21;
        v23 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        long long v24 = v22;
        uint64_t v25 = 1265;
      }
      else
      {
        uint64_t v21 = [NSString stringWithFormat:@"locale: %@ is found, but not with domain: %@", v5, @"com.apple.siri"];
        v30 = (void *)MEMORY[0x263F087E8];
        v39 = @"reason";
        v40 = v21;
        v23 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        long long v24 = v30;
        uint64_t v25 = 1264;
      }
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v21 = [NSString stringWithFormat:@"voiceProfile with locale: %@ is not found", v5];
  v28 = (void *)MEMORY[0x263F087E8];
  v41 = @"reason";
  v42 = v21;
  v23 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  long long v24 = v28;
  uint64_t v25 = 1260;
LABEL_21:
  id v27 = [v24 errorWithDomain:@"com.apple.speakerrecognition" code:v25 userInfo:v23];

  if (a4)
  {
    id v27 = v27;
    id v26 = 0;
    *a4 = v27;
  }
  else
  {
    id v26 = 0;
  }
LABEL_24:

  return v26;
}

+ (id)_getVoiceProfileAndUpdateMetaDataWithLocale:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SSREnrollmentSamplingMetaDataHelper _getMetaDataForLocale:v5 error:a4];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 voiceProfileId];
    uint64_t v9 = +[SSREnrollmentSamplingMetaDataHelper _getVoiceProfileWithLocale:v5 error:a4];
    uint64_t v10 = v9;
    if (v9)
    {
      char v11 = [v9 profileID];
      char v12 = [v11 isEqualToString:v8];

      if ((v12 & 1) == 0)
      {
        uint64_t v13 = [SSREnrollmentSamplingMetaData alloc];
        id v14 = [v10 profileID];
        uint64_t v15 = [(SSREnrollmentSamplingMetaData *)v13 initWithSelectionStatus:&unk_26CD455B0 voiceProfileId:v14];

        uint64_t v16 = +[SSREnrollmentSamplingMetaDataHelper _writeMetaData:v15 locale:v5];
        int v17 = (void *)*MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          char v18 = v17;
          id v19 = [v10 profileID];
          int v22 = 136315906;
          v23 = "+[SSREnrollmentSamplingMetaDataHelper _getVoiceProfileAndUpdateMetaDataWithLocale:error:]";
          __int16 v24 = 2112;
          id v25 = v5;
          __int16 v26 = 2112;
          id v27 = v19;
          __int16 v28 = 2112;
          uint64_t v29 = v16;
          _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s update metaData for locale: %@ profileId: %@ with error: %@", (uint8_t *)&v22, 0x2Au);
        }
      }
      id v20 = v10;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_getVoiceProfileWithEnrollmentId:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SSRVoiceProfileStore sharedInstance];
  id v7 = [v6 loadCurrentVoiceProfiles];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v14 = [v13 enrollmentId];
        char v15 = [v14 isEqualToString:v5];

        if (v15)
        {
          a4 = v13;
          uint64_t v16 = v8;
          goto LABEL_12;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (a4)
  {
    uint64_t v16 = [NSString stringWithFormat:@"voiceProfile with enrollmentId: %@ is not found", v5];
    int v17 = (void *)MEMORY[0x263F087E8];
    __int16 v24 = @"reason";
    id v25 = v16;
    char v18 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    *a4 = [v17 errorWithDomain:@"com.apple.speakerrecognition" code:1260 userInfo:v18];

    a4 = 0;
LABEL_12:
  }

  return a4;
}

+ (void)markFinishStatusForAllWithCompletion:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __76__SSREnrollmentSamplingMetaDataHelper_markFinishStatusForAllWithCompletion___block_invoke;
  v38[3] = &unk_26442A4B0;
  id v5 = v4;
  id v39 = v5;
  id v6 = (void (**)(void, void))MEMORY[0x21D4B2740](v38);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = +[SSRVoiceProfileStore sharedInstance];
  uint64_t v9 = [v8 loadCurrentVoiceProfiles];

  if (v9)
  {
    id v31 = a1;
    id v32 = v6;
    id v33 = v5;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        char v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
        if ([v15 isValidForRPIWithError:0])
        {
          uint64_t v16 = [SSREnrollmentSamplingMetaData alloc];
          int v17 = [v15 profileID];
          char v18 = [(SSREnrollmentSamplingMetaData *)v16 initWithSelectionStatus:&unk_26CD45598 voiceProfileId:v17];

          if (!v18)
          {
            long long v22 = NSString;
            long long v23 = [v15 profileID];
            __int16 v24 = [v22 stringWithFormat:@"sampling meta data cannot be created for profileId: %@", v23];

            id v25 = (void *)MEMORY[0x263F087E8];
            v42 = @"reason";
            v43 = v24;
            __int16 v26 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
            uint64_t v27 = [v25 errorWithDomain:@"com.apple.speakerrecognition" code:1267 userInfo:v26];
            char v18 = 0;
LABEL_17:

            id v6 = v32;
            ((void (**)(void, void *))v32)[2](v32, v27);

            goto LABEL_18;
          }
          id v19 = [v15 locale];

          if (!v19)
          {
            __int16 v28 = NSString;
            uint64_t v29 = [v15 profileID];
            __int16 v24 = [v28 stringWithFormat:@"profile locale nil for profileId: %@", v29];

            uint64_t v30 = (void *)MEMORY[0x263F087E8];
            v40 = @"reason";
            v41 = v24;
            __int16 v26 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
            uint64_t v27 = [v30 errorWithDomain:@"com.apple.speakerrecognition" code:1268 userInfo:v26];
            goto LABEL_17;
          }
          long long v20 = [v15 locale];
          [v7 setObject:v18 forKeyedSubscript:v20];
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    [v31 _writeMetaDataDict:v7];
    id v6 = v32;
    v32[2](v32, 0);
LABEL_18:
    id v5 = v33;
  }
  else
  {
    long long v21 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1251 userInfo:&unk_26CD45440];
    ((void (**)(void, void *))v6)[2](v6, v21);
  }
}

void __76__SSREnrollmentSamplingMetaDataHelper_markFinishStatusForAllWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "+[SSREnrollmentSamplingMetaDataHelper markFinishStatusForAllWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s markFinishStatusForAllWithCompletion result error : %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

+ (void)removeAllSamplingMetaData
{
  id v2 = +[SSRVoiceProfileStorePrefs sharedStorePrefs];
  [v2 saveEnrollmentSamplingMetaDataDict:0];
}

+ (id)getDonationDataWithEnrollmentId:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    id v7 = [a1 _getVoiceProfileWithEnrollmentId:v6 error:a4];
    __int16 v8 = v7;
    if (v7)
    {
      id v9 = [v7 getDonationIds];

      if (v9)
      {
        id v21 = v6;
        id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v10 = [v8 getDonationIds];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              uint64_t v16 = [SSRDonationUtteranceData alloc];
              int v17 = [v8 locale];
              char v18 = [(SSRDonationUtteranceData *)v16 initWithDonationInfoString:v15 locale:v17];

              if (v18) {
                [v9 addObject:v18];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v12);
        }

        id v6 = v21;
      }
      id v19 = (void *)[v9 copy];
    }
    else
    {
      id v19 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD45418];
    id v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (void)removeMetaDataWithVoiceProfileId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __83__SSREnrollmentSamplingMetaDataHelper_removeMetaDataWithVoiceProfileId_completion___block_invoke;
  v24[3] = &unk_26442A4B0;
  id v7 = v6;
  id v25 = v7;
  __int16 v8 = (void (**)(void, void))MEMORY[0x21D4B2740](v24);
  id v9 = +[SSREnrollmentSamplingMetaDataHelper _loadMetaDataDict];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __83__SSREnrollmentSamplingMetaDataHelper_removeMetaDataWithVoiceProfileId_completion___block_invoke_24;
  uint64_t v16 = &unk_264429A10;
  id v10 = v5;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  id v19 = &v20;
  [v11 enumerateKeysAndObjectsUsingBlock:&v13];
  +[SSREnrollmentSamplingMetaDataHelper _writeMetaDataDict:](SSREnrollmentSamplingMetaDataHelper, "_writeMetaDataDict:", v11, v13, v14, v15, v16);
  if (*((unsigned char *)v21 + 24))
  {
    v8[2](v8, 0);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1255 userInfo:&unk_26CD453F0];
    ((void (**)(void, void *))v8)[2](v8, v12);
  }
  _Block_object_dispose(&v20, 8);
}

void __83__SSREnrollmentSamplingMetaDataHelper_removeMetaDataWithVoiceProfileId_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "+[SSREnrollmentSamplingMetaDataHelper removeMetaDataWithVoiceProfileId:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s removeMetaDataWithVoiceProfileId result error : %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __83__SSREnrollmentSamplingMetaDataHelper_removeMetaDataWithVoiceProfileId_completion___block_invoke_24(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a2;
  __int16 v8 = [a3 voiceProfileId];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    uint64_t v10 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 136315394;
      uint64_t v13 = "+[SSREnrollmentSamplingMetaDataHelper removeMetaDataWithVoiceProfileId:completion:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s removing voiceProfileId: %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) removeObjectForKey:v7];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (void)updateSelectionStatus:(unint64_t)a3 languageCode:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __85__SSREnrollmentSamplingMetaDataHelper_updateSelectionStatus_languageCode_completion___block_invoke;
  v20[3] = &unk_26442A4B0;
  id v9 = v8;
  id v21 = v9;
  uint64_t v10 = (void (**)(void, void))MEMORY[0x21D4B2740](v20);
  id v19 = 0;
  uint64_t v11 = +[SSREnrollmentSamplingMetaDataHelper _getVoiceProfileWithLocale:v7 error:&v19];
  id v12 = v19;
  if (v11)
  {
    uint64_t v13 = [SSREnrollmentSamplingMetaData alloc];
    __int16 v14 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v15 = [v11 profileID];
    uint64_t v16 = [(SSREnrollmentSamplingMetaData *)v13 initWithSelectionStatus:v14 voiceProfileId:v15];

    if (v16)
    {
      id v17 = +[SSREnrollmentSamplingMetaDataHelper _loadMetaDataDict];
      [v17 setObject:v16 forKeyedSubscript:v7];
      +[SSREnrollmentSamplingMetaDataHelper _writeMetaDataDict:v17];
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD453C8];
      id v17 = (void *)v18;
    }
    v10[2](v10, v18);
  }
  else
  {
    ((void (**)(void, id))v10)[2](v10, v12);
  }
}

void __85__SSREnrollmentSamplingMetaDataHelper_updateSelectionStatus_languageCode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "+[SSREnrollmentSamplingMetaDataHelper updateSelectionStatus:languageCode:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s updateSelectionStatus result error : %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

+ (void)writeMetaDataWithSamplingSelectionStatus:(unint64_t)a3 voiceProfileId:(id)a4 locale:(id)a5 completion:(id)a6
{
  id v15 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(id, void *))a6;
  if (v15 && v9)
  {
    uint64_t v11 = [SSREnrollmentSamplingMetaData alloc];
    id v12 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v13 = [(SSREnrollmentSamplingMetaData *)v11 initWithSelectionStatus:v12 voiceProfileId:v15];

    if (v13)
    {
      +[SSREnrollmentSamplingMetaDataHelper _writeMetaData:v13 locale:v9 completion:v10];
    }
    else
    {
      if (v10)
      {
        __int16 v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD453A0];
        v10[2](v10, v14);
      }
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD45378];
    if (v10) {
      v10[2](v10, v13);
    }
  }
}

+ (id)getDonationIdsWithEnrollmentId:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [a1 getDonationDataWithEnrollmentId:a3 error:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "donationId", (void)v14);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    id v12 = (void *)[v5 copy];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (unint64_t)getEnrollmentSelectionStatusWithLocale:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[SSREnrollmentSamplingMetaDataHelper _getMetaDataForLocale:v5 error:a4];
  if (v6)
  {
    uint64_t v7 = +[SSREnrollmentSamplingMetaDataHelper _getVoiceProfileAndUpdateMetaDataWithLocale:v5 error:a4];

    if (!v7)
    {
      unint64_t v9 = 4;
      goto LABEL_7;
    }
    uint64_t v8 = [v6 selectionStatus];
    unint64_t v9 = [v8 unsignedIntegerValue];
  }
  else
  {
    uint64_t v8 = +[SSREnrollmentSamplingMetaDataHelper _getVoiceProfileWithLocale:v5 error:a4];

    unint64_t v9 = 4 * (v8 == 0);
  }

LABEL_7:
  return v9;
}

+ (id)getEnrollmentIdWithLocale:(id)a3 error:(id *)a4
{
  id v4 = +[SSREnrollmentSamplingMetaDataHelper _getVoiceProfileWithLocale:a3 error:a4];
  id v5 = [v4 enrollmentId];

  return v5;
}

+ (id)getEnrollmentDateWithLocale:(id)a3 error:(id *)a4
{
  id v4 = +[SSREnrollmentSamplingMetaDataHelper _getVoiceProfileWithLocale:a3 error:a4];
  id v5 = [v4 dateAdded];

  return v5;
}

@end