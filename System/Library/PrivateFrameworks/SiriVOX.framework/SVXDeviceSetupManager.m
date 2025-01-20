@interface SVXDeviceSetupManager
- (SVXDeviceSetupManager)initWithModule:(id)a3;
- (void)_prepareForSetupWithContext:(id)a3 completion:(id)a4;
- (void)_setContext:(id)a3 forUUID:(id)a4;
- (void)_setEffectiveContext:(id)a3;
- (void)_updateEffectiveContext;
- (void)addListener:(id)a3;
- (void)getContextWithCompletion:(id)a3;
- (void)prepareForSetupWithContext:(id)a3 completion:(id)a4;
- (void)removeListener:(id)a3;
- (void)sessionManager:(id)a3 didActivateWithContext:(id)a4;
- (void)setContext:(id)a3 forUUID:(id)a4;
- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4;
- (void)stopWithModuleInstanceProvider:(id)a3;
@end

@implementation SVXDeviceSetupManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveContext, 0);
  objc_storeStrong((id *)&self->_activatedDeviceSetupFlowScene, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_contextsByUUID, 0);
  objc_storeStrong((id *)&self->_announcer, 0);
  objc_storeStrong((id *)&self->_audioServicesUtils, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);

  objc_storeStrong((id *)&self->_module, 0);
}

- (void)_setEffectiveContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self->_effectiveContext;
  v6 = (SVXDeviceSetupContext *)v4;
  v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (v6 && v5)
    {
      BOOL v8 = [(SVXDeviceSetupContext *)v5 isEqual:v6];

      if (v8) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      effectiveContext = self->_effectiveContext;
      int v13 = 136315650;
      v14 = "-[SVXDeviceSetupManager _setEffectiveContext:]";
      __int16 v15 = 2112;
      v16 = effectiveContext;
      __int16 v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s %@ -> %@", (uint8_t *)&v13, 0x20u);
    }
    v11 = (SVXDeviceSetupContext *)[(SVXDeviceSetupContext *)v7 copy];
    v12 = self->_effectiveContext;
    self->_effectiveContext = v11;

    [(SVXDeviceSetupAnnouncer *)self->_announcer deviceSetupManager:self didUpdateContext:self->_effectiveContext];
  }
LABEL_11:
}

- (void)_updateEffectiveContext
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__13813;
  v18 = __Block_byref_object_dispose__13814;
  id v19 = 0;
  contextsByUUID = self->_contextsByUUID;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__SVXDeviceSetupManager__updateEffectiveContext__block_invoke;
  v13[3] = &unk_264554828;
  v13[4] = &v14;
  [(NSMutableDictionary *)contextsByUUID enumerateKeysAndObjectsUsingBlock:v13];
  id v4 = (NSObject **)MEMORY[0x263F28348];
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v6 = (void *)v15[5];
    *(_DWORD *)buf = 136315394;
    v21 = "-[SVXDeviceSetupManager _updateEffectiveContext]";
    __int16 v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s latestContext = %@", buf, 0x16u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__SVXDeviceSetupManager__updateEffectiveContext__block_invoke_13;
  v12[3] = &unk_264554850;
  v12[4] = self;
  v7 = (void *)MEMORY[0x223C65C40](v12);
  BOOL v8 = (void *)v15[5];
  if (v8)
  {
    id v9 = [v8 mutatedCopyWithMutator:v7];
LABEL_8:
    v10 = v9;
    goto LABEL_9;
  }
  if (self->_beginDate || self->_endDate)
  {
    id v9 = +[SVXDeviceSetupContext newWithBuilder:v7];
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:
  v11 = *v4;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SVXDeviceSetupManager _updateEffectiveContext]";
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s effectiveContext = %@", buf, 0x16u);
  }
  [(SVXDeviceSetupManager *)self _setEffectiveContext:v10];

  _Block_object_dispose(&v14, 8);
}

void __48__SVXDeviceSetupManager__updateEffectiveContext__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  unint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timestamp];
  if (v5 < [v6 timestamp]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

void __48__SVXDeviceSetupManager__updateEffectiveContext__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
  id v4 = a2;
  [v4 setFlowScene:v3];
  [v4 setBeginDate:*(void *)(*(void *)(a1 + 32) + 56)];
  [v4 setEndDate:*(void *)(*(void *)(a1 + 32) + 64)];
}

- (void)_setContext:(id)a3 forUUID:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = (NSDate *)a3;
  id v7 = a4;
  BOOL v8 = (os_log_t *)MEMORY[0x263F28348];
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v37 = "-[SVXDeviceSetupManager _setContext:forUUID:]";
    __int16 v38 = 2112;
    v39 = v6;
    __int16 v40 = 2112;
    id v41 = v7;
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s context = %@, uuid = %@", buf, 0x20u);
  }
  contextsByUUID = self->_contextsByUUID;
  if (v6)
  {
    if (![(NSMutableDictionary *)contextsByUUID count])
    {
      activatedDeviceSetupFlowScene = self->_activatedDeviceSetupFlowScene;
      self->_activatedDeviceSetupFlowScene = 0;

      v12 = [MEMORY[0x263EFF910] date];
      beginDate = self->_beginDate;
      self->_beginDate = v12;

      endDate = self->_endDate;
      self->_endDate = 0;

      if (!self->_contextsByUUID)
      {
        __int16 v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v16 = self->_contextsByUUID;
        self->_contextsByUUID = v15;
      }
      __int16 v17 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        v18 = self->_beginDate;
        *(_DWORD *)buf = 136315394;
        v37 = "-[SVXDeviceSetupManager _setContext:forUUID:]";
        __int16 v38 = 2112;
        v39 = v18;
        _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_INFO, "%s Begin device setup at %@.", buf, 0x16u);
      }
    }
    [(NSMutableDictionary *)self->_contextsByUUID setObject:v6 forKey:v7];
LABEL_10:
    int v19 = 1;
    goto LABEL_11;
  }
  v21 = [(NSMutableDictionary *)contextsByUUID objectForKey:v7];

  if (v21)
  {
    [(NSMutableDictionary *)self->_contextsByUUID removeObjectForKey:v7];
    if (![(NSMutableDictionary *)self->_contextsByUUID count])
    {
      __int16 v22 = self->_activatedDeviceSetupFlowScene;
      self->_activatedDeviceSetupFlowScene = 0;

      v23 = [MEMORY[0x263EFF910] date];
      uint64_t v24 = self->_endDate;
      self->_endDate = v23;

      v25 = self->_contextsByUUID;
      self->_contextsByUUID = 0;

      v26 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        v27 = self->_endDate;
        *(_DWORD *)buf = 136315394;
        v37 = "-[SVXDeviceSetupManager _setContext:forUUID:]";
        __int16 v38 = 2112;
        v39 = v27;
        _os_log_impl(&dword_220062000, v26, OS_LOG_TYPE_INFO, "%s End device setup at %@.", buf, 0x16u);
      }
      v28 = self->_beginDate;
      v29 = self->_endDate;
      v30 = [(SVXModule *)self->_module performer];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __45__SVXDeviceSetupManager__setContext_forUUID___block_invoke;
      v33[3] = &unk_2645547B0;
      v33[4] = self;
      v34 = v28;
      v35 = v29;
      v31 = v29;
      v32 = v28;
      [v30 performBlock:v33 afterDelay:60.0];
    }
    goto LABEL_10;
  }
  int v19 = 0;
LABEL_11:
  v20 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[SVXDeviceSetupManager _setContext:forUUID:]";
    __int16 v38 = 1024;
    LODWORD(v39) = v19;
    _os_log_impl(&dword_220062000, v20, OS_LOG_TYPE_INFO, "%s needsUpdate = %d", buf, 0x12u);
  }
  if (v19) {
    [(SVXDeviceSetupManager *)self _updateEffectiveContext];
  }
}

void __45__SVXDeviceSetupManager__setContext_forUUID___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 48);
    int v23 = 136315394;
    uint64_t v24 = "-[SVXDeviceSetupManager _setContext:forUUID:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s contextsByUUID = %@", (uint8_t *)&v23, 0x16u);
    uint64_t v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 56);
    int v23 = 136315650;
    uint64_t v24 = "-[SVXDeviceSetupManager _setContext:forUUID:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v20;
    __int16 v27 = 2112;
    uint64_t v28 = v19;
    _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s beginDate = %@ (actual), beginDate = %@ (expected)", (uint8_t *)&v23, 0x20u);
    uint64_t v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 64);
    uint64_t v22 = *(void *)(a1 + 48);
    int v23 = 136315650;
    uint64_t v24 = "-[SVXDeviceSetupManager _setContext:forUUID:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v21;
    __int16 v27 = 2112;
    uint64_t v28 = v22;
    _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s endDate = %@ (actual), endDate = %@ (expected)", (uint8_t *)&v23, 0x20u);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 48) count]) {
    goto LABEL_20;
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = *(id *)(*(void *)(a1 + 32) + 56);
  id v6 = v4;
  if (v5 == v6)
  {
  }
  else
  {
    id v7 = v6;
    if (!v5 || !v6) {
      goto LABEL_19;
    }
    int v8 = [v5 isEqual:v6];

    if (!v8)
    {
LABEL_20:
      v12 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
      {
        int v23 = 136315138;
        uint64_t v24 = "-[SVXDeviceSetupManager _setContext:forUUID:]_block_invoke";
        _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s No need to clean up device setup.", (uint8_t *)&v23, 0xCu);
      }
      return;
    }
  }
  id v9 = *(void **)(a1 + 48);
  id v5 = *(id *)(*(void *)(a1 + 32) + 64);
  id v10 = v9;
  if (v5 == v10)
  {

    goto LABEL_24;
  }
  id v7 = v10;
  if (!v5 || !v10)
  {
LABEL_19:

    goto LABEL_20;
  }
  int v11 = [v5 isEqual:v10];

  if (!v11) {
    goto LABEL_20;
  }
LABEL_24:
  int v13 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    int v23 = 136315138;
    uint64_t v24 = "-[SVXDeviceSetupManager _setContext:forUUID:]_block_invoke";
    _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s Clean up device setup.", (uint8_t *)&v23, 0xCu);
  }
  uint64_t v14 = *(void *)(a1 + 32);
  __int16 v15 = *(void **)(v14 + 56);
  *(void *)(v14 + 56) = 0;

  uint64_t v16 = *(void *)(a1 + 32);
  __int16 v17 = *(void **)(v16 + 64);
  *(void *)(v16 + 64) = 0;

  [*(id *)(a1 + 32) _updateEffectiveContext];
}

- (void)_prepareForSetupWithContext:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SVXDeviceSetupManager _prepareForSetupWithContext:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  id v9 = [(SVXModule *)self->_module performer];
  id v10 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__13813;
  uint64_t v19 = __Block_byref_object_dispose__13814;
  uint64_t v20 = [[SVXDeviceSetupFlowScene alloc] initWithSceneID:5 displayKeyFrames:0];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SVXDeviceSetupManager__prepareForSetupWithContext_completion___block_invoke;
  block[3] = &unk_264554800;
  id v15 = v7;
  uint64_t v16 = buf;
  id v14 = v9;
  id v11 = v7;
  id v12 = v9;
  dispatch_group_notify(v10, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(buf, 8);
}

void __64__SVXDeviceSetupManager__prepareForSetupWithContext_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = v2;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    objc_msgSend(v2, "addObject:");
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__SVXDeviceSetupManager__prepareForSetupWithContext_completion___block_invoke_2;
  v7[3] = &unk_2645547D8;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performBlock:v7];
}

void __64__SVXDeviceSetupManager__prepareForSetupWithContext_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = [NSString alloc];
    uint64_t v3 = AFBuildVersion();
    id v6 = (id)[v2 initWithFormat:@"HomePod Siri Device Setup Flow (Build %@)", v3];

    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [[SVXDeviceSetupFlow alloc] initWithIdentifier:v6 scenes:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, SVXDeviceSetupFlow *, void))(v4 + 16))(v4, v5, 0);
  }
}

- (void)sessionManager:(id)a3 didActivateWithContext:(id)a4
{
  id v5 = a4;
  id v6 = [(SVXModule *)self->_module performer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__SVXDeviceSetupManager_sessionManager_didActivateWithContext___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performBlock:v8];
}

void __63__SVXDeviceSetupManager_sessionManager_didActivateWithContext___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 48) count])
  {
    id v2 = [*(id *)(a1 + 40) systemEvent];
    if ([v2 type] == 7)
    {
      uint64_t v3 = [v2 deviceSetupFlowScene];
      uint64_t v4 = v3;
      if (v3)
      {
        uint64_t v5 = [v3 copy];
        uint64_t v6 = *(void *)(a1 + 32);
        id v7 = *(void **)(v6 + 72);
        *(void *)(v6 + 72) = v5;

        id v8 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 72);
          int v10 = 136315394;
          id v11 = "-[SVXDeviceSetupManager sessionManager:didActivateWithContext:]_block_invoke";
          __int16 v12 = 2112;
          uint64_t v13 = v9;
          _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s activatedDeviceSetupFlowScene = %@", (uint8_t *)&v10, 0x16u);
        }
        [*(id *)(a1 + 32) _updateEffectiveContext];
      }
    }
  }
}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  uint64_t v4 = [(SVXModule *)self->_module performer];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__SVXDeviceSetupManager_stopWithModuleInstanceProvider___block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [v4 performBlock:v5];
}

void __56__SVXDeviceSetupManager_stopWithModuleInstanceProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeActivationListener:");
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(SVXModule *)self->_module performer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__SVXDeviceSetupManager_startWithModuleInstanceProvider_platformDependencies___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performBlock:v8];
}

uint64_t __78__SVXDeviceSetupManager_startWithModuleInstanceProvider_platformDependencies___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) speechSynthesizer];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  uint64_t v5 = [*(id *)(a1 + 40) sessionManager];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  id v8 = *(void **)(*(void *)(a1 + 32) + 24);

  return objc_msgSend(v8, "addActivationListener:");
}

- (SVXDeviceSetupManager)initWithModule:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SVXDeviceSetupManager;
  uint64_t v6 = [(SVXDeviceSetupManager *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_module, a3);
    id v8 = objc_alloc_init(SVXDeviceSetupAnnouncer);
    announcer = v7->_announcer;
    v7->_announcer = v8;

    int v10 = objc_alloc_init(SVXAudioServicesUtils);
    audioServicesUtils = v7->_audioServicesUtils;
    v7->_audioServicesUtils = v10;
  }
  return v7;
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  id v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SVXDeviceSetupManager_removeListener___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __40__SVXDeviceSetupManager_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeListener:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  id v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SVXDeviceSetupManager_addListener___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __37__SVXDeviceSetupManager_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addListener:*(void *)(a1 + 40)];
}

- (void)getContextWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SVXDeviceSetupManager_getContextWithCompletion___block_invoke;
  v7[3] = &unk_2645547D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __50__SVXDeviceSetupManager_getContextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 80));
  }
  return result;
}

- (void)setContext:(id)a3 forUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[SVXDeviceSetupManager setContext:forUUID:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@, uuid = %@", buf, 0x20u);
  }
  id v9 = [(SVXModule *)self->_module performer];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__SVXDeviceSetupManager_setContext_forUUID___block_invoke;
  v12[3] = &unk_2645547B0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performBlock:v12];
}

uint64_t __44__SVXDeviceSetupManager_setContext_forUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setContext:*(void *)(a1 + 40) forUUID:*(void *)(a1 + 48)];
}

- (void)prepareForSetupWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[SVXDeviceSetupManager prepareForSetupWithContext:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  [(SVXAudioServicesUtils *)self->_audioServicesUtils audioServicesActivateWithTimeout];
  id v9 = [(SVXModule *)self->_module performer];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__SVXDeviceSetupManager_prepareForSetupWithContext_completion___block_invoke;
  v12[3] = &unk_264554788;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performBlock:v12];
}

uint64_t __63__SVXDeviceSetupManager_prepareForSetupWithContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareForSetupWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

@end