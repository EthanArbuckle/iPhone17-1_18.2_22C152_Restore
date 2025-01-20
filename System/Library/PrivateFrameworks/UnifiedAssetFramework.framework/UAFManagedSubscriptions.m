@interface UAFManagedSubscriptions
+ (BOOL)_deviceSupportsGenerativeModelSystems;
+ (id)createHoldSubscription:(id)a3;
+ (id)getConcurrentQueue;
+ (id)getExistingSubscription:(id)a3 subscriber:(id)a4;
+ (id)managePlatformSubscription;
+ (id)morphunUsagesForLocale:(id)a3;
+ (id)validateUsageAlias:(id)a3 usageAliasValue:(id)a4;
+ (void)_stageAssetsUponPlatformAssetSetUpdate;
+ (void)manageAssistantSubscription:(id)a3 withMode:(int64_t)a4;
+ (void)manageGMSSiriLanguageSubscription:(BOOL)a3 language:(id)a4;
+ (void)manageMorphunSystemLocaleSubscription:(id)a3;
+ (void)manageNLSystemLanguageSubscription:(id)a3;
+ (void)manageSubscription:(id)a3 subscriber:(id)a4 assetSets:(id)a5 usageAliases:(id)a6 useHold:(BOOL)a7 userInitiated:(BOOL)a8;
+ (void)manageSummarizationKitSubscription;
+ (void)manageXRSubscription:(id)a3 subscribe:(BOOL)a4;
@end

@implementation UAFManagedSubscriptions

+ (id)getConcurrentQueue
{
  if (qword_26AF0BAE8 != -1) {
    dispatch_once(&qword_26AF0BAE8, &__block_literal_global_15);
  }
  v2 = (void *)qword_26AF0BAF0;

  return v2;
}

void __45__UAFManagedSubscriptions_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFManagedSubscriptions.Concurrent", MEMORY[0x263EF83A8]);
  v1 = (void *)qword_26AF0BAF0;
  qword_26AF0BAF0 = (uint64_t)v0;
}

+ (id)getExistingSubscription:(id)a3 subscriber:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = +[UAFSubscriptionStoreManager defaultManager];
  v8 = [v7 getSubscriptions:v6 error:0];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "name", (void)v17);
        char v15 = [v14 isEqualToString:v5];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

+ (id)validateUsageAlias:(id)a3 usageAliasValue:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = +[UAFConfigurationManager defaultManager];
    v8 = [v7 getUsageAlias:v5];

    if (v8
      && ([v8 values],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [v9 objectForKeyedSubscript:v6],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      id v14 = v5;
      id v15 = v6;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    }
    else
    {
      v12 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        long long v17 = "+[UAFManagedSubscriptions validateUsageAlias:usageAliasValue:]";
        __int16 v18 = 2114;
        id v19 = v6;
        __int16 v20 = 2114;
        id v21 = v5;
        _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s Usage Alias Value %{public}@ for Usage Alias %{public}@ does not exist, treating value as nil", buf, 0x20u);
      }

      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)createHoldSubscription:(id)a3
{
  id v3 = a3;
  v4 = [v3 name];
  id v5 = [v4 stringByAppendingString:@".hold"];

  id v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:172800.0];
  v7 = [UAFAssetSetSubscription alloc];
  v8 = [v3 assetSets];
  id v9 = [v3 usageAliases];

  id v10 = [(UAFAssetSetSubscription *)v7 initWithName:v5 assetSets:v8 usageAliases:v9 expires:v6];

  return v10;
}

+ (void)manageSubscription:(id)a3 subscriber:(id)a4 assetSets:(id)a5 usageAliases:(id)a6 useHold:(BOOL)a7 userInitiated:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  v51[1] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  unint64_t v15 = (unint64_t)a5;
  unint64_t v16 = (unint64_t)a6;
  uint64_t v17 = +[UAFManagedSubscriptions getExistingSubscription:v13 subscriber:v14];
  __int16 v18 = (void *)v17;
  if (v15 | v16)
  {
    v25 = [[UAFAssetSetSubscription alloc] initWithName:v13 assetSets:v15 usageAliases:v16];
    BOOL v26 = [(UAFAssetSetSubscription *)v25 isEqual:v18];
    v27 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        v29 = [(UAFAssetSetSubscription *)v25 name];
        *(_DWORD *)buf = 136315650;
        v41 = "+[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:userInitiated:]";
        __int16 v42 = 2114;
        v43 = v29;
        __int16 v44 = 2114;
        id v45 = v14;
        _os_log_impl(&dword_23797A000, v27, OS_LOG_TYPE_DEFAULT, "%s Not updating subscription %{public}@ for subscriber %{public}@ as it is up to date", buf, 0x20u);
      }
    }
    else
    {
      if (v28)
      {
        v30 = [(UAFAssetSetSubscription *)v25 name];
        *(_DWORD *)buf = 136316162;
        v41 = "+[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:userInitiated:]";
        __int16 v42 = 2114;
        v43 = v30;
        __int16 v44 = 2114;
        id v45 = v14;
        __int16 v46 = 2114;
        v47 = v25;
        __int16 v48 = 2114;
        v49 = v18;
        _os_log_impl(&dword_23797A000, v27, OS_LOG_TYPE_DEFAULT, "%s Updating subscription %{public}@ for subscriber %{public}@ as it is not up to date: %{public}@ != %{public}@", buf, 0x34u);
      }
      v27 = +[UAFManagedSubscriptions createHoldSubscription:v18];
      v39 = v25;
      v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
      unint64_t v37 = v15;
      BOOL v36 = v8;
      if (v18 && v27)
      {
        v38[0] = v25;
        v38[1] = v27;
        uint64_t v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];

        v31 = (void *)v32;
      }
      v33 = +[UAFSubscriptionStoreManager writeManager];
      v34 = +[UAFConfigurationManager defaultManager];
      +[UAFAssetSetManager subscribe:v14 subscriptions:v31 storeManager:v33 configurationManager:v34 userInitiated:v36];

      unint64_t v15 = v37;
    }
    goto LABEL_19;
  }
  if (v17)
  {
    if (v9)
    {
      uint64_t v19 = +[UAFManagedSubscriptions createHoldSubscription:v17];
      __int16 v20 = (void *)v19;
      if (v19)
      {
        v51[0] = v19;
        id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];
        uint64_t v22 = +[UAFSubscriptionStoreManager writeManager];
        +[UAFConfigurationManager defaultManager];
        v24 = unint64_t v23 = v15;
        +[UAFAssetSetManager subscribe:v14 subscriptions:v21 storeManager:v22 configurationManager:v24 userInitiated:0];

        unint64_t v15 = v23;
      }
      else
      {
        id v21 = UAFGetLogCategory((void **)&UAFLogContextSubscription);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v41 = "+[UAFManagedSubscriptions manageSubscription:subscriber:assetSets:usageAliases:useHold:userInitiated:]";
          _os_log_impl(&dword_23797A000, v21, OS_LOG_TYPE_DEFAULT, "%s Not creating hold subscription, as hold sub unexpectedly nil", buf, 0xCu);
        }
      }
    }
    id v50 = v13;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
    v27 = +[UAFSubscriptionStoreManager writeManager];
    v35 = +[UAFConfigurationManager defaultManager];
    +[UAFAssetSetManager unsubscribe:v14 subscriptions:v25 storeManager:v27 configurationManager:v35 userInitiated:0];

LABEL_19:
  }
}

+ (id)morphunUsagesForLocale:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3
    && ([getMorphunAssetsClass() isLocaleEmbedded:v3] & 1) == 0
    && [getMorphunAssetsClass() isLocaleDownloadSupported:v3])
  {
    v4 = [getMorphunAssetsClass() getFactorNameForLocale:v3];
    if ([v4 hasPrefix:@"com.apple.siri.nl.morphun."])
    {
      id v5 = [v4 substringFromIndex:objc_msgSend(@"com.apple.siri.nl.morphun.", "length")];
      id v10 = v5;
      uint64_t v11 = @"com.apple.siri.understanding";
      BOOL v9 = @"morphun.language";
      id v6 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      v12[0] = v6;
      v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)manageAssistantSubscription:(id)a3 withMode:(int64_t)a4
{
  if ((unint64_t)a4 > 3) {
    v4 = @"com.apple.siri.assistant.language";
  }
  else {
    v4 = off_264CEC0A0[a4];
  }
  id v5 = (void *)MEMORY[0x263EFF960];
  id v6 = a3;
  id v9 = [v5 localeWithLocaleIdentifier:v6];
  v7 = +[UAFManagedSubscriptions morphunUsagesForLocale:v9];
  BOOL v8 = +[UAFManagedSubscriptions validateUsageAlias:v4 usageAliasValue:v6];

  +[UAFManagedSubscriptions manageSubscription:@"language" subscriber:@"com.apple.siri.assistant" assetSets:v7 usageAliases:v8 useHold:1 userInitiated:1];
}

+ (void)manageNLSystemLanguageSubscription:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF960];
  id v4 = a3;
  id v7 = [v3 localeWithLocaleIdentifier:v4];
  id v5 = +[UAFManagedSubscriptions morphunUsagesForLocale:](UAFManagedSubscriptions, "morphunUsagesForLocale:");
  id v6 = +[UAFManagedSubscriptions validateUsageAlias:@"com.apple.siri.nl.system.language" usageAliasValue:v4];

  if (!v6)
  {

    id v5 = 0;
  }
  +[UAFManagedSubscriptions manageSubscription:@"system.language" subscriber:@"com.apple.siri.nl" assetSets:v5 usageAliases:v6 useHold:1 userInitiated:1];
}

+ (void)manageMorphunSystemLocaleSubscription:(id)a3
{
  id v3 = +[UAFManagedSubscriptions morphunUsagesForLocale:a3];
  +[UAFManagedSubscriptions manageSubscription:@"system.locale" subscriber:@"com.apple.siri.morphun" assetSets:v3 usageAliases:0 useHold:1 userInitiated:1];
}

+ (void)_stageAssetsUponPlatformAssetSetUpdate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "+[UAFManagedSubscriptions _stageAssetsUponPlatformAssetSetUpdate]";
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s Staging assets due to receiving MA notification for platform assets", buf, 0xCu);
  }

  id v3 = +[UAFSubscriptionStoreManager defaultManager];
  id v7 = 0;
  id v4 = [v3 getSubscriptions:0 error:&v7];
  id v5 = v7;

  if (v5)
  {
    id v6 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v9 = "+[UAFManagedSubscriptions _stageAssetsUponPlatformAssetSetUpdate]";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl(&dword_23797A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to get all subscriptions due to error: %@. Stopping staging", buf, 0x16u);
    }
  }
  else
  {
    +[UAFAutoAssetManager stageAssetsWithSubscriptions:v4 knownAutoAssetSets:0 usedAutoAssetSets:0 autoAssetSets:0];
  }
}

+ (id)managePlatformSubscription
{
  v8[1] = *MEMORY[0x263EF8340];
  id v7 = @"com.apple.siri.uaf.platform";
  v8[0] = MEMORY[0x263EFFA78];
  v2 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  +[UAFManagedSubscriptions manageSubscription:@"platform" subscriber:@"com.apple.siri.uaf" assetSets:v2 usageAliases:0 useHold:1 userInitiated:0];
  id v3 = +[UAFAssetSetManager sharedManager];
  id v4 = +[UAFAutoAssetManager getSerialQueue];
  id v5 = [v3 observeAssetSet:@"com.apple.siri.uaf.platform" queue:v4 handler:&__block_literal_global_343];

  return v5;
}

uint64_t __53__UAFManagedSubscriptions_managePlatformSubscription__block_invoke()
{
  return +[UAFManagedSubscriptions _stageAssetsUponPlatformAssetSetUpdate];
}

+ (BOOL)_deviceSupportsGenerativeModelSystems
{
  if (qword_26AF0BAF8 != -1) {
    dispatch_once(&qword_26AF0BAF8, &__block_literal_global_345);
  }
  return _MergedGlobals_14;
}

uint64_t __64__UAFManagedSubscriptions__deviceSupportsGenerativeModelSystems__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _MergedGlobals_14 = result;
  return result;
}

+ (void)manageSummarizationKitSubscription
{
  v4[1] = *MEMORY[0x263EF8340];
  if (+[UAFManagedSubscriptions _deviceSupportsGenerativeModelSystems])
  {
    id v3 = @"com.apple.summarizationkit";
    v4[0] = MEMORY[0x263EFFA78];
    v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
    +[UAFManagedSubscriptions manageSubscription:@"configuration" subscriber:@"com.apple.summarizationkit" assetSets:v2 usageAliases:0 useHold:1 userInitiated:1];
  }
}

+ (void)manageGMSSiriLanguageSubscription:(BOOL)a3 language:(id)a4
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x263EFF960];
    id v5 = a4;
    id v6 = [v4 localeWithLocaleIdentifier:v5];
    id v8 = +[UAFManagedSubscriptions morphunUsagesForLocale:v6];
    id v7 = +[UAFManagedSubscriptions validateUsageAlias:@"com.apple.siri.assistant.assistantengine.language" usageAliasValue:v5];
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }
  +[UAFManagedSubscriptions manageSubscription:@"language" subscriber:@"com.apple.siri.intelligenceengine" assetSets:v8 usageAliases:v7 useHold:1 userInitiated:1];
}

+ (void)manageXRSubscription:(id)a3 subscribe:(BOOL)a4
{
  if (a4)
  {
    id v4 = (void *)MEMORY[0x263EFF960];
    id v5 = a3;
    id v6 = [v4 localeWithLocaleIdentifier:v5];
    id v8 = +[UAFManagedSubscriptions morphunUsagesForLocale:v6];
    id v7 = +[UAFManagedSubscriptions validateUsageAlias:@"com.apple.siri.assistant.language" usageAliasValue:v5];
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }
  +[UAFManagedSubscriptions manageSubscription:@"language" subscriber:@"com.apple.siri.assistant.xr" assetSets:v8 usageAliases:v7 useHold:1 userInitiated:0];
}

@end