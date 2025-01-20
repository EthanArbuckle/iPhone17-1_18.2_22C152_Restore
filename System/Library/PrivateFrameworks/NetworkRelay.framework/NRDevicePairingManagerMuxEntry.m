@interface NRDevicePairingManagerMuxEntry
- (void)handleStartPairingRequestUpdate:(uint64_t)a1;
- (void)initWithPairingManager:(void *)a1;
@end

@implementation NRDevicePairingManagerMuxEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAuthRequestCompletionBlocks, 0);
  objc_storeStrong(&self->_pendingPairingResultCompletionBlock, 0);
  objc_storeStrong(&self->_pendingRegistrationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_activePairingCandidates, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
}

- (void)initWithPairingManager:(void *)a1
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)NRDevicePairingManagerMuxEntry;
    id v5 = objc_msgSendSuper2(&v22, sel_init);
    if (v5)
    {
      a1 = v5;
      objc_storeStrong((id *)v5 + 1, a2);
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v7 = (void *)a1[2];
      a1[2] = v6;

      id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v9 = (void *)a1[5];
      a1[5] = v8;

      goto LABEL_4;
    }
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
        *(void *)(v20 + 4) = "-[NRDevicePairingManagerMuxEntry initWithPairingManager:]";
        id v21 = nrCopyLogObj_1449();
        _NRLogAbortWithPack(v21);
      }
    }
    id v14 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v14, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v15, v16, v17, v18, v19, (uint64_t)"");

    goto LABEL_10;
  }
LABEL_4:

  return a1;
}

- (void)handleStartPairingRequestUpdate:(uint64_t)a1
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = xpc_dictionary_get_value(v3, "Result");
  id v5 = (void *)v4;
  if (!v4)
  {
    v50 = nrCopyLogObj_1449();
    v51 = v50;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v57 = os_log_type_enabled(v50, OS_LOG_TYPE_FAULT);

      if (!v57) {
        goto LABEL_55;
      }
    }
    id v58 = nrCopyLogObj_1449();
    v64 = v58;
    v65 = "Start Pairing request received response without result code";
LABEL_54:
    _NRLogWithArgs((uint64_t)v58, 17, (uint64_t)v65, v59, v60, v61, v62, v63, v116);

    goto LABEL_55;
  }
  if (MEMORY[0x210512A10](v4) != MEMORY[0x263EF8738])
  {
    v52 = nrCopyLogObj_1449();
    v53 = v52;
    if (sNRCopyLogToStdErr)
    {

LABEL_53:
      id v58 = nrCopyLogObj_1449();
      v64 = v58;
      v65 = "Start Pairing received invalid result type";
      goto LABEL_54;
    }
    BOOL v66 = os_log_type_enabled(v52, OS_LOG_TYPE_FAULT);

    if (v66) {
      goto LABEL_53;
    }
LABEL_55:
    id v67 = *(id *)(a1 + 8);
    v56 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, -3002);
    -[NRDevicePairingManager pairingFailedWithError:](v67, v56);

    goto LABEL_56;
  }
  int64_t value = xpc_int64_get_value(v5);
  if (value)
  {
    uint64_t v54 = value;
    id v55 = *(id *)(a1 + 8);
    v56 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, v54);
    -[NRDevicePairingManager pairingFailedWithError:](v55, v56);

LABEL_56:
    goto LABEL_44;
  }
  uint64_t v7 = xpc_dictionary_get_value(v3, "PairingTarget");
  id v8 = (void *)v7;
  if (!v7 || MEMORY[0x210512A10](v7) != MEMORY[0x263EF86F8])
  {
    v9 = 0;
    goto LABEL_7;
  }
  id v30 = objc_alloc(MEMORY[0x263EFF8F8]);
  bytes_ptr = xpc_data_get_bytes_ptr(v8);
  uint64_t v32 = [v30 initWithBytes:bytes_ptr length:xpc_data_get_length(v8)];
  if (!v32)
  {
    v74 = nrCopyLogObj_1449();
    v75 = v74;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v74, OS_LOG_TYPE_ERROR);

      if (!v76) {
        goto LABEL_78;
      }
    }
    id v95 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v95, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (data) != ((void *)0)", v96, v97, v98, v99, v100, (uint64_t)"");

LABEL_78:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v101 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v101 = 136446210;
    *(void *)(v101 + 4) = "-[NRDevicePairingManagerMuxEntry handleStartPairingRequestUpdate:]";
    goto LABEL_84;
  }
  uint64_t v18 = (void *)v32;
  id v118 = 0;
  v9 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v32 error:&v118];
  uint64_t v17 = (id *)v118;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || v17)
  {
    if (nrCopyLogObj_onceToken_1460 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 17, (uint64_t)"Failed to unarchive NRDevicePairingTarget %@", v33, v34, v35, v36, v37, (uint64_t)v17);
    }
    -[NRDevicePairingManager pairingFailedWithError:](*(void **)(a1 + 8), v17);
    goto LABEL_43;
  }

LABEL_7:
  uuid = xpc_dictionary_get_uuid(v3, "TargetPairingCandidate");
  if (!uuid || (uint64_t v16 = uuid, uuid_is_null(uuid)))
  {
    if (nrCopyLogObj_onceToken_1460 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 17, (uint64_t)"Start Pairing request result missing pairing target UUID", v11, v12, v13, v14, v15, v116);
    }
    uint64_t v17 = (id *)*(id *)(a1 + 8);
    self;
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"NRDevicePairingErrorDomain" code:-3002 userInfo:0];
    -[NRDevicePairingManager pairingFailedWithError:](v17, v18);
    goto LABEL_43;
  }
  uint64_t v19 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v16];
  if (!v19)
  {
    v68 = nrCopyLogObj_1449();
    v69 = v68;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v70 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);

      if (!v70) {
        goto LABEL_83;
      }
    }
    id v77 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v77, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (targetUUID) != ((void *)0)", v78, v79, v80, v81, v82, (uint64_t)"");

LABEL_83:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v114 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v114 = 136446210;
    *(void *)(v114 + 4) = "-[NRDevicePairingManagerMuxEntry handleStartPairingRequestUpdate:]";
LABEL_84:
    id v115 = nrCopyLogObj_1449();
    _NRLogAbortWithPack(v115);
  }
  uint64_t v18 = (void *)v19;
  uint64_t v20 = (id *)-[NRPairedDevice initInternal]([NRPairedDevice alloc]);
  if (!v20)
  {
    v71 = nrCopyLogObj_1449();
    v72 = v71;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v73 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);

      if (!v73) {
        goto LABEL_83;
      }
    }
    id v83 = nrCopyLogObj_1449();
    _NRLogWithArgs((uint64_t)v83, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (pairedDevice) != ((void *)0)", v84, v85, v86, v87, v88, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v17 = v20;
  objc_storeStrong(v20 + 1, v9);
  id v21 = xpc_dictionary_get_uuid(v3, "NRUUID");
  if (v21)
  {
    v27 = v21;
    if (!uuid_is_null(v21))
    {
      uint64_t v38 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v27];
      if (v38)
      {
        v29 = (void *)v38;
        v39 = [[NRDeviceIdentifier alloc] initWithUUID:v38];
        objc_setProperty_nonatomic_copy(v17, v40, v39, 16);

        v41 = [v17 nrDeviceIdentifier];

        if (v41)
        {
          v42 = *(void **)(a1 + 8);
          v43 = v17;
          if (v42)
          {
            v44 = v42;
            objc_sync_enter(v44);
            uint64_t v45 = v44[1];
            objc_sync_exit(v44);

            if (v45 == 8)
            {
              id v47 = objc_getProperty(v44, v46, 80, 1);
              objc_setProperty_atomic_copy(v44, v48, 0, 80);
              -[NRDevicePairingManager setInternalManagerState:](v44, 3);
              v117 = v44[7];
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __59__NRDevicePairingManager_pairingSucceededWithPairedDevice___block_invoke;
              block[3] = &unk_263FD1478;
              block[4] = v44;
              id v121 = v47;
              v120 = v43;
              id v49 = v47;
              dispatch_async(v117, block);
            }
          }

          goto LABEL_42;
        }
        v92 = nrCopyLogObj_1449();
        v93 = v92;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v94 = os_log_type_enabled(v92, OS_LOG_TYPE_ERROR);

          if (!v94) {
            goto LABEL_83;
          }
        }
        id v108 = nrCopyLogObj_1449();
        _NRLogWithArgs((uint64_t)v108, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (pairedDevice.nrDeviceIdentifier) != ((void *)0)", v109, v110, v111, v112, v113, (uint64_t)"");
      }
      else
      {
        v89 = nrCopyLogObj_1449();
        v90 = v89;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v91 = os_log_type_enabled(v89, OS_LOG_TYPE_ERROR);

          if (!v91) {
            goto LABEL_83;
          }
        }
        id v102 = nrCopyLogObj_1449();
        _NRLogWithArgs((uint64_t)v102, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (nrUUID) != ((void *)0)", v103, v104, v105, v106, v107, (uint64_t)"");
      }
      goto LABEL_83;
    }
  }
  if (nrCopyLogObj_onceToken_1460 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1462, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1462, 17, (uint64_t)"Missing or All-zero NRUUID from %@", v22, v23, v24, v25, v26, (uint64_t)v3);
  }
  id v28 = *(id *)(a1 + 8);
  self;
  v29 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"NRDevicePairingErrorDomain" code:-2008 userInfo:0];
  -[NRDevicePairingManager pairingFailedWithError:](v28, v29);

LABEL_42:
LABEL_43:

LABEL_44:
}

@end