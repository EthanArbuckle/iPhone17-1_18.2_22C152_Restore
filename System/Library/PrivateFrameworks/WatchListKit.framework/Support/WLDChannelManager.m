@interface WLDChannelManager
+ (id)defaultChannelManager;
- (void)vppaConsentedBundleIDsWithCompletion:(id)a3;
@end

@implementation WLDChannelManager

+ (id)defaultChannelManager
{
  if (defaultChannelManager_token != -1) {
    dispatch_once(&defaultChannelManager_token, &__block_literal_global_7);
  }
  v2 = (void *)defaultChannelManager_defaultChannelManager;

  return v2;
}

void __42__WLDChannelManager_defaultChannelManager__block_invoke(id a1)
{
  defaultChannelManager_defaultChannelManager = objc_alloc_init(WLDChannelManager);

  _objc_release_x1();
}

- (void)vppaConsentedBundleIDsWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = +[WLKSettingsStore sharedSettings];
  v5 = [v4 consentedBrands];

  if (![v5 count])
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    v7 = +[WLKSettingsStore sharedSettings];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __58__WLDChannelManager_vppaConsentedBundleIDsWithCompletion___block_invoke;
    v19[3] = &unk_100045508;
    dispatch_semaphore_t v20 = v6;
    v8 = v6;
    [v7 refreshWithCompletion:v19];

    dispatch_time_t v9 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v8, v9);
    v10 = +[WLKSettingsStore sharedSettings];
    uint64_t v11 = [v10 consentedBrands];

    v5 = (void *)v11;
  }
  if (v5)
  {
    v12 = +[NSSet setWithArray:v5];
    NSLog(@"Consented Channel IDs: %@", v12);
    v13 = +[WLKChannelUtilities sharedInstance];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __58__WLDChannelManager_vppaConsentedBundleIDsWithCompletion___block_invoke_2;
    v16[3] = &unk_100044EA0;
    v17 = v12;
    id v18 = v3;
    id v14 = v12;
    [v13 loadIfNeededWithCompletion:v16];

    v15 = v17;
  }
  else
  {
    id v14 = objc_alloc_init((Class)NSSet);
    v15 = WLKError();
    (*((void (**)(id, id, void *))v3 + 2))(v3, v14, v15);
  }
}

intptr_t __58__WLDChannelManager_vppaConsentedBundleIDsWithCompletion___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__WLDChannelManager_vppaConsentedBundleIDsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = a3;
  id v4 = objc_alloc_init((Class)NSSet);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = *(id *)(a1 + 32);
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      dispatch_time_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v9);
        uint64_t v11 = +[WLKChannelUtilities sharedInstance];
        v12 = [v11 channelForID:v10];

        v13 = [v12 appBundleIDs];
        if (v13)
        {
          uint64_t v14 = [v4 setByAddingObjectsFromArray:v13];

          id v4 = (id)v14;
        }

        dispatch_time_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  NSLog(@"Consented Bundle IDs: %@", v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end