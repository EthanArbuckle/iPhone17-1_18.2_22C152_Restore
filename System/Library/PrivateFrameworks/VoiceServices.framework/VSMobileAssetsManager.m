@interface VSMobileAssetsManager
+ (BOOL)isVoiceAssetWellDefined:(id)a3;
+ (id)bundleIdentifierForVoiceType:(int64_t)a3;
+ (id)downloadOptionsWithBattery:(BOOL)a3;
+ (id)getLatestAssetFromArray:(id)a3;
+ (id)pickCorrectAssetFromLocalAssets:(id)a3;
+ (id)preinstallAssetsDirectory;
+ (id)queryForLanguage:(id)a3 forType:(int64_t)a4 voiceName:(id)a5 gender:(int64_t)a6 footprint:(int64_t)a7 returnTypes:(int64_t)a8;
+ (id)queryForVoiceResourceAsset:(id)a3 returnTypes:(int64_t)a4;
+ (id)sharedManager;
+ (id)voiceResourceFromAsset:(id)a3;
+ (int64_t)typeFromBundleIdentifier:(id)a3;
- (BOOL)migrateAssetsWithProgress:(id)a3;
- (BOOL)shouldDownloadTrialResource:(id)a3;
- (BOOL)shouldDownloadTrialVoice:(id)a3;
- (NSCache)cachedMAVoiceResources;
- (NSCache)cachedMAVoiceSelections;
- (OS_dispatch_queue)assetQueryQueue;
- (VSMobileAssetsManager)init;
- (VSTrialService)trialService;
- (id)_builtInVoiceForLanguage:(id)a3;
- (id)_getResults:(id)a3;
- (id)_getVoiceAssetsForType:(int64_t)a3 voiceName:(id)a4 language:(id)a5 gender:(int64_t)a6 footprint:(int64_t)a7 returnTypes:(int64_t)a8;
- (id)_installedVoiceResourceAssetForLanguage:(id)a3;
- (id)_localVoiceForLanguageAndNamePath:(id)a3;
- (id)_mobileAssetVoiceForLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 gender:(int64_t)a6 footprint:(int64_t)a7;
- (id)_mobileAssetVoiceResourceWithLanguage:(id)a3;
- (id)_trialVoiceResourceWithLanguage:(id)a3;
- (id)_trialVoiceWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6;
- (id)activeVoiceAssets;
- (id)builtInVoices;
- (id)candidateToDownloadForVoice:(id)a3;
- (id)cleanUnusedAssets;
- (id)definedVoicesForLanguage:(id)a3 voiceName:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6;
- (id)downloadCatalog:(id)a3 options:(id)a4;
- (id)inactiveVoiceAssets;
- (id)installedAssetsForType:(int64_t)a3 voicename:(id)a4 language:(id)a5 gender:(int64_t)a6 footprint:(int64_t)a7;
- (id)installedLocalVoices;
- (id)installedTrialVoiceResources;
- (id)installedTrialVoicesForType:(int64_t)a3 voiceName:(id)a4 language:(id)a5 footprint:(int64_t)a6;
- (id)installedVoiceResources;
- (id)preferredDownloadForVoice:(id)a3;
- (id)preinstallAssetsMetadata;
- (id)preinstalledVoicesForLanguage:(id)a3 gender:(int64_t)a4 name:(id)a5;
- (id)purgeAsset:(id)a3;
- (id)selectPreinstalledVoiceForLanguage:(id)a3 gender:(int64_t)a4 name:(id)a5;
- (id)selectVoiceForLang:(id)a3 name:(id)a4 type:(int64_t)a5 gender:(int64_t)a6 footprint:(int64_t)a7;
- (id)selectVoiceResourceAssetForLanguage:(id)a3;
- (id)voiceAssetFromPreinstallMetadata:(id)a3;
- (id)voiceAssetsForSubscription:(id)a3;
- (id)voiceDataFromAsset:(id)a3;
- (id)voiceDataWithBundleIdentifier:(id)a3 attributes:(id)a4 voicePathCallback:(id)a5;
- (void)_downloadAsset:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)_purgeMobileAsset:(id)a3;
- (void)_removeTrialVoices:(id)a3 completion:(id)a4;
- (void)cancelDownload:(id)a3 completion:(id)a4;
- (void)cancelDownloads:(id)a3 completion:(id)a4;
- (void)cleanMobileAssetVoiceResourcesWithActiveLanguages:(id)a3;
- (void)cleanOldMobileAssetVoiceResources;
- (void)downloadCatalog:(id)a3 options:(id)a4 completion:(id)a5;
- (void)downloadTrialVoiceResource:(id)a3 options:(id)a4 completion:(id)a5;
- (void)downloadVoiceAsset:(id)a3 options:(id)a4 progressUpdateHandler:(id)a5;
- (void)downloadVoiceAsset:(id)a3 useBattery:(BOOL)a4 progressUpdateHandler:(id)a5;
- (void)downloadVoiceResource:(id)a3 completion:(id)a4;
- (void)downloadVoiceResourceCatalogWithCompletion:(id)a3;
- (void)migrateAssetIfNeededWithAssetType:(id)a3;
- (void)removeMobileAssetVoiceResource:(id)a3 completion:(id)a4;
- (void)removeTrialVoice:(id)a3 completion:(id)a4;
- (void)removeTrialVoiceResource:(id)a3 completion:(id)a4;
- (void)removeVoiceAsset:(id)a3 completion:(id)a4;
- (void)removeVoiceResource:(id)a3 completion:(id)a4;
- (void)resetCache;
- (void)resetResourcesCache;
- (void)setAssetQueryQueue:(id)a3;
- (void)setCachedMAVoiceResources:(id)a3;
- (void)setCachedMAVoiceSelections:(id)a3;
- (void)setTrialService:(id)a3;
@end

@implementation VSMobileAssetsManager

- (id)voiceDataWithBundleIdentifier:(id)a3 attributes:(id)a4 voicePathCallback:(id)a5
{
  v24[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = (void (**)(void))a5;
  id v9 = a3;
  v10 = objc_alloc_init(VSVoiceAsset);
  [(VSAssetBase *)v10 setStorage:2];
  [(VSAssetBase *)v10 setBundleIdentifier:v9];
  int64_t v11 = +[VSMobileAssetsManager typeFromBundleIdentifier:v9];

  [(VSVoiceAsset *)v10 setType:v11];
  if (v7)
  {
    [(VSVoiceAsset *)v10 amendNameVersionAndSizeWithMobileAssetAttributes:v7];
    if (v11 == 1)
    {
      v12 = [v7 objectForKeyedSubscript:@"Language"];

      if (v12)
      {
        v13 = [v7 objectForKeyedSubscript:@"Language"];
        v24[0] = v13;
        v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
        [(VSVoiceAsset *)v10 setLanguages:v14];

LABEL_16:
        goto LABEL_17;
      }
    }
    v15 = [v7 objectForKeyedSubscript:@"Gender"];
    [(VSVoiceAsset *)v10 setGender:+[VSVoiceAsset genderFromString:v15]];

    v16 = +[VSVoiceAsset languagesFromMobileAssetAttributes:v7];
    [(VSVoiceAsset *)v10 setLanguages:v16];

    v17 = [v7 objectForKeyedSubscript:@"Footprint"];
    [(VSVoiceAsset *)v10 setFootprint:+[VSVoiceAsset footprintFromString:v17]];

    v18 = [v7 objectForKeyedSubscript:@"Type"];

    if (v18)
    {
      v19 = [v7 objectForKeyedSubscript:@"Type"];
      [(VSVoiceAsset *)v10 setType:+[VSVoiceAsset typeFromString:v19]];
    }
    if ([(VSVoiceAsset *)v10 type] == 4)
    {
      if (v8)
      {
        v13 = v8[2](v8);
        if (v13) {
          BOOL v20 = +[VSNeuralTTSUtils isNeuralVoiceReady:v13];
        }
        else {
          BOOL v20 = 0;
        }
        [(VSVoiceAsset *)v10 setIsVoiceReadyToUse:v20];
        goto LABEL_16;
      }
      v21 = v10;
      uint64_t v22 = 0;
    }
    else
    {
      v21 = v10;
      uint64_t v22 = 1;
    }
    [(VSVoiceAsset *)v21 setIsVoiceReadyToUse:v22];
  }
LABEL_17:

  return v10;
}

+ (int64_t)typeFromBundleIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.MobileAsset.VoiceServicesVocalizerVoice"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"com.apple.MobileAsset.VoiceServices.CustomVoice"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"com.apple.MobileAsset.VoiceServices.GryphonVoice"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)installedTrialVoicesForType:(int64_t)a3 voiceName:(id)a4 language:(id)a5 footprint:(int64_t)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v6 = [(VSTrialService *)self->_trialService definedVoicesWithLanguage:a5 name:a4 type:a3 footprint:a6];
  id v7 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isLocal", (void)v16))
        {
          v14 = [[VSVoiceAssetSelection alloc] initWithTrialVoice:v13];
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)inactiveVoiceAssets
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] set];
  int64_t v4 = [MEMORY[0x263EFF9C0] set];
  v5 = [(VSMobileAssetsManager *)self activeVoiceAssets];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v11 = [v10 asset];

        if (v11)
        {
          v12 = [v10 asset];
          v13 = [v12 assetId];

          if (v13) {
            [v3 addObject:v13];
          }
        }
        else
        {
          v14 = [v10 trialVoice];

          if (!v14) {
            continue;
          }
          v13 = [v10 trialVoice];
          v15 = [v13 factorName];
          [v4 addObject:v15];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v7);
  }
  v47 = v4;
  v49 = v3;
  long long v16 = -[VSMobileAssetsManager installedAssetsForType:voicename:language:gender:footprint:](self, "installedAssetsForType:voicename:language:gender:footprint:", 0, 0, 0, 0, 0, v5);
  id v48 = [MEMORY[0x263EFF980] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (!v18) {
    goto LABEL_41;
  }
  uint64_t v19 = v18;
  uint64_t v20 = *(void *)v52;
  id v50 = v17;
  do
  {
    for (uint64_t j = 0; j != v19; ++j)
    {
      if (*(void *)v52 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void **)(*((void *)&v51 + 1) + 8 * j);
      if ([v22 isInstalled])
      {
        v23 = [v22 voiceData];
        uint64_t v24 = [v23 footprint];

        if (v24 != 1)
        {
          v25 = [v22 asset];

          if (v25)
          {
            v26 = [v22 asset];
            v27 = [v26 assetId];

            if (v27 && [v49 containsObject:v27])
            {
              v28 = VSGetLogDefault();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = [v22 asset];
                v30 = [v29 attributes];
                *(_DWORD *)buf = 138412290;
                v60 = v30;
                _os_log_impl(&dword_20CABC000, v28, OS_LOG_TYPE_DEFAULT, "#MobileAsset current in-use asset, %@", buf, 0xCu);

                id v17 = v50;
              }
              goto LABEL_36;
            }
            v31 = [v22 asset];
            v32 = [v31 assetType];
            if ([v32 isEqualToString:@"com.apple.MobileAsset.VoiceServicesVocalizerVoice"])
            {

LABEL_34:
              v28 = VSGetLogDefault();
              id v17 = v50;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v43 = [v22 asset];
                v44 = [v43 attributes];
                *(_DWORD *)buf = 138412290;
                v60 = v44;
                _os_log_impl(&dword_20CABC000, v28, OS_LOG_TYPE_DEFAULT, "#MobileAsset ignore VoiceOver asset, %@", buf, 0xCu);
              }
LABEL_36:

              continue;
            }
            v40 = [v22 asset];
            v41 = [v40 assetType];
            int v42 = [v41 isEqualToString:@"com.apple.MobileAsset.VoiceServices.CustomVoice"];

            if (v42) {
              goto LABEL_34;
            }

            id v17 = v50;
LABEL_38:
            [v48 addObject:v22];
            continue;
          }
          v33 = [v22 trialVoice];

          if (!v33) {
            goto LABEL_38;
          }
          v34 = [v22 trialVoice];
          v35 = [v34 factorName];
          int v36 = [v47 containsObject:v35];

          if (!v36) {
            goto LABEL_38;
          }
          v37 = VSGetLogDefault();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = [v22 trialVoice];
            v39 = [v38 factorName];
            *(_DWORD *)buf = 138412290;
            v60 = v39;
            _os_log_impl(&dword_20CABC000, v37, OS_LOG_TYPE_DEFAULT, "#Trial current in-use asset, %@", buf, 0xCu);
          }
        }
      }
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v51 objects:v61 count:16];
  }
  while (v19);
LABEL_41:

  return v48;
}

void __84__VSMobileAssetsManager_installedAssetsForType_voicename_language_gender_footprint___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) _getVoiceAssetsForType:a3 voiceName:*(void *)(a1 + 40) language:*(void *)(a1 + 48) gender:*(void *)(a1 + 56) footprint:*(void *)(a1 + 64) returnTypes:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 wasLocal])
        {
          v12 = objc_alloc_init(VSVoiceAssetSelection);
          [(VSVoiceAssetSelection *)v12 setAsset:v11];
          v13 = [*(id *)(a1 + 32) voiceDataFromAsset:v11];
          [(VSVoiceAssetSelection *)v12 setVoiceData:v13];

          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (id)voiceDataFromAsset:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 assetType];
    uint64_t v7 = [v5 attributes];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__VSMobileAssetsManager_voiceDataFromAsset___block_invoke;
    v11[3] = &unk_2640E8288;
    id v8 = v5;
    id v12 = v8;
    uint64_t v9 = [(VSMobileAssetsManager *)self voiceDataWithBundleIdentifier:v6 attributes:v7 voicePathCallback:v11];

    objc_msgSend(v9, "setIsInstalled:", objc_msgSend(v8, "wasLocal"));
    objc_msgSend(v9, "setIsPurgeable:", objc_msgSend(v8, "wasPurgeable"));
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_getVoiceAssetsForType:(int64_t)a3 voiceName:(id)a4 language:(id)a5 gender:(int64_t)a6 footprint:(int64_t)a7 returnTypes:(int64_t)a8
{
  uint64_t v9 = +[VSMobileAssetsManager queryForLanguage:a5 forType:a3 voiceName:a4 gender:a6 footprint:a7 returnTypes:a8];
  uint64_t v10 = [(VSMobileAssetsManager *)self _getResults:v9];

  return v10;
}

- (id)_getResults:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __37__VSMobileAssetsManager__getResults___block_invoke;
  uint64_t v19 = &unk_2640E81F0;
  uint64_t v21 = &v22;
  id v5 = v4;
  uint64_t v20 = v5;
  [v3 queryMetaData:&v16];
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    uint64_t v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = objc_msgSend(v3, "assetType", v16, v17, v18, v19);
      *(_DWORD *)buf = 138412290;
      v27 = v8;
      _os_log_impl(&dword_20CABC000, v7, OS_LOG_TYPE_INFO, "#MobileAsset ERROR query '%@', timeout after 1 sec", buf, 0xCu);
    }
    id v9 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    if (v23[3])
    {
      uint64_t v10 = VSGetLogDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = objc_msgSend(v3, "assetType", v16, v17, v18, v19);
        id v12 = MEMORY[0x210553D90](v23[3]);
        *(_DWORD *)buf = 138412546;
        v27 = v11;
        __int16 v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_20CABC000, v10, OS_LOG_TYPE_INFO, "#MobileAsset WARNING query '%@', error: %@", buf, 0x16u);
      }
    }
    uint64_t v13 = objc_msgSend(v3, "results", v16, v17, v18, v19);
    uint64_t v7 = v13;
    long long v14 = (void *)MEMORY[0x263EFFA68];
    if (v13) {
      long long v14 = (void *)v13;
    }
    id v9 = v14;
  }

  _Block_object_dispose(&v22, 8);
  return v9;
}

+ (id)queryForLanguage:(id)a3 forType:(int64_t)a4 voiceName:(id)a5 gender:(int64_t)a6 footprint:(int64_t)a7 returnTypes:(int64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  if (queryForLanguage_forType_voiceName_gender_footprint_returnTypes__onceToken != -1) {
    dispatch_once(&queryForLanguage_forType_voiceName_gender_footprint_returnTypes__onceToken, &__block_literal_global_463);
  }
  id v16 = objc_alloc(MEMORY[0x263F55950]);
  uint64_t v17 = [a1 bundleIdentifierForVoiceType:a4];
  uint64_t v18 = (void *)[v16 initWithType:v17];

  [v18 returnTypes:a8];
  if (v14)
  {
    if ((unint64_t)(a4 - 3) > 1)
    {
      uint64_t v21 = [MEMORY[0x263EFF980] arrayWithObject:v14];
      [v18 addKeyValueArray:@"Languages" with:v21];
      int v22 = 0;
LABEL_9:

      if (!a7) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    uint64_t v19 = [v14 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    uint64_t v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v14, v19, 0);
    [v18 addKeyValueArray:@"LanguagesCompatibility" with:v20];

LABEL_7:
    uint64_t v21 = +[VSVoiceAsset typeStringFromType:a4];
    [v18 addKeyValuePair:@"Type" with:v21];
    int v22 = 1;
    goto LABEL_9;
  }
  if ((unint64_t)(a4 - 3) <= 1) {
    goto LABEL_7;
  }
  int v22 = 0;
  if (a7)
  {
LABEL_10:
    v23 = +[VSVoiceAsset footprintStringFromFootprint:a7];
    [v18 addKeyValuePair:@"Footprint" with:v23];
  }
LABEL_11:
  if (a6)
  {
    uint64_t v24 = +[VSVoiceAsset genderStringFromGender:a6];
    [v18 addKeyValuePair:@"Gender" with:v24];
  }
  if (v15) {
    [v18 addKeyValuePair:@"Name" with:v15];
  }
  uint64_t v25 = &queryForLanguage_forType_voiceName_gender_footprint_returnTypes__customVersions;
  if (v22) {
    uint64_t v25 = &queryForLanguage_forType_voiceName_gender_footprint_returnTypes__gryphonVersions;
  }
  [v18 addKeyValueArray:*MEMORY[0x263F55868] with:*v25];

  return v18;
}

+ (id)bundleIdentifierForVoiceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  else {
    return off_2640E82A8[a3 - 1];
  }
}

- (id)activeVoiceAssets
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  dispatch_semaphore_t v4 = +[VSPreferencesInterface defaultInstance];
  id v5 = [v4 subscribedVoicesForClientID:0 accessoryID:0];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[VSMobileAssetsManager voiceAssetsForSubscription:](self, "voiceAssetsForSubscription:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v3 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v3;
}

- (id)installedAssetsForType:(int64_t)a3 voicename:(id)a4 language:(id)a5 gender:(int64_t)a6 footprint:(int64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  long long v14 = (void *)MEMORY[0x263EFF980];
  long long v15 = [(VSMobileAssetsManager *)self installedTrialVoicesForType:a3 voiceName:v12 language:v13 footprint:a7];
  long long v16 = [v14 arrayWithArray:v15];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __84__VSMobileAssetsManager_installedAssetsForType_voicename_language_gender_footprint___block_invoke;
  v25[3] = &unk_2640E8098;
  v25[4] = self;
  id v26 = v12;
  id v27 = v13;
  int64_t v28 = a6;
  int64_t v29 = a7;
  id v17 = v13;
  id v18 = v12;
  uint64_t v19 = MEMORY[0x210554730](v25);
  uint64_t v20 = (void (**)(void, void, void))v19;
  uint64_t v21 = *(void (**)(void))(v19 + 16);
  int v22 = v16;
  if (a3)
  {
    int64_t v23 = a3;
  }
  else
  {
    v21();
    ((void (**)(void, void *, uint64_t))v20)[2](v20, v16, 3);
    ((void (**)(void, void *, uint64_t))v20)[2](v20, v16, 1);
    uint64_t v21 = (void (*)(void))v20[2];
    uint64_t v19 = (uint64_t)v20;
    int v22 = v16;
    int64_t v23 = 2;
  }
  ((void (*)(uint64_t, void *, int64_t))v21)(v19, v22, v23);

  return v16;
}

intptr_t __37__VSMobileAssetsManager__getResults___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_74);
  }
  v2 = (void *)sharedManager___sharedManager;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialService, 0);
  objc_storeStrong((id *)&self->_cachedMAVoiceResources, 0);
  objc_storeStrong((id *)&self->_cachedMAVoiceSelections, 0);
  objc_storeStrong((id *)&self->_assetQueryQueue, 0);
}

- (void)setTrialService:(id)a3
{
}

- (VSTrialService)trialService
{
  return self->_trialService;
}

- (void)setCachedMAVoiceResources:(id)a3
{
}

- (NSCache)cachedMAVoiceResources
{
  return self->_cachedMAVoiceResources;
}

- (void)setCachedMAVoiceSelections:(id)a3
{
}

- (NSCache)cachedMAVoiceSelections
{
  return self->_cachedMAVoiceSelections;
}

- (void)setAssetQueryQueue:(id)a3
{
}

- (OS_dispatch_queue)assetQueryQueue
{
  return self->_assetQueryQueue;
}

id __44__VSMobileAssetsManager_voiceDataFromAsset___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) getLocalUrl];
  v2 = [v1 path];

  return v2;
}

- (id)installedLocalVoices
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v25 = 0;
  dispatch_semaphore_t v4 = [v3 contentsOfDirectoryAtPath:@"/private/var/mobile/Library/VoiceServices/voices/" error:&v25];
  id v5 = v25;

  if (!v5)
  {
    id v19 = [MEMORY[0x263EFF980] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (!v7) {
      goto LABEL_19;
    }
    uint64_t v8 = v7;
    uint64_t v20 = self;
    id v17 = 0;
    id v18 = v4;
    uint64_t v9 = *(void *)v22;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "componentsSeparatedByString:", @"_", v17, v18);
        if ([v12 count] == 2)
        {
          id v13 = [v12 firstObject];
          if ([v13 length])
          {
            long long v14 = [v12 lastObject];
            uint64_t v15 = [v14 length];

            if (!v15) {
              goto LABEL_16;
            }
            id v13 = [(VSMobileAssetsManager *)v20 _localVoiceForLanguageAndNamePath:v11];
            if (v13) {
              [v19 addObject:v13];
            }
          }
        }
LABEL_16:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (!v8)
      {
        id v5 = v17;
        dispatch_semaphore_t v4 = v18;
        goto LABEL_19;
      }
    }
  }
  id v6 = VSGetLogDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v5;
    _os_log_error_impl(&dword_20CABC000, v6, OS_LOG_TYPE_ERROR, "Unable to query local voice directory, %@", buf, 0xCu);
  }
  id v19 = (id)MEMORY[0x263EFFA68];
LABEL_19:

  return v19;
}

- (id)_localVoiceForLanguageAndNamePath:(id)a3
{
  v30[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSString;
  v30[0] = @"/private/var/mobile/Library/VoiceServices/voices/";
  v30[1] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  uint64_t v7 = [v5 pathWithComponents:v6];

  uint64_t v8 = NSString;
  v29[0] = v7;
  v29[1] = @"AssetData";
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  uint64_t v10 = [v8 pathWithComponents:v9];

  uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
  int v12 = [v11 fileExistsAtPath:v10];

  if (v12)
  {
    id v13 = objc_alloc_init(VSVoiceAssetSelection);
    [(VSVoiceAssetSelection *)v13 setBuiltInVoicePath:v10];
    long long v14 = NSDictionary;
    uint64_t v15 = NSString;
    v28[0] = v7;
    v28[1] = @"Info.plist";
    long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    id v17 = [v15 pathWithComponents:v16];
    id v18 = [v14 dictionaryWithContentsOfFile:v17];

    id v19 = [v18 objectForKeyedSubscript:@"CFBundleIdentifier"];
    uint64_t v20 = [v18 objectForKeyedSubscript:@"MobileAssetProperties"];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    id v25 = __59__VSMobileAssetsManager__localVoiceForLanguageAndNamePath___block_invoke;
    id v26 = &unk_2640E8288;
    id v27 = v10;
    long long v21 = [(VSMobileAssetsManager *)self voiceDataWithBundleIdentifier:v19 attributes:v20 voicePathCallback:&v23];

    objc_msgSend(v21, "setIsInstalled:", 1, v23, v24, v25, v26);
    [v21 setMasteredVersion:@"local_voice"];
    [(VSVoiceAssetSelection *)v13 setVoiceData:v21];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id __59__VSMobileAssetsManager__localVoiceForLanguageAndNamePath___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_builtInVoiceForLanguage:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (__CFString *)a3;
  uint64_t v10 = 0;
  id v4 = (__CFString *)VSVocalizerCopyPathForBuiltInVoice(v3, &v10);
  id v5 = v10;
  if (v4)
  {
    id v6 = objc_alloc_init(VSVoiceAssetSelection);
    [(VSVoiceAssetSelection *)v6 setBuiltInVoicePath:v4];
    uint64_t v7 = objc_alloc_init(VSVoiceAsset);
    [(VSAssetBase *)v7 setStorage:1];
    [(VSVoiceAsset *)v7 setIsInstalled:1];
    [(VSVoiceAsset *)v7 setIsBuiltInVoice:1];
    [(VSVoiceAsset *)v7 setType:1];
    uint64_t v11 = v5;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
    [(VSVoiceAsset *)v7 setLanguages:v8];

    [(VSVoiceAsset *)v7 setFootprint:1];
    [(VSVoiceAsset *)v7 setIsVoiceReadyToUse:1];
    [(VSVoiceAssetSelection *)v6 setVoiceData:v7];
  }
  else
  {
    VSGetLogDefault();
    uint64_t v7 = (VSVoiceAsset *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v3;
      _os_log_error_impl(&dword_20CABC000, &v7->super.super, OS_LOG_TYPE_ERROR, "#MobileAsset Couldn't find any built-in voice for language: %{public}@", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (void)_purgeMobileAsset:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  switch([v3 state])
  {
    case 0:
    case 1:
      uint64_t v8 = VSGetLogEvent();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      uint64_t v9 = [v3 attributes];
      int v16 = 138543362;
      id v17 = v9;
      uint64_t v11 = "#MobileAsset Purge cannot find asset: %{public}@";
      goto LABEL_17;
    case 2:
    case 3:
    case 6:
      id v4 = VSGetLogEvent();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [v3 attributes];
        int v16 = 138543362;
        id v17 = v5;
        _os_log_impl(&dword_20CABC000, v4, OS_LOG_TYPE_DEFAULT, "#MobileAsset purge asset: %{public}@", (uint8_t *)&v16, 0xCu);
      }
      uint64_t v6 = [v3 purgeSync];
      if (!v6) {
        goto LABEL_20;
      }
      uint64_t v7 = v6;
      uint64_t v8 = VSGetLogDefault();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      uint64_t v9 = MEMORY[0x210553D80](v7);
      int v16 = 138412290;
      id v17 = v9;
      uint64_t v10 = "#MobileAsset purge error: %@";
      break;
    case 4:
      int v12 = VSGetLogEvent();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v3 attributes];
        int v16 = 138543362;
        id v17 = v13;
        _os_log_impl(&dword_20CABC000, v12, OS_LOG_TYPE_DEFAULT, "#MobileAsset cancel downloading asset: %{public}@", (uint8_t *)&v16, 0xCu);
      }
      uint64_t v14 = [v3 cancelDownloadSync];
      if (!v14) {
        goto LABEL_20;
      }
      uint64_t v15 = v14;
      uint64_t v8 = VSGetLogEvent();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      uint64_t v9 = MEMORY[0x210553D50](v15);
      int v16 = 138412290;
      id v17 = v9;
      uint64_t v10 = "#MobileAsset Cancel download error: %@";
      break;
    case 5:
      uint64_t v8 = VSGetLogEvent();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      uint64_t v9 = [v3 attributes];
      int v16 = 138543362;
      id v17 = v9;
      uint64_t v11 = "#MobileAsset not removed because it is required by the OS: %{public}@";
LABEL_17:
      _os_log_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
      goto LABEL_18;
    default:
      goto LABEL_20;
  }
  _os_log_error_impl(&dword_20CABC000, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, 0xCu);
LABEL_18:

LABEL_19:
LABEL_20:
}

- (id)purgeAsset:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v5 = [v4 asset];

  if (v5)
  {
    uint64_t v6 = [v4 asset];
    [(VSMobileAssetsManager *)self _purgeMobileAsset:v6];
  }
  else
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    uint64_t v8 = [v4 voiceData];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __36__VSMobileAssetsManager_purgeAsset___block_invoke;
    v12[3] = &unk_2640E8070;
    uint64_t v14 = &v15;
    uint64_t v6 = v7;
    id v13 = v6;
    [(VSMobileAssetsManager *)self removeTrialVoice:v8 completion:v12];

    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }

  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"com.apple.voiceservices.notification.voice-purge" object:v4];

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __36__VSMobileAssetsManager_purgeAsset___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_downloadAsset:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __68__VSMobileAssetsManager__downloadAsset_options_progress_completion___block_invoke;
  v36[3] = &unk_2640E8240;
  id v13 = v11;
  id v37 = v13;
  uint64_t v14 = (void *)MEMORY[0x210554730](v36);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __68__VSMobileAssetsManager__downloadAsset_options_progress_completion___block_invoke_2;
  v33[3] = &unk_2640E8218;
  id v15 = v9;
  id v34 = v15;
  id v16 = v12;
  id v35 = v16;
  uint64_t v17 = (void *)MEMORY[0x210554730](v33);
  unint64_t v18 = [v15 state];
  if (v18 <= 6)
  {
    if (((1 << v18) & 0x6C) != 0)
    {
      id v19 = VSGetLogEvent();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v15 attributes];
        *(_DWORD *)buf = 138543362;
        v41 = v20;
        _os_log_impl(&dword_20CABC000, v19, OS_LOG_TYPE_DEFAULT, "#MobileAsset download skipped, asset is already installed: %{public}@", buf, 0xCu);
      }
      if (v16) {
        (*((void (**)(id, void))v16 + 2))(v16, 0);
      }
    }
    else if (((1 << v18) & 0x12) != 0)
    {
      uint64_t v21 = [v15 state];
      long long v22 = VSGetLogEvent();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v21 == 1)
      {
        if (v23)
        {
          if ([v10 discretionary]) {
            uint64_t v24 = @"discretionary";
          }
          else {
            uint64_t v24 = @"immediate";
          }
          int v25 = [v10 allowsCellularAccess];
          id v26 = [v15 attributes];
          *(_DWORD *)buf = 138412802;
          v41 = v24;
          __int16 v42 = 1024;
          int v43 = v25;
          __int16 v44 = 2112;
          v45 = v26;
          _os_log_impl(&dword_20CABC000, v22, OS_LOG_TYPE_DEFAULT, "#MobileAsset Begin %@ download, allowing cellular %{BOOL}d: %@", buf, 0x1Cu);
        }
      }
      else if (v23)
      {
        v32 = [v15 attributes];
        *(_DWORD *)buf = 138543362;
        v41 = v32;
        _os_log_impl(&dword_20CABC000, v22, OS_LOG_TYPE_DEFAULT, "#MobileAsset Asset is already downloading: %{public}@", buf, 0xCu);
      }
      if (v13) {
        [v15 attachProgressCallBack:v14];
      }
      [v15 startDownload:v10 then:v17];
    }
    else
    {
      id v27 = VSGetLogEvent();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [v15 attributes];
        *(_DWORD *)buf = 138543362;
        v41 = v28;
        _os_log_impl(&dword_20CABC000, v27, OS_LOG_TYPE_DEFAULT, "#MobileAsset download skipped, asset is in an unknown state: %{public}@", buf, 0xCu);
      }
      if (v16)
      {
        uint64_t v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v38 = *MEMORY[0x263F08320];
        v39 = @"Asset is in an unknown state";
        uint64_t v30 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        v31 = [v29 errorWithDomain:@"VSMobileAssetServiceErrorDomain" code:-5000 userInfo:v30];
        (*((void (**)(id, void *))v16 + 2))(v16, v31);
      }
    }
  }
}

void __68__VSMobileAssetsManager__downloadAsset_options_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v8 = v3;
    double v4 = -1.0;
    if (([v3 isStalled] & 1) == 0)
    {
      [v8 expectedTimeRemaining];
      double v4 = v5;
    }
    if ([v8 totalExpected] < 1)
    {
      v6.n128_u64[0] = 0;
    }
    else
    {
      float v7 = (float)[v8 totalWritten];
      v6.n128_f32[0] = v7 / (float)[v8 totalExpected];
    }
    (*(void (**)(double, __n128))(*(void *)(a1 + 32) + 16))(v4, v6);
    id v3 = v8;
  }
}

void __68__VSMobileAssetsManager__downloadAsset_options_progress_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v4 = VSGetLogEvent();
  double v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v10 = MEMORY[0x210553D60](a2);
      id v11 = [*(id *)(a1 + 32) attributes];
      *(_DWORD *)buf = 138412546;
      id v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_error_impl(&dword_20CABC000, v5, OS_LOG_TYPE_ERROR, "#MobileAsset err %@, unable to download asset %{public}@", buf, 0x16u);
    }
    __n128 v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    id v13 = @"Unable to download asset";
    double v5 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    float v7 = [v6 errorWithDomain:@"VSMobileAssetServiceErrorDomain" code:a2 userInfo:v5];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) attributes];
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_impl(&dword_20CABC000, v5, OS_LOG_TYPE_DEFAULT, "#MobileAsset Finished downloading asset %{public}@", buf, 0xCu);
    }
    float v7 = 0;
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
  }
}

- (void)downloadCatalog:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F559B8]);
    objc_msgSend(v8, "setAllowsCellularAccess:", +[VSUtilities isWatch](VSUtilities, "isWatch") ^ 1);
    [v8 setDiscretionary:0];
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:v7];
  uint64_t v11 = [v10 lastFetchDate];
  if (!v11) {
    goto LABEL_5;
  }
  uint64_t v12 = (void *)v11;
  id v13 = [MEMORY[0x263EFF910] date];
  uint64_t v14 = [v10 lastFetchDate];
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v16 >= 3600.0)
  {
LABEL_5:
    uint64_t v17 = (void *)MEMORY[0x263F55938];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __60__VSMobileAssetsManager_downloadCatalog_options_completion___block_invoke;
    v18[3] = &unk_2640E8218;
    id v19 = v7;
    id v20 = v9;
    [v17 startCatalogDownload:v19 options:v8 then:v18];
  }
}

void __60__VSMobileAssetsManager_downloadCatalog_options_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a2)
  {
    double v4 = VSGetLogEvent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = MEMORY[0x210553D60](v2);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_error_impl(&dword_20CABC000, v4, OS_LOG_TYPE_ERROR, "#MobileAsset Catalog '%@' download error: %@", buf, 0x16u);
    }
    double v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    id v13 = @"Unable to download catalog";
    __n128 v6 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v2 = [v5 errorWithDomain:@"VSMobileAssetServiceErrorDomain" code:v2 userInfo:v6];
  }
  id v7 = [MEMORY[0x263EFF9F0] currentRunLoop];
  id v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.1];
  [v7 runUntilDate:v8];

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v2);
  }
}

- (id)downloadCatalog:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__VSMobileAssetsManager_downloadCatalog_options___block_invoke;
  v12[3] = &unk_2640E8070;
  uint64_t v14 = &v15;
  uint64_t v9 = v8;
  id v13 = v9;
  [(VSMobileAssetsManager *)self downloadCatalog:v6 options:v7 completion:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __49__VSMobileAssetsManager_downloadCatalog_options___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)removeVoiceResource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__VSMobileAssetsManager_removeVoiceResource_completion___block_invoke;
  v10[3] = &unk_2640E81C8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(VSMobileAssetsManager *)self removeTrialVoiceResource:v9 completion:v10];
}

uint64_t __56__VSMobileAssetsManager_removeVoiceResource_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeMobileAssetVoiceResource:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)removeMobileAssetVoiceResource:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void))a4;
  id v7 = +[VSMobileAssetsManager queryForVoiceResourceAsset:a3 returnTypes:2];
  id v8 = [(VSMobileAssetsManager *)self _getResults:v7];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(VSMobileAssetsManager *)self _purgeMobileAsset:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
  if (v6) {
    v6[2](v6, 0);
  }
}

- (void)removeTrialVoiceResource:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [VSTrialVoiceResource alloc];
  uint64_t v9 = [v7 languages];

  uint64_t v10 = [v9 firstObject];
  uint64_t v11 = [(VSTrialVoiceResource *)v8 initWithLanguage:v10];

  [(VSTrialService *)self->_trialService removeVoiceResource:v11 completion:v6];
}

- (void)downloadTrialVoiceResource:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = VSGetLogEvent();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_impl(&dword_20CABC000, v11, OS_LOG_TYPE_DEFAULT, "#Trial Enqueue downloading resource: %@", buf, 0xCu);
  }

  uint64_t v12 = objc_alloc_init(VSDownloadOptions);
  -[VSDownloadOptions setAllowDiscretionary:](v12, "setAllowDiscretionary:", [v10 discretionary]);
  uint64_t v13 = [v10 allowsCellularAccess];

  [(VSDownloadOptions *)v12 setAllowCellularData:v13];
  trialService = self->_trialService;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__VSMobileAssetsManager_downloadTrialVoiceResource_options_completion___block_invoke;
  v18[3] = &unk_2640E8150;
  id v19 = v8;
  id v20 = self;
  uint64_t v21 = v12;
  id v22 = v9;
  long long v15 = v12;
  id v16 = v9;
  id v17 = v8;
  [(VSTrialService *)trialService downloadNamespaceImmediatelyIfNeededWithOption:v15 completion:v18];
}

void __71__VSMobileAssetsManager_downloadTrialVoiceResource_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    double v5 = VSGetLogEvent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138412546;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_error_impl(&dword_20CABC000, v5, OS_LOG_TYPE_ERROR, "#Trial Error downloading resource: %@, error: %@", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
LABEL_12:
      v7();
    }
  }
  else if ([*(id *)(a1 + 40) shouldDownloadTrialResource:*(void *)(a1 + 32)])
  {
    id v8 = VSGetLogEvent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v16 = 138412290;
      uint64_t v17 = v9;
      _os_log_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEFAULT, "#Trial Start downloading for: %@", (uint8_t *)&v16, 0xCu);
    }

    id v10 = [VSTrialVoiceResource alloc];
    uint64_t v11 = [*(id *)(a1 + 32) languages];
    uint64_t v12 = [v11 firstObject];
    uint64_t v13 = [(VSTrialVoiceResource *)v10 initWithLanguage:v12];

    [*(id *)(*(void *)(a1 + 40) + 32) downloadVoiceResource:v13 withOptions:*(void *)(a1 + 48) progress:0 completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 56);
    if (v14)
    {
      id v7 = *(void (**)(void))(v14 + 16);
      goto LABEL_12;
    }
  }
}

- (void)downloadVoiceResourceCatalogWithCompletion:(id)a3
{
}

- (void)downloadVoiceResource:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[VSMobileAssetsManager downloadOptionsWithBattery:1];
  [(VSMobileAssetsManager *)self downloadVoiceResource:v7 options:v8 completion:v6];
}

- (BOOL)shouldDownloadTrialResource:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  trialService = self->_trialService;
  id v6 = [v4 languages];
  id v7 = [v6 firstObject];
  id v8 = [(VSTrialService *)trialService definedVoiceResourcesWithLanguage:v7];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (!v10)
  {

LABEL_16:
    uint64_t v12 = VSGetLogDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v4;
      _os_log_error_impl(&dword_20CABC000, v12, OS_LOG_TYPE_ERROR, "#Trial Cannot find any Trial resource, skip downloading. Target resource: %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v30;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v30 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      unint64_t v16 = objc_msgSend(v15, "version", (void)v29);
      if (v16 > [v12 version])
      {
        uint64_t v17 = v15;

        uint64_t v12 = v17;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
  }
  while (v11);

  if (!v12) {
    goto LABEL_16;
  }
  if (![v12 isLocal])
  {
    uint64_t v21 = [v4 languages];
    id v22 = [v21 firstObject];
    BOOL v23 = [(VSMobileAssetsManager *)self _mobileAssetVoiceResourceWithLanguage:v22];

    BOOL v19 = v23 == 0;
    if (v23)
    {
      unint64_t v24 = [v12 version];
      uint64_t v25 = [v23 contentVersion];
      unint64_t v26 = [v25 integerValue];

      if (v24 > v26)
      {
        BOOL v19 = 1;
LABEL_29:

        goto LABEL_19;
      }
      id v27 = VSGetLogDefault();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v4;
        id v28 = "#Trial Found same or newer resource in MobileAsset, skip downloading. Target resource: %@";
        goto LABEL_27;
      }
    }
    else
    {
      id v27 = VSGetLogDefault();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v4;
        id v28 = "#Trial No MobileAsset resource found, will download Trial resource. Target resource: %@";
LABEL_27:
        _os_log_impl(&dword_20CABC000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
      }
    }

    goto LABEL_29;
  }
  __int16 v18 = VSGetLogDefault();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v12;
    _os_log_impl(&dword_20CABC000, v18, OS_LOG_TYPE_DEFAULT, "#Trial Found local resource, skip downloading. Target resource: %@", buf, 0xCu);
  }

LABEL_18:
  BOOL v19 = 0;
LABEL_19:

  return v19;
}

- (void)removeVoiceAsset:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    id v9 = VSGetLogEvent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 description];
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v10;
      _os_log_impl(&dword_20CABC000, v9, OS_LOG_TYPE_DEFAULT, "Removing voice: %{public}@", buf, 0xCu);
    }
    uint64_t v11 = [v6 type];
    uint64_t v12 = [v6 name];
    uint64_t v13 = [v6 languages];
    uint64_t v14 = [v13 firstObject];
    uint64_t v15 = -[VSMobileAssetsManager installedAssetsForType:voicename:language:gender:footprint:](self, "installedAssetsForType:voicename:language:gender:footprint:", v11, v12, v14, [v6 gender], objc_msgSend(v6, "footprint"));

    unint64_t v16 = (void *)MEMORY[0x263F08A98];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __53__VSMobileAssetsManager_removeVoiceAsset_completion___block_invoke;
    v32[3] = &unk_2640E81A0;
    id v17 = v6;
    id v33 = v17;
    __int16 v18 = [v16 predicateWithBlock:v32];
    BOOL v19 = [v15 filteredArrayUsingPredicate:v18];

    if (![v19 count])
    {
      uint64_t v20 = VSGetLogEvent();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v17 description];
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v21;
        _os_log_impl(&dword_20CABC000, v20, OS_LOG_TYPE_DEFAULT, "Asset not removed because it is not present: %@", buf, 0xCu);
      }
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v22 = v19;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v29 != v26) {
            objc_enumerationMutation(v22);
          }
          if (!v25)
          {
            uint64_t v25 = -[VSMobileAssetsManager purgeAsset:](self, "purgeAsset:", *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v24);
    }
    else
    {
      uint64_t v25 = 0;
    }

    if (v8) {
      ((void (**)(void, void *))v8)[2](v8, v25);
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __53__VSMobileAssetsManager_removeVoiceAsset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) masteredVersion];
  if (v4
    && (double v5 = (void *)v4,
        [v3 asset],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = [v3 asset];
    id v8 = [v7 attributes];
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F55898]];
    uint64_t v10 = [*(id *)(a1 + 32) masteredVersion];
    uint64_t v11 = [v9 isEqualToString:v10];
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

- (void)removeTrialVoice:(id)a3 completion:(id)a4
{
  trialService = self->_trialService;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 languages];
  uint64_t v10 = [v9 firstObject];
  uint64_t v11 = [v8 name];
  uint64_t v12 = [v8 type];
  uint64_t v13 = [v8 footprint];

  id v16 = [(VSTrialService *)trialService definedVoicesWithLanguage:v10 name:v11 type:v12 footprint:v13];

  uint64_t v14 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_508];
  uint64_t v15 = [v16 filteredArrayUsingPredicate:v14];

  [(VSMobileAssetsManager *)self _removeTrialVoices:v15 completion:v7];
}

uint64_t __53__VSMobileAssetsManager_removeTrialVoice_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocal];
}

- (void)cancelDownload:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = VSGetLogEvent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 description];
    int v17 = 138543362;
    __int16 v18 = v9;
    _os_log_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEFAULT, "#Trial Cancelling voice download: %{public}@", (uint8_t *)&v17, 0xCu);
  }
  trialService = self->_trialService;
  uint64_t v11 = [v6 languages];
  uint64_t v12 = [v11 firstObject];
  uint64_t v13 = [v6 name];
  uint64_t v14 = -[VSTrialService definedVoicesWithLanguage:name:type:footprint:](trialService, "definedVoicesWithLanguage:name:type:footprint:", v12, v13, [v6 type], objc_msgSend(v6, "footprint"));

  uint64_t v15 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_506];
  id v16 = [v14 filteredArrayUsingPredicate:v15];

  [(VSMobileAssetsManager *)self _removeTrialVoices:v16 completion:v7];
}

uint64_t __51__VSMobileAssetsManager_cancelDownload_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocal] ^ 1;
}

- (void)cancelDownloads:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = VSGetLogEvent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 description];
    int v13 = 138543362;
    uint64_t v14 = v9;
    _os_log_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEFAULT, "#Trial Cancelling voice downloads: %{public}@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v10 = [(VSTrialService *)self->_trialService definedVoicesWithAssets:v6];
  uint64_t v11 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_504];
  uint64_t v12 = [v10 filteredArrayUsingPredicate:v11];

  [(VSMobileAssetsManager *)self _removeTrialVoices:v12 completion:v7];
}

uint64_t __52__VSMobileAssetsManager_cancelDownloads_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocal] ^ 1;
}

- (void)_removeTrialVoices:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v17 = v6;
  if ([v6 count])
  {
    __int16 v18 = v7;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    char v32 = 0;
    id v8 = dispatch_group_create();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = v6;
    uint64_t v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16, v6);
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          int v13 = VSGetLogEvent();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = [v12 factorName];
            *(_DWORD *)buf = 138412290;
            id v34 = v14;
            _os_log_impl(&dword_20CABC000, v13, OS_LOG_TYPE_DEFAULT, "#Trial Removing voice: %@", buf, 0xCu);
          }
          dispatch_group_enter(v8);
          trialService = self->_trialService;
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          void v24[2] = __55__VSMobileAssetsManager__removeTrialVoices_completion___block_invoke;
          v24[3] = &unk_2640E86B0;
          v24[4] = v12;
          uint64_t v26 = v31;
          uint64_t v25 = v8;
          [(VSTrialService *)trialService removeVoice:v12 completion:v24];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v9);
    }

    if (v18)
    {
      id v16 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __55__VSMobileAssetsManager__removeTrialVoices_completion___block_invoke_502;
      block[3] = &unk_2640E8178;
      uint64_t v21 = v8;
      uint64_t v23 = v31;
      id v22 = v18;
      dispatch_async(v16, block);
    }
    _Block_object_dispose(v31, 8);
    id v7 = v18;
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __55__VSMobileAssetsManager__removeTrialVoices_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = VSGetLogEvent();
  double v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 32) factorName];
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_error_impl(&dword_20CABC000, v5, OS_LOG_TYPE_ERROR, "#Trial Unable to remove voice %@, error: %@", (uint8_t *)&v8, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) factorName];
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_20CABC000, v5, OS_LOG_TYPE_DEFAULT, "#Trial Removed voice: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __55__VSMobileAssetsManager__removeTrialVoices_completion___block_invoke_502(void *a1)
{
  v2 = a1[4];
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  intptr_t v4 = dispatch_group_wait(v2, v3);
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v5 = a1[5];
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"VSTrialServiceErrorDomain" code:2 userInfo:0];
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v10);
    id v6 = (void *)v10;
LABEL_5:

    return;
  }
  uint64_t v7 = a1[5];
  if (v4)
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"VSTrialServiceErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
    id v6 = v9;
    goto LABEL_5;
  }
  int v8 = *(void (**)(uint64_t, void))(v7 + 16);
  v8(v7, 0);
}

- (void)downloadVoiceAsset:(id)a3 options:(id)a4 progressUpdateHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke;
  v25[3] = &unk_2640E8100;
  id v11 = v10;
  id v26 = v11;
  uint64_t v12 = (void (**)(void, double, float))MEMORY[0x210554730](v25);
  int v13 = [v8 languages];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = VSGetLogEvent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v8;
      _os_log_impl(&dword_20CABC000, v15, OS_LOG_TYPE_DEFAULT, "#Trial Enqueued downloading: %{public}@", buf, 0xCu);
    }

    id v16 = objc_alloc_init(VSDownloadOptions);
    -[VSDownloadOptions setAllowCellularData:](v16, "setAllowCellularData:", [v9 allowsCellularAccess]);
    -[VSDownloadOptions setAllowDiscretionary:](v16, "setAllowDiscretionary:", [v9 discretionary]);
    trialService = self->_trialService;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_498;
    v20[3] = &unk_2640E8150;
    id v21 = v8;
    uint64_t v23 = v16;
    uint64_t v24 = v12;
    id v22 = self;
    __int16 v18 = v16;
    [(VSTrialService *)trialService downloadNamespaceImmediatelyIfNeededWithOption:v18 completion:v20];
  }
  else
  {
    uint64_t v19 = VSGetLogDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20CABC000, v19, OS_LOG_TYPE_ERROR, "Language must be provided for voice download.", buf, 2u);
    }

    v12[2](v12, -1.0, -1.0);
  }
}

uint64_t __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_498(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_error_impl(&dword_20CABC000, v5, OS_LOG_TYPE_ERROR, "#Trial Unable to download namespace to download voice: %@, error: %@", buf, 0x16u);
    }

    (*(void (**)(double, float))(*(void *)(a1 + 56) + 16))(-1.0, -1.0);
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) candidateToDownloadForVoice:*(void *)(a1 + 32)];
    uint64_t v7 = VSGetLogDefault();
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v6;
        _os_log_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEFAULT, "Target voice to download: %@", buf, 0xCu);
      }

      id v9 = [v6 name];
      [*(id *)(a1 + 32) setName:v9];

      objc_msgSend(*(id *)(a1 + 32), "setType:", objc_msgSend(v6, "type"));
      objc_msgSend(*(id *)(a1 + 32), "setFootprint:", objc_msgSend(v6, "footprint"));
      if ([*(id *)(a1 + 40) shouldDownloadTrialVoice:v6])
      {
        uint64_t v12 = *(void *)(a1 + 48);
        int v13 = *(void **)(*(void *)(a1 + 40) + 32);
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_499;
        v20[3] = &unk_2640E8128;
        id v21 = *(id *)(a1 + 56);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_2;
        v18[3] = &unk_2640E8C60;
        id v19 = *(id *)(a1 + 56);
        [v13 downloadVoice:v6 withOptions:v12 progress:v20 completion:v18];
      }
      else
      {
        v10.n128_u64[0] = 0;
        v11.n128_u32[0] = 1.0;
        (*(void (**)(__n128, __n128))(*(void *)(a1 + 56) + 16))(v10, v11);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v17 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v17;
        _os_log_error_impl(&dword_20CABC000, v8, OS_LOG_TYPE_ERROR, "#Trial Unable to find suitable voice to download for voice criteria: %@", buf, 0xCu);
      }

      v14.n128_u64[0] = -1.0;
      v15.n128_u32[0] = -1.0;
      (*(void (**)(__n128, __n128))(*(void *)(a1 + 56) + 16))(v14, v15);
    }
  }
}

uint64_t __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_499(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(double, float))(*(void *)(a1 + 32) + 16))(1.0, fminf(a2, 0.99));
}

uint64_t __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_2(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4)
{
  id v4 = *(uint64_t (**)(__n128, __n128))(*(void *)(a1 + 32) + 16);
  if (a2)
  {
    a3.n128_u64[0] = -1.0;
    a4.n128_u32[0] = -1.0;
    return v4(a3, a4);
  }
  else
  {
    ((void (*)(double, float))v4)(0.0, 1.0);
    id v6 = (const char *)[@"com.apple.voiceservices.notification.voice-update" UTF8String];
    return notify_post(v6);
  }
}

- (id)candidateToDownloadForVoice:(id)a3
{
  trialService = self->_trialService;
  id v4 = a3;
  uint64_t v5 = [v4 languages];
  id v6 = [v5 firstObject];
  uint64_t v7 = [v4 name];
  uint64_t v8 = [v4 type];
  uint64_t v9 = [v4 footprint];

  __n128 v10 = [(VSTrialService *)trialService definedVoicesWithLanguage:v6 name:v7 type:v8 footprint:v9];

  __n128 v11 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_491];
  uint64_t v12 = [v10 filteredArrayUsingPredicate:v11];

  if ([v12 count])
  {
    int v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_495];

    __n128 v14 = [v13 lastObject];
    uint64_t v12 = v13;
  }
  else
  {
    __n128 v14 = 0;
  }

  return v14;
}

uint64_t __53__VSMobileAssetsManager_candidateToDownloadForVoice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 preferenceScore];
  double v6 = v5;
  [v4 preferenceScore];
  double v8 = v7;

  if (v6 >= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

BOOL __53__VSMobileAssetsManager_candidateToDownloadForVoice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = (+[VSNeuralTTSUtils isNeuralTTSPlatform]
     || [v2 type] != 4)
    && (+[VSUtilities isHomePod](VSUtilities, "isHomePod") || [v2 footprint] != 3)
    && (!+[VSUtilities isWatch]
     || [v2 type] == 3
     || [v2 type] == 4);

  return v3;
}

- (id)preferredDownloadForVoice:(id)a3
{
  BOOL v3 = [(VSMobileAssetsManager *)self candidateToDownloadForVoice:a3];
  if (v3)
  {
    id v4 = [[VSVoiceAssetSelection alloc] initWithTrialVoice:v3];
    double v5 = [(VSVoiceAssetSelection *)v4 voiceData];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (BOOL)shouldDownloadTrialVoice:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isLocal])
  {
    double v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_20CABC000, v5, OS_LOG_TYPE_DEFAULT, "#Trial Found local voice, skip downloading. Target voice: %@", (uint8_t *)&v15, 0xCu);
    }
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_11;
  }
  double v6 = [v4 language];
  double v7 = [v4 name];
  double v5 = -[VSMobileAssetsManager _mobileAssetVoiceForLanguage:name:type:gender:footprint:](self, "_mobileAssetVoiceForLanguage:name:type:gender:footprint:", v6, v7, [v4 type], objc_msgSend(v4, "gender"), objc_msgSend(v4, "footprint"));

  if (v5)
  {
    double v8 = [v5 voiceData];
    uint64_t v9 = [v8 contentVersion];
    unint64_t v10 = [v9 integerValue];
    unint64_t v11 = [v4 version];

    if (v10 >= v11)
    {
      int v13 = VSGetLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v4;
        _os_log_impl(&dword_20CABC000, v13, OS_LOG_TYPE_DEFAULT, "#Trial Found local MobileAsset voice with same or higher version, skip downloading. Target voice: %@", (uint8_t *)&v15, 0xCu);
      }

      goto LABEL_10;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (void)downloadVoiceAsset:(id)a3 useBattery:(BOOL)a4 progressUpdateHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[VSMobileAssetsManager downloadOptionsWithBattery:v5];
  [(VSMobileAssetsManager *)self downloadVoiceAsset:v9 options:v10 progressUpdateHandler:v8];
}

- (id)selectVoiceForLang:(id)a3 name:(id)a4 type:(int64_t)a5 gender:(int64_t)a6 footprint:(int64_t)a7
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  __n128 v14 = VSGetLogDefault();
  int v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v35 = +[VSVoiceAsset typeStringFromType:a5];
      uint64_t v36 = +[VSVoiceAsset genderStringFromGender:a6];
      uint64_t v37 = +[VSVoiceAsset footprintStringFromFootprint:a7];
      *(_DWORD *)buf = 138544386;
      id v39 = v12;
      __int16 v40 = 2114;
      id v41 = v13;
      __int16 v42 = 2112;
      int v43 = v35;
      __int16 v44 = 2114;
      v45 = v36;
      __int16 v46 = 2114;
      v47 = v37;
      _os_log_debug_impl(&dword_20CABC000, v15, OS_LOG_TYPE_DEBUG, "Searching voice asset for lang: %{public}@, name: %{public}@, type: %{public0}@, gender: %{public}@, footprint: %{public}@", buf, 0x34u);
    }
    id v16 = +[VSSpeechInternalSettings standardInstance];
    if ([v16 enableLocalVoices])
    {
      uint64_t v17 = [v13 length];

      if (!v17) {
        goto LABEL_14;
      }
      __int16 v18 = VSGetLogDefault();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v39 = v12;
        __int16 v40 = 2114;
        id v41 = v13;
        _os_log_impl(&dword_20CABC000, v18, OS_LOG_TYPE_DEFAULT, "Search local voices for lang: %{public}@, name: %{public}@", buf, 0x16u);
      }

      id v16 = [NSString stringWithFormat:@"%@_%@", v12, v13];
      uint64_t v17 = [(VSMobileAssetsManager *)self _localVoiceForLanguageAndNamePath:v16];
    }
    else
    {
      uint64_t v17 = 0;
    }

LABEL_14:
    BOOL v20 = a5 == 1 && v17 == 0;
    if (v20) {
      id v19 = 0;
    }
    else {
      id v19 = (void *)v17;
    }
    if (v20 && a7 == 1)
    {
      id v21 = VSGetLogDefault();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20CABC000, v21, OS_LOG_TYPE_DEFAULT, "Built-in voice is requested.", buf, 2u);
      }

      id v19 = [(VSMobileAssetsManager *)self _builtInVoiceForLanguage:v12];
    }
    if (!v19)
    {
      id v22 = VSGetLogDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20CABC000, v22, OS_LOG_TYPE_DEBUG, "Search voices in Trial", buf, 2u);
      }

      id v19 = [(VSMobileAssetsManager *)self _trialVoiceWithLanguage:v12 name:v13 type:a5 footprint:a7 == 1];
      if (!v19)
      {
        uint64_t v23 = VSGetLogDefault();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_20CABC000, v23, OS_LOG_TYPE_DEBUG, "Search voices in MobileAsset", buf, 2u);
        }

        id v19 = [(VSMobileAssetsManager *)self _mobileAssetVoiceForLanguage:v12 name:v13 type:a5 gender:a6 footprint:a7 == 1];
      }
    }
    if (a7 == 1 || !v19)
    {
      if (v19) {
        goto LABEL_50;
      }
    }
    else
    {
      __int16 v24 = [v19 voiceData];
      uint64_t v25 = [v24 footprint];

      if (v25 != 1)
      {
LABEL_50:
        int v15 = VSGetLogDefault();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = [v19 voiceData];
          *(_DWORD *)buf = 138543362;
          id v39 = v33;
          _os_log_impl(&dword_20CABC000, v15, OS_LOG_TYPE_DEFAULT, "Selected voice %{public}@", buf, 0xCu);
        }
        goto LABEL_52;
      }
    }
    uint64_t v26 = VSGetLogDefault();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_20CABC000, v26, OS_LOG_TYPE_DEBUG, "Search voices in pre-installed location as fallback", buf, 2u);
    }

    uint64_t v27 = [(VSMobileAssetsManager *)self selectPreinstalledVoiceForLanguage:v12 gender:a6 name:v13];
    id v28 = (void *)v27;
    if (v27) {
      uint64_t v29 = (void *)v27;
    }
    else {
      uint64_t v29 = v19;
    }
    id v30 = v29;

    id v19 = v30;
    if (!v30)
    {
      long long v31 = VSGetLogDefault();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20CABC000, v31, OS_LOG_TYPE_DEBUG, "Fallback to custom compact voice", buf, 2u);
      }

      id v19 = [(VSMobileAssetsManager *)self _mobileAssetVoiceForLanguage:v12 name:0 type:2 gender:a6 footprint:1];
      if (!v19)
      {
        char v32 = VSGetLogDefault();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_20CABC000, v32, OS_LOG_TYPE_DEBUG, "Fallback to built-in compact voice", buf, 2u);
        }

        id v19 = [(VSMobileAssetsManager *)self _builtInVoiceForLanguage:v12];
      }
    }
    goto LABEL_50;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20CABC000, v15, OS_LOG_TYPE_ERROR, "Parameter language can't be nil for voice selection", buf, 2u);
  }
  id v19 = 0;
LABEL_52:

  return v19;
}

- (id)_trialVoiceWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = VSGetLogDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = +[VSVoiceAsset typeStringFromType:a5];
    __n128 v14 = +[VSVoiceAsset footprintStringFromFootprint:a6];
    int v27 = 138544130;
    id v28 = v10;
    __int16 v29 = 2114;
    id v30 = v11;
    __int16 v31 = 2114;
    char v32 = v13;
    __int16 v33 = 2114;
    id v34 = v14;
    _os_log_impl(&dword_20CABC000, v12, OS_LOG_TYPE_INFO, "#Trial Search voice asset for lang: %{public}@, name: %{public}@, type: %{public}@, footprint: %{public}@", (uint8_t *)&v27, 0x2Au);
  }
  int v15 = [(VSMobileAssetsManager *)self installedTrialVoicesForType:a5 voiceName:v11 language:v10 footprint:a6];
  if (![v15 count])
  {
    BOOL v20 = VSGetLogDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = +[VSVoiceAsset typeStringFromType:a5];
      uint64_t v23 = +[VSVoiceAsset footprintStringFromFootprint:a6];
      int v27 = 138544130;
      id v28 = v10;
      __int16 v29 = 2114;
      id v30 = v11;
      __int16 v31 = 2114;
      char v32 = v22;
      __int16 v33 = 2114;
      id v34 = v23;
      _os_log_impl(&dword_20CABC000, v20, OS_LOG_TYPE_DEFAULT, "#Trial no installed voices found for lang: %{public}@, name: %{public}@, type: %{public}@, footprint: %{public}@", (uint8_t *)&v27, 0x2Au);
    }
    goto LABEL_13;
  }
  id v16 = +[VSMobileAssetsManager pickCorrectAssetFromLocalAssets:v15];
  uint64_t v17 = VSGetLogDefault();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (!v16)
  {
    if (v18)
    {
      __int16 v24 = +[VSVoiceAsset typeStringFromType:a5];
      uint64_t v25 = +[VSVoiceAsset footprintStringFromFootprint:a6];
      int v27 = 138544130;
      id v28 = v10;
      __int16 v29 = 2114;
      id v30 = v11;
      __int16 v31 = 2114;
      char v32 = v24;
      __int16 v33 = 2114;
      id v34 = v25;
      _os_log_impl(&dword_20CABC000, v17, OS_LOG_TYPE_DEFAULT, "#Trial no suitable installed voices found for lang: %{public}@, name: %{public}@, type: %{public}@, footprint: %{public}@", (uint8_t *)&v27, 0x2Au);
    }
    BOOL v20 = 0;
LABEL_13:
    id v21 = 0;
    goto LABEL_14;
  }
  if (v18)
  {
    id v19 = [v16 voiceData];
    int v27 = 138543362;
    id v28 = v19;
    _os_log_impl(&dword_20CABC000, v17, OS_LOG_TYPE_DEFAULT, "#Trial Found suitable voice: %{public}@", (uint8_t *)&v27, 0xCu);
  }
  BOOL v20 = v16;
  id v21 = v20;
LABEL_14:

  return v21;
}

- (id)installedVoiceResources
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(VSMobileAssetsManager *)self installedTrialVoiceResources];
  BOOL v5 = [v3 arrayWithArray:v4];

  double v6 = objc_alloc_init(VSVoiceResourceAsset);
  double v7 = +[VSMobileAssetsManager queryForVoiceResourceAsset:v6 returnTypes:1];
  id v8 = [(VSMobileAssetsManager *)self _getResults:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 wasLocal])
        {
          __n128 v14 = +[VSMobileAssetsManager voiceResourceFromAsset:v13];
          [v5 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)installedTrialVoiceResources
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [(VSTrialService *)self->_trialService definedVoiceResourcesWithLanguage:0];
  BOOL v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isLocal", (void)v12))
        {
          uint64_t v10 = +[VSVoiceResourceAsset resourceFromTrial:v9];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)resetResourcesCache
{
  BOOL v3 = [(VSMobileAssetsManager *)self cachedMAVoiceResources];
  [v3 removeAllObjects];

  id v4 = [(VSMobileAssetsManager *)self trialService];
  [v4 refreshTrialClient];
}

- (void)resetCache
{
  BOOL v3 = [(VSMobileAssetsManager *)self cachedMAVoiceSelections];
  [v3 removeAllObjects];

  id v4 = [(VSMobileAssetsManager *)self trialService];
  [v4 refreshTrialClient];
}

- (void)cleanMobileAssetVoiceResourcesWithActiveLanguages:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v36 = objc_alloc_init(VSVoiceResourceAsset);
  id v34 = +[VSMobileAssetsManager queryForVoiceResourceAsset:returnTypes:](VSMobileAssetsManager, "queryForVoiceResourceAsset:returnTypes:");
  uint64_t v35 = self;
  uint64_t v5 = -[VSMobileAssetsManager _getResults:](self, "_getResults:");
  __int16 v44 = [MEMORY[0x263EFF9C0] set];
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v55 count:16];
  id v39 = v6;
  __int16 v42 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v51;
    uint64_t v37 = *MEMORY[0x263F55898];
    id v38 = v4;
    unint64_t v11 = 0x2640E7000uLL;
    uint64_t v40 = *MEMORY[0x263F55880];
    uint64_t v41 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if ([v13 wasLocal] && objc_msgSend(v13, "state") != 5)
        {
          long long v14 = [v13 attributes];
          v45 = [*(id *)(v11 + 3760) languagesFromMobileAssetAttributes:v14];
          long long v15 = [v45 firstObject];
          if ([v4 containsObject:v15])
          {
            long long v16 = [v14 objectForKeyedSubscript:v40];
            uint64_t v43 = [v16 integerValue];

            uint64_t v17 = [v6 objectForKeyedSubscript:v15];

            if (v17)
            {
              long long v18 = [v6 objectForKeyedSubscript:v15];
              long long v19 = [v18 attributes];
              BOOL v20 = [v19 objectForKeyedSubscript:v40];
              uint64_t v21 = [v20 integerValue];

              if (v21 < v43) {
                goto LABEL_12;
              }
              id v22 = [v18 attributes];
              uint64_t v23 = [v22 objectForKeyedSubscript:v37];
              uint64_t v24 = [v23 integerValue];

              uint64_t v25 = [v13 attributes];
              uint64_t v26 = [v25 objectForKeyedSubscript:v37];
              uint64_t v27 = [v26 integerValue];

              if (v24 >= v27)
              {
                uint64_t v6 = v39;
              }
              else
              {
LABEL_12:
                uint64_t v6 = v39;
                [v39 setObject:v13 forKeyedSubscript:v15];
                long long v13 = v18;
              }
              id v7 = v42;
              [v44 addObject:v13];

              id v4 = v38;
              uint64_t v10 = v41;
            }
            else
            {
              [v6 setObject:v13 forKeyedSubscript:v15];
              uint64_t v10 = v41;
              id v7 = v42;
            }
            unint64_t v11 = 0x2640E7000;
          }
          else
          {
            [v44 addObject:v13];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v9);
  }
  id v28 = v4;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v29 = v44;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v47 != v32) {
          objc_enumerationMutation(v29);
        }
        [(VSMobileAssetsManager *)v35 _purgeMobileAsset:*(void *)(*((void *)&v46 + 1) + 8 * j)];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v31);
  }
}

- (void)cleanOldMobileAssetVoiceResources
{
  id v3 = +[VSSpeechSynthesizerPreference availableLanguages];
  [(VSMobileAssetsManager *)self cleanMobileAssetVoiceResourcesWithActiveLanguages:v3];
}

- (id)cleanUnusedAssets
{
  v64[1] = *MEMORY[0x263EF8340];
  id v3 = VSGetLogEvent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CABC000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning unused assets.", buf, 2u);
  }

  id v4 = +[VSSpeechInternalSettings standardInstance];
  int v5 = [v4 disableAssetCleaning];

  if (v5)
  {
    uint64_t v6 = VSGetLogEvent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CABC000, v6, OS_LOG_TYPE_DEFAULT, "#MobileAsset Cleaning voice assets is disabled in internal setting. Skip cleaning...", buf, 2u);
    }

    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v63 = *MEMORY[0x263F08320];
    v64[0] = @"Cleaning voice assets is disabled in internal setting.";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
    id v9 = [v7 errorWithDomain:@"VSMobileAssetsManager" code:-1 userInfo:v8];

    goto LABEL_36;
  }
  *(void *)buf = 0;
  long long v54 = buf;
  uint64_t v55 = 0x3032000000;
  uint64_t v56 = __Block_byref_object_copy_;
  long long v57 = __Block_byref_object_dispose_;
  id v58 = 0;
  [(VSMobileAssetsManager *)self inactiveVoiceAssets];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (!v10) {
    goto LABEL_19;
  }
  uint64_t v11 = *(void *)v50;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v50 != v11) {
        objc_enumerationMutation(obj);
      }
      long long v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      long long v14 = [v13 asset];

      if (v14)
      {
        long long v15 = [v13 asset];
        [(VSMobileAssetsManager *)self _purgeMobileAsset:v15];
      }
      else
      {
        long long v16 = [v13 trialVoice];

        if (!v16) {
          continue;
        }
        dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
        long long v18 = [v13 trialVoice];
        v61 = v18;
        long long v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __42__VSMobileAssetsManager_cleanUnusedAssets__block_invoke;
        v46[3] = &unk_2640E8070;
        long long v48 = buf;
        long long v15 = v17;
        long long v47 = v15;
        [(VSMobileAssetsManager *)self _removeTrialVoices:v19 completion:v46];

        dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v49 objects:v62 count:16];
  }
  while (v10);
LABEL_19:

  BOOL v20 = [(VSMobileAssetsManager *)self activeVoiceAssets];
  uint64_t v21 = [MEMORY[0x263EFF9C0] set];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v36 = v20;
  uint64_t v22 = [v36 countByEnumeratingWithState:&v42 objects:v60 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v36);
        }
        uint64_t v25 = [*(id *)(*((void *)&v42 + 1) + 8 * j) voiceData];
        uint64_t v26 = [v25 languages];
        [v21 addObjectsFromArray:v26];
      }
      uint64_t v22 = [v36 countByEnumeratingWithState:&v42 objects:v60 count:16];
    }
    while (v22);
  }

  [(VSMobileAssetsManager *)self installedTrialVoiceResources];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v59 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(v27);
        }
        uint64_t v31 = *(void **)(*((void *)&v38 + 1) + 8 * k);
        uint64_t v32 = [v31 languages];
        __int16 v33 = [v32 firstObject];
        char v34 = [v21 containsObject:v33];

        if ((v34 & 1) == 0) {
          [(VSMobileAssetsManager *)self removeTrialVoiceResource:v31 completion:0];
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v59 count:16];
    }
    while (v28);
  }

  [(VSMobileAssetsManager *)self cleanMobileAssetVoiceResourcesWithActiveLanguages:v21];
  [(VSMobileAssetsManager *)self resetCache];
  id v9 = *((id *)v54 + 5);

  _Block_object_dispose(buf, 8);
LABEL_36:
  return v9;
}

void __42__VSMobileAssetsManager_cleanUnusedAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v4 + 40);
  int v5 = (id *)(v4 + 40);
  uint64_t v6 = v7;
  if (v7) {
    a2 = v6;
  }
  objc_storeStrong(v5, a2);
  id v8 = v2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)voiceAssetsForSubscription:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  uint64_t v6 = [v4 array];
  id v7 = [v5 voice];

  id v8 = [v7 languages];
  id v9 = [v8 firstObject];
  uint64_t v10 = [v7 name];
  uint64_t v11 = -[VSMobileAssetsManager selectVoiceForLang:name:type:gender:footprint:](self, "selectVoiceForLang:name:type:gender:footprint:", v9, v10, [v7 type], objc_msgSend(v7, "gender"), objc_msgSend(v7, "footprint"));

  if (v11) {
    [v6 addObject:v11];
  }
  if (![v7 type] || objc_msgSend(v7, "type") == 4)
  {
    long long v12 = [v7 name];
    long long v13 = [v7 languages];
    long long v14 = [v13 firstObject];
    long long v15 = -[VSMobileAssetsManager installedAssetsForType:voicename:language:gender:footprint:](self, "installedAssetsForType:voicename:language:gender:footprint:", 4, v12, v14, [v7 gender], objc_msgSend(v7, "footprint"));

    long long v16 = [v15 sortedArrayUsingComparator:&__block_literal_global_470];

    dispatch_semaphore_t v17 = [v16 lastObject];
    if (v17)
    {
      long long v18 = [v11 key];
      long long v19 = [v17 key];
      char v20 = [v18 isEqualToString:v19];

      if ((v20 & 1) == 0) {
        [v6 addObject:v17];
      }
    }
  }
  return v6;
}

uint64_t __52__VSMobileAssetsManager_voiceAssetsForSubscription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 preferenceScore];
  double v6 = v5;
  [v4 preferenceScore];
  double v8 = v7;

  if (v6 >= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)definedVoicesForLanguage:(id)a3 voiceName:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  double v6 = [(VSTrialService *)self->_trialService definedVoicesWithLanguage:a3 name:a4 type:a5 footprint:a6];
  double v7 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
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
        long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v14 = objc_alloc_init(VSVoiceAsset);
        long long v15 = objc_msgSend(v13, "language", (void)v21);
        if (v15)
        {
          long long v16 = [v13 language];
          uint64_t v25 = v16;
          dispatch_semaphore_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
          [(VSVoiceAsset *)v14 setLanguages:v17];
        }
        else
        {
          [(VSVoiceAsset *)v14 setLanguages:MEMORY[0x263EFFA68]];
        }

        long long v18 = [v13 name];
        [(VSVoiceAsset *)v14 setName:v18];

        -[VSVoiceAsset setType:](v14, "setType:", [v13 type]);
        -[VSVoiceAsset setFootprint:](v14, "setFootprint:", [v13 footprint]);
        if ([v13 assetSize])
        {
          long long v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "assetSize"));
          [(VSAssetBase *)v14 setDownloadSize:v19];
        }
        else
        {
          [(VSAssetBase *)v14 setDownloadSize:0];
        }
        [v7 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)selectVoiceResourceAssetForLanguage:(id)a3
{
  id v4 = a3;
  double v5 = [(VSMobileAssetsManager *)self _trialVoiceResourceWithLanguage:v4];
  if (!v5)
  {
    double v5 = [(VSMobileAssetsManager *)self _mobileAssetVoiceResourceWithLanguage:v4];
  }

  return v5;
}

- (id)_mobileAssetVoiceResourceWithLanguage:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v14 = 0;
    goto LABEL_20;
  }
  double v5 = [(VSMobileAssetsManager *)self cachedMAVoiceResources];
  double v6 = [v5 objectForKey:v4];

  if (v6)
  {
    double v7 = [MEMORY[0x263F08850] defaultManager];
    id v8 = [v6 searchPathURL];
    uint64_t v9 = [v8 path];
    uint64_t v10 = [v7 contentsOfDirectoryAtPath:v9 error:0];

    uint64_t v11 = [v10 count];
    long long v12 = VSGetLogDefault();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        int v21 = 138412546;
        id v22 = v6;
        __int16 v23 = 2114;
        id v24 = v4;
        _os_log_impl(&dword_20CABC000, v12, OS_LOG_TYPE_DEFAULT, "#MobileAsset Found cached voice resource %@ for %{public}@", (uint8_t *)&v21, 0x16u);
      }

      goto LABEL_15;
    }
    if (v13)
    {
      int v21 = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_20CABC000, v12, OS_LOG_TYPE_DEFAULT, "#MobileAsset Cached voice resource is corrupted %@", (uint8_t *)&v21, 0xCu);
    }

    long long v15 = [(VSMobileAssetsManager *)self cachedMAVoiceResources];
    [v15 removeObjectForKey:v4];
  }
  uint64_t v16 = [(VSMobileAssetsManager *)self _installedVoiceResourceAssetForLanguage:v4];
  if (!v16)
  {
    long long v19 = VSGetLogDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543362;
      id v22 = v4;
      _os_log_error_impl(&dword_20CABC000, v19, OS_LOG_TYPE_ERROR, "#MobileAsset Unable to find asset for VoiceResources %{public}@", (uint8_t *)&v21, 0xCu);
    }

    uint64_t v10 = 0;
    id v14 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = (void *)v16;
  double v6 = +[VSMobileAssetsManager voiceResourceFromAsset:v16];
  dispatch_semaphore_t v17 = [(VSMobileAssetsManager *)self cachedMAVoiceResources];
  [v17 setObject:v6 forKey:v4];

  long long v18 = VSGetLogDefault();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    id v22 = v6;
    __int16 v23 = 2114;
    id v24 = v4;
    _os_log_impl(&dword_20CABC000, v18, OS_LOG_TYPE_DEFAULT, "#MobileAsset Found voice resource %@ for %{public}@", (uint8_t *)&v21, 0x16u);
  }

LABEL_15:
  id v14 = v6;
LABEL_19:

LABEL_20:
  return v14;
}

- (id)_trialVoiceResourceWithLanguage:(id)a3
{
  id v3 = [(VSTrialService *)self->_trialService selectVoiceResourceWithLanguage:a3];
  if (v3)
  {
    id v4 = +[VSVoiceResourceAsset resourceFromTrial:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_installedVoiceResourceAssetForLanguage:(id)a3
{
  v51[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = objc_alloc_init(VSVoiceResourceAsset);
  v51[0] = v4;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];
  [(VSVoiceResourceAsset *)v5 setLanguages:v6];

  [(VSAssetBase *)v5 setCompatibilityVersion:&unk_26C1BAB30];
  double v7 = +[VSMobileAssetsManager queryForVoiceResourceAsset:v5 returnTypes:1];
  id v8 = [(VSMobileAssetsManager *)self _getResults:v7];
  if ([v8 count])
  {
    char v34 = v7;
  }
  else
  {
    [(VSAssetBase *)v5 setCompatibilityVersion:0];
    uint64_t v9 = +[VSMobileAssetsManager queryForVoiceResourceAsset:v5 returnTypes:3];

    uint64_t v10 = [(VSMobileAssetsManager *)self _getResults:v9];

    id v8 = (void *)v10;
    char v34 = (void *)v9;
  }
  uint64_t v11 = [MEMORY[0x263EFF980] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v12);
        }
        dispatch_semaphore_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if ([v17 wasLocal]) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v14);
  }

  [v11 sortUsingComparator:&__block_literal_global_461];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v11;
  uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    char v20 = self;
    uint64_t v32 = v5;
    id v33 = v4;
    uint64_t v21 = *(void *)v38;
    while (2)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(obj);
        }
        __int16 v23 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        id v24 = [v23 getLocalFileUrl];
        uint64_t v25 = [v24 path];

        uint64_t v26 = [MEMORY[0x263F08850] defaultManager];
        id v36 = 0;
        uint64_t v27 = [v26 contentsOfDirectoryAtPath:v25 error:&v36];
        id v28 = v36;

        if (v27 && [v27 count])
        {
          id v30 = v23;

          goto LABEL_26;
        }
        uint64_t v29 = VSGetLogDefault();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          long long v46 = v25;
          __int16 v47 = 2114;
          id v48 = v28;
          _os_log_error_impl(&dword_20CABC000, v29, OS_LOG_TYPE_ERROR, "Purging corrupted VoiceResource '%{public}@', error: %{public}@", buf, 0x16u);
        }

        [(VSMobileAssetsManager *)v20 _purgeMobileAsset:v23];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
      if (v19) {
        continue;
      }
      break;
    }
    id v30 = 0;
LABEL_26:
    double v5 = v32;
    id v4 = v33;
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

uint64_t __65__VSMobileAssetsManager__installedVoiceResourceAssetForLanguage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 attributes];
  double v6 = [v4 attributes];

  uint64_t v7 = *MEMORY[0x263F55880];
  id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x263F55880]];
  uint64_t v9 = [v8 integerValue];

  uint64_t v10 = [v6 objectForKeyedSubscript:v7];
  uint64_t v11 = [v10 integerValue];

  uint64_t v12 = 1;
  if (v9 >= v11) {
    uint64_t v12 = -1;
  }
  if (v9 == v11) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }

  return v13;
}

- (id)builtInVoices
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  CFDictionaryRef v4 = VSVocalizerCopyVoiceEngineFormatVersions();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = [(__CFDictionary *)v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(VSMobileAssetsManager *)self _builtInVoiceForLanguage:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)selectPreinstalledVoiceForLanguage:(id)a3 gender:(int64_t)a4 name:(id)a5
{
  double v5 = [(VSMobileAssetsManager *)self preinstalledVoicesForLanguage:a3 gender:a4 name:a5];
  uint64_t v6 = [v5 firstObject];

  return v6;
}

- (id)preinstalledVoicesForLanguage:(id)a3 gender:(int64_t)a4 name:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v26 = self;
  uint64_t v9 = [(VSMobileAssetsManager *)self preinstallAssetsMetadata];
  id v27 = [MEMORY[0x263EFF980] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v25 = v9;
  obuint64_t j = [v9 objectForKeyedSubscript:@"Assets"];
  uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v15 = +[VSVoiceAsset languagesFromMobileAssetAttributes:v14];
        uint64_t v16 = v15;
        if (!v7
          || ([v15 firstObject],
              uint64_t v17 = objc_claimAutoreleasedReturnValue(),
              int v18 = [v7 isEqualToString:v17],
              v17,
              v18))
        {
          if (!v8
            || ([v14 objectForKeyedSubscript:@"Name"],
                uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                int v20 = [v19 isEqualToString:v8],
                v19,
                v20))
          {
            if (!a4
              || ([v14 objectForKeyedSubscript:@"Gender"],
                  uint64_t v21 = objc_claimAutoreleasedReturnValue(),
                  int64_t v22 = +[VSVoiceAsset genderFromString:v21],
                  v21,
                  v22 == a4))
            {
              __int16 v23 = [(VSMobileAssetsManager *)v26 voiceAssetFromPreinstallMetadata:v14];
              [v27 addObject:v23];
            }
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v11);
  }

  return v27;
}

- (id)voiceAssetFromPreinstallMetadata:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = objc_alloc_init(VSVoiceAssetSelection);
  double v5 = +[VSMobileAssetsManager preinstallAssetsDirectory];
  uint64_t v6 = [v3 objectForKeyedSubscript:@"_RelativePath"];
  id v7 = [v5 stringByAppendingPathComponent:v6];
  id v8 = [v7 stringByAppendingPathComponent:@"AssetData"];
  [(VSVoiceAssetSelection *)v4 setBuiltInVoicePath:v8];

  id v9 = [[VSVoiceAsset alloc] initFromMobileAssetAttributes:v3];
  [(VSVoiceAssetSelection *)v4 setVoiceData:v9];

  uint64_t v10 = [(VSVoiceAssetSelection *)v4 voiceData];
  [v10 setStorage:1];

  uint64_t v11 = [(VSVoiceAssetSelection *)v4 voiceData];
  [v11 setIsInstalled:1];

  uint64_t v12 = [(VSVoiceAssetSelection *)v4 voiceData];
  [v12 setIsBuiltInVoice:1];

  long long v13 = [(VSVoiceAssetSelection *)v4 voiceData];
  [v13 setIsVoiceReadyToUse:1];

  return v4;
}

- (id)preinstallAssetsMetadata
{
  if (preinstallAssetsMetadata_onceToken != -1) {
    dispatch_once(&preinstallAssetsMetadata_onceToken, &__block_literal_global_444);
  }
  id v2 = (void *)preinstallAssetsMetadata___preinstallAssetsMetadata;
  return v2;
}

void __49__VSMobileAssetsManager_preinstallAssetsMetadata__block_invoke()
{
  v0 = NSDictionary;
  id v4 = +[VSMobileAssetsManager preinstallAssetsDirectory];
  v1 = [v4 stringByAppendingPathComponent:@"preinstall_metadata.plist"];
  uint64_t v2 = [v0 dictionaryWithContentsOfFile:v1];
  id v3 = (void *)preinstallAssetsMetadata___preinstallAssetsMetadata;
  preinstallAssetsMetadata___preinstallAssetsMetadata = v2;
}

- (id)_mobileAssetVoiceForLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 gender:(int64_t)a6 footprint:(int64_t)a7
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  long long v14 = NSString;
  long long v15 = [NSNumber numberWithLong:a5];
  uint64_t v16 = [NSNumber numberWithLong:a6];
  int64_t v64 = a7;
  uint64_t v17 = [NSNumber numberWithLong:a7];
  v60 = v13;
  v61 = v12;
  int v18 = [v14 stringWithFormat:@"%@_%@_%@_%@_%@", v12, v13, v15, v16, v17];

  uint64_t v63 = self;
  uint64_t v19 = [(VSMobileAssetsManager *)self cachedMAVoiceSelections];
  uint64_t v56 = v18;
  int v20 = [v19 objectForKey:v18];

  if (v20)
  {
    uint64_t v21 = [v20 asset];
    if (v21)
    {
      int64_t v22 = (void *)v21;
      __int16 v23 = [MEMORY[0x263F08850] defaultManager];
      id v24 = [v20 voicePath];
      char v25 = [v23 fileExistsAtPath:v24];

      if ((v25 & 1) == 0)
      {
        long long v31 = VSGetLogDefault();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v77 = v18;
          _os_log_debug_impl(&dword_20CABC000, v31, OS_LOG_TYPE_DEBUG, "#MobileAsset Ignore cached voice selection for voice query key %@ since it is not installed anymore.", buf, 0xCu);
        }

        int v20 = [(VSMobileAssetsManager *)v63 cachedMAVoiceSelections];
        [v20 removeObjectForKey:v18];
        goto LABEL_13;
      }
    }
    uint64_t v26 = [v20 voiceData];
    if ([v26 type] == 4)
    {
      id v27 = [MEMORY[0x263F08AB0] processInfo];
      if ([v27 thermalState] > 2)
      {
        id v28 = +[VSSpeechInternalSettings standardInstance];
        char v29 = [v28 ignorePowerAndThermalState];

        if ((v29 & 1) == 0)
        {
          long long v30 = VSGetLogDefault();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20CABC000, v30, OS_LOG_TYPE_DEFAULT, "#MobileAsset Ignore neural voice due to thermal critical condition.", buf, 2u);
          }

LABEL_13:
          goto LABEL_14;
        }
LABEL_25:
        long long v37 = VSGetLogDefault();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          long long v38 = [v20 descriptiveKey];
          *(_DWORD *)buf = 138412546;
          v77 = v38;
          __int16 v78 = 2112;
          v79 = v18;
          _os_log_impl(&dword_20CABC000, v37, OS_LOG_TYPE_DEFAULT, "#MobileAsset Found cached voice selection %@ for voice query key %@", buf, 0x16u);
        }
        id v39 = v20;
        goto LABEL_57;
      }
    }
    goto LABEL_25;
  }
LABEL_14:
  long long v32 = +[VSSpeechInternalSettings standardInstance];
  int v33 = [v32 disableDeviceNeuralTTS];

  if (!v33)
  {
    if (!a5)
    {
      uint64_t v35 = &unk_26C1BA950;
      goto LABEL_29;
    }
    goto LABEL_21;
  }
  char v34 = VSGetLogDefault();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CABC000, v34, OS_LOG_TYPE_DEFAULT, "#MobileAsset Ignore neural voices since device neural TTS is disabled.", buf, 2u);
  }

  if (!a5)
  {
    uint64_t v35 = &unk_26C1BA938;
    goto LABEL_29;
  }
  if (a5 != 4)
  {
LABEL_21:
    id v36 = [NSNumber numberWithLong:a5];
    v75 = v36;
    uint64_t v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v75 count:1];

    goto LABEL_29;
  }
  uint64_t v35 = &unk_26C1BA968;
LABEL_29:
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v35;
  uint64_t v59 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v59)
  {
    uint64_t v58 = *(void *)v70;
LABEL_31:
    uint64_t v40 = 0;
    while (1)
    {
      if (*(void *)v70 != v58) {
        objc_enumerationMutation(obj);
      }
      uint64_t v62 = v40;
      long long v41 = -[VSMobileAssetsManager _getVoiceAssetsForType:voiceName:language:gender:footprint:returnTypes:](v63, "_getVoiceAssetsForType:voiceName:language:gender:footprint:returnTypes:", [*(id *)(*((void *)&v69 + 1) + 8 * v40) longValue], v60, v61, a6, v64, 1);
      id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v43 = v41;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v65 objects:v73 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v66 != v46) {
              objc_enumerationMutation(v43);
            }
            id v48 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            if ([v48 wasLocal])
            {
              long long v49 = objc_alloc_init(VSVoiceAssetSelection);
              long long v50 = [(VSMobileAssetsManager *)v63 voiceDataFromAsset:v48];
              [(VSVoiceAssetSelection *)v49 setAsset:v48];
              [(VSVoiceAssetSelection *)v49 setVoiceData:v50];
              if ((!a6 || [v50 gender] == a6) && (!v64 || objc_msgSend(v50, "footprint") == v64)) {
                [v42 addObject:v49];
              }
            }
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v65 objects:v73 count:16];
        }
        while (v45);
      }

      long long v51 = +[VSMobileAssetsManager pickCorrectAssetFromLocalAssets:v42];

      if (v51) {
        break;
      }
      uint64_t v40 = v62 + 1;
      if (v62 + 1 == v59)
      {
        uint64_t v59 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
        if (v59) {
          goto LABEL_31;
        }
        goto LABEL_51;
      }
    }
  }
  else
  {
LABEL_51:
    long long v51 = 0;
  }

  long long v52 = VSGetLogDefault();
  int v18 = v56;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    long long v53 = [v51 voiceData];
    *(_DWORD *)buf = 138543618;
    v77 = v53;
    __int16 v78 = 2114;
    v79 = v56;
    _os_log_impl(&dword_20CABC000, v52, OS_LOG_TYPE_DEFAULT, "#MobileAsset Selected %{public}@ and will cache it for %{public}@", buf, 0x16u);
  }
  if (v51)
  {
    long long v54 = [(VSMobileAssetsManager *)v63 cachedMAVoiceSelections];
    [v54 setObject:v51 forKey:v56];
  }
  id v39 = v51;

LABEL_57:
  return v39;
}

- (VSMobileAssetsManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)VSMobileAssetsManager;
  uint64_t v2 = [(VSMobileAssetsManager *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[VSTrialService sharedService];
    trialService = v2->_trialService;
    v2->_trialService = (VSTrialService *)v3;

    double v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.voiced.assetQueryQueue", v5);
    assetQueryQueue = v2->_assetQueryQueue;
    v2->_assetQueryQueue = (OS_dispatch_queue *)v6;

    id v8 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cachedMAVoiceSelections = v2->_cachedMAVoiceSelections;
    v2->_cachedMAVoiceSelections = v8;

    [(NSCache *)v2->_cachedMAVoiceSelections setCountLimit:10];
    uint64_t v10 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cachedMAVoiceResources = v2->_cachedMAVoiceResources;
    v2->_cachedMAVoiceResources = v10;

    [(NSCache *)v2->_cachedMAVoiceResources setCountLimit:10];
  }
  return v2;
}

- (void)migrateAssetIfNeededWithAssetType:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:v4];
  [v5 returnTypes:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__VSMobileAssetsManager_migrateAssetIfNeededWithAssetType___block_invoke;
  v7[3] = &unk_2640E8008;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 queryMetaData:v7];
}

uint64_t __59__VSMobileAssetsManager_migrateAssetIfNeededWithAssetType___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 == 2)
  {
    uint64_t v2 = result;
    uint64_t v3 = MEMORY[0x210553D40](*(void *)(result + 32));
    id v4 = VSGetLogEvent();
    double v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(v2 + 32);
        id v7 = MEMORY[0x210553D70](v3);
        int v9 = 138412546;
        uint64_t v10 = v6;
        __int16 v11 = 2112;
        id v12 = v7;
        _os_log_error_impl(&dword_20CABC000, v5, OS_LOG_TYPE_ERROR, "#MobileAsset migrate '%@', error: %@", (uint8_t *)&v9, 0x16u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(v2 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_20CABC000, v5, OS_LOG_TYPE_DEFAULT, "#MobileAsset migrate '%@', success", (uint8_t *)&v9, 0xCu);
    }

    return [*(id *)(v2 + 40) downloadCatalog:*(void *)(v2 + 32) options:0 completion:0];
  }
  return result;
}

- (BOOL)migrateAssetsWithProgress:(id)a3
{
  id v4 = (void (**)(id, unsigned char *, double))a3;
  char v7 = 0;
  v4[2](v4, &v7, 0.0);
  if (v7
    || ([(VSMobileAssetsManager *)self migrateAssetIfNeededWithAssetType:@"com.apple.MobileAsset.VoiceServices.GryphonVoice"], v4[2](v4, &v7, 0.33), v7)|| ([(VSMobileAssetsManager *)self migrateAssetIfNeededWithAssetType:@"com.apple.MobileAsset.VoiceServices.CustomVoice"], v4[2](v4, &v7, 0.66), v7))
  {
    BOOL v5 = 1;
  }
  else
  {
    [(VSMobileAssetsManager *)self migrateAssetIfNeededWithAssetType:@"com.apple.MobileAsset.VoiceServicesVocalizerVoice"];
    v4[2](v4, &v7, 1.0);
    BOOL v5 = v7 != 0;
  }

  return v5;
}

+ (BOOL)isVoiceAssetWellDefined:(id)a3
{
  id v3 = a3;
  if (![v3 type]) {
    goto LABEL_9;
  }
  id v4 = [v3 languages];
  uint64_t v5 = [v4 count];

  if (!v5) {
    goto LABEL_9;
  }
  if ([v3 type] != 1)
  {
    char v7 = [v3 name];
    if ([v7 length])
    {

LABEL_8:
      BOOL v6 = [v3 footprint] != 0;
      goto LABEL_10;
    }
    uint64_t v8 = [v3 gender];

    if (v8) {
      goto LABEL_8;
    }
LABEL_9:
    BOOL v6 = 0;
    goto LABEL_10;
  }
  BOOL v6 = 1;
LABEL_10:

  return v6;
}

+ (id)getLatestAssetFromArray:(id)a3
{
  id v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_549];
  id v4 = [v3 lastObject];

  return v4;
}

uint64_t __49__VSMobileAssetsManager_getLatestAssetFromArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  BOOL v6 = [v4 attributes];
  char v7 = [v5 attributes];
  uint64_t v8 = *MEMORY[0x263F55880];
  int v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F55880]];
  uint64_t v10 = [v9 integerValue];

  __int16 v11 = [v7 objectForKeyedSubscript:v8];
  uint64_t v12 = [v11 integerValue];

  if (v10 == v12)
  {
    if ([v4 wasLocal]) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = [v5 wasLocal] << 63 >> 63;
    }
  }
  else if (v10 > v12)
  {
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = -1;
  }

  return v13;
}

+ (id)pickCorrectAssetFromLocalAssets:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[VSSpeechInternalSettings standardInstance];
    int v5 = [v4 disableDeviceNeuralTTS];

    if (v5)
    {
      BOOL v6 = VSGetLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v14 = 0;
        _os_log_impl(&dword_20CABC000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring all neural voices due to disableDeviceNeuralTTS", v14, 2u);
      }

      char v7 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_532];
      uint64_t v8 = [v3 filteredArrayUsingPredicate:v7];

      id v3 = (id)v8;
    }
    int v9 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_534];
    uint64_t v10 = [v3 filteredArrayUsingPredicate:v9];

    __int16 v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_537];
    uint64_t v12 = [v11 lastObject];

    id v3 = v10;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __57__VSMobileAssetsManager_pickCorrectAssetFromLocalAssets___block_invoke_535(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 preferenceScore];
  double v6 = v5;
  [v4 preferenceScore];
  double v8 = v7;

  if (v6 >= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t __57__VSMobileAssetsManager_pickCorrectAssetFromLocalAssets___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 voiceData];
  uint64_t v4 = [v3 type];

  if (v4 == 4
    && ([v2 voicePath],
        double v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = +[VSNeuralTTSUtils shouldUseNeuralVoice:v5],
        v5,
        !v6))
  {
    double v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v2 key];
      BOOL v10 = +[VSUtilities isH12Platform];
      __int16 v11 = [MEMORY[0x263F08AB0] processInfo];
      int v12 = [v11 thermalState];
      uint64_t v13 = [MEMORY[0x263F08AB0] processInfo];
      int v15 = 138413058;
      uint64_t v16 = v9;
      __int16 v17 = 1024;
      BOOL v18 = v10;
      __int16 v19 = 1024;
      int v20 = v12;
      __int16 v21 = 1024;
      int v22 = [v13 isLowPowerModeEnabled];
      _os_log_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring neural voice %@. Current states as H12 platform: %{BOOL}d, thermal state:%d, low power enabled:%{BOOL}d", (uint8_t *)&v15, 0x1Eu);
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

BOOL __57__VSMobileAssetsManager_pickCorrectAssetFromLocalAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 voiceData];
  BOOL v3 = [v2 type] != 4;

  return v3;
}

+ (id)voiceResourceFromAsset:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(VSVoiceResourceAsset);
    [(VSAssetBase *)v4 setStorage:2];
    double v5 = [v3 attributes];
    [(VSAssetBase *)v4 setBundleIdentifier:@"com.apple.MobileAsset.VoiceServices.VoiceResources"];
    BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F55898]];
    [(VSAssetBase *)v4 setMasteredVersion:v6];

    uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F55880]];
    [(VSAssetBase *)v4 setContentVersion:v7];

    double v8 = +[VSVoiceAsset compatibilityVersionFromMobileAssetAttributes:v5];
    [(VSAssetBase *)v4 setCompatibilityVersion:v8];

    int v9 = +[VSVoiceAsset languagesFromMobileAssetAttributes:v5];
    [(VSVoiceResourceAsset *)v4 setLanguages:v9];

    BOOL v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F55888]];
    [(VSAssetBase *)v4 setDownloadSize:v10];

    if ([v3 wasLocal])
    {
      __int16 v11 = [v3 getLocalFileUrl];
      [(VSVoiceResourceAsset *)v4 setSearchPathURL:v11];
    }
    -[VSAssetBase setIsPurgeable:](v4, "setIsPurgeable:", [v3 wasPurgeable]);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)downloadOptionsWithBattery:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F559B8]);
  double v5 = +[VSSpeechInternalSettings standardInstance];
  BOOL v6 = !v3;
  objc_msgSend(v4, "setDiscretionary:", v6 & (objc_msgSend(v5, "defaultToNonDiscretionaryDownloads") ^ 1));

  [v4 setRequiresPowerPluggedIn:v6];
  return v4;
}

+ (id)queryForVoiceResourceAsset:(id)a3 returnTypes:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:@"com.apple.MobileAsset.VoiceServices.VoiceResources"];
  [v6 returnTypes:a4];
  uint64_t v7 = [v5 compatibilityVersion];

  if (v7)
  {
    uint64_t v8 = *MEMORY[0x263F55868];
    int v9 = NSString;
    BOOL v10 = [v5 compatibilityVersion];
    __int16 v11 = objc_msgSend(v9, "stringWithFormat:", @"%d", objc_msgSend(v10, "intValue"));
    [v6 addKeyValuePair:v8 with:v11];
  }
  int v12 = [v5 masteredVersion];

  if (v12)
  {
    uint64_t v13 = *MEMORY[0x263F55898];
    long long v14 = [v5 masteredVersion];
    [v6 addKeyValuePair:v13 with:v14];
  }
  int v15 = [v5 languages];
  uint64_t v16 = [v15 firstObject];

  if (v16) {
    [v6 addKeyValuePair:@"Languages" with:v16];
  }

  return v6;
}

void __89__VSMobileAssetsManager_queryForLanguage_forType_voiceName_gender_footprint_returnTypes___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:7];
  v1 = (void *)queryForLanguage_forType_voiceName_gender_footprint_returnTypes__customVersions;
  queryForLanguage_forType_voiceName_gender_footprint_returnTypes__customVersions = v0;

  uint64_t v2 = -7;
  do
  {
    BOOL v3 = (void *)queryForLanguage_forType_voiceName_gender_footprint_returnTypes__customVersions;
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v2 + 8);
    [v3 addObject:v4];
  }
  while (!__CFADD__(v2++, 1));
  int64_t v6 = +[VSSpeechEngine engineMinimumCompatibility];
  int64_t v7 = +[VSSpeechEngine engineCurrentCompatibility];
  uint64_t v8 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v7 - v6 + 1];
  int v9 = (void *)queryForLanguage_forType_voiceName_gender_footprint_returnTypes__gryphonVersions;
  queryForLanguage_forType_voiceName_gender_footprint_returnTypes__gryphonVersions = v8;

  if (v7 >= v6)
  {
    do
    {
      BOOL v10 = (void *)queryForLanguage_forType_voiceName_gender_footprint_returnTypes__gryphonVersions;
      __int16 v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v6);
      [v10 addObject:v11];

      ++v6;
    }
    while (v7 + 1 != v6);
  }
}

+ (id)preinstallAssetsDirectory
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.voiceservices"];
  BOOL v3 = [v2 bundlePath];
  id v4 = [v3 stringByAppendingPathComponent:@"TTSResources/PreinstallAssets/"];

  return v4;
}

void __38__VSMobileAssetsManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_alloc_init(VSMobileAssetsManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;
}

@end