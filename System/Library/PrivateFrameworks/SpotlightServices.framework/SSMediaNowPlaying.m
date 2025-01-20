@interface SSMediaNowPlaying
+ (id)sharedInstance;
- (BOOL)filterEvent:(id)a3;
- (SSMediaNowPlaying)init;
- (id)_attributesUpdatesForEvent:(id)a3;
- (id)_identifierForItemUpdate:(id)a3;
- (id)_itemUpdateForEvent:(id)a3 itemIdentifier:(id)a4 bundleToUpdate:(id)a5;
- (id)consumerLabel;
- (id)stream;
- (void)handleEvent:(id)a3;
@end

@implementation SSMediaNowPlaying

- (id)consumerLabel
{
  if (consumerLabel_onceToken_0 != -1) {
    dispatch_once(&consumerLabel_onceToken_0, &__block_literal_global_18);
  }
  v2 = (void *)consumerLabel_label_0;
  return v2;
}

void __34__SSMediaNowPlaying_consumerLabel__block_invoke()
{
  v0 = (void *)consumerLabel_label_0;
  consumerLabel_label_0 = @"SSMediaNowPlaying";
}

- (id)stream
{
  v2 = BiomeLibrary();
  v3 = [v2 Media];
  v4 = [v3 NowPlaying];

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_81_0);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __35__SSMediaNowPlaying_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (SSMediaNowPlaying)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSMediaNowPlaying;
  v2 = [(SSBaseConsumer *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (BOOL)filterEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bundleID];
  if (!v4) {
    goto LABEL_5;
  }
  v5 = (void *)v4;
  objc_super v6 = [v3 bundleID];
  int v7 = [v6 isEqualToString:@"com.apple.Music"];

  if (!v7) {
    goto LABEL_5;
  }
  v8 = [v3 iTunesStoreIdentifier];
  uint64_t v9 = [v8 length];

  if (v9) {
    BOOL v10 = [v3 playbackState] != 1;
  }
  else {
LABEL_5:
  }
    BOOL v10 = 1;

  return v10;
}

- (void)handleEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (![(SSMediaNowPlaying *)self filterEvent:v5])
    {
      objc_super v6 = [v5 iTunesStoreIdentifier];
      int v7 = SSRedactString(v6, 1);

      if (v7)
      {
        v8 = SSGeneralLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [(SSBaseConsumer *)self identifier];
          *(_DWORD *)buf = 138412546;
          v18 = v9;
          __int16 v19 = 2112;
          v20 = v7;
          _os_log_impl(&dword_1BDB2A000, v8, OS_LOG_TYPE_DEFAULT, "%@: processing event media nowplaying: %@", buf, 0x16u);
        }
      }
      BOOL v10 = @"com.apple.Music";
      id v11 = (id)*MEMORY[0x1E4F28358];
      v12 = [(SSMediaNowPlaying *)self _identifierForItemUpdate:v5];
      if (v12)
      {
        uint64_t v13 = [(SSMediaNowPlaying *)self _itemUpdateForEvent:v5 itemIdentifier:v12 bundleToUpdate:v10];
        v14 = (void *)v13;
        if (v13 && v11)
        {
          uint64_t v16 = v13;
          v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
          [(SSBaseConsumer *)self indexItems:v15 protectionClass:v11 bundleID:v10];
        }
      }
    }
  }
}

- (id)_identifierForItemUpdate:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 iTunesStoreIdentifier];

  if (v5)
  {
    objc_super v6 = NSString;
    uint64_t v7 = *MEMORY[0x1E4F22A30];
    v8 = [v4 iTunesStoreIdentifier];
    uint64_t v9 = [v6 stringWithFormat:@"%@=%@", v7, v8];
    v14[0] = @"com.apple.Music";
    BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v11 = [(SSBaseConsumer *)self queryWithString:v9 bundleIDs:v10 fetchAttributes:MEMORY[0x1E4F1CBF0]];

    if ([v11 count] == 1)
    {
      v12 = [v11 firstObject];
      id v5 = [v12 uniqueIdentifier];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
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
    objc_super v6 = [v3 absoluteTimestamp];
    v10[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

- (id)_itemUpdateForEvent:(id)a3 itemIdentifier:(id)a4 bundleToUpdate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(SSMediaNowPlaying *)self _attributesUpdatesForEvent:a3];
  id v11 = v10;
  if (v10 && [v10 count])
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F23840]);
    [v12 setUniqueIdentifier:v8];
    [v12 setBundleID:v9];
    [v12 setIsUpdate:1];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithAttributes:v11];
    [v12 setAttributeSet:v13];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

@end