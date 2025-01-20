@interface ICManager
+ (ICManager)sharedManager;
- (BOOL)allowsOpeningFromBackground;
- (BOOL)enteringForeground;
- (BOOL)handleIncomingRequest:(id)a3;
- (BOOL)handleOpenURL:(id)a3 fromSourceApplication:(id)a4 errorHandler:(id)a5;
- (BOOL)handleOpenURL:(id)a3 fromSourceApplication:(id)a4 errorHandler:(id)a5 postNotification:(BOOL)a6;
- (BOOL)resignedActiveWhileOpeningURL;
- (ICManager)init;
- (ICScheme)callbackScheme;
- (NSDistributedNotificationCenter)notificationCenter;
- (NSLock)queueLock;
- (NSMutableArray)queuedRequests;
- (id)popQueuedRequest;
- (void)_performRequest:(id)a3;
- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4;
- (void)dealloc;
- (void)handleOpenURLRequestNotification:(id)a3;
- (void)performQueuedRequestIfApplicable;
- (void)performRequest:(id)a3;
- (void)queueRequest:(id)a3;
- (void)registerHandler:(id)a3 forIncomingRequestsWithAction:(id)a4 legacyAction:(id)a5 scheme:(id)a6;
- (void)registerHandler:(id)a3 forIncomingRequestsWithAction:(id)a4 scheme:(id)a5;
- (void)removeHandlerForIncomingRequestsWithAction:(id)a3 scheme:(id)a4;
- (void)setAllowsOpeningFromBackground:(BOOL)a3;
- (void)setCallbackScheme:(id)a3;
- (void)setEnteringForeground:(BOOL)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setQueueLock:(id)a3;
- (void)setQueuedRequests:(id)a3;
- (void)setResignedActiveWhileOpeningURL:(BOOL)a3;
@end

@implementation ICManager

+ (ICManager)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__ICManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_58841 != -1) {
    dispatch_once(&sharedManager_onceToken_58841, block);
  }
  v2 = (void *)sharedManager_sharedManager_58842;
  return (ICManager *)v2;
}

- (ICManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)ICManager;
  v2 = [(ICManager *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSDistributedNotificationCenter *)v3;

    v5 = [MEMORY[0x1E4F5A7A0] sharedContext];
    [v5 addApplicationStateObserver:v2 forEvent:1];

    v6 = [MEMORY[0x1E4F5A7A0] sharedContext];
    [v6 addApplicationStateObserver:v2 forEvent:0];

    v7 = [MEMORY[0x1E4F5A7A0] sharedContext];
    [v7 addApplicationStateObserver:v2 forEvent:3];

    uint64_t v8 = objc_opt_new();
    queuedRequests = v2->_queuedRequests;
    v2->_queuedRequests = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    queueLock = v2->_queueLock;
    v2->_queueLock = (NSLock *)v10;

    [(ICManager *)v2 registerHandler:&__block_literal_global_58827 forIncomingRequestsWithAction:@"ic-success" scheme:0];
    [(ICManager *)v2 registerHandler:&__block_literal_global_186_58828 forIncomingRequestsWithAction:@"ic-cancel" scheme:0];
    [(ICManager *)v2 registerHandler:&__block_literal_global_188_58829 forIncomingRequestsWithAction:@"ic-error" scheme:0];
    v12 = [(ICManager *)v2 notificationCenter];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 addObserver:v2 selector:sel_handleOpenURLRequestNotification_ name:@"ICManagerHandleOpenURLNotification" object:v14];

    v15 = v2;
  }

  return v2;
}

- (void)registerHandler:(id)a3 forIncomingRequestsWithAction:(id)a4 legacyAction:(id)a5 scheme:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = +[ICURLRequestRegistry sharedRegistry];
  [v13 registerHandler:v12 forIncomingRequestsWithAction:v11 scheme:v9];

  id v14 = +[ICURLRequestRegistry sharedRegistry];
  [v14 registerHandler:v12 forIncomingRequestsWithAction:v10 scheme:v9];
}

- (void)registerHandler:(id)a3 forIncomingRequestsWithAction:(id)a4 scheme:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[ICURLRequestRegistry sharedRegistry];
  [v10 registerHandler:v9 forIncomingRequestsWithAction:v8 scheme:v7];
}

- (NSDistributedNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 3)
    {
      self->_enteringForeground = 1;
    }
    else if (a4 == 1)
    {
      self->_resignedActiveWhileOpeningURL = 1;
    }
  }
  else
  {
    id v26 = v6;
    id v7 = [MEMORY[0x1E4FB46B8] currentDevice];
    uint64_t v8 = [v7 idiom];

    if (v8 != 1) {
      goto LABEL_12;
    }
    id v9 = [MEMORY[0x1E4F5A7A0] sharedContext];
    id v10 = [v9 applicationOrNil];

    if (!v10) {
      goto LABEL_12;
    }
    id v11 = [v10 keyWindow];
    [v11 frame];
    double v13 = v12;
    double v15 = v14;

    v16 = [MEMORY[0x1E4FB46B8] currentDevice];
    [v16 screenBounds];
    double v18 = v17;
    double v20 = v19;

    id v6 = v26;
    BOOL v21 = v13 == v18 && v15 == v20;
    if (v21 || self->_enteringForeground)
    {
LABEL_12:
      self->_enteringForeground = 0;
      v22 = +[ICURLRequestRegistry sharedRegistry];
      v23 = [v22 popActiveRequest];

      v24 = [v23 successHandler];

      if (v24)
      {
        v25 = [v23 successHandler];
        v25[2](v25, 0, 0);
      }
      [(ICManager *)self performQueuedRequestIfApplicable];

      id v6 = v26;
    }
  }
}

- (void)performQueuedRequestIfApplicable
{
  uint64_t v3 = [(ICManager *)self popQueuedRequest];
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__ICManager_performQueuedRequestIfApplicable__block_invoke;
    v5[3] = &unk_1E6558938;
    v5[4] = self;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

- (id)popQueuedRequest
{
  uint64_t v3 = [(ICManager *)self queueLock];
  v4 = [(ICManager *)self queuedRequests];
  [v3 lock];
  v5 = [v4 lastObject];
  [v4 removeLastObject];
  [v3 unlock];

  return v5;
}

- (NSMutableArray)queuedRequests
{
  return self->_queuedRequests;
}

- (NSLock)queueLock
{
  return self->_queueLock;
}

void __26__ICManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager_58842;
  sharedManager_sharedManager_58842 = (uint64_t)v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_queueLock, 0);
  objc_storeStrong((id *)&self->_queuedRequests, 0);
  objc_storeStrong((id *)&self->_callbackScheme, 0);
}

- (void)setNotificationCenter:(id)a3
{
}

- (void)setResignedActiveWhileOpeningURL:(BOOL)a3
{
  self->_resignedActiveWhileOpeningURL = a3;
}

- (BOOL)resignedActiveWhileOpeningURL
{
  return self->_resignedActiveWhileOpeningURL;
}

- (void)setEnteringForeground:(BOOL)a3
{
  self->_enteringForeground = a3;
}

- (BOOL)enteringForeground
{
  return self->_enteringForeground;
}

- (void)setQueueLock:(id)a3
{
}

- (void)setQueuedRequests:(id)a3
{
}

- (void)setAllowsOpeningFromBackground:(BOOL)a3
{
  self->_allowsOpeningFromBackground = a3;
}

- (BOOL)allowsOpeningFromBackground
{
  return self->_allowsOpeningFromBackground;
}

- (void)setCallbackScheme:(id)a3
{
}

- (ICScheme)callbackScheme
{
  callbackScheme = self->_callbackScheme;
  if (!callbackScheme)
  {
    v4 = +[ICAppRegistry sharedRegistry];
    v5 = [v4 currentApp];
    id v6 = [v5 schemes];
    id v7 = [v6 objectMatchingKey:@"callbackScheme" BOOLValue:1];
    uint64_t v8 = self->_callbackScheme;
    self->_callbackScheme = v7;

    callbackScheme = self->_callbackScheme;
  }
  return callbackScheme;
}

- (void)_performRequest:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFInterchangeLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v63 = "-[ICManager _performRequest:]";
    __int16 v64 = 2112;
    id v65 = v4;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s Performing incoming request: %@", buf, 0x16u);
  }

  id v6 = [MEMORY[0x1E4F5A7A0] sharedContext];
  id v7 = [v6 applicationBundleURLSchemes];
  uint64_t v8 = [v4 URL];
  id v9 = [v8 scheme];
  id v10 = [v9 lowercaseString];
  if ([v7 containsObject:v10] && objc_msgSend(v4, "isCallbackRequest"))
  {
    id v11 = [v4 successHandler];

    if (v11)
    {
      [v4 setInternalCallbackRequest:1];
      if ([(ICManager *)self handleIncomingRequest:v4]) {
        goto LABEL_16;
      }
    }
  }
  else
  {
  }
  if (![v4 isCallbackRequest])
  {
LABEL_15:
    [(ICManager *)self queueRequest:v4];
    goto LABEL_16;
  }
  double v12 = [MEMORY[0x1E4F5A7A0] sharedContext];
  double v13 = [v12 provider];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    goto LABEL_15;
  }
  double v14 = [(ICManager *)self callbackScheme];

  if (!v14) {
    goto LABEL_15;
  }
  double v15 = [v4 scheme];
  v16 = objc_opt_new();
  double v17 = [v4 sourceName];
  double v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    double v20 = [(ICManager *)self callbackScheme];
    BOOL v21 = [v20 app];
    id v19 = [v21 localizedShortName];
  }
  uint64_t v22 = [v15 callbackSourceNameKey];
  v23 = (void *)v22;
  if (v19 && v22) {
    [v16 setObject:v19 forKey:v22];
  }
  v24 = [v4 successHandler];

  if (v24)
  {
    v25 = [v15 callbackSuccessURLKey];
    id v26 = [v15 callbackCancelURLKey];
    v56 = v26;
    v57 = v25;
    if (v25)
    {
      id v59 = v19;
      v27 = NSString;
      v28 = [(ICManager *)self callbackScheme];
      v29 = [v28 scheme];
      v30 = [v4 uniqueID];
      v31 = [v30 UUIDString];
      v32 = [v27 stringWithFormat:@"%@://%@/%@/%@", v29, @"x-callback-url", @"ic-success", v31];

      uint64_t v33 = [v4 successURLQueryString];
      v34 = (void *)v33;
      if (v33)
      {
        uint64_t v35 = [v32 stringByAppendingFormat:@"?%@", v33];

        v32 = (void *)v35;
      }
      v25 = v57;
      [v16 setObject:v32 forKey:v57];

      id v19 = v59;
      id v26 = v56;
    }
    if (v26)
    {
      v36 = NSString;
      v37 = [(ICManager *)self callbackScheme];
      v38 = [v37 scheme];
      [v4 uniqueID];
      v60 = v23;
      v39 = v16;
      v41 = id v40 = v19;
      v42 = [v41 UUIDString];
      v43 = [v36 stringWithFormat:@"%@://%@/%@/%@", v38, @"x-callback-url", @"ic-cancel", v42];

      id v19 = v40;
      v16 = v39;
      v23 = v60;

      id v26 = v56;
      [v16 setObject:v43 forKey:v56];

      v25 = v57;
    }
  }
  v44 = [v15 callbackErrorURLKey];
  v45 = [v4 failureHandler];

  if (v45 && v44)
  {
    v46 = NSString;
    v47 = [(ICManager *)self callbackScheme];
    [v47 scheme];
    v48 = v61 = v23;
    [v4 uniqueID];
    v58 = v15;
    v49 = v16;
    v51 = id v50 = v19;
    v52 = [v51 UUIDString];
    v53 = [v46 stringWithFormat:@"%@://%@/%@/%@", v48, @"x-callback-url", @"ic-error", v52];

    id v19 = v50;
    v16 = v49;
    double v15 = v58;

    v23 = v61;
    [v16 setObject:v53 forKey:v44];
  }
  v54 = [v4 URL];
  v55 = [v54 URLByAddingValuesFromQueryDictionary:v16];
  [v4 setGeneratedCallbackURL:v55];

  [(ICManager *)self queueRequest:v4];
LABEL_16:
}

- (void)performRequest:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(ICManager *)self _performRequest:v4];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __28__ICManager_performRequest___block_invoke;
    v5[3] = &unk_1E6558938;
    v5[4] = self;
    id v6 = v4;
    dispatch_sync(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __28__ICManager_performRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRequest:*(void *)(a1 + 40)];
}

void __45__ICManager_performQueuedRequestIfApplicable__block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5A7A0] sharedContext];
  if (![v2 applicationState])
  {

LABEL_7:
    id v6 = [*(id *)(a1 + 40) generatedCallbackURL];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [*(id *)(a1 + 40) URL];
    }
    id v9 = v8;

    id v10 = getWFInterchangeLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[ICManager performQueuedRequestIfApplicable]_block_invoke";
      __int16 v45 = 2112;
      v46 = v9;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Performing request: %@", buf, 0x16u);
    }

    int v11 = [*(id *)(a1 + 40) deferCompletionUntilReturn];
    double v12 = [MEMORY[0x1E4F5A7A0] sharedContext];
    int v13 = [v12 canOpenURL:v9];

    if (v13)
    {
      if (v11)
      {
        double v14 = +[ICURLRequestRegistry sharedRegistry];
        [v14 registerOutgoingRequest:*(void *)(a1 + 40)];
      }
      double v15 = [*(id *)(a1 + 40) opener];

      if (!v15) {
        goto LABEL_27;
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
      v16 = [*(id *)(a1 + 40) opener];
      double v17 = [*(id *)(a1 + 40) bundleIdentifier];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __45__ICManager_performQueuedRequestIfApplicable__block_invoke_208;
      v36[3] = &unk_1E6556210;
      id v37 = *(id *)(a1 + 40);
      id v18 = v9;
      uint64_t v19 = *(void *)(a1 + 32);
      id v38 = v18;
      uint64_t v39 = v19;
      char v40 = v11;
      ((void (**)(void, id, void *, void *))v16)[2](v16, v18, v17, v36);

      double v20 = v37;
LABEL_26:

LABEL_27:
      return;
    }
    BOOL v21 = [*(id *)(a1 + 40) scheme];
    uint64_t v22 = [v21 app];
    v23 = [v22 localizedName];
    v24 = NSString;
    if (v23)
    {
      v25 = WFLocalizedString(@"Shortcuts could not open %@ because it is not installed.");
      id v26 = [*(id *)(a1 + 40) scheme];
      v27 = [v26 app];
      v28 = [v27 localizedName];
      double v20 = objc_msgSend(v24, "stringWithFormat:", v25, v28);
    }
    else
    {
      v25 = WFLocalizedString(@"Shortcuts could not open the app for the URL scheme “%@” because the app is not installed on this device.");
      id v26 = [*(id *)(a1 + 40) URL];
      v27 = [v26 scheme];
      double v20 = objc_msgSend(v24, "stringWithFormat:", v25, v27);
    }

    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F28568];
    v42 = v20;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    v31 = [v29 errorWithDomain:@"InterchangeErrorDomain" code:1 userInfo:v30];

    v32 = [*(id *)(a1 + 40) failureHandler];

    uint64_t v33 = *(void **)(a1 + 40);
    if (v32)
    {
      v34 = [v33 failureHandler];
      ((void (**)(void, void *))v34)[2](v34, v31);
    }
    else
    {
      uint64_t v35 = [v33 successHandler];

      if (!v35)
      {
LABEL_25:

        goto LABEL_26;
      }
      v34 = [*(id *)(a1 + 40) successHandler];
      ((void (*)(void (**)(void, void), void, void))v34[2])(v34, 0, 0);
    }

    goto LABEL_25;
  }
  char v3 = [*(id *)(a1 + 32) allowsOpeningFromBackground];

  if (v3) {
    goto LABEL_7;
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  [v4 queueRequest:v5];
}

void __45__ICManager_performQueuedRequestIfApplicable__block_invoke_208(uint64_t a1, char a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    if (!*(unsigned char *)(a1 + 56))
    {
      id v6 = [*(id *)(a1 + 32) successHandler];

      if (v6)
      {
        id v7 = [*(id *)(a1 + 32) successHandler];
        v7[2](v7, 0, 0);
LABEL_12:
      }
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) userInterface];
    int v9 = [v8 isRunningWithSiriUI];

    if (v9)
    {
      id v7 = [*(id *)(a1 + 32) failureHandler];
      id v10 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
      ((void (*)(void (**)(void, void, void), void *))v7[2])(v7, v10);

      goto LABEL_12;
    }
    int v11 = [*(id *)(a1 + 40) scheme];
    if (([v11 isEqualToString:@"tel"] & 1) != 0 || *(unsigned char *)(*(void *)(a1 + 48) + 10))
    {
    }
    else
    {
      int v13 = [MEMORY[0x1E4F5A7A0] sharedContext];
      double v14 = [v13 currentUserInterfaceType];
      int v15 = [v14 isEqualToString:*MEMORY[0x1E4F5AC08]];

      if (!v15)
      {
        if ([*(id *)(a1 + 32) retries] < 6)
        {
          dispatch_time_t v26 = dispatch_time(0, 100000000);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __45__ICManager_performQueuedRequestIfApplicable__block_invoke_2;
          block[3] = &unk_1E6558938;
          id v27 = *(id *)(a1 + 32);
          uint64_t v28 = *(void *)(a1 + 48);
          id v35 = v27;
          uint64_t v36 = v28;
          dispatch_after(v26, MEMORY[0x1E4F14428], block);
        }
        else
        {
          v16 = [*(id *)(a1 + 32) failureHandler];

          if (v16)
          {
            double v17 = [*(id *)(a1 + 32) scheme];
            id v18 = [v17 app];
            uint64_t v19 = [v18 localizedName];
            double v20 = NSString;
            if (v19)
            {
              BOOL v21 = WFLocalizedString(@"Shortcuts could not open %@. It may not be installed on this device.");
              uint64_t v22 = [*(id *)(a1 + 32) scheme];
              v23 = [v22 app];
              v24 = [v23 localizedName];
              v25 = objc_msgSend(v20, "localizedStringWithFormat:", v21, v24);
            }
            else
            {
              BOOL v21 = WFLocalizedString(@"Shortcuts could not open the app for the URL scheme “%@”. The app may not be installed on this device.");
              uint64_t v22 = [*(id *)(a1 + 40) scheme];
              v25 = objc_msgSend(v20, "localizedStringWithFormat:", v21, v22);
            }

            uint64_t v29 = [*(id *)(a1 + 32) failureHandler];
            v30 = (void (**)(void, void))v29;
            if (v5)
            {
              (*(void (**)(uint64_t, id))(v29 + 16))(v29, v5);
            }
            else
            {
              v31 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v37 = *MEMORY[0x1E4F28568];
              v38[0] = v25;
              v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
              uint64_t v33 = [v31 errorWithDomain:@"InterchangeErrorDomain" code:3 userInfo:v32];
              ((void (**)(void, void *))v30)[2](v30, v33);
            }
          }
        }
        goto LABEL_13;
      }
    }
    double v12 = [*(id *)(a1 + 32) failureHandler];

    if (v12)
    {
      id v7 = [*(id *)(a1 + 32) failureHandler];
      ((void (*)(void (**)(void, void, void), void))v7[2])(v7, 0);
      goto LABEL_12;
    }
  }
LABEL_13:
}

uint64_t __45__ICManager_performQueuedRequestIfApplicable__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRetries:", objc_msgSend(*(id *)(a1 + 32), "retries") + 1);
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  return [v2 queueRequest:v3];
}

- (void)queueRequest:(id)a3
{
  id v4 = a3;
  id v6 = [(ICManager *)self queueLock];
  [v6 lock];
  id v5 = [(ICManager *)self queuedRequests];
  [v5 addObject:v4];

  [v6 unlock];
  [(ICManager *)self performQueuedRequestIfApplicable];
}

- (void)removeHandlerForIncomingRequestsWithAction:(id)a3 scheme:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ICURLRequestRegistry sharedRegistry];
  [v7 removeHandlerForIncomingRequestsWithAction:v6 scheme:v5];
}

- (BOOL)handleIncomingRequest:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFInterchangeLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v27 = "-[ICManager handleIncomingRequest:]";
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEBUG, "%s Handling incoming request: %@", buf, 0x16u);
  }

  id v6 = [v4 URL];
  id v7 = +[ICURLRequestRegistry sharedRegistry];
  id v8 = [v4 action];
  int v9 = [v6 scheme];
  id v10 = [v7 handlerForIncomingRequestWithAction:v8 scheme:v9];

  if (v10)
  {
    ((void (**)(void, id))v10)[2](v10, v4);
  }
  else
  {
    if (![v4 isCallbackRequest]
      || ([(ICManager *)self callbackScheme],
          double v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 matchesURL:v6],
          v12,
          !v13))
    {
      BOOL v11 = 0;
      goto LABEL_12;
    }
    double v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    int v15 = NSString;
    v16 = WFLocalizedString(@"This app does not support the \"%@\" action.");
    double v17 = [v4 action];
    id v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17);
    v25 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    double v20 = [v14 errorWithDomain:@"InterchangeErrorDomain" code:2 userInfo:v19];

    BOOL v21 = [v4 failureHandler];

    if (v21)
    {
      uint64_t v22 = [v4 failureHandler];
      ((void (**)(void, void *))v22)[2](v22, v20);
    }
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)handleOpenURL:(id)a3 fromSourceApplication:(id)a4 errorHandler:(id)a5 postNotification:(BOOL)a6
{
  BOOL v32 = a6;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (unint64_t)a5;
  BOOL v11 = getWFInterchangeLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[ICManager handleOpenURL:fromSourceApplication:errorHandler:postNotification:]";
    __int16 v47 = 2112;
    id v48 = v8;
    _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_INFO, "%s Handling opening URL: %@", buf, 0x16u);
  }

  double v12 = +[_ICURLRequest requestWithURL:v8 fromSourceApplication:v9];
  int v13 = [v12 parameters];
  double v14 = (void *)MEMORY[0x1E4F1CB10];
  int v15 = [v13 objectForKey:@"x-error"];
  uint64_t v16 = [v14 URLWithString:v15];

  if (v10 | v16)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke;
    v39[3] = &unk_1E65561A8;
    id v40 = (id)v16;
    uint64_t v41 = self;
    id v42 = (id)v10;
    [v12 setFailureHandler:v39];
  }
  v34 = (void *)v10;
  uint64_t v17 = [v13 objectForKey:@"x-cancel"];
  uint64_t v18 = [v13 objectForKey:@"x-success"];
  if (v17 | v18)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_3;
    v36[3] = &unk_1E65561E0;
    id v37 = (id)v17;
    id v38 = (id)v18;
    [v12 setSuccessHandler:v36];
  }
  BOOL v19 = [(ICManager *)self handleIncomingRequest:v12];
  BOOL v20 = v19;
  if (v32)
  {
    BOOL v31 = v19;
    BOOL v21 = (void *)MEMORY[0x1E4F1CA60];
    v43[0] = @"HandleURLNotificationURL";
    id v33 = v8;
    [v8 absoluteString];
    v23 = id v22 = v9;
    v44[0] = v23;
    v43[1] = @"HandleURLNotificationProcessIdentifier";
    uint64_t v24 = [NSNumber numberWithInt:getpid()];
    v44[1] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
    dispatch_time_t v26 = [v21 dictionaryWithDictionary:v25];

    if (v22) {
      [v26 setObject:v22 forKeyedSubscript:@"HandleURLNotificationSourceApplication"];
    }
    id v27 = [(ICManager *)self notificationCenter];
    __int16 v28 = (objc_class *)objc_opt_class();
    id v29 = NSStringFromClass(v28);
    [v27 postNotificationName:@"ICManagerHandleOpenURLNotification" object:v29 userInfo:v26 deliverImmediately:1];

    id v9 = v22;
    id v8 = v33;
    BOOL v20 = v31;
  }

  return v20;
}

void __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_2;
  v6[3] = &unk_1E65586A0;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v4 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  uint64_t v4 = 40;
  if (a3) {
    uint64_t v4 = 32;
  }
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = *(id *)(a1 + v4);
  id v7 = a2;
  id v8 = [v5 URLWithString:v6];
  uint64_t v9 = [v8 URLByAddingValuesFromQueryDictionary:v7];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_4;
  block[3] = &unk_1E6558B28;
  id v12 = v9;
  id v10 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isFileURL])
  {
    v2 = getWFInterchangeLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v6 = "-[ICManager handleOpenURL:fromSourceApplication:errorHandler:postNotification:]_block_invoke_4";
      __int16 v7 = 2112;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_ERROR, "%s Not opening file-based URL in response to success: %@", buf, 0x16u);
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F5A7A0] sharedContext];
    [v4 openURL:*(void *)(a1 + 32)];
  }
}

void __79__ICManager_handleOpenURL_fromSourceApplication_errorHandler_postNotification___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2 && ([v2 isFileURL] & 1) == 0)
  {
    uint64_t v3 = [MEMORY[0x1E4F5A7A0] sharedContext];
    if ([v3 canOpenURL:*(void *)(a1 + 32)])
    {
      if ((WFURLIsWebPage() & 1) == 0)
      {

LABEL_14:
        id v16 = [*(id *)(a1 + 40) interchangeErrorDictionary];
        __int16 v7 = objc_msgSend(*(id *)(a1 + 32), "URLByAddingValuesFromQueryDictionary:");
        uint64_t v8 = [v7 scheme];
        uint64_t v9 = [*(id *)(a1 + 48) callbackScheme];
        id v10 = [v9 scheme];
        int v11 = [v8 isEqualToString:v10];

        if (v11)
        {
          id v12 = *(void **)(a1 + 48);
          int v13 = [MEMORY[0x1E4F5A7A0] sharedContext];
          double v14 = [v13 bundle];
          int v15 = [v14 bundleIdentifier];
          [v12 handleOpenURL:v7 fromSourceApplication:v15 errorHandler:*(void *)(a1 + 56)];
        }
        else
        {
          int v13 = [MEMORY[0x1E4F5A7A0] sharedContext];
          [v13 openURL:v7];
        }

        return;
      }
      int v4 = WFURLIsUniversalLink();

      if (v4) {
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5)
  {
    id v6 = *(void (**)(void))(v5 + 16);
    v6();
  }
}

- (BOOL)handleOpenURL:(id)a3 fromSourceApplication:(id)a4 errorHandler:(id)a5
{
  return [(ICManager *)self handleOpenURL:a3 fromSourceApplication:a4 errorHandler:a5 postNotification:1];
}

- (void)handleOpenURLRequestNotification:(id)a3
{
  id v16 = a3;
  int v4 = [v16 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"HandleURLNotificationProcessIdentifier"];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v16 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"HandleURLNotificationURL"];

  if (!v9)
  {
    id v15 = 0;
    id v10 = 0;
LABEL_18:

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = 0;
    id v15 = v9;
    uint64_t v9 = 0;
    goto LABEL_18;
  }
  id v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
  if (v10)
  {
    uint64_t v11 = [v7 integerValue];
    if (v11 != getpid())
    {
      id v12 = [v16 userInfo];
      int v13 = [v12 objectForKeyedSubscript:@"HandleURLNotificationSourceApplication"];

      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          double v14 = v13;
        }
        else {
          double v14 = 0;
        }
      }
      else
      {
        double v14 = 0;
      }
      id v15 = v14;

      [(ICManager *)self handleOpenURL:v10 fromSourceApplication:v15 errorHandler:0 postNotification:0];
      goto LABEL_18;
    }
  }
LABEL_19:
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F5A7A0] sharedContext];
  [v3 removeApplicationStateObserver:self forEvent:1];

  int v4 = [MEMORY[0x1E4F5A7A0] sharedContext];
  [v4 removeApplicationStateObserver:self forEvent:0];

  uint64_t v5 = [MEMORY[0x1E4F5A7A0] sharedContext];
  [v5 removeApplicationStateObserver:self forEvent:3];

  v6.receiver = self;
  v6.super_class = (Class)ICManager;
  [(ICManager *)&v6 dealloc];
}

void __17__ICManager_init__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 subAction];
  id v14 = (id)[v4 initWithUUIDString:v5];

  objc_super v6 = +[ICURLRequestRegistry sharedRegistry];
  id v7 = [v6 popRequestWithUUID:v14];

  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = [v3 parameters];

  id v10 = [v8 errorWithInterchangeErrorDictionary:v9];

  uint64_t v11 = [v7 failureHandler];

  if (v11)
  {
    id v12 = [v7 failureHandler];
    ((void (**)(void, void *))v12)[2](v12, v10);
  }
  else
  {
    int v13 = [v7 successHandler];

    if (!v13) {
      goto LABEL_6;
    }
    id v12 = [v7 successHandler];
    ((void (*)(void (**)(void, void), void, void))v12[2])(v12, 0, 0);
  }

LABEL_6:
}

void __17__ICManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v2 = objc_alloc(MEMORY[0x1E4F29128]);
  id v3 = [v10 subAction];
  id v4 = (void *)[v2 initWithUUIDString:v3];

  uint64_t v5 = +[ICURLRequestRegistry sharedRegistry];
  objc_super v6 = [v5 popRequestWithUUID:v4];

  id v7 = [v6 successHandler];

  if (v7)
  {
    uint64_t v8 = [v6 successHandler];
    uint64_t v9 = [v10 parameters];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, 1);
  }
}

void __17__ICManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v2 = objc_alloc(MEMORY[0x1E4F29128]);
  id v3 = [v10 subAction];
  id v4 = (void *)[v2 initWithUUIDString:v3];

  uint64_t v5 = +[ICURLRequestRegistry sharedRegistry];
  objc_super v6 = [v5 popRequestWithUUID:v4];

  id v7 = [v6 successHandler];

  if (v7)
  {
    uint64_t v8 = [v6 successHandler];
    uint64_t v9 = [v10 parameters];
    ((void (**)(void, void *, void))v8)[2](v8, v9, 0);
  }
}

@end