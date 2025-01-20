@interface OSASubmissionPolicy
- (BOOL)hasTasking;
- (BOOL)ignoreProxies;
- (NSDictionary)latestResults;
- (NSMutableDictionary)scanOptions;
- (OSASubmissionPolicy)init;
- (OSASubmissionPolicy)initWithTemplate:(id)a3 options:(id)a4;
- (id)_loadPreviousResults;
- (id)buildSubmissionTemplateForConfig:(id)a3;
- (id)shouldSubmitRouting:(id)a3;
- (void)persist;
- (void)registerRouting:(id)a3 result:(BOOL)a4;
- (void)setIgnoreProxies:(BOOL)a3;
@end

@implementation OSASubmissionPolicy

- (OSASubmissionPolicy)init
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)OSASubmissionPolicy;
  v2 = [(OSASubmissionPolicy *)&v32 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(OSASubmissionPolicy *)v2 _loadPreviousResults];
    results = v3->_results;
    v3->_results = (NSMutableDictionary *)v4;

    if (!v3->_results)
    {
      uint64_t v6 = objc_opt_new();
      v7 = v3->_results;
      v3->_results = (NSMutableDictionary *)v6;
    }
    uint64_t v8 = objc_opt_new();
    allowOptOutByRouting = v3->_allowOptOutByRouting;
    v3->_allowOptOutByRouting = (NSMutableSet *)v8;

    uint64_t v10 = objc_opt_new();
    scanOptions = v3->_scanOptions;
    v3->_scanOptions = (NSMutableDictionary *)v10;

    v12 = [MEMORY[0x1E4F83948] sharedInstance];
    v13 = [v12 submissionParam:@"templates"];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"default"];
    default_template = v3->_default_template;
    v3->_default_template = (NSArray *)v14;

    objc_storeStrong((id *)&v3->_primary_template, v3->_default_template);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v16 = v3->_default_template;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v22 = [v21 objectForKeyedSubscript:@"policy"];
          v23 = [v22 objectForKeyedSubscript:@"allow-optout"];
          int v24 = [v23 BOOLValue];

          if (v24)
          {
            v25 = v3->_allowOptOutByRouting;
            v26 = [v21 objectForKeyedSubscript:@"routing"];
            [(NSMutableSet *)v25 addObject:v26];
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v18);
    }
  }
  return v3;
}

- (OSASubmissionPolicy)initWithTemplate:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(OSASubmissionPolicy *)self init];
  v9 = v8;
  if (v6 && v8)
  {
    if (([v6 isEqualToString:@"default"] & 1) == 0)
    {
      uint64_t v10 = [MEMORY[0x1E4F83948] sharedInstance];
      v11 = [v10 submissionParam:@"templates"];
      uint64_t v12 = [v11 objectForKeyedSubscript:v6];
      primary_template = v9->_primary_template;
      v9->_primary_template = (NSArray *)v12;
    }
    uint64_t v14 = [v7 objectForKeyedSubscript:@"logs"];
    specific_files = v9->_specific_files;
    v9->_specific_files = (NSArray *)v14;

    uint64_t v16 = [v7 objectForKeyedSubscript:@"submission_info"];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v16;

    uint64_t v18 = [v7 objectForKeyedSubscript:@"prefaces"];
    prefaces = v9->_prefaces;
    v9->_prefaces = (NSDictionary *)v18;
  }
  return v9;
}

- (id)_loadPreviousResults
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  v3 = [MEMORY[0x1E4F83948] sharedInstance];
  uint64_t v4 = [v3 pathDiagnostics];
  v5 = [v4 stringByAppendingPathComponent:@"com.apple.osanalytics.submissionStatus.plist"];
  id v6 = [v2 dictionaryWithContentsOfFile:v5];
  id v7 = (void *)[v6 mutableCopy];

  return v7;
}

- (void)persist
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not safely open submission results path: %@", (uint8_t *)&v1, 0xCu);
}

void __30__OSASubmissionPolicy_persist__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:a2 closeOnDealloc:0];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id obj = 0;
  [v3 writeData:v4 error:&obj];
  objc_storeStrong(v5, obj);
}

- (NSDictionary)latestResults
{
  return (NSDictionary *)self->_results;
}

- (id)shouldSubmitRouting:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F83948] sharedInstance];
  if ([v5 optInApple])
  {

LABEL_4:
    id v7 = &stru_1F360EEC0;
    goto LABEL_8;
  }
  char v6 = [(NSMutableSet *)self->_allowOptOutByRouting containsObject:v4];

  if (v6) {
    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ignoring %{public}@ during Opt-OUT", (uint8_t *)&v11, 0xCu);
  }
  id v7 = @"opt-out";
LABEL_8:
  if ([(__CFString *)v7 length]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (id)buildSubmissionTemplateForConfig:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v30 = [MEMORY[0x1E4F83950] getAvailableTaskingRoutings];
  self->_hasTasking = 0;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = v4;
  int v6 = [v4 isProxy];
  uint64_t v7 = 16;
  if (v6) {
    uint64_t v7 = 8;
  }
  id v8 = *(id *)((char *)&self->super.isa + v7);
  objc_super v32 = objc_opt_new();
  v33 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v9 = (NSArray *)v8;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v34 objects:v46 count:16];
  id v31 = v5;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v15 = [v14 objectForKeyedSubscript:@"routing"];
        uint64_t v16 = (void *)[v14 mutableCopy];
        uint64_t v17 = [(OSASubmissionPolicy *)self shouldSubmitRouting:v15];
        if ([v17 length])
        {
          [v16 setObject:v17 forKeyedSubscript:@"<inactive>"];
          uint64_t v18 = v33;
        }
        else
        {
          if ([v30 containsObject:v15]) {
            self->_hasTasking = 1;
          }
          if (v9 != self->_default_template)
          {
            if (self->_specific_files)
            {
              uint64_t v19 = [v16 objectForKeyedSubscript:@"extensions"];
              uint64_t v20 = [v19 count];

              if (!v20)
              {
                [v16 setObject:self->_identifier forKeyedSubscript:@"submission_info"];
                [v16 setObject:self->_specific_files forKeyedSubscript:@"logs"];
                specific_files = self->_specific_files;
                self->_specific_files = 0;
              }
            }
          }
          v22 = [(NSDictionary *)self->_prefaces objectForKeyedSubscript:v15];

          v5 = v31;
          uint64_t v18 = v32;
          if (v22)
          {
            v23 = [(NSDictionary *)self->_prefaces objectForKeyedSubscript:v15];
            [v16 setObject:v23 forKeyedSubscript:@"<preface>"];

            uint64_t v18 = v32;
          }
        }
        [v18 addObject:v15];
        [v5 addObject:v16];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v11);
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    if ([v29 isProxy]) {
      int v24 = @"proxy";
    }
    else {
      int v24 = @"primary";
    }
    if (v9 == self->_default_template) {
      v25 = @"default";
    }
    else {
      v25 = @"custom";
    }
    v26 = [v32 componentsJoinedByString:@", "];
    v27 = [v33 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138413058;
    v39 = v24;
    __int16 v40 = 2112;
    v41 = v25;
    __int16 v42 = 2112;
    v43 = v26;
    __int16 v44 = 2112;
    v45 = v27;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "submission template '%@:%@' includes [%@]; excludes [%@]",
      buf,
      0x2Au);
  }
  return v31;
}

- (void)registerRouting:(id)a3 result:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = (__CFString *)a3;
  int v6 = [(NSMutableSet *)self->_allowOptOutByRouting containsObject:v13];
  uint64_t v7 = @"default";
  if (v6) {
    uint64_t v7 = v13;
  }
  id v8 = v7;
  v9 = [(NSMutableDictionary *)self->_results objectForKeyedSubscript:v8];
  if (v9)
  {
    uint64_t v10 = v9;
    if (v4) {
      [v9 removeObjectForKey:@"attempt"];
    }
  }
  else
  {
    uint64_t v10 = objc_opt_new();
    [(NSMutableDictionary *)self->_results setObject:v10 forKeyedSubscript:v8];
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  if (v4) {
    uint64_t v12 = @"success";
  }
  else {
    uint64_t v12 = @"attempt";
  }
  [v10 setObject:v11 forKeyedSubscript:v12];
}

- (BOOL)ignoreProxies
{
  return self->_ignoreProxies;
}

- (void)setIgnoreProxies:(BOOL)a3
{
  self->_ignoreProxies = a3;
}

- (BOOL)hasTasking
{
  return self->_hasTasking;
}

- (NSMutableDictionary)scanOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanOptions, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_prefaces, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_specific_files, 0);
  objc_storeStrong((id *)&self->_allowOptOutByRouting, 0);
  objc_storeStrong((id *)&self->_primary_template, 0);
  objc_storeStrong((id *)&self->_default_template, 0);
}

@end