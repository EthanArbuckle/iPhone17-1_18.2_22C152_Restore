@interface VoiceTriggerRePromptUtil
+ (id)sharedInstance;
- (BOOL)isRePromptableWithAssistantId:(id)a3;
- (BloomFilter)bloomFilter;
- (id)initAndLoadImpactedAssistantIdsForRePrompt;
- (id)initAndLoadImpactedAssistantIdsForRePromptWithAsset:(id)a3;
- (void)setBloomFilter:(id)a3;
@end

@implementation VoiceTriggerRePromptUtil

- (void).cxx_destruct
{
}

- (void)setBloomFilter:(id)a3
{
}

- (BloomFilter)bloomFilter
{
  return (BloomFilter *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isRePromptableWithAssistantId:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F08AB0];
  id v5 = a3;
  v6 = [v4 processInfo];
  [v6 systemUptime];
  double v8 = v7;

  bloomFilter = self->_bloomFilter;
  v10 = [v5 dataUsingEncoding:4];

  BOOL v11 = [(BloomFilter *)bloomFilter contains:v10];
  v12 = [MEMORY[0x263F08AB0] processInfo];
  [v12 systemUptime];
  double v14 = v13;

  v15 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    v18 = "-[VoiceTriggerRePromptUtil isRePromptableWithAssistantId:]";
    __int16 v19 = 2050;
    double v20 = (v14 - v8) * 1000.0;
    _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Bloom filter inference to check if ID exists took %{public}.3fms", (uint8_t *)&v17, 0x16u);
  }
  return v11;
}

- (id)initAndLoadImpactedAssistantIdsForRePromptWithAsset:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VoiceTriggerRePromptUtil;
  id v5 = [(VoiceTriggerRePromptUtil *)&v25 init];
  if (!v5) {
    goto LABEL_18;
  }
  SSRLogInitIfNeeded();
  v6 = [v4 blobVersion];
  if (([v6 isEqualToString:@"1"] & 1) == 0)
  {
    double v20 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[VoiceTriggerRePromptUtil initAndLoadImpactedAssistantIdsForRePromptWithAsset:]";
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, "%s Unsupported blob version %@", buf, 0x16u);
    }

    goto LABEL_17;
  }
  double v7 = [v4 blobName];
  double v8 = [v4 resourcePath];
  v9 = [v8 stringByAppendingPathComponent:v7];

  v10 = [MEMORY[0x263F08850] defaultManager];
  char v11 = [v10 fileExistsAtPath:v9];

  if (v11)
  {
    v12 = (void *)MEMORY[0x263F08928];
    uint64_t v13 = objc_opt_class();
    double v14 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v9];
    id v24 = 0;
    uint64_t v15 = [v12 unarchivedObjectOfClass:v13 fromData:v14 error:&v24];
    id v16 = v24;
    bloomFilter = v5->_bloomFilter;
    v5->_bloomFilter = (BloomFilter *)v15;

    if (v16)
    {
      v18 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[VoiceTriggerRePromptUtil initAndLoadImpactedAssistantIdsForRePromptWithAsset:]";
        __int16 v28 = 2114;
        id v29 = v16;
        _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, "%s Failed to unarchive blob with err: %{public}@", buf, 0x16u);
      }
      int v19 = 1;
    }
    else
    {
      int v19 = 0;
    }
  }
  else
  {
    uint64_t v21 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[VoiceTriggerRePromptUtil initAndLoadImpactedAssistantIdsForRePromptWithAsset:]";
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_error_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_ERROR, "%s Blob file not found at path : %{public}@", buf, 0x16u);
    }
    int v19 = 1;
  }

  if (!v19)
  {
LABEL_18:
    v22 = v5;
    goto LABEL_19;
  }
LABEL_17:
  v22 = 0;
LABEL_19:

  return v22;
}

- (id)initAndLoadImpactedAssistantIdsForRePrompt
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(SSRMobileAssetProvider);
  id v4 = [(SSRMobileAssetProvider *)v3 installedAssetOfType:8 forLanguageCode:0];
  if (v4)
  {
    self = (VoiceTriggerRePromptUtil *)[(VoiceTriggerRePromptUtil *)self initAndLoadImpactedAssistantIdsForRePromptWithAsset:v4];
    id v5 = self;
  }
  else
  {
    v6 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      v9 = "-[VoiceTriggerRePromptUtil initAndLoadImpactedAssistantIdsForRePrompt]";
      _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, "%s No asset found, nothing to do", (uint8_t *)&v8, 0xCu);
    }
    id v5 = 0;
  }

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4031 != -1) {
    dispatch_once(&sharedInstance_onceToken_4031, &__block_literal_global_4032);
  }
  v2 = (void *)sharedInstance_vtRepromptUtil;

  return v2;
}

uint64_t __42__VoiceTriggerRePromptUtil_sharedInstance__block_invoke()
{
  sharedInstance_vtRepromptUtil = [[VoiceTriggerRePromptUtil alloc] initAndLoadImpactedAssistantIdsForRePrompt];

  return MEMORY[0x270F9A758]();
}

@end