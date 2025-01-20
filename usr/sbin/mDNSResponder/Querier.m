@interface Querier
@end

@implementation Querier

void __Querier_GetDNSServiceManager_block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v4, v5, v6, v7, v8, v9, v10, v11);
  switch(a2)
  {
    case 3:
      uint64_t v20 = *(void *)(a1 + 32);
      if (_mdns_dns_service_queue_s_once != -1) {
        dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
      }
      block = _NSConcreteStackBlock;
      uint64_t v22 = 0x40000000;
      v23 = __mdns_dns_service_manager_apply_pending_updates_block_invoke;
      v24 = &__block_descriptor_tmp_41;
      uint64_t v25 = v20;
      dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, &block);
      mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"Querier_GetDNSServiceManager_block_invoke", 188);
      Querier_ProcessDNSServiceChanges(0);
      _Querier_LogDNSServices(*(void *)(a1 + 32));
      mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"Querier_GetDNSServiceManager_block_invoke", 191);
      break;
    case 2:
      os_release(*(void **)(a1 + 32));
      break;
    case 1:
      uint64_t v19 = *(void *)(a1 + 32);
      if (_mdns_dns_service_queue_s_once != -1) {
        dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
      }
      block = _NSConcreteStackBlock;
      uint64_t v22 = 0x40000000;
      v23 = __mdns_dns_service_manager_invalidate_block_invoke;
      v24 = &__block_descriptor_tmp_19_880;
      uint64_t v25 = v19;
      dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, &block);
      if (Querier_GetDNSServiceManager_sDNSServiceManager
        && Querier_GetDNSServiceManager_sDNSServiceManager == *(void *)(a1 + 32))
      {
        os_release((void *)Querier_GetDNSServiceManager_sDNSServiceManager);
        Querier_GetDNSServiceManager_sDNSServiceManager = 0;
      }
      break;
  }

  KQueueUnlock((uint64_t)"DNS Service Manager event handler", v12, v13, v14, v15, v16, v17, v18);
}

uint64_t ___Querier_LogDNSServices_block_invoke(uint64_t a1, uint64_t a2)
{
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v4 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v8 = *(_DWORD *)(a1 + 40);
      v10[0] = 67109634;
      v10[1] = v7;
      __int16 v11 = 1024;
      int v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DNS service (%u/%u) -- %@", (uint8_t *)v10, 0x18u);
    }
  }
  else
  {
    uint64_t v4 = mDNSLogCategory_Default_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
  }
  return 1;
}

void ___Querier_GetMyUUID_block_invoke(id a1)
{
  if (_Querier_GetMyPID_sOnce != -1) {
    dispatch_once(&_Querier_GetMyPID_sOnce, &__block_literal_global_51);
  }
  int v1 = _Querier_GetMyPID_sPID;

  mdns_system_pid_to_uuid(v1, _Querier_GetMyUUID_sUUID);
}

void ___Querier_GetMyPID_block_invoke(id a1)
{
  _Querier_GetMyPID_sPID = getpid();
}

void ___Querier_InternalQueue_block_invoke(id a1)
{
  _Querier_InternalQueue_sQueue = (uint64_t)dispatch_queue_create("com.apple.mDNSResponder.querier-support-queue", 0);
}

void ___Querier_EnsureNEDNSProxyStateWatchHasStarted_block_invoke(id a1)
{
  if (_Querier_InternalQueue_sOnce != -1) {
    dispatch_once(&_Querier_InternalQueue_sOnce, &__block_literal_global_43_3171);
  }
  id v1 = (id)_Querier_InternalQueue_sQueue;
  v2 = &__block_literal_global_39_3199;
  if (objc_opt_class())
  {
    uint64_t v4 = _mdns_ne_dns_proxy_state_watch_queue();
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __mdns_ne_dns_proxy_state_watch_start_block_invoke;
    v5[3] = &unk_100147C40;
    v5[4] = v1;
    v5[5] = &__block_literal_global_39_3199;
    dispatch_async(v4, v5);
  }
}

void ___Querier_StartNEDNSProxyStateWatch_block_invoke(id a1, BOOL a2)
{
  BOOL v2 = a2;
  uint64_t v3 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v3, v4, v5, v6, v7, v8, v9, v10);
  if (((gNEDNSProxyIsRunning == 0) ^ v2)) {
    goto LABEL_23;
  }
  gNEDNSProxyIsRunning = v2;
  uint64_t v18 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v26 = 67109120;
    BOOL v27 = v2;
    goto LABEL_11;
  }
  uint64_t v18 = mDNSLogCategory_Default_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 67109120;
    BOOL v27 = v2;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "NEDNSProxy state update -- running: %{mdns:yesno}d", (uint8_t *)&v26, 8u);
  }
LABEL_12:
  mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"_Querier_StartNEDNSProxyStateWatch_block_invoke", 104);
  Querier_ProcessDNSServiceChanges(0);
  for (uint64_t i = 0; i != 499; ++i)
  {
    for (j = (void *)mDNSStorage[i + 34]; j; j = (void *)*j)
    {
      for (k = (void *)j[2]; k; k = (void *)*k)
      {
        uint64_t v24 = k[7];
        if (v24)
        {
          uint64_t v25 = *(void *)(v24 + 24);
          if (v25)
          {
            if (*(unsigned char *)(v25 + 281) == 1) {
              mDNS_PurgeCacheResourceRecord((unsigned int *)mDNSStorage, (uint64_t)k);
            }
          }
        }
      }
    }
  }
  mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"_Querier_StartNEDNSProxyStateWatch_block_invoke", 131);
LABEL_23:
  KQueueUnlock((uint64_t)"NetworkExtension DNS proxy state update", v11, v12, v13, v14, v15, v16, v17);
}

BOOL __Querier_HandleUnicastQuestion_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(a2 + 32) == *(void *)(v3 + 80))
  {
    uint64_t v5 = *(void *)(a2 + 88);
    if (mdns_querier_match(v5, (unsigned __int8 *)(v3 + 376), *(unsigned __int16 *)(v3 + 342), *(unsigned __int16 *)(v3 + 344)))
    {
      unsigned int v6 = *(unsigned __int8 *)(v5 + 70);
      int v7 = *(unsigned __int8 *)(a1 + 48);
      int v8 = (v6 >> 2) & 1;
      int v9 = (v6 >> 1) & 1;
      if (v7 == v8 && v7 == v9) {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
      }
    }
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

void __Querier_HandleUnicastQuestion_block_invoke_15(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v3, v4, v5, v6, v7, v8, v9, v10);
  if (*(unsigned char *)(v2 + 255))
  {
    uint64_t v11 = (void *)(v2 + 16);
    do
    {
      uint64_t v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_13;
      }
      uint64_t v12 = (uint64_t (*)(uint64_t, void, uint64_t))v11[3];
    }
    while (!v12);
    uint64_t v13 = v12(v2, 0, 1);
    if (!v13) {
      goto LABEL_13;
    }
    uint64_t v14 = (void *)v13;
    uint64_t v15 = mDNSLogCategory_Default;
    BOOL v16 = gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State;
    if (v16)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:
        free(v14);
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v15 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
    }
    int v22 = *(_DWORD *)(v2 + 232);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v22;
    *(_WORD *)v65 = 2082;
    *(void *)&v65[2] = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Q%u] Handling concluded querier: %{public}s", buf, 0x12u);
    goto LABEL_24;
  }
LABEL_13:
  uint64_t v17 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v17 = mDNSLogCategory_Default_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
  }
  int v20 = *(_DWORD *)(v2 + 232);
  *(_DWORD *)buf = 67109378;
  *(_DWORD *)&buf[4] = v20;
  *(_WORD *)v65 = 2112;
  *(void *)&v65[2] = v2;
  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Q%u] Handling concluded querier: %@", buf, 0x12u);
LABEL_25:
  __int16 v23 = *(_WORD *)(*(void *)(v2 + 32) + 276);
  unint64_t v24 = *(unsigned int *)(*(void *)(*(void *)(v2 + 64) + 16) + 144);
  if (v24 >= 5) {
    char v25 = 0;
  }
  else {
    char v25 = 0x203010100uLL >> (8 * v24);
  }
  unsigned int v26 = atomic_load((unsigned int *)(v2 + 208));
  if (v26 && *(_DWORD *)(*(void *)(v2 + 88) + 40) && v25)
  {
    int v27 = 3;
    if (v25 == 1) {
      int v27 = 1;
    }
    unsigned int v28 = 2 * (v25 != 1);
    if ((v23 & 8) != 0) {
      unsigned int v28 = v27;
    }
    if ((long long *)((char *)&s_dns_analytics + 104 * v28)) {
      *((void *)&s_dns_analytics + 13 * v28 + 2) += *(unsigned int *)(*(void *)(v2 + 88) + 40);
    }
  }
  int v29 = *(unsigned __int8 *)(v2 + 248);
  int v30 = v29 - 1;
  if (v29 != 1)
  {
    uint64_t v31 = *(void *)(v2 + 32);
    goto LABEL_66;
  }
  if (!*(unsigned char *)(v2 + 253))
  {
    uint64_t v36 = *(void *)(v2 + 136);
    if (v36)
    {
      uint64_t v37 = *(unsigned int *)(v36 + 40);
      if (v37)
      {
        if (v25)
        {
          BOOL v16 = v25 == 1;
          BOOL v38 = v25 != 1;
          int v39 = 3;
          if (v16) {
            int v39 = 1;
          }
          int v40 = 2 * v38;
          if ((v23 & 8) != 0) {
            unsigned int v41 = v39;
          }
          else {
            unsigned int v41 = v40;
          }
          if ((long long *)((char *)&s_dns_analytics + 104 * v41)) {
            *((void *)&s_dns_analytics + 13 * v41 + 3) += v37;
          }
        }
      }
    }
  }
  uint64_t v31 = *(void *)(v2 + 32);
  if ((*(_WORD *)(v31 + 276) & 1) == 0)
  {
    uint64_t v32 = *(void *)(v2 + 136);
    if (v32)
    {
      uint64_t v33 = *(void *)(v32 + 40);
      uint64_t v34 = v33;
      if (v33 >= 0x22F9)
      {
        v35 = mDNSLogCategory_Default;
        if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
        {
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
          {
LABEL_60:
            int v42 = *(_DWORD *)(v2 + 232);
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)&buf[4] = v42;
            *(_WORD *)v65 = 2048;
            *(void *)&v65[2] = v34;
            *(_WORD *)&v65[10] = 2048;
            uint64_t v34 = 8952;
            *(void *)&v65[12] = 8952;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[Q%u] Large %lu-byte response will be truncated to fit mDNSCore's %lu-byte message buffer", buf, 0x1Cu);
            goto LABEL_62;
          }
        }
        else
        {
          v35 = mDNSLogCategory_Default_redacted;
          if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_60;
          }
        }
        uint64_t v34 = &unk_1000022F8;
      }
    }
    else
    {
      uint64_t v34 = 0;
    }
LABEL_62:
    __memcpy_chk();
    if ((*(_WORD *)(v31 + 276) & 0x2000) != 0) {
      uint64_t v43 = *(unsigned int *)(v31 + 256);
    }
    else {
      uint64_t v43 = 0;
    }
    mDNSCoreReceiveForQuerier((uint64_t)&byte_100169BE0[v34], v2, (void *)v31, v43);
  }
LABEL_66:
  Mutable = (__CFSet *)_Querier_GetOrphanedQuerierSet_sOrphanedQuerierSet;
  if (_Querier_GetOrphanedQuerierSet_sOrphanedQuerierSet
    || (Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, (const CFSetCallBacks *)&gMDNSObjectSetCallbacks),
        (_Querier_GetOrphanedQuerierSet_sOrphanedQuerierSet = (uint64_t)Mutable) != 0))
  {
    CFSetRemoveValue(Mutable, (const void *)v2);
  }
  unsigned __int8 v63 = 0;
  uint64_t DNSQuestion = Querier_GetDNSQuestion(v2, &v63);
  if (DNSQuestion)
  {
    uint64_t v53 = DNSQuestion;
    if (*(_DWORD *)(*(void *)(*(void *)(v2 + 64) + 16) + 144))
    {
      unsigned int v54 = atomic_load((unsigned int *)(v2 + 208));
      *(_DWORD *)(DNSQuestion + 260) += v54;
    }
    v56 = (void *)(DNSQuestion + 96);
    v55 = *(void **)(DNSQuestion + 96);
    if (v55)
    {
      os_release(v55);
      void *v56 = 0;
    }
    int v57 = *(unsigned __int8 *)(v53 + 648);
    *(unsigned char *)(v53 + 648) = 0;
    if (!(*(unsigned __int8 *)(v53 + 354) | v63))
    {
      switch(v30)
      {
        case 0:
          if (v57) {
            goto LABEL_77;
          }
          goto LABEL_93;
        case 1:
LABEL_77:
          mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"_Querier_HandleQuerierResponse", 969);
          Querier_HandleUnicastQuestion(v53);
          int v58 = 971;
          goto LABEL_92;
        case 4:
          mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"_Querier_HandleQuerierResponse", 916);
          *(_DWORD *)(v53 + 208) = dword_100164DF8;
          *(_DWORD *)(v53 + 212) = 5000;
          SetNextQueryTime((uint64_t)mDNSStorage, v53);
          int v58 = 920;
          goto LABEL_92;
        case 5:
          if ((*(_WORD *)(v31 + 276) & 0x800) == 0)
          {
            uint64_t DNSServiceManager = Querier_GetDNSServiceManager();
            if (DNSServiceManager)
            {
              uint64_t v60 = DNSServiceManager;
              if (_mdns_dns_service_queue_s_once != -1) {
                dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_250);
              }
              *(void *)buf = _NSConcreteStackBlock;
              *(void *)v65 = 0x40000000;
              *(void *)&v65[8] = __mdns_dns_service_manager_apply_pending_connection_problem_updates_block_invoke;
              *(void *)&v65[16] = &__block_descriptor_tmp_42;
              uint64_t v66 = v60;
              dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, buf);
            }
          }
          mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"_Querier_HandleQuerierResponse", 937);
          mdns_client_replace((void **)(v53 + 96), (void *)v2);
          break;
        default:
          goto LABEL_93;
      }
      while (1)
      {
        mDNS_StopQuery_internal((uint64_t)mDNSStorage, v53);
        *(unsigned char *)(v53 + 649) = 1;
        mDNS_StartQuery_internal((uint64_t)mDNSStorage, v53);
        uint64_t v61 = Querier_GetDNSQuestion(v2, &v63);
        uint64_t v53 = v61;
        if (v61)
        {
          if (v63) {
            break;
          }
        }
        if (!v61) {
          goto LABEL_91;
        }
      }
      v62 = *(void **)(v61 + 96);
      if (v62)
      {
        os_release(v62);
        *(void *)(v53 + 96) = 0;
      }
LABEL_91:
      int v58 = 958;
LABEL_92:
      mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"_Querier_HandleQuerierResponse", v58);
    }
  }
LABEL_93:
  KQueueUnlock((uint64_t)"_Querier_HandleQuerierResponse", v46, v47, v48, v49, v50, v51, v52);
  os_release(*(void **)(a1 + 32));
}

void __Querier_HandleUnicastQuestion_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v4, v5, v6, v7, v8, v9, v10, v11);
  if (a2 == 1)
  {
    _Querier_HandleSubscriberInvalidation(*(void *)(a1 + 32));
    os_release(*(void **)(a1 + 32));
  }
  else if (a2 == 2)
  {
    _Querier_ApplyUpdate(*(void **)(a1 + 32));
  }

  KQueueUnlock((uint64_t)"Subscriber event handler", v12, v13, v14, v15, v16, v17, v18);
}

uint64_t ___Querier_ApplyUpdate_block_invoke(uint64_t *a1, _DWORD *a2)
{
  int v4 = a2[10];
  if (v4 != -2)
  {
    if (v4 == -1)
    {
      _Querier_RemoveRecord((uint64_t)a2, a1[4], a1[5], 0);
      return 1;
    }
    uint64_t v6 = (void *)gMessageBuilder;
    if (!gMessageBuilder)
    {
      uint64_t v7 = _os_object_alloc();
      if (!v7)
      {
        uint64_t v5 = 0;
        gMessageBuilder = 0;
        return v5;
      }
      uint64_t v6 = (void *)v7;
      uint64_t v8 = &_mdns_message_builder_kind;
      *(void *)(v7 + 16) = &_mdns_message_builder_kind;
      do
      {
        uint64_t v9 = (void (*)(void *))v8[2];
        if (v9) {
          v9(v6);
        }
        uint64_t v8 = (_UNKNOWN **)*v8;
      }
      while (v8);
      gMessageBuilder = (uint64_t)v6;
    }
    _mdns_message_builder_forget_resources(v6);
    v6[7] = 0;
    uint64_t v10 = gMessageBuilder;
    *(_WORD *)(gMessageBuilder + 56) = 0;
    *(_WORD *)(v10 + 58) |= 0x8400u;
    uint64_t v11 = a1[4];
    if (v11 && (*(_WORD *)(v11 + 276) & 0x4000) == 0)
    {
      uint64_t v12 = (void *)(*(uint64_t (**)(void))(*(void *)(a1[6] + 16) + 80))();
      __int16 v13 = (*(uint64_t (**)(void))(*(void *)(a1[6] + 16) + 88))();
      __int16 v14 = (*(uint64_t (**)(void))(*(void *)(a1[6] + 16) + 96))();
      if (v12) {
        os_retain(v12);
      }
      uint64_t v15 = *(void **)(v10 + 24);
      if (v15) {
        os_release(v15);
      }
      *(void *)(v10 + 24) = v12;
      *(_WORD *)(v10 + 60) = v13;
      *(_WORD *)(v10 + 62) = v14;
      uint64_t v10 = gMessageBuilder;
    }
    uint64_t v16 = *(__CFArray **)(v10 + 32);
    if (v16)
    {
      if (CFArrayGetCount(*(CFArrayRef *)(v10 + 32)) >= 0xFFFF) {
        goto LABEL_25;
      }
    }
    else
    {
      CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
      if (!Mutable)
      {
LABEL_25:
        uint64_t v18 = gMessageBuilder;
        __int16 v19 = *(_WORD *)(gMessageBuilder + 56);
        __int16 v20 = *(_WORD *)(gMessageBuilder + 58);
        CFArrayRef v21 = *(const __CFArray **)(gMessageBuilder + 32);
        unint64_t v22 = (unint64_t)(*(void *)(gMessageBuilder + 24) != 0) << 8;
        if (v21)
        {
          int Count = CFArrayGetCount(v21);
          uint64_t v24 = (Count << 8) & 0xFF0000;
          uint64_t v25 = (Count << 24);
        }
        else
        {
          uint64_t v25 = 0;
          uint64_t v24 = 0;
        }
        unint64_t v26 = v22 | v24 | v25;
        CFArrayRef v27 = *(const __CFArray **)(v18 + 40);
        if (v27)
        {
          CFIndex v28 = CFArrayGetCount(v27);
          uint64_t v29 = (v28 << 24) & 0xFF00000000;
          unint64_t v30 = (unint64_t)v28 << 40;
        }
        else
        {
          unint64_t v30 = 0;
          uint64_t v29 = 0;
        }
        uint64_t v31 = v26 | v29;
        CFArrayRef v32 = *(const __CFArray **)(v18 + 48);
        if (v32)
        {
          CFIndex v33 = CFArrayGetCount(v32);
          uint64_t v34 = (v33 << 40) & 0xFF000000000000;
          CFIndex v35 = v33 << 56;
        }
        else
        {
          CFIndex v35 = 0;
          uint64_t v34 = 0;
        }
        uint64_t v51 = 0;
        uint64_t v52 = &v51;
        uint64_t v53 = 0x3800000000;
        unsigned int v54 = byte_100169BE0;
        byte_100169BE0[0] = HIBYTE(v19);
        byte_100169BE1 = v19;
        byte_100169BE2 = HIBYTE(v20);
        byte_100169BE3 = v20;
        *(void *)&word_100169BE4 = v31 | v30 | v34 | v35;
        uint64_t v56 = 12;
        long long v55 = xmmword_10010B030;
        uint64_t v36 = *(void *)(v18 + 24);
        if (v36)
        {
          unint64_t v37 = *(void *)(v36 + 32);
          unint64_t v38 = 8940;
          if (v37 >= 0x22EC) {
            size_t v39 = 8940;
          }
          else {
            size_t v39 = *(void *)(v36 + 32);
          }
          if (v39)
          {
            memcpy(&unk_100169BEC, *(const void **)(v36 + 24), v39);
            uint64_t v40 = v39 + 12;
            *((void *)&v55 + 1) = v39 + 12;
            unint64_t v38 = 8940 - v39;
          }
          else
          {
            uint64_t v40 = 12;
          }
          __int16 v41 = *(_WORD *)(v18 + 60);
          __int16 v42 = *(_WORD *)(v18 + 62);
          LOBYTE(v50[0]) = HIBYTE(v41);
          BYTE1(v50[0]) = v41;
          BYTE2(v50[0]) = HIBYTE(v42);
          BYTE3(v50[0]) = v42;
          if (v38 >= 4) {
            size_t v43 = 4;
          }
          else {
            size_t v43 = v38;
          }
          if (v43)
          {
            memcpy((char *)&mDNSStorage[2501] + v40, v50, v43);
            *((void *)&v55 + 1) = v40 + v43;
          }
          uint64_t v44 = v37 + 16;
          if (v37 >= 0xFFFFFFFFFFFFFFF0) {
            uint64_t v44 = -1;
          }
          uint64_t v56 = v44;
        }
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 0x40000000;
        v50[2] = __mdns_message_builder_write_message_block_invoke;
        v50[3] = &unk_100145AB8;
        v50[4] = &v51;
        CFArrayRef v45 = *(const __CFArray **)(v18 + 32);
        if (v45) {
          mdns_cfarray_enumerate(v45, (uint64_t)v50);
        }
        CFArrayRef v46 = *(const __CFArray **)(v18 + 40);
        if (v46) {
          mdns_cfarray_enumerate(v46, (uint64_t)v50);
        }
        CFArrayRef v47 = *(const __CFArray **)(v18 + 48);
        if (v47) {
          mdns_cfarray_enumerate(v47, (uint64_t)v50);
        }
        unint64_t v48 = v52[6];
        _Block_object_dispose(&v51, 8);
        if (v48 <= 0x22F8) {
          mDNSCoreReceiveForQuerier((uint64_t)mDNSStorage + &unk_100004E28 + v48, a1[6], (void *)a1[4], a1[5]);
        }
        return 1;
      }
      uint64_t v16 = Mutable;
      *(void *)(v10 + 32) = Mutable;
    }
    CFArrayAppendValue(v16, a2);
    goto LABEL_25;
  }
  uint64_t v5 = 1;
  _Querier_RemoveRecord((uint64_t)a2, a1[4], a1[5], 1);
  return v5;
}

void __Querier_ProcessDNSServiceChangesAsync_block_invoke(uint64_t a1)
{
  uint64_t v2 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage + 616));
  *(_DWORD *)(mDNSStorage + 680) = mDNSPlatformRawTime(v2, v3, v4, v5, v6, v7, v8, v9);
  mDNS_Lock_((unsigned int *)&mDNSStorage, (uint64_t)"Querier_ProcessDNSServiceChangesAsync_block_invoke", 1377);
  Querier_ProcessDNSServiceChanges(*(unsigned __int8 *)(a1 + 32));
  mDNS_Unlock_((uint64_t)&mDNSStorage, (uint64_t)"Querier_ProcessDNSServiceChangesAsync_block_invoke", 1379);

  KQueueUnlock((uint64_t)"Querier_ProcessDNSServiceChangesAsync", v10, v11, v12, v13, v14, v15, v16);
}

@end