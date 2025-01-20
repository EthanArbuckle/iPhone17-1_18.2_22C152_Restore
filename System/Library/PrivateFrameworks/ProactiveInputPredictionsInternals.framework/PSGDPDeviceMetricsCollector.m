@interface PSGDPDeviceMetricsCollector
+ (BOOL)recordEngagementMetrics:(id)a3 selectedRecorder:(id)a4 ignoredRecorder:(id)a5;
+ (BOOL)recordResponse:(id)a3 numTimesToLog:(unint64_t)a4 recorder:(id)a5 prefix:(id)a6;
+ (BOOL)sendEngagementToDPUsingData:(id)a3;
+ (id)getActiveTrialInformationWithWithXPCActivityManager:(id)a3 activity:(id)a4;
+ (id)getPrefixFromRolloutID:(id)a3 factorPackId:(id)a4 experimentId:(id)a5 treatmentId:(id)a6;
+ (id)onCompletionWithXPCActivityManager:(id)a3 activity:(id)a4 engagementMetrics:(id)a5 idsService:(id)a6 destinationDevice:(id)a7;
+ (id)onDeltaRowWithXPCActivityManager:(id)a3 activity:(id)a4 engagementMetrics:(id)a5;
+ (id)recorderForKey:(id)a3;
- (BOOL)collectDeviceQREngagement:(id)a3;
- (BOOL)syncQREngagementToPairedDeviceWithActivity:(id)a3;
- (PSGDPDeviceMetricsCollector)initWithActivityManager:(id)a3;
- (PSGDPDeviceMetricsCollector)initWithActivityManager:(id)a3 idsService:(id)a4 queue:(id)a5 store:(id)a6;
- (id)initAsDelegate;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation PSGDPDeviceMetricsCollector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = psg_default_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v9 serviceName];
    int v14 = 138412802;
    v15 = v13;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = [v10 length];
    _os_log_impl(&dword_23EAA9000, v12, OS_LOG_TYPE_DEFAULT, "Received file for service %@, identifier: %@; size: %tu",
      (uint8_t *)&v14,
      0x20u);
  }
  +[PSGDPDeviceMetricsCollector sendEngagementToDPUsingData:v10];
}

- (BOOL)syncQREngagementToPairedDeviceWithActivity:(id)a3
{
  return 1;
}

- (BOOL)collectDeviceQREngagement:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = psg_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EAA9000, v5, OS_LOG_TYPE_DEFAULT, "Begin syncing QR engagement data", buf, 2u);
  }

  int v6 = [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v4];
  v7 = psg_default_log_handle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23EAA9000, v7, OS_LOG_TYPE_DEFAULT, "Begin fetching device experiment information", buf, 2u);
    }

    id v10 = +[PSGDPDeviceMetricsCollector getActiveTrialInformationWithWithXPCActivityManager:self->_xpcActivityManager activity:v4];
    id v11 = v10;
    if (v10)
    {
      if (![v10 count])
      {
        v15 = psg_default_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23EAA9000, v15, OS_LOG_TYPE_DEFAULT, "Early returning on engagement data sync since no Trial information associated with device", buf, 2u);
        }

        char v9 = 1;
        goto LABEL_28;
      }
      int v12 = [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v4];
      v13 = psg_default_log_handle();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (!v12)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23EAA9000, v13, OS_LOG_TYPE_DEFAULT, "Begin retrieving and recording delta records from DB", buf, 2u);
        }

        __int16 v16 = +[PSGDPDeviceMetricsCollector recorderForKey:@"com.apple.proactive.messages.ZKWSelected"];
        uint64_t v17 = +[PSGDPDeviceMetricsCollector recorderForKey:@"com.apple.proactive.messages.ZKWIgnored"];
        __int16 v18 = (void *)v17;
        if (v16 && v17)
        {
          store = self->_store;
          uint64_t v20 = +[PSGDPDeviceMetricsCollector onDeltaRowWithXPCActivityManager:self->_xpcActivityManager activity:v4 engagementMetrics:v11];
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __57__PSGDPDeviceMetricsCollector_collectDeviceQREngagement___block_invoke;
          v22[3] = &unk_265037CD8;
          id v23 = v11;
          v24 = self;
          id v25 = v4;
          id v26 = v16;
          id v27 = v18;
          char v9 = [(SGQuickResponsesStore *)store deltaForResponsesOnRow:v20 completion:v22];
        }
        else
        {
          uint64_t v20 = psg_default_log_handle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138413058;
            v29 = @"com.apple.proactive.messages.ZKWSelected";
            __int16 v30 = 1024;
            BOOL v31 = v16 == 0;
            __int16 v32 = 2112;
            v33 = @"com.apple.proactive.messages.ZKWIgnored";
            __int16 v34 = 1024;
            BOOL v35 = v18 == 0;
            _os_log_fault_impl(&dword_23EAA9000, v20, OS_LOG_TYPE_FAULT, "Bailing out because unable to create recorder for some key(s), %@: %d, %@: %d", buf, 0x22u);
          }
          char v9 = 0;
        }

        goto LABEL_28;
      }
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EAA9000, v13, OS_LOG_TYPE_DEFAULT, "Deferring engagement data syncing after successful experiment id retrieval", buf, 2u);
      }
    }
    [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v4 state:3];
    char v9 = 0;
LABEL_28:

    goto LABEL_29;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EAA9000, v7, OS_LOG_TYPE_DEFAULT, "Deferring engagement data syncing during eager initial check", buf, 2u);
  }

  [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v4 state:3];
  char v9 = 0;
LABEL_29:

  return v9;
}

uint64_t __57__PSGDPDeviceMetricsCollector_collectDeviceQREngagement___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [*(id *)(a1 + 32) allValues];
  uint64_t v2 = [obj countByEnumeratingWithState:&v22 objects:v40 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v23;
    unint64_t v5 = 0x265037000uLL;
    uint64_t v19 = *(void *)v23;
    while (2)
    {
      uint64_t v6 = 0;
      uint64_t v20 = v3;
      do
      {
        if (*(void *)v23 != v4) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v22 + 1) + 8 * v6);
        if ([*(id *)(*(void *)(a1 + 40) + 8) shouldDefer:*(void *)(a1 + 48)])
        {
          uint64_t v17 = psg_default_log_handle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_23EAA9000, v17, OS_LOG_TYPE_DEFAULT, "Deferring engagement data recording in the middle of recording", buf, 2u);
          }

          [*(id *)(*(void *)(a1 + 40) + 8) setState:*(void *)(a1 + 48) state:3];
          return 0;
        }
        int v8 = [*(id *)(v5 + 2536) recordEngagementMetrics:v7 selectedRecorder:*(void *)(a1 + 56) ignoredRecorder:*(void *)(a1 + 64)];
        char v9 = psg_default_log_handle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [v7 lang];
          id v11 = [v7 rolloutId];
          int v12 = [v7 factorPackId];
          v13 = [v7 experimentId];
          BOOL v14 = [v7 treatmentId];
          v15 = [v7 engagementDeltas];
          uint64_t v16 = [v15 count];
          *(_DWORD *)buf = 138413826;
          id v27 = v10;
          __int16 v28 = 2112;
          v29 = v11;
          __int16 v30 = 2112;
          BOOL v31 = v12;
          __int16 v32 = 2112;
          v33 = v13;
          __int16 v34 = 2112;
          BOOL v35 = v14;
          __int16 v36 = 2048;
          uint64_t v37 = v16;
          __int16 v38 = 1024;
          int v39 = v8;
          _os_log_impl(&dword_23EAA9000, v9, OS_LOG_TYPE_DEFAULT, "Recorded engagement metrics running in language %@, rollout %@, factor pack %@, experiment %@, treatment %@, records %tu, success %d", buf, 0x44u);

          uint64_t v4 = v19;
          uint64_t v3 = v20;

          unint64_t v5 = 0x265037000;
        }

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v40 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  [*(id *)(*(void *)(a1 + 40) + 8) setState:*(void *)(a1 + 48) state:5];
  return 0;
}

- (PSGDPDeviceMetricsCollector)initWithActivityManager:(id)a3 idsService:(id)a4 queue:(id)a5 store:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PSGDPDeviceMetricsCollector;
  v15 = [(PSGDPDeviceMetricsCollector *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_xpcActivityManager, a3);
    objc_storeStrong((id *)&v16->_idsService, a4);
    objc_storeStrong((id *)&v16->_store, a6);
    objc_storeStrong((id *)&v16->_queue, a5);
    [(IDSService *)v16->_idsService addDelegate:v16 queue:v16->_queue];
  }

  return v16;
}

- (PSGDPDeviceMetricsCollector)initWithActivityManager:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F4A0C0];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithService:@"com.apple.private.alloy.suggestions.smartreplies"];
  v7 = [MEMORY[0x263F382E0] sharedInstance];
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.dpwatchmetricscollection.idsSend", 0);
  char v9 = [(PSGDPDeviceMetricsCollector *)self initWithActivityManager:v5 idsService:v6 queue:v8 store:v7];

  return v9;
}

- (id)initAsDelegate
{
  v8.receiver = self;
  v8.super_class = (Class)PSGDPDeviceMetricsCollector;
  uint64_t v2 = [(PSGDPDeviceMetricsCollector *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.suggestions.smartreplies"];
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.dpwatchmetricscollection.idsSend", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    [(IDSService *)v2->_idsService addDelegate:v2 queue:v2->_queue];
  }
  return v2;
}

+ (BOOL)sendEngagementToDPUsingData:(id)a3
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v75 = a3;
  uint64_t v3 = psg_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EAA9000, v3, OS_LOG_TYPE_DEFAULT, "Begin sending QR engagement data to DP", buf, 2u);
  }

  uint64_t v4 = (void *)MEMORY[0x23ED0AB80]();
  id v5 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v5, "initWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v13 = psg_default_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EAA9000, v13, OS_LOG_TYPE_DEFAULT, "Begin payload deserialization", buf, 2u);
  }

  id v84 = 0;
  id v14 = v75;
  v15 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v75 error:&v84];
  uint64_t v16 = (__CFString *)v84;
  [v15 setRequiresSecureCoding:1];
  uint64_t v17 = [v15 setClass:objc_opt_class() forClassName:@"SGQuickResponsesEngagementMetrics"];
  objc_super v18 = (void *)MEMORY[0x23ED0AB80](v17);
  uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  uint64_t v20 = [v15 decodeDictionaryWithKeysOfClasses:v19 objectsOfClasses:v12 forKey:*MEMORY[0x263F081D0]];

  if (v16)
  {
    v21 = psg_default_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v86 = v16;
      _os_log_fault_impl(&dword_23EAA9000, v21, OS_LOG_TYPE_FAULT, "Unable to deserialize engagement data: %@", buf, 0xCu);
    }
    char v22 = 0;
    goto LABEL_65;
  }
  long long v23 = psg_default_log_handle();
  v21 = v23;
  if (v20)
  {
    v73 = v20;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23EAA9000, v21, OS_LOG_TYPE_DEFAULT, "Successfully deserialized payload", buf, 2u);
    }

    long long v24 = psg_default_log_handle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23EAA9000, v24, OS_LOG_TYPE_DEFAULT, "Begin payload content validation", buf, 2u);
    }

    [v73 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_62];
    v21 = [v73 objectForKeyedSubscript:@"compatVer"];
    if (!v21)
    {
      long long v25 = psg_default_log_handle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EAA9000, v25, OS_LOG_TYPE_DEFAULT, "Compatability version is not in payload. Assuming payload is legacy and inferring version to be 0", buf, 2u);
      }

      v21 = &unk_26F241E68;
    }
    id v26 = psg_default_log_handle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v86 = (__CFString *)v21;
      __int16 v87 = 1024;
      *(_DWORD *)v88 = 2;
      _os_log_impl(&dword_23EAA9000, v26, OS_LOG_TYPE_DEFAULT, "Received compatability version %@ with local compatability version %d", buf, 0x12u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v51 = psg_default_log_handle();
      uint64_t v20 = v73;
      v67 = v51;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
        v57 = (objc_class *)objc_opt_class();
        NSStringFromClass(v57);
        v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v86 = v58;
        _os_log_fault_impl(&dword_23EAA9000, v51, OS_LOG_TYPE_FAULT, "Deserialized compatability version was of class %@, something went wrong", buf, 0xCu);

        uint64_t v20 = v73;
      }
      char v22 = 0;
      goto LABEL_64;
    }
    uint64_t v20 = v73;
    if ([v21 intValue] != 2)
    {
      v52 = psg_default_log_handle();
      v67 = v52;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EAA9000, v52, OS_LOG_TYPE_DEFAULT, "Compatability versions do not match, proceeding to early return", buf, 2u);
      }
      char v22 = 1;
      goto LABEL_64;
    }
    id v27 = [v73 objectForKeyedSubscript:@"responses"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v27)
      {
        if ([v27 count])
        {
          v66 = v21;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          __int16 v28 = v27;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v80 objects:v97 count:16];
          v67 = v28;
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v81;
            while (2)
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v81 != v31) {
                  objc_enumerationMutation(v28);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v56 = psg_default_log_handle();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
                  {
                    v63 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v63);
                    v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v86 = v64;
                    _os_log_fault_impl(&dword_23EAA9000, v56, OS_LOG_TYPE_FAULT, "Deserialized engagementMetrics elements was of class %@, something went wrong", buf, 0xCu);
                  }
                  char v22 = 0;
                  uint64_t v16 = 0;
                  goto LABEL_77;
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v80 objects:v97 count:16];
              if (v30) {
                continue;
              }
              break;
            }
          }

          v33 = psg_default_log_handle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_23EAA9000, v33, OS_LOG_TYPE_DEFAULT, "Successfully validated payload content", buf, 2u);
          }

          __int16 v34 = +[PSGDPDeviceMetricsCollector recorderForKey:@"com.apple.proactive.messages.SmartReplySelected"];
          uint64_t v35 = +[PSGDPDeviceMetricsCollector recorderForKey:@"com.apple.proactive.messages.SmartReplyIgnored"];
          __int16 v36 = (void *)v35;
          uint64_t v16 = 0;
          if (v34 && v35)
          {
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id obj = v28;
            uint64_t v37 = [obj countByEnumeratingWithState:&v76 objects:v96 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              v65 = v12;
              uint64_t v39 = *(void *)v77;
              char v22 = 1;
              v70 = v34;
              v71 = v15;
              uint64_t v68 = *(void *)v77;
              v69 = v36;
              do
              {
                uint64_t v40 = 0;
                uint64_t v72 = v38;
                do
                {
                  if (*(void *)v77 != v39) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v41 = *(void **)(*((void *)&v76 + 1) + 8 * v40);
                  BOOL v42 = +[PSGDPDeviceMetricsCollector recordEngagementMetrics:v41 selectedRecorder:v34 ignoredRecorder:v36];
                  v43 = psg_default_log_handle();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    v44 = [v41 lang];
                    v45 = [v41 rolloutId];
                    v46 = [v41 factorPackId];
                    v47 = [v41 experimentId];
                    v48 = [v41 treatmentId];
                    v49 = [v41 engagementDeltas];
                    uint64_t v50 = [v49 count];
                    *(_DWORD *)buf = 138413826;
                    v86 = v44;
                    __int16 v87 = 2112;
                    *(void *)v88 = v45;
                    *(_WORD *)&v88[8] = 2112;
                    *(void *)&v88[10] = v46;
                    *(_WORD *)&v88[18] = 2112;
                    v89 = v47;
                    __int16 v90 = 2112;
                    v91 = v48;
                    __int16 v92 = 2048;
                    uint64_t v93 = v50;
                    __int16 v94 = 1024;
                    BOOL v95 = v42;
                    _os_log_impl(&dword_23EAA9000, v43, OS_LOG_TYPE_DEFAULT, "Recorded engagement metrics running in language %@, rollout %@, factor pack %@, experiment %@, treatment %@, records %tu, success %d", buf, 0x44u);

                    uint64_t v38 = v72;
                    __int16 v36 = v69;

                    __int16 v34 = v70;
                    v15 = v71;

                    uint64_t v39 = v68;
                  }

                  v22 &= v42;
                  ++v40;
                }
                while (v38 != v40);
                uint64_t v38 = [obj countByEnumeratingWithState:&v76 objects:v96 count:16];
              }
              while (v38);
              id v14 = v75;
              id v12 = v65;
              uint64_t v16 = 0;
            }
            else
            {
              char v22 = 1;
            }
          }
          else
          {
            id obj = psg_default_log_handle();
            if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138413058;
              v86 = @"com.apple.proactive.messages.SmartReplySelected";
              __int16 v87 = 1024;
              *(_DWORD *)v88 = v34 == 0;
              *(_WORD *)&v88[4] = 2112;
              *(void *)&v88[6] = @"com.apple.proactive.messages.SmartReplyIgnored";
              *(_WORD *)&v88[14] = 1024;
              *(_DWORD *)&v88[16] = v36 == 0;
              _os_log_fault_impl(&dword_23EAA9000, obj, OS_LOG_TYPE_FAULT, "Bailing out because unable to create recorder for some key(s), %@: %d, %@: %d", buf, 0x22u);
            }
            char v22 = 0;
          }

LABEL_77:
          uint64_t v20 = v73;
          v21 = v66;
          goto LABEL_64;
        }
        v67 = v27;
        v59 = psg_default_log_handle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23EAA9000, v59, OS_LOG_TYPE_DEFAULT, "Received empty engagement rate data to process", buf, 2u);
        }

        char v22 = 1;
        goto LABEL_63;
      }
      v54 = psg_default_log_handle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_23EAA9000, v54, OS_LOG_TYPE_ERROR, "Deserialized engagementMetrics was nil, something went wrong", buf, 2u);
      }

      v67 = 0;
    }
    else
    {
      v53 = psg_default_log_handle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = v21;
        v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v86 = v62;
        _os_log_fault_impl(&dword_23EAA9000, v53, OS_LOG_TYPE_FAULT, "Deserialized engagementMetrics was of class %@, something went wrong", buf, 0xCu);

        v21 = v61;
      }
      v67 = v27;
    }
    char v22 = 0;
LABEL_63:
    uint64_t v20 = v73;
LABEL_64:

    goto LABEL_65;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_23EAA9000, v21, OS_LOG_TYPE_FAULT, "Received empty payload", buf, 2u);
  }
  char v22 = 1;
LABEL_65:

  return v22;
}

void __59__PSGDPDeviceMetricsCollector_sendEngagementToDPUsingData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = psg_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_23EAA9000, v6, OS_LOG_TYPE_DEFAULT, "Payload key %@ is of class %@", (uint8_t *)&v9, 0x16u);
  }
}

+ (id)onCompletionWithXPCActivityManager:(id)a3 activity:(id)a4 engagementMetrics:(id)a5 idsService:(id)a6 destinationDevice:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"SGDPDeviceMetricsCollectorErrorDomain" code:0 userInfo:0];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __122__PSGDPDeviceMetricsCollector_onCompletionWithXPCActivityManager_activity_engagementMetrics_idsService_destinationDevice___block_invoke;
  v25[3] = &unk_265037CB0;
  id v26 = v13;
  id v27 = v11;
  id v28 = v12;
  id v29 = v16;
  id v30 = v15;
  id v31 = v14;
  id v17 = v14;
  id v18 = v15;
  id v19 = v16;
  id v20 = v12;
  id v21 = v11;
  id v22 = v13;
  long long v23 = (void *)MEMORY[0x23ED0AD60](v25);

  return v23;
}

__CFString *__122__PSGDPDeviceMetricsCollector_onCompletionWithXPCActivityManager_activity_engagementMetrics_idsService_destinationDevice___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = objc_opt_new();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v51 objects:v69 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v52 != v7) {
            objc_enumerationMutation(v3);
          }
          int v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*((void *)&v51 + 1) + 8 * i)];
          id v10 = [v9 engagementDeltas];
          uint64_t v11 = [v10 count];

          if (v11)
          {
            [v2 addObject:v9];
            id v12 = [v9 engagementDeltas];
            uint64_t v6 = (__CFString *)((char *)v6 + [v12 count]);
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v51 objects:v69 count:16];
      }
      while (v5);
    }
    else
    {
      uint64_t v6 = 0;
    }

    id v15 = psg_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v56 = v6;
      _os_log_impl(&dword_23EAA9000, v15, OS_LOG_TYPE_DEFAULT, "Begin syncing for %tu records", buf, 0xCu);
    }

    if ([*(id *)(a1 + 40) shouldDefer:*(void *)(a1 + 48)])
    {
      uint64_t v16 = psg_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EAA9000, v16, OS_LOG_TYPE_DEFAULT, "Deferring engagement data syncing during initial completion block check", buf, 2u);
      }

      [*(id *)(a1 + 40) setState:*(void *)(a1 + 48) state:3];
      id v14 = (__CFString *)*(id *)(a1 + 56);
      goto LABEL_61;
    }
    if (!v6)
    {
      id v22 = psg_default_log_handle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EAA9000, v22, OS_LOG_TYPE_DEFAULT, "Completed engagement data syncing with no updates, no records to sync", buf, 2u);
      }

      [*(id *)(a1 + 40) setState:*(void *)(a1 + 48) state:5];
      id v14 = 0;
      goto LABEL_61;
    }
    v67[0] = @"responses";
    v67[1] = @"compatVer";
    v68[0] = v2;
    v68[1] = &unk_26F241E50;
    id v17 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
    id v18 = psg_default_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23EAA9000, v18, OS_LOG_TYPE_DEFAULT, "Begin records serialization", buf, 2u);
    }

    id v50 = 0;
    id v19 = [MEMORY[0x263F08910] archivedDataWithRootObject:v17 requiringSecureCoding:1 error:&v50];
    id v20 = (__CFString *)v50;
    if (v20)
    {
      id v14 = v20;
      id v21 = psg_default_log_handle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v14;
        _os_log_error_impl(&dword_23EAA9000, v21, OS_LOG_TYPE_ERROR, "Deferring engagement data syncing because of serialization error: %@", buf, 0xCu);
      }

      [*(id *)(a1 + 40) setState:*(void *)(a1 + 48) state:3];
      goto LABEL_60;
    }
    int v23 = [*(id *)(a1 + 40) shouldDefer:*(void *)(a1 + 48)];
    long long v24 = psg_default_log_handle();
    long long v25 = v24;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_23EAA9000, v25, OS_LOG_TYPE_ERROR, "Deferring engagement data syncing after data serialization", buf, 2u);
      }

      [*(id *)(a1 + 40) setState:*(void *)(a1 + 48) state:3];
      id v14 = (__CFString *)*(id *)(a1 + 56);
      goto LABEL_60;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [v19 length];
      *(_DWORD *)buf = 134217984;
      v56 = (__CFString *)v26;
      _os_log_impl(&dword_23EAA9000, v25, OS_LOG_TYPE_DEFAULT, "Serialized records with data size of %tu", buf, 0xCu);
    }

    id v27 = (void *)MEMORY[0x23ED0AB80]();
    id v28 = objc_alloc(MEMORY[0x263EFFA08]);
    id v29 = (void *)IDSCopyIDForDevice();
    id v30 = objc_msgSend(v28, "initWithObjects:", v29, 0);

    id v31 = psg_default_log_handle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23EAA9000, v31, OS_LOG_TYPE_DEFAULT, "Begin IDS sync request", buf, 2u);
    }

    __int16 v32 = *(void **)(a1 + 72);
    uint64_t v33 = *MEMORY[0x263F49F90];
    v65[0] = *MEMORY[0x263F49EE8];
    v65[1] = v33;
    v66[0] = MEMORY[0x263EFFA88];
    v66[1] = MEMORY[0x263EFFA88];
    v65[2] = *MEMORY[0x263F49F08];
    v66[2] = MEMORY[0x263EFFA88];
    __int16 v34 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];
    id v48 = 0;
    id v49 = 0;
    uint64_t v35 = [v32 sendData:v19 toDestinations:v30 priority:100 options:v34 identifier:&v49 error:&v48];
    id v36 = v49;
    uint64_t v37 = (__CFString *)v48;

    int v38 = [*(id *)(a1 + 40) shouldDefer:*(void *)(a1 + 48)];
    uint64_t v39 = psg_default_log_handle();
    uint64_t v40 = v39;
    if (v38)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_23EAA9000, v40, OS_LOG_TYPE_ERROR, "Deferring engagement data syncing after IDS sync call", buf, 2u);
      }

      [*(id *)(a1 + 40) setState:*(void *)(a1 + 48) state:3];
      uint64_t v41 = (__CFString *)*(id *)(a1 + 56);
    }
    else
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v42 = [NSNumber numberWithBool:v35];
        uint64_t v43 = [v19 length];
        *(_DWORD *)buf = 138413314;
        v56 = @"com.apple.private.alloy.suggestions.smartreplies";
        __int16 v57 = 2112;
        v58 = v42;
        __int16 v59 = 2112;
        id v60 = v36;
        __int16 v61 = 2048;
        uint64_t v62 = v43;
        __int16 v63 = 2112;
        v64 = v37;
        _os_log_impl(&dword_23EAA9000, v40, OS_LOG_TYPE_DEFAULT, "Performed IDS request for service %@, success %@, identifier %@, data size: %tu, error %@", buf, 0x34u);
      }
      if (v37) {
        char v44 = 0;
      }
      else {
        char v44 = v35;
      }
      if (v44)
      {
        v45 = psg_default_log_handle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23EAA9000, v45, OS_LOG_TYPE_DEFAULT, "Successfully passed data to IDS for syncing", buf, 2u);
        }

        [*(id *)(a1 + 40) setState:*(void *)(a1 + 48) state:5];
        uint64_t v37 = 0;
        id v14 = 0;
        goto LABEL_59;
      }
      if (!v37)
      {
        uint64_t v37 = [MEMORY[0x263F087E8] errorWithDomain:@"SGDPDeviceMetricsCollectorErrorDomain" code:1 userInfo:0];
      }
      v46 = psg_default_log_handle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v37;
        _os_log_error_impl(&dword_23EAA9000, v46, OS_LOG_TYPE_ERROR, "Deferring engagement data syncing because IDS failure: %@", buf, 0xCu);
      }

      [*(id *)(a1 + 40) setState:*(void *)(a1 + 48) state:3];
      uint64_t v41 = v37;
      uint64_t v37 = v41;
    }
    id v14 = v41;
LABEL_59:

LABEL_60:
LABEL_61:

    goto LABEL_62;
  }
  id v13 = psg_default_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EAA9000, v13, OS_LOG_TYPE_DEFAULT, "Completed engagement data syncing with no updates, no Trial information for device", buf, 2u);
  }

  [*(id *)(a1 + 40) setState:*(void *)(a1 + 48) state:5];
  id v14 = 0;
LABEL_62:
  return v14;
}

+ (id)onDeltaRowWithXPCActivityManager:(id)a3 activity:(id)a4 engagementMetrics:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"SGDPDeviceMetricsCollectorErrorDomain" code:0 userInfo:0];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __91__PSGDPDeviceMetricsCollector_onDeltaRowWithXPCActivityManager_activity_engagementMetrics___block_invoke;
  v17[3] = &unk_265037C88;
  id v18 = v7;
  id v19 = v8;
  id v20 = v10;
  id v21 = v9;
  id v22 = v23;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  id v14 = v7;
  id v15 = (void *)MEMORY[0x23ED0AD60](v17);

  _Block_object_dispose(v23, 8);
  return v15;
}

uint64_t __91__PSGDPDeviceMetricsCollector_onDeltaRowWithXPCActivityManager_activity_engagementMetrics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v26[5] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = psg_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_23EAA9000, v6, OS_LOG_TYPE_DEFAULT, "Begin validation for record", (uint8_t *)&v25, 2u);
  }

  if ([*(id *)(a1 + 32) shouldDefer:*(void *)(a1 + 40)])
  {
    id v7 = psg_default_log_handle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    LOWORD(v25) = 0;
    goto LABEL_6;
  }
  id v9 = *(void **)(a1 + 56);
  id v10 = [v5 lang];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11)
  {
    id v19 = psg_default_log_handle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v24 = [v5 lang];
      int v25 = 138412290;
      *(void *)uint64_t v26 = v24;
      _os_log_error_impl(&dword_23EAA9000, v19, OS_LOG_TYPE_ERROR, "Error for record due to us recording an unknown language code %@", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_25;
  }
  if (([v5 displayed] & 0x80000000) != 0 || (objc_msgSend(v5, "selected") & 0x80000000) != 0)
  {
    id v19 = psg_default_log_handle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = [v5 displayed];
      int v21 = [v5 selected];
      int v25 = 67109376;
      v26[0] = v20;
      LOWORD(v26[1]) = 1024;
      *(_DWORD *)((char *)&v26[1] + 2) = v21;
      _os_log_error_impl(&dword_23EAA9000, v19, OS_LOG_TYPE_ERROR, "Error for record due to negative value for displayed %d or selected %d", (uint8_t *)&v25, 0xEu);
    }
    goto LABEL_25;
  }
  if (![v5 displayed] && !objc_msgSend(v5, "selected"))
  {
    id v19 = psg_default_log_handle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_23EAA9000, v19, OS_LOG_TYPE_DEFAULT, "Skipping record since no delta in displayed or selected", (uint8_t *)&v25, 2u);
    }
LABEL_25:

    goto LABEL_26;
  }
  id v12 = psg_default_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_23EAA9000, v12, OS_LOG_TYPE_DEFAULT, "Validated record to sync", (uint8_t *)&v25, 2u);
  }

  id v13 = *(void **)(a1 + 56);
  id v14 = [v5 lang];
  id v15 = [v13 objectForKeyedSubscript:v14];
  uint64_t v16 = [v15 engagementDeltas];
  [v16 addObject:v5];

  if (++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) >= 0xD06uLL)
  {
    id v17 = psg_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      int v25 = 134217984;
      *(void *)uint64_t v26 = v18;
      _os_log_impl(&dword_23EAA9000, v17, OS_LOG_TYPE_DEFAULT, "Truncating number of responses to fetch since it's greater than %tu", (uint8_t *)&v25, 0xCu);
    }

    goto LABEL_9;
  }
  if (![*(id *)(a1 + 32) shouldDefer:*(void *)(a1 + 40)])
  {
LABEL_26:
    id v8 = (unsigned __int8 *)MEMORY[0x263F61EC8];
    goto LABEL_27;
  }
  id v7 = psg_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
LABEL_6:
    _os_log_impl(&dword_23EAA9000, v7, OS_LOG_TYPE_DEFAULT, "Deferring engagement data syncing during delta row iteration", (uint8_t *)&v25, 2u);
  }
LABEL_7:

  [*(id *)(a1 + 32) setState:*(void *)(a1 + 40) state:3];
  if (a3) {
    *a3 = *(id *)(a1 + 48);
  }
LABEL_9:
  id v8 = (unsigned __int8 *)MEMORY[0x263F61ED0];
LABEL_27:
  uint64_t v22 = *v8;

  return v22;
}

+ (id)recorderForKey:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F3A208];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithKey:v4];

  return v5;
}

+ (id)getActiveTrialInformationWithWithXPCActivityManager:(id)a3 activity:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v32 = a4;
  uint64_t v26 = MEMORY[0x23ED0AB80]();
  id v28 = objc_opt_new();
  id v31 = +[PSGExperimentResolver sharedInstance];
  id v5 = [v31 zkwLangAndNamespaces];
  uint64_t v6 = [v5 allKeys];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v7 = v6;
  uint64_t v30 = [v7 countByEnumeratingWithState:&v38 objects:v42 count:16];
  id v8 = 0;
  if (v30)
  {
    uint64_t v29 = *(void *)v39;
    id obj = v7;
LABEL_3:
    uint64_t v9 = 0;
    id v10 = v8;
    while (1)
    {
      if (*(void *)v39 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * v9);
      id v8 = [v31 getResponseSuggestionsExperimentConfig:v11 shouldDownloadAssets:0];

      if ([v33 shouldDefer:v32])
      {
        long long v24 = psg_default_log_handle();
        int v23 = (void *)v26;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23EAA9000, v24, OS_LOG_TYPE_DEFAULT, "Deferring engagement data syncing during trial information fetching", buf, 2u);
        }

        id v7 = obj;
        uint64_t v22 = 0;
        int v21 = v28;
        goto LABEL_17;
      }
      id v12 = [v8 rolloutIdentifiers];
      if (v12) {
        break;
      }
      id v13 = [v8 experimentIdentifiers];

      if (v13) {
        goto LABEL_10;
      }
LABEL_11:
      ++v9;
      id v10 = v8;
      if (v30 == v9)
      {
        id v7 = obj;
        uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v30) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }

LABEL_10:
    __int16 v34 = [PSGQuickResponsesEngagementMetrics alloc];
    id v36 = [v8 rolloutIdentifiers];
    uint64_t v35 = [v36 rolloutId];
    id v14 = [v8 rolloutIdentifiers];
    id v15 = [v14 factorPackId];
    uint64_t v16 = [v8 experimentIdentifiers];
    id v17 = [v16 experimentId];
    uint64_t v18 = [v8 experimentIdentifiers];
    id v19 = [v18 treatmentId];
    int v20 = [(PSGQuickResponsesEngagementMetrics *)v34 initWithLang:v11 rolloutId:v35 factorPackId:v15 experimentId:v17 treatmentId:v19];
    [v28 setObject:v20 forKeyedSubscript:v11];

    goto LABEL_11;
  }
LABEL_13:

  int v21 = v28;
  uint64_t v22 = (void *)[v28 copy];
  int v23 = (void *)v26;
LABEL_17:

  return v22;
}

+ (BOOL)recordEngagementMetrics:(id)a3 selectedRecorder:(id)a4 ignoredRecorder:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v29 = a4;
  id v28 = a5;
  id v8 = [v7 rolloutId];
  uint64_t v9 = [v7 factorPackId];
  id v10 = [v7 experimentId];
  uint64_t v11 = [v7 treatmentId];
  id v12 = +[PSGDPDeviceMetricsCollector getPrefixFromRolloutID:v8 factorPackId:v9 experimentId:v10 treatmentId:v11];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v27 = v7;
  id obj = [v7 engagementDeltas];
  uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    int v16 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v19 = [v18 response];
        if (!v19)
        {
          int v25 = psg_default_log_handle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_23EAA9000, v25, OS_LOG_TYPE_INFO, "Skipping DP logging for empty response.", buf, 2u);
          }
          goto LABEL_16;
        }
        unsigned int v20 = [v18 selected];
        int v21 = [v18 displayed];
        uint64_t v22 = v21 - [v18 selected];
        if ((v20 & 0x80000000) != 0 || (v22 & 0x80000000) != 0)
        {
          int v25 = psg_default_log_handle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)id v36 = v20;
            *(_WORD *)&v36[4] = 1024;
            *(_DWORD *)&v36[6] = v22;
            _os_log_error_impl(&dword_23EAA9000, v25, OS_LOG_TYPE_ERROR, "Skipping DP logging for response because invalid count for selected %d or ignored %d", buf, 0xEu);
          }
LABEL_16:

          goto LABEL_17;
        }
        int v23 = psg_default_log_handle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)id v36 = v20;
          *(_WORD *)&v36[8] = 2048;
          uint64_t v37 = v22;
          _os_log_impl(&dword_23EAA9000, v23, OS_LOG_TYPE_DEFAULT, "Logging message selected %tu, ignored %tu", buf, 0x16u);
        }

        BOOL v24 = +[PSGDPDeviceMetricsCollector recordResponse:v19 numTimesToLog:v20 recorder:v29 prefix:v12];
        v16 &= +[PSGDPDeviceMetricsCollector recordResponse:v19 numTimesToLog:v22 recorder:v28 prefix:v12]&& v24;
LABEL_17:
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (!v14) {
        goto LABEL_21;
      }
    }
  }
  LOBYTE(v16) = 1;
LABEL_21:

  return v16 & 1;
}

+ (BOOL)recordResponse:(id)a3 numTimesToLog:(unint64_t)a4 recorder:(id)a5 prefix:(id)a6
{
  v34[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if ([v9 length])
  {
    if (!a4)
    {
      BOOL v30 = 1;
      goto LABEL_35;
    }
    v34[0] = v11;
    v34[1] = v9;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    uint64_t v13 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @"|");

    uint64_t v14 = psg_default_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 134217984;
      unint64_t v33 = a4;
      _os_log_impl(&dword_23EAA9000, v14, OS_LOG_TYPE_DEFAULT, "Preparing to log message %tu times", (uint8_t *)&v32, 0xCu);
    }

    unint64_t v15 = [v13 length];
    unint64_t v16 = 0x800 / v15;
    if (v15 > 0x800) {
      unint64_t v16 = 1;
    }
    if (v16 >= a4) {
      unint64_t v17 = a4;
    }
    else {
      unint64_t v17 = v16;
    }
    unint64_t v18 = a4 / v17;
    unint64_t v19 = a4 / v17 * v17;
    unint64_t v20 = a4 % v17;
    int v21 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v17];
    uint64_t v22 = v21;
    while ([v21 count] < v17)
    {
      [v22 addObject:v13];
      int v21 = v22;
    }
    unint64_t v23 = 0;
    unint64_t v24 = 0;
    do
    {
      unsigned int v25 = [v10 record:v22];
      v24 += v25;
      v23 += v25 ^ 1;
    }
    while (v24 < v18 && v23 < 3);
    if (a4 != v19 && v23 <= 2)
    {
      id v27 = -[NSObject subarrayWithRange:](v22, "subarrayWithRange:", 0, v20);
      do
      {
        int v28 = [v10 record:v27];
        v23 += v28 ^ 1u;
      }
      while ((v28 & 1) == 0 && v23 < 3);
    }
    if (v23)
    {
      id v29 = psg_default_log_handle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        int v32 = 134217984;
        unint64_t v33 = v23;
        _os_log_error_impl(&dword_23EAA9000, v29, OS_LOG_TYPE_ERROR, "Call to recorder failed %tu times", (uint8_t *)&v32, 0xCu);
      }
    }
    BOOL v30 = v23 < 3;
  }
  else
  {
    uint64_t v22 = psg_default_log_handle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_error_impl(&dword_23EAA9000, v22, OS_LOG_TYPE_ERROR, "Logging of empty response is not allowed", (uint8_t *)&v32, 2u);
    }
    BOOL v30 = 0;
    uint64_t v13 = v9;
  }

  id v9 = v13;
LABEL_35:

  return v30;
}

+ (id)getPrefixFromRolloutID:(id)a3 factorPackId:(id)a4 experimentId:(id)a5 treatmentId:(id)a6
{
  v25[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (__CFString *)a4;
  id v11 = (__CFString *)a5;
  id v12 = (__CFString *)a6;
  uint64_t v13 = &stru_26F23C4F0;
  if (v10) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = &stru_26F23C4F0;
  }
  unint64_t v15 = v14;
  if (v11) {
    unint64_t v16 = v11;
  }
  else {
    unint64_t v16 = &stru_26F23C4F0;
  }
  unint64_t v17 = v16;
  if (v12) {
    unint64_t v18 = v12;
  }
  else {
    unint64_t v18 = &stru_26F23C4F0;
  }
  if (v12) {
    BOOL v19 = v11 != 0;
  }
  else {
    BOOL v19 = 0;
  }
  unint64_t v20 = v18;
  int v21 = v20;
  if (v10) {
    BOOL v22 = v9 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (!v22 || v19)
  {
    if (v19)
    {
      v25[0] = v17;
      v25[1] = v20;
      unint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
      objc_msgSend(v23, "_pas_componentsJoinedByString:", @"|");
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v13 = v15;
    }
  }

  return v13;
}

@end