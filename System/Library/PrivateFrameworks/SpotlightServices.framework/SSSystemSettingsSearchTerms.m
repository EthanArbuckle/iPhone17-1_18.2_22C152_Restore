@interface SSSystemSettingsSearchTerms
+ (id)sharedInstance;
- (BOOL)filterEvent:(id)a3;
- (SSSystemSettingsSearchTerms)init;
- (id)_itemUpdatesForEvent:(id)a3 bundleToUpdate:(id)a4 timestamp:(id)a5;
- (id)consumerLabel;
- (id)stream;
- (void)handleEvent:(id)a3;
@end

@implementation SSSystemSettingsSearchTerms

- (id)consumerLabel
{
  if (consumerLabel_onceToken_1 != -1) {
    dispatch_once(&consumerLabel_onceToken_1, &__block_literal_global_26);
  }
  v2 = (void *)consumerLabel_label_1;
  return v2;
}

void __44__SSSystemSettingsSearchTerms_consumerLabel__block_invoke()
{
  v0 = (void *)consumerLabel_label_1;
  consumerLabel_label_1 = @"SSSystemSettingsSearchTerms";
}

- (id)stream
{
  v2 = BiomeLibrary();
  v3 = [v2 SystemSettings];
  v4 = [v3 SearchTerms];

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_81_1);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

uint64_t __45__SSSystemSettingsSearchTerms_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (SSSystemSettingsSearchTerms)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSSystemSettingsSearchTerms;
  v2 = [(SSBaseConsumer *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (BOOL)filterEvent:(id)a3
{
  v3 = [a3 searchResultsClickedOn];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)handleEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (![(SSSystemSettingsSearchTerms *)self filterEvent:v5])
    {
      objc_super v6 = [v5 searchTerm];
      v7 = SSRedactString(v6, 1);

      if (v7)
      {
        v8 = SSGeneralLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = [(SSBaseConsumer *)self identifier];
          int v12 = 138412546;
          v13 = v9;
          __int16 v14 = 2112;
          v15 = v7;
          _os_log_impl(&dword_1BDB2A000, v8, OS_LOG_TYPE_DEFAULT, "%@: processing event system settings search: %@", (uint8_t *)&v12, 0x16u);
        }
      }
      v10 = objc_opt_new();
      v11 = [(SSSystemSettingsSearchTerms *)self _itemUpdatesForEvent:v5 bundleToUpdate:@"com.apple.Preferences" timestamp:v10];
      if ([v11 count]) {
        [(SSBaseConsumer *)self indexItems:v11 protectionClass:@"Priority" bundleID:@"com.apple.Preferences"];
      }
    }
  }
}

- (id)_itemUpdatesForEvent:(id)a3 bundleToUpdate:(id)a4 timestamp:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a4;
  id v8 = a5;
  [MEMORY[0x1E4F1CA48] array];
  v22 = v7;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [v7 searchResultsClickedOn];
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    uint64_t v12 = *MEMORY[0x1E4F230F0];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        __int16 v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v15 = objc_alloc_init(MEMORY[0x1E4F23840]);
        uint64_t v16 = [v14 bundleIDwithAnchor];
        v17 = [v16 stringByRemovingPercentEncoding];

        if (v8 && v17)
        {
          [v15 setUniqueIdentifier:v17];
          [v15 setBundleID:v24];
          [v15 setIsUpdate:1];
          id v18 = objc_alloc(MEMORY[0x1E4F23850]);
          v30[0] = @"_kMDItemLastOutOfSpotlightEngagementDate";
          v30[1] = v12;
          v31[0] = v8;
          v31[1] = v8;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
          v20 = (void *)[v18 initWithAttributes:v19];
          [v15 setAttributeSet:v20];

          [v23 addObject:v15];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v10);
  }

  return v23;
}

@end