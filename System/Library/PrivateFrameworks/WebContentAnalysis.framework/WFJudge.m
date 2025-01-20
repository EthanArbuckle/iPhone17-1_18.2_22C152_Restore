@interface WFJudge
+ (id)defaultJudge;
+ (id)defaultLSMMapPath;
+ (void)defaultJudge;
- (WFJudge)initWithMap:(id)a3;
- (WFJudge)initWithMap:(id)a3 systemContentWhitelist:(id)a4;
- (id)_pronounceOnWebpage:(id)a3;
- (id)pronounceOnPageContent:(id)a3 pageURL:(id)a4 debugPage:(id *)a5 pageTitle:(id *)a6;
- (id)pronounceOnPageContent:(id)a3 pageURL:(id)a4 whitelistUserPreferences:(id)a5 debugPage:(id *)a6 pageTitle:(id *)a7;
- (void)dealloc;
@end

@implementation WFJudge

+ (id)defaultLSMMapPath
{
  id result = (id)defaultLSMMapPath_result;
  if (!defaultLSMMapPath_result)
  {
    defaultLSMMapPath_id result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithPath:", @"/System/Library/PrivateFrameworks/WebContentAnalysis.framework"), "pathForResource:ofType:", @"content_filter_map3", 0);
    id v3 = (id)defaultLSMMapPath_result;
    return (id)defaultLSMMapPath_result;
  }
  return result;
}

+ (id)defaultJudge
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (gDefaultJudge)
  {
    id v2 = (id)gDefaultJudge;
    return (id)gDefaultJudge;
  }
  v5 = (void *)[MEMORY[0x263F08850] defaultManager];
  char v11 = 0;
  uint64_t v6 = [a1 defaultLSMMapPath];
  if ([v5 fileExistsAtPath:v6 isDirectory:&v11]) {
    BOOL v7 = v11 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    gDefaultJudge = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMap:", +[WFLSMMap mapFromFilePath:](WFLSMScoreNormalizedMap, "mapFromFilePath:", v6));
    v9 = __WFDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [a1 defaultLSMMapPath];
      *(_DWORD *)buf = 136446466;
      v13 = "+[WFJudge defaultJudge]";
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_217734000, v9, OS_LOG_TYPE_INFO, "%{public}s map:%@", buf, 0x16u);
    }
    return (id)gDefaultJudge;
  }
  v8 = __WFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    +[WFJudge defaultJudge];
  }
  return 0;
}

- (WFJudge)initWithMap:(id)a3
{
  id v5 = +[WFSystemContentWhitelist defaultSystemWhitelist];
  return [(WFJudge *)self initWithMap:a3 systemContentWhitelist:v5];
}

- (WFJudge)initWithMap:(id)a3 systemContentWhitelist:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WFJudge;
  uint64_t v6 = [(WFJudge *)&v8 init];
  if (v6)
  {
    v6->map = (WFLSMMap *)a3;
    v6->whitelist = (WFSystemContentWhitelist *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WFJudge;
  [(WFJudge *)&v3 dealloc];
}

- (id)_pronounceOnWebpage:(id)a3
{
  id v5 = (id)objc_opt_new();
  if ([a3 selfRestricted])
  {
    [v5 setRestricted:1];
    [v5 setEvidence:3];
    uint64_t v6 = @"SELF-RESTRICTED";
LABEL_9:
    [v5 setMessage:v6];
    return v5;
  }
  unsigned int v17 = 0;
  uint64_t v16 = 0;
  if (![a3 isWorthAnalyzingWithEvidence:&v17 message:&v16])
  {
LABEL_8:
    [v5 setRestricted:0];
    [v5 setEvidence:v17];
    uint64_t v6 = (__CFString *)[NSString stringWithFormat:@"Page not analyzed: %@", v16];
    goto LABEL_9;
  }
  uint64_t v7 = [a3 URLString];
  if (v7)
  {
    uint64_t v8 = [NSURL URLWithString:v7];
    if (v8)
    {
      uint64_t v9 = v8;
      if ([(WFSystemContentWhitelist *)self->whitelist isURLWhitelisted:v8])
      {
        unsigned int v17 = 1;
        uint64_t v16 = [NSString stringWithFormat:@"URL (%@) is known-clean", v9];
        goto LABEL_8;
      }
    }
  }
  id v11 = -[WFLSMMap evaluate:](self->map, "evaluate:", [a3 plainText]);
  uint64_t v12 = [v11 isRestricted];
  if (v12) {
    v13 = @"RESTRICTED";
  }
  else {
    v13 = @" Allowed  ";
  }
  __int16 v14 = (void *)[MEMORY[0x263F089D8] stringWithString:v13];
  uint64_t v15 = v14;
  if (v16) {
    [v14 appendFormat:@" %@", v16];
  }
  [v5 setMessage:v15];
  [v5 setRestricted:v12];
  [v5 setLSMEvaluationResult:v11];
  [v5 setEvidence:0];
  return v5;
}

- (id)pronounceOnPageContent:(id)a3 pageURL:(id)a4 debugPage:(id *)a5 pageTitle:(id *)a6
{
  if (a3)
  {
    id v9 = +[WFWebPageDecorator webPageWithString:URLString:](WFWebPageToFilterText, "webPageWithString:URLString:", a3, a4, a5);
    id v10 = v9;
    if (a6) {
      *a6 = (id)[v9 pageTitle];
    }
    if (v10)
    {
      id v11 = [(WFJudge *)self _pronounceOnWebpage:v10];
      [v11 setURL:a4];
      return v11;
    }
    v13 = NSString;
    __int16 v14 = @"Allowed, nil webpage";
  }
  else
  {
    v13 = NSString;
    __int16 v14 = @"Allowed, nil pageContentString";
  }
  uint64_t v15 = objc_msgSend(v13, "stringWithFormat:", v14, a4, a5, a6);
  return +[WFVerdict verdictWithRestriction:0 URL:a4 evidence:2 LSMEvaluationResult:0 message:v15];
}

- (id)pronounceOnPageContent:(id)a3 pageURL:(id)a4 whitelistUserPreferences:(id)a5 debugPage:(id *)a6 pageTitle:(id *)a7
{
  id v10 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  unsigned __int8 v22 = 1;
  if (a5)
  {
    int v12 = objc_msgSend(a5, "filterEnabled", a3, a4, a5, a6);
    if (v12) {
      LOBYTE(v12) = [a5 whitelistEnabled];
    }
    unsigned __int8 v22 = v12;
    id v13 = (id)[a5 pronounceOnPageURLString:a4 shouldFilter:&v22];
  }
  else
  {
    id v13 = 0;
  }
  __int16 v14 = __WFDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v13;
    _os_log_impl(&dword_217734000, v14, OS_LOG_TYPE_INFO, "whitelistVerdict: %@", buf, 0xCu);
  }
  if (v10) {
    id v10 = +[WFWebPageDecorator webPageWithString:v10 URLString:a4];
  }
  if (a7) {
    *a7 = (id)[v10 pageTitle];
  }
  if ([a4 hasPrefix:@"https://"])
  {
    if ([a5 alwaysAllowHTTPS])
    {
      uint64_t v15 = @"Always allow HTTPS";
LABEL_15:
      id v16 = a4;
      uint64_t v17 = 10;
      return +[WFVerdict verdictWithRestriction:0 URL:v16 evidence:v17 LSMEvaluationResult:0 message:v15];
    }
    if (v13
      && ([a5 whitelistEnabled] & 1) == 0
      && (![a5 filterEnabled] || objc_msgSend(v13, "evidence") != 8))
    {
      [v13 setMessage:@"https url but user has no whitelist restrictions"];
      uint64_t v15 = @"user has no whitelist restrictions";
      goto LABEL_15;
    }
  }
  else
  {
    int v18 = v22;
    v19 = __WFDefaultLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (!v13 || v18)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217734000, v19, OS_LOG_TYPE_INFO, "LSM analyzer used to evaluate page content", buf, 2u);
      }
      if (!v10)
      {
        uint64_t v15 = (__CFString *)[NSString stringWithFormat:@"Allowed, NULL pageContentString"];
        id v16 = a4;
        uint64_t v17 = 2;
        return +[WFVerdict verdictWithRestriction:0 URL:v16 evidence:v17 LSMEvaluationResult:0 message:v15];
      }
      id v13 = [(WFJudge *)self _pronounceOnWebpage:v10];
      [v13 setURL:a4];
    }
    else if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217734000, v19, OS_LOG_TYPE_INFO, "URL found in white/black list, no need to use the LSM analyzer...", buf, 2u);
    }
  }
  return v13;
}

+ (void)defaultJudge
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)objc_opt_class();
  int v6 = 138412546;
  uint64_t v7 = NSStringFromClass(v5);
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_217734000, a3, OS_LOG_TYPE_FAULT, "**** %@ -defaultJudge: LSM map was not found in %@", (uint8_t *)&v6, 0x16u);
}

@end