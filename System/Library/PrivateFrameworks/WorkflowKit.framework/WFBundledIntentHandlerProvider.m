@interface WFBundledIntentHandlerProvider
+ (id)localIntentHandlerLaunchID;
+ (id)sharedInstance;
- (NSString)localExtensionIdentifier;
- (WFBundledIntentHandlerProvider)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation WFBundledIntentHandlerProvider

- (id)handlerForIntent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 identifier];

  if (v4)
  {
    if (handlerForIntent__onceToken != -1) {
      dispatch_once(&handlerForIntent__onceToken, &__block_literal_global_487);
    }
    v5 = (void *)handlerForIntent__intentHandlerForIdentifier;
    v6 = [v3 identifier];
    v7 = [v5 objectForKeyedSubscript:v6];

    v8 = (void *)handlerForIntent__intentHandlerForIdentifier;
    if (v7)
    {
      v9 = [v3 identifier];
      id v10 = [v8 objectForKeyedSubscript:v9];
    }
    else
    {
      [(id)handlerForIntent__intentHandlerForIdentifier removeAllObjects];
      v12 = (void *)handlerForIntent__intentHandlerForIdentifier;
      v13 = [v3 identifier];
      v14 = [v3 _codableDescription];
      v15 = [v14 typeName];

      v16 = [NSString stringWithFormat:@"WF%@IntentHandler", v15];
      id v10 = objc_alloc_init(NSClassFromString(v16));

      [v12 setObject:v10 forKeyedSubscript:v13];
    }
  }
  else
  {
    v11 = getWFGeneralLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFBundledIntentHandlerProvider handlerForIntent:]";
      __int16 v20 = 2114;
      id v21 = v3;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Unable to get handler for intent: %{public}@", buf, 0x16u);
    }

    id v10 = 0;
  }

  return v10;
}

void __51__WFBundledIntentHandlerProvider_handlerForIntent___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)handlerForIntent__intentHandlerForIdentifier;
  handlerForIntent__intentHandlerForIdentifier = (uint64_t)v0;
}

- (NSString)localExtensionIdentifier
{
  return (NSString *)@"com.apple.shortcuts.bundled-intent";
}

- (WFBundledIntentHandlerProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFBundledIntentHandlerProvider;
  v2 = [(WFBundledIntentHandlerProvider *)&v6 init];
  if (v2)
  {
    id v3 = [(objc_class *)getINCLocalExtensionRegistryClass() sharedInstance];
    [v3 registerLocalExtension:v2];

    v4 = v2;
  }

  return v2;
}

+ (id)localIntentHandlerLaunchID
{
  v2 = +[WFBundledIntentHandlerProvider sharedInstance];
  id v3 = [v2 localExtensionIdentifier];

  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WFBundledIntentHandlerProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __48__WFBundledIntentHandlerProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
}

@end