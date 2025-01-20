@interface CRLanguageResourcesManager
+ (id)lineWrappingManager;
+ (id)postProcessManager;
+ (id)sharedManager;
- (BOOL)lockResourcesForLocale:(id)a3 sender:(id)a4 block:(id)a5;
- (CRLanguageResourcesManager)initWithType:(int64_t)a3;
- (NSMutableDictionary)languageResourceStacks;
- (int64_t)resourceType;
- (void)addSubscriber:(id)a3 forLocale:(id)a4;
- (void)removeSubscriber:(id)a3 forLocale:(id)a4;
- (void)setLanguageResourceStacks:(id)a3;
- (void)setResourceType:(int64_t)a3;
- (void)subscriber:(id)a3 willDeactivateForLocale:(id)a4;
@end

@implementation CRLanguageResourcesManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CRLanguageResourcesManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB58CE18 != -1) {
    dispatch_once(&qword_1EB58CE18, block);
  }
  v2 = (void *)_MergedGlobals_35;
  return v2;
}

void __43__CRLanguageResourcesManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithType:0];
  v2 = (void *)_MergedGlobals_35;
  _MergedGlobals_35 = v1;
}

+ (id)postProcessManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CRLanguageResourcesManager_postProcessManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB58CE28 != -1) {
    dispatch_once(&qword_1EB58CE28, block);
  }
  v2 = (void *)qword_1EB58CE20;
  return v2;
}

void __48__CRLanguageResourcesManager_postProcessManager__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithType:1];
  v2 = (void *)qword_1EB58CE20;
  qword_1EB58CE20 = v1;
}

+ (id)lineWrappingManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CRLanguageResourcesManager_lineWrappingManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB58CE38 != -1) {
    dispatch_once(&qword_1EB58CE38, block);
  }
  v2 = (void *)qword_1EB58CE30;
  return v2;
}

void __49__CRLanguageResourcesManager_lineWrappingManager__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithType:2];
  v2 = (void *)qword_1EB58CE30;
  qword_1EB58CE30 = v1;
}

- (CRLanguageResourcesManager)initWithType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLanguageResourcesManager;
  v4 = [(CRLanguageResourcesManager *)&v7 init];
  if (v4)
  {
    v5 = objc_opt_new();
    [(CRLanguageResourcesManager *)v4 setLanguageResourceStacks:v5];

    [(CRLanguageResourcesManager *)v4 setResourceType:a3];
  }
  return v4;
}

- (void)addSubscriber:(id)a3 forLocale:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_super v7 = [(CRLanguageResourcesManager *)self languageResourceStacks];
  objc_sync_enter(v7);
  v8 = [(CRLanguageResourcesManager *)self languageResourceStacks];
  v9 = [v8 objectForKey:v6];

  if (!v9)
  {
    v10 = [[CRLanguageResourcesStack alloc] initWithLocaleIdentifier:v6 resourceType:[(CRLanguageResourcesManager *)self resourceType]];
    v11 = [(CRLanguageResourcesManager *)self languageResourceStacks];
    [v11 setObject:v10 forKeyedSubscript:v6];
  }
  v12 = [(CRLanguageResourcesManager *)self languageResourceStacks];
  v13 = [v12 objectForKeyedSubscript:v6];
  [v13 addSubscriber:v14];

  objc_sync_exit(v7);
}

- (void)removeSubscriber:(id)a3 forLocale:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  objc_super v7 = [(CRLanguageResourcesManager *)self languageResourceStacks];
  objc_sync_enter(v7);
  v8 = [(CRLanguageResourcesManager *)self languageResourceStacks];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    v10 = [(CRLanguageResourcesManager *)self languageResourceStacks];
    v11 = [v10 objectForKeyedSubscript:v6];
    [v11 removeSubscriber:v16];

    v12 = [(CRLanguageResourcesManager *)self languageResourceStacks];
    v13 = [v12 objectForKeyedSubscript:v6];
    uint64_t v14 = [v13 subscriberCount];

    if (!v14)
    {
      v15 = [(CRLanguageResourcesManager *)self languageResourceStacks];
      [v15 removeObjectForKey:v6];
    }
  }
  objc_sync_exit(v7);
}

- (void)subscriber:(id)a3 willDeactivateForLocale:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  objc_super v7 = [(CRLanguageResourcesManager *)self languageResourceStacks];
  objc_sync_enter(v7);
  v8 = [(CRLanguageResourcesManager *)self languageResourceStacks];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    v10 = [(CRLanguageResourcesManager *)self languageResourceStacks];
    v11 = [v10 objectForKeyedSubscript:v6];
    [v11 deactivateSubscriber:v12];
  }
  objc_sync_exit(v7);
}

- (BOOL)lockResourcesForLocale:(id)a3 sender:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = [(CRLanguageResourcesManager *)self languageResourceStacks];
  objc_sync_enter(v11);
  id v12 = [(CRLanguageResourcesManager *)self languageResourceStacks];
  v13 = [v12 objectForKeyedSubscript:v8];

  objc_sync_exit(v11);
  if (v13 && ([v13 hasSubscriber:v9] & 1) != 0)
  {
    uint64_t v14 = [v13 popResourceForSubscriber:v9];
    BOOL v15 = v14 != 0;
    if (v14)
    {
      v10[2](v10, v14);
      [v13 pushResource:v14];
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (NSMutableDictionary)languageResourceStacks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLanguageResourceStacks:(id)a3
{
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(int64_t)a3
{
  self->_resourceType = a3;
}

- (void).cxx_destruct
{
}

@end