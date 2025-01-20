@interface SSRVoiceProfileRetrainerFactory
- (SSRVoiceProfileRetrainerFactory)init;
- (id)_fetchSecureAssetForCommunalDevice:(id)a3;
- (id)_fetchSecureAssetForNonCommunalDevice:(id)a3;
- (id)_secureAssetWithAssetResourcePathURL:(id)a3 assetFileName:(id)a4;
- (id)voiceRetrainersWithContext:(id)a3;
@end

@implementation SSRVoiceProfileRetrainerFactory

- (id)voiceRetrainersWithContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [[SSRVoiceProfileRetrainerPSR alloc] initWithVoiceRetrainingContext:v4];
  if (v6) {
    [v5 addObject:v6];
  }
  v7 = [[SSRVoiceProfileRetrainerSAT alloc] initWithVoiceRetrainingContext:v4];
  if (v7) {
    [v5 addObject:v7];
  }
  if ([MEMORY[0x263F380D0] isExclaveHardware])
  {
    if (CSIsCommunalDevice()) {
      [(SSRVoiceProfileRetrainerFactory *)self _fetchSecureAssetForCommunalDevice:v4];
    }
    else {
    v8 = [(SSRVoiceProfileRetrainerFactory *)self _fetchSecureAssetForNonCommunalDevice:v4];
    }
    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x263F38240]);
      v10 = [v9 decode:v8];
      v11 = [[SSRVoiceProfileRetrainerPSRExclave alloc] initWithVoiceRetrainingContext:v4 secureAsset:v8 secureSpeakerRecognitionConfig:v10];
      if (v11) {
        [v5 addObject:v11];
      }
      if ((CSIsCommunalDevice() & 1) == 0)
      {
        v12 = [[SSRVoiceProfileRetrainerSATExclave alloc] initWithVoiceRetrainingContext:v4 secureAsset:v8 secureSpeakerRecognitionConfig:v10];
        if (v12) {
          [v5 addObject:v12];
        }
      }
    }
    else
    {
      v13 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315138;
        v18 = "-[SSRVoiceProfileRetrainerFactory voiceRetrainersWithContext:]";
        _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s SecureAsset is nil", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  if ([v5 count]) {
    v14 = v5;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (id)_fetchSecureAssetForNonCommunalDevice:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![MEMORY[0x263F380D0] isExclaveHardware])
  {
    v14 = 0;
    goto LABEL_23;
  }
  id v5 = objc_alloc(MEMORY[0x263F38238]);
  v6 = [MEMORY[0x263F38230] getBundle:0];
  v7 = (void *)[v5 init:v6];

  v8 = [v4 voiceProfile];
  id v9 = [v8 locale];
  v10 = [v7 resourcePathURL:v9];

  uint64_t v11 = [MEMORY[0x263F38230] getAssetFileName:0];
  v12 = (void *)v11;
  v13 = *MEMORY[0x263F38100];
  if (v10 && v11)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315651;
      v32 = "-[SSRVoiceProfileRetrainerFactory _fetchSecureAssetForNonCommunalDevice:]";
      __int16 v33 = 2112;
      v34 = v12;
      __int16 v35 = 2113;
      v36 = v10;
      _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Fetching preinstalled SpeakerRecognition asset (Preinstalled) with config file name:%@ at path: %{private}@", (uint8_t *)&v31, 0x20u);
    }
    v14 = [(SSRVoiceProfileRetrainerFactory *)self _secureAssetWithAssetResourcePathURL:v10 assetFileName:v12];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v31 = 136315651;
      v32 = "-[SSRVoiceProfileRetrainerFactory _fetchSecureAssetForNonCommunalDevice:]";
      __int16 v33 = 2112;
      v34 = v12;
      __int16 v35 = 2113;
      v36 = v10;
      _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s Skipping operation to fetch SpeakerRecognition asset (Preinstalled) with config file name:%@ at path: %{private}@", (uint8_t *)&v31, 0x20u);
    }
    v14 = 0;
  }
  id v15 = [v4 asset];
  if ([v15 assetVariant] != 2) {
    goto LABEL_20;
  }
  v16 = [v4 asset];
  if ([v16 assetProvider] != 2)
  {

LABEL_20:
    goto LABEL_21;
  }
  int v17 = [v4 asset];
  v18 = [v17 resourcePath];

  if (v18 && v12)
  {
    uint64_t v19 = NSURL;
    v20 = [v4 asset];
    v21 = [v20 resourcePath];
    v22 = [v19 URLWithString:v21];

    v23 = *MEMORY[0x263F38100];
    v24 = *MEMORY[0x263F38100];
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136315651;
        v32 = "-[SSRVoiceProfileRetrainerFactory _fetchSecureAssetForNonCommunalDevice:]";
        __int16 v33 = 2112;
        v34 = v12;
        __int16 v35 = 2113;
        v36 = v22;
        _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Fetching SpeakerRecognition asset (OTA) with config file name:%@ at path: %{private}@", (uint8_t *)&v31, 0x20u);
      }
      v25 = NSURL;
      v26 = [v4 asset];
      v27 = [v26 resourcePath];
      v28 = [v25 URLWithString:v27];
      uint64_t v29 = [(SSRVoiceProfileRetrainerFactory *)self _secureAssetWithAssetResourcePathURL:v28 assetFileName:v12];

      v14 = (void *)v29;
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v31 = 136315651;
        v32 = "-[SSRVoiceProfileRetrainerFactory _fetchSecureAssetForNonCommunalDevice:]";
        __int16 v33 = 2112;
        v34 = v12;
        __int16 v35 = 2113;
        v36 = 0;
        _os_log_error_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_ERROR, "%s Skipping operation to fetch SpeakerRecognition asset (OTA) with config file name:%@ at path: %{private}@", (uint8_t *)&v31, 0x20u);
      }
      v22 = 0;
    }
    goto LABEL_22;
  }
LABEL_21:
  v22 = v10;
LABEL_22:

LABEL_23:

  return v14;
}

- (id)_fetchSecureAssetForCommunalDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F380D0] isExclaveHardware])
  {
    id v5 = objc_alloc(MEMORY[0x263F38238]);
    v6 = [MEMORY[0x263F38230] getBundle:1];
    v7 = (void *)[v5 init:v6];

    v8 = [v4 voiceProfile];
    id v9 = [v8 locale];
    v10 = [v7 resourcePathURL:v9];

    uint64_t v11 = [MEMORY[0x263F38230] getAssetFileName:1];
    v12 = (void *)v11;
    v13 = *MEMORY[0x263F38100];
    if (v10 && v11)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315651;
        int v17 = "-[SSRVoiceProfileRetrainerFactory _fetchSecureAssetForCommunalDevice:]";
        __int16 v18 = 2112;
        uint64_t v19 = v12;
        __int16 v20 = 2113;
        v21 = v10;
        _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Fetching SpeakerRecognition asset with config file name:%@ at path: %{private}@", (uint8_t *)&v16, 0x20u);
      }
      v14 = [(SSRVoiceProfileRetrainerFactory *)self _secureAssetWithAssetResourcePathURL:v10 assetFileName:v12];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315651;
        int v17 = "-[SSRVoiceProfileRetrainerFactory _fetchSecureAssetForCommunalDevice:]";
        __int16 v18 = 2112;
        uint64_t v19 = v12;
        __int16 v20 = 2113;
        v21 = v10;
        _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s Skipping operation to fetch SpeakerRecognition asset with config file name:%@ at path: %{private}@", (uint8_t *)&v16, 0x20u);
      }
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_secureAssetWithAssetResourcePathURL:(id)a3 assetFileName:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    v6 = (objc_class *)MEMORY[0x263F38228];
    id v7 = a4;
    id v8 = a3;
    id v4 = (void *)[[v6 alloc] initWithResourcePath:v8 assetFileName:v7];
  }

  return v4;
}

- (SSRVoiceProfileRetrainerFactory)init
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F38068] sharedPreferences];
  int v4 = [v3 isSpeakerRecognitionAvailable];

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)SSRVoiceProfileRetrainerFactory;
    self = [(SSRVoiceProfileRetrainerFactory *)&v8 init];
    id v5 = self;
  }
  else
  {
    v6 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SSRVoiceProfileRetrainerFactory init]";
      _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, "%s ERR: SpeakerRecognition is not available on this platform", buf, 0xCu);
    }
    id v5 = 0;
  }

  return v5;
}

@end