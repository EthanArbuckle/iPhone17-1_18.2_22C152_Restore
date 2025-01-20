@interface SearchUIHomeScreenModel
+ (id)sharedInstance;
- (APSubjectMonitorSubscription)subscription;
- (OS_dispatch_queue)serialQueue;
- (SBHIconModel)iconModel;
- (SBHSelectedApplicationDataSource)dataSource;
- (SearchUIHomeScreenModel)init;
- (id)appIconForApplicationBundleIdentifier:(id)a3;
- (id)clipIconForIdentifier:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)resetIconModel;
- (void)setDataSource:(id)a3;
- (void)setIconModel:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSubscription:(id)a3;
@end

@implementation SearchUIHomeScreenModel

- (id)appIconForApplicationBundleIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    v5 = [(SearchUIHomeScreenModel *)self dataSource];
    v10[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v5 beginTrackingApplicationsWithBundleIdentifiers:v6];

    v7 = [(SearchUIHomeScreenModel *)self iconModel];
    v8 = [v7 applicationIconForBundleIdentifier:v4];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (SBHSelectedApplicationDataSource)dataSource
{
  return self->_dataSource;
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_iconModel;
  return v2;
}

uint64_t __41__SearchUIHomeScreenModel_sharedInstance__block_invoke()
{
  sharedInstance_iconModel = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (SearchUIHomeScreenModel)init
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUIHomeScreenModel;
  v2 = [(SearchUIHomeScreenModel *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(SearchUIHomeScreenModel *)v2 resetIconModel];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_resetIconModel name:*MEMORY[0x1E4FB2650] object:0];

    v5 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    uint64_t v6 = [v5 addMonitor:v3 subjectMask:1];
    subscription = v3->_subscription;
    v3->_subscription = (APSubjectMonitorSubscription *)v6;
  }
  return v3;
}

- (void)resetIconModel
{
  v3 = objc_opt_new();
  [(SearchUIHomeScreenModel *)self setDataSource:v3];

  id v4 = objc_alloc(MEMORY[0x1E4FA62B8]);
  id v6 = [(SearchUIHomeScreenModel *)self dataSource];
  v5 = (void *)[v4 initWithStore:0 applicationDataSource:v6];
  [(SearchUIHomeScreenModel *)self setIconModel:v5];
}

- (void)setIconModel:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (id)clipIconForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    id v6 = (void *)*MEMORY[0x1E4FB30E0];
    if ([v4 hasPrefix:*MEMORY[0x1E4FB30E0]])
    {
      uint64_t v7 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));

      v5 = (void *)v7;
    }
    v8 = [(SearchUIHomeScreenModel *)self iconModel];
    objc_super v9 = [MEMORY[0x1E4FB1F10] webClipWithIdentifier:v5];
    id v10 = (id)[v8 addBookmarkIconForWebClip:v9];

    v11 = [(SearchUIHomeScreenModel *)self iconModel];
    v12 = [v11 bookmarkIconForWebClipIdentifier:v5];
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 isHidden])
        {
          id v11 = v10;
          v12 = [v11 bundleIdentifier];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __72__SearchUIHomeScreenModel_appProtectionSubjectsChanged_forSubscription___block_invoke;
          v14[3] = &unk_1E6E72620;
          v14[4] = self;
          id v15 = v12;
          id v13 = v12;
          +[SearchUIUtilities dispatchMainIfNecessary:v14];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

void __72__SearchUIHomeScreenModel_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) appIconForApplicationBundleIdentifier:*(void *)(a1 + 40)];
  if (v1)
  {
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v3 = *MEMORY[0x1E4FA6708];
    uint64_t v5 = *MEMORY[0x1E4FA6860];
    v6[0] = v1;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    [v2 postNotificationName:v3 object:0 userInfo:v4];
  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (APSubjectMonitorSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
}

@end