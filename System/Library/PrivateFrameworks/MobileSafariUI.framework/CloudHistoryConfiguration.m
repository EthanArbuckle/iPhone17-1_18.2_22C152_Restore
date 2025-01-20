@interface CloudHistoryConfiguration
+ (id)sharedConfiguration;
- (BOOL)shouldUseLongLivedOperationsToSaveRecords;
- (CloudHistoryConfiguration)init;
- (id)_cloudConfigurationAssetsSortedByVersionNumber;
- (id)platformBuiltInConfiguration;
- (id)remoteConfiguration;
- (void)_reloadConfigurationDataIfNecessary;
@end

@implementation CloudHistoryConfiguration

+ (id)sharedConfiguration
{
  if (+[CloudHistoryConfiguration sharedConfiguration]::onceToken != -1) {
    dispatch_once(&+[CloudHistoryConfiguration sharedConfiguration]::onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedCloudHistoryConfiguration;
  return v2;
}

void __48__CloudHistoryConfiguration_sharedConfiguration__block_invoke()
{
  v0 = objc_alloc_init(CloudHistoryConfiguration);
  v1 = (void *)sharedCloudHistoryConfiguration;
  sharedCloudHistoryConfiguration = (uint64_t)v0;
}

- (CloudHistoryConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)CloudHistoryConfiguration;
  v2 = [(WBSCloudHistoryConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(CloudHistoryConfiguration *)v2 _reloadConfigurationDataIfNecessary];
    v4 = v3;
  }

  return v3;
}

- (id)platformBuiltInConfiguration
{
  v7[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F99080];
  v6[0] = *MEMORY[0x1E4F99090];
  v6[1] = v2;
  v7[0] = @"1:1440";
  v7[1] = @"15:1 | 1:1425";
  uint64_t v3 = *MEMORY[0x1E4F99078];
  v6[2] = *MEMORY[0x1E4F99088];
  v6[3] = v3;
  v7[2] = @"1:1440";
  v7[3] = @"31:5 | 1:1285";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  return v4;
}

- (id)remoteConfiguration
{
  remoteConfigurationDictionary = self->_remoteConfigurationDictionary;
  if (remoteConfigurationDictionary)
  {
    uint64_t v3 = remoteConfigurationDictionary;
  }
  else if (!self->_fetchedAssetData)
  {
    self->_fetchedAssetData = 1;
    v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__CloudHistoryConfiguration_remoteConfiguration__block_invoke;
    block[3] = &unk_1E6D79060;
    block[4] = self;
    dispatch_async(v5, block);
  }
  return remoteConfigurationDictionary;
}

void __48__CloudHistoryConfiguration_remoteConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v1 = [*(id *)(a1 + 32) _cloudConfigurationAssetsSortedByVersionNumber];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v16 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v5 state] == 1)
        {
          objc_super v6 = (void *)MEMORY[0x1E4F1C9B8];
          v7 = [v5 localURL];
          v8 = [v7 URLByAppendingPathComponent:@"data.plist"];
          v9 = [v6 dataWithContentsOfURL:v8];

          if (v9)
          {
            v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:0 error:0];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __48__CloudHistoryConfiguration_remoteConfiguration__block_invoke_2;
              block[3] = &unk_1E6D791E8;
              block[4] = *(void *)(a1 + 32);
              id v14 = v10;
              id v11 = v10;
              dispatch_async(MEMORY[0x1E4F14428], block);

              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

uint64_t __48__CloudHistoryConfiguration_remoteConfiguration__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[10];
  return [v2 applyRemoteConfiguration:v3];
}

- (id)_cloudConfigurationAssetsSortedByVersionNumber
{
  assetsSortedByVersionNumber = self->_assetsSortedByVersionNumber;
  if (assetsSortedByVersionNumber)
  {
    uint64_t v3 = assetsSortedByVersionNumber;
  }
  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F77FA0]) initWithAssetType:@"com.apple.MobileAsset.SafariCloudHistoryConfiguration"];
    id v11 = 0;
    objc_super v6 = [v5 runQueryAndReturnError:&v11];
    id v7 = v11;
    if ([v6 count])
    {
      v8 = [v6 sortedArrayUsingComparator:&__block_literal_global_290];
      v9 = self->_assetsSortedByVersionNumber;
      self->_assetsSortedByVersionNumber = v8;

      uint64_t v3 = self->_assetsSortedByVersionNumber;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

uint64_t __75__CloudHistoryConfiguration__cloudConfigurationAssetsSortedByVersionNumber__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 attributes];
  uint64_t v6 = *MEMORY[0x1E4F77F20];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F77F20]];
  v8 = [v4 attributes];
  v9 = [v8 objectForKey:v6];
  uint64_t v10 = [v7 compare:v9];

  return v10;
}

- (void)_reloadConfigurationDataIfNecessary
{
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 doubleForKey:@"LastCloudHistoryConfigurationUpdateTime"];
  double v5 = v4;

  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - v5 >= 604800.0)
  {
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v7 setDouble:@"LastCloudHistoryConfigurationUpdateTime" forKey:Current];

    v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__CloudHistoryConfiguration__reloadConfigurationDataIfNecessary__block_invoke;
    block[3] = &unk_1E6D79060;
    block[4] = self;
    dispatch_async(v8, block);
  }
}

void __64__CloudHistoryConfiguration__reloadConfigurationDataIfNecessary__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) _cloudConfigurationAssetsSortedByVersionNumber];
  uint64_t v2 = [v1 firstObject];

  uint64_t v3 = [v2 state];
  if (v3)
  {
    if (v3 == 3) {
      [v2 resumeDownloadAndReturnError:0];
    }
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F77F68];
    v6[0] = MEMORY[0x1E4F1CC38];
    double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    [v2 beginDownloadWithOptions:v4];
  }
}

- (BOOL)shouldUseLongLivedOperationsToSaveRecords
{
  return [MEMORY[0x1E4FB6EE0] accessLevel] == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteConfigurationDictionary, 0);
  objc_storeStrong((id *)&self->_assetsSortedByVersionNumber, 0);
}

@end