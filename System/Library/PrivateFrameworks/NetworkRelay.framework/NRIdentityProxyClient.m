@interface NRIdentityProxyClient
- (NRIdentityProxyClient)initWithCertificateReference:(id)a3 options:(id)a4;
- (NRIdentityProxyClient)initWithIdentityReference:(id)a3 options:(id)a4;
- (id)copyCertificateData;
- (id)copySecKeyProxy;
- (id)description;
- (id)initInternal:(void *)a3 options:;
- (void)dealloc;
@end

@implementation NRIdentityProxyClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_references, 0);
  objc_storeStrong((id *)&self->_persistentReference, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_keyProxy, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (id)copyCertificateData
{
  return 0;
}

- (id)copySecKeyProxy
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  if (self->_isIdentityReference)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&gNRSecKeyProxyCacheLock);
    if (nrCopyLogObj_onceToken_924 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_924, &__block_literal_global_925);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_926, OS_LOG_TYPE_DEFAULT))
    {
      options = self->_options;
      id v9 = (id)nrCopyLogObj_sNRLogObj_926;
      v68 = [(NSDictionary *)options objectForKeyedSubscript:@"pid"];
      _NRLogWithArgs((uint64_t)v9, 0, (uint64_t)"%s%.30s:%-4d starting validation for pid %@", v10, v11, v12, v13, v14, (uint64_t)"");
    }
    if (NRIdentityReferencesMonitorCacheLocked_sIdentityReferencesChangeToken != -1)
    {
LABEL_18:
      if (gNRIdentityReferencesCache)
      {
        if (nrCopyLogObj_onceToken_924 == -1)
        {
          if (sNRCopyLogToStdErr) {
            goto LABEL_22;
          }
        }
        else
        {
          dispatch_once(&nrCopyLogObj_onceToken_924, &__block_literal_global_925);
          if (sNRCopyLogToStdErr) {
            goto LABEL_22;
          }
        }
        if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_926, OS_LOG_TYPE_DEBUG))
        {
LABEL_33:
          if (!gNRIdentityReferencesCache || ![(id)gNRIdentityReferencesCache count]) {
            goto LABEL_53;
          }
          if (self->_isIdentityReference)
          {
            v34 = @"id-ref";
          }
          else
          {
            if (!self->_isCertificateReference) {
              goto LABEL_53;
            }
            v34 = @"cert-ref";
          }
          v35 = [(id)gNRIdentityReferencesCache objectForKeyedSubscript:v34];
          BOOL v36 = [(NSData *)self->_persistentReference isEqualToData:v35];

          if (v36)
          {
            v37 = (void *)gNRSecKeyProxies;
            if (!gNRSecKeyProxies)
            {
              id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              v39 = (void *)gNRSecKeyProxies;
              gNRSecKeyProxies = (uint64_t)v38;

              v37 = (void *)gNRSecKeyProxies;
            }
            id v20 = [v37 objectForKeyedSubscript:self->_persistentReference];
            if (v20) {
              goto LABEL_54;
            }
            persistentReference = self->_persistentReference;
            if (!self->_isIdentityReference || !persistentReference)
            {
              id v20 = 0;
LABEL_69:
              [(id)gNRSecKeyProxies setObject:v20 forKeyedSubscript:persistentReference];
              goto LABEL_54;
            }
            uint64_t v41 = *MEMORY[0x263EFFB40];
            uint64_t v42 = *MEMORY[0x263F171B8];
            uint64_t block = *MEMORY[0x263F17530];
            uint64_t v71 = v42;
            uint64_t v43 = *MEMORY[0x263F171D0];
            uint64_t handler = v41;
            p_uint64_t handler = v43;
            v72 = (uint64_t (*)(uint64_t))*MEMORY[0x263F175B0];
            uint64_t v77 = (uint64_t)persistentReference;
            CFDictionaryRef v44 = [NSDictionary dictionaryWithObjects:&handler forKeys:&block count:3];
            CFTypeRef result = 0;
            SecItemCopyMatching(v44, &result);
            if (result)
            {
              v50 = (void *)[objc_alloc(MEMORY[0x263F16D70]) initWithIdentity:result];
              v56 = v50;
              if (v50)
              {
                v57 = [v50 endpoint];
                BOOL v58 = v57 == 0;

                if (!v58)
                {
                  if (nrCopyLogObj_onceToken_924 == -1)
                  {
                    if (sNRCopyLogToStdErr) {
                      goto LABEL_51;
                    }
                  }
                  else
                  {
                    dispatch_once(&nrCopyLogObj_onceToken_924, &__block_literal_global_925);
                    if (sNRCopyLogToStdErr) {
                      goto LABEL_51;
                    }
                  }
                  if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_926, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_52:
                    id v20 = v56;
LABEL_62:

LABEL_68:
                    persistentReference = self->_persistentReference;
                    goto LABEL_69;
                  }
LABEL_51:
                  _NRLogWithArgs(nrCopyLogObj_sNRLogObj_926, 0, (uint64_t)"%s%.30s:%-4d %@ created new key proxy for %@", v51, v52, v53, v54, v55, (uint64_t)"");
                  goto LABEL_52;
                }
              }
              if (nrCopyLogObj_onceToken_924 == -1)
              {
                if (sNRCopyLogToStdErr) {
                  goto LABEL_60;
                }
              }
              else
              {
                dispatch_once(&nrCopyLogObj_onceToken_924, &__block_literal_global_925);
                if (sNRCopyLogToStdErr) {
                  goto LABEL_60;
                }
              }
              if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_926, OS_LOG_TYPE_ERROR))
              {
LABEL_61:
                id v20 = 0;
                goto LABEL_62;
              }
LABEL_60:
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_926, 16, (uint64_t)"%s%.30s:%-4d %@ key proxy creation failed ", v51, v52, v53, v54, v55, (uint64_t)"");
              goto LABEL_61;
            }
            if (nrCopyLogObj_onceToken_924 == -1)
            {
              if (sNRCopyLogToStdErr) {
                goto LABEL_66;
              }
            }
            else
            {
              dispatch_once(&nrCopyLogObj_onceToken_924, &__block_literal_global_925);
              if (sNRCopyLogToStdErr) {
                goto LABEL_66;
              }
            }
            if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_926, OS_LOG_TYPE_ERROR))
            {
LABEL_67:
              id v20 = 0;
              goto LABEL_68;
            }
LABEL_66:
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_926, 16, (uint64_t)"%s%.30s:%-4d %@ SecItemCopyMatching for identity failed %d", v45, v46, v47, v48, v49, (uint64_t)"");
            goto LABEL_67;
          }
LABEL_53:
          id v20 = 0;
LABEL_54:
          os_unfair_lock_unlock((os_unfair_lock_t)&gNRSecKeyProxyCacheLock);
          return v20;
        }
LABEL_22:
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_926, 2, (uint64_t)"%s%.30s:%-4d identity cache valid", v3, v4, v5, v6, v7, (uint64_t)"");
        goto LABEL_33;
      }
      v23 = (void *)gNRSecKeyProxies;
      gNRSecKeyProxies = 0;

      v24 = (void *)gNRIdentityReferencesCache;
      gNRIdentityReferencesCache = 0;

      if (nrCopyLogObj_onceToken_924 == -1)
      {
        if (!sNRCopyLogToStdErr) {
          goto LABEL_25;
        }
      }
      else
      {
        dispatch_once(&nrCopyLogObj_onceToken_924, &__block_literal_global_925);
        if (!sNRCopyLogToStdErr)
        {
LABEL_25:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_926, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
        }
      }
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_926, 0, (uint64_t)"%s%.30s:%-4d fetching identity references", v25, v26, v27, v28, v29, (uint64_t)"");
LABEL_27:
      uint64_t handler = 0;
      p_uint64_t handler = (uint64_t)&handler;
      uint64_t v77 = 0x3032000000;
      v78 = __Block_byref_object_copy__939;
      v79 = __Block_byref_object_dispose__940;
      id v80 = 0;
      v30 = dispatch_group_create();
      if (NRIPCCopyQueue_onceToken != -1) {
        dispatch_once(&NRIPCCopyQueue_onceToken, &__block_literal_global_68);
      }
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v71 = 3221225472;
      v72 = __NRIPCFetchReferencesLocked_block_invoke;
      v73 = &unk_263FD1610;
      v74 = &handler;
      dispatch_group_async(v30, (dispatch_queue_t)NRIPCCopyQueue_queue, &block);
      dispatch_time_t v31 = dispatch_time(0, 3000000000);
      if (dispatch_group_wait(v30, v31))
      {
        v60 = nrCopyLogObj_941();
        v61 = v60;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v62 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);

          if (!v62) {
            goto LABEL_32;
          }
        }
        id v33 = nrCopyLogObj_941();
        _NRLogWithArgs((uint64_t)v33, 16, (uint64_t)"%s%.30s:%-4d timed out waiting for identity proxy resolution", v63, v64, v65, v66, v67, (uint64_t)"");
      }
      else
      {
        id v32 = *(id *)(p_handler + 40);
        id v33 = (id)gNRIdentityReferencesCache;
        gNRIdentityReferencesCache = (uint64_t)v32;
      }

LABEL_32:
      _Block_object_dispose(&handler, 8);

      goto LABEL_33;
    }
    if (NRIPCCopyQueue_onceToken != -1) {
      dispatch_once(&NRIPCCopyQueue_onceToken, &__block_literal_global_68);
    }
    uint64_t handler = MEMORY[0x263EF8330];
    p_uint64_t handler = 3221225472;
    uint64_t v77 = (uint64_t)__NRIdentityReferencesMonitorCacheLocked_block_invoke_2;
    v78 = (uint64_t (*)(uint64_t, uint64_t))&unk_263FD12B8;
    v79 = (void (*)(uint64_t))&__block_literal_global_63;
    if (!notify_register_dispatch("com.apple.networkrelay.referencesChanged", &NRIdentityReferencesMonitorCacheLocked_sIdentityReferencesChangeToken, (dispatch_queue_t)NRIPCCopyQueue_queue, &handler))
    {
      v21 = (void *)gNRSecKeyProxies;
      gNRSecKeyProxies = 0;

      v22 = (void *)gNRIdentityReferencesCache;
      gNRIdentityReferencesCache = 0;

      goto LABEL_17;
    }
    NRIdentityReferencesMonitorCacheLocked_sIdentityReferencesChangeToken = -1;
    if (nrCopyLogObj_onceToken_924 == -1)
    {
      if (sNRCopyLogToStdErr) {
        goto LABEL_14;
      }
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_924, &__block_literal_global_925);
      if (sNRCopyLogToStdErr) {
        goto LABEL_14;
      }
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_926, OS_LOG_TYPE_FAULT))
    {
LABEL_17:

      goto LABEL_18;
    }
LABEL_14:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_926, 17, (uint64_t)"notify_register_check(%s) failed: %u", v15, v16, v17, v18, v19, (uint64_t)"com.apple.networkrelay.referencesChanged");
    goto LABEL_17;
  }
  return 0;
}

- (id)description
{
  if (self->_isIdentityReference)
  {
    v2 = @"id";
  }
  else if (self->_isCertificateReference)
  {
    v2 = @"cert";
  }
  else
  {
    v2 = &stru_26BE156B0;
  }
  uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"NRIdentityProxyClient[%llu, %@]", self->_identifier, v2];
  return v3;
}

- (void)dealloc
{
  if (nrCopyLogObj_onceToken_924 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_924, &__block_literal_global_925);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_926, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_926, 0, (uint64_t)"%s%.30s:%-4d %@ dealloc", v2, v3, v4, v5, v6, (uint64_t)"");
  }
  v8.receiver = self;
  v8.super_class = (Class)NRIdentityProxyClient;
  [(NRIdentityProxyClient *)&v8 dealloc];
}

- (NRIdentityProxyClient)initWithCertificateReference:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v10 = nrCopyLogObj_941();
    uint64_t v11 = v10;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_FAULT);

      if (!v12) {
        goto LABEL_8;
      }
    }
    id v13 = nrCopyLogObj_941();
    _NRLogWithArgs((uint64_t)v13, 17, (uint64_t)"%s called with null certificateReference", v14, v15, v16, v17, v18, (uint64_t)"-[NRIdentityProxyClient initWithCertificateReference:options:]");

    goto LABEL_8;
  }
  if (![v6 length])
  {
LABEL_8:
    id v9 = 0;
    goto LABEL_9;
  }
  objc_super v8 = -[NRIdentityProxyClient initInternal:options:]((id *)&self->super.isa, v6, v7);
  *((unsigned char *)v8 + 9) = 1;
  self = v8;
  id v9 = self;
LABEL_9:

  return v9;
}

- (id)initInternal:(void *)a3 options:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)NRIdentityProxyClient;
    objc_super v8 = (id *)objc_msgSendSuper2(&v21, sel_init);
    if (v8)
    {
      a1 = v8;
      v8[2] = (id)atomic_fetch_add_explicit(&initInternal_options__sNRIPCClientID, 1uLL, memory_order_relaxed);
      objc_storeStrong(v8 + 6, a2);
      objc_storeStrong(a1 + 3, a3);
      goto LABEL_4;
    }
    uint64_t v10 = nrCopyLogObj_941();
    uint64_t v11 = v10;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (!v12)
      {
LABEL_10:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v19 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v19 = 136446210;
        *(void *)(v19 + 4) = "-[NRIdentityProxyClient initInternal:options:]";
        id v20 = nrCopyLogObj_941();
        _NRLogAbortWithPack(v20);
      }
    }
    id v13 = nrCopyLogObj_941();
    _NRLogWithArgs((uint64_t)v13, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v14, v15, v16, v17, v18, (uint64_t)"");

    goto LABEL_10;
  }
LABEL_4:

  return a1;
}

- (NRIdentityProxyClient)initWithIdentityReference:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v10 = nrCopyLogObj_941();
    uint64_t v11 = v10;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_FAULT);

      if (!v12) {
        goto LABEL_8;
      }
    }
    id v13 = nrCopyLogObj_941();
    _NRLogWithArgs((uint64_t)v13, 17, (uint64_t)"%s called with null identityReference", v14, v15, v16, v17, v18, (uint64_t)"-[NRIdentityProxyClient initWithIdentityReference:options:]");

    goto LABEL_8;
  }
  if (![v6 length])
  {
LABEL_8:
    id v9 = 0;
    goto LABEL_9;
  }
  objc_super v8 = -[NRIdentityProxyClient initInternal:options:]((id *)&self->super.isa, v6, v7);
  *((unsigned char *)v8 + 8) = 1;
  self = v8;
  id v9 = self;
LABEL_9:

  return v9;
}

@end