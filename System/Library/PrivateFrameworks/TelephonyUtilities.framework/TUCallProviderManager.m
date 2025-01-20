@interface TUCallProviderManager
+ (NSArray)defaultProviders;
+ (NSSet)invitationPreferencesForRecentCall;
+ (int)serviceForProvider:(id)a3 video:(BOOL)a4;
- (NSArray)providers;
- (NSArray)sortedProviders;
- (NSDictionary)providersByIdentifier;
- (NSMapTable)delegateToQueue;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (TUCallProvider)defaultAppProvider;
- (TUCallProvider)faceTimeProvider;
- (TUCallProvider)superboxProvider;
- (TUCallProvider)telephonyProvider;
- (TUCallProvider)tinCanProvider;
- (TUCallProviderManager)init;
- (TUCallProviderManager)initWithDataSource:(id)a3 type:(unint64_t)a4 queue:(id)a5;
- (TUCallProviderManager)initWithLocalProviders;
- (TUCallProviderManager)initWithPairedHostDeviceProviders;
- (TUCallProviderManager)initWithType:(unint64_t)a3;
- (TUCallProviderManagerDataSource)dataSource;
- (TUFeatureFlags)featureFlags;
- (id)dialRequestForRecentCall:(id)a3;
- (id)joinConversationRequestForRecentCall:(id)a3;
- (id)providerForFavoritesEntry:(id)a3;
- (id)providerForFavoritesEntryActionBundleIdentifier:(id)a3;
- (id)providerForRecentCall:(id)a3;
- (id)providerWithIdentifier:(id)a3;
- (id)providerWithService:(int)a3 video:(BOOL *)a4;
- (id)providersPassingTest:(id)a3;
- (id)sortedProvidersPassingTest:(id)a3;
- (unint64_t)type;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)donateUserIntentForProviderWithIdentifier:(id)a3;
- (void)launchAppForDialRequest:(id)a3 completion:(id)a4;
- (void)providersChangedForDataSource:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setDelegateToQueue:(id)a3;
@end

@implementation TUCallProviderManager

- (id)providerWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.private.expanse"]) {
    v5 = @"com.apple.telephonyutilities.callservicesd.FaceTimeProvider";
  }
  else {
    v5 = (__CFString *)v4;
  }
  v6 = [(TUCallProviderManager *)self providersByIdentifier];
  v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

+ (NSArray)defaultProviders
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = [[TUCallProvider alloc] initWithIdentifier:@"com.apple.coretelephony"];
  [(TUCallProvider *)v3 setBundleIdentifier:@"com.apple.mobilephone"];
  [(TUCallProvider *)v3 setLocalizedName:@"Telephony"];
  [(TUCallProvider *)v3 setSupportsAudioOnly:1];
  [(TUCallProvider *)v3 setSupportsEmergency:1];
  [(TUCallProvider *)v3 setSupportsVoicemail:1];
  [(TUCallProvider *)v3 setSupportsRecents:1];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EED24510];
  [(TUCallProvider *)v3 setSupportedHandleTypes:v4];

  [v2 addObject:v3];
  v5 = [[TUCallProvider alloc] initWithIdentifier:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];
  v6 = TUPreferredFaceTimeBundleIdentifier();
  [(TUCallProvider *)v5 setBundleIdentifier:v6];

  [(TUCallProvider *)v5 setLocalizedName:@"FaceTime"];
  [(TUCallProvider *)v5 setSupportsAudioOnly:1];
  [(TUCallProvider *)v5 setSupportsAudioAndVideo:1];
  [(TUCallProvider *)v5 setSupportsRecents:1];
  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EED24510, &unk_1EED24528, 0);
  [(TUCallProvider *)v5 setSupportedHandleTypes:v7];

  [v2 addObject:v5];
  if (TUShouldCreateSuperboxProvider())
  {
    v8 = [[TUCallProvider alloc] initWithIdentifier:@"com.apple.Superbox"];
    [(TUCallProvider *)v8 setLocalizedName:@"Superbox"];
    [(TUCallProvider *)v8 setSupportsAudioOnly:1];
    [(TUCallProvider *)v8 setSupportsEmergency:1];
    [(TUCallProvider *)v8 setSupportsAudioAndVideo:1];
    [(TUCallProvider *)v8 setSupportsRecents:1];
    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EED24510, &unk_1EED24528, 0);
    [(TUCallProvider *)v8 setSupportedHandleTypes:v9];

    [v2 addObject:v8];
  }
  v10 = (void *)[v2 copy];

  return (NSArray *)v10;
}

- (void)providersChangedForDataSource:(id)a3
{
  id v4 = [(TUCallProviderManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__TUCallProviderManager_providersChangedForDataSource___block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TUCallProviderManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__TUCallProviderManager_addDelegate_queue___block_invoke;
  block[3] = &unk_1E58E6258;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)providerForRecentCall:(id)a3
{
  id v4 = a3;
  if (!providerForRecentCall___kCHServiceProviderTelephony)
  {
    v5 = (void **)CUTWeakLinkSymbol();
    if (v5) {
      id v6 = *v5;
    }
    else {
      id v6 = 0;
    }
    objc_storeStrong((id *)&providerForRecentCall___kCHServiceProviderTelephony, v6);
  }
  if (!providerForRecentCall___kCHServiceProviderFaceTime)
  {
    id v7 = (void **)CUTWeakLinkSymbol();
    if (v7) {
      v8 = *v7;
    }
    else {
      v8 = 0;
    }
    objc_storeStrong((id *)&providerForRecentCall___kCHServiceProviderFaceTime, v8);
  }
  id v9 = [v4 serviceProvider];
  id v10 = v9;
  if (providerForRecentCall___kCHServiceProviderTelephony && objc_msgSend(v9, "isEqualToString:"))
  {
    uint64_t v11 = [(TUCallProviderManager *)self telephonyProvider];
  }
  else if (providerForRecentCall___kCHServiceProviderFaceTime && objc_msgSend(v10, "isEqualToString:"))
  {
    uint64_t v11 = [(TUCallProviderManager *)self faceTimeProvider];
  }
  else
  {
    uint64_t v11 = [(TUCallProviderManager *)self providerWithIdentifier:v10];
  }
  id v12 = (void *)v11;

  return v12;
}

- (TUCallProvider)faceTimeProvider
{
  v2 = [(TUCallProviderManager *)self providersByIdentifier];
  v3 = [v2 objectForKeyedSubscript:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];

  return (TUCallProvider *)v3;
}

- (id)providersPassingTest:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void))a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v6 = [(TUCallProviderManager *)self providers];
  id v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = [(TUCallProviderManager *)self providers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v4[2](v4, v13)) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = (void *)[v7 copy];

  return v14;
}

- (TUCallProvider)telephonyProvider
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (TUShouldUseSuperboxTelephonyProvider())
  {
    v3 = TUDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      v8 = @"TUShouldUseSuperBoxTelephonyProvider";
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Because this is an internal install and the %@ default is set, com.apple.Superbox (aka Speakerbox)                     is acting as the telephony provider", (uint8_t *)&v7, 0xCu);
    }

    id v4 = [(TUCallProviderManager *)self superboxProvider];
  }
  else
  {
    id v5 = [(TUCallProviderManager *)self providersByIdentifier];
    id v4 = [v5 objectForKeyedSubscript:@"com.apple.coretelephony"];
  }

  return (TUCallProvider *)v4;
}

- (NSArray)providers
{
  v2 = [(TUCallProviderManager *)self providersByIdentifier];
  v3 = [v2 allValues];
  id v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (NSDictionary)providersByIdentifier
{
  v3 = [(TUCallProviderManager *)self dataSource];
  int v4 = [v3 currentProcessCanAccessInitialState];

  if (v4)
  {
    id v5 = [(TUCallProviderManager *)self dataSource];
    [v5 blockUntilInitialStateReceived];
  }
  id v6 = [(TUCallProviderManager *)self dataSource];
  int v7 = [v6 providersByIdentifier];

  unint64_t v8 = [(TUCallProviderManager *)self type];
  if (v8 == 2)
  {
    uint64_t v9 = [(TUCallProviderManager *)self dataSource];
    uint64_t v10 = [v9 pairedHostDeviceProvidersByIdentifier];
  }
  else
  {
    if (v8 != 1) {
      goto LABEL_8;
    }
    uint64_t v9 = [(TUCallProviderManager *)self dataSource];
    uint64_t v10 = [v9 localProvidersByIdentifier];
  }
  uint64_t v11 = (void *)v10;

  int v7 = v11;
LABEL_8:

  return (NSDictionary *)v7;
}

- (TUCallProviderManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)type
{
  return self->_type;
}

- (TUCallProviderManager)init
{
  return [(TUCallProviderManager *)self initWithType:0];
}

void __55__TUCallProviderManager_providersChangedForDataSource___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"TUCallProviderManagerProvidersChangedNotification" object:*(void *)(a1 + 32)];
}

- (TUCallProviderManager)initWithType:(unint64_t)a3
{
  id v5 = objc_alloc_init(TUCallProviderManagerXPCClient);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.telephonyutilities.callprovidermanager", 0);
  int v7 = [(TUCallProviderManager *)self initWithDataSource:v5 type:a3 queue:v6];

  return v7;
}

- (TUCallProviderManager)initWithDataSource:(id)a3 type:(unint64_t)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUCallProviderManager;
  uint64_t v11 = [(TUCallProviderManager *)&v17 init];
  if (v11)
  {
    id v12 = objc_alloc_init(TUFeatureFlags);
    featureFlags = v11->_featureFlags;
    v11->_featureFlags = v12;

    objc_storeStrong((id *)&v11->_queue, a5);
    v11->_type = a4;
    objc_storeStrong((id *)&v11->_dataSource, a3);
    [(TUCallProviderManagerDataSource *)v11->_dataSource setDelegate:v11];
    uint64_t v14 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateToQueue = v11->_delegateToQueue;
    v11->_delegateToQueue = (NSMapTable *)v14;
  }
  return v11;
}

uint64_t __55__TUCallProviderManager_providersChangedForDataSource___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) providersChangedForProviderManager:*(void *)(a1 + 40)];
}

void __43__TUCallProviderManager_addDelegate_queue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  id v4 = v2;
  if (*(void *)(a1 + 40)) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v3 = MEMORY[0x1E4F14428];
  }
  [v2 setObject:v3 forKey:*(void *)(a1 + 48)];
}

void __55__TUCallProviderManager_providersChangedForDataSource___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * v5);
        int v7 = [*(id *)(a1 + 32) delegateToQueue];
        unint64_t v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__TUCallProviderManager_providersChangedForDataSource___block_invoke_2;
        block[3] = &unk_1E58E5C08;
        uint64_t v9 = *(void *)(a1 + 32);
        block[4] = v6;
        void block[5] = v9;
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__TUCallProviderManager_providersChangedForDataSource___block_invoke_3;
  v11[3] = &unk_1E58E5BE0;
  v11[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (TUCallProviderManager)initWithLocalProviders
{
  return [(TUCallProviderManager *)self initWithType:1];
}

- (TUCallProviderManager)initWithPairedHostDeviceProviders
{
  return [(TUCallProviderManager *)self initWithType:2];
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(TUCallProviderManager *)self providers];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p providers=%@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)dealloc
{
  [(TUCallProviderManagerDataSource *)self->_dataSource invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUCallProviderManager;
  [(TUCallProviderManager *)&v3 dealloc];
}

- (TUCallProvider)superboxProvider
{
  uint64_t v2 = [(TUCallProviderManager *)self providersByIdentifier];
  objc_super v3 = [v2 objectForKeyedSubscript:@"com.apple.Superbox"];

  return (TUCallProvider *)v3;
}

- (TUCallProvider)tinCanProvider
{
  uint64_t v2 = [(TUCallProviderManager *)self providersByIdentifier];
  objc_super v3 = [v2 objectForKeyedSubscript:@"com.apple.telephonyutilities.callservicesd.TinCan"];

  return (TUCallProvider *)v3;
}

- (id)providerWithService:(int)a3 video:(BOOL *)a4
{
  if (a3 == 3)
  {
    BOOL v5 = 1;
LABEL_7:
    uint64_t v6 = [(TUCallProviderManager *)self faceTimeProvider];
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  BOOL v5 = 0;
  if (a3 == 2) {
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    uint64_t v6 = [(TUCallProviderManager *)self telephonyProvider];
    BOOL v5 = 0;
    if (!a4) {
      goto LABEL_9;
    }
LABEL_8:
    *a4 = v5;
    goto LABEL_9;
  }
  uint64_t v6 = 0;
  if (a4) {
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

+ (int)serviceForProvider:(id)a3 video:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 identifier];
  char v7 = [v6 isEqualToString:@"com.apple.coretelephony"];

  if (v7)
  {
    int v8 = 1;
  }
  else
  {
    uint64_t v9 = [v5 identifier];
    int v10 = [v9 isEqualToString:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];

    if (v4) {
      int v11 = 3;
    }
    else {
      int v11 = 2;
    }
    if (v10) {
      int v8 = v11;
    }
    else {
      int v8 = 0;
    }
  }

  return v8;
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallProviderManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__TUCallProviderManager_removeDelegate___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __40__TUCallProviderManager_removeDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)sortedProvidersPassingTest:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void))a3;
  id v5 = [(TUCallProviderManager *)self sortedProviders];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (v4[2](v4, v12)) {
          objc_msgSend(v6, "addObject:", v12, (void)v15);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  long long v13 = (void *)[v6 copy];

  return v13;
}

- (TUCallProvider)defaultAppProvider
{
  objc_super v3 = [(TUCallProviderManager *)self featureFlags];
  if ([v3 defaultAppsEnabled])
  {
    id v4 = [(TUCallProviderManager *)self dataSource];
    int v5 = [v4 currentProcessCanAccessInitialState];

    if (v5)
    {
      id v6 = [(TUCallProviderManager *)self dataSource];
      id v7 = [v6 defaultAppProvider];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [(TUCallProviderManager *)self telephonyProvider];
      }
      uint64_t v10 = v9;

      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v10 = [(TUCallProviderManager *)self telephonyProvider];
LABEL_9:

  return (TUCallProvider *)v10;
}

- (NSArray)sortedProviders
{
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(TUCallProviderManager *)self featureFlags];
  if (([v3 defaultAppsEnabled] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v4 = [(TUCallProviderManager *)self dataSource];
  int v5 = [v4 currentProcessCanAccessInitialState];

  if (!v5)
  {
LABEL_6:
    id v7 = [(TUCallProviderManager *)self telephonyProvider];
    uint64_t v12 = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    goto LABEL_7;
  }
  id v6 = [(TUCallProviderManager *)self dataSource];
  id v7 = [v6 sortedProviders];

  if ([v7 count])
  {
    id v8 = v7;
    id v7 = v8;
LABEL_7:
    id v9 = v8;
    goto LABEL_8;
  }
  int v11 = [(TUCallProviderManager *)self telephonyProvider];
  v13[0] = v11;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

LABEL_8:

  return (NSArray *)v9;
}

- (id)providerForFavoritesEntry:(id)a3
{
  id v4 = [a3 bundleIdentifier];
  int v5 = [(TUCallProviderManager *)self providerForFavoritesEntryActionBundleIdentifier:v4];

  return v5;
}

- (id)providerForFavoritesEntryActionBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F1AD10]])
  {
    uint64_t v5 = [(TUCallProviderManager *)self telephonyProvider];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F1AD00]])
  {
    uint64_t v5 = [(TUCallProviderManager *)self faceTimeProvider];
    goto LABEL_5;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__TUCallProviderManager_providerForFavoritesEntryActionBundleIdentifier___block_invoke;
  v9[3] = &unk_1E58E79E8;
  id v10 = v4;
  id v7 = [(TUCallProviderManager *)self providersPassingTest:v9];
  id v6 = [v7 firstObject];

LABEL_7:

  return v6;
}

uint64_t __73__TUCallProviderManager_providerForFavoritesEntryActionBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)donateUserIntentForProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallProviderManager *)self dataSource];
  [v5 donateUserIntentForProviderWithIdentifier:v4];
}

- (void)launchAppForDialRequest:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "dialRequest: %@", buf, 0xCu);
  }

  if ([v6 isValid])
  {
    id v9 = [v6 provider];
    int v10 = [v9 isSystemProvider];

    if (!v10)
    {
      long long v19 = [(TUCallProviderManager *)self dataSource];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __60__TUCallProviderManager_launchAppForDialRequest_completion___block_invoke;
      v20[3] = &unk_1E58E5CC8;
      id v21 = v7;
      [v19 launchAppForDialRequest:v6 completion:v20];

      id v7 = 0;
      long long v18 = 0;
      goto LABEL_14;
    }
    int v11 = TUDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Opening URL because dial request is using a system provider", buf, 2u);
    }

    BOOL v12 = [v6 dialType] == 1;
    long long v13 = [(TUCallProviderManager *)self dataSource];
    long long v14 = [v6 URL];
    id v22 = 0;
    [v13 openURL:v14 isSensitive:v12 error:&v22];
    id v15 = v22;
  }
  else
  {
    long long v13 = [NSString stringWithFormat:@"Cannot launch app for invalid dial request: %@", v6];
    long long v16 = TUDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[TUCallProviderManager launchAppForDialRequest:completion:]((uint64_t)v13, v16);
    }

    long long v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24 = v13;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v15 = [v17 errorWithDomain:@"com.apple.TelephonyUtilities" code:1 userInfo:v14];
  }
  long long v18 = v15;

  if (v7) {
    (*((void (**)(id, void *))v7 + 2))(v7, v18);
  }
LABEL_14:
}

void __60__TUCallProviderManager_launchAppForDialRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(21, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__TUCallProviderManager_launchAppForDialRequest_completion___block_invoke_2;
    v6[3] = &unk_1E58E6760;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __60__TUCallProviderManager_launchAppForDialRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setDelegateToQueue:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)dialRequestForRecentCall:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallProviderManager *)self providerForRecentCall:v4];
  if (v5)
  {
    id v6 = [[TUDialRequest alloc] initWithProvider:v5];
    id v7 = [v4 validRemoteParticipantHandles];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v9 = [v4 validRemoteParticipantHandles];
      int v10 = [v9 anyObject];

      if ([v10 type] == 2 && objc_msgSend(v5, "isTelephonyProvider"))
      {
        unsigned __int8 v20 = 0;
        int v11 = [v4 isoCountryCode];
        BOOL v12 = [v10 value];
        id v21 = TUNumberToDialOptionsSuppressLocalAssistKey;
        v22[0] = MEMORY[0x1E4F1CC38];
        long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
        long long v14 = TUNumberToDial(v12, v11, 0, v13, &v20);

        [(TUDialRequest *)v6 setDialAssisted:v20];
        id v15 = +[TUHandle normalizedPhoneNumberHandleForValue:v14 isoCountryCode:v11];
        [(TUDialRequest *)v6 setHandle:v15];
      }
      else
      {
        int v11 = +[TUHandle handlesForCHRecentCall:v4 validHandlesOnly:1];
        long long v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
        [(TUDialRequest *)v6 setHandles:v17];
      }
    }
    long long v18 = [v4 outgoingLocalParticipantUUID];
    [(TUDialRequest *)v6 setLocalSenderIdentityAccountUUID:v18];

    [(TUDialRequest *)v6 setPerformDialAssist:0];
    [(TUDialRequest *)v6 setPerformLocalDialAssist:0];
    -[TUDialRequest setTtyType:](v6, "setTtyType:", +[TUDialRequest dialRequestTTYTypeForCHRecentCallTTYType:](TUDialRequest, "dialRequestTTYTypeForCHRecentCallTTYType:", [v4 ttyType]));
    -[TUDialRequest setVideo:](v6, "setVideo:", [v4 mediaType] == 2);
    [(TUDialRequest *)v6 setOriginatingUIType:8];
  }
  else
  {
    long long v16 = TUDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[TUCallProviderManager(CallHistoryAdditions) dialRequestForRecentCall:]((uint64_t)v4, v16);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)joinConversationRequestForRecentCall:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = [v3 validRemoteParticipantHandles];
  id v6 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));

  id v7 = +[TUHandle handlesForCHRecentCall:v3 validHandlesOnly:1];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (v12)
        {
          long long v13 = [TUConversationMember alloc];
          long long v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
          id v15 = [(TUConversationMember *)v13 initWithHandles:v14];

          [v6 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }
  if ([v6 count])
  {
    long long v16 = [[TUJoinConversationRequest alloc] initWithRemoteMembers:v6];
    -[TUJoinConversationRequest setVideo:](v16, "setVideo:", [v3 mediaType] == 2);
    -[TUJoinConversationRequest setVideoEnabled:](v16, "setVideoEnabled:", [v3 mediaType] == 2);
    long long v17 = [(TUCallProviderManager *)self faceTimeProvider];
    long long v18 = [v3 outgoingLocalParticipantUUID];
    long long v19 = [v17 senderIdentityForAccountUUID:v18];

    if (v19)
    {
      unsigned __int8 v20 = [v19 handle];
      [(TUJoinConversationRequest *)v16 setCallerID:v20];
    }
    id v21 = +[TUCallProviderManager invitationPreferencesForRecentCall];
    [(TUJoinConversationRequest *)v16 setInvitationPreferences:v21];
  }
  else
  {
    long long v19 = TUDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v3;
      _os_log_impl(&dword_19C496000, v19, OS_LOG_TYPE_DEFAULT, "Could not create join request for recent call: %@", buf, 0xCu);
    }
    long long v16 = 0;
  }

  return v16;
}

+ (NSSet)invitationPreferencesForRecentCall
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v2 = [[TUConversationInvitationPreference alloc] initWithHandleType:2 notificationStyles:6];
  id v3 = -[TUConversationInvitationPreference initWithHandleType:notificationStyles:]([TUConversationInvitationPreference alloc], "initWithHandleType:notificationStyles:", 3, 6, v2);
  v8[1] = v3;
  id v4 = [[TUConversationInvitationPreference alloc] initWithHandleType:1 notificationStyles:6];
  v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];

  return (NSSet *)v6;
}

- (void)launchAppForDialRequest:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end