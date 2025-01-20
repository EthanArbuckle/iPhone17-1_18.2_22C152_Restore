@interface MSNTTR
+ (id)sharedInstance;
- (BOOL)TTRInProgress;
- (BOOL)pendedTTR;
- (NSURL)url;
- (uint64_t)continueTTR;
- (void)beginTTRWithTitle:(id)a3;
- (void)beginTTRWithTitle:(id)a3 date:(id)a4;
- (void)completeTTR:(id)a3;
- (void)continueTTR;
- (void)handleCallback:(unint64_t)a3;
- (void)setPendedTTR:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation MSNTTR

+ (id)sharedInstance
{
  if (os_variant_allows_internal_security_policies())
  {
    if (sharedInstance_onceToken != -1) {
      dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
    }
    id v2 = (id)sharedInstance_ttr;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

uint64_t __24__MSNTTR_sharedInstance__block_invoke()
{
  sharedInstance_ttr = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (void)beginTTRWithTitle:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  [(MSNTTR *)self beginTTRWithTitle:v5 date:v6];
}

- (void)beginTTRWithTitle:(id)a3 date:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((os_variant_allows_internal_security_policies() & 1) == 0)
  {
    qword_1EAA9AC80 = (uint64_t)"TTR instance should not exist on customer build.";
    v29 = MSNLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[MSNTTR beginTTRWithTitle:date:](v29, v30, v31, v32, v33, v34, v35, v36);
    }
LABEL_21:

    abort();
  }
  v8 = +[MSNTTR sharedInstance];

  if (v8 != self)
  {
    qword_1EAA9AC80 = (uint64_t)"MSNTTR is a singleton.";
    v29 = MSNLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[MSNTTR beginTTRWithTitle:date:](v29, v37, v38, v39, v40, v41, v42, v43);
    }
    goto LABEL_21;
  }
  BOOL v9 = [(MSNTTR *)self TTRInProgress];
  v10 = MSNLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC736000, v10, OS_LOG_TYPE_INFO, "Suppressing TTR due to TTR already in progress.", buf, 2u);
    }
  }
  else
  {
    v44 = self;
    id v46 = v7;
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v6;
      _os_log_impl(&dword_1DC736000, v10, OS_LOG_TYPE_INFO, "Attemting TTR: %@", buf, 0xCu);
    }

    v10 = objc_alloc_init(MEMORY[0x1E4F28E58]);
    v12 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    [v10 formUnionWithCharacterSet:v12];

    [v10 removeCharactersInString:@"&"];
    id v13 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v13 setDateFormat:@"HH:mm:ss"];
    v14 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    [v13 setTimeZone:v14];

    v15 = NSString;
    [v6 stringByAddingPercentEncodingWithAllowedCharacters:v10];
    v17 = id v16 = v6;
    v18 = [@"MediaSafetyNet" stringByAddingPercentEncodingWithAllowedCharacters:v10];
    v19 = [@"all" stringByAddingPercentEncodingWithAllowedCharacters:v10];
    v20 = [@"1066524" stringByAddingPercentEncodingWithAllowedCharacters:v10];
    v21 = NSString;
    v22 = [v13 stringFromDate:v7];
    v45 = v16;
    v23 = [v21 stringWithFormat:@"The mic or camera was unexpectedly used on the home/lock screen. Describe what you were doing, especially whether you were intentionally recording. Say what apps you were using and whether you noticed any indicators (such as double-height status bar or pill). The recorded device state was:\n\n%@\n\nThe event occurred at: %@", v16, v22];
    v24 = [v23 stringByAddingPercentEncodingWithAllowedCharacters:v10];
    v25 = [v15 stringWithFormat:@"tap-to-radar://new?Title=%@&ComponentName=%@&ComponentVersion=%@&Reproducibility=Not%%20Applicable&ComponentID=%@&Classification=Crash/Hang/Data%%20Loss&Description=%@", v17, v18, v19, v20, v24];

    v26 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
    [(MSNTTR *)v44 setUrl:v26];

    v27 = MSNLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v25;
      _os_log_impl(&dword_1DC736000, v27, OS_LOG_TYPE_INFO, "TTR: %@", buf, 0xCu);
    }

    if (g_uiState == 1)
    {
      v28 = MSNLog();
      id v7 = v46;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DC736000, v28, OS_LOG_TYPE_INFO, "Delaying TTR due to lockscreen.", buf, 2u);
      }

      [(MSNTTR *)v44 setPendedTTR:1];
    }
    else
    {
      [(MSNTTR *)v44 continueTTR];
      id v7 = v46;
    }

    id v6 = v45;
  }
}

- (BOOL)TTRInProgress
{
  id v2 = [(MSNTTR *)self url];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)continueTTR
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC736000, log, OS_LOG_TYPE_ERROR, "Couldn't create runloop source", v1, 2u);
}

- (void)handleCallback:(unint64_t)a3
{
  id v5 = [(MSNTTR *)self url];
  [(MSNTTR *)self setUrl:0];
  CFPreferencesSetAppValue(@"MediaSafetyNetWaitingTTR", 0, @"com.apple.mediaserverd");
  CFPreferencesAppSynchronize(@"com.apple.mediaserverd");
  if (a3 == 1)
  {
    v8 = MSNLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC736000, v8, OS_LOG_TYPE_INFO, "User cancelled TTR.", buf, 2u);
    }
  }
  else if (a3 == 2)
  {
    id v6 = MSNLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC736000, v6, OS_LOG_TYPE_INFO, "User cancelled TTR and suppressed forever.", buf, 2u);
    }

    id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:31536000.0];
    CFPreferencesSetAppValue(@"MediaSafetyNetLastTTR", v7, @"com.apple.mediaserverd");

    CFPreferencesAppSynchronize(@"com.apple.mediaserverd");
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __25__MSNTTR_handleCallback___block_invoke;
    v9[3] = &unk_1E6CA0180;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

uint64_t __25__MSNTTR_handleCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTTR:*(void *)(a1 + 40)];
}

- (void)completeTTR:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = MSNLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1DC736000, v4, OS_LOG_TYPE_INFO, "Completing TTR: %@.", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v5 = (void *)getLSApplicationWorkspaceClass_softClass;
  uint64_t v11 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v13 = __getLSApplicationWorkspaceClass_block_invoke;
    v14 = &unk_1E6CA0270;
    v15 = &v8;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)&buf);
    id v5 = (void *)v9[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v8, 8);
  id v7 = objc_msgSend(v6, "defaultWorkspace", v8);
  [v7 openURL:v3 configuration:0 completionHandler:&__block_literal_global_57];
}

void __22__MSNTTR_completeTTR___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = MSNLog();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __22__MSNTTR_completeTTR___block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1DC736000, v7, OS_LOG_TYPE_INFO, "TTR done: %@.", (uint8_t *)&v14, 0xCu);
  }
}

- (BOOL)pendedTTR
{
  return self->_pendedTTR;
}

- (void)setPendedTTR:(BOOL)a3
{
  self->_pendedTTR = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)beginTTRWithTitle:(uint64_t)a3 date:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)beginTTRWithTitle:(uint64_t)a3 date:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (uint64_t)continueTTR
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[MSNTTR continueTTR](v0);
}

void __22__MSNTTR_completeTTR___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end