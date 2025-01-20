@interface SSRRequestIdToAudioIdMappingHelper
+ (id)_convertNestedDictionaryToMutable:(id)a3;
+ (id)_loadRequestIdToAudioIdMappingFromPlist;
+ (id)getAudioIdWithRequestId:(id)a3 languageCode:(id)a4 date:(id)a5 error:(id *)a6;
+ (void)_writeMappingIntoPlist:(id)a3;
+ (void)purgeAllEntriesInSpkeakerIdBiome;
+ (void)removeMapping;
+ (void)removeMappingOnAndBefore:(id)a3 completion:(id)a4;
+ (void)removeMappingWithLocale:(id)a3 completion:(id)a4;
+ (void)removeMappingWithLocale:(id)a3 date:(id)a4 completion:(id)a5;
+ (void)writeIntoMappingWithRequestId:(id)a3 audioId:(id)a4 date:(id)a5 locale:(id)a6 completion:(id)a7;
- (SSRVoiceProfileStorePrefs)storePrefs;
- (void)setStorePrefs:(id)a3;
@end

@implementation SSRRequestIdToAudioIdMappingHelper

- (void).cxx_destruct
{
}

- (void)setStorePrefs:(id)a3
{
}

- (SSRVoiceProfileStorePrefs)storePrefs
{
  return self->_storePrefs;
}

+ (void)purgeAllEntriesInSpkeakerIdBiome
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = BiomeLibrary();
  v3 = [v2 Siri];
  v4 = [v3 OnDeviceAnalytics];
  v5 = [v4 SpeakerIdSampling];

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v6 = [v5 pruner];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__SSRRequestIdToAudioIdMappingHelper_purgeAllEntriesInSpkeakerIdBiome__block_invoke;
  v9[3] = &unk_264428E60;
  v9[4] = &v10;
  [v6 deleteWithPolicy:@"Delete all SpeakerId data" eventsPassingTest:v9];

  v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v11[3];
    *(_DWORD *)buf = 136315394;
    v15 = "+[SSRRequestIdToAudioIdMappingHelper purgeAllEntriesInSpkeakerIdBiome]";
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Cleaned up %lu entries", buf, 0x16u);
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __70__SSRRequestIdToAudioIdMappingHelper_purgeAllEntriesInSpkeakerIdBiome__block_invoke(uint64_t a1)
{
  return 1;
}

+ (id)_convertNestedDictionaryToMutable:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = (void *)[a3 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
      uint64_t v10 = [v3 objectForKeyedSubscript:v9];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        break;
      }
      uint64_t v12 = [v3 objectForKeyedSubscript:v9];
      uint64_t v13 = +[SSRRequestIdToAudioIdMappingHelper _convertNestedDictionaryToMutable:v12];
      [v3 setObject:v13 forKeyedSubscript:v9];

      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v3;
}

+ (void)_writeMappingIntoPlist:(id)a3
{
  id v3 = a3;
  id v4 = +[SSRVoiceProfileStorePrefs sharedStorePrefs];
  [v4 saveRequestIdsToAudioIdsMapping:v3];
}

+ (id)_loadRequestIdToAudioIdMappingFromPlist
{
  v2 = +[SSRVoiceProfileStorePrefs sharedStorePrefs];
  id v3 = [v2 loadRequestIdsToAudioIdsMapping];

  id v4 = +[SSRRequestIdToAudioIdMappingHelper _convertNestedDictionaryToMutable:v3];
  if (!v4) {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }

  return v4;
}

+ (void)removeMappingOnAndBefore:(id)a3 completion:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __74__SSRRequestIdToAudioIdMappingHelper_removeMappingOnAndBefore_completion___block_invoke;
  v59[3] = &unk_264429CF8;
  id v46 = v5;
  id v60 = v46;
  id v7 = v6;
  id v61 = v7;
  uint64_t v8 = (void (**)(void, void))MEMORY[0x21D4B2740](v59);
  uint64_t v9 = +[SSRRequestIdToAudioIdMappingHelper _loadRequestIdToAudioIdMappingFromPlist];
  if (v9)
  {
    v40 = v8;
    id v41 = v7;
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v39 = v9;
    obuint64_t j = v9;
    uint64_t v43 = [obj countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (v43)
    {
      uint64_t v42 = *(void *)v56;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v56 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v44 = v11;
          uint64_t v12 = *(void *)(*((void *)&v55 + 1) + 8 * v11);
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          uint64_t v13 = objc_msgSend(obj, "objectForKeyedSubscript:", v12, v39);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v68 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v52;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v52 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v51 + 1) + 8 * i);
                v19 = [MEMORY[0x263F380D0] defaultDateFormatter];
                uint64_t v20 = [v19 dateFromString:v18];

                if ((unint64_t)([v20 compare:v46] + 1) <= 1)
                {
                  v67[0] = v12;
                  v67[1] = v18;
                  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
                  [v10 addObject:v21];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v68 count:16];
            }
            while (v15);
          }

          uint64_t v11 = v44 + 1;
        }
        while (v44 + 1 != v43);
        uint64_t v43 = [obj countByEnumeratingWithState:&v55 objects:v69 count:16];
      }
      while (v43);
    }

    if ([v10 count])
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v22 = v10;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v62 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v48 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v47 + 1) + 8 * j);
            v28 = objc_msgSend(v27, "objectAtIndexedSubscript:", 0, v39);
            v29 = [v27 objectAtIndexedSubscript:1];
            v30 = [obj objectForKeyedSubscript:v28];
            [v30 removeObjectForKey:v29];

            v31 = [obj objectForKeyedSubscript:v28];
            uint64_t v32 = [v31 count];

            if (!v32) {
              [obj removeObjectForKey:v28];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v62 count:16];
        }
        while (v24);
      }

      +[SSRRequestIdToAudioIdMappingHelper _writeMappingIntoPlist:obj];
    }
    else
    {
      v34 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)MEMORY[0x263F380D0];
        v36 = v34;
        v37 = [v35 defaultDateFormatter];
        v38 = [v37 stringFromDate:v46];
        *(_DWORD *)buf = 136315394;
        v64 = "+[SSRRequestIdToAudioIdMappingHelper removeMappingOnAndBefore:completion:]";
        __int16 v65 = 2112;
        v66 = v38;
        _os_log_impl(&dword_21C8A5000, v36, OS_LOG_TYPE_DEFAULT, "%s mapping before date: %@ not found", buf, 0x16u);
      }
    }

    v33 = 0;
    uint64_t v8 = v40;
    id v7 = v41;
    uint64_t v9 = v39;
  }
  else
  {
    v33 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1258 userInfo:&unk_26CD451E8];
  }
  ((void (**)(void, void *))v8)[2](v8, v33);
}

void __74__SSRRequestIdToAudioIdMappingHelper_removeMappingOnAndBefore_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136315650;
    uint64_t v8 = "+[SSRRequestIdToAudioIdMappingHelper removeMappingOnAndBefore:completion:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s remove mapping before and On date: %@ with error: %@", (uint8_t *)&v7, 0x20u);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

+ (void)removeMappingWithLocale:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __73__SSRRequestIdToAudioIdMappingHelper_removeMappingWithLocale_completion___block_invoke;
  uint64_t v20 = &unk_264429CF8;
  id v7 = v5;
  id v21 = v7;
  id v8 = v6;
  id v22 = v8;
  __int16 v9 = (void (**)(void, void))MEMORY[0x21D4B2740](&v17);
  if (v7)
  {
    uint64_t v10 = +[SSRRequestIdToAudioIdMappingHelper _loadRequestIdToAudioIdMappingFromPlist];
    __int16 v11 = v10;
    if (v10)
    {
      id v12 = [v10 objectForKeyedSubscript:v7];

      if (v12)
      {
        [v11 removeObjectForKey:v7];
        +[SSRRequestIdToAudioIdMappingHelper _writeMappingIntoPlist:v11];
        uint64_t v13 = 0;
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = &unk_26CD451C0;
      uint64_t v16 = 113;
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = &unk_26CD45198;
      uint64_t v16 = 1258;
    }
    uint64_t v13 = [v14 errorWithDomain:@"com.apple.speakerrecognition" code:v16 userInfo:v15];
    goto LABEL_9;
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.speakerrecognition", 113, &unk_26CD45170, v17, v18, v19, v20, v21);
LABEL_10:
  ((void (**)(void, void *))v9)[2](v9, v13);
}

void __73__SSRRequestIdToAudioIdMappingHelper_removeMappingWithLocale_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136315650;
    id v8 = "+[SSRRequestIdToAudioIdMappingHelper removeMappingWithLocale:completion:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s remove mapping locale: %@ with error: %@", (uint8_t *)&v7, 0x20u);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

+ (void)removeMapping
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  +[SSRRequestIdToAudioIdMappingHelper _writeMappingIntoPlist:0];
  v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "+[SSRRequestIdToAudioIdMappingHelper removeMapping]";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Deleting all RPI audioId to requestId mapping", (uint8_t *)&v3, 0xCu);
  }
}

+ (void)removeMappingWithLocale:(id)a3 date:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __78__SSRRequestIdToAudioIdMappingHelper_removeMappingWithLocale_date_completion___block_invoke;
  v24[3] = &unk_264428E38;
  id v10 = v7;
  id v25 = v10;
  id v11 = v8;
  id v26 = v11;
  id v12 = v9;
  id v27 = v12;
  uint64_t v13 = (void (**)(void, void))MEMORY[0x21D4B2740](v24);
  if (v10 && v11)
  {
    uint64_t v14 = [MEMORY[0x263F380D0] defaultDateFormatter];
    uint64_t v15 = [v14 stringFromDate:v11];

    if (v15)
    {
      uint64_t v16 = +[SSRRequestIdToAudioIdMappingHelper _loadRequestIdToAudioIdMappingFromPlist];
      if (!v16)
      {
        id v22 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1258 userInfo:&unk_26CD450F8];
        ((void (**)(void, void *))v13)[2](v13, v22);

        uint64_t v17 = 0;
        goto LABEL_14;
      }
      uint64_t v17 = v16;
      uint64_t v18 = [v16 objectForKeyedSubscript:v10];

      if (v18)
      {
        v19 = [v17 objectForKeyedSubscript:v10];
        uint64_t v20 = [v19 objectForKeyedSubscript:v15];

        id v21 = [v17 objectForKeyedSubscript:v10];
        [v21 removeObjectForKey:v15];

        if (v20)
        {
          +[SSRRequestIdToAudioIdMappingHelper _writeMappingIntoPlist:v17];
          v13[2](v13, 0);
LABEL_14:

          goto LABEL_15;
        }
        uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD45148];
        ((void (**)(void, void *))v13)[2](v13, v23);
      }
      else
      {
        uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD45120];
        ((void (**)(void, void *))v13)[2](v13, v23);
      }

      goto LABEL_14;
    }
    uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD450D0];
    ((void (**)(void, void *))v13)[2](v13, v17);
    goto LABEL_14;
  }
  uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD450A8];
  ((void (**)(void, void *))v13)[2](v13, v15);
LABEL_15:
}

void __78__SSRRequestIdToAudioIdMappingHelper_removeMappingWithLocale_date_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 136315906;
    id v9 = "+[SSRRequestIdToAudioIdMappingHelper removeMappingWithLocale:date:completion:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s remove mapping locale: %@ and date: %@ with error: %@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v5 = a1[6];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

+ (void)writeIntoMappingWithRequestId:(id)a3 audioId:(id)a4 date:(id)a5 locale:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v34 = MEMORY[0x263EF8330];
  uint64_t v35 = 3221225472;
  v36 = __99__SSRRequestIdToAudioIdMappingHelper_writeIntoMappingWithRequestId_audioId_date_locale_completion___block_invoke;
  v37 = &unk_264428E10;
  id v16 = v11;
  id v38 = v16;
  id v17 = v12;
  id v39 = v17;
  id v18 = v14;
  id v40 = v18;
  id v19 = v15;
  id v41 = v19;
  uint64_t v20 = (void (**)(void, void))MEMORY[0x21D4B2740](&v34);
  if (v13 && v16 && v17 && v18)
  {
    id v21 = objc_msgSend(MEMORY[0x263F380D0], "defaultDateFormatter", v34, v35, v36, v37, v38, v39, v40);
    id v22 = [v21 stringFromDate:v13];

    if (v22)
    {
      uint64_t v23 = +[SSRRequestIdToAudioIdMappingHelper _loadRequestIdToAudioIdMappingFromPlist];
      uint64_t v24 = v23;
      if (v23)
      {
        id v25 = [v23 objectForKeyedSubscript:v18];

        if (!v25)
        {
          id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [v24 setObject:v26 forKeyedSubscript:v18];
        }
        id v27 = [v24 objectForKeyedSubscript:v18];
        v28 = [v27 objectForKeyedSubscript:v22];

        if (!v28)
        {
          id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v30 = [v24 objectForKeyedSubscript:v18];
          [v30 setObject:v29 forKeyedSubscript:v22];
        }
        v31 = [v24 objectForKeyedSubscript:v18];
        uint64_t v32 = [v31 objectForKeyedSubscript:v22];
        [v32 setObject:v17 forKeyedSubscript:v16];

        +[SSRRequestIdToAudioIdMappingHelper _writeMappingIntoPlist:v24];
        v33 = 0;
      }
      else
      {
        v33 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1258 userInfo:&unk_26CD45080];
      }
      ((void (**)(void, void *))v20)[2](v20, v33);
    }
    else
    {
      uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD45058];
      ((void (**)(void, void *))v20)[2](v20, v24);
    }
  }
  else
  {
    id v22 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.speakerrecognition", 113, &unk_26CD45030, v34, v35, v36, v37, v38, v39, v40);
    ((void (**)(void, void *))v20)[2](v20, v22);
  }
}

void __99__SSRRequestIdToAudioIdMappingHelper_writeIntoMappingWithRequestId_audioId_date_locale_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[6];
    int v9 = 136316162;
    __int16 v10 = "+[SSRRequestIdToAudioIdMappingHelper writeIntoMappingWithRequestId:audioId:date:locale:completion:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s write into mapping for requestId: %@, audioId: %@, locale: %@ with error: %@", (uint8_t *)&v9, 0x34u);
  }
  uint64_t v5 = a1[7];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

+ (id)getAudioIdWithRequestId:(id)a3 languageCode:(id)a4 date:(id)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v10 && v9 && v11)
  {
    __int16 v13 = [MEMORY[0x263F380D0] defaultDateFormatter];
    uint64_t v14 = [v13 stringFromDate:v12];

    if (!v14)
    {
      if (a6)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD44FE0];
        id v22 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v22 = 0;
      }
      goto LABEL_20;
    }
    __int16 v15 = +[SSRRequestIdToAudioIdMappingHelper _loadRequestIdToAudioIdMappingFromPlist];
    uint64_t v16 = v15;
    if (v15)
    {
      __int16 v17 = [v15 objectForKeyedSubscript:v10];
      id v18 = [v17 objectForKeyedSubscript:v14];
      uint64_t v19 = [v18 objectForKeyedSubscript:v9];

      if (v19)
      {
        uint64_t v20 = [v16 objectForKeyedSubscript:v10];
        id v21 = [v20 objectForKeyedSubscript:v14];
        id v22 = [v21 objectForKeyedSubscript:v9];

        if (v22) {
          goto LABEL_19;
        }
      }
      uint64_t v23 = [NSString stringWithFormat:@"requestId: %@ not found in map", v9];
      uint64_t v24 = (void *)v23;
      if (a6)
      {
        id v25 = (void *)MEMORY[0x263F087E8];
        v28 = @"reason";
        v29[0] = v23;
        id v26 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
        *a6 = [v25 errorWithDomain:@"com.apple.speakerrecognition" code:1257 userInfo:v26];
      }
    }
    else if (a6)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1258 userInfo:&unk_26CD45008];
      id v22 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
    id v22 = 0;
    goto LABEL_19;
  }
  if (a6)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD44FB8];
    id v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = 0;
  }
LABEL_21:

  return v22;
}

@end