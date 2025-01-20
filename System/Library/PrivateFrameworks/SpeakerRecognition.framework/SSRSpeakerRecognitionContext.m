@interface SSRSpeakerRecognitionContext
- (BOOL)_checkIfModelsPresentForProfiles:(id)a3 forSpIdType:(unint64_t)a4 forAsset:(id)a5;
- (BOOL)osTransactionReqd;
- (CSAsset)asset;
- (NSArray)voiceProfileArray;
- (NSDictionary)expModelsContext;
- (NSDictionary)modelsContext;
- (NSDictionary)numEnrollmentUtterances;
- (NSDictionary)vtEventInfo;
- (NSString)configVersion;
- (NSString)debugUtteranceAudioFile;
- (NSString)debugUtteranceMetaFile;
- (NSString)locale;
- (NSString)sessionId;
- (NSURL)resourceFilePath;
- (NSURL)vadResourcePath;
- (NSUUID)endpointUUID;
- (SSRLoggingAggregator)logAggregator;
- (SSRSpeakerRecognitionContext)initWithVoiceRecognitionContext:(id)a3 error:(id *)a4;
- (float)combinationWeight;
- (id)description;
- (id)pickAssetForProfiles:(id)a3 forSpIdType:(unint64_t)a4;
- (id)pickAssetForProfiles:(id)a3 forSpIdType:(unint64_t)a4 withAssetArray:(id)a5;
- (unint64_t)activeChannel;
- (unint64_t)maxAllowedAudioSamples;
- (unint64_t)recognitionStyle;
- (unint64_t)scoreType;
- (unint64_t)spIdType;
- (void)composeModelContextsForProfiles:(id)a3 forSpIdType:(unint64_t)a4 forAsset:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)setAsset:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLogAggregator:(id)a3;
- (void)setSpIdType:(unint64_t)a3;
- (void)setVoiceProfileArray:(id)a3;
@end

@implementation SSRSpeakerRecognitionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logAggregator, 0);
  objc_storeStrong((id *)&self->_debugUtteranceMetaFile, 0);
  objc_storeStrong((id *)&self->_debugUtteranceAudioFile, 0);
  objc_storeStrong((id *)&self->_expModelsContext, 0);
  objc_storeStrong((id *)&self->_modelsContext, 0);
  objc_storeStrong((id *)&self->_vadResourcePath, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_vtEventInfo, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_voiceProfileArray, 0);

  objc_storeStrong((id *)&self->_sessionId, 0);
}

- (void)setLogAggregator:(id)a3
{
}

- (SSRLoggingAggregator)logAggregator
{
  return self->_logAggregator;
}

- (NSString)debugUtteranceMetaFile
{
  return self->_debugUtteranceMetaFile;
}

- (NSString)debugUtteranceAudioFile
{
  return self->_debugUtteranceAudioFile;
}

- (BOOL)osTransactionReqd
{
  return self->_osTransactionReqd;
}

- (unint64_t)maxAllowedAudioSamples
{
  return self->_maxAllowedAudioSamples;
}

- (NSDictionary)expModelsContext
{
  return self->_expModelsContext;
}

- (NSDictionary)modelsContext
{
  return self->_modelsContext;
}

- (NSURL)vadResourcePath
{
  return self->_vadResourcePath;
}

- (NSURL)resourceFilePath
{
  return self->_resourceFilePath;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (NSDictionary)vtEventInfo
{
  return self->_vtEventInfo;
}

- (float)combinationWeight
{
  return self->_combinationWeight;
}

- (unint64_t)recognitionStyle
{
  return self->_recognitionStyle;
}

- (unint64_t)scoreType
{
  return self->_scoreType;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setEndpointUUID:(id)a3
{
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setAsset:(id)a3
{
}

- (CSAsset)asset
{
  return self->_asset;
}

- (void)setSpIdType:(unint64_t)a3
{
  self->_spIdType = a3;
}

- (unint64_t)spIdType
{
  return self->_spIdType;
}

- (void)setVoiceProfileArray:(id)a3
{
}

- (NSArray)voiceProfileArray
{
  return self->_voiceProfileArray;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SSRSpeakerRecognitionContext dealloc]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerRecognitionContext;
  [(SSRSpeakerRecognitionContext *)&v4 dealloc];
}

- (NSDictionary)numEnrollmentUtterances
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((CSIsCommunalDevice() & 1) == 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    obj = self->_voiceProfileArray;
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v9 = [v8 voiceProfileAudioDirPathForSpidType:self->_spIdType];
          int64_t v10 = +[SSRUtils getNumberOfAudioFilesInDirectory:v9];
          v11 = [NSNumber numberWithUnsignedInteger:v10];
          v12 = [v8 profileID];
          [v3 setValue:v11 forKey:v12];
        }
        uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
  }

  return (NSDictionary *)v3;
}

- (id)pickAssetForProfiles:(id)a3 forSpIdType:(unint64_t)a4 withAssetArray:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if ([v9 count])
  {
    id v10 = [v9 objectAtIndexedSubscript:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (-[SSRSpeakerRecognitionContext _checkIfModelsPresentForProfiles:forSpIdType:forAsset:](self, "_checkIfModelsPresentForProfiles:forSpIdType:forAsset:", v8, a4, v16, (void)v22))
          {
            id v19 = v16;

            goto LABEL_19;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    if (CSIsCommunalDevice())
    {
      long long v17 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[SSRSpeakerRecognitionContext pickAssetForProfiles:forSpIdType:withAssetArray:]";
        __int16 v29 = 2112;
        id v30 = v10;
        _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s ERR: triggering profile retrain for asset %{publiic}@", buf, 0x16u);
      }
      long long v18 = objc_msgSend(MEMORY[0x263F087C8], "defaultCenter", (void)v22);
      [v18 postNotificationName:@"com.apple.voicetrigger.retrainRequired" object:0];
    }
    id v10 = v10;
    id v19 = v10;
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"ERR: Last known assets are nil - Bailing out"];
    uint64_t v20 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SSRSpeakerRecognitionContext pickAssetForProfiles:forSpIdType:withAssetArray:]";
      __int16 v29 = 2114;
      id v30 = v10;
      _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    id v19 = 0;
  }
LABEL_19:

  return v19;
}

- (id)pickAssetForProfiles:(id)a3 forSpIdType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[SSRAssetManager sharedManager];
  id v8 = [v7 allInstalledAssetsOfType:3 forLanguage:self->_locale];

  id v9 = [(SSRSpeakerRecognitionContext *)self pickAssetForProfiles:v6 forSpIdType:a4 withAssetArray:v8];

  return v9;
}

- (BOOL)_checkIfModelsPresentForProfiles:(id)a3 forSpIdType:(unint64_t)a4 forAsset:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "voiceProfileModelFilePathForRecognizerType:spIdType:", 1, a4, (void)v22);
        long long v15 = [v8 hashFromResourcePath];
        long long v16 = [v14 URLByAppendingPathComponent:v15];

        long long v17 = [MEMORY[0x263F08850] defaultManager];
        long long v18 = [v16 path];
        int v19 = [v17 fileExistsAtPath:v18];

        if (!v19)
        {
          BOOL v20 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 1;
LABEL_11:

  return v20;
}

- (void)composeModelContextsForProfiles:(id)a3 forSpIdType:(unint64_t)a4 forAsset:(id)a5 completion:(id)a6
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v66 = a3;
  v62 = (void (**)(id, id, id))a6;
  id v64 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v63 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v65 = [MEMORY[0x263F08850] defaultManager];
  char v9 = 0;
  uint64_t v10 = 1;
  while ((v9 & 1) == 0 || self->_spIdType != 3)
  {
    char v69 = v9;
    uint64_t v11 = +[SSRUtils satConfigFileNameForCSSpIdType:a4 forModelType:v10 forAssetType:[(CSAsset *)self->_asset assetProvider]];
    uint64_t v12 = NSURL;
    uint64_t v13 = [(CSAsset *)self->_asset resourcePath];
    v68 = (void *)v11;
    uint64_t v14 = [v13 stringByAppendingPathComponent:v11];
    v67 = [v12 URLWithString:v14];

    id v75 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v72 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v74 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v71 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v66;
    uint64_t v76 = [obj countByEnumeratingWithState:&v77 objects:v81 count:16];
    if (v76)
    {
      uint64_t v73 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v76; ++i)
        {
          if (*(void *)v78 != v73) {
            objc_enumerationMutation(obj);
          }
          long long v16 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          long long v17 = [v16 voiceProfileModelFilePathForRecognizerType:v10 spIdType:a4];
          long long v18 = [(CSAsset *)self->_asset hashFromResourcePath];
          int v19 = [v17 URLByAppendingPathComponent:v18];

          BOOL v20 = [v16 profileID];
          [v75 setValue:v19 forKey:v20];

          uint64_t v21 = [v16 exclaveVoiceProfileModelFilePathForRecognizerType:v10 spIdType:a4];
          if (v21)
          {
            long long v22 = (void *)v21;
            long long v23 = [(CSAsset *)self->_asset hashFromResourcePath];
            long long v24 = [v22 URLByAppendingPathComponent:v23];

            long long v25 = [v16 profileID];
            [v72 setValue:v24 forKey:v25];
          }
          v26 = objc_msgSend(v16, "voiceProfileModelFilePathForRecognizerType:spIdType:", v10, +[SSRUtils explicitSpIdTypeForSpId:](SSRUtils, "explicitSpIdTypeForSpId:", a4));
          uint64_t v27 = [(CSAsset *)self->_asset hashFromResourcePath];
          v28 = [v26 URLByAppendingPathComponent:v27];

          __int16 v29 = [v16 profileID];
          [v74 setValue:v28 forKey:v29];

          uint64_t v30 = objc_msgSend(v16, "exclaveVoiceProfileModelFilePathForRecognizerType:spIdType:", v10, +[SSRUtils explicitSpIdTypeForSpId:](SSRUtils, "explicitSpIdTypeForSpId:", a4));
          if (v30)
          {
            uint64_t v31 = (void *)v30;
            v32 = [(CSAsset *)self->_asset hashFromResourcePath];
            v33 = [v31 URLByAppendingPathComponent:v32];

            v34 = [v16 profileID];
            [v71 setValue:v33 forKey:v34];
          }
        }
        uint64_t v76 = [obj countByEnumeratingWithState:&v77 objects:v81 count:16];
      }
      while (v76);
    }

    v35 = [v67 path];
    char v36 = [v65 fileExistsAtPath:v35];

    if (v36)
    {
      v37 = [SSRSpeakerRecognitionModelContext alloc];
      id v38 = v75;
      if (![v75 count]) {
        id v38 = 0;
      }
      if ([v72 count]) {
        id v39 = v72;
      }
      else {
        id v39 = 0;
      }
      v40 = [(SSRSpeakerRecognitionModelContext *)v37 initWithConfigFilePath:v67 withModelFilePaths:v38 withModelFilePathsExclave:v39];
      v41 = +[SSRUtils stringForSpeakerRecognizerType:v10];
      [v64 setValue:v40 forKey:v41];

      v42 = [SSRSpeakerRecognitionModelContext alloc];
      id v43 = v74;
      if (![v74 count]) {
        id v43 = 0;
      }
      if ([v71 count]) {
        id v44 = v71;
      }
      else {
        id v44 = 0;
      }
      v45 = [(SSRSpeakerRecognitionModelContext *)v42 initWithConfigFilePath:v67 withModelFilePaths:v43 withModelFilePathsExclave:v44];
      v46 = +[SSRUtils stringForSpeakerRecognizerType:v10];
      [v63 setValue:v45 forKey:v46];

      char v47 = v69;
      v48 = v68;
    }
    else
    {
      v49 = (void *)*MEMORY[0x263F38100];
      char v47 = v69;
      v48 = v68;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t spIdType = self->_spIdType;
        v51 = v49;
        v52 = +[SSRUtils stringForCSSpIdType:spIdType];
        v53 = +[SSRUtils stringForSpeakerRecognizerType:v10];
        v54 = [v67 path];
        *(_DWORD *)buf = 136315906;
        v83 = "-[SSRSpeakerRecognitionContext composeModelContextsForProfiles:forSpIdType:forAsset:completion:]";
        __int16 v84 = 2114;
        v85 = v52;
        __int16 v86 = 2114;
        v87 = v53;
        __int16 v88 = 2114;
        v89 = v54;
        _os_log_impl(&dword_21C8A5000, v51, OS_LOG_TYPE_DEFAULT, "%s Skipping Model {%{public}@, %{public}@} as file doesnt exist at %{public}@", buf, 0x2Au);
      }
    }

    char v9 = 1;
    uint64_t v10 = 2;
    if (v47) {
      goto LABEL_33;
    }
  }
  v55 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    v56 = v55;
    v57 = +[SSRUtils stringForCSSpIdType:3];
    v58 = +[SSRUtils stringForSpeakerRecognizerType:2];
    locale = self->_locale;
    *(_DWORD *)buf = 136315906;
    v83 = "-[SSRSpeakerRecognitionContext composeModelContextsForProfiles:forSpIdType:forAsset:completion:]";
    __int16 v84 = 2114;
    v85 = v57;
    __int16 v86 = 2114;
    v87 = v58;
    __int16 v88 = 2114;
    v89 = locale;
    _os_log_impl(&dword_21C8A5000, v56, OS_LOG_TYPE_DEFAULT, "%s Skipping Model {%{public}@, %{public}@} for %{public}@", buf, 0x2Au);
  }
LABEL_33:
  if (v62)
  {
    if ([v64 count]) {
      id v60 = v64;
    }
    else {
      id v60 = 0;
    }
    if ([v63 count]) {
      id v61 = v63;
    }
    else {
      id v61 = 0;
    }
    v62[2](v62, v60, v61);
  }
}

- (id)description
{
  v3 = NSString;
  sessionId = self->_sessionId;
  unint64_t recognitionStyle = self->_recognitionStyle;
  id v6 = +[SSRUtils stringForInvocationStyle:recognitionStyle];
  id v7 = [v3 stringWithFormat:@"[SessionId: %@, RecognitionStyle:(%lu)%@, Asset: %@, vtEventInfo: %@]", sessionId, recognitionStyle, v6, self->_asset, self->_vtEventInfo];

  return v7;
}

- (SSRSpeakerRecognitionContext)initWithVoiceRecognitionContext:(id)a3 error:(id *)a4
{
  uint64_t v150 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v135.receiver = self;
  v135.super_class = (Class)SSRSpeakerRecognitionContext;
  id v7 = [(SSRSpeakerRecognitionContext *)&v135 init];
  if (v7)
  {
    id v8 = [SSRLoggingAggregator alloc];
    locale = v7->_locale;
    uint64_t v10 = [(CSAsset *)v7->_asset configVersion];
    uint64_t v11 = [(SSRLoggingAggregator *)v8 initWithEvent:@"recognition" locale:locale configVersion:v10];
    logAggregator = v7->_logAggregator;
    v7->_logAggregator = (SSRLoggingAggregator *)v11;

    uint64_t v13 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionEndpointId"];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      long long v15 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionEndpointId"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v17 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionEndpointId"];
        endpointUUID = v7->_endpointUUID;
        v7->_endpointUUID = (NSUUID *)v17;

        int v19 = (void *)*MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_INFO))
        {
          BOOL v20 = v7->_endpointUUID;
          uint64_t v21 = v19;
          long long v22 = [(NSUUID *)v20 UUIDString];
          *(_DWORD *)buf = 136315394;
          v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
          __int16 v148 = 2114;
          v149 = v22;
          _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_INFO, "%s endpointUUID: %{public}@", buf, 0x16u);
        }
      }
    }
    long long v23 = [MEMORY[0x263F38068] sharedPreferences];
    char v24 = [v23 isSpeakerRecognitionAvailable];

    if (v24)
    {
      v7->_unint64_t recognitionStyle = 0;
      long long v25 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionStyle"];

      if (v25)
      {
        v26 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionStyle"];
        v7->_unint64_t recognitionStyle = (int)[v26 intValue];

        if (v7->_recognitionStyle >= 3)
        {
          uint64_t v27 = [NSString stringWithFormat:@"ERR: Invalid Speaker Recognition style - Bailing out"];
          v28 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
            __int16 v148 = 2114;
            v149 = v27;
            _os_log_error_impl(&dword_21C8A5000, v28, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
            if (!a4) {
              goto LABEL_12;
            }
          }
          else if (!a4)
          {
LABEL_12:
            uint64_t v31 = v7->_logAggregator;
            uint64_t v32 = 109;
LABEL_79:
            [(SSRLoggingAggregator *)v31 setSpeakerRecognitionProcessingStatus:v32];

            goto LABEL_80;
          }
          __int16 v29 = (void *)MEMORY[0x263F087E8];
          v142 = @"reason";
          v143 = v27;
          uint64_t v30 = [NSDictionary dictionaryWithObjects:&v143 forKeys:&v142 count:1];
          *a4 = [v29 errorWithDomain:@"com.apple.speakerrecognition" code:109 userInfo:v30];

          goto LABEL_12;
        }
      }
      char v36 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionLocale"];
      v37 = v36;
      if (v36)
      {
        id v38 = v36;
        id v39 = v7->_locale;
        v7->_locale = v38;
      }
      else
      {
        v40 = (void *)MEMORY[0x263F380D0];
        id v39 = [(NSUUID *)v7->_endpointUUID UUIDString];
        uint64_t v41 = [v40 getSiriLanguageWithEndpointId:v39 fallbackLanguage:0];
        v42 = v7->_locale;
        v7->_locale = (NSString *)v41;
      }
      uint64_t v43 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionVTEventInfo"];
      if (v43
        && (id v44 = (void *)v43,
            [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionVTEventInfo"],
            v45 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char v46 = objc_opt_isKindOfClass(),
            v45,
            v44,
            (v46 & 1) != 0))
      {
        uint64_t v47 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionVTEventInfo"];
        vtEventInfo = v7->_vtEventInfo;
        v7->_vtEventInfo = (NSDictionary *)v47;
      }
      else
      {
        vtEventInfo = v7->_vtEventInfo;
        v7->_vtEventInfo = 0;
      }

      v49 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionProfileArray"];

      if (v49)
      {
        uint64_t v50 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionProfileArray"];
        voiceProfileArray = v7->_voiceProfileArray;
        v7->_voiceProfileArray = (NSArray *)v50;
      }
      else
      {
        voiceProfileArray = +[SSRVoiceProfileStore sharedInstance];
        uint64_t v52 = [voiceProfileArray userVoiceProfilesForAppDomain:@"com.apple.siri" forLocale:v7->_locale];
        v53 = v7->_voiceProfileArray;
        v7->_voiceProfileArray = (NSArray *)v52;
      }
      v54 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionMaxAudioSecs"];

      if (v54)
      {
        v55 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionMaxAudioSecs"];
        [v55 floatValue];
        float v57 = v56;
        [MEMORY[0x263F38018] inputRecordingSampleRate];
        v7->_maxAllowedAudioSamples = (unint64_t)(float)(v57 * v58);
      }
      else
      {
        [MEMORY[0x263F38018] inputRecordingSampleRate];
        v7->_maxAllowedAudioSamples = (unint64_t)(v59 * 1000.0);
      }
      id v60 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionAsset"];

      if (v60)
      {
        uint64_t v61 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionAsset"];
      }
      else
      {
        id v74 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionAssetArray"];

        if (v74)
        {
          v62 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionAssetArray"];
          uint64_t v75 = [(SSRSpeakerRecognitionContext *)v7 pickAssetForProfiles:v7->_voiceProfileArray forSpIdType:v7->_spIdType withAssetArray:v62];
          asset = v7->_asset;
          v7->_asset = (CSAsset *)v75;

          if (!v7->_asset)
          {
            uint64_t v77 = [(SSRSpeakerRecognitionContext *)v7 pickAssetForProfiles:v7->_voiceProfileArray forSpIdType:v7->_spIdType];
            long long v78 = v7->_asset;
            v7->_asset = (CSAsset *)v77;
          }
LABEL_33:

          id v63 = v7->_asset;
          if (v63)
          {
            uint64_t v64 = [(CSAsset *)v63 configVersion];
            configVersion = v7->_configVersion;
            v7->_configVersion = (NSString *)v64;

            [(CSAsset *)v7->_asset psrCombinationWeight];
            v7->_combinationWeight = v66;
            uint64_t v67 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionUsePayloadProfile"];
            if (v67
              && (v68 = (void *)v67,
                  [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionUsePayloadProfile"],
                  char v69 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  char v70 = objc_opt_isKindOfClass(),
                  v69,
                  v68,
                  (v70 & 1) != 0))
            {
              id v71 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionUsePayloadProfile"];
              char v72 = [v71 BOOLValue];

              if ((v72 & 1) == 0) {
                goto LABEL_58;
              }
            }
            else
            {
              uint64_t v73 = v7->_asset;
              if (CSIsCommunalDevice())
              {
              }
              else
              {
                if ((CSIsIOS() & 1) == 0 && (CSIsAppleSiliconMac() & 1) == 0)
                {

LABEL_58:
                  uint64_t v86 = 1;
LABEL_59:
                  v7->_unint64_t spIdType = v86;
                  if (v7->_recognitionStyle != 2) {
                    goto LABEL_66;
                  }
                  v87 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionVADAssetPath"];

                  if (v87)
                  {
                    __int16 v88 = (void *)MEMORY[0x263F37FB0];
                    v89 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionVADAssetPath"];
                    uint64_t v90 = [v88 assetForAssetType:1 resourcePath:v89 configVersion:@"SSR"];

                    v91 = [v90 path];
                  }
                  else
                  {
                    v92 = +[SSRAssetManager sharedManager];
                    uint64_t v90 = [v92 allInstalledAssetsOfType:1 forLanguage:v7->_locale];

                    if (![v90 count])
                    {

                      goto LABEL_75;
                    }
                    v93 = [v90 objectAtIndexedSubscript:0];
                    v91 = [v93 path];
                  }
                  if (v91)
                  {
                    uint64_t v94 = [NSURL fileURLWithPath:v91];
                    vadResourcePath = v7->_vadResourcePath;
                    v7->_vadResourcePath = (NSURL *)v94;

LABEL_66:
                    v96 = NSURL;
                    v97 = [(CSAsset *)v7->_asset resourcePath];
                    uint64_t v98 = [v96 URLWithString:v97];
                    resourceFilePath = v7->_resourceFilePath;
                    v7->_resourceFilePath = (NSURL *)v98;

                    v100 = v7->_voiceProfileArray;
                    unint64_t spIdType = v7->_spIdType;
                    v102 = v7->_asset;
                    uint64_t v130 = MEMORY[0x263EF8330];
                    uint64_t v131 = 3221225472;
                    v132 = __70__SSRSpeakerRecognitionContext_initWithVoiceRecognitionContext_error___block_invoke;
                    v133 = &unk_26442A758;
                    v103 = v7;
                    v134 = v103;
                    [(SSRSpeakerRecognitionContext *)v103 composeModelContextsForProfiles:v100 forSpIdType:spIdType forAsset:v102 completion:&v130];
                    if (v103->_modelsContext)
                    {

                      v104 = [MEMORY[0x263F38068] sharedPreferences];
                      v103->_scoreType = [v104 speakerIdScoreReportingType];

                      v105 = [MEMORY[0x263F08C38] UUID];
                      uint64_t v106 = [v105 UUIDString];
                      sessionId = v103->_sessionId;
                      v103->_sessionId = (NSString *)v106;

                      v108 = +[SSRUtils ssrAudioLogsDir];
                      v109 = NSString;
                      v110 = +[SSRUtils stringForInvocationStyle:v7->_recognitionStyle];
                      v111 = +[SSRUtils stringForCSSpIdType:v7->_spIdType];
                      v112 = [v109 stringWithFormat:@"%@_%@_%@", v110, v111, v103->_sessionId, v130, v131, v132, v133];

                      v113 = [v112 stringByAppendingPathExtension:@"wav"];
                      uint64_t v114 = [v108 stringByAppendingPathComponent:v113];
                      debugUtteranceAudioFile = v103->_debugUtteranceAudioFile;
                      v103->_debugUtteranceAudioFile = (NSString *)v114;

                      v116 = [v112 stringByAppendingPathExtension:@"json"];
                      uint64_t v117 = [v108 stringByAppendingPathComponent:v116];
                      debugUtteranceMetaFile = v103->_debugUtteranceMetaFile;
                      v103->_debugUtteranceMetaFile = (NSString *)v117;

                      v103->_osTransactionReqd = 1;
                      v119 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionOSTransactionReqd"];

                      if (v119)
                      {
                        v120 = [v6 objectForKeyedSubscript:@"SSRSpeakerRecognitionOSTransactionReqd"];
                        v103->_osTransactionReqd = [v120 BOOLValue];
                      }
                      goto LABEL_69;
                    }
                    v122 = [NSString stringWithFormat:@"ERR: ModelsContext is nil for locale %@ - Bailing out", v7->_locale];
                    v123 = *MEMORY[0x263F38100];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
                      __int16 v148 = 2114;
                      v149 = v122;
                      _os_log_error_impl(&dword_21C8A5000, v123, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
                      if (!a4) {
                        goto LABEL_73;
                      }
                    }
                    else if (!a4)
                    {
LABEL_73:
                      [(SSRLoggingAggregator *)v7->_logAggregator setSpeakerRecognitionProcessingStatus:713];

LABEL_80:
                      v121 = 0;
                      goto LABEL_81;
                    }
                    v124 = (void *)MEMORY[0x263F087E8];
                    v136 = @"reason";
                    v137 = v122;
                    v125 = [NSDictionary dictionaryWithObjects:&v137 forKeys:&v136 count:1];
                    *a4 = [v124 errorWithDomain:@"com.apple.speakerrecognition" code:713 userInfo:v125];

                    goto LABEL_73;
                  }
LABEL_75:
                  uint64_t v27 = [NSString stringWithFormat:@"ERR: Endpointer Asset not picked - Bailing out"];
                  v126 = *MEMORY[0x263F38100];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
                    __int16 v148 = 2114;
                    v149 = v27;
                    _os_log_error_impl(&dword_21C8A5000, v126, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
                    if (!a4) {
                      goto LABEL_78;
                    }
                  }
                  else if (!a4)
                  {
LABEL_78:
                    uint64_t v31 = v7->_logAggregator;
                    uint64_t v32 = 108;
                    goto LABEL_79;
                  }
                  v127 = (void *)MEMORY[0x263F087E8];
                  v138 = @"reason";
                  v139 = v27;
                  v128 = [NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
                  *a4 = [v127 errorWithDomain:@"com.apple.speakerrecognition" code:107 userInfo:v128];

                  goto LABEL_78;
                }
                [(CSAsset *)v73 psrCombinationWeight];
                float v83 = v82;
                BOOL v84 = [(CSAsset *)v73 useTDTIEnrollment];
                BOOL v85 = v83 == 1.0 && v84;

                if (!v85) {
                  goto LABEL_58;
                }
              }
            }
            uint64_t v86 = 3;
            goto LABEL_59;
          }
          uint64_t v27 = [NSString stringWithFormat:@"ERR: Asset not picked - Bailing out"];
          long long v79 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
            __int16 v148 = 2114;
            v149 = v27;
            _os_log_error_impl(&dword_21C8A5000, v79, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
            if (!a4) {
              goto LABEL_46;
            }
          }
          else if (!a4)
          {
LABEL_46:
            uint64_t v31 = v7->_logAggregator;
            uint64_t v32 = 107;
            goto LABEL_79;
          }
          long long v80 = (void *)MEMORY[0x263F087E8];
          v140 = @"reason";
          v141 = v27;
          v81 = [NSDictionary dictionaryWithObjects:&v141 forKeys:&v140 count:1];
          *a4 = [v80 errorWithDomain:@"com.apple.speakerrecognition" code:107 userInfo:v81];

          goto LABEL_46;
        }
        uint64_t v61 = [(SSRSpeakerRecognitionContext *)v7 pickAssetForProfiles:v7->_voiceProfileArray forSpIdType:v7->_spIdType];
      }
      v62 = v7->_asset;
      v7->_asset = (CSAsset *)v61;
      goto LABEL_33;
    }
    uint64_t v27 = [NSString stringWithFormat:@"ERR: SpeakerRecognition not enabled - Bailing out"];
    v33 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
      __int16 v148 = 2114;
      v149 = v27;
      _os_log_error_impl(&dword_21C8A5000, v33, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      if (!a4) {
        goto LABEL_16;
      }
    }
    else if (!a4)
    {
LABEL_16:
      uint64_t v31 = v7->_logAggregator;
      uint64_t v32 = 752;
      goto LABEL_79;
    }
    v34 = (void *)MEMORY[0x263F087E8];
    v144 = @"reason";
    v145 = v27;
    v35 = [NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];
    *a4 = [v34 errorWithDomain:@"com.apple.speakerrecognition" code:752 userInfo:v35];

    goto LABEL_16;
  }
LABEL_69:
  v121 = v7;
LABEL_81:

  return v121;
}

void __70__SSRSpeakerRecognitionContext_initWithVoiceRecognitionContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 120);
  *(void *)(v7 + 120) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 128);
  *(void *)(v9 + 128) = v6;
}

@end