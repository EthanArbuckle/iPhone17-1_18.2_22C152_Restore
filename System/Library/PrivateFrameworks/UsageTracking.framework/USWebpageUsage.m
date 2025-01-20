@interface USWebpageUsage
+ (id)getProcessIdentifier;
- (BMSource)source;
- (BOOL)usageTrusted;
- (NSString)bundleIdentifier;
- (NSString)profileIdentifier;
- (NSString)uniqueIdentifier;
- (NSURL)URL;
- (USWebpageUsage)initWithURL:(id)a3;
- (USWebpageUsage)initWithURL:(id)a3 bundleIdentifier:(id)a4;
- (USWebpageUsage)initWithURL:(id)a3 bundleIdentifier:(id)a4 auditToken:(id *)a5;
- (USWebpageUsage)initWithURL:(id)a3 bundleIdentifier:(id)a4 profileIdentifier:(id)a5;
- (USWebpageUsage)initWithURL:(id)a3 context:(id)a4 eventStorage:(id)a5 source:(id)a6 bundleIdentifier:(id)a7 profileIdentifier:(id)a8 usageTrusted:(BOOL)a9;
- (_CDAsyncLocalContext)context;
- (_DKKnowledgeSaving)eventStorage;
- (id)description;
- (int)state;
- (void)changeState:(int64_t)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)setState:(int)a3;
@end

@implementation USWebpageUsage

- (USWebpageUsage)initWithURL:(id)a3 context:(id)a4 eventStorage:(id)a5 source:(id)a6 bundleIdentifier:(id)a7 profileIdentifier:(id)a8 usageTrusted:(BOOL)a9
{
  id v38 = a4;
  id v37 = a5;
  id v36 = a6;
  v16 = (__CFString *)a7;
  v39.receiver = self;
  v39.super_class = (Class)USWebpageUsage;
  id v17 = a8;
  id v18 = a3;
  v19 = [(USWebpageUsage *)&v39 init];
  v20 = objc_opt_new();
  v21 = [v20 normalizeURL:v18];

  uint64_t v22 = [v21 copy];
  URL = v19->_URL;
  v19->_URL = (NSURL *)v22;

  v24 = objc_opt_new();
  uint64_t v25 = [v24 UUIDString];
  uniqueIdentifier = v19->_uniqueIdentifier;
  v19->_uniqueIdentifier = (NSString *)v25;

  uint64_t v27 = [v17 copy];
  profileIdentifier = v19->_profileIdentifier;
  v19->_profileIdentifier = (NSString *)v27;

  objc_storeStrong((id *)&v19->_context, a4);
  objc_storeStrong((id *)&v19->_eventStorage, a5);
  objc_storeStrong((id *)&v19->_source, a6);
  v19->_state = 0;
  v19->_usageTrusted = a9;
  uint64_t v29 = objc_opt_new();
  contextUsageRecord = v19->_contextUsageRecord;
  v19->_contextUsageRecord = (NSMutableDictionary *)v29;

  v31 = +[USWebpageUsage getProcessIdentifier];
  v32 = v31;
  if (!v16) {
    v16 = v31;
  }
  if ([v32 isEqualToString:@"com.apple.SafariViewService"])
  {

    v16 = @"com.apple.mobilesafari";
  }
  uint64_t v33 = [(__CFString *)v16 copy];
  bundleIdentifier = v19->_bundleIdentifier;
  v19->_bundleIdentifier = (NSString *)v33;

  return v19;
}

- (USWebpageUsage)initWithURL:(id)a3 bundleIdentifier:(id)a4 auditToken:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = +[USUsageTrust validateTrustForSecTask:0];
  v10 = [MEMORY[0x263F351B8] userContext];
  v11 = [MEMORY[0x263F350B8] userKnowledgeStore];
  v12 = BiomeLibrary();
  v13 = [v12 App];
  v14 = [v13 WebUsage];
  v15 = [v14 source];
  LOBYTE(v18) = v9;
  v16 = [(USWebpageUsage *)self initWithURL:v8 context:v10 eventStorage:v11 source:v15 bundleIdentifier:v7 profileIdentifier:0 usageTrusted:v18];

  return v16;
}

- (USWebpageUsage)initWithURL:(id)a3 bundleIdentifier:(id)a4 profileIdentifier:(id)a5
{
  uint64_t v8 = initWithURL_bundleIdentifier_profileIdentifier__onceToken;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if (v8 != -1) {
    dispatch_once(&initWithURL_bundleIdentifier_profileIdentifier__onceToken, &__block_literal_global_4);
  }
  v12 = [MEMORY[0x263F351B8] userContext];
  v13 = [MEMORY[0x263F350B8] userKnowledgeStore];
  v14 = BiomeLibrary();
  v15 = [v14 App];
  v16 = [v15 WebUsage];
  id v17 = [v16 source];
  LOBYTE(v20) = initWithURL_bundleIdentifier_profileIdentifier__trusted;
  uint64_t v18 = [(USWebpageUsage *)self initWithURL:v11 context:v12 eventStorage:v13 source:v17 bundleIdentifier:v10 profileIdentifier:v9 usageTrusted:v20];

  return v18;
}

BOOL __65__USWebpageUsage_initWithURL_bundleIdentifier_profileIdentifier___block_invoke()
{
  BOOL result = +[USUsageTrust validateTrustForSecTask:0];
  initWithURL_bundleIdentifier_profileIdentifier__trusted = result;
  return result;
}

- (USWebpageUsage)initWithURL:(id)a3 bundleIdentifier:(id)a4
{
  return [(USWebpageUsage *)self initWithURL:a3 bundleIdentifier:a4 profileIdentifier:0];
}

- (USWebpageUsage)initWithURL:(id)a3
{
  return [(USWebpageUsage *)self initWithURL:a3 bundleIdentifier:0];
}

- (void)dealloc
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "Tried to create Duet event with start date %@ later than end date %@", v0, 0x16u);
}

void __25__USWebpageUsage_dealloc__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __25__USWebpageUsage_dealloc__block_invoke_cold_1(a1, (uint64_t)v5);
  }
}

- (id)description
{
  v3 = self->_contextUsageRecord;
  objc_sync_enter(v3);
  v4 = (void *)[(NSMutableDictionary *)self->_contextUsageRecord copy];
  objc_sync_exit(v3);

  id v5 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)USWebpageUsage;
  v6 = [(USWebpageUsage *)&v10 description];
  id v7 = [(USWebpageUsage *)self URL];
  uint64_t v8 = [v5 stringWithFormat:@"%@ %@ %@", v6, v7, v4];

  return v8;
}

+ (id)getProcessIdentifier
{
  MainBundle = CFBundleGetMainBundle();
  Identifier = (__CFString *)CFBundleGetIdentifier(MainBundle);
  if (Identifier)
  {
    v4 = Identifier;
  }
  else
  {
    id v5 = [MEMORY[0x263F08AB0] processInfo];
    v4 = [v5 processName];
  }
  return v4;
}

- (void)changeState:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v49 = a4;
  v48 = objc_opt_new();
  v51 = [(USWebpageUsage *)self URL];
  v50 = [v51 host];
  if (v50)
  {
    v47 = [MEMORY[0x263F351D0] appWebUsageType];
    v6 = self->_contextUsageRecord;
    objc_sync_enter(v6);
    obj = v6;
    id v7 = [(NSMutableDictionary *)self->_contextUsageRecord objectForKeyedSubscript:v47];
    unint64_t v8 = 0x263F35000;
    v43 = v7;
    switch(a3)
    {
      case 0:
        if (v7)
        {
          v45 = (void *)[(NSMutableDictionary *)self->_contextUsageRecord copy];
          [(NSMutableDictionary *)self->_contextUsageRecord removeAllObjects];
          id v9 = 0;
        }
        else
        {
          id v9 = 0;
          v45 = 0;
        }
        char v11 = 1;
        uint64_t v10 = 1;
        goto LABEL_26;
      case 1:
        if (v7)
        {
          if (![v7 integerValue])
          {
            id v9 = 0;
            v45 = 0;
            uint64_t v10 = 2;
            goto LABEL_18;
          }
          v45 = (void *)[(NSMutableDictionary *)self->_contextUsageRecord copy];
          char v11 = 0;
        }
        else
        {
          char v11 = 0;
          v45 = 0;
        }
        uint64_t v10 = 2;
        id v9 = &unk_26C98EC18;
        goto LABEL_26;
      case 2:
        if (v7)
        {
          if ([v7 integerValue] == 1)
          {
            id v9 = 0;
            v45 = 0;
            uint64_t v10 = 3;
LABEL_18:
            char v11 = 1;
LABEL_26:
            v46 = [(USWebpageUsage *)self bundleIdentifier];
            v42 = v9;
            v12 = [(USWebpageUsage *)self profileIdentifier];
            v13 = objc_msgSend(NSNumber, "numberWithBool:", -[USWebpageUsage usageTrusted](self, "usageTrusted"));
            if ([(USWebpageUsage *)self state] != v10)
            {
              id v14 = objc_alloc(MEMORY[0x263F29FD8]);
              v15 = [(USWebpageUsage *)self uniqueIdentifier];
              id v16 = v51;
              id v17 = [v16 absoluteString];
              uint64_t v18 = v17;
              if (v17)
              {
                id v19 = v17;
              }
              else
              {
                id v19 = [v16 relativeString];
              }
              uint64_t v20 = v19;

              v21 = (void *)[v14 initWithUniqueID:v15 absoluteTimestamp:v48 usageState:v10 webpageURL:v20 webDomain:v50 applicationID:v46 deviceID:0 isUsageTrusted:v13 safariProfileID:v12];
              uint64_t v22 = [(USWebpageUsage *)self source];
              [v22 sendEvent:v21];

              [(USWebpageUsage *)self setState:v10];
              unint64_t v8 = 0x263F35000uLL;
            }
            if (v11)
            {
              v23 = 0;
            }
            else
            {
              v24 = [*(id *)(v8 + 464) appWebUsageWepageURL];
              uint64_t v25 = [*(id *)(v8 + 464) appWebUsageWebDomain];
              v26 = [*(id *)(v8 + 464) appWebUsageStartDate];
              uint64_t v27 = [*(id *)(v8 + 464) appWebUsageBundleID];
              unint64_t v28 = v8;
              uint64_t v29 = (void *)v27;
              uint64_t v30 = [*(id *)(v28 + 464) isUsageTrusted];
              v31 = (void *)v30;
              if (v12)
              {
                v32 = [MEMORY[0x263F351D0] appUsageSafariProfileID];
                v63[0] = v24;
                v63[1] = v25;
                v64[0] = v51;
                v64[1] = v50;
                v63[2] = v47;
                v63[3] = v26;
                v64[2] = v42;
                v64[3] = v48;
                v63[4] = v29;
                v63[5] = v32;
                v64[4] = v46;
                v64[5] = v12;
                v63[6] = v31;
                v64[6] = v13;
                v23 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:7];
              }
              else
              {
                v65[0] = v24;
                v65[1] = v25;
                v66[0] = v51;
                v66[1] = v50;
                v65[2] = v47;
                v65[3] = v26;
                v66[2] = v42;
                v66[3] = v48;
                v65[4] = v29;
                v65[5] = v30;
                v66[4] = v46;
                v66[5] = v13;
                v23 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:6];
              }
              [(NSMutableDictionary *)self->_contextUsageRecord setDictionary:v23];
            }
            objc_sync_exit(obj);

            if (v45)
            {
              v54[0] = MEMORY[0x263EF8330];
              v54[1] = 3221225472;
              v54[2] = __48__USWebpageUsage_changeState_completionHandler___block_invoke;
              v54[3] = &unk_26431E888;
              id v33 = v45;
              id v55 = v33;
              id v56 = v48;
              v57 = self;
              id v58 = v49;
              v34 = (void *)MEMORY[0x21D469350](v54);
              v35 = [(USWebpageUsage *)self context];
              if (v23)
              {
                v62 = v23;
                id v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
                id v61 = v33;
                id v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
                id v38 = [MEMORY[0x263F351D0] keyPathForAppWebUsageDataDictionaries];
                [v35 addObjects:v36 andRemoveObjects:v37 fromArrayAtKeyPath:v38 responseQueue:0 withCompletion:v34];
              }
              else
              {
                id v60 = v33;
                id v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
                id v37 = [MEMORY[0x263F351D0] keyPathForAppWebUsageDataDictionaries];
                [v35 removeObjects:v36 fromArrayAtKeyPath:v37 responseQueue:0 withCompletion:v34];
              }
            }
            else if (v23)
            {
              objc_super v39 = [(USWebpageUsage *)self context];
              v59 = v23;
              v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
              v41 = [MEMORY[0x263F351D0] keyPathForAppWebUsageDataDictionaries];
              v52[0] = MEMORY[0x263EF8330];
              v52[1] = 3221225472;
              v52[2] = __48__USWebpageUsage_changeState_completionHandler___block_invoke_3;
              v52[3] = &unk_26431E8B0;
              id v53 = v49;
              [v39 addObjects:v40 toArrayAtKeyPath:v41 responseQueue:0 withCompletion:v52];
            }
            else if (v49)
            {
              (*((void (**)(id, void))v49 + 2))(v49, 0);
            }

            goto LABEL_45;
          }
          v45 = (void *)[(NSMutableDictionary *)self->_contextUsageRecord copy];
          char v11 = 0;
        }
        else
        {
          char v11 = 0;
          v45 = 0;
        }
        uint64_t v10 = 3;
        id v9 = &unk_26C98EC30;
        goto LABEL_26;
    }
    id v9 = 0;
    uint64_t v10 = 0;
    v45 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138739971;
    v68 = v51;
    _os_log_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "No hostname for URL %{sensitive}@", buf, 0xCu);
  }
  if (v49) {
    (*((void (**)(id, void))v49 + 2))(v49, 0);
  }
LABEL_45:
}

void __48__USWebpageUsage_changeState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  v4 = [MEMORY[0x263F351D0] appWebUsageWepageURL];
  id v5 = [MEMORY[0x263F351D0] appWebUsageWebDomain];
  v6 = [MEMORY[0x263F351D0] appWebUsageType];
  v44 = [MEMORY[0x263F351D0] isUsageTrusted];
  uint64_t v7 = [MEMORY[0x263F351D0] appWebUsageStartDate];
  uint64_t v8 = [MEMORY[0x263F351D0] appWebUsageBundleID];
  uint64_t v9 = [MEMORY[0x263F351D0] appUsageSafariProfileID];
  uint64_t v10 = [MEMORY[0x263F35080] webpageURL];
  v43 = [MEMORY[0x263F35080] webDomain];
  v42 = [MEMORY[0x263F35080] usageType];
  v40 = [MEMORY[0x263F35080] safariProfileID];
  v41 = [MEMORY[0x263F35080] isUsageTrusted];
  uint64_t v11 = [MEMORY[0x263F35148] appWebUsageStream];
  objc_super v39 = (void *)v7;
  id v36 = [v2 objectForKeyedSubscript:v7];
  id v38 = (void *)v8;
  v12 = (void *)v11;
  if ([v36 compare:v3] == 1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT))
    {
      -[USWebpageUsage dealloc]();
      v15 = v36;
      v13 = 0;
      id v14 = (void *)v9;
      uint64_t v16 = a1;
    }
    else
    {
      v13 = 0;
      id v14 = (void *)v9;
      v15 = v36;
      uint64_t v16 = a1;
    }
  }
  else
  {
    id v34 = v3;
    v35 = v6;
    id v17 = (void *)MEMORY[0x263F35058];
    uint64_t v18 = [v2 objectForKeyedSubscript:v8];
    uint64_t v30 = [v17 withBundle:v18];

    v31 = (void *)v9;
    id v19 = [v2 objectForKeyedSubscript:v9];
    v32 = v5;
    id v33 = v4;
    if (v19)
    {
      v48 = v10;
      uint64_t v20 = [v2 objectForKeyedSubscript:v4];
      id v53 = v20;
      id v49 = v43;
      v21 = [v2 objectForKeyedSubscript:v5];
      v54 = v21;
      v50 = v42;
      uint64_t v22 = [v2 objectForKeyedSubscript:v35];
      id v55 = v22;
      id v56 = v19;
      v51 = v40;
      v52 = v41;
      v23 = [v2 objectForKeyedSubscript:v44];
      v57 = v23;
      v24 = NSDictionary;
      uint64_t v25 = 5;
    }
    else
    {
      v48 = v10;
      uint64_t v20 = [v2 objectForKeyedSubscript:v4];
      id v53 = v20;
      id v49 = v43;
      v21 = [v2 objectForKeyedSubscript:v5];
      v54 = v21;
      v50 = v42;
      uint64_t v22 = [v2 objectForKeyedSubscript:v35];
      id v55 = v22;
      v51 = v41;
      v23 = [v2 objectForKeyedSubscript:v44];
      id v56 = v23;
      v24 = NSDictionary;
      uint64_t v25 = 4;
    }
    v26 = [v24 dictionaryWithObjects:&v53 forKeys:&v48 count:v25];
    uint64_t v16 = a1;

    id v3 = v34;
    v13 = [MEMORY[0x263F35088] eventWithStream:v12 startDate:v36 endDate:v34 value:v30 metadata:v26];

    v15 = v36;
    id v5 = v32;
    v4 = v33;
    v6 = v35;
    id v14 = v31;
  }

  if (v13)
  {
    uint64_t v27 = [*(id *)(v16 + 48) eventStorage];
    v47 = v13;
    unint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __48__USWebpageUsage_changeState_completionHandler___block_invoke_2;
    v45[3] = &unk_26431E860;
    id v46 = *(id *)(v16 + 56);
    [v27 saveObjects:v28 responseQueue:0 withCompletion:v45];
  }
  else
  {
    uint64_t v29 = *(void *)(v16 + 56);
    if (v29) {
      (*(void (**)(uint64_t, void))(v29 + 16))(v29, 0);
    }
  }
}

uint64_t __48__USWebpageUsage_changeState_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

uint64_t __48__USWebpageUsage_changeState_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)usageTrusted
{
  return self->_usageTrusted;
}

- (_CDAsyncLocalContext)context
{
  return (_CDAsyncLocalContext *)objc_getProperty(self, a2, 56, 1);
}

- (_DKKnowledgeSaving)eventStorage
{
  return (_DKKnowledgeSaving *)objc_getProperty(self, a2, 64, 1);
}

- (BMSource)source
{
  return (BMSource *)objc_getProperty(self, a2, 72, 1);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_eventStorage, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_contextUsageRecord, 0);
}

void __25__USWebpageUsage_dealloc__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138740483;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to reset web page usage to not-in-use on dealloc for URL %{sensitive}@ and bundle identifier %@ with error: %@", (uint8_t *)&v4, 0x20u);
}

@end