@interface SESTapToRadar
+ (id)getInstance;
+ (void)handleCallback:(unint64_t)a3;
+ (void)requestTapToRadar:(id)a3 client:(id)a4;
+ (void)requestTapToRadar:(id)a3 client:(id)a4 fullArchive:(BOOL)a5;
- (SESTapToRadar)init;
- (void)_handleCallbackSync:(unint64_t)a3;
- (void)_requestTapToRadarSync:(id)a3 client:(id)a4 fullArchive:(BOOL)a5;
- (void)setProhibitUntil:(id)a3 forClient:(id)a4;
@end

@implementation SESTapToRadar

+ (void)requestTapToRadar:(id)a3 client:(id)a4 fullArchive:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    v9 = +[SESTapToRadar getInstance];
    v10 = v9;
    if (v9)
    {
      v11 = v9[1];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __54__SESTapToRadar_requestTapToRadar_client_fullArchive___block_invoke;
      v12[3] = &unk_2655D6540;
      v13 = v9;
      id v14 = v7;
      id v15 = v8;
      BOOL v16 = a5;
      dispatch_async(v11, v12);
    }
  }
}

uint64_t __54__SESTapToRadar_requestTapToRadar_client_fullArchive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestTapToRadarSync:*(void *)(a1 + 40) client:*(void *)(a1 + 48) fullArchive:*(unsigned __int8 *)(a1 + 56)];
}

+ (void)requestTapToRadar:(id)a3 client:(id)a4
{
}

+ (id)getInstance
{
  if (getInstance_onceToken != -1) {
    dispatch_once(&getInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)getInstance_instance;

  return v2;
}

uint64_t __28__SESTapToRadar_getInstance__block_invoke()
{
  getInstance_instance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (SESTapToRadar)init
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)SESTapToRadar;
  v2 = [(SESTapToRadar *)&v16 init];
  if (!v2) {
    goto LABEL_5;
  }
  if (!dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2))
  {
    v13 = SESDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v18 = "/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices";
      id v14 = "Failed to dlopen %{public}s";
LABEL_10:
      _os_log_impl(&dword_263826000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
    }
LABEL_11:

    v12 = 0;
    goto LABEL_12;
  }
  Class v3 = NSClassFromString(&cfstr_Lsapplicationw.isa);
  v2->_lsApplicationWorkspace = v3;
  if (!v3)
  {
    v13 = SESDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = (const char *)@"LSApplicationWorkspace";
      id v14 = "Failed to get class %{public}@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  pendingRequestReason = v2->_pendingRequestReason;
  v2->_pendingRequestReason = 0;

  pendingRequestClient = v2->_pendingRequestClient;
  v2->_pendingRequestClient = 0;

  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.sesd.TTR", v7);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v8;

  uint64_t v10 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.seserviced"];
  userDefaults = v2->_userDefaults;
  v2->_userDefaults = (NSUserDefaults *)v10;

LABEL_5:
  v12 = v2;
LABEL_12:

  return v12;
}

- (void)_requestTapToRadarSync:(id)a3 client:(id)a4 fullArchive:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pendingRequestReason)
  {
    v11 = SESDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Discarding TTR request, already in flight";
LABEL_12:
      _os_log_impl(&dword_263826000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    }
  }
  else if (SpringBoardServicesLibraryCore() {
         && (getSBUserNotificationDismissOnLock(),
  }
             v13 = objc_claimAutoreleasedReturnValue(),
             v13,
             v13))
  {
    BOOL v32 = v5;
    v11 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"TTR-Prohibit-Until-ByClient"];
    id v14 = [v11 objectForKeyedSubscript:v10];
    if (v14
      && ([MEMORY[0x263EFF910] date],
          id v15 = objc_claimAutoreleasedReturnValue(),
          uint64_t v16 = [v14 compare:v15],
          v15,
          v16 == 1))
    {
      v17 = SESDefaultLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v14;
        id v38 = v14;
        _os_log_impl(&dword_263826000, v17, OS_LOG_TYPE_INFO, "TTR is prohibited until %{public}@", buf, 0xCu);
      }
      else
      {
        v18 = v14;
      }
    }
    else
    {
      v33 = v14;
      uint64_t v19 = *MEMORY[0x263EFFFD8];
      v35[0] = *MEMORY[0x263EFFFC8];
      v35[1] = v19;
      v36[0] = @"SecureElementService Error Detected!";
      v36[1] = @"Please file a Radar";
      uint64_t v20 = *MEMORY[0x263EFFFE8];
      v35[2] = *MEMORY[0x263F00000];
      v35[3] = v20;
      v36[2] = @"File Radar";
      v36[3] = @"Not Now";
      uint64_t v21 = *MEMORY[0x263EFFFE0];
      v35[4] = *MEMORY[0x263F00020];
      v35[5] = v21;
      v36[4] = @"Never bother me again";
      v36[5] = MEMORY[0x263EFFA88];
      v22 = getSBUserNotificationDismissOnLock();
      v35[6] = v22;
      v36[6] = MEMORY[0x263EFFA80];
      v17 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:7];

      SInt32 error = 0;
      v23 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, (CFDictionaryRef)v17);
      self->_userNotification = v23;
      if (!v23 || error)
      {
        v29 = SESDefaultLogObject();
        v18 = v33;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v38) = error;
          _os_log_impl(&dword_263826000, v29, OS_LOG_TYPE_ERROR, "Couldn't create notification! %d", buf, 8u);
        }

        userNotification = self->_userNotification;
        if (userNotification) {
          CFRelease(userNotification);
        }
        self->_userNotification = 0;
      }
      else
      {
        RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v23, (CFUserNotificationCallBack)NFTTRUserNotificationCallback, 0);
        self->_runLoopSource = RunLoopSource;
        if (RunLoopSource)
        {
          Main = CFRunLoopGetMain();
          CFRunLoopAddSource(Main, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
          v26 = SESDefaultLogObject();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v10;
            _os_log_impl(&dword_263826000, v26, OS_LOG_TYPE_INFO, "TTR prompt created for %@", buf, 0xCu);
          }

          objc_storeStrong((id *)&self->_pendingRequestClient, a4);
          objc_storeStrong((id *)&self->_pendingRequestReason, a3);
          ttrOptions = self->_ttrOptions;
          if (v32) {
            v28 = (NSDictionary *)&unk_270EB3E98;
          }
          else {
            v28 = (NSDictionary *)MEMORY[0x263EFFA78];
          }
          self->_ttrOptions = v28;
        }
        else
        {
          v31 = SESDefaultLogObject();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_263826000, v31, OS_LOG_TYPE_ERROR, "Couldn't create runloop source", buf, 2u);
          }

          CFRelease(self->_userNotification);
          self->_userNotification = 0;
        }
        v18 = v14;
      }
    }
  }
  else
  {
    v11 = SESDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Missing SB notif key SBUserNotificationDismissOnLock";
      goto LABEL_12;
    }
  }
}

- (void)_handleCallbackSync:(unint64_t)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  BOOL v5 = objc_opt_new();
  v6 = objc_opt_new();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_pendingRequestClient)
  {
    if (a3 == 2)
    {
      id v7 = SESDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        pendingRequestReason = self->_pendingRequestReason;
        pendingRequestClient = self->_pendingRequestClient;
        *(_DWORD *)buf = 138412546;
        v45 = pendingRequestClient;
        __int16 v46 = 2112;
        v47 = pendingRequestReason;
        _os_log_impl(&dword_263826000, v7, OS_LOG_TYPE_INFO, "User canceled response for %@/%@", buf, 0x16u);
      }

      id v10 = [MEMORY[0x263EFF910] distantFuture];
      [(SESTapToRadar *)self setProhibitUntil:v10 forClient:self->_pendingRequestClient];
    }
    else
    {
      v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:86400.0];
      [(SESTapToRadar *)self setProhibitUntil:v12 forClient:self->_pendingRequestClient];

      if (a3 == 1)
      {
        id v10 = SESDefaultLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_263826000, v10, OS_LOG_TYPE_INFO, "NotNow response", buf, 2u);
        }
      }
      else
      {
        id v38 = v6;
        v13 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentID" value:@"997328"];
        [v5 addObject:v13];

        id v14 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentName" value:@"SecureElementService"];
        [v5 addObject:v14];

        id v15 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentVersion" value:@"1.0"];
        [v5 addObject:v15];

        uint64_t v16 = [MEMORY[0x263F08BD0] queryItemWithName:@"Classification" value:@"Crash/Hang/Data Loss"];
        [v5 addObject:v16];

        v17 = [MEMORY[0x263F08BD0] queryItemWithName:@"Reproducibility" value:@"I Didn't Try"];
        [v5 addObject:v17];

        v18 = (void *)MEMORY[0x263F08BD0];
        uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"SecureElementService TTR - %@", self->_pendingRequestReason];
        uint64_t v20 = [v18 queryItemWithName:@"Title" value:v19];
        [v5 addObject:v20];

        uint64_t v21 = [MEMORY[0x263F08BD0] queryItemWithName:@"Description" value:self->_pendingRequestReason];
        [v5 addObject:v21];

        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v22 = self->_ttrOptions;
        uint64_t v23 = [(NSDictionary *)v22 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v40 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v39 + 1) + 8 * i);
              v28 = (void *)MEMORY[0x263F08BD0];
              v29 = [(NSDictionary *)self->_ttrOptions objectForKeyedSubscript:v27];
              v30 = [v28 queryItemWithName:v27 value:v29];
              [v5 addObject:v30];
            }
            uint64_t v24 = [(NSDictionary *)v22 countByEnumeratingWithState:&v39 objects:v43 count:16];
          }
          while (v24);
        }

        v6 = v38;
        [v38 setScheme:@"tap-to-radar"];
        [v38 setHost:@"new"];
        [v38 setQueryItems:v5];
        v31 = SESDefaultLogObject();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v45 = (NSString *)v38;
          _os_log_impl(&dword_263826000, v31, OS_LOG_TYPE_INFO, "URL: %{public}@", buf, 0xCu);
        }

        id v10 = [(objc_class *)self->_lsApplicationWorkspace defaultWorkspace];
        BOOL v32 = [v38 URL];
        [v10 openURL:v32 configuration:0 completionHandler:0];
      }
    }

    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    runLoopSource = self->_runLoopSource;
    if (runLoopSource) {
      CFRelease(runLoopSource);
    }
    self->_runLoopSource = 0;
    userNotification = self->_userNotification;
    if (userNotification) {
      CFRelease(userNotification);
    }
    self->_userNotification = 0;
    v36 = self->_pendingRequestClient;
    self->_pendingRequestClient = 0;

    v37 = self->_pendingRequestReason;
    self->_pendingRequestReason = 0;

    p_super = &self->_ttrOptions->super;
    self->_ttrOptions = 0;
  }
  else
  {
    p_super = SESDefaultLogObject();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_263826000, p_super, OS_LOG_TYPE_ERROR, "Ignoring TTR callback with no pending request", buf, 2u);
    }
  }
}

- (void)setProhibitUntil:(id)a3 forClient:(id)a4
{
  userDefaults = self->_userDefaults;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NSUserDefaults *)userDefaults objectForKey:@"TTR-Prohibit-Until-ByClient"];
  id v10 = (void *)[v9 mutableCopy];
  v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_opt_new();
  }
  id v13 = v12;

  [v13 setObject:v8 forKeyedSubscript:v7];
  [(NSUserDefaults *)self->_userDefaults setObject:v13 forKey:@"TTR-Prohibit-Until-ByClient"];
  [(NSUserDefaults *)self->_userDefaults synchronize];
}

+ (void)handleCallback:(unint64_t)a3
{
  v4 = +[SESTapToRadar getInstance];
  BOOL v5 = v4;
  if (v4)
  {
    v6 = v4[1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__SESTapToRadar_handleCallback___block_invoke;
    v7[3] = &unk_2655D64F0;
    id v8 = v4;
    unint64_t v9 = a3;
    dispatch_async(v6, v7);
  }
}

uint64_t __32__SESTapToRadar_handleCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCallbackSync:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_ttrOptions, 0);
  objc_storeStrong((id *)&self->_pendingRequestClient, 0);
  objc_storeStrong((id *)&self->_pendingRequestReason, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end