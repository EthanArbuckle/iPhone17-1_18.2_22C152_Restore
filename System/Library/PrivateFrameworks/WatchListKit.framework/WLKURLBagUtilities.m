@interface WLKURLBagUtilities
+ (BOOL)isFullTVAppEnabled;
+ (id)isFullTVAppEnabledCachedValue;
+ (void)isFullTVAppEnabledWithCompletion:(id)a3;
+ (void)isFullTVAppEnabledwithCompletion:(id)a3;
@end

@implementation WLKURLBagUtilities

+ (void)isFullTVAppEnabledwithCompletion:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__WLKURLBagUtilities_isFullTVAppEnabledwithCompletion___block_invoke;
  v6[3] = &unk_1E620A368;
  id v7 = v3;
  id v5 = v3;
  [v4 isFullTVAppEnabledWithCompletion:v6];
}

+ (void)isFullTVAppEnabledWithCompletion:(id)a3
{
  id v3 = (void (**)(id, uint64_t, void))a3;
  v4 = WLKTVAppEnabledOverride();
  id v5 = v4;
  if (v4)
  {
    NSLog(&cfstr_Isfulltvappena.isa, [v4 BOOLValue]);
    v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
    objc_msgSend(v6, "setBool:forKey:", objc_msgSend(v5, "BOOLValue"), @"lastKnownTVAppEnabledValue");

    if (v3) {
      v3[2](v3, [v5 BOOLValue], 0);
    }
  }
  else
  {
    id v7 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__WLKURLBagUtilities_isFullTVAppEnabledWithCompletion___block_invoke;
    block[3] = &unk_1E620A390;
    v9 = v3;
    dispatch_async(v7, block);
  }
}

+ (id)isFullTVAppEnabledCachedValue
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  id v3 = [v2 objectForKey:@"lastKnownTVAppEnabledValue"];

  return v3;
}

void __55__WLKURLBagUtilities_isFullTVAppEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FA9C70] app];
  id v3 = [v2 cachedBooleanForKey:kBagKeyUVSearchNowPlayingEnabled];

  v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "Fetch full tv app enabled: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = [v3 BOOLValue];
  if (v3)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
    [v6 setBool:v5 forKey:@"lastKnownTVAppEnabledValue"];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, v5, 0);
  }
}

uint64_t __55__WLKURLBagUtilities_isFullTVAppEnabledwithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (BOOL)isFullTVAppEnabled
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__WLKURLBagUtilities_isFullTVAppEnabled__block_invoke;
  v6[3] = &unk_1E620A340;
  int v8 = &v9;
  v4 = v2;
  uint64_t v7 = v4;
  [v3 isFullTVAppEnabledwithCompletion:v6];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

intptr_t __40__WLKURLBagUtilities_isFullTVAppEnabled__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end