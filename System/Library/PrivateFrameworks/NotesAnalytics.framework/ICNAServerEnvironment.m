@interface ICNAServerEnvironment
+ (NSURL)fallbackDefaultTargetURLFromPrefs;
+ (id)defaultAMSBag;
+ (id)ic_defaultBagKeySet;
- (ICNAServerEnvironment)init;
- (NSString)aaEndPointTypeName;
- (NSURL)targetURL;
- (char)serverEnvironmentType;
- (id)fallbackDefaultTargetURL;
- (void)init;
- (void)setAaEndPointTypeName:(id)a3;
- (void)setServerEnvironmentType:(char)a3;
- (void)setTargetURL:(id)a3;
@end

@implementation ICNAServerEnvironment

+ (NSURL)fallbackDefaultTargetURLFromPrefs
{
  v2 = (void *)sFallbackDefaultURLFromPrefs;
  if (!sFallbackDefaultURLFromPrefs)
  {
    v3 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
    v4 = [v3 URLForKey:@"analyticsFallbackDefaultURL"];
    uint64_t v5 = [v4 copy];
    v6 = (void *)sFallbackDefaultURLFromPrefs;
    sFallbackDefaultURLFromPrefs = v5;

    v2 = (void *)sFallbackDefaultURLFromPrefs;
  }
  return (NSURL *)v2;
}

- (ICNAServerEnvironment)init
{
  v16.receiver = self;
  v16.super_class = (Class)ICNAServerEnvironment;
  v2 = [(ICNAServerEnvironment *)&v16 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    -[ICNAServerEnvironment setServerEnvironmentType:](v2, "setServerEnvironmentType:", (char)[v3 integerForKey:@"analyticsInternalServerEnvironmentType"]);

    switch([(ICNAServerEnvironment *)v2 serverEnvironmentType])
    {
      case 0:
      case 5:
        v4 = [(ICNAServerEnvironment *)v2 fallbackDefaultTargetURL];
        [(ICNAServerEnvironment *)v2 setTargetURL:v4];

        [(ICNAServerEnvironment *)v2 setAaEndPointTypeName:@"mobilenotes-production"];
        objc_initWeak(&location, v2);
        uint64_t v5 = dispatch_get_global_queue(17, 0);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __29__ICNAServerEnvironment_init__block_invoke;
        v13[3] = &unk_1E64B8D48;
        objc_copyWeak(&v14, &location);
        dispatch_async(v5, v13);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
        break;
      case 1:
        v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://devel.notes-analytics-events.newsapps.apple.com/analyticseventsv2/async"];
        [(ICNAServerEnvironment *)v2 setTargetURL:v6];

        v7 = @"mobilenotes-dev";
        goto LABEL_8;
      case 2:
        v8 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://qa.notes-analytics-events.newsapps.apple.com/analyticseventsv2/async"];
        [(ICNAServerEnvironment *)v2 setTargetURL:v8];

        v7 = @"mobilenotes-qa";
        goto LABEL_8;
      case 3:
        v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://test.notes-analytics-events.newsapps.apple.com/analyticseventsv2/async"];
        [(ICNAServerEnvironment *)v2 setTargetURL:v9];

        v7 = @"mobilenotes-test";
        goto LABEL_8;
      case 4:
        v10 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://staging.notes-analytics-events.newsapps.apple.com/analyticseventsv2/async"];
        [(ICNAServerEnvironment *)v2 setTargetURL:v10];

        v7 = @"mobilenotes-staging";
LABEL_8:
        [(ICNAServerEnvironment *)v2 setAaEndPointTypeName:v7];
        break;
      default:
        break;
    }
    v11 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(ICNAServerEnvironment *)v2 init];
    }
  }
  return v2;
}

void __29__ICNAServerEnvironment_init__block_invoke(uint64_t a1)
{
  v2 = +[ICNAServerEnvironment defaultAMSBag];
  v3 = [v2 URLForKey:@"app-analytics-url"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__ICNAServerEnvironment_init__block_invoke_2;
  v4[3] = &unk_1E64B8FA0;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  [v3 valueWithCompletion:v4];
  objc_destroyWeak(&v5);
}

void __29__ICNAServerEnvironment_init__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setTargetURL:v6];

    v9 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
    [v9 setURL:v6 forKey:@"analyticsFallbackDefaultURL"];

    uint64_t v10 = [v6 copy];
    v11 = (void *)sFallbackDefaultURLFromPrefs;
    sFallbackDefaultURLFromPrefs = v10;
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __29__ICNAServerEnvironment_init__block_invoke_2_cold_1((uint64_t)v7, v12);
    }
  }
}

- (id)fallbackDefaultTargetURL
{
  v2 = [(ICNAServerEnvironment *)self targetURL];
  if (!v2)
  {
    v2 = [(id)objc_opt_class() fallbackDefaultTargetURLFromPrefs];
    if (!v2)
    {
      v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://notes-analytics-events.apple.com/analyticseventsv2/async"];
    }
  }
  return v2;
}

+ (id)defaultAMSBag
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ICNAServerEnvironment_defaultAMSBag__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultAMSBag_onceToken != -1) {
    dispatch_once(&defaultAMSBag_onceToken, block);
  }
  v2 = (void *)defaultAMSBag_defaultBag;
  return v2;
}

uint64_t __38__ICNAServerEnvironment_defaultAMSBag__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F4DBE0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "ic_defaultBagKeySet");
  [v1 registerBagKeySet:v2 forProfile:@"Notes" profileVersion:@"1"];

  defaultAMSBag_defaultBag = [MEMORY[0x1E4F4DBD8] bagForProfile:@"Notes" profileVersion:@"1"];
  return MEMORY[0x1F41817F8]();
}

+ (id)ic_defaultBagKeySet
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4DD98]);
  [v2 addBagKey:@"app-analytics-url" valueType:5];
  v3 = (void *)[v2 copy];

  return v3;
}

- (char)serverEnvironmentType
{
  return self->_serverEnvironmentType;
}

- (void)setServerEnvironmentType:(char)a3
{
  self->_serverEnvironmentType = a3;
}

- (NSURL)targetURL
{
  return self->_targetURL;
}

- (void)setTargetURL:(id)a3
{
}

- (NSString)aaEndPointTypeName
{
  return self->_aaEndPointTypeName;
}

- (void)setAaEndPointTypeName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaEndPointTypeName, 0);
  objc_storeStrong((id *)&self->_targetURL, 0);
}

- (void)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 targetURL];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_1C3EAD000, a2, OS_LOG_TYPE_DEBUG, "Analytics Server URL is %@", (uint8_t *)&v4, 0xCu);
}

void __29__ICNAServerEnvironment_init__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3EAD000, a2, OS_LOG_TYPE_ERROR, "No URL found for Upload Session Processor: %@", (uint8_t *)&v2, 0xCu);
}

@end