@interface SSRMobileAssetProvider
- (id)_buildAssetQueryForAssetType:(unint64_t)a3;
- (id)_filteredAssets:(id)a3 forLanguage:(id)a4;
- (id)_findLatestInstalledAsset:(id)a3;
- (id)_getEndpointAssetTypeString;
- (id)_getSSRAssetTypeString;
- (id)_getVTRepromptListAssetTypeString;
- (id)_getVoiceTriggerAssetTypeString;
- (id)_installedMobileAssetOfType:(unint64_t)a3 forLanguage:(id)a4;
- (id)_installedMobileAssetOfType:(unint64_t)a3 forLanguage:(id)a4 ofType:(int64_t)a5;
- (id)_queryMAAssetsForAssetType:(unint64_t)a3 Language:(id)a4;
- (id)allInstalledAssetsOfType:(unint64_t)a3 forLanguage:(id)a4;
- (id)allInstalledSpeakerRecognitionAssetForLanguage:(id)a3;
- (id)installedAssetOfType:(unint64_t)a3 forLanguageCode:(id)a4;
- (id)installedSpeakerRecognitionAssetForLanguage:(id)a3;
- (unint64_t)_getEndpointAssetCurrentCompatibilityVersion;
- (unint64_t)_getSSRAssetCurrentCompatibilityVersion;
- (unint64_t)_getVTRepromptListCurrentCompatibilityVersion;
- (unint64_t)_getVoiceTriggerAssetCurrentCompatibilityVersion;
- (unint64_t)getAssetProviderType;
@end

@implementation SSRMobileAssetProvider

- (id)_filteredAssets:(id)a3 forLanguage:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    uint64_t v12 = *MEMORY[0x263F38108];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "attributes", (void)v19);
        v16 = [v15 valueForKey:v12];
        v17 = v16;
        if (!v6 || [v16 containsObject:v6]) {
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_findLatestInstalledAsset:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  id v5 = (os_log_t *)MEMORY[0x263F38100];
  if (v3)
  {
    uint64_t v6 = v3;
    id v7 = 0;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v4 = 136315394;
    long long v19 = v4;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v10, "state", v19);
        uint64_t v12 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v19;
          v26 = "-[SSRMobileAssetProvider _findLatestInstalledAsset:]";
          __int16 v27 = 2050;
          unint64_t v28 = v11;
          _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Asset state : %{public}ld", buf, 0x16u);
        }
        if (v11 <= 6 && ((1 << v11) & 0x6C) != 0)
        {
          if (v7)
          {
            if ([v10 isLatestCompareTo:v7])
            {
              id v14 = v10;

              id v7 = v14;
            }
          }
          else
          {
            id v7 = v10;
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
  os_log_t v15 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = [v7 attributes];
    *(_DWORD *)buf = 136315394;
    v26 = "-[SSRMobileAssetProvider _findLatestInstalledAsset:]";
    __int16 v27 = 2114;
    unint64_t v28 = (unint64_t)v17;
    _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Chosen Asset %{public}@", buf, 0x16u);
  }

  return v7;
}

- (id)_installedMobileAssetOfType:(unint64_t)a3 forLanguage:(id)a4 ofType:(int64_t)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = [(SSRMobileAssetProvider *)self _buildAssetQueryForAssetType:a3];
  [v9 returnTypes:a5];
  uint64_t v10 = [v9 queryMetaDataSync];
  unint64_t v11 = [v9 results];
  uint64_t v12 = [(SSRMobileAssetProvider *)self _filteredAssets:v11 forLanguage:v8];

  v13 = *MEMORY[0x263F38100];
  id v14 = *MEMORY[0x263F38100];
  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315650;
      long long v21 = "-[SSRMobileAssetProvider _installedMobileAssetOfType:forLanguage:ofType:]";
      __int16 v22 = 2114;
      uint64_t v23 = (uint64_t)v9;
      __int16 v24 = 2050;
      uint64_t v25 = v10;
      _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s Error running asset-query: %{public}@, error: %{public}lu", (uint8_t *)&v20, 0x20u);
    }
    os_log_t v15 = 0;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v13;
      uint64_t v17 = [v12 count];
      v18 = [v9 queryParams];
      int v20 = 136315650;
      long long v21 = "-[SSRMobileAssetProvider _installedMobileAssetOfType:forLanguage:ofType:]";
      __int16 v22 = 2050;
      uint64_t v23 = v17;
      __int16 v24 = 2114;
      uint64_t v25 = (uint64_t)v18;
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu assets matching query: %{public}@", (uint8_t *)&v20, 0x20u);
    }
    os_log_t v15 = [(SSRMobileAssetProvider *)self _findLatestInstalledAsset:v12];
  }

  return v15;
}

- (id)_installedMobileAssetOfType:(unint64_t)a3 forLanguage:(id)a4
{
  return [(SSRMobileAssetProvider *)self _installedMobileAssetOfType:a3 forLanguage:a4 ofType:2];
}

- (id)_buildAssetQueryForAssetType:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = @"com.apple.MobileAsset.VoiceTriggerAssetsMac";
  uint64_t v6 = 15;
  switch(a3)
  {
    case 0uLL:
      id v5 = [(SSRMobileAssetProvider *)self _getVoiceTriggerAssetTypeString];
      unint64_t v7 = [(SSRMobileAssetProvider *)self _getVoiceTriggerAssetCurrentCompatibilityVersion];
      goto LABEL_5;
    case 1uLL:
      id v5 = [(SSRMobileAssetProvider *)self _getEndpointAssetTypeString];
      unint64_t v7 = [(SSRMobileAssetProvider *)self _getEndpointAssetCurrentCompatibilityVersion];
      goto LABEL_5;
    case 3uLL:
      id v5 = [(SSRMobileAssetProvider *)self _getSSRAssetTypeString];
      unint64_t v7 = [(SSRMobileAssetProvider *)self _getSSRAssetCurrentCompatibilityVersion];
LABEL_5:
      uint64_t v6 = v7;
      if (v5) {
        goto LABEL_6;
      }
      goto LABEL_8;
    case 7uLL:
      goto LABEL_6;
    case 8uLL:
      id v5 = [(SSRMobileAssetProvider *)self _getVTRepromptListAssetTypeString];
      uint64_t v6 = 1;
      if (!v5) {
        goto LABEL_8;
      }
LABEL_6:
      id v8 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:v5];
      uint64_t v9 = *MEMORY[0x263F55868];
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v6);
      [v8 addKeyValuePair:v9 with:v10];

      break;
    default:
LABEL_8:
      unint64_t v11 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v14 = "-[SSRMobileAssetProvider _buildAssetQueryForAssetType:]";
        __int16 v15 = 1026;
        int v16 = v3;
        _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s Failed to get assetString for assetType %{public}d", buf, 0x12u);
      }
      id v8 = 0;
      break;
  }

  return v8;
}

- (unint64_t)_getEndpointAssetCurrentCompatibilityVersion
{
  if (CSIsWatch()) {
    return 3;
  }
  if (CSIsTV()) {
    return 5;
  }
  if ([MEMORY[0x263F380D0] shouldUseHorsemanSpeechEndpointAssets]) {
    return 2;
  }
  if (CSIsOSX()) {
    return 6;
  }
  return 3;
}

- (id)_getEndpointAssetTypeString
{
  if (CSIsWatch()) {
    return @"com.apple.MobileAsset.SpeechEndpointAssetsWatch";
  }
  if (CSIsTV()) {
    return @"com.apple.MobileAsset.SpeechEndpointAssetsTV";
  }
  if ([MEMORY[0x263F380D0] shouldUseHorsemanSpeechEndpointAssets]) {
    return @"com.apple.MobileAsset.SpeechEndpointMarshAssets";
  }
  if (CSIsOSX()) {
    return @"com.apple.MobileAsset.SpeechEndpointMacOSAssets";
  }
  return @"com.apple.MobileAsset.SpeechEndpointAssets";
}

- (unint64_t)_getVTRepromptListCurrentCompatibilityVersion
{
  return 1;
}

- (id)_getVTRepromptListAssetTypeString
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F380D0] deviceProductType];
  int v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"iPhone16,1", @"iPhone16,2", @"iPhone15,4", @"iPhone15,5", 0);
  long long v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"iPhone14,7", @"iPhone14,8", @"iPhone15,2", @"iPhone15,3", @"iPhone14,6", 0);
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"iPhone14,2", @"iPhone14,3", @"iPhone14,4", @"iPhone14,5", 0);
  if (CSIsIPad())
  {
    uint64_t v6 = @"com.apple.MobileAsset.VoiceTriggerRePromptListiPad";
  }
  else if ([v3 containsObject:v2])
  {
    uint64_t v6 = @"com.apple.MobileAsset.VoiceTriggerRePromptListiPhone15x";
  }
  else if ([v4 containsObject:v2])
  {
    uint64_t v6 = @"com.apple.MobileAsset.VoiceTriggerRePromptListiPhone14x";
  }
  else if ([v5 containsObject:v2])
  {
    uint64_t v6 = @"com.apple.MobileAsset.VoiceTriggerRePromptListiPhone13x";
  }
  else
  {
    uint64_t v6 = @"com.apple.MobileAsset.VoiceTriggerRePromptListiPhone12AndOlder";
  }
  unint64_t v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = "-[SSRMobileAssetProvider _getVTRepromptListAssetTypeString]";
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Fetched assetStr: %{public}@ for deviceType: %{public}@", buf, 0x20u);
  }

  return v6;
}

- (id)_getSSRAssetTypeString
{
  if (CSIsASMacWithAOP()) {
    return @"com.apple.MobileAsset.SpeakerRecognitionASMacAssets";
  }
  else {
    return @"com.apple.MobileAsset.SpeakerRecognitionAssets";
  }
}

- (unint64_t)_getSSRAssetCurrentCompatibilityVersion
{
  return 1;
}

- (unint64_t)_getVoiceTriggerAssetCurrentCompatibilityVersion
{
  return [MEMORY[0x263F38090] getVoiceTriggerCurrentCompatibilityVersion];
}

- (id)_getVoiceTriggerAssetTypeString
{
  return (id)[MEMORY[0x263F38090] getVoiceTriggerAssetTypeString];
}

- (unint64_t)getAssetProviderType
{
  return 0;
}

- (id)installedSpeakerRecognitionAssetForLanguage:(id)a3
{
  int v3 = [(SSRMobileAssetProvider *)self _installedMobileAssetOfType:3 forLanguage:a3];
  long long v4 = [v3 getCSAssetOfType:3];

  return v4;
}

- (id)_queryMAAssetsForAssetType:(unint64_t)a3 Language:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  unint64_t v7 = [(SSRMobileAssetProvider *)self _buildAssetQueryForAssetType:a3];
  id v8 = v7;
  if (v7)
  {
    [v7 returnTypes:2];
    uint64_t v9 = [v8 queryMetaDataSync];
    uint64_t v10 = [v8 results];
    __int16 v11 = [(SSRMobileAssetProvider *)self _filteredAssets:v10 forLanguage:v6];

    uint64_t v12 = *MEMORY[0x263F38100];
    __int16 v13 = *MEMORY[0x263F38100];
    if ((v9 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v30 = "-[SSRMobileAssetProvider _queryMAAssetsForAssetType:Language:]";
        __int16 v31 = 2114;
        uint64_t v32 = (uint64_t)v8;
        __int16 v33 = 2050;
        uint64_t v34 = v9;
        _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s Error running query: %{public}@, error: %{public}lu", buf, 0x20u);
      }
      id v14 = 0;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = v12;
        uint64_t v16 = [v11 count];
        uint64_t v17 = [v8 queryParams];
        *(_DWORD *)buf = 136315650;
        uint64_t v30 = "-[SSRMobileAssetProvider _queryMAAssetsForAssetType:Language:]";
        __int16 v31 = 2050;
        uint64_t v32 = v16;
        __int16 v33 = 2114;
        uint64_t v34 = (uint64_t)v17;
        _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu installed assets for matching query: %{public}@", buf, 0x20u);
      }
      v18 = [v11 sortedArrayUsingComparator:&__block_literal_global_7816];
      long long v19 = [MEMORY[0x263EFF980] array];
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __62__SSRMobileAssetProvider__queryMAAssetsForAssetType_Language___block_invoke_2;
      uint64_t v26 = &unk_26442A230;
      id v27 = v19;
      unint64_t v28 = a3;
      id v20 = v19;
      [v18 enumerateObjectsUsingBlock:&v23];
      if (objc_msgSend(v20, "count", v23, v24, v25, v26)) {
        long long v21 = v20;
      }
      else {
        long long v21 = 0;
      }
      id v14 = v21;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __62__SSRMobileAssetProvider__queryMAAssetsForAssetType_Language___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 state] == 2
    || [v3 state] == 3
    || [v3 state] == 5
    || [v3 state] == 6)
  {
    long long v4 = [v3 getCSAssetOfType:*(void *)(a1 + 40)];
    if (v4)
    {
      [*(id *)(a1 + 32) addObject:v4];
    }
    else
    {
      id v5 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        id v6 = v5;
        unint64_t v7 = [v3 attributes];
        int v8 = 136315394;
        uint64_t v9 = "-[SSRMobileAssetProvider _queryMAAssetsForAssetType:Language:]_block_invoke_2";
        __int16 v10 = 2114;
        __int16 v11 = v7;
        _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, "%s ERR: Failed to asset for %{public}@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

uint64_t __62__SSRMobileAssetProvider__queryMAAssetsForAssetType_Language___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "isLatestCompareTo:")) {
    return -1;
  }
  else {
    return 1;
  }
}

- (id)allInstalledSpeakerRecognitionAssetForLanguage:(id)a3
{
  return [(SSRMobileAssetProvider *)self _queryMAAssetsForAssetType:3 Language:a3];
}

- (id)allInstalledAssetsOfType:(unint64_t)a3 forLanguage:(id)a4
{
  id v6 = (void *)MEMORY[0x263F380D0];
  id v7 = a4;
  int v8 = [v6 supportsSpeakerRecognitionAssets];
  if (a3 == 3) {
    int v9 = v8;
  }
  else {
    int v9 = 1;
  }
  if (v9) {
    unint64_t v10 = a3;
  }
  else {
    unint64_t v10 = 0;
  }
  __int16 v11 = [(SSRMobileAssetProvider *)self _queryMAAssetsForAssetType:v10 Language:v7];

  return v11;
}

- (id)installedAssetOfType:(unint64_t)a3 forLanguageCode:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v7 = [MEMORY[0x263F380D0] supportsSpeakerRecognitionAssets];
  if (a3 != 3 || (v7 & 1) != 0)
  {
    unint64_t v8 = a3;
    if (a3) {
      goto LABEL_10;
    }
  }
  else if (CSIsGibraltarMac())
  {
    unint64_t v8 = 7;
    if (![MEMORY[0x263F380D0] isDarwinOS]) {
      goto LABEL_19;
    }
    goto LABEL_11;
  }
  if (CSIsGibraltarMac()) {
    unint64_t v8 = 7;
  }
  else {
    unint64_t v8 = 0;
  }
LABEL_10:
  if (([MEMORY[0x263F380D0] isDarwinOS] & 1) == 0)
  {
    if (a3 != 8)
    {
LABEL_19:
      uint64_t v23 = [(SSRMobileAssetProvider *)self _installedMobileAssetOfType:v8 forLanguage:v6];
LABEL_25:
      unint64_t v10 = v23;
      id v14 = [v23 getCSAssetOfType:v8];
      goto LABEL_26;
    }
    uint64_t v15 = [MEMORY[0x263F38068] sharedPreferences];
    int v16 = [v15 isVoiceTriggerRepromptAssetOverridingEnabled];

    if (v16)
    {
      uint64_t v17 = [MEMORY[0x263F38068] sharedPreferences];
      unint64_t v10 = [v17 fakeVoiceTriggerRepromptAssetPath];

      v18 = [v10 stringByDeletingLastPathComponent];
      long long v19 = [MEMORY[0x263F08850] defaultManager];
      int v20 = [v19 fileExistsAtPath:v10];

      if (v20)
      {
        long long v21 = *MEMORY[0x263F37FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136315138;
          id v27 = "-[SSRMobileAssetProvider installedAssetOfType:forLanguageCode:]";
          _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s Retuning the override asset", (uint8_t *)&v26, 0xCu);
        }
        __int16 v22 = [MEMORY[0x263F37FB0] assetForAssetType:8 resourcePath:v18 configVersion:@"override-asset"];

        goto LABEL_27;
      }
    }
    uint64_t v23 = [(SSRMobileAssetProvider *)self _installedMobileAssetOfType:v8 forLanguage:v6 ofType:3];
    goto LABEL_25;
  }
LABEL_11:
  int v9 = [MEMORY[0x263F380B8] sharedManager];
  unint64_t v10 = [v9 assetForCurrentLanguageOfType:v8];

  __int16 v11 = [MEMORY[0x263F380B8] sharedManager];
  uint64_t v12 = [v11 languageCode];
  int v13 = [v6 isEqualToString:v12];

  if (v13)
  {
    id v14 = v10;
    unint64_t v10 = v14;
LABEL_26:
    __int16 v22 = v14;
    goto LABEL_27;
  }
  uint64_t v24 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v26 = 136315138;
    id v27 = "-[SSRMobileAssetProvider installedAssetOfType:forLanguageCode:]";
    _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s Locale doesn't match, return nil", (uint8_t *)&v26, 0xCu);
  }
  __int16 v22 = 0;
LABEL_27:

  return v22;
}

@end