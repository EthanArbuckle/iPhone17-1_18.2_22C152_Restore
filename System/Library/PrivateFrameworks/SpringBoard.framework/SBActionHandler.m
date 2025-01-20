@interface SBActionHandler
+ (id)sharedInstance;
- (BOOL)_shouldPromptForSecureDrawViolations;
- (void)_captureRadarAttachmentsWithCompletion:(id)a3;
- (void)_executeRestartAction:(id)a3 fromProcess:(id)a4;
- (void)_reportAndKillInsecureProcesses:(id)a3;
- (void)addActionHandler:(id)a3;
- (void)handleActions:(id)a3 origin:(id)a4 withResult:(id)a5;
- (void)removeActionHandler:(id)a3;
@end

@implementation SBActionHandler

+ (id)sharedInstance
{
  if (sharedInstance___once_6 != -1) {
    dispatch_once(&sharedInstance___once_6, &__block_literal_global_188);
  }
  v2 = (void *)sharedInstance___instance_7;
  return v2;
}

uint64_t __33__SBActionHandler_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBActionHandler);
  v1 = (void *)sharedInstance___instance_7;
  sharedInstance___instance_7 = (uint64_t)v0;

  return kdebug_trace();
}

- (void)handleActions:(id)a3 origin:(id)a4 withResult:(id)a5
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke;
  v115[3] = &unk_1E6B03980;
  id v11 = v10;
  id v116 = v11;
  v12 = (void *)MEMORY[0x1D948C7A0](v115);
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_2;
  v112[3] = &unk_1E6B039A8;
  id v13 = v9;
  id v113 = v13;
  id v14 = v12;
  id v114 = v14;
  v15 = (uint64_t (**)(void, void, void, void))MEMORY[0x1D948C7A0](v112);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v108 objects:v124 count:16];
  if (!v17)
  {

LABEL_81:
    (*((void (**)(id, void))v14 + 2))(v14, 0);
    goto LABEL_82;
  }
  id v74 = v14;
  id v75 = v11;
  uint64_t v88 = *(void *)v109;
  uint64_t v78 = *MEMORY[0x1E4F28228];
  uint64_t v85 = *MEMORY[0x1E4FA7028];
  char v18 = 1;
  uint64_t v76 = *MEMORY[0x1E4FA7048];
  uint64_t v73 = *MEMORY[0x1E4FA7038];
  uint64_t v71 = *MEMORY[0x1E4FA7030];
  uint64_t v72 = *MEMORY[0x1E4FA7040];
  uint64_t v79 = *MEMORY[0x1E4FA7020];
  id v82 = v13;
  id v83 = v16;
  v86 = v15;
  uint64_t v19 = v17;
  v77 = self;
  while (2)
  {
    uint64_t v20 = 0;
    uint64_t v84 = v19;
    do
    {
      if (*(void *)v109 != v88) {
        objc_enumerationMutation(v16);
      }
      if ((v18 & 1) == 0)
      {

        id v14 = v74;
        id v11 = v75;
        goto LABEL_82;
      }
      v21 = *(void **)(*((void *)&v108 + 1) + 8 * v20);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_17;
        v107[3] = &unk_1E6AF5290;
        v107[4] = self;
        v107[5] = v21;
        char v18 = ((uint64_t (**)(void, void *, __CFString *, void *))v15)[2](v15, v21, @"com.apple.backboardd", v107);
        goto LABEL_75;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v103[0] = MEMORY[0x1E4F143A8];
        v103[1] = 3221225472;
        v103[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_2_19;
        v103[3] = &unk_1E6AF4E00;
        id v104 = v13;
        v105 = self;
        v106 = v21;
        char v18 = ((uint64_t (**)(void, void *, __CFString *, void *))v15)[2](v15, v21, @"com.apple.frontboard.shutdown", v103);

        goto LABEL_75;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v21;
        v23 = [v22 identifier];

        v24 = [v22 slot];
        if ([v24 isEqualToString:v85])
        {
          v25 = [(id)SBApp windowSceneManager];
          v26 = [v25 activeDisplayWindowScene];
          char v27 = [v26 isContinuityDisplayWindowScene];

          char v18 = 1;
          if (v27)
          {
            id v13 = v82;
            id v16 = v83;
            v15 = v86;
            goto LABEL_72;
          }
          id v13 = v82;
          id v16 = v83;
          v15 = v86;
          if (!v23) {
            goto LABEL_72;
          }
        }
        else
        {

          v15 = v86;
          if (!v23)
          {
            char v18 = 1;
            goto LABEL_72;
          }
        }
        v31 = [v22 slot];
        int v32 = [v31 isEqualToString:v85];

        if (v32)
        {
          if ([v22 secureAppType])
          {
            v101[0] = MEMORY[0x1E4F143A8];
            v101[1] = 3221225472;
            v101[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_3;
            v101[3] = &unk_1E6AF4AC0;
            id v33 = v22;
            id v102 = v33;
            if (((uint64_t (**)(void, id, __CFString *, void *))v15)[2](v15, v33, @"com.apple.springboard.lockScreenContentAssertion", v101))
            {
              char v18 = 1;
              v34 = v102;
LABEL_73:

              goto LABEL_74;
            }
            v99[0] = MEMORY[0x1E4F143A8];
            v99[1] = 3221225472;
            v99[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_4;
            v99[3] = &unk_1E6AF4AC0;
            id v100 = v33;
            char v41 = ((uint64_t (**)(void, id, __CFString *, void *))v15)[2](v15, v100, @"com.apple.springboard.secureAppAssertion", v99);

            v42 = v102;
            goto LABEL_65;
          }
          goto LABEL_66;
        }
        v38 = [v22 slot];
        int v39 = [v38 isEqualToString:v76];

        if (v39)
        {
          v40 = [v22 identifier];

          if (v40)
          {
            v97[0] = MEMORY[0x1E4F143A8];
            v97[1] = 3221225472;
            v97[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_5;
            v97[3] = &unk_1E6AF4AC0;
            id v98 = v22;
            char v41 = ((uint64_t (**)(void, id, __CFString *, void *))v15)[2](v15, v98, @"com.apple.springboard.lockScreenContentAssertion", v97);
            v42 = v98;
LABEL_65:

            if (v41) {
              goto LABEL_66;
            }
            char v18 = 0;
LABEL_72:
            v34 = [MEMORY[0x1E4F28C58] errorWithDomain:v79 code:2 userInfo:0];
            v70 = [MEMORY[0x1E4F4F678] responseForError:v34];
            [v22 sendResponse:v70];

            goto LABEL_73;
          }
LABEL_66:
          char v18 = 1;
          goto LABEL_74;
        }
        v59 = [v22 slot];
        if (([v59 isEqualToString:v73] & 1) == 0)
        {
          v60 = [v22 slot];
          if (![v60 isEqualToString:v72])
          {
            v68 = [v22 slot];
            char v69 = [v68 isEqualToString:v71];

            v15 = v86;
            if ((v69 & 1) == 0)
            {
              char v18 = 1;
LABEL_71:
              id v16 = v83;
              goto LABEL_72;
            }
LABEL_55:
            v95[0] = MEMORY[0x1E4F143A8];
            v95[1] = 3221225472;
            v95[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_6;
            v95[3] = &unk_1E6AF5290;
            v95[4] = self;
            id v96 = v22;
            char v61 = ((uint64_t (**)(void, id, __CFString *, void *))v15)[2](v15, v96, @"com.apple.springboard.lockScreenContentAssertion", v95);

            if (v61)
            {
              char v18 = 1;
              id v16 = v83;
LABEL_74:

              uint64_t v19 = v84;
              goto LABEL_75;
            }
            char v18 = 0;
            goto LABEL_71;
          }

          v15 = v86;
        }

        goto LABEL_55;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = objc_opt_class();
        id v29 = v21;
        if (v28)
        {
          if (objc_opt_isKindOfClass()) {
            v30 = v29;
          }
          else {
            v30 = 0;
          }
        }
        else
        {
          v30 = 0;
        }
        id v43 = v30;

        v81 = v43;
        uint64_t v44 = [v43 persistedIdentifiers];
        v87 = v29;
        v80 = (void *)v44;
        if (v44)
        {
          v45 = (void *)v44;
          v46 = [MEMORY[0x1E4F1CA80] set];
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v47 = v45;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v91 objects:v123 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v92;
            do
            {
              for (uint64_t i = 0; i != v49; ++i)
              {
                if (*(void *)v92 != v50) {
                  objc_enumerationMutation(v47);
                }
                uint64_t v52 = *(void *)(*((void *)&v91 + 1) + 8 * i);
                v53 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
                v54 = [v53 existingSceneHandleForPersistenceIdentifier:v52];

                if (v54)
                {
                  [v46 addObject:v54];
                }
                else
                {
                  v55 = SBLogCommon();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v120 = 0;
                    __int16 v121 = 2112;
                    v122 = v87;
                  }
                }
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v91 objects:v123 count:16];
            }
            while (v49);
          }

          if ([v46 count])
          {
            v56 = SBApplicationSceneEntityDestructionMakeIntent([v81 preferredAnimationType], objc_msgSend(v81, "destroySceneSession"));
            v89[0] = MEMORY[0x1E4F143A8];
            v89[1] = 3221225472;
            v89[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_32;
            v89[3] = &unk_1E6B039F0;
            v89[4] = v87;
            id v90 = &__block_literal_global_28_1;
            SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v46, v56, v89);

            v57 = 0;
            uint64_t v58 = 0;
          }
          else
          {
            v57 = [NSString stringWithFormat:@"Unable to retrive SBDeviceApplicationSceneHandle-s from the provided persisted identifiers: %@", v47];
            uint64_t v58 = 2;
          }
          self = v77;
          id v16 = v83;
          uint64_t v19 = v84;

          if (!v57) {
            goto LABEL_63;
          }
        }
        else {
          v57 = {;
        }
          uint64_t v58 = 1;
          if (!v57)
          {
LABEL_63:

            char v18 = 1;
            id v13 = v82;
            v15 = v86;
            goto LABEL_75;
          }
        }
        v62 = SBLogCommon();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v120 = v57;
          _os_log_error_impl(&dword_1D85BA000, v62, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        v63 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v64 = SBActionHandlerErrorDomain;
        uint64_t v117 = v78;
        v118 = v57;
        v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
        v66 = [v63 errorWithDomain:v64 code:v58 userInfo:v65];

        __51__SBActionHandler_handleActions_origin_withResult___block_invoke_7(v67, v87, v66);
        id v16 = v83;
        goto LABEL_63;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v35 = [v21 locations];
        v36 = +[SBWallpaperController sharedInstance];
        v37 = [v36 wallpaperConfigurationManager];
        char v18 = 1;
        [v37 wallpaperDidChangeForVariants:v35 shouldNotify:1];

        v15 = v86;
      }
      else
      {
        char v18 = 1;
      }
LABEL_75:
      ++v20;
    }
    while (v20 != v19);
    uint64_t v19 = [v16 countByEnumeratingWithState:&v108 objects:v124 count:16];
    if (v19) {
      continue;
    }
    break;
  }

  id v14 = v74;
  id v11 = v75;
  if (v18) {
    goto LABEL_81;
  }
LABEL_82:
}

uint64_t __51__SBActionHandler_handleActions_origin_withResult___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __51__SBActionHandler_handleActions_origin_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) hasEntitlement:v8];
  if (v10)
  {
    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    id v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      int v15 = 138543618;
      id v16 = v8;
      __int16 v17 = 2114;
      char v18 = v13;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "Entitlement %{public}@ required for action: %{public}@", (uint8_t *)&v15, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v10;
}

uint64_t __51__SBActionHandler_handleActions_origin_withResult___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportAndKillInsecureProcesses:*(void *)(a1 + 40)];
}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_2_19(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F62448] sharedInstance];
  objc_msgSend(v2, "processForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) _executeRestartAction:*(void *)(a1 + 48) fromProcess:v3];
}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_3(uint64_t a1)
{
  id v2 = +[SBSecureAppManager sharedInstance];
  [v2 addLockScreenContentAction:*(void *)(a1 + 32)];
}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_4(uint64_t a1)
{
  id v2 = +[SBSecureAppManager sharedInstance];
  [v2 addLockScreenContentAction:*(void *)(a1 + 32)];
}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_5(uint64_t a1)
{
  id v2 = +[SBSecureAppManager sharedInstance];
  [v2 addLockScreenContentAction:*(void *)(a1 + 32)];
}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_6(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
      if (objc_msgSend(v7, "handlesActionWithClass:", objc_opt_class(), (void)v8))
      {
        if ([v7 handleAction:*(void *)(a1 + 40) forProvider:*(void *)(a1 + 32)]) {
          break;
        }
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  if ([v6 canSendResponse])
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F42940]) initWithInfo:0 error:v4];
    [v6 sendResponse:v5];
  }
}

uint64_t __51__SBActionHandler_handleActions_origin_withResult___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addActionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    externalHandlers = self->_externalHandlers;
    id v8 = v4;
    if (!externalHandlers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_externalHandlers;
      self->_externalHandlers = v6;

      externalHandlers = self->_externalHandlers;
    }
    [(NSHashTable *)externalHandlers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeActionHandler:(id)a3
{
}

- (void)_executeRestartAction:(id)a3 fromProcess:(id)a4
{
  id v16 = a3;
  id v4 = NSString;
  uint64_t v5 = FBSProcessPrettyDescription();
  id v6 = [v16 reason];
  id v7 = [v4 stringWithFormat:@"RestartTransitionRequest-(%@)-reason:%@", v5, v6];

  id v8 = [SBRestartTransitionRequest alloc];
  long long v9 = [v16 reason];
  long long v10 = [(SBRestartTransitionRequest *)v8 initWithRequester:v7 reason:v9];

  unsigned int v11 = [v16 options];
  char v12 = v11;
  if (v11) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = (v11 >> 2) & 1;
  }
  [(SBRestartTransitionRequest *)v10 setRestartType:v13];
  if ((v12 & 2) != 0) {
    [(SBRestartTransitionRequest *)v10 setWantsPersistentSnapshot:1];
  }
  id v14 = [v16 targetURL];
  [(SBRestartTransitionRequest *)v10 setApplicationLaunchURL:v14];

  int v15 = [(id)SBApp restartManager];
  [v15 restartWithTransitionRequest:v10];
}

- (void)_reportAndKillInsecureProcesses:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 secureModeViolations];
  id v6 = SBLogWorkspace();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v71 = v4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Received insecure drawing action %@", buf, 0xCu);
  }

  id v7 = [MEMORY[0x1E4F5E408] rootSettings];
  if ([v7 killsInsecureDrawingApps])
  {
    int v39 = self;
    v42 = v7;
    id v43 = v4;
    unsigned int v41 = getpid();
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    obuint64_t j = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v65 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "layerNamesByContext", v39);
          uint64_t v15 = [v14 count];

          if (v15)
          {
            id v16 = [v13 layerNamesByContext];
            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke;
            v60[3] = &unk_1E6B03A18;
            char v61 = v8;
            id v62 = v45;
            v63 = v13;
            [v16 enumerateKeysAndObjectsUsingBlock:v60];

            __int16 v17 = v61;
          }
          else
          {
            __int16 v17 = [v13 processId];
            [v45 addObject:v17];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
      }
      while (v10);
    }

    if ([v8 count])
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      char v18 = v8;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v56 objects:v68 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v57 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v56 + 1) + 8 * j);
            uint64_t v51 = MEMORY[0x1E4F143A8];
            uint64_t v52 = 3221225472;
            v53 = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_2;
            v54 = &unk_1E6AF8148;
            uint64_t v55 = v23;
            AnalyticsSendEventLazy();
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v56 objects:v68 count:16];
        }
        while (v20);
      }
    }
    if (!objc_msgSend(v45, "count", v39))
    {
      v24 = +[SBDefaults localDefaults];
      v25 = [v24 securityDefaults];
      char v26 = [v25 enableLayerBasedViewSecurity];

      if ((v26 & 1) == 0)
      {
        int v32 = SBLogWorkspace();
        id v7 = v42;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "Disregarding insecure drawing action because only layer-based violations were reported.", buf, 2u);
        }
        id v4 = v43;
        goto LABEL_42;
      }
    }
    char v27 = +[SBDefaults localDefaults];
    uint64_t v28 = [v27 securityDefaults];
    int v29 = [v28 enableLayerBasedViewSecurity];

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E4F1CAD0];
      v31 = objc_msgSend(obj, "bs_map:", &__block_literal_global_63_0);
      int v32 = [v30 setWithArray:v31];
    }
    else
    {
      int v32 = v45;
    }
    id v7 = v42;
    id v33 = (void *)MEMORY[0x1E4F1CAD0];
    v34 = [NSNumber numberWithInt:v41];
    uint64_t v35 = [v33 setWithObject:v34];
    int v36 = [v32 isEqualToSet:v35];

    if (v36)
    {
      v37 = SBLogWorkspace();
      id v4 = v43;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v38 = "Disregarding insecure drawing action because only SpringBoard violations were reported.";
LABEL_40:
        _os_log_impl(&dword_1D85BA000, v37, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
      }
    }
    else
    {
      id v4 = v43;
      if ([v32 count])
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_65;
        v46[3] = &unk_1E6B03A88;
        id v47 = obj;
        unsigned int v50 = v41;
        uint64_t v48 = v32;
        uint64_t v49 = v40;
        [v40 _captureRadarAttachmentsWithCompletion:v46];

        v37 = v47;
      }
      else
      {
        v37 = SBLogWorkspace();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v38 = "Disregarding insecure drawing action because no processes were selected for reporting.";
          goto LABEL_40;
        }
      }
    }

LABEL_42:
    goto LABEL_43;
  }
  id v8 = SBLogWorkspace();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Disregarding insecure drawing actions per configuration settings.", buf, 2u);
  }
LABEL_43:
}

void __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ([v6 count])
  {
    [*(id *)(a1 + 32) unionSet:v6];
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 48) processId];
    [v4 addObject:v5];
  }
}

id __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"layerName";
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

uint64_t __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_60(uint64_t a1, void *a2)
{
  return [a2 processId];
}

void __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_65(uint64_t a1, void *a2, int a3)
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a3)
  {
    uint64_t v5 = SBLogWorkspace();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_69;
    }
    *(_WORD *)buf = 0;
    id v6 = "Disregarding insecure drawing actions because attachments are still being gathered for a previous report.";
LABEL_65:
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_69;
  }
  id v7 = +[SBLockStateAggregator sharedInstance];
  char v8 = [v7 hasAnyLockState];

  if ((v8 & 1) == 0)
  {
    uint64_t v5 = SBLogWorkspace();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_69;
    }
    *(_WORD *)buf = 0;
    id v6 = "Disregarding insecure drawing actions because the UI is not locked.";
    goto LABEL_65;
  }
  uint64_t v5 = [MEMORY[0x1E4F62448] sharedInstance];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v74 = [obj countByEnumeratingWithState:&v100 objects:v114 count:16];
  if (!v74)
  {
    id v10 = 0;
    id v62 = 0;

    goto LABEL_68;
  }
  char v61 = v4;
  char v9 = 0;
  id v10 = 0;
  uint64_t v73 = *(void *)v101;
  id v62 = 0;
  uint64_t v11 = a1;
  v63 = v5;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v101 != v73) {
        objc_enumerationMutation(obj);
      }
      uint64_t v75 = v12;
      uint64_t v13 = *(void **)(*((void *)&v100 + 1) + 8 * v12);
      id v14 = [v13 processId];
      uint64_t v15 = [v14 intValue];

      if ((int)v15 < 1 || v15 == *(_DWORD *)(v11 + 56)) {
        goto LABEL_45;
      }
      id v16 = *(void **)(v11 + 40);
      __int16 v17 = [NSNumber numberWithInt:v15];
      LODWORD(v16) = [v16 containsObject:v17];

      if (!v16)
      {
        uint64_t v11 = a1;
LABEL_45:
        uint64_t v53 = v75;
        goto LABEL_46;
      }
      uint64_t v18 = [v5 processForPID:v15];
      uint64_t v11 = a1;
      v70 = (void *)v18;
      if (v18)
      {
        uint64_t v19 = (void *)v18;
        uint64_t v20 = [MEMORY[0x1E4F62490] sharedInstance];
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_68;
        v98[3] = &unk_1E6AFCC50;
        id v21 = v19;
        id v99 = v21;
        v68 = [v20 scenesPassingTest:v98];
        v96[0] = MEMORY[0x1E4F143A8];
        v96[1] = 3221225472;
        v96[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_2_70;
        v96[3] = &unk_1E6AFCC50;
        id v22 = v21;
        id v97 = v22;
        long long v66 = v20;
        long long v67 = [v20 scenesPassingTest:v96];
        char v69 = v22;
        uint64_t v23 = [v22 bundleIdentifier];
        v24 = SBLogWorkspace();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          long long v58 = [v69 state];
          *(_DWORD *)buf = 67109890;
          int v107 = v15;
          __int16 v108 = 2114;
          id v109 = v23;
          __int16 v110 = 2112;
          long long v111 = v58;
          __int16 v112 = 2114;
          id v113 = v67;
          _os_log_error_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_ERROR, "Killing process with pid %i (bundleID: %{public}@, state: %@, foreground scenes: %{public}@) for view security", buf, 0x26u);

          uint64_t v11 = a1;
        }

        long long v65 = [NSString stringWithFormat:@"com.apple.springboard.processesKilledForInsecureDrawing.%@", v23];
        ADClientAddValueForScalarKey();
        if (!v10)
        {
          v25 = [v69 handle];
          char v26 = [v25 name];
          id v10 = (id)[v26 copy];

          id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          uint64_t v28 = [v13 layerNamesByContext];
          v94[0] = MEMORY[0x1E4F143A8];
          v94[1] = 3221225472;
          v94[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_74;
          v94[3] = &unk_1E6B03A60;
          id v29 = v27;
          id v95 = v29;
          [v28 enumerateKeysAndObjectsUsingBlock:v94];

          if ([v29 count])
          {
            uint64_t v30 = [v29 copy];

            id v62 = (id)v30;
          }
          uint64_t v11 = a1;
        }
        if ([v69 isApplicationProcess])
        {
          id v64 = v10;
          v31 = +[SBLockStateAggregator sharedInstance];
          char v32 = [v31 lockState];

          id v33 = objc_msgSend(NSString, "stringWithFormat:", @"Process detected doing insecure drawing while in secure mode | isUILocked:%d", v32 & 1);
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          id v76 = v68;
          uint64_t v79 = [v76 countByEnumeratingWithState:&v90 objects:v105 count:16];
          if (v79)
          {
            uint64_t v77 = *(void *)v91;
            uint64_t v78 = v23;
            do
            {
              uint64_t v34 = 0;
              do
              {
                if (*(void *)v91 != v77) {
                  objc_enumerationMutation(v76);
                }
                uint64_t v35 = *(void **)(*((void *)&v90 + 1) + 8 * v34);
                int v36 = [v35 settings];
                v37 = [v35 identifier];
                v38 = [v33 stringByAppendingFormat:@" \n Scene %@ isOccluded:%d", v37, objc_msgSend(v36, "isOccluded")];

                objc_opt_class();
                v80 = v36;
                uint64_t v81 = v34;
                if (objc_opt_isKindOfClass())
                {
                  id v33 = objc_msgSend(v38, "stringByAppendingFormat:", @" isUnderlock:%d", objc_msgSend(v36, "underLock"));
                }
                else
                {
                  id v33 = v38;
                }
                long long v88 = 0u;
                long long v89 = 0u;
                long long v86 = 0u;
                long long v87 = 0u;
                int v39 = [v13 contextIds];
                uint64_t v40 = [v39 countByEnumeratingWithState:&v86 objects:v104 count:16];
                if (v40)
                {
                  uint64_t v41 = v40;
                  uint64_t v42 = *(void *)v87;
                  do
                  {
                    for (uint64_t i = 0; i != v41; ++i)
                    {
                      if (*(void *)v87 != v42) {
                        objc_enumerationMutation(v39);
                      }
                      uint64_t v44 = *(void **)(*((void *)&v86 + 1) + 8 * i);
                      uint64_t v45 = [v44 unsignedIntValue];
                      v46 = objc_msgSend(v33, "stringByAppendingFormat:", @" \n contextId:0x%x", v45);

                      id v47 = [v35 layerManager];
                      uint64_t v48 = [v47 layerWithContextID:v45];

                      if (v48)
                      {
                        [v48 level];
                        uint64_t v50 = objc_msgSend(v46, "stringByAppendingFormat:", @" level:%.1f", v49);

                        v46 = (void *)v50;
                      }
                      uint64_t v51 = [v13 layerNamesByContext];
                      uint64_t v52 = [v51 objectForKey:v44];

                      if ([v52 count])
                      {
                        id v33 = [v46 stringByAppendingFormat:@"\n   violating layer names:%@", v52];
                      }
                      else
                      {
                        id v33 = v46;
                      }
                    }
                    uint64_t v41 = [v39 countByEnumeratingWithState:&v86 objects:v104 count:16];
                  }
                  while (v41);
                }

                uint64_t v34 = v81 + 1;
                uint64_t v23 = v78;
              }
              while (v81 + 1 != v79);
              uint64_t v79 = [v76 countByEnumeratingWithState:&v90 objects:v105 count:16];
            }
            while (v79);
          }

          [v69 killForReason:8 andReport:1 withDescription:v33];
          uint64_t v5 = v63;
          id v10 = v64;
          uint64_t v11 = a1;
        }
        else
        {
          kill(v15, 9);
        }

        char v9 = 1;
        uint64_t v53 = v75;
        id v55 = v66;
      }
      else
      {
        v54 = BSExecutablePathForPID();
        id v55 = [v54 lastPathComponent];

        int v56 = kill(v15, 9);
        long long v57 = SBLogWorkspace();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109634;
          int v107 = v15;
          __int16 v108 = 2114;
          id v109 = v55;
          __int16 v110 = 1024;
          LODWORD(v111) = v56;
          _os_log_error_impl(&dword_1D85BA000, v57, OS_LOG_TYPE_ERROR, "Killing unknown process with pid %i for view security: %{public}@ (result: %i)", buf, 0x18u);
        }

        if (v56 == 3)
        {
          uint64_t v11 = a1;
          uint64_t v53 = v75;
        }
        else
        {
          uint64_t v11 = a1;
          uint64_t v53 = v75;
          if (v55)
          {
            if (v10)
            {
              char v9 = 1;
            }
            else
            {
              id v55 = v55;
              char v9 = 1;
              id v10 = v55;
            }
          }
        }
      }

LABEL_46:
      uint64_t v12 = v53 + 1;
    }
    while (v12 != v74);
    uint64_t v59 = [obj countByEnumeratingWithState:&v100 objects:v114 count:16];
    uint64_t v74 = v59;
  }
  while (v59);

  if ((v9 & 1) != 0 && [*(id *)(v11 + 48) _shouldPromptForSecureDrawViolations])
  {
    dispatch_time_t v60 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_94;
    block[3] = &unk_1E6AF4E00;
    id v10 = v10;
    id v83 = v10;
    id v62 = v62;
    id v84 = v62;
    id v4 = v61;
    id v85 = v61;
    dispatch_after(v60, MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v4 = v61;
  }
LABEL_68:

LABEL_69:
}

uint64_t __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 clientProcess];
  uint64_t v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    id v7 = [v3 settings];
    char v8 = objc_msgSend(v7, "sb_displayIdentityForSceneManagers");
    int v9 = [v8 isCarDisplay];

    uint64_t v6 = v9 ^ 1u;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_2_70(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 clientProcess];
  uint64_t v5 = *(void **)(a1 + 32);

  if (v4 == v5
    && ([v3 settings],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "sb_displayIdentityForSceneManagers"),
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isCarDisplay],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    uint64_t v11 = [v3 settings];
    if ([v11 isForeground]) {
      uint64_t v9 = [v11 isOccluded] ^ 1;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

void __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_94(void *a1)
{
  id v3 = objc_alloc_init(SBInsecureDrawingAlertItem);
  [(SBInsecureDrawingAlertItem *)v3 setProcessName:a1[4]];
  [(SBInsecureDrawingAlertItem *)v3 setLayerNames:a1[5]];
  [(SBDiagnosticRequestAlertItem *)v3 setRadarAttachments:a1[6]];
  id v2 = +[SBAlertItemsController sharedInstance];
  [v2 activateAlertItem:v3];
}

- (BOOL)_shouldPromptForSecureDrawViolations
{
  id v2 = +[SBPlatformController sharedInstance];
  if ([v2 isInternalInstall])
  {
    id v3 = +[SBDefaults localDefaults];
    id v4 = [v3 securityDefaults];
    char v5 = [v4 reportSecureDrawViolations];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_captureRadarAttachmentsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  if ([(SBActionHandler *)self _shouldPromptForSecureDrawViolations])
  {
    if (self->_capturingDisplayDump)
    {
      v4[2](v4, 0, 1);
    }
    else
    {
      self->_capturingDisplayDump = 1;
      char v5 = v4;
      BKSDisplayServicesArchiveWithOptionsAndCompletion();
    }
  }
  else if (v4)
  {
    v4[2](v4, 0, 0);
  }
}

void __58__SBActionHandler__captureRadarAttachmentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    uint64_t v20 = v4;
    uint64_t v18 = a1;
    char v5 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v6 = [v5 UUIDString];

    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v8 = [v7 temporaryDirectory];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = v3;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v15 = [NSString stringWithFormat:@"secureDrawViolation-%@-%@.caar", v14, v6];
          id v16 = [v8 URLByAppendingPathComponent:v15];
          __int16 v17 = [v9 objectForKeyedSubscript:v14];
          if ([v17 writeToURL:v16 atomically:0]) {
            [v20 addObject:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    a1 = v18;
    id v3 = v19;
    id v4 = v20;
  }
  if (*(void *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SBActionHandler__captureRadarAttachmentsWithCompletion___block_invoke_2;
    block[3] = &unk_1E6AF5A78;
    id v23 = *(id *)(a1 + 40);
    id v22 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
}

uint64_t __58__SBActionHandler__captureRadarAttachmentsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void).cxx_destruct
{
}

@end