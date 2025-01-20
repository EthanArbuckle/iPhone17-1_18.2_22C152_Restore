@interface SSAppInFocus
+ (id)sharedInstance;
- (BOOL)filterEvent:(id)a3;
- (SSAppInFocus)init;
- (id)_attributesUpdatesForEvent:(id)a3;
- (id)_itemUpdatesForEvent:(id)a3;
- (id)consumerLabel;
- (id)stream;
- (void)handleEvent:(id)a3;
@end

@implementation SSAppInFocus

- (id)_itemUpdatesForEvent:(id)a3
{
  id v4 = a3;
  v5 = [(SSAppInFocus *)self _attributesUpdatesForEvent:v4];
  v6 = v5;
  if (v5 && [v5 count])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithAttributes:v6];
    id v8 = objc_alloc(MEMORY[0x1E4F23840]);
    v9 = [v4 bundleID];
    v10 = (void *)[v8 initWithUniqueIdentifier:v9 domainIdentifier:0 attributeSet:v7];

    [v10 setIsUpdate:1];
    [v10 setBundleID:@"com.apple.application"];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)handleEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 bundleID];
    if (v6)
    {
      v7 = (void *)v6;
      id v8 = [v5 bundleID];
      uint64_t v9 = [v8 length];

      if (v9)
      {
        if (![(SSAppInFocus *)self filterEvent:v5])
        {
          v10 = [v5 bundleID];
          v11 = SSRedactString(v10, 1);

          if (v11)
          {
            v12 = SSGeneralLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v13 = [(SSBaseConsumer *)self identifier];
              *(_DWORD *)buf = 138412546;
              v21 = v13;
              __int16 v22 = 2112;
              v23 = v11;
              _os_log_impl(&dword_1BDB2A000, v12, OS_LOG_TYPE_DEFAULT, "%@: processing event for bundle %@.", buf, 0x16u);
            }
          }
          v14 = [(SSAppInFocus *)self _itemUpdatesForEvent:v5];
          v15 = v14;
          if (v14)
          {
            v16 = [v14 bundleID];

            if (v16)
            {
              v19 = v15;
              v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
              v18 = [v15 bundleID];
              [(SSBaseConsumer *)self indexItems:v17 protectionClass:@"Priority" bundleID:v18];
            }
          }
        }
      }
    }
  }
}

- (BOOL)filterEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 shortVersionString];
  if (v4)
  {
  }
  else
  {
    id v5 = [v3 exactVersionString];

    if (!v5)
    {
      LOBYTE(v6) = 1;
      goto LABEL_5;
    }
  }
  int v6 = [v3 starting] ^ 1;
LABEL_5:

  return v6;
}

- (id)_attributesUpdatesForEvent:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 absoluteTimestamp];

  if (v4)
  {
    v9[0] = @"_kMDItemLastOutOfSpotlightEngagementDate";
    id v5 = [v3 absoluteTimestamp];
    v10[0] = v5;
    v9[1] = *MEMORY[0x1E4F230F0];
    int v6 = [v3 absoluteTimestamp];
    v10[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

- (id)consumerLabel
{
  if (consumerLabel_onceToken != -1) {
    dispatch_once(&consumerLabel_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)consumerLabel_label;
  return v2;
}

void __29__SSAppInFocus_consumerLabel__block_invoke()
{
  v0 = (void *)consumerLabel_label;
  consumerLabel_label = @"SSAppInFocus";
}

- (id)stream
{
  v2 = BiomeLibrary();
  id v3 = [v2 App];
  id v4 = [v3 InFocus];

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_81);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __30__SSAppInFocus_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(SSAppInFocus);
  return MEMORY[0x1F41817F8]();
}

- (SSAppInFocus)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSAppInFocus;
  v2 = [(SSBaseConsumer *)&v6 init];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

@end