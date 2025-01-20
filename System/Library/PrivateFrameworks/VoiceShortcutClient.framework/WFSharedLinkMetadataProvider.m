@interface WFSharedLinkMetadataProvider
+ (id)sharedProvider;
- (LNMetadataProvider)metadataProvider;
- (NSMutableDictionary)lock_cachedExamplePhrases;
- (WFSharedLinkMetadataProvider)init;
- (id)examplePhrasesForBundleIdentifier:(id)a3 useCache:(BOOL)a4 error:(id *)a5;
- (os_unfair_lock_s)lock;
- (void)handleLinkMetadataDidChangeNotification:(id)a3;
@end

@implementation WFSharedLinkMetadataProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_cachedExamplePhrases, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
}

- (NSMutableDictionary)lock_cachedExamplePhrases
{
  return self->_lock_cachedExamplePhrases;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (LNMetadataProvider)metadataProvider
{
  return self->_metadataProvider;
}

- (void)handleLinkMetadataDidChangeNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    v8 = "-[WFSharedLinkMetadataProvider handleLinkMetadataDidChangeNotification:]";
    _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_INFO, "%s Received Link metadata did change notification, invalidating cached example phrases", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v5 = (NSMutableDictionary *)objc_opt_new();
  lock_cachedExamplePhrases = self->_lock_cachedExamplePhrases;
  self->_lock_cachedExamplePhrases = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 useCache:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4)
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v9 = [(WFSharedLinkMetadataProvider *)self lock_cachedExamplePhrases];
    v10 = [v9 objectForKey:v8];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__WFSharedLinkMetadataProvider_examplePhrasesForBundleIdentifier_useCache_error___block_invoke;
    aBlock[3] = &unk_1E6078C68;
    aBlock[4] = self;
    v11 = (void (**)(void))_Block_copy(aBlock);
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      v13 = [(WFSharedLinkMetadataProvider *)self metadataProvider];
      id v12 = [v13 examplePhrasesForBundleIdentifier:v8 error:a5];

      if (v12)
      {
        v14 = [(WFSharedLinkMetadataProvider *)self lock_cachedExamplePhrases];
        [v14 setObject:v12 forKey:v8];
      }
    }
    v11[2](v11);
  }
  else
  {
    v10 = [(WFSharedLinkMetadataProvider *)self metadataProvider];
    id v12 = [v10 examplePhrasesForBundleIdentifier:v8 error:a5];
  }

  return v12;
}

void __81__WFSharedLinkMetadataProvider_examplePhrasesForBundleIdentifier_useCache_error___block_invoke(uint64_t a1)
{
}

- (WFSharedLinkMetadataProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)WFSharedLinkMetadataProvider;
  v2 = [(WFSharedLinkMetadataProvider *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F72CE0]) initWithOptions:0];
    metadataProvider = v2->_metadataProvider;
    v2->_metadataProvider = (LNMetadataProvider *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = objc_opt_new();
    lock_cachedExamplePhrases = v2->_lock_cachedExamplePhrases;
    v2->_lock_cachedExamplePhrases = (NSMutableDictionary *)v5;

    int v7 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v7 addObserver:v2 selector:sel_handleLinkMetadataDidChangeNotification_ name:*MEMORY[0x1E4F728B8] object:0];
    id v8 = v2;
  }
  return v2;
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_9338);
  }
  v2 = (void *)sharedProvider_provider;
  return v2;
}

uint64_t __46__WFSharedLinkMetadataProvider_sharedProvider__block_invoke()
{
  v0 = objc_alloc_init(WFSharedLinkMetadataProvider);
  uint64_t v1 = sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end