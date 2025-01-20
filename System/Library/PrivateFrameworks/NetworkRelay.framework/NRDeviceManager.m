@interface NRDeviceManager
+ (id)copySharedDeviceManager;
- (id)copyIDSDeviceID;
- (id)initInternal;
- (void)disableDevice:(id)a3;
- (void)disableDevice:(id)a3 queue:(id)a4 completionBlock:(id)a5;
- (void)enableDevice:(id)a3;
- (void)enableDevice:(id)a3 queue:(id)a4 completionBlock:(id)a5;
- (void)registerDevice:(id)a3 properties:(id)a4 operationalproperties:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (void)registerDevice:(id)a3 properties:(id)a4 queue:(id)a5 completionBlock:(id)a6;
- (void)unregisterAllDevicesWithQueue:(id)a3 completionBlock:(id)a4;
- (void)unregisterDevice:(id)a3;
- (void)unregisterDevice:(id)a3 queue:(id)a4 completionBlock:(id)a5;
@end

@implementation NRDeviceManager

- (void).cxx_destruct
{
}

- (void)disableDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v7 = nrCopyLogObj_1612();
    v8 = v7;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (!v9)
      {
LABEL_10:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v16 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v16 = 136446466;
        *(void *)(v16 + 4) = "-[NRDeviceManager disableDevice:]";
        *(_WORD *)(v16 + 12) = 2080;
        *(void *)(v16 + 14) = "-[NRDeviceManager disableDevice:]";
        id v17 = nrCopyLogObj_1612();
        _NRLogAbortWithPack(v17);
      }
    }
    id v10 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v10, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v11, v12, v13, v14, v15, (uint64_t)"");

    goto LABEL_10;
  }
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __33__NRDeviceManager_disableDevice___block_invoke;
  v18[3] = &unk_263FD1598;
  id v19 = v4;
  id v6 = v4;
  [(NRDeviceManager *)self disableDevice:v6 queue:queue completionBlock:v18];
}

uint64_t __33__NRDeviceManager_disableDevice___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (v10)
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr
      || (BOOL v7 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_ERROR), v8 = v10, v7))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 16, (uint64_t)"%s%.30s:%-4d Failed to disable device %@: %@", v2, v3, v4, v5, v6, (uint64_t)"");
LABEL_12:
      id v8 = v10;
    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr
      || (BOOL v7 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT), v8 = 0, v7))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Disabled device %@", v2, v3, v4, v5, v6, (uint64_t)"");
      goto LABEL_12;
    }
  }
  return MEMORY[0x270F9A758](v7, v8);
}

- (void)enableDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    BOOL v7 = nrCopyLogObj_1612();
    id v8 = v7;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (!v9)
      {
LABEL_10:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v16 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v16 = 136446466;
        *(void *)(v16 + 4) = "-[NRDeviceManager enableDevice:]";
        *(_WORD *)(v16 + 12) = 2080;
        *(void *)(v16 + 14) = "-[NRDeviceManager enableDevice:]";
        id v17 = nrCopyLogObj_1612();
        _NRLogAbortWithPack(v17);
      }
    }
    id v10 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v10, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v11, v12, v13, v14, v15, (uint64_t)"");

    goto LABEL_10;
  }
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __32__NRDeviceManager_enableDevice___block_invoke;
  v18[3] = &unk_263FD1598;
  id v19 = v4;
  id v6 = v4;
  [(NRDeviceManager *)self enableDevice:v6 queue:queue completionBlock:v18];
}

uint64_t __32__NRDeviceManager_enableDevice___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (v10)
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr
      || (BOOL v7 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_ERROR), v8 = v10, v7))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 16, (uint64_t)"%s%.30s:%-4d Failed to enable device %@: %@", v2, v3, v4, v5, v6, (uint64_t)"");
LABEL_12:
      id v8 = v10;
    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr
      || (BOOL v7 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT), v8 = 0, v7))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Enabled device %@", v2, v3, v4, v5, v6, (uint64_t)"");
      goto LABEL_12;
    }
  }
  return MEMORY[0x270F9A758](v7, v8);
}

- (void)unregisterDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    BOOL v7 = nrCopyLogObj_1612();
    id v8 = v7;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (!v9)
      {
LABEL_10:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v16 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v16 = 136446466;
        *(void *)(v16 + 4) = "-[NRDeviceManager unregisterDevice:]";
        *(_WORD *)(v16 + 12) = 2080;
        *(void *)(v16 + 14) = "-[NRDeviceManager unregisterDevice:]";
        id v17 = nrCopyLogObj_1612();
        _NRLogAbortWithPack(v17);
      }
    }
    id v10 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v10, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v11, v12, v13, v14, v15, (uint64_t)"");

    goto LABEL_10;
  }
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __36__NRDeviceManager_unregisterDevice___block_invoke;
  v18[3] = &unk_263FD1598;
  id v19 = v4;
  id v6 = v4;
  [(NRDeviceManager *)self unregisterDevice:v6 queue:queue completionBlock:v18];
}

uint64_t __36__NRDeviceManager_unregisterDevice___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (v10)
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr
      || (BOOL v7 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_ERROR), v8 = v10, v7))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 16, (uint64_t)"%s%.30s:%-4d Failed to unregister device %@: %@", v2, v3, v4, v5, v6, (uint64_t)"");
LABEL_12:
      id v8 = v10;
    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr
      || (BOOL v7 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT), v8 = 0, v7))
    {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Unregistered device %@", v2, v3, v4, v5, v6, (uint64_t)"");
      goto LABEL_12;
    }
  }
  return MEMORY[0x270F9A758](v7, v8);
}

- (void)registerDevice:(id)a3 properties:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[NRDeviceOperationalProperties copyPropertiesForDefaultPairedPhone];
  [(NRDeviceManager *)self registerDevice:v13 properties:v12 operationalproperties:v14 queue:v11 completionBlock:v10];
}

- (void)registerDevice:(id)a3 properties:(id)a4 operationalproperties:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  v180[1] = *(id *)MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v11)
  {
    v57 = nrCopyLogObj_1612();
    v58 = v57;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v59 = os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);

      if (!v59) {
        goto LABEL_59;
      }
    }
    id v72 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v72, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v73, v74, v75, v76, v77, (uint64_t)"");

LABEL_59:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v102 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v102 = 136446466;
    *(void *)(v102 + 4) = "-[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]";
    *(_WORD *)(v102 + 12) = 2080;
    *(void *)(v102 + 14) = "-[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]";
    goto LABEL_60;
  }
  if (!v12)
  {
    v60 = nrCopyLogObj_1612();
    v61 = v60;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v62 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);

      if (!v62) {
        goto LABEL_59;
      }
    }
    id v78 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v78, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL properties", v79, v80, v81, v82, v83, (uint64_t)"");

    goto LABEL_59;
  }
  if (!v13)
  {
    v63 = nrCopyLogObj_1612();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65) {
        goto LABEL_59;
      }
    }
    id v84 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v84, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL operationalproperties", v85, v86, v87, v88, v89, (uint64_t)"");

    goto LABEL_59;
  }
  if (!v14)
  {
    v66 = nrCopyLogObj_1612();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v68 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);

      if (!v68) {
        goto LABEL_59;
      }
    }
    id v90 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v90, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL queue", v91, v92, v93, v94, v95, (uint64_t)"");

    goto LABEL_59;
  }
  id v16 = v15;
  if (!v15)
  {
    v69 = nrCopyLogObj_1612();
    v70 = v69;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v71 = os_log_type_enabled(v69, OS_LOG_TYPE_ERROR);

      if (!v71) {
        goto LABEL_59;
      }
    }
    id v96 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v96, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL completionBlock", v97, v98, v99, v100, v101, (uint64_t)"");

    goto LABEL_59;
  }
  id v17 = (void *)[v11 copy];
  v23 = (void *)[v12 copy];
  if (nrCopyLogObj_onceToken_1616 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Registering device %@ with properties %@", v18, v19, v20, v21, v22, (uint64_t)"");
  }
  if (([v23 wasInitiallySetupUsingIDSPairing] & 1) == 0)
  {
    v24 = [v23 outOfBandKey];

    if (!v24)
    {
      v129 = nrCopyLogObj_1612();
      v130 = v129;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v131 = os_log_type_enabled(v129, OS_LOG_TYPE_ERROR);

        if (!v131) {
          goto LABEL_59;
        }
      }
      id v152 = nrCopyLogObj_1612();
      _NRLogWithArgs((uint64_t)v152, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with Device pairing properties must either have wasInitiallySetupUsingIDSPairing or outOfBandKey", v153, v154, v155, v156, v157, (uint64_t)"");

      goto LABEL_59;
    }
  }
  v173 = v16;
  v175 = v14;
  if ([v23 pairingProtocolVersion] < 0)
  {
    v123 = nrCopyLogObj_1612();
    v124 = v123;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v125 = os_log_type_enabled(v123, OS_LOG_TYPE_ERROR);

      if (!v125) {
        goto LABEL_83;
      }
    }
    id v132 = nrCopyLogObj_1612();
    [v23 pairingProtocolVersion];
    _NRLogWithArgs((uint64_t)v132, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with Device pairing protocol version %llu is too large", v133, v134, v135, v136, v137, (uint64_t)"");

LABEL_83:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v138 = _os_log_pack_fill();
    __os_log_helper_1_2_3_8_34_8_32_8_0(v138, [v23 pairingProtocolVersion]);
    goto LABEL_90;
  }
  [v23 peerNetworkRelayVersion];
  uint64_t v25 = [v23 outOfBandKey];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [v23 outOfBandKey];
    uint64_t v28 = [v27 length];

    if (!v28)
    {
      if (nrCopyLogObj_onceToken_1616 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 16, (uint64_t)"%s%.30s:%-4d Received empty out of band key, using generic key for device %@ with properties %@", v29, v30, v31, v32, v33, (uint64_t)"");
      }
      v34 = [@"Apple Watch Pairing Bluetooth PIN!" dataUsingEncoding:4];
      [v23 setOutOfBandKey:v34];

      v35 = [v23 outOfBandKey];

      if (v35)
      {
        v36 = [v23 outOfBandKey];
        uint64_t v37 = [v36 length];

        if (v37 == 34) {
          goto LABEL_23;
        }
        v107 = nrCopyLogObj_1612();
        v108 = v107;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v109 = os_log_type_enabled(v107, OS_LOG_TYPE_ERROR);

          if (!v109) {
            goto LABEL_71;
          }
        }
        id v116 = nrCopyLogObj_1612();
        _NRLogWithArgs((uint64_t)v116, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: propertiesCopy.outOfBandKey.length == 34", v117, v118, v119, v120, v121, (uint64_t)"");
      }
      else
      {
        v104 = nrCopyLogObj_1612();
        v105 = v104;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v106 = os_log_type_enabled(v104, OS_LOG_TYPE_ERROR);

          if (!v106) {
            goto LABEL_71;
          }
        }
        id v110 = nrCopyLogObj_1612();
        _NRLogWithArgs((uint64_t)v110, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (propertiesCopy.outOfBandKey) != ((void *)0)", v111, v112, v113, v114, v115, (uint64_t)"");
      }
LABEL_71:
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v122 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v122 = 136446210;
      *(void *)(v122 + 4) = "-[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]";
LABEL_60:
      id v103 = nrCopyLogObj_1612();
      _NRLogAbortWithPack(v103);
    }
  }
LABEL_23:
  if ([v23 pairWithSPPLink])
  {
    v38 = [v23 bluetoothMACAddress];

    if (!v38)
    {
      v139 = nrCopyLogObj_1612();
      v140 = v139;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v141 = os_log_type_enabled(v139, OS_LOG_TYPE_ERROR);

        if (!v141) {
          goto LABEL_59;
        }
      }
      id v158 = nrCopyLogObj_1612();
      _NRLogWithArgs((uint64_t)v158, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with Device pairing properties has pairWithSPPLink but no bluetoothMACAddress", v159, v160, v161, v162, v163, (uint64_t)"");

      goto LABEL_59;
    }
  }
  uint64_t v39 = [v23 bluetoothMACAddress];
  if (v39)
  {
    v40 = (void *)v39;
    v41 = [v23 bluetoothMACAddress];
    uint64_t v42 = [v41 length];

    if (v42 != 6)
    {
      v126 = nrCopyLogObj_1612();
      v127 = v126;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v128 = os_log_type_enabled(v126, OS_LOG_TYPE_ERROR);

        if (!v128) {
          goto LABEL_89;
        }
      }
      id v142 = nrCopyLogObj_1612();
      v143 = [v23 bluetoothMACAddress];
      [v143 length];
      _NRLogWithArgs((uint64_t)v142, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with Device pairing bluetoothMACAddress length %lu != 6", v144, v145, v146, v147, v148, (uint64_t)"");

LABEL_89:
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v149 = _os_log_pack_fill();
      v150 = [v23 bluetoothMACAddress];
      __os_log_helper_1_2_3_8_34_8_32_8_0(v149, [v150 length]);

LABEL_90:
      id v151 = nrCopyLogObj_1612();
      _NRLogAbortWithPack(v151);
    }
  }
  v172 = v12;
  v180[0] = 0;
  v171 = v13;
  v170 = [MEMORY[0x263F08910] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:v180];
  id v48 = v180[0];
  if (v48)
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 16, (uint64_t)"%s%.30s:%-4d Failed to archive operational properties %@", v43, v44, v45, v46, v47, (uint64_t)"");
    }
  }
  v168 = [v17 nrDeviceIdentifier];
  int64_t v167 = [v23 pairingProtocolVersion];
  unsigned int v166 = [v23 peerNetworkRelayVersion];
  char v165 = [v23 wasInitiallySetupUsingIDSPairing];
  [v23 outOfBandKey];
  v49 = v169 = v48;
  int v50 = [v23 pairWithSPPLink];
  char v51 = [v23 isAltAccountPairing];
  v52 = [v23 bluetoothMACAddress];
  v53 = [v23 peerEndpointDictionary];
  char v54 = [v17 isEphemeral];
  v55 = [v23 candidateService];
  v176[0] = MEMORY[0x263EF8330];
  v176[1] = 3221225472;
  v176[2] = __89__NRDeviceManager_registerDevice_properties_operationalproperties_queue_completionBlock___block_invoke;
  v176[3] = &unk_263FD1570;
  id v177 = v17;
  id v178 = v23;
  id v179 = v173;
  id v174 = v173;
  id v164 = v23;
  id v56 = v17;
  nrXPCRegisterDeviceByNRUUID(v168, v167, v166, v165, v49, v50, v51, v52, v175, v170, v53, v54, v55, v176);
}

void __89__NRDeviceManager_registerDevice_properties_operationalproperties_queue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v11 = v5;
  if (a2)
  {
    if (v5)
    {
      uint64_t v19 = *MEMORY[0x263F08320];
      v20[0] = v5;
      id v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"NRDeviceManagerErrorDomain" code:a2 userInfo:v12];
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 16, (uint64_t)"%s%.30s:%-4d Failed to register device %@ with properties %@: %@", v13, v14, v15, v16, v17, (uint64_t)"");
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Registered device %@ with properties %@", v6, v7, v8, v9, v10, (uint64_t)"");
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (id)copySharedDeviceManager
{
  if (copySharedDeviceManager_onceToken != -1) {
    dispatch_once(&copySharedDeviceManager_onceToken, &__block_literal_global_1662);
  }
  uint64_t v2 = (void *)copySharedDeviceManager_sharedDeviceManager;
  return v2;
}

uint64_t __42__NRDeviceManager_copySharedDeviceManager__block_invoke()
{
  v0 = -[NRDeviceManager initInternal]([NRDeviceManager alloc]);
  uint64_t v1 = copySharedDeviceManager_sharedDeviceManager;
  copySharedDeviceManager_sharedDeviceManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)initInternal
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v24.receiver = a1;
  v24.super_class = (Class)NRDeviceManager;
  uint64_t v1 = (id *)objc_msgSendSuper2(&v24, sel_init);
  if (!v1)
  {
    uint64_t v4 = nrCopyLogObj_1612();
    id v5 = v4;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

      if (!v6) {
        goto LABEL_17;
      }
    }
    id v10 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v10, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v11, v12, v13, v14, v15, (uint64_t)"");

    goto LABEL_17;
  }
  uint64_t v2 = v1;
  if (nrXPCCopyQueue_onceToken != -1) {
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2277);
  }
  objc_storeStrong(v2 + 1, (id)nrXPCCopyQueue_nrXPCQueue);
  if (!v2[1])
  {
    uint64_t v7 = nrCopyLogObj_1612();
    uint64_t v8 = v7;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (!v9)
      {
LABEL_17:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v22 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v22 = 136446210;
        *(void *)(v22 + 4) = "-[NRDeviceManager initInternal]";
        id v23 = nrCopyLogObj_1612();
        _NRLogAbortWithPack(v23);
      }
    }
    id v16 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v16, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (self.queue) != ((void *)0)", v17, v18, v19, v20, v21, (uint64_t)"");

    goto LABEL_17;
  }
  return v2;
}

- (id)copyIDSDeviceID
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1681;
  BOOL v9 = __Block_byref_object_dispose__1682;
  id v10 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__NRDeviceManager_Internal__copyIDSDeviceID__block_invoke;
  block[3] = &unk_263FD1610;
  block[4] = &v5;
  if (copyIDSDeviceID_onceToken != -1) {
    dispatch_once(&copyIDSDeviceID_onceToken, block);
  }
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __44__NRDeviceManager_Internal__copyIDSDeviceID__block_invoke(uint64_t a1)
{
  id v2 = nrXPCCopyIDSDeviceID();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)disableDevice:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    uint64_t v19 = nrCopyLogObj_1612();
    uint64_t v20 = v19;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
LABEL_21:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v32 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v32 = 136446466;
        *(void *)(v32 + 4) = "-[NRDeviceManager(Internal) disableDevice:queue:completionBlock:]";
        *(_WORD *)(v32 + 12) = 2080;
        *(void *)(v32 + 14) = "-[NRDeviceManager(Internal) disableDevice:queue:completionBlock:]";
        id v33 = nrCopyLogObj_1612();
        _NRLogAbortWithPack(v33);
      }
    }
    id v26 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v26, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v27, v28, v29, v30, v31, (uint64_t)"");

    goto LABEL_21;
  }
  id v10 = v9;
  if (v8)
  {
    if (v9)
    {
      id v16 = (void *)[v7 copy];
      if (nrCopyLogObj_onceToken_1616 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Disabling device %@", v11, v12, v13, v14, v15, (uint64_t)"");
      }
      uint64_t v17 = [v16 nrDeviceIdentifier];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __65__NRDeviceManager_Internal__disableDevice_queue_completionBlock___block_invoke;
      v46[3] = &unk_263FD15C0;
      id v47 = v16;
      id v48 = v10;
      id v18 = v16;
      nrXPCDisableDeviceByNRUUID(v17, v8, v46);
    }
    else
    {
      objc_super v24 = nrCopyLogObj_1612();
      uint64_t v25 = v24;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v40 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

        if (!v40) {
          goto LABEL_11;
        }
      }
      id v18 = nrCopyLogObj_1612();
      _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null completionBlock", v41, v42, v43, v44, v45, (uint64_t)"-[NRDeviceManager(Internal) disableDevice:queue:completionBlock:]");
    }
  }
  else
  {
    uint64_t v22 = nrCopyLogObj_1612();
    id v23 = v22;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v34 = os_log_type_enabled(v22, OS_LOG_TYPE_FAULT);

      if (!v34) {
        goto LABEL_11;
      }
    }
    id v18 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null queue", v35, v36, v37, v38, v39, (uint64_t)"-[NRDeviceManager(Internal) disableDevice:queue:completionBlock:]");
  }

LABEL_11:
}

void __65__NRDeviceManager_Internal__disableDevice_queue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v11 = v5;
  if (a2)
  {
    if (v5)
    {
      uint64_t v19 = *MEMORY[0x263F08320];
      v20[0] = v5;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"NRDeviceManagerErrorDomain" code:a2 userInfo:v12];
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 16, (uint64_t)"%s%.30s:%-4d Failed to disable device %@: %@", v13, v14, v15, v16, v17, (uint64_t)"");
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Disabled device %@", v6, v7, v8, v9, v10, (uint64_t)"");
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)enableDevice:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    uint64_t v19 = nrCopyLogObj_1612();
    uint64_t v20 = v19;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
LABEL_21:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v32 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v32 = 136446466;
        *(void *)(v32 + 4) = "-[NRDeviceManager(Internal) enableDevice:queue:completionBlock:]";
        *(_WORD *)(v32 + 12) = 2080;
        *(void *)(v32 + 14) = "-[NRDeviceManager(Internal) enableDevice:queue:completionBlock:]";
        id v33 = nrCopyLogObj_1612();
        _NRLogAbortWithPack(v33);
      }
    }
    id v26 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v26, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v27, v28, v29, v30, v31, (uint64_t)"");

    goto LABEL_21;
  }
  uint64_t v10 = v9;
  if (v8)
  {
    if (v9)
    {
      uint64_t v16 = (void *)[v7 copy];
      if (nrCopyLogObj_onceToken_1616 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Enabling device %@", v11, v12, v13, v14, v15, (uint64_t)"");
      }
      uint64_t v17 = [v16 nrDeviceIdentifier];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __64__NRDeviceManager_Internal__enableDevice_queue_completionBlock___block_invoke;
      v46[3] = &unk_263FD15C0;
      id v47 = v16;
      id v48 = v10;
      id v18 = v16;
      nrXPCEnableDeviceByNRUUID(v17, v8, v46);
    }
    else
    {
      objc_super v24 = nrCopyLogObj_1612();
      uint64_t v25 = v24;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v40 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

        if (!v40) {
          goto LABEL_11;
        }
      }
      id v18 = nrCopyLogObj_1612();
      _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null completionBlock", v41, v42, v43, v44, v45, (uint64_t)"-[NRDeviceManager(Internal) enableDevice:queue:completionBlock:]");
    }
  }
  else
  {
    uint64_t v22 = nrCopyLogObj_1612();
    id v23 = v22;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v34 = os_log_type_enabled(v22, OS_LOG_TYPE_FAULT);

      if (!v34) {
        goto LABEL_11;
      }
    }
    id v18 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null queue", v35, v36, v37, v38, v39, (uint64_t)"-[NRDeviceManager(Internal) enableDevice:queue:completionBlock:]");
  }

LABEL_11:
}

void __64__NRDeviceManager_Internal__enableDevice_queue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v11 = v5;
  if (a2)
  {
    if (v5)
    {
      uint64_t v19 = *MEMORY[0x263F08320];
      v20[0] = v5;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"NRDeviceManagerErrorDomain" code:a2 userInfo:v12];
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 16, (uint64_t)"%s%.30s:%-4d Failed to enable device %@: %@", v13, v14, v15, v16, v17, (uint64_t)"");
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Enabled device %@", v6, v7, v8, v9, v10, (uint64_t)"");
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)unregisterAllDevicesWithQueue:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = v6;
  if (!v5)
  {
    uint64_t v13 = nrCopyLogObj_1612();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      uint64_t v15 = v13;
      BOOL v16 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);

      if (!v16) {
        goto LABEL_9;
      }
    }
    id v17 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v17, 17, (uint64_t)"%s called with null queue", v18, v19, v20, v21, v22, (uint64_t)"-[NRDeviceManager(Internal) unregisterAllDevicesWithQueue:completionBlock:]");
LABEL_18:

    goto LABEL_9;
  }
  if (!v6)
  {
    uint64_t v14 = nrCopyLogObj_1612();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      id v23 = v14;
      BOOL v24 = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);

      if (!v24) {
        goto LABEL_9;
      }
    }
    id v17 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v17, 17, (uint64_t)"%s called with null completionBlock", v25, v26, v27, v28, v29, (uint64_t)"-[NRDeviceManager(Internal) unregisterAllDevicesWithQueue:completionBlock:]");
    goto LABEL_18;
  }
  if (nrCopyLogObj_onceToken_1616 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Unregistering all devices", v7, v8, v9, v10, v11, (uint64_t)"");
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __75__NRDeviceManager_Internal__unregisterAllDevicesWithQueue_completionBlock___block_invoke;
  v30[3] = &unk_263FD15E8;
  id v31 = v12;
  nrXPCUnregisterAllDevices(v5, v30);

LABEL_9:
}

void __75__NRDeviceManager_Internal__unregisterAllDevicesWithQueue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v11 = v5;
  if (a2)
  {
    if (v5)
    {
      uint64_t v19 = *MEMORY[0x263F08320];
      v20[0] = v5;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"NRDeviceManagerErrorDomain" code:a2 userInfo:v12];
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 16, (uint64_t)"%s%.30s:%-4d Failed to unregister all devices: %@", v13, v14, v15, v16, v17, (uint64_t)"");
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Unregistered all devices", v6, v7, v8, v9, v10, (uint64_t)"");
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)unregisterDevice:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    uint64_t v19 = nrCopyLogObj_1612();
    uint64_t v20 = v19;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v21 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v21)
      {
LABEL_21:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v32 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v32 = 136446466;
        *(void *)(v32 + 4) = "-[NRDeviceManager(Internal) unregisterDevice:queue:completionBlock:]";
        *(_WORD *)(v32 + 12) = 2080;
        *(void *)(v32 + 14) = "-[NRDeviceManager(Internal) unregisterDevice:queue:completionBlock:]";
        id v33 = nrCopyLogObj_1612();
        _NRLogAbortWithPack(v33);
      }
    }
    id v26 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v26, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL deviceID", v27, v28, v29, v30, v31, (uint64_t)"");

    goto LABEL_21;
  }
  uint64_t v10 = v9;
  if (v8)
  {
    if (v9)
    {
      uint64_t v16 = (void *)[v7 copy];
      if (nrCopyLogObj_onceToken_1616 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Unregistering device %@", v11, v12, v13, v14, v15, (uint64_t)"");
      }
      uint64_t v17 = [v16 nrDeviceIdentifier];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __68__NRDeviceManager_Internal__unregisterDevice_queue_completionBlock___block_invoke;
      v46[3] = &unk_263FD15C0;
      id v47 = v16;
      id v48 = v10;
      id v18 = v16;
      nrXPCUnregisterDeviceByNRUUID(v17, v8, v46);
    }
    else
    {
      BOOL v24 = nrCopyLogObj_1612();
      uint64_t v25 = v24;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v40 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

        if (!v40) {
          goto LABEL_11;
        }
      }
      id v18 = nrCopyLogObj_1612();
      _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null completionBlock", v41, v42, v43, v44, v45, (uint64_t)"-[NRDeviceManager(Internal) unregisterDevice:queue:completionBlock:]");
    }
  }
  else
  {
    uint64_t v22 = nrCopyLogObj_1612();
    id v23 = v22;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v34 = os_log_type_enabled(v22, OS_LOG_TYPE_FAULT);

      if (!v34) {
        goto LABEL_11;
      }
    }
    id v18 = nrCopyLogObj_1612();
    _NRLogWithArgs((uint64_t)v18, 17, (uint64_t)"%s called with null queue", v35, v36, v37, v38, v39, (uint64_t)"-[NRDeviceManager(Internal) unregisterDevice:queue:completionBlock:]");
  }

LABEL_11:
}

void __68__NRDeviceManager_Internal__unregisterDevice_queue_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v11 = v5;
  if (a2)
  {
    if (v5)
    {
      uint64_t v19 = *MEMORY[0x263F08320];
      v20[0] = v5;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"NRDeviceManagerErrorDomain" code:a2 userInfo:v12];
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 16, (uint64_t)"%s%.30s:%-4d Failed to unregister device %@: %@", v13, v14, v15, v16, v17, (uint64_t)"");
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (nrCopyLogObj_onceToken_1616 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1617, OS_LOG_TYPE_DEFAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1617, 0, (uint64_t)"%s%.30s:%-4d Unregistered device %@", v6, v7, v8, v9, v10, (uint64_t)"");
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end