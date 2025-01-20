@interface VUIJSSettingsInterface
- (BOOL)sportsScoreSpoilersAllowed;
- (VUIJSSettingsInterface)initWithAppContext:(id)a3;
- (id)userPreferences;
- (void)_handleSettingsDidChange:(id)a3;
- (void)dealloc;
- (void)updateFeaturesConfiguration:(id)a3;
@end

@implementation VUIJSSettingsInterface

- (void)updateFeaturesConfiguration:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    v5 = __54__VUIJSSettingsInterface_updateFeaturesConfiguration___block_invoke;
    v6 = &unk_1E6DF3D58;
    id v7 = v3;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v5((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

- (VUIJSSettingsInterface)initWithAppContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIJSSettingsInterface;
  id v3 = [(VUIJSObject *)&v6 initWithAppContext:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__handleSettingsDidChange_ name:*MEMORY[0x1E4FB52A8] object:0];
  }
  return v3;
}

- (id)userPreferences
{
  v2 = +[VUISettingsManager sharedInstance];
  id v3 = [v2 preferencesJSONData];

  return v3;
}

- (BOOL)sportsScoreSpoilersAllowed
{
  v2 = [MEMORY[0x1E4FB5178] sharedPreferences];
  char v3 = [v2 sportsScoreSpoilersAllowed];

  return v3;
}

void __54__VUIJSSettingsInterface_updateFeaturesConfiguration___block_invoke(uint64_t a1)
{
  v2 = VUISignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.Update", "", buf, 2u);
  }

  char v3 = +[VUIFeaturesConfiguration sharedInstance];
  [v3 updateWithDictionary:*(void *)(a1 + 32)];

  v4 = VUISignpostLogObject();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.Update", "", v5, 2u);
  }
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIJSSettingsInterface;
  [(VUIJSSettingsInterface *)&v4 dealloc];
}

- (void)_handleSettingsDidChange:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_Vuijssettingsi.isa);
  v5 = [(VUIJSObject *)self appContext];
  objc_initWeak(&location, v5);

  objc_initWeak(&from, self);
  id v6 = objc_loadWeakRetained(&location);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__VUIJSSettingsInterface__handleSettingsDidChange___block_invoke;
  v7[3] = &unk_1E6DF7FC8;
  objc_copyWeak(&v8, &from);
  [v6 evaluate:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __51__VUIJSSettingsInterface__handleSettingsDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = objc_msgSend(MEMORY[0x1E4F30938], "valueWithObject:inContext:");

  if ([v4 hasProperty:@"onSettingsChange"])
  {
    NSLog(&cfstr_Vuijssettingsi_0.isa);
    id v5 = (id)[v4 invokeMethod:@"onSettingsChange" withArguments:0];
  }
}

@end