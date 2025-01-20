@interface VUIActionAppPunchout
- (BOOL)isSensitiveURL;
- (NSDictionary)metrics;
- (NSURL)punchoutURL;
- (VUIActionAppPunchout)initWithContextData:(id)a3 appContext:(id)a4;
- (VUIAppContext)appContext;
- (id)_addMusicAppMetricsToUrl:(id)a3;
- (void)_openPunchoutURL:(id)a3;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setAppContext:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation VUIActionAppPunchout

- (VUIActionAppPunchout)initWithContextData:(id)a3 appContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VUIActionAppPunchout;
  v8 = [(VUIActionAppPunchout *)&v15 init];
  if (v8
    && (objc_msgSend(v6, "vui_URLForKey:", @"openUrl"),
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    uint64_t v10 = objc_msgSend(v6, "vui_URLForKey:", @"openUrl");
    punchoutURL = v8->_punchoutURL;
    v8->_punchoutURL = (NSURL *)v10;

    uint64_t v12 = objc_msgSend(v6, "vui_dictionaryForKey:", @"metrics");
    metrics = v8->_metrics;
    v8->_metrics = (NSDictionary *)v12;

    v8->_isSensitiveURL = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", @"isSensitiveUrl", 0);
    objc_storeWeak((id *)&v8->_appContext, v7);
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, BOOL))a4;
  id v6 = [(VUIActionAppPunchout *)self punchoutURL];
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 absoluteString];
    int v9 = [v8 containsString:@"music.apple.com"];

    if (v9)
    {
      uint64_t v10 = [(VUIActionAppPunchout *)self _addMusicAppMetricsToUrl:v7];
    }
    else
    {
      uint64_t v10 = v7;
    }
    v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "VUIActionAppPunchout:: punching out to %@", (uint8_t *)&v12, 0xCu);
    }

    [(VUIActionAppPunchout *)self _openPunchoutURL:v10];
  }
  if (v5) {
    v5[2](v5, v7 != 0);
  }
}

- (id)_addMusicAppMetricsToUrl:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = +[VUIMetricsController sharedInstance];
  id v7 = [v6 lastRecordedPageEventData];

  if (v7)
  {
    v8 = [v7 pageId];
    int v9 = [v7 pageType];
    uint64_t v10 = [NSString stringWithFormat:@"%@_%@", v8, v9];
    objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v10, @"tvAppPage");
  }
  v11 = [(VUIActionAppPunchout *)self metrics];
  if (v11) {
    [v5 addEntriesFromDictionary:v11];
  }
  if ([v5 count])
  {
    uint64_t v12 = objc_msgSend(v4, "vui_URLByAddingQueryParamsDictionary:", v5);

    id v4 = (id)v12;
  }

  return v4;
}

- (void)_openPunchoutURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v5 resolvingAgainstBaseURL:0];
  id v7 = [v6 scheme];
  v8 = [v7 lowercaseString];
  char v9 = [v8 isEqualToString:@"https"];
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [v6 scheme];
    v3 = [v10 lowercaseString];
    if (![v3 isEqualToString:@"http"])
    {
      BOOL v15 = 0;
LABEL_10:

      goto LABEL_11;
    }
    v27 = v10;
  }
  id v11 = v5;
  uint64_t v12 = v6;
  v13 = [v6 host];
  uint64_t v14 = [v13 lowercaseString];
  if ([v14 isEqualToString:@"tv.apple.com"]) {
    BOOL v15 = +[VUIUtilities isTVApp];
  }
  else {
    BOOL v15 = 0;
  }

  id v6 = v12;
  id v5 = v11;
  uint64_t v10 = v27;
  if ((v9 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_11:

  if ([(VUIActionAppPunchout *)self isSensitiveURL])
  {
    v16 = @"<sensitive url>";
  }
  else
  {
    v16 = [v5 description];
  }
  v17 = VUIDefaultLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v34 = v16;
    __int16 v35 = 1024;
    BOOL v36 = v15;
    __int16 v37 = 1024;
    BOOL v38 = [(VUIActionAppPunchout *)self isSensitiveURL];
    _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "VUIActionAppPunchout:: open url: %@, punchoutToTVApp: %d, isSensitiveURL: %d", buf, 0x18u);
  }

  if (v15)
  {
    v18 = +[VUIInterfaceFactory sharedInstance];
    v19 = [v18 openURLHandler];
    v20 = [(VUIActionAppPunchout *)self appContext];
    v21 = +[VUITVAppLauncher sharedInstance];
    v22 = [v21 deeplinkCompletionHandler];
    [v19 processDeeplink:v5 appContext:v20 completion:v22];

    id v23 = +[VUIMetricsController sharedInstance];
    v24 = [v5 absoluteString];
    [v23 setExitEventDestinationUrl:v24];
  }
  else
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F224A0]);
    uint64_t v31 = *MEMORY[0x1E4F62688];
    uint64_t v32 = MEMORY[0x1E4F1CC38];
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [v23 setFrontBoardOptions:v25];

    [v23 setSensitive:self->_isSensitiveURL];
    v26 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __41__VUIActionAppPunchout__openPunchoutURL___block_invoke;
    v28[3] = &unk_1E6DF9DC0;
    v29 = v16;
    id v30 = v5;
    [v26 openURL:v30 configuration:v23 completionHandler:v28];

    v24 = v29;
  }
}

void __41__VUIActionAppPunchout__openPunchoutURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v11 = 138412802;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIActionAppPunchout:: open url: %@, result: %@, error: %@", (uint8_t *)&v11, 0x20u);
  }

  if (!v6)
  {
    char v9 = +[VUIMetricsController sharedInstance];
    uint64_t v10 = [*(id *)(a1 + 40) absoluteString];
    [v9 setExitEventDestinationUrl:v10];
  }
}

- (NSURL)punchoutURL
{
  return self->_punchoutURL;
}

- (BOOL)isSensitiveURL
{
  return self->_isSensitiveURL;
}

- (VUIAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (VUIAppContext *)WeakRetained;
}

- (void)setAppContext:(id)a3
{
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_punchoutURL, 0);
}

@end