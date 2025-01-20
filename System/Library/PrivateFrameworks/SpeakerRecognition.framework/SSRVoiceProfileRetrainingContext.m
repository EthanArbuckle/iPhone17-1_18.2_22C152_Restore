@interface SSRVoiceProfileRetrainingContext
- (BOOL)filterToVoiceTriggerUtterances;
- (BOOL)forceRetrain;
- (CSAsset)asset;
- (NSArray)compareVoiceProfileArray;
- (NSDictionary)modelsContext;
- (NSString)configVersion;
- (NSString)sessionId;
- (NSURL)resourceFilePath;
- (SSRLoggingAggregator)logAggregator;
- (SSRVoiceProfile)voiceProfile;
- (SSRVoiceProfileRetrainingContext)initWithVoiceRetrainingContext:(id)a3 error:(id *)a4;
- (SSRVoiceProfileRetrainingContext)initWithVoiceRetrainingContext:(id)a3 skipClassTypeValidate:(BOOL)a4 error:(id *)a5;
- (float)combinationWeight;
- (id)description;
- (unint64_t)maxAllowedSpeakerVectors;
- (unint64_t)spIdType;
- (void)setAsset:(id)a3;
- (void)setCompareVoiceProfileArray:(id)a3;
- (void)setLogAggregator:(id)a3;
- (void)setVoiceProfile:(id)a3;
@end

@implementation SSRVoiceProfileRetrainingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logAggregator, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_modelsContext, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfile, 0);
  objc_storeStrong((id *)&self->_compareVoiceProfileArray, 0);

  objc_storeStrong((id *)&self->_sessionId, 0);
}

- (void)setLogAggregator:(id)a3
{
}

- (SSRLoggingAggregator)logAggregator
{
  return self->_logAggregator;
}

- (void)setAsset:(id)a3
{
}

- (CSAsset)asset
{
  return self->_asset;
}

- (float)combinationWeight
{
  return self->_combinationWeight;
}

- (NSDictionary)modelsContext
{
  return self->_modelsContext;
}

- (unint64_t)maxAllowedSpeakerVectors
{
  return self->_maxAllowedSpeakerVectors;
}

- (BOOL)forceRetrain
{
  return self->_forceRetrain;
}

- (BOOL)filterToVoiceTriggerUtterances
{
  return self->_filterToVoiceTriggerUtterances;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (NSURL)resourceFilePath
{
  return self->_resourceFilePath;
}

- (unint64_t)spIdType
{
  return self->_spIdType;
}

- (void)setVoiceProfile:(id)a3
{
}

- (SSRVoiceProfile)voiceProfile
{
  return self->_voiceProfile;
}

- (void)setCompareVoiceProfileArray:(id)a3
{
}

- (NSArray)compareVoiceProfileArray
{
  return self->_compareVoiceProfileArray;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (id)description
{
  v2 = NSString;
  sessionId = self->_sessionId;
  asset = self->_asset;
  v5 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
  v6 = [v2 stringWithFormat:@"[SessionId: %@, Asset: %@, ProfileID: %@]", sessionId, asset, v5];

  return v6;
}

- (SSRVoiceProfileRetrainingContext)initWithVoiceRetrainingContext:(id)a3 error:(id *)a4
{
  return [(SSRVoiceProfileRetrainingContext *)self initWithVoiceRetrainingContext:a3 skipClassTypeValidate:0 error:a4];
}

- (SSRVoiceProfileRetrainingContext)initWithVoiceRetrainingContext:(id)a3 skipClassTypeValidate:(BOOL)a4 error:(id *)a5
{
  v145[1] = *MEMORY[0x263EF8340];
  id v120 = a3;
  v126.receiver = self;
  v126.super_class = (Class)SSRVoiceProfileRetrainingContext;
  v7 = [(SSRVoiceProfileRetrainingContext *)&v126 init];
  if (!v7) {
    goto LABEL_88;
  }
  v8 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingVoiceProfile"];

  if (a4)
  {
    if (!v8)
    {
LABEL_9:
      v17 = [NSString stringWithFormat:@"ERR: VoiceProfile is invalid - Bailing out"];
      v18 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:skipClassTypeValidate:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v17;
        _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      if (a5)
      {
        v19 = (void *)MEMORY[0x263F087E8];
        v144 = @"reason";
        v145[0] = v17;
        v20 = [NSDictionary dictionaryWithObjects:v145 forKeys:&v144 count:1];
        *a5 = [v19 errorWithDomain:@"com.apple.speakerrecognition" code:713 userInfo:v20];
      }
LABEL_13:

LABEL_14:
      v21 = 0;
      goto LABEL_89;
    }
  }
  else
  {
    if (!v8) {
      goto LABEL_9;
    }
    v9 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingVoiceProfile"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
  }
  uint64_t v11 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingVoiceProfile"];
  voiceProfile = v7->_voiceProfile;
  v7->_voiceProfile = (SSRVoiceProfile *)v11;

  v13 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingAsset"];

  if (v13)
  {
    uint64_t v14 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingAsset"];
    asset = v7->_asset;
    v7->_asset = (CSAsset *)v14;

    v16 = v7->_asset;
  }
  else
  {
    v22 = +[SSRAssetManager sharedManager];
    v23 = [(SSRVoiceProfile *)v7->_voiceProfile locale];
    uint64_t v24 = [v22 installedAssetOfType:3 forLanguage:v23];
    v25 = v7->_asset;
    v7->_asset = (CSAsset *)v24;

    v16 = v7->_asset;
    if (!v16)
    {
      v17 = [NSString stringWithFormat:@"ERR: Last known assets are nil - Bailing out"];
      v38 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:skipClassTypeValidate:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v17;
        _os_log_error_impl(&dword_21C8A5000, v38, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      if (a5)
      {
        v39 = (void *)MEMORY[0x263F087E8];
        v142 = @"reason";
        v143 = v17;
        v40 = [NSDictionary dictionaryWithObjects:&v143 forKeys:&v142 count:1];
        *a5 = [v39 errorWithDomain:@"com.apple.speakerrecognition" code:107 userInfo:v40];
      }
      goto LABEL_13;
    }
  }
  uint64_t v26 = [(CSAsset *)v16 configVersion];
  configVersion = v7->_configVersion;
  v7->_configVersion = (NSString *)v26;

  [(CSAsset *)v7->_asset psrCombinationWeight];
  v7->_combinationWeight = v28;
  v29 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingPayloadProfile"];

  if (v29)
  {
    v30 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingPayloadProfile"];
    int v31 = [v30 BOOLValue];
    uint64_t v32 = 3;
    if (!v31) {
      uint64_t v32 = 1;
    }
    v7->_unint64_t spIdType = v32;

    goto LABEL_40;
  }
  v33 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingSpIdType"];
  if (v33)
  {
    v34 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingSpIdType"];
    BOOL v35 = [v34 intValue] == 0;

    if (!v35)
    {
      v36 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingSpIdType"];
      v7->_unint64_t spIdType = (int)[v36 intValue];

      goto LABEL_40;
    }
  }
  v37 = v7->_asset;
  if (!CSIsCommunalDevice())
  {
    if (CSIsIOS() & 1) != 0 || (CSIsAppleSiliconMac())
    {
      [(CSAsset *)v37 psrCombinationWeight];
      float v42 = v41;
      BOOL v43 = [(CSAsset *)v37 useTDTIEnrollment];
      BOOL v44 = v42 == 1.0 && v43;

      if (v44) {
        goto LABEL_36;
      }
    }
    else
    {
    }
    uint64_t v45 = 1;
    goto LABEL_39;
  }

LABEL_36:
  uint64_t v45 = 3;
LABEL_39:
  v7->_unint64_t spIdType = v45;
LABEL_40:
  v46 = NSURL;
  v47 = [(CSAsset *)v7->_asset resourcePath];
  uint64_t v48 = [v46 URLWithString:v47];
  resourceFilePath = v7->_resourceFilePath;
  v7->_resourceFilePath = (NSURL *)v48;

  v50 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingCompareVoiceProfiles"];
  if (v50)
  {
    v51 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingCompareVoiceProfiles"];
    objc_opt_class();
    char v52 = objc_opt_isKindOfClass();

    if ((v52 & 1) == 0)
    {
      v17 = [NSString stringWithFormat:@"ERR: VoiceProfile is invalid - Bailing out"];
      v101 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:skipClassTypeValidate:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v17;
        _os_log_error_impl(&dword_21C8A5000, v101, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      if (a5)
      {
        v102 = (void *)MEMORY[0x263F087E8];
        v140 = @"reason";
        v141 = v17;
        v103 = [NSDictionary dictionaryWithObjects:&v141 forKeys:&v140 count:1];
        *a5 = [v102 errorWithDomain:@"com.apple.speakerrecognition" code:713 userInfo:v103];
      }
      goto LABEL_13;
    }
  }
  v7->_forceRetrain = 0;
  v53 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingForce"];

  if (v53)
  {
    v54 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingForce"];
    v7->_forceRetrain = [v54 BOOLValue];
  }
  uint64_t v55 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingCompareVoiceProfiles"];
  compareVoiceProfileArray = v7->_compareVoiceProfileArray;
  v7->_compareVoiceProfileArray = (NSArray *)v55;

  id v118 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v119 = [MEMORY[0x263F08850] defaultManager];
  char v57 = 0;
  uint64_t v58 = 1;
  while (1)
  {
    char v59 = v57;
    unint64_t spIdType = v7->_spIdType;
    if (spIdType != 3) {
      break;
    }
    if (v57) {
      goto LABEL_68;
    }
LABEL_49:
    v61 = +[SSRUtils satConfigFileNameForCSSpIdType:spIdType forModelType:v58 forAssetType:[(CSAsset *)v7->_asset assetProvider]];
    v62 = NSURL;
    v63 = [(CSAsset *)v7->_asset resourcePath];
    v64 = [v63 stringByAppendingPathComponent:v61];
    v65 = [v62 URLWithString:v64];

    v66 = [v65 path];
    LOBYTE(v62) = [v119 fileExistsAtPath:v66];

    if (v62)
    {
      v67 = [(SSRVoiceProfile *)v7->_voiceProfile voiceProfileModelFilePathForRecognizerType:v58 spIdType:v7->_spIdType];
      v68 = [(CSAsset *)v7->_asset hashFromResourcePath];
      v69 = [v67 URLByAppendingPathComponent:v68];

      unint64_t v70 = v7->_spIdType;
      v71 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingCompareVoiceProfilesSpIdType"];

      if (v71)
      {
        v72 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingCompareVoiceProfilesSpIdType"];
        LODWORD(v70) = [v72 intValue];

        unint64_t v70 = (int)v70;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v138 = __Block_byref_object_copy__5538;
      *(void *)&long long v139 = __Block_byref_object_dispose__5539;
      *((void *)&v139 + 1) = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v73 = v7->_compareVoiceProfileArray;
      v121[0] = MEMORY[0x263EF8330];
      v121[1] = 3221225472;
      v121[2] = __95__SSRVoiceProfileRetrainingContext_initWithVoiceRetrainingContext_skipClassTypeValidate_error___block_invoke;
      v121[3] = &unk_264429990;
      uint64_t v124 = v58;
      unint64_t v125 = v70;
      v122 = v7;
      v123 = buf;
      [(NSArray *)v73 enumerateObjectsUsingBlock:v121];
      if ([MEMORY[0x263F380D0] isExclaveHardware])
      {
        v74 = [(SSRVoiceProfile *)v7->_voiceProfile exclaveVoiceProfileModelFilePathForRecognizerType:v58 spIdType:v7->_spIdType];
        v75 = [(CSAsset *)v7->_asset hashFromResourcePath];
        v76 = [v74 URLByAppendingPathComponent:v75];

        v77 = [SSRVoiceProfileModelContext alloc];
        if ([*(id *)(*(void *)&buf[8] + 40) count]) {
          uint64_t v78 = *(void *)(*(void *)&buf[8] + 40);
        }
        else {
          uint64_t v78 = 0;
        }
        v87 = [(SSRVoiceProfileModelContext *)v77 initWithConfigFilePath:v65 withModelPath:v69 withModelPathExclave:v76 withCompareModelFilePaths:v78];
      }
      else
      {
        v85 = [SSRVoiceProfileModelContext alloc];
        if ([*(id *)(*(void *)&buf[8] + 40) count]) {
          uint64_t v86 = *(void *)(*(void *)&buf[8] + 40);
        }
        else {
          uint64_t v86 = 0;
        }
        v87 = [(SSRVoiceProfileModelContext *)v85 initWithConfigFilePath:v65 withModelPath:v69 withCompareModelFilePaths:v86];
      }
      v88 = +[SSRUtils stringForSpeakerRecognizerType:v58];
      [v118 setValue:v87 forKey:v88];

      v89 = (id)*MEMORY[0x263F38100];
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        id v90 = +[SSRUtils stringForCSSpIdType:v7->_spIdType];
        id v91 = +[SSRUtils stringForSpeakerRecognizerType:v58];
        v92 = [(SSRVoiceProfile *)v7->_voiceProfile locale];
        *(_DWORD *)v129 = 136315906;
        v130 = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:skipClassTypeValidate:error:]";
        __int16 v131 = 2114;
        id v132 = v90;
        __int16 v133 = 2114;
        id v134 = v91;
        __int16 v135 = 2114;
        v136 = v92;
        _os_log_impl(&dword_21C8A5000, v89, OS_LOG_TYPE_DEFAULT, "%s Added model context {%{public}@, %{public}@} for %{public}@", v129, 0x2Au);
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      v79 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v80 = v7->_spIdType;
        v81 = v79;
        v82 = +[SSRUtils stringForCSSpIdType:v80];
        v83 = +[SSRUtils stringForSpeakerRecognizerType:v58];
        v84 = [(SSRVoiceProfile *)v7->_voiceProfile locale];
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:skipClassTypeValidate:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v82;
        *(_WORD *)&buf[22] = 2114;
        v138 = v83;
        LOWORD(v139) = 2114;
        *(void *)((char *)&v139 + 2) = v84;
        _os_log_impl(&dword_21C8A5000, v81, OS_LOG_TYPE_DEFAULT, "%s Skipping model {%{public}@, %{public}@} for %{public}@", buf, 0x2Au);
      }
    }

    char v57 = 1;
    uint64_t v58 = 2;
    if (v59) {
      goto LABEL_70;
    }
  }
  if ((v57 & (spIdType == 4)) == 0) {
    goto LABEL_49;
  }
LABEL_68:
  v93 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    v94 = v93;
    v95 = +[SSRUtils stringForCSSpIdType:spIdType];
    v96 = +[SSRUtils stringForSpeakerRecognizerType:v58];
    v97 = [(SSRVoiceProfile *)v7->_voiceProfile locale];
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:skipClassTypeValidate:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v95;
    *(_WORD *)&buf[22] = 2114;
    v138 = v96;
    LOWORD(v139) = 2114;
    *(void *)((char *)&v139 + 2) = v97;
    _os_log_impl(&dword_21C8A5000, v94, OS_LOG_TYPE_DEFAULT, "%s Skipping SAT Model {%{public}@, %{public}@} for %{public}@", buf, 0x2Au);
  }
LABEL_70:
  if ([v118 count]) {
    v98 = v118;
  }
  else {
    v98 = 0;
  }
  objc_storeStrong((id *)&v7->_modelsContext, v98);
  if (!v7->_modelsContext)
  {
    v104 = [NSString stringWithFormat:@"ERR: _modelsContext is nil - Bailing out"];
    v105 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:skipClassTypeValidate:error:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v104;
      _os_log_error_impl(&dword_21C8A5000, v105, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    if (a5)
    {
      v106 = (void *)MEMORY[0x263F087E8];
      v127 = @"reason";
      v128 = v104;
      v107 = [NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
      *a5 = [v106 errorWithDomain:@"com.apple.speakerrecognition" code:713 userInfo:v107];
    }
    goto LABEL_14;
  }
  v99 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingFilterToVoiceTriggerUtterances"];

  if (v99)
  {
    v100 = [v120 objectForKeyedSubscript:@"SSRVoiceRetrainingFilterToVoiceTriggerUtterances"];
    v7->_filterToVoiceTriggerUtterances = [v100 BOOLValue];
  }
  else
  {
    v7->_filterToVoiceTriggerUtterances = 0;
  }
  v7->_maxAllowedSpeakerVectors = [(CSAsset *)v7->_asset maxAllowedEnrollmentUtterances];
  v108 = [MEMORY[0x263F08C38] UUID];
  uint64_t v109 = [v108 UUIDString];
  sessionId = v7->_sessionId;
  v7->_sessionId = (NSString *)v109;

  v111 = [SSRLoggingAggregator alloc];
  v112 = [(SSRVoiceProfile *)v7->_voiceProfile locale];
  v113 = [(CSAsset *)v7->_asset configVersion];
  uint64_t v114 = [(SSRLoggingAggregator *)v111 initWithEvent:@"retraining" locale:v112 configVersion:v113];
  logAggregator = v7->_logAggregator;
  v7->_logAggregator = (SSRLoggingAggregator *)v114;

LABEL_88:
  v21 = v7;
LABEL_89:

  return v21;
}

void __95__SSRVoiceProfileRetrainingContext_initWithVoiceRetrainingContext_skipClassTypeValidate_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  id v5 = a2;
  v6 = [v5 voiceProfileModelFilePathForRecognizerType:v3 spIdType:v4];
  v7 = [*(id *)(a1[4] + 80) hashFromResourcePath];
  id v10 = [v6 URLByAppendingPathComponent:v7];

  v8 = *(void **)(*(void *)(a1[5] + 8) + 40);
  v9 = [v5 profileID];

  [v8 setValue:v10 forKey:v9];
}

@end