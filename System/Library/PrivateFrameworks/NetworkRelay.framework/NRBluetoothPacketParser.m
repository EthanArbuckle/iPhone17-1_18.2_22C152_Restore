@interface NRBluetoothPacketParser
- ($3D27A55567FB06BC0E416B979767FD15)createWriteContextForPriority:(unsigned __int8)a3 writeOutputCallback:(void *)a4 writeOutputContext:(void *)a5;
- ($B174F4C94D76BD0ED270DA150CD5266A)createReadContextForPriority:(unsigned __int8)a3 readAvailableCallback:(void *)a4 readAvailableContext:(void *)a5;
- (BOOL)start;
- (NRBluetoothPacketParser)initWithBluetoothUUID:(id)a3 queue:(id)a4;
- (NRBluetoothPacketParser)initWithDeviceIdentifier:(id)a3 queue:(id)a4;
- (NSString)description;
- (NSUUID)bluetoothUUID;
- (void)cancel;
- (void)changeStateTo:(uint64_t)a1;
- (void)dealloc;
- (void)handleIncomingIKEData:(int)a3 linkPriority:;
- (void)handleIncomingWakePacket:(uint64_t)a3 spi:;
- (void)handleInternalError:(uint64_t)a3;
- (void)resetContextForPriority:(unsigned __int8)a3;
- (void)resetContextForPriorityInner:(int)a3 teardownContext:;
- (void)sendDatapathReport:(uint64_t)a1;
- (void)setBluetoothUUID:(id)a3;
- (void)setupNexusChannelForPriority:(void *)a3 channelUUID:;
- (void)teardown;
- (void)updateReadyStateIfApplicable;
@end

@implementation NRBluetoothPacketParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkStatTimerSource, 0);
  objc_storeStrong((id *)&self->_poolPurgeTimer, 0);
  objc_storeStrong((id *)&self->_xpcComm, 0);
  objc_storeStrong((id *)&self->_nexusBKGroup, 0);
  objc_storeStrong((id *)&self->_nexusBEGroup, 0);
  objc_storeStrong((id *)&self->_nexusVIGroup, 0);
  objc_storeStrong((id *)&self->_nexusVOGroup, 0);
  objc_storeStrong((id *)&self->_dNexusBKOutputSource, 0);
  objc_storeStrong((id *)&self->_dNexusBKInputSource, 0);
  objc_storeStrong((id *)&self->_dNexusBEOutputSource, 0);
  objc_storeStrong((id *)&self->_dNexusBEInputSource, 0);
  objc_storeStrong((id *)&self->_dNexusVIOutputSource, 0);
  objc_storeStrong((id *)&self->_dNexusVIInputSource, 0);
  objc_storeStrong((id *)&self->_dNexusVOOutputSource, 0);
  objc_storeStrong((id *)&self->_dNexusVOInputSource, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_nexusInstances, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
}

- (void)setBluetoothUUID:(id)a3
{
}

- (NSUUID)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- ($3D27A55567FB06BC0E416B979767FD15)createWriteContextForPriority:(unsigned __int8)a3 writeOutputCallback:(void *)a4 writeOutputContext:(void *)a5
{
  if (self->_state == 4) {
    return 0;
  }
  if (!a4)
  {
    v24 = nrCopyLogObj_518();
    v25 = v24;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v35 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v35) {
        return 0;
      }
    }
    v22 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v22, 17, (uint64_t)"%s called with null callback", v36, v37, v38, v39, v40, (uint64_t)"-[NRBluetoothPacketParser createWriteContextForPriority:writeOutputCallback:writeOutputContext:]");
    v10 = 0;
LABEL_16:

    return v10;
  }
  unsigned int v6 = a3;
  if (!a3) {
    return 0;
  }
  v9 = ($3D27A55567FB06BC0E416B979767FD15 *)malloc_type_calloc(1uLL, 0x20uLL, 0xF1748037uLL);
  if (!v9)
  {
    v26 = nrCopyLogObj_518();
    v27 = v26;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v28 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

      if (!v28) {
        goto LABEL_34;
      }
    }
    id v42 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v42, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v43, v44, v45, v46, v47, (uint64_t)"");

LABEL_34:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v48 = _os_log_pack_fill();
    uint64_t v49 = 32;
LABEL_38:
    __os_log_helper_1_2_3_8_34_8_0_8_0(v48, v49);
    goto LABEL_42;
  }
  v10 = v9;
  v11 = malloc_type_calloc(1uLL, 0x58uLL, 0xF1748037uLL);
  if (!v11)
  {
    v29 = nrCopyLogObj_518();
    v30 = v29;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v31 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

      if (!v31) {
        goto LABEL_37;
      }
    }
    id v50 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v50, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v51, v52, v53, v54, v55, (uint64_t)"");

LABEL_37:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v48 = _os_log_pack_fill();
    uint64_t v49 = 88;
    goto LABEL_38;
  }
  v12 = v11;
  v13 = malloc_type_malloc(0x4000uLL, 0xA172743EuLL);
  if (!v13)
  {
    v32 = nrCopyLogObj_518();
    v33 = v32;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v34 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

      if (!v34) {
        goto LABEL_41;
      }
    }
    id v56 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v56, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", v57, v58, v59, v60, v61, (uint64_t)"");

LABEL_41:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v62 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v62 = 136446466;
    *(void *)(v62 + 4) = "strict_malloc";
    *(_WORD *)(v62 + 12) = 2048;
    *(void *)(v62 + 14) = 0x4000;
LABEL_42:
    id v63 = nrCopyLogObj_518();
    _NRLogAbortWithPack(v63);
  }
  *(void *)v12 = v13;
  v12[83] = v6;
  *((void *)v12 + 2) = self;
  v10->var0 = a5;
  v10->var1 = a4;
  v10->var2 = NRParserLinkWriteAvailable;
  v10->var3 = v12;
  if (v6 <= 3) {
    *((void *)&self->_writeContextForMedium + 2 * (v6 - 1)) = v10;
  }
  os_log_t v14 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  os_log_t v15 = v14;
  if (sNRCopyLogToStdErr)
  {

LABEL_12:
    v22 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    if (v6 >= 4) {
      v23 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%d)", v6);
    }
    else {
      v23 = off_263FD11D0[v6];
    }
    _NRLogWithArgs((uint64_t)v22, 0, (uint64_t)"%s%.30s:%-4d Created write context (%p) for %@", v17, v18, v19, v20, v21, (uint64_t)"");

    goto LABEL_16;
  }
  BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v16) {
    goto LABEL_12;
  }
  return v10;
}

- ($B174F4C94D76BD0ED270DA150CD5266A)createReadContextForPriority:(unsigned __int8)a3 readAvailableCallback:(void *)a4 readAvailableContext:(void *)a5
{
  if (self->_state == 4) {
    return 0;
  }
  if (!a4)
  {
    v25 = nrCopyLogObj_518();
    v26 = v25;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v36 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (!v36) {
        return 0;
      }
    }
    v23 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)"%s called with null callback", v37, v38, v39, v40, v41, (uint64_t)"-[NRBluetoothPacketParser createReadContextForPriority:readAvailableCallback:readAvailableContext:]");
    v10 = 0;
LABEL_16:

    return v10;
  }
  unsigned int v6 = a3;
  if (!a3) {
    return 0;
  }
  v9 = ($B174F4C94D76BD0ED270DA150CD5266A *)malloc_type_calloc(1uLL, 0x28uLL, 0xF1748037uLL);
  if (!v9)
  {
    v27 = nrCopyLogObj_518();
    BOOL v28 = v27;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v29 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (!v29) {
        goto LABEL_34;
      }
    }
    id v43 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v43, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v44, v45, v46, v47, v48, (uint64_t)"");

LABEL_34:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v49 = _os_log_pack_fill();
    uint64_t v50 = 40;
LABEL_38:
    __os_log_helper_1_2_3_8_34_8_0_8_0(v49, v50);
    goto LABEL_42;
  }
  v10 = v9;
  v11 = malloc_type_calloc(1uLL, 0x20uLL, 0xF1748037uLL);
  if (!v11)
  {
    v30 = nrCopyLogObj_518();
    BOOL v31 = v30;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v32 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

      if (!v32) {
        goto LABEL_37;
      }
    }
    id v51 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v51, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v52, v53, v54, v55, v56, (uint64_t)"");

LABEL_37:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v49 = _os_log_pack_fill();
    uint64_t v50 = 32;
    goto LABEL_38;
  }
  v12 = v11;
  v11[1] = self;
  v13 = malloc_type_malloc(0xFFFFuLL, 0xA172743EuLL);
  if (!v13)
  {
    v33 = nrCopyLogObj_518();
    BOOL v34 = v33;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v35 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

      if (!v35) {
        goto LABEL_41;
      }
    }
    id v57 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", v58, v59, v60, v61, v62, (uint64_t)"");

LABEL_41:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v63 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v63 = 136446466;
    *(void *)(v63 + 4) = "strict_malloc";
    *(_WORD *)(v63 + 12) = 2048;
    *(void *)(v63 + 14) = 0xFFFFLL;
LABEL_42:
    id v64 = nrCopyLogObj_518();
    _NRLogAbortWithPack(v64);
  }
  *(void *)v12 = v13;
  v12[26] = v6;
  v10->var3 = a4;
  v10->var4 = a5;
  v10->var2 = NRBluetoothParserReadFlushCallback;
  v10->var0 = v12;
  v10->var1 = NRBluetoothParserReadInputCallback;
  unsigned __int8 v14 = v6 - 1;
  if (v6 <= 3) {
    *((void *)&self->_readContextForMedium + 2 * v14) = v10;
  }
  ++self->_totalContextCount;
  os_log_t v15 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  os_log_t v16 = v15;
  if (sNRCopyLogToStdErr)
  {

LABEL_12:
    v23 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    if (v6 >= 4) {
      v24 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%d)", v6);
    }
    else {
      v24 = off_263FD11B8[(char)v14];
    }
    _NRLogWithArgs((uint64_t)v23, 0, (uint64_t)"%s%.30s:%-4d Created read context (%p) for %@ (total: %llu)", v18, v19, v20, v21, v22, (uint64_t)"");

    goto LABEL_16;
  }
  BOOL v17 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v17) {
    goto LABEL_12;
  }
  return v10;
}

- (void)handleInternalError:(uint64_t)a3
{
  id v10 = a2;
  v11 = v10;
  if (a1 && *(unsigned char *)(a1 + 8) != 4)
  {
    if (!v10)
    {
      v23 = nrCopyLogObj_518();
      v24 = v23;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v25 = os_log_type_enabled(v23, OS_LOG_TYPE_FAULT);

        if (!v25) {
          goto LABEL_9;
        }
      }
      id v26 = nrCopyLogObj_518();
      _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)"%s called with null errorFormat", v27, v28, v29, v30, v31, (uint64_t)"-[NRBluetoothPacketParser handleInternalError:]");

      goto LABEL_9;
    }
    v12 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];
    os_log_t v13 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v14 = v13;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      if (!v15)
      {
LABEL_8:
        id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v22 setObject:v12 forKeyedSubscript:@"error"];
        [*(id *)(a1 + 400) sendXPCCommDictionary:v22];
        -[NRBluetoothPacketParser teardown](a1);

        goto LABEL_9;
      }
    }
    os_log_t v16 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v16, 0, (uint64_t)"%s%.30s:%-4d internal error: %@", v17, v18, v19, v20, v21, (uint64_t)"");

    goto LABEL_8;
  }
LABEL_9:
}

- (void)handleIncomingWakePacket:(uint64_t)a3 spi:
{
  if (a1 && *(unsigned char *)(a1 + 8) != 4)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    unsigned int v6 = [NSNumber numberWithUnsignedInt:a2];
    [v8 setObject:v6 forKeyedSubscript:@"wake-pkt-sn"];

    v7 = [NSNumber numberWithUnsignedInt:a3];
    [v8 setObject:v7 forKeyedSubscript:@"wake-pkt-spi"];

    [*(id *)(a1 + 400) sendXPCCommDictionary:v8];
  }
}

- (void)handleIncomingIKEData:(int)a3 linkPriority:
{
  id v5 = a2;
  if (a1 && *(unsigned char *)(a1 + 8) != 4)
  {
    id v19 = v5;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_4:
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v7 = v6;
      if ((a3 - 1) > 2) {
        id v8 = &unk_26BE1D9F8;
      }
      else {
        id v8 = (void *)qword_263FD11F0[(a3 - 1)];
      }
      [v6 setObject:v8 forKeyedSubscript:@"channel-id"];
      [v7 setObject:v19 forKeyedSubscript:@"message-data"];
      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v9 setObject:v7 forKeyedSubscript:@"message"];
      [*(id *)(a1 + 400) sendXPCCommDictionary:v9];

      id v5 = v19;
      goto LABEL_8;
    }
    os_log_t v10 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v11 = v10;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

      if (!v12) {
        goto LABEL_4;
      }
    }
    os_log_t v13 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    [v19 length];
    _NRLogWithArgs((uint64_t)v13, 1, (uint64_t)"%s%.30s:%-4d handling uIKE packet of %llu bytes", v14, v15, v16, v17, v18, (uint64_t)"");

    goto LABEL_4;
  }
LABEL_8:
}

- (void)teardown
{
  if (!a1) {
    return;
  }
  os_log_t v2 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  os_log_t v3 = v2;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v4 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (!v4) {
      goto LABEL_6;
    }
  }
  os_log_t v5 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  _NRLogWithArgs((uint64_t)v5, 0, (uint64_t)"%s%.30s:%-4d Teardown", v6, v7, v8, v9, v10, (uint64_t)"");

LABEL_6:
  -[NRBluetoothPacketParser changeStateTo:](a1, 4);
  *(unsigned char *)(a1 + 10) = 0;
  os_log_t v11 = *(void **)(a1 + 400);
  if (v11)
  {
    [v11 cancel];
    BOOL v12 = *(void **)(a1 + 400);
    *(void *)(a1 + 400) = 0;
  }
  os_log_t v13 = *(NSObject **)(a1 + 304);
  if (v13)
  {
    uint64_t v14 = *(void *)(a1 + 136);
    if ((v14 & 8) == 0)
    {
LABEL_12:
      dispatch_source_cancel(v13);
      uint64_t v15 = *(void **)(a1 + 304);
      *(void *)(a1 + 304) = 0;

      goto LABEL_13;
    }
    *(void *)(a1 + 136) = v14 & 0xFFFFFFFFFFFFFFF7;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_11:
      dispatch_resume(*(dispatch_object_t *)(a1 + 304));
      os_log_t v13 = *(NSObject **)(a1 + 304);
      goto LABEL_12;
    }
    os_log_t v42 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v43 = v42;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v58 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);

      if (!v58) {
        goto LABEL_11;
      }
    }
    os_log_t v59 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v59, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v60, v61, v62, v63, v64, (uint64_t)"");

    goto LABEL_11;
  }
LABEL_13:
  uint64_t v16 = *(NSObject **)(a1 + 312);
  if (!v16) {
    goto LABEL_18;
  }
  uint64_t v17 = *(void *)(a1 + 136);
  if ((v17 & 0x80) != 0)
  {
    *(void *)(a1 + 136) = v17 & 0xFFFFFFFFFFFFFF7FLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_16:
      dispatch_resume(*(dispatch_object_t *)(a1 + 312));
      uint64_t v16 = *(NSObject **)(a1 + 312);
      goto LABEL_17;
    }
    os_log_t v44 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v45 = v44;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);

      if (!v65) {
        goto LABEL_16;
      }
    }
    os_log_t v66 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v66, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOOutput", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_16;
  }
LABEL_17:
  dispatch_source_cancel(v16);
  uint64_t v18 = *(void **)(a1 + 312);
  *(void *)(a1 + 312) = 0;

LABEL_18:
  if (*(void *)(a1 + 208))
  {
    if (!*(void *)(a1 + 368)) {
      os_channel_destroy();
    }
    *(void *)(a1 + 208) = 0;
  }
  *(void *)(a1 + 240) = 0;
  *(void *)(a1 + 248) = 0;
  id v19 = *(NSObject **)(a1 + 320);
  if (v19)
  {
    uint64_t v20 = *(void *)(a1 + 136);
    if ((v20 & 0x10) == 0)
    {
LABEL_26:
      dispatch_source_cancel(v19);
      uint64_t v21 = *(void **)(a1 + 320);
      *(void *)(a1 + 320) = 0;

      goto LABEL_27;
    }
    *(void *)(a1 + 136) = v20 & 0xFFFFFFFFFFFFFFEFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_25:
      dispatch_resume(*(dispatch_object_t *)(a1 + 320));
      id v19 = *(NSObject **)(a1 + 320);
      goto LABEL_26;
    }
    os_log_t v46 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v47 = v46;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v72 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);

      if (!v72) {
        goto LABEL_25;
      }
    }
    os_log_t v73 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v73, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v74, v75, v76, v77, v78, (uint64_t)"");

    goto LABEL_25;
  }
LABEL_27:
  id v22 = *(NSObject **)(a1 + 328);
  if (!v22) {
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(a1 + 136);
  if ((v23 & 0x100) != 0)
  {
    *(void *)(a1 + 136) = v23 & 0xFFFFFFFFFFFFFEFFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_30:
      dispatch_resume(*(dispatch_object_t *)(a1 + 328));
      id v22 = *(NSObject **)(a1 + 328);
      goto LABEL_31;
    }
    os_log_t v48 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v49 = v48;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v79 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);

      if (!v79) {
        goto LABEL_30;
      }
    }
    os_log_t v80 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v80, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIOutput", v81, v82, v83, v84, v85, (uint64_t)"");

    goto LABEL_30;
  }
LABEL_31:
  dispatch_source_cancel(v22);
  v24 = *(void **)(a1 + 328);
  *(void *)(a1 + 328) = 0;

LABEL_32:
  if (*(void *)(a1 + 216))
  {
    if (!*(void *)(a1 + 376)) {
      os_channel_destroy();
    }
    *(void *)(a1 + 216) = 0;
  }
  *(void *)(a1 + 256) = 0;
  *(void *)(a1 + 264) = 0;
  BOOL v25 = *(NSObject **)(a1 + 336);
  if (v25)
  {
    uint64_t v26 = *(void *)(a1 + 136);
    if ((v26 & 0x20) == 0)
    {
LABEL_40:
      dispatch_source_cancel(v25);
      uint64_t v27 = *(void **)(a1 + 336);
      *(void *)(a1 + 336) = 0;

      goto LABEL_41;
    }
    *(void *)(a1 + 136) = v26 & 0xFFFFFFFFFFFFFFDFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_39:
      dispatch_resume(*(dispatch_object_t *)(a1 + 336));
      BOOL v25 = *(NSObject **)(a1 + 336);
      goto LABEL_40;
    }
    os_log_t v50 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v51 = v50;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v86 = os_log_type_enabled(v50, OS_LOG_TYPE_INFO);

      if (!v86) {
        goto LABEL_39;
      }
    }
    os_log_t v87 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v87, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v88, v89, v90, v91, v92, (uint64_t)"");

    goto LABEL_39;
  }
LABEL_41:
  uint64_t v28 = *(NSObject **)(a1 + 344);
  if (!v28) {
    goto LABEL_46;
  }
  uint64_t v29 = *(void *)(a1 + 136);
  if ((v29 & 0x200) != 0)
  {
    *(void *)(a1 + 136) = v29 & 0xFFFFFFFFFFFFFDFFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_44:
      dispatch_resume(*(dispatch_object_t *)(a1 + 344));
      uint64_t v28 = *(NSObject **)(a1 + 344);
      goto LABEL_45;
    }
    os_log_t v52 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v53 = v52;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v93 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);

      if (!v93) {
        goto LABEL_44;
      }
    }
    os_log_t v94 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v94, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEOutput", v95, v96, v97, v98, v99, (uint64_t)"");

    goto LABEL_44;
  }
LABEL_45:
  dispatch_source_cancel(v28);
  uint64_t v30 = *(void **)(a1 + 344);
  *(void *)(a1 + 344) = 0;

LABEL_46:
  if (*(void *)(a1 + 224))
  {
    if (!*(void *)(a1 + 384)) {
      os_channel_destroy();
    }
    *(void *)(a1 + 224) = 0;
  }
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 0;
  uint64_t v31 = *(NSObject **)(a1 + 352);
  if (v31)
  {
    uint64_t v32 = *(void *)(a1 + 136);
    if ((v32 & 0x40) == 0)
    {
LABEL_54:
      dispatch_source_cancel(v31);
      v33 = *(void **)(a1 + 352);
      *(void *)(a1 + 352) = 0;

      goto LABEL_55;
    }
    *(void *)(a1 + 136) = v32 & 0xFFFFFFFFFFFFFFBFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_53:
      dispatch_resume(*(dispatch_object_t *)(a1 + 352));
      uint64_t v31 = *(NSObject **)(a1 + 352);
      goto LABEL_54;
    }
    os_log_t v54 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v55 = v54;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v100 = os_log_type_enabled(v54, OS_LOG_TYPE_INFO);

      if (!v100) {
        goto LABEL_53;
      }
    }
    os_log_t v101 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v101, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v102, v103, v104, v105, v106, (uint64_t)"");

    goto LABEL_53;
  }
LABEL_55:
  BOOL v34 = *(NSObject **)(a1 + 360);
  if (v34)
  {
    uint64_t v35 = *(void *)(a1 + 136);
    if ((v35 & 0x400) == 0)
    {
LABEL_59:
      dispatch_source_cancel(v34);
      BOOL v36 = *(void **)(a1 + 360);
      *(void *)(a1 + 360) = 0;

      goto LABEL_60;
    }
    *(void *)(a1 + 136) = v35 & 0xFFFFFFFFFFFFFBFFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_58:
      dispatch_resume(*(dispatch_object_t *)(a1 + 360));
      BOOL v34 = *(NSObject **)(a1 + 360);
      goto LABEL_59;
    }
    os_log_t v56 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v57 = v56;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v107 = os_log_type_enabled(v56, OS_LOG_TYPE_INFO);

      if (!v107) {
        goto LABEL_58;
      }
    }
    os_log_t v108 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v108, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKOutput", v109, v110, v111, v112, v113, (uint64_t)"");

    goto LABEL_58;
  }
LABEL_60:
  if (*(void *)(a1 + 232))
  {
    if (!*(void *)(a1 + 392)) {
      os_channel_destroy();
    }
    *(void *)(a1 + 232) = 0;
  }
  *(void *)(a1 + 288) = 0;
  *(void *)(a1 + 296) = 0;
  uint64_t v37 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = 0;

  *(unsigned char *)(a1 + 11) = 0;
  uint64_t v38 = *(NSObject **)(a1 + 424);
  if (v38)
  {
    dispatch_source_cancel(v38);
    uint64_t v39 = *(void **)(a1 + 424);
    *(void *)(a1 + 424) = 0;
  }
  uint64_t v40 = *(NSObject **)(a1 + 656);
  if (v40)
  {
    dispatch_source_cancel(v40);
    uint64_t v41 = *(void **)(a1 + 656);
    *(void *)(a1 + 656) = 0;
  }
}

- (void)changeStateTo:(uint64_t)a1
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  if (v2 == a2) {
    return;
  }
  os_log_t v5 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  os_log_t v6 = v5;
  if (v2 != 4)
  {
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (!v13)
      {
LABEL_16:
        *(unsigned char *)(a1 + 8) = a2;
        return;
      }
    }
    os_log_t v19 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    uint64_t v20 = *(unsigned __int8 *)(a1 + 8);
    if (v20 >= 5) {
      uint64_t v21 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%d)", v20);
    }
    else {
      uint64_t v21 = off_263FD1190[*(unsigned __int8 *)(a1 + 8)];
    }
    id v22 = off_263FD1190[a2];
    _NRLogWithArgs((uint64_t)v19, 0, (uint64_t)"%s%.30s:%-4d Changing state: %@ -> %@", v14, v15, v16, v17, v18, (uint64_t)"");

    goto LABEL_16;
  }
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);

    if (!v7) {
      return;
    }
  }
  os_log_t v23 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)"Invalid state change %@", v8, v9, v10, v11, v12, a1);
}

- (void)resetContextForPriority:(unsigned __int8)a3
{
}

- (void)resetContextForPriorityInner:(int)a3 teardownContext:
{
  if (!a1) {
    return;
  }
  os_log_t v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  os_log_t v7 = v6;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (!v8) {
      goto LABEL_9;
    }
  }
  os_log_t v14 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  if (a2 >= 4) {
    uint64_t v15 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%d)", a2);
  }
  else {
    uint64_t v15 = off_263FD11D0[a2];
  }
  _NRLogWithArgs((uint64_t)v14, 0, (uint64_t)"%s%.30s:%-4d Resetting context for priority: %@ (%d)", v9, v10, v11, v12, v13, (uint64_t)"");

LABEL_9:
  unsigned int v16 = 0xF7FBFDFF >> (8 * a2);
  if (a2 >= 4) {
    LOBYTE(v16) = -1;
  }
  *(unsigned char *)(a1 + 10) &= v16;
  if (!a3) {
    goto LABEL_53;
  }
  if ((a2 - 1) >= 3)
  {
    os_log_t v18 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v19 = v18;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v20 = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);

      if (!v20) {
        goto LABEL_20;
      }
    }
    os_log_t v21 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v21, 17, (uint64_t)"Invalid priority %d", v22, v23, v24, v25, v26, a2);
  }
  else if (*(void *)(a1 + 16 * (a2 - 1) + 88))
  {
    uint64_t v17 = *(void *)(a1 + 664);
    if (v17) {
      *(void *)(a1 + 664) = v17 - 1;
    }
  }
LABEL_20:
  switch(a2)
  {
    case 1:
      uint64_t v31 = *(void ****)(a1 + 88);
      if (v31)
      {
        uint64_t v32 = *v31;
        if (!*v31) {
          goto LABEL_36;
        }
        if (*v32)
        {
          free(*v32);
          ***(void ***)(a1 + 88) = 0;
          uint64_t v31 = *(void ****)(a1 + 88);
          uint64_t v32 = *v31;
          if (!*v31) {
            goto LABEL_36;
          }
        }
        free(v32);
        **(void **)(a1 + 88) = 0;
        uint64_t v31 = *(void ****)(a1 + 88);
        if (v31)
        {
LABEL_36:
          free(v31);
          *(void *)(a1 + 88) = 0;
        }
      }
      uint64_t v30 = a1 + 96;
      uint64_t v29 = *(void **)(a1 + 96);
      if (v29) {
        goto LABEL_46;
      }
      break;
    case 2:
      v33 = *(void ****)(a1 + 104);
      if (v33)
      {
        BOOL v34 = *v33;
        if (!*v33) {
          goto LABEL_44;
        }
        if (*v34)
        {
          free(*v34);
          ***(void ***)(a1 + 104) = 0;
          v33 = *(void ****)(a1 + 104);
          BOOL v34 = *v33;
          if (!*v33) {
            goto LABEL_44;
          }
        }
        free(v34);
        **(void **)(a1 + 104) = 0;
        v33 = *(void ****)(a1 + 104);
        if (v33)
        {
LABEL_44:
          free(v33);
          *(void *)(a1 + 104) = 0;
        }
      }
      uint64_t v30 = a1 + 112;
      uint64_t v29 = *(void **)(a1 + 112);
      if (v29) {
        goto LABEL_46;
      }
      break;
    case 3:
      uint64_t v27 = *(void ****)(a1 + 120);
      if (v27)
      {
        uint64_t v28 = *v27;
        if (!*v27) {
          goto LABEL_28;
        }
        if (*v28)
        {
          free(*v28);
          ***(void ***)(a1 + 120) = 0;
          uint64_t v27 = *(void ****)(a1 + 120);
          uint64_t v28 = *v27;
          if (!*v27) {
            goto LABEL_28;
          }
        }
        free(v28);
        **(void **)(a1 + 120) = 0;
        uint64_t v27 = *(void ****)(a1 + 120);
        if (v27)
        {
LABEL_28:
          free(v27);
          *(void *)(a1 + 120) = 0;
        }
      }
      uint64_t v30 = a1 + 128;
      uint64_t v29 = *(void **)(a1 + 128);
      if (!v29) {
        break;
      }
LABEL_46:
      uint64_t v35 = v29[3];
      if (!v35) {
        goto LABEL_52;
      }
      if (*(void *)v35)
      {
        free(*(void **)v35);
        **(void **)(*(void *)v30 + 24) = 0;
        uint64_t v35 = *(void *)(*(void *)v30 + 24);
      }
      BOOL v36 = *(void **)(v35 + 8);
      if (v36)
      {
        free(v36);
        *(void *)(*(void *)(*(void *)v30 + 24) + 8) = 0;
        uint64_t v29 = *(void **)v30;
        uint64_t v35 = *(void *)(*(void *)v30 + 24);
        if (!v35) {
          goto LABEL_52;
        }
      }
      free((void *)v35);
      *(void *)(*(void *)v30 + 24) = 0;
      uint64_t v29 = *(void **)v30;
      if (*(void *)v30)
      {
LABEL_52:
        free(v29);
        *(void *)uint64_t v30 = 0;
      }
      break;
    default:
      break;
  }
LABEL_53:
  uint64_t v37 = *(void *)(a1 + 136);
  if ((v37 & 8) != 0 && *(void *)(a1 + 304))
  {
    *(void *)(a1 + 136) = v37 & 0xFFFFFFFFFFFFFFF7;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_56:
      dispatch_resume(*(dispatch_object_t *)(a1 + 304));
      uint64_t v37 = *(void *)(a1 + 136);
      goto LABEL_57;
    }
    os_log_t v39 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v40 = v39;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v47 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);

      if (!v47) {
        goto LABEL_56;
      }
    }
    os_log_t v48 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v48, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v49, v50, v51, v52, v53, (uint64_t)"");

    goto LABEL_56;
  }
LABEL_57:
  if ((v37 & 0x10) != 0 && *(void *)(a1 + 320))
  {
    *(void *)(a1 + 136) = v37 & 0xFFFFFFFFFFFFFFEFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_60:
      dispatch_resume(*(dispatch_object_t *)(a1 + 320));
      uint64_t v37 = *(void *)(a1 + 136);
      goto LABEL_61;
    }
    os_log_t v41 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v42 = v41;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v54 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);

      if (!v54) {
        goto LABEL_60;
      }
    }
    os_log_t v55 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v55, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v56, v57, v58, v59, v60, (uint64_t)"");

    goto LABEL_60;
  }
LABEL_61:
  if ((v37 & 0x20) != 0 && *(void *)(a1 + 336))
  {
    *(void *)(a1 + 136) = v37 & 0xFFFFFFFFFFFFFFDFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_64:
      dispatch_resume(*(dispatch_object_t *)(a1 + 336));
      uint64_t v37 = *(void *)(a1 + 136);
      goto LABEL_65;
    }
    os_log_t v43 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    os_log_t v44 = v43;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v61 = os_log_type_enabled(v43, OS_LOG_TYPE_INFO);

      if (!v61) {
        goto LABEL_64;
      }
    }
    os_log_t v62 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v62, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v63, v64, v65, v66, v67, (uint64_t)"");

    goto LABEL_64;
  }
LABEL_65:
  if ((v37 & 0x40) == 0 || !*(void *)(a1 + 352)) {
    return;
  }
  *(void *)(a1 + 136) = v37 & 0xFFFFFFFFFFFFFFBFLL;
  if (!gNRPacketLoggingEnabled) {
    goto LABEL_68;
  }
  os_log_t v45 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  os_log_t v46 = v45;
  if (sNRCopyLogToStdErr)
  {

LABEL_87:
    os_log_t v69 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v69, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v70, v71, v72, v73, v74, (uint64_t)"");

    goto LABEL_68;
  }
  BOOL v68 = os_log_type_enabled(v45, OS_LOG_TYPE_INFO);

  if (v68) {
    goto LABEL_87;
  }
LABEL_68:
  uint64_t v38 = *(NSObject **)(a1 + 352);
  dispatch_resume(v38);
}

- (void)cancel
{
  os_log_t v3 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  os_log_t v4 = v3;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (!v5) {
      goto LABEL_5;
    }
  }
  os_log_t v6 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  _NRLogWithArgs((uint64_t)v6, 0, (uint64_t)"%s%.30s:%-4d Cancel", v7, v8, v9, v10, v11, (uint64_t)"");

LABEL_5:
  -[NRBluetoothPacketParser teardown]((uint64_t)self);
}

- (void)dealloc
{
  [(NRBluetoothPacketParser *)self cancel];
  readContextForMedium = self->_readContextForMedium;
  if (readContextForMedium)
  {
    var0 = (void **)readContextForMedium->var0;
    if (!readContextForMedium->var0) {
      goto LABEL_6;
    }
    if (*var0)
    {
      free(*var0);
      *(void *)self->_readContextForMedium->var0 = 0;
      readContextForMedium = self->_readContextForMedium;
      var0 = (void **)readContextForMedium->var0;
      if (!readContextForMedium->var0) {
        goto LABEL_6;
      }
    }
    free(var0);
    self->_readContextForMedium->var0 = 0;
    readContextForMedium = self->_readContextForMedium;
    if (readContextForMedium)
    {
LABEL_6:
      free(readContextForMedium);
      self->_readContextForMedium = 0;
    }
  }
  readContextForHigh = self->_readContextForHigh;
  if (readContextForHigh)
  {
    os_log_t v6 = (void **)readContextForHigh->var0;
    if (!readContextForHigh->var0) {
      goto LABEL_12;
    }
    if (*v6)
    {
      free(*v6);
      *(void *)self->_readContextForHigh->var0 = 0;
      readContextForHigh = self->_readContextForHigh;
      os_log_t v6 = (void **)readContextForHigh->var0;
      if (!readContextForHigh->var0) {
        goto LABEL_12;
      }
    }
    free(v6);
    self->_readContextForHigh->var0 = 0;
    readContextForHigh = self->_readContextForHigh;
    if (readContextForHigh)
    {
LABEL_12:
      free(readContextForHigh);
      self->_readContextForHigh = 0;
    }
  }
  readContextForIsochronous = self->_readContextForIsochronous;
  if (readContextForIsochronous)
  {
    uint64_t v8 = (void **)readContextForIsochronous->var0;
    if (!readContextForIsochronous->var0) {
      goto LABEL_18;
    }
    if (*v8)
    {
      free(*v8);
      *(void *)self->_readContextForIsochronous->var0 = 0;
      readContextForIsochronous = self->_readContextForIsochronous;
      uint64_t v8 = (void **)readContextForIsochronous->var0;
      if (!readContextForIsochronous->var0) {
        goto LABEL_18;
      }
    }
    free(v8);
    self->_readContextForIsochronous->var0 = 0;
    readContextForIsochronous = self->_readContextForIsochronous;
    if (readContextForIsochronous)
    {
LABEL_18:
      free(readContextForIsochronous);
      self->_readContextForIsochronous = 0;
    }
  }
  writeContextForMedium = self->_writeContextForMedium;
  if (writeContextForMedium)
  {
    var3 = (void **)writeContextForMedium->var3;
    if (!var3) {
      goto LABEL_26;
    }
    if (*var3)
    {
      free(*var3);
      *(void *)self->_writeContextForMedium->var3 = 0;
      var3 = (void **)self->_writeContextForMedium->var3;
    }
    if (var3[1]
      && (free(var3[1]),
          *((void *)self->_writeContextForMedium->var3 + 1) = 0,
          writeContextForMedium = self->_writeContextForMedium,
          (var3 = (void **)writeContextForMedium->var3) == 0)
      || (free(var3),
          self->_writeContextForMedium->var3 = 0,
          (writeContextForMedium = self->_writeContextForMedium) != 0))
    {
LABEL_26:
      free(writeContextForMedium);
      self->_writeContextForMedium = 0;
    }
  }
  writeContextForHigh = self->_writeContextForHigh;
  if (writeContextForHigh)
  {
    uint64_t v12 = (void **)writeContextForHigh->var3;
    if (!v12) {
      goto LABEL_34;
    }
    if (*v12)
    {
      free(*v12);
      *(void *)self->_writeContextForHigh->var3 = 0;
      uint64_t v12 = (void **)self->_writeContextForHigh->var3;
    }
    if (v12[1]
      && (free(v12[1]),
          *((void *)self->_writeContextForHigh->var3 + 1) = 0,
          writeContextForHigh = self->_writeContextForHigh,
          (uint64_t v12 = (void **)writeContextForHigh->var3) == 0)
      || (free(v12), self->_writeContextForHigh->var3 = 0, (writeContextForHigh = self->_writeContextForHigh) != 0))
    {
LABEL_34:
      free(writeContextForHigh);
      self->_writeContextForHigh = 0;
    }
  }
  writeContextForIsochronous = self->_writeContextForIsochronous;
  if (writeContextForIsochronous)
  {
    os_log_t v14 = (void **)writeContextForIsochronous->var3;
    if (!v14) {
      goto LABEL_42;
    }
    if (*v14)
    {
      free(*v14);
      *(void *)self->_writeContextForIsochronous->var3 = 0;
      os_log_t v14 = (void **)self->_writeContextForIsochronous->var3;
    }
    if (v14[1]
      && (free(v14[1]),
          *((void *)self->_writeContextForIsochronous->var3 + 1) = 0,
          writeContextForIsochronous = self->_writeContextForIsochronous,
          (os_log_t v14 = (void **)writeContextForIsochronous->var3) == 0)
      || (free(v14),
          self->_writeContextForIsochronous->var3 = 0,
          (writeContextForIsochronous = self->_writeContextForIsochronous) != 0))
    {
LABEL_42:
      free(writeContextForIsochronous);
      self->_writeContextForIsochronous = 0;
    }
  }
  os_log_t v15 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
  os_log_t v16 = v15;
  if (sNRCopyLogToStdErr)
  {

LABEL_46:
    os_log_t v18 = _NRCopyLogObjectForNRUUID(self->_nrUUID);
    _NRLogWithArgs((uint64_t)v18, 0, (uint64_t)"%s%.30s:%-4d Dealloc", v19, v20, v21, v22, v23, (uint64_t)"");

    goto LABEL_47;
  }
  BOOL v17 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v17) {
    goto LABEL_46;
  }
LABEL_47:
  uint64_t v24 = self->_nrUUID;
  os_unfair_lock_lock(&sNRLogLock);
  [(id)sNRUUIDsEligibleForLogObject removeObject:v24];

  os_unfair_lock_unlock(&sNRLogLock);
  v25.receiver = self;
  v25.super_class = (Class)NRBluetoothPacketParser;
  [(NRBluetoothPacketParser *)&v25 dealloc];
}

- (BOOL)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__NRBluetoothPacketParser_start__block_invoke;
  block[3] = &unk_263FD1360;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

void __32__NRBluetoothPacketParser_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(unsigned char *)(v2 + 8) == 4 || *(unsigned char *)(v2 + 9)) {
      return;
    }
    *(unsigned char *)(v2 + 9) = 1;
    os_log_t v3 = *(void **)(a1 + 32);
  }
  else
  {
    os_log_t v3 = 0;
  }
  objc_initWeak(&location, v3);
  os_log_t v4 = [NRXPCComm alloc];
  BOOL v5 = *(void **)(a1 + 32);
  if (v5) {
    BOOL v5 = (void *)v5[4];
  }
  os_log_t v6 = v5;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    uint64_t v7 = (void *)v7[7];
  }
  uint64_t v8 = v7;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __32__NRBluetoothPacketParser_start__block_invoke_2;
  v17[3] = &unk_263FD1100;
  objc_copyWeak(&v18, &location);
  uint64_t v9 = [(NRXPCComm *)v4 initWithDeviceIdentifier:v6 notificationQueue:v8 notificationBlock:v17];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 400);
  *(void *)(v10 + 400) = v9;

  [*(id *)(*(void *)(a1 + 32) + 400) activate];
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    if (!*(void *)(v12 + 656))
    {
      uint64_t v13 = *(id *)(v12 + 56);
      dispatch_source_t v14 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v13);
      os_log_t v15 = *(void **)(v12 + 656);
      *(void *)(v12 + 656) = v14;

      dispatch_source_set_timer(*(dispatch_source_t *)(v12 + 656), 0, 0x12A05F200uLL, 0x1DCD6500uLL);
      objc_initWeak(&from, (id)v12);
      os_log_t v16 = *(NSObject **)(v12 + 656);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __44__NRBluetoothPacketParser_armLinkStatsTimer__block_invoke;
      handler[3] = &unk_263FD1128;
      objc_copyWeak(v21, &from);
      v21[1] = (id)5;
      dispatch_source_set_event_handler(v16, handler);
      dispatch_resume(*(dispatch_object_t *)(v12 + 656));
      objc_destroyWeak(v21);
      objc_destroyWeak(&from);
    }
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __32__NRBluetoothPacketParser_start__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v1024 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = (uint64_t)WeakRetained;
  if (!WeakRetained || *((unsigned char *)WeakRetained + 8) == 4) {
    goto LABEL_348;
  }
  os_log_t v6 = WeakRetained + 5;
  os_log_t v7 = _NRCopyLogObjectForNRUUID(WeakRetained[5]);
  os_log_t v8 = v7;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (!v9) {
      goto LABEL_7;
    }
  }
  os_log_t v10 = _NRCopyLogObjectForNRUUID(*v6);
  _NRLogWithArgs((uint64_t)v10, 0, (uint64_t)"%s%.30s:%-4d Received notification: %@", v11, v12, v13, v14, v15, (uint64_t)"");

LABEL_7:
  os_log_t v16 = [v3 objectForKeyedSubscript:@"packet-logging"];

  if (v16)
  {
    BOOL v17 = [v3 objectForKeyedSubscript:@"packet-logging"];
    gNRPacketLoggingEnabled = [v17 BOOLValue];
  }
  id v18 = [v3 objectForKeyedSubscript:@"test-wake-pkt"];

  if (v18)
  {
    uint64_t v19 = [v3 objectForKeyedSubscript:@"test-wake-pkt"];
    *(unsigned char *)(v5 + 18) = [v19 BOOLValue];
  }
  uint64_t v20 = [v3 objectForKeyedSubscript:@"message"];

  uint64_t v1004 = v5;
  if (!v20) {
    goto LABEL_323;
  }
  if (*(unsigned char *)(v5 + 8) == 1) {
    -[NRBluetoothPacketParser changeStateTo:](v5, 2);
  }
  uint64_t v21 = [v3 objectForKeyedSubscript:@"message"];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"message-data"];
  id v23 = [v21 objectForKeyedSubscript:@"channel-id"];
  v999 = (void **)(v5 + 40);
  uint64_t v996 = (uint64_t)v21;
  if ([v23 integerValue] == 2)
  {
    uint64_t v24 = v22;
    unsigned int v25 = 2;
    uint64_t v26 = 104;
LABEL_18:

    goto LABEL_19;
  }
  if ([v23 integerValue] == 1)
  {
    uint64_t v24 = v22;
    unsigned int v25 = 1;
    uint64_t v26 = 88;
    goto LABEL_18;
  }
  uint64_t v55 = [v23 integerValue];

  if (v55 != 3)
  {
    os_log_t v82 = _NRCopyLogObjectForNRUUID(*v6);
    os_log_t v83 = v82;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      unsigned int v25 = os_log_type_enabled(v82, OS_LOG_TYPE_FAULT);

      if (!v25) {
        goto LABEL_70;
      }
    }
    os_log_t v114 = _NRCopyLogObjectForNRUUID(*v6);
    _NRLogWithArgs((uint64_t)v114, 17, (uint64_t)"Invalid priority %d", v115, v116, v117, v118, v119, 0);

    unsigned int v25 = 0;
LABEL_70:
    id v120 = v23;
    os_log_t v121 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
    os_log_t v122 = v121;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v123 = os_log_type_enabled(v121, OS_LOG_TYPE_ERROR);

      if (!v123)
      {
        int v92 = 1;
        BOOL v93 = (void *)v996;
        uint64_t v66 = v120;
        os_log_t v6 = v999;
        goto LABEL_322;
      }
    }
    os_log_t v124 = _NRCopyLogObjectForNRUUID(*v999);
    StringFromNRLinkChannelPriority = createStringFromNRLinkChannelPriority(v25);
    _NRLogWithArgs((uint64_t)v124, 16, (uint64_t)"%s%.30s:%-4d Invalid read context %sptr for prio %@", v125, v126, v127, v128, v129, (uint64_t)"");

    int v92 = 1;
    BOOL v93 = (void *)v996;
    uint64_t v66 = v120;
    os_log_t v6 = v999;
    goto LABEL_322;
  }
  uint64_t v24 = v22;
  unsigned int v25 = 3;
  uint64_t v26 = 120;
LABEL_19:
  if (!*(void *)(v5 + v26))
  {
    uint64_t v22 = v24;
    goto LABEL_70;
  }
  id v995 = v23;
  os_log_t v27 = _NRCopyLogObjectForNRUUID(*v6);
  os_log_t v28 = v27;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v29 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);

    if (!v29) {
      goto LABEL_24;
    }
  }
  os_log_t v30 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
  _NRLogWithArgs((uint64_t)v30, 1, (uint64_t)"%s%.30s:%-4d Read context: %p", v31, v32, v33, v34, v35, (uint64_t)"");

LABEL_24:
  uint64_t v36 = **(void **)(v5 + v26);
  os_log_t v37 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
  os_log_t v38 = v37;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v39 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);

    if (!v39) {
      goto LABEL_28;
    }
  }
  os_log_t v40 = _NRCopyLogObjectForNRUUID(*v999);
  _NRLogWithArgs((uint64_t)v40, 1, (uint64_t)"%s%.30s:%-4d Link Read context: %p", v41, v42, v43, v44, v45, (uint64_t)"");

LABEL_28:
  if (!v36)
  {
    os_log_t v6 = v999;
    os_log_t v53 = _NRCopyLogObjectForNRUUID(*v999);
    os_log_t v54 = v53;
    if (sNRCopyLogToStdErr)
    {

      uint64_t v22 = v24;
    }
    else
    {
      BOOL v84 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      uint64_t v22 = v24;
      if (!v84)
      {
LABEL_57:
        int v92 = 1;
        uint64_t v66 = v995;
        BOOL v93 = (void *)v996;
        goto LABEL_322;
      }
    }
    os_log_t v85 = _NRCopyLogObjectForNRUUID(*v999);
    BOOL v86 = off_263FD11B8[(v25 - 1)];
    _NRLogWithArgs((uint64_t)v85, 16, (uint64_t)"%s%.30s:%-4d Invalid link-read context ptr for prio %@", v87, v88, v89, v90, v91, (uint64_t)"");

    goto LABEL_57;
  }
  if ((*(unsigned char *)(v36 + 27) & 1) == 0)
  {
    *(unsigned char *)(v36 + 27) |= 1u;
    uint64_t v46 = *(void *)(v5 + v26);
    BOOL v47 = *(void (**)(void))(v46 + 24);
    if (v47) {
      v47(*(void *)(v46 + 32));
    }
  }
  uint64_t v48 = (v25 - 1);
  uint64_t v49 = 16 * v48 + 96;
  v994 = off_263FD11B8[v48];
  uint64_t v50 = *(void *)(v5 + v49);
  os_log_t v51 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
  os_log_t v52 = v51;
  if (!v50)
  {
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v701 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);

      if (!v701)
      {
        int v92 = 1;
        uint64_t v5 = v1004;
        os_log_t v6 = v999;
        goto LABEL_681;
      }
    }
    os_log_t v6 = v999;
    os_log_t v702 = _NRCopyLogObjectForNRUUID(*v999);
    v984 = createStringFromNRLinkChannelPriority(v25);
    _NRLogWithArgs((uint64_t)v702, 16, (uint64_t)"%s%.30s:%-4d Invalid write context %sptr for prio %@", v703, v704, v705, v706, v707, (uint64_t)"");

    int v92 = 1;
    uint64_t v5 = v1004;
LABEL_681:
    uint64_t v22 = v24;
    uint64_t v76 = v994;
    uint64_t v66 = v995;
    goto LABEL_321;
  }
  os_log_t v6 = v999;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v56 = os_log_type_enabled(v51, OS_LOG_TYPE_INFO);

    if (!v56) {
      goto LABEL_41;
    }
  }
  os_log_t v57 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
  _NRLogWithArgs((uint64_t)v57, 1, (uint64_t)"%s%.30s:%-4d Write context: %p", v58, v59, v60, v61, v62, (uint64_t)"");

LABEL_41:
  uint64_t v63 = *(void *)(*(void *)(v5 + v49) + 24);
  os_log_t v64 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
  os_log_t v65 = v64;
  if (v63)
  {
    if (sNRCopyLogToStdErr)
    {

      uint64_t v22 = v24;
    }
    else
    {
      BOOL v67 = os_log_type_enabled(v64, OS_LOG_TYPE_INFO);

      uint64_t v22 = v24;
      if (!v67) {
        goto LABEL_48;
      }
    }
    os_log_t v68 = _NRCopyLogObjectForNRUUID(*v999);
    _NRLogWithArgs((uint64_t)v68, 1, (uint64_t)"%s%.30s:%-4d link Write context: %p", v69, v70, v71, v72, v73, (uint64_t)"");

LABEL_48:
    unint64_t v74 = *(unsigned int *)(v63 + 24);
    uint64_t v75 = *(unsigned int *)(v63 + 28);
    uint64_t v76 = v994;
    if ([v22 length] + v75 <= v74) {
      goto LABEL_62;
    }
    int v77 = *(_DWORD *)(v63 + 28);
    size_t v78 = v77 + [v22 length];
    *(_DWORD *)(v63 + 24) = v78;
    if (v78)
    {
      BOOL v79 = reallocf(*(void **)(v63 + 8), v78);
      if (v79)
      {
        *(void *)(v63 + 8) = 0;
        *(void *)(v63 + 8) = v79;
        os_log_t v80 = _NRCopyLogObjectForNRUUID(*v6);
        os_log_t v81 = v80;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v101 = os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT);

          if (!v101) {
            goto LABEL_62;
          }
        }
        os_log_t v102 = _NRCopyLogObjectForNRUUID(*v6);
        _NRLogWithArgs((uint64_t)v102, 0, (uint64_t)"%s%.30s:%-4d %@ link Write context staging buffer allocated: %u bytes", v103, v104, v105, v106, v107, (uint64_t)"");

LABEL_62:
        memcpy((void *)(*(void *)(v63 + 8) + *(unsigned int *)(v63 + 28)), (const void *)[v22 bytes], objc_msgSend(v22, "length"));
        *(_DWORD *)(v63 + 28) += [v22 length];
        if (*(unsigned char *)(v5 + 8) == 4)
        {
LABEL_320:
          int v92 = 0;
          uint64_t v66 = v995;
          goto LABEL_321;
        }
        v989 = &v985;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
        v990 = (uint64_t *)v22;
        if (v25 == 3)
        {
          v1000 = NRBluetoothPacketParserSuspendNexusVOInputSource;
          int v108 = 1;
          uint64_t v109 = 14;
          uint64_t v110 = 432;
          uint64_t v111 = 304;
          uint64_t v112 = 240;
          uint64_t v113 = 208;
        }
        else if ((0x64656600u >> (8 * v25)) == 101)
        {
          v1000 = NRBluetoothPacketParserSuspendNexusVIInputSource;
          int v108 = 1;
          uint64_t v109 = 15;
          uint64_t v110 = 448;
          uint64_t v111 = 320;
          uint64_t v112 = 256;
          uint64_t v113 = 216;
        }
        else
        {
          if ((0x64656600u >> (8 * v25)) != 102)
          {
            v1009 = 0;
            v1010 = 0;
            v1000 = 0;
            int v108 = 0;
            id v131 = 0;
            uint64_t v130 = 0;
            v992 = 0;
LABEL_77:
            unint64_t v132 = 0x26AB22000uLL;
            if (!gNRPacketLoggingEnabled)
            {
LABEL_78:
              unsigned int v133 = *(unsigned __int8 *)(v5 + 10);
              int v134 = (v133 >> 3) & 1;
              if (v25 != 3) {
                int v134 = 0;
              }
              BOOL v1011 = v134;
              if (v134 == 1)
              {
                v135 = (void *)(v5 + 128);
                v136 = "Isochronous";
                int v137 = 3;
                uint64_t v138 = v130;
                goto LABEL_99;
              }
              uint64_t v138 = v130;
              if (!v108) {
                goto LABEL_96;
              }
              if ((v133 & 4) != 0)
              {
                v135 = (void *)(v5 + 112);
LABEL_98:
                v136 = "High";
                int v137 = 2;
LABEL_99:
                v141 = (void *)*v135;
                id v991 = v131;
                if (v141)
                {
                  uint64_t v142 = v141[3];
                  if ((*(unsigned char *)(v142 + 84) & 1) == 0)
                  {
                    int v986 = v137;
                    v1003 = (void **)v135;
                    uint64_t v1012 = v138;
                    id v987 = v3;
                    v988 = v136;
                    int v143 = 0;
                    __int16 v144 = 0;
                    int v1005 = 0;
                    int v145 = *(unsigned __int8 *)(v142 + 83);
                    v146 = *(char **)(v142 + 8);
                    uint64_t v147 = 568;
                    if (v145 == 3) {
                      uint64_t v147 = 584;
                    }
                    BOOL v148 = v145 == 2;
                    uint64_t v149 = 600;
                    if (!v148) {
                      uint64_t v149 = v147;
                    }
                    uint64_t v1001 = v149;
                    uint64_t v1007 = v1004 + 688;
                    uint64_t v1008 = v1004 + 672;
                    int v150 = 9;
                    v998 = v146;
                    if (!*(unsigned char *)(v132 + 1313)) {
                      goto LABEL_110;
                    }
LABEL_106:
                    os_log_t v151 = _NRCopyLogObjectForNRUUID(*v999);
                    os_log_t v152 = v151;
                    if (sNRCopyLogToStdErr)
                    {

LABEL_109:
                      os_log_t v154 = _NRCopyLogObjectForNRUUID(*v999);
                      _NRLogWithArgs((uint64_t)v154, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v155, v156, v157, v158, v159, (uint64_t)"");

                      goto LABEL_110;
                    }
                    BOOL v153 = os_log_type_enabled(v151, OS_LOG_TYPE_INFO);

                    if (v153) {
                      goto LABEL_109;
                    }
LABEL_110:
                    os_log_t v1006 = 0;
                    os_log_t v160 = 0;
                    uint64_t v1002 = 0;
                    long long v1021 = 0u;
                    long long v1022 = 0u;
                    long long v1019 = 0u;
                    long long v1020 = 0u;
                    if (*(unsigned char *)(v132 + 1313)) {
                      goto LABEL_111;
                    }
                    while (1)
                    {
                      int v170 = v150 | 0x10;
                      if (!v1011)
                      {
                        unsigned int v172 = *(_DWORD *)(v142 + 28);
                        uint64_t v171 = *(unsigned int *)(v142 + 32);
                        if (v172 > v171) {
                          break;
                        }
                      }
LABEL_125:
                      os_log_t next_slot = v1006;
                      if (v1012) {
                        os_log_t next_slot = (os_log_t)os_channel_get_next_slot();
                      }
                      if (!next_slot)
                      {
                        v214 = 0;
                        goto LABEL_162;
                      }
                      while (1)
                      {
                        unsigned int v180 = 0x4000 - *(unsigned __int16 *)(v142 + 80);
                        if (v180 < nrMaxTLVLengthForPacket(v1020, WORD1(v1019)))
                        {
                          v170 |= 0x40u;
                          if (!gNRPacketLoggingEnabled)
                          {
LABEL_160:
                            v214 = next_slot;
                            unint64_t v132 = 0x26AB22000;
                            goto LABEL_162;
                          }
                          os_log_t v250 = _NRCopyLogObjectForNRUUID(*v999);
                          os_log_t v251 = v250;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            LODWORD(v1006) = os_log_type_enabled(v250, OS_LOG_TYPE_INFO);

                            if (!v1006) {
                              goto LABEL_160;
                            }
                          }
                          os_log_t v262 = _NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs((uint64_t)v262, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v263, v264, v265, v266, v267, (uint64_t)"");

                          goto LABEL_160;
                        }
                        os_channel_slot_get_packet();
                        os_packet_get_next_buflet();
                        unsigned int data_offset = os_buflet_get_data_offset();
                        uint64_t object_address = os_buflet_get_object_address();
                        unsigned int data_length = os_buflet_get_data_length();
                        if (data_length >= 0x10000)
                        {
LABEL_617:
                          v675 = nrCopyLogObj_518();
                          v676 = v675;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            BOOL v677 = os_log_type_enabled(v675, OS_LOG_TYPE_ERROR);

                            if (!v677)
                            {
LABEL_622:
                              _os_log_pack_size();
                              MEMORY[0x270FA5388]();
                              __error();
                              uint64_t v684 = _os_log_pack_fill();
                              *(_DWORD *)uint64_t v684 = 136446210;
                              *(void *)(v684 + 4) = "NRBluetoothPacketParserNexusToLinkLoop";
                              goto LABEL_623;
                            }
                          }
                          id v678 = nrCopyLogObj_518();
                          _NRLogWithArgs((uint64_t)v678, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen <= 65535", v679, v680, v681, v682, v683, (uint64_t)"");

                          goto LABEL_622;
                        }
                        unsigned __int16 v184 = data_length;
                        if (!(_WORD)data_length && WORD1(v1019))
                        {
                          unint64_t v1017 = 0;
                          uint64_t v1018 = 0;
                          unint64_t v1017 = *(void *)v142 + *(unsigned __int16 *)(v142 + 80);
                          LODWORD(v1018) = v180;
                          int v185 = nrPacketToTLV((unsigned __int8 *)v1020, WORD1(v1019), (uint64_t)&v1017, 1u, v1008, v1007);
                          unint64_t v132 = 0x26AB22000uLL;
                          if (!gNRPacketLoggingEnabled)
                          {
LABEL_133:
                            v170 |= 0x80u;
                            goto LABEL_139;
                          }
                          os_log_t v190 = _NRCopyLogObjectForNRUUID(*v999);
                          os_log_t v191 = v190;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            BOOL v195 = os_log_type_enabled(v190, OS_LOG_TYPE_INFO);

                            if (!v195) {
                              goto LABEL_133;
                            }
                          }
                          os_log_t v196 = _NRCopyLogObjectForNRUUID(*v999);
                          getESPSequenceNumberFromPacket(v1020, WORD1(v1019));
                          getESPSPIFromPacket(v1020, WORD1(v1019));
                          _NRLogWithArgs((uint64_t)v196, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v197, v198, v199, v200, v201, (uint64_t)"");

                          goto LABEL_133;
                        }
                        if ((_WORD)data_length)
                        {
                          v186 = (unsigned __int8 *)(object_address + data_offset);
                          unint64_t v1017 = 0;
                          uint64_t v1018 = 0;
                          unint64_t v1017 = *(void *)v142 + *(unsigned __int16 *)(v142 + 80);
                          LODWORD(v1018) = v180;
                          int v185 = nrPacketToTLV(v186, (unsigned __int16)data_length, (uint64_t)&v1017, 1u, v1008, v1007);
                          unint64_t v132 = 0x26AB22000uLL;
                          if (!gNRPacketLoggingEnabled)
                          {
LABEL_136:
                            v170 |= 0x100u;
                            goto LABEL_139;
                          }
                          os_log_t v192 = _NRCopyLogObjectForNRUUID(*v999);
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            os_log_t v1006 = v192;
                            LODWORD(ESPSequenceNumberFromPacket) = os_log_type_enabled(v192, OS_LOG_TYPE_INFO);

                            if (!ESPSequenceNumberFromPacket) {
                              goto LABEL_136;
                            }
                          }
                          os_log_t v1006 = _NRCopyLogObjectForNRUUID(*v999);
                          uint64_t ESPSequenceNumberFromPacket = getESPSequenceNumberFromPacket((uint64_t)v186, v184);
                          getESPSPIFromPacket((uint64_t)v186, v184);
                          os_log_t v202 = v1006;
                          _NRLogWithArgs((uint64_t)v1006, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v203, v204, v205, v206, v207, (uint64_t)"");

                          goto LABEL_136;
                        }
                        v170 |= 0x200u;
                        unint64_t v132 = 0x26AB22000uLL;
                        if (!gNRPacketLoggingEnabled) {
                          goto LABEL_138;
                        }
                        os_log_t v193 = _NRCopyLogObjectForNRUUID(*v999);
                        os_log_t v194 = v193;
                        if (sNRCopyLogToStdErr)
                        {

LABEL_157:
                          os_log_t v208 = _NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs((uint64_t)v208, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v209, v210, v211, v212, v213, (uint64_t)"");

LABEL_138:
                          int v185 = 0;
                          goto LABEL_139;
                        }
                        int v185 = os_log_type_enabled(v193, OS_LOG_TYPE_INFO);

                        if (v185) {
                          goto LABEL_157;
                        }
LABEL_139:
                        *(_WORD *)(v142 + 80) += v185;
                        uint64_t v187 = v1011 ? 0 : os_channel_get_next_slot();
                        ++v144;
                        ++*v1009;
                        unsigned char *v1010 = 1;
                        v143 += v185;
                        if (!v187) {
                          break;
                        }
                        unsigned int v188 = *(unsigned __int8 *)(v142 + 82);
                        if (v188 >= 0xB)
                        {
                          unsigned int v188 = *(unsigned __int8 *)(v142 + 82)
                               - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v142 + 82)) >> 32);
                          *(unsigned char *)(v142 + 82) = v188;
                        }
                        *(_DWORD *)(v142 + 4 * v188 + 36) = v170;
                        unsigned int v189 = (117 * (*(unsigned char *)(v142 + 82) + 1)) >> 8;
                        *(unsigned char *)(v142 + 82) = *(unsigned char *)(v142 + 82)
                                              + 1
                                              - 11
                                              * ((v189
                                                + (((*(unsigned char *)(v142 + 82) + 1 - v189) & 0xFE) >> 1)) >> 3);
                        os_log_t v160 = next_slot;
                        os_log_t next_slot = (os_log_t)v187;
                        int v170 = 0;
                      }
                      v214 = 0;
                      os_log_t v160 = next_slot;
LABEL_162:
                      int v215 = *(unsigned __int16 *)(v142 + 80);
                      LODWORD(v216) = *(_WORD *)(v142 + 80) != 0;
                      if (!*(_WORD *)(v142 + 80))
                      {
                        int v218 = v170 | 0x400;
                        if (*(unsigned char *)(v132 + 1313))
                        {
                          LODWORD(ESPSequenceNumberFromPacket) = *(_WORD *)(v142 + 80) != 0;
                          os_log_t v302 = _NRCopyLogObjectForNRUUID(*v999);
                          os_log_t v303 = v302;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_243;
                          }
                          BOOL v304 = os_log_type_enabled(v302, OS_LOG_TYPE_INFO);

                          if (v304)
                          {
LABEL_243:
                            os_log_t v305 = _NRCopyLogObjectForNRUUID(*v999);
                            _NRLogWithArgs((uint64_t)v305, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v306, v307, v308, v309, v310, (uint64_t)"");
                          }
                          unint64_t v132 = 0x26AB22000uLL;
                          LODWORD(v216) = ESPSequenceNumberFromPacket;
LABEL_245:
                          BOOL v300 = v215 == 0;
                          if (!*(unsigned char *)(v132 + 1313))
                          {
                            int v301 = v218 | 0x8000;
                            if (v160) {
                              goto LABEL_247;
                            }
                            goto LABEL_238;
                          }
                          int v313 = v216;
                          os_log_t v314 = _NRCopyLogObjectForNRUUID(*v999);
                          os_log_t v315 = v314;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_263;
                          }
                          BOOL v318 = os_log_type_enabled(v314, OS_LOG_TYPE_INFO);

                          if (v318)
                          {
LABEL_263:
                            os_log_t v319 = _NRCopyLogObjectForNRUUID(*v999);
                            _NRLogWithArgs((uint64_t)v319, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v320, v321, v322, v323, v324, (uint64_t)"");
                          }
                          LODWORD(v216) = v313;
                          int v301 = v218 | 0x8000;
                          if (v160) {
                            goto LABEL_247;
                          }
LABEL_238:
                          if (*(unsigned char *)(v1004 + 13)) {
                            goto LABEL_248;
                          }
                          goto LABEL_253;
                        }
                        LODWORD(v216) = 0;
                        BOOL v300 = 1;
                        int v301 = v218 | 0x8000;
                        if (!v160) {
                          goto LABEL_238;
                        }
LABEL_247:
                        os_channel_advance_slot();
                        *(unsigned char *)(v1004 + 13) = 1;
LABEL_248:
                        if (v1005 > 8u
                          || v1012 && os_channel_available_slot_count() <= 1)
                        {
                          if (!gNRPacketLoggingEnabled) {
                            goto LABEL_252;
                          }
                          int v316 = v216;
                          os_log_t v317 = _NRCopyLogObjectForNRUUID(*v999);
                          uint64_t v216 = (uint64_t)v317;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_267;
                          }
                          BOOL v325 = os_log_type_enabled(v317, OS_LOG_TYPE_INFO);

                          LODWORD(v216) = v316;
                          if (v325)
                          {
LABEL_267:
                            uint64_t v216 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v1004 + 40));
                            _NRLogWithArgs(v216, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v326, v327, v328, v329, v330, (uint64_t)"");

                            LODWORD(v216) = v316;
                          }
LABEL_252:
                          int v301 = v218 | 0x18000;
                          os_channel_sync();
                          *(unsigned char *)(v1004 + 13) = 0;
                        }
LABEL_253:
                        if ((v216 & v300) != 1)
                        {
                          if (!gNRPacketLoggingEnabled) {
                            goto LABEL_275;
                          }
                          char v756 = v216;
                          os_log_t v757 = _NRCopyLogObjectForNRUUID(*v999);
                          uint64_t v216 = (uint64_t)v757;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_716;
                          }
                          BOOL v763 = os_log_type_enabled(v757, OS_LOG_TYPE_INFO);

                          LOBYTE(v216) = v756;
                          if (v763)
                          {
LABEL_716:
                            uint64_t v216 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                            _NRLogWithArgs(v216, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v764, v765, v766, v767, v768, (uint64_t)"");

                            LOBYTE(v216) = v756;
                          }
LABEL_275:
                          id v3 = v987;
                          uint64_t v5 = v1004;
                          v332 = v999;
                          uint64_t v76 = v994;
                          if (v216) {
                            goto LABEL_314;
                          }
                          if (v986 == 1)
                          {
                            uint64_t v337 = *(void *)(v1004 + 136);
                            if ((*(unsigned char *)(v1004 + 10) & 4) == 0) {
                              goto LABEL_298;
                            }
                            goto LABEL_306;
                          }
                          if (v986 != 2)
                          {
                            if (v986 == 3)
                            {
                              uint64_t v333 = *(void *)(v1004 + 136);
                              if ((v333 & 8) != 0 && *(void *)(v1004 + 304))
                              {
                                v334 = (dispatch_object_t *)(v1004 + 304);
                                *(void *)(v1004 + 136) = v333 & 0xFFFFFFFFFFFFFFF7;
                                if (gNRPacketLoggingEnabled)
                                {
                                  os_log_t v335 = _NRCopyLogObjectForNRUUID(*v332);
                                  os_log_t v336 = v335;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    goto LABEL_769;
                                  }
                                  BOOL v880 = os_log_type_enabled(v335, OS_LOG_TYPE_INFO);

                                  if (v880)
                                  {
LABEL_769:
                                    os_log_t v837 = _NRCopyLogObjectForNRUUID(*v999);
                                    _NRLogWithArgs((uint64_t)v837, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v881, v882, v883, v884, v885, (uint64_t)"");
                                    goto LABEL_772;
                                  }
                                  goto LABEL_773;
                                }
                                goto LABEL_313;
                              }
                              goto LABEL_314;
                            }
                            uint64_t v337 = *(void *)(v1004 + 136);
LABEL_298:
                            if ((v337 & 8) != 0 && *(void *)(v1004 + 304))
                            {
                              *(void *)(v1004 + 136) = v337 & 0xFFFFFFFFFFFFFFF7;
                              if (!gNRPacketLoggingEnabled) {
                                goto LABEL_301;
                              }
                              os_log_t v826 = _NRCopyLogObjectForNRUUID(*v332);
                              os_log_t v827 = v826;
                              if (sNRCopyLogToStdErr)
                              {

                                id v3 = v987;
                                uint64_t v5 = v1004;
                                v332 = v999;
                                uint64_t v76 = v994;
                                goto LABEL_759;
                              }
                              BOOL v850 = os_log_type_enabled(v826, OS_LOG_TYPE_INFO);

                              id v3 = v987;
                              uint64_t v5 = v1004;
                              v332 = v999;
                              uint64_t v76 = v994;
                              if (v850)
                              {
LABEL_759:
                                os_log_t v851 = _NRCopyLogObjectForNRUUID(*v332);
                                _NRLogWithArgs((uint64_t)v851, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v852, v853, v854, v855, v856, (uint64_t)"");
                              }
LABEL_301:
                              dispatch_resume(*(dispatch_object_t *)(v5 + 304));
                              uint64_t v337 = *(void *)(v5 + 136);
                            }
                            if ((v337 & 0x10) != 0 && *(void *)(v5 + 320))
                            {
                              *(void *)(v5 + 136) = v337 & 0xFFFFFFFFFFFFFFEFLL;
                              if (!gNRPacketLoggingEnabled) {
                                goto LABEL_305;
                              }
                              os_log_t v828 = _NRCopyLogObjectForNRUUID(*v332);
                              os_log_t v829 = v828;
                              if (sNRCopyLogToStdErr)
                              {

                                id v3 = v987;
                                uint64_t v5 = v1004;
                                v332 = v999;
                                uint64_t v76 = v994;
                                goto LABEL_761;
                              }
                              BOOL v857 = os_log_type_enabled(v828, OS_LOG_TYPE_INFO);

                              id v3 = v987;
                              uint64_t v5 = v1004;
                              v332 = v999;
                              uint64_t v76 = v994;
                              if (v857)
                              {
LABEL_761:
                                os_log_t v858 = _NRCopyLogObjectForNRUUID(*v332);
                                _NRLogWithArgs((uint64_t)v858, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v859, v860, v861, v862, v863, (uint64_t)"");
                              }
LABEL_305:
                              dispatch_resume(*(dispatch_object_t *)(v5 + 320));
                              uint64_t v337 = *(void *)(v5 + 136);
                            }
LABEL_306:
                            if ((v337 & 0x20) != 0 && *(void *)(v5 + 336))
                            {
                              *(void *)(v5 + 136) = v337 & 0xFFFFFFFFFFFFFFDFLL;
                              if (!gNRPacketLoggingEnabled) {
                                goto LABEL_309;
                              }
                              os_log_t v815 = _NRCopyLogObjectForNRUUID(*v332);
                              os_log_t v816 = v815;
                              if (sNRCopyLogToStdErr)
                              {

                                id v3 = v987;
                                uint64_t v5 = v1004;
                                v332 = v999;
                                uint64_t v76 = v994;
                                goto LABEL_757;
                              }
                              BOOL v843 = os_log_type_enabled(v815, OS_LOG_TYPE_INFO);

                              id v3 = v987;
                              uint64_t v5 = v1004;
                              v332 = v999;
                              uint64_t v76 = v994;
                              if (v843)
                              {
LABEL_757:
                                os_log_t v844 = _NRCopyLogObjectForNRUUID(*v332);
                                _NRLogWithArgs((uint64_t)v844, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v845, v846, v847, v848, v849, (uint64_t)"");
                              }
LABEL_309:
                              dispatch_resume(*(dispatch_object_t *)(v5 + 336));
                              uint64_t v337 = *(void *)(v5 + 136);
                            }
                            if ((v337 & 0x40) != 0 && *(void *)(v5 + 352))
                            {
                              v334 = (dispatch_object_t *)(v5 + 352);
                              *(void *)(v5 + 136) = v337 & 0xFFFFFFFFFFFFFFBFLL;
                              if (gNRPacketLoggingEnabled)
                              {
                                os_log_t v817 = _NRCopyLogObjectForNRUUID(*v332);
                                os_log_t v818 = v817;
                                if (sNRCopyLogToStdErr)
                                {
                                }
                                else
                                {
                                  BOOL v836 = os_log_type_enabled(v817, OS_LOG_TYPE_INFO);

                                  if (!v836) {
                                    goto LABEL_773;
                                  }
                                }
                                os_log_t v837 = _NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs((uint64_t)v837, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v838, v839, v840, v841, v842, (uint64_t)"");
                                goto LABEL_772;
                              }
                              goto LABEL_313;
                            }
                            goto LABEL_314;
                          }
                          uint64_t v338 = *(void *)(v1004 + 136);
                          if ((v338 & 8) != 0 && *(void *)(v1004 + 304))
                          {
                            *(void *)(v1004 + 136) = v338 & 0xFFFFFFFFFFFFFFF7;
                            if (!gNRPacketLoggingEnabled) {
                              goto LABEL_291;
                            }
                            os_log_t v834 = _NRCopyLogObjectForNRUUID(*v332);
                            os_log_t v835 = v834;
                            if (sNRCopyLogToStdErr)
                            {

                              id v3 = v987;
                              uint64_t v5 = v1004;
                              v332 = v999;
                              uint64_t v76 = v994;
                              goto LABEL_775;
                            }
                            BOOL v892 = os_log_type_enabled(v834, OS_LOG_TYPE_INFO);

                            id v3 = v987;
                            uint64_t v5 = v1004;
                            v332 = v999;
                            uint64_t v76 = v994;
                            if (v892)
                            {
LABEL_775:
                              os_log_t v893 = _NRCopyLogObjectForNRUUID(*v332);
                              _NRLogWithArgs((uint64_t)v893, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v894, v895, v896, v897, v898, (uint64_t)"");
                            }
LABEL_291:
                            dispatch_resume(*(dispatch_object_t *)(v5 + 304));
                            uint64_t v338 = *(void *)(v5 + 136);
                          }
                          if ((v338 & 0x10) != 0 && *(void *)(v5 + 320))
                          {
                            v334 = (dispatch_object_t *)(v5 + 320);
                            *(void *)(v5 + 136) = v338 & 0xFFFFFFFFFFFFFFEFLL;
                            if (gNRPacketLoggingEnabled)
                            {
                              os_log_t v339 = _NRCopyLogObjectForNRUUID(*v332);
                              os_log_t v340 = v339;
                              if (sNRCopyLogToStdErr)
                              {
                              }
                              else
                              {
                                BOOL v886 = os_log_type_enabled(v339, OS_LOG_TYPE_INFO);

                                if (!v886) {
                                  goto LABEL_773;
                                }
                              }
                              os_log_t v837 = _NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs((uint64_t)v837, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v887, v888, v889, v890, v891, (uint64_t)"");
LABEL_772:

LABEL_773:
                              id v3 = v987;
                              uint64_t v5 = v1004;
                              v332 = v999;
                              uint64_t v76 = v994;
                            }
LABEL_313:
                            dispatch_resume(*v334);
                          }
LABEL_314:
                          int v341 = v301 | 0x60000;
                          if (gNRPacketLoggingEnabled)
                          {
                            os_log_t v758 = _NRCopyLogObjectForNRUUID(*v332);
                            os_log_t v759 = v758;
                            if (sNRCopyLogToStdErr)
                            {

                              id v3 = v987;
                              uint64_t v5 = v1004;
                              v332 = v999;
                              uint64_t v76 = v994;
                            }
                            else
                            {
                              BOOL v769 = os_log_type_enabled(v758, OS_LOG_TYPE_INFO);

                              id v3 = v987;
                              uint64_t v5 = v1004;
                              v332 = v999;
                              uint64_t v76 = v994;
                              if (!v769) {
                                goto LABEL_315;
                              }
                            }
                            os_log_t v770 = _NRCopyLogObjectForNRUUID(*v332);
                            _NRLogWithArgs((uint64_t)v770, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v771, v772, v773, v774, v775, (uint64_t)"");
                          }
LABEL_315:
                          unsigned int v342 = *(unsigned __int8 *)(v142 + 82);
                          os_log_t v6 = v332;
                          if (v342 >= 0xB)
                          {
                            unsigned int v342 = *(unsigned __int8 *)(v142 + 82)
                                 - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v142 + 82)) >> 32);
                            *(unsigned char *)(v142 + 82) = v342;
                          }
                          *(_DWORD *)(v142 + 4 * v342 + 36) = v341;
LABEL_318:
                          unsigned int v343 = (117 * (*(unsigned char *)(v142 + 82) + 1)) >> 8;
                          *(unsigned char *)(v142 + 82) = *(unsigned char *)(v142 + 82)
                                                + 1
                                                - 11
                                                * ((v343
                                                  + (((*(unsigned char *)(v142 + 82) + 1 - v343) & 0xFE) >> 1)) >> 3);
                          goto LABEL_319;
                        }
                        unsigned int v311 = *(unsigned __int8 *)(v142 + 82);
                        unint64_t v132 = 0x26AB22000uLL;
                        if (v311 >= 0xB)
                        {
                          unsigned int v311 = *(unsigned __int8 *)(v142 + 82)
                               - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v142 + 82)) >> 32);
                          *(unsigned char *)(v142 + 82) = v311;
                        }
                        *(_DWORD *)(v142 + 4 * v311 + 36) = v301;
                        unsigned int v312 = (117 * (*(unsigned char *)(v142 + 82) + 1)) >> 8;
                        *(unsigned char *)(v142 + 82) = *(unsigned char *)(v142 + 82)
                                              + 1
                                              - 11
                                              * ((v312
                                                + (((*(unsigned char *)(v142 + 82) + 1 - v312) & 0xFE) >> 1)) >> 3);
                        int v150 = 8;
                        if (gNRPacketLoggingEnabled) {
                          goto LABEL_106;
                        }
                        goto LABEL_110;
                      }
                      os_log_t v1006 = v214;
                      unint64_t v1017 = 0;
                      if (!*(unsigned char *)(v132 + 1313)) {
                        goto LABEL_164;
                      }
                      int v235 = v216;
                      os_log_t v236 = _NRCopyLogObjectForNRUUID(*v999);
                      uint64_t v216 = (uint64_t)v236;
                      if (sNRCopyLogToStdErr)
                      {

                        goto LABEL_205;
                      }
                      LODWORD(ESPSequenceNumberFromPacket) = os_log_type_enabled(v236, OS_LOG_TYPE_INFO);

                      LODWORD(v216) = v235;
                      if (ESPSequenceNumberFromPacket)
                      {
LABEL_205:
                        uint64_t v216 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs(v216, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v240, v241, v242, v243, v244, (uint64_t)"");

                        LODWORD(v216) = v235;
                      }
LABEL_164:
                      char v217 = ((uint64_t (*)(void, void, void, unint64_t *, void, void))(*v1003)[1])(**v1003, *(void *)v142, *(unsigned __int16 *)(v142 + 80), &v1017, 0, 0);
                      if (*(unsigned char *)(v132 + 1313))
                      {
                        LODWORD(ESPSequenceNumberFromPacket) = v216;
                        os_log_t v237 = _NRCopyLogObjectForNRUUID(*v999);
                        uint64_t v216 = (uint64_t)v237;
                        if (sNRCopyLogToStdErr)
                        {
                        }
                        else
                        {
                          LODWORD(v993) = os_log_type_enabled(v237, OS_LOG_TYPE_INFO);

                          LODWORD(v216) = ESPSequenceNumberFromPacket;
                          if (!v993) {
                            goto LABEL_165;
                          }
                        }
                        uint64_t v216 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs(v216, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v245, v246, v247, v248, v249, (uint64_t)"");

                        LODWORD(v216) = ESPSequenceNumberFromPacket;
                      }
LABEL_165:
                      if (v217)
                      {
                        int v218 = v170 | 0x800;
                        unint64_t v219 = v1017;
                        if (!v1017) {
                          goto LABEL_193;
                        }
LABEL_187:
                        if (v219 < *(unsigned __int16 *)(v142 + 80))
                        {
                          if (!*(unsigned char *)(v132 + 1313)) {
                            goto LABEL_189;
                          }
                          LODWORD(ESPSequenceNumberFromPacket) = v216;
                          os_log_t v252 = _NRCopyLogObjectForNRUUID(*v999);
                          uint64_t v216 = (uint64_t)v252;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_223;
                          }
                          LODWORD(v993) = os_log_type_enabled(v252, OS_LOG_TYPE_INFO);

                          LODWORD(v216) = ESPSequenceNumberFromPacket;
                          if (v993)
                          {
LABEL_223:
                            uint64_t v216 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                            _NRLogWithArgs(v216, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v268, v269, v270, v271, v272, (uint64_t)"");

                            LODWORD(v216) = ESPSequenceNumberFromPacket;
                          }
LABEL_189:
                          v218 |= 0x2000u;
                          memmove(*(void **)v142, (const void *)(*(void *)v142 + v1017), *(unsigned __int16 *)(v142 + 80) - v1017);
                          unint64_t v232 = v1017;
                          *(_WORD *)(v142 + 80) -= v1017;
                          uint64_t v1002 = (v1002 + 1);
LABEL_192:
                          *(void *)(v1004 + v1001) += v232;
                          goto LABEL_193;
                        }
                        if (!*(unsigned char *)(v132 + 1313))
                        {
LABEL_191:
                          v218 |= 0x4000u;
                          *(_WORD *)(v142 + 80) = 0;
                          unint64_t v232 = v1017;
                          goto LABEL_192;
                        }
                        LODWORD(ESPSequenceNumberFromPacket) = v216;
                        os_log_t v253 = _NRCopyLogObjectForNRUUID(*v999);
                        uint64_t v216 = (uint64_t)v253;
                        if (sNRCopyLogToStdErr)
                        {
                        }
                        else
                        {
                          LODWORD(v993) = os_log_type_enabled(v253, OS_LOG_TYPE_INFO);

                          LODWORD(v216) = ESPSequenceNumberFromPacket;
                          if (!v993) {
                            goto LABEL_191;
                          }
                        }
                        uint64_t v216 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                        _NRLogWithArgs(v216, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v273, v274, v275, v276, v277, (uint64_t)"");

                        LODWORD(v216) = ESPSequenceNumberFromPacket;
                        goto LABEL_191;
                      }
                      if (v1000) {
                        v1000(v1004);
                      }
                      *(unsigned char *)(v142 + 84) |= 1u;
                      switch(*(unsigned char *)(v142 + 83))
                      {
                        case 0:
                          LODWORD(ESPSequenceNumberFromPacket) = v216;
                          os_log_t v220 = _NRCopyLogObjectForNRUUID(*v999);
                          uint64_t v216 = (uint64_t)v220;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            LODWORD(v993) = os_log_type_enabled(v220, OS_LOG_TYPE_ERROR);

                            LODWORD(v216) = ESPSequenceNumberFromPacket;
                            if (!v993) {
                              goto LABEL_185;
                            }
                          }
                          uint64_t v216 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs(v216, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v227, v228, v229, v230, v231, (uint64_t)"");
                          goto LABEL_184;
                        case 1:
                          uint64_t v225 = v1004;
                          uint64_t v226 = *(void *)(v1004 + 136);
                          ++*(void *)(v1004 + 144);
                          *(void *)(v225 + 136) = v226 & 0xFFFFFFFFFFFFFFFELL | *(unsigned char *)(v142 + 84) & 1;
                          if (!*(unsigned char *)(v132 + 1313)) {
                            goto LABEL_180;
                          }
                          LODWORD(ESPSequenceNumberFromPacket) = v216;
                          os_log_t v278 = _NRCopyLogObjectForNRUUID(*v999);
                          uint64_t v216 = (uint64_t)v278;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            LODWORD(v993) = os_log_type_enabled(v278, OS_LOG_TYPE_INFO);

                            LODWORD(v216) = ESPSequenceNumberFromPacket;
                            if (!v993) {
                              goto LABEL_185;
                            }
                          }
                          uint64_t v216 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs(v216, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v295, v296, v297, v298, v299, (uint64_t)"");
                          goto LABEL_184;
                        case 2:
                          uint64_t v221 = v1004;
                          ++*(void *)(v1004 + 160);
                          *(void *)(v221 + 136) = *(void *)(v221 + 136) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(unsigned char *)(v142 + 84) & 1));
                          if (!*(unsigned char *)(v132 + 1313)) {
                            goto LABEL_180;
                          }
                          LODWORD(ESPSequenceNumberFromPacket) = v216;
                          os_log_t v222 = _NRCopyLogObjectForNRUUID(*v999);
                          uint64_t v216 = (uint64_t)v222;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            LODWORD(v993) = os_log_type_enabled(v222, OS_LOG_TYPE_INFO);

                            LODWORD(v216) = ESPSequenceNumberFromPacket;
                            if (!v993) {
                              goto LABEL_185;
                            }
                          }
                          uint64_t v216 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs(v216, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v285, v286, v287, v288, v289, (uint64_t)"");
                          goto LABEL_184;
                        case 3:
                          uint64_t v223 = v1004;
                          ++*(void *)(v1004 + 176);
                          *(void *)(v223 + 136) = *(void *)(v223 + 136) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(unsigned char *)(v142 + 84) & 1));
                          if (!*(unsigned char *)(v132 + 1313))
                          {
LABEL_180:
                            int v218 = v170 | 0x1800;
                            unint64_t v219 = v1017;
                            if (v1017) {
                              goto LABEL_187;
                            }
                            break;
                          }
                          LODWORD(ESPSequenceNumberFromPacket) = v216;
                          os_log_t v224 = _NRCopyLogObjectForNRUUID(*v999);
                          uint64_t v216 = (uint64_t)v224;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            LODWORD(v993) = os_log_type_enabled(v224, OS_LOG_TYPE_INFO);

                            LODWORD(v216) = ESPSequenceNumberFromPacket;
                            if (!v993) {
                              goto LABEL_185;
                            }
                          }
                          uint64_t v216 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs(v216, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v290, v291, v292, v293, v294, (uint64_t)"");
LABEL_184:

                          LODWORD(v216) = ESPSequenceNumberFromPacket;
LABEL_185:
                          int v218 = v170 | 0x1800;
                          if (!*(unsigned char *)(v132 + 1313))
                          {
                            unint64_t v219 = v1017;
                            if (!v1017) {
                              break;
                            }
                            goto LABEL_187;
                          }
                          LODWORD(ESPSequenceNumberFromPacket) = v216;
                          os_log_t v238 = _NRCopyLogObjectForNRUUID(*v999);
                          os_log_t v239 = v238;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            LODWORD(v993) = os_log_type_enabled(v238, OS_LOG_TYPE_INFO);

                            if (!v993) {
                              goto LABEL_218;
                            }
                          }
                          os_log_t v256 = _NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs((uint64_t)v256, 1, (uint64_t)"%s%.30s:%-4d ", v257, v258, v259, v260, v261, (uint64_t)"");

LABEL_218:
                          LODWORD(v216) = ESPSequenceNumberFromPacket;
                          unint64_t v219 = v1017;
                          if (v1017) {
                            goto LABEL_187;
                          }
                          break;
                        default:
                          goto LABEL_185;
                      }
LABEL_193:
                      ++v1005;
                      if ((v217 & 1) == 0) {
                        goto LABEL_245;
                      }
                      unsigned int v233 = *(unsigned __int8 *)(v142 + 82);
                      if (v233 >= 0xB)
                      {
                        unsigned int v233 = *(unsigned __int8 *)(v142 + 82)
                             - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v142 + 82)) >> 32);
                        *(unsigned char *)(v142 + 82) = v233;
                      }
                      int v150 = 0;
                      *(_DWORD *)(v142 + 4 * v233 + 36) = v218;
                      unsigned int v234 = (117 * (*(unsigned char *)(v142 + 82) + 1)) >> 8;
                      *(unsigned char *)(v142 + 82) = *(unsigned char *)(v142 + 82)
                                            + 1
                                            - 11
                                            * ((v234
                                              + (((*(unsigned char *)(v142 + 82) + 1 - v234) & 0xFE) >> 1)) >> 3);
                      if (*(unsigned char *)(v132 + 1313))
                      {
LABEL_111:
                        os_log_t v161 = _NRCopyLogObjectForNRUUID(*v999);
                        os_log_t v162 = v161;
                        if (sNRCopyLogToStdErr)
                        {

                          goto LABEL_114;
                        }
                        BOOL v163 = os_log_type_enabled(v161, OS_LOG_TYPE_INFO);

                        if (v163)
                        {
LABEL_114:
                          os_log_t v164 = _NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs((uint64_t)v164, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v165, v166, v167, v168, v169, (uint64_t)"");
                        }
                      }
                    }
                    uint64_t v173 = *(unsigned __int16 *)(v142 + 80);
                    if ((unsigned __int16)(v172 - v171) >= (unsigned __int16)(0x4000 - v173)) {
                      size_t v174 = (unsigned __int16)(0x4000 - v173);
                    }
                    else {
                      size_t v174 = (unsigned __int16)(v172 - v171);
                    }
                    v175 = v998;
                    memcpy((void *)(*(void *)v142 + v173), &v998[v171], v174);
                    unsigned int v176 = *(_DWORD *)(v142 + 28);
                    unsigned int v177 = *(_DWORD *)(v142 + 32) + v174;
                    *(_DWORD *)(v142 + 32) = v177;
                    if (v176 <= v177)
                    {
                      int v178 = 0;
                    }
                    else
                    {
                      memmove(v175, &v175[v177], v176 - v177);
                      int v178 = *(_DWORD *)(v142 + 28) - *(_DWORD *)(v142 + 32);
                    }
                    *(_DWORD *)(v142 + 28) = v178;
                    *(_DWORD *)(v142 + 32) = 0;
                    *(_WORD *)(v142 + 80) += v174;
                    if (!gNRPacketLoggingEnabled)
                    {
LABEL_124:
                      int v170 = v150 | 0x30;
                      v143 += v174;
                      unint64_t v132 = 0x26AB22000;
                      goto LABEL_125;
                    }
                    os_log_t v254 = _NRCopyLogObjectForNRUUID(*v999);
                    os_log_t v255 = v254;
                    if (sNRCopyLogToStdErr)
                    {
                    }
                    else
                    {
                      LODWORD(ESPSequenceNumberFromPacket) = os_log_type_enabled(v254, OS_LOG_TYPE_INFO);

                      if (!ESPSequenceNumberFromPacket) {
                        goto LABEL_124;
                      }
                    }
                    os_log_t v279 = _NRCopyLogObjectForNRUUID(*v999);
                    _NRLogWithArgs((uint64_t)v279, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v280, v281, v282, v283, v284, (uint64_t)"");

                    goto LABEL_124;
                  }
                  if (!*(unsigned char *)(v132 + 1313))
                  {
LABEL_269:
                    uint64_t v5 = v1004;
                    os_log_t v6 = v999;
                    if (v1000) {
                      v1000(v1004);
                    }
                    unsigned int v331 = *(unsigned __int8 *)(v142 + 82);
                    if (v331 >= 0xB)
                    {
                      unsigned int v331 = *(unsigned __int8 *)(v142 + 82)
                           - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v142 + 82)) >> 32);
                      *(unsigned char *)(v142 + 82) = v331;
                    }
                    *(_DWORD *)(v142 + 4 * v331 + 36) = 3;
                    goto LABEL_318;
                  }
                  os_log_t v734 = _NRCopyLogObjectForNRUUID(*v999);
                  os_log_t v735 = v734;
                  if (sNRCopyLogToStdErr)
                  {

                    uint64_t v76 = v994;
                  }
                  else
                  {
                    BOOL v749 = os_log_type_enabled(v734, OS_LOG_TYPE_INFO);

                    uint64_t v76 = v994;
                    if (!v749) {
                      goto LABEL_269;
                    }
                  }
                  os_log_t v750 = _NRCopyLogObjectForNRUUID(*v999);
                  _NRLogWithArgs((uint64_t)v750, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v751, v752, v753, v754, v755, (uint64_t)"");

                  goto LABEL_269;
                }
                uint64_t v716 = (uint64_t)v136;
                v717 = v999;
                if (!*(unsigned char *)(v132 + 1313)) {
                  goto LABEL_691;
                }
                os_log_t v910 = _NRCopyLogObjectForNRUUID(*v999);
                os_log_t v911 = v910;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v932 = os_log_type_enabled(v910, OS_LOG_TYPE_INFO);

                  if (!v932) {
                    goto LABEL_691;
                  }
                }
                os_log_t v933 = _NRCopyLogObjectForNRUUID(*v717);
                _NRLogWithArgs((uint64_t)v933, 1, (uint64_t)"%s%.30s:%-4d ", v934, v935, v936, v937, v938, (uint64_t)"");

LABEL_691:
                os_log_t v718 = _NRCopyLogObjectForNRUUID(*v717);
                os_log_t v719 = v718;
                if (sNRCopyLogToStdErr)
                {

                  uint64_t v5 = v1004;
                  os_log_t v6 = v717;
                  uint64_t v76 = v994;
                }
                else
                {
                  BOOL v742 = os_log_type_enabled(v718, OS_LOG_TYPE_FAULT);

                  uint64_t v5 = v1004;
                  os_log_t v6 = v717;
                  uint64_t v76 = v994;
                  if (!v742) {
                    goto LABEL_319;
                  }
                }
                os_log_t v743 = _NRCopyLogObjectForNRUUID(*v6);
                _NRLogWithArgs((uint64_t)v743, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v744, v745, v746, v747, v748, v716);

LABEL_319:
                uint64_t v22 = v990;
                goto LABEL_320;
              }
              uint64_t v139 = *(void *)(v5 + 104);
              if (!v139)
              {
LABEL_96:
                v135 = (void *)(v5 + 96);
                v136 = "Medium";
                int v137 = 1;
                goto LABEL_99;
              }
              if ((*(unsigned char *)(*(void *)v139 + 27) & 3) == 1 && !*(unsigned char *)(v5 + 12))
              {

                char v140 = 0;
                v1000 = 0;
                id v131 = 0;
                uint64_t v130 = 0;
                v992 = 0;
                v135 = (void *)(v5 + 112);
                if (!*(unsigned char *)(v5 + 12)) {
                  goto LABEL_89;
                }
              }
              else
              {
                v135 = 0;
                char v140 = 1;
                if (!*(unsigned char *)(v5 + 12)) {
                  goto LABEL_89;
                }
              }
              if (gNRPacketLoggingEnabled)
              {
                id v760 = v131;
                os_log_t v761 = _NRCopyLogObjectForNRUUID(*v999);
                os_log_t v762 = v761;
                if (sNRCopyLogToStdErr)
                {

                  uint64_t v5 = v1004;
                  uint64_t v76 = v994;
                }
                else
                {
                  LODWORD(v1012) = os_log_type_enabled(v761, OS_LOG_TYPE_INFO);

                  uint64_t v5 = v1004;
                  uint64_t v76 = v994;
                  id v131 = v760;
                  if (!v1012) {
                    goto LABEL_89;
                  }
                }
                os_log_t v789 = _NRCopyLogObjectForNRUUID(*v999);
                _NRLogWithArgs((uint64_t)v789, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v790, v791, v792, v793, v794, (uint64_t)"");

                id v131 = v760;
              }
LABEL_89:
              if (v135)
              {
                if (v140)
                {
                  int v137 = 0;
                  v136 = "Invalid";
                  unint64_t v132 = 0x26AB22000;
                  uint64_t v138 = v130;
                  goto LABEL_99;
                }
                unint64_t v132 = 0x26AB22000uLL;
                uint64_t v138 = v130;
                goto LABEL_98;
              }
              unint64_t v132 = 0x26AB22000;
              uint64_t v138 = v130;
              goto LABEL_96;
            }
            id v991 = v131;
            os_log_t v714 = _NRCopyLogObjectForNRUUID(*v999);
            os_log_t v715 = v714;
            if (sNRCopyLogToStdErr)
            {

              uint64_t v5 = v1004;
              uint64_t v76 = v994;
            }
            else
            {
              LODWORD(v1012) = os_log_type_enabled(v714, OS_LOG_TYPE_INFO);

              uint64_t v5 = v1004;
              uint64_t v76 = v994;
              id v131 = v991;
              if (!v1012) {
                goto LABEL_78;
              }
            }
            os_log_t v736 = _NRCopyLogObjectForNRUUID(*v999);
            _NRLogWithArgs((uint64_t)v736, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v737, v738, v739, v740, v741, (uint64_t)"");

            id v131 = v991;
            goto LABEL_78;
          }
          int v108 = 0;
          v1000 = NRBluetoothPacketParserSuspendNexusBEInputSource;
          uint64_t v109 = 16;
          uint64_t v110 = 464;
          uint64_t v111 = 336;
          uint64_t v112 = 272;
          uint64_t v113 = 224;
        }
        v992 = *(void **)(v5 + v113);
        uint64_t v130 = *(void *)(v5 + v112);
        id v131 = *(id *)(v5 + v111);
        v1009 = (void *)(v5 + v110);
        v1010 = (unsigned char *)(v5 + v109);
        goto LABEL_77;
      }
      v711 = nrCopyLogObj_518();
      v712 = v711;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v713 = os_log_type_enabled(v711, OS_LOG_TYPE_ERROR);

        if (!v713) {
          goto LABEL_699;
        }
      }
      id v727 = nrCopyLogObj_518();
      _NRLogWithArgs((uint64_t)v727, 16, (uint64_t)"%s%.30s:%-4d ABORTING: _strict_reallocf(%zu) failed", v728, v729, v730, v731, v732, (uint64_t)"");

LABEL_699:
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v733 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v733 = 136446466;
      *(void *)(v733 + 4) = "_strict_reallocf";
      *(_WORD *)(v733 + 12) = 2048;
      *(void *)(v733 + 14) = v78;
      goto LABEL_623;
    }
    v708 = nrCopyLogObj_518();
    v709 = v708;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v710 = os_log_type_enabled(v708, OS_LOG_TYPE_ERROR);

      if (!v710) {
        goto LABEL_696;
      }
    }
    id v720 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v720, 16, (uint64_t)"%s%.30s:%-4d ABORTING: _strict_reallocf called with size 0", v721, v722, v723, v724, v725, (uint64_t)"");

LABEL_696:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v726 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v726 = 136446210;
    *(void *)(v726 + 4) = "_strict_reallocf";
    goto LABEL_623;
  }
  uint64_t v66 = v995;
  if (sNRCopyLogToStdErr)
  {

    uint64_t v22 = v24;
  }
  else
  {
    BOOL v94 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);

    uint64_t v22 = v24;
    if (!v94)
    {
      int v92 = 1;
      uint64_t v76 = v994;
      goto LABEL_321;
    }
  }
  os_log_t v95 = _NRCopyLogObjectForNRUUID(*v999);
  uint64_t v76 = v994;
  _NRLogWithArgs((uint64_t)v95, 16, (uint64_t)"%s%.30s:%-4d Invalid link-write context ptr for prio %@", v96, v97, v98, v99, v100, (uint64_t)"");

  int v92 = 1;
LABEL_321:

  BOOL v93 = (void *)v996;
LABEL_322:

  if (v92) {
    goto LABEL_348;
  }
LABEL_323:
  v344 = [v3 objectForKeyedSubscript:@"source-address-bytes"];

  if (v344)
  {
    v345 = [v3 objectForKeyedSubscript:@"source-address-bytes"];
    if ([v345 length] != 16)
    {
      uint64_t v982 = [v345 length];
      -[NRBluetoothPacketParser handleInternalError:](v5, @"invalid src addr length (%llu != &zu)", v356, v357, v358, v359, v360, v361, v982);
LABEL_347:

      goto LABEL_348;
    }
    objc_msgSend(v345, "getBytes:length:", v5 + 672, objc_msgSend(v345, "length"));
  }
  v346 = [v3 objectForKeyedSubscript:@"destination-address-bytes"];

  if (!v346) {
    goto LABEL_329;
  }
  v345 = [v3 objectForKeyedSubscript:@"destination-address-bytes"];
  if ([v345 length] != 16)
  {
    uint64_t v983 = [v345 length];
    -[NRBluetoothPacketParser handleInternalError:](v5, @"invalid dst addr length (%llu != &zu)", v375, v376, v377, v378, v379, v380, v983);
    goto LABEL_347;
  }
  objc_msgSend(v345, "getBytes:length:", v5 + 688, objc_msgSend(v345, "length"));

LABEL_329:
  v347 = [v3 objectForKeyedSubscript:@"nexus-instances"];

  if (!v347) {
    goto LABEL_343;
  }
  v999 = v6;
  if (*(unsigned char *)(v5 + 8) == 1) {
    -[NRBluetoothPacketParser changeStateTo:](v5, 2);
  }
  v348 = [v3 objectForKeyedSubscript:@"nexus-instances"];
  id v349 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v1013 = 0u;
  long long v1014 = 0u;
  long long v1015 = 0u;
  long long v1016 = 0u;
  id v350 = v348;
  uint64_t v351 = [v350 countByEnumeratingWithState:&v1013 objects:v1023 count:16];
  if (v351)
  {
    uint64_t v352 = v351;
    uint64_t v353 = *(void *)v1014;
    do
    {
      for (uint64_t i = 0; i != v352; ++i)
      {
        if (*(void *)v1014 != v353) {
          objc_enumerationMutation(v350);
        }
        v355 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v1013 + 1) + 8 * i)];
        [v349 addObject:v355];
      }
      uint64_t v352 = [v350 countByEnumeratingWithState:&v1013 objects:v1023 count:16];
    }
    while (v352);
  }

  id v362 = v349;
  v369 = v362;
  os_log_t v6 = v999;
  if (*(unsigned char *)(v5 + 8) != 4 && !*(unsigned char *)(v5 + 11))
  {
    if (!v362)
    {
      -[NRBluetoothPacketParser handleInternalError:](v5, @"Invalid nexus instances", v363, v364, v365, v366, v367, v368, v985);
      goto LABEL_342;
    }
    uint64_t v405 = [v362 count];
    if (v405 != 4)
    {
      -[NRBluetoothPacketParser handleInternalError:](v5, @"invalid nexus count %u", v406, v407, v408, v409, v410, v411, v405);
      goto LABEL_342;
    }
    v412 = v6;
    v413 = [v369 objectAtIndexedSubscript:0];
    -[NRBluetoothPacketParser setupNexusChannelForPriority:channelUUID:](v5, 0x64u, v413);

    v414 = [v369 objectAtIndexedSubscript:1];
    -[NRBluetoothPacketParser setupNexusChannelForPriority:channelUUID:](v5, 0x65u, v414);

    v415 = [v369 objectAtIndexedSubscript:2];
    -[NRBluetoothPacketParser setupNexusChannelForPriority:channelUUID:](v5, 0x66u, v415);

    v416 = [v369 objectAtIndexedSubscript:3];
    -[NRBluetoothPacketParser setupNexusChannelForPriority:channelUUID:](v5, 0x67u, v416);

    os_log_t v417 = _NRCopyLogObjectForNRUUID(*(void **)(v5 + 40));
    os_log_t v418 = v417;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v446 = os_log_type_enabled(v417, OS_LOG_TYPE_DEFAULT);

      if (!v446)
      {
LABEL_402:
        *(unsigned char *)(v5 + 11) = 1;
        objc_storeStrong((id *)(v5 + 64), v349);
        os_log_t v6 = v412;
        if (*(unsigned char *)(v5 + 8) != 3 && [*(id *)(v5 + 64) count] && *(unsigned char *)(v5 + 10)) {
          -[NRBluetoothPacketParser changeStateTo:](v5, 3);
        }
        goto LABEL_342;
      }
    }
    os_log_t v447 = _NRCopyLogObjectForNRUUID(*v412);
    _NRLogWithArgs((uint64_t)v447, 0, (uint64_t)"%s%.30s:%-4d Setup nexus channels: %@", v448, v449, v450, v451, v452, (uint64_t)"");

    goto LABEL_402;
  }
LABEL_342:

LABEL_343:
  v370 = [v3 objectForKeyedSubscript:@"activate-datapath"];

  if (!v370) {
    goto LABEL_357;
  }
  v345 = [v3 objectForKeyedSubscript:@"activate-datapath"];
  v371 = [v345 objectForKeyedSubscript:@"activate-datapath-offset"];
  v372 = [v345 objectForKeyedSubscript:@"channel-id"];
  if ([v372 integerValue] == 2)
  {

    int v373 = 4;
    uint64_t v374 = 2;
  }
  else if ([v372 integerValue] == 1)
  {

    int v373 = 2;
    uint64_t v374 = 1;
  }
  else
  {
    uint64_t v381 = [v372 integerValue];

    if (v381 == 3) {
      uint64_t v374 = 3;
    }
    else {
      uint64_t v374 = 0;
    }
    int v373 = 8 * (v381 == 3);
  }
  int v382 = *(unsigned __int8 *)(v5 + 10);
  if ((v382 & v373) == 0)
  {
    *(unsigned char *)(v5 + 10) = v382 | v373;
    v998 = v372;
    if ((v374 - 1) < 3)
    {
      uint64_t v387 = 16 * (v374 - 1) + 88;
      v388 = *(uint64_t **)(v5 + v387);
      if (v388)
      {
        uint64_t v389 = *v388;
        if (*v388)
        {
          v999 = v6;
          *(unsigned char *)(v389 + 27) |= 3u;
          uint64_t v390 = *(void *)(v5 + v387);
          v391 = *(void (**)(void))(v390 + 24);
          if (v391) {
            v391(*(void *)(v390 + 32));
          }
          unsigned int v392 = [v371 unsignedIntValue];
          unsigned int v399 = v392;
          unsigned int v400 = *(_DWORD *)(v389 + 16);
          if (v400 > v392)
          {
            id v995 = v345;
            v401 = v999;
            os_log_t v402 = _NRCopyLogObjectForNRUUID(*v999);
            os_log_t v403 = v402;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v453 = os_log_type_enabled(v402, OS_LOG_TYPE_DEFAULT);

              if (!v453) {
                goto LABEL_408;
              }
            }
            os_log_t v454 = _NRCopyLogObjectForNRUUID(*v401);
            [v371 intValue];
            _NRLogWithArgs((uint64_t)v454, 0, (uint64_t)"%s%.30s:%-4d received more data than moveOffset (%u > %u), off %d", v455, v456, v457, v458, v459, (uint64_t)"");

LABEL_408:
            if (v399 >= 0x10000)
            {
              uint64_t v460 = *(unsigned int *)(v389 + 16);
              [v371 intValue];
              -[NRBluetoothPacketParser handleInternalError:](v5, @"received more data than moveOffset (%u > %u), off %d", v461, v462, v463, v464, v465, v466, v460);
              v345 = v995;
              goto LABEL_399;
            }
            if (v399)
            {
              memmove(*(void **)v389, (const void *)(*(void *)v389 + v399), *(_DWORD *)(v389 + 16) - v399);
              *(_DWORD *)(v389 + 16) -= v399;
            }
            bzero(&v1019, 0x5DCuLL);
            size_t v467 = *(unsigned int *)(v389 + 16);
            *(_DWORD *)(v389 + 16) = 0;
            v468 = (__CFString *)&v1019;
            if (v467 < 0x5DD) {
              goto LABEL_415;
            }
            v469 = (__CFString *)malloc_type_calloc(1uLL, v467, 0xF1748037uLL);
            if (v469)
            {
              v468 = v469;
LABEL_415:
              memcpy(v468, *(const void **)v389, v467);
              NRBluetoothPacketParserLinkToNexusLoopFastPath(v5, v389, v468, v467, 0, 0);
              if (v468 != (__CFString *)&v1019) {
                free(v468);
              }
              v345 = v995;
              v372 = v998;
LABEL_418:
              -[NRBluetoothPacketParser updateReadyStateIfApplicable](v5);
              if (*(unsigned char *)(v5 + 8) == 4) {
                goto LABEL_356;
              }
              id v995 = v345;
              dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
              v990 = &v985;
              if (v374 == 3)
              {
                v1000 = NRBluetoothPacketParserSuspendNexusVOInputSource;
                int v470 = 1;
                uint64_t v471 = 14;
                uint64_t v472 = 432;
                uint64_t v473 = 304;
                uint64_t v474 = 240;
                uint64_t v475 = 208;
              }
              else if ((0x64656600u >> (8 * v374)) == 101)
              {
                v1000 = NRBluetoothPacketParserSuspendNexusVIInputSource;
                int v470 = 1;
                uint64_t v471 = 15;
                uint64_t v472 = 448;
                uint64_t v473 = 320;
                uint64_t v474 = 256;
                uint64_t v475 = 216;
              }
              else
              {
                if ((0x64656600u >> (8 * v374)) != 102)
                {
                  v1009 = 0;
                  v1010 = 0;
                  v1000 = 0;
                  int v470 = 0;
                  id v476 = 0;
                  uint64_t v1012 = 0;
                  uint64_t v993 = 0;
LABEL_426:
                  unint64_t v477 = 0x26AB22000uLL;
                  if (!gNRPacketLoggingEnabled)
                  {
LABEL_427:
                    unsigned int v478 = *(unsigned __int8 *)(v5 + 10);
                    int v479 = (v478 >> 3) & 1;
                    if (v374 != 3) {
                      int v479 = 0;
                    }
                    BOOL v1011 = v479;
                    if (v479 == 1)
                    {
                      v480 = (void *)(v5 + 128);
                      v481 = "Isochronous";
                      int v482 = 3;
                      goto LABEL_448;
                    }
                    if (!v470) {
                      goto LABEL_445;
                    }
                    if ((v478 & 4) != 0)
                    {
                      v480 = (void *)(v5 + 112);
LABEL_447:
                      v481 = "High";
                      int v482 = 2;
LABEL_448:
                      v1003 = (void **)v480;
                      v485 = (void *)*v480;
                      id v991 = v476;
                      v992 = v371;
                      if (v485)
                      {
                        uint64_t v486 = v485[3];
                        if ((*(unsigned char *)(v486 + 84) & 1) == 0)
                        {
                          LODWORD(v988) = v482;
                          v989 = (uint64_t *)v481;
                          id v987 = v3;
                          int v487 = 0;
                          __int16 v488 = 0;
                          int v1005 = 0;
                          int v489 = *(unsigned __int8 *)(v486 + 83);
                          uint64_t v490 = *(void *)(v486 + 8);
                          uint64_t v491 = 568;
                          if (v489 == 3) {
                            uint64_t v491 = 584;
                          }
                          BOOL v148 = v489 == 2;
                          uint64_t v492 = 600;
                          if (!v148) {
                            uint64_t v492 = v491;
                          }
                          uint64_t v1001 = v492;
                          uint64_t v1007 = v5 + 688;
                          uint64_t v1008 = v5 + 672;
                          int v493 = 9;
                          uint64_t ESPSequenceNumberFromPacket = v490;
                          if (!*(unsigned char *)(v477 + 1313)) {
                            goto LABEL_459;
                          }
LABEL_455:
                          os_log_t v494 = _NRCopyLogObjectForNRUUID(*v999);
                          os_log_t v495 = v494;
                          if (sNRCopyLogToStdErr)
                          {

                            unint64_t v477 = 0x26AB22000;
LABEL_458:
                            os_log_t v497 = _NRCopyLogObjectForNRUUID(*v999);
                            _NRLogWithArgs((uint64_t)v497, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v498, v499, v500, v501, v502, (uint64_t)"");

                            goto LABEL_459;
                          }
                          BOOL v496 = os_log_type_enabled(v494, OS_LOG_TYPE_INFO);

                          unint64_t v477 = 0x26AB22000uLL;
                          if (v496) {
                            goto LABEL_458;
                          }
LABEL_459:
                          os_log_t v1006 = 0;
                          os_log_t v503 = 0;
                          uint64_t v1002 = 0;
                          long long v1021 = 0u;
                          long long v1022 = 0u;
                          long long v1019 = 0u;
                          long long v1020 = 0u;
                          if (*(unsigned char *)(v477 + 1313)) {
                            goto LABEL_460;
                          }
                          while (1)
                          {
                            int v513 = v493 | 0x10;
                            if (!v1011)
                            {
                              unsigned int v515 = *(_DWORD *)(v486 + 28);
                              uint64_t v514 = *(unsigned int *)(v486 + 32);
                              if (v515 > v514) {
                                break;
                              }
                            }
LABEL_474:
                            os_log_t v522 = v1006;
                            if (v1012) {
                              os_log_t v522 = (os_log_t)os_channel_get_next_slot();
                            }
                            if (!v522)
                            {
                              v557 = 0;
                              goto LABEL_511;
                            }
                            while (1)
                            {
                              unsigned int v523 = 0x4000 - *(unsigned __int16 *)(v486 + 80);
                              if (v523 < nrMaxTLVLengthForPacket(v1020, WORD1(v1019)))
                              {
                                v513 |= 0x40u;
                                if (!gNRPacketLoggingEnabled)
                                {
LABEL_509:
                                  v557 = v522;
                                  unint64_t v477 = 0x26AB22000;
                                  goto LABEL_511;
                                }
                                os_log_t v593 = _NRCopyLogObjectForNRUUID(*v999);
                                os_log_t v594 = v593;
                                if (sNRCopyLogToStdErr)
                                {
                                }
                                else
                                {
                                  LODWORD(v1006) = os_log_type_enabled(v593, OS_LOG_TYPE_INFO);

                                  if (!v1006) {
                                    goto LABEL_509;
                                  }
                                }
                                os_log_t v606 = _NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs((uint64_t)v606, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v607, v608, v609, v610, v611, (uint64_t)"");

                                goto LABEL_509;
                              }
                              os_channel_slot_get_packet();
                              os_packet_get_next_buflet();
                              unsigned int v524 = os_buflet_get_data_offset();
                              uint64_t v525 = os_buflet_get_object_address();
                              unsigned int v526 = os_buflet_get_data_length();
                              if (v526 >= 0x10000) {
                                goto LABEL_617;
                              }
                              unsigned __int16 v527 = v526;
                              if (!(_WORD)v526 && WORD1(v1019))
                              {
                                unint64_t v1017 = 0;
                                uint64_t v1018 = 0;
                                unint64_t v1017 = *(void *)v486 + *(unsigned __int16 *)(v486 + 80);
                                LODWORD(v1018) = v523;
                                int v528 = nrPacketToTLV((unsigned __int8 *)v1020, WORD1(v1019), (uint64_t)&v1017, 1u, v1008, v1007);
                                unint64_t v477 = 0x26AB22000uLL;
                                if (!gNRPacketLoggingEnabled)
                                {
LABEL_482:
                                  v513 |= 0x80u;
                                  goto LABEL_486;
                                }
                                os_log_t v533 = _NRCopyLogObjectForNRUUID(*v999);
                                os_log_t v534 = v533;
                                if (sNRCopyLogToStdErr)
                                {
                                }
                                else
                                {
                                  BOOL v538 = os_log_type_enabled(v533, OS_LOG_TYPE_INFO);

                                  if (!v538) {
                                    goto LABEL_482;
                                  }
                                }
                                os_log_t v539 = _NRCopyLogObjectForNRUUID(*v999);
                                getESPSequenceNumberFromPacket(v1020, WORD1(v1019));
                                getESPSPIFromPacket(v1020, WORD1(v1019));
                                _NRLogWithArgs((uint64_t)v539, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v540, v541, v542, v543, v544, (uint64_t)"");

                                goto LABEL_482;
                              }
                              if ((_WORD)v526)
                              {
                                v529 = (unsigned __int8 *)(v525 + v524);
                                unint64_t v1017 = 0;
                                uint64_t v1018 = 0;
                                unint64_t v1017 = *(void *)v486 + *(unsigned __int16 *)(v486 + 80);
                                LODWORD(v1018) = v523;
                                int v528 = nrPacketToTLV(v529, (unsigned __int16)v526, (uint64_t)&v1017, 1u, v1008, v1007);
                                unint64_t v477 = 0x26AB22000uLL;
                                if (!gNRPacketLoggingEnabled)
                                {
LABEL_485:
                                  v513 |= 0x100u;
                                  goto LABEL_486;
                                }
                                os_log_t v535 = _NRCopyLogObjectForNRUUID(*v999);
                                if (sNRCopyLogToStdErr)
                                {
                                }
                                else
                                {
                                  os_log_t v1006 = v535;
                                  LODWORD(v996) = os_log_type_enabled(v535, OS_LOG_TYPE_INFO);

                                  if (!v996) {
                                    goto LABEL_485;
                                  }
                                }
                                os_log_t v1006 = _NRCopyLogObjectForNRUUID(*v999);
                                uint64_t v996 = getESPSequenceNumberFromPacket((uint64_t)v529, v527);
                                getESPSPIFromPacket((uint64_t)v529, v527);
                                os_log_t v545 = v1006;
                                _NRLogWithArgs((uint64_t)v1006, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v546, v547, v548, v549, v550, (uint64_t)"");

                                goto LABEL_485;
                              }
                              v513 |= 0x200u;
                              unint64_t v477 = 0x26AB22000uLL;
                              if (!gNRPacketLoggingEnabled)
                              {
                                int v528 = 0;
                                goto LABEL_486;
                              }
                              os_log_t v536 = _NRCopyLogObjectForNRUUID(*v999);
                              os_log_t v537 = v536;
                              if (sNRCopyLogToStdErr)
                              {
                              }
                              else
                              {
                                int v528 = os_log_type_enabled(v536, OS_LOG_TYPE_INFO);

                                if (!v528) {
                                  goto LABEL_486;
                                }
                              }
                              os_log_t v551 = _NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs((uint64_t)v551, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v552, v553, v554, v555, v556, (uint64_t)"");

                              int v528 = 0;
LABEL_486:
                              *(_WORD *)(v486 + 80) += v528;
                              uint64_t v530 = v1011 ? 0 : os_channel_get_next_slot();
                              ++v488;
                              ++*v1009;
                              unsigned char *v1010 = 1;
                              v487 += v528;
                              if (!v530) {
                                break;
                              }
                              unsigned int v531 = *(unsigned __int8 *)(v486 + 82);
                              if (v531 >= 0xB)
                              {
                                unsigned int v531 = *(unsigned __int8 *)(v486 + 82)
                                     - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v486 + 82)) >> 32);
                                *(unsigned char *)(v486 + 82) = v531;
                              }
                              *(_DWORD *)(v486 + 4 * v531 + 36) = v513;
                              unsigned int v532 = (117 * (*(unsigned char *)(v486 + 82) + 1)) >> 8;
                              *(unsigned char *)(v486 + 82) = *(unsigned char *)(v486 + 82)
                                                    + 1
                                                    - 11
                                                    * ((v532
                                                      + (((*(unsigned char *)(v486 + 82) + 1 - v532) & 0xFE) >> 1)) >> 3);
                              os_log_t v503 = v522;
                              os_log_t v522 = (os_log_t)v530;
                              int v513 = 0;
                            }
                            v557 = 0;
                            os_log_t v503 = v522;
LABEL_511:
                            int v558 = *(unsigned __int16 *)(v486 + 80);
                            LODWORD(v559) = *(_WORD *)(v486 + 80) != 0;
                            if (!*(_WORD *)(v486 + 80))
                            {
                              int v561 = v513 | 0x400;
                              if (*(unsigned char *)(v477 + 1313))
                              {
                                LODWORD(v996) = *(_WORD *)(v486 + 80) != 0;
                                os_log_t v646 = _NRCopyLogObjectForNRUUID(*v999);
                                os_log_t v647 = v646;
                                if (sNRCopyLogToStdErr)
                                {

                                  goto LABEL_592;
                                }
                                BOOL v648 = os_log_type_enabled(v646, OS_LOG_TYPE_INFO);

                                if (v648)
                                {
LABEL_592:
                                  os_log_t v649 = _NRCopyLogObjectForNRUUID(*v999);
                                  _NRLogWithArgs((uint64_t)v649, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v650, v651, v652, v653, v654, (uint64_t)"");
                                }
                                unint64_t v477 = 0x26AB22000uLL;
                                LODWORD(v559) = v996;
LABEL_594:
                                BOOL v644 = v558 == 0;
                                if (!*(unsigned char *)(v477 + 1313))
                                {
                                  int v645 = v561 | 0x8000;
                                  if (v503) {
                                    goto LABEL_596;
                                  }
                                  goto LABEL_587;
                                }
                                int v657 = v559;
                                os_log_t v658 = _NRCopyLogObjectForNRUUID(*v999);
                                os_log_t v659 = v658;
                                if (sNRCopyLogToStdErr)
                                {

                                  goto LABEL_612;
                                }
                                BOOL v662 = os_log_type_enabled(v658, OS_LOG_TYPE_INFO);

                                if (v662)
                                {
LABEL_612:
                                  os_log_t v663 = _NRCopyLogObjectForNRUUID(*v999);
                                  _NRLogWithArgs((uint64_t)v663, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v664, v665, v666, v667, v668, (uint64_t)"");
                                }
                                LODWORD(v559) = v657;
                                int v645 = v561 | 0x8000;
                                if (v503) {
                                  goto LABEL_596;
                                }
LABEL_587:
                                if (*(unsigned char *)(v1004 + 13)) {
                                  goto LABEL_597;
                                }
                                goto LABEL_602;
                              }
                              LODWORD(v559) = 0;
                              BOOL v644 = 1;
                              int v645 = v561 | 0x8000;
                              if (!v503) {
                                goto LABEL_587;
                              }
LABEL_596:
                              os_channel_advance_slot();
                              *(unsigned char *)(v1004 + 13) = 1;
LABEL_597:
                              if (v1005 > 8u
                                || v1012 && os_channel_available_slot_count() <= 1)
                              {
                                if (!gNRPacketLoggingEnabled) {
                                  goto LABEL_601;
                                }
                                int v660 = v559;
                                os_log_t v661 = _NRCopyLogObjectForNRUUID(*v999);
                                uint64_t v559 = (uint64_t)v661;
                                if (sNRCopyLogToStdErr)
                                {

                                  goto LABEL_616;
                                }
                                BOOL v669 = os_log_type_enabled(v661, OS_LOG_TYPE_INFO);

                                LODWORD(v559) = v660;
                                if (v669)
                                {
LABEL_616:
                                  uint64_t v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v1004 + 40));
                                  _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v670, v671, v672, v673, v674, (uint64_t)"");

                                  LODWORD(v559) = v660;
                                }
LABEL_601:
                                int v645 = v561 | 0x18000;
                                os_channel_sync();
                                *(unsigned char *)(v1004 + 13) = 0;
                              }
LABEL_602:
                              if ((v559 & v644) != 1)
                              {
                                id v3 = v987;
                                uint64_t v5 = v1004;
                                if (!gNRPacketLoggingEnabled) {
                                  goto LABEL_631;
                                }
                                char v830 = v559;
                                os_log_t v831 = _NRCopyLogObjectForNRUUID(*v999);
                                uint64_t v559 = (uint64_t)v831;
                                if (sNRCopyLogToStdErr)
                                {

                                  id v3 = v987;
                                  uint64_t v5 = v1004;
                                  goto LABEL_765;
                                }
                                BOOL v867 = os_log_type_enabled(v831, OS_LOG_TYPE_INFO);

                                id v3 = v987;
                                uint64_t v5 = v1004;
                                LOBYTE(v559) = v830;
                                if (v867)
                                {
LABEL_765:
                                  uint64_t v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                                  _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v868, v869, v870, v871, v872, (uint64_t)"");

                                  LOBYTE(v559) = v830;
                                }
LABEL_631:
                                if (v559) {
                                  goto LABEL_672;
                                }
                                if (v988 == 1)
                                {
                                  uint64_t v691 = *(void *)(v5 + 136);
                                  if ((*(unsigned char *)(v5 + 10) & 4) == 0) {
                                    goto LABEL_656;
                                  }
                                  goto LABEL_664;
                                }
                                if (v988 != 2)
                                {
                                  if (v988 == 3)
                                  {
                                    uint64_t v5 = v1004;
                                    uint64_t v687 = *(void *)(v1004 + 136);
                                    id v3 = v987;
                                    if ((v687 & 8) != 0 && *(void *)(v1004 + 304))
                                    {
                                      v688 = (dispatch_object_t *)(v1004 + 304);
                                      *(void *)(v1004 + 136) = v687 & 0xFFFFFFFFFFFFFFF7;
                                      if (gNRPacketLoggingEnabled)
                                      {
                                        os_log_t v689 = _NRCopyLogObjectForNRUUID(*v999);
                                        os_log_t v690 = v689;
                                        if (sNRCopyLogToStdErr)
                                        {

                                          goto LABEL_801;
                                        }
                                        BOOL v953 = os_log_type_enabled(v689, OS_LOG_TYPE_INFO);

                                        if (v953)
                                        {
LABEL_801:
                                          os_log_t v919 = _NRCopyLogObjectForNRUUID(*v999);
                                          _NRLogWithArgs((uint64_t)v919, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v954, v955, v956, v957, v958, (uint64_t)"");
                                          goto LABEL_804;
                                        }
                                      }
                                      goto LABEL_671;
                                    }
                                    goto LABEL_672;
                                  }
                                  uint64_t v691 = *(void *)(v1004 + 136);
LABEL_656:
                                  if ((v691 & 8) != 0 && *(void *)(v1004 + 304))
                                  {
                                    *(void *)(v1004 + 136) = v691 & 0xFFFFFFFFFFFFFFF7;
                                    if (!gNRPacketLoggingEnabled) {
                                      goto LABEL_659;
                                    }
                                    os_log_t v912 = _NRCopyLogObjectForNRUUID(*v999);
                                    os_log_t v913 = v912;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      goto LABEL_797;
                                    }
                                    BOOL v939 = os_log_type_enabled(v912, OS_LOG_TYPE_INFO);

                                    if (v939)
                                    {
LABEL_797:
                                      os_log_t v940 = _NRCopyLogObjectForNRUUID(*v999);
                                      _NRLogWithArgs((uint64_t)v940, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v941, v942, v943, v944, v945, (uint64_t)"");
                                    }
LABEL_659:
                                    uint64_t v696 = v1004;
                                    dispatch_resume(*(dispatch_object_t *)(v1004 + 304));
                                    uint64_t v691 = *(void *)(v696 + 136);
                                  }
                                  if ((v691 & 0x10) != 0 && *(void *)(v1004 + 320))
                                  {
                                    *(void *)(v1004 + 136) = v691 & 0xFFFFFFFFFFFFFFEFLL;
                                    if (!gNRPacketLoggingEnabled) {
                                      goto LABEL_663;
                                    }
                                    os_log_t v914 = _NRCopyLogObjectForNRUUID(*v999);
                                    os_log_t v915 = v914;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      goto LABEL_799;
                                    }
                                    BOOL v946 = os_log_type_enabled(v914, OS_LOG_TYPE_INFO);

                                    if (v946)
                                    {
LABEL_799:
                                      os_log_t v947 = _NRCopyLogObjectForNRUUID(*v999);
                                      _NRLogWithArgs((uint64_t)v947, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v948, v949, v950, v951, v952, (uint64_t)"");
                                    }
LABEL_663:
                                    uint64_t v697 = v1004;
                                    dispatch_resume(*(dispatch_object_t *)(v1004 + 320));
                                    uint64_t v691 = *(void *)(v697 + 136);
                                  }
LABEL_664:
                                  if ((v691 & 0x20) != 0 && *(void *)(v1004 + 336))
                                  {
                                    *(void *)(v1004 + 136) = v691 & 0xFFFFFFFFFFFFFFDFLL;
                                    if (!gNRPacketLoggingEnabled) {
                                      goto LABEL_667;
                                    }
                                    os_log_t v906 = _NRCopyLogObjectForNRUUID(*v999);
                                    os_log_t v907 = v906;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      goto LABEL_793;
                                    }
                                    BOOL v925 = os_log_type_enabled(v906, OS_LOG_TYPE_INFO);

                                    if (v925)
                                    {
LABEL_793:
                                      os_log_t v926 = _NRCopyLogObjectForNRUUID(*v999);
                                      _NRLogWithArgs((uint64_t)v926, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v927, v928, v929, v930, v931, (uint64_t)"");
                                    }
LABEL_667:
                                    uint64_t v698 = v1004;
                                    dispatch_resume(*(dispatch_object_t *)(v1004 + 336));
                                    uint64_t v691 = *(void *)(v698 + 136);
                                  }
                                  id v3 = v987;
                                  uint64_t v5 = v1004;
                                  if ((v691 & 0x40) != 0 && *(void *)(v1004 + 352))
                                  {
                                    v688 = (dispatch_object_t *)(v1004 + 352);
                                    *(void *)(v1004 + 136) = v691 & 0xFFFFFFFFFFFFFFBFLL;
                                    if (!gNRPacketLoggingEnabled) {
                                      goto LABEL_671;
                                    }
                                    os_log_t v908 = _NRCopyLogObjectForNRUUID(*v999);
                                    os_log_t v909 = v908;
                                    if (sNRCopyLogToStdErr)
                                    {
                                    }
                                    else
                                    {
                                      BOOL v918 = os_log_type_enabled(v908, OS_LOG_TYPE_INFO);

                                      if (!v918) {
                                        goto LABEL_671;
                                      }
                                    }
                                    os_log_t v919 = _NRCopyLogObjectForNRUUID(*v999);
                                    _NRLogWithArgs((uint64_t)v919, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v920, v921, v922, v923, v924, (uint64_t)"");
                                    goto LABEL_804;
                                  }
                                  goto LABEL_672;
                                }
                                uint64_t v692 = *(void *)(v1004 + 136);
                                if ((v692 & 8) != 0 && *(void *)(v1004 + 304))
                                {
                                  *(void *)(v1004 + 136) = v692 & 0xFFFFFFFFFFFFFFF7;
                                  if (!gNRPacketLoggingEnabled) {
                                    goto LABEL_649;
                                  }
                                  os_log_t v916 = _NRCopyLogObjectForNRUUID(*v999);
                                  os_log_t v917 = v916;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    goto LABEL_806;
                                  }
                                  BOOL v965 = os_log_type_enabled(v916, OS_LOG_TYPE_INFO);

                                  if (v965)
                                  {
LABEL_806:
                                    os_log_t v966 = _NRCopyLogObjectForNRUUID(*v999);
                                    _NRLogWithArgs((uint64_t)v966, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v967, v968, v969, v970, v971, (uint64_t)"");
                                  }
LABEL_649:
                                  uint64_t v693 = v1004;
                                  dispatch_resume(*(dispatch_object_t *)(v1004 + 304));
                                  uint64_t v692 = *(void *)(v693 + 136);
                                }
                                id v3 = v987;
                                uint64_t v5 = v1004;
                                if ((v692 & 0x10) != 0 && *(void *)(v1004 + 320))
                                {
                                  v688 = (dispatch_object_t *)(v1004 + 320);
                                  *(void *)(v1004 + 136) = v692 & 0xFFFFFFFFFFFFFFEFLL;
                                  if (!gNRPacketLoggingEnabled) {
                                    goto LABEL_671;
                                  }
                                  os_log_t v694 = _NRCopyLogObjectForNRUUID(*v999);
                                  os_log_t v695 = v694;
                                  if (sNRCopyLogToStdErr)
                                  {
                                  }
                                  else
                                  {
                                    BOOL v959 = os_log_type_enabled(v694, OS_LOG_TYPE_INFO);

                                    if (!v959) {
                                      goto LABEL_671;
                                    }
                                  }
                                  os_log_t v919 = _NRCopyLogObjectForNRUUID(*v999);
                                  _NRLogWithArgs((uint64_t)v919, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v960, v961, v962, v963, v964, (uint64_t)"");
LABEL_804:

LABEL_671:
                                  dispatch_resume(*v688);
                                  id v3 = v987;
                                  uint64_t v5 = v1004;
                                }
LABEL_672:
                                if (gNRPacketLoggingEnabled)
                                {
                                  os_log_t v832 = _NRCopyLogObjectForNRUUID(*v999);
                                  os_log_t v833 = v832;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    id v3 = v987;
                                    uint64_t v5 = v1004;
                                  }
                                  else
                                  {
                                    BOOL v873 = os_log_type_enabled(v832, OS_LOG_TYPE_INFO);

                                    id v3 = v987;
                                    uint64_t v5 = v1004;
                                    if (!v873) {
                                      goto LABEL_673;
                                    }
                                  }
                                  os_log_t v874 = _NRCopyLogObjectForNRUUID(*v999);
                                  _NRLogWithArgs((uint64_t)v874, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v875, v876, v877, v878, v879, (uint64_t)"");
                                }
LABEL_673:
                                unsigned int v699 = *(unsigned __int8 *)(v486 + 82);
                                if (v699 >= 0xB)
                                {
                                  unsigned int v699 = *(unsigned __int8 *)(v486 + 82)
                                       - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v486 + 82)) >> 32);
                                  *(unsigned char *)(v486 + 82) = v699;
                                }
                                *(_DWORD *)(v486 + 4 * v699 + 36) = v645 | 0x60000;
LABEL_676:
                                unsigned int v700 = (117 * (*(unsigned char *)(v486 + 82) + 1)) >> 8;
                                *(unsigned char *)(v486 + 82) = *(unsigned char *)(v486 + 82)
                                                      + 1
                                                      - 11
                                                      * ((v700
                                                        + (((*(unsigned char *)(v486 + 82) + 1 - v700) & 0xFE) >> 1)) >> 3);
                                goto LABEL_677;
                              }
                              unsigned int v655 = *(unsigned __int8 *)(v486 + 82);
                              unint64_t v477 = 0x26AB22000uLL;
                              if (v655 >= 0xB)
                              {
                                unsigned int v655 = *(unsigned __int8 *)(v486 + 82)
                                     - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v486 + 82)) >> 32);
                                *(unsigned char *)(v486 + 82) = v655;
                              }
                              *(_DWORD *)(v486 + 4 * v655 + 36) = v645;
                              unsigned int v656 = (117 * (*(unsigned char *)(v486 + 82) + 1)) >> 8;
                              *(unsigned char *)(v486 + 82) = *(unsigned char *)(v486 + 82)
                                                    + 1
                                                    - 11
                                                    * ((v656
                                                      + (((*(unsigned char *)(v486 + 82) + 1 - v656) & 0xFE) >> 1)) >> 3);
                              int v493 = 8;
                              if (gNRPacketLoggingEnabled) {
                                goto LABEL_455;
                              }
                              goto LABEL_459;
                            }
                            os_log_t v1006 = v557;
                            unint64_t v1017 = 0;
                            if (!*(unsigned char *)(v477 + 1313)) {
                              goto LABEL_513;
                            }
                            int v578 = v559;
                            os_log_t v579 = _NRCopyLogObjectForNRUUID(*v999);
                            uint64_t v559 = (uint64_t)v579;
                            if (sNRCopyLogToStdErr)
                            {

                              unint64_t v477 = 0x26AB22000;
                              goto LABEL_554;
                            }
                            LODWORD(v996) = os_log_type_enabled(v579, OS_LOG_TYPE_INFO);

                            unint64_t v477 = 0x26AB22000;
                            LODWORD(v559) = v578;
                            if (v996)
                            {
LABEL_554:
                              uint64_t v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v583, v584, v585, v586, v587, (uint64_t)"");

                              LODWORD(v559) = v578;
                            }
LABEL_513:
                            char v560 = ((uint64_t (*)(void, void, void, unint64_t *, void, void))(*v1003)[1])(**v1003, *(void *)v486, *(unsigned __int16 *)(v486 + 80), &v1017, 0, 0);
                            if (*(unsigned char *)(v477 + 1313))
                            {
                              LODWORD(v996) = v559;
                              os_log_t v580 = _NRCopyLogObjectForNRUUID(*v999);
                              uint64_t v559 = (uint64_t)v580;
                              if (sNRCopyLogToStdErr)
                              {

                                unint64_t v477 = 0x26AB22000;
                              }
                              else
                              {
                                LODWORD(v994) = os_log_type_enabled(v580, OS_LOG_TYPE_INFO);

                                unint64_t v477 = 0x26AB22000;
                                LODWORD(v559) = v996;
                                if (!v994) {
                                  goto LABEL_514;
                                }
                              }
                              uint64_t v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v588, v589, v590, v591, v592, (uint64_t)"");

                              LODWORD(v559) = v996;
                            }
LABEL_514:
                            if (v560)
                            {
                              int v561 = v513 | 0x800;
                              unint64_t v562 = v1017;
                              if (!v1017) {
                                goto LABEL_542;
                              }
LABEL_536:
                              if (v562 < *(unsigned __int16 *)(v486 + 80))
                              {
                                if (!*(unsigned char *)(v477 + 1313)) {
                                  goto LABEL_538;
                                }
                                LODWORD(v996) = v559;
                                os_log_t v595 = _NRCopyLogObjectForNRUUID(*v999);
                                uint64_t v559 = (uint64_t)v595;
                                if (sNRCopyLogToStdErr)
                                {

                                  unint64_t v477 = 0x26AB22000;
                                  goto LABEL_572;
                                }
                                LODWORD(v994) = os_log_type_enabled(v595, OS_LOG_TYPE_INFO);

                                unint64_t v477 = 0x26AB22000;
                                LODWORD(v559) = v996;
                                if (v994)
                                {
LABEL_572:
                                  uint64_t v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                                  _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v612, v613, v614, v615, v616, (uint64_t)"");

                                  LODWORD(v559) = v996;
                                }
LABEL_538:
                                v561 |= 0x2000u;
                                memmove(*(void **)v486, (const void *)(*(void *)v486 + v1017), *(unsigned __int16 *)(v486 + 80) - v1017);
                                unint64_t v575 = v1017;
                                *(_WORD *)(v486 + 80) -= v1017;
                                uint64_t v1002 = (v1002 + 1);
LABEL_541:
                                *(void *)(v1004 + v1001) += v575;
                                goto LABEL_542;
                              }
                              if (!*(unsigned char *)(v477 + 1313))
                              {
LABEL_540:
                                v561 |= 0x4000u;
                                *(_WORD *)(v486 + 80) = 0;
                                unint64_t v575 = v1017;
                                goto LABEL_541;
                              }
                              LODWORD(v996) = v559;
                              os_log_t v596 = _NRCopyLogObjectForNRUUID(*v999);
                              uint64_t v559 = (uint64_t)v596;
                              if (sNRCopyLogToStdErr)
                              {

                                unint64_t v477 = 0x26AB22000;
                              }
                              else
                              {
                                LODWORD(v994) = os_log_type_enabled(v596, OS_LOG_TYPE_INFO);

                                unint64_t v477 = 0x26AB22000;
                                LODWORD(v559) = v996;
                                if (!v994) {
                                  goto LABEL_540;
                                }
                              }
                              uint64_t v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                              _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v617, v618, v619, v620, v621, (uint64_t)"");

                              LODWORD(v559) = v996;
                              goto LABEL_540;
                            }
                            if (v1000) {
                              v1000(v1004);
                            }
                            *(unsigned char *)(v486 + 84) |= 1u;
                            switch(*(unsigned char *)(v486 + 83))
                            {
                              case 0:
                                LODWORD(v996) = v559;
                                os_log_t v563 = _NRCopyLogObjectForNRUUID(*v999);
                                uint64_t v559 = (uint64_t)v563;
                                if (sNRCopyLogToStdErr)
                                {
                                }
                                else
                                {
                                  LODWORD(v994) = os_log_type_enabled(v563, OS_LOG_TYPE_ERROR);

                                  LODWORD(v559) = v996;
                                  if (!v994) {
                                    goto LABEL_534;
                                  }
                                }
                                uint64_t v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs(v559, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v570, v571, v572, v573, v574, (uint64_t)"");
                                goto LABEL_533;
                              case 1:
                                uint64_t v564 = v1004;
                                uint64_t v565 = *(void *)(v1004 + 136);
                                ++*(void *)(v1004 + 144);
                                *(void *)(v564 + 136) = v565 & 0xFFFFFFFFFFFFFFFELL | *(unsigned char *)(v486 + 84) & 1;
                                if (!*(unsigned char *)(v477 + 1313)) {
                                  goto LABEL_529;
                                }
                                LODWORD(v996) = v559;
                                os_log_t v566 = _NRCopyLogObjectForNRUUID(*v999);
                                uint64_t v559 = (uint64_t)v566;
                                if (sNRCopyLogToStdErr)
                                {

                                  unint64_t v477 = 0x26AB22000;
                                }
                                else
                                {
                                  LODWORD(v994) = os_log_type_enabled(v566, OS_LOG_TYPE_INFO);

                                  unint64_t v477 = 0x26AB22000;
                                  LODWORD(v559) = v996;
                                  if (!v994) {
                                    goto LABEL_534;
                                  }
                                }
                                uint64_t v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v629, v630, v631, v632, v633, (uint64_t)"");
                                goto LABEL_533;
                              case 2:
                                uint64_t v567 = v1004;
                                ++*(void *)(v1004 + 160);
                                *(void *)(v567 + 136) = *(void *)(v567 + 136) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(unsigned char *)(v486 + 84) & 1));
                                if (!*(unsigned char *)(v477 + 1313)) {
                                  goto LABEL_529;
                                }
                                LODWORD(v996) = v559;
                                os_log_t v568 = _NRCopyLogObjectForNRUUID(*v999);
                                uint64_t v559 = (uint64_t)v568;
                                if (sNRCopyLogToStdErr)
                                {

                                  unint64_t v477 = 0x26AB22000;
                                }
                                else
                                {
                                  LODWORD(v994) = os_log_type_enabled(v568, OS_LOG_TYPE_INFO);

                                  unint64_t v477 = 0x26AB22000;
                                  LODWORD(v559) = v996;
                                  if (!v994) {
                                    goto LABEL_534;
                                  }
                                }
                                uint64_t v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v634, v635, v636, v637, v638, (uint64_t)"");
                                goto LABEL_533;
                              case 3:
                                uint64_t v569 = v1004;
                                ++*(void *)(v1004 + 176);
                                *(void *)(v569 + 136) = *(void *)(v569 + 136) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(unsigned char *)(v486 + 84) & 1));
                                if (!*(unsigned char *)(v477 + 1313))
                                {
LABEL_529:
                                  int v561 = v513 | 0x1800;
                                  unint64_t v562 = v1017;
                                  if (v1017) {
                                    goto LABEL_536;
                                  }
                                  break;
                                }
                                LODWORD(v996) = v559;
                                os_log_t v622 = _NRCopyLogObjectForNRUUID(*v999);
                                uint64_t v559 = (uint64_t)v622;
                                if (sNRCopyLogToStdErr)
                                {

                                  unint64_t v477 = 0x26AB22000;
                                }
                                else
                                {
                                  LODWORD(v994) = os_log_type_enabled(v622, OS_LOG_TYPE_INFO);

                                  unint64_t v477 = 0x26AB22000;
                                  LODWORD(v559) = v996;
                                  if (!v994) {
                                    goto LABEL_534;
                                  }
                                }
                                uint64_t v559 = (uint64_t)_NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs(v559, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v639, v640, v641, v642, v643, (uint64_t)"");
LABEL_533:

                                LODWORD(v559) = v996;
LABEL_534:
                                int v561 = v513 | 0x1800;
                                if (!*(unsigned char *)(v477 + 1313))
                                {
                                  unint64_t v562 = v1017;
                                  if (!v1017) {
                                    break;
                                  }
                                  goto LABEL_536;
                                }
                                LODWORD(v996) = v559;
                                os_log_t v581 = _NRCopyLogObjectForNRUUID(*v999);
                                os_log_t v582 = v581;
                                if (sNRCopyLogToStdErr)
                                {
                                }
                                else
                                {
                                  BOOL v599 = os_log_type_enabled(v581, OS_LOG_TYPE_INFO);

                                  if (!v599) {
                                    goto LABEL_567;
                                  }
                                }
                                os_log_t v600 = _NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs((uint64_t)v600, 1, (uint64_t)"%s%.30s:%-4d ", v601, v602, v603, v604, v605, (uint64_t)"");

LABEL_567:
                                unint64_t v477 = 0x26AB22000;
                                LODWORD(v559) = v996;
                                unint64_t v562 = v1017;
                                if (v1017) {
                                  goto LABEL_536;
                                }
                                break;
                              default:
                                goto LABEL_534;
                            }
LABEL_542:
                            ++v1005;
                            if ((v560 & 1) == 0) {
                              goto LABEL_594;
                            }
                            unsigned int v576 = *(unsigned __int8 *)(v486 + 82);
                            if (v576 >= 0xB)
                            {
                              unsigned int v576 = *(unsigned __int8 *)(v486 + 82)
                                   - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v486 + 82)) >> 32);
                              *(unsigned char *)(v486 + 82) = v576;
                            }
                            int v493 = 0;
                            *(_DWORD *)(v486 + 4 * v576 + 36) = v561;
                            unsigned int v577 = (117 * (*(unsigned char *)(v486 + 82) + 1)) >> 8;
                            *(unsigned char *)(v486 + 82) = *(unsigned char *)(v486 + 82)
                                                  + 1
                                                  - 11
                                                  * ((v577
                                                    + (((*(unsigned char *)(v486 + 82) + 1 - v577) & 0xFE) >> 1)) >> 3);
                            if (*(unsigned char *)(v477 + 1313))
                            {
LABEL_460:
                              os_log_t v504 = _NRCopyLogObjectForNRUUID(*v999);
                              os_log_t v505 = v504;
                              if (sNRCopyLogToStdErr)
                              {

                                unint64_t v477 = 0x26AB22000;
                                goto LABEL_463;
                              }
                              BOOL v506 = os_log_type_enabled(v504, OS_LOG_TYPE_INFO);

                              unint64_t v477 = 0x26AB22000;
                              if (v506)
                              {
LABEL_463:
                                os_log_t v507 = _NRCopyLogObjectForNRUUID(*v999);
                                _NRLogWithArgs((uint64_t)v507, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v508, v509, v510, v511, v512, (uint64_t)"");
                              }
                            }
                          }
                          uint64_t v516 = *(unsigned __int16 *)(v486 + 80);
                          if ((unsigned __int16)(v515 - v514) >= (unsigned __int16)(0x4000 - v516)) {
                            size_t v517 = (unsigned __int16)(0x4000 - v516);
                          }
                          else {
                            size_t v517 = (unsigned __int16)(v515 - v514);
                          }
                          v518 = (char *)ESPSequenceNumberFromPacket;
                          memcpy((void *)(*(void *)v486 + v516), (const void *)(ESPSequenceNumberFromPacket + v514), v517);
                          unsigned int v519 = *(_DWORD *)(v486 + 28);
                          unsigned int v520 = *(_DWORD *)(v486 + 32) + v517;
                          *(_DWORD *)(v486 + 32) = v520;
                          if (v519 <= v520)
                          {
                            int v521 = 0;
                          }
                          else
                          {
                            memmove(v518, &v518[v520], v519 - v520);
                            int v521 = *(_DWORD *)(v486 + 28) - *(_DWORD *)(v486 + 32);
                          }
                          *(_DWORD *)(v486 + 28) = v521;
                          *(_DWORD *)(v486 + 32) = 0;
                          *(_WORD *)(v486 + 80) += v517;
                          if (!gNRPacketLoggingEnabled)
                          {
LABEL_473:
                            int v513 = v493 | 0x30;
                            v487 += v517;
                            unint64_t v477 = 0x26AB22000;
                            goto LABEL_474;
                          }
                          os_log_t v597 = _NRCopyLogObjectForNRUUID(*v999);
                          os_log_t v598 = v597;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            LODWORD(v996) = os_log_type_enabled(v597, OS_LOG_TYPE_INFO);

                            if (!v996) {
                              goto LABEL_473;
                            }
                          }
                          os_log_t v623 = _NRCopyLogObjectForNRUUID(*v999);
                          _NRLogWithArgs((uint64_t)v623, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v624, v625, v626, v627, v628, (uint64_t)"");

                          goto LABEL_473;
                        }
                        if (!*(unsigned char *)(v477 + 1313))
                        {
LABEL_625:
                          if (v1000) {
                            v1000(v5);
                          }
                          unsigned int v686 = *(unsigned __int8 *)(v486 + 82);
                          if (v686 >= 0xB)
                          {
                            unsigned int v686 = *(unsigned __int8 *)(v486 + 82)
                                 - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v486 + 82)) >> 32);
                            *(unsigned char *)(v486 + 82) = v686;
                          }
                          *(_DWORD *)(v486 + 4 * v686 + 36) = 3;
                          goto LABEL_676;
                        }
                        v786 = v999;
                        os_log_t v787 = _NRCopyLogObjectForNRUUID(*v999);
                        os_log_t v788 = v787;
                        if (sNRCopyLogToStdErr)
                        {

                          uint64_t v5 = v1004;
                        }
                        else
                        {
                          BOOL v819 = os_log_type_enabled(v787, OS_LOG_TYPE_INFO);

                          uint64_t v5 = v1004;
                          if (!v819) {
                            goto LABEL_625;
                          }
                        }
                        os_log_t v820 = _NRCopyLogObjectForNRUUID(*v786);
                        _NRLogWithArgs((uint64_t)v820, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v821, v822, v823, v824, v825, (uint64_t)"");

                        goto LABEL_625;
                      }
                      uint64_t v779 = (uint64_t)v481;
                      v780 = v999;
                      if (*(unsigned char *)(v477 + 1313))
                      {
                        os_log_t v972 = _NRCopyLogObjectForNRUUID(*v999);
                        os_log_t v973 = v972;
                        if (sNRCopyLogToStdErr)
                        {
                        }
                        else
                        {
                          BOOL v974 = os_log_type_enabled(v972, OS_LOG_TYPE_INFO);

                          if (!v974) {
                            goto LABEL_722;
                          }
                        }
                        os_log_t v975 = _NRCopyLogObjectForNRUUID(*v780);
                        _NRLogWithArgs((uint64_t)v975, 1, (uint64_t)"%s%.30s:%-4d ", v976, v977, v978, v979, v980, (uint64_t)"");
                      }
LABEL_722:
                      os_log_t v781 = _NRCopyLogObjectForNRUUID(*v780);
                      os_log_t v782 = v781;
                      if (sNRCopyLogToStdErr)
                      {

                        uint64_t v5 = v1004;
                      }
                      else
                      {
                        BOOL v801 = os_log_type_enabled(v781, OS_LOG_TYPE_FAULT);

                        uint64_t v5 = v1004;
                        if (!v801) {
                          goto LABEL_677;
                        }
                      }
                      os_log_t v802 = _NRCopyLogObjectForNRUUID(*v780);
                      _NRLogWithArgs((uint64_t)v802, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v803, v804, v805, v806, v807, v779);

LABEL_677:
                      v345 = v995;
                      v371 = v992;
                      v372 = v998;
                      goto LABEL_356;
                    }
                    uint64_t v483 = *(void *)(v5 + 104);
                    if (!v483)
                    {
LABEL_445:
                      v480 = (void *)(v5 + 96);
                      v481 = "Medium";
                      int v482 = 1;
                      goto LABEL_448;
                    }
                    if ((*(unsigned char *)(*(void *)v483 + 27) & 3) == 1 && !*(unsigned char *)(v5 + 12))
                    {

                      char v484 = 0;
                      v1000 = 0;
                      id v476 = 0;
                      uint64_t v1012 = 0;
                      uint64_t v993 = 0;
                      v480 = (void *)(v5 + 112);
                      if (!*(unsigned char *)(v5 + 12)) {
                        goto LABEL_438;
                      }
                    }
                    else
                    {
                      v480 = 0;
                      char v484 = 1;
                      if (!*(unsigned char *)(v5 + 12)) {
                        goto LABEL_438;
                      }
                    }
                    if (gNRPacketLoggingEnabled)
                    {
                      id v864 = v476;
                      os_log_t v865 = _NRCopyLogObjectForNRUUID(*v999);
                      os_log_t v866 = v865;
                      if (sNRCopyLogToStdErr)
                      {

                        uint64_t v5 = v1004;
                      }
                      else
                      {
                        BOOL v899 = os_log_type_enabled(v865, OS_LOG_TYPE_INFO);

                        uint64_t v5 = v1004;
                        id v476 = v864;
                        if (!v899) {
                          goto LABEL_438;
                        }
                      }
                      os_log_t v900 = _NRCopyLogObjectForNRUUID(*v999);
                      _NRLogWithArgs((uint64_t)v900, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v901, v902, v903, v904, v905, (uint64_t)"");

                      id v476 = v864;
                    }
LABEL_438:
                    if (v480)
                    {
                      if (v484)
                      {
                        int v482 = 0;
                        v481 = "Invalid";
                        unint64_t v477 = 0x26AB22000;
                        goto LABEL_448;
                      }
                      unint64_t v477 = 0x26AB22000uLL;
                      goto LABEL_447;
                    }
                    unint64_t v477 = 0x26AB22000;
                    goto LABEL_445;
                  }
                  id v776 = v476;
                  os_log_t v777 = _NRCopyLogObjectForNRUUID(*v999);
                  os_log_t v778 = v777;
                  if (sNRCopyLogToStdErr)
                  {

                    uint64_t v5 = v1004;
                  }
                  else
                  {
                    BOOL v1011 = os_log_type_enabled(v777, OS_LOG_TYPE_INFO);

                    uint64_t v5 = v1004;
                    id v476 = v776;
                    if (!v1011) {
                      goto LABEL_427;
                    }
                  }
                  os_log_t v795 = _NRCopyLogObjectForNRUUID(*v999);
                  _NRLogWithArgs((uint64_t)v795, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v796, v797, v798, v799, v800, (uint64_t)"");

                  id v476 = v776;
                  goto LABEL_427;
                }
                int v470 = 0;
                v1000 = NRBluetoothPacketParserSuspendNexusBEInputSource;
                uint64_t v471 = 16;
                uint64_t v472 = 464;
                uint64_t v473 = 336;
                uint64_t v474 = 272;
                uint64_t v475 = 224;
              }
              uint64_t v993 = *(void *)(v5 + v475);
              uint64_t v1012 = *(void *)(v5 + v474);
              id v476 = *(id *)(v5 + v473);
              v1009 = (void *)(v5 + v472);
              v1010 = (unsigned char *)(v5 + v471);
              goto LABEL_426;
            }
            v783 = nrCopyLogObj_518();
            v784 = v783;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v785 = os_log_type_enabled(v783, OS_LOG_TYPE_ERROR);

              if (!v785) {
                goto LABEL_737;
              }
            }
            id v808 = nrCopyLogObj_518();
            _NRLogWithArgs((uint64_t)v808, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v809, v810, v811, v812, v813, (uint64_t)"");

LABEL_737:
            _os_log_pack_size();
            MEMORY[0x270FA5388]();
            __error();
            uint64_t v814 = _os_log_pack_fill();
            __os_log_helper_1_2_3_8_34_8_0_8_0(v814, v467);
LABEL_623:
            id v685 = nrCopyLogObj_518();
            _NRLogAbortWithPack(v685);
          }
          if (v400 == v392)
          {
            *(_DWORD *)(v389 + 16) = 0;
            goto LABEL_418;
          }
          -[NRBluetoothPacketParser handleInternalError:](v5, @"filledIn != moveOffset (%u != %llu)", v393, v394, v395, v396, v397, v398, *(unsigned int *)(v389 + 16));
LABEL_399:

          goto LABEL_347;
        }
        os_log_t v438 = _NRCopyLogObjectForNRUUID(*v6);
        os_log_t v439 = v438;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v440 = os_log_type_enabled(v438, OS_LOG_TYPE_ERROR);

          if (!v440) {
            goto LABEL_399;
          }
        }
        os_log_t v431 = _NRCopyLogObjectForNRUUID(*v6);
        v432 = createStringFromNRLinkChannelPriority(v374);
        _NRLogWithArgs((uint64_t)v431, 16, (uint64_t)"%s%.30s:%-4d Invalid link-read context ptr for prio %@", v441, v442, v443, v444, v445, (uint64_t)"");
LABEL_398:

        goto LABEL_399;
      }
LABEL_386:
      os_log_t v428 = _NRCopyLogObjectForNRUUID(*v6);
      os_log_t v429 = v428;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v430 = os_log_type_enabled(v428, OS_LOG_TYPE_ERROR);

        if (!v430) {
          goto LABEL_399;
        }
      }
      os_log_t v431 = _NRCopyLogObjectForNRUUID(*v6);
      v432 = createStringFromNRLinkChannelPriority(v374);
      _NRLogWithArgs((uint64_t)v431, 16, (uint64_t)"%s%.30s:%-4d Invalid read context %sptr for prio %@", v433, v434, v435, v436, v437, (uint64_t)"");
      goto LABEL_398;
    }
    os_log_t v419 = _NRCopyLogObjectForNRUUID(*v6);
    os_log_t v420 = v419;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v421 = os_log_type_enabled(v419, OS_LOG_TYPE_FAULT);

      if (!v421) {
        goto LABEL_386;
      }
    }
    os_log_t v422 = _NRCopyLogObjectForNRUUID(*v6);
    _NRLogWithArgs((uint64_t)v422, 17, (uint64_t)"Invalid priority %d", v423, v424, v425, v426, v427, v374);

    goto LABEL_386;
  }
LABEL_356:

LABEL_357:
  v383 = [v3 objectForKeyedSubscript:@"deactivate-datapath"];

  if (v383)
  {
    v384 = [v3 objectForKeyedSubscript:@"deactivate-datapath"];
    id v385 = [v384 objectForKeyedSubscript:@"channel-id"];
    if ([v385 integerValue] == 2)
    {
      uint64_t v386 = 2;
    }
    else if ([v385 integerValue] == 1)
    {
      uint64_t v386 = 1;
    }
    else if ([v385 integerValue] == 3)
    {
      uint64_t v386 = 3;
    }
    else
    {
      uint64_t v386 = 0;
    }

    -[NRBluetoothPacketParser resetContextForPriorityInner:teardownContext:](v5, v386, 0);
  }
  v404 = [v3 objectForKeyedSubscript:@"teardown"];

  if (v404)
  {
    v345 = [v3 objectForKeyedSubscript:@"teardown"];
    if ([v345 BOOLValue]) {
      -[NRBluetoothPacketParser teardown](v5);
    }
    goto LABEL_347;
  }
LABEL_348:
}

void __44__NRBluetoothPacketParser_armLinkStatsTimer__block_invoke(uint64_t a1)
{
  uint64_t v305 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((unsigned char *)WeakRetained + 8) != 4)
  {
    uint64_t v3 = *((void *)WeakRetained + 71);
    uint64_t v4 = *((void *)WeakRetained + 76);
    *((void *)WeakRetained + 76) = v3;
    uint64_t v5 = *((void *)WeakRetained + 70);
    uint64_t v6 = *((void *)WeakRetained + 79);
    *((void *)WeakRetained + 79) = v5;
    uint64_t v293 = *((void *)WeakRetained + 77);
    uint64_t v280 = *((void *)WeakRetained + 75);
    *((void *)WeakRetained + 77) = v280;
    uint64_t v289 = *((void *)WeakRetained + 80);
    uint64_t v291 = *((void *)WeakRetained + 74);
    *((void *)WeakRetained + 80) = v291;
    uint64_t v283 = *((void *)WeakRetained + 78);
    uint64_t v284 = *((void *)WeakRetained + 73);
    *((void *)WeakRetained + 78) = v284;
    uint64_t v281 = *((void *)WeakRetained + 81);
    uint64_t v282 = *((void *)WeakRetained + 72);
    *((void *)WeakRetained + 81) = v282;
    uint64_t v7 = *((void *)WeakRetained + 66);
    uint64_t v8 = *((void *)WeakRetained + 58);
    uint64_t v9 = *((void *)WeakRetained + 59);
    *((void *)WeakRetained + 66) = v8;
    uint64_t v10 = *((void *)WeakRetained + 67);
    *((void *)WeakRetained + 67) = v9;
    uint64_t v11 = *((void *)WeakRetained + 68);
    uint64_t v13 = *((void *)WeakRetained + 60);
    uint64_t v12 = *((void *)WeakRetained + 61);
    *((void *)WeakRetained + 68) = v13;
    uint64_t v14 = *((void *)WeakRetained + 69);
    *((void *)WeakRetained + 69) = v12;
    uint64_t v15 = *((void *)WeakRetained + 54);
    uint64_t v16 = *((void *)WeakRetained + 62);
    uint64_t v295 = *((void *)WeakRetained + 63);
    uint64_t v297 = *((void *)WeakRetained + 55);
    *((void *)WeakRetained + 62) = v15;
    *((void *)WeakRetained + 63) = v297;
    uint64_t v288 = *((void *)WeakRetained + 64);
    uint64_t v286 = *((void *)WeakRetained + 57);
    uint64_t v287 = *((void *)WeakRetained + 56);
    *((void *)WeakRetained + 64) = v287;
    uint64_t v285 = *((void *)WeakRetained + 65);
    *((void *)WeakRetained + 65) = v286;
    uint64_t v299 = (void **)WeakRetained;
    if (v3 != v4 || v5 != v6 || v8 != v7 || v13 != v11 || v9 != v10 || v12 != v14)
    {
      uint64_t v278 = v16;
      os_log_t v17 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
      os_log_t v18 = v17;
      if (sNRCopyLogToStdErr)
      {

        id WeakRetained = v299;
LABEL_12:
        os_log_t v19 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
        _NRLogWithArgs((uint64_t)v19, 0, (uint64_t)"LinkStats - BT(M): Tx [ be %4llu, bk %4llu, %8llu B, %8llu B/s ] Rx [ be %4llu, bk %4llu, %8llu B, %8llu B/s ]", v20, v21, v22, v23, v24, v8 - v7);

        uint64_t v16 = v278;
        id WeakRetained = v299;
        goto LABEL_13;
      }
      BOOL v277 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      id WeakRetained = v299;
      uint64_t v16 = v278;
      if (v277) {
        goto LABEL_12;
      }
    }
LABEL_13:
    uint64_t v279 = v15 - v16;
    uint64_t v26 = v295;
    uint64_t v25 = v297;
    if (v280 != v293 || v291 != v289 || v287 != v288 || v15 != v16 || v286 != v285 || v297 != v295)
    {
      os_log_t v27 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
      os_log_t v28 = v27;
      if (sNRCopyLogToStdErr)
      {

        id WeakRetained = v299;
LABEL_22:
        os_log_t v30 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
        uint64_t v26 = v295;
        uint64_t v25 = v297;
        _NRLogWithArgs((uint64_t)v30, 0, (uint64_t)"LinkStats - BT(U): Tx [ vo %4llu, vi %4llu, %8llu B, %8llu B/s ] Rx [ vo %4llu, vi %4llu, %8llu B, %8llu B/s ]", v31, v32, v33, v34, v35, v279);

        id WeakRetained = v299;
        goto LABEL_23;
      }
      BOOL v29 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

      id WeakRetained = v299;
      if (v29) {
        goto LABEL_22;
      }
    }
LABEL_23:
    if (v284 != v283 || v282 != v281 || v25 != v26)
    {
      os_log_t v36 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
      os_log_t v37 = v36;
      if (sNRCopyLogToStdErr)
      {

        id WeakRetained = v299;
      }
      else
      {
        BOOL v38 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

        id WeakRetained = v299;
        if (!v38) {
          goto LABEL_30;
        }
      }
      os_log_t v39 = _NRCopyLogObjectForNRUUID(*((void **)WeakRetained + 5));
      _NRLogWithArgs((uint64_t)v39, 0, (uint64_t)"LinkStats - BT(D): Tx [ vo %4llu, %8llu B, %8llu B/s ] Rx [ vo %4llu, %8llu B, %8llu B/s ]", v40, v41, v42, v43, v44, v279);

      id WeakRetained = v299;
    }
LABEL_30:
    *((unsigned char *)WeakRetained + 19) = *((unsigned char *)WeakRetained + 18);
    uint64_t v45 = (void *)*((void *)WeakRetained + 24);
    if (*(void *)(a1 + 40) * (void)v45 < 0xFuLL)
    {
LABEL_187:
      *((void *)WeakRetained + 24) = (char *)v45 + 1;
      goto LABEL_188;
    }
    uint64_t v46 = (void *)*((void *)WeakRetained + 17);
    if (v46)
    {
      uint64_t v47 = *((void *)WeakRetained + 19);
      if (!v47)
      {
LABEL_36:
        id v48 = 0;
        goto LABEL_37;
      }
      if (v47 == *((void *)WeakRetained + 18))
      {
        id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
        [v48 addObject:&unk_26BE1D968];
        id WeakRetained = v299;
        uint64_t v46 = v299[17];
        LODWORD(v47) = 1;
LABEL_37:
        *((void *)WeakRetained + 19) = *((void *)WeakRetained + 18);
        if ((v46 & 2) != 0)
        {
          uint64_t v49 = *((void *)WeakRetained + 21);
          if (v49)
          {
            if (v49 == *((void *)WeakRetained + 20))
            {
              if (!v48) {
                id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
              }
              [v48 addObject:&unk_26BE1D980];
              id WeakRetained = v299;
              uint64_t v46 = v299[17];
              LODWORD(v47) = 1;
            }
          }
        }
        *((void *)WeakRetained + 21) = *((void *)WeakRetained + 20);
        if ((v46 & 4) != 0
          && (uint64_t v50 = *((void *)WeakRetained + 23)) != 0
          && v50 == *((void *)WeakRetained + 22))
        {
          if (!v48) {
            id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v48 addObject:&unk_26BE1D998];
          v299[23] = v299[22];
          v299[24] = 0;
        }
        else
        {
          *((void *)WeakRetained + 23) = *((void *)WeakRetained + 22);
          *((void *)WeakRetained + 24) = 0;
          if (!v47) {
            goto LABEL_185;
          }
        }
        id v48 = v48;
        if (*((unsigned char *)v299 + 8) != 4)
        {
          if (v48)
          {
            id v51 = objc_alloc_init(MEMORY[0x263EFF980]);
            long long v300 = 0u;
            long long v301 = 0u;
            long long v302 = 0u;
            long long v303 = 0u;
            id v290 = v48;
            id v52 = v48;
            uint64_t v298 = [v52 countByEnumeratingWithState:&v300 objects:v304 count:16];
            if (v298)
            {
              id v294 = v51;
              uint64_t v296 = *(void *)v301;
              id v292 = v52;
              do
              {
                for (uint64_t i = 0; i != v298; ++i)
                {
                  if (*(void *)v301 != v296) {
                    objc_enumerationMutation(v52);
                  }
                  uint64_t v55 = [*(id *)(*((void *)&v300 + 1) + 8 * i) unsignedCharValue];
                  BOOL v56 = v299;
                  if (*((unsigned char *)v299 + 8) == 4)
                  {
                    unsigned __int8 v57 = v55 - 1;
                  }
                  else
                  {
                    unsigned __int8 v57 = v55 - 1;
                    if ((v55 - 1) < 3)
                    {
                      uint64_t v58 = (v55 - 1);
                      uint64_t v59 = v299[2 * v57 + 12];
                      if (!v59) {
                        goto LABEL_56;
                      }
                      uint64_t v60 = v59[3];
                      if (!v60) {
                        goto LABEL_56;
                      }
                      unsigned int v61 = 0;
                      os_log_t v62 = (os_log_t)off_263FD11B8[v58];
                      int v63 = *(unsigned __int8 *)(v60 + 82);
                      while (2)
                      {
                        unsigned int v71 = (((117 * v63) >> 8)
                             + (((v63 - ((unsigned __int16)(117 * v63) >> 8)) & 0xFE) >> 1)) >> 3;
                        int v72 = v63 - 11 * v71;
                        int v73 = *(_DWORD *)(v60 + 4 * (v63 - 11 * v71) + 36);
                        if (v73)
                        {
                          os_log_t v74 = _NRCopyLogObjectForNRUUID(v56[5]);
                          os_log_t v75 = v74;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_73;
                          }
                          BOOL v76 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);

                          if (v76)
                          {
LABEL_73:
                            os_log_t v77 = _NRCopyLogObjectForNRUUID(v299[5]);
                            _NRLogWithArgs((uint64_t)v77, 0, (uint64_t)"LinkStats : %@ -----------------------------------", v78, v79, v80, v81, v82, (uint64_t)v62);
                          }
                          BOOL v56 = v299;
                          if (v73)
                          {
                            os_log_t v83 = _NRCopyLogObjectForNRUUID(v299[5]);
                            os_log_t v84 = v83;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_78;
                            }
                            BOOL v85 = os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v85)
                            {
LABEL_78:
                              os_log_t v86 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v86, 0, (uint64_t)"LinkStats : %@ NtL - StartNtL", v87, v88, v89, v90, v91, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 2) != 0)
                          {
                            os_log_t v92 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v93 = v92;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_83;
                            }
                            BOOL v94 = os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v94)
                            {
LABEL_83:
                              os_log_t v95 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v95, 0, (uint64_t)"LinkStats : %@ NtL - WaitForLinkOutput", v96, v97, v98, v99, v100, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 4) != 0)
                          {
                            os_log_t v101 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v102 = v101;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_88;
                            }
                            BOOL v103 = os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v103)
                            {
LABEL_88:
                              os_log_t v104 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v104, 0, (uint64_t)"LinkStats : %@ NtL - WriteContextInvalid", v105, v106, v107, v108, v109, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 8) != 0)
                          {
                            os_log_t v110 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v111 = v110;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_93;
                            }
                            BOOL v112 = os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v112)
                            {
LABEL_93:
                              os_log_t v113 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v113, 0, (uint64_t)"LinkStats : %@ NtL - StartNtLOuter", v114, v115, v116, v117, v118, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x10) != 0)
                          {
                            os_log_t v119 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v120 = v119;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_98;
                            }
                            BOOL v121 = os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v121)
                            {
LABEL_98:
                              os_log_t v122 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v122, 0, (uint64_t)"LinkStats : %@ NtL - StartNtLInner", v123, v124, v125, v126, v127, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x20) != 0)
                          {
                            os_log_t v128 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v129 = v128;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_103;
                            }
                            BOOL v130 = os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v130)
                            {
LABEL_103:
                              os_log_t v131 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v131, 0, (uint64_t)"LinkStats : %@ NtL - WroteBytesLWB", v132, v133, v134, v135, v136, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x40) != 0)
                          {
                            os_log_t v137 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v138 = v137;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_108;
                            }
                            BOOL v139 = os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v139)
                            {
LABEL_108:
                              os_log_t v140 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v140, 0, (uint64_t)"LinkStats : %@ NtL - NotEnoughRoomForMaxTLVLen", v141, v142, v143, v144, v145, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x80) != 0)
                          {
                            os_log_t v146 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v147 = v146;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_113;
                            }
                            BOOL v148 = os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v148)
                            {
LABEL_113:
                              os_log_t v149 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v149, 0, (uint64_t)"LinkStats : %@ NtL - WroteBytesSlot", v150, v151, v152, v153, v154, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x100) != 0)
                          {
                            os_log_t v155 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v156 = v155;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_118;
                            }
                            BOOL v157 = os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v157)
                            {
LABEL_118:
                              os_log_t v158 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v158, 0, (uint64_t)"LinkStats : %@ NtL - WroteBytesBuflet", v159, v160, v161, v162, v163, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x200) != 0)
                          {
                            os_log_t v164 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v165 = v164;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_123;
                            }
                            BOOL v166 = os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v166)
                            {
LABEL_123:
                              os_log_t v167 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v167, 0, (uint64_t)"LinkStats : %@ NtL - NoDataToWrite", v168, v169, v170, v171, v172, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x400) != 0)
                          {
                            os_log_t v173 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v174 = v173;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_128;
                            }
                            BOOL v175 = os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v175)
                            {
LABEL_128:
                              os_log_t v176 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v176, 0, (uint64_t)"LinkStats : %@ NtL - NoDataFromNexus", v177, v178, v179, v180, v181, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x800) != 0)
                          {
                            os_log_t v182 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v183 = v182;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_133;
                            }
                            BOOL v184 = os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v184)
                            {
LABEL_133:
                              os_log_t v185 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v185, 0, (uint64_t)"LinkStats : %@ NtL - InvokeSendCallback", v186, v187, v188, v189, v190, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x1000) != 0)
                          {
                            os_log_t v191 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v192 = v191;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_138;
                            }
                            BOOL v193 = os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v193)
                            {
LABEL_138:
                              os_log_t v194 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v194, 0, (uint64_t)"LinkStats : %@ NtL - NoOutputSpace", v195, v196, v197, v198, v199, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x2000) != 0)
                          {
                            os_log_t v200 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v201 = v200;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_143;
                            }
                            BOOL v202 = os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v202)
                            {
LABEL_143:
                              os_log_t v203 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v203, 0, (uint64_t)"LinkStats : %@ NtL - MemmovingLWB", v204, v205, v206, v207, v208, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x4000) != 0)
                          {
                            os_log_t v209 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v210 = v209;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_148;
                            }
                            BOOL v211 = os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v211)
                            {
LABEL_148:
                              os_log_t v212 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v212, 0, (uint64_t)"LinkStats : %@ NtL - NotMemmovingLWB", v213, v214, v215, v216, v217, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x8000) != 0)
                          {
                            os_log_t v218 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v219 = v218;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_153;
                            }
                            BOOL v220 = os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v220)
                            {
LABEL_153:
                              os_log_t v221 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v221, 0, (uint64_t)"LinkStats : %@ NtL - EndNtLInner", v222, v223, v224, v225, v226, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x10000) != 0)
                          {
                            os_log_t v227 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v228 = v227;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_158;
                            }
                            BOOL v229 = os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v229)
                            {
LABEL_158:
                              os_log_t v230 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v230, 0, (uint64_t)"LinkStats : %@ NtL - RxSync", v231, v232, v233, v234, v235, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x20000) != 0)
                          {
                            os_log_t v236 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v237 = v236;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_163;
                            }
                            BOOL v238 = os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v238)
                            {
LABEL_163:
                              os_log_t v239 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v239, 0, (uint64_t)"LinkStats : %@ NtL - EndNtLOuter", v240, v241, v242, v243, v244, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x40000) != 0)
                          {
                            os_log_t v245 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v246 = v245;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                              goto LABEL_168;
                            }
                            BOOL v247 = os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT);

                            BOOL v56 = v299;
                            if (v247)
                            {
LABEL_168:
                              os_log_t v248 = _NRCopyLogObjectForNRUUID(v56[5]);
                              _NRLogWithArgs((uint64_t)v248, 0, (uint64_t)"LinkStats : %@ NtL - FinishNtL", v249, v250, v251, v252, v253, (uint64_t)v62);

                              BOOL v56 = v299;
                            }
                          }
                          if ((v73 & 0x80000) != 0)
                          {
                            os_log_t v254 = _NRCopyLogObjectForNRUUID(v56[5]);
                            os_log_t v255 = v254;
                            if (sNRCopyLogToStdErr)
                            {

                              BOOL v56 = v299;
                            }
                            else
                            {
                              BOOL v256 = os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT);

                              BOOL v56 = v299;
                              if (!v256) {
                                goto LABEL_68;
                              }
                            }
                            os_log_t v64 = _NRCopyLogObjectForNRUUID(v56[5]);
                            _NRLogWithArgs((uint64_t)v64, 0, (uint64_t)"LinkStats : %@ NtL - LinkOutputAvailable", v65, v66, v67, v68, v69, (uint64_t)v62);

                            BOOL v56 = v299;
                          }
                        }
LABEL_68:
                        int v63 = v72 + 1;
                        if (v61++ >= 0xA)
                        {
                          id v52 = v292;
                          id v51 = v294;
                          goto LABEL_178;
                        }
                        continue;
                      }
                    }
                    os_log_t v257 = _NRCopyLogObjectForNRUUID(v299[5]);
                    os_log_t v258 = v257;
                    if (sNRCopyLogToStdErr)
                    {
                    }
                    else
                    {
                      BOOL v259 = os_log_type_enabled(v257, OS_LOG_TYPE_FAULT);

                      os_log_t v54 = &unk_26BE1D9F8;
                      if (!v259) {
                        goto LABEL_57;
                      }
                    }
                    os_log_t v62 = _NRCopyLogObjectForNRUUID(v299[5]);
                    _NRLogWithArgs((uint64_t)v62, 17, (uint64_t)"Invalid priority %d", v260, v261, v262, v263, v264, v55);
LABEL_178:
                  }
                  os_log_t v54 = &unk_26BE1D9F8;
                  if (v57 <= 2u)
                  {
                    uint64_t v58 = v57;
LABEL_56:
                    os_log_t v54 = (void *)qword_263FD11F0[v58];
                  }
LABEL_57:
                  [v51 addObject:v54];
                }
                uint64_t v298 = [v52 countByEnumeratingWithState:&v300 objects:v304 count:16];
              }
              while (v298);
            }

            id v265 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            [v265 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"datapath-report-stall"];
            [v265 setObject:v51 forKeyedSubscript:@"channel-id-list"];
            -[NRBluetoothPacketParser sendDatapathReport:]((uint64_t)v299, v265);

            id v48 = v290;
            goto LABEL_182;
          }
          uint64_t v268 = nrCopyLogObj_518();
          uint64_t v269 = v268;
          if (sNRCopyLogToStdErr)
          {

LABEL_194:
            id v271 = nrCopyLogObj_518();
            _NRLogWithArgs((uint64_t)v271, 17, (uint64_t)"%s called with null linkChannelPriorityArray", v272, v273, v274, v275, v276, (uint64_t)"-[NRBluetoothPacketParser reportDataStall:]");

            goto LABEL_182;
          }
          BOOL v270 = os_log_type_enabled(v268, OS_LOG_TYPE_FAULT);

          if (v270) {
            goto LABEL_194;
          }
        }
LABEL_182:

        id WeakRetained = v299;
        uint64_t v266 = (uint64_t)v299[25] + 1;
        v299[25] = (void *)v266;
        if ((unint64_t)(15 * v266) < 0xB4)
        {
LABEL_186:

          id WeakRetained = v299;
          uint64_t v45 = v299[24];
          goto LABEL_187;
        }
        if (*((unsigned char *)v299 + 8) != 4)
        {
          id v267 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [v267 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"datapath-report-remediate"];
          -[NRBluetoothPacketParser sendDatapathReport:]((uint64_t)v299, v267);

          id WeakRetained = v299;
        }
LABEL_185:
        *((void *)WeakRetained + 25) = 0;
        goto LABEL_186;
      }
    }
    LODWORD(v47) = 0;
    goto LABEL_36;
  }
LABEL_188:
}

- (void)sendDatapathReport:(uint64_t)a1
{
  id v13 = a2;
  os_log_t v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  os_log_t v4 = v3;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (!v5) {
      goto LABEL_5;
    }
  }
  os_log_t v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
  _NRLogWithArgs((uint64_t)v6, 0, (uint64_t)"%s%.30s:%-4d sending datapath report: %@", v7, v8, v9, v10, v11, (uint64_t)"");

LABEL_5:
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v12 setObject:v13 forKeyedSubscript:@"datapath-report"];
  [*(id *)(a1 + 400) sendXPCCommDictionary:v12];
}

- (void)updateReadyStateIfApplicable
{
  if (*(unsigned char *)(a1 + 8) != 3 && [*(id *)(a1 + 64) count] && *(unsigned char *)(a1 + 10))
  {
    -[NRBluetoothPacketParser changeStateTo:](a1, 3);
  }
}

- (void)setupNexusChannelForPriority:(void *)a3 channelUUID:
{
  v60[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!os_channel_attr_create())
  {
    uint64_t v45 = @"os_channel_attr_create() failed";
LABEL_16:
    -[NRBluetoothPacketParser handleInternalError:](a1, v45, v6, v7, v8, v9, v10, v11, v46);
    goto LABEL_17;
  }
  os_channel_attr_set();
  v60[0] = 0;
  v60[1] = 0;
  [v5 getUUIDBytes:v60];
  uint64_t extended = os_channel_create_extended();
  if (!extended)
  {
    uint64_t v45 = @"os_channel_create_extended() failed";
    goto LABEL_16;
  }
  uint64_t v13 = extended;
  os_channel_attr_destroy();
  os_channel_ring_id();
  uint64_t v14 = os_channel_rx_ring();
  if (!v14)
  {
    uint64_t v45 = @"os_channel_rx_ring() failed";
    goto LABEL_16;
  }
  uint64_t v15 = v14;
  os_channel_ring_id();
  uint64_t v16 = os_channel_tx_ring();
  if (!v16)
  {
    uint64_t v45 = @"os_channel_tx_ring() failed";
    goto LABEL_16;
  }
  uint64_t v17 = v16;
  unsigned int fd = os_channel_get_fd();
  if ((fd & 0x80000000) != 0)
  {
    uint64_t v45 = @"os_channel_get_fd() failed";
    goto LABEL_16;
  }
  unsigned int v19 = fd;
  uint64_t v26 = dispatch_group_create();
  if (v26)
  {
    uintptr_t v27 = v19;
    os_log_t v28 = dispatch_source_create(MEMORY[0x263EF83E8], v19, 0, *(dispatch_queue_t *)(a1 + 56));
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke;
    handler[3] = &unk_263FD1150;
    void handler[4] = a1;
    char v59 = a2;
    dispatch_source_set_event_handler(v28, handler);
    dispatch_group_enter(v26);
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_2;
    v56[3] = &unk_263FD1360;
    BOOL v29 = v26;
    unsigned __int8 v57 = v29;
    dispatch_source_set_cancel_handler(v28, v56);
    dispatch_activate(v28);
    os_log_t v30 = dispatch_source_create(MEMORY[0x263EF8418], v27, 0, *(dispatch_queue_t *)(a1 + 56));
    os_log_t v37 = v30;
    if (v30)
    {
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_3;
      v54[3] = &unk_263FD1150;
      v54[4] = a1;
      char v55 = a2;
      dispatch_source_set_event_handler(v30, v54);
      dispatch_group_enter(v29);
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_4;
      v52[3] = &unk_263FD1360;
      BOOL v38 = v29;
      os_log_t v53 = v38;
      dispatch_source_set_cancel_handler(v37, v52);
      os_log_t v39 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_5;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v13;
      dispatch_group_notify(v38, v39, block);
      uint64_t v50 = v28;
      uint64_t v49 = v37;
      uint64_t v40 = v38;
      unsigned __int8 v41 = a2 - 100;
      if ((a2 - 100) <= 3u)
      {
        uint64_t v42 = 8 * (char)(a2 - 100);
        uint64_t v47 = *(void *)((char *)&unk_20A0B3788 + v42);
        uint64_t v48 = *(void *)((char *)&unk_20A0B3768 + v42);
        uint64_t v43 = a1 + 8 * (a2 - 100);
        *(void *)(v43 + 208) = v13;
        uint64_t v44 = a1 + 16 * v41;
        *(void *)(v44 + 240) = v15;
        *(void *)(v44 + 248) = v17;
        objc_storeStrong((id *)(v44 + 304), v28);
        objc_storeStrong((id *)(v44 + 312), v37);
        objc_storeStrong((id *)(v43 + 368), v26);
        *(void *)(a1 + 136) = *(void *)(a1 + 136) & v48 | v47;
      }
    }
    else
    {
      -[NRBluetoothPacketParser handleInternalError:](a1, @"invalid output dispatch source (prio %u)", v31, v32, v33, v34, v35, v36, a2);
    }
  }
  else
  {
    -[NRBluetoothPacketParser handleInternalError:](a1, @"invalid nexus group (prio %u)", v20, v21, v22, v23, v24, v25, a2);
  }

LABEL_17:
}

void __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v409 = *MEMORY[0x263EF8340];
  unint64_t v2 = 0x26AB22000uLL;
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v249 = _NRCopyLogObjectForNRUUID(*(void **)(*(void *)(a1 + 32) + 40));
    os_log_t v250 = v249;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v253 = os_log_type_enabled(v249, OS_LOG_TYPE_INFO);

      unint64_t v2 = 0x26AB22000;
      if (!v253) {
        goto LABEL_2;
      }
    }
    os_log_t v254 = _NRCopyLogObjectForNRUUID(*(void **)(*(void *)(v1 + 32) + 40));
    StringForNRNexusChannelPriority = createStringForNRNexusChannelPriority(*(unsigned __int8 *)(v1 + 40));
    _NRLogWithArgs((uint64_t)v254, 1, (uint64_t)"%s%.30s:%-4d Nexus input available - %@", v255, v256, v257, v258, v259, (uint64_t)"");

    unint64_t v2 = 0x26AB22000;
  }
LABEL_2:
  *(unsigned char *)(*(void *)(v1 + 32) + 12) = 1;
  uint64_t v3 = *(void *)(v1 + 32);
  if (*(unsigned char *)(v3 + 8) == 4) {
    goto LABEL_269;
  }
  int v4 = *(unsigned __int8 *)(v1 + 40);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  switch(v4)
  {
    case 'd':
      id v5 = NRBluetoothPacketParserSuspendNexusVOInputSource;
      int v6 = 1;
      uint64_t v7 = 14;
      uint64_t v8 = 432;
      uint64_t v9 = 304;
      uint64_t v10 = 240;
      goto LABEL_5;
    case 'e':
      id v5 = NRBluetoothPacketParserSuspendNexusVIInputSource;
      int v6 = 1;
      uint64_t v7 = 15;
      uint64_t v8 = 448;
      uint64_t v9 = 320;
      uint64_t v10 = 256;
      goto LABEL_5;
    case 'g':
      int v6 = 0;
      id v5 = NRBluetoothPacketParserSuspendNexusBKInputSource;
      uint64_t v7 = 17;
      uint64_t v8 = 480;
      uint64_t v9 = 352;
      uint64_t v10 = 288;
LABEL_5:
      uint64_t v11 = *(void *)(v3 + v10);
      id v12 = *(id *)(v3 + v9);
      unsigned int v400 = (void *)(v3 + v8);
      v401 = (unsigned char *)(v3 + v7);
      unint64_t v2 = 0x26AB22000uLL;
      if (!gNRPacketLoggingEnabled) {
        goto LABEL_6;
      }
      goto LABEL_28;
    case 'f':
      int v6 = 0;
      id v5 = NRBluetoothPacketParserSuspendNexusBEInputSource;
      uint64_t v7 = 16;
      uint64_t v8 = 464;
      uint64_t v9 = 336;
      uint64_t v10 = 272;
      goto LABEL_5;
  }
  unsigned int v400 = 0;
  v401 = 0;
  id v5 = 0;
  int v6 = 0;
  id v12 = 0;
  uint64_t v11 = 0;
  if (!*(unsigned char *)(v2 + 1313)) {
    goto LABEL_6;
  }
LABEL_28:
  os_log_t v21 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
  os_log_t v22 = v21;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v262 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);

    unint64_t v2 = 0x26AB22000;
    if (!v262) {
      goto LABEL_6;
    }
  }
  os_log_t v263 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
  _NRLogWithArgs((uint64_t)v263, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v264, v265, v266, v267, v268, (uint64_t)"");

  unint64_t v2 = 0x26AB22000;
LABEL_6:
  unsigned int v13 = *(unsigned __int8 *)(v3 + 10);
  int v14 = (v13 >> 3) & 1;
  if (v4 != 100) {
    int v14 = 0;
  }
  char v402 = v14;
  uint64_t v395 = v3;
  if (v14 == 1)
  {
    uint64_t v15 = (void *)(v3 + 128);
    uint64_t v16 = "Isochronous";
    int v17 = 3;
    goto LABEL_32;
  }
  if (!v6) {
    goto LABEL_24;
  }
  if ((v13 & 4) == 0)
  {
    uint64_t v18 = *(void *)(v3 + 104);
    if (!v18) {
      goto LABEL_24;
    }
    if ((*(unsigned char *)(*(void *)v18 + 27) & 3) == 1 && !*(unsigned char *)(v3 + 12))
    {

      char v20 = 0;
      id v5 = 0;
      id v12 = 0;
      uint64_t v11 = 0;
      unsigned int v19 = (void *)(v3 + 112);
      if (!*(unsigned char *)(v3 + 12)) {
        goto LABEL_21;
      }
    }
    else
    {
      unsigned int v19 = 0;
      char v20 = 1;
      if (!*(unsigned char *)(v3 + 12)) {
        goto LABEL_21;
      }
    }
    if (!*(unsigned char *)(v2 + 1313)) {
      goto LABEL_21;
    }
    os_log_t v288 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
    os_log_t v289 = v288;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v304 = os_log_type_enabled(v288, OS_LOG_TYPE_INFO);

      unint64_t v2 = 0x26AB22000;
      if (!v304) {
        goto LABEL_21;
      }
    }
    os_log_t v305 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
    _NRLogWithArgs((uint64_t)v305, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v306, v307, v308, v309, v310, (uint64_t)"");

    unint64_t v2 = 0x26AB22000;
LABEL_21:
    if (v19)
    {
      uint64_t v15 = v19;
      if (v20)
      {
        int v17 = 0;
        uint64_t v16 = "Invalid";
        goto LABEL_32;
      }
      goto LABEL_31;
    }
LABEL_24:
    uint64_t v15 = (void *)(v3 + 96);
    uint64_t v16 = "Medium";
    int v17 = 1;
    goto LABEL_32;
  }
  uint64_t v15 = (void *)(v3 + 112);
LABEL_31:
  uint64_t v16 = "High";
  int v17 = 2;
LABEL_32:
  uint64_t v394 = (void **)v15;
  uint64_t v23 = (void *)*v15;
  if (v23)
  {
    uint64_t v24 = v23[3];
    if ((*(unsigned char *)(v24 + 84) & 1) == 0)
    {
      int v378 = v17;
      uint64_t v397 = v11;
      int v382 = v5;
      id v379 = v12;
      uint64_t v380 = v1;
      uint64_t v25 = v3;
      int v26 = 0;
      __int16 v27 = 0;
      unsigned __int8 v396 = 0;
      int v28 = *(unsigned __int8 *)(v24 + 83);
      uint64_t v29 = 568;
      if (v28 == 3) {
        uint64_t v29 = 584;
      }
      BOOL v30 = v28 == 2;
      uint64_t v31 = 600;
      if (!v30) {
        uint64_t v31 = v29;
      }
      uint64_t v392 = v31;
      uint64_t v398 = v25 + 688;
      uint64_t v399 = v25 + 672;
      int v32 = 9;
      uint64_t v381 = *(char **)(v24 + 8);
      if (!*(unsigned char *)(v2 + 1313)) {
        goto LABEL_43;
      }
LABEL_39:
      os_log_t v33 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
      os_log_t v34 = v33;
      if (sNRCopyLogToStdErr)
      {

LABEL_42:
        os_log_t v36 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
        _NRLogWithArgs((uint64_t)v36, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v37, v38, v39, v40, v41, (uint64_t)"");

        unint64_t v2 = 0x26AB22000uLL;
        goto LABEL_43;
      }
      BOOL v35 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);

      unint64_t v2 = 0x26AB22000;
      if (v35) {
        goto LABEL_42;
      }
LABEL_43:
      uint64_t next_slot = 0;
      uint64_t v43 = 0;
      int v393 = 0;
      long long v407 = 0u;
      long long v408 = 0u;
      long long v405 = 0u;
      long long v406 = 0u;
      if (*(unsigned char *)(v2 + 1313))
      {
LABEL_44:
        os_log_t v44 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
        os_log_t v45 = v44;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v46 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);

          unint64_t v2 = 0x26AB22000;
          if (!v46) {
            goto LABEL_48;
          }
        }
        os_log_t v47 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
        _NRLogWithArgs((uint64_t)v47, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v48, v49, v50, v51, v52, (uint64_t)"");

        unint64_t v2 = 0x26AB22000uLL;
      }
LABEL_48:
      while (1)
      {
        int v53 = v32 | 0x10;
        if ((v402 & 1) == 0)
        {
          unsigned int v55 = *(_DWORD *)(v24 + 28);
          uint64_t v54 = *(unsigned int *)(v24 + 32);
          if (v55 > v54) {
            break;
          }
        }
LABEL_58:
        if (v397) {
          uint64_t next_slot = os_channel_get_next_slot();
        }
        if (next_slot)
        {
          uint64_t v61 = next_slot;
          while (1)
          {
            unsigned int v62 = 0x4000 - *(unsigned __int16 *)(v24 + 80);
            if (v62 < nrMaxTLVLengthForPacket(v406, WORD1(v405)))
            {
              v53 |= 0x40u;
              if (!gNRPacketLoggingEnabled)
              {
LABEL_103:
                uint64_t next_slot = v61;
                unint64_t v2 = 0x26AB22000;
                goto LABEL_105;
              }
              os_log_t v146 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              os_log_t v147 = v146;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v160 = os_log_type_enabled(v146, OS_LOG_TYPE_INFO);

                if (!v160) {
                  goto LABEL_103;
                }
              }
              os_log_t v161 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              _NRLogWithArgs((uint64_t)v161, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v162, v163, v164, v165, v166, (uint64_t)"");

              goto LABEL_103;
            }
            os_channel_slot_get_packet();
            os_packet_get_next_buflet();
            unsigned int data_offset = os_buflet_get_data_offset();
            uint64_t object_address = os_buflet_get_object_address();
            unsigned int data_length = os_buflet_get_data_length();
            if (data_length >= 0x10000)
            {
              if (nrCopyLogObj_onceToken_521 != -1) {
                dispatch_once(&nrCopyLogObj_onceToken_521, &__block_literal_global_400);
              }
              if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_522, OS_LOG_TYPE_ERROR)) {
                _NRLogWithArgs(nrCopyLogObj_sNRLogObj_522, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen <= 65535", v66, v67, v68, v69, v70, (uint64_t)"");
              }
              _os_log_pack_size();
              MEMORY[0x270FA5388]();
              __error();
              uint64_t v235 = _os_log_pack_fill();
              *(_DWORD *)uint64_t v235 = 136446210;
              *(void *)(v235 + 4) = "NRBluetoothPacketParserNexusToLinkLoop";
              id v236 = nrCopyLogObj_518();
              _NRLogAbortWithPack(v236);
            }
            unsigned __int16 v71 = data_length;
            if (!(_WORD)data_length && WORD1(v405))
            {
              unint64_t v403 = 0;
              uint64_t v404 = 0;
              unint64_t v403 = *(void *)v24 + *(unsigned __int16 *)(v24 + 80);
              LODWORD(v404) = v62;
              int v72 = nrPacketToTLV((unsigned __int8 *)v406, WORD1(v405), (uint64_t)&v403, 1u, v399, v398);
              unint64_t v2 = 0x26AB22000uLL;
              if (!gNRPacketLoggingEnabled)
              {
LABEL_67:
                v53 |= 0x80u;
                goto LABEL_73;
              }
              os_log_t v77 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              os_log_t v78 = v77;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v83 = os_log_type_enabled(v77, OS_LOG_TYPE_INFO);

                unint64_t v2 = 0x26AB22000;
                if (!v83) {
                  goto LABEL_67;
                }
              }
              os_log_t v84 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              uint64_t v85 = v406;
              unsigned int v86 = WORD1(v405);
              if (isPacketValidIPv6((unsigned char *)v406, WORD1(v405))) {
                isNextHeaderValidESP(v85, v86);
              }
              uint64_t v87 = v406;
              unsigned int v88 = WORD1(v405);
              if (isPacketValidIPv6((unsigned char *)v406, WORD1(v405))) {
                isNextHeaderValidESP(v87, v88);
              }
              _NRLogWithArgs((uint64_t)v84, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v89, v90, v91, v92, v93, (uint64_t)"");

              unint64_t v2 = 0x26AB22000;
              goto LABEL_67;
            }
            if ((_WORD)data_length)
            {
              int v73 = (unsigned __int8 *)(object_address + data_offset);
              unint64_t v403 = 0;
              uint64_t v404 = 0;
              unint64_t v403 = *(void *)v24 + *(unsigned __int16 *)(v24 + 80);
              LODWORD(v404) = v62;
              int v72 = nrPacketToTLV(v73, (unsigned __int16)data_length, (uint64_t)&v403, 1u, v399, v398);
              unint64_t v2 = 0x26AB22000uLL;
              if (!gNRPacketLoggingEnabled)
              {
LABEL_70:
                v53 |= 0x100u;
                goto LABEL_73;
              }
              os_log_t v79 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              os_log_t v80 = v79;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v94 = os_log_type_enabled(v79, OS_LOG_TYPE_INFO);

                unint64_t v2 = 0x26AB22000;
                if (!v94) {
                  goto LABEL_70;
                }
              }
              os_log_t v383 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              if (isPacketValidIPv6(v73, v71)) {
                isNextHeaderValidESP((uint64_t)v73, v71);
              }
              unint64_t v2 = 0x26AB22000;
              if (isPacketValidIPv6(v73, v71)) {
                isNextHeaderValidESP((uint64_t)v73, v71);
              }
              _NRLogWithArgs((uint64_t)v383, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v95, v96, v97, v98, v99, (uint64_t)"");

              goto LABEL_70;
            }
            v53 |= 0x200u;
            unint64_t v2 = 0x26AB22000uLL;
            if (!gNRPacketLoggingEnabled)
            {
              int v72 = 0;
              goto LABEL_73;
            }
            uint64_t v81 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
            uint64_t v82 = v81;
            if (sNRCopyLogToStdErr) {
              break;
            }
            int v72 = os_log_type_enabled(v81, OS_LOG_TYPE_INFO);

            if (v72) {
              goto LABEL_99;
            }
LABEL_100:
            unint64_t v2 = 0x26AB22000;
LABEL_73:
            *(_WORD *)(v24 + 80) += v72;
            if (v402) {
              uint64_t v74 = 0;
            }
            else {
              uint64_t v74 = os_channel_get_next_slot();
            }
            ++v27;
            ++*v400;
            unsigned char *v401 = 1;
            v26 += v72;
            if (!v74)
            {
              uint64_t next_slot = 0;
              uint64_t v43 = v61;
              goto LABEL_105;
            }
            unsigned int v75 = *(unsigned __int8 *)(v24 + 82);
            if (v75 >= 0xB)
            {
              unsigned int v75 = *(unsigned __int8 *)(v24 + 82)
                  - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v24 + 82)) >> 32);
              *(unsigned char *)(v24 + 82) = v75;
            }
            *(_DWORD *)(v24 + 4 * v75 + 36) = v53;
            unsigned int v76 = (117 * (*(unsigned char *)(v24 + 82) + 1)) >> 8;
            *(unsigned char *)(v24 + 82) = *(unsigned char *)(v24 + 82)
                                 + 1
                                 - 11 * ((v76 + (((*(unsigned char *)(v24 + 82) + 1 - v76) & 0xFE) >> 1)) >> 3);
            uint64_t v43 = v61;
            uint64_t v61 = v74;
            int v53 = 0;
          }

LABEL_99:
          os_log_t v100 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
          _NRLogWithArgs((uint64_t)v100, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v101, v102, v103, v104, v105, (uint64_t)"");

          int v72 = 0;
          goto LABEL_100;
        }
LABEL_105:
        int v106 = *(unsigned __int16 *)(v24 + 80);
        BOOL v107 = *(_WORD *)(v24 + 80) != 0;
        if (!*(_WORD *)(v24 + 80))
        {
          int v109 = v53 | 0x400;
          if (!*(unsigned char *)(v2 + 1313))
          {
            BOOL v107 = 0;
            BOOL v203 = 1;
            int v204 = v109 | 0x8000;
            if (!v43) {
              goto LABEL_181;
            }
LABEL_190:
            os_channel_advance_slot();
            *(unsigned char *)(v395 + 13) = 1;
LABEL_191:
            if (v396 > 8u || v397 && os_channel_available_slot_count() <= 1)
            {
              if (!*(unsigned char *)(v2 + 1313)) {
                goto LABEL_195;
              }
              os_log_t v218 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              os_log_t v219 = v218;
              if (sNRCopyLogToStdErr)
              {

                goto LABEL_210;
              }
              BOOL v227 = os_log_type_enabled(v218, OS_LOG_TYPE_INFO);

              unint64_t v2 = 0x26AB22000;
              if (v227)
              {
LABEL_210:
                os_log_t v228 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
                _NRLogWithArgs((uint64_t)v228, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v229, v230, v231, v232, v233, (uint64_t)"");

                unint64_t v2 = 0x26AB22000;
              }
LABEL_195:
              int v204 = v109 | 0x18000;
              os_channel_sync();
              *(unsigned char *)(v395 + 13) = 0;
            }
LABEL_196:
            if (v107 && v203)
            {
              unsigned int v214 = *(unsigned __int8 *)(v24 + 82);
              if (v214 >= 0xB)
              {
                unsigned int v214 = *(unsigned __int8 *)(v24 + 82)
                     - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v24 + 82)) >> 32);
                *(unsigned char *)(v24 + 82) = v214;
              }
              *(_DWORD *)(v24 + 4 * v214 + 36) = v204;
              unsigned int v215 = (117 * (*(unsigned char *)(v24 + 82) + 1)) >> 8;
              *(unsigned char *)(v24 + 82) = *(unsigned char *)(v24 + 82)
                                   + 1
                                   - 11
                                   * ((v215 + (((*(unsigned char *)(v24 + 82) + 1 - v215) & 0xFE) >> 1)) >> 3);
              int v32 = 8;
              if (*(unsigned char *)(v2 + 1313)) {
                goto LABEL_39;
              }
              goto LABEL_43;
            }
            BOOL v237 = v107;
            if (*(unsigned char *)(v2 + 1313))
            {
              os_log_t v283 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              os_log_t v284 = v283;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v290 = os_log_type_enabled(v283, OS_LOG_TYPE_INFO);

                unint64_t v2 = 0x26AB22000;
                if (!v290) {
                  goto LABEL_224;
                }
              }
              os_log_t v291 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              _NRLogWithArgs((uint64_t)v291, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v292, v293, v294, v295, v296, (uint64_t)"");

              unint64_t v2 = 0x26AB22000;
            }
LABEL_224:
            uint64_t v1 = v380;
            uint64_t v238 = v395;
            id v12 = v379;
            if (v237) {
              goto LABEL_263;
            }
            if (v378 == 1)
            {
              uint64_t v243 = *(void *)(v395 + 136);
              if ((*(unsigned char *)(v395 + 10) & 4) == 0) {
                goto LABEL_247;
              }
              goto LABEL_255;
            }
            if (v378 != 2)
            {
              if (v378 == 3)
              {
                uint64_t v239 = *(void *)(v395 + 136);
                if ((v239 & 8) != 0 && *(void *)(v395 + 304))
                {
                  uint64_t v240 = (dispatch_object_t *)(v395 + 304);
                  *(void *)(v395 + 136) = v239 & 0xFFFFFFFFFFFFFFF7;
                  if (*(unsigned char *)(v2 + 1313))
                  {
                    os_log_t v241 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
                    os_log_t v242 = v241;
                    if (sNRCopyLogToStdErr)
                    {

                      goto LABEL_316;
                    }
                    BOOL v349 = os_log_type_enabled(v241, OS_LOG_TYPE_INFO);

                    if (v349)
                    {
LABEL_316:
                      os_log_t v322 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
                      _NRLogWithArgs((uint64_t)v322, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v350, v351, v352, v353, v354, (uint64_t)"");
                      goto LABEL_319;
                    }
                    goto LABEL_320;
                  }
                  goto LABEL_262;
                }
                goto LABEL_263;
              }
              uint64_t v243 = *(void *)(v395 + 136);
LABEL_247:
              if ((v243 & 8) != 0 && *(void *)(v395 + 304))
              {
                *(void *)(v395 + 136) = v243 & 0xFFFFFFFFFFFFFFF7;
                if (!*(unsigned char *)(v2 + 1313)) {
                  goto LABEL_250;
                }
                os_log_t v315 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
                os_log_t v316 = v315;
                if (sNRCopyLogToStdErr)
                {

                  uint64_t v1 = v380;
                  uint64_t v238 = v395;
                  id v12 = v379;
                  goto LABEL_312;
                }
                BOOL v335 = os_log_type_enabled(v315, OS_LOG_TYPE_INFO);

                uint64_t v1 = v380;
                uint64_t v238 = v395;
                id v12 = v379;
                unint64_t v2 = 0x26AB22000;
                if (v335)
                {
LABEL_312:
                  os_log_t v336 = _NRCopyLogObjectForNRUUID(*(void **)(v238 + 40));
                  _NRLogWithArgs((uint64_t)v336, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v337, v338, v339, v340, v341, (uint64_t)"");

                  unint64_t v2 = 0x26AB22000;
                }
LABEL_250:
                dispatch_resume(*(dispatch_object_t *)(v238 + 304));
                uint64_t v243 = *(void *)(v238 + 136);
              }
              if ((v243 & 0x10) != 0 && *(void *)(v238 + 320))
              {
                *(void *)(v238 + 136) = v243 & 0xFFFFFFFFFFFFFFEFLL;
                if (!*(unsigned char *)(v2 + 1313)) {
                  goto LABEL_254;
                }
                os_log_t v317 = _NRCopyLogObjectForNRUUID(*(void **)(v238 + 40));
                os_log_t v318 = v317;
                if (sNRCopyLogToStdErr)
                {

                  uint64_t v1 = v380;
                  uint64_t v238 = v395;
                  id v12 = v379;
                  goto LABEL_314;
                }
                BOOL v342 = os_log_type_enabled(v317, OS_LOG_TYPE_INFO);

                uint64_t v1 = v380;
                uint64_t v238 = v395;
                id v12 = v379;
                unint64_t v2 = 0x26AB22000;
                if (v342)
                {
LABEL_314:
                  os_log_t v343 = _NRCopyLogObjectForNRUUID(*(void **)(v238 + 40));
                  _NRLogWithArgs((uint64_t)v343, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v344, v345, v346, v347, v348, (uint64_t)"");

                  unint64_t v2 = 0x26AB22000;
                }
LABEL_254:
                dispatch_resume(*(dispatch_object_t *)(v238 + 320));
                uint64_t v243 = *(void *)(v238 + 136);
              }
LABEL_255:
              if ((v243 & 0x20) != 0 && *(void *)(v238 + 336))
              {
                *(void *)(v238 + 136) = v243 & 0xFFFFFFFFFFFFFFDFLL;
                if (!*(unsigned char *)(v2 + 1313)) {
                  goto LABEL_258;
                }
                os_log_t v311 = _NRCopyLogObjectForNRUUID(*(void **)(v238 + 40));
                os_log_t v312 = v311;
                if (sNRCopyLogToStdErr)
                {

                  uint64_t v1 = v380;
                  uint64_t v238 = v395;
                  id v12 = v379;
                  goto LABEL_310;
                }
                BOOL v328 = os_log_type_enabled(v311, OS_LOG_TYPE_INFO);

                uint64_t v1 = v380;
                uint64_t v238 = v395;
                id v12 = v379;
                unint64_t v2 = 0x26AB22000;
                if (v328)
                {
LABEL_310:
                  os_log_t v329 = _NRCopyLogObjectForNRUUID(*(void **)(v238 + 40));
                  _NRLogWithArgs((uint64_t)v329, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v330, v331, v332, v333, v334, (uint64_t)"");

                  unint64_t v2 = 0x26AB22000;
                }
LABEL_258:
                dispatch_resume(*(dispatch_object_t *)(v238 + 336));
                uint64_t v243 = *(void *)(v238 + 136);
              }
              if ((v243 & 0x40) != 0 && *(void *)(v238 + 352))
              {
                uint64_t v240 = (dispatch_object_t *)(v238 + 352);
                *(void *)(v238 + 136) = v243 & 0xFFFFFFFFFFFFFFBFLL;
                if (*(unsigned char *)(v2 + 1313))
                {
                  os_log_t v313 = _NRCopyLogObjectForNRUUID(*(void **)(v238 + 40));
                  os_log_t v314 = v313;
                  if (sNRCopyLogToStdErr)
                  {
                  }
                  else
                  {
                    BOOL v321 = os_log_type_enabled(v313, OS_LOG_TYPE_INFO);

                    if (!v321) {
                      goto LABEL_320;
                    }
                  }
                  os_log_t v322 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
                  _NRLogWithArgs((uint64_t)v322, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v323, v324, v325, v326, v327, (uint64_t)"");
                  goto LABEL_319;
                }
                goto LABEL_262;
              }
              goto LABEL_263;
            }
            uint64_t v244 = *(void *)(v395 + 136);
            if ((v244 & 8) != 0 && *(void *)(v395 + 304))
            {
              *(void *)(v395 + 136) = v244 & 0xFFFFFFFFFFFFFFF7;
              if (!*(unsigned char *)(v2 + 1313)) {
                goto LABEL_240;
              }
              os_log_t v319 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              os_log_t v320 = v319;
              if (sNRCopyLogToStdErr)
              {

                uint64_t v1 = v380;
                uint64_t v238 = v395;
                id v12 = v379;
                goto LABEL_322;
              }
              BOOL v361 = os_log_type_enabled(v319, OS_LOG_TYPE_INFO);

              uint64_t v1 = v380;
              uint64_t v238 = v395;
              id v12 = v379;
              unint64_t v2 = 0x26AB22000;
              if (v361)
              {
LABEL_322:
                os_log_t v362 = _NRCopyLogObjectForNRUUID(*(void **)(v238 + 40));
                _NRLogWithArgs((uint64_t)v362, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v363, v364, v365, v366, v367, (uint64_t)"");

                unint64_t v2 = 0x26AB22000;
              }
LABEL_240:
              dispatch_resume(*(dispatch_object_t *)(v238 + 304));
              uint64_t v244 = *(void *)(v238 + 136);
            }
            if ((v244 & 0x10) != 0 && *(void *)(v238 + 320))
            {
              uint64_t v240 = (dispatch_object_t *)(v238 + 320);
              *(void *)(v238 + 136) = v244 & 0xFFFFFFFFFFFFFFEFLL;
              if (*(unsigned char *)(v2 + 1313))
              {
                os_log_t v245 = _NRCopyLogObjectForNRUUID(*(void **)(v238 + 40));
                os_log_t v246 = v245;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v355 = os_log_type_enabled(v245, OS_LOG_TYPE_INFO);

                  if (!v355) {
                    goto LABEL_320;
                  }
                }
                os_log_t v322 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
                _NRLogWithArgs((uint64_t)v322, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v356, v357, v358, v359, v360, (uint64_t)"");
LABEL_319:

LABEL_320:
                uint64_t v1 = v380;
                uint64_t v238 = v395;
                id v12 = v379;
                unint64_t v2 = 0x26AB22000;
              }
LABEL_262:
              dispatch_resume(*v240);
            }
LABEL_263:
            if (*(unsigned char *)(v2 + 1313))
            {
              os_log_t v285 = _NRCopyLogObjectForNRUUID(*(void **)(v238 + 40));
              os_log_t v286 = v285;
              if (sNRCopyLogToStdErr)
              {

                uint64_t v1 = v380;
                uint64_t v287 = v395;
                id v12 = v379;
              }
              else
              {
                BOOL v297 = os_log_type_enabled(v285, OS_LOG_TYPE_INFO);

                uint64_t v1 = v380;
                uint64_t v287 = v395;
                id v12 = v379;
                if (!v297) {
                  goto LABEL_264;
                }
              }
              os_log_t v298 = _NRCopyLogObjectForNRUUID(*(void **)(v287 + 40));
              _NRLogWithArgs((uint64_t)v298, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v299, v300, v301, v302, v303, (uint64_t)"");
            }
LABEL_264:
            unsigned int v247 = *(unsigned __int8 *)(v24 + 82);
            if (v247 >= 0xB)
            {
              unsigned int v247 = *(unsigned __int8 *)(v24 + 82)
                   - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v24 + 82)) >> 32);
              *(unsigned char *)(v24 + 82) = v247;
            }
            *(_DWORD *)(v24 + 4 * v247 + 36) = v204 | 0x60000;
LABEL_267:
            unsigned int v248 = (117 * (*(unsigned char *)(v24 + 82) + 1)) >> 8;
            *(unsigned char *)(v24 + 82) = *(unsigned char *)(v24 + 82)
                                 + 1
                                 - 11
                                 * ((v248 + (((*(unsigned char *)(v24 + 82) + 1 - v248) & 0xFE) >> 1)) >> 3);
            goto LABEL_268;
          }
          os_log_t v205 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
          os_log_t v206 = v205;
          if (sNRCopyLogToStdErr)
          {

            goto LABEL_186;
          }
          BOOL v207 = os_log_type_enabled(v205, OS_LOG_TYPE_INFO);

          if (v207)
          {
LABEL_186:
            os_log_t v208 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
            _NRLogWithArgs((uint64_t)v208, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v209, v210, v211, v212, v213, (uint64_t)"");
          }
          unint64_t v2 = 0x26AB22000uLL;
LABEL_188:
          BOOL v203 = v106 == 0;
          if (!*(unsigned char *)(v2 + 1313))
          {
            int v204 = v109 | 0x8000;
            if (v43) {
              goto LABEL_190;
            }
            goto LABEL_181;
          }
          os_log_t v216 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
          os_log_t v217 = v216;
          if (sNRCopyLogToStdErr)
          {

            goto LABEL_206;
          }
          BOOL v220 = os_log_type_enabled(v216, OS_LOG_TYPE_INFO);

          if (v220)
          {
LABEL_206:
            os_log_t v221 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
            _NRLogWithArgs((uint64_t)v221, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v222, v223, v224, v225, v226, (uint64_t)"");
          }
          unint64_t v2 = 0x26AB22000;
          int v204 = v109 | 0x8000;
          if (v43) {
            goto LABEL_190;
          }
LABEL_181:
          if (*(unsigned char *)(v395 + 13)) {
            goto LABEL_191;
          }
          goto LABEL_196;
        }
        unint64_t v403 = 0;
        if (*(unsigned char *)(v2 + 1313))
        {
          os_log_t v127 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
          os_log_t v128 = v127;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v133 = os_log_type_enabled(v127, OS_LOG_TYPE_INFO);

            unint64_t v2 = 0x26AB22000;
            if (!v133) {
              goto LABEL_107;
            }
          }
          os_log_t v134 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
          _NRLogWithArgs((uint64_t)v134, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v135, v136, v137, v138, v139, (uint64_t)"");

          unint64_t v2 = 0x26AB22000;
        }
LABEL_107:
        char v108 = ((uint64_t (*)(void, void, void, unint64_t *, void, void))(*v394)[1])(**v394, *(void *)v24, *(unsigned __int16 *)(v24 + 80), &v403, 0, 0);
        if (!*(unsigned char *)(v2 + 1313)) {
          goto LABEL_108;
        }
        os_log_t v129 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
        os_log_t v130 = v129;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v385 = os_log_type_enabled(v129, OS_LOG_TYPE_INFO);

          unint64_t v2 = 0x26AB22000;
          if (!v385) {
            goto LABEL_108;
          }
        }
        os_log_t v140 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
        _NRLogWithArgs((uint64_t)v140, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v141, v142, v143, v144, v145, (uint64_t)"");

        unint64_t v2 = 0x26AB22000;
LABEL_108:
        if ((v108 & 1) == 0)
        {
          if (v382) {
            v382(v395);
          }
          *(unsigned char *)(v24 + 84) |= 1u;
          switch(*(unsigned char *)(v24 + 83))
          {
            case 0:
              os_log_t v111 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              os_log_t v112 = v111;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v384 = os_log_type_enabled(v111, OS_LOG_TYPE_ERROR);

                unint64_t v2 = 0x26AB22000;
                if (!v384) {
                  goto LABEL_128;
                }
              }
              os_log_t v118 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              _NRLogWithArgs((uint64_t)v118, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v119, v120, v121, v122, v123, (uint64_t)"");
              goto LABEL_127;
            case 1:
              uint64_t v113 = *(void *)(v395 + 136);
              ++*(void *)(v395 + 144);
              *(void *)(v395 + 136) = v113 & 0xFFFFFFFFFFFFFFFELL | *(unsigned char *)(v24 + 84) & 1;
              if (!*(unsigned char *)(v2 + 1313)) {
                goto LABEL_123;
              }
              os_log_t v114 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              os_log_t v115 = v114;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v389 = os_log_type_enabled(v114, OS_LOG_TYPE_INFO);

                unint64_t v2 = 0x26AB22000;
                if (!v389) {
                  goto LABEL_128;
                }
              }
              os_log_t v118 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              _NRLogWithArgs((uint64_t)v118, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v188, v189, v190, v191, v192, (uint64_t)"");
              goto LABEL_127;
            case 2:
              ++*(void *)(v395 + 160);
              *(void *)(v395 + 136) = *(void *)(v395 + 136) & 0xFFFFFFFFFFFFFFFDLL | (2
                                                                                        * (*(unsigned char *)(v24 + 84) & 1));
              if (!*(unsigned char *)(v2 + 1313)) {
                goto LABEL_123;
              }
              os_log_t v116 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              os_log_t v117 = v116;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v390 = os_log_type_enabled(v116, OS_LOG_TYPE_INFO);

                unint64_t v2 = 0x26AB22000;
                if (!v390) {
                  goto LABEL_128;
                }
              }
              os_log_t v118 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              _NRLogWithArgs((uint64_t)v118, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v193, v194, v195, v196, v197, (uint64_t)"");
              goto LABEL_127;
            case 3:
              ++*(void *)(v395 + 176);
              *(void *)(v395 + 136) = *(void *)(v395 + 136) & 0xFFFFFFFFFFFFFFFBLL | (4
                                                                                        * (*(unsigned char *)(v24 + 84) & 1));
              if (!*(unsigned char *)(v2 + 1313))
              {
LABEL_123:
                int v109 = v53 | 0x1800;
                unint64_t v110 = v403;
                if (v403) {
                  goto LABEL_130;
                }
                goto LABEL_136;
              }
              os_log_t v179 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              os_log_t v180 = v179;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v391 = os_log_type_enabled(v179, OS_LOG_TYPE_INFO);

                unint64_t v2 = 0x26AB22000;
                if (!v391) {
                  goto LABEL_128;
                }
              }
              os_log_t v118 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              _NRLogWithArgs((uint64_t)v118, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v198, v199, v200, v201, v202, (uint64_t)"");
LABEL_127:

              unint64_t v2 = 0x26AB22000uLL;
LABEL_128:
              int v109 = v53 | 0x1800;
              if (!*(unsigned char *)(v2 + 1313))
              {
                unint64_t v110 = v403;
                if (!v403) {
                  goto LABEL_136;
                }
                goto LABEL_130;
              }
              os_log_t v131 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              os_log_t v132 = v131;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v386 = os_log_type_enabled(v131, OS_LOG_TYPE_INFO);

                if (!v386) {
                  goto LABEL_161;
                }
              }
              os_log_t v154 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              _NRLogWithArgs((uint64_t)v154, 1, (uint64_t)"%s%.30s:%-4d ", v155, v156, v157, v158, v159, (uint64_t)"");

LABEL_161:
              unint64_t v2 = 0x26AB22000;
              unint64_t v110 = v403;
              if (v403) {
                goto LABEL_130;
              }
              break;
            default:
              goto LABEL_128;
          }
          goto LABEL_136;
        }
        int v109 = v53 | 0x800;
        unint64_t v110 = v403;
        if (v403)
        {
LABEL_130:
          if (v110 < *(unsigned __int16 *)(v24 + 80))
          {
            if (!*(unsigned char *)(v2 + 1313)) {
              goto LABEL_132;
            }
            os_log_t v148 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
            os_log_t v149 = v148;
            if (sNRCopyLogToStdErr)
            {

              goto LABEL_166;
            }
            BOOL v387 = os_log_type_enabled(v148, OS_LOG_TYPE_INFO);

            unint64_t v2 = 0x26AB22000;
            if (v387)
            {
LABEL_166:
              os_log_t v167 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
              _NRLogWithArgs((uint64_t)v167, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v168, v169, v170, v171, v172, (uint64_t)"");

              unint64_t v2 = 0x26AB22000;
            }
LABEL_132:
            v109 |= 0x2000u;
            memmove(*(void **)v24, (const void *)(*(void *)v24 + v403), *(unsigned __int16 *)(v24 + 80) - v403);
            unint64_t v124 = v403;
            *(_WORD *)(v24 + 80) -= v403;
            ++v393;
LABEL_135:
            *(void *)(v395 + v392) += v124;
            goto LABEL_136;
          }
          if (!*(unsigned char *)(v2 + 1313))
          {
LABEL_134:
            v109 |= 0x4000u;
            *(_WORD *)(v24 + 80) = 0;
            unint64_t v124 = v403;
            goto LABEL_135;
          }
          os_log_t v150 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
          os_log_t v151 = v150;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v388 = os_log_type_enabled(v150, OS_LOG_TYPE_INFO);

            unint64_t v2 = 0x26AB22000;
            if (!v388) {
              goto LABEL_134;
            }
          }
          os_log_t v173 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
          _NRLogWithArgs((uint64_t)v173, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v174, v175, v176, v177, v178, (uint64_t)"");

          unint64_t v2 = 0x26AB22000;
          goto LABEL_134;
        }
LABEL_136:
        ++v396;
        if ((v108 & 1) == 0) {
          goto LABEL_188;
        }
        unsigned int v125 = *(unsigned __int8 *)(v24 + 82);
        if (v125 >= 0xB)
        {
          unsigned int v125 = *(unsigned __int8 *)(v24 + 82)
               - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v24 + 82)) >> 32);
          *(unsigned char *)(v24 + 82) = v125;
        }
        int v32 = 0;
        *(_DWORD *)(v24 + 4 * v125 + 36) = v109;
        unsigned int v126 = (117 * (*(unsigned char *)(v24 + 82) + 1)) >> 8;
        *(unsigned char *)(v24 + 82) = *(unsigned char *)(v24 + 82)
                             + 1
                             - 11 * ((v126 + (((*(unsigned char *)(v24 + 82) + 1 - v126) & 0xFE) >> 1)) >> 3);
        if (*(unsigned char *)(v2 + 1313)) {
          goto LABEL_44;
        }
      }
      uint64_t v56 = *(unsigned __int16 *)(v24 + 80);
      if ((unsigned __int16)(v55 - v54) >= (unsigned __int16)(0x4000 - v56)) {
        size_t v57 = (unsigned __int16)(0x4000 - v56);
      }
      else {
        size_t v57 = (unsigned __int16)(v55 - v54);
      }
      memcpy((void *)(*(void *)v24 + v56), &v381[v54], v57);
      unsigned int v58 = *(_DWORD *)(v24 + 28);
      unsigned int v59 = *(_DWORD *)(v24 + 32) + v57;
      *(_DWORD *)(v24 + 32) = v59;
      if (v58 <= v59)
      {
        int v60 = 0;
      }
      else
      {
        memmove(v381, &v381[v59], v58 - v59);
        int v60 = *(_DWORD *)(v24 + 28) - *(_DWORD *)(v24 + 32);
      }
      *(_DWORD *)(v24 + 28) = v60;
      *(_DWORD *)(v24 + 32) = 0;
      *(_WORD *)(v24 + 80) += v57;
      if (!*(unsigned char *)(v2 + 1313))
      {
LABEL_57:
        int v53 = v32 | 0x30;
        v26 += v57;
        goto LABEL_58;
      }
      os_log_t v152 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
      os_log_t v153 = v152;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v181 = os_log_type_enabled(v152, OS_LOG_TYPE_INFO);

        unint64_t v2 = 0x26AB22000;
        if (!v181) {
          goto LABEL_57;
        }
      }
      os_log_t v182 = _NRCopyLogObjectForNRUUID(*(void **)(v395 + 40));
      _NRLogWithArgs((uint64_t)v182, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v183, v184, v185, v186, v187, (uint64_t)"");

      unint64_t v2 = 0x26AB22000;
      goto LABEL_57;
    }
    if (!*(unsigned char *)(v2 + 1313))
    {
LABEL_212:
      if (v5) {
        v5(v3);
      }
      unsigned int v234 = *(unsigned __int8 *)(v24 + 82);
      if (v234 >= 0xB)
      {
        unsigned int v234 = *(unsigned __int8 *)(v24 + 82)
             - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v24 + 82)) >> 32);
        *(unsigned char *)(v24 + 82) = v234;
      }
      *(_DWORD *)(v24 + 4 * v234 + 36) = 3;
      goto LABEL_267;
    }
    os_log_t v260 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
    os_log_t v261 = v260;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v276 = os_log_type_enabled(v260, OS_LOG_TYPE_INFO);

      if (!v276) {
        goto LABEL_212;
      }
    }
    os_log_t v277 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
    _NRLogWithArgs((uint64_t)v277, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v278, v279, v280, v281, v282, (uint64_t)"");

    goto LABEL_212;
  }
  if (!*(unsigned char *)(v2 + 1313)) {
    goto LABEL_273;
  }
  os_log_t v368 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
  os_log_t v369 = v368;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v370 = os_log_type_enabled(v368, OS_LOG_TYPE_INFO);

    if (!v370) {
      goto LABEL_273;
    }
  }
  os_log_t v371 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
  _NRLogWithArgs((uint64_t)v371, 1, (uint64_t)"%s%.30s:%-4d ", v372, v373, v374, v375, v376, (uint64_t)"");

LABEL_273:
  os_log_t v251 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
  os_log_t v252 = v251;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v269 = os_log_type_enabled(v251, OS_LOG_TYPE_FAULT);

    if (!v269) {
      goto LABEL_268;
    }
  }
  os_log_t v270 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
  _NRLogWithArgs((uint64_t)v270, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v271, v272, v273, v274, v275, (uint64_t)v16);

LABEL_268:
  uint64_t v3 = *(void *)(v1 + 32);
LABEL_269:
  *(unsigned char *)(v3 + 12) = 0;
}

void __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_2(uint64_t a1)
{
}

void __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_3(uint64_t a1)
{
  if (!gNRPacketLoggingEnabled) {
    goto LABEL_2;
  }
  os_log_t v17 = _NRCopyLogObjectForNRUUID(*(void **)(*(void *)(a1 + 32) + 40));
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    os_log_t v18 = v17;
    BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

    if (!v19) {
      goto LABEL_2;
    }
  }
  os_log_t v20 = _NRCopyLogObjectForNRUUID(*(void **)(*(void *)(a1 + 32) + 40));
  StringForNRNexusChannelPriority = createStringForNRNexusChannelPriority(*(unsigned __int8 *)(a1 + 40));
  _NRLogWithArgs((uint64_t)v20, 1, (uint64_t)"%s%.30s:%-4d Nexus output available - %@", v21, v22, v23, v24, v25, (uint64_t)"");

LABEL_2:
  int v2 = *(unsigned char *)(a1 + 40) & 0xFE;
  if (v2 == 100) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = v2 == 102;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3 == 2)
  {
    uint64_t v5 = 104;
    goto LABEL_9;
  }
  if (v3 == 1)
  {
    uint64_t v5 = 88;
LABEL_9:
    uint64_t v6 = *(void *)(v4 + v5);
    if (v6)
    {
      uint64_t v7 = *(void (**)(uint64_t))(v6 + 24);
      if (v7)
      {
        uint64_t v8 = *(void *)(v6 + 32);
        v7(v8);
      }
    }
    return;
  }
  os_log_t v9 = _NRCopyLogObjectForNRUUID(*(void **)(v4 + 40));
  os_log_t v10 = v9;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);

    if (!v11) {
      return;
    }
  }
  os_log_t v27 = _NRCopyLogObjectForNRUUID(*(void **)(v4 + 40));
  _NRLogWithArgs((uint64_t)v27, 17, (uint64_t)"Invalid priority %d", v12, v13, v14, v15, v16, v3);
}

void __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_4(uint64_t a1)
{
}

uint64_t __68__NRBluetoothPacketParser_setupNexusChannelForPriority_channelUUID___block_invoke_5()
{
  return os_channel_destroy();
}

- (NRBluetoothPacketParser)initWithDeviceIdentifier:(id)a3 queue:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)NRBluetoothPacketParser;
  os_log_t v9 = [(NRBluetoothPacketParser *)&v34 init];
  if (!v9)
  {
    uint64_t v23 = nrCopyLogObj_518();
    uint64_t v24 = v23;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v25 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (!v25)
      {
LABEL_12:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v32 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v32 = 136446210;
        *(void *)(v32 + 4) = "-[NRBluetoothPacketParser initWithDeviceIdentifier:queue:]";
        id v33 = nrCopyLogObj_518();
        _NRLogAbortWithPack(v33);
      }
    }
    id v26 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v26, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v27, v28, v29, v30, v31, (uint64_t)"");

    goto LABEL_12;
  }
  os_log_t v10 = v9;
  objc_storeStrong((id *)&v9->_queue, a4);
  v10->_identifier = atomic_fetch_add_explicit(&initializeWithQueue__sNRParserID, 1uLL, memory_order_relaxed);
  -[NRBluetoothPacketParser changeStateTo:]((uint64_t)v10, 1);
  objc_storeStrong((id *)&v10->_deviceIdentifier, a3);
  uint64_t v11 = [(NRDeviceIdentifier *)v10->_deviceIdentifier nrDeviceIdentifier];
  nrUUID = v10->_nrUUID;
  v10->_nrUUID = (NSUUID *)v11;

  _NRAddEligibleNRUUIDForLogObject(v10->_nrUUID);
  os_log_t v13 = _NRCopyLogObjectForNRUUID(v10->_nrUUID);
  os_log_t v14 = v13;
  if (sNRCopyLogToStdErr)
  {

LABEL_5:
    os_log_t v16 = _NRCopyLogObjectForNRUUID(v10->_nrUUID);
    _NRLogWithArgs((uint64_t)v16, 0, (uint64_t)"%s%.30s:%-4d Created (%p)", v17, v18, v19, v20, v21, (uint64_t)"");

    goto LABEL_6;
  }
  BOOL v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v15) {
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

- (NRBluetoothPacketParser)initWithBluetoothUUID:(id)a3 queue:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)NRBluetoothPacketParser;
  os_log_t v9 = [(NRBluetoothPacketParser *)&v37 init];
  if (!v9)
  {
    id v26 = nrCopyLogObj_518();
    uint64_t v27 = v26;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v28 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

      if (!v28)
      {
LABEL_15:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v35 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v35 = 136446210;
        *(void *)(v35 + 4) = "-[NRBluetoothPacketParser initWithBluetoothUUID:queue:]";
        id v36 = nrCopyLogObj_518();
        _NRLogAbortWithPack(v36);
      }
    }
    id v29 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v29, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v30, v31, v32, v33, v34, (uint64_t)"");

    goto LABEL_15;
  }
  uint64_t v10 = (uint64_t)v9;
  objc_storeStrong((id *)&v9->_queue, a4);
  *(void *)(v10 + 48) = atomic_fetch_add_explicit(&initializeWithQueue__sNRParserID, 1uLL, memory_order_relaxed);
  -[NRBluetoothPacketParser changeStateTo:](v10, 1);
  id v11 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:v7];
  uint64_t v12 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v11;

  if (*(void *)(v10 + 32))
  {
    objc_storeStrong((id *)(v10 + 24), a3);
    uint64_t v13 = [*(id *)(v10 + 32) nrDeviceIdentifier];
    os_log_t v14 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v13;

    _NRAddEligibleNRUUIDForLogObject(*(void **)(v10 + 40));
    os_log_t v15 = _NRCopyLogObjectForNRUUID(*(void **)(v10 + 40));
    os_log_t v16 = v15;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v18 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (!v18)
      {
LABEL_8:
        uint64_t v17 = (NRBluetoothPacketParser *)(id)v10;
        goto LABEL_9;
      }
    }
    os_log_t v19 = _NRCopyLogObjectForNRUUID(*(void **)(v10 + 40));
    _NRLogWithArgs((uint64_t)v19, 0, (uint64_t)"%s%.30s:%-4d Created (%p)", v20, v21, v22, v23, v24, (uint64_t)"");

    goto LABEL_8;
  }
  uint64_t v17 = 0;
LABEL_9:

  return v17;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v4 = v3;
  if (self->_readContextForMedium) {
    objc_msgSend(v3, "appendFormat:", @"%sr", "M");
  }
  if (self->_writeContextForMedium) {
    objc_msgSend(v4, "appendFormat:", @"%sw", "M");
  }
  if (self->_readContextForHigh) {
    objc_msgSend(v4, "appendFormat:", @"%sr", "H");
  }
  if (self->_writeContextForHigh) {
    objc_msgSend(v4, "appendFormat:", @"%sw", "H");
  }
  if (self->_readContextForIsochronous) {
    objc_msgSend(v4, "appendFormat:", @"%sr", "D");
  }
  if (self->_writeContextForIsochronous) {
    objc_msgSend(v4, "appendFormat:", @"%sw", "D");
  }
  id v5 = objc_alloc(MEMORY[0x263F089D8]);
  unint64_t identifier = self->_identifier;
  uint64_t state = self->_state;
  if (state >= 5) {
    id v8 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%d)", state);
  }
  else {
    id v8 = off_263FD1190[state];
  }
  os_log_t v9 = (void *)[v5 initWithFormat:@"[%llu %@ %@]", identifier, v8, v4];

  return (NSString *)v9;
}

@end