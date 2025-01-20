@interface NRDevicePairingManagerMux
- (NRDevicePairingManagerMux)init;
- (void)checkInWithRetryCount:(id *)a1;
- (void)dealloc;
- (void)invalidateManagersWithError:(uint64_t)a1;
- (void)registerPairingManager:(void *)a3 withCompletion:;
- (void)sendAuthMethodRequestForDevice:(uint64_t)a3 authMethod:(void *)a4 pairingManager:(void *)a5 withCompletion:;
- (void)startDiscoveryForPairingManager:(void *)a3 withCompletion:;
- (void)startPairingForPairingManager:(void *)a3 pairingTarget:(void *)a4 withCompletion:;
- (void)stopDiscoveryForPairingManager:(void *)a3 withCompletion:;
- (void)stopPairingForPairingManager:(void *)a3 withCompletion:;
- (void)unpairDevice:(void *)a3 withCompletion:;
- (void)unregisterPairingManager:(void *)a3 withCompletion:;
@end

@implementation NRDevicePairingManagerMux

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_muxEntries, 0);
}

- (NRDevicePairingManagerMux)init
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)NRDevicePairingManagerMux;
  v2 = [(NRDevicePairingManagerMux *)&v25 init];
  if (!v2)
  {
    v11 = nrCopyLogObj_1449();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!v13)
      {
LABEL_10:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v20 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v20 = 136446210;
        *(void *)(v20 + 4) = "-[NRDevicePairingManagerMux init]";
        id v21 = nrCopyLogObj_1449();
        _NRLogAbortWithPack(v21);
      }
    }
    id v14 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v14, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v15, v16, v17, v18, v19, (uint64_t)"");

    goto LABEL_10;
  }
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  muxEntries = v2->_muxEntries;
  v2->_muxEntries = v3;

  if (nrXPCCopyQueue_onceToken != -1) {
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2277);
  }
  objc_storeStrong((id *)&v2->_queue, (id)nrXPCCopyQueue_nrXPCQueue);
  v5 = v2->_queue;
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.terminusd", v5, 2uLL);
  connection = v2->_connection;
  v2->_connection = mach_service;

  objc_initWeak(&location, v2);
  v8 = v2->_connection;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __33__NRDevicePairingManagerMux_init__block_invoke;
  handler[3] = &unk_263FD14A0;
  objc_copyWeak(&v23, &location);
  xpc_connection_set_event_handler(v8, handler);

  v9 = v2->_connection;
  xpc_connection_activate(v9);

  -[NRDevicePairingManagerMux checkInWithRetryCount:]((id *)&v2->super.isa, 0);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v2;
}

void __33__NRDevicePairingManagerMux_init__block_invoke(uint64_t a1, void *a2)
{
  v209[1] = *(id *)MEMORY[0x263EF8340];
  id v201 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = MEMORY[0x210512A10](v201);
    if (v4 != MEMORY[0x263EF8708])
    {
      if (v4 == MEMORY[0x263EF8720])
      {
        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
        v187 = "";
        v11 = "%s%.30s:%-4d Received XPC error: %@, invalidating";
        int v12 = 16;
        goto LABEL_31;
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 16, (uint64_t)"%s%.30s:%-4d Received unexpected XPC object: %@, invalidating", v5, v6, v7, v8, v9, (uint64_t)""), nrCopyLogObj_onceToken_1460 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT))
          {
LABEL_32:
            self;
            id v24 = objc_alloc(MEMORY[0x263F087E8]);
            v209[0] = *(id *)MEMORY[0x263F08320];
            block = @"An XPC connection error occurred";
            objc_super v25 = [NSDictionary dictionaryWithObjects:&block forKeys:v209 count:1];
            id v14 = (void *)[v24 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v25];

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
LABEL_120:

            goto LABEL_121;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
      v11 = "Received unexpected XPC object";
      int v12 = 17;
LABEL_31:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v187);
      goto LABEL_32;
    }
    if (nrCopyLogObj_onceToken_1460 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_DEBUG)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 2, (uint64_t)"%s%.30s:%-4d Received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    id v13 = v201;
    id v14 = v13;
    if (!*((void *)WeakRetained + 3)) {
      goto LABEL_120;
    }
    uint64_t v15 = xpc_dictionary_get_value(v13, "PairingManagerOperation");
    uint64_t v16 = (void *)v15;
    if (v15)
    {
      if (MEMORY[0x210512A10](v15) == MEMORY[0x263EF87A0])
      {
        uuid = xpc_dictionary_get_uuid(v14, "PairingManager");
        if (!uuid || (id v23 = uuid, uuid_is_null(uuid)))
        {
          if (nrCopyLogObj_onceToken_1460 == -1)
          {
            if (sNRCopyLogToStdErr) {
              goto LABEL_25;
            }
          }
          else
          {
            dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
            if (sNRCopyLogToStdErr) {
              goto LABEL_25;
            }
          }
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT))
          {
LABEL_119:

            goto LABEL_120;
          }
LABEL_25:
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 17, (uint64_t)"Pairing manager UUID missing", v18, v19, v20, v21, v22, (uint64_t)v187);
          goto LABEL_119;
        }
        unint64_t v26 = 0x263F08000uLL;
        v27 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v23];
        v28 = [*((id *)WeakRetained + 2) objectForKeyedSubscript:v27];
        if (!v28)
        {
          v128 = nrCopyLogObj_1449();
          v129 = v128;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v132 = os_log_type_enabled(v128, OS_LOG_TYPE_FAULT);

            if (!v132) {
              goto LABEL_117;
            }
          }
          id v47 = nrCopyLogObj_1449();
          _NRLogWithArgs((uint64_t)v47, 17, (uint64_t)"Pairing manager %@ is not registered", v133, v134, v135, v136, v137, (uint64_t)v27);
LABEL_69:

          goto LABEL_117;
        }
        uint64_t value = xpc_uint64_get_value(v16);
        switch(value)
        {
          case 5uLL:
            xpc_object_t xdict = v14;
            uint64_t v35 = xpc_dictionary_get_value(xdict, "DiscoveredPairingCandidate");
            v36 = (void *)v35;
            if (!v35) {
              goto LABEL_97;
            }
            if (MEMORY[0x210512A10](v35) != MEMORY[0x263EF86F8])
            {
              if (nrCopyLogObj_onceToken_1460 == -1)
              {
                if (!sNRCopyLogToStdErr) {
                  goto LABEL_39;
                }
              }
              else
              {
                dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
                if (!sNRCopyLogToStdErr)
                {
LABEL_39:
                  if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT)) {
                    goto LABEL_97;
                  }
                }
              }
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 17, (uint64_t)"Failed to get pairing candidate from message", v37, v38, v39, v40, v41, (uint64_t)v187);
              goto LABEL_97;
            }
            v199 = v28;
            v193 = v27;
            id v77 = objc_alloc(MEMORY[0x263EFF8F8]);
            bytes_ptr = xpc_data_get_bytes_ptr(v36);
            v209[0] = 0;
            uint64_t v188 = [v77 initWithBytes:bytes_ptr length:xpc_data_get_length(v36)];
            v79 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v188 error:v209];
            id v189 = v209[0];
            if (!v189)
            {
              id v80 = v199[2];
              v190 = v79;
              v81 = [v79 uuid];
              v82 = [v80 objectForKeyedSubscript:v81];

              if (v82)
              {
                unint64_t v26 = 0x263F08000;
                if (nrCopyLogObj_onceToken_1460 != -1) {
                  dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
                }
                v88 = v190;
                v27 = v193;
                v89 = (void *)v188;
                if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_INFO)) {
                  _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 1, (uint64_t)"%s%.30s:%-4d Received duplicate candidate %@", v83, v84, v85, v86, v87, (uint64_t)"");
                }
              }
              else
              {
                if (nrCopyLogObj_onceToken_1460 != -1) {
                  dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
                }
                if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_INFO)) {
                  _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 1, (uint64_t)"%s%.30s:%-4d Received new candidate %@", v83, v84, v85, v86, v87, (uint64_t)"");
                }
                id v90 = v199[2];
                v91 = [v190 uuid];
                [v90 setObject:v190 forKeyedSubscript:v91];

                id v92 = v199[1];
                id v93 = v190;
                if (v92)
                {
                  v94 = v92;
                  objc_sync_enter(v94);
                  uint64_t v95 = v94[1];
                  objc_sync_exit(v94);

                  if (v95 == 5)
                  {
                    v96 = [v94 candidateDiscoveredHandler];

                    if (v96)
                    {
                      v97 = v94[7];
                      block = (__CFString *)MEMORY[0x263EF8330];
                      uint64_t v203 = 3221225472;
                      v204 = __46__NRDevicePairingManager_discoveredCandidate___block_invoke;
                      v205 = &unk_263FD1428;
                      v206 = v94;
                      id v207 = v93;
                      dispatch_async(v97, &block);
                    }
                  }
                }

                v88 = v190;
                v27 = v193;
                unint64_t v26 = 0x263F08000uLL;
                v89 = (void *)v188;
              }
              goto LABEL_96;
            }
            v88 = v79;
            v157 = nrCopyLogObj_1449();
            v158 = v157;
            if (sNRCopyLogToStdErr)
            {

              v27 = v193;
              v89 = (void *)v188;
            }
            else
            {
              BOOL v191 = os_log_type_enabled(v157, OS_LOG_TYPE_FAULT);

              v27 = v193;
              unint64_t v26 = 0x263F08000;
              v89 = (void *)v188;
              if (!v191)
              {
LABEL_96:

                v28 = v199;
LABEL_97:
                unint64_t v98 = v26;
                v99 = xpc_dictionary_get_uuid(xdict, "LostPairingCandidate");
                if (!v99) {
                  goto LABEL_116;
                }
                v100 = v99;
                if (uuid_is_null(v99)) {
                  goto LABEL_116;
                }
                v101 = (void *)[objc_alloc(*(Class *)(v98 + 3128)) initWithUUIDBytes:v100];
                v200 = v28;
                v107 = [v28[2] objectForKeyedSubscript:v101];
                if (v107)
                {
                  if (nrCopyLogObj_onceToken_1460 != -1) {
                    dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
                  }
                  v194 = v27;
                  if (sNRCopyLogToStdErr
                    || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_INFO))
                  {
                    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 1, (uint64_t)"%s%.30s:%-4d Lost candidate %@", v102, v103, v104, v105, v106, (uint64_t)"");
                  }
                  id v108 = v200[1];
                  id v109 = v107;
                  if (v108)
                  {
                    v110 = v108;
                    objc_sync_enter(v110);
                    uint64_t v111 = v110[1];
                    objc_sync_exit(v110);

                    if (v111 == 5)
                    {
                      v112 = [v110 candidateLostHandler];

                      if (v112)
                      {
                        v113 = v110[7];
                        block = (__CFString *)MEMORY[0x263EF8330];
                        uint64_t v203 = 3221225472;
                        v204 = __40__NRDevicePairingManager_lostCandidate___block_invoke;
                        v205 = &unk_263FD1428;
                        v206 = v110;
                        id v207 = v109;
                        dispatch_async(v113, &block);
                      }
                    }
                  }

                  [v200[2] setObject:0 forKeyedSubscript:v101];
                  v27 = v194;
                  goto LABEL_115;
                }
                if (nrCopyLogObj_onceToken_1460 == -1)
                {
                  if (sNRCopyLogToStdErr) {
                    goto LABEL_114;
                  }
                }
                else
                {
                  dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
                  if (sNRCopyLogToStdErr) {
                    goto LABEL_114;
                  }
                }
                if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_INFO))
                {
LABEL_115:

                  v28 = v200;
LABEL_116:

                  goto LABEL_117;
                }
LABEL_114:
                _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 1, (uint64_t)"%s%.30s:%-4d Lost missing candidate %@", v102, v103, v104, v105, v106, (uint64_t)"");
                goto LABEL_115;
              }
            }
            id v181 = nrCopyLogObj_1449();
            _NRLogWithArgs((uint64_t)v181, 17, (uint64_t)"Failed to unarchive NRDevicePairingCandidate %@", v182, v183, v184, v185, v186, (uint64_t)v189);

            unint64_t v26 = 0x263F08000;
            goto LABEL_96;
          case 7uLL:
            id v47 = v14;
            if (nrCopyLogObj_onceToken_1460 == -1)
            {
              if (sNRCopyLogToStdErr) {
                goto LABEL_48;
              }
            }
            else
            {
              dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
              if (sNRCopyLogToStdErr) {
                goto LABEL_48;
              }
            }
            if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_INFO)) {
              goto LABEL_49;
            }
LABEL_48:
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 1, (uint64_t)"%s%.30s:%-4d Received auth method request from peer", v42, v43, v44, v45, v46, (uint64_t)"");
LABEL_49:
            uint64_t uint64 = xpc_dictionary_get_uint64(v47, "AuthRequestType");
            v198 = v28;
            if (uint64)
            {
              uint64_t v49 = uint64;
              v192 = v27;
              uint64_t v50 = xpc_dictionary_get_value(v47, "AuthData");
              id v51 = (id)v50;
              if (v50 && MEMORY[0x210512A10](v50) == MEMORY[0x263EF86F8])
              {
                id v52 = objc_alloc(MEMORY[0x263EFF8F8]);
                v53 = xpc_data_get_bytes_ptr(v51);
                v54 = (void *)[v52 initWithBytes:v53 length:xpc_data_get_length(v51)];
                v55 = v198[1];
                id v56 = v54;
                if (v55)
                {
                  v57 = [v55 authRequestHandler];

                  if (v57)
                  {
                    v58 = v55[7];
                    block = (__CFString *)MEMORY[0x263EF8330];
                    uint64_t v203 = 3221225472;
                    v204 = __64__NRDevicePairingManager_receivedRequestForAuthMethod_authData___block_invoke;
                    v205 = &unk_263FD1450;
                    v206 = v55;
                    uint64_t v208 = v49;
                    id v207 = v56;
                    dispatch_async(v58, &block);
                  }
                }
              }
              else
              {
                v130 = nrCopyLogObj_1449();
                v131 = v130;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v140 = os_log_type_enabled(v130, OS_LOG_TYPE_FAULT);

                  if (!v140) {
                    goto LABEL_57;
                  }
                }
                id v56 = nrCopyLogObj_1449();
                _NRLogWithArgs((uint64_t)v56, 17, (uint64_t)"Received request for auth method with no auth data", v141, v142, v143, v144, v145, (uint64_t)v187);
              }

LABEL_57:
              v27 = v192;
LABEL_58:

              v28 = v198;
              goto LABEL_78;
            }
            v138 = nrCopyLogObj_1449();
            v139 = v138;
            if (sNRCopyLogToStdErr)
            {

LABEL_166:
              id v51 = nrCopyLogObj_1449();
              _NRLogWithArgs((uint64_t)v51, 17, (uint64_t)"Received request for invalid auth method", v152, v153, v154, v155, v156, (uint64_t)v187);
              goto LABEL_58;
            }
            BOOL v151 = os_log_type_enabled(v138, OS_LOG_TYPE_FAULT);

            if (v151) {
              goto LABEL_166;
            }
            goto LABEL_78;
          case 8uLL:
            id v47 = v14;
            if (nrCopyLogObj_onceToken_1460 == -1)
            {
              if (sNRCopyLogToStdErr) {
                goto LABEL_62;
              }
            }
            else
            {
              dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
              if (sNRCopyLogToStdErr) {
                goto LABEL_62;
              }
            }
            if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_INFO)) {
              goto LABEL_63;
            }
LABEL_62:
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 1, (uint64_t)"%s%.30s:%-4d Received auth method request update", v59, v60, v61, v62, v63, (uint64_t)"");
LABEL_63:
            v64 = xpc_dictionary_get_uuid(v47, "TargetPairingCandidate");
            if (!v64 || (v70 = v64, uuid_is_null(v64)))
            {
              if (nrCopyLogObj_onceToken_1460 == -1)
              {
                if (!sNRCopyLogToStdErr) {
                  goto LABEL_67;
                }
              }
              else
              {
                dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
                if (!sNRCopyLogToStdErr)
                {
LABEL_67:
                  if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT)) {
                    goto LABEL_78;
                  }
                }
              }
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 17, (uint64_t)"Auth method request result missing pairing target UUID", v65, v66, v67, v68, v69, (uint64_t)v187);
              goto LABEL_69;
            }
            v71 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v70];
            v72 = [v28[5] objectForKeyedSubscript:v71];
            if (!v72)
            {
              v73 = v28;
              v146 = nrCopyLogObj_1449();
              v147 = v146;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v159 = os_log_type_enabled(v146, OS_LOG_TYPE_ERROR);

                if (!v159) {
                  goto LABEL_77;
                }
              }
              id v75 = nrCopyLogObj_1449();
              _NRLogWithArgs((uint64_t)v75, 16, (uint64_t)"%s%.30s:%-4d Pairing target %@ in auth method request result has no outstanding request", v160, v161, v162, v163, v164, (uint64_t)"");
LABEL_76:

LABEL_77:
              v28 = v73;
LABEL_78:

LABEL_117:
LABEL_118:

              goto LABEL_119;
            }
            v73 = v28;
            [v28[5] setObject:0 forKeyedSubscript:v71];
            uint64_t v74 = xpc_dictionary_get_value(v47, "Result");
            if (v74)
            {
              id v75 = (id)v74;
              if (MEMORY[0x210512A10]() == MEMORY[0x263EF8738])
              {
                int64_t v76 = xpc_int64_get_value(v75);
                if (v76)
                {
                  xpc_object_t xdicta = (xpc_object_t)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, v76);
                  ((void (**)(void, xpc_object_t))v72)[2](v72, xdicta);
                }
                else
                {
                  ((void (*)(void (**)(void, void)))v72[2])(v72);
                }
                goto LABEL_76;
              }
              v150 = nrCopyLogObj_1449();
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                v173 = v150;
                BOOL xdictb = os_log_type_enabled(v150, OS_LOG_TYPE_FAULT);

                if (!xdictb)
                {
LABEL_176:
                  v180 = (void *)+[NRDevicePairingManager copyXPCError]();
                  ((void (**)(void, void *))v72)[2](v72, v180);

                  goto LABEL_76;
                }
              }
              id v174 = nrCopyLogObj_1449();
              _NRLogWithArgs((uint64_t)v174, 17, (uint64_t)"Register received invalid result type", v175, v176, v177, v178, v179, (uint64_t)v187);

              goto LABEL_176;
            }
            v148 = nrCopyLogObj_1449();
            v149 = v148;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v165 = os_log_type_enabled(v148, OS_LOG_TYPE_FAULT);

              if (!v165)
              {
LABEL_173:
                v172 = (void *)+[NRDevicePairingManager copyXPCError]();
                ((void (**)(void, void *))v72)[2](v72, v172);

                id v75 = 0;
                goto LABEL_76;
              }
            }
            id v166 = nrCopyLogObj_1449();
            _NRLogWithArgs((uint64_t)v166, 17, (uint64_t)"Auth method request received response without result code", v167, v168, v169, v170, v171, (uint64_t)v187);

            goto LABEL_173;
          case 0xCuLL:
            -[NRDevicePairingManagerMuxEntry handleStartPairingRequestUpdate:]((uint64_t)v28, v14);
            goto LABEL_117;
          default:
            if (nrCopyLogObj_onceToken_1460 == -1)
            {
              if (sNRCopyLogToStdErr) {
                goto LABEL_44;
              }
            }
            else
            {
              dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
              if (sNRCopyLogToStdErr) {
                goto LABEL_44;
              }
            }
            if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT)) {
              goto LABEL_117;
            }
LABEL_44:
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 17, (uint64_t)"Received unexpected operation code %llu", v29, v30, v31, v32, v33, value);
            goto LABEL_117;
        }
      }
      v116 = nrCopyLogObj_1449();
      v117 = v116;
      if (sNRCopyLogToStdErr)
      {

LABEL_135:
        id v119 = nrCopyLogObj_1449();
        v125 = v119;
        v126 = "Received invalid operation code type";
        goto LABEL_136;
      }
      BOOL v127 = os_log_type_enabled(v116, OS_LOG_TYPE_FAULT);

      if (v127) {
        goto LABEL_135;
      }
LABEL_137:
      v27 = (void *)+[NRDevicePairingManager copyXPCError]();
      -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v27);
      goto LABEL_118;
    }
    v114 = nrCopyLogObj_1449();
    v115 = v114;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v118 = os_log_type_enabled(v114, OS_LOG_TYPE_FAULT);

      if (!v118) {
        goto LABEL_137;
      }
    }
    id v119 = nrCopyLogObj_1449();
    v125 = v119;
    v126 = "Received unsolicited message without operation code";
LABEL_136:
    _NRLogWithArgs((uint64_t)v119, 17, (uint64_t)v126, v120, v121, v122, v123, v124, (uint64_t)v187);

    goto LABEL_137;
  }
LABEL_121:
}

- (void)checkInWithRetryCount:(id *)a1
{
  location[1] = *(id *)MEMORY[0x263EF8340];
  if (a2 >= 6)
  {
    uint64_t v18 = nrCopyLogObj_1449();
    uint64_t v19 = v18;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v33 = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);

      if (!v33) {
        goto LABEL_28;
      }
    }
    id v34 = nrCopyLogObj_1449();
    uint64_t v40 = v34;
    uint64_t v41 = "Failed to checkin NRDeviceMonitor after retries";
LABEL_27:
    _NRLogWithArgs((uint64_t)v34, 17, (uint64_t)v41, v35, v36, v37, v38, v39, v43);

    goto LABEL_28;
  }
  if (a1[3])
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    if (v4)
    {
      uint64_t v5 = v4;
      xpc_dictionary_set_uint64(v4, "Type", 0x31uLL);
      objc_initWeak(location, a1);
      uint64_t v6 = (_xpc_connection_s *)a1[3];
      uint64_t v7 = a1[4];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __51__NRDevicePairingManagerMux_checkInWithRetryCount___block_invoke;
      handler[3] = &unk_263FD14C8;
      objc_copyWeak(&v47, location);
      id v8 = v5;
      id v46 = v8;
      unsigned int v48 = a2;
      xpc_connection_send_message_with_reply(v6, v8, v7, handler);

      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      uint64_t v9 = (id)nrCopyLogObj_sNRLogObj_1462;
      uint64_t v10 = v9;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

        if (!v11)
        {
LABEL_12:

          objc_destroyWeak(&v47);
          objc_destroyWeak(location);

          return;
        }
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      id v12 = (id)nrCopyLogObj_sNRLogObj_1462;
      _NRLogWithArgs((uint64_t)v12, 1, (uint64_t)"%s%.30s:%-4d Sent check-in message: %@", v13, v14, v15, v16, v17, (uint64_t)"");

      goto LABEL_12;
    }
    uint64_t v22 = nrCopyLogObj_1449();
    id v23 = v22;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v24 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (!v24)
      {
LABEL_22:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v31 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v31, (uint64_t)"nr_xpc_dictionary_create");
        id v32 = nrCopyLogObj_1449();
        _NRLogAbortWithPack(v32);
      }
    }
    id v25 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v25, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v26, v27, v28, v29, v30, (uint64_t)"");

    goto LABEL_22;
  }
  uint64_t v20 = nrCopyLogObj_1449();
  uint64_t v21 = v20;
  if (sNRCopyLogToStdErr)
  {

LABEL_26:
    id v34 = nrCopyLogObj_1449();
    uint64_t v40 = v34;
    uint64_t v41 = "Could not check in with server as no connection found";
    goto LABEL_27;
  }
  BOOL v42 = os_log_type_enabled(v20, OS_LOG_TYPE_FAULT);

  if (v42) {
    goto LABEL_26;
  }
LABEL_28:
  uint64_t v44 = (void *)+[NRDevicePairingManager copyXPCError]();
  -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)a1, v44);
}

- (void)invalidateManagersWithError:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    xpc_object_t v4 = *(_xpc_connection_s **)(a1 + 24);
    if (v4)
    {
      xpc_connection_cancel(v4);
      uint64_t v5 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = *(id *)(a1 + 16);
    uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v27 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = [*(id *)(a1 + 16) objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          uint64_t v10 = v9;
          if (v9)
          {
            uint64_t v11 = *(void *)(v9 + 24);
            if (v11)
            {
              (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
              objc_setProperty_nonatomic_copy((id)v10, v12, 0, 24);
            }
            uint64_t v13 = *(void *)(v10 + 32);
            if (v13)
            {
              (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
              objc_setProperty_nonatomic_copy((id)v10, v14, 0, 32);
            }
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            uint64_t v15 = *(void **)(v10 + 40);
          }
          else
          {
            uint64_t v15 = 0;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
          }
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v29;
            if (v10)
            {
              uint64_t v20 = a1;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v29 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v22 = [*(id *)(v10 + 40) objectForKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * j)];
                  ((void (**)(void, id))v22)[2](v22, v3);
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
              }
              while (v18);

              a1 = v20;
LABEL_31:
              [*(id *)(v10 + 40) removeAllObjects];
              id v25 = *(void **)(v10 + 8);
              goto LABEL_32;
            }
            do
            {
              for (uint64_t k = 0; k != v18; ++k)
              {
                if (*(void *)v29 != v19) {
                  objc_enumerationMutation(v16);
                }
                BOOL v24 = [0 objectForKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * k)];
                ((void (**)(void, id))v24)[2](v24, v3);
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v18);
          }

          if (v10) {
            goto LABEL_31;
          }
          [0 removeAllObjects];
          id v25 = 0;
LABEL_32:
          -[NRDevicePairingManager invalidateWithError:](v25, v3);
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v7);
    }

    [*(id *)(a1 + 16) removeAllObjects];
  }
}

void __51__NRDevicePairingManagerMux_checkInWithRetryCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  xpc_object_t xdict = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_59;
  }
  uint64_t v4 = MEMORY[0x210512A10](xdict);
  if (v4 == MEMORY[0x263EF8708])
  {
    if (nrCopyLogObj_onceToken_1460 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_DEBUG)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 2, (uint64_t)"%s%.30s:%-4d Checkin received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    uint64_t v13 = xpc_dictionary_get_value(xdict, "Result");
    SEL v12 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x210512A10](v13) == MEMORY[0x263EF8738])
      {
        int64_t value = xpc_int64_get_value(v12);
        if (!value)
        {
          *((unsigned char *)WeakRetained + 8) = 1;
          if (nrCopyLogObj_onceToken_1460 == -1)
          {
            if (!sNRCopyLogToStdErr) {
              goto LABEL_23;
            }
          }
          else
          {
            dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
            if (!sNRCopyLogToStdErr)
            {
LABEL_23:
              if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_INFO)) {
                goto LABEL_25;
              }
            }
          }
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 1, (uint64_t)"%s%.30s:%-4d Checked in with terminusd", v15, v16, v17, v18, v19, (uint64_t)"");
LABEL_25:
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v20 = *((id *)WeakRetained + 2);
          uint64_t v21 = [v20 countByEnumeratingWithState:&v47 objects:v46 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v48 != v23) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v25 = [*((id *)WeakRetained + 2) objectForKeyedSubscript:*(void *)(*((void *)&v47 + 1) + 8 * i)];
                uint64_t v26 = (void **)v25;
                if (v25 && *(void *)(v25 + 24))
                {
                  id v27 = *(id *)(v25 + 8);
                  -[NRDevicePairingManagerMux registerPairingManager:withCompletion:]((uint64_t)WeakRetained, v27, v26[3]);

                  objc_setProperty_nonatomic_copy(v26, v28, 0, 24);
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v47 objects:v46 count:16];
            }
            while (v22);
          }
          goto LABEL_57;
        }
        long long v33 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
LABEL_56:
        id v20 = v33;
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v33);
LABEL_57:

        goto LABEL_58;
      }
      long long v31 = nrCopyLogObj_1449();
      long long v32 = v31;
      if (sNRCopyLogToStdErr)
      {

LABEL_53:
        id v35 = nrCopyLogObj_1449();
        uint64_t v41 = v35;
        BOOL v42 = "received invalid result type";
        goto LABEL_54;
      }
      BOOL v43 = os_log_type_enabled(v31, OS_LOG_TYPE_FAULT);

      if (v43) {
        goto LABEL_53;
      }
LABEL_55:
      long long v33 = (void *)+[NRDevicePairingManager copyXPCError]();
      goto LABEL_56;
    }
    long long v29 = nrCopyLogObj_1449();
    long long v30 = v29;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v34 = os_log_type_enabled(v29, OS_LOG_TYPE_FAULT);

      if (!v34) {
        goto LABEL_55;
      }
    }
    id v35 = nrCopyLogObj_1449();
    uint64_t v41 = v35;
    BOOL v42 = "received response without result code";
LABEL_54:
    _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)v42, v36, v37, v38, v39, v40, v44);

    goto LABEL_55;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    if (nrCopyLogObj_onceToken_1460 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
    }
    if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR))
      && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 16, (uint64_t)"%s%.30s:%-4d Checkin received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)""), nrCopyLogObj_onceToken_1460 != -1))
    {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      if (sNRCopyLogToStdErr) {
        goto LABEL_11;
      }
    }
    else if (sNRCopyLogToStdErr)
    {
      goto LABEL_11;
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT))
    {
LABEL_12:
      self;
      id v10 = objc_alloc(MEMORY[0x263F087E8]);
      *(void *)&long long v47 = *MEMORY[0x263F08320];
      v46[0] = @"An XPC connection error occurred";
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v47 count:1];
      SEL v12 = (void *)[v10 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v11];

      -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v12);
LABEL_58:

      goto LABEL_59;
    }
LABEL_11:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 17, (uint64_t)"Checkin received unexpected XPC object", v5, v6, v7, v8, v9, v44);
    goto LABEL_12;
  }
  if (nrCopyLogObj_onceToken_1460 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 16, (uint64_t)"%s%.30s:%-4d Checkin could not deliver message %@, error %@, retrying", v5, v6, v7, v8, v9, (uint64_t)"");
  }
  -[NRDevicePairingManagerMux checkInWithRetryCount:](WeakRetained, (*(_DWORD *)(a1 + 48) + 1));
LABEL_59:
}

- (void)registerPairingManager:(void *)a3 withCompletion:
{
  v56[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  long long v49 = a3;
  if (a1)
  {
    if (!*(void *)(a1 + 24))
    {
      id v27 = (void *)+[NRDevicePairingManager copyXPCError]();
      v49[2](v49, v27);

      goto LABEL_23;
    }
    if (v5) {
      uint64_t v6 = (void *)v5[11];
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
    long long v50 = [v7 uuid];

    uint64_t v8 = [*(id *)(a1 + 16) objectForKeyedSubscript:v50];
    if (!v8)
    {
      uint64_t v8 = -[NRDevicePairingManagerMuxEntry initWithPairingManager:]([NRDevicePairingManagerMuxEntry alloc], v5);
      [*(id *)(a1 + 16) setObject:v8 forKeyedSubscript:v50];
      if (!*(unsigned char *)(a1 + 8))
      {
        if (!v8) {
          goto LABEL_22;
        }
        objc_setProperty_nonatomic_copy(v8, v9, v49, 24);
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
    }
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      uint64_t v11 = v10;
      xpc_dictionary_set_uint64(v10, "PairingManagerOperation", 1uLL);
      SEL v12 = (void *)MEMORY[0x263F08910];
      if (v5) {
        uint64_t v13 = (void *)v5[11];
      }
      else {
        uint64_t v13 = 0;
      }
      id v14 = v13;
      v56[0] = 0;
      uint64_t v15 = [v12 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:v56];
      id v48 = v56[0];

      if (!v48)
      {
        xpc_dictionary_set_data(v11, "PairingManagerInfo", (const void *)[v15 bytes], objc_msgSend(v15, "length"));
        objc_initWeak(&location, (id)a1);
        uint64_t v16 = (_xpc_connection_s *)*(id *)(a1 + 24);
        uint64_t v17 = *(id *)(a1 + 32);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __67__NRDevicePairingManagerMux_registerPairingManager_withCompletion___block_invoke;
        handler[3] = &unk_263FD14F0;
        objc_copyWeak(&v54, &location);
        v53 = v49;
        id v52 = v11;
        xpc_connection_send_message_with_reply(v16, v52, v17, handler);

        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        uint64_t v18 = (id)nrCopyLogObj_sNRLogObj_1462;
        uint64_t v19 = v18;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v20 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

          if (!v20)
          {
LABEL_19:

            objc_destroyWeak(&v54);
            objc_destroyWeak(&location);
LABEL_20:

            goto LABEL_21;
          }
        }
        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        id v21 = (id)nrCopyLogObj_sNRLogObj_1462;
        _NRLogWithArgs((uint64_t)v21, 1, (uint64_t)"%s%.30s:%-4d Sent registration message: %@", v22, v23, v24, v25, v26, (uint64_t)"");

        goto LABEL_19;
      }
      long long v31 = nrCopyLogObj_1449();
      long long v32 = v31;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v41 = os_log_type_enabled(v31, OS_LOG_TYPE_FAULT);

        if (!v41)
        {
LABEL_37:
          v49[2](v49, v48);
          goto LABEL_20;
        }
      }
      id v42 = nrCopyLogObj_1449();
      _NRLogWithArgs((uint64_t)v42, 17, (uint64_t)"Failed to archive device pairing manager info %@", v43, v44, v45, v46, v47, (uint64_t)v48);

      goto LABEL_37;
    }
    SEL v28 = nrCopyLogObj_1449();
    long long v29 = v28;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v30 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

      if (!v30)
      {
LABEL_34:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v39 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v39, (uint64_t)"nr_xpc_dictionary_create");
        id v40 = nrCopyLogObj_1449();
        _NRLogAbortWithPack(v40);
      }
    }
    id v33 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v33, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v34, v35, v36, v37, v38, (uint64_t)"");

    goto LABEL_34;
  }
LABEL_23:
}

void __67__NRDevicePairingManagerMux_registerPairingManager_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v45[1] = *MEMORY[0x263EF8340];
  xpc_object_t xdict = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = MEMORY[0x210512A10](xdict);
    if (v4 != MEMORY[0x263EF8708])
    {
      if (v4 == MEMORY[0x263EF8720])
      {
        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
        id v42 = "";
        uint64_t v11 = "%s%.30s:%-4d Register could not deliver message %@, error %@";
        int v12 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 16, (uint64_t)"%s%.30s:%-4d Register received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)""), nrCopyLogObj_onceToken_1460 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            uint64_t v17 = *(void *)(a1 + 40);
            self;
            id v18 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v44 = *MEMORY[0x263F08320];
            uint64_t v19 = v44;
            v45[0] = @"An XPC connection error occurred";
            BOOL v20 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
            id v21 = (void *)[v18 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v20];

            (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v21);
            self;
            id v22 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v44 = v19;
            v45[0] = @"An XPC connection error occurred";
            uint64_t v23 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
            id v14 = (void *)[v22 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v23];

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
      uint64_t v11 = "Register received unexpected XPC object";
      int v12 = 17;
LABEL_26:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v42);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1460 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_DEBUG)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 2, (uint64_t)"%s%.30s:%-4d Register received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    uint64_t v13 = xpc_dictionary_get_value(xdict, "Result");
    id v14 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x210512A10](v13) == MEMORY[0x263EF8738])
      {
        int64_t value = xpc_int64_get_value(v14);
        uint64_t v16 = *(void *)(a1 + 40);
        if (!value)
        {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
LABEL_28:

          goto LABEL_29;
        }
        uint64_t v26 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v26);

LABEL_45:
        BOOL v41 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v41);

        goto LABEL_28;
      }
      uint64_t v25 = nrCopyLogObj_1449();
      if (sNRCopyLogToStdErr)
      {

LABEL_42:
        id v29 = nrCopyLogObj_1449();
        uint64_t v35 = v29;
        uint64_t v36 = "Register received invalid result type";
        goto LABEL_43;
      }
      uint64_t v37 = v25;
      BOOL v38 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (v38) {
        goto LABEL_42;
      }
LABEL_44:
      uint64_t v39 = *(void *)(a1 + 40);
      id v40 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);

      goto LABEL_45;
    }
    uint64_t v24 = nrCopyLogObj_1449();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      id v27 = v24;
      BOOL v28 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v28) {
        goto LABEL_44;
      }
    }
    id v29 = nrCopyLogObj_1449();
    uint64_t v35 = v29;
    uint64_t v36 = "Register received response without result code";
LABEL_43:
    _NRLogWithArgs((uint64_t)v29, 17, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v42);

    goto LABEL_44;
  }
LABEL_29:
}

- (void)dealloc
{
  if (nrCopyLogObj_onceToken_1460 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 0, (uint64_t)"%s%.30s:%-4d Dealloc %@", v2, v3, v4, v5, v6, (uint64_t)"");
  }
  if (self)
  {
    connection = self->_connection;
    if (connection)
    {
      xpc_connection_cancel(connection);
      uint64_t v9 = self->_connection;
      self->_connection = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)NRDevicePairingManagerMux;
  [(NRDevicePairingManagerMux *)&v10 dealloc];
}

- (void)unregisterPairingManager:(void *)a3 withCompletion:
{
  location[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  id v56 = a3;
  if (a1)
  {
    if (!a1[3])
    {
      uint64_t v33 = (void *)+[NRDevicePairingManager copyXPCError]();
      v56[2](v56, v33);

      goto LABEL_21;
    }
    if (v5) {
      uint64_t v6 = (void *)v5[11];
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
    uint64_t v8 = [v7 uuid];

    uint64_t v9 = [a1[2] objectForKeyedSubscript:v8];
    objc_super v10 = (void *)v9;
    if (!v9)
    {
      v56[2](v56, 0);
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v11 = *(void (***)(void, void))(v9 + 24);
    if (v11)
    {
      int v12 = v11;
      self;
      id v13 = objc_alloc(MEMORY[0x263F087E8]);
      location[0] = *(id *)MEMORY[0x263F08320];
      *(void *)uuid = @"Manager is in invalid state for this operation";
      id v14 = [NSDictionary dictionaryWithObjects:uuid forKeys:location count:1];
      uint64_t v15 = (void *)[v13 initWithDomain:@"NRDevicePairingErrorDomain" code:-3001 userInfo:v14];

      ((void (**)(void, void *))v11)[2](v12, v15);
      objc_setProperty_nonatomic_copy(v10, v16, 0, 24);
    }
    xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
    if (v17)
    {
      id v18 = v17;
      xpc_dictionary_set_uint64(v17, "PairingManagerOperation", 2uLL);
      *(void *)uuid = 0;
      uint64_t v63 = 0;
      [v8 getUUIDBytes:uuid];
      xpc_object_t v19 = xpc_array_create(0, 0);
      BOOL v20 = v19;
      if (v19)
      {
        xpc_array_set_uuid(v19, 0xFFFFFFFFFFFFFFFFLL, uuid);
        xpc_dictionary_set_value(v18, "PairingManagers", v20);
        objc_initWeak(location, a1);
        id v21 = (_xpc_connection_s *)a1[3];
        id v22 = a1[4];
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __69__NRDevicePairingManagerMux_unregisterPairingManager_withCompletion___block_invoke;
        handler[3] = &unk_263FD1518;
        objc_copyWeak(&v61, location);
        id v58 = v8;
        uint64_t v60 = v56;
        id v23 = v18;
        id v59 = v23;
        xpc_connection_send_message_with_reply(v21, v23, v22, handler);

        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        uint64_t v24 = (id)nrCopyLogObj_sNRLogObj_1462;
        uint64_t v25 = v24;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v26 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);

          if (!v26)
          {
LABEL_19:

            objc_destroyWeak(&v61);
            objc_destroyWeak(location);

            goto LABEL_20;
          }
        }
        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        id v27 = (id)nrCopyLogObj_sNRLogObj_1462;
        _NRLogWithArgs((uint64_t)v27, 1, (uint64_t)"%s%.30s:%-4d Sent unregistration message: %@", v28, v29, v30, v31, v32, (uint64_t)"");

        goto LABEL_19;
      }
      uint64_t v37 = nrCopyLogObj_1449();
      BOOL v38 = v37;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v39 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);

        if (!v39)
        {
LABEL_34:
          _os_log_pack_size();
          MEMORY[0x270FA5388]();
          __error();
          uint64_t v54 = _os_log_pack_fill();
          __os_log_helper_1_2_3_8_34_8_0_4_0(v54, (uint64_t)"nr_xpc_array_create");
          id v55 = nrCopyLogObj_1449();
          _NRLogAbortWithPack(v55);
        }
      }
      id v48 = nrCopyLogObj_1449();
      _NRLogWithArgs((uint64_t)v48, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed", v49, v50, v51, v52, v53, (uint64_t)"");

      goto LABEL_34;
    }
    uint64_t v34 = nrCopyLogObj_1449();
    uint64_t v35 = v34;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v36 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);

      if (!v36)
      {
LABEL_31:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v46 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v46, (uint64_t)"nr_xpc_dictionary_create");
        id v47 = nrCopyLogObj_1449();
        _NRLogAbortWithPack(v47);
      }
    }
    id v40 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v40, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v41, v42, v43, v44, v45, (uint64_t)"");

    goto LABEL_31;
  }
LABEL_21:
}

void __69__NRDevicePairingManagerMux_unregisterPairingManager_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v46[1] = *MEMORY[0x263EF8340];
  xpc_object_t xdict = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[2] setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v5 = MEMORY[0x210512A10](xdict);
    if (v5 != MEMORY[0x263EF8708])
    {
      if (v5 == MEMORY[0x263EF8720])
      {
        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        uint64_t v11 = nrCopyLogObj_sNRLogObj_1462;
        uint64_t v43 = "";
        int v12 = "%s%.30s:%-4d Unregister could not deliver message %@, error %@";
        int v13 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 16, (uint64_t)"%s%.30s:%-4d Unregister received unexpected XPC object: %@", v6, v7, v8, v9, v10, (uint64_t)""), nrCopyLogObj_onceToken_1460 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            uint64_t v18 = *(void *)(a1 + 48);
            self;
            id v19 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v45 = *MEMORY[0x263F08320];
            uint64_t v20 = v45;
            v46[0] = @"An XPC connection error occurred";
            id v21 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
            id v22 = (void *)[v19 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v21];

            (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v22);
            self;
            id v23 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v45 = v20;
            v46[0] = @"An XPC connection error occurred";
            uint64_t v24 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
            uint64_t v15 = (void *)[v23 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v24];

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)v4, v15);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      uint64_t v11 = nrCopyLogObj_sNRLogObj_1462;
      int v12 = "Unregister received unexpected XPC object";
      int v13 = 17;
LABEL_26:
      _NRLogWithArgs(v11, v13, (uint64_t)v12, v6, v7, v8, v9, v10, (uint64_t)v43);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1460 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_DEBUG)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 2, (uint64_t)"%s%.30s:%-4d Unregister received XPC dict: %@", v6, v7, v8, v9, v10, (uint64_t)"");
    }
    uint64_t v14 = xpc_dictionary_get_value(xdict, "Result");
    uint64_t v15 = (void *)v14;
    if (v14)
    {
      if (MEMORY[0x210512A10](v14) == MEMORY[0x263EF8738])
      {
        int64_t value = xpc_int64_get_value(v15);
        uint64_t v17 = *(void *)(a1 + 48);
        if (!value)
        {
          (*(void (**)(uint64_t))(v17 + 16))(v17);
LABEL_28:

          goto LABEL_29;
        }
        id v27 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v27);

LABEL_45:
        uint64_t v42 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)v4, v42);

        goto LABEL_28;
      }
      BOOL v26 = nrCopyLogObj_1449();
      if (sNRCopyLogToStdErr)
      {

LABEL_42:
        id v30 = nrCopyLogObj_1449();
        BOOL v36 = v30;
        uint64_t v37 = "Unregister received invalid result type";
        goto LABEL_43;
      }
      BOOL v38 = v26;
      BOOL v39 = os_log_type_enabled(v26, OS_LOG_TYPE_FAULT);

      if (v39) {
        goto LABEL_42;
      }
LABEL_44:
      uint64_t v40 = *(void *)(a1 + 48);
      uint64_t v41 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v41);

      goto LABEL_45;
    }
    uint64_t v25 = nrCopyLogObj_1449();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      uint64_t v28 = v25;
      BOOL v29 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (!v29) {
        goto LABEL_44;
      }
    }
    id v30 = nrCopyLogObj_1449();
    BOOL v36 = v30;
    uint64_t v37 = "received response without result code";
LABEL_43:
    _NRLogWithArgs((uint64_t)v30, 17, (uint64_t)v37, v31, v32, v33, v34, v35, (uint64_t)v43);

    goto LABEL_44;
  }
LABEL_29:
}

- (void)startDiscoveryForPairingManager:(void *)a3 withCompletion:
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v6 = a3;
  if (a1)
  {
    if (!a1[3])
    {
      uint64_t v24 = (void *)+[NRDevicePairingManager copyXPCError]();
      v6[2](v6, v24);

      goto LABEL_15;
    }
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      uint64_t v8 = v7;
      *(void *)uuid = 0;
      uint64_t v42 = 0;
      if (v5) {
        uint64_t v9 = (void *)v5[11];
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = v9;
      uint64_t v11 = [v10 uuid];
      [v11 getUUIDBytes:uuid];

      xpc_dictionary_set_uuid(v8, "PairingManager", uuid);
      xpc_dictionary_set_uint64(v8, "PairingManagerOperation", 3uLL);
      objc_initWeak(&location, a1);
      int v12 = (_xpc_connection_s *)a1[3];
      int v13 = a1[4];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __76__NRDevicePairingManagerMux_startDiscoveryForPairingManager_withCompletion___block_invoke;
      handler[3] = &unk_263FD14F0;
      objc_copyWeak(&v39, &location);
      BOOL v38 = v6;
      id v14 = v8;
      id v37 = v14;
      xpc_connection_send_message_with_reply(v12, v14, v13, handler);

      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      uint64_t v15 = (id)nrCopyLogObj_sNRLogObj_1462;
      SEL v16 = v15;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v17 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

        if (!v17)
        {
LABEL_14:

          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);

          goto LABEL_15;
        }
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      id v18 = (id)nrCopyLogObj_sNRLogObj_1462;
      _NRLogWithArgs((uint64_t)v18, 1, (uint64_t)"%s%.30s:%-4d Sent discovery start message: %@", v19, v20, v21, v22, v23, (uint64_t)"");

      goto LABEL_14;
    }
    uint64_t v25 = nrCopyLogObj_1449();
    BOOL v26 = v25;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v27 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (!v27)
      {
LABEL_22:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v34 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v34, (uint64_t)"nr_xpc_dictionary_create");
        id v35 = nrCopyLogObj_1449();
        _NRLogAbortWithPack(v35);
      }
    }
    id v28 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v28, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v29, v30, v31, v32, v33, (uint64_t)"");

    goto LABEL_22;
  }
LABEL_15:
}

void __76__NRDevicePairingManagerMux_startDiscoveryForPairingManager_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v45[1] = *MEMORY[0x263EF8340];
  xpc_object_t xdict = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = MEMORY[0x210512A10](xdict);
    if (v4 != MEMORY[0x263EF8708])
    {
      if (v4 == MEMORY[0x263EF8720])
      {
        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
        uint64_t v42 = "";
        uint64_t v11 = "%s%.30s:%-4d Start discovery could not deliver message %@, error %@";
        int v12 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 16, (uint64_t)"%s%.30s:%-4d Start discovery received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)""), nrCopyLogObj_onceToken_1460 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            uint64_t v17 = *(void *)(a1 + 40);
            self;
            id v18 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v44 = *MEMORY[0x263F08320];
            uint64_t v19 = v44;
            v45[0] = @"An XPC connection error occurred";
            uint64_t v20 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
            uint64_t v21 = (void *)[v18 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v20];

            (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v21);
            self;
            id v22 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v44 = v19;
            v45[0] = @"An XPC connection error occurred";
            uint64_t v23 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
            id v14 = (void *)[v22 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v23];

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
      uint64_t v11 = "Start discovery received unexpected XPC object";
      int v12 = 17;
LABEL_26:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v42);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1460 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_DEBUG)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 2, (uint64_t)"%s%.30s:%-4d Start discovery received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    uint64_t v13 = xpc_dictionary_get_value(xdict, "Result");
    id v14 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x210512A10](v13) == MEMORY[0x263EF8738])
      {
        int64_t value = xpc_int64_get_value(v14);
        uint64_t v16 = *(void *)(a1 + 40);
        if (!value)
        {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
LABEL_28:

          goto LABEL_29;
        }
        BOOL v26 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v26);

LABEL_45:
        uint64_t v41 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v41);

        goto LABEL_28;
      }
      uint64_t v25 = nrCopyLogObj_1449();
      if (sNRCopyLogToStdErr)
      {

LABEL_42:
        id v29 = nrCopyLogObj_1449();
        id v35 = v29;
        BOOL v36 = "Start discovery received invalid result type";
        goto LABEL_43;
      }
      id v37 = v25;
      BOOL v38 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (v38) {
        goto LABEL_42;
      }
LABEL_44:
      uint64_t v39 = *(void *)(a1 + 40);
      uint64_t v40 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);

      goto LABEL_45;
    }
    uint64_t v24 = nrCopyLogObj_1449();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v27 = v24;
      BOOL v28 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v28) {
        goto LABEL_44;
      }
    }
    id v29 = nrCopyLogObj_1449();
    id v35 = v29;
    BOOL v36 = "Start discovery received response without result code";
LABEL_43:
    _NRLogWithArgs((uint64_t)v29, 17, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v42);

    goto LABEL_44;
  }
LABEL_29:
}

- (void)stopDiscoveryForPairingManager:(void *)a3 withCompletion:
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v6 = a3;
  if (a1)
  {
    if (!a1[3])
    {
      uint64_t v24 = (void *)+[NRDevicePairingManager copyXPCError]();
      v6[2](v6, v24);

      goto LABEL_15;
    }
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      uint64_t v8 = v7;
      *(void *)uuid = 0;
      uint64_t v42 = 0;
      if (v5) {
        uint64_t v9 = (void *)v5[11];
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = v9;
      uint64_t v11 = [v10 uuid];
      [v11 getUUIDBytes:uuid];

      xpc_dictionary_set_uuid(v8, "PairingManager", uuid);
      xpc_dictionary_set_uint64(v8, "PairingManagerOperation", 4uLL);
      objc_initWeak(&location, a1);
      int v12 = (_xpc_connection_s *)a1[3];
      uint64_t v13 = a1[4];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __75__NRDevicePairingManagerMux_stopDiscoveryForPairingManager_withCompletion___block_invoke;
      handler[3] = &unk_263FD14F0;
      objc_copyWeak(&v39, &location);
      BOOL v38 = v6;
      id v14 = v8;
      id v37 = v14;
      xpc_connection_send_message_with_reply(v12, v14, v13, handler);

      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      uint64_t v15 = (id)nrCopyLogObj_sNRLogObj_1462;
      uint64_t v16 = v15;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v17 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

        if (!v17)
        {
LABEL_14:

          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);

          goto LABEL_15;
        }
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      id v18 = (id)nrCopyLogObj_sNRLogObj_1462;
      _NRLogWithArgs((uint64_t)v18, 1, (uint64_t)"%s%.30s:%-4d Sent discovery stop message: %@", v19, v20, v21, v22, v23, (uint64_t)"");

      goto LABEL_14;
    }
    uint64_t v25 = nrCopyLogObj_1449();
    BOOL v26 = v25;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v27 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (!v27)
      {
LABEL_22:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v34 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v34, (uint64_t)"nr_xpc_dictionary_create");
        id v35 = nrCopyLogObj_1449();
        _NRLogAbortWithPack(v35);
      }
    }
    id v28 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v28, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v29, v30, v31, v32, v33, (uint64_t)"");

    goto LABEL_22;
  }
LABEL_15:
}

void __75__NRDevicePairingManagerMux_stopDiscoveryForPairingManager_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v45[1] = *MEMORY[0x263EF8340];
  xpc_object_t xdict = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = MEMORY[0x210512A10](xdict);
    if (v4 != MEMORY[0x263EF8708])
    {
      if (v4 == MEMORY[0x263EF8720])
      {
        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
        uint64_t v42 = "";
        uint64_t v11 = "%s%.30s:%-4d Stop discovery could not deliver message %@, error %@";
        int v12 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 16, (uint64_t)"%s%.30s:%-4d Stop discovery received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)""), nrCopyLogObj_onceToken_1460 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            uint64_t v17 = *(void *)(a1 + 40);
            self;
            id v18 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v44 = *MEMORY[0x263F08320];
            uint64_t v19 = v44;
            v45[0] = @"An XPC connection error occurred";
            uint64_t v20 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
            uint64_t v21 = (void *)[v18 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v20];

            (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v21);
            self;
            id v22 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v44 = v19;
            v45[0] = @"An XPC connection error occurred";
            uint64_t v23 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
            id v14 = (void *)[v22 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v23];

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
      uint64_t v11 = "Stop discovery received unexpected XPC object";
      int v12 = 17;
LABEL_26:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v42);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1460 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_DEBUG)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 2, (uint64_t)"%s%.30s:%-4d Stop discovery received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    uint64_t v13 = xpc_dictionary_get_value(xdict, "Result");
    id v14 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x210512A10](v13) == MEMORY[0x263EF8738])
      {
        int64_t value = xpc_int64_get_value(v14);
        uint64_t v16 = *(void *)(a1 + 40);
        if (!value)
        {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
LABEL_28:

          goto LABEL_29;
        }
        BOOL v26 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v26);

LABEL_45:
        uint64_t v41 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v41);

        goto LABEL_28;
      }
      uint64_t v25 = nrCopyLogObj_1449();
      if (sNRCopyLogToStdErr)
      {

LABEL_42:
        id v29 = nrCopyLogObj_1449();
        id v35 = v29;
        BOOL v36 = "Stop discovery received invalid result type";
        goto LABEL_43;
      }
      id v37 = v25;
      BOOL v38 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (v38) {
        goto LABEL_42;
      }
LABEL_44:
      uint64_t v39 = *(void *)(a1 + 40);
      uint64_t v40 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);

      goto LABEL_45;
    }
    uint64_t v24 = nrCopyLogObj_1449();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v27 = v24;
      BOOL v28 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v28) {
        goto LABEL_44;
      }
    }
    id v29 = nrCopyLogObj_1449();
    id v35 = v29;
    BOOL v36 = "Stop discovery received response without result code";
LABEL_43:
    _NRLogWithArgs((uint64_t)v29, 17, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v42);

    goto LABEL_44;
  }
LABEL_29:
}

- (void)sendAuthMethodRequestForDevice:(uint64_t)a3 authMethod:(void *)a4 pairingManager:(void *)a5 withCompletion:
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v9 = a2;
  uint64_t v10 = a4;
  uint64_t v11 = a5;
  if (a1)
  {
    if (!*(void *)(a1 + 24))
    {
      id v14 = (void *)+[NRDevicePairingManager copyXPCError]();
      v11[2](v11, v14);
      goto LABEL_15;
    }
    if (v10) {
      int v12 = (void *)v10[11];
    }
    else {
      int v12 = 0;
    }
    id v13 = v12;
    id v14 = [v13 uuid];

    uint64_t v15 = [v9 uuid];
    uint64_t v16 = [*(id *)(a1 + 16) objectForKeyedSubscript:v14];
    uint64_t v17 = (id *)v16;
    if (v16)
    {
      id v18 = [*(id *)(v16 + 40) objectForKeyedSubscript:v15];

      if (!v18)
      {
        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_INFO)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 1, (uint64_t)"%s%.30s:%-4d %@ Sending auth method request for %@", v19, v20, v21, v22, v23, (uint64_t)"");
        }
        xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
        if (v24)
        {
          uint64_t v25 = v24;
          *(void *)uuid = 0;
          uint64_t v52 = 0;
          [v14 getUUIDBytes:uuid];
          xpc_dictionary_set_uuid(v25, "PairingManager", uuid);
          *(void *)uint64_t v49 = 0;
          uint64_t v50 = 0;
          [v15 getUUIDBytes:v49];
          xpc_dictionary_set_uuid(v25, "TargetPairingCandidate", v49);
          xpc_dictionary_set_uint64(v25, "AuthRequestType", a3);
          xpc_dictionary_set_uint64(v25, "PairingManagerOperation", 6uLL);
          xpc_connection_send_message(*(xpc_connection_t *)(a1 + 24), v25);
          BOOL v26 = (void *)MEMORY[0x210512410](v11);
          [v17[5] setObject:v26 forKeyedSubscript:v15];

LABEL_14:
LABEL_15:

          goto LABEL_16;
        }
        uint64_t v30 = nrCopyLogObj_1449();
        uint64_t v31 = v30;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v32 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

          if (!v32)
          {
LABEL_26:
            _os_log_pack_size();
            MEMORY[0x270FA5388]();
            __error();
            uint64_t v39 = _os_log_pack_fill();
            __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v39, (uint64_t)"nr_xpc_dictionary_create");
            id v40 = nrCopyLogObj_1449();
            _NRLogAbortWithPack(v40);
          }
        }
        id v33 = nrCopyLogObj_1449();
        _NRLogWithArgs((uint64_t)v33, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v34, v35, v36, v37, v38, (uint64_t)"");

        goto LABEL_26;
      }
      uint64_t v29 = +[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, -3003);
LABEL_30:
      id v48 = (void *)v29;
      v11[2](v11, (void *)v29);

      goto LABEL_14;
    }
    BOOL v27 = nrCopyLogObj_1449();
    BOOL v28 = v27;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v41 = os_log_type_enabled(v27, OS_LOG_TYPE_FAULT);

      if (!v41)
      {
LABEL_29:
        uint64_t v29 = +[NRDevicePairingManager copyXPCError]();
        goto LABEL_30;
      }
    }
    id v42 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v42, 17, (uint64_t)"Pairing manager %@ is not registered", v43, v44, v45, v46, v47, (uint64_t)v14);

    goto LABEL_29;
  }
LABEL_16:
}

- (void)startPairingForPairingManager:(void *)a3 pairingTarget:(void *)a4 withCompletion:
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (!a1[3])
    {
      uint64_t v34 = (void *)+[NRDevicePairingManager copyXPCError]();
      v9[2](v9, v34);

      goto LABEL_25;
    }
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      uint64_t v11 = v10;
      *(void *)uuid = 0;
      uint64_t v53 = 0;
      if (v7) {
        int v12 = (void *)v7[11];
      }
      else {
        int v12 = 0;
      }
      id v13 = v12;
      id v14 = [v13 uuid];
      [v14 getUUIDBytes:uuid];

      xpc_dictionary_set_uuid(v11, "PairingManager", uuid);
      xpc_dictionary_set_uint64(v11, "PairingManagerOperation", 0xAuLL);
      if (v8)
      {
        id v51 = 0;
        uint64_t v15 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v51];
        id v16 = v51;
        if (v16)
        {
          uint64_t v22 = v16;
          if (nrCopyLogObj_onceToken_1460 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
          }
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT)) {
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 17, (uint64_t)"Failed to archive pairing target %@", v17, v18, v19, v20, v21, (uint64_t)v22);
          }
          v9[2](v9, v22);

          goto LABEL_24;
        }
        xpc_dictionary_set_data(v11, "PairingTarget", (const void *)[v15 bytes], objc_msgSend(v15, "length"));
      }
      objc_initWeak(&location, a1);
      uint64_t v23 = (_xpc_connection_s *)a1[3];
      xpc_object_t v24 = a1[4];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __88__NRDevicePairingManagerMux_startPairingForPairingManager_pairingTarget_withCompletion___block_invoke;
      handler[3] = &unk_263FD14F0;
      objc_copyWeak(&v49, &location);
      id v48 = v9;
      id v47 = v11;
      xpc_connection_send_message_with_reply(v23, v47, v24, handler);

      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      uint64_t v25 = (id)nrCopyLogObj_sNRLogObj_1462;
      BOOL v26 = v25;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v27 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);

        if (!v27)
        {
LABEL_23:

          objc_destroyWeak(&v49);
          objc_destroyWeak(&location);
LABEL_24:

          goto LABEL_25;
        }
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      id v28 = (id)nrCopyLogObj_sNRLogObj_1462;
      _NRLogWithArgs((uint64_t)v28, 1, (uint64_t)"%s%.30s:%-4d Sent pairing start message: %@", v29, v30, v31, v32, v33, (uint64_t)"");

      goto LABEL_23;
    }
    uint64_t v35 = nrCopyLogObj_1449();
    uint64_t v36 = v35;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v37 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);

      if (!v37)
      {
LABEL_32:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v44 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v44, (uint64_t)"nr_xpc_dictionary_create");
        id v45 = nrCopyLogObj_1449();
        _NRLogAbortWithPack(v45);
      }
    }
    id v38 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v38, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v39, v40, v41, v42, v43, (uint64_t)"");

    goto LABEL_32;
  }
LABEL_25:
}

void __88__NRDevicePairingManagerMux_startPairingForPairingManager_pairingTarget_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v45[1] = *MEMORY[0x263EF8340];
  xpc_object_t xdict = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = MEMORY[0x210512A10](xdict);
    if (v4 != MEMORY[0x263EF8708])
    {
      if (v4 == MEMORY[0x263EF8720])
      {
        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
        uint64_t v42 = "";
        uint64_t v11 = "%s%.30s:%-4d Start pairing could not deliver message %@, error %@";
        int v12 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 16, (uint64_t)"%s%.30s:%-4d Start pairing received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)""), nrCopyLogObj_onceToken_1460 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            uint64_t v17 = *(void *)(a1 + 40);
            self;
            id v18 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v44 = *MEMORY[0x263F08320];
            uint64_t v19 = v44;
            v45[0] = @"An XPC connection error occurred";
            uint64_t v20 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
            uint64_t v21 = (void *)[v18 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v20];

            (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v21);
            self;
            id v22 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v44 = v19;
            v45[0] = @"An XPC connection error occurred";
            uint64_t v23 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
            id v14 = (void *)[v22 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v23];

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
      uint64_t v11 = "Start pairing received unexpected XPC object";
      int v12 = 17;
LABEL_26:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v42);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1460 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_DEBUG)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 2, (uint64_t)"%s%.30s:%-4d Start pairing received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    uint64_t v13 = xpc_dictionary_get_value(xdict, "Result");
    id v14 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x210512A10](v13) == MEMORY[0x263EF8738])
      {
        int64_t value = xpc_int64_get_value(v14);
        uint64_t v16 = *(void *)(a1 + 40);
        if (!value)
        {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
LABEL_28:

          goto LABEL_29;
        }
        BOOL v26 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v26);

LABEL_45:
        uint64_t v41 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v41);

        goto LABEL_28;
      }
      uint64_t v25 = nrCopyLogObj_1449();
      if (sNRCopyLogToStdErr)
      {

LABEL_42:
        id v29 = nrCopyLogObj_1449();
        uint64_t v35 = v29;
        uint64_t v36 = "Start pairing received invalid result type";
        goto LABEL_43;
      }
      BOOL v37 = v25;
      BOOL v38 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (v38) {
        goto LABEL_42;
      }
LABEL_44:
      uint64_t v39 = *(void *)(a1 + 40);
      uint64_t v40 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);

      goto LABEL_45;
    }
    xpc_object_t v24 = nrCopyLogObj_1449();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v27 = v24;
      BOOL v28 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v28) {
        goto LABEL_44;
      }
    }
    id v29 = nrCopyLogObj_1449();
    uint64_t v35 = v29;
    uint64_t v36 = "Start pairing received response without result code";
LABEL_43:
    _NRLogWithArgs((uint64_t)v29, 17, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v42);

    goto LABEL_44;
  }
LABEL_29:
}

- (void)stopPairingForPairingManager:(void *)a3 withCompletion:
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v6 = a3;
  if (a1)
  {
    if (!a1[3])
    {
      xpc_object_t v24 = (void *)+[NRDevicePairingManager copyXPCError]();
      v6[2](v6, v24);

      goto LABEL_15;
    }
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      uint64_t v8 = v7;
      *(void *)uuid = 0;
      uint64_t v42 = 0;
      if (v5) {
        uint64_t v9 = (void *)v5[11];
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = v9;
      uint64_t v11 = [v10 uuid];
      [v11 getUUIDBytes:uuid];

      xpc_dictionary_set_uuid(v8, "PairingManager", uuid);
      xpc_dictionary_set_uint64(v8, "PairingManagerOperation", 0xBuLL);
      objc_initWeak(&location, a1);
      int v12 = (_xpc_connection_s *)a1[3];
      uint64_t v13 = a1[4];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __73__NRDevicePairingManagerMux_stopPairingForPairingManager_withCompletion___block_invoke;
      handler[3] = &unk_263FD14F0;
      objc_copyWeak(&v39, &location);
      BOOL v38 = v6;
      id v14 = v8;
      id v37 = v14;
      xpc_connection_send_message_with_reply(v12, v14, v13, handler);

      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      uint64_t v15 = (id)nrCopyLogObj_sNRLogObj_1462;
      uint64_t v16 = v15;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v17 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

        if (!v17)
        {
LABEL_14:

          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);

          goto LABEL_15;
        }
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      id v18 = (id)nrCopyLogObj_sNRLogObj_1462;
      _NRLogWithArgs((uint64_t)v18, 1, (uint64_t)"%s%.30s:%-4d Sent pairing stop message: %@", v19, v20, v21, v22, v23, (uint64_t)"");

      goto LABEL_14;
    }
    uint64_t v25 = nrCopyLogObj_1449();
    BOOL v26 = v25;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v27 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (!v27)
      {
LABEL_22:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v34 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v34, (uint64_t)"nr_xpc_dictionary_create");
        id v35 = nrCopyLogObj_1449();
        _NRLogAbortWithPack(v35);
      }
    }
    id v28 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v28, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v29, v30, v31, v32, v33, (uint64_t)"");

    goto LABEL_22;
  }
LABEL_15:
}

void __73__NRDevicePairingManagerMux_stopPairingForPairingManager_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v45[1] = *MEMORY[0x263EF8340];
  xpc_object_t xdict = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = MEMORY[0x210512A10](xdict);
    if (v4 != MEMORY[0x263EF8708])
    {
      if (v4 == MEMORY[0x263EF8720])
      {
        if (nrCopyLogObj_onceToken_1460 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        }
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
        uint64_t v42 = "";
        uint64_t v11 = "%s%.30s:%-4d Stop pairing could not deliver message %@, error %@";
        int v12 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1460 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
      }
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 16, (uint64_t)"%s%.30s:%-4d Stop pairing received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)""), nrCopyLogObj_onceToken_1460 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            uint64_t v17 = *(void *)(a1 + 40);
            self;
            id v18 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v44 = *MEMORY[0x263F08320];
            uint64_t v19 = v44;
            v45[0] = @"An XPC connection error occurred";
            uint64_t v20 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
            uint64_t v21 = (void *)[v18 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v20];

            (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v21);
            self;
            id v22 = objc_alloc(MEMORY[0x263F087E8]);
            uint64_t v44 = v19;
            v45[0] = @"An XPC connection error occurred";
            uint64_t v23 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
            id v14 = (void *)[v22 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v23];

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      uint64_t v10 = nrCopyLogObj_sNRLogObj_1462;
      uint64_t v11 = "Stop pairing received unexpected XPC object";
      int v12 = 17;
LABEL_26:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v42);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1460 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_DEBUG)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 2, (uint64_t)"%s%.30s:%-4d Stop pairing received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    uint64_t v13 = xpc_dictionary_get_value(xdict, "Result");
    id v14 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x210512A10](v13) == MEMORY[0x263EF8738])
      {
        int64_t value = xpc_int64_get_value(v14);
        uint64_t v16 = *(void *)(a1 + 40);
        if (!value)
        {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
LABEL_28:

          goto LABEL_29;
        }
        BOOL v26 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v26);

LABEL_45:
        uint64_t v41 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v41);

        goto LABEL_28;
      }
      uint64_t v25 = nrCopyLogObj_1449();
      if (sNRCopyLogToStdErr)
      {

LABEL_42:
        id v29 = nrCopyLogObj_1449();
        id v35 = v29;
        uint64_t v36 = "Stop pairing received invalid result type";
        goto LABEL_43;
      }
      id v37 = v25;
      BOOL v38 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (v38) {
        goto LABEL_42;
      }
LABEL_44:
      uint64_t v39 = *(void *)(a1 + 40);
      uint64_t v40 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);

      goto LABEL_45;
    }
    xpc_object_t v24 = nrCopyLogObj_1449();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v27 = v24;
      BOOL v28 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v28) {
        goto LABEL_44;
      }
    }
    id v29 = nrCopyLogObj_1449();
    id v35 = v29;
    uint64_t v36 = "Stop pairing received response without result code";
LABEL_43:
    _NRLogWithArgs((uint64_t)v29, 17, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v42);

    goto LABEL_44;
  }
LABEL_29:
}

- (void)unpairDevice:(void *)a3 withCompletion:
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void (**)(void, void))v6;
  if (a1)
  {
    if (!v6)
    {
      BOOL v27 = nrCopyLogObj_1449();
      BOOL v28 = v27;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v40 = os_log_type_enabled(v27, OS_LOG_TYPE_FAULT);

        if (!v40) {
          goto LABEL_11;
        }
      }
      id v14 = nrCopyLogObj_1449();
      _NRLogWithArgs((uint64_t)v14, 17, (uint64_t)"%s called with null completionBlock", v41, v42, v43, v44, v45, (uint64_t)"-[NRDevicePairingManagerMux unpairDevice:withCompletion:]");
      goto LABEL_10;
    }
    if (!*(void *)(a1 + 24))
    {
      id v14 = (id)+[NRDevicePairingManager copyXPCError]();
      ((void (**)(void, id))v7)[2](v7, v14);
      goto LABEL_10;
    }
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      uint64_t v9 = v8;
      *(void *)uuid = 0;
      uint64_t v54 = 0;
      xpc_dictionary_set_uuid(v8, "PairingManager", uuid);
      xpc_dictionary_set_uint64(v9, "PairingManagerOperation", 0xDuLL);
      *(void *)id v51 = 0;
      uint64_t v52 = 0;
      uint64_t v10 = [v5 nrDeviceIdentifier];
      [v10 getUUIDBytes:v51];

      xpc_dictionary_set_uuid(v9, "DeviceIdentifier", v51);
      int v12 = *(void **)(a1 + 24);
      uint64_t v11 = *(NSObject **)(a1 + 32);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __57__NRDevicePairingManagerMux_unpairDevice_withCompletion___block_invoke;
      handler[3] = &unk_263FD1540;
      id v13 = v5;
      id v47 = v13;
      uint64_t v50 = v7;
      uint64_t v48 = a1;
      id v14 = v9;
      id v49 = v14;
      uint64_t v15 = v12;
      xpc_connection_send_message_with_reply(v15, v14, v11, handler);

      uint64_t v16 = [v13 nrDeviceIdentifier];
      os_log_t v17 = _NRCopyLogObjectForNRUUID(v16);
      os_log_t v18 = v17;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

        if (!v19)
        {
LABEL_9:

LABEL_10:
          goto LABEL_11;
        }
      }
      uint64_t v20 = [v13 nrDeviceIdentifier];
      os_log_t v21 = _NRCopyLogObjectForNRUUID(v20);
      _NRLogWithArgs((uint64_t)v21, 1, (uint64_t)"%s%.30s:%-4d Sent unpair message: %@", v22, v23, v24, v25, v26, (uint64_t)"");

      goto LABEL_9;
    }
    id v29 = nrCopyLogObj_1449();
    uint64_t v30 = v29;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v31 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

      if (!v31)
      {
LABEL_20:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v38 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v38, (uint64_t)"nr_xpc_dictionary_create");
        id v39 = nrCopyLogObj_1449();
        _NRLogAbortWithPack(v39);
      }
    }
    id v32 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v32, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v33, v34, v35, v36, v37, (uint64_t)"");

    goto LABEL_20;
  }
LABEL_11:
}

void __57__NRDevicePairingManagerMux_unpairDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v73[1] = *MEMORY[0x263EF8340];
  xpc_object_t xdict = a2;
  uint64_t v3 = MEMORY[0x210512A10]();
  if (v3 != MEMORY[0x263EF8708])
  {
    uint64_t v4 = v3;
    id v5 = [*(id *)(a1 + 32) nrDeviceIdentifier];
    os_log_t v6 = _NRCopyLogObjectForNRUUID(v5);
    os_log_t v7 = v6;
    if (sNRCopyLogToStdErr)
    {
      uint64_t v8 = MEMORY[0x263EF8720];

      if (v4 == v8) {
        goto LABEL_17;
      }
LABEL_9:
      id v14 = [*(id *)(a1 + 32) nrDeviceIdentifier];
      os_log_t v15 = _NRCopyLogObjectForNRUUID(v14);
      _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d unpair received unexpected XPC object: %@", v16, v17, v18, v19, v20, (uint64_t)"");
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v12 = MEMORY[0x263EF8720];
    BOOL v13 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v4 == v12)
    {
      if (v13)
      {
LABEL_17:
        id v14 = [*(id *)(a1 + 32) nrDeviceIdentifier];
        os_log_t v15 = _NRCopyLogObjectForNRUUID(v14);
        _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d unpair could not deliver message %@, error %@", v33, v34, v35, v36, v37, (uint64_t)"");
        goto LABEL_18;
      }
    }
    else if (v13)
    {
      goto LABEL_9;
    }
LABEL_19:
    uint64_t v38 = *(void *)(a1 + 56);
    self;
    id v39 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v72 = *MEMORY[0x263F08320];
    uint64_t v40 = v72;
    v73[0] = @"An XPC connection error occurred";
    uint64_t v41 = [NSDictionary dictionaryWithObjects:v73 forKeys:&v72 count:1];
    uint64_t v42 = (void *)[v39 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v41];

    (*(void (**)(uint64_t, void *))(v38 + 16))(v38, v42);
    uint64_t v43 = *(void *)(a1 + 40);
    self;
    id v44 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v72 = v40;
    v73[0] = @"An XPC connection error occurred";
    uint64_t v45 = [NSDictionary dictionaryWithObjects:v73 forKeys:&v72 count:1];
    uint64_t v30 = (void *)[v44 initWithDomain:@"NRDevicePairingErrorDomain" code:-2019 userInfo:v45];

    -[NRDevicePairingManagerMux invalidateManagersWithError:](v43, v30);
    goto LABEL_20;
  }
  uint64_t v9 = [*(id *)(a1 + 32) nrDeviceIdentifier];
  os_log_t v10 = _NRCopyLogObjectForNRUUID(v9);
  os_log_t v11 = v10;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v21 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (!v21) {
      goto LABEL_12;
    }
  }
  uint64_t v22 = [*(id *)(a1 + 32) nrDeviceIdentifier];
  os_log_t v23 = _NRCopyLogObjectForNRUUID(v22);
  _NRLogWithArgs((uint64_t)v23, 2, (uint64_t)"%s%.30s:%-4d unpair received XPC dict: %@", v24, v25, v26, v27, v28, (uint64_t)"");

LABEL_12:
  uint64_t v29 = xpc_dictionary_get_value(xdict, "Result");
  uint64_t v30 = (void *)v29;
  if (!v29)
  {
    uint64_t v46 = [*(id *)(a1 + 32) nrDeviceIdentifier];
    os_log_t v47 = _NRCopyLogObjectForNRUUID(v46);
    os_log_t v48 = v47;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v55 = os_log_type_enabled(v47, OS_LOG_TYPE_FAULT);

      if (!v55) {
        goto LABEL_33;
      }
    }
    id v56 = [*(id *)(a1 + 32) nrDeviceIdentifier];
    os_log_t v57 = _NRCopyLogObjectForNRUUID(v56);
    os_log_t v63 = v57;
    v64 = "unpair received response without result code";
LABEL_32:
    _NRLogWithArgs((uint64_t)v57, 17, (uint64_t)v64, v58, v59, v60, v61, v62, v70);

    goto LABEL_33;
  }
  if (MEMORY[0x210512A10](v29) != MEMORY[0x263EF8738])
  {
    id v49 = [*(id *)(a1 + 32) nrDeviceIdentifier];
    os_log_t v50 = _NRCopyLogObjectForNRUUID(v49);
    os_log_t v51 = v50;
    if (sNRCopyLogToStdErr)
    {

LABEL_31:
      id v56 = [*(id *)(a1 + 32) nrDeviceIdentifier];
      os_log_t v57 = _NRCopyLogObjectForNRUUID(v56);
      os_log_t v63 = v57;
      v64 = "unpair received invalid result type";
      goto LABEL_32;
    }
    BOOL v65 = os_log_type_enabled(v50, OS_LOG_TYPE_FAULT);

    if (v65) {
      goto LABEL_31;
    }
LABEL_33:
    uint64_t v66 = *(void *)(a1 + 56);
    uint64_t v67 = (void *)+[NRDevicePairingManager copyXPCError]();
    (*(void (**)(uint64_t, void *))(v66 + 16))(v66, v67);

    uint64_t v68 = *(void *)(a1 + 40);
    uint64_t v69 = (void *)+[NRDevicePairingManager copyXPCError]();
    -[NRDevicePairingManagerMux invalidateManagersWithError:](v68, v69);

    goto LABEL_20;
  }
  int64_t value = xpc_int64_get_value(v30);
  uint64_t v32 = *(void *)(a1 + 56);
  if (value)
  {
    uint64_t v52 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
    (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v52);

    uint64_t v53 = *(void *)(a1 + 40);
    uint64_t v54 = (void *)+[NRDevicePairingManager copyXPCError]();
    -[NRDevicePairingManagerMux invalidateManagersWithError:](v53, v54);
  }
  else
  {
    (*(void (**)(void))(v32 + 16))(*(void *)(a1 + 56));
  }
LABEL_20:
}

@end