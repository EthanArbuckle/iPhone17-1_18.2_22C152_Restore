@interface ICQNetworkThrottleController
- (BOOL)requestShouldThrottle:(id)a3;
- (ICQNetworkThrottleController)init;
- (NSUserDefaults)defaults;
- (void)request:(id)a3 didCompleteWithError:(id)a4;
- (void)setDefaults:(id)a3;
@end

@implementation ICQNetworkThrottleController

- (ICQNetworkThrottleController)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICQNetworkThrottleController;
  v2 = [(ICQNetworkThrottleController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.cloud.quota"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;
  }
  return v2;
}

- (BOOL)requestShouldThrottle:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = [a3 URL];
  v5 = [v4 absoluteString];

  if (v5)
  {
    objc_super v6 = [(ICQNetworkThrottleController *)self defaults];
    v7 = [v6 dictionaryForKey:@"ICQThrottleURLTable"];

    v8 = [v7 objectForKeyedSubscript:v5];
    [v8 timeIntervalSinceNow];
    double v10 = v9;
    v11 = _ICQGetLogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    BOOL v13 = v10 > 0.0;
    if (v10 <= 0.0)
    {
      if (v12)
      {
        int v19 = 138412290;
        v20 = v5;
        v15 = "Not throttling request for URL: %@";
        v16 = v11;
        uint32_t v17 = 12;
        goto LABEL_10;
      }
    }
    else if (v12)
    {
      [v8 timeIntervalSinceNow];
      int v19 = 138412546;
      v20 = v5;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      v15 = "Throttling request for URL: %@, throttle seconds remaining:%.0f";
      v16 = v11;
      uint32_t v17 = 22;
LABEL_10:
      _os_log_impl(&dword_1D5851000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, v17);
    }

    goto LABEL_12;
  }
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[ICQNetworkThrottleController requestShouldThrottle:](v7);
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (void)request:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 domain];
  if (v8 != @"com.apple.icloud.quota")
  {
    double v9 = 0;
LABEL_3:

    goto LABEL_11;
  }
  uint64_t v10 = [v7 code];

  if (v10 == 16)
  {
    v11 = [v7 userInfo];
    BOOL v12 = [v11 objectForKeyedSubscript:@"retryAfterDelay"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v14 = [v7 userInfo];
      v15 = [v14 objectForKeyedSubscript:@"retryAfterDelay"];
      uint64_t v16 = [v15 integerValue];

      double v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)v16];
    }
    else
    {
      double v9 = 0;
    }
    uint32_t v17 = [v7 userInfo];
    v18 = [v17 objectForKeyedSubscript:@"retryAfterDate"];
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if (v19)
    {
      v8 = [v7 userInfo];
      uint64_t v20 = [(__CFString *)v8 objectForKeyedSubscript:@"retryAfterDate"];

      double v9 = (void *)v20;
      goto LABEL_3;
    }
  }
  else
  {
    double v9 = 0;
  }
LABEL_11:
  __int16 v21 = _ICQGetLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [v6 URL];
    uint64_t v23 = [v22 absoluteString];
    int v31 = 138412546;
    v32 = v23;
    __int16 v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_1D5851000, v21, OS_LOG_TYPE_DEFAULT, "Updating throttle for %@, retry after: %@", (uint8_t *)&v31, 0x16u);
  }
  v24 = objc_opt_class();
  objc_sync_enter(v24);
  v25 = [(ICQNetworkThrottleController *)self defaults];
  v26 = [v25 dictionaryForKey:@"ICQThrottleURLTable"];
  v27 = (void *)[v26 mutableCopy];

  if (!v27) {
    v27 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  }
  v28 = [v6 URL];
  v29 = [v28 absoluteString];
  [v27 setObject:v9 forKeyedSubscript:v29];

  v30 = [(ICQNetworkThrottleController *)self defaults];
  [v30 setObject:v27 forKey:@"ICQThrottleURLTable"];

  objc_sync_exit(v24);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)requestShouldThrottle:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "Attempted to throttle request with no URL", v1, 2u);
}

@end