@interface PRUpdater
- (BOOL)shouldAcceptConnection:(id)a3;
- (PRUpdater)initWithDelegate:(id)a3;
- (void)_dequeueNextCallOutIfPossible;
- (void)_disconnect:(id)a3;
- (void)_enqueueCallOut:(id)a3;
- (void)updateConfiguration:(id)a3 sessionInfo:(id)a4 completion:(id)a5;
- (void)updateDescriptors:(id)a3 sessionInfo:(id)a4 completion:(id)a5;
@end

@implementation PRUpdater

- (PRUpdater)initWithDelegate:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v18.receiver = self;
    v18.super_class = (Class)PRUpdater;
    v8 = [(PRUpdater *)&v18 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_delegate, a3);
      uint64_t Serial = BSDispatchQueueCreateSerial();
      queue = v9->_queue;
      v9->_queue = (OS_dispatch_queue *)Serial;

      uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
      lock_connections = v9->_lock_connections;
      v9->_lock_connections = (NSMutableSet *)v12;

      uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
      lock_callOutBlocks = v9->_lock_callOutBlocks;
      v9->_lock_callOutBlocks = (NSMutableArray *)v14;
    }
    return v9;
  }
  else
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"delegate"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRUpdater initWithDelegate:](a2);
    }
    [v17 UTF8String];
    result = (PRUpdater *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableSet *)self->_lock_connections containsObject:v5])
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"![_lock_connections containsObject:connection]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRUpdater shouldAcceptConnection:](a2);
    }
    [v8 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    [(NSMutableSet *)self->_lock_connections addObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    objc_initWeak(&location, v5);
    [v5 _setQueue:self->_queue];
    id v6 = +[PRUpdatingService interfaceToExtension];
    [v5 setExportedInterface:v6];

    [v5 setExportedObject:self];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__PRUpdater_shouldAcceptConnection___block_invoke;
    v9[3] = &unk_1E54DC888;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    [v5 setInvalidationHandler:v9];
    [v5 activate];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

    return 1;
  }
  return result;
}

void __36__PRUpdater_shouldAcceptConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = PRSLogPosterContents();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __36__PRUpdater_shouldAcceptConnection___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) _disconnect:WeakRetained];
}

- (void)updateDescriptors:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)MEMORY[0x1E4F4F6A8];
  v13 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v14 = [v12 tokenFromNSXPCConnection:v13];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke;
  v19[3] = &unk_1E54DC928;
  id v23 = v11;
  SEL v24 = a2;
  v19[4] = self;
  id v20 = v9;
  id v21 = v14;
  id v22 = v10;
  id v15 = v10;
  id v16 = v14;
  id v17 = v9;
  id v18 = v11;
  [(PRUpdater *)self _enqueueCallOut:v19];
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = objc_opt_new();
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2;
  v38[3] = &unk_1E54DC8D8;
  id v8 = v7;
  id v9 = *(void **)(a1 + 64);
  uint64_t v45 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 32);
  id v39 = v8;
  uint64_t v40 = v10;
  id v43 = v9;
  id v11 = v6;
  id v44 = v11;
  id v41 = *(id *)(a1 + 40);
  id v42 = *(id *)(a1 + 48);
  uint64_t v12 = (void (**)(void, void, void))MEMORY[0x192F91830](v38);
  dispatch_time_t v13 = dispatch_time(0, 0x14F46B0000);
  uint64_t v14 = [MEMORY[0x1E4F924D8] sharedWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_54;
  block[3] = &unk_1E54DC900;
  id v15 = v8;
  id v35 = v15;
  id v36 = *(id *)(a1 + 64);
  id v16 = v11;
  id v37 = v16;
  dispatch_after(v13, v14, block);

  if ([*(id *)(a1 + 48) hasEntitlement:@"com.apple.runningboard.posterkit.host"])
  {
    id v28 = v16;
    v29 = v5;
    id v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = [[PRPosterDescriptor alloc] _initWithPath:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          SEL v24 = [v23 identifier];
          [v17 setObject:v23 forKey:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v46 count:16];
      }
      while (v20);
    }

    id v5 = v29;
    if (objc_opt_respondsToSelector())
    {
      v25 = -[PRUpdatingSessionInfo _initWithInfo:]((id *)[PRUpdatingSessionInfo alloc], *(void **)(a1 + 56));
      [v29 updateDescriptors:v17 withSessionInfo:v25 completion:v12];

      id v16 = v28;
    }
    else
    {
      id v16 = v28;
      if (objc_opt_respondsToSelector())
      {
        [v29 updateDescriptors:v17 completion:v12];
      }
      else
      {
        v27 = objc_msgSend(MEMORY[0x1E4F28C58], "pr_errorWithCode:", 2);
        ((void (**)(void, void, void *))v12)[2](v12, 0, v27);
      }
    }
  }
  else
  {
    if ([*(id *)(a1 + 48) isInvalid]) {
      uint64_t v26 = 5;
    }
    else {
      uint64_t v26 = 6;
    }
    id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "pr_errorWithCode:", v26);
    ((void (**)(void, void, void *))v12)[2](v12, 0, v17);
  }
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v60 = (void *)a1;
  if ([*(id *)(a1 + 32) signal])
  {
    uint64_t v7 = MEMORY[0x192F915E0]();
    id v8 = v5;
    if (v8)
    {
      NSClassFromString(&cfstr_Nsarray.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v50 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_7();
        }
        [v50 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18C27AC44);
      }
    }
    context = (void *)v7;

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v70 objects:v81 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v71 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v70 + 1) + 8 * i);
          NSClassFromString(&cfstr_Prposterdescri_5.isa);
          if (!v14)
          {
            id v44 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_5();
            }
            [v44 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x18C27A9F8);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v45 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterDescriptorClass]"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_5();
            }
            [v45 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x18C27AA58);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v70 objects:v81 count:16];
      }
      while (v11);
    }

    if (v8)
    {
      if (v6)
      {
        id v15 = PRSLogPosterContents();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_4();
        }
      }
      id v51 = v6;
      id v52 = v5;
      uint64_t v16 = [v9 count];
      v56 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
      v58 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      obuint64_t j = v9;
      uint64_t v17 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v59 = *(void *)v67;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v67 != v59) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void **)(*((void *)&v66 + 1) + 8 * j);
            uint64_t v21 = [v20 _path];
            id v22 = [v21 descriptorIdentifier];
            if (![v22 length])
            {
              v46 = [NSString stringWithFormat:@"replacement descriptor doesn't look valid : %@", v20];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_2();
              }
              [v46 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x18C27AB50);
            }
            id v23 = (void *)v60[6];
            v64[0] = MEMORY[0x1E4F143A8];
            v64[1] = 3221225472;
            v64[2] = __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_42;
            v64[3] = &unk_1E54DC8B0;
            id v24 = v22;
            id v65 = v24;
            uint64_t v25 = objc_msgSend(v23, "bs_firstObjectPassingTest:", v64);
            uint64_t v26 = (void *)v25;
            if (v21) {
              BOOL v27 = v25 == 0;
            }
            else {
              BOOL v27 = 1;
            }
            if (!v27)
            {
              id v28 = [v21 role];
              v29 = [v26 role];
              char v30 = [v28 isEqual:v29];

              if ((v30 & 1) == 0)
              {
                uint64_t v47 = NSString;
                v48 = [v20 descriptorIdentifier];
                v49 = [v47 stringWithFormat:@"replaced descriptor '%@' has changed its role? : %@", v48, v20];

                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                  __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_3();
                }
                [v49 UTF8String];
                _bs_set_crash_log_message();
                __break(0);
                JUMPOUT(0x18C27ABC0);
              }
            }
            long long v31 = [v21 serverIdentity];

            if (v31)
            {
              [v58 addObject:v21];
            }
            else
            {
              uint64_t v32 = v60[7];
              id v63 = 0;
              long long v33 = [v21 extendContentsReadAccessToAuditToken:v32 error:&v63];
              id v34 = v63;
              if (v33)
              {
                id v35 = [v21 extendValidityForReason:@"updateDescriptors-result"];
                if (v35) {
                  [v56 addObject:v35];
                }
                [v58 addObject:v33];
              }
              else
              {
                id v35 = PRSLogPosterContents();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
                {
                  v55 = [MEMORY[0x1E4F28B50] mainBundle];
                  v54 = [v55 bundleIdentifier];
                  *(_DWORD *)buf = 138412802;
                  v75 = v54;
                  __int16 v76 = 2112;
                  id v77 = v34;
                  __int16 v78 = 2112;
                  v79 = v20;
                  _os_log_fault_impl(&dword_18C1C4000, v35, OS_LOG_TYPE_FAULT, "PRUpdater %@ failed to extend access of replacement descriptor to server with error=%@ : %@", buf, 0x20u);
                }
              }
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
        }
        while (v18);
      }

      uint64_t v36 = [v56 count];
      id v37 = objc_alloc(MEMORY[0x1E4F924C0]);
      v38 = v37;
      if (v36)
      {
        id v39 = [MEMORY[0x1E4F924D8] sharedWorkloop];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_52;
        v61[3] = &unk_1E54DAFB8;
        id v62 = v56;
        uint64_t v40 = v58;
        id v41 = (void *)[v38 initWithPaths:v58 queue:v39 invalidationHandler:v61];
      }
      else
      {
        uint64_t v40 = v58;
        id v41 = (void *)[v37 initWithPaths:v58];
      }
      id v6 = v51;
      id v5 = v52;
      id v43 = context;
      (*(void (**)(void))(v60[8] + 16))();
      (*(void (**)(void))(v60[9] + 16))();
    }
    else
    {
      id v42 = PRSLogPosterContents();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_1();
      }

      (*(void (**)(void))(v60[8] + 16))();
      (*(void (**)(void))(v60[9] + 16))();
      id v43 = context;
    }
  }
}

uint64_t __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_42(uint64_t a1, void *a2)
{
  v3 = [a2 descriptorIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_52(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "invalidate", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_54(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) signal];
  uint64_t v3 = PRSLogPosterContents();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_54_cold_1();
    }

    uint64_t v5 = *(void *)(a1 + 40);
    long long v6 = (void *)MEMORY[0x1E4F28C58];
    v17[0] = *MEMORY[0x1E4F28588];
    v17[1] = @"clientBundleIdentifier";
    v18[0] = @"Client timed out";
    long long v7 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v8 = [v7 bundleIdentifier];
    long long v9 = (void *)v8;
    uint64_t v10 = @"(null bundleIdentifier)";
    if (v8) {
      uint64_t v10 = (__CFString *)v8;
    }
    v18[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v12 = objc_msgSend(v6, "pr_errorWithCode:userInfo:", 7, v11);
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v12);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v13 = [MEMORY[0x1E4F28B50] mainBundle];
      id v14 = [v13 bundleIdentifier];
      int v15 = 138412290;
      uint64_t v16 = v14;
      _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "PRUpdater %@ ran successfully", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)updateConfiguration:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)MEMORY[0x1E4F4F6A8];
  dispatch_time_t v13 = [MEMORY[0x1E4F29268] currentConnection];
  id v14 = [v12 tokenFromNSXPCConnection:v13];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke;
  v19[3] = &unk_1E54DC928;
  id v23 = v11;
  SEL v24 = a2;
  v19[4] = self;
  id v20 = v9;
  id v21 = v14;
  id v22 = v10;
  id v15 = v10;
  id v16 = v14;
  id v17 = v9;
  id v18 = v11;
  [(PRUpdater *)self _enqueueCallOut:v19];
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = objc_opt_new();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2;
  v27[3] = &unk_1E54DC950;
  id v8 = v7;
  id v9 = *(void **)(a1 + 64);
  uint64_t v34 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 32);
  id v28 = v8;
  uint64_t v29 = v10;
  id v32 = v9;
  id v11 = v6;
  id v33 = v11;
  id v30 = *(id *)(a1 + 40);
  id v31 = *(id *)(a1 + 48);
  uint64_t v12 = (void (**)(void, void, void))MEMORY[0x192F91830](v27);
  dispatch_time_t v13 = dispatch_time(0, 0x14F46B0000);
  id v14 = [MEMORY[0x1E4F924D8] sharedWorkloop];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_89;
  id v23 = &unk_1E54DC900;
  id v15 = v8;
  id v24 = v15;
  id v25 = *(id *)(a1 + 64);
  id v16 = v11;
  id v26 = v16;
  dispatch_after(v13, v14, &v20);

  if (objc_msgSend(*(id *)(a1 + 48), "hasEntitlement:", @"com.apple.runningboard.posterkit.host", v20, v21, v22, v23))
  {
    if (*(void *)(a1 + 40))
    {
      id v17 = [[PRPosterConfiguration alloc] _initWithPath:*(void *)(a1 + 40)];
      if (objc_opt_respondsToSelector())
      {
        id v18 = -[PRUpdatingSessionInfo _initWithInfo:]((id *)[PRUpdatingSessionInfo alloc], *(void **)(a1 + 56));
        [v5 updateConfiguration:v17 withSessionInfo:v18 completion:v12];
LABEL_13:

        goto LABEL_14;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        id v18 = objc_msgSend(MEMORY[0x1E4F28C58], "pr_errorWithCode:", 2);
        ((void (**)(void, void, void *))v12)[2](v12, 0, v18);
        goto LABEL_13;
      }
      [v5 updateConfiguration:v17 completion:v12];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pr_errorWithCode:", 1);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void, id))v12)[2](v12, 0, v17);
    }
  }
  else
  {
    if ([*(id *)(a1 + 48) isInvalid]) {
      uint64_t v19 = 5;
    }
    else {
      uint64_t v19 = 6;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "pr_errorWithCode:", v19);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, id))v12)[2](v12, 0, v17);
  }
LABEL_14:
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) signal])
  {
    long long v7 = (void *)MEMORY[0x192F915E0]();
    id v8 = v5;
    if (!v8)
    {
      uint64_t v21 = PRSLogPosterContents();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      goto LABEL_24;
    }
    id v9 = v8;
    NSClassFromString(&cfstr_Prposterconfig.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_5();
      }
      [v28 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C27B7E8);
    }

    if (v6)
    {
      uint64_t v10 = PRSLogPosterContents();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_4();
      }
    }
    id v11 = [v9 _path];
    uint64_t v12 = [v11 role];
    dispatch_time_t v13 = [*(id *)(a1 + 48) role];
    char v14 = [v12 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      uint64_t v29 = NSString;
      id v30 = [v9 descriptorIdentifier];
      id v31 = [v29 stringWithFormat:@"replaced configuration '%@' has changed its role? : %@", v30, v9];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_3();
      }
      [v31 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C27B858);
    }
    id v15 = [v11 serverIdentity];

    if (v15)
    {
      if (!v11)
      {
        id v19 = 0;
        uint64_t v20 = 0;
        id v18 = 0;
LABEL_23:
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

LABEL_24:
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v22 = *(void *)(a1 + 56);
      id v34 = 0;
      uint64_t v20 = [v11 extendContentsReadAccessToAuditToken:v22 error:&v34];
      id v17 = v34;
      if (!v20)
      {

        BOOL v27 = PRSLogPosterContents();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_2((uint64_t)v17, (uint64_t)v9, v27);
        }

        id v19 = 0;
        uint64_t v20 = 0;
        id v18 = 0;
        goto LABEL_22;
      }
      id v23 = [v11 extendValidityForReason:@"updateConfiguration-result"];

      if (v23)
      {
        id v24 = objc_alloc(MEMORY[0x1E4F924C0]);
        v36[0] = v20;
        id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
        id v26 = [MEMORY[0x1E4F924D8] sharedWorkloop];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_87;
        v32[3] = &unk_1E54DAFB8;
        id v19 = v23;
        id v33 = v19;
        id v18 = (void *)[v24 initWithPaths:v25 queue:v26 invalidationHandler:v32];

        id v17 = v33;
        goto LABEL_22;
      }
      id v11 = v20;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F924C0]);
    id v35 = v11;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    id v18 = (void *)[v16 initWithPaths:v17];
    id v19 = 0;
    uint64_t v20 = v11;
LABEL_22:

    goto LABEL_23;
  }
LABEL_25:
}

uint64_t __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_87(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_89(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) signal];
  uint64_t v3 = PRSLogPosterContents();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_89_cold_1();
    }

    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = (void *)MEMORY[0x1E4F28C58];
    v17[0] = *MEMORY[0x1E4F28588];
    v17[1] = @"clientBundleIdentifier";
    v18[0] = @"Client timed out";
    long long v7 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v8 = [v7 bundleIdentifier];
    id v9 = (void *)v8;
    uint64_t v10 = @"(null bundleIdentifier)";
    if (v8) {
      uint64_t v10 = (__CFString *)v8;
    }
    v18[1] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v12 = objc_msgSend(v6, "pr_errorWithCode:userInfo:", 7, v11);
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v12);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v13 = [MEMORY[0x1E4F28B50] mainBundle];
      char v14 = [v13 bundleIdentifier];
      int v15 = 138412290;
      id v16 = v14;
      _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "PRUpdater %@ ran updateConfiguration successfully", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_enqueueCallOut:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x192F915E0]();
  id v6 = (void *)[v4 copy];
  os_unfair_lock_lock(&self->_lock);
  lock_callOutBlocks = self->_lock_callOutBlocks;
  uint64_t v8 = (void *)MEMORY[0x192F91830](v6);
  [(NSMutableArray *)lock_callOutBlocks addObject:v8];

  os_unfair_lock_unlock(&self->_lock);
  id v9 = PRSLogPosterContents();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PRUpdater _enqueueCallOut:]();
  }

  [(PRUpdater *)self _dequeueNextCallOutIfPossible];
}

- (void)_dequeueNextCallOutIfPossible
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v5 = [v4 bundleIdentifier];
  id v6 = (void *)MEMORY[0x192F91830](a1);
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_DEBUG, "PRUpdater %@: calling dequeued delegate block %@", (uint8_t *)&v7, 0x16u);
}

void __42__PRUpdater__dequeueNextCallOutIfPossible__block_invoke(uint64_t a1)
{
  id v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PRUpdater__dequeueNextCallOutIfPossible__block_invoke_2;
  block[3] = &unk_1E54DC978;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __42__PRUpdater__dequeueNextCallOutIfPossible__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _dequeueNextCallOutIfPossible];
    id WeakRetained = v2;
  }
}

- (void)_disconnect:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableSet *)self->_lock_connections containsObject:v6])
  {
    [(NSMutableSet *)self->_lock_connections removeObject:v6];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    uint64_t v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_lock_connections containsObject:connection]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRUpdater _disconnect:](a2);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_callOutBlocks, 0);
  objc_storeStrong((id *)&self->_lock_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:(const char *)a1 .cold.1(const char *a1)
{
  id v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)shouldAcceptConnection:(const char *)a1 .cold.1(const char *a1)
{
  id v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

void __36__PRUpdater_shouldAcceptConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16();
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];
  OUTLINED_FUNCTION_0_1(&dword_18C1C4000, v2, v3, "PRUpdater %@ did invalidate %p", v4, v5, v6, v7, 2u);
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_16();
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_1(&dword_18C1C4000, v2, v3, "PRUpdater %@ failed to return replacement descriptors with error=%@", v4, v5, v6, v7, v8);
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_9_0(v2, *MEMORY[0x1E4F143B8]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_9_0(v2, *MEMORY[0x1E4F143B8]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_4_0();
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_12(&dword_18C1C4000, v2, v3, "PRUpdater %@ returned replacement descriptors with error=%@ : %@", v4, v5, v6, v7, v8);
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_9_0(v2, *MEMORY[0x1E4F143B8]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_cold_7()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_9_0(v2, *MEMORY[0x1E4F143B8]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);
}

void __54__PRUpdater_updateDescriptors_sessionInfo_completion___block_invoke_2_54_cold_1()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];
  OUTLINED_FUNCTION_14_0(&dword_18C1C4000, v2, v3, "PRUpdater updateDescriptors timed out for client %@ .", v4, v5, v6, v7, 2u);
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_16();
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_1(&dword_18C1C4000, v2, v3, "PRUpdater %@ failed to return replacement configuration with error=%@", v4, v5, v6, v7, v8);
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v5 = [v4 bundleIdentifier];
  OUTLINED_FUNCTION_3_2();
  _os_log_fault_impl(&dword_18C1C4000, a3, OS_LOG_TYPE_FAULT, "PRUpdater %@ failed to extend access of replacement configuration to server with error=%@ : %@", v6, 0x20u);
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_9_0(v2, *MEMORY[0x1E4F143B8]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_4_0();
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_12(&dword_18C1C4000, v2, v3, "PRUpdater %@ returned replacement configuration with error=%@ : %@", v4, v5, v6, v7, v8);
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_9_0(v2, *MEMORY[0x1E4F143B8]);
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v5, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v6, v7, v8, v9, v10);
}

void __56__PRUpdater_updateConfiguration_sessionInfo_completion___block_invoke_2_89_cold_1()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];
  OUTLINED_FUNCTION_14_0(&dword_18C1C4000, v2, v3, "PRUpdater updateConfiguration timed out for client %@ .", v4, v5, v6, v7, 2u);
}

- (void)_enqueueCallOut:.cold.1()
{
  OUTLINED_FUNCTION_16();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  uint64_t v4 = (void *)MEMORY[0x192F91830](v1);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_18C1C4000, v0, OS_LOG_TYPE_DEBUG, "PRUpdater %@: enqueued delegate block %@", (uint8_t *)&v5, 0x16u);
}

- (void)_disconnect:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end