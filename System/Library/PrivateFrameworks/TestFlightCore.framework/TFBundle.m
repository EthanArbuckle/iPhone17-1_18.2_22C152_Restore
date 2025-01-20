@interface TFBundle
+ (id)bundleIdentifierForBundleURL:(id)a3;
+ (id)frameworkBundle;
+ (id)pathForResource:(id)a3 ofType:(id)a4;
@end

@implementation TFBundle

+ (id)frameworkBundle
{
  if (frameworkBundle_onceToken != -1) {
    dispatch_once(&frameworkBundle_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)frameworkBundle_frameworkBundle;

  return v2;
}

uint64_t __27__TFBundle_frameworkBundle__block_invoke()
{
  frameworkBundle_frameworkBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

+ (id)pathForResource:(id)a3 ofType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 frameworkBundle];
  v9 = [v8 pathForResource:v7 ofType:v6];

  return v9;
}

+ (id)bundleIdentifierForBundleURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v12 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithURL:v3 allowPlaceholder:1 error:&v12];
  id v5 = v12;
  if (v4)
  {
    id v6 = [v4 bundleIdentifier];
  }
  else
  {
    id v7 = +[TFLogConfiguration defaultConfiguration];
    v8 = [v7 generatedLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v14 = v9;
      __int16 v15 = 2114;
      id v16 = v3;
      __int16 v17 = 2114;
      id v18 = v5;
      id v10 = v9;
      _os_log_impl(&dword_223064000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Cannot load application record for %{public}@: %{public}@", buf, 0x20u);
    }
    id v6 = 0;
  }

  return v6;
}

@end