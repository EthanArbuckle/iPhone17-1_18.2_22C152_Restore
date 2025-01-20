@interface PKIconImageCache
+ (id)settingsIconCache;
+ (id)settingsIconCacheWithScale:(double)a3;
- (NSDictionary)iconCache;
- (OS_dispatch_queue)cacheAccessQueue;
- (PKIconImageCache)initWithPath:(id)a3 scale:(double)a4;
- (id)allImageIconKeys;
- (id)imageForKey:(id)a3;
- (void)setCacheAccessQueue:(id)a3;
- (void)setIconCache:(id)a3;
@end

@implementation PKIconImageCache

+ (id)settingsIconCache
{
  if (settingsIconCache_onceToken != -1) {
    dispatch_once(&settingsIconCache_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)settingsIconCache_settingsIconCache;
  return v2;
}

uint64_t __37__PKIconImageCache_settingsIconCache__block_invoke()
{
  v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 scale];
  double v2 = v1;

  uint64_t v3 = +[PKIconImageCache settingsIconCacheWithScale:v2];
  uint64_t v4 = settingsIconCache_settingsIconCache;
  settingsIconCache_settingsIconCache = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

+ (id)settingsIconCacheWithScale:(double)a3
{
  if (a3 >= 3.0)
  {
    v5 = PSPreferencesFrameworkBundle();
    uint64_t v4 = [v5 pathForResource:@"iconCache@3x" ofType:@"artwork"];
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (a3 >= 2.0 && v4 == 0)
  {
    v7 = PSPreferencesFrameworkBundle();
    uint64_t v4 = [v7 pathForResource:@"iconCache@2x" ofType:@"artwork"];
  }
  v8 = [[PKIconImageCache alloc] initWithPath:v4 scale:a3];

  return v8;
}

- (PKIconImageCache)initWithPath:(id)a3 scale:(double)a4
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKIconImageCache;
  v6 = [(PKIconImageCache *)&v23 init];
  if (v6)
  {
    v7 = NSString;
    v8 = [v5 lastPathComponent];
    v9 = [v8 stringByDeletingPathExtension];
    v10 = [v7 stringWithFormat:@"com.apple.preferences-framework.%@.cacheAccessQueue", v9];

    id v11 = v10;
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 cStringUsingEncoding:4], 0);
    cacheAccessQueue = v6->_cacheAccessQueue;
    v6->_cacheAccessQueue = (OS_dispatch_queue *)v12;

    v14 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2B8]];
    [v14 setDrawBorder:1];
    v15 = [MEMORY[0x1E4F42F80] currentTraitCollection];
    objc_msgSend(v14, "setAppearance:", objc_msgSend(v15, "userInterfaceStyle") != 1);

    v16 = [MEMORY[0x1E4F42F80] currentTraitCollection];
    if ([v16 layoutDirection]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    [v14 setLanguageDirection:v17];

    v18 = [MEMORY[0x1E4F42F80] currentTraitCollection];
    objc_msgSend(v14, "setContrast:", objc_msgSend(v18, "accessibilityContrast") == 1);

    v19 = [(PKIconImageCache *)v6 cacheAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PKIconImageCache_initWithPath_scale___block_invoke;
    block[3] = &unk_1E5C5D680;
    v22 = v6;
    dispatch_async(v19, block);
  }
  return v6;
}

void __39__PKIconImageCache_initWithPath_scale___block_invoke(uint64_t a1)
{
  double v2 = PKLogForCategory(6);
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, "PKIconImageCache.loadIconImageCache");

  uint64_t v4 = PKLogForCategory(6);
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PKIconImageCache.loadIconImageCache", (const char *)&unk_1A6690B76, buf, 2u);
  }

  v6 = [(id)objc_opt_class() _cacheKeyToGraphicIconIdentifierLookup];
  v7 = [v6 allKeys];

  v8 = [(id)objc_opt_class() _cacheKeyToApplicationBundleIdentifierLookup];
  v9 = [v8 allKeys];

  v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count") + objc_msgSend(v7, "count"));
  size_t v11 = [v7 count];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PKIconImageCache_initWithPath_scale___block_invoke_17;
  block[3] = &unk_1E5C5E4E0;
  id v12 = v7;
  id v28 = v12;
  id v29 = *(id *)(a1 + 32);
  id v13 = v10;
  id v30 = v13;
  dispatch_apply(v11, 0, block);
  size_t v14 = [v9 count];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __39__PKIconImageCache_initWithPath_scale___block_invoke_2;
  objc_super v23 = &unk_1E5C5E4E0;
  id v15 = v9;
  id v24 = v15;
  id v25 = *(id *)(a1 + 32);
  id v16 = v13;
  id v26 = v16;
  dispatch_apply(v14, 0, &v20);
  uint64_t v17 = objc_msgSend(v16, "copy", v20, v21, v22, v23);
  [*(id *)(a1 + 32) setIconCache:v17];

  v18 = PKLogForCategory(6);
  v19 = v18;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v19, OS_SIGNPOST_INTERVAL_END, v3, "PKIconImageCache.loadIconImageCache", (const char *)&unk_1A6690B76, buf, 2u);
  }
}

void __39__PKIconImageCache_initWithPath_scale___block_invoke_17(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) objectAtIndex:a2];
  os_signpost_id_t v3 = [(id)objc_opt_class() _cacheKeyToGraphicIconIdentifierLookup];
  uint64_t v4 = [v3 objectForKey:v7];

  id v5 = objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", v4);
  id v6 = *(id *)(a1 + 48);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(a1 + 48), "na_safeSetObject:forKey:", v5, v7);
  objc_sync_exit(v6);
}

void __39__PKIconImageCache_initWithPath_scale___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) objectAtIndex:a2];
  os_signpost_id_t v3 = [(id)objc_opt_class() _cacheKeyToApplicationBundleIdentifierLookup];
  uint64_t v4 = [v3 objectForKey:v7];

  id v5 = objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithApplicationBundleIdentifier:", v4);
  id v6 = *(id *)(a1 + 48);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(a1 + 48), "na_safeSetObject:forKey:", v5, v7);
  objc_sync_exit(v6);
}

- (id)imageForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _cacheKeysForApplicationIconsThatNeedJustInTimeEvaluation];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F42A80];
    v8 = [(id)objc_opt_class() _cacheKeysForApplicationIconsThatNeedJustInTimeEvaluation];
    v9 = [v8 objectForKey:v4];
    objc_msgSend(v7, "ps_synchronousIconWithApplicationBundleIdentifier:", v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__4;
    v22 = __Block_byref_object_dispose__4;
    id v23 = 0;
    objc_initWeak(&location, self);
    size_t v11 = [(PKIconImageCache *)self cacheAccessQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __32__PKIconImageCache_imageForKey___block_invoke;
    v13[3] = &unk_1E5C5E508;
    objc_copyWeak(&v16, &location);
    id v15 = &v18;
    id v14 = v4;
    dispatch_sync(v11, v13);

    id v10 = (id)v19[5];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v18, 8);
  }
  return v10;
}

void __32__PKIconImageCache_imageForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v2 = [WeakRetained iconCache];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)allImageIconKeys
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__4;
  id v13 = __Block_byref_object_dispose__4;
  id v14 = 0;
  objc_initWeak(&location, self);
  uint64_t v3 = [(PKIconImageCache *)self cacheAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PKIconImageCache_allImageIconKeys__block_invoke;
  block[3] = &unk_1E5C5E530;
  objc_copyWeak(&v7, &location);
  void block[4] = &v9;
  dispatch_sync(v3, block);

  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return v4;
}

void __36__PKIconImageCache_allImageIconKeys__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [WeakRetained iconCache];
  id v4 = [v3 allKeys];
  uint64_t v5 = [v2 setWithArray:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

id __58__PKIconImageCache__cacheKeyToGraphicIconIdentifierLookup__block_invoke()
{
  if (_block_invoke_na_once_token_4 != -1) {
    dispatch_once(&_block_invoke_na_once_token_4, &__block_literal_global_25);
  }
  v0 = (void *)_block_invoke_na_once_object_4;
  return v0;
}

void __58__PKIconImageCache__cacheKeyToGraphicIconIdentifierLookup__block_invoke_2()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AppClips";
  v2[1] = @"CellularData";
  v3[0] = @"com.apple.graphic-icon.app-clips";
  v3[1] = @"com.apple.graphic-icon.cellular-settings";
  v2[2] = @"ControlCenter";
  v2[3] = @"General";
  v3[2] = @"com.apple.graphic-icon.control-center";
  v3[3] = @"com.apple.graphic-icon.gear";
  v2[4] = @"HealthData";
  v2[5] = @"HomeScreen";
  v3[4] = @"com.apple.graphic-icon.health-data";
  v3[5] = @"com.apple.graphic-icon.home-screen";
  v2[6] = @"KeychainSync";
  v2[7] = @"Location";
  v3[6] = @"com.apple.graphic-icon.passwords";
  v3[7] = @"com.apple.graphic-icon.location";
  v2[8] = @"PersonalHotspot";
  v2[9] = @"VPN";
  v3[8] = @"com.apple.graphic-icon.personal-hotspot";
  v3[9] = @"com.apple.graphic-icon.vpn";
  v2[10] = @"iCloud";
  v2[11] = @"iCloudBackup";
  v3[10] = @"com.apple.application-icon.icloud";
  v3[11] = @"com.apple.graphic-icon.icloud-backup";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  double v1 = (void *)_block_invoke_na_once_object_4;
  _block_invoke_na_once_object_4 = v0;
}

id __64__PKIconImageCache__cacheKeyToApplicationBundleIdentifierLookup__block_invoke()
{
  if (_block_invoke_2_na_once_token_5 != -1) {
    dispatch_once(&_block_invoke_2_na_once_token_5, &__block_literal_global_66);
  }
  uint64_t v0 = (void *)_block_invoke_2_na_once_object_5;
  return v0;
}

void __64__PKIconImageCache__cacheKeyToApplicationBundleIdentifierLookup__block_invoke_2()
{
  v6[17] = *MEMORY[0x1E4F143B8];
  v5[0] = @"Calendar";
  v5[1] = @"Fitness";
  v6[0] = @"com.apple.mobilecal";
  v6[1] = @"com.apple.Fitness";
  v5[2] = @"HomeData";
  v5[3] = @"iTunes";
  v6[2] = @"com.apple.Home";
  v6[3] = @"com.apple.MobileStore";
  v5[4] = @"Wallet";
  uint64_t v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];
  double v2 = @"com.apple.PassbookStub";
  if (!v1) {
    double v2 = @"com.apple.Passbook";
  }
  v6[4] = v2;
  v6[5] = @"com.apple.DocumentsApp";
  v5[5] = @"Files";
  v5[6] = @"Freeform";
  v6[6] = @"com.apple.freeform";
  v6[7] = @"com.apple.gamecenter.widgets";
  v5[7] = @"GameCenter";
  v5[8] = @"Health";
  v6[8] = @"com.apple.Health";
  v6[9] = @"com.apple.mobilemail";
  v5[9] = @"Mail";
  v5[10] = @"Messages";
  v6[10] = @"com.apple.MobileSMS";
  v6[11] = @"com.apple.news";
  v5[11] = @"News";
  v5[12] = @"Notes";
  v6[12] = @"com.apple.mobilenotes";
  v6[13] = @"com.apple.mobileslideshow";
  v5[13] = @"Photos";
  v5[14] = @"Siri";
  v6[14] = @"com.apple.siri";
  v6[15] = @"com.apple.mobilesafari";
  v5[15] = @"Safari";
  v5[16] = @"Stocks";
  v6[16] = @"com.apple.stocks";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:17];
  id v4 = (void *)_block_invoke_2_na_once_object_5;
  _block_invoke_2_na_once_object_5 = v3;
}

id __77__PKIconImageCache__cacheKeysForApplicationIconsThatNeedJustInTimeEvaluation__block_invoke()
{
  if (_block_invoke_3_na_once_token_6 != -1) {
    dispatch_once(&_block_invoke_3_na_once_token_6, &__block_literal_global_125);
  }
  uint64_t v0 = (void *)_block_invoke_3_na_once_object_6;
  return v0;
}

void __77__PKIconImageCache__cacheKeysForApplicationIconsThatNeedJustInTimeEvaluation__block_invoke_2()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Contacts";
  v2[1] = @"Reminders";
  v3[0] = @"com.apple.MobileAddressBook";
  v3[1] = @"com.apple.reminders";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  uint64_t v1 = (void *)_block_invoke_3_na_once_object_6;
  _block_invoke_3_na_once_object_6 = v0;
}

- (OS_dispatch_queue)cacheAccessQueue
{
  return self->_cacheAccessQueue;
}

- (void)setCacheAccessQueue:(id)a3
{
}

- (NSDictionary)iconCache
{
  return self->_iconCache;
}

- (void)setIconCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_cacheAccessQueue, 0);
}

@end