@interface NRPreferWiFi
- (NRPreferWiFi)init;
- (void)dealloc;
- (void)resetInner;
- (void)updateAgentUUID:(uint64_t)a1;
@end

@implementation NRPreferWiFi

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_agentUUID, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)dealloc
{
  if (self)
  {
    path = self->_path;
    self->_path = 0;

    if (self->_evaluator)
    {
      nw_path_evaluator_cancel();
      evaluator = self->_evaluator;
      self->_evaluator = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NRPreferWiFi;
  [(NRPreferWiFi *)&v5 dealloc];
}

- (NRPreferWiFi)init
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)NRPreferWiFi;
  v2 = [(NRPreferWiFi *)&v30 init];
  if (!v2)
  {
    v8 = nrCopyLogObj_64();
    v9 = v8;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

      if (!v10)
      {
LABEL_17:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v20 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v20 = 136446210;
        *(void *)(v20 + 4) = "-[NRPreferWiFi init]";
        id v21 = nrCopyLogObj_64();
        _NRLogAbortWithPack(v21);
      }
    }
    id v14 = nrCopyLogObj_64();
    _NRLogWithArgs((uint64_t)v14, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v15, v16, v17, v18, v19, (uint64_t)"");

    goto LABEL_17;
  }
  v3 = v2;
  if (_NRShouldDebugAutoRelease_onceToken != -1) {
    dispatch_once(&_NRShouldDebugAutoRelease_onceToken, &__block_literal_global_40);
  }
  if (_NRShouldDebugAutoRelease_debugAutoRelease)
  {
    v4 = 0;
  }
  else
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  }
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.networkrelay.preferWiFi", v4);

  if (!v5)
  {
    v11 = nrCopyLogObj_64();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!v13)
      {
LABEL_20:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v28 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v28 = 136446466;
        *(void *)(v28 + 4) = "nr_dispatch_queue_create";
        *(_WORD *)(v28 + 12) = 2080;
        *(void *)(v28 + 14) = "com.apple.networkrelay.preferWiFi";
        id v29 = nrCopyLogObj_64();
        _NRLogAbortWithPack(v29);
      }
    }
    id v22 = nrCopyLogObj_64();
    _NRLogWithArgs((uint64_t)v22, 16, (uint64_t)"%s%.30s:%-4d ABORTING: dispatch_queue_create(%s) failed", v23, v24, v25, v26, v27, (uint64_t)"");

    goto LABEL_20;
  }
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v5;

  return v3;
}

uint64_t __30__NRPreferWiFi_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NRPreferWiFi);
  uint64_t v1 = sharedInstance_gPreferWiFiInstance;
  sharedInstance_gPreferWiFiInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __36__NRPreferWiFi_sharedInstanceForP2P__block_invoke()
{
  v0 = objc_alloc_init(NRPreferWiFi);
  uint64_t v1 = (void *)sharedInstanceForP2P_gPreferP2PWiFiInstance;
  sharedInstanceForP2P_gPreferP2PWiFiInstance = (uint64_t)v0;

  if (sharedInstanceForP2P_gPreferP2PWiFiInstance) {
    *(unsigned char *)(sharedInstanceForP2P_gPreferP2PWiFiInstance + 9) = 1;
  }
}

void __45__NRPreferWiFi_sharedInstanceForP2PImmediate__block_invoke()
{
  v0 = objc_alloc_init(NRPreferWiFi);
  uint64_t v1 = (void *)sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance;
  sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance = (uint64_t)v0;

  if (sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance) {
    *(_WORD *)(sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance + 9) = 257;
  }
}

- (void)resetInner
{
  if (!a1) {
    return;
  }
  if (nrCopyLogObj_onceToken_71 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
  }
  if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_INFO))
    && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 1, (uint64_t)"%s%.30s:%-4d Resetting state", a4, a5, a6, a7, a8, (uint64_t)""), nrCopyLogObj_onceToken_71 != -1))
  {
    dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
    if (sNRCopyLogToStdErr) {
      goto LABEL_9;
    }
  }
  else if (sNRCopyLogToStdErr)
  {
LABEL_9:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 1, (uint64_t)"%s%.30s:%-4d Setting prefer Wi-Fi assert count: %ld -> %ld", a4, a5, a6, a7, a8, (uint64_t)"");
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_INFO)) {
    goto LABEL_9;
  }
LABEL_10:
  v9 = *(void **)(a1 + 48);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 8) = 0;

  BOOL v10 = *(NSObject **)(a1 + 56);
  if (v10)
  {
    dispatch_source_cancel(v10);
    v11 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;
  }
  v12 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = 0;

  if (*(void *)(a1 + 32))
  {
    nw_path_evaluator_cancel();
    BOOL v13 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
}

- (void)updateAgentUUID:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    if (v3)
    {
      uint64_t v10 = nw_path_copy_netagent_dictionary();
      uint64_t v16 = (void *)v10;
      if (v10 && MEMORY[0x210512A10](v10) == MEMORY[0x263EF8708])
      {
        applier[0] = MEMORY[0x263EF8330];
        applier[1] = 3221225472;
        applier[2] = __32__NRPreferWiFi_updateAgentUUID___block_invoke;
        applier[3] = &unk_263FD1238;
        applier[4] = a1;
        xpc_dictionary_apply(v16, applier);
      }
      else
      {
        if (nrCopyLogObj_onceToken_71 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_ERROR)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 16, (uint64_t)"%s%.30s:%-4d No netagents to retrieve agent UUID", v11, v12, v13, v14, v15, (uint64_t)"");
        }
      }
    }
    else
    {
      if (nrCopyLogObj_onceToken_71 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 16, (uint64_t)"%s%.30s:%-4d No path to update agent UUID", v5, v6, v7, v8, v9, (uint64_t)"");
      }
    }
  }
}

uint64_t __32__NRPreferWiFi_updateAgentUUID___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  size_t length = 0;
  data = (const char *)xpc_dictionary_get_data(xdict, "data", &length);
  uint64_t result = 1;
  if (data && length >= 0xD8 && length == *((unsigned int *)data + 53) + 216)
  {
    if (!strcmp(data + 16, "com.apple.networkrelay") && !strcmp(data + 48, "PreferWiFi"))
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:data];
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        objc_storeStrong((id *)(v7 + 48), v6);
      }

      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void __30__NRPreferWiFi_submitRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v63[2] = *MEMORY[0x263EF8340];
  id v9 = *(id *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *((void *)v9 + 5);
  }
  else {
    uint64_t v10 = 0;
  }
  if (*(unsigned char *)(a1 + 40) != (v10 != 0))
  {
    if (*(unsigned char *)(a1 + 40))
    {
      id v21 = objc_alloc_init(MEMORY[0x263F14410]);
      [v21 requireNetworkAgentWithDomain:@"com.apple.networkrelay" type:@"PreferWiFi"];
      uint64_t v22 = *(void *)(a1 + 32);
      if (v22) {
        BOOL v23 = *(unsigned __int8 *)(v22 + 9) != 0;
      }
      else {
        BOOL v23 = 0;
      }
      [v21 setUseP2P:v23];
      uint64_t v24 = *(void *)(a1 + 32);
      if (v24 && *(unsigned char *)(v24 + 9) && *(unsigned char *)(v24 + 10)) {
        [v21 setTrafficClass:300];
      }
      uint64_t v25 = (void *)[v21 copyCParameters];
      evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
      nw_path_evaluator_set_update_handler();
      uint64_t v27 = nw_path_evaluator_copy_path();
      nw_path_status_t status = nw_path_get_status(v27);
      nw_path_status_t v29 = status;
      if (status <= nw_path_status_satisfiable && status != nw_path_status_satisfied)
      {
        uint64_t v30 = *(void *)(a1 + 32);
        if (v30) {
          *(unsigned char *)(v30 + 8) = 1;
        }
      }
      -[NRPreferWiFi updateAgentUUID:](*(void *)(a1 + 32), v27);
      uint64_t v36 = *(void *)(a1 + 32);
      if (v36 && (*(void *)(v36 + 48) || *(unsigned char *)(v36 + 8)))
      {
        objc_storeStrong((id *)(v36 + 32), evaluator_for_endpoint);
        uint64_t v37 = *(void *)(a1 + 32);
        if (v37)
        {
          objc_storeStrong((id *)(v37 + 24), v27);
          uint64_t v43 = *(void *)(a1 + 32);
          if (v43)
          {
            uint64_t v44 = *(void *)(v43 + 40) + 1;
            if (nrCopyLogObj_onceToken_71 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
            }
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_INFO)) {
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 1, (uint64_t)"%s%.30s:%-4d Setting prefer Wi-Fi assert count: %ld -> %ld", v38, v39, v40, v41, v42, (uint64_t)"");
            }
            *(void *)(v43 + 40) = v44;
            uint64_t v45 = *(void *)(a1 + 32);
            if (v45)
            {
              if (v29 == nw_path_status_satisfied)
              {
                v46 = *(void **)(v45 + 48);
                if (v46)
                {
                  v63[0] = 0;
                  v63[1] = 0;
                  [v46 getUUIDBytes:v63];
                  nw_path_assert_agent();
                }
              }
            }
          }
        }
      }
      else
      {
        if (nrCopyLogObj_onceToken_71 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_ERROR)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 16, (uint64_t)"%s%.30s:%-4d Failed to get agent UUID", v31, v32, v33, v34, v35, (uint64_t)"");
        }
      }

      return;
    }
    if (!v9 || (uint64_t v47 = *((void *)v9 + 5)) == 0)
    {
      if (nrCopyLogObj_onceToken_71 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 17, (uint64_t)"No prefer Wi-Fi request to disable", a4, a5, a6, a7, a8, v61);
      }
      goto LABEL_71;
    }
    if (nrCopyLogObj_onceToken_71 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_INFO)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 1, (uint64_t)"%s%.30s:%-4d Setting prefer Wi-Fi assert count: %ld -> %ld", a4, a5, a6, a7, a8, (uint64_t)"");
    }
    *((void *)v9 + 5) = v47 - 1;
    uint64_t v48 = *(void *)(a1 + 32);
    if (v48 && *(void *)(v48 + 40)) {
      return;
    }
    if (nrCopyLogObj_onceToken_71 == -1)
    {
      if (sNRCopyLogToStdErr) {
        goto LABEL_54;
      }
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
      if (sNRCopyLogToStdErr) {
        goto LABEL_54;
      }
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_INFO))
    {
LABEL_71:
      uint64_t v58 = *(void *)(a1 + 32);
      [(NRPreferWiFi *)v58 resetInner];
      return;
    }
LABEL_54:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 1, (uint64_t)"%s%.30s:%-4d All clients of prefer Wi-Fi went away", a4, a5, a6, a7, a8, (uint64_t)"");
    goto LABEL_71;
  }
  if (v10)
  {
    if (v9)
    {
      id v11 = *((id *)v9 + 3);
      uint64_t v12 = *(void *)(a1 + 32);
      if (v11)
      {
        id v9 = v11;
        if (!v12) {
          goto LABEL_88;
        }
      }
      else
      {
        if (!v12)
        {
          id v9 = 0;
          goto LABEL_88;
        }
        if (*(void *)(v12 + 40)) {
          goto LABEL_57;
        }
        id v9 = 0;
      }
      id v13 = *(id *)(v12 + 24);
      if (v13)
      {
        uint64_t v14 = *(void *)(a1 + 32);
        if (v14)
        {
          uint64_t v15 = *(void *)(v14 + 40);

          if (!v15) {
            goto LABEL_57;
          }
          goto LABEL_89;
        }

LABEL_57:
        if (nrCopyLogObj_onceToken_71 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_FAULT))
        {
          uint64_t v51 = *(void *)(a1 + 32);
          if (v51) {
            uint64_t v52 = *(void *)(v51 + 24);
          }
          else {
            uint64_t v52 = 0;
          }
          id v62 = (id)nrCopyLogObj_sNRLogObj_72;
          _NRLogWithArgs((uint64_t)v62, 17, (uint64_t)"Something went wrong <path: %@, assert count: %ld>", v53, v54, v55, v56, v57, v52);
        }
        return;
      }
    }
LABEL_88:

LABEL_89:
    uint64_t v59 = *(void *)(a1 + 32);
    if (v59)
    {
      uint64_t v60 = *(void *)(v59 + 40) + 1;
      if (nrCopyLogObj_onceToken_71 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_INFO)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 1, (uint64_t)"%s%.30s:%-4d Setting prefer Wi-Fi assert count: %ld -> %ld", v16, v17, v18, v19, v20, (uint64_t)"");
      }
      *(void *)(v59 + 40) = v60;
    }
    return;
  }
  if (nrCopyLogObj_onceToken_71 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_INFO)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 1, (uint64_t)"%s%.30s:%-4d Ignoring setting prefer Wi-Fi to %d", a4, a5, a6, a7, a8, (uint64_t)"");
  }
}

void __30__NRPreferWiFi_submitRequest___block_invoke_2(uint64_t a1, void *a2)
{
  v38[2] = *MEMORY[0x263EF8340];
  id v9 = a2;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10 && *(void *)(v10 + 40))
  {
    objc_storeStrong((id *)(v10 + 24), a2);
    if (nrCopyLogObj_onceToken_71 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_INFO))
    {
      id v11 = (id)nrCopyLogObj_sNRLogObj_72;
      _NRLogWithArgs((uint64_t)v11, 1, (uint64_t)"%s%.30s:%-4d Received path: %@", v12, v13, v14, v15, v16, (uint64_t)"");
    }
    uint64_t v17 = *(void *)(a1 + 32);
    if (v17)
    {
      -[NRPreferWiFi updateAgentUUID:](v17, *(void **)(v17 + 24));
      uint64_t v18 = *(void *)(a1 + 32);
      if (v18)
      {
LABEL_10:
        uint64_t v19 = *(NSObject **)(v18 + 24);
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 32);
      if (v18) {
        goto LABEL_10;
      }
    }
    uint64_t v19 = 0;
LABEL_11:
    nw_path_status_t status = nw_path_get_status(v19);
    if ((status & 0xFFFFFFFE) == 2)
    {
      uint64_t v26 = *(void *)(a1 + 32);
      if (v26 && *(void *)(v26 + 40)) {
        *(unsigned char *)(v26 + 8) = 1;
      }
      goto LABEL_39;
    }
    if (status != nw_path_status_satisfied) {
      goto LABEL_39;
    }
    uint64_t v27 = *(void *)(a1 + 32);
    if (!v27 || !*(void *)(v27 + 40) || !*(unsigned char *)(v27 + 8)) {
      goto LABEL_39;
    }
    if (*(void *)(v27 + 48))
    {
      if (nrCopyLogObj_onceToken_71 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_INFO)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 1, (uint64_t)"%s%.30s:%-4d Reasserting the agent", v21, v22, v23, v24, v25, (uint64_t)"");
      }
      v38[0] = 0;
      v38[1] = 0;
      uint64_t v28 = *(void *)(a1 + 32);
      if (v28) {
        nw_path_status_t v29 = *(void **)(v28 + 48);
      }
      else {
        nw_path_status_t v29 = 0;
      }
      [v29 getUUIDBytes:v38];
      nw_path_assert_agent();
      uint64_t v30 = *(void *)(a1 + 32);
      if (v30) {
        *(unsigned char *)(v30 + 8) = 0;
      }
      goto LABEL_39;
    }
    if (nrCopyLogObj_onceToken_71 == -1)
    {
      if (sNRCopyLogToStdErr) {
        goto LABEL_38;
      }
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
      if (sNRCopyLogToStdErr) {
        goto LABEL_38;
      }
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_FAULT)) {
      goto LABEL_39;
    }
LABEL_38:
    id v31 = nrCopyLogObj_64();
    _NRLogWithArgs((uint64_t)v31, 17, (uint64_t)"No agent UUID while path is satisfied", v32, v33, v34, v35, v36, v37);

    goto LABEL_39;
  }
  if (nrCopyLogObj_onceToken_71 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_72, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_72, 17, (uint64_t)"Received path update when we have no requests", v4, v5, v6, v7, v8, v37);
  }
LABEL_39:
}

@end