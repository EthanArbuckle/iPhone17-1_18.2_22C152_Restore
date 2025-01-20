@interface SiriTTSService_TTSAXResourceManager
+ (SiriTTSService_TTSAXResourceManager)sharedInstance;
- (NSArray)allCompactResources;
- (SiriTTSService_TTSAXResourceManager)init;
- (TTSAXResourceManager)axManager;
- (void)setAllCompactResources:(id)a3;
- (void)setAxManager:(id)a3;
@end

@implementation SiriTTSService_TTSAXResourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axManager, 0);
  objc_storeStrong((id *)&self->_allCompactResources, 0);
}

- (void)setAxManager:(id)a3
{
}

- (TTSAXResourceManager)axManager
{
  return self->_axManager;
}

- (void)setAllCompactResources:(id)a3
{
}

- (NSArray)allCompactResources
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  allCompactResources = self->_allCompactResources;
  if (allCompactResources)
  {
    v3 = allCompactResources;
  }
  else
  {
    v5 = [(TTSAXResourceManager *)self->_axManager resourcesWithType:4 subType:2];
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v12, "isInstalled", (void)v20))
          {
            v13 = objc_alloc_init(SiriTTSService_TTSAXResource);
            v14 = [v12 primaryLanguage];
            [(SiriTTSService_TTSAXResource *)v13 setLanguage:v14];

            v15 = [v12 name];
            [(SiriTTSService_TTSAXResource *)v13 setName:v15];

            v16 = [v12 contentPath];
            [(SiriTTSService_TTSAXResource *)v13 setPath:v16];

            [(NSArray *)v6 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    v17 = self->_allCompactResources;
    self->_allCompactResources = v6;
    v18 = v6;

    v3 = self->_allCompactResources;
  }
  return v3;
}

- (SiriTTSService_TTSAXResourceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SiriTTSService_TTSAXResourceManager;
  v2 = [(SiriTTSService_TTSAXResourceManager *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getTTSAXResourceManagerClass_softClass;
    uint64_t v13 = getTTSAXResourceManagerClass_softClass;
    if (!getTTSAXResourceManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getTTSAXResourceManagerClass_block_invoke;
      v9[3] = &unk_1E5920390;
      v9[4] = &v10;
      __getTTSAXResourceManagerClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (TTSAXResourceManager *)objc_alloc_init(v4);
    axManager = v2->_axManager;
    v2->_axManager = v5;
  }
  return v2;
}

+ (SiriTTSService_TTSAXResourceManager)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_716);
  }
  v2 = (void *)sharedInstance_instance;
  return (SiriTTSService_TTSAXResourceManager *)v2;
}

@end