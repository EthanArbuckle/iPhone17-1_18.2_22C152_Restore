@interface NRDevicePreferencesQuickRelay
- (NRDevicePreferencesQuickRelay)initWithNRUUID:(id)a3;
- (uint64_t)assertAgent;
- (void)addQuickRelayRequest;
- (void)dealloc;
- (void)removeAllQuickRelayRequests;
- (void)removeQuickRelayRequest;
- (void)resetInner;
- (void)setAssertCount:(uint64_t)a1;
- (void)updateAgentUUID:(uint64_t)a1;
@end

@implementation NRDevicePreferencesQuickRelay

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_agentUUID, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)removeAllQuickRelayRequests
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__NRDevicePreferencesQuickRelay_removeAllQuickRelayRequests__block_invoke;
  block[3] = &unk_263FD1360;
  block[4] = self;
  dispatch_async(queue, block);
}

void __60__NRDevicePreferencesQuickRelay_removeAllQuickRelayRequests__block_invoke(uint64_t a1)
{
}

- (void)resetInner
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (nrCopyLogObj_onceToken_852 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_854, OS_LOG_TYPE_INFO)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_854, 1, (uint64_t)"%s%.30s:%-4d Resetting state", v2, v3, v4, v5, v6, (uint64_t)"");
    }
    -[NRDevicePreferencesQuickRelay setAssertCount:](a1, 0);
    *(unsigned char *)(a1 + 8) = 0;
    v7 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    v8 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    if (*(void *)(a1 + 48))
    {
      nw_path_evaluator_cancel();
      v9 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;
    }
  }
}

- (void)setAssertCount:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (nrCopyLogObj_onceToken_852 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_854, OS_LOG_TYPE_INFO)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_854, 1, (uint64_t)"%s%.30s:%-4d Setting quick relay assert count: %ld -> %ld", v4, v5, v6, v7, v8, (uint64_t)"");
    }
    *(void *)(a1 + 56) = a2;
  }
}

- (void)removeQuickRelayRequest
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__NRDevicePreferencesQuickRelay_removeQuickRelayRequest__block_invoke;
  block[3] = &unk_263FD1360;
  block[4] = self;
  dispatch_async(queue, block);
}

void __56__NRDevicePreferencesQuickRelay_removeQuickRelayRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (!v9 || (uint64_t v10 = *(void *)(v9 + 56)) == 0)
  {
    if (nrCopyLogObj_onceToken_852 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_854, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    uint64_t v12 = nrCopyLogObj_sNRLogObj_854;
    v13 = "No quick relay request to disable";
    int v14 = 17;
    goto LABEL_16;
  }
  -[NRDevicePreferencesQuickRelay setAssertCount:](v9, v10 - 1);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11 && *(void *)(v11 + 56)) {
    return;
  }
  if (nrCopyLogObj_onceToken_852 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_854, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = nrCopyLogObj_sNRLogObj_854;
    v16 = "";
    v13 = "%s%.30s:%-4d All clients of quick relay went away";
    int v14 = 1;
LABEL_16:
    _NRLogWithArgs(v12, v14, (uint64_t)v13, a4, a5, a6, a7, a8, (uint64_t)v16);
  }
LABEL_17:
  uint64_t v15 = *(void *)(a1 + 32);
  -[NRDevicePreferencesQuickRelay resetInner](v15);
}

- (void)addQuickRelayRequest
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NRDevicePreferencesQuickRelay_addQuickRelayRequest__block_invoke;
  block[3] = &unk_263FD1360;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__NRDevicePreferencesQuickRelay_addQuickRelayRequest__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(void *)(v2 + 48))
  {
    -[NRDevicePreferencesQuickRelay setAssertCount:](v2, *(void *)(v2 + 56) + 1);
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(NSObject **)(v3 + 40);
    }
    else {
      uint64_t v4 = 0;
    }
    if (nw_path_get_status(v4) != nw_path_status_satisfied) {
      return;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (!v5)
    {
      BOOL v31 = 0;
      uint64_t v32 = *(void *)(a1 + 32);
      if (v32) {
        goto LABEL_51;
      }
      goto LABEL_60;
    }
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    uint64_t v6 = *(id *)(v5 + 16);
    dispatch_assert_queue_V2(v6);

    uint64_t v7 = *(void **)(v5 + 40);
    if (v7)
    {
      id v8 = v7;
      id v9 = (id)nw_path_copy_netagent_dictionary();

      if (v9 && MEMORY[0x210512A10](v9) == MEMORY[0x263EF8708])
      {
        applier[0] = MEMORY[0x263EF8330];
        applier[1] = 3221225472;
        applier[2] = __50__NRDevicePreferencesQuickRelay_shouldAssertAgent__block_invoke;
        applier[3] = &unk_263FD1260;
        applier[4] = &v53;
        xpc_dictionary_apply(v9, applier);
      }
      else
      {
        if (nrCopyLogObj_onceToken_852 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
        }
        uint64_t v10 = (id)nrCopyLogObj_sNRLogObj_854;
        uint64_t v11 = v10;
        if (sNRCopyLogToStdErr)
        {

LABEL_33:
          if (nrCopyLogObj_onceToken_852 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
          }
          id v36 = (id)nrCopyLogObj_sNRLogObj_854;
          _NRLogWithArgs((uint64_t)v36, 1, (uint64_t)"%s%.30s:%-4d No netagents to retrieve agent UUID", v37, v38, v39, v40, v41, (uint64_t)"");

          goto LABEL_49;
        }
        BOOL v35 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

        if (v35) {
          goto LABEL_33;
        }
      }
    }
    else
    {
      if (nrCopyLogObj_onceToken_852 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
      }
      v33 = (id)nrCopyLogObj_sNRLogObj_854;
      v34 = v33;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v42 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

        if (!v42) {
          goto LABEL_50;
        }
      }
      if (nrCopyLogObj_onceToken_852 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
      }
      id v9 = (id)nrCopyLogObj_sNRLogObj_854;
      _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d No path to retrieve agent data", v43, v44, v45, v46, v47, (uint64_t)"");
    }
LABEL_49:

LABEL_50:
    BOOL v31 = *((unsigned char *)v54 + 24) != 0;
    _Block_object_dispose(&v53, 8);
    uint64_t v32 = *(void *)(a1 + 32);
    if (v32)
    {
LABEL_51:
      v48 = *(NSObject **)(v32 + 40);
LABEL_52:
      nw_path_status_t status = nw_path_get_status(v48);
      char v50 = !v31;
      if (status != nw_path_status_satisfied) {
        char v50 = 1;
      }
      if ((v50 & 1) == 0) {
        -[NRDevicePreferencesQuickRelay assertAgent](*(void *)(a1 + 32));
      }
      return;
    }
LABEL_60:
    v48 = 0;
    goto LABEL_52;
  }
  id v51 = objc_alloc_init(MEMORY[0x263F14410]);
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    v13 = *(void **)(v12 + 24);
  }
  else {
    v13 = 0;
  }
  id v14 = nrCopyAccountIdentifierForNRUUID(v13);
  [v51 setAccount:v14];

  [v51 requireNetworkAgentWithDomain:@"com.apple.networkrelay" type:@"QuickRelayAgent"];
  uint64_t v15 = (void *)[v51 copyCParameters];
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v17 = nw_path_evaluator_copy_path();
  nw_path_status_t v18 = nw_path_get_status(v17);
  uint64_t v19 = *(void *)(a1 + 32);
  if (v18 != nw_path_status_satisfied && v19)
  {
    *(unsigned char *)(v19 + 8) = 1;
    uint64_t v19 = *(void *)(a1 + 32);
  }
  -[NRDevicePreferencesQuickRelay updateAgentUUID:](v19, v17);
  uint64_t v25 = *(void *)(a1 + 32);
  if (v25 && (*(void *)(v25 + 32) || *(unsigned char *)(v25 + 8)))
  {
    id v26 = evaluator_for_endpoint;
    nw_path_evaluator_set_update_handler();
    uint64_t v27 = *(void *)(a1 + 32);
    if (v27 && (objc_storeStrong((id *)(v27 + 48), evaluator_for_endpoint), (uint64_t v28 = *(void *)(a1 + 32)) != 0))
    {
      objc_storeStrong((id *)(v28 + 40), v17);
      uint64_t v29 = *(void *)(a1 + 32);
      if (v29) {
        uint64_t v30 = *(void *)(v29 + 56) + 1;
      }
      else {
        uint64_t v30 = 1;
      }
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v30 = 1;
    }
    -[NRDevicePreferencesQuickRelay setAssertCount:](v29, v30);

    BOOL v31 = 1;
    uint64_t v32 = *(void *)(a1 + 32);
    if (v32) {
      goto LABEL_51;
    }
    goto LABEL_60;
  }
  if (nrCopyLogObj_onceToken_852 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_854, OS_LOG_TYPE_ERROR)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_854, 16, (uint64_t)"%s%.30s:%-4d Failed to get agent UUID", v20, v21, v22, v23, v24, (uint64_t)"");
  }
}

- (void)updateAgentUUID:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    uint64_t v4 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    if (v3)
    {
      uint64_t v10 = nw_path_copy_netagent_dictionary();
      v16 = (void *)v10;
      if (v10 && MEMORY[0x210512A10](v10) == MEMORY[0x263EF8708])
      {
        applier[0] = MEMORY[0x263EF8330];
        applier[1] = 3221225472;
        applier[2] = __49__NRDevicePreferencesQuickRelay_updateAgentUUID___block_invoke;
        applier[3] = &unk_263FD1238;
        applier[4] = a1;
        xpc_dictionary_apply(v16, applier);
      }
      else
      {
        if (nrCopyLogObj_onceToken_852 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_854, OS_LOG_TYPE_INFO)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_854, 1, (uint64_t)"%s%.30s:%-4d No netagents to retrieve agent UUID", v11, v12, v13, v14, v15, (uint64_t)"");
        }
      }
    }
    else
    {
      if (nrCopyLogObj_onceToken_852 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_854, OS_LOG_TYPE_INFO)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_854, 1, (uint64_t)"%s%.30s:%-4d No path to retrieve agent UUID", v5, v6, v7, v8, v9, (uint64_t)"");
      }
    }
  }
}

void __53__NRDevicePreferencesQuickRelay_addQuickRelayRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v10 = *(void *)(a1 + 32);
  id v45 = v4;
  if (v10)
  {
    if (*(void *)(v10 + 48) != *(void *)(a1 + 40)) {
      goto LABEL_3;
    }
    if (*(void *)(v10 + 56))
    {
      objc_storeStrong((id *)(v10 + 40), a2);
      if (nrCopyLogObj_onceToken_852 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_854, OS_LOG_TYPE_INFO))
      {
        id v20 = (id)nrCopyLogObj_sNRLogObj_854;
        _NRLogWithArgs((uint64_t)v20, 1, (uint64_t)"%s%.30s:%-4d Received path: %@", v21, v22, v23, v24, v25, (uint64_t)"");
      }
      uint64_t v26 = *(void *)(a1 + 32);
      if (v26)
      {
        -[NRDevicePreferencesQuickRelay updateAgentUUID:](v26, *(void **)(v26 + 40));
        uint64_t v27 = *(void *)(a1 + 32);
        if (v27)
        {
LABEL_20:
          uint64_t v28 = *(NSObject **)(v27 + 40);
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v27 = *(void *)(a1 + 32);
        if (v27) {
          goto LABEL_20;
        }
      }
      uint64_t v28 = 0;
LABEL_21:
      nw_path_status_t status = nw_path_get_status(v28);
      if ((status & 0xFFFFFFFE) == 2)
      {
        uint64_t v30 = *(void *)(a1 + 32);
        if (v30 && *(void *)(v30 + 56)) {
          *(unsigned char *)(v30 + 8) = 1;
        }
        goto LABEL_9;
      }
      if (status != nw_path_status_satisfied) {
        goto LABEL_9;
      }
      uint64_t v31 = *(void *)(a1 + 32);
      if (!v31 || !*(void *)(v31 + 56) || !*(unsigned char *)(v31 + 8)) {
        goto LABEL_9;
      }
      uint64_t v32 = *(void *)(v31 + 32);
      if (nrCopyLogObj_onceToken_852 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
      }
      v33 = (id)nrCopyLogObj_sNRLogObj_854;
      v34 = v33;
      if (!v32)
      {
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v43 = os_log_type_enabled(v33, OS_LOG_TYPE_FAULT);

          if (!v43) {
            goto LABEL_9;
          }
        }
        id v11 = nrCopyLogObj_872();
        v17 = v11;
        nw_path_status_t v18 = "No agent UUID while path is satisfied";
        int v19 = 17;
        goto LABEL_8;
      }
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v35 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);

        if (!v35) {
          goto LABEL_38;
        }
      }
      id v36 = nrCopyLogObj_872();
      _NRLogWithArgs((uint64_t)v36, 1, (uint64_t)"%s%.30s:%-4d Reasserting the agent", v37, v38, v39, v40, v41, (uint64_t)"");

LABEL_38:
      -[NRDevicePreferencesQuickRelay assertAgent](*(void *)(a1 + 32));
      uint64_t v42 = *(void *)(a1 + 32);
      if (v42) {
        *(unsigned char *)(v42 + 8) = 0;
      }
      goto LABEL_9;
    }
LABEL_43:
    if (nrCopyLogObj_onceToken_852 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_854, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_854, 17, (uint64_t)"Received path update when we have no requests", v5, v6, v7, v8, v9, (uint64_t)v44);
    }
    goto LABEL_9;
  }
  if (!*(void *)(a1 + 40)) {
    goto LABEL_43;
  }
LABEL_3:
  if (nrCopyLogObj_onceToken_852 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_854, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (id)nrCopyLogObj_sNRLogObj_854;
    v17 = v11;
    uint64_t v44 = "";
    nw_path_status_t v18 = "%s%.30s:%-4d Ignoring path evaluator update for a stale evaluator: old: %@, new: %@";
    int v19 = 0;
LABEL_8:
    _NRLogWithArgs((uint64_t)v11, v19, (uint64_t)v18, v12, v13, v14, v15, v16, (uint64_t)v44);
  }
LABEL_9:
}

- (uint64_t)assertAgent
{
  v7[2] = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 16));
    v7[0] = 0;
    v7[1] = 0;
    [*(id *)(v1 + 32) getUUIDBytes:v7];
    if (nrCopyLogObj_onceToken_852 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_854, OS_LOG_TYPE_DEFAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_854, 0, (uint64_t)"%s%.30s:%-4d adding quick relay request (count is now %ld)", v2, v3, v4, v5, v6, (uint64_t)"");
    }
    return nw_path_assert_agent();
  }
  return result;
}

uint64_t __49__NRDevicePreferencesQuickRelay_updateAgentUUID___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  size_t length = 0;
  data = (const char *)xpc_dictionary_get_data(xdict, "data", &length);
  uint64_t result = 1;
  if (data && length >= 0xD8 && length == *((unsigned int *)data + 53) + 216)
  {
    if (!strcmp(data + 16, "com.apple.networkrelay") && !strcmp(data + 48, "QuickRelayAgent"))
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:data];
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        objc_storeStrong((id *)(v7 + 32), v6);
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

uint64_t __50__NRDevicePreferencesQuickRelay_shouldAssertAgent__block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  size_t length = 0;
  data = (const char *)xpc_dictionary_get_data(xdict, "data", &length);
  uint64_t result = 1;
  if (data)
  {
    if (length >= 0xD8)
    {
      uint64_t v6 = *((unsigned int *)data + 53);
      if (length == v6 + 216)
      {
        if (!strcmp(data + 16, "com.apple.networkrelay")
          && ((int v7 = strcmp(data + 48, "QuickRelayAgent"), v6 == 1) ? (v8 = v7 == 0) : (v8 = 0), v8))
        {
          __memcpy_chk();
          uint64_t result = 0;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
        }
        else
        {
          return 1;
        }
      }
    }
  }
  return result;
}

- (void)dealloc
{
  if (self)
  {
    path = self->_path;
    self->_path = 0;

    if (self->_pathEvaluator)
    {
      nw_path_evaluator_cancel();
      pathEvaluator = self->_pathEvaluator;
      self->_pathEvaluator = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NRDevicePreferencesQuickRelay;
  [(NRDevicePreferencesQuickRelay *)&v5 dealloc];
}

- (NRDevicePreferencesQuickRelay)initWithNRUUID:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v4 = (NSUUID *)a3;
  if (!v4)
  {
    uint64_t v10 = nrCopyLogObj_872();
    id v11 = v10;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (!v12) {
        goto LABEL_14;
      }
    }
    id v16 = nrCopyLogObj_872();
    _NRLogWithArgs((uint64_t)v16, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL nrUUID", v17, v18, v19, v20, v21, (uint64_t)"");

LABEL_14:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136446466;
    *(void *)(v22 + 4) = "-[NRDevicePreferencesQuickRelay initWithNRUUID:]";
    *(_WORD *)(v22 + 12) = 2080;
    *(void *)(v22 + 14) = "-[NRDevicePreferencesQuickRelay initWithNRUUID:]";
    goto LABEL_18;
  }
  objc_super v5 = v4;
  v31.receiver = self;
  v31.super_class = (Class)NRDevicePreferencesQuickRelay;
  uint64_t v6 = [(NRDevicePreferencesQuickRelay *)&v31 init];
  if (!v6)
  {
    uint64_t v13 = nrCopyLogObj_872();
    uint64_t v14 = v13;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v15 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

      if (!v15) {
        goto LABEL_17;
      }
    }
    id v23 = nrCopyLogObj_872();
    _NRLogWithArgs((uint64_t)v23, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v24, v25, v26, v27, v28, (uint64_t)"");

LABEL_17:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136446210;
    *(void *)(v29 + 4) = "-[NRDevicePreferencesQuickRelay initWithNRUUID:]";
LABEL_18:
    id v30 = nrCopyLogObj_872();
    _NRLogAbortWithPack(v30);
  }
  int v7 = v6;
  if (nrXPCCopyQueue_onceToken != -1) {
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2277);
  }
  objc_storeStrong((id *)&v7->_queue, (id)nrXPCCopyQueue_nrXPCQueue);
  nrUUID = v7->_nrUUID;
  v7->_nrUUID = v5;

  return v7;
}

@end